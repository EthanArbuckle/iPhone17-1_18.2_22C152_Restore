@interface _UIViewDeferredAnimation
- (BOOL)autoreverses;
- (BOOL)isEmpty;
- (BOOL)isFinalized;
- (NSArray)animationFrames;
- (NSString)key;
- (double)duration;
- (double)repeatCount;
- (id)_animationFrames;
- (id)description;
- (id)initialValue;
- (void)_finalize;
- (void)addAnimationFrameForValue:(id)a3;
- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4;
- (void)calculateFrameValues:(id)a3 frameTimes:(id)a4 withFrameInterval:(double)a5 valueTransformer:(id)a6;
- (void)setAutoreverses:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setInitialValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setRepeatCount:(double)a3;
@end

@implementation _UIViewDeferredAnimation

- (void)setRepeatCount:(double)a3
{
  self->_repeatCount = a3;
}

- (void)setKey:(id)a3
{
}

- (void)setInitialValue:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setAutoreverses:(BOOL)a3
{
  self->_autoreverses = a3;
}

- (void)_finalize
{
  self->_finalized = 1;
}

- (NSArray)animationFrames
{
  if (!self->_finalized)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:2923 description:@"You cannot get animation frames from an animation that has not been finalized"];
  }
  return (NSArray *)[(_UIViewDeferredAnimation *)self _animationFrames];
}

- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4
{
  id v6 = a4;
  if (self->_finalized)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = v6;
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:2935 description:@"You can only add frames from animations that have been finalized"];

    id v6 = v9;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v10 = v6;
  v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:2936 description:@"animations must be non-nil"];

  id v6 = v10;
LABEL_3:
}

- (void)addAnimationFrameForValue:(id)a3
{
  id v5 = a3;
  if (self->_finalized)
  {
    id v8 = v5;
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:2929 description:@"You can only add values to animations that have not yet been finalized"];

    id v5 = v8;
    if (v8) {
      goto LABEL_3;
    }
  }
  else if (v5)
  {
    goto LABEL_3;
  }
  id v9 = v5;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2, self, @"UIView.m", 2930, @"You must provide a value (key=%@)", self->_key object file lineNumber description];

  id v5 = v9;
LABEL_3:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)_animationFrames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)calculateFrameValues:(id)a3 frameTimes:(id)a4 withFrameInterval:(double)a5 valueTransformer:(id)a6
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a6;
  if (!self->_finalized)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:2950 description:@"You can only calculate keyframes from animations that have been finalized"];
  }
  if (![(_UIViewDeferredAnimation *)self isEmpty] && v11 | v12)
  {
    double duration = self->_duration;
    v17[1] = 3221225472;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[2] = __95___UIViewDeferredAnimation_calculateFrameValues_frameTimes_withFrameInterval_valueTransformer___block_invoke;
    v17[3] = &unk_1E530FC50;
    double v15 = a5 / duration;
    id v20 = v13;
    id v18 = (id)v11;
    id v19 = (id)v12;
    double v21 = v15;
    [(_UIViewDeferredAnimation *)self _enumerateAnimationFramesForKeyframes:v17];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)_UIViewDeferredAnimation;
  v4 = [(_UIViewDeferredAnimation *)&v8 description];
  id v5 = [v3 stringWithFormat:@"%@ key=%@ duration=%f initialValue=%@", v4, self->_key, *(void *)&self->_duration, self->_initialValue];

  if (self->_finalized)
  {
    id v6 = [(_UIViewDeferredAnimation *)self _animationFrames];
    [v5 appendFormat:@" animationFrames=%@", v6];
  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (double)duration
{
  return self->_duration;
}

- (id)initialValue
{
  return self->_initialValue;
}

- (double)repeatCount
{
  return self->_repeatCount;
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

@end