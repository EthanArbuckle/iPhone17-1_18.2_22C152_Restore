@interface RestaurantReservationTableViewCell
+ (id)reuseIdentifierForClass:(Class)a3;
- (BOOL)dateAndPartySizeHidden;
- (BOOL)displayError;
- (BOOL)displayOffers;
- (BOOL)errorHidden;
- (BOOL)loading;
- (BOOL)loadingIndicatorHidden;
- (BOOL)timeSelectionHidden;
- (NSLayoutConstraint)contentBottomByError;
- (NSLayoutConstraint)contentBottomByTimeSelection;
- (NSString)dateAndPartySizeButtonText;
- (NSString)dateAndPartySizeText;
- (NSString)errorButtonText;
- (NSString)errorText;
- (NSString)loadingText;
- (RestaurantReservationCollectionViewFlowLayout)timeSelectionCollectionViewLayout;
- (RestaurantReservationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)loadingIndicator;
- (UIButton)dateAndPartySizeButton;
- (UIButton)errorButton;
- (UICollectionView)timeSelectionCollectionView;
- (UILabel)dateAndPartySizeLabel;
- (UILabel)errorButtonTitleLabel;
- (UILabel)errorLabel;
- (UILabel)loadingIndicatorLabel;
- (UIView)dateAndPartySizeContainerView;
- (UIView)errorContainerView;
- (UIView)loadingIndicatorContainerView;
- (void)_initDateAndPartySizeContainerView;
- (void)_initErrorContainerView;
- (void)_initLoadingIndicatorContainerView;
- (void)_initTimeSelectionCollectionView;
- (void)_setupContentViewConstraints;
- (void)_setupDateAndPartySizeContainerViewConstraints;
- (void)_setupErrorContainerViewConstraints;
- (void)_setupLoadingIndicatorContainerViewConstraints;
- (void)_updateContentViewBottomConstraint;
- (void)addDateAndPartySizeButtonTouchUpInsideTarget:(id)a3 action:(SEL)a4;
- (void)addErrorButtonTouchUpInsideTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentBottomByError:(id)a3;
- (void)setContentBottomByTimeSelection:(id)a3;
- (void)setDateAndPartySizeButton:(id)a3;
- (void)setDateAndPartySizeButtonText:(id)a3;
- (void)setDateAndPartySizeContainerView:(id)a3;
- (void)setDateAndPartySizeHidden:(BOOL)a3;
- (void)setDateAndPartySizeLabel:(id)a3;
- (void)setDateAndPartySizeText:(id)a3;
- (void)setDisplayError:(BOOL)a3;
- (void)setDisplayError:(BOOL)a3 animated:(BOOL)a4;
- (void)setDisplayOffers:(BOOL)a3;
- (void)setErrorButton:(id)a3;
- (void)setErrorButtonText:(id)a3;
- (void)setErrorButtonTitleLabel:(id)a3;
- (void)setErrorContainerView:(id)a3;
- (void)setErrorHidden:(BOOL)a3;
- (void)setErrorLabel:(id)a3;
- (void)setErrorText:(id)a3;
- (void)setHideDateAndPartySize:(BOOL)a3 animated:(BOOL)a4;
- (void)setLoading:(BOOL)a3;
- (void)setLoading:(BOOL)a3 animated:(BOOL)a4;
- (void)setLoadingIndicator:(id)a3;
- (void)setLoadingIndicatorContainerView:(id)a3;
- (void)setLoadingIndicatorHidden:(BOOL)a3;
- (void)setLoadingIndicatorLabel:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)setTimeSelectionCollectionView:(id)a3;
- (void)updateConstraints;
@end

@implementation RestaurantReservationTableViewCell

- (void)dealloc
{
  [(UIButton *)self->_errorButton removeObserver:self forKeyPath:@"highlighted" context:off_1015F5FA0];
  v3.receiver = self;
  v3.super_class = (Class)RestaurantReservationTableViewCell;
  [(RestaurantReservationTableViewCell *)&v3 dealloc];
}

