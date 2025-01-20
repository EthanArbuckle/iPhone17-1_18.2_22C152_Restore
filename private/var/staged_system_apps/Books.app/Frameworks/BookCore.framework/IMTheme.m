@interface IMTheme
+ (BOOL)isAutoNightModeEnabled;
+ (IMTheme)themeWithIdentifier:(id)a3;
+ (id)_themeForIdentifier:(id)a3;
+ (void)initialize;
+ (void)setAutoNightModeEnabled:(BOOL)a3;
- (BOOL)imageMultiplyExpandedContentMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNight:(id)a3;
- (BOOL)overlayContentBackgroundColor;
- (BOOL)shouldInvertContent;
- (BOOL)tableViewToolbarTranslucent;
- (IMTheme)init;
- (NSString)gaijiImageFilter;
- (NSString)identifier;
- (NSString)themeIdentifier;
- (UIColor)appearancePopoverBackgroundColor;
- (UIColor)bookmarkLabelColor;
- (UIColor)bookmarkPageNumberColor;
- (UIColor)buttonTitleColor;
- (UIColor)buttonTitleColorDisabled;
- (UIColor)buyButtonColor;
- (UIColor)contentTextColor;
- (UIColor)dividerColor;
- (UIColor)finishedButtonBackgroundColor;
- (UIColor)finishedButtonDisabledBackgroundColor;
- (UIColor)finishedButtonDisabledTextColor;
- (UIColor)finishedButtonTextColor;
- (UIColor)finishedCheckmarkColor;
- (UIColor)footerTextColor;
- (UIColor)groupTableViewBackgroundColor;
- (UIColor)headerTextColor;
- (UIColor)headerTextColorDimmed;
- (UIColor)keyColor;
- (UIColor)linkActiveColor;
- (UIColor)linkColor;
- (UIColor)linkVisitedColor;
- (UIColor)menuTitleColor;
- (UIColor)nowPlayingHeaderColor;
- (UIColor)pageCurlBackPageColor;
- (UIColor)popoverBackgroundColor;
- (UIColor)popoverControlColor;
- (UIColor)popoverTitleColor;
- (UIColor)searchPopoverTextColor;
- (UIColor)searchPopoverTintColor;
- (UIColor)speakScreenHighlightColor;
- (UIColor)speakScreenUnderlineColor;
- (UIColor)systemGrayColor;
- (UIColor)tableViewBackgroundColor;
- (UIColor)tableViewCellBackgroundColor;
- (UIColor)tableViewCellSelectedColor;
- (UIColor)tableViewHeaderViewColor;
- (UIColor)tableViewSeparatorColor;
- (UIColor)tableViewToolbarColor;
- (UIColor)tintColor;
- (UIColor)tocPageNumberTextColor;
- (UIColor)toolbarTitleColor;
- (UIFont)buttonTitleFont;
- (UIFont)menuTitleFont;
- (double)pageTurnSpineAlpha;
- (double)sliderAlpha;
- (id)backgroundColorForTraitCollection:(id)a3;
- (id)backgroundColorForTraitEnvironment:(id)a3;
- (id)compositingFilter;
- (int)annotationBlendMode;
- (int)highlightedAnnotationBlendMode;
- (int64_t)annotationPageTheme;
- (int64_t)contentStatusBarStyle;
- (int64_t)keyboardAppearance;
- (unint64_t)textHighlightType;
- (void)setAnnotationBlendMode:(int)a3;
- (void)setAnnotationPageTheme:(int64_t)a3;
- (void)setAppearancePopoverBackgroundColor:(id)a3;
- (void)setBookmarkLabelColor:(id)a3;
- (void)setBookmarkPageNumberColor:(id)a3;
- (void)setButtonTitleColor:(id)a3;
- (void)setButtonTitleColorDisabled:(id)a3;
- (void)setButtonTitleFont:(id)a3;
- (void)setBuyButtonColor:(id)a3;
- (void)setCompositingFilter:(id)a3;
- (void)setContentStatusBarStyle:(int64_t)a3;
- (void)setContentTextColor:(id)a3;
- (void)setDividerColor:(id)a3;
- (void)setFinishedButtonBackgroundColor:(id)a3;
- (void)setFinishedButtonDisabledBackgroundColor:(id)a3;
- (void)setFinishedButtonDisabledTextColor:(id)a3;
- (void)setFinishedButtonTextColor:(id)a3;
- (void)setFinishedCheckmarkColor:(id)a3;
- (void)setFooterTextColor:(id)a3;
- (void)setGaijiImageFilter:(id)a3;
- (void)setGroupTableViewBackgroundColor:(id)a3;
- (void)setHeaderTextColor:(id)a3;
- (void)setHeaderTextColorDimmed:(id)a3;
- (void)setHighlightedAnnotationBlendMode:(int)a3;
- (void)setImageMultiplyExpandedContentMode:(BOOL)a3;
- (void)setKeyColor:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setLinkActiveColor:(id)a3;
- (void)setLinkColor:(id)a3;
- (void)setLinkVisitedColor:(id)a3;
- (void)setMenuTitleColor:(id)a3;
- (void)setMenuTitleFont:(id)a3;
- (void)setOverlayContentBackgroundColor:(BOOL)a3;
- (void)setPageCurlBackPageColor:(id)a3;
- (void)setPageTurnSpineAlpha:(double)a3;
- (void)setPopoverBackgroundColor:(id)a3;
- (void)setPopoverControlColor:(id)a3;
- (void)setPopoverTitleColor:(id)a3;
- (void)setSearchPopoverTextColor:(id)a3;
- (void)setSearchPopoverTintColor:(id)a3;
- (void)setShouldInvertContent:(BOOL)a3;
- (void)setSliderAlpha:(double)a3;
- (void)setSpeakScreenHighlightColor:(id)a3;
- (void)setSpeakScreenUnderlineColor:(id)a3;
- (void)setSystemGrayColor:(id)a3;
- (void)setTableViewBackgroundColor:(id)a3;
- (void)setTableViewCellBackgroundColor:(id)a3;
- (void)setTableViewCellSelectedColor:(id)a3;
- (void)setTableViewHeaderViewColor:(id)a3;
- (void)setTableViewSeparatorColor:(id)a3;
- (void)setTableViewToolbarColor:(id)a3;
- (void)setTableViewToolbarTranslucent:(BOOL)a3;
- (void)setTextHighlightType:(unint64_t)a3;
- (void)setThemeIdentifier:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTocPageNumberTextColor:(id)a3;
- (void)setToolbarTitleColor:(id)a3;
- (void)stylizeBCNavigationBar:(id)a3;
- (void)stylizeBCNavigationBarTranslucent:(id)a3;
- (void)stylizeBCNavigationBarTransparent:(id)a3;
- (void)stylizeBCToolbar:(id)a3;
- (void)stylizeBCToolbarTranslucent:(id)a3;
- (void)stylizeBarButtonItemDelete:(id)a3;
- (void)stylizeButton:(id)a3;
- (void)stylizeKeyboard:(id)a3;
- (void)stylizeMenuTableViewCell:(id)a3;
- (void)stylizeNavigationController:(id)a3;
- (void)stylizeOuterView:(id)a3;
- (void)stylizeScrollView:(id)a3;
- (void)stylizeSlider:(id)a3;
- (void)stylizeTableView:(id)a3;
- (void)stylizeTableViewCell:(id)a3;
- (void)stylizeToolbarButtonDelete:(id)a3;
@end

