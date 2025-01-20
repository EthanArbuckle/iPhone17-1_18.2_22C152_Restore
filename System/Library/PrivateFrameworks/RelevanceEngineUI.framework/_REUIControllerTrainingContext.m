@interface _REUIControllerTrainingContext
- (BOOL)elementIsAvailable:(id)a3;
- (_REUIControllerTrainingContextDelegate)delegate;
- (double)maximumNegativeDwellTime;
- (double)minimumPositiveDwellTime;
- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4;
- (id)interactionTypeForElement:(id)a3;
- (unint64_t)onScreenElementCount;
- (void)setDelegate:(id)a3;
- (void)setMaximumNegativeDwellTime:(double)a3;
- (void)setMinimumPositiveDwellTime:(double)a3;
- (void)setOnScreenElementCount:(unint64_t)a3;
@end

@implementation _REUIControllerTrainingContext

- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = [WeakRetained elementsOrdered:a3 relativeToElement:v6];

  if (v8) {
    v9 = v8;
  }
  else {
    v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;

  return v10;
}

- (BOOL)elementIsAvailable:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = [WeakRetained elementIsAvailable:v4];

  return v6;
}

- (id)interactionTypeForElement:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = [WeakRetained interactionTypeForElement:v4];

  return v6;
}

- (double)maximumNegativeDwellTime
{
  return self->_maximumNegativeDwellTime;
}

- (void)setMaximumNegativeDwellTime:(double)a3
{
  self->_maximumNegativeDwellTime = a3;
}

- (double)minimumPositiveDwellTime
{
  return self->_minimumPositiveDwellTime;
}

- (void)setMinimumPositiveDwellTime:(double)a3
{
  self->_minimumPositiveDwellTime = a3;
}

- (unint64_t)onScreenElementCount
{
  return self->_onScreenElementCount;
}

- (void)setOnScreenElementCount:(unint64_t)a3
{
  self->_onScreenElementCount = a3;
}

- (_REUIControllerTrainingContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_REUIControllerTrainingContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end