- (RestaurantReservationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)RestaurantReservationTableViewCell;
  v4 = [(RestaurantReservationTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RestaurantReservationTableViewCell *)v4 contentView];
    [v6 setClipsToBounds:1];

    [(RestaurantReservationTableViewCell *)v5 _initDateAndPartySizeContainerView];
    v7 = [(RestaurantReservationTableViewCell *)v5 contentView];
    [v7 addSubview:v5->_dateAndPartySizeContainerView];

    [(RestaurantReservationTableViewCell *)v5 _initLoadingIndicatorContainerView];
    v8 = [(RestaurantReservationTableViewCell *)v5 contentView];
    [v8 addSubview:v5->_loadingIndicatorContainerView];

    [(RestaurantReservationTableViewCell *)v5 _initErrorContainerView];
    v9 = [(RestaurantReservationTableViewCell *)v5 contentView];
    [v9 addSubview:v5->_errorContainerView];

    [(RestaurantReservationTableViewCell *)v5 _initTimeSelectionCollectionView];
    v10 = [(RestaurantReservationTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_timeSelectionCollectionView];

    [(RestaurantReservationTableViewCell *)v5 _setupContentViewConstraints];
  }
  return v5;
}

- (void)_initDateAndPartySizeContainerView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  dateAndPartySizeContainerView = self->_dateAndPartySizeContainerView;
  self->_dateAndPartySizeContainerView = v7;

  v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v10 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody addingSymbolicTraits:0];
  [(UILabel *)v9 setFont:v10];

  [(UIView *)self->_dateAndPartySizeContainerView addSubview:v9];
  dateAndPartySizeLabel = self->_dateAndPartySizeLabel;
  self->_dateAndPartySizeLabel = v9;
  objc_super v12 = v9;

  v13 = +[UIButton buttonWithType:1];
  v14 = [(UILabel *)v12 font];
  v15 = [(UIButton *)v13 titleLabel];
  [v15 setFont:v14];

  if (MKApplicationLayoutDirectionIsRightToLeft()) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 2;
  }
  [(UIButton *)v13 setContentHorizontalAlignment:v16];
  [(UIView *)self->_dateAndPartySizeContainerView addSubview:v13];
  dateAndPartySizeButton = self->_dateAndPartySizeButton;
  self->_dateAndPartySizeButton = v13;

  self->_dateAndPartySizeHidden = 0;

  [(RestaurantReservationTableViewCell *)self _setupDateAndPartySizeContainerViewConstraints];
}

- (void)_setupDateAndPartySizeContainerViewConstraints
{
  [(UILabel *)self->_dateAndPartySizeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_dateAndPartySizeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(UILabel *)self->_dateAndPartySizeLabel leadingAnchor];
  v4 = [(UIView *)self->_dateAndPartySizeContainerView leadingAnchor];
  v24 = [v3 constraintEqualToAnchor:v4];

  v5 = [(UIButton *)self->_dateAndPartySizeButton leadingAnchor];
  v6 = [(UILabel *)self->_dateAndPartySizeLabel trailingAnchor];
  v7 = [v5 constraintGreaterThanOrEqualToAnchor:v6 constant:20.0];

  v8 = [(UIButton *)self->_dateAndPartySizeButton trailingAnchor];
  v9 = [(UIView *)self->_dateAndPartySizeContainerView trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];

  v11 = [(UILabel *)self->_dateAndPartySizeLabel topAnchor];
  objc_super v12 = [(UIView *)self->_dateAndPartySizeContainerView topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];

  v14 = [(UILabel *)self->_dateAndPartySizeLabel bottomAnchor];
  v15 = [(UIView *)self->_dateAndPartySizeContainerView bottomAnchor];
  uint64_t v16 = [v14 constraintEqualToAnchor:v15];

  v17 = [(UIButton *)self->_dateAndPartySizeButton topAnchor];
  v18 = [(UILabel *)self->_dateAndPartySizeLabel topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];

  v20 = [(UIButton *)self->_dateAndPartySizeButton bottomAnchor];
  v21 = [(UILabel *)self->_dateAndPartySizeLabel bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];

  v25[0] = v24;
  v25[1] = v7;
  v25[2] = v10;
  v25[3] = v13;
  v25[4] = v16;
  v25[5] = v19;
  v25[6] = v22;
  v23 = +[NSArray arrayWithObjects:v25 count:7];
  +[NSLayoutConstraint activateConstraints:v23];
}

