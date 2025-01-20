@interface SILFlipBookTransitionPoint(SILFlipBookTransitionPointObjCAdditions)
- (const)end;
@end

@implementation SILFlipBookTransitionPoint(SILFlipBookTransitionPointObjCAdditions)

- (const)end
{
  v3 = [(SILFlipBookTransitionPoint *)self ranges];
  return &v3[[(SILFlipBookTransitionPoint *)self rangesCount]];
}

@end