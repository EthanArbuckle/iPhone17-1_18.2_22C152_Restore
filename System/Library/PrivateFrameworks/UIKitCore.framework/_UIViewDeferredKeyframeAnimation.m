@interface _UIViewDeferredKeyframeAnimation
- (BOOL)isEmpty;
- (id)_animationFrames;
- (void)_enumerateAnimationFramesForKeyframes:(id)a3;
- (void)_finalize;
- (void)addAnimationFrameForValue:(id)a3;
- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4;
@end

@implementation _UIViewDeferredKeyframeAnimation

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_animationFrames count] == 0;
}

- (id)_animationFrames
{
  if (![(NSMutableArray *)self->_animationFrames count])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:3033 description:@"Empty keyframe animation?"];
  }
  animationFrames = self->_animationFrames;
  return animationFrames;
}

- (void)addAnimationFrameForValue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIViewDeferredKeyframeAnimation;
  id v4 = a3;
  [(_UIViewDeferredAnimation *)&v8 addAnimationFrameForValue:v4];
  if (!self->_animationFrames)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    animationFrames = self->_animationFrames;
    self->_animationFrames = v5;
  }
  v7 = objc_msgSend((id)__currentViewAnimationState, "_updateAnimationFrameWithAnimationProperties:", 0, v8.receiver, v8.super_class);
  [v7 setValue:v4];

  [(NSMutableArray *)self->_animationFrames addObject:v7];
}

- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIViewDeferredKeyframeAnimation;
  [(_UIViewDeferredAnimation *)&v19 animateFrameAtIndex:a3 animations:v7];
  if ([(NSMutableArray *)self->_animationFrames count] <= (unint64_t)a3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:3051 description:@"frameIndex out of bounds"];
  }
  objc_super v8 = [(NSMutableArray *)self->_animationFrames objectAtIndexedSubscript:a3];
  [v8 startTime];
  double v10 = v9;
  [v8 duration];
  double v12 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67___UIViewDeferredKeyframeAnimation_animateFrameAtIndex_animations___block_invoke;
  v16[3] = &unk_1E52DB330;
  id v17 = v8;
  id v18 = v7;
  id v13 = v8;
  id v14 = v7;
  +[UIView addKeyframeWithRelativeStartTime:v16 relativeDuration:v10 animations:v12];
}

- (void)_finalize
{
  v6.receiver = self;
  v6.super_class = (Class)_UIViewDeferredKeyframeAnimation;
  [(_UIViewDeferredAnimation *)&v6 _finalize];
  [(NSMutableArray *)self->_animationFrames sortWithOptions:16 usingComparator:&__block_literal_global_636_0];
  v3 = objc_alloc_init(_UIViewAnimationFrame);
  id v4 = [(_UIViewDeferredAnimation *)self initialValue];
  [(_UIViewAnimationFrame *)v3 setValue:v4];

  v5 = [(NSMutableArray *)self->_animationFrames firstObject];
  [v5 startTime];
  -[_UIViewAnimationFrame setDuration:](v3, "setDuration:");

  [(NSMutableArray *)self->_animationFrames insertObject:v3 atIndex:0];
}

- (void)_enumerateAnimationFramesForKeyframes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, double, double, double))a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_animationFrames;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {
    objc_super v8 = v5;
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  objc_super v8 = 0;
  uint64_t v9 = *(void *)v24;
  do
  {
    uint64_t v10 = 0;
    double v11 = v8;
    do
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      double v12 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
      if (v11)
      {
        id v13 = [(NSMutableArray *)v11 value];
        [(NSMutableArray *)v11 startTime];
        double v15 = v14;
        [(NSMutableArray *)v11 duration];
        double v17 = v16;
        [v12 startTime];
        v4[2](v4, v13, v15, v17, v18);
      }
      objc_super v8 = v12;

      ++v10;
      double v11 = v8;
    }
    while (v7 != v10);
    uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v7);

  if (v8)
  {
    objc_super v19 = [(NSMutableArray *)v8 value];
    [(NSMutableArray *)v8 startTime];
    double v21 = v20;
    [(NSMutableArray *)v8 duration];
    v4[2](v4, v19, v21, v22, 1.0);

LABEL_13:
  }
}

- (void).cxx_destruct
{
}

@end