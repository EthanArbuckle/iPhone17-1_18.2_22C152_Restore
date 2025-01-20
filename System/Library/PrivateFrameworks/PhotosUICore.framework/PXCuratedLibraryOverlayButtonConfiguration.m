@interface PXCuratedLibraryOverlayButtonConfiguration
+ (NSCache)tintedImageCache;
+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithButtonType:(int64_t)a3 spec:(id)a4;
+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithButtonType:(int64_t)a3 title:(id)a4 spec:(id)a5;
+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithSystemImageName:(id)a3 spec:(id)a4;
+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithSystemImageName:(id)a3 title:(id)a4 spec:(id)a5;
+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithTitle:(id)a3 spec:(id)a4;
- (BOOL)forcePointerInteractionEnabled;
- (BOOL)isEqual:(id)a3;
- (NSSet)possibleTitles;
- (NSString)accessibilityTitle;
- (NSString)caption;
- (NSString)systemImageName;
- (NSString)title;
- (PXCuratedLibraryActionPerformer)actionPerformer;
- (PXCuratedLibraryOverlayButtonConfiguration)init;
- (PXCuratedLibraryOverlayButtonConfiguration)initWithSystemImageName:(id)a3 title:(id)a4 spec:(id)a5 buttonType:(int64_t)a6;
- (PXCuratedLibrarySectionHeaderLayoutSpec)spec;
- (UIColor)backgroundColor;
- (UIColor)contentColor;
- (UIColor)highlightedContentColor;
- (UIColor)tintColor;
- (UIEdgeInsets)hitTestOutsets;
- (UIEdgeInsets)imageEdgeInsets;
- (UIImage)highlightedIconImage;
- (UIImage)iconImage;
- (UIImage)iconImageWithoutConfiguration;
- (UIImage)tintedIconImage;
- (id)_contentColorWhenHighlighted:(BOOL)a3;
- (id)_tintedImage:(id)a3 name:(id)a4 withColor:(id)a5;
- (id)actionHandler;
- (id)menuActionHandler;
- (id)willDismissMenuActionHandler;
- (id)willDisplayMenuActionHandler;
- (int64_t)buttonType;
- (int64_t)segment;
- (int64_t)style;
- (unint64_t)hash;
- (void)prepareForRender;
- (void)setActionHandler:(id)a3;
- (void)setActionPerformer:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCaption:(id)a3;
- (void)setForcePointerInteractionEnabled:(BOOL)a3;
- (void)setHitTestOutsets:(UIEdgeInsets)a3;
- (void)setImageEdgeInsets:(UIEdgeInsets)a3;
- (void)setMenuActionHandler:(id)a3;
- (void)setPossibleTitles:(id)a3;
- (void)setSegment:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setWillDismissMenuActionHandler:(id)a3;
- (void)setWillDisplayMenuActionHandler:(id)a3;
@end

@implementation PXCuratedLibraryOverlayButtonConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong(&self->_willDismissMenuActionHandler, 0);
  objc_storeStrong(&self->_willDisplayMenuActionHandler, 0);
  objc_storeStrong(&self->_menuActionHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_highlightedIconImage, 0);
  objc_storeStrong((id *)&self->_tintedIconImage, 0);
  objc_storeStrong((id *)&self->_iconImageWithoutConfiguration, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_highlightedContentColor, 0);
  objc_storeStrong((id *)&self->_contentColor, 0);
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setForcePointerInteractionEnabled:(BOOL)a3
{
  self->_forcePointerInteractionEnabled = a3;
}

