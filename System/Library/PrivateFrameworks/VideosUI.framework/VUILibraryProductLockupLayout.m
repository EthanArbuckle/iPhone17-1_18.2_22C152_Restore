@interface VUILibraryProductLockupLayout
- (CGSize)coverArtImageSize;
- (VUILibraryProductLockupLayout)initWithLayoutType:(int64_t)a3 entityType:(id)a4;
- (VUIMediaEntityType)entityType;
- (VUITextLayout)descriptionTextLayout;
- (VUITextLayout)playLabelTextLayout;
- (VUITextLayout)subtitleTextLayout;
- (double)buttonModuleTopMarginForWindowWidth:(double)a3;
- (double)contentDescriptionBottomMarginForWindowWidth:(double)a3;
- (double)contentDescriptionTopMarginForWindowWidth:(double)a3;
- (double)coverArtBottomPadding;
- (double)coverArtImageRightMarginForWindowWidth:(double)a3;
- (double)metadataTopMargin;
- (double)subtitleTopMarginForWindowWidth:(double)a3;
- (double)titleTopMargin;
- (id)contentDescriptionFontForSizeClass:(int64_t)a3;
- (id)descriptionTextLayoutForTraitCollection:(id)a3 isExpanded:(BOOL)a4;
- (id)subtitleTextLayoutForWindowWidth:(double)a3;
- (int)contentDescriptionNumberOfLinesForTraitCollection:(id)a3;
- (int64_t)downloadButtonPosition;
- (int64_t)layoutTypeForWindowWidth:(double)a3;
- (int64_t)type;
- (void)configLayout;
- (void)setDescriptionTextLayout:(id)a3;
- (void)setPlayLabelTextLayout:(id)a3;
- (void)setSubtitleTextLayout:(id)a3;
@end

@implementation VUILibraryProductLockupLayout

- (VUILibraryProductLockupLayout)initWithLayoutType:(int64_t)a3 entityType:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUILibraryProductLockupLayout;
  v8 = [(VUILibraryProductLockupLayout *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_entityType, a4);
  }
  [(VUILibraryProductLockupLayout *)v9 configLayout];

  return v9;
}

- (void)configLayout
{
  v3 = objc_alloc_init(VUITextLayout);
  playLabelTextLayout = self->_playLabelTextLayout;
  self->_playLabelTextLayout = v3;

  [(VUITextLayout *)self->_playLabelTextLayout setTextStyle:21];
  [(VUITextLayout *)self->_playLabelTextLayout setFontWeight:0];
  v5 = self->_playLabelTextLayout;
  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v5 setColor:v6];

  id v7 = self->_playLabelTextLayout;
  [(VUITextLayout *)v7 setNumberOfLines:1];
}

- (int64_t)layoutTypeForWindowWidth:(double)a3
{
  return (unint64_t)objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", a3) > 2;
}

- (CGSize)coverArtImageSize
{
  entityType = self->_entityType;
  uint64_t v4 = +[VUIMediaEntityType movie];
  if (entityType == (VUIMediaEntityType *)v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = self->_entityType;
  id v7 = +[VUIMediaEntityType movieRental];

  if (v6 == v7)
  {
LABEL_5:
    +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 300.0, *(double *)(MEMORY[0x1E4F1DB30] + 8));
    goto LABEL_6;
  }
  double v8 = 300.0;
  double v9 = 168.75;
LABEL_6:
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)coverArtImageRightMarginForWindowWidth:(double)a3
{
  int64_t v3 = [(VUILibraryProductLockupLayout *)self layoutTypeForWindowWidth:a3];
  double result = 30.0;
  if (!v3) {
    return 16.0;
  }
  return result;
}

- (double)coverArtBottomPadding
{
  return 28.0;
}

- (double)titleTopMargin
{
  return 22.0;
}

- (double)subtitleTopMarginForWindowWidth:(double)a3
{
  int64_t v3 = [(VUILibraryProductLockupLayout *)self layoutTypeForWindowWidth:a3];
  double result = 26.0;
  if (!v3) {
    return 16.0;
  }
  return result;
}

- (double)metadataTopMargin
{
  return 10.0;
}

- (double)contentDescriptionTopMarginForWindowWidth:(double)a3
{
  int64_t v3 = [(VUILibraryProductLockupLayout *)self layoutTypeForWindowWidth:a3];
  double result = 24.0;
  if (!v3) {
    return 28.0;
  }
  return result;
}

