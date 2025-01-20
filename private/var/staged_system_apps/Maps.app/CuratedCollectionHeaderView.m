@interface CuratedCollectionHeaderView
- (CGSize)_publisherLogoSize;
- (CuratedCollectionHeaderView)initWithDelegate:(id)a3;
- (CuratedCollectionHeaderViewDelegate)delegate;
- (GEOPlaceCollection)curatedCollection;
- (UIView)tableViewBackgroundView;
- (double)_fullHeight;
- (double)_heroImageGradientAlphaForLayout:(int64_t)a3 transitionFraction:(double)a4;
- (double)_heroImageJoeAlphaForLayout:(int64_t)a3 transitionFraction:(double)a4;
- (double)_minScrolledHeight;
- (double)_scrollTransitionFraction;
- (double)_valueForTransitionFraction:(double)a3 startValue:(double)a4 endValue:(double)a5;
- (double)tableViewContentOffset;
- (double)tableViewSubheaderContentHeight;
- (double)transitionFraction;
- (double)unscrolledHeightForCurrentLayout;
- (double)unscrolledHeightForLayout:(int64_t)a3 transitionFraction:(double)a4;
- (id)_joeColor;
- (id)_setupPublisherLogoImageView;
- (id)_setupTitleLabel;
- (id)_titleFontForLayout:(int64_t)a3 transitionFraction:(double)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)layout;
- (void)_createSubviews;
- (void)_loadImageIfNeeded;
- (void)_setupConstraints;
- (void)_updateConstraintConstants;
- (void)_updateHeaderContent;
- (void)_updateHeaderStyling;
- (void)brickTapped;
- (void)publisherLogoImageViewTapped;
- (void)safeAreaInsetsDidChange;
- (void)setCuratedCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayout:(int64_t)a3 transitionFraction:(double)a4;
- (void)setTableViewContentOffset:(double)a3;
- (void)setTableViewSubheaderContentHeight:(double)a3;
@end

@implementation CuratedCollectionHeaderView

- (CuratedCollectionHeaderView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CuratedCollectionHeaderView;
  v5 = -[CuratedCollectionHeaderView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_layout = 2;
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(CuratedCollectionHeaderView *)v6 setAccessibilityIdentifier:@"CuratedCollectionHeader"];
    [(CuratedCollectionHeaderView *)v6 _createSubviews];
    [(CuratedCollectionHeaderView *)v6 _setupConstraints];
    [(CuratedCollectionHeaderView *)v6 _updateHeaderStyling];
    v6->_needsImageReload = 1;
  }

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionHeaderView;
  -[CuratedCollectionHeaderView hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  unint64_t layout = self->_layout;
  if (layout < 4) {
    goto LABEL_2;
  }
  if (layout == 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || v6 == self->_publisherLogoImageView
      || [(UIImageView *)v6 isDescendantOfView:self->_titleHeaderView]
      && ([(CuratedCollectionHeaderView *)self _scrollTransitionFraction], v9 != 0.0))
    {
LABEL_2:
      id v4 = v6;
      goto LABEL_3;
    }
    id v4 = 0;
  }
LABEL_3:

  return v4;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionHeaderView;
  [(CuratedCollectionHeaderView *)&v3 safeAreaInsetsDidChange];
  [(CuratedCollectionHeaderView *)self _updateHeaderStyling];
}

- (void)setLayout:(int64_t)a3 transitionFraction:(double)a4
{
  if (self->_layout != a3 || self->_transitionFraction != a4)
  {
    self->_unint64_t layout = a3;
    self->_transitionFraction = a4;
    if (self->_layout == 4)
    {
      [(CuratedCollectionHeaderView *)self unscrolledHeightForCurrentLayout];
      self->_tableViewContentOffset = -v5;
    }
    [(CuratedCollectionHeaderView *)self _updateHeaderStyling];
  }
}

- (void)setTableViewContentOffset:(double)a3
{
  if (self->_tableViewContentOffset != a3)
  {
    self->_tableViewContentOffset = a3;
    [(CuratedCollectionHeaderView *)self _updateHeaderStyling];
  }
}

- (void)setTableViewSubheaderContentHeight:(double)a3
{
  if (self->_tableViewSubheaderContentHeight != a3)
  {
    self->_tableViewSubheaderContentHeight = a3;
    [(CuratedCollectionHeaderView *)self _updateConstraintConstants];
  }
}

