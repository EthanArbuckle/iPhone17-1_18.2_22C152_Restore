@interface RouteAdvisoryView
+ (id)_stringAttributes;
- (BOOL)alwaysClickable;
- (CGSize)intrinsicContentSize;
- (GEOTransitArtworkDataSource)artwork;
- (NSAttributedString)advisoryText;
- (RouteAdvisoryView)initWithFrame:(CGRect)a3;
- (RouteAdvisoryView)initWithViewModel:(id)a3;
- (UIButton)advisoryDetailButton;
- (UIColor)overrideTextColor;
- (UIImage)advisoryImage;
- (UIImageView)advisoryImageView;
- (UILabel)advisoryLabel;
- (UIView)advisoryImageContainer;
- (id)actionHandler;
- (int64_t)_numberOfLinesForContentSizeCategory;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_refreshClickability;
- (void)_refreshNumberOfLinesIfNeeded;
- (void)_setupViews;
- (void)_updateAdvisoryImage;
- (void)advisoryDetailPressed;
- (void)layoutSubviews;
- (void)setActionHandler:(id)a3;
- (void)setAdvisoryDetailButton:(id)a3;
- (void)setAdvisoryImage:(id)a3;
- (void)setAdvisoryImageContainer:(id)a3;
- (void)setAdvisoryImageView:(id)a3;
- (void)setAdvisoryLabel:(id)a3;
- (void)setAdvisoryText:(id)a3;
- (void)setAlwaysClickable:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setOverrideTextColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RouteAdvisoryView

+ (id)_stringAttributes
{
  NSAttributedStringKey v6 = NSFontAttributeName;
  v2 = +[RouteOverviewCell secondaryLabelFontProvider];
  v3 = v2[2]();
  v7 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (RouteAdvisoryView)initWithViewModel:(id)a3
{
  id v4 = a3;
  v5 = -[RouteAdvisoryView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    uint64_t v6 = [v4 advisory];
    advisory = v5->_advisory;
    v5->_advisory = (GEOComposedRouteAdvisory *)v6;

    uint64_t v8 = [v4 artwork];
    artwork = v5->_artwork;
    v5->_artwork = (GEOTransitArtworkDataSource *)v8;

    uint64_t v10 = [v4 text];
    advisoryText = v5->_advisoryText;
    v5->_advisoryText = (NSAttributedString *)v10;

    uint64_t v12 = [v4 image];
    advisoryImage = v5->_advisoryImage;
    v5->_advisoryImage = (UIImage *)v12;

    v5->_buttonRange.location = (NSUInteger)[v4 buttonRange];
    v5->_buttonRange.length = v14;
    [(UILabel *)v5->_advisoryLabel setAttributedText:v5->_advisoryText];
    [(RouteAdvisoryView *)v5 setAccessibilityIdentifier:@"Advisory"];
    [(RouteAdvisoryView *)v5 _updateAdvisoryImage];
  }

  return v5;
}

- (RouteAdvisoryView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RouteAdvisoryView;
  v3 = -[RouteAdvisoryView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(RouteAdvisoryView *)v3 _setupViews];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)setActionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_actionHandler != v4)
  {
    id v6 = objc_retainBlock(v4);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = v6;

    if (!self->_actionHandler)
    {
      [(UILabel *)self->_advisoryLabel setAttributedText:self->_advisoryText];
      [(UILabel *)self->_advisoryLabel setUserInteractionEnabled:0];
      advisoryDetailButton = self->_advisoryDetailButton;
      uint64_t v9 = 1;
      goto LABEL_6;
    }
    if (sub_1000BBB44(self) == 5)
    {
      advisoryDetailButton = self->_advisoryDetailButton;
      uint64_t v9 = 0;
LABEL_6:
      [(UIButton *)advisoryDetailButton setHidden:v9];
      goto LABEL_16;
    }
    id v10 = [(NSAttributedString *)self->_advisoryText mutableCopy];
    v30[0] = NSForegroundColorAttributeName;
    v11 = +[UIColor systemBlueColor];
    v31[0] = v11;
    v30[1] = NSFontAttributeName;
    uint64_t v12 = +[RouteOverviewCell secondaryLabelFontProvider];
    v13 = v12[2]();
    v31[1] = v13;
    NSUInteger v14 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

    if (self->_buttonRange.length)
    {
      [v10 addAttributes:v14 range:self->_buttonRange.location];
LABEL_15:
      [(UILabel *)self->_advisoryLabel setAttributedText:v10];
      [(UILabel *)self->_advisoryLabel setUserInteractionEnabled:1];
      id v29 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"advisoryDetailPressed"];
      [(UILabel *)self->_advisoryLabel addGestureRecognizer:v29];

      goto LABEL_16;
    }
    v15 = GEOResultRefinementSort_ptr;
    id v16 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
    [v10 appendAttributedString:v16];

    v17 = self->_advisory;
    v18 = [(GEOComposedRouteAdvisory *)v17 advisoryItems];
    if ([v18 count] == (id)1)
    {
      v19 = [(GEOComposedRouteAdvisory *)v17 advisoryItems];
      v20 = [v19 firstObject];
      v21 = [v20 cardAction];
      unsigned int v22 = [v21 type];

      v15 = GEOResultRefinementSort_ptr;
      if (v22 == 1)
      {
        v23 = +[NSBundle mainBundle];
        v24 = v23;
        CFStringRef v25 = @"Download button [advisory]";
        CFStringRef v26 = @"Offline";
LABEL_14:
        v27 = [v23 localizedStringForKey:v25 value:@"localized string not found" table:v26];

        id v28 = [objc_alloc((Class)v15[502]) initWithString:v27 attributes:v14];
        [v10 appendAttributedString:v28];

        goto LABEL_15;
      }
    }
    else
    {
    }
    v23 = +[NSBundle mainBundle];
    v24 = v23;
    CFStringRef v25 = @"More button [advisory]";
    CFStringRef v26 = 0;
    goto LABEL_14;
  }
