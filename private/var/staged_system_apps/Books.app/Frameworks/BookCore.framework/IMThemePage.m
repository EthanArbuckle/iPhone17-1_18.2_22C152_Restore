@interface IMThemePage
+ (id)colorForElement:(unint64_t)a3 theme:(int64_t)a4;
+ (id)themeForEPUBTheme:(int64_t)a3;
- (BOOL)_wantsComputedColors;
- (IMThemePage)init;
- (NSDictionary)backgroundsByLevel;
- (UIColor)HUDBackgroundColor;
- (UIColor)HUDTextColor;
- (UIColor)backPageTintColor;
- (UIColor)buttonColor;
- (UIColor)buttonFillColor;
- (UIColor)chevronColor;
- (UIColor)groupedBackgroundColor;
- (UIColor)primaryTextColor;
- (UIColor)quarternaryTextColor;
- (UIColor)searchBackgroundColor;
- (UIColor)secondaryBackgroundColor;
- (UIColor)secondaryGroupedBackgroundColor;
- (UIColor)secondaryTextColor;
- (UIColor)separatorColor;
- (UIColor)switchColor;
- (UIColor)tableViewBackgroundColor;
- (UIColor)tertiaryTextColor;
- (UITraitCollection)_traitCollection;
- (id)_themeNormalizedTraitCollection:(id)a3;
- (id)backgroundColorForTraitCollection:(id)a3;
- (id)backgroundColorForTraitEnvironment:(id)a3;
- (id)buyButtonColor;
- (id)colorForElement:(unint64_t)a3;
- (id)finishedButtonBackgroundColor;
- (id)finishedCheckmarkColor;
- (id)keyColor;
- (id)linkColor;
- (id)pageCurlBackPageColor;
- (id)popoverBackgroundColor;
- (id)stableIdentifier;
- (id)tableViewCellBackgroundColor;
- (id)tableViewCellSelectedColor;
- (id)tableViewHeaderViewColor;
- (id)tableViewSeparatorColor;
- (int64_t)epubTheme;
- (int64_t)userInterfaceStyle;
- (void)_colorsInTraitCollectionContext:(id)a3 block:(id)a4;
- (void)set_traitCollection:(id)a3;
- (void)styleMenuCell:(id)a3 withTraitCollection:(id)a4;
- (void)stylizeSegmentedControl:(id)a3;
@end

@implementation IMThemePage

+ (id)themeForEPUBTheme:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = [a1 themeWithIdentifier:*off_2C6720[a3] v3];
  }
  return v5;
}

- (IMThemePage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMThemePage;
  v2 = [(IMTheme *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(IMTheme *)v2 setContentStatusBarStyle:3];
    [(IMTheme *)v3 setImageMultiplyExpandedContentMode:1];
  }
  return v3;
}

- (id)stableIdentifier
{
  return @"epub-default";
}

- (id)colorForElement:(unint64_t)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_70384;
  v14 = sub_70394;
  id v15 = 0;
  if ([(IMThemePage *)self _wantsComputedColors])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_7039C;
    v9[3] = &unk_2C66C0;
    v9[5] = &v10;
    v9[6] = a3;
    v9[4] = self;
    [(IMThemePage *)self _colorsInTraitCollectionContext:0 block:v9];
  }
  else
  {
    uint64_t v5 = sub_70454(a3, [(IMThemePage *)self epubTheme]);
    v6 = (void *)v11[5];
    v11[5] = v5;
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  uint64_t v4 = [a3 traitCollection];
  uint64_t v5 = [(IMThemePage *)self backgroundColorForTraitCollection:v4];

  return v5;
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_70384;
  uint64_t v12 = sub_70394;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_71124;
  v7[3] = &unk_2C39F0;
  v7[4] = self;
  v7[5] = &v8;
  [(IMThemePage *)self _colorsInTraitCollectionContext:v4 block:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (int64_t)userInterfaceStyle
{
  int64_t v2 = [(IMThemePage *)self epubTheme];
  if ((unint64_t)(v2 - 2) > 3) {
    return 0;
  }
  else {
    return qword_2A2118[v2 - 2];
  }
}

- (BOOL)_wantsComputedColors
{
  return (char *)[(IMThemePage *)self epubTheme] - 2 < (char *)&dword_4;
}

- (void)stylizeSegmentedControl:(id)a3
{
  NSAttributedStringKey v12 = NSForegroundColorAttributeName;
  id v4 = a3;
  id v5 = [(IMThemePage *)self primaryTextColor];
  id v13 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v4 setTitleTextAttributes:v6 forState:0];

  NSAttributedStringKey v10 = NSForegroundColorAttributeName;
  id v7 = +[UIColor bc_booksLabelColor];
  v11 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v4 setTitleTextAttributes:v8 forState:4];

  v9 = [(IMThemePage *)self tintColor];
  [v4 setTintColor:v9];
}

- (void)styleMenuCell:(id)a3 withTraitCollection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_71414;
  v6[3] = &unk_2C3AF8;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(IMThemePage *)v7 _colorsInTraitCollectionContext:a4 block:v6];
}

- (id)_themeNormalizedTraitCollection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v10[0] = v4;
    v6 = [(IMThemePage *)self _traitCollection];
    v10[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v10 count:2];
    id v8 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v7];
  }
  else
  {
    id v8 = [(IMThemePage *)self _traitCollection];
  }

  return v8;
}