- (void)_initLoadingIndicatorContainerView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  loadingIndicatorContainerView = self->_loadingIndicatorContainerView;
  self->_loadingIndicatorContainerView = v7;

  v9 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(UIView *)self->_loadingIndicatorContainerView addSubview:v9];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v9;
  v11 = v9;

  objc_super v12 = (UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  [(UILabel *)v12 setFont:v13];

  v14 = +[UIColor secondaryLabelColor];
  [(UILabel *)v12 setTextColor:v14];

  [(UILabel *)v12 setTextAlignment:1];
  [(UILabel *)v12 setNumberOfLines:0];
  [(UIView *)self->_loadingIndicatorContainerView addSubview:v12];
  loadingIndicatorLabel = self->_loadingIndicatorLabel;
  self->_loadingIndicatorLabel = v12;

  self->_loadingIndicatorHidden = 1;

  [(RestaurantReservationTableViewCell *)self _setupLoadingIndicatorContainerViewConstraints];
}

- (void)_setupLoadingIndicatorContainerViewConstraints
{
  [(UILabel *)self->_loadingIndicatorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_loadingIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(UIActivityIndicatorView *)self->_loadingIndicator centerXAnchor];
  v4 = [(UIView *)self->_loadingIndicatorContainerView centerXAnchor];
  v22 = [v3 constraintEqualToAnchor:v4];

  v5 = [(UIActivityIndicatorView *)self->_loadingIndicator centerYAnchor];
  v6 = [(UIView *)self->_loadingIndicatorContainerView centerYAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];

  v8 = [(UILabel *)self->_loadingIndicatorLabel leadingAnchor];
  v9 = [(UIView *)self->_loadingIndicatorContainerView leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];

  v11 = [(UILabel *)self->_loadingIndicatorLabel trailingAnchor];
  objc_super v12 = [(UIView *)self->_loadingIndicatorContainerView trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];

  v14 = [(UILabel *)self->_loadingIndicatorLabel firstBaselineAnchor];
  v15 = [(UIActivityIndicatorView *)self->_loadingIndicator bottomAnchor];
  uint64_t v16 = [(UILabel *)self->_loadingIndicatorLabel font];
  [v16 _mapkit_scaledValueForValue:15.0];
  v17 = [v14 constraintEqualToAnchor:v15];

  v18 = [(UILabel *)self->_loadingIndicatorLabel bottomAnchor];
  v19 = [(UIView *)self->_loadingIndicatorContainerView bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];

  v23[0] = v22;
  v23[1] = v7;
  v23[2] = v10;
  v23[3] = v13;
  v23[4] = v17;
  v23[5] = v20;
  v21 = +[NSArray arrayWithObjects:v23 count:6];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)_initErrorContainerView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  errorContainerView = self->_errorContainerView;
  self->_errorContainerView = v7;

  v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [(UILabel *)v9 setFont:v10];

  [(UILabel *)v9 setTextAlignment:1];
  [(UILabel *)v9 setNumberOfLines:0];
  v11 = +[UIColor labelColor];
  [(UILabel *)v9 setTextColor:v11];

  [(UIView *)self->_errorContainerView addSubview:v9];
  errorLabel = self->_errorLabel;
  self->_errorLabel = v9;
  v13 = v9;

  v14 = +[UIButton buttonWithType:1];
  [(UIButton *)v14 addObserver:self forKeyPath:@"highlighted" options:0 context:off_1015F5FA0];
  [(UIView *)self->_errorContainerView addSubview:v14];
  errorButton = self->_errorButton;
  self->_errorButton = v14;
  uint64_t v16 = v14;

  v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v18 = [(UIButton *)v16 titleColorForState:0];
  [(UILabel *)v17 setTextColor:v18];

  v19 = [(UILabel *)v13 font];
  [(UILabel *)v17 setFont:v19];

  [(UILabel *)v17 setTextAlignment:[(UILabel *)v13 textAlignment]];
  [(UILabel *)v17 setNumberOfLines:0];
  [(UIView *)self->_errorContainerView addSubview:v17];
  errorButtonTitleLabel = self->_errorButtonTitleLabel;
  self->_errorButtonTitleLabel = v17;

  self->_errorHidden = 1;

  [(RestaurantReservationTableViewCell *)self _setupErrorContainerViewConstraints];
}

