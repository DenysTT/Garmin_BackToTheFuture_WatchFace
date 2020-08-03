using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
using Toybox.Lang as Lang;

class PresentTimeView extends Ui.Drawable
{
	function initialize(params)
	{
		Drawable.initialize(params);

		
	}

	function draw(dc)
	{
        // Get and show the current time
        var font = Ui.loadResource(Rez.Fonts.id_font_clock);
        var stringFont = Ui.loadResource(Rez.Fonts.id_default);
        var clockTime = Sys.getClockTime();
        var now = Time.now();
        var date = Calendar.info(now, Time.FORMAT_LONG);
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var yearMonth = Lang.format("$1$ $2$ $3$ $4$:$5$", [date.month, date.day, date.year, date.hour, date.min.format("%02d")]);
//        var view = View.findDrawableById("TimeLabel");
        var textDim = dc.getTextDimensions(yearMonth, font);
        Sys.println(textDim[1]);
        var x = (dc.getWidth() / 2);
        var real_middle = dc.getHeight() /2;
        var middle_position = (real_middle) - textDim[1] / 2;
        Sys.println(dc.getHeight());
        var top_pozition = (real_middle / 1.5) - textDim[1] ;
        var bottom_pozition = (real_middle + real_middle / 3);
        Sys.println(top_pozition);
        Sys.println(middle_position);
        Sys.println(bottom_pozition);

/*        if ( colour == 0 ) {
          dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
        }else if (colour == 1) {
          dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        }*/
        customDrawText(x, dc, Gfx.COLOR_ORANGE, yearMonth, top_pozition, font);
        customDrawText(x, dc, Gfx.COLOR_WHITE, "STEPS", top_pozition + 21, stringFont);
        customDrawText(x, dc, Gfx.COLOR_GREEN, yearMonth, middle_position, font);
        customDrawText(x, dc, Gfx.COLOR_WHITE, "PRESENT  TIME", middle_position + 21, stringFont);
        customDrawText(x, dc, Gfx.COLOR_YELLOW, yearMonth, bottom_pozition, font);
        customDrawText(x, dc, Gfx.COLOR_WHITE, "STEPS", bottom_pozition + 21, stringFont);

	}
	
	function customDrawText(x, dc, colour, data, pozition, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,pozition, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }
}