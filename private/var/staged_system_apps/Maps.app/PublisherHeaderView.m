@interface PublisherHeaderView
- (BOOL)isMarzipan;
- (ContainerHeaderView)publisherHeaderView;
- (GEOCollectionPublisherAttribution)attribution;
- (NSLayoutConstraint)publisherLogoImageViewHeightConstraint;
- (NSLayoutConstraint)publisherLogoImageViewTopConstraint;
- (NSLayoutConstraint)publisherLogoImageViewWidthConstraint;
- (PublisherAnalytics)analyticsManager;
- (PublisherHeaderView)initWithDelegate:(id)a3 usingPublisherAttribution:(id)a4 usingAnalyticsManager:(id)a5;
- (PublisherHeaderViewActionManager)actionManager;
- (PublisherHeaderViewDelegate)delegate;
- (UIImageView)publisherLogoImageView;
- (double)maximumRequiredHeight;
- (double)minimumRequiredHeight;
- (void)adjustLogoImageViewTopConstraint:(double)a3;
- (void)headerHeightChangedWithNewYOffset:(double)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)resetLogoHeight;
- (void)setActionManager:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMarzipan:(BOOL)a3;
- (void)setPublisherHeaderView:(id)a3;
- (void)setPublisherLogoImageView:(id)a3;
- (void)setPublisherLogoImageViewHeightConstraint:(id)a3;
- (void)setPublisherLogoImageViewTopConstraint:(id)a3;
- (void)setPublisherLogoImageViewWidthConstraint:(id)a3;
- (void)setupConstraints;
- (void)setupHeaderContainerView;
- (void)setupStackView;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImage;
@end

@implementation PublisherHeaderView

- (PublisherHeaderView)initWithDelegate:(id)a3 usingPublisherAttribution:(id)a4 usingAnalyticsManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PublisherHeaderView;
  v11 = -[PublisherHeaderView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_attribution, a4);
    objc_storeStrong((id *)&v12->_analyticsManager, a5);
    v12->_isMarzipan = sub_1000BBB44(v12) == 5;
    [(PublisherHeaderView *)v12 setAccessibilityIdentifier:@"PublisherHeader"];
    [(PublisherHeaderView *)v12 setupSubviews];
  }

  return v12;
}

- (void)resetLogoHeight
{
  if ([(PublisherHeaderView *)self isMarzipan]) {
    double v3 = 3.45714286;
  }
  else {
    double v3 = 2.45454545;
  }
  [(PublisherHeaderView *)self maximumRequiredHeight];
  double v5 = v4;
  v6 = [(PublisherHeaderView *)self publisherLogoImageViewHeightConstraint];
  [v6 setConstant:v5];

  id v7 = [(PublisherHeaderView *)self publisherLogoImageViewWidthConstraint];
  [v7 setConstant:v5 * v3];
}

- (void)headerHeightChangedWithNewYOffset:(double)a3
{
  if ([(PublisherHeaderView *)self isMarzipan]) {
    double v5 = 3.45714286;
  }
  else {
    double v5 = 2.45454545;
  }
  v6 = [(PublisherHeaderView *)self publisherLogoImageViewHeightConstraint];
  [v6 constant];
  double v8 = v7 - a3;

  [(PublisherHeaderView *)self maximumRequiredHeight];
  double v10 = v9;
  [(PublisherHeaderView *)self minimumRequiredHeight];
  if (v8 <= v10)
  {
    double v15 = v11;
    v12 = [(PublisherHeaderView *)self publisherLogoImageViewHeightConstraint];
    v13 = v12;
    if (v8 >= v15) {
      double v14 = v8;
    }
    else {
      double v14 = v15;
    }
  }
  else
  {
    v12 = [(PublisherHeaderView *)self publisherLogoImageViewHeightConstraint];
    v13 = v12;
    double v14 = v10;
  }
  [v12 setConstant:v14];

  id v19 = [(PublisherHeaderView *)self publisherLogoImageViewHeightConstraint];
  [v19 constant];
  double v17 = v5 * v16;
  v18 = [(PublisherHeaderView *)self publisherLogoImageViewWidthConstraint];
  [v18 setConstant:v17];
}

- (void)adjustLogoImageViewTopConstraint:(double)a3
{
  if (![(PublisherHeaderView *)self isMarzipan])
  {
    id v5 = [(PublisherHeaderView *)self publisherLogoImageViewTopConstraint];
    [v5 setConstant:a3 * 3.0 / 5.0 + -36.0];
  }
}

- (double)maximumRequiredHeight
{
  unsigned int v2 = [(PublisherHeaderView *)self isMarzipan];
  double result = 110.0;
  if (v2) {
    return 79.0;
  }
  return result;
}

