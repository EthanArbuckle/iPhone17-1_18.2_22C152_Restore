@interface WBSBookmarkFolderTouchIconConfiguration
- (BOOL)fillIconWithBackgroundColor;
- (CGSize)shadowOffset;
- (UIColor)backgroundColorForEmptySlots;
- (UIColor)colorForDarkeningThumbnailBackground;
- (double)shadowBlurRadius;
- (double)thumbnailIconInnerMarginScaleFactor;
- (double)thumbnailIconOuterMarginScaleFactor;
- (double)thumbnailIconScaleFactor;
- (id)initFor2x2Layout;
- (id)initFor3x3Layout;
- (id)initForTabGroup;
- (unint64_t)maximumNumberOfThumbnailIcons;
- (unint64_t)maximumNumberOfThumbnailRows;
- (unint64_t)maximumNumberOfThumbnailsPerRow;
- (void)_commonWBSBookmarkFolderIconConfigurationInit;
@end

@implementation WBSBookmarkFolderTouchIconConfiguration

- (id)initFor3x3Layout
{
  v8.receiver = self;
  v8.super_class = (Class)WBSBookmarkFolderTouchIconConfiguration;
  v2 = [(WBSBookmarkFolderTouchIconConfiguration *)&v8 init];
  v3 = (double *)v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_maximumNumberOfThumbnailsPerRow = vdupq_n_s64(3uLL);
    int v4 = [MEMORY[0x1E4F98318] is2024FavoritesEnabled];
    double v5 = 0.24;
    if (v4) {
      double v5 = 0.25;
    }
    v3[5] = v5;
    [v3 _commonWBSBookmarkFolderIconConfigurationInit];
    v6 = v3;
  }

  return v3;
}

- (id)initFor2x2Layout
{
  v6.receiver = self;
  v6.super_class = (Class)WBSBookmarkFolderTouchIconConfiguration;
  v2 = [(WBSBookmarkFolderTouchIconConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_maximumNumberOfThumbnailsPerRow = vdupq_n_s64(2uLL);
    v2->_thumbnailIconScaleFactor = 0.35;
    [(WBSBookmarkFolderTouchIconConfiguration *)v2 _commonWBSBookmarkFolderIconConfigurationInit];
    int v4 = v3;
  }

  return v3;
}

- (id)initForTabGroup
{
  v2 = [(WBSBookmarkFolderTouchIconConfiguration *)self initFor2x2Layout];
  v3 = v2;
  if (v2)
  {
    v2[8] = 1;
    uint64_t v4 = tertiaryGroupedBackgroundColor();
    double v5 = (void *)v3[9];
    v3[9] = v4;

    uint64_t v6 = tertiaryGroupedBackgroundColor();
    v7 = (void *)v3[10];
    v3[10] = v6;

    objc_super v8 = v3;
  }

  return v3;
}

- (void)_commonWBSBookmarkFolderIconConfigurationInit
{
  unint64_t maximumNumberOfThumbnailsPerRow = self->_maximumNumberOfThumbnailsPerRow;
  self->_maximumNumberOfThumbnailIcons = self->_maximumNumberOfThumbnailRows * maximumNumberOfThumbnailsPerRow;
  self->_thumbnailIconOuterMarginScaleFactor = 0.1;
  double thumbnailIconScaleFactor = self->_thumbnailIconScaleFactor;
  self->_shadowOffset.width = 0.0;
  self->_shadowOffset.height = -thumbnailIconScaleFactor;
  self->_thumbnailIconInnerMarginScaleFactor = (0.8 - thumbnailIconScaleFactor * (double)maximumNumberOfThumbnailsPerRow)
                                             / (double)(maximumNumberOfThumbnailsPerRow - 1);
  self->_shadowBlurRadius = thumbnailIconScaleFactor + thumbnailIconScaleFactor;
}

- (unint64_t)maximumNumberOfThumbnailsPerRow
{
  return self->_maximumNumberOfThumbnailsPerRow;
}

- (unint64_t)maximumNumberOfThumbnailRows
{
  return self->_maximumNumberOfThumbnailRows;
}

- (unint64_t)maximumNumberOfThumbnailIcons
{
  return self->_maximumNumberOfThumbnailIcons;
}

- (double)thumbnailIconScaleFactor
{
  return self->_thumbnailIconScaleFactor;
}

- (double)thumbnailIconOuterMarginScaleFactor
{
  return self->_thumbnailIconOuterMarginScaleFactor;
}

- (double)thumbnailIconInnerMarginScaleFactor
{
  return self->_thumbnailIconInnerMarginScaleFactor;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (BOOL)fillIconWithBackgroundColor
{
  return self->_fillIconWithBackgroundColor;
}

- (UIColor)backgroundColorForEmptySlots
{
  return self->_backgroundColorForEmptySlots;
}

- (UIColor)colorForDarkeningThumbnailBackground
{
  return self->_colorForDarkeningThumbnailBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorForDarkeningThumbnailBackground, 0);
  objc_storeStrong((id *)&self->_backgroundColorForEmptySlots, 0);
}

@end