- (void)_createSubviews
{
  [(CuratedCollectionHeaderView *)self setClipsToBounds:1];
  [(CuratedCollectionHeaderView *)self _setContinuousCornerRadius:_UISheetCornerRadius];
  objc_super v3 = [(CuratedCollectionHeaderView *)self layer];
  [v3 setMaskedCorners:3];

  id v4 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v8 = (UIView *)[v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  blockView = self->_blockView;
  self->_blockView = v8;

  [(UIView *)self->_blockView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_blockView setClipsToBounds:1];
  [(CuratedCollectionHeaderView *)self addSubview:self->_blockView];
  objc_super v10 = (UIView *)[objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  blockBlackView = self->_blockBlackView;
  self->_blockBlackView = v10;

  [(UIView *)self->_blockBlackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = +[UIColor blackColor];
  v13 = [v12 colorWithAlphaComponent:0.3];
  [(UIView *)self->_blockBlackView setBackgroundColor:v13];

  [(UIView *)self->_blockView addSubview:self->_blockBlackView];
  v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  blockContentView = self->_blockContentView;
  self->_blockContentView = v14;

  [(UIView *)self->_blockContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_blockContentView setUserInteractionEnabled:1];
  [(UIView *)self->_blockContentView setAccessibilityIdentifier:@"BlockContentView"];
  [(UIView *)self->_blockView addSubview:self->_blockContentView];
  v16 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"brickTapped"];
  blockContentViewTapGestureRecognizer = self->_blockContentViewTapGestureRecognizer;
  self->_blockContentViewTapGestureRecognizer = v16;

  [(UIView *)self->_blockContentView addGestureRecognizer:self->_blockContentViewTapGestureRecognizer];
  v18 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  heroImageView = self->_heroImageView;
  self->_heroImageView = v18;

  [(UIImageView *)self->_heroImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_heroImageView setContentMode:2];
  [(UIImageView *)self->_heroImageView setClipsToBounds:1];
  [(UIImageView *)self->_heroImageView setAccessibilityIdentifier:@"HeroImageView"];
  [(UIView *)self->_blockContentView addSubview:self->_heroImageView];
  v20 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroJoeGradientView = self->_heroJoeGradientView;
  self->_heroJoeGradientView = v20;

  [self->_heroJoeGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [self->_heroJoeGradientView gradientLayer];
  [v22 setStartPoint:0.5, 0.0];

  v23 = [self->_heroJoeGradientView gradientLayer];
  [v23 setEndPoint:0.5, 1.0];

  [(UIView *)self->_blockContentView addSubview:self->_heroJoeGradientView];
  v24 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  heroBlackGradientView = self->_heroBlackGradientView;
  self->_heroBlackGradientView = v24;

  [self->_heroBlackGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [self->_heroBlackGradientView gradientLayer];
  [v26 setStartPoint:0.5, 0.0];

  v27 = [self->_heroBlackGradientView gradientLayer];
  [v27 setEndPoint:0.5, 1.0];

  v28 = +[UIColor blackColor];
  id v29 = [v28 colorWithAlphaComponent:0.0];
  v79[0] = [v29 CGColor];
  v30 = +[UIColor blackColor];
  id v31 = [v30 colorWithAlphaComponent:0.3];
  v79[1] = [v31 CGColor];
  v32 = +[NSArray arrayWithObjects:v79 count:2];
  v33 = [self->_heroBlackGradientView gradientLayer];
  [v33 setColors:v32];

  [self->_heroJoeGradientView addSubview:self->_heroBlackGradientView];
  v34 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  heroImageJoeView = self->_heroImageJoeView;
  self->_heroImageJoeView = v34;

  [(UIView *)self->_heroImageJoeView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_blockContentView addSubview:self->_heroImageJoeView];
  v36 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  heroImageBlackView = self->_heroImageBlackView;
  self->_heroImageBlackView = v36;

  [(UIView *)self->_heroImageBlackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v38 = +[UIColor blackColor];
  v39 = [v38 colorWithAlphaComponent:0.3];
  [(UIView *)self->_heroImageBlackView setBackgroundColor:v39];

  [(UIView *)self->_heroImageJoeView addSubview:self->_heroImageBlackView];
  v40 = [(CuratedCollectionHeaderView *)self _setupPublisherLogoImageView];
  publisherLogoImageView = self->_publisherLogoImageView;
  self->_publisherLogoImageView = v40;

  [(UIImageView *)self->_publisherLogoImageView setAccessibilityIdentifier:@"PublisherLogoImageView"];
  [(UIView *)self->_blockContentView addSubview:self->_publisherLogoImageView];
  v42 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"publisherLogoImageViewTapped"];
  publisherLogoTapGesture = self->_publisherLogoTapGesture;
  self->_publisherLogoTapGesture = v42;

  [(UITapGestureRecognizer *)self->_publisherLogoTapGesture setNumberOfTapsRequired:1];
  [(UIImageView *)self->_publisherLogoImageView addGestureRecognizer:self->_publisherLogoTapGesture];
  v44 = [(CuratedCollectionHeaderView *)self _setupTitleLabel];
  titleMultiLineLabel = self->_titleMultiLineLabel;
  self->_titleMultiLineLabel = v44;

  [(UILabel *)self->_titleMultiLineLabel setNumberOfLines:3];
  [(UIView *)self->_blockContentView addSubview:self->_titleMultiLineLabel];
  v46 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  titleContainerView = self->_titleContainerView;
  self->_titleContainerView = v46;

  [(UIView *)self->_titleContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_titleContainerView setAccessibilityIdentifier:@"TitleContainerView"];
  [(UIView *)self->_blockContentView addSubview:self->_titleContainerView];
  v48 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  titleJoeView = self->_titleJoeView;
  self->_titleJoeView = v48;

  [(UIView *)self->_titleJoeView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_titleJoeView setAlpha:0.0];
  [(UIView *)self->_titleContainerView addSubview:self->_titleJoeView];
  v50 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  titleBlackView = self->_titleBlackView;
  self->_titleBlackView = v50;

  [(UIView *)self->_titleBlackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v52 = +[UIColor blackColor];
  v53 = [v52 colorWithAlphaComponent:0.3];
  [(UIView *)self->_titleBlackView setBackgroundColor:v53];

  [(UIView *)self->_titleJoeView addSubview:self->_titleBlackView];
  if (sub_1000BBB44(self) == 5)
  {
    v54 = [TwoButtonContainerHeaderView alloc];
    v55 = +[UIColor whiteColor];
    v56 = [(CuratedCollectionHeaderView *)self delegate];
    v57 = [v56 menuForQuickActionButton];
    v58 = [(TwoButtonContainerHeaderView *)v54 initWithAdditionalCardButtonType:2 tintColor:v55 buttonMenu:v57];
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v58;
  }
  else
  {
    v60 = [[ContainerHeaderView alloc] initWithCardButtonType:0 cardButtonBlurred:1];
    v55 = self->_titleHeaderView;
    self->_titleHeaderView = v60;
  }

  v61 = [(ContainerHeaderView *)self->_titleHeaderView _headerTapGesture];
  [v61 setCancelsTouchesInView:0];

  [(ContainerHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  v62 = [(CuratedCollectionHeaderView *)self delegate];
  [(ContainerHeaderView *)self->_titleHeaderView setDelegate:v62];

  [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:0.0];
  [(UIView *)self->_blockContentView addSubview:self->_titleHeaderView];
  v63 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  titleContentView = self->_titleContentView;
  self->_titleContentView = v63;

  [(UIView *)self->_titleContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_titleContentView setAccessibilityIdentifier:@"TitleContentView"];
  [(ContainerHeaderView *)self->_titleHeaderView setTitleView:self->_titleContentView];
  v65 = [(CuratedCollectionHeaderView *)self _setupPublisherLogoImageView];
  titlePublisherLogoImageView = self->_titlePublisherLogoImageView;
  self->_titlePublisherLogoImageView = v65;

  [(UIImageView *)self->_titlePublisherLogoImageView setAccessibilityIdentifier:@"TitlePublisherLogoImageView"];
  [(UIView *)self->_titleContentView addSubview:self->_titlePublisherLogoImageView];
  v67 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"publisherLogoImageViewTapped"];
  titlePublisherLogoTapGesture = self->_titlePublisherLogoTapGesture;
  self->_titlePublisherLogoTapGesture = v67;

  [(UITapGestureRecognizer *)self->_titlePublisherLogoTapGesture setNumberOfTapsRequired:1];
  [(UIImageView *)self->_titlePublisherLogoImageView addGestureRecognizer:self->_titlePublisherLogoTapGesture];
  v69 = [(CuratedCollectionHeaderView *)self _setupTitleLabel];
  titleSingleLineLabel = self->_titleSingleLineLabel;
  self->_titleSingleLineLabel = v69;

  [(UILabel *)self->_titleSingleLineLabel setNumberOfLines:1];
  [(UIView *)self->_titleContentView addSubview:self->_titleSingleLineLabel];
  v71 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  tableViewBackgroundView = self->_tableViewBackgroundView;
  self->_tableViewBackgroundView = v71;

  v73 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  tableViewBlockView = self->_tableViewBlockView;
  self->_tableViewBlockView = v73;

  [(UIView *)self->_tableViewBlockView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_tableViewBlockView setClipsToBounds:1];
  [(UIView *)self->_tableViewBlockView setAccessibilityIdentifier:@"TableViewBlockView"];
  [(UIView *)self->_tableViewBackgroundView addSubview:self->_tableViewBlockView];
  v75 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  tableViewBlockBlackView = self->_tableViewBlockBlackView;
  self->_tableViewBlockBlackView = v75;

  [(UIView *)self->_tableViewBlockBlackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v77 = +[UIColor blackColor];
  v78 = [v77 colorWithAlphaComponent:0.3];
  [(UIView *)self->_tableViewBlockBlackView setBackgroundColor:v78];

  [(UIView *)self->_tableViewBlockView addSubview:self->_tableViewBlockBlackView];
}

- (id)_setupPublisherLogoImageView
{
  id v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setUserInteractionEnabled:1];
  id v4 = [(CuratedCollectionHeaderView *)self curatedCollection];
  double v5 = [v4 publisherAttribution];
  v6 = [v5 displayName];
  [v3 setAccessibilityLabel:v6];

  [v3 setAccessibilityIgnoresInvertColors:1];
  [v3 setContentMode:1];

  return v3;
}

- (id)_setupTitleLabel
{
  id v2 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = +[UIColor whiteColor];
  [v2 setTextColor:v3];

  [v2 setAccessibilityIdentifier:@"TitleLabel"];

  return v2;
}

- (void)_setupConstraints
{
  v230 = +[NSMutableArray array];
  id v3 = [(UIView *)self->_blockView topAnchor];
  id v4 = [(CuratedCollectionHeaderView *)self topAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  blockViewTopConstraint = self->_blockViewTopConstraint;
  self->_blockViewTopConstraint = v5;

  v7 = [(UIView *)self->_blockView leadingAnchor];
  objc_super v8 = [(CuratedCollectionHeaderView *)self leadingAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  blockViewLeadingConstraint = self->_blockViewLeadingConstraint;
  self->_blockViewLeadingConstraint = v9;

  v11 = [(UIView *)self->_blockView trailingAnchor];
  v12 = [(CuratedCollectionHeaderView *)self trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  blockViewTrailingConstraint = self->_blockViewTrailingConstraint;
  self->_blockViewTrailingConstraint = v13;

  v15 = [(UIView *)self->_blockView heightAnchor];
  v16 = [v15 constraintEqualToConstant:0.0];
  blockViewHeightConstraint = self->_blockViewHeightConstraint;
  self->_blockViewHeightConstraint = v16;

  v18 = [(UIView *)self->_blockContentView heightAnchor];
  v19 = [v18 constraintEqualToConstant:0.0];
  blockContentViewHeightConstraint = self->_blockContentViewHeightConstraint;
  self->_blockContentViewHeightConstraint = v19;

  v21 = [(UIImageView *)self->_heroImageView widthAnchor];
  v22 = [v21 constraintEqualToConstant:0.0];
  heroImageViewWidthConstraint = self->_heroImageViewWidthConstraint;
  self->_heroImageViewWidthConstraint = v22;

  v24 = [(UILabel *)self->_titleMultiLineLabel bottomAnchor];
  v25 = [(UIView *)self->_blockContentView bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  titleMultiLineLabelBottomConstraint = self->_titleMultiLineLabelBottomConstraint;
  self->_titleMultiLineLabelBottomConstraint = v26;

  v28 = [(UIView *)self->_tableViewBlockView topAnchor];
  id v29 = [(UIView *)self->_tableViewBackgroundView topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  tableViewBlockViewTopConstraint = self->_tableViewBlockViewTopConstraint;
  self->_tableViewBlockViewTopConstraint = v30;

  v32 = [(UIView *)self->_tableViewBlockView leadingAnchor];
  v33 = [(UIView *)self->_tableViewBackgroundView leadingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  tableViewBlockViewLeadingConstraint = self->_tableViewBlockViewLeadingConstraint;
  self->_tableViewBlockViewLeadingConstraint = v34;

  v36 = [(UIView *)self->_tableViewBlockView trailingAnchor];
  v37 = [(UIView *)self->_tableViewBackgroundView trailingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  tableViewBlockViewTrailingConstraint = self->_tableViewBlockViewTrailingConstraint;
  self->_tableViewBlockViewTrailingConstraint = v38;

  v40 = [(UIView *)self->_tableViewBlockView heightAnchor];
  v41 = [v40 constraintEqualToConstant:0.0];
  tableViewBlockViewHeightConstraint = self->_tableViewBlockViewHeightConstraint;
  self->_tableViewBlockViewHeightConstraint = v41;

  LODWORD(v43) = 1144750080;
  [(NSLayoutConstraint *)self->_tableViewBlockViewTopConstraint setPriority:v43];
  LODWORD(v44) = 1144750080;
  [(NSLayoutConstraint *)self->_tableViewBlockViewLeadingConstraint setPriority:v44];
  LODWORD(v45) = 1144750080;
  [(NSLayoutConstraint *)self->_tableViewBlockViewTrailingConstraint setPriority:v45];
  v46 = self->_blockViewLeadingConstraint;
  v231[0] = self->_blockViewTopConstraint;
  v231[1] = v46;
  v47 = self->_blockViewHeightConstraint;
  v231[2] = self->_blockViewTrailingConstraint;
  v231[3] = v47;
  v231[4] = self->_blockContentViewHeightConstraint;
  v229 = [(UIView *)self->_blockBlackView topAnchor];
  v228 = [(UIView *)self->_blockView topAnchor];
  v227 = [v229 constraintEqualToAnchor:v228];
  v231[5] = v227;
  v226 = [(UIView *)self->_blockBlackView leadingAnchor];
  v225 = [(UIView *)self->_blockView leadingAnchor];
  v224 = [v226 constraintEqualToAnchor:v225];
  v231[6] = v224;
  v223 = [(UIView *)self->_blockBlackView trailingAnchor];
  v222 = [(UIView *)self->_blockView trailingAnchor];
  v221 = [v223 constraintEqualToAnchor:v222];
  v231[7] = v221;
  v220 = [(UIView *)self->_blockBlackView bottomAnchor];
  v219 = [(UIView *)self->_blockView bottomAnchor];
  v218 = [v220 constraintEqualToAnchor:v219];
  v231[8] = v218;
  v217 = [(UIView *)self->_blockContentView topAnchor];
  v216 = [(UIView *)self->_blockView topAnchor];
  v215 = [v217 constraintEqualToAnchor:v216];
  v231[9] = v215;
  v214 = [(UIView *)self->_blockContentView leadingAnchor];
  v213 = [(UIView *)self->_blockView leadingAnchor];
  v212 = [v214 constraintEqualToAnchor:v213];
  v231[10] = v212;
  v211 = [(UIView *)self->_blockContentView trailingAnchor];
  v210 = [(UIView *)self->_blockView trailingAnchor];
  v209 = [v211 constraintEqualToAnchor:v210];
  v231[11] = v209;
  v208 = [(UIView *)self->_blockContentView bottomAnchor];
  v207 = [(CuratedCollectionHeaderView *)self bottomAnchor];
  v206 = [v208 constraintEqualToAnchor:v207];
  v231[12] = v206;
  v205 = [(UIImageView *)self->_heroImageView widthAnchor];
  v204 = [(UIImageView *)self->_heroImageView heightAnchor];
  v203 = [v205 constraintEqualToAnchor:v204 multiplier:1.0];
  v231[13] = v203;
  v202 = [(UIImageView *)self->_heroImageView centerXAnchor];
  v201 = [(UIView *)self->_blockContentView centerXAnchor];
  v200 = [v202 constraintEqualToAnchor:v201];
  v231[14] = v200;
  v199 = [(UIImageView *)self->_heroImageView centerYAnchor];
  v198 = [(UIView *)self->_blockContentView centerYAnchor];
  v197 = [v199 constraintEqualToAnchor:v198];
  v48 = self->_heroImageViewWidthConstraint;
  v231[15] = v197;
  v231[16] = v48;
  v196 = [self->_heroJoeGradientView leadingAnchor];
  v195 = [(UIView *)self->_blockContentView leadingAnchor];
  v194 = [v196 constraintEqualToAnchor:v195];
  v231[17] = v194;
  v193 = [self->_heroJoeGradientView trailingAnchor];
  v192 = [(UIView *)self->_blockContentView trailingAnchor];
  v191 = [v193 constraintEqualToAnchor:v192];
  v231[18] = v191;
  v190 = [self->_heroJoeGradientView bottomAnchor];
  v189 = [(UIView *)self->_blockContentView bottomAnchor];
  v188 = [v190 constraintEqualToAnchor:v189 constant:1.0];
  v231[19] = v188;
  v187 = [self->_heroJoeGradientView heightAnchor];
  v186 = [v187 constraintEqualToConstant:104.0];
  v231[20] = v186;
  v185 = [self->_heroBlackGradientView topAnchor];
  v184 = [self->_heroJoeGradientView topAnchor];
  v183 = [v185 constraintEqualToAnchor:v184];
  v231[21] = v183;
  v182 = [self->_heroBlackGradientView leadingAnchor];
  v181 = [self->_heroJoeGradientView leadingAnchor];
  v180 = [v182 constraintEqualToAnchor:v181];
  v231[22] = v180;
  v179 = [self->_heroBlackGradientView trailingAnchor];
  v178 = [self->_heroJoeGradientView trailingAnchor];
  v177 = [v179 constraintEqualToAnchor:v178];
  v231[23] = v177;
  v176 = [self->_heroBlackGradientView bottomAnchor];
  v175 = [self->_heroJoeGradientView bottomAnchor];
  v174 = [v176 constraintEqualToAnchor:v175];
  v231[24] = v174;
  v173 = [(UIView *)self->_heroImageJoeView topAnchor];
  v172 = [(UIView *)self->_blockContentView topAnchor];
  v171 = [v173 constraintEqualToAnchor:v172];
  v231[25] = v171;
  v170 = [(UIView *)self->_heroImageJoeView leadingAnchor];
  v169 = [(UIView *)self->_blockContentView leadingAnchor];
  v168 = [v170 constraintEqualToAnchor:v169];
  v231[26] = v168;
  v167 = [(UIView *)self->_heroImageJoeView trailingAnchor];
  v166 = [(UIView *)self->_blockContentView trailingAnchor];
  v165 = [v167 constraintEqualToAnchor:v166];
  v231[27] = v165;
  v164 = [(UIView *)self->_heroImageJoeView bottomAnchor];
  v163 = [(UIView *)self->_blockContentView bottomAnchor];
  v162 = [v164 constraintEqualToAnchor:v163];
  v231[28] = v162;
  v161 = [(UIView *)self->_heroImageBlackView topAnchor];
  v160 = [(UIView *)self->_heroImageJoeView topAnchor];
  v159 = [v161 constraintEqualToAnchor:v160];
  v231[29] = v159;
  v158 = [(UIView *)self->_heroImageBlackView leadingAnchor];
  v157 = [(UIView *)self->_heroImageJoeView leadingAnchor];
  v155 = [v158 constraintEqualToAnchor:v157];
  v231[30] = v155;
  v154 = [(UIView *)self->_heroImageBlackView trailingAnchor];
  v153 = [(UIView *)self->_heroImageJoeView trailingAnchor];
  v152 = [v154 constraintEqualToAnchor:v153];
  v231[31] = v152;
  v151 = [(UIView *)self->_heroImageBlackView bottomAnchor];
  v150 = [(UIView *)self->_heroImageJoeView bottomAnchor];
  v149 = [v151 constraintEqualToAnchor:v150];
  v231[32] = v149;
  v148 = [(UIImageView *)self->_publisherLogoImageView leadingAnchor];
  v147 = [(UIView *)self->_blockContentView leadingAnchor];
  v146 = [v148 constraintEqualToAnchor:v147 constant:16.0];
  v231[33] = v146;
  v145 = [(UIImageView *)self->_publisherLogoImageView heightAnchor];
  [(CuratedCollectionHeaderView *)self _publisherLogoSize];
  v144 = [v145 constraintEqualToConstant:v49];
  v231[34] = v144;
  v143 = [(UILabel *)self->_titleMultiLineLabel topAnchor];
  v142 = [(UIImageView *)self->_publisherLogoImageView bottomAnchor];
  v141 = [v143 constraintEqualToAnchor:v142 constant:4.0];
  v231[35] = v141;
  v140 = [(UILabel *)self->_titleMultiLineLabel leadingAnchor];
  v139 = [(UIView *)self->_blockContentView leadingAnchor];
  v138 = [v140 constraintEqualToAnchor:v139 constant:16.0];
  v231[36] = v138;
  v137 = [(UILabel *)self->_titleMultiLineLabel trailingAnchor];
  v136 = [(UIView *)self->_blockContentView trailingAnchor];
  v135 = [v137 constraintEqualToAnchor:v136 constant:-16.0];
  v50 = self->_titleMultiLineLabelBottomConstraint;
  v231[37] = v135;
  v231[38] = v50;
  v134 = [(UIView *)self->_titleContainerView topAnchor];
  v133 = [(UIView *)self->_blockContentView topAnchor];
  v132 = [v134 constraintEqualToAnchor:v133];
  v231[39] = v132;
  v131 = [(UIView *)self->_titleContainerView leadingAnchor];
  v130 = [(UIView *)self->_blockContentView leadingAnchor];
  v129 = [v131 constraintEqualToAnchor:v130];
  v231[40] = v129;
  v128 = [(UIView *)self->_titleContainerView trailingAnchor];
  v127 = [(UIView *)self->_blockContentView trailingAnchor];
  v126 = [v128 constraintEqualToAnchor:v127];
  v231[41] = v126;
  v125 = [(UIView *)self->_titleJoeView topAnchor];
  v124 = [(UIView *)self->_titleContainerView topAnchor];
  v123 = [v125 constraintEqualToAnchor:v124];
  v231[42] = v123;
  v122 = [(UIView *)self->_titleJoeView leadingAnchor];
  v121 = [(UIView *)self->_titleContainerView leadingAnchor];
  v120 = [v122 constraintEqualToAnchor:v121];
  v231[43] = v120;
  v119 = [(UIView *)self->_titleJoeView trailingAnchor];
  v118 = [(UIView *)self->_titleContainerView trailingAnchor];
  v117 = [v119 constraintEqualToAnchor:v118];
  v231[44] = v117;
  v116 = [(UIView *)self->_titleJoeView bottomAnchor];
  v115 = [(UIView *)self->_titleContainerView bottomAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v231[45] = v114;
  v113 = [(UIView *)self->_titleBlackView topAnchor];
  v112 = [(UIView *)self->_titleJoeView topAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v231[46] = v111;
  v110 = [(UIView *)self->_titleBlackView leadingAnchor];
  v109 = [(UIView *)self->_titleJoeView leadingAnchor];
  v108 = [v110 constraintEqualToAnchor:v109];
  v231[47] = v108;
  v107 = [(UIView *)self->_titleBlackView trailingAnchor];
  v106 = [(UIView *)self->_titleJoeView trailingAnchor];
  v105 = [v107 constraintEqualToAnchor:v106];
  v231[48] = v105;
  v104 = [(UIView *)self->_titleBlackView bottomAnchor];
  v103 = [(UIView *)self->_titleJoeView bottomAnchor];
  v102 = [v104 constraintEqualToAnchor:v103];
  v231[49] = v102;
  v100 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v101 = [(UIView *)self->_titleContainerView safeAreaLayoutGuide];
  v99 = [v101 topAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v231[50] = v98;
  v97 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v96 = [(UIView *)self->_titleContainerView leadingAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v231[51] = v95;
  v94 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v93 = [(UIView *)self->_titleContainerView trailingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v231[52] = v92;
  v91 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
  v90 = [(UIView *)self->_titleContainerView bottomAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v231[53] = v89;
  v88 = [(UIImageView *)self->_titlePublisherLogoImageView topAnchor];
  v87 = [(UIView *)self->_titleContentView topAnchor];
  sub_1000BBB44(self);
  v86 = [v88 constraintEqualToAnchor:v87 constant:10.0];
  v231[54] = v86;
  v85 = [(UIImageView *)self->_titlePublisherLogoImageView leadingAnchor];
  v84 = [(UIView *)self->_titleContentView leadingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84 constant:16.0];
  v231[55] = v83;
  v82 = [(UIImageView *)self->_titlePublisherLogoImageView heightAnchor];
  [(CuratedCollectionHeaderView *)self _publisherLogoSize];
  v81 = [v82 constraintEqualToConstant:v51];
  v231[56] = v81;
  v80 = [(UILabel *)self->_titleSingleLineLabel topAnchor];
  v79 = [(UIImageView *)self->_titlePublisherLogoImageView bottomAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:4.0];
  v231[57] = v78;
  v77 = [(UILabel *)self->_titleSingleLineLabel leadingAnchor];
  v76 = [(UIView *)self->_titleContentView leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:16.0];
  v231[58] = v75;
  v52 = [(UILabel *)self->_titleSingleLineLabel trailingAnchor];
  v74 = v52;
  uint64_t v53 = [(UIView *)self->_titleContentView trailingAnchor];
  v73 = (void *)v53;
  if (sub_1000BBB44(self) == 5) {
    double v54 = -16.0;
  }
  else {
    double v54 = 0.0;
  }
  v72 = [v52 constraintEqualToAnchor:v53 constant:v54];
  v231[59] = v72;
  v71 = [(UILabel *)self->_titleSingleLineLabel bottomAnchor];
  v70 = [(UIView *)self->_titleContentView bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:-12.0];
  v55 = self->_tableViewBlockViewTopConstraint;
  v231[60] = v69;
  v231[61] = v55;
  v56 = self->_tableViewBlockViewTrailingConstraint;
  v231[62] = self->_tableViewBlockViewLeadingConstraint;
  v231[63] = v56;
  v231[64] = self->_tableViewBlockViewHeightConstraint;
  v156 = [(UIView *)self->_tableViewBlockBlackView topAnchor];
  v68 = [(UIView *)self->_tableViewBlockView topAnchor];
  v67 = [v156 constraintEqualToAnchor:v68];
  v231[65] = v67;
  v66 = [(UIView *)self->_tableViewBlockBlackView leadingAnchor];
  v57 = [(UIView *)self->_tableViewBlockView leadingAnchor];
  v58 = [v66 constraintEqualToAnchor:v57];
  v231[66] = v58;
  v59 = [(UIView *)self->_tableViewBlockBlackView trailingAnchor];
  v60 = [(UIView *)self->_tableViewBlockView trailingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  v231[67] = v61;
  v62 = [(UIView *)self->_tableViewBlockBlackView bottomAnchor];
  v63 = [(UIView *)self->_tableViewBlockView bottomAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  v231[68] = v64;
  v65 = +[NSArray arrayWithObjects:v231 count:69];
  [v230 addObjectsFromArray:v65];

  [(CuratedCollectionHeaderView *)self _updateConstraintConstants];
  +[NSLayoutConstraint activateConstraints:v230];
}

- (void)_updateConstraintConstants
{
  if (self->_layout)
  {
    [(CuratedCollectionHeaderView *)self _minScrolledHeight];
    double v4 = v3;
    [(CuratedCollectionHeaderView *)self _fullHeight];
    double tableViewContentOffset = self->_tableViewContentOffset;
    if (self->_tableViewSubheaderContentHeight - tableViewContentOffset <= v4) {
      double v7 = v4;
    }
    else {
      double v7 = self->_tableViewSubheaderContentHeight - tableViewContentOffset;
    }
    if (v5 > -tableViewContentOffset) {
      double v5 = -tableViewContentOffset;
    }
    double v8 = 0.0;
    if (v5 > v4) {
      double v4 = v5;
    }
  }
  else
  {
    double v8 = 30.0;
    double v7 = 112.0;
    double v4 = 112.0;
  }
  [(NSLayoutConstraint *)self->_blockViewTopConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_blockViewLeadingConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_blockViewTrailingConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_blockViewHeightConstraint setConstant:v7];
  [(NSLayoutConstraint *)self->_blockContentViewHeightConstraint setConstant:v4];
  [(NSLayoutConstraint *)self->_titleMultiLineLabelBottomConstraint setConstant:-v8];
  [(NSLayoutConstraint *)self->_tableViewBlockViewTopConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_tableViewBlockViewLeadingConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_tableViewBlockViewTrailingConstraint setConstant:-0.0];
  tableViewBlockViewHeightConstraint = self->_tableViewBlockViewHeightConstraint;

  [(NSLayoutConstraint *)tableViewBlockViewHeightConstraint setConstant:v7];
}

- (void)_updateHeaderStyling
{
  [(CuratedCollectionHeaderView *)self _heroImageGradientAlphaForLayout:self->_layout transitionFraction:self->_transitionFraction];
  -[GradientView setAlpha:](self->_heroJoeGradientView, "setAlpha:");
  [(CuratedCollectionHeaderView *)self _heroImageJoeAlphaForLayout:self->_layout transitionFraction:self->_transitionFraction];
  -[UIView setAlpha:](self->_heroImageJoeView, "setAlpha:");
  double v3 = +[UIFont system22Bold];
  [(UILabel *)self->_titleSingleLineLabel setFont:v3];

  double v4 = +[UIFont system28Bold];
  [(UILabel *)self->_titleMultiLineLabel setFont:v4];

  [(CuratedCollectionHeaderView *)self _scrollTransitionFraction];
  double v6 = v5;
  double v7 = 1.0 - v5;
  [(UIImageView *)self->_publisherLogoImageView setAlpha:1.0 - v5];
  [(UILabel *)self->_titleMultiLineLabel setAlpha:v7];
  [(UIView *)self->_titleJoeView setAlpha:v6];
  [(UIImageView *)self->_titlePublisherLogoImageView alpha];
  if ((v6 == 1.0) == (v8 != 1.0))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1007D8520;
    v12[3] = &unk_1012E6300;
    v12[4] = self;
    BOOL v13 = v6 == 1.0;
    +[UIView animateWithDuration:v12 animations:0.2];
  }
  int64_t layout = self->_layout;
  uint64_t v10 = 1;
  if ((unint64_t)(layout - 1) < 3)
  {
    uint64_t v11 = 0;
LABEL_8:
    [(UITapGestureRecognizer *)self->_publisherLogoTapGesture setEnabled:v11];
    [(UITapGestureRecognizer *)self->_titlePublisherLogoTapGesture setEnabled:v11];
    [(UITapGestureRecognizer *)self->_blockContentViewTapGestureRecognizer setEnabled:v10];
    uint64_t v10 = 3;
    goto LABEL_9;
  }
  if (!layout)
  {
LABEL_9:
    [(UILabel *)self->_titleMultiLineLabel setNumberOfLines:v10];
    goto LABEL_10;
  }
  if (layout == 4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 1;
    goto LABEL_8;
  }
LABEL_10:
  [(CuratedCollectionHeaderView *)self _updateConstraintConstants];
}

- (double)_heroImageGradientAlphaForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  int64_t layout = self->_layout;
  if ((unint64_t)(layout - 2) < 3) {
    return 1.0;
  }
  double v5 = 0.0;
  if (layout == 1) {
    return a4;
  }
  return v5;
}

- (double)_heroImageJoeAlphaForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  int64_t layout = self->_layout;
  if ((unint64_t)(layout - 2) < 3) {
    return 0.0;
  }
  double v5 = 0.5;
  if (layout == 1)
  {
    double v6 = fmax(1.0 - a4, 0.0);
    if (v6 >= 1.0) {
      return 0.5;
    }
    else {
      return v6 * 0.5;
    }
  }
  return v5;
}

- (id)_titleFontForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  if ((unint64_t)a3 < 3)
  {
    uint64_t v5 = +[UIFont system22Bold];
LABEL_3:
    double v4 = (void *)v5;
    goto LABEL_10;
  }
  if (a3 == 3)
  {
    double v8 = +[UIFont system22Bold];
    double v9 = +[UIFont system28AdaptiveBoldShort];
    [v8 pointSize];
    double v11 = v10;
    [v9 pointSize];
    [(CuratedCollectionHeaderView *)self _valueForTransitionFraction:a4 startValue:v11 endValue:v12];
    double v14 = v13;
    v15 = [v8 fontDescriptor];
    double v4 = +[UIFont fontWithDescriptor:v15 size:v14];
  }
  else if (a3 == 4)
  {
    if (sub_1000BBB44(self) == 5) {
      +[UIFont system22AdaptiveCondensedBold];
    }
    else {
    uint64_t v5 = +[UIFont system28AdaptiveBoldShort];
    }
    goto LABEL_3;
  }
LABEL_10:

  return v4;
}

- (CGSize)_publisherLogoSize
{
  uint64_t v2 = sub_1000BBB44(self);
  double v3 = 180.0;
  if (v2 == 5) {
    double v3 = 144.0;
  }
  double v4 = 40.0;
  if (v2 == 5) {
    double v4 = 32.0;
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)_valueForTransitionFraction:(double)a3 startValue:(double)a4 endValue:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

- (double)_scrollTransitionFraction
{
  double v2 = 0.0;
  if (self->_layout == 4)
  {
    [(CuratedCollectionHeaderView *)self _minScrolledHeight];
    double tableViewContentOffset = self->_tableViewContentOffset;
    if (tableViewContentOffset >= -104.0 - v4)
    {
      double v2 = 1.0;
      if (tableViewContentOffset < -v4) {
        return fmin(fmax((v4 + tableViewContentOffset + 104.0) / 104.0, 0.0), 1.0);
      }
    }
  }
  return v2;
}

- (double)_minScrolledHeight
{
  -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_titleHeaderView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v4 = v3;
  [(CuratedCollectionHeaderView *)self safeAreaInsets];
  return v4 + v5;
}

- (void)setCuratedCollection:(id)a3
{
  double v5 = (GEOPlaceCollection *)a3;
  if (self->_curatedCollection != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    [(CuratedCollectionHeaderView *)self _updateHeaderContent];
    double v5 = v6;
  }
}

- (void)_updateHeaderContent
{
  double v3 = [(CuratedCollectionHeaderView *)self curatedCollection];
  double v4 = [v3 collectionLongTitle];
  double v5 = v4;
  if (v4)
  {
    id v56 = v4;
  }
  else
  {
    double v6 = [(CuratedCollectionHeaderView *)self curatedCollection];
    id v56 = [v6 collectionTitle];
  }
  [(UILabel *)self->_titleSingleLineLabel setText:v56];
  [(UILabel *)self->_titleMultiLineLabel setText:v56];
  double v7 = +[MKSystemController sharedInstance];
  [v7 screenScale];
  double v9 = v8;

  double v10 = [(GEOPlaceCollection *)self->_curatedCollection publisherAttribution];
  if ([v10 logoWithoutPaddingIdentifier]) {
    id v11 = [v10 logoWithoutPaddingIdentifier];
  }
  else {
    id v11 = [v10 logoIdentifier];
  }
  double v12 = +[MKIconManager imageForIconID:v11 contentScale:1 sizeGroup:0 nightMode:v9];
  if (v12)
  {
    double v13 = [(UIImageView *)self->_publisherLogoImageView image];

    if (!v13)
    {
      [(UIImageView *)self->_publisherLogoImageView setImage:v12];
      double v14 = [(UIImageView *)self->_publisherLogoImageView widthAnchor];
      v15 = [(UIImageView *)self->_publisherLogoImageView heightAnchor];
      v16 = [(UIImageView *)self->_publisherLogoImageView image];
      [v16 size];
      double v18 = v17;
      v19 = [(UIImageView *)self->_publisherLogoImageView image];
      [v19 size];
      v21 = [v14 constraintEqualToAnchor:v15 multiplier:v18 / v20];
      logoWidthConstraint = self->_logoWidthConstraint;
      self->_logoWidthConstraint = v21;

      [(NSLayoutConstraint *)self->_logoWidthConstraint setActive:1];
    }
    v23 = [(UIImageView *)self->_titlePublisherLogoImageView image];

    if (!v23)
    {
      [(UIImageView *)self->_titlePublisherLogoImageView setImage:v12];
      v24 = [(UIImageView *)self->_titlePublisherLogoImageView widthAnchor];
      v25 = [(UIImageView *)self->_titlePublisherLogoImageView heightAnchor];
      v26 = [(UIImageView *)self->_titlePublisherLogoImageView image];
      [v26 size];
      double v28 = v27;
      id v29 = [(UIImageView *)self->_titlePublisherLogoImageView image];
      [v29 size];
      id v31 = [v24 constraintEqualToAnchor:v25 multiplier:v28 / v30];
      titleLogoWidthConstraint = self->_titleLogoWidthConstraint;
      self->_titleLogoWidthConstraint = v31;

      [(NSLayoutConstraint *)self->_titleLogoWidthConstraint setActive:1];
    }
  }
  else
  {
    v33 = sub_10057611C();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      if ([v10 logoWithoutPaddingIdentifier]) {
        unsigned int v34 = [v10 logoWithoutPaddingIdentifier];
      }
      else {
        unsigned int v34 = [v10 logoIdentifier];
      }
      *(_DWORD *)buf = 67109120;
      unsigned int v60 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "PAM and Icon-Pack are not in sync. Icon Pack is missing icon for ID: %d", buf, 8u);
    }
  }
  v35 = +[MKPlaceCollectionImageProvider sharedInstance];
  unsigned int v36 = [v35 isJoeColorManuallyCuratedForCuratedCollection:self->_curatedCollection];

  if (v36)
  {
    v37 = +[UIColor blackColor];
    v38 = [v37 colorWithAlphaComponent:0.0];
    [(UIView *)self->_blockBlackView setBackgroundColor:v38];

    v39 = +[UIColor blackColor];
    id v40 = [v39 colorWithAlphaComponent:0.0];
    v58[0] = [v40 CGColor];
    v41 = +[UIColor blackColor];
    id v42 = [v41 colorWithAlphaComponent:0.0];
    v58[1] = [v42 CGColor];
    double v43 = +[NSArray arrayWithObjects:v58 count:2];
    double v44 = [self->_heroBlackGradientView gradientLayer];
    [v44 setColors:v43];

    double v45 = +[UIColor blackColor];
    v46 = [v45 colorWithAlphaComponent:0.0];
    [(UIView *)self->_heroImageBlackView setBackgroundColor:v46];

    v47 = +[UIColor blackColor];
    v48 = [v47 colorWithAlphaComponent:0.0];
    [(UIView *)self->_titleBlackView setBackgroundColor:v48];

    double v49 = +[UIColor blackColor];
    v50 = [v49 colorWithAlphaComponent:0.0];
    [(UIView *)self->_tableViewBlockBlackView setBackgroundColor:v50];
  }
  double v51 = [(CuratedCollectionHeaderView *)self _joeColor];
  [(UIView *)self->_blockView setBackgroundColor:v51];
  id v52 = [v51 colorWithAlphaComponent:0.0];
  v57[0] = [v52 CGColor];
  id v53 = v51;
  v57[1] = [v53 CGColor];
  double v54 = +[NSArray arrayWithObjects:v57 count:2];
  v55 = [self->_heroJoeGradientView gradientLayer];
  [v55 setColors:v54];

  [(UIView *)self->_heroImageJoeView setBackgroundColor:v53];
  [(UIView *)self->_titleJoeView setBackgroundColor:v53];
  [(UIView *)self->_tableViewBlockView setBackgroundColor:v53];
  self->_needsImageReload = 1;
  [(CuratedCollectionHeaderView *)self _loadImageIfNeeded];
}

- (id)_joeColor
{
  if (!self->_curatedCollection
    || (+[MKPlaceCollectionImageProvider sharedInstance],
        double v3 = objc_claimAutoreleasedReturnValue(),
        [v3 joeColorForCuratedCollection:self->_curatedCollection],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    double v4 = +[UIColor clearColor];
  }

  return v4;
}

- (void)_loadImageIfNeeded
{
  double v3 = [(CuratedCollectionHeaderView *)self curatedCollection];
  if (v3)
  {
    BOOL needsImageReload = self->_needsImageReload;

    if (needsImageReload)
    {
      self->_BOOL needsImageReload = 0;
      [(NSLayoutConstraint *)self->_heroImageViewWidthConstraint constant];
      if (v5 != 462.0) {
        -[NSLayoutConstraint setConstant:](self->_heroImageViewWidthConstraint, "setConstant:");
      }
      [(CuratedCollectionHeaderView *)self _fullHeight];
      double v7 = v6;
      [(CuratedCollectionHeaderView *)self _fullHeight];
      double v9 = v8;
      objc_initWeak(&location, self);
      double v10 = +[MKPlaceCollectionImageProvider sharedInstance];
      id v11 = [(CuratedCollectionHeaderView *)self curatedCollection];
      double v12 = [(CuratedCollectionHeaderView *)self traitCollection];
      double v13 = [v12 preferredContentSizeCategory];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1007D9290;
      v14[3] = &unk_1012F92F8;
      objc_copyWeak(&v16, &location);
      v15 = &stru_1012F92D0;
      [v10 loadGradientCoverImageWithCuratedCollection:v11 size:v13 contentSizeCategory:7 usingImageSource:v14 completion:v7, v9];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (double)_fullHeight
{
  return dbl_100F72240[sub_1000BBB44(self) == 5];
}

- (double)unscrolledHeightForLayout:(int64_t)a3 transitionFraction:(double)a4
{
  switch(a3)
  {
    case 1:
      [(CuratedCollectionHeaderView *)self _valueForTransitionFraction:a4 startValue:112.0 endValue:198.0];
      break;
    case 3:
      [(CuratedCollectionHeaderView *)self _valueForTransitionFraction:a4 startValue:16.0 endValue:0.0];
      [(CuratedCollectionHeaderView *)self _fullHeight];
      [(CuratedCollectionHeaderView *)self _valueForTransitionFraction:a4 startValue:198.0 endValue:v6];
      break;
    case 4:
      [(CuratedCollectionHeaderView *)self _fullHeight];
      break;
    default:
      break;
  }

  UIRoundToViewScale();
  return result;
}

- (double)unscrolledHeightForCurrentLayout
{
  [(CuratedCollectionHeaderView *)self unscrolledHeightForLayout:self->_layout transitionFraction:self->_transitionFraction];
  return result;
}

- (void)brickTapped
{
  id v2 = [(CuratedCollectionHeaderView *)self delegate];
  [v2 headerViewBrickTapped];
}

- (void)publisherLogoImageViewTapped
{
  id v2 = [(CuratedCollectionHeaderView *)self delegate];
  [v2 headerViewPublisherLogoTapped];
}

- (CuratedCollectionHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CuratedCollectionHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (UIView)tableViewBackgroundView
{
  return self->_tableViewBackgroundView;
}

- (double)tableViewContentOffset
{
  return self->_tableViewContentOffset;
}

- (double)tableViewSubheaderContentHeight
{
  return self->_tableViewSubheaderContentHeight;
}

- (int64_t)layout
{
  return self->_layout;
}

- (double)transitionFraction
{
  return self->_transitionFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableViewBlockBlackView, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBlockView, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewBackgroundView, 0);
  objc_storeStrong((id *)&self->_titleSingleLineLabel, 0);
  objc_storeStrong((id *)&self->_titlePublisherLogoTapGesture, 0);
  objc_storeStrong((id *)&self->_titleLogoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titlePublisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_titleContentView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_titleBlackView, 0);
  objc_storeStrong((id *)&self->_titleJoeView, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_titleMultiLineLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleMultiLineLabel, 0);
  objc_storeStrong((id *)&self->_logoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_publisherLogoTapGesture, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
  objc_storeStrong((id *)&self->_heroImageBlackView, 0);
  objc_storeStrong((id *)&self->_heroImageJoeView, 0);
  objc_storeStrong((id *)&self->_heroImageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heroBlackGradientView, 0);
  objc_storeStrong((id *)&self->_heroJoeGradientView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_blockContentViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_blockContentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_blockContentView, 0);
  objc_storeStrong((id *)&self->_blockBlackView, 0);
  objc_storeStrong((id *)&self->_blockViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_blockViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_blockViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_blockViewTopConstraint, 0);

  objc_storeStrong((id *)&self->_blockView, 0);
}

@end