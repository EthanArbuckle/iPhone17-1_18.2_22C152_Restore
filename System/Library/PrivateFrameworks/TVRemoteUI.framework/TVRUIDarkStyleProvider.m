@interface TVRUIDarkStyleProvider
- (BOOL)hasHomeButton;
- (BOOL)isPad;
- (BOOL)isPhone;
- (BOOL)isSmallDevice;
- (CGSize)captionButtonSize;
- (CGSize)mediaControlsButtonSize;
- (CGSize)primaryButtonSize;
- (CGSize)remoteSize;
- (CGSize)secondaryButtonSize;
- (UIEdgeInsets)captionButtonInsets;
- (UIEdgeInsets)controlPanelInsets;
- (UIEdgeInsets)directionalPadInsetForSmallDevices;
- (UIEdgeInsets)mediaControlsInsets;
- (UIEdgeInsets)rootBackgroundInsets;
- (UIEdgeInsets)secondaryButtonInsets;
- (UIEdgeInsets)topControlPanelInsets;
- (UIEdgeInsets)touchpadInsets;
- (double)_preferredFontSizeForMenuButton;
- (double)controlPanelViewHeight;
- (double)deviceListRowHeight;
- (double)deviceSafeAreaInsetBottom;
- (double)deviceSafeAreaInsetTop;
- (double)deviceTitleHeight;
- (double)directionalPadSelectButtonBorderWidth;
- (double)disabledButtonAlpha;
- (double)inactiveMediaImageViewAlpha;
- (double)mediaControlsViewHeight;
- (double)topButtonPanelHeight;
- (double)topButtonPanelPadding;
- (double)touchpadCompressedCornerRadius;
- (double)touchpadCornerRadius;
- (double)touchpadHeight;
- (double)widthForMessagesView;
- (id)_darkTraitCollectionWithLevel:(int64_t)a3;
- (id)_imageWithName:(id)a3;
- (id)_symbolImageForMediaControlsNamed:(id)a3;
- (id)_symbolImageForMiniPlayerNamed:(id)a3 buttonType:(int64_t)a4;
- (id)_symbolImageForTopControlPanelNamed:(id)a3;
- (id)airplaySetTopBoxIcon;
- (id)airplayStickIcon;
- (id)appleTVIcon;
- (id)captionsButtonIcon:(BOOL)a3;
- (id)cellBackgroundColor;
- (id)cellSeparatorBackgroundColor;
- (id)checkmarkImage;
- (id)chevronImage;
- (id)colorForSpinner;
- (id)controlPanelBackgroundColor;
- (id)controlPanelBackgroundView;
- (id)defaultDeviceTitle;
- (id)devicePickerIconForDeviceModel:(id)a3;
- (id)fontForDeviceListRow;
- (id)fontForDeviceTitle;
- (id)fontForMessageViewDescription;
- (id)fontForMessageViewTitle;
- (id)fontForSpinnerTitle;
- (id)fontForWiFiButton;
- (id)genericTVIcon;
- (id)iconForButtonType:(int64_t)a3;
- (id)iconForButtonType:(int64_t)a3 buttonLocation:(int64_t)a4;
- (id)iconForDeviceModel:(id)a3;
- (id)inactiveMediaControlTintColor;
- (id)inactiveMediaTextColor;
- (id)pagingButtonBackgroundColor;
- (id)pagingButtonFont;
- (id)primaryButtonFont;
- (id)primaryTextAndGlyphColor;
- (id)rootBackgroundColor;
- (id)rootBackgroundView;
- (id)separatorView;
- (id)symbolImageForButtonPanelNamed:(id)a3;
- (id)textColorForSpinnerTitle;
- (id)textForButtonType:(int64_t)a3;
- (id)textForDeviceLockoutAlert;
- (id)textForPairingAlert;
- (id)textForPairingPasswordAlert;
- (id)tintColorForChevronImage;
- (id)tintColorForHints;
- (id)touchpadBackgroundColor;
- (id)tvRemoteImage;
- (unint64_t)maxPagingTitleLength;
@end

