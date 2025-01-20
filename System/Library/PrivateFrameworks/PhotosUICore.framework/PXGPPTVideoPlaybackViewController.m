@interface PXGPPTVideoPlaybackViewController
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result;
- (PXGPPTVideoPlaybackViewController)initWithAssetsDataSource:(id)a3;
- (PXGPPTVideoPlaybackViewController)initWithLayout:(id)a3;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXGPPTVideoPlaybackViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferSourcesByDisplayAsset, 0);
  objc_storeStrong((id *)&self->_pixelBufferSources_queue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_spriteColor, 0);
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 2;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  uint64_t v5 = [(PXAssetsDataSource *)self->_dataSource identifier];
  dataSource = self->_dataSource;
  uint64_t v9 = v5;
  long long v10 = xmmword_1AB359AA0;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = [(PXAssetsDataSource *)dataSource assetsInSectionIndexPath:&v9];
  return v7;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_spriteColor;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  char v4 = a4;
  v6 = objc_alloc_init(PXGGridLayout);
  [(PXGLayout *)v6 setContentSource:self];
  [(PXGGridLayout *)v6 setNumberOfColumns:self->_numberOfColumns];
  if (v4) {
    uint64_t v7 = 21;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v4) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 2;
  }
  [(PXGItemsLayout *)v6 setNumberOfItems:v7];
  [(PXGGridLayout *)v6 setMediaKind:v8];
  return v6;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double v5 = result.width * 0.25 * (double)((((a4 << 63 >> 63) & 0x14) + self->_numberOfColumns) / self->_numberOfColumns);
  result.height = v5;
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PXGPPTVideoPlaybackViewController;
  [(PXGPPTViewController *)&v5 viewDidLoad];
  v3 = objc_alloc_init(PXFileBackedUIMediaProvider);
  char v4 = [(PXGPPTViewController *)self gridView];
  [v4 registerAllTextureProvidersWithMediaProvider:v3 namedImagesBundle:0];
}

- (PXGPPTVideoPlaybackViewController)initWithLayout:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGPPTVideoPlaybackViewController.m", 53, @"%s is not available as initializer", "-[PXGPPTVideoPlaybackViewController initWithLayout:]");

  abort();
}

- (PXGPPTVideoPlaybackViewController)initWithAssetsDataSource:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(PXGStackLayout);
  v16.receiver = self;
  v16.super_class = (Class)PXGPPTVideoPlaybackViewController;
  uint64_t v7 = [(PXGPPTViewController *)&v16 initWithLayout:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    uint64_t v9 = [MEMORY[0x1E4FB1618] purpleColor];
    spriteColor = v8->_spriteColor;
    v8->_spriteColor = (UIColor *)v9;

    v8->_numberOfColumns = 4;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos._pixelBufferSources_queue", 0);
    pixelBufferSources_queue = v8->_pixelBufferSources_queue;
    v8->_pixelBufferSources_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pixelBufferSourcesByDisplayAsset = v8->_pixelBufferSourcesByDisplayAsset;
    v8->_pixelBufferSourcesByDisplayAsset = (NSMapTable *)v13;

    [(PXGStackLayout *)v6 setAxis:1];
    [(PXGStackLayout *)v6 setInterlayoutSpacing:10.0];
    -[PXGStackLayout insertSublayoutProvider:inRange:](v6, "insertSublayoutProvider:inRange:", v8, 0, 10);
  }

  return v8;
}

@end