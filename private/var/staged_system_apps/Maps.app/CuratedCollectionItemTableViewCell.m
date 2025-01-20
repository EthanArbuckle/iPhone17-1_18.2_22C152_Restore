@interface CuratedCollectionItemTableViewCell
+ (double)estimatedCellHeight;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CuratedCollectionItemAppClipView)appClipView;
- (CuratedCollectionItemCellModel)model;
- (CuratedCollectionItemImageWithAttributionView)itemImageView;
- (CuratedCollectionItemPOIIconImageView)poiIconImageView;
- (CuratedCollectionItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CuratedCollectionItemTableViewCellDelegate)delegate;
- (CuratedCollectionPlaceSummaryView)placeSummaryView;
- (UIButton)addToLibraryOrUserCollectionsButton;
- (UILayoutGuide)cellContentLayoutGuide;
- (UIStackView)placeSummaryContainerStackView;
- (UIStackView)stackView;
- (UITapGestureRecognizer)appClipTapGestureRecognizer;
- (UITextView)itemDescriptionTextView;
- (UITextView)reviewTextView;
- (id)menuForAddButton;
- (void)_createSubviews;
- (void)_loadImageIfNeeded;
- (void)_loadPOIImage;
- (void)_setupConstraints;
- (void)_tappedAddOrRemoveFromLibraryButton:(id)a3;
- (void)_tappedAddToUserCollection:(id)a3;
- (void)_tappedAddToUserCollectionButton:(id)a3;
- (void)_tappedAppClip;
- (void)addToUserCollection:(id)a3;
- (void)configureWithModel:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAddToLibraryOrUserCollectionsButton:(id)a3;
- (void)setAppClipTapGestureRecognizer:(id)a3;
- (void)setAppClipView:(id)a3;
- (void)setCellContentLayoutGuide:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemDescriptionTextView:(id)a3;
- (void)setItemImageView:(id)a3;
- (void)setModel:(id)a3;
- (void)setPlaceSummaryContainerStackView:(id)a3;
- (void)setPlaceSummaryView:(id)a3;
- (void)setPoiIconImageView:(id)a3;
- (void)setReviewTextView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setupReviewLabel;
@end

@implementation CuratedCollectionItemTableViewCell

+ (double)estimatedCellHeight
{
  return 600.0;
}

- (CuratedCollectionItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionItemTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CuratedCollectionItemTableViewCell *)v4 setSelectionStyle:0];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(CuratedCollectionItemTableViewCell *)v5 setAccessibilityIdentifier:v7];

    [(CuratedCollectionItemTableViewCell *)v5 _createSubviews];
    [(CuratedCollectionItemTableViewCell *)v5 _setupConstraints];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionItemTableViewCell;
  [(CuratedCollectionItemTableViewCell *)&v3 layoutSubviews];
  [(CuratedCollectionItemTableViewCell *)self _loadImageIfNeeded];
  [(CuratedCollectionItemTableViewCell *)self _loadPOIImage];
}

- (void)prepareForReuse
{
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionItemTableViewCell;
  [(CuratedCollectionItemTableViewCell *)&v11 prepareForReuse];
  self->_needsImageLoad = 0;
  objc_super v3 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v3 setImage:0];

  v4 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v4 setAttributionString:0];

  v5 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v5 setHidden:1];

  v6 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v6 setAttributedText:0];

  v7 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v7 setHidden:1];

  v8 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v8 setText:0];

  objc_super v9 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v9 setHidden:1];

  v10 = [(CuratedCollectionItemTableViewCell *)self poiIconImageView];
  [v10 setImage:0];
}

