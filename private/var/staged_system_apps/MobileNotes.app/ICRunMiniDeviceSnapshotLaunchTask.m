@interface ICRunMiniDeviceSnapshotLaunchTask
- (void)runLaunchTask;
@end

@implementation ICRunMiniDeviceSnapshotLaunchTask

- (void)runLaunchTask
{
  id v2 = +[ICNASnapshotReporter sharedReporter];
  [v2 submitMiniSnapshot];
}

@end