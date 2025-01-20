@interface _PXStoryAnimationInfo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (NSString)animationIdentifier;
- (PXStoryAnimation)animation;
- (_PXStoryAnimationInfo)initWithAnimation:(id)a3 startTime:(id *)a4;
@end

@implementation _PXStoryAnimationInfo

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animation);
  objc_storeStrong((id *)&self->_animationIdentifier, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (PXStoryAnimation)animation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  return (PXStoryAnimation *)WeakRetained;
}

- (NSString)animationIdentifier
{
  return self->_animationIdentifier;
}

- (_PXStoryAnimationInfo)initWithAnimation:(id)a3 startTime:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXStoryAnimationInfo;
  v7 = [(_PXStoryAnimationInfo *)&v13 init];
  if (v7)
  {
    v8 = [v6 identifier];
    uint64_t v9 = [v8 copy];
    v10 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v9;

    objc_storeWeak((id *)v7 + 2, v6);
    int64_t var3 = a4->var3;
    *(_OWORD *)(v7 + 24) = *(_OWORD *)&a4->var0;
    *((void *)v7 + 5) = var3;
  }

  return (_PXStoryAnimationInfo *)v7;
}

@end