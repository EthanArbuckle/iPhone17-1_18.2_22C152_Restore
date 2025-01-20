@interface dockCameraCaptureHandler
- (_TtC14dockaccessoryd24dockCameraCaptureHandler)init;
- (void)getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)getClientConfigurationUpdatesWithAppID:(id)a3 completion:(id)a4;
- (void)getConnectedWithCompletion:(id)a3;
- (void)getDockedWithCompletion:(id)a3;
- (void)getPairedWithCompletion:(id)a3;
- (void)getSystemTrackingEnabledWithAppID:(id)a3 completion:(id)a4;
- (void)getTrackingButtonStateWithCompletion:(id)a3;
- (void)selectSubjectResponseWithAppID:(id)a3 err:(id)a4 completion:(id)a5;
- (void)setRectOfInterestResponseWithAppID:(id)a3 err:(id)a4 completion:(id)a5;
- (void)updateCameraSessionWithSession:(id)a3 new:(BOOL)a4 completion:(id)a5;
- (void)updateTrackingSummaryDebugWithData:(id)a3 completion:(id)a4;
- (void)updateTrackingSummaryWithData:(id)a3 completion:(id)a4;
@end

@implementation dockCameraCaptureHandler

- (_TtC14dockaccessoryd24dockCameraCaptureHandler)init
{
  return (_TtC14dockaccessoryd24dockCameraCaptureHandler *)sub_1000BA13C();
}

- (void)getSystemTrackingEnabledWithAppID:(id)a3 completion:(id)a4
{
}

- (void)getClientConfigurationUpdatesWithAppID:(id)a3 completion:(id)a4
{
}

- (void)updateCameraSessionWithSession:(id)a3 new:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_1000BB478(v9, v5, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)updateTrackingSummaryWithData:(id)a3 completion:(id)a4
{
}

- (void)updateTrackingSummaryDebugWithData:(id)a3 completion:(id)a4
{
}

- (void)selectSubjectResponseWithAppID:(id)a3 err:(id)a4 completion:(id)a5
{
}

- (void)setRectOfInterestResponseWithAppID:(id)a3 err:(id)a4 completion:(id)a5
{
}

- (void)getPairedWithCompletion:(id)a3
{
}

- (void)getConnectedWithCompletion:(id)a3
{
}

- (void)getDockedWithCompletion:(id)a3
{
}

- (void)getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  _Block_copy(v7);
  id v8 = a3;
  id v9 = self;
  sub_1000BE348((uint64_t)v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);
}

- (void)getTrackingButtonStateWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd24dockCameraCaptureHandler_logger;
  uint64_t v3 = type metadata accessor for Logger();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end