- (BOOL)forcePointerInteractionEnabled
{
  return self->_forcePointerInteractionEnabled;
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setPossibleTitles:(id)a3
{
}

- (NSSet)possibleTitles
{
  return self->_possibleTitles;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setHitTestOutsets:(UIEdgeInsets)a3
{
  self->_hitTestOutsets = a3;
}

- (UIEdgeInsets)hitTestOutsets
{
  double top = self->_hitTestOutsets.top;
  double left = self->_hitTestOutsets.left;
  double bottom = self->_hitTestOutsets.bottom;
  double right = self->_hitTestOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImageEdgeInsets:(UIEdgeInsets)a3
{
  self->_imageEdgeInsets = a3;
}

- (UIEdgeInsets)imageEdgeInsets
{
  double top = self->_imageEdgeInsets.top;
  double left = self->_imageEdgeInsets.left;
  double bottom = self->_imageEdgeInsets.bottom;
  double right = self->_imageEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSegment:(int64_t)a3
{
  self->_segment = a3;
}

- (int64_t)segment
{
  return self->_segment;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setWillDismissMenuActionHandler:(id)a3
{
}

- (id)willDismissMenuActionHandler
{
  return self->_willDismissMenuActionHandler;
}

- (void)setWillDisplayMenuActionHandler:(id)a3
{
}

- (id)willDisplayMenuActionHandler
{
  return self->_willDisplayMenuActionHandler;
}

- (void)setMenuActionHandler:(id)a3
{
}

- (id)menuActionHandler
{
  return self->_menuActionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionPerformer:(id)a3
{
}

- (PXCuratedLibraryActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (UIImage)highlightedIconImage
{
  if (!self->_highlightedIconImage)
  {
    v3 = [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImage];

    if (v3)
    {
      v4 = [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImage];
      v5 = [(PXCuratedLibraryOverlayButtonConfiguration *)self systemImageName];
      v6 = [(PXCuratedLibraryOverlayButtonConfiguration *)self highlightedContentColor];
      v7 = [(PXCuratedLibraryOverlayButtonConfiguration *)self _tintedImage:v4 name:v5 withColor:v6];
      highlightedIconImage = self->_highlightedIconImage;
      self->_highlightedIconImage = v7;
    }
  }
  v9 = self->_highlightedIconImage;
  return v9;
}

- (UIImage)tintedIconImage
{
  if (!self->_tintedIconImage)
  {
    v3 = [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImage];

    if (v3)
    {
      v4 = [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImage];
      v5 = [(PXCuratedLibraryOverlayButtonConfiguration *)self systemImageName];
      v6 = [(PXCuratedLibraryOverlayButtonConfiguration *)self contentColor];
      v7 = [(PXCuratedLibraryOverlayButtonConfiguration *)self _tintedImage:v4 name:v5 withColor:v6];
      tintedIconImage = self->_tintedIconImage;
      self->_tintedIconImage = v7;
    }
  }
  v9 = self->_tintedIconImage;
  return v9;
}

- (id)_tintedImage:(id)a3 name:(id)a4 withColor:(id)a5
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(id)objc_opt_class() tintedImageCache];
  id v12 = objc_alloc((Class)off_1E5DA9660);
  v23[0] = v10;
  v23[1] = v9;
  v13 = NSNumber;
  v14 = [(PXCuratedLibraryOverlayButtonConfiguration *)self spec];
  v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "userInterfaceStyle"));
  v23[2] = v15;
  v16 = NSNumber;
  v17 = [(PXCuratedLibraryOverlayButtonConfiguration *)self spec];
  v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "userInterfaceLevel"));
  v23[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  v20 = (void *)[v12 initWithObjects:v19];
  v21 = [v11 objectForKey:v20];
  if (!v21)
  {
    v21 = objc_msgSend(v8, "px_tintedImageWithColor:", v9);
    [v11 setObject:v21 forKey:v20];
  }

  return v21;
}

- (UIImage)iconImageWithoutConfiguration
{
  iconImageWithoutConfiguration = self->_iconImageWithoutConfiguration;
  if (!iconImageWithoutConfiguration)
  {
    v4 = [(PXCuratedLibraryOverlayButtonConfiguration *)self systemImageName];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E4FB1818], "px_systemImageNamed:", v4);
      v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v6 = self->_iconImageWithoutConfiguration;
      self->_iconImageWithoutConfiguration = v5;
    }
    iconImageWithoutConfiguration = self->_iconImageWithoutConfiguration;
  }
  return iconImageWithoutConfiguration;
}

