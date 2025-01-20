@interface TSDSimpleTileProvider
- (BOOL)canTargetDrawInParallel;
- (BOOL)isTargetOpaque;
- (SEL)action;
- (void)drawTargetInLayer:(id)a3 context:(CGContext *)a4;
- (void)setAction:(SEL)a3;
@end

@implementation TSDSimpleTileProvider

- (BOOL)isTargetOpaque
{
  return 0;
}

- (BOOL)canTargetDrawInParallel
{
  return 1;
}

- (void)drawTargetInLayer:(id)a3 context:(CGContext *)a4
{
  mTarget = self->super.mTarget;
  v6 = [(TSDSimpleTileProvider *)self action];
  objc_msgSend(mTarget, v6, a4);
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
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->mAction = v3;
}

@end