- (void)_setupErrorContainerViewConstraints
{
  [(UILabel *)self->_errorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_errorButtonTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_errorButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(UILabel *)self->_errorLabel topAnchor];
  v4 = [(UIView *)self->_errorContainerView topAnchor];
  v37 = [v3 constraintEqualToAnchor:v4];

  v5 = [(UILabel *)self->_errorLabel leadingAnchor];
  v6 = [(UIView *)self->_errorContainerView leadingAnchor];
  v36 = [v5 constraintEqualToAnchor:v6];

  v7 = [(UILabel *)self->_errorLabel trailingAnchor];
  v8 = [(UIView *)self->_errorContainerView trailingAnchor];
  v35 = [v7 constraintEqualToAnchor:v8];

  v9 = [(UILabel *)self->_errorButtonTitleLabel firstBaselineAnchor];
  v10 = [(UILabel *)self->_errorLabel lastBaselineAnchor];
  v11 = [(UILabel *)self->_errorButtonTitleLabel font];
  [v11 _mapkit_scaledValueForValue:19.0];
  v34 = [v9 constraintEqualToAnchor:v10];

  objc_super v12 = [(UILabel *)self->_errorButtonTitleLabel centerXAnchor];
  v13 = [(UIView *)self->_errorContainerView centerXAnchor];
  v33 = [v12 constraintEqualToAnchor:v13];

  v14 = [(UILabel *)self->_errorButtonTitleLabel widthAnchor];
  v15 = [(UIView *)self->_errorContainerView widthAnchor];
  v32 = [v14 constraintLessThanOrEqualToAnchor:v15];

  uint64_t v16 = [(UILabel *)self->_errorButtonTitleLabel bottomAnchor];
  v17 = [(UIView *)self->_errorContainerView bottomAnchor];
  v31 = [v16 constraintEqualToAnchor:v17];

  v18 = [(UIButton *)self->_errorButton leadingAnchor];
  v19 = [(UILabel *)self->_errorButtonTitleLabel leadingAnchor];
  v30 = [v18 constraintEqualToAnchor:v19];

  v20 = [(UIButton *)self->_errorButton trailingAnchor];
  v21 = [(UILabel *)self->_errorButtonTitleLabel trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];

  v23 = [(UIButton *)self->_errorButton topAnchor];
  v24 = [(UILabel *)self->_errorButtonTitleLabel topAnchor];
  v29 = [v23 constraintEqualToAnchor:v24];

  v25 = [(UIButton *)self->_errorButton bottomAnchor];
  v26 = [(UIView *)self->_errorContainerView bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];

  v38[0] = v37;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v34;
  v38[4] = v33;
  v38[5] = v32;
  v38[6] = v31;
  v38[7] = v30;
  v38[8] = v22;
  v38[9] = v29;
  v38[10] = v27;
  v28 = +[NSArray arrayWithObjects:v38 count:11];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015F5FA0 == a6)
  {
    id v13 = [(RestaurantReservationTableViewCell *)self errorButton];
    unsigned int v8 = [v13 isHighlighted];
    v9 = [(RestaurantReservationTableViewCell *)self errorButton];
    v10 = v9;
    if (v8)
    {
      v6 = [v9 titleColorForState:1];
      [v6 colorWithAlphaComponent:0.200000003];
    }
    else
    {
      [v9 titleColorForState:0];
    v11 = };
    objc_super v12 = [(RestaurantReservationTableViewCell *)self errorButtonTitleLabel];
    [v12 setTextColor:v11];

    if (v8)
    {

      v11 = v6;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)RestaurantReservationTableViewCell;
    -[RestaurantReservationTableViewCell observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_initTimeSelectionCollectionView
{
  objc_super v12 = objc_alloc_init(RestaurantReservationCollectionViewFlowLayout);
  [(RestaurantReservationCollectionViewFlowLayout *)v12 setScrollDirection:1];
  -[RestaurantReservationCollectionViewFlowLayout setItemSize:](v12, "setItemSize:", 90.0, 80.0);
  -[RestaurantReservationCollectionViewFlowLayout setEstimatedItemSize:](v12, "setEstimatedItemSize:", 90.0, 80.0);
  [(RestaurantReservationCollectionViewFlowLayout *)v12 setSectionHeadersPinToVisibleBounds:1];
  -[RestaurantReservationCollectionViewFlowLayout setHeaderReferenceSize:](v12, "setHeaderReferenceSize:", 100.0, 40.0);
  [(RestaurantReservationCollectionViewFlowLayout *)v12 setMinimumLineSpacing:15.0];
  [(RestaurantReservationCollectionViewFlowLayout *)v12 setMinimumInteritemSpacing:15.0];
  id v3 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v4 = +[UIColor clearColor];
  [(UICollectionView *)v3 setBackgroundColor:v4];

  -[UICollectionView setContentInset:](v3, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
  uint64_t v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = [v6 reuseIdentifierForClass:objc_opt_class()];
  [(UICollectionView *)v3 registerClass:v5 forCellWithReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = [v9 reuseIdentifierForClass:objc_opt_class()];
  [(UICollectionView *)v3 registerClass:v8 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v10];

  timeSelectionCollectionView = self->_timeSelectionCollectionView;
  self->_timeSelectionCollectionView = v3;
}

- (void)_setupContentViewConstraints
{
  [(UIView *)self->_dateAndPartySizeContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(UIView *)self->_dateAndPartySizeContainerView leadingAnchor];
  v4 = [(RestaurantReservationTableViewCell *)self contentView];
  uint64_t v5 = [v4 layoutMarginsGuide];
  v6 = [v5 leadingAnchor];
  v83 = [v3 constraintEqualToAnchor:v6];

  v7 = [(UIView *)self->_dateAndPartySizeContainerView trailingAnchor];
  uint64_t v8 = [(RestaurantReservationTableViewCell *)self contentView];
  v9 = [v8 layoutMarginsGuide];
  v10 = [v9 trailingAnchor];
  v82 = [v7 constraintEqualToAnchor:v10];

  v11 = [(UIView *)self->_dateAndPartySizeContainerView topAnchor];
  objc_super v12 = [(RestaurantReservationTableViewCell *)self contentView];
  id v13 = [v12 layoutMarginsGuide];
  objc_super v14 = [v13 topAnchor];
  v81 = [v11 constraintEqualToAnchor:v14];

  v15 = [(RestaurantReservationTableViewCell *)self contentView];
  uint64_t v16 = [v15 bottomAnchor];
  v17 = [(UIView *)self->_dateAndPartySizeContainerView bottomAnchor];
  v80 = [v16 constraintGreaterThanOrEqualToAnchor:v17];

  [(UIView *)self->_loadingIndicatorContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(UIView *)self->_loadingIndicatorContainerView leadingAnchor];
  v19 = [(RestaurantReservationTableViewCell *)self contentView];
  v20 = [v19 layoutMarginsGuide];
  v21 = [v20 leadingAnchor];
  v79 = [v18 constraintEqualToAnchor:v21];

  v22 = [(UIView *)self->_loadingIndicatorContainerView trailingAnchor];
  v23 = [(RestaurantReservationTableViewCell *)self contentView];
  v24 = [v23 layoutMarginsGuide];
  v25 = [v24 trailingAnchor];
  v78 = [v22 constraintEqualToAnchor:v25];

  v26 = [(UIView *)self->_loadingIndicatorContainerView centerYAnchor];
  v27 = [(RestaurantReservationTableViewCell *)self contentView];
  v28 = [v27 centerYAnchor];
  v77 = [v26 constraintEqualToAnchor:v28];

  v29 = [(RestaurantReservationTableViewCell *)self contentView];
  v30 = [v29 bottomAnchor];
  v31 = [(UIView *)self->_loadingIndicatorContainerView bottomAnchor];
  v76 = [v30 constraintGreaterThanOrEqualToAnchor:v31];

  [(UIView *)self->_errorContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v32 = [(UIView *)self->_errorContainerView leadingAnchor];
  v33 = [(RestaurantReservationTableViewCell *)self contentView];
  v34 = [v33 layoutMarginsGuide];
  v35 = [v34 leadingAnchor];
  v75 = [v32 constraintEqualToAnchor:v35];

  v36 = [(UIView *)self->_errorContainerView trailingAnchor];
  v37 = [(RestaurantReservationTableViewCell *)self contentView];
  v38 = [v37 layoutMarginsGuide];
  v39 = [v38 trailingAnchor];
  v74 = [v36 constraintEqualToAnchor:v39];

  v40 = [(UIView *)self->_errorContainerView centerYAnchor];
  v41 = [(RestaurantReservationTableViewCell *)self contentView];
  v42 = [v41 centerYAnchor];
  v72 = [v40 constraintEqualToAnchor:v42];

  v43 = [(RestaurantReservationTableViewCell *)self contentView];
  v44 = [v43 layoutMarginsGuide];
  v45 = [v44 bottomAnchor];
  v46 = [(UIView *)self->_errorContainerView bottomAnchor];
  v71 = [v45 constraintGreaterThanOrEqualToAnchor:v46];

  [(UICollectionView *)self->_timeSelectionCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v47 = [(UICollectionView *)self->_timeSelectionCollectionView leftAnchor];
  v48 = [(RestaurantReservationTableViewCell *)self contentView];
  v49 = [v48 leftAnchor];
  v70 = [v47 constraintEqualToAnchor:v49];

  v50 = [(UICollectionView *)self->_timeSelectionCollectionView rightAnchor];
  v51 = [(RestaurantReservationTableViewCell *)self contentView];
  v52 = [v51 rightAnchor];
  v73 = [v50 constraintEqualToAnchor:v52];

  v53 = [(UICollectionView *)self->_timeSelectionCollectionView heightAnchor];
  v69 = [v53 constraintEqualToConstant:115.0];

  v54 = [(UICollectionView *)self->_timeSelectionCollectionView topAnchor];
  v55 = [(UIView *)self->_dateAndPartySizeContainerView bottomAnchor];
  v56 = [(UILabel *)self->_loadingIndicatorLabel font];
  [v56 _mapkit_scaledValueForValue:12.0];
  v68 = [v54 constraintGreaterThanOrEqualToAnchor:v55];

  v57 = [(RestaurantReservationTableViewCell *)self contentView];
  v58 = [v57 bottomAnchor];
  v59 = [(UICollectionView *)self->_timeSelectionCollectionView bottomAnchor];
  v60 = [v58 constraintEqualToAnchor:v59 constant:-22.0];

  v61 = [(RestaurantReservationTableViewCell *)self contentView];
  v62 = [v61 heightAnchor];
  v63 = [v62 constraintGreaterThanOrEqualToConstant:149.0];

  v84[0] = v83;
  v84[1] = v82;
  v84[2] = v81;
  v84[3] = v80;
  v84[4] = v79;
  v84[5] = v78;
  v84[6] = v77;
  v84[7] = v76;
  v84[8] = v75;
  v84[9] = v74;
  v84[10] = v72;
  v84[11] = v71;
  v84[12] = v70;
  v84[13] = v73;
  v84[14] = v68;
  v84[15] = v69;
  v84[16] = v60;
  v84[17] = v63;
  v64 = +[NSArray arrayWithObjects:v84 count:18];
  +[NSLayoutConstraint activateConstraints:v64];

  contentBottomByError = self->_contentBottomByError;
  self->_contentBottomByError = v71;
  v66 = v71;

  contentBottomByTimeSelection = self->_contentBottomByTimeSelection;
  self->_contentBottomByTimeSelection = v60;
}

- (void)addDateAndPartySizeButtonTouchUpInsideTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(RestaurantReservationTableViewCell *)self dateAndPartySizeButton];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

- (void)setDateAndPartySizeText:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationTableViewCell *)self dateAndPartySizeLabel];
  [v5 setText:v4];
}

- (NSString)dateAndPartySizeText
{
  v2 = [(RestaurantReservationTableViewCell *)self dateAndPartySizeLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDateAndPartySizeButtonText:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationTableViewCell *)self dateAndPartySizeButton];
  [v5 setTitle:v4 forState:0];
}

- (NSString)dateAndPartySizeButtonText
{
  v2 = [(RestaurantReservationTableViewCell *)self dateAndPartySizeButton];
  id v3 = [v2 titleForState:0];

  return (NSString *)v3;
}

- (void)setHideDateAndPartySize:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(RestaurantReservationTableViewCell *)self dateAndPartySizeHidden] != a3)
  {
    if (v4)
    {
      [(RestaurantReservationTableViewCell *)self layoutIfNeeded];
      [(RestaurantReservationTableViewCell *)self setDateAndPartySizeHidden:v5];
      [(RestaurantReservationTableViewCell *)self setNeedsLayout];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100C3D78C;
      v7[3] = &unk_1012E5D08;
      v7[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:0];
    }
    else
    {
      [(RestaurantReservationTableViewCell *)self setDateAndPartySizeHidden:v5];
      [(RestaurantReservationTableViewCell *)self setNeedsLayout];
    }
  }
}