- (UIImage)iconImage
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  iconImage = self->_iconImage;
  if (!iconImage)
  {
    v4 = [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImageWithoutConfiguration];
    v5 = self;
    if (_PXIconImageSymbolConfiguration_onceToken != -1) {
      dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_713);
    }
    v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    v7 = [v6 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    id v9 = [(PXCuratedLibraryOverlayButtonConfiguration *)v5 systemImageName];
    id v10 = objc_alloc((Class)off_1E5DA9660);
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXCuratedLibraryOverlayButtonConfiguration style](v5, "style"));
    id v12 = (void *)v11;
    if (v9)
    {
      v13 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v11);
      v14 = [v13 preferredContentSizeCategory];
      v39 = v14;
      v40 = v9;
      v15 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v16 = 3;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v11);
      v14 = [v13 preferredContentSizeCategory];
      v39 = v14;
      v15 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v16 = 2;
    }
    v17 = [v15 arrayWithObjects:&v38 count:v16];
    v18 = (void *)[v10 initWithObjects:v17];

    v19 = &_px_localizedCapitalizedString__languagesWithCustomCapitalization;
    v20 = [(id)_PXIconImageSymbolConfiguration_configsCache objectForKey:v18];
    if (!v20)
    {
      switch([(PXCuratedLibraryOverlayButtonConfiguration *)v5 style])
      {
        case 0:
        case 1:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 13:
        case 14:
          v21 = (id *)MEMORY[0x1E4FB27B0];
          if (!IsAccessibilityCategory) {
            v21 = (id *)MEMORY[0x1E4FB27D0];
          }
          id v22 = *v21;
          v23 = [(PXCuratedLibraryOverlayButtonConfiguration *)v5 spec];
          char v24 = [v23 options];

          v25 = (id *)MEMORY[0x1E4FB28C8];
          if ((v24 & 4) == 0) {
            v25 = (id *)MEMORY[0x1E4FB2948];
          }
          id v26 = *v25;
          v27 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v26, v22, 32770);
          if ((v24 & 4) != 0
            || ([v9 isEqualToString:@"person.fill"] & 1) != 0
            || [v9 isEqualToString:@"person.2.fill"])
          {
            uint64_t v28 = 1;
          }
          else
          {
            uint64_t v28 = 2;
          }
          v29 = (void *)MEMORY[0x1E4FB1830];
          [v27 pointSize];
          v20 = objc_msgSend(v29, "configurationWithPointSize:weight:scale:", 6, v28);

          v19 = &_px_localizedCapitalizedString__languagesWithCustomCapitalization;
          goto LABEL_27;
        case 2:
        case 3:
          objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E4FB1830];
          [v22 pointSize];
          v31 = v30;
          uint64_t v32 = 4;
          goto LABEL_26;
        case 4:
        case 5:
          objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E4FB1830];
          [v22 pointSize];
          goto LABEL_25;
        case 12:
          v34 = (void *)MEMORY[0x1E4FB27B0];
          if (!IsAccessibilityCategory) {
            v34 = (void *)MEMORY[0x1E4FB27D0];
          }
          objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB2948], *v34, 32770);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E4FB1830];
          [v22 pointSize];
LABEL_25:
          v31 = v33;
          uint64_t v32 = 6;
LABEL_26:
          v20 = objc_msgSend(v31, "configurationWithPointSize:weight:scale:", v32, 3);
LABEL_27:

          break;
        default:
          v20 = 0;
          break;
      }
      [(id)v19[192] setObject:v20 forKey:v18];
    }

    v35 = [v4 imageWithSymbolConfiguration:v20];
    v36 = self->_iconImage;
    self->_iconImage = v35;

    iconImage = self->_iconImage;
  }
  return iconImage;
}

- (UIColor)highlightedContentColor
{
  highlightedContentColor = self->_highlightedContentColor;
  if (!highlightedContentColor)
  {
    v4 = [(PXCuratedLibraryOverlayButtonConfiguration *)self _contentColorWhenHighlighted:1];
    v5 = self->_highlightedContentColor;
    self->_highlightedContentColor = v4;

    highlightedContentColor = self->_highlightedContentColor;
  }
  return highlightedContentColor;
}

- (UIColor)contentColor
{
  contentColor = self->_contentColor;
  if (!contentColor)
  {
    v4 = [(PXCuratedLibraryOverlayButtonConfiguration *)self _contentColorWhenHighlighted:0];
    v5 = self->_contentColor;
    self->_contentColor = v4;

    contentColor = self->_contentColor;
  }
  return contentColor;
}

- (id)_contentColorWhenHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PXCuratedLibraryOverlayButtonConfiguration *)self actionPerformer];
  if (v5
    || ([(PXCuratedLibraryOverlayButtonConfiguration *)self actionHandler],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v11 = [(PXCuratedLibraryOverlayButtonConfiguration *)self menuActionHandler];

    if (!v11)
    {
      id v12 = [MEMORY[0x1E4FB1618] labelColor];
      v7 = [v12 colorWithAlphaComponent:0.3];

      goto LABEL_12;
    }
  }
  if ([(PXCuratedLibraryOverlayButtonConfiguration *)self style] == 8)
  {
    v6 = [MEMORY[0x1E4FB1618] labelColor];
    v7 = v6;
    if (!v3)
    {
      uint64_t v8 = [v6 colorWithAlphaComponent:0.5];

      v7 = (void *)v8;
    }
  }
  else
  {
    if ([(PXCuratedLibraryOverlayButtonConfiguration *)self style] == 10 || !v3)
    {
      uint64_t v9 = [(PXCuratedLibraryOverlayButtonConfiguration *)self tintColor];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] _vibrantLightFillBurnColor];
    }
    v7 = (void *)v9;
  }
