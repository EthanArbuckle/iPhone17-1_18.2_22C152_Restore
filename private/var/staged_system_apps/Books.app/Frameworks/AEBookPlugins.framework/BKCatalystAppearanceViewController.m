@interface BKCatalystAppearanceViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)determinedOriginalFont;
- (BOOL)hasOriginalFont;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)contentSize;
- (UIImage)clearImage;
- (double)appearanceColorContainerHeight;
- (double)appearanceColorPotHeight;
- (double)appearanceColorPotSeparator;
- (double)appearanceColorPotWidth;
- (double)appearanceRowHeight;
- (double)fontAppearanceWidthPadding;
- (double)fontSizeForFontFamilyName:(id)a3;
- (double)scrollingRowHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_themeButtonImageForTheme:(int64_t)a3 selected:(BOOL)a4;
- (id)_themeButtonImageWithColor:(id)a3 unselectedBorderColor:(id)a4 selectedImageColor:(id)a5 selected:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)downloadFont:(id)a3;
- (void)fontDownloadFailed:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setClearImage:(id)a3;
- (void)setDeterminedOriginalFont:(BOOL)a3;
- (void)stopDownloadingFont:(id)a3;
- (void)stylizeForTheme;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation BKCatalystAppearanceViewController

- (double)appearanceColorPotSeparator
{
  return 18.0;
}

- (double)appearanceColorPotWidth
{
  return 28.0;
}

- (double)appearanceColorPotHeight
{
  return 28.0;
}

- (double)fontAppearanceWidthPadding
{
  return 14.0;
}

- (double)appearanceColorContainerHeight
{
  return 28.0;
}

- (double)appearanceRowHeight
{
  return 40.0;
}

