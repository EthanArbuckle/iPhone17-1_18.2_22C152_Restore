@interface PBFPosterGalleryViewSpec
+ (id)displayMonitor;
+ (id)specForDisplayContext:(id)a3;
+ (id)specForScreen:(id)a3;
+ (id)specForScreenIdentity:(id)a3;
- (CGRect)referenceBounds;
- (CGSize)gallerySizeForPadOrientation:(int64_t)a3;
- (CGSize)landscapeGallerySize;
- (CGSize)portraitGallerySize;
- (CGSize)posterContentSize;
- (CGSize)posterContentSizeForOrientation:(int64_t)a3;
- (CGSize)posterEditingConfirmationContentSize;
- (CGSize)posterHeroContentSize;
- (PBFPosterGalleryViewSpec)initWithReferenceBounds:(CGRect)a3 deviceClass:(int64_t)a4 displayCornerRadius:(double)a5 scale:(double)a6;
- (UIColor)previewCellDescriptionLabelColor;
- (UIColor)previewCellLabelColor;
- (UIColor)sectionHeaderSubtitleColor;
- (UIColor)sectionHeaderTitleColor;
- (UIFont)previewCellDescriptionLabelFont;
- (UIFont)previewCellLabelFont;
- (UIFont)sectionHeaderSubtitleFont;
- (UIFont)sectionHeaderTitleFont;
- (double)groupSpacing;
- (double)heroSpacingForOrientation:(int64_t)a3;
- (double)posterCornerRadius;
- (double)previewCellLabelToImageVerticalSpacing;
- (double)previewSmartAlbumCellAdditionalTopMargin;
- (double)referenceScale;
- (double)sectionHeaderBottomSpacing;
- (double)sectionHeaderSubtitleTopMargin;
- (double)sectionHeaderTopSpacing;
- (double)sectionHorizontalMargin;
- (double)sectionVerticalMargin;
- (double)standardSpacing;
- (int64_t)deviceClass;
@end

@implementation PBFPosterGalleryViewSpec

+ (id)displayMonitor
{
  if (displayMonitor_onceToken != -1) {
    dispatch_once(&displayMonitor_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)displayMonitor_displayMonitor;
  return v2;
}

void __42__PBFPosterGalleryViewSpec_displayMonitor__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)displayMonitor_displayMonitor;
  displayMonitor_displayMonitor = v0;
}

+ (id)specForScreen:(id)a3
{
  v4 = [a3 displayIdentity];
  v5 = [a1 specForScreenIdentity:v4];

  return v5;
}

+ (id)specForDisplayContext:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6 = [v5 connectedScenes];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke;
  v29[3] = &unk_1E6984B88;
  id v7 = v4;
  id v30 = v7;
  v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v29);

  v9 = [v8 _FBSScene];
  v10 = [v9 settings];
  v11 = [v10 displayIdentity];

  if (v11) {
    goto LABEL_3;
  }
  v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  v13 = [v12 openSessions];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke_2;
  v27 = &unk_1E6984BB0;
  id v14 = v7;
  id v28 = v14;
  v15 = objc_msgSend(v13, "bs_firstObjectPassingTest:", &v24);

  v16 = objc_msgSend(v15, "scene", v24, v25, v26, v27);
  v17 = [v16 _FBSScene];
  v18 = [v17 settings];
  v11 = [v18 displayIdentity];

  if (v11)
  {
LABEL_3:
    uint64_t v19 = [MEMORY[0x1E4FB1BA8] _screenWithFBSDisplayIdentity:v11];
LABEL_4:
    v20 = (void *)v19;
    goto LABEL_5;
  }
  v11 = +[PBFGenericDisplayContext mainScreen];
  if ([v11 geometryIsEqualTo:v14])
  {
    uint64_t v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
    goto LABEL_4;
  }
  v20 = 0;
LABEL_5:

  if (v20)
  {
    v21 = [a1 specForScreen:v20];
  }
  else
  {
    v22 = PBFLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      +[PBFPosterGalleryViewSpec specForDisplayContext:]((uint64_t)v7, v22);
    }

    v21 = 0;
  }

  return v21;
}