- (double)minimumRequiredHeight
{
  unsigned int v2 = [(PublisherHeaderView *)self isMarzipan];
  double result = 60.0;
  if (v2) {
    return 59.0;
  }
  return result;
}

- (void)setupSubviews
{
  [(PublisherHeaderView *)self setClipsToBounds:1];
  [(PublisherHeaderView *)self _setContinuousCornerRadius:_UISheetCornerRadius];
  double v3 = [(PublisherHeaderView *)self layer];
  [v3 setMaskedCorners:3];

  [(PublisherHeaderView *)self setupHeaderContainerView];
  [(PublisherHeaderView *)self setupStackView];

  [(PublisherHeaderView *)self setupConstraints];
}

- (void)setupStackView
{
  id v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(PublisherHeaderView *)self setPublisherLogoImageView:v3];

  double v4 = +[UIColor clearColor];
  id v5 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v5 setBackgroundColor:v4];

  v6 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v7 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v7 setAccessibilityIgnoresInvertColors:1];

  double v8 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v8 setAccessibilityIdentifier:@"PublisherHeaderLogo"];

  [(PublisherHeaderView *)self updateImage];
  double v9 = [(PublisherHeaderView *)self attribution];
  double v10 = [v9 displayName];
  double v11 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v11 setAccessibilityLabel:v10];

  v12 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v12 setContentMode:1];

  id v14 = [(PublisherHeaderView *)self publisherHeaderView];
  v13 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v14 addSubview:v13];
}