LABEL_12:
  return v7;
}

- (void)setTintColor:(id)a3
{
  v4 = (UIColor *)a3;
  if (self->_tintColor != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      v5 = +[PXCuratedLibraryOverlayButton defaultTitleColor];
    }
    tintColor = self->_tintColor;
    self->_tintColor = v5;

    v4 = v7;
  }
}

- (void)prepareForRender
{
  [(PXCuratedLibraryOverlayButtonConfiguration *)self contentColor];

  [(PXCuratedLibraryOverlayButtonConfiguration *)self highlightedContentColor];
  [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImage];

  [(PXCuratedLibraryOverlayButtonConfiguration *)self iconImageWithoutConfiguration];
  [(PXCuratedLibraryOverlayButtonConfiguration *)self tintedIconImage];

  BOOL v3 = [(PXCuratedLibraryOverlayButtonConfiguration *)self highlightedIconImage];
}

- (unint64_t)hash
{
  [(PXCuratedLibraryOverlayButtonConfiguration *)self imageEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(PXCuratedLibraryOverlayButtonConfiguration *)self style];
  int64_t v28 = [(PXCuratedLibraryOverlayButtonConfiguration *)self segment] ^ v11;
  v31 = [(PXCuratedLibraryOverlayButtonConfiguration *)self systemImageName];
  uint64_t v27 = [v31 hash];
  v30 = [(PXCuratedLibraryOverlayButtonConfiguration *)self title];
  uint64_t v25 = [v30 hash];
  v29 = [(PXCuratedLibraryOverlayButtonConfiguration *)self possibleTitles];
  uint64_t v24 = [v29 hash];
  id v26 = [(PXCuratedLibraryOverlayButtonConfiguration *)self caption];
  uint64_t v23 = [v26 hash];
  id v12 = [(PXCuratedLibraryOverlayButtonConfiguration *)self actionPerformer];
  uint64_t v13 = [v12 hash];
  uint64_t v14 = [(PXCuratedLibraryOverlayButtonConfiguration *)self actionHandler];
  v15 = [(PXCuratedLibraryOverlayButtonConfiguration *)self spec];
  uint64_t v16 = [v15 hash];
  v17 = [(PXCuratedLibraryOverlayButtonConfiguration *)self tintColor];
  uint64_t v18 = [v17 hash];
  v19 = [(PXCuratedLibraryOverlayButtonConfiguration *)self backgroundColor];
  uint64_t v20 = [v19 hash];
  unint64_t v21 = v28 ^ (unint64_t)(v4 * 100.0) ^ (unint64_t)(v6 * 100.0) ^ (unint64_t)(v8 * 100.0) ^ (unint64_t)(v10 * 100.0) ^ v27 ^ v25 ^ v24 ^ v23 ^ v13 ^ v14 ^ v16 ^ v18 ^ v20 ^ [(PXCuratedLibraryOverlayButtonConfiguration *)self forcePointerInteractionEnabled];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXCuratedLibraryOverlayButtonConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      uint64_t v6 = [(PXCuratedLibraryOverlayButtonConfiguration *)v5 style];
      if (v6 == [(PXCuratedLibraryOverlayButtonConfiguration *)self style])
      {
        int64_t v7 = [(PXCuratedLibraryOverlayButtonConfiguration *)self segment];
        if (v7 == [(PXCuratedLibraryOverlayButtonConfiguration *)v5 segment])
        {
          [(PXCuratedLibraryOverlayButtonConfiguration *)self imageEdgeInsets];
          [(PXCuratedLibraryOverlayButtonConfiguration *)v5 imageEdgeInsets];
          PXEdgeInsetsEqualToEdgeInsets();
        }
      }
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (PXCuratedLibraryOverlayButtonConfiguration)initWithSystemImageName:(id)a3 title:(id)a4 spec:(id)a5 buttonType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PXCuratedLibraryOverlayButtonConfiguration;
  uint64_t v13 = [(PXCuratedLibraryOverlayButtonConfiguration *)&v31 init];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v13->_spec, a5);
  uint64_t v15 = [v11 copy];
  title = v14->_title;
  v14->_title = (NSString *)v15;

  *(_OWORD *)&v14->_hitTestOutsets.double top = PXDefaultButtonHitTestOutsets;
  *(_OWORD *)&v14->_hitTestOutsets.double bottom = unk_1AB35B450;
  uint64_t v17 = +[PXCuratedLibraryOverlayButton defaultTitleColor];
  tintColor = v14->_tintColor;
  v14->_tintColor = (UIColor *)v17;

  v14->_buttonType = a6;
  int64_t v19 = a6 - 1;
  switch(a6)
  {
    case 1:
      uint64_t v20 = @"PXCuratedLibraryEllipsisButtonAXLabel";
      break;
    case 6:
      uint64_t v20 = @"PXCuratedLibrarySquareGridButtonAXLabel";
      break;
    case 5:
      uint64_t v20 = @"PXCuratedLibraryAspectGridButtonAXLabel";
      break;
    default:
      uint64_t v21 = 0;
      goto LABEL_10;
  }
  uint64_t v21 = PXLocalizedStringFromTable(v20, @"PhotosUICore");