- (double)contentDescriptionBottomMarginForWindowWidth:(double)a3
{
  int64_t v3 = [(VUILibraryProductLockupLayout *)self layoutTypeForWindowWidth:a3];
  double result = 24.0;
  if (!v3) {
    return 20.0;
  }
  return result;
}

- (double)buttonModuleTopMarginForWindowWidth:(double)a3
{
  int64_t v3 = [(VUILibraryProductLockupLayout *)self layoutTypeForWindowWidth:a3];
  double result = 16.0;
  if (!v3) {
    return 20.0;
  }
  return result;
}

- (int64_t)downloadButtonPosition
{
  if (self->_type == 1) {
    return 4;
  }
  else {
    return 5;
  }
}

- (id)subtitleTextLayoutForWindowWidth:(double)a3
{
  if (!self->_subtitleTextLayout)
  {
    v5 = objc_alloc_init(VUITextLayout);
    subtitleTextLayout = self->_subtitleTextLayout;
    self->_subtitleTextLayout = v5;

    id v7 = self->_subtitleTextLayout;
    double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(VUITextLayout *)v7 setColor:v8];

    [(VUITextLayout *)self->_subtitleTextLayout setNumberOfLines:1];
  }
  if ([(VUILibraryProductLockupLayout *)self layoutTypeForWindowWidth:a3] == 1) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 15;
  }
  [(VUITextLayout *)self->_subtitleTextLayout setTextStyle:v9];
  [(VUITextLayout *)self->_subtitleTextLayout setFontWeight:10];
  v10 = self->_subtitleTextLayout;
  return v10;
}

- (id)descriptionTextLayoutForTraitCollection:(id)a3 isExpanded:(BOOL)a4
{
  id v6 = a3;
  descriptionTextLayout = self->_descriptionTextLayout;
  if (!descriptionTextLayout)
  {
    uint64_t v9 = objc_alloc_init(VUITextLayout);
    v10 = self->_descriptionTextLayout;
    self->_descriptionTextLayout = v9;

    [(VUITextLayout *)self->_descriptionTextLayout setAlignment:4];
    objc_super v11 = self->_descriptionTextLayout;
    v12 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [(VUITextLayout *)v11 setSeeMoreTextColor:v12];

    descriptionTextLayout = self->_descriptionTextLayout;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = [(VUILibraryProductLockupLayout *)self contentDescriptionNumberOfLinesForTraitCollection:v6];
    goto LABEL_6;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 0;
LABEL_6:
  [(VUITextLayout *)descriptionTextLayout setNumberOfLines:v8];
  v13 = self->_descriptionTextLayout;

  return v13;
}

- (VUITextLayout)playLabelTextLayout
{
  return self->_playLabelTextLayout;
}

- (int)contentDescriptionNumberOfLinesForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v6 = [v5 preferredContentSizeCategory];

  uint64_t v7 = [MEMORY[0x1E4FB3C70] vuiContentSizeCategoryFor:v6];
  if ([MEMORY[0x1E4FB3C20] contentSizeCategoryIsAccessibility:v7])
  {
    int v8 = 5;
  }
  else
  {
    uint64_t v9 = [v4 userInterfaceIdiom];
    uint64_t v10 = [v4 horizontalSizeClass];
    int v8 = 4;
    if (v9 && (v9 != 1 || v10 != 1))
    {
      if (self->_type) {
        int v8 = 4;
      }
      else {
        int v8 = 5;
      }
    }
  }

  return v8;
}

- (id)contentDescriptionFontForSizeClass:(int64_t)a3
{
  if (self->_type)
  {
    int64_t v3 = (void *)MEMORY[0x1E4FB08E0];
  }
  else
  {
    int64_t v3 = (void *)MEMORY[0x1E4FB08E0];
    if ((unint64_t)(a3 - 3) <= 2)
    {
      uint64_t v4 = 20;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 21;
LABEL_6:
  v5 = objc_msgSend(v3, "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", v4, 0, 0, 0.0);
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (VUIMediaEntityType)entityType
{
  return self->_entityType;
}

- (void)setPlayLabelTextLayout:(id)a3
{
}

- (VUITextLayout)subtitleTextLayout
{
  return self->_subtitleTextLayout;
}

- (void)setSubtitleTextLayout:(id)a3
{
}

- (VUITextLayout)descriptionTextLayout
{
  return self->_descriptionTextLayout;
}

- (void)setDescriptionTextLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionTextLayout, 0);
  objc_storeStrong((id *)&self->_subtitleTextLayout, 0);
  objc_storeStrong((id *)&self->_playLabelTextLayout, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
}

@end