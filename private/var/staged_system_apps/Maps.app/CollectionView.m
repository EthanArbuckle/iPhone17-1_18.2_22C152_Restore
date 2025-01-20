@interface CollectionView
- (BOOL)_shouldTextContainerHeightMatchNewCollectionLabel;
- (BOOL)_shouldWrapText;
- (BOOL)allowAccessibilityTextWrapping;
- (BOOL)becomeFirstResponder;
- (BOOL)disabled;
- (BOOL)editing;
- (BOOL)showsCheckmark;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CollectionEditSession)editSession;
- (CollectionHandlerInfo)collectionInfo;
- (CollectionView)initWithCollectionViewSize:(unint64_t)a3;
- (CollectionView)initWithFrame:(CGRect)a3;
- (CollectionViewDelegate)delegate;
- (NSString)maxContentSizeCategory;
- (double)_imageWidth;
- (double)_verticalMargin;
- (double)shrinkFactor;
- (id)_effectiveContentSizeCategory;
- (id)_effectiveTraitCollection;
- (id)_subtitleFont;
- (id)_textAttachmentSpacer;
- (id)_titleFont;
- (int64_t)_subtitleNumberOfLines;
- (int64_t)_titleNumberOfLines;
- (unint64_t)collectionViewSize;
- (void)_effectiveContentSizeCategoryDidChange:(id)a3;
- (void)_updateConstraintConstants;
- (void)_updateConstraints;
- (void)_updateContent;
- (void)_updateFonts;
- (void)_updateNumberOfLines;
- (void)collectionImageViewButtonSelected:(id)a3;
- (void)commonInit;
- (void)dealloc;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)setAllowAccessibilityTextWrapping:(BOOL)a3;
- (void)setCollectionInfo:(id)a3;
- (void)setCollectionViewSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEditSession:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setMaxContentSizeCategory:(id)a3;
- (void)setShowCheckmark:(BOOL)a3;
- (void)setShrinkFactor:(double)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CollectionView

- (CollectionView)initWithCollectionViewSize:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CollectionView;
  v4 = -[CollectionView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_collectionViewSize = a3;
    if (a3 == 1 && _MKPlaceCardUseSmallerFont()) {
      v5->_collectionViewSize = 0;
    }
    v5->_allowAccessibilityTextWrapping = 1;
    [(CollectionView *)v5 commonInit];
  }
  return v5;
}