@implementation IMTheme

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = @"BKFlowingBookViewControllerAutoNightModeOnKey";
    v5 = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

+ (BOOL)isAutoNightModeEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKFlowingBookViewControllerAutoNightModeOnKey"];

  return v3;
}

+ (void)setAutoNightModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"BKFlowingBookViewControllerAutoNightModeOnKey"];
}

- (IMTheme)init
{
  v27.receiver = self;
  v27.super_class = (Class)IMTheme;
  v2 = [(IMTheme *)&v27 init];
  if (v2)
  {
    BOOL v3 = +[UIColor systemBlueColor];
    [(IMTheme *)v2 setTintColor:v3];

    [(IMTheme *)v2 setShouldInvertContent:0];
    [(IMTheme *)v2 setOverlayContentBackgroundColor:0];
    [(IMTheme *)v2 setAnnotationBlendMode:1];
    [(IMTheme *)v2 setHighlightedAnnotationBlendMode:3];
    [(IMTheme *)v2 setAnnotationPageTheme:4];
    [(IMTheme *)v2 setTextHighlightType:3];
    id v4 = +[UIColor darkGrayColor];
    [(IMTheme *)v2 setHeaderTextColor:v4];

    v5 = +[UIFont systemFontOfSize:16.0 weight:UIFontWeightLight];
    [(IMTheme *)v2 setButtonTitleFont:v5];

    v6 = +[UIColor colorWithWhite:0.678431373 alpha:1.0];
    [(IMTheme *)v2 setButtonTitleColorDisabled:v6];

    v7 = +[UIColor blackColor];
    [(IMTheme *)v2 setContentTextColor:v7];

    v8 = +[UIFont systemFontOfSize:21.0];
    [(IMTheme *)v2 setMenuTitleFont:v8];

    v9 = +[UIColor tableCellBlueTextColor];
    [(IMTheme *)v2 setMenuTitleColor:v9];

    v10 = +[UIColor colorWithWhite:0.7 alpha:1.0];
    [(IMTheme *)v2 setDividerColor:v10];

    v11 = +[UIColor blackColor];
    [(IMTheme *)v2 setToolbarTitleColor:v11];

    v12 = +[UIColor whiteColor];
    [(IMTheme *)v2 setPopoverBackgroundColor:v12];

    v13 = +[UIColor bc_booksSecondaryLabelColor];
    [(IMTheme *)v2 setBookmarkPageNumberColor:v13];

    v14 = +[UIColor bc_booksLabelColor];
    [(IMTheme *)v2 setBookmarkLabelColor:v14];

    v15 = +[UIColor whiteColor];
    [(IMTheme *)v2 setTableViewBackgroundColor:v15];

    v16 = +[UIColor systemGroupedBackgroundColor];
    [(IMTheme *)v2 setGroupTableViewBackgroundColor:v16];

    v17 = +[UIColor tableSeparatorLightColor];
    [(IMTheme *)v2 setTableViewSeparatorColor:v17];

    v18 = +[UIColor whiteColor];
    [(IMTheme *)v2 setTableViewCellBackgroundColor:v18];

    v19 = +[UIColor bc_booksTableSelectionColor];
    [(IMTheme *)v2 setTableViewCellSelectedColor:v19];

    v20 = +[UIColor colorWithWhite:0.941176471 alpha:1.0];
    [(IMTheme *)v2 setTableViewHeaderViewColor:v20];

    v21 = +[UIColor colorWithWhite:0.941176471 alpha:1.0];
    [(IMTheme *)v2 setTableViewToolbarColor:v21];

    v22 = +[UIColor colorWithWhite:0.6 alpha:1.0];
    [(IMTheme *)v2 setTocPageNumberTextColor:v22];

    v23 = +[UIColor blackColor];
    [(IMTheme *)v2 setKeyColor:v23];

    v24 = +[UIColor colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.45];
    [(IMTheme *)v2 setSystemGrayColor:v24];

    v25 = +[UIColor colorWithRed:0.294117647 green:0.0 blue:0.509803922 alpha:1.0];
    [(IMTheme *)v2 setLinkColor:v25];

    [(IMTheme *)v2 setPageTurnSpineAlpha:1.0];
    [(IMTheme *)v2 setTableViewToolbarTranslucent:1];
    [(IMTheme *)v2 setTextHighlightType:4];
    [(IMTheme *)v2 setKeyboardAppearance:0];
    [(IMTheme *)v2 setContentStatusBarStyle:0];
    [(IMTheme *)v2 setGaijiImageFilter:0];
    [(IMTheme *)v2 setSpeakScreenHighlightColor:0];
    [(IMTheme *)v2 setSpeakScreenUnderlineColor:0];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = BUDynamicCast();

  if (v5)
  {
    v6 = [(IMTheme *)self themeIdentifier];
    v7 = [v5 themeIdentifier];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isNight:(id)a3
{
  return 0;
}

+ (id)_themeForIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kIMThemeIdentifierBookshelfTheme[0]])
  {
    id v4 = off_2C2970;
LABEL_19:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_20;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierBookshelfNightTheme[0]])
  {
    id v4 = off_2C2978;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierDefaultPageTheme[0]])
  {
    id v4 = off_2C2980;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierWhitePageTheme[0]])
  {
    id v4 = &off_2C29A8;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierSepiaPageTheme[0]])
  {
    id v4 = off_2C29A0;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierGrayPageTheme[0]])
  {
    id v4 = off_2C2990;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierNightPageTheme[0]])
  {
    id v4 = off_2C2998;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierBlissClassicTheme[0]])
  {
    id v4 = off_2C2968;
    goto LABEL_19;
  }
  if ([v3 isEqualToString:kIMThemeIdentifierDynamicTheme[0]])
  {
    id v4 = off_2C2988;
    goto LABEL_19;
  }
  id v5 = 0;
