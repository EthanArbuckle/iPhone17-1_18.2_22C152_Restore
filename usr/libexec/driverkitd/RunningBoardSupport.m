@interface RunningBoardSupport
- (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5;
@end

@implementation RunningBoardSupport

- (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  return +[RBSProcessIdentity identityForDextWithServerName:a3 tagString:a4 containingAppBundleID:a5];
}

@end