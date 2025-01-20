@interface _UISunScheduleController
- (BOOL)isInScheduleTime;
- (NSString)debugDescription;
- (_UISunScheduleController)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)nextTransition:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_invalidateNextEventTimer;
- (void)_notifyChange;
- (void)_setNextEventTimerToAbsoluteTime:(double)a3;
- (void)_significantTimeChange;
- (void)_timeZoneChange;
- (void)_updateGeoCity;
- (void)_updateInScheduleTime:(BOOL)a3;
- (void)_updateStatus;
- (void)_updateStatusWithAbsoluteTime:(double)a3;
- (void)_updateSunriseSunsetTimesRelativeTo:(double)a3;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)dealloc;
- (void)forceUpdate;
- (void)removeObserver:(id)a3;
@end

@implementation _UISunScheduleController

- (_UISunScheduleController)init
{
  v11.receiver = self;
  v11.super_class = (Class)_UISunScheduleController;
  v2 = [(_UISunScheduleController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_inScheduleTime = 0;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1300;
    uint64_t v16 = _MergedGlobals_1300;
    if (!_MergedGlobals_1300)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getGEOAlmanacClass_block_invoke;
      v12[3] = &unk_1E52D9900;
      v12[4] = &v13;
      __getGEOAlmanacClass_block_invoke((uint64_t)v12);
      v4 = (void *)v14[3];
    }
    v5 = v4;
    _Block_object_dispose(&v13, 8);
    v6 = (GEOAlmanac *)objc_alloc_init(v5);
    almanac = v3->_almanac;
    v3->_almanac = v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v3 selector:sel__significantTimeChange name:0x1ED15CFC0 object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v3 selector:sel__timeZoneChange name:*MEMORY[0x1E4F1C4F8] object:0];

    [(_UISunScheduleController *)v3 _updateGeoCity];
    [(_UISunScheduleController *)v3 _updateStatus];
  }
  return v3;
}

- (void)dealloc
{
  [(_UISunScheduleController *)self _invalidateNextEventTimer];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1ED15CFC0 object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UISunScheduleController;
  [(_UISunScheduleController *)&v4 dealloc];
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  observers = self->_observers;
  if (!observers)
  {
    v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = (void *)[v11 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSMapTable *)self->_observers removeObjectForKey:v4];
}

- (BOOL)isInScheduleTime
{
  return self->_inScheduleTime;
}

- (void)forceUpdate
{
  v3 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "SunScheduleController forcing update", v4, 2u);
  }

  [(_UISunScheduleController *)self _updateStatus];
}

- (id)nextTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(UIUserInterfaceStyleArbiterTransition);
  v5 = v4;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [(UIUserInterfaceStyleArbiterTransition *)v4 setType:v6];
  return v5;
}

- (void)_notifyChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(NSMapTable *)self->_observers keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_observers objectForKey:v8];
        ((void (**)(void, _UISunScheduleController *, uint64_t))v9)[2](v9, self, v8);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateInScheduleTime:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inScheduleTime = self->_inScheduleTime;
    v7[0] = 67109376;
    v7[1] = v3;
    __int16 v8 = 1024;
    BOOL v9 = inScheduleTime;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "SunScheduleController is in dark: %d from: %d", (uint8_t *)v7, 0xEu);
  }

  if (self->_inScheduleTime != v3)
  {
    self->_BOOL inScheduleTime = v3;
    [(_UISunScheduleController *)self _notifyChange];
  }
}

- (void)_updateStatus
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(_UISunScheduleController *)self _updateStatusWithAbsoluteTime:Current];
}

- (void)_updateStatusWithAbsoluteTime:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = formatAbsoluteTime(a3);
    int v18 = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "SunScheduleController updating status for time: %@", (uint8_t *)&v18, 0xCu);
  }
  [(_UISunScheduleController *)self _updateSunriseSunsetTimesRelativeTo:a3];
  v7 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = formatAbsoluteTime(a3);
    BOOL v9 = formatAbsoluteTime(self->_sunriseAbsolute);
    uint64_t v10 = formatAbsoluteTime(self->_sunsetAbsolute);
    int v18 = 138412802;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "SunScheduleController comparing time %@ to sunrise %@, sunset %@", (uint8_t *)&v18, 0x20u);
  }
  double sunsetAbsolute = self->_sunsetAbsolute;
  double sunriseAbsolute = self->_sunriseAbsolute;
  if (sunriseAbsolute > a3)
  {
    if (sunsetAbsolute <= a3)
    {
      [(_UISunScheduleController *)self _updateInScheduleTime:1];
      uint64_t v16 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Only sunrise is in the future, so it's dark", (uint8_t *)&v18, 2u);
      }

      double v14 = self->_sunriseAbsolute;
    }
    else
    {
      [(_UISunScheduleController *)self _updateInScheduleTime:sunriseAbsolute < sunsetAbsolute];
      long long v13 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = sunriseAbsolute < sunsetAbsolute;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Both in the future, in schedule = %d", (uint8_t *)&v18, 8u);
      }

      double v14 = self->_sunriseAbsolute;
      if (v14 >= self->_sunsetAbsolute) {
        double v14 = self->_sunsetAbsolute;
      }
    }