- (CollectionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CollectionView;
  v3 = -[CollectionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_collectionViewSize = 0;
    [(CollectionView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  [(CollectionView *)self setAccessibilityIdentifier:@"CollectionView"];
  v3 = [CollectionImageView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v7 = -[CollectionImageView initWithFrame:makeCornersRounded:](v3, "initWithFrame:makeCornersRounded:", 1, CGRectZero.origin.x, y, width, height);
  [(CollectionImageView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CollectionImageView *)v7 setDelegate:self];
  [(CollectionImageView *)v7 setUserInteractionEnabled:0];
  [(CollectionView *)self addSubview:v7];
  imageView = self->_imageView;
  self->_imageView = v7;
  v45 = v7;

  id v9 = objc_alloc((Class)UIImageView);
  [(CollectionView *)self bounds];
  v10 = [v9 initWithFrame:];
  [(UIImageView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)v10 setClipsToBounds:1];
  [(UIImageView *)v10 _setContinuousCornerRadius:5.0];
  [(UIImageView *)v10 setHidden:1];
  [(UIImageView *)v10 setAccessibilityIdentifier:@"CollectionBadgeImage"];
  [(CollectionView *)self addSubview:v10];
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = v10;
  v12 = v10;

  v13 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  [(CollectionView *)self addLayoutGuide:v13];
  textContainerLayoutGuide = self->_textContainerLayoutGuide;
  self->_textContainerLayoutGuide = v13;
  v15 = v13;

  v16 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UIImageView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)v16 setContentMode:4];
  v17 = +[UIImage systemImageNamed:@"checkmark"];
  [(UIImageView *)v16 setImage:v17];

  v18 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:17.0];
  [(UIImageView *)v16 setPreferredSymbolConfiguration:v18];

  v19 = [(CollectionView *)self theme];
  v20 = [v19 keyColor];
  [(UIImageView *)v16 setTintColor:v20];

  [(UIImageView *)v16 setHidden:1];
  [(UIImageView *)v16 setAccessibilityIdentifier:@"CollectionImage"];
  [(CollectionView *)self addSubview:v16];
  imageCheckmarkView = self->_imageCheckmarkView;
  self->_imageCheckmarkView = v16;
  v22 = v16;

  v23 = [objc_alloc((Class)UITextField) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UITextField *)v23 setDelegate:self];
  [(UITextField *)v23 setReturnKeyType:9];
  [(UITextField *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = +[UIColor clearColor];
  [(UITextField *)v23 setBackgroundColor:v24];

  [(UITextField *)v23 setUserInteractionEnabled:0];
  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"[Collection] Collection Name placeholder" value:@"localized string not found" table:0];
  [(UITextField *)v23 setPlaceholder:v26];

  v27 = +[UIColor labelColor];
  [(UITextField *)v23 setTextColor:v27];

  [(UITextField *)v23 setEnabled:0];
  [(UITextField *)v23 setAccessibilityIdentifier:@"CollectionTitleTextField"];
  [(UITextField *)v23 setTextAlignment:2* ([(CollectionView *)self effectiveUserInterfaceLayoutDirection] == (id)1)];
  [(CollectionView *)self addSubview:v23];
  titleTextField = self->_titleTextField;
  self->_titleTextField = v23;
  v29 = v23;

  v30 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UILabel *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = +[UIColor clearColor];
  [(UILabel *)v30 setBackgroundColor:v31];

  v32 = +[UIColor labelColor];
  [(UILabel *)v30 setTextColor:v32];

  LODWORD(v33) = 1144750080;
  [(UILabel *)v30 setContentHuggingPriority:1 forAxis:v33];
  [(UILabel *)v30 setAccessibilityIdentifier:@"CollectionTitleLabel"];
  [(CollectionView *)self addSubview:v30];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v30;
  v35 = v30;

  v36 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UILabel *)v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  v37 = +[UIColor clearColor];
  [(UILabel *)v36 setBackgroundColor:v37];

  v38 = +[UIColor secondaryLabelColor];
  [(UILabel *)v36 setTextColor:v38];

  LODWORD(v39) = 1144750080;
  [(UILabel *)v36 setContentHuggingPriority:1 forAxis:v39];
  [(UILabel *)v36 setAccessibilityIdentifier:@"CollectionSubtitleLabel"];
  [(CollectionView *)self addSubview:v36];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v36;
  v41 = v36;

  v42 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(MapsThemeLabel *)v42 setTranslatesAutoresizingMaskIntoConstraints:0];
  v43 = +[UIColor clearColor];
  [(MapsThemeLabel *)v42 setBackgroundColor:v43];

  [(MapsThemeLabel *)v42 setTextColorProvider:&stru_1012F7D28];
  [(MapsThemeLabel *)v42 setAccessibilityIdentifier:@"CollectionNewCollectionLabel"];
  [(CollectionView *)self addSubview:v42];
  newCollectionLabel = self->_newCollectionLabel;
  self->_newCollectionLabel = v42;

  [(CollectionView *)self _updateFonts];
  [(CollectionView *)self _updateNumberOfLines];
  [(CollectionView *)self _updateConstraints];

  [(CollectionView *)self _updateContent];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CollectionView;
  id v4 = a3;
  [(MapsThemeView *)&v10 traitCollectionDidChange:v4];
  v5 = [v4 preferredContentSizeCategory];

  objc_super v6 = [(CollectionView *)self maxContentSizeCategory];
  objc_super v7 = sub_1000E9204(v5, 0, v6);

  v8 = [(CollectionView *)self _effectiveContentSizeCategory];
  uint64_t v9 = sub_1000E93B0(v8, v7);

  if (v9) {
    [(CollectionView *)self _effectiveContentSizeCategoryDidChange:v7];
  }
}

- (BOOL)becomeFirstResponder
{
  return [(UITextField *)self->_titleTextField becomeFirstResponder];
}

- (void)dealloc
{
  if (self->_titleObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_titleObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)CollectionView;
  [(CollectionView *)&v4 dealloc];
}

- (double)_imageWidth
{
  unsigned __int8 v3 = [(CollectionView *)self _shouldWrapText];
  double result = 30.0;
  if ((v3 & 1) == 0)
  {
    unint64_t collectionViewSize = self->_collectionViewSize;
    double result = 72.0;
    if (collectionViewSize != 1) {
      double result = 0.0;
    }
    if (!collectionViewSize) {
      return 50.0;
    }
  }
  return result;
}