uint64_t __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 _FBSScene];
  id v4 = [v3 settings];
  v5 = [v4 displayIdentity];

  v6 = +[PBFGenericDisplayContext displayContextForDisplayIdentifier:v5];
  uint64_t v7 = [v6 geometryIsEqualTo:*(void *)(a1 + 32)];

  return v7;
}

uint64_t __50__PBFPosterGalleryViewSpec_specForDisplayContext___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 scene];
  id v4 = [v3 _FBSScene];
  v5 = [v4 settings];
  v6 = [v5 displayIdentity];

  uint64_t v7 = +[PBFGenericDisplayContext displayContextForDisplayIdentifier:v6];
  uint64_t v8 = [v7 geometryIsEqualTo:*(void *)(a1 + 32)];

  return v8;
}

+ (id)specForScreenIdentity:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [a1 displayMonitor];
    id v4 = [v5 mainIdentity];
  }
  if (specForScreenIdentity__onceToken != -1) {
    dispatch_once(&specForScreenIdentity__onceToken, &__block_literal_global_7_1);
  }
  id v6 = (id)specForScreenIdentity__specPerDisplayIdentity;
  objc_sync_enter(v6);
  uint64_t v7 = [(id)specForScreenIdentity__specPerDisplayIdentity objectForKey:v4];
  if (!v7)
  {
    uint64_t v8 = [a1 displayMonitor];
    v9 = [v8 configurationForIdentity:v4];

    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v9 pointScale];
    double v19 = v18;
    v20 = [MEMORY[0x1E4FB1BA8] _screenWithFBSDisplayIdentity:v4];
    v21 = [v20 traitCollection];
    unint64_t v22 = PBFDeviceClassFromUserInterfaceIdiom([v21 userInterfaceIdiom]);
    v23 = [PBFPosterGalleryViewSpec alloc];
    [v21 displayCornerRadius];
    uint64_t v7 = -[PBFPosterGalleryViewSpec initWithReferenceBounds:deviceClass:displayCornerRadius:scale:](v23, "initWithReferenceBounds:deviceClass:displayCornerRadius:scale:", v22, v11, v13, v15, v17, v24, v19);
    [(id)specForScreenIdentity__specPerDisplayIdentity setObject:v7 forKey:v4];
  }
  objc_sync_exit(v6);

  return v7;
}

void __50__PBFPosterGalleryViewSpec_specForScreenIdentity___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v1 = (void *)specForScreenIdentity__specPerDisplayIdentity;
  specForScreenIdentity__specPerDisplayIdentity = v0;
}