LABEL_19:
    [(_UISunScheduleController *)self _setNextEventTimerToAbsoluteTime:v14];
    return;
  }
  if (sunsetAbsolute > a3)
  {
    [(_UISunScheduleController *)self _updateInScheduleTime:0];
    uint64_t v15 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Only sunset is in the future, so it's light", (uint8_t *)&v18, 2u);
    }

    double v14 = self->_sunsetAbsolute;
    goto LABEL_19;
  }
  v17 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "SunScheduleController: ERROR: Both in the past. Doing nothing.", (uint8_t *)&v18, 2u);
  }
}

- (void)_invalidateNextEventTimer
{
  nextEventTimer = self->_nextEventTimer;
  if (nextEventTimer)
  {
    [(NSTimer *)nextEventTimer invalidate];
    uint64_t v4 = self->_nextEventTimer;
    self->_nextEventTimer = 0;
  }
}

- (void)_setNextEventTimerToAbsoluteTime:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(_UISunScheduleController *)self _invalidateNextEventTimer];
  uint64_t v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = formatAbsoluteTime(a3);
    *(_DWORD *)buf = 138412290;
    int v18 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Setting timer for next event: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v8 = objc_alloc(MEMORY[0x1E4F1CB00]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __61___UISunScheduleController__setNextEventTimerToAbsoluteTime___block_invoke;
  uint64_t v15 = &unk_1E530D418;
  v16[1] = *(id *)&a3;
  objc_copyWeak(v16, (id *)buf);
  BOOL v9 = (NSTimer *)[v8 initWithFireDate:v7 interval:0 repeats:&v12 block:0.0];
  nextEventTimer = self->_nextEventTimer;
  self->_nextEventTimer = v9;

  long long v11 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v12, v13, v14, v15);
  [v11 addTimer:self->_nextEventTimer forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);
}

- (void)_significantTimeChange
{
  BOOL v3 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Significant time change", v4, 2u);
  }

  [(_UISunScheduleController *)self _updateStatus];
}

- (void)_timeZoneChange
{
  BOOL v3 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Time zone change", v4, 2u);
  }

  [(_UISunScheduleController *)self _updateGeoCity];
  [(_UISunScheduleController *)self _updateStatus];
}

- (void)_updateGeoCity
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  if (!v3)
  {
    uint64_t v6 = _UIUserInterfaceStyleArbiterLogger();
    double v13 = 0.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Failed to get system time zone", (uint8_t *)&v26, 2u);
    }
    BOOL v14 = 0;
    goto LABEL_26;
  }
  uint64_t v4 = [MEMORY[0x1E4F4BE38] sharedManager];
  uint64_t v5 = [v4 defaultCityForTimeZone:v3];

  uint64_t v6 = _UIUserInterfaceStyleArbiterLogger();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      uint64_t v15 = [v3 name];
      int v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "SunScheduleController: System time zone %{public}@ has no default city", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAF0];
    v17 = [v3 name];
    uint64_t v6 = objc_msgSend(v16, "_ui_canonicalTimeZoneNameForTimeZoneName:", v17);

    if (v6
      && ([v3 name],
          int v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = [v6 isEqual:v18],
          v18,
          (v19 & 1) == 0))
    {
      id v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v6];
      if (v8)
      {
        v21 = [MEMORY[0x1E4F4BE38] sharedManager];
        uint64_t v5 = [v21 defaultCityForTimeZone:v8];

        BOOL v9 = _UIUserInterfaceStyleArbiterLogger();
        BOOL v22 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v5)
        {
          if (v22)
          {
            v23 = [v8 name];
            uint64_t v24 = [v5 name];
            int v26 = 138543618;
            v27 = v23;
            __int16 v28 = 2114;
            v29 = v24;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Canonicalized time zone %{public}@ has a default city %{public}@", (uint8_t *)&v26, 0x16u);
          }
          goto LABEL_5;
        }
        if (v22)
        {
          v25 = [v8 name];
          int v26 = 138543362;
          v27 = v25;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Canonicalized time zone %{public}@ has no default city", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        BOOL v9 = _UIUserInterfaceStyleArbiterLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543362;
          v27 = v6;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Canonicalized time zone has name %{public}@ but no NSTimeZone", (uint8_t *)&v26, 0xCu);
        }
      }
    }
    else
    {
      id v8 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [v3 name];
        int v26 = 138543362;
        v27 = v20;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "SunScheduleController: No distinct canonicalized time zone name for %{public}@", (uint8_t *)&v26, 0xCu);
      }
    }

    BOOL v14 = 0;
    double v13 = 0.0;