- (void)configureWithModel:(id)a3
{
  id v38 = a3;
  [(CuratedCollectionItemTableViewCell *)self setModel:v38];
  v4 = [(CuratedCollectionItemTableViewCell *)self placeSummaryView];
  v5 = [v38 placeSummaryModel];
  [v4 configureWithModel:v5];

  v6 = [v38 itemDescription];
  id v7 = [v6 length];

  if (v7)
  {
    v8 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
    [v8 setHidden:0];

    objc_super v9 = [v38 itemDescription];
    v10 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
    [v10 setAttributedText:v9];

    objc_super v11 = +[UIColor labelColor];
    v12 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
    [v12 setTextColor:v11];
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled]) {
    unsigned int v13 = [v38 isItemInLibrary];
  }
  else {
    unsigned int v13 = [v38 isItemInUserCollection];
  }
  unsigned int v14 = v13;
  uint64_t v15 = sub_1000BBB44(self);
  v16 = @"plus";
  if (v14) {
    v16 = @"checkmark";
  }
  CFStringRef v17 = @"checkmark.circle";
  if (!v14) {
    CFStringRef v17 = @"plus.circle";
  }
  if (v15 == 5) {
    v16 = (__CFString *)v17;
  }
  v18 = v16;
  v19 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:17.0];
  v20 = +[UIImage systemImageNamed:v18 withConfiguration:v19];
  v21 = [v20 imageWithRenderingMode:2];

  v22 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  [v22 setImage:v21 forState:0];

  v23 = [v38 fullReviewString];
  id v24 = [v23 length];

  if (v24)
  {
    v25 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
    [v25 setHidden:0];

    v26 = [v38 fullReviewString];
    v27 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
    [v27 setAttributedText:v26];
  }
  if ([v38 hasImage])
  {
    v28 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
    [v28 setHidden:0];

    v29 = [v38 imageAttribution];
    v30 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
    [v30 setAttributionString:v29];

    self->_needsImageLoad = 1;
    [(CuratedCollectionItemTableViewCell *)self _loadImageIfNeeded];
  }
  if (sub_1000BBB44(self) == 5
    && !+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v31 = [(CuratedCollectionItemTableViewCell *)self menuForAddButton];
    v32 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    [v32 setMenu:v31];
  }
  [(CuratedCollectionItemTableViewCell *)self _loadPOIImage];
  v33 = [v38 appClip];

  if (v33)
  {
    v34 = [CuratedCollectionItemAppStoreAppClipViewModel alloc];
    v35 = [v38 appClip];
    v36 = [(CuratedCollectionItemAppStoreAppClipViewModel *)v34 initWithAppStoreAppClip:v35];

    [(CuratedCollectionItemAppClipView *)self->_appClipView setViewModel:v36];
    [(CuratedCollectionItemAppClipView *)self->_appClipView setHidden:0];
  }
  else
  {
    [(CuratedCollectionItemAppClipView *)self->_appClipView setHidden:1];
  }
  v37 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v37 setNeedsLayout];

  [(CuratedCollectionItemTableViewCell *)self setNeedsLayout];
}

