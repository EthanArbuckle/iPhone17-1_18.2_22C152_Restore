@interface RUIStyle
+ (RUIStyle)sharedInstance;
+ (id)_staticButtonTitleColorWithTintColor:(id)a3;
+ (id)defaultStyle;
+ (id)frontRowStyle;
+ (id)osloStyle;
+ (id)setupAssistantModalStyle;
+ (id)setupAssistantStyle;
+ (id)watchDefaultStyle;
- (BOOL)supportActivityIndicatorInPinView;
- (BOOL)useNonOBStyleButton;
- (RUIStyle)init;
- (UIColor)backgroundColor;
- (UIColor)buttonRowTextColor;
- (UIColor)detailHeaderLabelTextColor;
- (UIColor)focusedRowTextColor;
- (UIColor)footerLabelTextColor;
- (UIColor)headerLabelTextColor;
- (UIColor)labelRowTextColor;
- (UIColor)radioGroupSelectedColor;
- (UIColor)selectPageDetailTextColor;
- (UIColor)spinnerLabelColor;
- (UIColor)subHeaderLabelTextColor;
- (UIColor)tintColor;
- (UIColor)titleLabelTextColor;
- (UIEdgeInsets)headerMargin;
- (UIFont)footerFont;
- (UIFont)navBarButtonLabelFont;
- (UIFont)spinnerLabelFont;
- (double)footerTopMargin;
- (double)headerContainerSideMargin;
- (double)headerImagePadding;
- (double)minimumHeightOfAdaptiveSheet;
- (double)multiChoiceStackViewElementSpacing;
- (double)multiChoiceStackViewTopAndBottomMargin;
- (double)navBarLabelSpacingWithImage;
- (double)sectionHeaderHeight;
- (double)sectionSpacing;
- (double)subHeaderTopMargin;
- (id)boldButtonTitleColorWithTintColor:(id)a3;
- (int64_t)footerLabelAlignment;
- (int64_t)footerLinkAlignment;
- (int64_t)headerLabelAlignment;
- (int64_t)labelRowTextAlignment;
- (int64_t)navBarActivityIndicatorStyle;
- (int64_t)subHeaderLabelAlignment;
- (int64_t)tableViewStyle;
- (void)applyToNavigationBar:(id)a3;
- (void)applyToNavigationController:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonRowTextColor:(id)a3;
- (void)setDetailHeaderLabelTextColor:(id)a3;
- (void)setFocusedRowTextColor:(id)a3;
- (void)setFooterFont:(id)a3;
- (void)setFooterLabelAlignment:(int64_t)a3;
- (void)setFooterLabelTextColor:(id)a3;
- (void)setFooterLinkAlignment:(int64_t)a3;
- (void)setFooterTopMargin:(double)a3;
- (void)setHeaderContainerSideMargin:(double)a3;
- (void)setHeaderImagePadding:(double)a3;
- (void)setHeaderLabelAlignment:(int64_t)a3;
- (void)setHeaderLabelTextColor:(id)a3;
- (void)setHeaderMargin:(UIEdgeInsets)a3;
- (void)setLabelRowTextAlignment:(int64_t)a3;
- (void)setLabelRowTextColor:(id)a3;
- (void)setMinimumHeightOfAdaptiveSheet:(double)a3;
- (void)setMultiChoiceStackViewElementSpacing:(double)a3;
- (void)setMultiChoiceStackViewTopAndBottomMargin:(double)a3;
- (void)setNavBarButtonLabelFont:(id)a3;
- (void)setNavBarLabelSpacingWithImage:(double)a3;
- (void)setRadioGroupSelectedColor:(id)a3;
- (void)setSectionHeaderHeight:(double)a3;
- (void)setSectionSpacing:(double)a3;
- (void)setSelectPageDetailTextColor:(id)a3;
- (void)setSpinnerLabelColor:(id)a3;
- (void)setSpinnerLabelFont:(id)a3;
- (void)setSubHeaderLabelAlignment:(int64_t)a3;
- (void)setSubHeaderLabelTextColor:(id)a3;
- (void)setSubHeaderTopMargin:(double)a3;
- (void)setTintColor:(id)a3;
- (void)setTitleLabelTextColor:(id)a3;
- (void)setUseNonOBStyleButton:(BOOL)a3;
@end

