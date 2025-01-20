@interface MNArrivalRegionTimer
- (MNArrivalRegionTimer)init;
- (MNArrivalRegionTimer)initWithArrivalRegion:(id)a3;
- (MNArrivalRegionTimerDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateForLocation:(id)a3;
@end

@implementation MNArrivalRegionTimer

- (MNArrivalRegionTimer)init
{
  result = (MNArrivalRegionTimer *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MNArrivalRegionTimer)initWithArrivalRegion:(id)a3
{
  id v5 = a3;
  if ([v5 arrivalRegionAction] == 4
    && [v5 endNavigationTimeoutThreshold]
    && (v9.receiver = self,
        v9.super_class = (Class)MNArrivalRegionTimer,
        v6 = [(MNArrivalRegionTimer *)&v9 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_arrivalRegion, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MNArrivalRegionTimer;
  [(MNArrivalRegionTimer *)&v3 dealloc];
}

- (void)updateForLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  BOOL v9 = self->_timer == 0;
  v10 = [(GEOArrivalRegion *)self->_arrivalRegion arrivalRegion];
  v11 = v10;
  if (!v9)
  {
    [v4 horizontalAccuracy];
    int v13 = objc_msgSend(v11, "containsCoordinate:radius:", v6, v8, v12);

    if (v13) {
      goto LABEL_11;
    }
    goto LABEL_3;
  }
  char v18 = objc_msgSend(v10, "containsCoordinate:", v6, v8);

  if ((v18 & 1) == 0) {
    goto LABEL_11;
  }
  if (![(GEOArrivalRegion *)self->_arrivalRegion endNavigationTimeoutThreshold])
  {
LABEL_3:
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_INFO, "Leaving arrival region that location was previously inside", (uint8_t *)&buf, 2u);
    }

    timer = self->_timer;
    p_timer = &self->_timer;
    [(NSTimer *)timer invalidate];
    v17 = *p_timer;
    *p_timer = 0;

    goto LABEL_11;
  }
  v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = [(GEOArrivalRegion *)self->_arrivalRegion endNavigationTimeoutThreshold];
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v20;
    _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_INFO, "Arrival timeout region entered. Setting timer for %u seconds", (uint8_t *)&buf, 8u);
  }

  unsigned int v21 = [(GEOArrivalRegion *)self->_arrivalRegion endNavigationTimeoutThreshold];
  objc_initWeak(&buf, self);
  v22 = (void *)MEMORY[0x1E4F1CB00];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __42__MNArrivalRegionTimer_updateForLocation___block_invoke;
  v25[3] = &unk_1E60F6AC8;
  objc_copyWeak(&v26, &buf);
  v23 = [v22 scheduledTimerWithTimeInterval:0 repeats:v25 block:(double)v21];
  v24 = self->_timer;
  self->_timer = v23;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&buf);
LABEL_11:
}

void __42__MNArrivalRegionTimer_updateForLocation___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 3);
    [v2 arrivalRegionTimerDidFire:v4];

    id v3 = v4[2];
    v4[2] = 0;

    WeakRetained = v4;
  }
}

- (MNArrivalRegionTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNArrivalRegionTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_arrivalRegion, 0);
}

@end