- (void)setLoading:(BOOL)a3
{
}

- (BOOL)loading
{
  return ![(RestaurantReservationTableViewCell *)self loadingIndicatorHidden];
}

- (void)setLoading:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(RestaurantReservationTableViewCell *)self loading] != a3)
  {
    [(RestaurantReservationTableViewCell *)self setLoadingIndicatorHidden:!v5];
    [(RestaurantReservationTableViewCell *)self setNeedsLayout];
    if (v5)
    {
      id v7 = [(RestaurantReservationTableViewCell *)self loadingIndicator];
      [v7 startAnimating];

      if (!v4) {
        return;
      }
      goto LABEL_6;
    }
    if (v4)
    {
LABEL_6:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100C3D91C;
      v11[3] = &unk_1012E5D08;
      v11[4] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100C3D924;
      v9[3] = &unk_1012E8908;
      BOOL v10 = v5;
      v9[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v11 completion:v9];
      return;
    }
    id v8 = [(RestaurantReservationTableViewCell *)self loadingIndicator];
    [v8 stopAnimating];
  }
}

- (void)setLoadingText:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationTableViewCell *)self loadingIndicatorLabel];
  [v5 setText:v4];
}

- (NSString)loadingText
{
  v2 = [(RestaurantReservationTableViewCell *)self loadingIndicatorLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setErrorText:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationTableViewCell *)self errorLabel];
  [v5 setText:v4];
}