- (PBFPosterGalleryViewSpec)initWithReferenceBounds:(CGRect)a3 deviceClass:(int64_t)a4 displayCornerRadius:(double)a5 scale:(double)a6
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v44.receiver = self;
  v44.super_class = (Class)PBFPosterGalleryViewSpec;
  double v13 = [(PBFPosterGalleryViewSpec *)&v44 init];
  double v14 = v13;
  if (v13)
  {
    v13->_referenceScale = a6;
    v13->_referenceBounds.origin.double x = x;
    v13->_referenceBounds.origin.double y = y;
    v13->_referenceBounds.size.double width = width;
    v13->_referenceBounds.size.CGFloat height = height;
    v13->_deviceClass = a4;
    double v15 = 20.0;
    if (width > 375.0) {
      double v15 = 24.0;
    }
    v13->_double sectionHorizontalMargin = v15;
    *(_OWORD *)&v13->_sectionVerticalMargin = xmmword_1D337EC00;
    v13->_groupSpacing = 16.0;
    if (a4 == 1)
    {
      double v16 = 122.0;
    }
    else
    {
      UIRoundToScale();
      double v16 = v17;
    }
    UIRoundToScale();
    double v19 = v18;
    v14->_posterContentSize.double width = v16;
    v14->_posterContentSize.CGFloat height = v18;
    v14->_posterHeroContentSize.double width = PBFPosterHeroContentSizeForBounds(x, y, width);
    v14->_posterHeroContentSize.CGFloat height = v20;
    v14->_posterEditingConfirmationContentSize.CGFloat height = 200.0;
    UIRoundToScale();
    v14->_posterEditingConfirmationContentSize.double width = v21;
    if (a4 == 1)
    {
      double v22 = v14->_standardSpacing * 3.0;
      double sectionHorizontalMargin = v14->_sectionHorizontalMargin;
      v14->_portraitGallerySize.double width = v22 + v16 * 4.0 + sectionHorizontalMargin * 2.0;
      v14->_portraitGallerySize.CGFloat height = 870.0;
      v14->_landscapeGallerySize.double width = v22 + v19 * 4.0 + sectionHorizontalMargin * 2.0;
      v14->_landscapeGallerySize.CGFloat height = 1000.0;
    }
    else
    {
      CGSize v24 = (CGSize)*MEMORY[0x1E4F1DB30];
      v14->_portraitGallerySize = (CGSize)*MEMORY[0x1E4F1DB30];
      v14->_landscapeGallerySize = v24;
    }
    double v25 = v16 / width * a5 * 1.35000002;
    if (v25 < 8.0) {
      double v25 = 8.0;
    }
    v14->_posterCornerRadius = v25;
    uint64_t v26 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] weight:*MEMORY[0x1E4FB09B8]];
    sectionHeaderTitleFont = v14->_sectionHeaderTitleFont;
    v14->_sectionHeaderTitleFont = (UIFont *)v26;

    uint64_t v28 = [MEMORY[0x1E4FB1618] labelColor];
    sectionHeaderTitleColor = v14->_sectionHeaderTitleColor;
    v14->_sectionHeaderTitleColor = (UIColor *)v28;

    uint64_t v30 = [MEMORY[0x1E4FB1618] labelColor];
    sectionHeaderSubtitleColor = v14->_sectionHeaderSubtitleColor;
    v14->_sectionHeaderSubtitleColor = (UIColor *)v30;

    uint64_t v32 = *MEMORY[0x1E4FB2950];
    uint64_t v33 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] weight:*MEMORY[0x1E4FB09D8]];
    sectionHeaderSubtitleFont = v14->_sectionHeaderSubtitleFont;
    v14->_sectionHeaderSubtitleFont = (UIFont *)v33;

    *(_OWORD *)&v14->_sectionHeaderSubtitleTopMargin = xmmword_1D337EC10;
    v14->_sectionHeaderBottomSpacing = 8.0;
    uint64_t v35 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] weight:*MEMORY[0x1E4FB09D0]];
    previewCellLabelFont = v14->_previewCellLabelFont;
    v14->_previewCellLabelFont = (UIFont *)v35;

    uint64_t v37 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    previewCellLabelColor = v14->_previewCellLabelColor;
    v14->_previewCellLabelColor = (UIColor *)v37;

    v14->_previewCellLabelToImageVerticalSpacing = 5.0;
    uint64_t v39 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v32];
    previewCellDescriptionLabelFont = v14->_previewCellDescriptionLabelFont;
    v14->_previewCellDescriptionLabelFont = (UIFont *)v39;

    uint64_t v41 = [MEMORY[0x1E4FB1618] labelColor];
    previewCellDescriptionLabelColor = v14->_previewCellDescriptionLabelColor;
    v14->_previewCellDescriptionLabelColor = (UIColor *)v41;

    v14->_previewSmartAlbumCellAdditionalTopMargin = 4.0;
  }
  return v14;
}

- (CGSize)gallerySizeForPadOrientation:(int64_t)a3
{
  int IsPortrait = BSInterfaceOrientationIsPortrait();
  uint64_t v5 = 232;
  if (IsPortrait) {
    uint64_t v5 = 216;
  }
  uint64_t v6 = 240;
  if (IsPortrait) {
    uint64_t v6 = 224;
  }
  double v7 = *(double *)((char *)&self->super.isa + v6);
  double v8 = *(double *)((char *)&self->super.isa + v5);
  result.CGFloat height = v7;
  result.double width = v8;
  return result;
}