- (double)scrollingRowHeight
{
  return 40.0;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BKCatalystAppearanceViewController;
  [(BKAppearanceViewController *)&v5 viewDidLoad];
  v3 = [(BEAppearanceViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"BKFontTableViewCell"];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"fontDownloadFailed:" name:BEFontDownloadFailedNotification object:0];
}

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)BKCatalystAppearanceViewController;
  [(BKAppearanceViewController *)&v4 contentSize];
  double v3 = 230.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v4 = [(BKAppearanceViewController *)self menuItems];
  if (v4)
  {
    objc_super v5 = [(BKAppearanceViewController *)self menuItems];
    id v6 = [v5 count];
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (BOOL)hasOriginalFont
{
  if (![(BKCatalystAppearanceViewController *)self determinedOriginalFont])
  {
    double v3 = [(BKAppearanceViewController *)self fonts];
    -[BKCatalystAppearanceViewController setDeterminedOriginalFont:](self, "setDeterminedOriginalFont:", [v3 count] != 0);
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    objc_super v4 = [(BKAppearanceViewController *)self fonts];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_E127C;
    v6[3] = &unk_1DD940;
    v6[4] = &v7;
    [v4 enumerateObjectsUsingBlock:v6];

    self->_hasOriginalFont = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
  }
  return self->_hasOriginalFont;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BKCatalystAppearanceViewController;
  id v6 = -[BKAppearanceViewController tableView:numberOfRowsInSection:](&v11, "tableView:numberOfRowsInSection:", a3);
  uint64_t v7 = [(BKAppearanceViewController *)self menuItems];
  v8 = [v7 objectAtIndexedSubscript:a4];

  if (v8 == @"BKAppearanceMenuItemFont")
  {
    id v6 = &dword_0 + 1;
  }
  else if (v8 == @"BKAppearanceMenuItemSelectedFont")
  {
    uint64_t v9 = [(BKAppearanceViewController *)self fonts];
    id v6 = [v9 count];
  }
  return (int64_t)v6;
}

- (UIImage)clearImage
{
  clearImage = self->_clearImage;
  if (!clearImage)
  {
    v8.width = 13.0;
    v8.height = 13.0;
    UIGraphicsBeginImageContextWithOptions(v8, 0, 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    objc_super v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_super v5 = self->_clearImage;
    self->_clearImage = v4;

    UIGraphicsEndImageContext();
    clearImage = self->_clearImage;
  }

  return clearImage;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKCatalystAppearanceViewController;
  [(BKAppearanceViewController *)&v12 tableView:a3 heightForRowAtIndexPath:v6];
  double v8 = v7;
  uint64_t v9 = [(BKAppearanceViewController *)self menuItems];
  [v9 objectAtIndexedSubscript:[v6 section]];
  char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10 == @"BKAppearanceMenuItemTheme" && ![v6 row])
  {
    double v8 = 40.0;
  }
  else if (v10 == @"BKAppearanceMenuItemSelectedFont")
  {
    double v8 = 22.0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (!a4) {
    return 0.0;
  }
  double v4 = 8.0;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_super v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v4 = 1.0 / v6;
  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKCatalystAppearanceViewController;
  double v7 = [(BKAppearanceViewController *)&v11 tableView:v6 viewForFooterInSection:a4];
  if (a4 == 2)
  {
    id v8 = objc_alloc((Class)UIView);
    [v6 frame];
    id v9 = [v8 initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v13), 10.0)];

    double v7 = v9;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKCatalystAppearanceViewController;
  -[BKAppearanceViewController tableView:heightForFooterInSection:](&v6, "tableView:heightForFooterInSection:", a3);
  if (a4 == 2) {
    return 10.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)BEHairlineDividerView);
  [v7 setHorizontal:0];
  id v8 = [(BKCatalystAppearanceViewController *)self themePage];
  id v9 = [v8 separatorColor];
  [v7 setBackgroundColor:v9];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 frame];
  CGRectGetWidth(v36);
  [(BKCatalystAppearanceViewController *)self tableView:v6 heightForHeaderInSection:a4];

  CGRectMakeWithSize();
  id v14 = [objc_alloc((Class)UIView) initWithFrame:v10, v11, v12, v13];
  [v14 setPreservesSuperviewLayoutMargins:1];
  [v14 addSubview:v7];
  if ((unint64_t)(a4 - 1) > 1)
  {
    v15 = [v7 bottomAnchor];
    [v14 bottomAnchor];
  }
  else
  {
    v15 = [v7 topAnchor];
    [v14 topAnchor];
  }
  v29 = v30 = v15;
  v33 = [v7 heightAnchor];
  v16 = +[UIScreen mainScreen];
  [v16 scale];
  double v18 = 1.0 / v17;

  v32 = [v33 constraintEqualToConstant:v18];
  v34[0] = v32;
  v31 = [v15 constraintEqualToAnchor:v29];
  v34[1] = v31;
  v28 = [v7 leadingAnchor];
  v19 = [v14 layoutMarginsGuide];
  v20 = [v19 leadingAnchor];
  v21 = [v28 constraintEqualToAnchor:v20];
  v34[2] = v21;
  v22 = [v7 trailingAnchor];
  v23 = [v14 layoutMarginsGuide];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v34[3] = v25;
  v26 = +[NSArray arrayWithObjects:v34 count:4];
  +[NSLayoutConstraint activateConstraints:v26];

  return v14;
}

