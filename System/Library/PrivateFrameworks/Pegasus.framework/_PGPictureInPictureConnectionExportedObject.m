@interface _PGPictureInPictureConnectionExportedObject
- (_PGPictureInPictureConnectionExportedObject)initWithPictureInPictureProxy:(id)a3;
- (void)actionButtonTapped;
- (void)beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)endTwoStagePictureInPictureStopWithCompletionBlock:(id)a3;
- (void)handleCommand:(id)a3;
- (void)hostedWindowSizeChangeBegan;
- (void)hostedWindowSizeChangeEnded;
- (void)pagingSkipByNumberOfPages:(int64_t)a3;
- (void)pictureInPictureCancelRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)pictureInPictureInvalidated;
- (void)pictureInPictureStartRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)pictureInPictureStopRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setResourcesUsageReductionReasons:(unint64_t)a3;
- (void)setStashedOrUnderLock:(BOOL)a3;
- (void)updateHostedWindowSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5 synchronizationFence:(id)a6;
- (void)updatePictureInPicturePossible:(BOOL)a3;
@end

@implementation _PGPictureInPictureConnectionExportedObject

- (_PGPictureInPictureConnectionExportedObject)initWithPictureInPictureProxy:(id)a3
{
  id v4 = a3;
  v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  v9.receiver = self;
  v9.super_class = (Class)_PGPictureInPictureConnectionExportedObject;
  v6 = [(_PGPictureInPictureConnectionExportedObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_pictureInPictureProxy, v4);
  }

  return v7;
}

- (void)dealloc
{
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  v4.receiver = self;
  v4.super_class = (Class)_PGPictureInPictureConnectionExportedObject;
  [(_PGPictureInPictureConnectionExportedObject *)&v4 dealloc];
}

- (void)pictureInPictureStartRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  [WeakRetained pictureInPictureStartRequestedAnimated:v4 withCompletionHandler:v6];
}

- (void)pictureInPictureStopRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  [WeakRetained pictureInPictureStopRequestedAnimated:v4 withCompletionHandler:v6];
}

- (void)beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:(id)a3
{
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  [WeakRetained beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:v4];
}

- (void)endTwoStagePictureInPictureStopWithCompletionBlock:(id)a3
{
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  [WeakRetained endTwoStagePictureInPictureStopWithCompletionBlock:v4];
}

- (void)pictureInPictureCancelRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  [WeakRetained pictureInPictureCancelRequestedAnimated:v4 withCompletionHandler:v6];
}

- (void)updatePictureInPicturePossible:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained updatePictureInPicturePossible:v3];
}

- (void)pictureInPictureInvalidated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained pictureInPictureInvalidated];
}

- (void)pagingSkipByNumberOfPages:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained pagingSkipByNumberOfPages:a3];
}

- (void)updateHostedWindowSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5 synchronizationFence:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "updateHostedWindowSize:animationType:initialSpringVelocity:synchronizationFence:", a4, v11, width, height, a5);
}

- (void)hostedWindowSizeChangeBegan
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained hostedWindowSizeChangeBegan];
}

- (void)hostedWindowSizeChangeEnded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained hostedWindowSizeChangeEnded];
}

- (void)actionButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained actionButtonTapped];
}

- (void)setStashedOrUnderLock:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained setStashedOrUnderLock:v3];
}

- (void)setResourcesUsageReductionReasons:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  [WeakRetained setResourcesUsageReductionReasons:a3];
}

- (void)handleCommand:(id)a3
{
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  [WeakRetained handleCommand:v4];
}

- (void).cxx_destruct
{
}

@end