LABEL_16:
}

- (void)setOverrideTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_overrideTextColor = &self->_overrideTextColor;
  if (self->_overrideTextColor != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_overrideTextColor, a3);
    if (*p_overrideTextColor)
    {
      -[UILabel setTextColor:](self->_advisoryLabel, "setTextColor:");
    }
    else
    {
      objc_super v7 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_advisoryLabel setTextColor:v7];
    }
    if (*p_overrideTextColor)
    {
      -[UIButton setTintColor:](self->_advisoryDetailButton, "setTintColor:");
    }
    else
    {
      uint64_t v8 = +[UIColor tertiaryLabelColor];
      [(UIButton *)self->_advisoryDetailButton setTintColor:v8];
    }
    v5 = v9;
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)RouteAdvisoryView;
  [(RouteAdvisoryView *)&v9 layoutSubviews];
  [(RouteAdvisoryView *)self bounds];
  double height = self->_lastSize.height;
  if (self->_lastSize.width != v5 || height != v3)
  {
    [(RouteAdvisoryView *)self bounds];
    self->_lastSize.width = v7;
    self->_lastSize.double height = v8;
    [(RouteAdvisoryView *)self _refreshClickability];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RouteAdvisoryView;
  [(RouteAdvisoryView *)&v8 traitCollectionDidChange:v4];
  if (self->_artwork)
  {
    double v5 = [(RouteAdvisoryView *)self traitCollection];
    id v6 = [v5 userInterfaceStyle];
    id v7 = [v4 userInterfaceStyle];

    if (v6 != v7) {
      [(RouteAdvisoryView *)self _updateAdvisoryImage];
    }
  }
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  advisoryLabel = self->_advisoryLabel;
  self->_advisoryLabel = v7;

  [(UILabel *)self->_advisoryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_advisoryLabel setUserInteractionEnabled:0];
  objc_super v9 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_advisoryLabel setTextColor:v9];

  if (sub_1000BBB44(self) == 5) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 5;
  }
  [(UILabel *)self->_advisoryLabel setLineBreakMode:v10];
  v11 = +[RouteOverviewCell secondaryLabelFontProvider];
  uint64_t v12 = v11[2]();
  [(UILabel *)self->_advisoryLabel setFont:v12];

  [(UILabel *)self->_advisoryLabel setNumberOfLines:[(RouteAdvisoryView *)self _numberOfLinesForContentSizeCategory]];
  self->_numberOfLines = [(UILabel *)self->_advisoryLabel numberOfLines];
  LODWORD(v13) = 1148846080;
  [(UILabel *)self->_advisoryLabel setContentHuggingPriority:1 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UILabel *)self->_advisoryLabel setContentCompressionResistancePriority:1 forAxis:v14];
  [(UILabel *)self->_advisoryLabel setAccessibilityIdentifier:@"AdvisoryLabel"];
  [(RouteAdvisoryView *)self addSubview:self->_advisoryLabel];
  v15 = (UIView *)objc_alloc_init((Class)UIView);
  advisoryImageContainer = self->_advisoryImageContainer;
  self->_advisoryImageContainer = v15;

  [(UIView *)self->_advisoryImageContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_advisoryImageContainer setAccessibilityIdentifier:@"AdvisoryImageContainer"];
  [(RouteAdvisoryView *)self addSubview:self->_advisoryImageContainer];
  v17 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  advisoryImageView = self->_advisoryImageView;
  self->_advisoryImageView = v17;

  [(UIImageView *)self->_advisoryImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_advisoryImageView setContentMode:1];
  [(UIImageView *)self->_advisoryImageView setClipsToBounds:1];
  [(UIImageView *)self->_advisoryImageView setAccessibilityIdentifier:@"AdvisoryImage"];
  [(RouteAdvisoryView *)self addSubview:self->_advisoryImageView];
  v19 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, y, width, height];
  advisoryDetailButton = self->_advisoryDetailButton;
  self->_advisoryDetailButton = v19;

  [(UIButton *)self->_advisoryDetailButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_advisoryDetailButton setHidden:1];
  v21 = +[UIColor tertiaryLabelColor];
  [(UIButton *)self->_advisoryDetailButton setTintColor:v21];

  [(UIButton *)self->_advisoryDetailButton addTarget:self action:"advisoryDetailPressed" forControlEvents:64];
  unsigned int v22 = self->_advisoryDetailButton;
  v23 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  v24 = +[UIImageSymbolConfiguration configurationWithFont:v23];
  CFStringRef v25 = +[UIImage systemImageNamed:@"info.circle.fill" withConfiguration:v24];
  [(UIButton *)v22 setImage:v25 forState:0];

  [(UIButton *)self->_advisoryDetailButton setAccessibilityIdentifier:@"AdvisoryDetailButton"];
  [(RouteAdvisoryView *)self addSubview:self->_advisoryDetailButton];
  CFStringRef v26 = [(UILabel *)self->_advisoryLabel font];
  [v26 lineHeight];
  double v28 = v27;

  double v29 = fmin(v28, 17.0);
  v78 = [(UIView *)self->_advisoryImageContainer widthAnchor];
  v77 = [v78 constraintEqualToConstant:v28];
  v79[0] = v77;
  v76 = [(UIView *)self->_advisoryImageContainer heightAnchor];
  v75 = [v76 constraintEqualToConstant:v28];
  v79[1] = v75;
  v74 = [(UIView *)self->_advisoryImageContainer topAnchor];
  v73 = [(UILabel *)self->_advisoryLabel topAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v79[2] = v72;
  v71 = [(UIView *)self->_advisoryImageContainer bottomAnchor];
  v70 = [(RouteAdvisoryView *)self bottomAnchor];
  v69 = [v71 constraintLessThanOrEqualToAnchor:v70];
  v79[3] = v69;
  v68 = [(UIView *)self->_advisoryImageContainer leadingAnchor];
  v67 = [(RouteAdvisoryView *)self leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v79[4] = v66;
  v65 = [(UIView *)self->_advisoryImageContainer trailingAnchor];
  v64 = [(UILabel *)self->_advisoryLabel leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-5.0];
  v79[5] = v63;
  v62 = [(UIImageView *)self->_advisoryImageView widthAnchor];
  v61 = [v62 constraintEqualToConstant:v29];
  v79[6] = v61;
  v60 = [(UIImageView *)self->_advisoryImageView heightAnchor];
  v59 = [v60 constraintEqualToConstant:v29];
  v79[7] = v59;
  v58 = [(UIImageView *)self->_advisoryImageView centerYAnchor];
  v57 = [(UIView *)self->_advisoryImageContainer centerYAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v79[8] = v56;
  v55 = [(UIImageView *)self->_advisoryImageView centerXAnchor];
  v54 = [(UIView *)self->_advisoryImageContainer centerXAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v79[9] = v53;
  v52 = [(UILabel *)self->_advisoryLabel trailingAnchor];
  v51 = [(UIButton *)self->_advisoryDetailButton leadingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v79[10] = v50;
  v49 = [(UILabel *)self->_advisoryLabel topAnchor];
  v48 = [(RouteAdvisoryView *)self topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v79[11] = v47;
  v46 = [(UILabel *)self->_advisoryLabel bottomAnchor];
  v45 = [(RouteAdvisoryView *)self bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v79[12] = v44;
  v43 = [(UIButton *)self->_advisoryDetailButton centerYAnchor];
  v42 = [(UIView *)self->_advisoryImageContainer centerYAnchor];
  v30 = [v43 constraintEqualToAnchor:v42];
  v79[13] = v30;
  v31 = [(UIButton *)self->_advisoryDetailButton trailingAnchor];
  v32 = [(RouteAdvisoryView *)self trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v79[14] = v33;
  v34 = [(UIButton *)self->_advisoryDetailButton widthAnchor];
  v35 = [(UIButton *)self->_advisoryDetailButton heightAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v79[15] = v36;
  v37 = [(UIButton *)self->_advisoryDetailButton widthAnchor];
  uint64_t v38 = sub_1000BBB44(self);
  double v39 = 0.0;
  if (v38 == 5) {
    double v39 = 18.0;
  }
  v40 = [v37 constraintEqualToConstant:v39];
  v79[16] = v40;
  v41 = +[NSArray arrayWithObjects:v79 count:17];
  +[NSLayoutConstraint activateConstraints:v41];
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_advisoryImageContainer intrinsicContentSize];
  double v4 = v3;
  [(UILabel *)self->_advisoryLabel intrinsicContentSize];
  double v6 = v4 + v5;
  [(UIButton *)self->_advisoryDetailButton intrinsicContentSize];
  double v8 = v6 + v7 + 5.0;
  [(UILabel *)self->_advisoryLabel intrinsicContentSize];
  double v10 = ceil(v9);
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (void)_updateAdvisoryImage
{
  if (self->_artwork)
  {
    double v3 = [(RouteAdvisoryView *)self traitCollection];
    ImageForArtworkDataSource();
    double v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    double v4 = v6;
  }
  else
  {
    double v4 = self->_advisoryImage;
  }
  double v7 = v4;
  if (v4)
  {
    [(UIImageView *)self->_advisoryImageView setImage:v4];
  }
  else
  {
    double v5 = +[UIImage warningImageOfSize:17.0];
    [(UIImageView *)self->_advisoryImageView setImage:v5];
  }
}

- (void)advisoryDetailPressed
{
  id actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2]();
  }
}

- (void)_refreshClickability
{
  [(RouteAdvisoryView *)self invalidateIntrinsicContentSize];
  advisordouble y = self->_advisory;
  if (advisory)
  {
    id v11 = [(GEOComposedRouteAdvisory *)self->_advisory advisoryItems];
    if (![v11 count] || (p_advisoryLabel = &self->_advisoryLabel, !self->_advisoryLabel))
    {
LABEL_13:

      return;
    }
  }
  else
  {
    p_advisoryLabel = &self->_advisoryLabel;
    if (!self->_advisoryLabel) {
      return;
    }
  }
  double v5 = [(RouteAdvisoryView *)self advisoryText];
  if (![v5 length])
  {

    if (!advisory) {
      return;
    }
    goto LABEL_13;
  }
  BOOL alwaysClickable = self->_alwaysClickable;

  if (advisory) {
  if (!alwaysClickable)
  }
  {
    if ([(UILabel *)*p_advisoryLabel isTextTruncated])
    {
      objc_initWeak(&location, self);
      double v7 = [(RouteAdvisoryView *)self _maps_mapsSceneDelegate];
      double v8 = [v7 appCoordinator];
      double v9 = [v8 baseActionCoordinator];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100BC697C;
      v12[3] = &unk_1012E6690;
      objc_copyWeak(&v14, &location);
      id v10 = v9;
      id v13 = v10;
      [(RouteAdvisoryView *)self setActionHandler:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      [(RouteAdvisoryView *)self setActionHandler:0];
    }
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
}

- (void)_refreshNumberOfLinesIfNeeded
{
  int64_t v3 = [(RouteAdvisoryView *)self _numberOfLinesForContentSizeCategory];
  if (v3 != self->_numberOfLines)
  {
    self->_numberOfLines = v3;
    [(UILabel *)self->_advisoryLabel setNumberOfLines:v3];
    [(RouteAdvisoryView *)self _refreshClickability];
  }
}

- (int64_t)_numberOfLinesForContentSizeCategory
{
  if (sub_1000BBB44(self) == 5) {
    return 2;
  }
  double v4 = [(RouteAdvisoryView *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];

  if (([v5 isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge] & 1) != 0
    || ([v5 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge] & 1) != 0
    || ([v5 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge] & 1) != 0)
  {
    int64_t v3 = 4;
  }
  else if ([v5 isEqualToString:UIContentSizeCategoryAccessibilityLarge])
  {
    int64_t v3 = 3;
  }
  else
  {
    int64_t v3 = 2;
  }

  return v3;
}

- (UILabel)advisoryLabel
{
  return self->_advisoryLabel;
}

- (void)setAdvisoryLabel:(id)a3
{
}

- (NSAttributedString)advisoryText
{
  return self->_advisoryText;
}

- (void)setAdvisoryText:(id)a3
{
}

- (UIColor)overrideTextColor
{
  return self->_overrideTextColor;
}

- (UIImageView)advisoryImageView
{
  return self->_advisoryImageView;
}

- (void)setAdvisoryImageView:(id)a3
{
}

- (UIButton)advisoryDetailButton
{
  return self->_advisoryDetailButton;
}

- (void)setAdvisoryDetailButton:(id)a3
{
}

- (UIView)advisoryImageContainer
{
  return self->_advisoryImageContainer;
}

- (void)setAdvisoryImageContainer:(id)a3
{
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (UIImage)advisoryImage
{
  return self->_advisoryImage;
}

- (void)setAdvisoryImage:(id)a3
{
}

- (BOOL)alwaysClickable
{
  return self->_alwaysClickable;
}

- (void)setAlwaysClickable:(BOOL)a3
{
  self->_BOOL alwaysClickable = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_advisoryImage, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_advisoryImageContainer, 0);
  objc_storeStrong((id *)&self->_advisoryDetailButton, 0);
  objc_storeStrong((id *)&self->_advisoryImageView, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_advisoryText, 0);
  objc_storeStrong((id *)&self->_advisoryLabel, 0);

  objc_storeStrong((id *)&self->_advisory, 0);
}

@end