@implementation RUIStyle

- (RUIStyle)init
{
  v32.receiver = self;
  v32.super_class = (Class)RUIStyle;
  v2 = [(RUIStyle *)&v32 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] tableBackgroundColor];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    uint64_t v7 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    uint64_t v9 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    uint64_t v11 = [MEMORY[0x263F825C8] _labelColor];
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    uint64_t v13 = [MEMORY[0x263F825C8] _labelColor];
    v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    uint64_t v15 = RemoteUIHeaderTextColor();
    v16 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v15;

    uint64_t v17 = RemoteUISubheaderTextColor();
    v18 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v17;

    uint64_t v19 = RemoteUIDetailHeaderTextColor();
    v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    uint64_t v21 = RemoteUIFooterTextColor();
    v22 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v21;

    uint64_t v23 = [MEMORY[0x263F825C8] labelColor];
    v24 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v23;

    int64x2_t v25 = vdupq_n_s64(4uLL);
    *(int64x2_t *)(v2 + 104) = v25;
    *(int64x2_t *)(v2 + 120) = v25;
    *((void *)v2 + 17) = 1;
    uint64_t v26 = RemoteUIFooterFont();
    v27 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v26;

    [v2 setSubHeaderTopMargin:0.0];
    [v2 setHeaderImagePadding:12.0];
    v28 = [MEMORY[0x263F81708] systemFontOfSize:19.0 weight:*MEMORY[0x263F81828]];
    [v2 setNavBarButtonLabelFont:v28];

    [v2 setNavBarLabelSpacingWithImage:8.0];
    [v2 setFooterTopMargin:7.0];
    [v2 setUseNonOBStyleButton:0];
    objc_msgSend(v2, "setHeaderMargin:", 0.0, 0.0, 8.0, 0.0);
    [v2 setHeaderContainerSideMargin:20.0];
    [v2 setSectionHeaderHeight:*MEMORY[0x263F839B8]];
    v29 = [MEMORY[0x263F825C8] _secondaryLabelColor];
    [v2 setSpinnerLabelColor:v29];

    v30 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
    [v2 setSpinnerLabelFont:v30];
  }
  return (RUIStyle *)v2;
}

- (void)setUseNonOBStyleButton:(BOOL)a3
{
  self->_useNonOBStyleButton = a3;
}

- (void)setSubHeaderTopMargin:(double)a3
{
  self->_subHeaderTopMargin = a3;
}

- (void)setSpinnerLabelFont:(id)a3
{
}

- (void)setSpinnerLabelColor:(id)a3
{
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderHeight = a3;
}

- (void)setNavBarLabelSpacingWithImage:(double)a3
{
  self->_navBarLabelSpacingWithImage = a3;
}

- (void)setNavBarButtonLabelFont:(id)a3
{
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (void)setHeaderImagePadding:(double)a3
{
  self->_headerImagePadding = a3;
}

- (void)setHeaderContainerSideMargin:(double)a3
{
  self->_headerContainerSideMargin = a3;
}

- (void)setFooterTopMargin:(double)a3
{
  self->_footerTopMargin = a3;
}

+ (RUIStyle)sharedInstance
{
  uint64_t v3 = (void *)sharedInstance_instances;
  if (!sharedInstance_instances)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = (void *)sharedInstance_instances;
    sharedInstance_instances = v4;

    uint64_t v3 = (void *)sharedInstance_instances;
  }
  v6 = NSStringFromClass((Class)a1);
  uint64_t v7 = [v3 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = objc_opt_new();
    v8 = (void *)sharedInstance_instances;
    uint64_t v9 = NSStringFromClass((Class)a1);
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  return (RUIStyle *)v7;
}

+ (id)defaultStyle
{
  if (defaultStyle_onceToken != -1) {
    dispatch_once(&defaultStyle_onceToken, &__block_literal_global_1);
  }
  if (defaultStyle_isATV)
  {
    v2 = +[RUIStyle frontRowStyle];
  }
  else if (defaultStyle_isAppleWatch)
  {
    v2 = +[RUIStyle watchDefaultStyle];
  }
  else
  {
    v2 = objc_opt_new();
  }
  return v2;
}

uint64_t __24__RUIStyle_defaultStyle__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  defaultStyle_isATV = result == 4;
  defaultStyle_isAppleWatch = result == 6;
  return result;
}