- (double)_verticalMargin
{
  unint64_t collectionViewSize = self->_collectionViewSize;
  double result = 0.0;
  if (collectionViewSize == 1) {
    double result = 12.0;
  }
  if (!collectionViewSize) {
    return 16.0;
  }
  return result;
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    double v3 = 1.0;
    if (a3) {
      double v3 = 0.5;
    }
    [(CollectionView *)self setAlpha:v3];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    BOOL v3 = a3;
    if (([(CollectionHandlerInfo *)self->_collectionInfo canEditImage] & 1) != 0
      || [(CollectionHandlerInfo *)self->_collectionInfo canEditTitle])
    {
      self->_editing = v3;
      if ([(CollectionHandlerInfo *)self->_collectionInfo canEditTitle])
      {
        [(UITextField *)self->_titleTextField setUserInteractionEnabled:v3];
        [(UITextField *)self->_titleTextField setEnabled:v3];
      }
      [(CollectionImageView *)self->_imageView setUserInteractionEnabled:v3];
      [(CollectionImageView *)self->_imageView setEditing:v3];
      if (self->_editing)
      {
        v5 = [(CollectionView *)self collectionInfo];
        unsigned int v6 = [v5 isEmpty];

        if (v6)
        {
          objc_initWeak(&location, self);
          objc_super v7 = +[NSNotificationCenter defaultCenter];
          titleTextField = self->_titleTextField;
          v18 = _NSConcreteStackBlock;
          uint64_t v19 = 3221225472;
          v20 = sub_100C5BA88;
          v21 = &unk_1012E6730;
          objc_copyWeak(&v22, &location);
          uint64_t v9 = [v7 addObserverForName:UITextFieldTextDidChangeNotification object:titleTextField queue:0 usingBlock:&v18];
          titleObserver = self->_titleObserver;
          self->_titleObserver = v9;

          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);
        }
        v11 = [(CollectionHandlerInfo *)self->_collectionInfo title];
        v12 = (NSString *)[v11 copy];
        originalTitle = self->_originalTitle;
        self->_originalTitle = v12;
      }
      else
      {
        if (self->_titleObserver)
        {
          v14 = +[NSNotificationCenter defaultCenter];
          [v14 removeObserver:self->_titleObserver];
        }
        v15 = [(UITextField *)self->_titleTextField text];
        if ([v15 length])
        {
        }
        else
        {
          v16 = self->_originalTitle;

          if (v16) {
            [(CollectionHandlerInfo *)self->_collectionInfo updateTitle:self->_originalTitle];
          }
        }
        v17 = self->_originalTitle;
        self->_originalTitle = 0;
      }
    }
    [(CollectionView *)self _updateContent];
  }
}

- (void)setCollectionInfo:(id)a3
{
  v5 = (CollectionHandlerInfo *)a3;
  collectionInfo = self->_collectionInfo;
  objc_super v7 = v5;
  if (collectionInfo != v5)
  {
    [(CollectionHandlerInfo *)collectionInfo removeObserver:self];
    objc_storeStrong((id *)&self->_collectionInfo, a3);
    [(CollectionHandlerInfo *)self->_collectionInfo addObserver:self];
    [(CollectionImageView *)self->_imageView setCollectionInfo:v7];
    [(CollectionView *)self _updateContent];
  }
}

- (void)setShowCheckmark:(BOOL)a3
{
  if (self->_showCheckmark != a3)
  {
    self->_showCheckmark = a3;
    [(UIImageView *)self->_imageCheckmarkView setHidden:!a3];
    [(CollectionView *)self _updateConstraintConstants];
  }
}

- (void)setShrinkFactor:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_shrinkFactor != v3)
  {
    self->_shrinkFactor = v3;
    [(CollectionView *)self _updateConstraintConstants];
    [(CollectionView *)self _updateNumberOfLines];
  }
}

- (void)setCollectionViewSize:(unint64_t)a3
{
  if (self->_collectionViewSize != a3)
  {
    self->_unint64_t collectionViewSize = a3;
    [(CollectionView *)self _updateFonts];
    [(CollectionView *)self _updateNumberOfLines];
    [(CollectionView *)self _updateConstraintConstants];
  }
}

- (void)setMaxContentSizeCategory:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_maxContentSizeCategory != v5)
  {
    uint64_t v9 = v5;
    unsigned int v6 = [(CollectionView *)self _effectiveContentSizeCategory];
    objc_storeStrong((id *)&self->_maxContentSizeCategory, a3);
    objc_super v7 = [(CollectionView *)self _effectiveContentSizeCategory];
    uint64_t v8 = sub_1000E93B0(v7, v6);

    if (v8) {
      [(CollectionView *)self _effectiveContentSizeCategoryDidChange:v6];
    }

    v5 = v9;
  }
}