LABEL_10:
  accessibilityTitle = v14->_accessibilityTitle;
  v14->_accessibilityTitle = (NSString *)v21;

  if (a6)
  {
    id v23 = v12;
    uint64_t v24 = v23;
    switch(v19)
    {
      case 0:
        if ([v23 ellipsisButtonSpecialTreatment]
          && [v24 isFloating])
        {
          uint64_t v25 = [v24 variant];
          id v26 = @"ellipsis";
          if (v25 == 2) {
            id v26 = @"person.fill";
          }
          if (v25 == 3) {
            id v26 = @"person.2.fill";
          }
          uint64_t v27 = v26;
        }
        else
        {
          uint64_t v27 = @"ellipsis";
        }
        break;
      case 1:
        uint64_t v27 = @"square.and.arrow.up";
        break;
      case 2:
        uint64_t v27 = @"trash";
        break;
      case 3:
        uint64_t v27 = @"chevron.down";
        break;
      case 4:
        uint64_t v27 = @"rectangle.arrowtriangle.2.inward";
        break;
      case 5:
        uint64_t v27 = @"rectangle.arrowtriangle.2.outward";
        break;
      default:
        uint64_t v27 = 0;
        break;
    }

    systemImageName = v14->_systemImageName;
    v14->_systemImageName = &v27->isa;
  }
  else
  {
    uint64_t v28 = [v10 copy];
    systemImageName = v14->_systemImageName;
    v14->_systemImageName = (NSString *)v28;
  }

LABEL_29:
  return v14;
}

- (PXCuratedLibraryOverlayButtonConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryOverlayButton.m", 374, @"%s is not available as initializer", "-[PXCuratedLibraryOverlayButtonConfiguration init]");

  abort();
}

+ (NSCache)tintedImageCache
{
  if (tintedImageCache_onceToken != -1) {
    dispatch_once(&tintedImageCache_onceToken, &__block_literal_global_168844);
  }
  v2 = (void *)tintedImageCache_cache;
  return (NSCache *)v2;
}

void __62__PXCuratedLibraryOverlayButtonConfiguration_tintedImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)tintedImageCache_cache;
  tintedImageCache_cache = (uint64_t)v0;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithButtonType:(int64_t)a3 title:(id)a4 spec:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [[PXCuratedLibraryOverlayButtonConfiguration alloc] initWithSystemImageName:0 title:v8 spec:v7 buttonType:a3];

  return v9;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithButtonType:(int64_t)a3 spec:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[PXCuratedLibraryOverlayButtonConfiguration alloc] initWithSystemImageName:0 title:0 spec:v5 buttonType:a3];

  return v6;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithSystemImageName:(id)a3 title:(id)a4 spec:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PXCuratedLibraryOverlayButtonConfiguration alloc] initWithSystemImageName:v9 title:v8 spec:v7 buttonType:0];

  return v10;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithTitle:(id)a3 spec:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PXCuratedLibraryOverlayButtonConfiguration alloc] initWithSystemImageName:0 title:v6 spec:v5 buttonType:0];

  return v7;
}

+ (PXCuratedLibraryOverlayButtonConfiguration)configurationWithSystemImageName:(id)a3 spec:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PXCuratedLibraryOverlayButtonConfiguration alloc] initWithSystemImageName:v6 title:0 spec:v5 buttonType:0];

  return v7;
}

@end