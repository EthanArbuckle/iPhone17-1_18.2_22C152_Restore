@interface VLFScanningStateCameraMotionMonitor
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
@end

@implementation VLFScanningStateCameraMotionMonitor

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10035EEBC;
  v6[3] = &unk_1012E5D58;
  id v7 = a4;
  v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

@end