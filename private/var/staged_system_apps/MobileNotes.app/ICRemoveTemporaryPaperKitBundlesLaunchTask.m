@interface ICRemoveTemporaryPaperKitBundlesLaunchTask
- (ICRemoveTemporaryPaperKitBundlesLaunchTask)init;
- (void)runOneTimeLaunchTask;
@end

@implementation ICRemoveTemporaryPaperKitBundlesLaunchTask

- (void)runOneTimeLaunchTask
{
  v2 = self;
  sub_1002A531C();
}

- (ICRemoveTemporaryPaperKitBundlesLaunchTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICRemoveTemporaryPaperKitBundlesLaunchTask *)&v3 init];
}

@end