+ (id)osloStyle
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)setupAssistantStyle
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)setupAssistantModalStyle
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)frontRowStyle
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)watchDefaultStyle
{
  return 0;
}

- (int64_t)navBarActivityIndicatorStyle
{
  return 100;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)applyToNavigationController:(id)a3
{
  id v4 = [a3 navigationBar];
  [(RUIStyle *)self applyToNavigationBar:v4];
}

- (void)applyToNavigationBar:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setRequestedContentSize:3];
  if (_isInternalInstall())
  {
    id v4 = _RUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_2144F2000, v4, OS_LOG_TYPE_DEFAULT, "applyToNavigationBar: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)supportActivityIndicatorInPinView
{
  return 0;
}

- (id)boldButtonTitleColorWithTintColor:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F825C8]);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__RUIStyle_boldButtonTitleColorWithTintColor___block_invoke;
    v7[3] = &unk_2642115B8;
    id v8 = v3;
    int v5 = (void *)[v4 initWithDynamicProvider:v7];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

id __46__RUIStyle_boldButtonTitleColorWithTintColor___block_invoke(uint64_t a1)
{
  return +[RUIStyle _staticButtonTitleColorWithTintColor:*(void *)(a1 + 32)];
}

+ (id)_staticButtonTitleColorWithTintColor:(id)a3
{
  id v3 = (CGColor *)[a3 CGColor];
  Components = CGColorGetComponents(v3);
  if (CGColorGetNumberOfComponents(v3) == 2)
  {
    double v5 = *Components;
    double v6 = *Components;
    double v7 = *Components;
  }
  else
  {
    double v7 = *Components;
    double v6 = Components[1];
    double v5 = Components[2];
  }
  if ((v6 * 255.0 * 587.0 + v7 * 255.0 * 299.0 + v5 * 255.0 * 114.0) / 1000.0 >= 125.0) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  id v8 = [MEMORY[0x263F825C8] whiteColor];
  }
  return v8;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)radioGroupSelectedColor
{
  return self->_radioGroupSelectedColor;
}

- (void)setRadioGroupSelectedColor:(id)a3
{
}

- (UIColor)buttonRowTextColor
{
  return self->_buttonRowTextColor;
}

- (void)setButtonRowTextColor:(id)a3
{
}

- (UIColor)labelRowTextColor
{
  return self->_labelRowTextColor;
}

- (void)setLabelRowTextColor:(id)a3
{
}

- (UIColor)selectPageDetailTextColor
{
  return self->_selectPageDetailTextColor;
}

- (void)setSelectPageDetailTextColor:(id)a3
{
}

- (UIColor)titleLabelTextColor
{
  return self->_titleLabelTextColor;
}

- (void)setTitleLabelTextColor:(id)a3
{
}

- (UIColor)headerLabelTextColor
{
  return self->_headerLabelTextColor;
}

- (void)setHeaderLabelTextColor:(id)a3
{
}

- (UIColor)subHeaderLabelTextColor
{
  return self->_subHeaderLabelTextColor;
}

- (void)setSubHeaderLabelTextColor:(id)a3
{
}

- (UIColor)detailHeaderLabelTextColor
{
  return self->_detailHeaderLabelTextColor;
}

- (void)setDetailHeaderLabelTextColor:(id)a3
{
}

- (UIColor)footerLabelTextColor
{
  return self->_footerLabelTextColor;
}

- (void)setFooterLabelTextColor:(id)a3
{
}

- (UIColor)focusedRowTextColor
{
  return self->_focusedRowTextColor;
}

- (void)setFocusedRowTextColor:(id)a3
{
}

- (int64_t)labelRowTextAlignment
{
  return self->_labelRowTextAlignment;
}