- (CGSize)posterContentSizeForOrientation:(int64_t)a3
{
  int IsPortrait = BSInterfaceOrientationIsPortrait();
  uint64_t v5 = 176;
  if (IsPortrait) {
    uint64_t v6 = 168;
  }
  else {
    uint64_t v6 = 176;
  }
  if (!IsPortrait) {
    uint64_t v5 = 168;
  }
  double v7 = *(double *)((char *)&self->super.isa + v5);
  double v8 = *(double *)((char *)&self->super.isa + v6);
  result.CGFloat height = v7;
  result.double width = v8;
  return result;
}

- (double)heroSpacingForOrientation:(int64_t)a3
{
  if (self->_deviceClass != 1) {
    return self->_standardSpacing;
  }
  char IsPortrait = BSInterfaceOrientationIsPortrait();
  double result = 14.0;
  if ((IsPortrait & 1) == 0) {
    return self->_standardSpacing;
  }
  return result;
}

- (CGRect)referenceBounds
{
  double x = self->_referenceBounds.origin.x;
  double y = self->_referenceBounds.origin.y;
  double width = self->_referenceBounds.size.width;
  double height = self->_referenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)referenceScale
{
  return self->_referenceScale;
}

- (CGSize)posterContentSize
{
  double width = self->_posterContentSize.width;
  double height = self->_posterContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)posterHeroContentSize
{
  double width = self->_posterHeroContentSize.width;
  double height = self->_posterHeroContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)posterEditingConfirmationContentSize
{
  double width = self->_posterEditingConfirmationContentSize.width;
  double height = self->_posterEditingConfirmationContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)posterCornerRadius
{
  return self->_posterCornerRadius;
}

- (double)sectionHorizontalMargin
{
  return self->_sectionHorizontalMargin;
}

- (double)sectionVerticalMargin
{
  return self->_sectionVerticalMargin;
}

- (double)standardSpacing
{
  return self->_standardSpacing;
}

- (double)groupSpacing
{
  return self->_groupSpacing;
}

- (UIFont)sectionHeaderTitleFont
{
  return self->_sectionHeaderTitleFont;
}

- (UIColor)sectionHeaderTitleColor
{
  return self->_sectionHeaderTitleColor;
}

- (UIFont)sectionHeaderSubtitleFont
{
  return self->_sectionHeaderSubtitleFont;
}

- (UIColor)sectionHeaderSubtitleColor
{
  return self->_sectionHeaderSubtitleColor;
}

- (double)sectionHeaderSubtitleTopMargin
{
  return self->_sectionHeaderSubtitleTopMargin;
}

- (double)sectionHeaderTopSpacing
{
  return self->_sectionHeaderTopSpacing;
}

- (double)sectionHeaderBottomSpacing
{
  return self->_sectionHeaderBottomSpacing;
}

- (UIFont)previewCellLabelFont
{
  return self->_previewCellLabelFont;
}

- (UIColor)previewCellLabelColor
{
  return self->_previewCellLabelColor;
}

- (double)previewCellLabelToImageVerticalSpacing
{
  return self->_previewCellLabelToImageVerticalSpacing;
}

- (UIFont)previewCellDescriptionLabelFont
{
  return self->_previewCellDescriptionLabelFont;
}

- (UIColor)previewCellDescriptionLabelColor
{
  return self->_previewCellDescriptionLabelColor;
}

- (double)previewSmartAlbumCellAdditionalTopMargin
{
  return self->_previewSmartAlbumCellAdditionalTopMargin;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (CGSize)portraitGallerySize
{
  double width = self->_portraitGallerySize.width;
  double height = self->_portraitGallerySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)landscapeGallerySize
{
  double width = self->_landscapeGallerySize.width;
  double height = self->_landscapeGallerySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewCellDescriptionLabelColor, 0);
  objc_storeStrong((id *)&self->_previewCellDescriptionLabelFont, 0);
  objc_storeStrong((id *)&self->_previewCellLabelColor, 0);
  objc_storeStrong((id *)&self->_previewCellLabelFont, 0);
  objc_storeStrong((id *)&self->_sectionHeaderSubtitleColor, 0);
  objc_storeStrong((id *)&self->_sectionHeaderSubtitleFont, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitleColor, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitleFont, 0);
}

+ (void)specForDisplayContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_FAULT, "Nil matching screen for display context: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end