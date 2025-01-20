@interface PFLLayoutConfiguration
- (BOOL)maskIsInverted;
- (BOOL)usesMask;
- (CGRect)acceptableCropRect;
- (CGRect)preferredCropRect;
- (CGRect)timeRect;
- (CGRect)timeRectInAsset;
- (CGRect)visibleRect;
- (CGSize)assetSize;
- (NSArray)faceRects;
- (NSArray)petRects;
- (NSString)assetId;
- (PFLLayoutConfiguration)initWithAsset:(id)a3 timePosition:(unint64_t)a4 segmentationData:(id)a5 coreLayout:(id)a6;
- (PIParallaxColorAnalysis)colorAnalysis;
- (__CVBuffer)foregroundMask;
- (double)cropScore;
- (double)layoutScore;
- (id)description;
- (unint64_t)timePosition;
- (void)dealloc;
@end

@implementation PFLLayoutConfiguration

- (PFLLayoutConfiguration)initWithAsset:(id)a3 timePosition:(unint64_t)a4 segmentationData:(id)a5 coreLayout:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v56.receiver = self;
  v56.super_class = (Class)PFLLayoutConfiguration;
  v13 = [(PFLLayoutConfiguration *)&v56 init];
  if (v13)
  {
    uint64_t v14 = [v10 localIdentifier];
    assetId = v13->_assetId;
    v13->_assetId = (NSString *)v14;

    v16 = (__CVBuffer *)[v11 segmentationBuffer];
    v13->_foregroundMask = v16;
    CVPixelBufferRetain(v16);
    v13->_maskIsInverted = (unint64_t)([v11 classification] - 3) < 2;
    CGFloat v17 = (double)(unint64_t)[v10 pixelWidth];
    unint64_t v18 = [v10 pixelHeight];
    v13->_assetSize.width = v17;
    v13->_assetSize.height = (double)v18;
    [v12 visibleRect];
    v13->_visibleRect.origin.x = v19;
    v13->_visibleRect.origin.y = v20;
    v13->_visibleRect.size.width = v21;
    v13->_visibleRect.size.height = v22;
    v13->_timePosition = a4;
    PFCRectForTimePosition();
    v13->_timeRect.origin.x = v23;
    v13->_timeRect.origin.y = v24;
    v13->_timeRect.size.width = v25;
    v13->_timeRect.size.height = v26;
    uint64_t v27 = [v11 colorAnalysis];
    colorAnalysis = v13->_colorAnalysis;
    v13->_colorAnalysis = (PIParallaxColorAnalysis *)v27;

    [v12 cropScore];
    v13->_cropScore = v29;
    [v12 layoutScore];
    v13->_layoutScore = v30;
    v13->_usesMask = [v12 usesMask];
    v31 = [v11 regions];
    v32 = [v31 faceRegions];
    uint64_t v33 = flipYNormalizedRects(v32);
    faceRects = v13->_faceRects;
    v13->_faceRects = (NSArray *)v33;

    v35 = [v31 petRegions];
    uint64_t v36 = flipYNormalizedRects(v35);
    petRects = v13->_petRects;
    v13->_petRects = (NSArray *)v36;

    [v31 acceptableCropRect];
    v13->_acceptableCropRect.origin.x = flipYNormalizedRect(v38, v39, v40, v41);
    v13->_acceptableCropRect.origin.y = v42;
    v13->_acceptableCropRect.size.width = v43;
    v13->_acceptableCropRect.size.height = v44;
    [v31 preferredCropRect];
    v13->_preferredCropRect.origin.x = flipYNormalizedRect(v45, v46, v47, v48);
    v13->_preferredCropRect.origin.y = v49;
    v13->_preferredCropRect.size.width = v50;
    v13->_preferredCropRect.size.height = v51;
    v13->_timeRectInAsset.origin.x = renormalizeRect(v13->_timeRect.origin.x, v13->_timeRect.origin.y, v13->_timeRect.size.width, v13->_timeRect.size.height, v13->_visibleRect.origin.x, v13->_visibleRect.origin.y, v13->_visibleRect.size.width, v13->_visibleRect.size.height);
    v13->_timeRectInAsset.origin.y = v52;
    v13->_timeRectInAsset.size.width = v53;
    v13->_timeRectInAsset.size.height = v54;
  }
  return v13;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_foregroundMask);
  v3.receiver = self;
  v3.super_class = (Class)PFLLayoutConfiguration;
  [(PFLLayoutConfiguration *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  assetId = self->_assetId;
  uint64_t width = (uint64_t)self->_assetSize.width;
  uint64_t height = (uint64_t)self->_assetSize.height;
  uint64_t v7 = _rectAsString(self->_visibleRect.origin.x, self->_visibleRect.origin.y, self->_visibleRect.size.width, self->_visibleRect.size.height);
  v8 = (void *)v7;
  if (self->_usesMask) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  id v10 = [v3 stringWithFormat:@"[PFLLayoutConfiguration asset:%@, assetSize:%ldx%ld, visbleRect:%@, timePosition:%ld, score:%.3f, usesMask:%s]", assetId, width, height, v7, self->_timePosition, *(void *)&self->_cropScore, v9];

  return v10;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (__CVBuffer)foregroundMask
{
  return self->_foregroundMask;
}

- (BOOL)maskIsInverted
{
  return self->_maskIsInverted;
}

- (CGSize)assetSize
{
  double width = self->_assetSize.width;
  double height = self->_assetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)timeRect
{
  double x = self->_timeRect.origin.x;
  double y = self->_timeRect.origin.y;
  double width = self->_timeRect.size.width;
  double height = self->_timeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)timePosition
{
  return self->_timePosition;
}

- (PIParallaxColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (BOOL)usesMask
{
  return self->_usesMask;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (NSArray)faceRects
{
  return self->_faceRects;
}

- (NSArray)petRects
{
  return self->_petRects;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableCropRect.origin.x;
  double y = self->_acceptableCropRect.origin.y;
  double width = self->_acceptableCropRect.size.width;
  double height = self->_acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)timeRectInAsset
{
  double x = self->_timeRectInAsset.origin.x;
  double y = self->_timeRectInAsset.origin.y;
  double width = self->_timeRectInAsset.size.width;
  double height = self->_timeRectInAsset.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_petRects, 0);
  objc_storeStrong((id *)&self->_faceRects, 0);
  objc_storeStrong((id *)&self->_colorAnalysis, 0);
}

@end