@implementation TVRUIDarkStyleProvider

- (CGSize)remoteSize
{
  if ([(TVRUIDarkStyleProvider *)self isPad])
  {
    v2 = [MEMORY[0x263F82B60] mainScreen];
    [v2 bounds];
    double v4 = v3;

    double v5 = 812.0;
    if (v4 + -54.0 <= 812.0) {
      double v5 = v4 + -54.0;
    }
    double v6 = 375.0;
  }
  else
  {
    double v6 = 1.79769313e308;
    double v5 = 1.79769313e308;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)primaryTextAndGlyphColor
{
  return (id)[MEMORY[0x263F825C8] systemWhiteColor];
}

- (id)rootBackgroundView
{
  id v2 = objc_alloc_init(MEMORY[0x263F82E00]);
  return v2;
}

- (UIEdgeInsets)rootBackgroundInsets
{
  if ([(TVRUIDarkStyleProvider *)self isPhone])
  {
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    double v2 = *MEMORY[0x263F834E8];
    double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)rootBackgroundColor
{
  double v2 = [(TVRUIDarkStyleProvider *)self _darkTraitCollectionWithLevel:0];
  double v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  double v4 = [v3 resolvedColorWithTraitCollection:v2];

  return v4;
}

- (id)touchpadBackgroundColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v3 = [MEMORY[0x263F825C8] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
  }
  else
  {
    double v4 = [(TVRUIDarkStyleProvider *)self _darkTraitCollectionWithLevel:0];
    double v5 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    double v3 = [v5 resolvedColorWithTraitCollection:v4];
  }
  return v3;
}

- (double)touchpadHeight
{
  if ([(TVRUIDarkStyleProvider *)self isPhone])
  {
    double v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 _referenceBounds];
    double v5 = v4;

    return v5 * 0.6;
  }
  else
  {
    [(TVRUIDarkStyleProvider *)self remoteSize];
    return v7 * 0.68;
  }
}

- (double)touchpadCornerRadius
{
  return 42.0;
}

- (double)touchpadCompressedCornerRadius
{
  return 20.0;
}

- (UIEdgeInsets)touchpadInsets
{
  if ([(TVRUIDarkStyleProvider *)self hasHomeButton]
    && [(TVRUIDarkStyleProvider *)self isPhone])
  {
    double v3 = 16.0;
    double v4 = 0.0;
    double v5 = 12.0;
  }
  else
  {
    BOOL v6 = [(TVRUIDarkStyleProvider *)self isPhone];
    double v3 = 16.0;
    double v5 = 22.0;
    if (!v6) {
      double v5 = 16.0;
    }
    double v4 = 0.0;
  }
  double v7 = v3;
  result.right = v7;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (double)directionalPadSelectButtonBorderWidth
{
  return 4.0;
}

- (UIEdgeInsets)directionalPadInsetForSmallDevices
{
  double v2 = 10.0;
  double v3 = 10.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)topControlPanelInsets
{
  double v2 = 35.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 35.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (double)controlPanelViewHeight
{
  if (![(TVRUIDarkStyleProvider *)self isPhone]) {
    return 227.36;
  }
  double v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;

  return v4 * 0.28;
}

- (id)controlPanelBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] clearColor];
}

- (id)controlPanelBackgroundView
{
  return 0;
}

- (UIEdgeInsets)controlPanelInsets
{
  double v2 = 0.0;
  double v3 = 14.0;
  double v4 = 0.0;
  double v5 = 14.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)primaryButtonSize
{
  double v2 = 130.0;
  double v3 = 130.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)secondaryButtonSize
{
  double v2 = 84.0;
  double v3 = 84.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)primaryButtonFont
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83628] design:*MEMORY[0x263F817E0] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
}

