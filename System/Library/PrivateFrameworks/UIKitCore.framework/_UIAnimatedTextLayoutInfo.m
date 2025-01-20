@interface _UIAnimatedTextLayoutInfo
- (NSTextRange)animatingTextRange;
- (_UIAnimatedTextLayoutInfo)initWithAnimatedTextSpacer:(id)a3 animatingTextRange:(id)a4;
- (_UIAnimatedTextSpacer)animatedTextSpacer;
- (double)heightAccumulation;
- (void)setHeightAccumulation:(double)a3;
@end

@implementation _UIAnimatedTextLayoutInfo

- (_UIAnimatedTextLayoutInfo)initWithAnimatedTextSpacer:(id)a3 animatingTextRange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedTextLayoutInfo;
  v9 = [(_UIAnimatedTextLayoutInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_animatedTextSpacer, a3);
    objc_storeStrong((id *)&v10->_animatingTextRange, a4);
  }

  return v10;
}

- (_UIAnimatedTextSpacer)animatedTextSpacer
{
  return self->_animatedTextSpacer;
}

- (NSTextRange)animatingTextRange
{
  return self->_animatingTextRange;
}

- (double)heightAccumulation
{
  return self->_heightAccumulation;
}

- (void)setHeightAccumulation:(double)a3
{
  self->_heightAccumulation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatingTextRange, 0);
  objc_storeStrong((id *)&self->_animatedTextSpacer, 0);
}

@end