@interface PXStoryExportVideoOptions
- (BOOL)prefersExportLayoutMatchesPlayback;
- (CGSize)resolution;
- (CGSize)resolutionInPixels;
- (NSNumber)averageBitratePerSecond;
- (PXExtendedTraitCollectionSnapshot)fullSizePlayerExtendedTraitCollectionSnapshot;
- (PXStoryExportVideoOptions)init;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)codec;
- (unint64_t)frameRate;
- (void)setAverageBitratePerSecond:(id)a3;
- (void)setCodec:(unint64_t)a3;
- (void)setFrameRate:(unint64_t)a3;
- (void)setFullSizePlayerExtendedTraitCollectionSnapshot:(id)a3;
- (void)setPrefersExportLayoutMatchesPlayback:(BOOL)a3;
- (void)setResolution:(CGSize)a3;
- (void)setScale:(double)a3;
@end

@implementation PXStoryExportVideoOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageBitratePerSecond, 0);
  objc_storeStrong((id *)&self->_fullSizePlayerExtendedTraitCollectionSnapshot, 0);
}

- (void)setCodec:(unint64_t)a3
{
  self->_codec = a3;
}

- (unint64_t)codec
{
  return self->_codec;
}

- (void)setFrameRate:(unint64_t)a3
{
  self->_frameRate = a3;
}

- (unint64_t)frameRate
{
  return self->_frameRate;
}

- (void)setAverageBitratePerSecond:(id)a3
{
}

- (NSNumber)averageBitratePerSecond
{
  return self->_averageBitratePerSecond;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setFullSizePlayerExtendedTraitCollectionSnapshot:(id)a3
{
}

- (PXExtendedTraitCollectionSnapshot)fullSizePlayerExtendedTraitCollectionSnapshot
{
  return self->_fullSizePlayerExtendedTraitCollectionSnapshot;
}

- (void)setPrefersExportLayoutMatchesPlayback:(BOOL)a3
{
  self->_prefersExportLayoutMatchesPlayback = a3;
}

- (BOOL)prefersExportLayoutMatchesPlayback
{
  return self->_prefersExportLayoutMatchesPlayback;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)resolutionInPixels
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  *((void *)v4 + 5) = self->_frameRate;
  *(CGSize *)(v4 + 56) = self->_resolution;
  *((void *)v4 + 3) = *(void *)&self->_scale;
  *((void *)v4 + 6) = self->_codec;
  v4[8] = self->_prefersExportLayoutMatchesPlayback;
  objc_storeStrong((id *)v4 + 2, self->_fullSizePlayerExtendedTraitCollectionSnapshot);
  uint64_t v5 = [(NSNumber *)self->_averageBitratePerSecond copy];
  v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  return v4;
}

- (PXStoryExportVideoOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryExportVideoOptions;
  CGSize result = [(PXStoryExportVideoOptions *)&v3 init];
  if (result)
  {
    result->_resolution = (CGSize)xmmword_1AB359CC0;
    result->_scale = 1.0;
    *(_OWORD *)&result->_frameRate = xmmword_1AB359CD0;
  }
  return result;
}

@end