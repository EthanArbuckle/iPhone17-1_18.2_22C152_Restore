@interface PXHUDTimeIntervalVisualization
+ (PXHUDTimeIntervalVisualization)visualizationWithTimeInterval:(id)a3;
- (PXTimeInterval)timeInterval;
- (void)setTimeInterval:(id)a3;
@end

@implementation PXHUDTimeIntervalVisualization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
  objc_storeStrong(&self->_stateTransitionHandlerToken, 0);
}

- (PXTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(id)a3
{
  v5 = (PXTimeInterval *)a3;
  timeInterval = self->_timeInterval;
  if (timeInterval != v5)
  {
    [(PXTimeInterval *)timeInterval removeStateTransitionHandler:self->_stateTransitionHandlerToken];
    objc_storeStrong((id *)&self->_timeInterval, a3);
    objc_initWeak(&location, self);
    v7 = self->_timeInterval;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __50__PXHUDTimeIntervalVisualization_setTimeInterval___block_invoke;
    v13 = &unk_1E5DD1F78;
    objc_copyWeak(&v14, &location);
    v8 = [(PXTimeInterval *)v7 addStateTransitionHandler:&v10];
    id stateTransitionHandlerToken = self->_stateTransitionHandlerToken;
    self->_id stateTransitionHandlerToken = v8;

    [(PXHUDVisualization *)self _notifyDelegateVisualizationDidChange];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __50__PXHUDTimeIntervalVisualization_setTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateVisualizationDidChange];
}

+ (PXHUDTimeIntervalVisualization)visualizationWithTimeInterval:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PXHUDTimeIntervalVisualization);
  [(PXHUDTimeIntervalVisualization *)v4 setTimeInterval:v3];

  return v4;
}

@end