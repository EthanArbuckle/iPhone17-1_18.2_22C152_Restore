@interface COSUsageBundleHeaderTableCell
+ (id)specifierForAppBundle:(id)a3;
- (BOOL)infoHidden;
- (COSUsageBundleHeaderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NSString)info;
- (NSString)title;
- (NSString)vendor;
- (UIImage)icon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIcon:(id)a3;
- (void)setInfo:(id)a3;
- (void)setInfoHidden:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVendor:(id)a3;
- (void)updateConstraints;
@end

@implementation COSUsageBundleHeaderTableCell

+ (id)specifierForAppBundle:(id)a3
{
  id v3 = a3;
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_100249230 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v4 setUserInfo:v3];

  return v4;
}

- (COSUsageBundleHeaderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v30.receiver = self;
  v30.super_class = (Class)COSUsageBundleHeaderTableCell;
  v9 = [(COSUsageBundleHeaderTableCell *)&v30 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(COSUsageBundleHeaderTableCell *)v9 contentView];
    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v10->_infoHidden = [v8 versionLabelEnabled] ^ 1;
    id v14 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v18 = [v14 initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v18;

    [(UILabel *)v10->_titleLabel setFont:v12];
    [(UILabel *)v10->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_titleLabel setAccessibilityIdentifier:@"Title"];
    [(UILabel *)v10->_titleLabel setNumberOfLines:1];
    [(UILabel *)v10->_titleLabel setLineBreakMode:4];
    [(UILabel *)v10->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_titleLabel];
    v20 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    infoLabel = v10->_infoLabel;
    v10->_infoLabel = v20;

    [(UILabel *)v10->_infoLabel setFont:v13];
    [(UILabel *)v10->_infoLabel setEnabled:0];
    [(UILabel *)v10->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_infoLabel setAccessibilityIdentifier:@"Info"];
    [(UILabel *)v10->_infoLabel setNumberOfLines:1];
    [(UILabel *)v10->_infoLabel setLineBreakMode:4];
    [(UILabel *)v10->_infoLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_infoLabel];
    v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    vendorLabel = v10->_vendorLabel;
    v10->_vendorLabel = v22;

    [(UILabel *)v10->_vendorLabel setFont:v13];
    [(UILabel *)v10->_vendorLabel setEnabled:0];
    [(UILabel *)v10->_vendorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_vendorLabel setAccessibilityIdentifier:@"Creator"];
    [(UILabel *)v10->_vendorLabel setNumberOfLines:1];
    [(UILabel *)v10->_vendorLabel setLineBreakMode:4];
    [(UILabel *)v10->_vendorLabel setAllowsDefaultTighteningForTruncation:1];
    [v11 addSubview:v10->_vendorLabel];
    v24 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    appIconView = v10->_appIconView;
    v10->_appIconView = v24;

    [(UIImageView *)v10->_appIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v10->_appIconView setAccessibilityIdentifier:@"Icon"];
    [(UIImageView *)v10->_appIconView setContentMode:1];
    [v11 addSubview:v10->_appIconView];
    if (v10->_infoHidden)
    {
      v31[0] = v10->_titleLabel;
      v31[1] = v10->_vendorLabel;
      v31[2] = v10->_appIconView;
      v26 = v31;
      uint64_t v27 = 3;
    }
    else
    {
      v32[0] = v10->_titleLabel;
      v32[1] = v10->_infoLabel;
      v32[2] = v10->_vendorLabel;
      v32[3] = v10->_appIconView;
      v26 = v32;
      uint64_t v27 = 4;
    }
    v28 = +[NSArray arrayWithObjects:v26 count:v27];
    [v11 setAccessibilityElements:v28];

    [(COSUsageBundleHeaderTableCell *)v10 setNeedsUpdateConstraints];
    [(COSUsageBundleHeaderTableCell *)v10 refreshCellContentsWithSpecifier:v8];
  }
  return v10;
}