LABEL_20:
  [v5 setThemeIdentifier:v3];

  return v5;
}

+ (IMTheme)themeWithIdentifier:(id)a3
{
  id v4 = a3;
  if (qword_349660 != -1) {
    dispatch_once(&qword_349660, &stru_2CAEC8);
  }
  id v5 = [(id)qword_349658 objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [a1 _themeForIdentifier:v4];
    [(id)qword_349658 setObject:v5 forKeyedSubscript:v4];
  }

  return (IMTheme *)v5;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  return [(IMTheme *)self backgroundColorForTraitCollection:0];
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  return 0;
}

- (void)stylizeOuterView:(id)a3
{
  id v4 = a3;
  id v5 = [(IMTheme *)self tintColor];
  [v4 setTintColor:v5];
}

- (void)stylizeButton:(id)a3
{
  id v25 = a3;
  id v4 = [(IMTheme *)self buttonTitleFont];

  if (v4)
  {
    id v5 = [(IMTheme *)self buttonTitleFont];
    v6 = [v25 titleLabel];
    [v6 setFont:v5];
  }
  objc_opt_class();
  v7 = BUDynamicCast();
  unsigned __int8 v8 = v7;
  if (v7)
  {
    v9 = [v7 keyColor];
    [v25 setTitleColor:v9 forState:0];

    v10 = [v8 keyColor];
    v11 = [v10 colorWithAlphaComponent:0.7];
    [v25 setTitleColor:v11 forState:1];

    v12 = [v8 quarternaryTextColor];
    [v25 setTitleColor:v12 forState:2];

    v13 = [v8 keyColor];
    [v25 _setImageColor:v13 forState:0];

    v14 = [v8 keyColor];
    v15 = [v14 colorWithAlphaComponent:0.7];
    [v25 _setImageColor:v15 forState:1];

    uint64_t v16 = [v8 quarternaryTextColor];
LABEL_9:
    v24 = (void *)v16;
    [v25 _setImageColor:v16 forState:2];

    goto LABEL_10;
  }
  v17 = [(IMTheme *)self buttonTitleColor];

  if (v17)
  {
    v18 = [(IMTheme *)self buttonTitleColor];
    [v25 setTitleColor:v18 forState:0];

    v19 = [(IMTheme *)self buttonTitleColor];
    [v25 setTitleColor:v19 forState:1];

    v20 = [(IMTheme *)self buttonTitleColor];
    [v25 _setImageColor:v20 forState:0];

    v21 = [(IMTheme *)self buttonTitleColor];
    [v25 _setImageColor:v21 forState:1];
  }
  v22 = [(IMTheme *)self buttonTitleColorDisabled];

  if (v22)
  {
    v23 = [(IMTheme *)self buttonTitleColorDisabled];
    [v25 setTitleColor:v23 forState:2];

    uint64_t v16 = [(IMTheme *)self buttonTitleColorDisabled];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)stylizeBCNavigationBar:(id)a3
{
  id v6 = a3;
  [v6 setBarStyle:0];
  [v6 setTranslucent:0];
  id v4 = [(IMTheme *)self backgroundColorForTraitEnvironment:v6];
  [v6 setBarTintColor:v4];

  id v5 = [(IMTheme *)self keyColor];
  [v6 setTintColor:v5];

  [v6 setSeparatorsVisible:1];
  [v6 setBackgroundHidden:0];
  [v6 setBackgroundImage:0 forBarPosition:0 barMetrics:0];
}

- (void)stylizeBCNavigationBarTranslucent:(id)a3
{
  id v6 = a3;
  [v6 setBarStyle:0];
  [v6 setTranslucent:1];
  id v4 = [(IMTheme *)self backgroundColorForTraitEnvironment:v6];
  [v6 setBarTintColor:v4];

  id v5 = [(IMTheme *)self keyColor];
  [v6 setTintColor:v5];

  [v6 setSeparatorsVisible:1];
  [v6 setBackgroundHidden:0];
  [v6 setBackgroundImage:0 forBarPosition:0 barMetrics:0];
}

- (void)stylizeBCNavigationBarTransparent:(id)a3
{
  id v4 = a3;
  [(IMTheme *)self stylizeBCNavigationBar:v4];
  [v4 setSeparatorsVisible:0];
  id v5 = +[UIColor clearColor];
  [v4 setBarTintColor:v5];

  id v6 = +[UIColor clearColor];
  [v4 setBackgroundColor:v6];

  id v7 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v7 configureWithTransparentBackground];
  [v4 setStandardAppearance:v7];
}