- (void)_loadImageIfNeeded
{
  objc_super v3 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double height = CGSizeZero.height;

  if (v5 == CGSizeZero.width && v7 == height)
  {
    [(CuratedCollectionItemTableViewCell *)self setNeedsLayout];
  }
  else if (self->_needsImageLoad)
  {
    self->_needsImageLoad = 0;
    v10 = [(CuratedCollectionItemTableViewCell *)self model];
    objc_initWeak(&location, self);
    objc_super v11 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100B2B4BC;
    v17[3] = &unk_1012F2160;
    objc_copyWeak(&v19, &location);
    id v16 = v10;
    id v18 = v16;
    [v16 loadImageForSize:v17 completion:v13, v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)_loadPOIImage
{
  objc_super v3 = [(CuratedCollectionItemTableViewCell *)self model];
  objc_initWeak(&location, self);
  double v4 = +[MapsUIImageCache sharedCache];
  double v5 = [(CuratedCollectionItemTableViewCell *)self model];
  double v6 = [v5 collectionItem];
  double v7 = [v6 mapItem];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B2B7E0;
  v9[3] = &unk_101300178;
  objc_copyWeak(&v11, &location);
  id v8 = v3;
  id v10 = v8;
  [v4 getImageForMapItem:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_createSubviews
{
  objc_super v3 = +[UIColor clearColor];
  [(CuratedCollectionItemTableViewCell *)self setBackgroundColor:v3];

  id v4 = objc_alloc((Class)UIStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionItemTableViewCell *)self setStackView:v8];

  objc_super v9 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v10 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v10 setAxis:1];

  id v11 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v11 setDistribution:3];

  double v12 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v12 setAlignment:0];

  double v13 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v13 setSpacing:16.0];

  double v14 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v14 setAccessibilityIdentifier:@"StackView"];

  double v15 = [(CuratedCollectionItemTableViewCell *)self contentView];
  id v16 = [(CuratedCollectionItemTableViewCell *)self stackView];
  [v15 addSubview:v16];

  CFStringRef v17 = -[CuratedCollectionItemImageWithAttributionView initWithFrame:]([CuratedCollectionItemImageWithAttributionView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(CuratedCollectionItemTableViewCell *)self setItemImageView:v17];

  id v18 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v19 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v19 setClipsToBounds:1];

  v20 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v20 _setContinuousCornerRadius:8.0];

  v21 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v21 setHidden:1];

  v22 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v22 setAccessibilityIdentifier:@"ItemImageView"];

  v23 = [(CuratedCollectionItemTableViewCell *)self stackView];
  id v24 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  [v23 addArrangedSubview:v24];

  v25 = objc_alloc_init(CuratedCollectionItemPOIIconImageView);
  [(CuratedCollectionItemTableViewCell *)self setPoiIconImageView:v25];

  v26 = [(CuratedCollectionItemTableViewCell *)self poiIconImageView];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(CuratedCollectionItemTableViewCell *)self poiIconImageView];
  [v27 setAccessibilityIdentifier:@"POIIconImageView"];

  v28 = [(CuratedCollectionItemTableViewCell *)self stackView];
  v29 = [(CuratedCollectionItemTableViewCell *)self poiIconImageView];
  [v28 addArrangedSubview:v29];

  id v30 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionItemTableViewCell *)self setPlaceSummaryContainerStackView:v30];

  v31 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v32 setAxis:0];

  v33 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v33 setDistribution:3];

  v34 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v34 setAlignment:1];

  v35 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v35 setSpacing:8.0];

  v36 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v36 setAccessibilityIdentifier:@"PlaceSummaryContainerStackView"];

  v37 = [(CuratedCollectionItemTableViewCell *)self stackView];
  id v38 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  [v37 addArrangedSubview:v38];

  v39 = -[CuratedCollectionPlaceSummaryView initWithFrame:]([CuratedCollectionPlaceSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(CuratedCollectionItemTableViewCell *)self setPlaceSummaryView:v39];

  v40 = [(CuratedCollectionItemTableViewCell *)self placeSummaryView];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  v42 = [(CuratedCollectionItemTableViewCell *)self placeSummaryView];
  [v41 addArrangedSubview:v42];

  v43 = +[UIButton buttonWithType:0];
  [(CuratedCollectionItemTableViewCell *)self setAddToLibraryOrUserCollectionsButton:v43];

  if (sub_1000BBB44(self) == 5)
  {
    v44 = +[UIImage systemImageNamed:@"plus.circle"];
    id v94 = [v44 imageWithRenderingMode:2];

    v45 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    v46 = +[UIFont system20];
    v47 = +[UIImageSymbolConfiguration configurationWithFont:v46];
    [v45 setPreferredSymbolConfiguration:v47 forImageInState:0];

    v48 = +[UIColor _maps_keyColor];
    v49 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    [v49 setTintColor:v48];

    LODWORD(v49) = +[LibraryUIUtilities isMyPlacesEnabled];
    v50 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    v51 = v50;
    if (v49)
    {
      v52 = "_tappedAddOrRemoveFromLibraryButton:";
    }
    else
    {
      [v50 setContextMenuInteractionEnabled:1];

      v60 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
      [v60 setShowsMenuAsPrimaryAction:1];

      v50 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
      v51 = v50;
      v52 = "_tappedAddToUserCollectionButton:";
    }
    [v50 addTarget:self action:v52 forControlEvents:64];
  }
  else
  {
    v53 = +[UIImage systemImageNamed:@"plus"];
    id v94 = [v53 imageWithRenderingMode:2];

    LODWORD(v53) = +[LibraryUIUtilities isMyPlacesEnabled];
    v54 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    v55 = v54;
    v56 = &selRef__tappedAddOrRemoveFromLibraryButton_;
    if (!v53) {
      v56 = &selRef__tappedAddToUserCollectionButton_;
    }
    [v54 addTarget:self action:*v56 forControlEvents:64];

    v57 = +[UIColor tertiarySystemFillColor];
    v58 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    [v58 setBackgroundColor:v57];

    v51 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
    v59 = [v51 layer];
    [v59 setCornerRadius:18.5];
  }
  v61 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  [v61 setImage:v94 forState:0];

  v62 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  [v62 setTranslatesAutoresizingMaskIntoConstraints:0];

  v63 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  [v63 setAccessibilityIdentifier:@"AddToUserCollectionsButton"];

  v64 = [(CuratedCollectionItemTableViewCell *)self placeSummaryContainerStackView];
  v65 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  [v64 addArrangedSubview:v65];

  id v66 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionItemTableViewCell *)self setItemDescriptionTextView:v66];

  v67 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v67 setTranslatesAutoresizingMaskIntoConstraints:0];

  v68 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v68 setDelegate:self];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v72 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v72 setTextContainerInset:UIEdgeInsetsZero.top, left, bottom, right];

  v73 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  v74 = [v73 textContainer];
  [v74 setLineFragmentPadding:0.0];

  v75 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v75 setUserInteractionEnabled:1];

  v76 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v76 setSelectable:1];

  v77 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v77 setEditable:0];

  v78 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v78 setScrollEnabled:0];

  v79 = +[UIColor clearColor];
  v80 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v80 setBackgroundColor:v79];

  v81 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v81 setHidden:1];

  v82 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v82 setAccessibilityIdentifier:@"ItemDescriptionTextView"];

  v83 = [(CuratedCollectionItemTableViewCell *)self stackView];
  v84 = [(CuratedCollectionItemTableViewCell *)self itemDescriptionTextView];
  [v83 addArrangedSubview:v84];

  [(CuratedCollectionItemTableViewCell *)self setupReviewLabel];
  v85 = -[CuratedCollectionItemAppClipView initWithFrame:]([CuratedCollectionItemAppClipView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(CuratedCollectionItemTableViewCell *)self setAppClipView:v85];

  v86 = [(CuratedCollectionItemTableViewCell *)self appClipView];
  [v86 setTranslatesAutoresizingMaskIntoConstraints:0];

  v87 = [(CuratedCollectionItemTableViewCell *)self appClipView];
  [v87 setUserInteractionEnabled:1];

  v88 = [(CuratedCollectionItemTableViewCell *)self appClipView];
  [v88 setHidden:1];

  v89 = [(CuratedCollectionItemTableViewCell *)self stackView];
  v90 = [(CuratedCollectionItemTableViewCell *)self appClipView];
  [v89 addArrangedSubview:v90];

  id v91 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tappedAppClip"];
  [(CuratedCollectionItemTableViewCell *)self setAppClipTapGestureRecognizer:v91];

  v92 = [(CuratedCollectionItemTableViewCell *)self appClipView];
  v93 = [(CuratedCollectionItemTableViewCell *)self appClipTapGestureRecognizer];
  [v92 addGestureRecognizer:v93];
}