- (UIEdgeInsets)secondaryButtonInsets
{
  double v2 = 10.0;
  double v3 = 10.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)disabledButtonAlpha
{
  return 0.5;
}

- (double)mediaControlsViewHeight
{
  return 64.0;
}

- (UIEdgeInsets)mediaControlsInsets
{
  [(TVRUIDarkStyleProvider *)self mediaControlsViewHeight];
  double v4 = v3;
  [(TVRUIDarkStyleProvider *)self mediaControlsButtonSize];
  double v6 = (v4 - v5) * 0.5;
  double v7 = 10.0;
  double v8 = 10.0;
  double v9 = v6;
  result.right = v8;
  result.bottom = v9;
  result.left = v7;
  result.top = v6;
  return result;
}

- (CGSize)mediaControlsButtonSize
{
  double v2 = 64.0;
  double v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)captionButtonInsets
{
  [(TVRUIDarkStyleProvider *)self mediaControlsViewHeight];
  double v4 = v3;
  [(TVRUIDarkStyleProvider *)self captionButtonSize];
  double v6 = (v4 - v5) * 0.5;
  double v7 = 10.0;
  double v8 = 10.0;
  double v9 = v6;
  result.right = v8;
  result.bottom = v9;
  result.left = v7;
  result.top = v6;
  return result;
}

- (CGSize)captionButtonSize
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)symbolImageForButtonPanelNamed:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", a3, *MEMORY[0x263F83628], 7, 2, 31.0);
}

- (id)_symbolImageForMediaControlsNamed:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", a3, *MEMORY[0x263F83628], 4, 3, 31.0);
}

- (id)_symbolImageForMiniPlayerNamed:(id)a3 buttonType:(int64_t)a4
{
  id v5 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    double v6 = (void *)MEMORY[0x263F827E8];
    uint64_t v7 = *MEMORY[0x263F83610];
    id v8 = v5;
    uint64_t v9 = 4;
    uint64_t v10 = 2;
LABEL_5:
    v11 = objc_msgSend(v6, "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", v8, v7, v9, v10, 45.0);
    goto LABEL_7;
  }
  if ((unint64_t)(a4 - 9993) <= 1)
  {
    double v6 = (void *)MEMORY[0x263F827E8];
    uint64_t v7 = *MEMORY[0x263F835E0];
    id v8 = v5;
    uint64_t v9 = 7;
    uint64_t v10 = 3;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)_symbolImageForTopControlPanelNamed:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x263F82770];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = *MEMORY[0x263F83628];
  uint64_t v7 = (void *)[v5 initForTextStyle:*MEMORY[0x263F83628]];
  id v8 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v6 design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
  uint64_t v9 = [v7 scaledFontForFont:v8 maximumPointSize:31.0];

  uint64_t v10 = (void *)MEMORY[0x263F827E8];
  [v9 pointSize];
  v11 = objc_msgSend(v10, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v4, v9, 5, 2);

  return v11;
}

- (id)iconForButtonType:(int64_t)a3
{
  return [(TVRUIDarkStyleProvider *)self iconForButtonType:a3 buttonLocation:1];
}

