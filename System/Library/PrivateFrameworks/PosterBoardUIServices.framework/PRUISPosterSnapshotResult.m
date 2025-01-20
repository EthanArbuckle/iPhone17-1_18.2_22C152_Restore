@interface PRUISPosterSnapshotResult
- (PRPosterSnapshotBundle)snapshotBundle;
- (PRUISPosterSnapshotBundle)posterSnapshotBundle;
- (PRUISPosterSnapshotResult)initWithPUIPosterSnapshotResult:(id)a3;
- (UIImage)backgroundLayerImage;
- (UIImage)compositeLayerImage;
- (UIImage)floatingLayerImage;
- (UIImage)foregroundLayerImage;
- (double)executionTime;
@end

@implementation PRUISPosterSnapshotResult

- (PRUISPosterSnapshotResult)initWithPUIPosterSnapshotResult:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PRUISPosterSnapshotResult;
    v6 = [(PRUISPosterSnapshotResult *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_underlyingResult, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PRPosterSnapshotBundle)snapshotBundle
{
  v2 = (void *)MEMORY[0x263F5F510];
  v3 = [(PUIPosterSnapshotResult *)self->_underlyingResult snapshotBundle];
  v4 = [v2 snapshotBundleWithPUIPosterSnapshotBundle:v3];

  return (PRPosterSnapshotBundle *)v4;
}

- (PRUISPosterSnapshotBundle)posterSnapshotBundle
{
  v2 = [(PUIPosterSnapshotResult *)self->_underlyingResult snapshotBundle];
  v3 = +[PRUISPosterSnapshotBundle snapshotBundleWithPUIPosterSnapshotBundle:v2];

  return (PRUISPosterSnapshotBundle *)v3;
}

- (UIImage)floatingLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self->_underlyingResult snapshotBundle];
  v3 = [v2 floatingSnapshot];

  return (UIImage *)v3;
}

- (UIImage)foregroundLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self->_underlyingResult snapshotBundle];
  v3 = [v2 foregroundSnapshot];

  return (UIImage *)v3;
}

- (UIImage)backgroundLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self->_underlyingResult snapshotBundle];
  v3 = [v2 backgroundSnapshot];

  return (UIImage *)v3;
}

- (UIImage)compositeLayerImage
{
  v2 = [(PUIPosterSnapshotResult *)self->_underlyingResult snapshotBundle];
  v3 = [v2 compositeSnapshot];

  return (UIImage *)v3;
}

- (double)executionTime
{
  [(PUIPosterSnapshotResult *)self->_underlyingResult executionTime];
  return result;
}

- (void).cxx_destruct
{
}

@end