- (NSString)errorText
{
  v2 = [(RestaurantReservationTableViewCell *)self errorLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setErrorButtonText:(id)a3
{
  id v4 = a3;
  id v5 = [(RestaurantReservationTableViewCell *)self errorButtonTitleLabel];
  [v5 setText:v4];
}

- (NSString)errorButtonText
{
  v2 = [(RestaurantReservationTableViewCell *)self errorButtonTitleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDisplayError:(BOOL)a3
{
}

- (BOOL)displayError
{
  return ![(RestaurantReservationTableViewCell *)self errorHidden];
}

- (void)setDisplayError:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(RestaurantReservationTableViewCell *)self displayError] != a3)
  {
    if (v4)
    {
      [(RestaurantReservationTableViewCell *)self layoutIfNeeded];
      [(RestaurantReservationTableViewCell *)self setErrorHidden:!v5];
      [(RestaurantReservationTableViewCell *)self setNeedsLayout];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100C3DCA0;
      v7[3] = &unk_1012E5D08;
      v7[4] = self;
      +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:0];
    }
    else
    {
      [(RestaurantReservationTableViewCell *)self setErrorHidden:!v5];
      [(RestaurantReservationTableViewCell *)self setNeedsLayout];
    }
  }
}

- (void)addErrorButtonTouchUpInsideTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(RestaurantReservationTableViewCell *)self errorButton];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