- (void)_setupConstraints
{
  v52 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v51 = [v52 topAnchor];
  v50 = [(CuratedCollectionItemTableViewCell *)self topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v53[0] = v49;
  v48 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v47 = [v48 leadingAnchor];
  v46 = [(CuratedCollectionItemTableViewCell *)self leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v53[1] = v45;
  v44 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v43 = [v44 trailingAnchor];
  v42 = [(CuratedCollectionItemTableViewCell *)self trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v53[2] = v41;
  v40 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v39 = [v40 bottomAnchor];
  id v38 = [(CuratedCollectionItemTableViewCell *)self bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v53[3] = v37;
  v36 = [(CuratedCollectionItemTableViewCell *)self stackView];
  v34 = [v36 topAnchor];
  v35 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:16.0];
  v53[4] = v32;
  v31 = [(CuratedCollectionItemTableViewCell *)self stackView];
  v29 = [v31 leadingAnchor];
  id v30 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v28 = [v30 leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:16.0];
  v53[5] = v27;
  v26 = [(CuratedCollectionItemTableViewCell *)self stackView];
  id v24 = [v26 trailingAnchor];
  v25 = [(CuratedCollectionItemTableViewCell *)self contentView];
  v23 = [v25 trailingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:-16.0];
  v53[6] = v22;
  v21 = [(CuratedCollectionItemTableViewCell *)self stackView];
  id v19 = [v21 bottomAnchor];
  v20 = [(CuratedCollectionItemTableViewCell *)self contentView];
  id v18 = [v20 bottomAnchor];
  CFStringRef v17 = [v19 constraintEqualToAnchor:v18 constant:-16.0];
  v53[7] = v17;
  id v16 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  double v15 = [v16 widthAnchor];
  double v14 = [v15 constraintEqualToConstant:37.0];
  v53[8] = v14;
  double v13 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  objc_super v3 = [v13 heightAnchor];
  id v4 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  double v5 = [v4 widthAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5];
  v53[9] = v6;
  double v7 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  id v8 = [v7 heightAnchor];
  objc_super v9 = [(CuratedCollectionItemTableViewCell *)self itemImageView];
  id v10 = [v9 widthAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10 multiplier:0.670000017];
  v53[10] = v11;
  double v12 = +[NSArray arrayWithObjects:v53 count:11];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)addToUserCollection:(id)a3
{
  id v8 = [(CuratedCollectionItemTableViewCell *)self delegate];
  id v4 = [(CuratedCollectionItemTableViewCell *)self model];
  double v5 = [v4 collectionItem];
  double v6 = [v5 mapItem];
  double v7 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  [v8 didSelectAddToUserCollection:0 forMapItem:v6 sourceView:v7 onSaveCompletion:0];
}

- (void)_tappedAddToUserCollectionButton:(id)a3
{
  id v4 = a3;
  id v8 = [(CuratedCollectionItemTableViewCell *)self delegate];
  double v5 = [(CuratedCollectionItemTableViewCell *)self model];
  double v6 = [v5 collectionItem];
  double v7 = [v6 mapItem];
  [v8 didSelectAddToUserCollection:0 forMapItem:v7 sourceView:v4 onSaveCompletion:0];
}

- (void)_tappedAddOrRemoveFromLibraryButton:(id)a3
{
  id v4 = [(CuratedCollectionItemTableViewCell *)self model];

  if (v4)
  {
    id v8 = [(CuratedCollectionItemTableViewCell *)self delegate];
    double v5 = [(CuratedCollectionItemTableViewCell *)self model];
    uint64_t v6 = [v5 isItemInLibrary] ^ 1;
    double v7 = [(CuratedCollectionItemTableViewCell *)self model];
    [v8 didSelectAddOrRemoveFromLibrary:v6 forModel:v7];
  }
}

- (void)_tappedAddToUserCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(CuratedCollectionItemTableViewCell *)self delegate];
  uint64_t v6 = [(CuratedCollectionItemTableViewCell *)self model];
  double v7 = [v6 collectionItem];
  id v8 = [v7 mapItem];
  objc_super v9 = [(CuratedCollectionItemTableViewCell *)self addToLibraryOrUserCollectionsButton];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B2CBE0;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  [v5 didSelectAddToUserCollection:v4 forMapItem:v8 sourceView:v9 onSaveCompletion:v10];
}

- (id)menuForAddButton
{
  objc_super v3 = [(CuratedCollectionItemTableViewCell *)self model];
  id v4 = [v3 collectionItem];
  id v19 = [v4 mapItem];

  double v5 = +[CollectionManager sharedManager];
  uint64_t v6 = [v5 collectionsForAddingMapItems];

  double v7 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v12 = [v11 title];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100B2CFD4;
        v20[3] = &unk_1012E6368;
        objc_copyWeak(&v21, &location);
        v20[4] = v11;
        double v13 = +[UIAction actionWithTitle:v12 image:0 identifier:0 handler:v20];

        if ([v11 containsItem:v19]) {
          [v13 setAttributes:1];
        }
        [v7 addObject:v13];

        objc_destroyWeak(&v21);
      }
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v7 count])
  {
    double v14 = +[NSBundle mainBundle];
    double v15 = [v14 localizedStringForKey:@"[Curated Guide View] Save to Guides" value:@"localized string not found" table:0];
    id v16 = +[UIMenu menuWithTitle:v15 children:v7];
  }
  else
  {
    id v16 = 0;
  }
  objc_destroyWeak(&location);

  return v16;
}