- (id)iconForButtonType:(int64_t)a3 buttonLocation:(int64_t)a4
{
  if (a3 <= 24)
  {
    switch(a3)
    {
      case 2:
        if (+[TVRUIFeatures swapBackPlayPauseButtonsEnabled])
        {
          uint64_t v6 = (void *)MEMORY[0x263F827E8];
          uint64_t v7 = *MEMORY[0x263F83618];
          id v8 = @"chevron.backward";
          double v9 = 31.0;
          uint64_t v10 = 3;
          goto LABEL_39;
        }
        v14 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83628] design:*MEMORY[0x263F817E0] weight:*MEMORY[0x263F81838]];
        [(TVRUIDarkStyleProvider *)self _preferredFontSizeForMenuButton];
        v20 = (void *)MEMORY[0x263F827E8];
        v22 = @"chevron.backward";
        v23 = v14;
        uint64_t v21 = 4;
        goto LABEL_36;
      case 3:
        v14 = objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", @"tv", *MEMORY[0x263F83628], 5, 3, 31.0);
        v15 = (void *)MEMORY[0x263F82818];
        v16 = [MEMORY[0x263F825C8] tintColor];
        v17 = [v15 configurationWithHierarchicalColor:v16];

        v18 = [v14 imageByApplyingSymbolConfiguration:v17];

        goto LABEL_37;
      case 4:
        id v5 = @"mic.fill";
        goto LABEL_30;
      case 5:
        if (!+[TVRUIFeatures swapBackPlayPauseButtonsEnabled])
        {
          uint64_t v6 = (void *)MEMORY[0x263F827E8];
          id v8 = @"playpause.fill";
          double v9 = 31.0;
          uint64_t v7 = *MEMORY[0x263F83618];
          uint64_t v10 = 2;
LABEL_39:
          uint64_t v13 = objc_msgSend(v6, "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", v8, v7, 4, v10, v9);
          goto LABEL_31;
        }
        double v19 = *MEMORY[0x263F81838];
        v14 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83618] design:*MEMORY[0x263F817E0] weight:*MEMORY[0x263F81838]];
        [(TVRUIDarkStyleProvider *)self _preferredFontSizeForMenuButton];
        v20 = (void *)MEMORY[0x263F827E8];
        uint64_t v21 = (uint64_t)v19;
        v22 = @"playpause.fill";
        v23 = v14;
LABEL_36:
        v18 = objc_msgSend(v20, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v22, v23, v21, 2);
LABEL_37:

        break;
      case 6:
        v11 = @"goforward.10";
        if (a4 != 2) {
          goto LABEL_26;
        }
        uint64_t v24 = 6;
        goto LABEL_24;
      case 7:
        v11 = @"gobackward.10";
        if (a4 != 2) {
          goto LABEL_26;
        }
        uint64_t v24 = 7;
LABEL_24:
        uint64_t v13 = [(TVRUIDarkStyleProvider *)self _symbolImageForMiniPlayerNamed:v11 buttonType:v24];
        goto LABEL_31;
      default:
        goto LABEL_28;
    }
  }
  else
  {
    if (a3 <= 9991)
    {
      switch(a3)
      {
        case 25:
          id v5 = @"info";
          goto LABEL_30;
        case 28:
          v11 = @"list.bullet";
          goto LABEL_26;
        case 29:
          v12 = @"speaker.slash";
          break;
        case 30:
          v12 = @"power";
          break;
        default:
          goto LABEL_28;
      }
      uint64_t v13 = -[TVRUIDarkStyleProvider _symbolImageForTopControlPanelNamed:](self, "_symbolImageForTopControlPanelNamed:", v12, a4);
      goto LABEL_31;
    }
    switch(a3)
    {
      case 9992:
        v11 = @"info.circle";
LABEL_26:
        uint64_t v13 = -[TVRUIDarkStyleProvider _symbolImageForMediaControlsNamed:](self, "_symbolImageForMediaControlsNamed:", v11, a4);
        goto LABEL_31;
      case 9998:
        id v5 = @"magnifyingglass";
        goto LABEL_30;
      case 9999:
        id v5 = @"keyboard";
LABEL_30:
        uint64_t v13 = -[TVRUIDarkStyleProvider symbolImageForButtonPanelNamed:](self, "symbolImageForButtonPanelNamed:", v5, a4);
LABEL_31:
        v18 = (void *)v13;
        goto LABEL_32;
    }
LABEL_28:
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
    {
      id v5 = @"speaker.wave.2.fill";
      goto LABEL_30;
    }
    switch(a3)
    {
      case 9993:
        v11 = @"play.fill";
        uint64_t v24 = 9993;
        goto LABEL_24;
      case 9994:
        v11 = @"pause.fill";
        uint64_t v24 = 9994;
        goto LABEL_24;
      case 9995:
        v11 = @"forward.fill";
        goto LABEL_26;
      case 9996:
        v11 = @"backward.fill";
        goto LABEL_26;
      default:
        v18 = 0;
        break;
    }
  }