- (RestaurantReservationCollectionViewFlowLayout)timeSelectionCollectionViewLayout
{
  v2 = [(RestaurantReservationTableViewCell *)self timeSelectionCollectionView];
  id v3 = [v2 collectionViewLayout];

  return (RestaurantReservationCollectionViewFlowLayout *)v3;
}

- (BOOL)timeSelectionHidden
{
  if ([(RestaurantReservationTableViewCell *)self loadingIndicatorHidden]) {
    return ![(RestaurantReservationTableViewCell *)self errorHidden];
  }
  else {
    return 1;
  }
}

- (void)setDisplayOffers:(BOOL)a3
{
  if (self->_displayOffers != a3)
  {
    self->_displayOffers = a3;
    [(RestaurantReservationTableViewCell *)self _updateContentViewBottomConstraint];
  }
}

+ (id)reuseIdentifierForClass:(Class)a3
{
  return NSStringFromClass(a3);
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)RestaurantReservationTableViewCell;
  [(RestaurantReservationTableViewCell *)&v11 layoutSubviews];
  if ([(RestaurantReservationTableViewCell *)self dateAndPartySizeHidden]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  BOOL v4 = [(RestaurantReservationTableViewCell *)self dateAndPartySizeContainerView];
  [v4 setAlpha:v3];

  if ([(RestaurantReservationTableViewCell *)self loadingIndicatorHidden]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  id v6 = [(RestaurantReservationTableViewCell *)self loadingIndicatorContainerView];
  [v6 setAlpha:v5];

  if ([(RestaurantReservationTableViewCell *)self errorHidden]) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  id v8 = [(RestaurantReservationTableViewCell *)self errorContainerView];
  [v8 setAlpha:v7];

  if ([(RestaurantReservationTableViewCell *)self timeSelectionHidden]) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  BOOL v10 = [(RestaurantReservationTableViewCell *)self timeSelectionCollectionView];
  [v10 setAlpha:v9];
}

- (void)updateConstraints
{
  double v3 = [(RestaurantReservationTableViewCell *)self contentBottomByError];

  if (v3)
  {
    unsigned int v4 = [(RestaurantReservationTableViewCell *)self errorHidden];
    uint64_t v5 = [(RestaurantReservationTableViewCell *)self contentBottomByError];
    id v6 = (void *)v5;
    if (v4)
    {
      uint64_t v10 = v5;
      double v7 = +[NSArray arrayWithObjects:&v10 count:1];
      +[NSLayoutConstraint deactivateConstraints:v7];
    }
    else
    {
      uint64_t v9 = v5;
      double v7 = +[NSArray arrayWithObjects:&v9 count:1];
      +[NSLayoutConstraint activateConstraints:v7];
    }
  }
  [(RestaurantReservationTableViewCell *)self _updateContentViewBottomConstraint];
  v8.receiver = self;
  v8.super_class = (Class)RestaurantReservationTableViewCell;
  [(RestaurantReservationTableViewCell *)&v8 updateConstraints];
}

- (void)_updateContentViewBottomConstraint
{
  if ([(RestaurantReservationTableViewCell *)self displayOffers]) {
    double v3 = -4.0;
  }
  else {
    double v3 = -22.0;
  }
  id v4 = [(RestaurantReservationTableViewCell *)self contentBottomByTimeSelection];
  [v4 setConstant:v3];
}

- (UIView)dateAndPartySizeContainerView
{
  return self->_dateAndPartySizeContainerView;
}

- (void)setDateAndPartySizeContainerView:(id)a3
{
}

- (UILabel)dateAndPartySizeLabel
{
  return self->_dateAndPartySizeLabel;
}

- (void)setDateAndPartySizeLabel:(id)a3
{
}

- (UIButton)dateAndPartySizeButton
{
  return self->_dateAndPartySizeButton;
}

- (void)setDateAndPartySizeButton:(id)a3
{
}

- (BOOL)dateAndPartySizeHidden
{
  return self->_dateAndPartySizeHidden;
}

- (void)setDateAndPartySizeHidden:(BOOL)a3
{
  self->_dateAndPartySizeHidden = a3;
}

- (UIView)loadingIndicatorContainerView
{
  return self->_loadingIndicatorContainerView;
}

- (void)setLoadingIndicatorContainerView:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (UILabel)loadingIndicatorLabel
{
  return self->_loadingIndicatorLabel;
}

- (void)setLoadingIndicatorLabel:(id)a3
{
}

- (BOOL)loadingIndicatorHidden
{
  return self->_loadingIndicatorHidden;
}

- (void)setLoadingIndicatorHidden:(BOOL)a3
{
  self->_loadingIndicatorHidden = a3;
}

- (UIView)errorContainerView
{
  return self->_errorContainerView;
}

- (void)setErrorContainerView:(id)a3
{
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (UIButton)errorButton
{
  return self->_errorButton;
}

- (void)setErrorButton:(id)a3
{
}

- (UILabel)errorButtonTitleLabel
{
  return self->_errorButtonTitleLabel;
}

- (void)setErrorButtonTitleLabel:(id)a3
{
}

- (BOOL)errorHidden
{
  return self->_errorHidden;
}

- (void)setErrorHidden:(BOOL)a3
{
  self->_errorHidden = a3;
}

- (UICollectionView)timeSelectionCollectionView
{
  return self->_timeSelectionCollectionView;
}

- (void)setTimeSelectionCollectionView:(id)a3
{
}

- (BOOL)displayOffers
{
  return self->_displayOffers;
}

- (NSLayoutConstraint)contentBottomByTimeSelection
{
  return self->_contentBottomByTimeSelection;
}

- (void)setContentBottomByTimeSelection:(id)a3
{
}

- (NSLayoutConstraint)contentBottomByError
{
  return self->_contentBottomByError;
}

- (void)setContentBottomByError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBottomByError, 0);
  objc_storeStrong((id *)&self->_contentBottomByTimeSelection, 0);
  objc_storeStrong((id *)&self->_timeSelectionCollectionView, 0);
  objc_storeStrong((id *)&self->_errorButtonTitleLabel, 0);
  objc_storeStrong((id *)&self->_errorButton, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_errorContainerView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_dateAndPartySizeButton, 0);
  objc_storeStrong((id *)&self->_dateAndPartySizeLabel, 0);

  objc_storeStrong((id *)&self->_dateAndPartySizeContainerView, 0);
}

@end