- (void)_tappedAppClip
{
  id v4 = [(CuratedCollectionItemTableViewCell *)self delegate];
  objc_super v3 = [(CuratedCollectionItemCellModel *)self->_model appClip];
  [v4 openAppClip:v3];
}

- (void)setupReviewLabel
{
  id v3 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(CuratedCollectionItemTableViewCell *)self setReviewTextView:v3];

  NSAttributedStringKey v28 = NSForegroundColorAttributeName;
  id v4 = [(CuratedCollectionItemTableViewCell *)self mk_theme];
  double v5 = [v4 tintColor];
  v29 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  double v7 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v7 setLinkTextAttributes:v6];

  id v8 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v8 setTextAlignment:4];

  uint64_t v9 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v9 setDelegate:self];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  double v13 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v13 setTextContainerInset:UIEdgeInsetsZero.top, left, bottom, right];

  double v14 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  double v15 = [v14 textContainer];
  [v15 setLineFragmentPadding:0.0];

  id v16 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  CFStringRef v17 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v17 setDataDetectorTypes:2];

  id v18 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v18 setUserInteractionEnabled:1];

  id v19 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v19 setSelectable:1];

  v20 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v20 setEditable:0];

  id v21 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v21 setScrollEnabled:0];

  long long v22 = +[UIColor clearColor];
  long long v23 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v23 setBackgroundColor:v22];

  long long v24 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v24 setHidden:1];

  long long v25 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v25 setAccessibilityIdentifier:@"ReviewTextView"];

  v26 = [(CuratedCollectionItemTableViewCell *)self stackView];
  v27 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];
  [v26 addArrangedSubview:v27];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8 = a3;
  id v9 = [(CuratedCollectionItemTableViewCell *)self reviewTextView];

  if (!a6 && v9 == v8)
  {
    id v10 = [(CuratedCollectionItemTableViewCell *)self delegate];
    id v11 = [(CuratedCollectionItemTableViewCell *)self model];
    double v12 = [v11 collectionItem];
    [v10 willPunchOutToPublisherWebpageForPlaceCollectionItem:v12];
  }
  return 1;
}