- (void)setLabelRowTextAlignment:(int64_t)a3
{
  self->_labelRowTextAlignment = a3;
}

- (int64_t)headerLabelAlignment
{
  return self->_headerLabelAlignment;
}

- (void)setHeaderLabelAlignment:(int64_t)a3
{
  self->_headerLabelAlignment = a3;
}

- (int64_t)subHeaderLabelAlignment
{
  return self->_subHeaderLabelAlignment;
}

- (void)setSubHeaderLabelAlignment:(int64_t)a3
{
  self->_subHeaderLabelAlignment = a3;
}

- (int64_t)footerLabelAlignment
{
  return self->_footerLabelAlignment;
}

- (void)setFooterLabelAlignment:(int64_t)a3
{
  self->_footerLabelAlignment = a3;
}

- (int64_t)footerLinkAlignment
{
  return self->_footerLinkAlignment;
}

- (void)setFooterLinkAlignment:(int64_t)a3
{
  self->_footerLinkAlignment = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIFont)footerFont
{
  return self->_footerFont;
}

- (void)setFooterFont:(id)a3
{
}

- (double)subHeaderTopMargin
{
  return self->_subHeaderTopMargin;
}

- (double)sectionSpacing
{
  return self->_sectionSpacing;
}

- (void)setSectionSpacing:(double)a3
{
  self->_sectionSpacing = a3;
}

- (double)headerImagePadding
{
  return self->_headerImagePadding;
}

- (double)footerTopMargin
{
  return self->_footerTopMargin;
}

- (BOOL)useNonOBStyleButton
{
  return self->_useNonOBStyleButton;
}

- (UIEdgeInsets)headerMargin
{
  double top = self->_headerMargin.top;
  double left = self->_headerMargin.left;
  double bottom = self->_headerMargin.bottom;
  double right = self->_headerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)multiChoiceStackViewTopAndBottomMargin
{
  return self->_multiChoiceStackViewTopAndBottomMargin;
}

- (void)setMultiChoiceStackViewTopAndBottomMargin:(double)a3
{
  self->_multiChoiceStackViewTopAndBottomMargin = a3;
}

- (double)multiChoiceStackViewElementSpacing
{
  return self->_multiChoiceStackViewElementSpacing;
}

- (void)setMultiChoiceStackViewElementSpacing:(double)a3
{
  self->_multiChoiceStackViewElementSpacing = a3;
}

- (double)headerContainerSideMargin
{
  return self->_headerContainerSideMargin;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (UIColor)spinnerLabelColor
{
  return self->_spinnerLabelColor;
}

- (UIFont)spinnerLabelFont
{
  return self->_spinnerLabelFont;
}

- (UIFont)navBarButtonLabelFont
{
  return self->_navBarButtonLabelFont;
}

- (double)navBarLabelSpacingWithImage
{
  return self->_navBarLabelSpacingWithImage;
}

- (double)minimumHeightOfAdaptiveSheet
{
  return self->_minimumHeightOfAdaptiveSheet;
}

- (void)setMinimumHeightOfAdaptiveSheet:(double)a3
{
  self->_minimumHeightOfAdaptiveSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarButtonLabelFont, 0);
  objc_storeStrong((id *)&self->_spinnerLabelFont, 0);
  objc_storeStrong((id *)&self->_spinnerLabelColor, 0);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_focusedRowTextColor, 0);
  objc_storeStrong((id *)&self->_footerLabelTextColor, 0);
  objc_storeStrong((id *)&self->_detailHeaderLabelTextColor, 0);
  objc_storeStrong((id *)&self->_subHeaderLabelTextColor, 0);
  objc_storeStrong((id *)&self->_headerLabelTextColor, 0);
  objc_storeStrong((id *)&self->_titleLabelTextColor, 0);
  objc_storeStrong((id *)&self->_selectPageDetailTextColor, 0);
  objc_storeStrong((id *)&self->_labelRowTextColor, 0);
  objc_storeStrong((id *)&self->_buttonRowTextColor, 0);
  objc_storeStrong((id *)&self->_radioGroupSelectedColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end