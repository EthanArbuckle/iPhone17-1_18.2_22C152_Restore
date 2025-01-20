@interface NTKOlympusController
- (BOOL)_hasWindrunnerWedge;
- (CLKClockTimerToken)clockTimerToken;
- (NSDate)date;
- (NTKFaceView)faceView;
- (NTKOlympusController)initWithFaceView:(id)a3 olympusView:(id)a4;
- (NTKOlympusTimeView)olympusView;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)second;
- (void)_animateClockHandsFromDate:(id)a3 toDate:(id)a4 duration:(double)a5;
- (void)_applyWindrunnerMask;
- (void)_handleSignificantTimeChanged;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateHourComponentsWithDate:(id)a3;
- (void)_updateTimeComponentsWithDate:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6;
- (void)applyDataMode:(int64_t)a3;
- (void)dealloc;
- (void)setClockTimerToken:(id)a3;
- (void)setDate:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setHour:(unint64_t)a3;
- (void)setMinute:(unint64_t)a3;
- (void)setOlympusView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSecond:(unint64_t)a3;
@end

@implementation NTKOlympusController

- (NTKOlympusController)initWithFaceView:(id)a3 olympusView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKOlympusController;
  v8 = [(NTKOlympusController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_faceView, v6);
    objc_storeWeak((id *)&v9->_olympusView, v7);
    [(NTKOlympusController *)v9 _startClockUpdates];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__handleSignificantTimeChanged name:*MEMORY[0x1E4FB2708] object:0];
  }
  return v9;
}

- (void)dealloc
{
  [(NTKOlympusController *)self _stopClockUpdates];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKOlympusController;
  [(NTKOlympusController *)&v4 dealloc];
}

- (void)applyDataMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1) {
      [(NTKOlympusController *)self _startClockUpdates];
    }
  }
  else
  {
    [(NTKOlympusController *)self _stopClockUpdates];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
  [WeakRetained setOverrideDate:v13 duration:a4];

  id v7 = [(NTKOlympusController *)self date];
  char v8 = [v13 isEqualToDate:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = (uint64_t)v13;
    if (!v13)
    {
      uint64_t v9 = [MEMORY[0x1E4F196B0] now];
    }
    id v13 = (id)v9;
    v10 = [(NTKOlympusController *)self date];
    [(NTKOlympusController *)self _animateClockHandsFromDate:v10 toDate:v13 duration:a4];
  }
  [(NTKOlympusController *)self _updateHourComponentsWithDate:v13];
  id v11 = objc_loadWeakRetained((id *)&self->_olympusView);
  int v12 = [v11 canUpdateWindrunnerMask];

  if (v12) {
    [(NTKOlympusController *)self _applyWindrunnerMask];
  }
}

- (void)_startClockUpdates
{
  if (!self->_clockTimerToken)
  {
    if ([(NTKOlympusController *)self _hasWindrunnerWedge])
    {
      objc_initWeak(&location, self);
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __42__NTKOlympusController__startClockUpdates__block_invoke;
      v10 = &unk_1E62C1288;
      objc_copyWeak(&v11, &location);
      v3 = _Block_copy(&v7);
      objc_super v4 = objc_msgSend(MEMORY[0x1E4F196B0], "sharedInstance", v7, v8, v9, v10);
      v5 = [v4 startUpdatesWithUpdateFrequency:1 withHandler:v3 identificationLog:&__block_literal_global_14];
      clockTimerToken = self->_clockTimerToken;
      self->_clockTimerToken = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __42__NTKOlympusController__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v22 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = *a3;
    uint64_t v8 = [WeakRetained olympusView];
    [v8 setDate:v7];

    uint64_t v9 = [v6 minute];
    [v6 _updateTimeComponentsWithDate:*a3 hour:NTK12HourTimeFrom24HourTime((uint64_t)a3[1]) minute:a3[2] second:a3[3]];
    +[NTKOlympusMask angleForHour:minutes:](NTKOlympusMask, "angleForHour:minutes:", [v6 hour], objc_msgSend(v6, "minute"));
    double v11 = v10;
    +[NTKOlympusMask angleForMinute:seconds:](NTKOlympusMask, "angleForMinute:seconds:", [v6 minute], objc_msgSend(v6, "second"));
    double v13 = v12;
    v14 = [v6 olympusView];
    [v14 hourHandAngle];
    if (v11 - v15 > 1.0)
    {
      BOOL v18 = 1;
    }
    else
    {
      v16 = [v6 olympusView];
      [v16 minuteHandAngle];
      BOOL v18 = v13 - v17 > 1.0;
    }
    uint64_t v19 = [v6 minute];
    v20 = [v6 olympusView];
    if ([v20 canUpdateWindrunnerMask])
    {
      int v21 = v9 != v19 || v18;

      if (v21 == 1) {
        [v6 _applyWindrunnerMask];
      }
    }
    else
    {
    }
  }
}

__CFString *__42__NTKOlympusController__startClockUpdates__block_invoke_7()
{
  return @"NTKOlympusController second updates";
}

- (void)_stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_updateHourComponentsWithDate:(id)a3
{
  id v9 = a3;
  uint64_t v4 = NTKDateHourIn12HourTime(v9);
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 component:64 fromDate:v9];

  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v7 component:128 fromDate:v9];

  [(NTKOlympusController *)self _updateTimeComponentsWithDate:v9 hour:v4 minute:v6 second:v8];
}

- (void)_updateTimeComponentsWithDate:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6
{
  [(NTKOlympusController *)self setDate:a3];
  [(NTKOlympusController *)self setHour:a4];
  [(NTKOlympusController *)self setMinute:a5];

  [(NTKOlympusController *)self setSecond:a6];
}

- (void)_animateClockHandsFromDate:(id)a3 toDate:(id)a4 duration:(double)a5
{
  id v10 = a3;
  id v8 = a4;
  if ([(NTKOlympusController *)self _hasWindrunnerWedge])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
    [WeakRetained animateClockHandsFromDate:v10 toDate:v8 duration:a5];
  }
}

- (BOOL)_hasWindrunnerWedge
{
  p_olympusView = &self->_olympusView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_olympusView);
    BOOL v5 = [v4 currentStyle] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_handleSignificantTimeChanged
{
  if ([(NTKOlympusController *)self _hasWindrunnerWedge])
  {
    [(NTKOlympusController *)self _applyWindrunnerMask];
  }
}

- (void)_applyWindrunnerMask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);
  v3 = [(NTKOlympusController *)self faceView];
  id v4 = [v3 currentDisplayDate];
  [WeakRetained applyWindrunnerMaskWithDate:v4];
}

- (NTKOlympusTimeView)olympusView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_olympusView);

  return (NTKOlympusTimeView *)WeakRetained;
}

- (void)setOlympusView:(id)a3
{
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)hour
{
  return self->_hour;
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
}

- (unint64_t)second
{
  return self->_second;
}

- (void)setSecond:(unint64_t)a3
{
  self->_second = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);

  objc_destroyWeak((id *)&self->_olympusView);
}

@end