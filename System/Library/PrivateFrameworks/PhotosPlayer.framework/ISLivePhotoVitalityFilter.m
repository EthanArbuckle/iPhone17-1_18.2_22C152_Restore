@interface ISLivePhotoVitalityFilter
- (BOOL)_shouldUpdateOutput;
- (BOOL)isPerformingInputChanges;
- (ISLivePhotoVitalityFilter)init;
- (ISLivePhotoVitalityFilter)initWithSettings:(id)a3;
- (ISVitalitySettings)settings;
- (id)outputChangeHandler;
- (int64_t)state;
- (void)_setPerformingInputChanges:(BOOL)a3;
- (void)_setShouldUpdateOutput:(BOOL)a3;
- (void)invalidateOutput;
- (void)performInputChanges:(id)a3;
- (void)setOutputChangeHandler:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateOutput;
@end

@implementation ISLivePhotoVitalityFilter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputChangeHandler, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_setShouldUpdateOutput:(BOOL)a3
{
  self->__shouldUpdateOutput = a3;
}

- (BOOL)_shouldUpdateOutput
{
  return self->__shouldUpdateOutput;
}

- (void)_setPerformingInputChanges:(BOOL)a3
{
  self->_isPerformingInputChanges = a3;
}

- (BOOL)isPerformingInputChanges
{
  return self->_isPerformingInputChanges;
}

- (void)setOutputChangeHandler:(id)a3
{
}

- (id)outputChangeHandler
{
  return self->_outputChangeHandler;
}

- (int64_t)state
{
  return self->_state;
}

- (ISVitalitySettings)settings
{
  return self->_settings;
}

- (void)updateOutput
{
}

- (void)invalidateOutput
{
}

- (void)performInputChanges:(id)a3
{
  v5 = (void (**)(void))a3;
  BOOL v4 = [(ISLivePhotoVitalityFilter *)self isPerformingInputChanges];
  [(ISLivePhotoVitalityFilter *)self _setPerformingInputChanges:1];
  if (v5) {
    v5[2](v5);
  }
  [(ISLivePhotoVitalityFilter *)self _setPerformingInputChanges:v4];
  if (!v4) {
    [(ISLivePhotoVitalityFilter *)self updateOutput];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    BOOL v4 = [(ISLivePhotoVitalityFilter *)self outputChangeHandler];

    if (v4)
    {
      v5 = [(ISLivePhotoVitalityFilter *)self outputChangeHandler];
      v5[2](v5, self);
    }
  }
}

- (ISLivePhotoVitalityFilter)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISLivePhotoVitalityFilter;
  v6 = [(ISLivePhotoVitalityFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (ISLivePhotoVitalityFilter)init
{
  return [(ISLivePhotoVitalityFilter *)self initWithSettings:0];
}

@end