- (void)updateImage
{
  id v3 = +[MKSystemController sharedInstance];
  [v3 screenScale];
  double v5 = v4;

  v6 = [(PublisherHeaderView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  double v8 = [(PublisherHeaderView *)self attribution];
  double v9 = v8;
  if (v7 == (id)2) {
    id v10 = [v8 logoCenteredIdentifier];
  }
  else {
    id v10 = [v8 logoCenteredColorizedIdentifier];
  }
  id v12 = +[MKIconManager imageForIconID:v10 contentScale:1 sizeGroup:0 nightMode:v5];

  double v11 = [(PublisherHeaderView *)self publisherLogoImageView];
  [v11 setImage:v12];
}

- (void)setupHeaderContainerView
{
  id v3 = [[ContainerHeaderView alloc] initWithCardButtonType:0];
  [(PublisherHeaderView *)self setPublisherHeaderView:v3];

  double v4 = [PublisherHeaderViewActionManager alloc];
  attribution = self->_attribution;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [(PublisherHeaderViewActionManager *)v4 initWithAttribution:attribution withActionsDelegate:WeakRetained usingAnalyticsManager:self->_analyticsManager shouldHideAppIcon:self->_isMarzipan];
  [(PublisherHeaderView *)self setActionManager:v7];

  double v8 = [(PublisherHeaderView *)self publisherHeaderView];
  double v9 = [v8 _headerTapGesture];
  [v9 setCancelsTouchesInView:0];

  id v10 = [(PublisherHeaderView *)self publisherHeaderView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v11 = [(PublisherHeaderView *)self publisherHeaderView];
  id v12 = +[UIColor clearColor];
  [v11 setBackgroundColor:v12];

  v13 = [(PublisherHeaderView *)self publisherHeaderView];
  [v13 setHeaderSize:2];

  id v14 = [(PublisherHeaderView *)self publisherHeaderView];
  [v14 setDelegate:self];

  double v15 = [(PublisherHeaderView *)self publisherHeaderView];
  [v15 setHairLineAlpha:0.0];

  if (sub_1000BBB44(self) == 5)
  {
    double v16 = [(PublisherHeaderView *)self publisherHeaderView];
    [v16 setAccessoryViewInsets:0.0, 0.0, 0.0, 15.0];

    double v17 = [(PublisherHeaderView *)self actionManager];
    v18 = [v17 headerEllipsis];
    id v19 = [(PublisherHeaderView *)self publisherHeaderView];
    [v19 setAccessoryView:v18];
  }
  id v20 = [(PublisherHeaderView *)self publisherHeaderView];
  [(PublisherHeaderView *)self addSubview:v20];
}

- (void)setupConstraints
{
  id v3 = [(PublisherHeaderView *)self publisherLogoImageView];
  double v4 = [v3 heightAnchor];
  unsigned int v5 = [(PublisherHeaderView *)self isMarzipan];
  double v6 = 110.0;
  if (v5) {
    double v6 = 70.0;
  }
  id v7 = [v4 constraintLessThanOrEqualToConstant:v6];
  [(PublisherHeaderView *)self setPublisherLogoImageViewHeightConstraint:v7];

  double v8 = [(PublisherHeaderView *)self publisherLogoImageView];
  double v9 = [v8 widthAnchor];
  unsigned int v10 = [(PublisherHeaderView *)self isMarzipan];
  double v11 = 270.0;
  if (v10) {
    double v11 = 242.0;
  }
  id v12 = [v9 constraintLessThanOrEqualToConstant:v11];
  [(PublisherHeaderView *)self setPublisherLogoImageViewWidthConstraint:v12];

  if (![(PublisherHeaderView *)self isMarzipan])
  {
    v13 = [(PublisherHeaderView *)self publisherLogoImageView];
    id v14 = [v13 topAnchor];
    double v15 = [(PublisherHeaderView *)self topAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:30.0];
    [(PublisherHeaderView *)self setPublisherLogoImageViewTopConstraint:v16];
  }
  id v17 = objc_alloc_init((Class)NSMutableArray);
  if ([(PublisherHeaderView *)self isMarzipan])
  {
    v18 = [(PublisherHeaderView *)self publisherLogoImageView];
    id v19 = [v18 centerYAnchor];
    id v20 = [(PublisherHeaderView *)self centerYAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
  }
  else
  {
    uint64_t v21 = [(PublisherHeaderView *)self publisherLogoImageViewTopConstraint];
  }
  v50 = [(PublisherHeaderView *)self publisherLogoImageView];
  v49 = [v50 centerXAnchor];
  v48 = [(PublisherHeaderView *)self centerXAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v53[0] = v47;
  v53[1] = v21;
  v51 = (void *)v21;
  v46 = [(PublisherHeaderView *)self publisherLogoImageViewHeightConstraint];
  v53[2] = v46;
  v45 = [(PublisherHeaderView *)self publisherLogoImageViewWidthConstraint];
  v53[3] = v45;
  v44 = [(PublisherHeaderView *)self publisherHeaderView];
  v43 = [v44 leadingAnchor];
  v42 = [(PublisherHeaderView *)self leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v53[4] = v41;
  v40 = [(PublisherHeaderView *)self publisherHeaderView];
  v39 = [v40 trailingAnchor];
  v38 = [(PublisherHeaderView *)self trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v53[5] = v37;
  v36 = [(PublisherHeaderView *)self publisherHeaderView];
  v22 = [v36 topAnchor];
  v23 = [(PublisherHeaderView *)self topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v53[6] = v24;
  v25 = [(PublisherHeaderView *)self publisherHeaderView];
  v26 = [v25 bottomAnchor];
  v27 = [(PublisherHeaderView *)self bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v53[7] = v28;
  v29 = +[NSArray arrayWithObjects:v53 count:8];
  [v17 addObjectsFromArray:v29];

  if ([(PublisherHeaderView *)self isMarzipan])
  {
    v30 = [(PublisherHeaderView *)self publisherLogoImageView];
    v31 = [v30 topAnchor];
    v32 = [(PublisherHeaderView *)self publisherHeaderView];
    v33 = [v32 topAnchor];
    v34 = [v31 constraintEqualToAnchor:v33 constant:9.0];
    v52 = v34;
    v35 = +[NSArray arrayWithObjects:&v52 count:1];
    [v17 addObjectsFromArray:v35];
  }
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PublisherHeaderView;
  id v4 = a3;
  [(PublisherHeaderView *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  double v6 = [(PublisherHeaderView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(PublisherHeaderView *)self updateImage];
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = a3;
  double v6 = [(PublisherHeaderView *)self delegate];
  [v6 didTapClose:v5];

  id v7 = [(PublisherHeaderView *)self analyticsManager];
  [v7 publisherHeaderCloseButtonTapped];
}

- (PublisherHeaderViewActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
}

- (PublisherHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PublisherHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOCollectionPublisherAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (ContainerHeaderView)publisherHeaderView
{
  return self->_publisherHeaderView;
}

- (void)setPublisherHeaderView:(id)a3
{
}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (void)setPublisherLogoImageView:(id)a3
{
}

- (BOOL)isMarzipan
{
  return self->_isMarzipan;
}

- (void)setIsMarzipan:(BOOL)a3
{
  self->_isMarzipan = a3;
}

- (NSLayoutConstraint)publisherLogoImageViewTopConstraint
{
  return self->_publisherLogoImageViewTopConstraint;
}

- (void)setPublisherLogoImageViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)publisherLogoImageViewHeightConstraint
{
  return self->_publisherLogoImageViewHeightConstraint;
}

- (void)setPublisherLogoImageViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)publisherLogoImageViewWidthConstraint
{
  return self->_publisherLogoImageViewWidthConstraint;
}

- (void)setPublisherLogoImageViewWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherLogoImageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_publisherHeaderView, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end