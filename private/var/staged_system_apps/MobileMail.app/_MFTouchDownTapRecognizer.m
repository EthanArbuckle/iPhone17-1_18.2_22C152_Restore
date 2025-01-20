@interface _MFTouchDownTapRecognizer
- (_MFTouchDownTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (id)touchdownHandler;
- (unint64_t)numberOfTouches;
- (void)reset;
- (void)setTouchdownHandler:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _MFTouchDownTapRecognizer

- (_MFTouchDownTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MFTouchDownTapRecognizer;
  v7 = [(_MFTouchDownTapRecognizer *)&v10 initWithTarget:v6 action:a4];
  v8 = v7;
  if (v7) {
    [(_MFTouchDownTapRecognizer *)v7 setDelaysTouchesEnded:0];
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_MFTouchDownTapRecognizer;
  [(_MFTouchDownTapRecognizer *)&v8 touchesBegan:v6 withEvent:v7];
  self->_numberOfTouches += (unint64_t)[v6 count];
  (*((void (**)(void))self->_touchdownHandler + 2))();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_MFTouchDownTapRecognizer;
  [(_MFTouchDownTapRecognizer *)&v8 touchesEnded:v6 withEvent:v7];
  self->_numberOfTouches -= (unint64_t)[v6 count];
  (*((void (**)(void))self->_touchdownHandler + 2))();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_MFTouchDownTapRecognizer;
  [(_MFTouchDownTapRecognizer *)&v8 touchesCancelled:v6 withEvent:v7];
  self->_numberOfTouches -= (unint64_t)[v6 count];
  (*((void (**)(void))self->_touchdownHandler + 2))();
}

- (unint64_t)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_MFTouchDownTapRecognizer;
  [(_MFTouchDownTapRecognizer *)&v3 reset];
  self->_numberOfTouches = 0;
  (*((void (**)(void))self->_touchdownHandler + 2))();
}

- (id)touchdownHandler
{
  return self->_touchdownHandler;
}

- (void)setTouchdownHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end