LABEL_32:
  return v18;
}

- (id)captionsButtonIcon:(BOOL)a3
{
  if (a3) {
    double v3 = @"captions.bubble.fill";
  }
  else {
    double v3 = @"captions.bubble";
  }
  id v4 = [(TVRUIDarkStyleProvider *)self _symbolImageForMediaControlsNamed:v3];
  return v4;
}

- (id)tintColorForHints
{
  double v2 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  double v3 = [v2 colorWithAlphaComponent:1.0];

  return v3;
}

- (id)textForButtonType:(int64_t)a3
{
  switch(a3)
  {
    case 24:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"TVRemoteUIExitButtonText";
      goto LABEL_7;
    case 23:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"TVRemoteUIBackButtonText";
      goto LABEL_7;
    case 2:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"TVRemoteUIMenuButtonText";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_26DB4CAE0 table:@"Localizable"];

      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:
  return v6;
}

- (id)chevronImage
{
  id v2 = objc_alloc(MEMORY[0x263F82770]);
  uint64_t v3 = *MEMORY[0x263F835B8];
  id v4 = (void *)[v2 initForTextStyle:*MEMORY[0x263F835B8]];
  id v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v3 design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
  uint64_t v6 = [v4 scaledFontForFont:v5 maximumPointSize:31.0];

  uint64_t v7 = (void *)MEMORY[0x263F827E8];
  [v6 pointSize];
  id v8 = objc_msgSend(v7, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", @"chevron.forward", v6, 5, 2);

  return v8;
}

- (id)tintColorForChevronImage
{
  id v2 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
  uint64_t v3 = [v2 colorWithAlphaComponent:1.0];

  return v3;
}

- (id)checkmarkImage
{
  id v2 = objc_alloc(MEMORY[0x263F82770]);
  uint64_t v3 = *MEMORY[0x263F83570];
  id v4 = (void *)[v2 initForTextStyle:*MEMORY[0x263F83570]];
  id v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v3 design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
  uint64_t v6 = [v4 scaledFontForFont:v5 maximumPointSize:31.0];

  uint64_t v7 = (void *)MEMORY[0x263F827E8];
  [v6 pointSize];
  id v8 = objc_msgSend(v7, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", @"checkmark", v6, 5, 2);

  return v8;
}

- (id)tvRemoteImage
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", @"appletvremote.gen4.fill", *MEMORY[0x263F83570], 4, 2, 31.0);
}

- (id)fontForDeviceTitle
{
  id v2 = objc_alloc(MEMORY[0x263F82770]);
  uint64_t v3 = *MEMORY[0x263F835D0];
  id v4 = (void *)[v2 initForTextStyle:*MEMORY[0x263F835D0]];
  id v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v3 design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
  uint64_t v6 = [v4 scaledFontForFont:v5 maximumPointSize:40.0];

  return v6;
}

- (double)deviceTitleHeight
{
  return 44.0;
}

- (double)deviceListRowHeight
{
  return 52.0;
}

- (id)defaultDeviceTitle
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"TVRemoteUIDefaultDropDownTextGeneric" value:&stru_26DB4CAE0 table:@"Localizable"];

  return v3;
}

- (id)separatorView
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v4 = [(TVRUIDarkStyleProvider *)self cellSeparatorBackgroundColor];
  [v3 setBackgroundColor:v4];

  return v3;
}

- (id)fontForDeviceListRow
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
}

- (id)cellBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] blackColor];
}

- (id)cellSeparatorBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] systemGray5Color];
}