- (void)stylizeBCToolbar:(id)a3
{
  id v6 = a3;
  [v6 setBarStyle:0];
  [v6 setTranslucent:0];
  id v4 = [(IMTheme *)self backgroundColorForTraitEnvironment:v6];
  [v6 setBarTintColor:v4];

  id v5 = [(IMTheme *)self keyColor];
  [v6 setTintColor:v5];

  [v6 setSeparatorsVisible:1];
  [v6 setBackgroundImage:0 forToolbarPosition:0 barMetrics:0];
}

- (void)stylizeBCToolbarTranslucent:(id)a3
{
  id v6 = a3;
  [v6 setBarStyle:0];
  [v6 setTranslucent:1];
  id v4 = [(IMTheme *)self backgroundColorForTraitEnvironment:v6];
  [v6 setBarTintColor:v4];

  id v5 = [(IMTheme *)self keyColor];
  [v6 setTintColor:v5];

  [v6 setSeparatorsVisible:1];
  [v6 setBackgroundImage:0 forToolbarPosition:0 barMetrics:0];
}

- (void)stylizeToolbarButtonDelete:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor systemRedColor];
  [v3 setTintColor:v4];
}

- (void)stylizeBarButtonItemDelete:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor systemRedColor];
  [v3 setTintColor:v4];
}