- (void)stylizeForTheme
{
  v8.receiver = self;
  v8.super_class = (Class)BKCatalystAppearanceViewController;
  [(BKAppearanceViewController *)&v8 stylizeForTheme];
  double v3 = +[UIColor clearColor];
  double v4 = [(BEAppearanceViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [(BEAppearanceViewController *)self tableView];
  id v6 = [v5 separatorColor];
  id v7 = [(BEAppearanceViewController *)self sizeSeparatorLine];
  [v7 setBackgroundColor:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(BKAppearanceViewController *)self menuItems];
  [v8 objectAtIndexedSubscript:[v6 section]];
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 != @"BKAppearanceMenuItemSelectedFont")
  {
    v59.receiver = self;
    v59.super_class = (Class)BKCatalystAppearanceViewController;
    double v10 = [(BKAppearanceViewController *)&v59 tableView:v7 cellForRowAtIndexPath:v6];
    goto LABEL_26;
  }
  v58 = [v7 dequeueReusableCellWithIdentifier:@"BKFontTableViewCell" forIndexPath:v6];

  objc_opt_class();
  double v10 = BUDynamicCast();
  double v11 = [(BKAppearanceViewController *)self fonts];
  [v11 objectAtIndexedSubscript:[v6 row]];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v12 = [(BKAppearanceViewController *)self style];
  double v13 = [v12 fontFamily];
  id v14 = [v7 familyName];
  unsigned int v15 = [v13 isEqualToString:v14];

  v16 = [v7 familyName];
  id v17 = [v16 length];

  if (v17)
  {
    double v18 = [v7 displayName];
    v19 = [v7 familyName];
    [(BKCatalystAppearanceViewController *)self fontSizeForFontFamilyName:v19];
    double v21 = v20;

    if ([v7 kind] == &dword_4)
    {
      uint64_t v22 = +[UIFont systemFontOfSize:kCTFontUIFontDesignSerif weight:v21 design:UIFontWeightRegular];
LABEL_9:
      v26 = (void *)v22;
      goto LABEL_14;
    }
    if ([v7 kind] == (char *)&dword_0 + 3)
    {
      uint64_t v22 = +[UIFont systemFontOfSize:v21];
      goto LABEL_9;
    }
    v27 = [v7 familyName];
    v28 = +[UIFont fontWithName:v27 size:v21];
    v24 = [v28 _fontAdjustedForCurrentContentSizeCategory];

    if (v24)
    {
      id v25 = v24;
    }
    else
    {
      id v25 = +[UIFont systemFontOfSize:v21];
    }
  }
  else
  {
    v23 = AEBundle();
    double v18 = [v23 localizedStringForKey:@"Original" value:&stru_1DF0D8 table:0];

    v24 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v24 _scaledValueForValue:13.0];
    +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

LABEL_14:
  v29 = [(BKCatalystAppearanceViewController *)self themePage];
  v30 = [v29 keyColor];

  [v10 setLabelText:v18];
  v57 = v26;
  v31 = [v26 bkEffectiveFontForText:v18];
  [v10 setLabelFont:v31];

  BOOL v32 = [v7 state] == 1;
  v33 = [v10 label];
  [v33 setEnabled:v32];

  v34 = [v10 selectionView];
  [v34 setHidden:v15 ^ 1];

  v35 = [v10 selectionView];
  [v35 setTintColor:v30];

  if ((v15 & 1) == 0)
  {
    if ([v7 state] == 3)
    {
      CGRect v36 = [v58 accessoryView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v38 = [v58 accessoryView];
      }
      else
      {
        id v38 = objc_alloc_init((Class)IMRadialProgressButton);
        [v38 setTintColor:v30];
        [v38 setTrackDiameter:16.0];
        [v38 setProgressThickness:1.0];
        [v38 useInnerRect:5.0, 5.0];
        [v38 addTarget:self action:"stopDownloadingFont:" forControlEvents:64];
      }
      [v7 downloadProgress];
      [v38 setProgress:];
      v52 = [v10 buttonContainerView];
      [v52 addSubview:v38];

      [v38 setTag:[v6 row]];
      v41 = [v38 bc_constraintsToFitInSuperviewCentered];
      +[NSLayoutConstraint activateConstraints:v41];
    }
    else
    {
      if ([v7 state] != 2) {
        goto LABEL_24;
      }
      v39 = [v7 familyName];
      unsigned __int8 v40 = [v39 isEqualToString:&stru_1DF0D8];

      if (v40) {
        goto LABEL_24;
      }
      id v38 = +[UIButton buttonWithType:0];
      [v38 addTarget:self action:"downloadFont:" forControlEvents:64];
      v41 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle3];
      v42 = +[UIImage systemImageNamed:@"icloud.and.arrow.down"];
      v56 = [v42 bc_imageWithConfiguration:v41 limitedToContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];

      [v38 setImage:v56 forState:0];
      [v38 setTintColor:v30];
      [v38 setTag:[v6 row]];
      v43 = [v10 buttonContainerView];
      [v43 addSubview:v38];

      v44 = [v38 bc_constraintsToFitInSuperviewCentered];
      +[NSLayoutConstraint activateConstraints:v44];

      [v56 size];
      double v46 = v45;
      [v56 size];
      double v48 = v46 / v47;
      v55 = [v38 widthAnchor];
      v49 = [v38 heightAnchor];
      v50 = [v55 constraintEqualToAnchor:v49 multiplier:v48];

      LODWORD(v51) = 1148846080;
      [v50 setPriority:v51];
      [v50 setActive:1];
    }
LABEL_24:
    v53 = [v10 buttonContainerWidthConstraint];
    [v53 setConstant:18.0];
  }
LABEL_26:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(BKAppearanceViewController *)self menuItems];
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == @"BKAppearanceMenuItemSelectedFont")
  {
    double v10 = [(BKAppearanceViewController *)self fonts];
    double v11 = [v10 objectAtIndexedSubscript:[v7 row]];

    if ([v11 state] == 1)
    {
      double v12 = [(BKAppearanceViewController *)self fontVC];
      [v12 useSelectedFont:v11];

      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKCatalystAppearanceViewController;
    [(BKAppearanceViewController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
  }
  double v13 = [(BEAppearanceViewController *)self tableView];
  [v13 reloadData];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKCatalystAppearanceViewController;
  id v9 = a5;
  [(BKAppearanceViewController *)&v18 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:v9];
  double v10 = +[UIColor clearColor];
  [v8 setBackgroundColor:v10];

  double v11 = [(BKAppearanceViewController *)self menuItems];
  id v12 = [v9 section];

  double v13 = [v11 objectAtIndexedSubscript:v12];

  if (v13 == @"BKAppearanceMenuItemHorizontalScrollingView"
    || v13 == @"BKAppearanceMenuItemVerticalScrollingView")
  {
    unsigned int v15 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle1 maximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
    [v15 _scaledValueForValue:13.0];
    v16 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    id v17 = [v8 textLabel];
    [v17 setFont:v16];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKAppearanceViewController *)self menuItems];
  [v8 objectAtIndexedSubscript:[v7 section]];
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == @"BKAppearanceMenuItemSelectedFont")
  {
    double v11 = [(BKAppearanceViewController *)self fonts];
    id v12 = [v11 objectAtIndexedSubscript:[v7 row]];

    unsigned __int8 v10 = [v12 state] == 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKCatalystAppearanceViewController;
    unsigned __int8 v10 = [(BKAppearanceViewController *)&v14 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v10;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v8 = [a3 cellForRowAtIndexPath:a4];
  objc_super v5 = [(BKCatalystAppearanceViewController *)self themePage];
  id v6 = [v5 tableViewCellSelectedColor];
  id v7 = [v8 contentView];
  [v7 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v5 = [a3 cellForRowAtIndexPath:a4];
  double v4 = [v5 contentView];
  [v4 setBackgroundColor:0];
}

- (id)_themeButtonImageForTheme:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[IMThemePage themeForEPUBTheme:a3];
  id v7 = [v6 buttonFillColor];
  id v8 = [v6 separatorColor];
  id v9 = [v6 primaryTextColor];
  unsigned __int8 v10 = [(BKCatalystAppearanceViewController *)self _themeButtonImageWithColor:v7 unselectedBorderColor:v8 selectedImageColor:v9 selected:v4];

  return v10;
}

- (id)_themeButtonImageWithColor:(id)a3 unselectedBorderColor:(id)a4 selectedImageColor:(id)a5 selected:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(BKCatalystAppearanceViewController *)self appearanceColorPotWidth];
  double v14 = v13;
  unsigned int v15 = +[UIScreen mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;

  objc_super v18 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:1 scale:14.0];
  v19 = +[UIImage systemImageNamed:@"checkmark" withConfiguration:v18];
  v26.width = v14;
  v26.height = v14;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  double v20 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v14, v14);
  [v11 setFill];

  [v20 fill];
  double v21 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v17, v17, v14 + v17 * -2.0, v14 + v17 * -2.0);
  [v12 setFill];

  [v21 fill];
  if (v6)
  {
    uint64_t v22 = [v19 imageWithTintColor:v10];
    [v22 drawInRect:v14 * 0.5 * 0.5, v14 * 0.5 * 0.5, v14 * 0.5, v14 * 0.5];
  }
  v23 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v23;
}

