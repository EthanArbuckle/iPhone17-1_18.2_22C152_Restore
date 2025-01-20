@interface PIPosterLayoutRequest
- (BOOL)shouldComputeAllScores;
- (BOOL)shouldConsiderHeadroom;
- (BOOL)shouldConstrainLayoutToBounds;
- (CGRect)normalizedLayoutBounds;
- (NUImageBuffer)segmentationConfidenceMap;
- (NUImageBuffer)segmentationMatte;
- (PFParallaxAssetRegions)layoutRegions;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (PIPosterLayoutProvider)layoutProvider;
- (PIPosterLayoutRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (unint64_t)segmentationClassification;
- (void)setLayoutConfiguration:(id)a3;
- (void)setLayoutProvider:(id)a3;
- (void)setLayoutRegions:(id)a3;
- (void)setNormalizedLayoutBounds:(CGRect)a3;
- (void)setSegmentationClassification:(unint64_t)a3;
- (void)setSegmentationConfidenceMap:(id)a3;
- (void)setSegmentationMatte:(id)a3;
- (void)setShouldComputeAllScores:(BOOL)a3;
- (void)setShouldConsiderHeadroom:(BOOL)a3;
- (void)setShouldConstrainLayoutToBounds:(BOOL)a3;
@end

@implementation PIPosterLayoutRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceMap, 0);
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
  objc_storeStrong((id *)&self->_layoutRegions, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
}

- (void)setLayoutProvider:(id)a3
{
}

- (PIPosterLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (void)setShouldConsiderHeadroom:(BOOL)a3
{
  self->_shouldConsiderHeadroom = a3;
}

- (BOOL)shouldConsiderHeadroom
{
  return self->_shouldConsiderHeadroom;
}

- (void)setShouldComputeAllScores:(BOOL)a3
{
  self->_shouldComputeAllScores = a3;
}

- (BOOL)shouldComputeAllScores
{
  return self->_shouldComputeAllScores;
}

- (void)setSegmentationClassification:(unint64_t)a3
{
  self->_segmentationClassification = a3;
}

- (unint64_t)segmentationClassification
{
  return self->_segmentationClassification;
}

- (void)setSegmentationConfidenceMap:(id)a3
{
}

- (NUImageBuffer)segmentationConfidenceMap
{
  return self->_segmentationConfidenceMap;
}

- (void)setSegmentationMatte:(id)a3
{
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (void)setNormalizedLayoutBounds:(CGRect)a3
{
  self->_normalizedLayoutBounds = a3;
}

- (CGRect)normalizedLayoutBounds
{
  double x = self->_normalizedLayoutBounds.origin.x;
  double y = self->_normalizedLayoutBounds.origin.y;
  double width = self->_normalizedLayoutBounds.size.width;
  double height = self->_normalizedLayoutBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setShouldConstrainLayoutToBounds:(BOOL)a3
{
  self->_shouldConstrainLayoutToBounds = a3;
}

- (BOOL)shouldConstrainLayoutToBounds
{
  return self->_shouldConstrainLayoutToBounds;
}

- (void)setLayoutRegions:(id)a3
{
}

- (PFParallaxAssetRegions)layoutRegions
{
  return self->_layoutRegions;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [_PIPosterLayoutJob alloc];
  return [(_PIPosterLayoutJob *)v3 initWithPosterLayoutRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PIPosterLayoutRequest;
  v4 = [(NURenderRequest *)&v20 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIPosterLayoutRequest *)self layoutConfiguration];
    v6 = (void *)v4[20];
    v4[20] = v5;

    uint64_t v7 = [(PIPosterLayoutRequest *)self layoutRegions];
    v8 = (void *)v4[21];
    v4[21] = v7;

    uint64_t v9 = [(PIPosterLayoutRequest *)self segmentationMatte];
    v10 = (void *)v4[22];
    v4[22] = v9;

    uint64_t v11 = [(PIPosterLayoutRequest *)self segmentationConfidenceMap];
    v12 = (void *)v4[23];
    v4[23] = v11;

    v4[24] = [(PIPosterLayoutRequest *)self segmentationClassification];
    *((unsigned char *)v4 + 152) = [(PIPosterLayoutRequest *)self shouldConstrainLayoutToBounds];
    [(PIPosterLayoutRequest *)self normalizedLayoutBounds];
    v4[26] = v13;
    v4[27] = v14;
    v4[28] = v15;
    v4[29] = v16;
    *((unsigned char *)v4 + 153) = [(PIPosterLayoutRequest *)self shouldComputeAllScores];
    *((unsigned char *)v4 + 154) = [(PIPosterLayoutRequest *)self shouldConsiderHeadroom];
    uint64_t v17 = [(PIPosterLayoutRequest *)self layoutProvider];
    v18 = (void *)v4[25];
    v4[25] = v17;
  }
  return v4;
}

- (PIPosterLayoutRequest)initWithComposition:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PIPosterLayoutRequest;
  CGRect result = [(NURenderRequest *)&v5 initWithComposition:a3];
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  result->_normalizedLayoutBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  result->_normalizedLayoutBounds.size = v4;
  result->_shouldComputeAllScores = 1;
  return result;
}

@end