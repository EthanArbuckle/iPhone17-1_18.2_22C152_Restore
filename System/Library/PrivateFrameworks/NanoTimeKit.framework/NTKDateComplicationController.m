@interface NTKDateComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (id)_textForDate:(id)a3 dateStyle:(unint64_t)a4;
+ (id)textForDateStyle:(unint64_t)a3;
- (BOOL)hasTapAction;
- (id)complicationApplicationIdentifier;
- (void)_activate;
- (void)_configureForLegacyDisplay:(id)a3;
- (void)_deactivate;
- (void)_handleTimeChangeNotification;
- (void)_setTextInDisplayIfNeededWithDate:(id)a3;
- (void)_updateDisplay;
- (void)performTapActionForDisplayWrapper:(id)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation NTKDateComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 1 || a3 == 16;
}

- (void)_activate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleTimeChangeNotification name:*MEMORY[0x1E4F1C370] object:0];
  [v3 addObserver:self selector:sel__handleTimeChangeNotification name:*MEMORY[0x1E4FB2708] object:0];
  [v3 addObserver:self selector:sel__handleTimeChangeNotification name:*MEMORY[0x1E4F1C2E0] object:0];
  v4 = _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218242;
    v6 = self;
    __int16 v7 = 2080;
    v8 = "-[NTKDateComplicationController _activate]";
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "%p: %s", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_deactivate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
  v4 = _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218242;
    v6 = self;
    __int16 v7 = 2080;
    v8 = "-[NTKDateComplicationController _deactivate]";
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "%p: %s", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_configureForLegacyDisplay:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    self->_displayDateStyle = [v5 desiredDateComplicationDateStyle];
  }
  else
  {
    v4 = [(NTKComplicationController *)self complication];
    self->_displayDateStyle = [v4 dateStyle];
  }
  [(NTKDateComplicationController *)self _updateDisplay];
}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)performTapActionForDisplayWrapper:(id)a3
{
}

- (id)complicationApplicationIdentifier
{
  return @"com.apple.NanoCalendar";
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (([v6 isEqualToDate:self->_timeTravelDate] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeTravelDate, a3);
    [(NTKDateComplicationController *)self _updateDisplay];
  }
}

- (void)_handleTimeChangeNotification
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v6 = self;
    __int16 v7 = 2080;
    v8 = "-[NTKDateComplicationController _handleTimeChangeNotification]";
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%p: %s", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NTKDateComplicationController__handleTimeChangeNotification__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__NTKDateComplicationController__handleTimeChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;

  v4 = *(void **)(a1 + 32);

  return [v4 _updateDisplay];
}

- (void)_updateDisplay
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    v11 = "-[NTKDateComplicationController _updateDisplay]";
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%p: %s", (uint8_t *)&v8, 0x16u);
  }

  v4 = [(NTKComplicationController *)self legacyDisplay];

  if (v4)
  {
    id v5 = CLKForcedTime();
    if (!v5)
    {
      timeTravelDate = self->_timeTravelDate;
      if (timeTravelDate)
      {
        __int16 v7 = timeTravelDate;
      }
      else
      {
        __int16 v7 = +[CLKDate complicationDate];
      }
      id v5 = v7;
    }
    [(NTKDateComplicationController *)self _setTextInDisplayIfNeededWithDate:v5];
  }
}

+ (id)textForDateStyle:(unint64_t)a3
{
  id v5 = +[CLKDate complicationDate];
  id v6 = [a1 _textForDate:v5 dateStyle:a3];

  return v6;
}

+ (id)_textForDate:(id)a3 dateStyle:(unint64_t)a4
{
  if (a4)
  {
    id v5 = +[NTKComplicationDateFormatter stringForDate:withStyle:](NTKComplicationDateFormatter, "stringForDate:withStyle:", a3);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_setTextInDisplayIfNeededWithDate:(id)a3
{
  if (self->_displayDateStyle)
  {
    id v4 = a3;
    uint64_t v5 = [(NTKComplicationController *)self legacyDisplay];
    unint64_t displayDateStyle = self->_displayDateStyle;
    id v14 = (id)v5;
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [v14 overrideDateStyle];
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7) {
      BOOL v8 = displayDateStyle == 8;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8) {
      unint64_t displayDateStyle = v7;
    }
    uint64_t v9 = [(id)objc_opt_class() _textForDate:v4 dateStyle:displayDateStyle];
    __int16 v10 = +[NTKComplicationDateFormatter _localizedDayDateFormatter];
    v11 = [v10 stringFromDate:v4];

    uint64_t v12 = [v9 rangeOfString:v11];
    objc_msgSend(v14, "setDateComplicationText:withDayRange:forDateStyle:", v9, v12, v13, self->_displayDateStyle);
  }
}

- (void).cxx_destruct
{
}

@end