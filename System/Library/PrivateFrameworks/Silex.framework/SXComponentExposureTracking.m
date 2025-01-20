@interface SXComponentExposureTracking
+ (id)exposureTrackingWithComponent:(id)a3 traits:(unint64_t)a4 exposureStateChangeBlock:(id)a5 conditionBlock:(id)a6;
- (NSDate)lastStateChange;
- (SXComponentExposureTracking)initWithComponent:(id)a3 traits:(unint64_t)a4 exposureStateChangeBlock:(id)a5 conditionBlock:(id)a6;
- (SXComponentView)componentView;
- (double)maximumVisibleY;
- (double)minimumVisibleY;
- (double)visibilityFactor;
- (id)conditionBlock;
- (id)exposureStateChangeBlock;
- (int64_t)lastObservedVisibilityState;
- (unint64_t)traits;
- (void)calculateVisibilityFactor;
- (void)setLastObservedVisibilityState:(int64_t)a3;
- (void)setMaximumVisibleY:(double)a3;
- (void)setMinimumVisibleY:(double)a3;
@end

@implementation SXComponentExposureTracking

+ (id)exposureTrackingWithComponent:(id)a3 traits:(unint64_t)a4 exposureStateChangeBlock:(id)a5 conditionBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[SXComponentExposureTracking alloc] initWithComponent:v11 traits:a4 exposureStateChangeBlock:v10 conditionBlock:v9];

  return v12;
}

- (SXComponentExposureTracking)initWithComponent:(id)a3 traits:(unint64_t)a4 exposureStateChangeBlock:(id)a5 conditionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SXComponentExposureTracking;
  v13 = [(SXComponentExposureTracking *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_componentView, v10);
    v14->_traits = a4;
    uint64_t v15 = [v11 copy];
    id exposureStateChangeBlock = v14->_exposureStateChangeBlock;
    v14->_id exposureStateChangeBlock = (id)v15;

    v14->_lastObservedVisibilityState = 0;
    uint64_t v17 = MEMORY[0x223CA5030](v12);
    id conditionBlock = v14->_conditionBlock;
    v14->_id conditionBlock = (id)v17;

    uint64_t v19 = [MEMORY[0x263EFF910] date];
    lastStateChange = v14->_lastStateChange;
    v14->_lastStateChange = (NSDate *)v19;
  }
  return v14;
}

- (void)setMinimumVisibleY:(double)a3
{
  self->_minimumVisibleY = a3;
  [(SXComponentExposureTracking *)self calculateVisibilityFactor];
}

- (void)setMaximumVisibleY:(double)a3
{
  self->_maximumVisibleY = a3;
  [(SXComponentExposureTracking *)self calculateVisibilityFactor];
}

- (void)setLastObservedVisibilityState:(int64_t)a3
{
  self->_lastObservedVisibilityState = a3;
  self->_lastStateChange = [MEMORY[0x263EFF910] date];
  MEMORY[0x270F9A758]();
}

- (void)calculateVisibilityFactor
{
  v3 = [(SXComponentExposureTracking *)self componentView];
  [v3 bounds];
  double Height = CGRectGetHeight(v11);

  if (Height <= 0.0)
  {
    self->_visibilityFactor = 0.0;
  }
  else
  {
    [(SXComponentExposureTracking *)self maximumVisibleY];
    double v6 = v5;
    [(SXComponentExposureTracking *)self minimumVisibleY];
    double v8 = v6 - v7;
    id v9 = [(SXComponentExposureTracking *)self componentView];
    [v9 bounds];
    self->_visibilityFactor = v8 / CGRectGetHeight(v12);
  }
}

- (SXComponentView)componentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentView);
  return (SXComponentView *)WeakRetained;
}

- (unint64_t)traits
{
  return self->_traits;
}

- (id)exposureStateChangeBlock
{
  return self->_exposureStateChangeBlock;
}

- (id)conditionBlock
{
  return self->_conditionBlock;
}

- (double)visibilityFactor
{
  return self->_visibilityFactor;
}

- (double)minimumVisibleY
{
  return self->_minimumVisibleY;
}

- (double)maximumVisibleY
{
  return self->_maximumVisibleY;
}

- (int64_t)lastObservedVisibilityState
{
  return self->_lastObservedVisibilityState;
}

- (NSDate)lastStateChange
{
  return self->_lastStateChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStateChange, 0);
  objc_storeStrong(&self->_conditionBlock, 0);
  objc_storeStrong(&self->_exposureStateChangeBlock, 0);
  objc_destroyWeak((id *)&self->_componentView);
}

@end