- (void)stylizeKeyboard:(id)a3
{
  id v6 = a3;
  id v4 = [v6 keyboardAppearance];
  if (v4 != (id)[(IMTheme *)self keyboardAppearance])
  {
    [v6 setKeyboardAppearance:[self keyboardAppearance]];
    objc_opt_class();
    id v5 = BUDynamicCast();
    [v5 reloadInputViews];
  }
}

- (UIColor)popoverControlColor
{
  id v3 = self->_popoverControlColor;
  if (!v3)
  {
    id v3 = [(IMTheme *)self headerTextColor];
  }

  return v3;
}

- (UIColor)appearancePopoverBackgroundColor
{
  id v3 = self->_appearancePopoverBackgroundColor;
  if (!v3)
  {
    id v3 = [(IMTheme *)self groupTableViewBackgroundColor];
  }

  return v3;
}

- (UIColor)searchPopoverTextColor
{
  id v3 = self->_searchPopoverTextColor;
  if (!v3)
  {
    id v3 = [(IMTheme *)self headerTextColor];
  }

  return v3;
}

- (UIColor)searchPopoverTintColor
{
  id v3 = self->_searchPopoverTintColor;
  if (!v3)
  {
    id v3 = [(IMTheme *)self tintColor];
  }

  return v3;
}

- (UIColor)linkVisitedColor
{
  id v3 = self->_linkVisitedColor;
  if (!v3)
  {
    id v3 = [(IMTheme *)self linkColor];
  }

  return v3;
}

- (UIColor)linkActiveColor
{
  id v3 = self->_linkActiveColor;
  if (!v3)
  {
    id v3 = [(IMTheme *)self linkColor];
  }

  return v3;
}

- (UIColor)nowPlayingHeaderColor
{
  return [(IMTheme *)self tableViewHeaderViewColor];
}

- (void)stylizeNavigationController:(id)a3
{
  id v4 = a3;
  id v5 = [(IMTheme *)self tintColor];
  id v6 = [v4 view];
  [v6 setTintColor:v5];

  id v7 = [(IMTheme *)self buttonTitleColor];

  if (v7)
  {
    NSAttributedStringKey v11 = NSForegroundColorAttributeName;
    unsigned __int8 v8 = [(IMTheme *)self buttonTitleColor];
    v12 = v8;
    v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v10 = [v4 navigationBar];
    [v10 setTitleTextAttributes:v9];
  }
}