- (double)fontSizeForFontFamilyName:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Iowan Old Style"] & 1) != 0
    || ([v3 isEqualToString:@"Charter"] & 1) != 0
    || ([v3 isEqualToString:@"Athelas"] & 1) != 0
    || (double v4 = 13.0, [v3 isEqualToString:@"Seravek"]))
  {
    double v4 = 14.0;
  }
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v5 _scaledValueForValue:v4];
  double v7 = v6;

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"state"] & 1) != 0
    || [v10 isEqualToString:@"downloadProgress"])
  {
    if ([(BKCatalystAppearanceViewController *)self isVisible])
    {
      double v13 = [(BKAppearanceViewController *)self fonts];
      id v14 = [v13 indexOfObject:v11];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E2AF8;
      block[3] = &unk_1DC500;
      block[4] = self;
      block[5] = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKCatalystAppearanceViewController;
    [(BKCatalystAppearanceViewController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)downloadFont:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppearanceViewController *)self fonts];
  id v6 = [v4 tag];

  id v7 = [v5 objectAtIndex:v6];

  self->_shownCannotDownloadFontAlert = 0;
  [v7 download];
}

- (void)stopDownloadingFont:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppearanceViewController *)self fonts];
  id v6 = [v4 tag];

  id v7 = [v5 objectAtIndex:v6];

  [v7 cancelDownload];
}

