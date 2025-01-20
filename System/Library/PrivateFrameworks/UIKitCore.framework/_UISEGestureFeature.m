@interface _UISEGestureFeature
- (_UISEGestureFeatureDelegate)delegate;
- (id)debugDictionary;
- (unint64_t)state;
- (void)_setState:(unint64_t)a3;
- (void)incorporateSample:(const _UISEGestureFeatureSample *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UISEGestureFeature

- (void).cxx_destruct
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  if (!self->_state) {
    [(_UISEGestureFeature *)self _incorporateSample:a3];
  }
}

- (void)_setState:(unint64_t)a3
{
  if (a3 && !self->_state)
  {
    self->_state = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained featureDidChangeState:self];
  }
}

- (void)setDelegate:(id)a3
{
}

- (id)debugDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(_UISEGestureFeature *)self state];
  if (v5 > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E52F08D0[v5];
  }
  v9[0] = @"class";
  v9[1] = @"state";
  v10[0] = v4;
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (_UISEGestureFeatureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISEGestureFeatureDelegate *)WeakRetained;
}

@end