- (void)_colorsInTraitCollectionContext:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v10 = [(IMThemePage *)self _themeNormalizedTraitCollection:a3];
  id v7 = +[UITraitCollection _currentTraitCollection];
  if (v10) {
    +[UITraitCollection _setCurrentTraitCollection:v10];
  }
  id v8 = objc_retainBlock(v6);
  v9 = v8;
  if (v8) {
    (*((void (**)(id))v8 + 2))(v8);
  }

  if (v10) {
    +[UITraitCollection _setCurrentTraitCollection:v7];
  }
}

- (UITraitCollection)_traitCollection
{
  if (!self->__traitCollection)
  {
    if ([(IMThemePage *)self userInterfaceStyle])
    {
      +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:");
      uint64_t v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v3 = (UITraitCollection *)objc_alloc_init((Class)UITraitCollection);
    }
    traitCollection = self->__traitCollection;
    self->__traitCollection = v3;
  }
  id v5 = self->__traitCollection;

  return v5;
}

+ (id)colorForElement:(unint64_t)a3 theme:(int64_t)a4
{
  return sub_70454(a3, a4);
}

- (id)buyButtonColor
{
  return [(IMThemePage *)self buttonColor];
}

- (id)finishedButtonBackgroundColor
{
  return [(IMThemePage *)self buttonColor];
}

- (id)finishedCheckmarkColor
{
  id v2 = +[UIColor bc_booksGreen];
  uint64_t v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 CGColor]);

  return v3;
}

- (id)pageCurlBackPageColor
{
  return [(IMThemePage *)self backPageTintColor];
}

- (id)popoverBackgroundColor
{
  return [(IMThemePage *)self groupedBackgroundColor];
}

- (UIColor)tableViewBackgroundColor
{
  return [(IMThemePage *)self groupedBackgroundColor];
}

- (id)tableViewCellBackgroundColor
{
  return [(IMThemePage *)self secondaryGroupedBackgroundColor];
}

- (id)tableViewHeaderViewColor
{
  return [(IMThemePage *)self popoverBackgroundColor];
}

- (id)tableViewCellSelectedColor
{
  return [(IMThemePage *)self colorForElement:18];
}

- (id)tableViewSeparatorColor
{
  id v2 = [(IMThemePage *)self epubTheme];
  char v3 = (_BYTE)v2 + 1;
  if ((unint64_t)v2 + 1 <= 6)
  {
    if (((1 << v3) & 7) != 0)
    {
      id v2 = +[UIColor bc_booksSeparatorColor];
    }
    else
    {
      if (((1 << v3) & 0x18) != 0)
      {
        double v4 = 0.12;
        double v5 = 0.0;
      }
      else
      {
        double v4 = 0.15;
        double v5 = 1.0;
      }
      id v2 = +[UIColor colorWithWhite:v5 alpha:v4];
    }
  }

  return v2;
}

- (UIColor)secondaryBackgroundColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:1];
}

- (UIColor)groupedBackgroundColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:2];
}

- (UIColor)secondaryGroupedBackgroundColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:3];
}

- (UIColor)backPageTintColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:4];
}

- (UIColor)primaryTextColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:5];
}

- (UIColor)secondaryTextColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:6];
}

- (UIColor)tertiaryTextColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:7];
}

- (UIColor)quarternaryTextColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:8];
}

- (UIColor)separatorColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:9];
}

- (UIColor)chevronColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:10];
}

- (UIColor)switchColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:11];
}

- (id)linkColor
{
  return [(IMThemePage *)self colorForElement:12];
}

- (id)keyColor
{
  return [(IMThemePage *)self colorForElement:13];
}

- (UIColor)HUDBackgroundColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:14];
}

- (UIColor)HUDTextColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:15];
}

- (UIColor)buttonColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:16];
}

- (UIColor)buttonFillColor
{
  return (UIColor *)[(IMThemePage *)self colorForElement:17];
}

- (int64_t)epubTheme
{
  return -1;
}

- (NSDictionary)backgroundsByLevel
{
  char v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:[(IMThemePage *)self userInterfaceStyle]];
  id v4 = [v3 traitCollectionByModifyingTraits:&stru_2C66E0];
  double v5 = v4;
  if ((char *)[(IMThemePage *)self userInterfaceStyle] == (char *)&def_7D91C + 2)
  {
    double v5 = [v3 traitCollectionByModifyingTraits:&stru_2C6700];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_70384;
  v22 = sub_70394;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_70384;
  v16 = sub_70394;
  id v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_71B7C;
  v11[3] = &unk_2C39F0;
  v11[4] = self;
  v11[5] = &v18;
  [(IMThemePage *)self _colorsInTraitCollectionContext:v4 block:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_71C30;
  v10[3] = &unk_2C39F0;
  v10[4] = self;
  v10[5] = &v12;
  [(IMThemePage *)self _colorsInTraitCollectionContext:v5 block:v10];
  uint64_t v6 = v19[5];
  v24[0] = &off_2E14E8;
  v24[1] = &off_2E1500;
  uint64_t v7 = v13[5];
  v25[0] = v6;
  v25[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return (NSDictionary *)v8;
}

- (UIColor)searchBackgroundColor
{
  return self->_searchBackgroundColor;
}

- (void)set_traitCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__traitCollection, 0);

  objc_storeStrong((id *)&self->_searchBackgroundColor, 0);
}

@end