- (id)textForPairingAlert
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TVRemoteUIPairingEnterPasscodeString" value:&stru_26DB4CAE0 table:@"Localizable"];

  return v3;
}

- (id)textForPairingPasswordAlert
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TVRemoteUIPairingEnterPasswordString" value:&stru_26DB4CAE0 table:@"Localizable"];

  return v3;
}

- (id)textForDeviceLockoutAlert
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TVRemoteUIPairingLockoutOkText" value:&stru_26DB4CAE0 table:@"Localizable"];

  return v3;
}

- (double)widthForMessagesView
{
  return 281.0;
}

- (id)fontForMessageViewTitle
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
}

- (id)fontForMessageViewDescription
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
}

- (id)fontForSpinnerTitle
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
}

- (id)textColorForSpinnerTitle
{
  return (id)[MEMORY[0x263F825C8] colorWithDisplayP3Red:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.3];
}

- (id)colorForSpinner
{
  return (id)[MEMORY[0x263F825C8] colorWithDisplayP3Red:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.3];
}

- (id)devicePickerIconForDeviceModel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F7CA48]])
  {
    id v4 = @"tv";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F7CA40]])
  {
    id v4 = @"mediastick";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F7CA38]])
  {
    id v4 = @"tv.and.mediabox";
  }
  else
  {
    id v4 = @"appletv.fill";
  }
  id v5 = objc_alloc(MEMORY[0x263F82770]);
  uint64_t v6 = *MEMORY[0x263F83570];
  uint64_t v7 = (void *)[v5 initForTextStyle:*MEMORY[0x263F83570]];
  id v8 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v6 maximumContentSizeCategory:*MEMORY[0x263F83420]];
  double v9 = [v7 scaledFontForFont:v8 maximumPointSize:31.0];

  uint64_t v10 = (void *)MEMORY[0x263F827E8];
  [v9 pointSize];
  v11 = objc_msgSend(v10, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v4, v9, 5, 3);
  v12 = [MEMORY[0x263F82818] configurationPreferringMonochrome];
  uint64_t v13 = [v11 imageByApplyingSymbolConfiguration:v12];

  return v13;
}

- (id)iconForDeviceModel:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F7CA48]])
  {
    uint64_t v5 = [(TVRUIDarkStyleProvider *)self genericTVIcon];
  }
  else if ([v4 isEqualToString:*MEMORY[0x263F7CA40]])
  {
    uint64_t v5 = [(TVRUIDarkStyleProvider *)self airplayStickIcon];
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x263F7CA38]]) {
      [(TVRUIDarkStyleProvider *)self airplaySetTopBoxIcon];
    }
    else {
    uint64_t v5 = [(TVRUIDarkStyleProvider *)self appleTVIcon];
    }
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)appleTVIcon
{
  id v2 = [(TVRUIDarkStyleProvider *)self fontForDeviceTitle];
  id v3 = (void *)MEMORY[0x263F827E8];
  [v2 pointSize];
  id v4 = objc_msgSend(v3, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", @"appletv.fill", v2, 4, 2);

  return v4;
}

- (id)genericTVIcon
{
  return [(TVRUIDarkStyleProvider *)self _imageWithName:@"IconGenericTV"];
}

- (id)airplayStickIcon
{
  return [(TVRUIDarkStyleProvider *)self _imageWithName:@"IconAirplayStick"];
}

- (id)airplaySetTopBoxIcon
{
  return [(TVRUIDarkStyleProvider *)self _imageWithName:@"IconAirplaySetTopBox"];
}

- (id)fontForWiFiButton
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
}

- (double)deviceSafeAreaInsetTop
{
  BOOL v2 = [(TVRUIDarkStyleProvider *)self isPad];
  double result = 53.0;
  if (v2) {
    return 12.0;
  }
  return result;
}

