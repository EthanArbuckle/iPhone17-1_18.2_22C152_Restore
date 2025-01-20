@interface NTKMoonPhaseComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)hasTapAction;
- (CLLocation)location;
- (NSString)token;
- (void)_activate;
- (void)_afterEventTimerFired:(id)a3;
- (void)_asyncUpdateDisplay;
- (void)_configureForLegacyDisplay:(id)a3;
- (void)_deactivate;
- (void)_invalidateEventTimer;
- (void)_scheduleAfterEventTimer:(id)a3;
- (void)_updateDisplay;
- (void)_updateDisplayForced:(BOOL)a3;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
- (void)setLocation:(id)a3;
- (void)setShowsLockedUI:(BOOL)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)setToken:(id)a3;
@end

@implementation NTKMoonPhaseComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 11;
}

- (void)_activate
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateDisplay name:*MEMORY[0x1E4FB2708] object:0];
  [v3 addObserver:self selector:sel__asyncUpdateDisplay name:*MEMORY[0x1E4F1C2E0] object:0];
  [v3 addObserver:self selector:sel__updateDisplay name:*MEMORY[0x1E4F1C370] object:0];
  v4 = +[NTKLocationManager sharedLocationManager];
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __47__NTKMoonPhaseComplicationController__activate__block_invoke;
  v12 = &unk_1E62C29C8;
  objc_copyWeak(&v13, &location);
  v5 = (void (**)(void *, void *, void *, void))_Block_copy(&v9);
  v6 = objc_msgSend(v4, "startLocationUpdatesWithIdentifier:handler:", @"ntk.moonPhaseComplication", v5, v9, v10, v11, v12);
  [(NTKMoonPhaseComplicationController *)self setToken:v6];

  v7 = [v4 currentLocation];
  v8 = [v4 anyLocation];
  v5[2](v5, v7, v8, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __47__NTKMoonPhaseComplicationController__activate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = WeakRetained[22] == 0;
    [WeakRetained setLocation:v7];
    [v5 _updateDisplayForced:v6];
  }
}

- (void)_deactivate
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];
  [v5 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
  [v5 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
  if (self->_token)
  {
    v3 = +[NTKLocationManager sharedLocationManager];
    [v3 stopLocationUpdatesForToken:self->_token];

    token = self->_token;
    self->_token = 0;
  }
  [(NTKMoonPhaseComplicationController *)self _invalidateEventTimer];
}

- (void)_configureForLegacyDisplay:(id)a3
{
  id v4 = a3;
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xFD | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xFB | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 8;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xF7 | v7;
  char v8 = objc_opt_respondsToSelector();

  if (v8) {
    char v9 = 16;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_displayFlags = *(unsigned char *)&self->_displayFlags & 0xEF | v9;

  [(NTKMoonPhaseComplicationController *)self _updateDisplayForced:1];
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKMoonPhaseComplicationController;
  [(NTKComplicationController *)&v7 setDisplayProperties:a3 forDisplayWrapper:a4];
  BOOL paused = [(NTKComplicationController *)self effectiveFaceDataMode] != 1;
  self->_BOOL paused = paused;
  if ((*(unsigned char *)&self->_displayFlags & 0x10) != 0)
  {
    char v6 = [(NTKComplicationController *)self legacyDisplay];
    [v6 setPaused:self->_paused];

    BOOL paused = self->_paused;
  }
  if (!paused && self->_missedUpdateWhilePaused)
  {
    self->_missedUpdateWhilePaused = 0;
    [(NTKMoonPhaseComplicationController *)self _updateDisplay];
  }
}

- (void)setShowsLockedUI:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NTKComplicationController *)self showsLockedUI];
  v6.receiver = self;
  v6.super_class = (Class)NTKMoonPhaseComplicationController;
  [(NTKComplicationController *)&v6 setShowsLockedUI:v3];
  if (v5 != [(NTKComplicationController *)self showsLockedUI]) {
    [(NTKMoonPhaseComplicationController *)self _updateDisplay];
  }
}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)_updateDisplay
{
}

- (void)_asyncUpdateDisplay
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NTKMoonPhaseComplicationController__asyncUpdateDisplay__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__NTKMoonPhaseComplicationController__asyncUpdateDisplay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplay];
}

- (void)_updateDisplayForced:(BOOL)a3
{
  if (!self->_paused || a3)
  {
    uint64_t v4 = [(NTKComplicationController *)self legacyDisplay];
    char displayFlags = (char)self->_displayFlags;
    id v8 = (id)v4;
    if (displayFlags)
    {
      objc_super v6 = NUNILocalizedString();
      [v8 setPhaseName:v6];

      char displayFlags = (char)self->_displayFlags;
    }
    if ((displayFlags & 2) != 0)
    {
      [v8 setPhaseNumber:88 hemisphere:0];
      char displayFlags = (char)self->_displayFlags;
    }
    objc_super v7 = v8;
    if ((displayFlags & 8) != 0)
    {
      objc_msgSend(v8, "setLocked:", -[NTKComplicationController showsLockedUI](self, "showsLockedUI"));
      objc_super v7 = v8;
    }
  }
  else
  {
    self->_missedUpdateWhilePaused = 1;
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (([v6 isEqualToDate:self->_timeTravelDate] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeTravelDate, a3);
    [(NTKMoonPhaseComplicationController *)self _updateDisplay];
  }
}

- (void)_invalidateEventTimer
{
  if ([(NSTimer *)self->_afterEventTimer isValid])
  {
    afterEventTimer = self->_afterEventTimer;
    [(NSTimer *)afterEventTimer invalidate];
  }
}

- (void)_scheduleAfterEventTimer:(id)a3
{
  id v12 = [a3 dateByAddingTimeInterval:60.0];
  if (a3
    && (*(unsigned char *)&self->_displayFlags & 4) != 0
    && (+[CLKDate complicationDate],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v12 compare:v5],
        v5,
        v6 == 1))
  {
    objc_super v7 = [(NSTimer *)self->_afterEventTimer fireDate];
    char v8 = [v12 isEqualToDate:v7];

    if ((v8 & 1) == 0)
    {
      [(NTKMoonPhaseComplicationController *)self _invalidateEventTimer];
      char v9 = (NSTimer *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v12 interval:self target:sel__afterEventTimerFired_ selector:0 userInfo:0 repeats:0.0];
      afterEventTimer = self->_afterEventTimer;
      self->_afterEventTimer = v9;

      v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v11 addTimer:self->_afterEventTimer forMode:*MEMORY[0x1E4F1C4B0]];
    }
  }
  else
  {
    [(NTKMoonPhaseComplicationController *)self _invalidateEventTimer];
  }
}

- (void)_afterEventTimerFired:(id)a3
{
  if ((*(unsigned char *)&self->_displayFlags & 4) != 0) {
    [(NTKMoonPhaseComplicationController *)self _updateDisplay];
  }
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_afterEventTimer, 0);

  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end