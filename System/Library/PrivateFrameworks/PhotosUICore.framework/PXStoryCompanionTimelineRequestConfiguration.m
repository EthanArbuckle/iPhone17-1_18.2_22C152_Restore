@interface PXStoryCompanionTimelineRequestConfiguration
- (CGSize)viewportSize;
- (OS_dispatch_queue)queue;
- (PHAssetCollection)assetCollection;
- (PXStoryCompanionTimelineRequestConfiguration)init;
- (PXStoryCompanionTimelineRequestConfiguration)initWithAssetCollection:(id)a3 viewportSize:(CGSize)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)songsProducerKind;
- (void)setAssetCollection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSongsProducerKind:(int64_t)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation PXStoryCompanionTimelineRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (void)setSongsProducerKind:(int64_t)a3
{
  self->_songsProducerKind = a3;
}

- (int64_t)songsProducerKind
{
  return self->_songsProducerKind;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAssetCollection:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PXStoryCompanionTimelineRequestConfiguration *)self assetCollection];
  [(PXStoryCompanionTimelineRequestConfiguration *)self viewportSize];
  v6 = objc_msgSend(v4, "initWithAssetCollection:viewportSize:", v5);

  v7 = [(PXStoryCompanionTimelineRequestConfiguration *)self queue];
  [v6 setQueue:v7];

  objc_msgSend(v6, "setSongsProducerKind:", -[PXStoryCompanionTimelineRequestConfiguration songsProducerKind](self, "songsProducerKind"));
  return v6;
}

- (PXStoryCompanionTimelineRequestConfiguration)initWithAssetCollection:(id)a3 viewportSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryCompanionTimelineRequestConfiguration;
  v9 = [(PXStoryCompanionTimelineRequestConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    v10->_viewportSize.CGFloat width = width;
    v10->_viewportSize.CGFloat height = height;
    objc_storeStrong((id *)&v10->_queue, MEMORY[0x1E4F14428]);
    v10->_songsProducerKind = 0;
  }

  return v10;
}

- (PXStoryCompanionTimelineRequestConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryCompanionTimelineRequestConfiguration.m", 17, @"%s is not available as initializer", "-[PXStoryCompanionTimelineRequestConfiguration init]");

  abort();
}

@end