- (double)deviceSafeAreaInsetBottom
{
  BOOL v3 = [(TVRUIDarkStyleProvider *)self hasHomeButton];
  double result = 0.0;
  if (!v3)
  {
    BOOL v5 = [(TVRUIDarkStyleProvider *)self isPad];
    double result = 34.0;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (double)topButtonPanelHeight
{
  return 44.0;
}

- (double)topButtonPanelPadding
{
  BOOL v3 = [(TVRUIDarkStyleProvider *)self hasHomeButton];
  double result = 4.0;
  if (!v3)
  {
    BOOL v5 = [(TVRUIDarkStyleProvider *)self isPad];
    double result = 44.0;
    if (v5) {
      return 4.0;
    }
  }
  return result;
}

- (id)pagingButtonFont
{
  id v2 = objc_alloc(MEMORY[0x263F82770]);
  uint64_t v3 = *MEMORY[0x263F835E8];
  id v4 = (void *)[v2 initForTextStyle:*MEMORY[0x263F835E8]];
  BOOL v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v3 design:*MEMORY[0x263F817E0] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
  uint64_t v6 = [v4 scaledFontForFont:v5 maximumPointSize:38.0];

  return v6;
}

- (unint64_t)maxPagingTitleLength
{
  return 4;
}

- (id)pagingButtonBackgroundColor
{
  id v2 = [(TVRUIDarkStyleProvider *)self _darkTraitCollectionWithLevel:1];
  uint64_t v3 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  id v4 = [v3 resolvedColorWithTraitCollection:v2];

  return v4;
}

- (BOOL)isSmallDevice
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  if (v4 <= 667.0)
  {
    BOOL v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[TVRUIDarkStyleProvider isSmallDevice]";
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s returned YES", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 <= 667.0;
}

- (BOOL)isPhone
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (BOOL)isPad
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (id)inactiveMediaTextColor
{
  return (id)[MEMORY[0x263F825C8] grayColor];
}

- (id)inactiveMediaControlTintColor
{
  return (id)[MEMORY[0x263F825C8] grayColor];
}

- (double)inactiveMediaImageViewAlpha
{
  return 0.55;
}

- (BOOL)hasHomeButton
{
  if (hasHomeButton_onceToken_0 != -1) {
    dispatch_once(&hasHomeButton_onceToken_0, &__block_literal_global_17);
  }
  return hasHomeButton_hasHomeButton_0;
}

uint64_t __39__TVRUIDarkStyleProvider_hasHomeButton__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  hasHomeButton_hasHomeButton_0 = result != 2;
  return result;
}

- (id)_darkTraitCollectionWithLevel:(int64_t)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__TVRUIDarkStyleProvider__darkTraitCollectionWithLevel___block_invoke;
  v5[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v5[4] = a3;
  BOOL v3 = [MEMORY[0x263F82DA0] traitCollectionWithTraits:v5];
  return v3;
}

void __56__TVRUIDarkStyleProvider__darkTraitCollectionWithLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setUserInterfaceLevel:v2];
  [v3 setUserInterfaceStyle:2];
}

- (id)_imageWithName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  BOOL v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:v5];

  int v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

- (double)_preferredFontSizeForMenuButton
{
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83490])) {
    return 42.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83458])) {
    return 36.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83488])) {
    return 38.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83470])) {
    return 40.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83468])) {
    return 42.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83450])) {
    return 45.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83440])) {
    return 48.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83430])) {
    return 51.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83420])) {
    return 54.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83418])) {
    return 57.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83410])) {
    return 60.0;
  }
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83408])) {
    return 63.0;
  }
  id v4 = (void *)*MEMORY[0x263F83400];
  if (_TVRUIIsCategory((void *)*MEMORY[0x263F83400])) {
    return 66.0;
  }
  int v5 = _TVRUIIsCategory(v4);
  double result = 42.0;
  if (v5) {
    return 70.0;
  }
  return result;
}

@end