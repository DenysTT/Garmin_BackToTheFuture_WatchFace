using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as ActMon;
using Toybox.Lang as Lang;
using Toybox.System as Sys;

class ActivityView extends Ui.Drawable
{   
    
    var activityInfo = ActMon.getInfo(); 
    var steps;
    var stepsGoal;
    var calories;
    var distance; 
    var distUnits = Sys.getDeviceSettings().distanceUnits; 
   
	function initialize(params)
	{
		Drawable.initialize(params);
        steps = convertData(activityInfo.steps);
        stepsGoal = convertData(activityInfo.stepGoal);
        calories = convertData(activityInfo.calories);
        distance = convertDistance(activityInfo.distance);  
        
	}

	function draw(dc)
	{
        // Get and show the current time
        var font = Ui.loadResource(Rez.Fonts.id_font_clock);        
        var textDim = dc.getTextDimensions(steps, font);
        var x = (dc.getWidth() / 2);
        var stepsX = (dc.getWidth() / 6);
        var stepsGoalX = (dc.getWidth() / 3) + 5;
        var caloriesX = (dc.getWidth() / 2) + 10;
        var distanceX = (dc.getWidth() / 2) + 65;
        var real_middle = dc.getHeight() /2;  
        var top_pozition = (real_middle / 1.5) - textDim[1] ;      
        var activityData = [steps, stepsGoal, calories, distance];
        var xValues = [stepsX, stepsGoalX, caloriesX, distanceX];
        var stringData = ["ACTIVITY", "STEPS", "GOAL", "CALORIES", "DISTANCE"];
        var drawView = new MainView();
        var m = drawView.method(:mainDraw);
        m.invoke(dc, x, xValues, top_pozition, activityData, stringData, textDim[1], Gfx.COLOR_ORANGE);
	}
	
	function convertData(datas)
	{
	    var data = datas.toString();
	    var length = data.length();
	        if ( length == 4 )
	        {
	            return  data.substring(0, 1) + 'K';
	        }
	        else if ( length == 5 )
            {
                return  data.substring(0, 2) + 'K';
            }
            else if ( length == 6 )
            {
               return data.substring(0, 3) + 'K';
            } else if ( length <= 3){
                return data;
            }
             else
            {
                return "Woow";
            }
	}
	
    function convertDistance(distance)
    {
     var distanceStr = "";
     Sys.println(distUnits);
     if (distUnits == Sys.UNIT_METRIC)
                {
                    if (distance >= 100000) {
                       distanceStr = (distance * 0.01 * 0.001).format("%.1f") + "km";
                    }
                    else
                    {
                        distanceStr = (distance * 0.01).toLong() + "m";
                    }
                }
                else
                {
                    var feetDistance = distance * 0.0328084;
                    if (feetDistance >= 5280)
                    {
                        distanceStr = (feetDistance / 5280.0).format("%.2f") + "mi";
                    }
                    else
                    {
                        distanceStr = (feetDistance).toLong() + "ft";
                    }
                }
      return distanceStr;
    }

	
}