- (void)stylizeTableViewCell:(id)a3
{
  id v15 = a3;
  id v4 = [(IMTheme *)self tableViewCellBackgroundColor];
  [v15 setBackgroundColor:v4];

  id v5 = [(IMTheme *)self buttonTitleFont];
  id v6 = [v15 textLabel];
  [v6 setFont:v5];

  id v7 = [(IMTheme *)self contentTextColor];
  unsigned __int8 v8 = [v15 textLabel];
  [v8 setTextColor:v7];

  v9 = [v15 selectedBackgroundView];
  v10 = (char *)[v9 tag];

  if (v10 != (unsigned char *)&loc_11E74 + 2)
  {
    id v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v15 setSelectedBackgroundView:v11];

    v12 = [v15 selectedBackgroundView];
    [v12 setTag:73334];
  }
  v13 = [(IMTheme *)self tableViewCellSelectedColor];
  v14 = [v15 selectedBackgroundView];
  [v14 setBackgroundColor:v13];
}

- (void)stylizeMenuTableViewCell:(id)a3
{
  id v15 = a3;
  id v4 = [(IMTheme *)self tableViewCellBackgroundColor];
  [v15 setBackgroundColor:v4];

  id v5 = [(IMTheme *)self menuTitleFont];
  id v6 = [v15 textLabel];
  [v6 setFont:v5];

  id v7 = [(IMTheme *)self menuTitleColor];
  unsigned __int8 v8 = [v15 textLabel];
  [v8 setTextColor:v7];

  v9 = [v15 selectedBackgroundView];
  v10 = (char *)[v9 tag];

  if (v10 != (unsigned char *)&loc_11E74 + 2)
  {
    id v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v15 setSelectedBackgroundView:v11];

    v12 = [v15 selectedBackgroundView];
    [v12 setTag:73334];
  }
  v13 = [(IMTheme *)self tableViewCellSelectedColor];
  v14 = [v15 selectedBackgroundView];
  [v14 setBackgroundColor:v13];
}

- (void)stylizeTableView:(id)a3
{
  id v6 = a3;
  if ([v6 style] == (char *)&def_7D91C + 1) {
    [(IMTheme *)self groupTableViewBackgroundColor];
  }
  else {
  id v4 = [(IMTheme *)self tableViewBackgroundColor];
  }
  [v6 setBackgroundColor:v4];

  id v5 = [(IMTheme *)self tableViewSeparatorColor];
  [v6 setSeparatorColor:v5];
}

- (void)stylizeSlider:(id)a3
{
  id v8 = a3;
  id v4 = +[UIColor clearColor];
  [v8 setBackgroundColor:v4];

  [(IMTheme *)self sliderAlpha];
  double v6 = v5;
  double v7 = 1.0;
  if (v6 != 0.0) {
    [(IMTheme *)self sliderAlpha];
  }
  [v8 setAlpha:v7];
}

- (void)stylizeScrollView:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  id v3 = BUDynamicCast();
  id v4 = v3;
  if (v3)
  {
    if ([v3 userInterfaceStyle] == (char *)&def_7D91C + 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [v6 setIndicatorStyle:v5];
  }
}

- (NSString)themeIdentifier
{
  return self->_themeIdentifier;
}

- (void)setThemeIdentifier:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)headerTextColor
{
  return self->_headerTextColor;
}

- (void)setHeaderTextColor:(id)a3
{
}

- (UIColor)headerTextColorDimmed
{
  return self->_headerTextColorDimmed;
}

- (void)setHeaderTextColorDimmed:(id)a3
{
}

- (UIColor)footerTextColor
{
  return self->_footerTextColor;
}

- (void)setFooterTextColor:(id)a3
{
}

- (UIColor)contentTextColor
{
  return self->_contentTextColor;
}

- (void)setContentTextColor:(id)a3
{
}

- (UIColor)pageCurlBackPageColor
{
  return self->_pageCurlBackPageColor;
}