- (void)setAllowAccessibilityTextWrapping:(BOOL)a3
{
  if (self->_allowAccessibilityTextWrapping != a3)
  {
    self->_allowAccessibilityTextWrapping = a3;
    objc_super v4 = [(CollectionView *)self _effectiveContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if (IsAccessibilityCategory)
    {
      [(CollectionView *)self _updateNumberOfLines];
      [(CollectionView *)self _updateConstraints];
      [(CollectionView *)self _updateContent];
    }
  }
}

- (void)_updateConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  constraints = self->_constraints;
  self->_constraints = 0;

  self->_textContainerHeightMatchesNewCollectionLabel = [(CollectionView *)self _shouldTextContainerHeightMatchNewCollectionLabel];
  v132 = +[NSMutableArray array];
  objc_super v4 = [(CollectionImageView *)self->_imageView heightAnchor];
  v5 = [v4 constraintEqualToConstant:0.0];
  imageHeight = self->_imageHeight;
  self->_imageHeight = v5;

  objc_super v7 = [(UIImageView *)self->_badgeImageView heightAnchor];
  uint64_t v8 = [v7 constraintEqualToConstant:0.0];
  badgeHeightConstraint = self->_badgeHeightConstraint;
  self->_badgeHeightConstraint = v8;

  objc_super v10 = [(UILayoutGuide *)self->_textContainerLayoutGuide trailingAnchor];
  v11 = [(CollectionView *)self trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:0.0];
  textContainerTrailingConstraint = self->_textContainerTrailingConstraint;
  self->_textContainerTrailingConstraint = v12;

  v14 = [(CollectionView *)self _subtitleFont];
  v15 = [(CollectionView *)self _subtitleFont];
  [v15 lineHeight];
  [v14 _scaledValueForValue:1];
  double v17 = v16;

  v137[0] = self->_imageHeight;
  v127 = [(UITextField *)self->_titleTextField topAnchor];
  v124 = [(UILayoutGuide *)self->_textContainerLayoutGuide topAnchor];
  v122 = [v127 constraintEqualToAnchor:v124];
  v137[1] = v122;
  v120 = [(UILabel *)self->_titleLabel topAnchor];
  v118 = [(UILayoutGuide *)self->_textContainerLayoutGuide topAnchor];
  v117 = [v120 constraintEqualToAnchor:v118];
  v137[2] = v117;
  v116 = [(UILabel *)self->_subtitleLabel firstBaselineAnchor];
  v115 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v114 = [v116 constraintEqualToAnchor:v115 constant:v17];
  v137[3] = v114;
  v113 = [(UIImageView *)self->_imageCheckmarkView centerYAnchor];
  v112 = [(CollectionView *)self centerYAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v137[4] = v111;
  v110 = [(UIImageView *)self->_imageCheckmarkView heightAnchor];
  v109 = [v110 constraintEqualToConstant:20.0];
  v18 = self->_badgeHeightConstraint;
  v137[5] = v109;
  v137[6] = v18;
  v108 = [(UIImageView *)self->_badgeImageView bottomAnchor];
  v107 = [(CollectionImageView *)self->_imageView bottomAnchor];
  v106 = [v108 constraintEqualToAnchor:v107 constant:4.0];
  uint64_t v19 = self->_textContainerTrailingConstraint;
  v137[7] = v106;
  v137[8] = v19;
  v105 = [(CollectionImageView *)self->_imageView leadingAnchor];
  v104 = [(CollectionView *)self leadingAnchor];
  v103 = [v105 constraintEqualToAnchor:v104 constant:16.0];
  v137[9] = v103;
  v102 = [(CollectionImageView *)self->_imageView widthAnchor];
  v101 = [(CollectionImageView *)self->_imageView heightAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v137[10] = v100;
  v99 = [(UITextField *)self->_titleTextField leadingAnchor];
  v98 = [(UILayoutGuide *)self->_textContainerLayoutGuide leadingAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v137[11] = v97;
  v96 = [(UITextField *)self->_titleTextField trailingAnchor];
  v95 = [(UILayoutGuide *)self->_textContainerLayoutGuide trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v137[12] = v94;
  v93 = [(UILabel *)self->_titleLabel leadingAnchor];
  v92 = [(UILayoutGuide *)self->_textContainerLayoutGuide leadingAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v137[13] = v91;
  v90 = [(UILabel *)self->_titleLabel trailingAnchor];
  v89 = [(UILayoutGuide *)self->_textContainerLayoutGuide trailingAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v137[14] = v88;
  v87 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v86 = [(UILayoutGuide *)self->_textContainerLayoutGuide leadingAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v137[15] = v85;
  v84 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v83 = [(UILayoutGuide *)self->_textContainerLayoutGuide trailingAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v137[16] = v82;
  v81 = [(MapsThemeLabel *)self->_newCollectionLabel leadingAnchor];
  v80 = [(UILayoutGuide *)self->_textContainerLayoutGuide leadingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v137[17] = v79;
  v78 = [(MapsThemeLabel *)self->_newCollectionLabel trailingAnchor];
  v77 = [(UILayoutGuide *)self->_textContainerLayoutGuide trailingAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v137[18] = v76;
  v75 = [(UIImageView *)self->_imageCheckmarkView trailingAnchor];
  v74 = [(CollectionView *)self trailingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74 constant:-16.0];
  v137[19] = v73;
  v20 = [(UIImageView *)self->_imageCheckmarkView widthAnchor];
  v21 = [v20 constraintEqualToConstant:20.0];
  v137[20] = v21;
  id v22 = [(UIImageView *)self->_badgeImageView widthAnchor];
  v23 = [(UIImageView *)self->_badgeImageView heightAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v137[21] = v24;
  v25 = [(UIImageView *)self->_badgeImageView trailingAnchor];
  v26 = [(CollectionImageView *)self->_imageView trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:4.0];
  v137[22] = v27;
  v28 = +[NSArray arrayWithObjects:v137 count:23];
  [v132 addObjectsFromArray:v28];

  if ([(CollectionView *)self _shouldWrapText])
  {
    v29 = v132;
    id v30 = [(CollectionHandlerInfo *)self->_collectionInfo handlerType];
    v31 = [(CollectionImageView *)self->_imageView bottomAnchor];
    v131 = v31;
    if (v30 == (id)1)
    {
      v128 = [(MapsThemeLabel *)self->_newCollectionLabel firstBaselineAnchor];
      v125 = [v31 constraintEqualToAnchor:];
      v136[0] = v125;
      v32 = [(MapsThemeLabel *)self->_newCollectionLabel topAnchor];
      double v33 = [(UILayoutGuide *)self->_textContainerLayoutGuide topAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      v136[1] = v34;
      v35 = [(MapsThemeLabel *)self->_newCollectionLabel bottomAnchor];
      v36 = [(UILayoutGuide *)self->_textContainerLayoutGuide bottomAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      v136[2] = v37;
      v38 = v136;
    }
    else
    {
      v128 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
      v125 = [v31 constraintEqualToAnchor:];
      v135[0] = v125;
      v32 = [(UILabel *)self->_subtitleLabel bottomAnchor];
      double v33 = [(UILayoutGuide *)self->_textContainerLayoutGuide bottomAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      v135[1] = v34;
      v35 = [(MapsThemeLabel *)self->_newCollectionLabel centerYAnchor];
      v36 = [(UILayoutGuide *)self->_textContainerLayoutGuide centerYAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      v135[2] = v37;
      v38 = v135;
    }
    v59 = +[NSArray arrayWithObjects:v38 count:3];
    [v132 addObjectsFromArray:v59];

    v60 = [(UILayoutGuide *)self->_textContainerLayoutGuide topAnchor];
    v61 = [(CollectionView *)self topAnchor];
    v62 = [v60 constraintEqualToAnchor:v61];
    topConstraint = self->_topConstraint;
    self->_topConstraint = v62;

    v64 = [(UILayoutGuide *)self->_textContainerLayoutGuide bottomAnchor];
    v65 = [(CollectionView *)self bottomAnchor];
    v58 = &unk_100F6F000;
    LODWORD(v66) = 1144733696;
    v67 = [v64 constraintEqualToAnchor:v65 constant:0.0 priority:v66];
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v67;

    v56 = [(UILayoutGuide *)self->_textContainerLayoutGuide leadingAnchor];
    v55 = [(CollectionView *)self leadingAnchor];
    v57 = [v56 constraintEqualToAnchor:v55 constant:16.0];
    v69 = self->_topConstraint;
    v134[0] = v57;
    v134[1] = v69;
    v134[2] = self->_bottomConstraint;
    v48 = +[NSArray arrayWithObjects:v134 count:3];
    [v132 addObjectsFromArray:v48];
  }
  else
  {
    double v39 = [(CollectionImageView *)self->_imageView topAnchor];
    v40 = [(CollectionView *)self topAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v42 = self->_topConstraint;
    self->_topConstraint = v41;

    v43 = [(CollectionImageView *)self->_imageView bottomAnchor];
    v44 = [(CollectionView *)self bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v46 = self->_bottomConstraint;
    self->_bottomConstraint = v45;

    v47 = self->_bottomConstraint;
    v133[0] = self->_topConstraint;
    v133[1] = v47;
    v126 = [(UILayoutGuide *)self->_textContainerLayoutGuide centerYAnchor];
    uint64_t v121 = [(CollectionImageView *)self->_imageView centerYAnchor];
    uint64_t v129 = [v126 constraintEqualToAnchor:v121];
    v133[2] = v129;
    v48 = [(UILabel *)self->_subtitleLabel bottomAnchor];
    v130 = [(UILayoutGuide *)self->_textContainerLayoutGuide bottomAnchor];
    v123 = [v48 constraintEqualToAnchor:v130];
    v133[3] = v123;
    v119 = [(MapsThemeLabel *)self->_newCollectionLabel centerYAnchor];
    v49 = [(UILayoutGuide *)self->_textContainerLayoutGuide centerYAnchor];
    v50 = [v119 constraintEqualToAnchor:v49];
    v133[4] = v50;
    v51 = [(UILayoutGuide *)self->_textContainerLayoutGuide leadingAnchor];
    v52 = [(CollectionImageView *)self->_imageView trailingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:12.0];
    v133[5] = v53;
    v54 = +[NSArray arrayWithObjects:v133 count:6];
    v29 = v132;
    [v132 addObjectsFromArray:v54];

    v55 = (void *)v121;
    v56 = v126;

    v57 = (void *)v129;
    v58 = (_DWORD *)&unk_100F6F000;
  }
  LODWORD(v70) = v58[948];
  [(NSLayoutConstraint *)self->_bottomConstraint setPriority:v70];
  v71 = (NSArray *)[v29 copy];
  v72 = self->_constraints;
  self->_constraints = v71;

  [(CollectionView *)self _updateConstraintConstants];
  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)_updateConstraintConstants
{
  [(CollectionView *)self _imageWidth];
  double v4 = v3;
  [(CollectionView *)self _verticalMargin];
  double v5 = 1.0 - self->_shrinkFactor;
  double v7 = v6 + -11.0;
  [(NSLayoutConstraint *)self->_topConstraint setConstant:v5 * (v6 + -11.0) + 11.0];
  [(NSLayoutConstraint *)self->_bottomConstraint setConstant:-(v5 * v7 + 11.0)];
  [(NSLayoutConstraint *)self->_imageHeight setConstant:(1.0 - self->_shrinkFactor) * (v4 + -48.0) + 48.0];
  double v8 = -50.0;
  if (!self->_showCheckmark) {
    double v8 = -12.0;
  }
  [(NSLayoutConstraint *)self->_textContainerTrailingConstraint setConstant:v8];
  unsigned int v9 = [(CollectionView *)self _shouldWrapText];
  double v10 = 30.0;
  if (v9) {
    double v10 = 20.0;
  }
  badgeHeightConstraint = self->_badgeHeightConstraint;

  [(NSLayoutConstraint *)badgeHeightConstraint setConstant:v10];
}

- (void)collectionImageViewButtonSelected:(id)a3
{
  if (self->_editing)
  {
    id v6 = objc_alloc_init((Class)UIImagePickerController);
    [v6 setDelegate:self];
    [v6 setAllowsEditing:1];
    [v6 setSourceType:0];
    double v4 = [(CollectionView *)self window];
    double v5 = [v4 rootViewController];
    [v5 _maps_topMostPresentViewController:v6 animated:1 completion:0];

    +[GEOAPPortal captureUserAction:2074 target:252 value:0];
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  double v7 = [v8 objectForKeyedSubscript:UIImagePickerControllerEditedImage];
  if (!v7)
  {
    double v7 = [v8 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];
  }
  [(CollectionHandlerInfo *)self->_collectionInfo updateImage:v7];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (id)_textAttachmentSpacer
{
  id v3 = objc_alloc_init((Class)NSTextAttachment);
  [(CollectionView *)self _imageWidth];
  [v3 setBounds:0.0, 0.0, v4, 0.0];

  return v3;
}

- (void)_updateContent
{
  if (self->_textContainerHeightMatchesNewCollectionLabel != [(CollectionView *)self _shouldTextContainerHeightMatchNewCollectionLabel])[(CollectionView *)self _updateConstraints]; {
  collectionInfo = self->_collectionInfo;
  }
  if (collectionInfo && [(CollectionHandlerInfo *)collectionInfo handlerType] != (id)1)
  {
    if (self->_editing && [(CollectionHandlerInfo *)self->_collectionInfo canEditTitle])
    {
      if ([(UITextField *)self->_titleTextField isEditing])
      {
        v11 = [(CollectionHandlerInfo *)self->_collectionInfo subtitle];
        [(UILabel *)self->_subtitleLabel setText:v11];
      }
      else
      {
        v23 = [(UITextField *)self->_titleTextField text];
        id v24 = [v23 length];

        if (v24)
        {
          v25 = +[NSBundle mainBundle];
          v26 = [v25 localizedStringForKey:@"[Collection] Tap to edit title" value:@"localized string not found" table:0];
          [(UILabel *)self->_subtitleLabel setText:v26];
        }
        else
        {
          [(UILabel *)self->_subtitleLabel setText:&stru_101324E70];
        }
      }
      v27 = [(CollectionEditSession *)self->_editSession selectedObjectSet];
      v28 = [v27 allObjects];
      id v29 = [v28 count];

      if (v29)
      {
        id v30 = +[NSBundle mainBundle];
        v31 = [v30 localizedStringForKey:@"[Collections] subtitle" value:@"localized string not found" table:0];
        v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v29);

        [(UILabel *)self->_subtitleLabel setText:v32];
      }
      [(UITextField *)self->_titleTextField setHidden:0];
      [(UILabel *)self->_titleLabel setHidden:1];
      double v33 = [(UITextField *)self->_titleTextField placeholder];
      [(UILabel *)self->_titleLabel setText:v33];
    }
    else
    {
      if ([(CollectionView *)self _shouldWrapText])
      {
        id v12 = objc_alloc_init((Class)NSMutableAttributedString);
        v13 = [(CollectionView *)self _textAttachmentSpacer];
        v14 = +[NSAttributedString attributedStringWithAttachment:v13];
        [v12 appendAttributedString:v14];

        id v15 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
        [v12 appendAttributedString:v15];

        id v16 = objc_alloc((Class)NSAttributedString);
        uint64_t v17 = [(CollectionHandlerInfo *)self->_collectionInfo title];
        v18 = (void *)v17;
        if (v17) {
          CFStringRef v19 = (const __CFString *)v17;
        }
        else {
          CFStringRef v19 = &stru_101324E70;
        }
        id v20 = [v16 initWithString:v19];
        [v12 appendAttributedString:v20];

        [(UILabel *)self->_titleLabel setAttributedText:v12];
      }
      else
      {
        id v12 = [(CollectionHandlerInfo *)self->_collectionInfo title];
        [(UILabel *)self->_titleLabel setText:v12];
      }

      v21 = [(CollectionHandlerInfo *)self->_collectionInfo title];
      [(UITextField *)self->_titleTextField setText:v21];

      id v22 = [(CollectionHandlerInfo *)self->_collectionInfo subtitle];
      [(UILabel *)self->_subtitleLabel setText:v22];

      [(UITextField *)self->_titleTextField setHidden:1];
      [(UILabel *)self->_titleLabel setHidden:0];
    }
    [(MapsThemeLabel *)self->_newCollectionLabel setText:0];
    [(UILabel *)self->_subtitleLabel setHidden:0];
    [(MapsThemeLabel *)self->_newCollectionLabel setHidden:1];
  }
  else
  {
    [(UITextField *)self->_titleTextField setText:0];
    [(UILabel *)self->_titleLabel setText:0];
    [(UILabel *)self->_subtitleLabel setText:0];
    double v4 = +[NSBundle mainBundle];
    double v5 = [v4 localizedStringForKey:@"[Guide] New guide cell" value:@"localized string not found" table:0];

    if ([(CollectionView *)self _shouldWrapText])
    {
      id v6 = objc_alloc_init((Class)NSMutableAttributedString);
      double v7 = [(CollectionView *)self _textAttachmentSpacer];
      id v8 = +[NSAttributedString attributedStringWithAttachment:v7];
      [v6 appendAttributedString:v8];

      id v9 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
      [v6 appendAttributedString:v9];

      id v10 = [objc_alloc((Class)NSAttributedString) initWithString:v5];
      [v6 appendAttributedString:v10];

      [(MapsThemeLabel *)self->_newCollectionLabel setAttributedText:v6];
    }
    else
    {
      [(MapsThemeLabel *)self->_newCollectionLabel setText:v5];
    }
    [(UITextField *)self->_titleTextField setHidden:1];
    [(UILabel *)self->_titleLabel setHidden:1];
    [(UILabel *)self->_subtitleLabel setHidden:1];
    [(MapsThemeLabel *)self->_newCollectionLabel setHidden:0];
  }
  v34 = [(CollectionHandlerInfo *)self->_collectionInfo badgeImage];
  [(UIImageView *)self->_badgeImageView setImage:v34];

  v35 = [(CollectionHandlerInfo *)self->_collectionInfo badgeImage];
  [(UIImageView *)self->_badgeImageView setHidden:v35 == 0];

  [(CollectionView *)self _updateConstraintConstants];
}

- (int64_t)_titleNumberOfLines
{
  if ([(CollectionView *)self _shouldWrapText]) {
    return 0;
  }
  [(CollectionView *)self shrinkFactor];
  if (v4 == 0.0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_subtitleNumberOfLines
{
  return [(CollectionView *)self _shouldWrapText] ^ 1;
}

- (id)_titleFont
{
  unint64_t collectionViewSize = self->_collectionViewSize;
  if (!collectionViewSize)
  {
    id v3 = [(CollectionView *)self _effectiveTraitCollection];
    uint64_t v4 = +[UIFont system17SemiboldCompatibleWithTraitCollection:v3];
    goto LABEL_5;
  }
  if (collectionViewSize == 1)
  {
    id v3 = [(CollectionView *)self _effectiveTraitCollection];
    uint64_t v4 = +[UIFont system22SemiboldCompatibleWithTraitCollection:v3];
LABEL_5:
    double v5 = (void *)v4;

    goto LABEL_7;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

- (id)_subtitleFont
{
  v2 = [(CollectionView *)self _effectiveTraitCollection];
  id v3 = +[UIFont system15CompatibleWithTraitCollection:v2];

  return v3;
}

- (void)_updateFonts
{
  id v4 = [(CollectionView *)self _titleFont];
  [(UITextField *)self->_titleTextField setFont:v4];
  [(UILabel *)self->_titleLabel setFont:v4];
  id v3 = [(CollectionView *)self _subtitleFont];
  [(UILabel *)self->_subtitleLabel setFont:v3];

  [(MapsThemeLabel *)self->_newCollectionLabel setFont:v4];
}

- (void)_updateNumberOfLines
{
  [(UILabel *)self->_titleLabel setNumberOfLines:[(CollectionView *)self _titleNumberOfLines]];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:[(CollectionView *)self _subtitleNumberOfLines]];
  int64_t v3 = [(CollectionView *)self _titleNumberOfLines];
  newCollectionLabel = self->_newCollectionLabel;

  [(MapsThemeLabel *)newCollectionLabel setNumberOfLines:v3];
}

- (BOOL)_shouldWrapText
{
  if (!self->_allowAccessibilityTextWrapping) {
    return 0;
  }
  v2 = [(CollectionView *)self _effectiveContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (BOOL)_shouldTextContainerHeightMatchNewCollectionLabel
{
  BOOL v3 = [(CollectionView *)self _shouldWrapText];
  if (v3) {
    LOBYTE(v3) = [(CollectionHandlerInfo *)self->_collectionInfo handlerType] == (id)1;
  }
  return v3;
}

- (id)_effectiveContentSizeCategory
{
  BOOL v3 = [(CollectionView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  double v5 = [(CollectionView *)self maxContentSizeCategory];
  id v6 = sub_1000E9204(v4, 0, v5);

  return v6;
}

- (void)_effectiveContentSizeCategoryDidChange:(id)a3
{
  categordouble y = (NSString *)a3;
  id v4 = [(CollectionView *)self _effectiveContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);
  int v6 = UIContentSizeCategoryIsAccessibilityCategory(category);

  if (IsAccessibilityCategory != v6)
  {
    [(CollectionView *)self _updateNumberOfLines];
    [(CollectionView *)self _updateConstraints];
  }
  [(CollectionView *)self _updateFonts];
  [(CollectionView *)self _updateConstraintConstants];
  double v7 = [(CollectionView *)self _effectiveContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v7))
  {
  }
  else
  {
    BOOL v8 = UIContentSizeCategoryIsAccessibilityCategory(category);

    if (!v8) {
      goto LABEL_7;
    }
  }
  [(CollectionView *)self _updateContent];
LABEL_7:
}

- (id)_effectiveTraitCollection
{
  BOOL v3 = [(CollectionView *)self traitCollection];
  v9[0] = v3;
  id v4 = [(CollectionView *)self _effectiveContentSizeCategory];
  double v5 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v4];
  v9[1] = v5;
  int v6 = +[NSArray arrayWithObjects:v9 count:2];
  double v7 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v6];

  return v7;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionViewTextFieldDidBecomeSelected:self];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 text];
  v11 = [v10 stringByReplacingCharactersInRange:location length:length withString:v9];

  unint64_t UInteger = GEOConfigGetUInteger();
  id v13 = [v11 length];
  if ((unint64_t)v13 > UInteger)
  {
    uint64_t v14 = [v11 substringWithRange:0, UInteger];

    [v8 setText:v14];
    v11 = (void *)v14;
  }

  return (unint64_t)v13 <= UInteger;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  double v5 = [v4 text];
  id v6 = [v5 length];

  if (v6)
  {
    collectionInfo = self->_collectionInfo;
    id v8 = [v4 text];
    [(CollectionHandlerInfo *)collectionInfo updateTitle:v8];

    [(CollectionView *)self endEditing:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionViewTextFieldDidResign:self];
  }
  return v6 != 0;
}

- (CollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (unint64_t)collectionViewSize
{
  return self->_collectionViewSize;
}

- (BOOL)showsCheckmark
{
  return self->_showCheckmark;
}

- (CollectionEditSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
}

- (double)shrinkFactor
{
  return self->_shrinkFactor;
}

- (NSString)maxContentSizeCategory
{
  return self->_maxContentSizeCategory;
}

- (BOOL)allowAccessibilityTextWrapping
{
  return self->_allowAccessibilityTextWrapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleObserver, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_textContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_badgeHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_textContainerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_imageCheckmarkView, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_newCollectionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_titleTextField, 0);
}

@end