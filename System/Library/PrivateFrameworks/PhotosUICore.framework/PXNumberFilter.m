@interface PXNumberFilter
- (BOOL)_needsUpdate;
- (PXNumberFilter)init;
- (PXNumberFilter)initWithInput:(double)a3;
- (double)currentTime;
- (double)input;
- (double)lastTime;
- (double)output;
- (double)time;
- (double)updatedOutput;
- (void)_invalidateOutput;
- (void)_setLastTime:(double)a3;
- (void)_setNeedsUpdate;
- (void)_setOutput:(double)a3;
- (void)_updateIfNeeded;
- (void)_updateOutputIfNeeded;
- (void)didPerformChanges;
- (void)invalidateOutput;
- (void)performChanges:(id)a3;
- (void)setInput:(double)a3;
- (void)setTime:(double)a3;
@end

@implementation PXNumberFilter

- (PXNumberFilter)initWithInput:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXNumberFilter;
  v4 = [(PXNumberFilter *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_input = a3;
    [(PXNumberFilter *)v4 initialOutputForInput:a3];
    v5->_output = v6;
  }
  return v5;
}

- (double)lastTime
{
  return self->_lastTime;
}

- (double)output
{
  return self->_output;
}

- (double)time
{
  return self->_time;
}

- (double)input
{
  return self->_input;
}

- (void)_updateOutputIfNeeded
{
  if (self->_needsUpdateFlags.output)
  {
    self->_needsUpdateFlags.output = 0;
    [(PXNumberFilter *)self currentTime];
    double v4 = v3;
    [(PXNumberFilter *)self updatedOutput];
    -[PXNumberFilter _setOutput:](self, "_setOutput:");
    [(PXNumberFilter *)self _setLastTime:v4];
  }
}

- (void)_invalidateOutput
{
  self->_needsUpdateFlags.output = 1;
  [(PXNumberFilter *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXNumberFilter *)self _needsUpdate])
  {
    [(PXNumberFilter *)self _updateOutputIfNeeded];
    if ([(PXNumberFilter *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PXNumberFilter.m" lineNumber:131 description:@"update still needed after update pass"];
    }
  }
}

- (void)_setNeedsUpdate
{
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.output;
}

- (void)invalidateOutput
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__PXNumberFilter_invalidateOutput__block_invoke;
  v2[3] = &unk_1E5DB7220;
  v2[4] = self;
  [(PXNumberFilter *)self performChanges:v2];
}

uint64_t __34__PXNumberFilter_invalidateOutput__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateOutput];
}

- (double)currentTime
{
  [(PXNumberFilter *)self time];
  if (result == 0.0)
  {
    double v3 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 timeIntervalSinceReferenceDate];
  }
  return result;
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    [(PXNumberFilter *)self _invalidateOutput];
  }
}

- (void)setInput:(double)a3
{
  if (self->_input != a3)
  {
    self->_input = a3;
    [(PXNumberFilter *)self signalChange:1];
    [(PXNumberFilter *)self _invalidateOutput];
  }
}

- (void)_setLastTime:(double)a3
{
  self->_lastTime = a3;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXNumberFilter;
  [(PXNumberFilter *)&v3 didPerformChanges];
  [(PXNumberFilter *)self _updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXNumberFilter;
  [(PXNumberFilter *)&v3 performChanges:a3];
}

- (void)_setOutput:(double)a3
{
  if (self->_output != a3)
  {
    self->_output = a3;
    [(PXNumberFilter *)self signalChange:2];
  }
}

- (double)updatedOutput
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXNumberFilter.m", 44, @"Method %s is a responsibility of subclass %@", "-[PXNumberFilter updatedOutput]", v6 object file lineNumber description];

  abort();
}

- (PXNumberFilter)init
{
  return [(PXNumberFilter *)self initWithInput:0.0];
}

@end