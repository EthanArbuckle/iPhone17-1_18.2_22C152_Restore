@interface PXDiscoveryFeedGenerationOptions
- (BOOL)usePhotoAnalysisdThroughXPC;
- (PXDiscoveryFeedGenerationOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)discoveryRankingMode;
- (void)setDiscoveryRankingMode:(unint64_t)a3;
- (void)setUsePhotoAnalysisdThroughXPC:(BOOL)a3;
@end

@implementation PXDiscoveryFeedGenerationOptions

- (void)setDiscoveryRankingMode:(unint64_t)a3
{
  self->_discoveryRankingMode = a3;
}

- (unint64_t)discoveryRankingMode
{
  return self->_discoveryRankingMode;
}

- (void)setUsePhotoAnalysisdThroughXPC:(BOOL)a3
{
  self->_usePhotoAnalysisdThroughXPC = a3;
}

- (BOOL)usePhotoAnalysisdThroughXPC
{
  return self->_usePhotoAnalysisdThroughXPC;
}

- (id)dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F8AE80];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXDiscoveryFeedGenerationOptions discoveryRankingMode](self, "discoveryRankingMode"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_usePhotoAnalysisdThroughXPC;
  *((void *)result + 2) = self->_discoveryRankingMode;
  return result;
}

- (PXDiscoveryFeedGenerationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXDiscoveryFeedGenerationOptions;
  id result = [(PXDiscoveryFeedGenerationOptions *)&v3 init];
  if (result)
  {
    result->_usePhotoAnalysisdThroughXPC = 1;
    result->_discoveryRankingMode = 0;
  }
  return result;
}

@end