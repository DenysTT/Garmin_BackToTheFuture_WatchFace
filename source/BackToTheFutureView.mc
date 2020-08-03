using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
using Toybox.Lang as Lang;




class BackToTheFutureView extends Ui.WatchFace {
	



    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
    	var layoutMode = App.getApp().getProperty("LayoutType");
    	if (layoutMode == 0)
    	{
            setLayout(Rez.Layouts.NormalModeLayout(dc));     
        } else if ( layoutMode == 1)
        {
            setLayout(Rez.Layouts.BlackModeLayout(dc));     
        }
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {    
      onLayout(dc)	; 
      View.onUpdate(dc);
        // Call the parent onUpdate function to redraw the layout
    }

    

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
        Ui.requestUpdate();
    }

}