- (CuratedCollectionItemTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CuratedCollectionItemTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CuratedCollectionItemCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UILayoutGuide)cellContentLayoutGuide
{
  return self->_cellContentLayoutGuide;
}

- (void)setCellContentLayoutGuide:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (CuratedCollectionItemImageWithAttributionView)itemImageView
{
  return self->_itemImageView;
}

- (void)setItemImageView:(id)a3
{
}

- (CuratedCollectionItemPOIIconImageView)poiIconImageView
{
  return self->_poiIconImageView;
}

- (void)setPoiIconImageView:(id)a3
{
}

- (UIStackView)placeSummaryContainerStackView
{
  return self->_placeSummaryContainerStackView;
}

- (void)setPlaceSummaryContainerStackView:(id)a3
{
}

- (CuratedCollectionPlaceSummaryView)placeSummaryView
{
  return self->_placeSummaryView;
}

- (void)setPlaceSummaryView:(id)a3
{
}

- (UIButton)addToLibraryOrUserCollectionsButton
{
  return self->_addToLibraryOrUserCollectionsButton;
}

- (void)setAddToLibraryOrUserCollectionsButton:(id)a3
{
}

- (UITextView)itemDescriptionTextView
{
  return self->_itemDescriptionTextView;
}

- (void)setItemDescriptionTextView:(id)a3
{
}

- (UITextView)reviewTextView
{
  return self->_reviewTextView;
}

- (void)setReviewTextView:(id)a3
{
}

- (CuratedCollectionItemAppClipView)appClipView
{
  return self->_appClipView;
}

- (void)setAppClipView:(id)a3
{
}

- (UITapGestureRecognizer)appClipTapGestureRecognizer
{
  return self->_appClipTapGestureRecognizer;
}

- (void)setAppClipTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_appClipView, 0);
  objc_storeStrong((id *)&self->_reviewTextView, 0);
  objc_storeStrong((id *)&self->_itemDescriptionTextView, 0);
  objc_storeStrong((id *)&self->_addToLibraryOrUserCollectionsButton, 0);
  objc_storeStrong((id *)&self->_placeSummaryView, 0);
  objc_storeStrong((id *)&self->_placeSummaryContainerStackView, 0);
  objc_storeStrong((id *)&self->_poiIconImageView, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_cellContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end