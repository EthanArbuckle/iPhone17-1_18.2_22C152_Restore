@interface _UIAnimatedTextAttachment
- (NSAttributedString)attachmentString;
- (NSMutableArray)animateAlongsideHandlers;
- (NSMutableArray)completionHandlers;
- (UIViewFloatAnimatableProperty)heightAnimationProperty;
- (_UIAnimatedTextAttachment)init;
- (double)targetHeight;
- (id)invalidationHandler;
- (void)_initiateAnimationUsingSpringBehavior:(id)a3;
- (void)_updatePresentationValues;
- (void)addAlongsideAnimation:(id)a3;
- (void)addCompletionHandler:(id)a3;
- (void)animateToTargetHeight:(double)a3 delay:(double)a4 usingSpringBehavior:(id)a5;
- (void)setAnimateAlongsideHandlers:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setHeightAnimationProperty:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTargetHeight:(double)a3;
@end

@implementation _UIAnimatedTextAttachment

- (_UIAnimatedTextAttachment)init
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)_UIAnimatedTextAttachment;
  v2 = [(_UIAnimatedTextAttachment *)&v15 init];
  if (v2)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0, 1.0, 1.0);
    v3 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    [(_UIAnimatedTextAttachment *)v2 setImage:v3];

    v4 = objc_alloc_init(UIViewFloatAnimatableProperty);
    heightAnimationProperty = v2->_heightAnimationProperty;
    v2->_heightAnimationProperty = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    animateAlongsideHandlers = v2->_animateAlongsideHandlers;
    v2->_animateAlongsideHandlers = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v8;

    objc_initWeak(&location, v2);
    v16[0] = v2->_heightAnimationProperty;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33___UIAnimatedTextAttachment_init__block_invoke;
    v12[3] = &unk_1E52DC308;
    objc_copyWeak(&v13, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v10 presentationValueChangedCallback:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIAnimatedTextAttachment;
  -[_UIAnimatedTextAttachment setBounds:](&v9, sel_setBounds_);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39___UIAnimatedTextAttachment_setBounds___block_invoke;
  v8[3] = &unk_1E52DA520;
  v8[4] = self;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  *(CGFloat *)&v8[7] = width;
  *(CGFloat *)&v8[8] = height;
  +[UIView performWithoutAnimation:v8];
}

- (NSAttributedString)attachmentString
{
  return (NSAttributedString *)[MEMORY[0x1E4F28B18] attributedStringWithAttachment:self];
}

- (void)addAlongsideAnimation:(id)a3
{
  animateAlongsideHandlers = self->_animateAlongsideHandlers;
  id v5 = (id)[a3 copy];
  v4 = _Block_copy(v5);
  [(NSMutableArray *)animateAlongsideHandlers addObject:v4];
}

- (void)addCompletionHandler:(id)a3
{
  completionHandlers = self->_completionHandlers;
  id v5 = (id)[a3 copy];
  v4 = _Block_copy(v5);
  [(NSMutableArray *)completionHandlers addObject:v4];
}

- (void)animateToTargetHeight:(double)a3 delay:(double)a4 usingSpringBehavior:(id)a5
{
  id v8 = a5;
  self->_targetHeight = a3;
  if (!v8)
  {
    id v8 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.4];
  }
  id v9 = v8;
  if (a4 <= 0.0) {
    [(_UIAnimatedTextAttachment *)self _initiateAnimationUsingSpringBehavior:v8];
  }
  else {
    [(_UIAnimatedTextAttachment *)self performSelector:sel__initiateAnimationUsingSpringBehavior_ withObject:v8 afterDelay:a4];
  }
}

- (void)_initiateAnimationUsingSpringBehavior:(id)a3
{
  id v4 = a3;
  [(_UIAnimatedTextAttachment *)self targetHeight];
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke;
  v7[3] = &unk_1E52D9CD0;
  v7[4] = self;
  v7[5] = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke_2;
  v6[3] = &unk_1E52DA9D0;
  +[UIView _animateUsingSpringBehavior:v4 tracking:0 animations:v7 completion:v6];
}

- (void)_updatePresentationValues
{
  [(_UIAnimatedTextAttachment *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(_UIAnimatedTextAttachment *)self bounds];
  double v8 = v7;
  [(UIViewFloatAnimatableProperty *)self->_heightAnimationProperty presentationValue];
  -[_UIAnimatedTextAttachment setBounds:](self, "setBounds:", v4, v6, v8, v9);
  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v11 = (void (*)(void))*((void *)invalidationHandler + 2);
    v11();
  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (double)targetHeight
{
  return self->_targetHeight;
}

- (void)setTargetHeight:(double)a3
{
  self->_targetHeight = a3;
}

- (UIViewFloatAnimatableProperty)heightAnimationProperty
{
  return self->_heightAnimationProperty;
}

- (void)setHeightAnimationProperty:(id)a3
{
}

- (NSMutableArray)animateAlongsideHandlers
{
  return self->_animateAlongsideHandlers;
}

- (void)setAnimateAlongsideHandlers:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_animateAlongsideHandlers, 0);
  objc_storeStrong((id *)&self->_heightAnimationProperty, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end