LABEL_26:
    double v11 = 0.0;
    goto LABEL_27;
  }
  if (v7)
  {
    id v8 = [v3 name];
    BOOL v9 = [v5 name];
    int v26 = 138543618;
    v27 = v8;
    __int16 v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "SunScheduleController: System time zone %{public}@ has a default city %{public}@", (uint8_t *)&v26, 0x16u);
LABEL_5:
  }
  [v5 latitude];
  double v11 = v10;
  [v5 longitude];
  double v13 = v12;
  BOOL v14 = 1;
  uint64_t v6 = v5;
LABEL_27:

  self->_hasTimeZoneLocation = v14;
  self->_timeZoneLocation.latitude = v11;
  self->_timeZoneLocation.longitude = v13;
}

- (void)_updateSunriseSunsetTimesRelativeTo:(double)a3
{
  almanac = self->_almanac;
  if (almanac && self->_hasTimeZoneLocation)
  {
    -[GEOAlmanac calculateAstronomicalTimeForLocation:](almanac, "calculateAstronomicalTimeForLocation:", self->_timeZoneLocation.latitude, self->_timeZoneLocation.longitude);
    uint64_t v6 = [(GEOAlmanac *)self->_almanac sunrise];
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;

    if (v8 < a3)
    {
      BOOL v9 = [(GEOAlmanac *)self->_almanac nextSunrise];
      [v9 timeIntervalSinceReferenceDate];
      double v8 = v10;
    }
    double v11 = [(GEOAlmanac *)self->_almanac sunset];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v13 < a3)
    {
      BOOL v14 = [(GEOAlmanac *)self->_almanac nextSunset];
      [v14 timeIntervalSinceReferenceDate];
      double v13 = v15;
    }
    self->_double sunsetAbsolute = v13;
    self->_double sunriseAbsolute = v8;
  }
  else
  {
    uint64_t v16 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "SunScheduleController: No time zone location heuristic available, using hard-coded defaults", buf, 2u);
    }

    v17 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
    if (v17)
    {
      int v18 = v17;
      CFCalendarSetTimeZone(v17, (CFTimeZoneRef)[MEMORY[0x1E4F1CAF0] systemTimeZone]);
      *(_DWORD *)buf = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      if (CFCalendarDecomposeAbsoluteTime(v18, a3, "yMdHm", buf, (char *)&v27 + 4, &v27, (char *)&v26 + 4, &v26))
      {
        uint64_t v26 = 0x1300000000;
        p_double sunsetAbsolute = &self->_sunsetAbsolute;
        if (CFCalendarComposeAbsoluteTime(v18, &self->_sunsetAbsolute, "yMdHm", *(unsigned int *)buf, HIDWORD(v27), v27, 19, 0))
        {
          double v20 = *p_sunsetAbsolute;
          if (*p_sunsetAbsolute < a3) {
            CFCalendarAddComponents(v18, &self->_sunsetAbsolute, 0, "d", v20, 1);
          }
        }
        else
        {
          BOOL v22 = _UIUserInterfaceStyleArbiterLogger();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Unable to compute fallback sunset time", v25, 2u);
          }
        }
        uint64_t v26 = 0x700000000;
        p_double sunriseAbsolute = &self->_sunriseAbsolute;
        if (CFCalendarComposeAbsoluteTime(v18, p_sunriseAbsolute, "yMdHm", v20, *(unsigned int *)buf, HIDWORD(v27), v27, 7, 0))
        {
          if (*p_sunriseAbsolute < a3) {
            CFCalendarAddComponents(v18, p_sunriseAbsolute, 0, "d", *p_sunriseAbsolute, 1);
          }
        }
        else
        {
          uint64_t v24 = _UIUserInterfaceStyleArbiterLogger();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Unable to compute fallback sunrise time", v25, 2u);
          }
        }
      }
      CFRelease(v18);
    }
    else
    {
      v21 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Unable to create calendar", buf, 2u);
      }
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UISunScheduleController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UISunScheduleController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISunScheduleController isInScheduleTime](self, "isInScheduleTime"), @"isInScheduleTime");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_UISunScheduleController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  id v7 = (id)objc_msgSend(v6, "appendInteger:withName:", -[_UISunScheduleController isInScheduleTime](self, "isInScheduleTime"), @"isInScheduleTime");
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEventTimer, 0);
  objc_storeStrong((id *)&self->_almanac, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end