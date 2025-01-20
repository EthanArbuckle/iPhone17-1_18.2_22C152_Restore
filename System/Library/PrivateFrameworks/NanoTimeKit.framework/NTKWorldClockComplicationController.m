@interface NTKWorldClockComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)hasTapAction;
- (id)complicationApplicationIdentifier;
- (void)_activate;
- (void)_configureForLegacyDisplay:(id)a3;
- (void)_deactivate;
- (void)_endTimeTravelAnimated:(BOOL)a3;
- (void)_handleAbbreviationStoreChange:(id)a3;
- (void)_handleLocaleChange;
- (void)_handleTimeZoneChange;
- (void)_startTimeTravelAnimated:(BOOL)a3;
- (void)_updateDisplay;
- (void)performTapActionForDisplayWrapper:(id)a3;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
- (void)setPauseDate:(id)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation NTKWorldClockComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 5;
}

- (void)_activate
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleAbbreviationStoreChange_ name:@"NTKCustomWorldCityAbbreviationsChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleLocaleChange name:*MEMORY[0x1E4F1C370] object:0];
  [v3 addObserver:self selector:sel__handleTimeZoneChange name:*MEMORY[0x1E4F1C4F8] object:0];
}

- (void)_deactivate
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"NTKCustomWorldCityAbbreviationsChangedNotification" object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C4F8] object:0];
}

- (void)_configureForLegacyDisplay:(id)a3
{
  id v4 = a3;
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  char v5 = objc_opt_respondsToSelector();

  if (v5) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xFD | v6;
  [(NTKWorldClockComplicationController *)self _updateDisplay];
}

- (void)setPauseDate:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplicationController;
  [(NTKComplicationController *)&v6 setPauseDate:v4];
  if ([(NTKComplicationController *)self effectiveFaceDataMode] == 2)
  {
    char v5 = [(NTKComplicationController *)self legacyDisplay];
    [v5 setOverrideDate:v4];
  }
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKWorldClockComplicationController;
  [(NTKComplicationController *)&v9 setDisplayProperties:a3 forDisplayWrapper:a4];
  int64_t v5 = [(NTKComplicationController *)self effectiveFaceDataMode];
  if (v5 == 2)
  {
    objc_super v6 = [(NTKComplicationController *)self legacyDisplay];
    uint64_t v7 = [(NTKComplicationController *)self pauseDate];
  }
  else
  {
    if (v5 == 3)
    {
      objc_super v6 = [(NTKComplicationController *)self legacyDisplay];
      NTKIdealizedDate();
    }
    else
    {
      objc_super v6 = [(NTKComplicationController *)self legacyDisplay];
      NTKNilOrDateOverrideInDemoMode();
    uint64_t v7 = };
  }
  v8 = (void *)v7;
  [v6 setOverrideDate:v7];
}

- (BOOL)hasTapAction
{
  return 1;
}

- (void)performTapActionForDisplayWrapper:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  objc_super v6 = [(NTKComplicationController *)self complication];
  uint64_t v7 = [v6 city];
  v8 = [v7 alCityId];
  id v10 = [v4 stringWithFormat:@"nwc://id/%@", v8];

  objc_super v9 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  [(NTKComplicationController *)self _openAppWithURL:v9 forDisplayWrapper:v5];
}

- (id)complicationApplicationIdentifier
{
  return @"com.apple.NanoWorldClock";
}

- (void)_updateDisplay
{
  id v3 = [(NTKComplicationController *)self complication];
  id v13 = [v3 city];

  char displayFlags = (char)self->_displayFlags;
  if (displayFlags)
  {
    id v5 = [(NTKComplicationController *)self legacyDisplay];
    objc_super v6 = NTKWorldClockCityAbbreviation(v13);
    [v5 setShortCity:v6];

    char displayFlags = (char)self->_displayFlags;
  }
  if ((displayFlags & 2) != 0)
  {
    uint64_t v7 = [(NTKComplicationController *)self legacyDisplay];
    v8 = [v13 name];
    [v7 setLongCity:v8];
  }
  objc_super v9 = [(NTKComplicationController *)self legacyDisplay];
  if (v13)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAF0];
    v11 = [v13 timeZone];
    v12 = [v10 timeZoneWithName:v11];
    [v9 setTimeZone:v12];
  }
  else
  {
    [v9 setTimeZone:0];
  }
}

- (void)_handleAbbreviationStoreChange:(id)a3
{
  if (*(unsigned char *)&self->_displayFlags) {
    [(NTKWorldClockComplicationController *)self _updateDisplay];
  }
}

- (void)_handleLocaleChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NTKWorldClockComplicationController__handleLocaleChange__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__NTKWorldClockComplicationController__handleLocaleChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplay];
}

- (void)_handleTimeZoneChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NTKWorldClockComplicationController__handleTimeZoneChange__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__NTKWorldClockComplicationController__handleTimeZoneChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplay];
}

- (void)_startTimeTravelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NTKComplicationController *)self legacyDisplay];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTKComplicationController *)self legacyDisplay];
    [v7 startTimeTravelAnimated:v3];
  }
}

- (void)_endTimeTravelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NTKComplicationController *)self legacyDisplay];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTKComplicationController *)self legacyDisplay];
    [v7 endTimeTravelAnimated:v3];
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (NSDate *)a3;
  id v7 = v6;
  timeTravelDate = self->_timeTravelDate;
  if (!v6 || timeTravelDate)
  {
    if (!v6 && timeTravelDate) {
      [(NTKWorldClockComplicationController *)self _endTimeTravelAnimated:v4];
    }
  }
  else
  {
    [(NTKWorldClockComplicationController *)self _startTimeTravelAnimated:v4];
  }
  objc_super v9 = self->_timeTravelDate;
  self->_timeTravelDate = v7;
  id v10 = v7;

  id v11 = [(NTKComplicationController *)self legacyDisplay];
  [v11 setOverrideDate:self->_timeTravelDate];
}

- (void).cxx_destruct
{
}

@end