- (void)fontDownloadFailed:(id)a3
{
  if (!self->_shownCannotDownloadFontAlert)
  {
    id v4 = a3;
    int v5 = MGGetBoolAnswer();
    id v6 = AEBundle();
    id v7 = v6;
    if (v5) {
      CFStringRef v8 = @"To download fonts, connect to WLAN.";
    }
    else {
      CFStringRef v8 = @"To download fonts, connect to Wi-Fi.";
    }
    id v17 = [v6 localizedStringForKey:v8 value:&stru_1DF0D8 table:0];

    id v9 = AEBundle();
    id v10 = [v9 localizedStringForKey:@"Couldn’t Download" value:&stru_1DF0D8 table:0];
    id v11 = +[UIAlertController alertControllerWithTitle:v10 message:v17 preferredStyle:1];

    id v12 = AEBundle();
    double v13 = [v12 localizedStringForKey:@"OK" value:&stru_1DF0D8 table:0];
    id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
    [v11 addAction:v14];

    [(BKCatalystAppearanceViewController *)self presentViewController:v11 animated:1 completion:0];
    self->_shownCannotDownloadFontAlert = 1;
    objc_super v15 = [v4 object];

    [v15 checkStateSynchronously:0];
    double v16 = [(BEAppearanceViewController *)self tableView];
    [v16 reloadData];
  }
}

- (BOOL)accessibilityPerformEscape
{
  v3.receiver = self;
  v3.super_class = (Class)BKCatalystAppearanceViewController;
  return [(BKCatalystAppearanceViewController *)&v3 accessibilityPerformEscape];
}

- (BOOL)determinedOriginalFont
{
  return self->_determinedOriginalFont;
}

- (void)setDeterminedOriginalFont:(BOOL)a3
{
  self->_determinedOriginalFont = a3;
}

- (void)setClearImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end