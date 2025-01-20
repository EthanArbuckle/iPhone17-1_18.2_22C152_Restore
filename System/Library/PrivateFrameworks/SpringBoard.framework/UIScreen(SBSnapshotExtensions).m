@interface UIScreen(SBSnapshotExtensions)
- (id)sb_snapshotViewImmediatelyFramedForPortrait;
@end

@implementation UIScreen(SBSnapshotExtensions)

- (id)sb_snapshotViewImmediatelyFramedForPortrait
{
  [(id)SBApp pushTransientActiveInterfaceOrientation:1 forReason:@"SBPortraitFramedSnapshot"];
  v2 = [a1 snapshotViewAfterScreenUpdates:0];
  [(id)SBApp popTransientActiveInterfaceOrientationForReason:@"SBPortraitFramedSnapshot"];
  return v2;
}

@end