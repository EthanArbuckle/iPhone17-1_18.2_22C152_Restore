@interface PXRequestedEDRHeadroomFactorFilter
- (BOOL)isPaused;
- (PXRequestedEDRHeadroomFactorFilter)initWithInput:(double)a3;
- (double)highValue;
- (double)lastDecreaseTime;
- (double)sustainDuration;
- (double)updatedOutput;
- (void)setHighValue:(double)a3;
- (void)setInput:(double)a3;
- (void)setLastDecreaseTime:(double)a3;
- (void)setSustainDuration:(double)a3;
@end

@implementation PXRequestedEDRHeadroomFactorFilter

- (void)setLastDecreaseTime:(double)a3
{
  self->_lastDecreaseTime = a3;
}

- (double)lastDecreaseTime
{
  return self->_lastDecreaseTime;
}

- (void)setHighValue:(double)a3
{
  self->_highValue = a3;
}

- (double)highValue
{
  return self->_highValue;
}

- (void)setSustainDuration:(double)a3
{
  self->_sustainDuration = a3;
}

- (double)sustainDuration
{
  return self->_sustainDuration;
}

- (BOOL)isPaused
{
  [(PXRequestedEDRHeadroomFactorFilter *)self lastDecreaseTime];
  double v4 = v3;
  if (v3 == -1.79769313e308) {
    return 0;
  }
  [(PXNumberFilter *)self currentTime];
  if (v5 < v4) {
    return 0;
  }
  double v7 = v5;
  [(PXRequestedEDRHeadroomFactorFilter *)self sustainDuration];
  return v7 < v4 + v8;
}

- (double)updatedOutput
{
  [(PXNumberFilter *)self output];
  double v4 = v3;
  if ([(PXRequestedEDRHeadroomFactorFilter *)self isPaused]) {
    return v4;
  }
  [(PXNumberFilter *)self input];
  return result;
}

- (void)setInput:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXRequestedEDRHeadroomFactorFilter;
  -[PXNumberFilter setInput:](&v11, sel_setInput_);
  [(PXRequestedEDRHeadroomFactorFilter *)self highValue];
  if (v5 <= a3)
  {
    [(PXRequestedEDRHeadroomFactorFilter *)self setHighValue:a3];
    [(PXRequestedEDRHeadroomFactorFilter *)self setLastDecreaseTime:-1.79769313e308];
  }
  else if (![(PXRequestedEDRHeadroomFactorFilter *)self isPaused])
  {
    [(PXNumberFilter *)self currentTime];
    -[PXRequestedEDRHeadroomFactorFilter setLastDecreaseTime:](self, "setLastDecreaseTime:");
    objc_initWeak(&location, self);
    [(PXRequestedEDRHeadroomFactorFilter *)self sustainDuration];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PXRequestedEDRHeadroomFactorFilter_setInput___block_invoke;
    v8[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __47__PXRequestedEDRHeadroomFactorFilter_setInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateOutput];
}

- (PXRequestedEDRHeadroomFactorFilter)initWithInput:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXRequestedEDRHeadroomFactorFilter;
  double v4 = -[PXNumberFilter initWithInput:](&v9, sel_initWithInput_);
  double v5 = v4;
  if (v4)
  {
    v4->_highValue = a3;
    v4->_lastDecreaseTime = -1.79769313e308;
    double v6 = +[PXImageModulationSettings sharedInstance];
    [v6 EDRHeadroomRequestSustainDuration];
    v5->_sustainDuration = v7;
  }
  return v5;
}

@end