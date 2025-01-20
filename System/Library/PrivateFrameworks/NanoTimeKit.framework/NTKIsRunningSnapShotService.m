@interface NTKIsRunningSnapShotService
@end

@implementation NTKIsRunningSnapShotService

void ___NTKIsRunningSnapShotService_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  _NTKIsRunningSnapShotService_runningInSnapshotSerivce = [v1 isEqualToString:@"NTKFaceSnapshotService"];
}

@end