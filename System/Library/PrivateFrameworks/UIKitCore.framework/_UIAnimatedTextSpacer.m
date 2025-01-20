@interface _UIAnimatedTextSpacer
+ (BOOL)worksWithTextView:(id)a3;
- (BOOL)isAnimating;
- (CGRect)presentationFrameForTextLayoutFragmentFrame:(CGRect)result;
- (UIViewFloatAnimatableProperty)heightAnimationProperty;
- (_UIAnimatedTextSpacer)init;
- (_UIAnimatedTextSpacer)initWithSpringBehavior:(id)a3 delay:(double)a4 duration:(double)a5;
- (double)height;
- (double)verticalOffsetForSucceedingLayout;
- (id)beginExplicitHeightAnimationFromSource:(double)a3 toDestination:(double)a4;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutInvalidator;
- (id)synchronizedAnimationUpdater;
- (void)_clearAnimationState;
- (void)_finalizeAnimation;
- (void)_startAnimation;
- (void)_updateAnimationWithPresentationValue:(double)a3;
- (void)animateHeightFromSource:(double)a3 destination:(double)a4;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setHeightAnimationProperty:(id)a3;
- (void)setLayoutInvalidator:(id)a3;
- (void)setSynchronizedAnimationUpdater:(id)a3;
@end

@implementation _UIAnimatedTextSpacer

- (BOOL)isAnimating
{
  return self->_height != 0.0 || self->_targetHeight != 0.0;
}

- (_UIAnimatedTextSpacer)initWithSpringBehavior:(id)a3 delay:(double)a4 duration:(double)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIAnimatedTextSpacer;
  v10 = [(_UIAnimatedTextSpacer *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_springBehavior, a3);
    v11->_delay = a4;
    v11->_duration = a5;
    v12 = objc_alloc_init(UIViewFloatAnimatableProperty);
    heightAnimationProperty = v11->_heightAnimationProperty;
    v11->_heightAnimationProperty = v12;

    objc_initWeak(&location, v11);
    v21[0] = v11->_heightAnimationProperty;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63___UIAnimatedTextSpacer_initWithSpringBehavior_delay_duration___block_invoke;
    v16[3] = &unk_1E52D9960;
    objc_copyWeak(&v18, &location);
    v17 = v11;
    +[UIView _createTransformerWithInputAnimatableProperties:v14 presentationValueChangedCallback:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (_UIAnimatedTextSpacer)init
{
  return [(_UIAnimatedTextSpacer *)self initWithSpringBehavior:0 delay:0.0 duration:0.0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_UIAnimatedTextSpacer;
  [(_UIAnimatedTextSpacer *)&v2 dealloc];
}

- (void)_clearAnimationState
{
  self->_targetHeight = 0.0;
  heightAnimationProperty = self->_heightAnimationProperty;
  self->_heightAnimationProperty = 0;
  self->_height = 0.0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)_updateAnimationWithPresentationValue:(double)a3
{
  self->_height = a3;
  layoutInvalidator = (void (**)(void))self->_layoutInvalidator;
  if (layoutInvalidator) {
    layoutInvalidator[2]();
  }
}

- (void)_finalizeAnimation
{
  id completionHandler = (void (**)(id, SEL))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a2);
  }
  [(_UIAnimatedTextSpacer *)self _clearAnimationState];
}

- (void)_startAnimation
{
  [(UIViewFloatAnimatableProperty *)self->_heightAnimationProperty setValue:self->_height];
  v3 = self->_springBehavior;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___UIAnimatedTextSpacer__startAnimation__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40___UIAnimatedTextSpacer__startAnimation__block_invoke_2;
  v9[3] = &unk_1E52DC888;
  objc_copyWeak(&v10, &location);
  v5 = _Block_copy(v9);
  v6 = v5;
  if (self->_springBehavior)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40___UIAnimatedTextSpacer__startAnimation__block_invoke_3;
    v7[3] = &unk_1E52E8F50;
    id v8 = v5;
    +[UIView _animateUsingSpringBehavior:v3 tracking:0 animations:v4 completion:v7];
  }
  else
  {
    +[UIView animateWithDuration:0 delay:v4 options:v5 animations:self->_duration completion:self->_delay];
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)animateHeightFromSource:(double)a3 destination:(double)a4
{
  if (![(_UIAnimatedTextSpacer *)self isAnimating])
  {
    self->_targetHeight = a4;
    self->_height = a3;
    if (self->_delay <= 0.0)
    {
      [(_UIAnimatedTextSpacer *)self _startAnimation];
    }
    else
    {
      -[_UIAnimatedTextSpacer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__startAnimation, 0);
    }
  }
}

- (id)beginExplicitHeightAnimationFromSource:(double)a3 toDestination:(double)a4
{
  if ([(_UIAnimatedTextSpacer *)self isAnimating])
  {
    v7 = 0;
  }
  else
  {
    self->_targetHeight = a4;
    self->_height = a3;
    id v8 = objc_alloc_init(_UIAnimatedTextSpacerAnimationInfo);
    [(_UIAnimatedTextSpacerAnimationInfo *)v8 setStartHeight:a3];
    [(_UIAnimatedTextSpacerAnimationInfo *)v8 setEndHeight:a4];
    objc_initWeak(&location, self);
    id v9 = [_UIConcreteAnimatedTextSpacerAnimation alloc];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78___UIAnimatedTextSpacer_beginExplicitHeightAnimationFromSource_toDestination___block_invoke;
    v13[3] = &unk_1E52F21D8;
    objc_copyWeak(&v14, &location);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78___UIAnimatedTextSpacer_beginExplicitHeightAnimationFromSource_toDestination___block_invoke_2;
    v11[3] = &unk_1E52DC308;
    objc_copyWeak(&v12, &location);
    v7 = [(_UIConcreteAnimatedTextSpacerAnimation *)v9 initWithAnimationInfo:v8 updateBlock:v13 finalizeBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (CGRect)presentationFrameForTextLayoutFragmentFrame:(CGRect)result
{
  double height = self->_height;
  result.size.double height = height;
  return result;
}

- (double)verticalOffsetForSucceedingLayout
{
  return self->_height - self->_targetHeight;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  springBehavior = self->_springBehavior;
  double delay = self->_delay;
  double duration = self->_duration;
  return (id)[v4 initWithSpringBehavior:springBehavior delay:delay duration:duration];
}

+ (BOOL)worksWithTextView:(id)a3
{
  return [a3 worksWithAnimatedTextSpacer];
}

- (id)synchronizedAnimationUpdater
{
  return self->_synchronizedAnimationUpdater;
}

- (void)setSynchronizedAnimationUpdater:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIViewFloatAnimatableProperty)heightAnimationProperty
{
  return self->_heightAnimationProperty;
}

- (void)setHeightAnimationProperty:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (id)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (void)setLayoutInvalidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_heightAnimationProperty, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_synchronizedAnimationUpdater, 0);
  objc_storeStrong((id *)&self->_springBehavior, 0);
}

@end