@interface PUIPosterSnapshotResult
- (BSInvalidatable)snapshotBundlePath;
- (PUIPosterSnapshotBundle)snapshotBundle;
- (PUIPosterSnapshotRequest)request;
- (PUIPosterSnapshotResult)initWithRequest:(id)a3 snapshotBundle:(id)a4 executeTime:(double)a5;
- (PUIPosterSnapshotResult)initWithSnapshotBundle:(id)a3;
- (PUIPosterSnapshotResult)initWithSnapshotterResult:(id)a3;
- (UIImage)backgroundLayerImage;
- (UIImage)compositeLayerImage;
- (UIImage)floatingLayerImage;
- (UIImage)foregroundLayerImage;
- (double)executionTime;
- (void)dealloc;
- (void)setBackgroundLayerImage:(id)a3;
- (void)setCompositeLayerImage:(id)a3;
- (void)setExecutionTime:(double)a3;
- (void)setFloatingLayerImage:(id)a3;
- (void)setForegroundLayerImage:(id)a3;
- (void)setSnapshotBundle:(id)a3;
- (void)setSnapshotBundlePath:(id)a3;
@end

@implementation PUIPosterSnapshotResult

- (PUIPosterSnapshotResult)initWithRequest:(id)a3 snapshotBundle:(id)a4 executeTime:(double)a5
{
  id v9 = a3;
  v10 = [(PUIPosterSnapshotResult *)self initWithSnapshotBundle:a4];
  v11 = v10;
  if (v10)
  {
    [(PUIPosterSnapshotResult *)v10 setExecutionTime:a5];
    objc_storeStrong((id *)&v11->_request, a3);
  }

  return v11;
}

- (PUIPosterSnapshotResult)initWithSnapshotterResult:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUIPosterSnapshotResult;
  v6 = [(PUIPosterSnapshotResult *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_snapshotterResult, a3);
    v8 = [v5 outputPath];
    uint64_t v9 = [v8 extendValidityForReason:@"PUIPosterSnapshotResult"];
    pathValidityExtension = v7->_pathValidityExtension;
    v7->_pathValidityExtension = (BSInvalidatable *)v9;

    uint64_t v11 = [v5 request];
    request = v7->_request;
    v7->_request = (PUIPosterSnapshotRequest *)v11;

    v13 = [v5 snapshotBundle];
    [(PUIPosterSnapshotResult *)v7 setSnapshotBundle:v13];

    [v5 executionTime];
    -[PUIPosterSnapshotResult setExecutionTime:](v7, "setExecutionTime:");
  }

  return v7;
}

- (PUIPosterSnapshotResult)initWithSnapshotBundle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUIPosterSnapshotResult;
  id v5 = [(PUIPosterSnapshotResult *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PUIPosterSnapshotResult *)v5 setSnapshotBundle:v4];
  }

  return v6;
}

- (UIImage)foregroundLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self snapshotBundle];
  v3 = [v2 foregroundSnapshot];

  return (UIImage *)v3;
}

- (UIImage)backgroundLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self snapshotBundle];
  v3 = [v2 backgroundSnapshot];

  return (UIImage *)v3;
}

- (UIImage)floatingLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self snapshotBundle];
  v3 = [v2 floatingSnapshot];

  return (UIImage *)v3;
}

- (UIImage)compositeLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self snapshotBundle];
  v3 = [v2 compositeSnapshot];

  return (UIImage *)v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotResult;
  [(PUIPosterSnapshotResult *)&v3 dealloc];
}

- (PUIPosterSnapshotRequest)request
{
  return self->_request;
}

- (PUIPosterSnapshotBundle)snapshotBundle
{
  return self->_snapshotBundle;
}

- (void)setSnapshotBundle:(id)a3
{
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (void)setFloatingLayerImage:(id)a3
{
}

- (void)setForegroundLayerImage:(id)a3
{
}

- (void)setBackgroundLayerImage:(id)a3
{
}

- (void)setCompositeLayerImage:(id)a3
{
}

- (BSInvalidatable)snapshotBundlePath
{
  return self->_snapshotBundlePath;
}

- (void)setSnapshotBundlePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBundlePath, 0);
  objc_storeStrong((id *)&self->_compositeLayerImage, 0);
  objc_storeStrong((id *)&self->_backgroundLayerImage, 0);
  objc_storeStrong((id *)&self->_foregroundLayerImage, 0);
  objc_storeStrong((id *)&self->_floatingLayerImage, 0);
  objc_storeStrong((id *)&self->_snapshotBundle, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotterResult, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

@end