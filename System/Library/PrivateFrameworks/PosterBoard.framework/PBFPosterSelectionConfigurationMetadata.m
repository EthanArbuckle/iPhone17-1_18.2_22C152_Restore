@interface PBFPosterSelectionConfigurationMetadata
- (PBFPosterPreview)posterPreview;
- (UIImage)cachedSnapshot;
- (void)setCachedSnapshot:(id)a3;
- (void)setPosterPreview:(id)a3;
@end

@implementation PBFPosterSelectionConfigurationMetadata

- (UIImage)cachedSnapshot
{
  return self->_cachedSnapshot;
}

- (void)setCachedSnapshot:(id)a3
{
}

- (PBFPosterPreview)posterPreview
{
  return self->_posterPreview;
}

- (void)setPosterPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_storeStrong((id *)&self->_cachedSnapshot, 0);
}

@end