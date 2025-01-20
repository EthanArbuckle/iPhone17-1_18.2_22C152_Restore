@interface AETouchOutsideViewGestureRecognizerTarget
- (BOOL)isEqual:(id)a3;
- (SEL)action;
- (id)target;
- (unint64_t)hash;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation AETouchOutsideViewGestureRecognizerTarget

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(AETouchOutsideViewGestureRecognizerTarget *)self target];
    v6 = [v4 target];
    if (v5 == v6)
    {
      v8 = [(AETouchOutsideViewGestureRecognizerTarget *)self action];
      BOOL v7 = v8 == [v4 action];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AETouchOutsideViewGestureRecognizerTarget *)self target];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->mTarget);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->mAction) {
    return self->mAction;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->mAction = v3;
}

- (void).cxx_destruct
{
}

@end