- (void)updateConstraints
{
  titleLabel = self->_titleLabel;
  if (self->_infoHidden) {
    _NSDictionaryOfVariableBindings(@"_titleLabel, _vendorLabel, _appIconView", titleLabel, self->_vendorLabel, self->_appIconView, 0);
  }
  else {
  v4 = _NSDictionaryOfVariableBindings(@"_titleLabel, _infoLabel, _vendorLabel, _appIconView", titleLabel, self->_infoLabel, self->_vendorLabel, self->_appIconView, 0);
  }
  if ([(NSMutableArray *)self->_constraints count]) {
    +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  }
  v5 = +[NSMutableArray array];
  constraints = self->_constraints;
  self->_constraints = v5;

  v7 = self->_constraints;
  id v8 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-15-[_appIconView(==58)]", 0, 0, v4);
  [(NSMutableArray *)v7 addObjectsFromArray:v8];

  v9 = self->_constraints;
  v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-16-[_appIconView(==58)]-(>=16)-|", 0, 0, v4);
  [(NSMutableArray *)v9 addObjectsFromArray:v10];

  v11 = self->_constraints;
  v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-84-[_titleLabel]-15-|", 0, 0, v4);
  [(NSMutableArray *)v11 addObjectsFromArray:v12];

  v13 = self->_constraints;
  if (self->_infoHidden) {
    CFStringRef v14 = @"V:|-16-[_titleLabel]-2-[_vendorLabel]-(>=16)-|";
  }
  else {
    CFStringRef v14 = @"V:|-16-[_titleLabel]-2-[_infoLabel]-2-[_vendorLabel]-(>=16)-|";
  }
  v15 = +[NSLayoutConstraint constraintsWithVisualFormat:v14 options:0 metrics:0 views:v4];
  [(NSMutableArray *)v13 addObjectsFromArray:v15];

  if (!self->_infoHidden)
  {
    v16 = self->_constraints;
    v17 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-84-[_infoLabel]-15-|", 0, 0, v4);
    [(NSMutableArray *)v16 addObjectsFromArray:v17];
  }
  v18 = self->_constraints;
  v19 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-84-[_vendorLabel]-15-|", 0, 0, v4);
  [(NSMutableArray *)v18 addObjectsFromArray:v19];

  +[NSLayoutConstraint activateConstraints:self->_constraints];
  v20.receiver = self;
  v20.super_class = (Class)COSUsageBundleHeaderTableCell;
  [(COSUsageBundleHeaderTableCell *)&v20 updateConstraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)COSUsageBundleHeaderTableCell;
  [(COSUsageBundleHeaderTableCell *)&v27 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 userInfo];
  v6 = PSBlankIconImage();
  [(COSUsageBundleHeaderTableCell *)self setIcon:v6];

  v7 = +[UIScreen mainScreen];
  id v8 = [v7 traitCollection];
  [v8 displayScale];
  double v10 = v9;

  v11 = +[NanoResourceGrabber sharedInstance];
  objc_initWeak(&location, self);
  v12 = [v5 bundleIdentifier];
  if (v10 <= 2.0) {
    uint64_t v13 = 47;
  }
  else {
    uint64_t v13 = 48;
  }
  id v14 = &_dispatch_main_q;
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_1001073B4;
  v24 = &unk_1002473C8;
  objc_copyWeak(&v25, &location);
  [v11 getIconForBundleID:v12 iconVariant:v13 queue:&_dispatch_main_q block:&v21 timeout:-1.0];

  v15 = [v5 name:v21, v22, v23, v24];
  [(COSUsageBundleHeaderTableCell *)self setTitle:v15];

  unsigned int v16 = [v4 versionLabelEnabled];
  if (v16)
  {
    v17 = [v5 bundleVersion];
  }
  else
  {
    v17 = 0;
  }
  [(COSUsageBundleHeaderTableCell *)self setInfo:v17];
  if (v16) {

  }
  v18 = [v5 bundleIdentifier];
  unsigned __int8 v19 = [v18 hasPrefix:@"com.apple."];
  if (v19)
  {
    objc_super v20 = @"Apple Inc.";
  }
  else
  {
    objc_super v20 = [v5 vendor];
  }
  [(COSUsageBundleHeaderTableCell *)self setVendor:v20];
  if ((v19 & 1) == 0) {

  }
  [(COSUsageBundleHeaderTableCell *)self setNeedsDisplay];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)setIcon:(id)a3
{
}

- (UIImage)icon
{
  return [(UIImageView *)self->_appIconView image];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if ([v5 length]) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(UILabel *)self->_titleLabel setText:v4];
}

- (NSString)title
{
  v2 = [(UILabel *)self->_titleLabel text];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_100249230;
  }
  id v4 = v2;

  return v4;
}

- (void)setVendor:(id)a3
{
}

- (NSString)vendor
{
  v2 = [(UILabel *)self->_vendorLabel text];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_100249230;
  }
  id v4 = v2;

  return v4;
}

- (void)setInfo:(id)a3
{
}

- (NSString)info
{
  v2 = [(UILabel *)self->_infoLabel text];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_100249230;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)infoHidden
{
  return self->_infoHidden;
}

- (void)setInfoHidden:(BOOL)a3
{
  self->_infoHidden = a3;
  [(COSUsageBundleHeaderTableCell *)self setNeedsUpdateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_vendorLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end