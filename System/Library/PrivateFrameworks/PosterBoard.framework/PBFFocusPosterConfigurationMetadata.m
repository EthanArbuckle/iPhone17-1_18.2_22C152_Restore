@interface PBFFocusPosterConfigurationMetadata
- (BOOL)isChecked;
- (NSString)otherFocusDisplayName;
- (NSString)otherFocusSymbolImageName;
- (PBFPosterPreview)posterPreview;
- (UIImage)cachedSnapshot;
- (void)setCachedSnapshot:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setOtherFocusDisplayName:(id)a3;
- (void)setOtherFocusSymbolImageName:(id)a3;
- (void)setPosterPreview:(id)a3;
@end

@implementation PBFFocusPosterConfigurationMetadata

- (BOOL)isChecked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

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

- (NSString)otherFocusSymbolImageName
{
  return self->_otherFocusSymbolImageName;
}

- (void)setOtherFocusSymbolImageName:(id)a3
{
}

- (NSString)otherFocusDisplayName
{
  return self->_otherFocusDisplayName;
}

- (void)setOtherFocusDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherFocusDisplayName, 0);
  objc_storeStrong((id *)&self->_otherFocusSymbolImageName, 0);
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_storeStrong((id *)&self->_cachedSnapshot, 0);
}

@end