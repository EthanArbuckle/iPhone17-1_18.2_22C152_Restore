@interface _SUICProgressRingLayer
- (BOOL)spinning;
- (_SUICProgressRingLayer)init;
- (double)progress;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSpinning:(BOOL)a3;
@end

@implementation _SUICProgressRingLayer

- (_SUICProgressRingLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_SUICProgressRingLayer;
  v2 = [(_SUICRingLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_SUICProgressRingLayer *)v2 setStrokeEnd:0.0];
  }
  return v3;
}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    if (a3)
    {
      if (setSpinning__onceToken != -1) {
        dispatch_once(&setSpinning__onceToken, &__block_literal_global_2);
      }
      uint64_t v4 = setSpinning__sRotationAnimation;
      id v5 = [(id)setSpinning__sRotationAnimation keyPath];
      [(_SUICProgressRingLayer *)self addAnimation:v4 forKey:v5];
    }
    else
    {
      [(_SUICProgressRingLayer *)self removeAnimationForKey:@"transform.rotation.z"];
    }
  }
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = (void (**)(void, void))v8;
  if (self->_progress == a3)
  {
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
  else
  {
    self->_progress = a3;
    objc_initWeak(&location, self);
    if (v5)
    {
      v10 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58___SUICProgressRingLayer_setProgress_animated_completion___block_invoke;
      v11[3] = &unk_1E5C59920;
      objc_copyWeak(v12, &location);
      v12[1] = *(id *)&a3;
      [v10 animateWithDuration:0 delay:v11 usingSpringWithDamping:v9 initialSpringVelocity:0.35 options:0.0 animations:400.0 completion:0.0];
      objc_destroyWeak(v12);
    }
    else
    {
      [(_SUICProgressRingLayer *)self setStrokeEnd:a3];
      if (v9) {
        v9[2](v9, 1);
      }
    }
    objc_destroyWeak(&location);
  }
}

- (BOOL)spinning
{
  return self->_spinning;
}

- (double)progress
{
  return self->_progress;
}

@end