- (void)setPageCurlBackPageColor:(id)a3
{
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (void)setDividerColor:(id)a3
{
}

- (UIColor)toolbarTitleColor
{
  return self->_toolbarTitleColor;
}

- (void)setToolbarTitleColor:(id)a3
{
}

- (UIColor)linkColor
{
  return self->_linkColor;
}

- (void)setLinkColor:(id)a3
{
}

- (void)setLinkVisitedColor:(id)a3
{
}

- (void)setLinkActiveColor:(id)a3
{
}

- (UIColor)tocPageNumberTextColor
{
  return self->_tocPageNumberTextColor;
}

- (void)setTocPageNumberTextColor:(id)a3
{
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (BOOL)overlayContentBackgroundColor
{
  return self->_overlayContentBackgroundColor;
}

- (void)setOverlayContentBackgroundColor:(BOOL)a3
{
  self->_overlayContentBackgroundColor = a3;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (void)setAnnotationBlendMode:(int)a3
{
  self->_annotationBlendMode = a3;
}

- (int)highlightedAnnotationBlendMode
{
  return self->_highlightedAnnotationBlendMode;
}

- (void)setHighlightedAnnotationBlendMode:(int)a3
{
  self->_highlightedAnnotationBlendMode = a3;
}

- (int64_t)annotationPageTheme
{
  return self->_annotationPageTheme;
}

- (void)setAnnotationPageTheme:(int64_t)a3
{
  self->_annotationPageTheme = a3;
}

- (double)pageTurnSpineAlpha
{
  return self->_pageTurnSpineAlpha;
}

- (void)setPageTurnSpineAlpha:(double)a3
{
  self->_pageTurnSpineAlpha = a3;
}

- (int64_t)contentStatusBarStyle
{
  return self->_contentStatusBarStyle;
}

- (void)setContentStatusBarStyle:(int64_t)a3
{
  self->_contentStatusBarStyle = a3;
}

- (UIFont)buttonTitleFont
{
  return self->_buttonTitleFont;
}

- (void)setButtonTitleFont:(id)a3
{
}

- (UIColor)buttonTitleColor
{
  return self->_buttonTitleColor;
}

- (void)setButtonTitleColor:(id)a3
{
}

- (UIColor)buttonTitleColorDisabled
{
  return self->_buttonTitleColorDisabled;
}

- (void)setButtonTitleColorDisabled:(id)a3
{
}

- (UIFont)menuTitleFont
{
  return self->_menuTitleFont;
}

- (void)setMenuTitleFont:(id)a3
{
}

- (UIColor)menuTitleColor
{
  return self->_menuTitleColor;
}

- (void)setMenuTitleColor:(id)a3
{
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (UIColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
}

- (UIColor)popoverTitleColor
{
  return self->_popoverTitleColor;
}

- (void)setPopoverTitleColor:(id)a3
{
}

- (void)setPopoverControlColor:(id)a3
{
}

- (void)setAppearancePopoverBackgroundColor:(id)a3
{
}

- (void)setSearchPopoverTextColor:(id)a3
{
}

- (void)setSearchPopoverTintColor:(id)a3
{
}

- (UIColor)finishedCheckmarkColor
{
  return self->_finishedCheckmarkColor;
}

- (void)setFinishedCheckmarkColor:(id)a3
{
}

- (UIColor)finishedButtonBackgroundColor
{
  return self->_finishedButtonBackgroundColor;
}

- (void)setFinishedButtonBackgroundColor:(id)a3
{
}

- (UIColor)finishedButtonTextColor
{
  return self->_finishedButtonTextColor;
}

- (void)setFinishedButtonTextColor:(id)a3
{
}

- (UIColor)finishedButtonDisabledBackgroundColor
{
  return self->_finishedButtonDisabledBackgroundColor;
}

- (void)setFinishedButtonDisabledBackgroundColor:(id)a3
{
}

- (UIColor)finishedButtonDisabledTextColor
{
  return self->_finishedButtonDisabledTextColor;
}

- (void)setFinishedButtonDisabledTextColor:(id)a3
{
}

- (UIColor)buyButtonColor
{
  return self->_buyButtonColor;
}

- (void)setBuyButtonColor:(id)a3
{
}

- (UIColor)bookmarkPageNumberColor
{
  return self->_bookmarkPageNumberColor;
}

- (void)setBookmarkPageNumberColor:(id)a3
{
}

- (UIColor)bookmarkLabelColor
{
  return self->_bookmarkLabelColor;
}

- (void)setBookmarkLabelColor:(id)a3
{
}

- (UIColor)tableViewBackgroundColor
{
  return self->_tableViewBackgroundColor;
}

- (void)setTableViewBackgroundColor:(id)a3
{
}

- (UIColor)groupTableViewBackgroundColor
{
  return self->_groupTableViewBackgroundColor;
}

- (void)setGroupTableViewBackgroundColor:(id)a3
{
}

- (UIColor)tableViewSeparatorColor
{
  return self->_tableViewSeparatorColor;
}

- (void)setTableViewSeparatorColor:(id)a3
{
}

- (UIColor)tableViewCellBackgroundColor
{
  return self->_tableViewCellBackgroundColor;
}

- (void)setTableViewCellBackgroundColor:(id)a3
{
}

- (UIColor)tableViewCellSelectedColor
{
  return self->_tableViewCellSelectedColor;
}

- (void)setTableViewCellSelectedColor:(id)a3
{
}

- (UIColor)tableViewHeaderViewColor
{
  return self->_tableViewHeaderViewColor;
}

- (void)setTableViewHeaderViewColor:(id)a3
{
}

- (UIColor)tableViewToolbarColor
{
  return self->_tableViewToolbarColor;
}

- (void)setTableViewToolbarColor:(id)a3
{
}

- (BOOL)tableViewToolbarTranslucent
{
  return self->_tableViewToolbarTranslucent;
}

- (void)setTableViewToolbarTranslucent:(BOOL)a3
{
  self->_tableViewToolbarTranslucent = a3;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
}

- (UIColor)systemGrayColor
{
  return self->_systemGrayColor;
}

- (void)setSystemGrayColor:(id)a3
{
}

- (double)sliderAlpha
{
  return self->_sliderAlpha;
}

- (void)setSliderAlpha:(double)a3
{
  self->_sliderAlpha = a3;
}

- (unint64_t)textHighlightType
{
  return self->_textHighlightType;
}

- (void)setTextHighlightType:(unint64_t)a3
{
  self->_textHighlightType = a3;
}

- (id)compositingFilter
{
  id WeakRetained = objc_loadWeakRetained(&self->_compositingFilter);

  return WeakRetained;
}

- (void)setCompositingFilter:(id)a3
{
}

- (BOOL)imageMultiplyExpandedContentMode
{
  return self->_imageMultiplyExpandedContentMode;
}

- (void)setImageMultiplyExpandedContentMode:(BOOL)a3
{
  self->_imageMultiplyExpandedContentMode = a3;
}

- (NSString)gaijiImageFilter
{
  return self->_gaijiImageFilter;
}

- (void)setGaijiImageFilter:(id)a3
{
}

- (UIColor)speakScreenHighlightColor
{
  return self->_speakScreenHighlightColor;
}

- (void)setSpeakScreenHighlightColor:(id)a3
{
}

- (UIColor)speakScreenUnderlineColor
{
  return self->_speakScreenUnderlineColor;
}

- (void)setSpeakScreenUnderlineColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakScreenUnderlineColor, 0);
  objc_storeStrong((id *)&self->_speakScreenHighlightColor, 0);
  objc_storeStrong((id *)&self->_gaijiImageFilter, 0);
  objc_destroyWeak(&self->_compositingFilter);
  objc_storeStrong((id *)&self->_systemGrayColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_tableViewToolbarColor, 0);
  objc_storeStrong((id *)&self->_tableViewHeaderViewColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellSelectedColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableViewSeparatorColor, 0);
  objc_storeStrong((id *)&self->_groupTableViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_bookmarkLabelColor, 0);
  objc_storeStrong((id *)&self->_bookmarkPageNumberColor, 0);
  objc_storeStrong((id *)&self->_buyButtonColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonDisabledBackgroundColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonTextColor, 0);
  objc_storeStrong((id *)&self->_finishedButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_finishedCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_searchPopoverTintColor, 0);
  objc_storeStrong((id *)&self->_searchPopoverTextColor, 0);
  objc_storeStrong((id *)&self->_appearancePopoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_popoverControlColor, 0);
  objc_storeStrong((id *)&self->_popoverTitleColor, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_menuTitleColor, 0);
  objc_storeStrong((id *)&self->_menuTitleFont, 0);
  objc_storeStrong((id *)&self->_buttonTitleColorDisabled, 0);
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_buttonTitleFont, 0);
  objc_storeStrong((id *)&self->_tocPageNumberTextColor, 0);
  objc_storeStrong((id *)&self->_linkActiveColor, 0);
  objc_storeStrong((id *)&self->_linkVisitedColor, 0);
  objc_storeStrong((id *)&self->_linkColor, 0);
  objc_storeStrong((id *)&self->_toolbarTitleColor, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
  objc_storeStrong((id *)&self->_pageCurlBackPageColor, 0);
  objc_storeStrong((id *)&self->_contentTextColor, 0);
  objc_storeStrong((id *)&self->_footerTextColor, 0);
  objc_storeStrong((id *)&self->_headerTextColorDimmed, 0);
  objc_storeStrong((id *)&self->_headerTextColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_themeIdentifier, 0);
}

@end