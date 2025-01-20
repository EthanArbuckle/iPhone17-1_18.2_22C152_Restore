@interface _UIConcreteAnimatedTextSpacerAnimation
- (_UIAnimatedTextSpacerAnimationInfo)animationInfo;
- (_UIConcreteAnimatedTextSpacerAnimation)initWithAnimationInfo:(id)a3 updateBlock:(id)a4 finalizeBlock:(id)a5;
- (float)progress;
- (id)finalizeBlock;
- (id)updateBlock;
- (void)finalize;
- (void)setProgress:(float)a3;
@end

@implementation _UIConcreteAnimatedTextSpacerAnimation

- (_UIConcreteAnimatedTextSpacerAnimation)initWithAnimationInfo:(id)a3 updateBlock:(id)a4 finalizeBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIConcreteAnimatedTextSpacerAnimation;
  v12 = [(_UIConcreteAnimatedTextSpacerAnimation *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_animationInfo, a3);
    uint64_t v14 = [v10 copy];
    id updateBlock = v13->_updateBlock;
    v13->_id updateBlock = (id)v14;

    uint64_t v16 = [v11 copy];
    id finalizeBlock = v13->_finalizeBlock;
    v13->_id finalizeBlock = (id)v16;
  }
  return v13;
}

- (void)setProgress:(float)a3
{
  if (!self->_isFinalized)
  {
    self->_progress = a3;
    [(_UIAnimatedTextSpacerAnimationInfo *)self->_animationInfo startHeight];
    double v6 = v5;
    [(_UIAnimatedTextSpacerAnimationInfo *)self->_animationInfo endHeight];
    v7.n128_f64[0] = v6 + (v7.n128_f64[0] - v6) * a3;
    v8 = (void (*)(__n128))*((void *)self->_updateBlock + 2);
    v8(v7);
  }
}

- (void)finalize
{
  (*((void (**)(void))self->_finalizeBlock + 2))();
  id updateBlock = self->_updateBlock;
  self->_id updateBlock = 0;

  id finalizeBlock = self->_finalizeBlock;
  self->_id finalizeBlock = 0;

  self->_isFinalized = 1;
}

- (float)progress
{
  return self->_progress;
}

- (_UIAnimatedTextSpacerAnimationInfo)animationInfo
{
  return self->_animationInfo;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (id)finalizeBlock
{
  return self->_finalizeBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalizeBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_animationInfo, 0);
}

@end