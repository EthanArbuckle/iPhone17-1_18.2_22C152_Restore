@interface PXStoryExportFullSizePlayerAspectRatio
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (PXStoryExportFullSizePlayerAspectRatio)initWithSize:(CGSize)a3 scale:(double)a4;
- (double)scale;
- (id)adjustedForOrientation:(id)a3;
- (id)localizedTitle;
- (unint64_t)hash;
@end

@implementation PXStoryExportFullSizePlayerAspectRatio

- (double)scale
{
  return self->_scale;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)PXStoryExportFullSizePlayerAspectRatio;
  unint64_t v3 = [(PXStoryExportAspectRatio *)&v9 hash];
  [(PXStoryExportFullSizePlayerAspectRatio *)self size];
  uint64_t v6 = v3 ^ (2 * (uint64_t)v4) ^ (4 * (uint64_t)v5);
  [(PXStoryExportFullSizePlayerAspectRatio *)self scale];
  return v6 ^ (8 * (uint64_t)v7);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXStoryExportFullSizePlayerAspectRatio *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(PXStoryExportFullSizePlayerAspectRatio *)self size];
      [(PXStoryExportFullSizePlayerAspectRatio *)v5 size];
      PXSizeApproximatelyEqualToSize();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)localizedTitle
{
  return PXLocalizedStringFromTable(@"PHOTOS_MEMORIES_EXPORT_ASPECT_RATIO_OPTION_MATCH_FULL_SIZE_PLAYER", @"PhotosUICore");
}

- (id)adjustedForOrientation:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryExportAspectRatio *)self orientation];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    double v7 = self;
  }
  else
  {
    v8 = [(id)objc_opt_class() pickableAspectRatiosForOrientation:v4 fullSizePlayerAspect:0];
    double v7 = [v8 firstObject];
  }
  return v7;
}

- (PXStoryExportFullSizePlayerAspectRatio)initWithSize:(CGSize)a3 scale:(double)a4
{
}

@end