@interface TSDCachedGestureTargetHolder
- (CRLGestureTarget)weakCachedGestureTarget;
- (TSDCachedGestureTargetHolder)initWithTarget:(id)a3;
- (void)setWeakCachedGestureTarget:(id)a3;
@end

@implementation TSDCachedGestureTargetHolder

- (TSDCachedGestureTargetHolder)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSDCachedGestureTargetHolder;
  v5 = [(TSDCachedGestureTargetHolder *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mWeakCachedGestureTarget, v4);
  }

  return v6;
}

- (CRLGestureTarget)weakCachedGestureTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWeakCachedGestureTarget);

  return (CRLGestureTarget *)WeakRetained;
}

- (void)setWeakCachedGestureTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end