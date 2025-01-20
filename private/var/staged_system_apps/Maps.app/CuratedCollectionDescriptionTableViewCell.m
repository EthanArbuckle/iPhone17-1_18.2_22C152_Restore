@interface CuratedCollectionDescriptionTableViewCell
+ (double)estimatedCellHeight;
- (BOOL)alwaysUseLightForegroundColors;
- (BOOL)expanded;
- (CuratedCollectionDescriptionCellModel)model;
- (CuratedCollectionDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CuratedCollectionDescriptionTableViewCellDelegate)delegate;
- (MUExpandingLabel)descriptionLabel;
- (UIImageView)authorImageView;
- (UILabel)authorLabel;
- (UILabel)metadataLabel;
- (UILayoutGuide)contentLayoutGuide;
- (UIStackView)stackView;
- (UITapGestureRecognizer)publisherTapGestureRecognizer;
- (void)_createSubviews;
- (void)_descriptionLabelDidExpand;
- (void)_publisherLogoTapped;
- (void)_setupConstraints;
- (void)_updateColorsAnimated:(BOOL)a3;
- (void)_updateFonts;
- (void)configureWithModel:(id)a3;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAlwaysUseLightForegroundColors:(BOOL)a3;
- (void)setAlwaysUseLightForegroundColors:(BOOL)a3 animated:(BOOL)a4;
- (void)setAuthorImageView:(id)a3;
- (void)setAuthorLabel:(id)a3;
- (void)setContentLayoutGuide:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setMetadataLabel:(id)a3;
- (void)setModel:(id)a3;
- (void)setPublisherTapGestureRecognizer:(id)a3;
- (void)setStackView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CuratedCollectionDescriptionTableViewCell

+ (double)estimatedCellHeight
{
  return 200.0;
}

- (CuratedCollectionDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionDescriptionTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CuratedCollectionDescriptionTableViewCell *)v4 setSelectionStyle:0];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(CuratedCollectionDescriptionTableViewCell *)v5 setAccessibilityIdentifier:v7];

    [(CuratedCollectionDescriptionTableViewCell *)v5 _createSubviews];
    [(CuratedCollectionDescriptionTableViewCell *)v5 _setupConstraints];
  }
  return v5;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CuratedCollectionDescriptionTableViewCell *)self delegate];
  if (v8)
  {
    objc_super v9 = [v6 anyObject];
    v10 = [v9 key];
  }
  else
  {
    v10 = 0;
  }

  if ([v10 keyCode] != (id)40) {
    goto LABEL_7;
  }
  if (([v10 modifierFlags] & 0x100000) != 0)
  {
    v11 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
    [v11 setExpanded:[self expanded] ^ 1];

    if ([v10 modifierFlags]) {
      goto LABEL_10;
    }
LABEL_9:
    [(CuratedCollectionDescriptionTableViewCell *)self _publisherLogoTapped];
    goto LABEL_10;
  }
  if (![v10 modifierFlags]) {
    goto LABEL_9;
  }
LABEL_7:
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionDescriptionTableViewCell;
  [(CuratedCollectionDescriptionTableViewCell *)&v12 pressesEnded:v6 withEvent:v7];
LABEL_10:
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionDescriptionTableViewCell;
  id v4 = a3;
  [(MapsThemeTableViewCell *)&v9 traitCollectionDidChange:v4];
  v5 = [(CuratedCollectionDescriptionTableViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(CuratedCollectionDescriptionTableViewCell *)self _updateFonts];
  }
}

- (void)_createSubviews
{
  v3 = +[UIColor clearColor];
  [(CuratedCollectionDescriptionTableViewCell *)self setBackgroundColor:v3];

  id v4 = objc_alloc_init((Class)UILayoutGuide);
  [(CuratedCollectionDescriptionTableViewCell *)self setContentLayoutGuide:v4];

  v5 = [(CuratedCollectionDescriptionTableViewCell *)self contentView];
  id v6 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  [v5 addLayoutGuide:v6];

  id v7 = objc_alloc((Class)UIStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionDescriptionTableViewCell *)self setStackView:v11];

  objc_super v12 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v13 setAxis:1];

  v14 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v14 setDistribution:3];

  v15 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v15 setAlignment:0];

  if (sub_1000BBB44(self) == 5) {
    double v16 = 12.0;
  }
  else {
    double v16 = 16.0;
  }
  v17 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v17 setSpacing:v16];

  v18 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v18 setAccessibilityIdentifier:@"StackView"];

  v19 = [(CuratedCollectionDescriptionTableViewCell *)self contentView];
  v20 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v19 addSubview:v20];

  id v21 = [objc_alloc((Class)MUExpandingLabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionDescriptionTableViewCell *)self setDescriptionLabel:v21];

  v22 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v23 setNumberOfLinesWhenCollapsed:3];

  v24 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v24 setEditable:0];

  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"[Curated Collections] Show More" value:@"localized string not found" table:0];
  v27 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v27 setShowMoreText:v26];

  v28 = +[NSBundle mainBundle];
  v29 = [v28 localizedStringForKey:@"[Curated Collections] Show Less" value:@"localized string not found" table:0];
  v30 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v30 setShowLessText:v29];

  v31 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v31 setAllowLessText:1];

  objc_initWeak(&location, self);
  objc_copyWeak(&v60, &location);
  v32 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v32 setLabelResizedBlock:&v59];

  v33 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v33 setAccessibilityIdentifier:@"DescriptionLabel"];

  v34 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  v35 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v34 addArrangedSubview:v35];

  id v36 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v36 setAxis:0];
  [v36 setDistribution:0];
  [v36 setAlignment:3];
  [v36 setSpacing:8.0];
  [v36 setUserInteractionEnabled:1];
  [v36 setAccessibilityIdentifier:@"AuthorImageStackView"];
  v37 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  [v37 addArrangedSubview:v36];

  id v38 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_publisherLogoTapped"];
  [(CuratedCollectionDescriptionTableViewCell *)self setPublisherTapGestureRecognizer:v38];

  v39 = [(CuratedCollectionDescriptionTableViewCell *)self publisherTapGestureRecognizer];
  [v36 addGestureRecognizer:v39];

  id v40 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionDescriptionTableViewCell *)self setAuthorImageView:v40];

  v41 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

  v42 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v42 setContentMode:2];

  v43 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v43 setClipsToBounds:1];

  v44 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v44 _setCornerRadius:15.0];

  v45 = [(CuratedCollectionDescriptionTableViewCell *)self theme];
  v46 = [v45 imageBackgroundColor];
  v47 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v47 setBackgroundColor:v46];

  v48 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v48 setAccessibilityIdentifier:@"AuthorImageView"];

  v49 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  [v36 addArrangedSubview:v49];

  id v50 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v50 setAxis:1];
  [v50 setDistribution:3];
  [v50 setAlignment:0];
  [v50 setAccessibilityIdentifier:@"LabelStackView"];
  [v36 addArrangedSubview:v50];
  id v51 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionDescriptionTableViewCell *)self setAuthorLabel:v51];

  v52 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
  [v52 setTranslatesAutoresizingMaskIntoConstraints:0];

  v53 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
  [v53 setAccessibilityIdentifier:@"AuthorLabel"];

  v54 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
  [v50 addArrangedSubview:v54];

  id v55 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionDescriptionTableViewCell *)self setMetadataLabel:v55];

  v56 = [(CuratedCollectionDescriptionTableViewCell *)self metadataLabel];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

  v57 = [(CuratedCollectionDescriptionTableViewCell *)self metadataLabel];
  [v57 setAccessibilityIdentifier:@"MetadataLabel"];

  v58 = [(CuratedCollectionDescriptionTableViewCell *)self metadataLabel];
  [v50 addArrangedSubview:v58];

  [(CuratedCollectionDescriptionTableViewCell *)self _updateFonts];
  [(CuratedCollectionDescriptionTableViewCell *)self _updateColorsAnimated:0];

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  id v55 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v53 = [v55 topAnchor];
  v54 = [(CuratedCollectionDescriptionTableViewCell *)self contentView];
  v52 = [v54 topAnchor];
  id v51 = [v53 constraintEqualToAnchor:v52];
  v56[0] = v51;
  id v50 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v48 = [v50 leadingAnchor];
  v49 = [(CuratedCollectionDescriptionTableViewCell *)self contentView];
  v47 = [v49 leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:16.0];
  v56[1] = v46;
  v45 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v43 = [v45 trailingAnchor];
  v44 = [(CuratedCollectionDescriptionTableViewCell *)self contentView];
  v42 = [v44 trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-16.0];
  v56[2] = v41;
  id v40 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  id v38 = [v40 bottomAnchor];
  v39 = [(CuratedCollectionDescriptionTableViewCell *)self contentView];
  v37 = [v39 bottomAnchor];
  id v36 = [v38 constraintEqualToAnchor:v37];
  v56[3] = v36;
  v35 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  v33 = [v35 topAnchor];
  v34 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v32 = [v34 topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v56[4] = v31;
  v30 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  v28 = [v30 leadingAnchor];
  v29 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v56[5] = v26;
  v25 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  v23 = [v25 trailingAnchor];
  v24 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v22 = [v24 trailingAnchor];
  id v21 = [v23 constraintEqualToAnchor:v22];
  v56[6] = v21;
  v20 = [(CuratedCollectionDescriptionTableViewCell *)self contentLayoutGuide];
  v3 = [v20 bottomAnchor];
  v18 = v3;
  v19 = [(CuratedCollectionDescriptionTableViewCell *)self stackView];
  uint64_t v4 = [v19 bottomAnchor];
  uint64_t v5 = sub_1000BBB44(self);
  double v6 = 22.0;
  if (v5 == 5) {
    double v6 = 16.0;
  }
  id v7 = [v3 constraintEqualToAnchor:v4 constant:v6];
  v56[7] = v7;
  uint64_t v8 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  objc_super v9 = [v8 widthAnchor];
  v10 = [v9 constraintEqualToConstant:30.0];
  v56[8] = v10;
  id v11 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  objc_super v12 = [v11 heightAnchor];
  v13 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
  v14 = [v13 widthAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v56[9] = v15;
  double v16 = +[NSArray arrayWithObjects:v56 count:10];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (void)configureWithModel:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionDescriptionTableViewCell *)self model];

  if (v5 != v4)
  {
    double v6 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
    [v6 setImage:0];

    [(CuratedCollectionDescriptionTableViewCell *)self setModel:v4];
    id v7 = [(CuratedCollectionDescriptionTableViewCell *)self model];
    uint64_t v8 = [v7 collectionDescription];
    objc_super v9 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
    [v9 setAttributedText:v8];

    v10 = [(CuratedCollectionDescriptionTableViewCell *)self model];
    id v11 = [v10 authorName];
    objc_super v12 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
    [v12 setText:v11];

    v13 = [(CuratedCollectionDescriptionTableViewCell *)self model];
    v14 = [v13 collectionMetadata];
    v15 = [(CuratedCollectionDescriptionTableViewCell *)self metadataLabel];
    [v15 setText:v14];

    double v16 = [(CuratedCollectionDescriptionTableViewCell *)self authorImageView];
    [v16 setHidden:0];

    [(CuratedCollectionDescriptionTableViewCell *)self _updateColorsAnimated:0];
    objc_initWeak(&location, self);
    id v17 = [(CuratedCollectionDescriptionTableViewCell *)self model];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1006B2218;
    v18[3] = &unk_1012F4B18;
    objc_copyWeak(&v20, &location);
    id v19 = v4;
    [v17 loadAuthorImageForSize:v18 completion:30.0, 30.0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)_updateFonts
{
  uint64_t v3 = sub_1000BBB44(self);
  id v4 = +[UIFont system17];
  id v5 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v5 setFont:v4];

  double v6 = +[UIFont system17SemiBold];
  id v7 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v7 setShowMoreFont:v6];

  uint64_t v8 = +[UIFont system17SemiBold];
  objc_super v9 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  [v9 setShowLessFont:v8];

  if (v3 == 5)
  {
    v10 = +[UIFont system15Tall];
    id v11 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
    [v11 setFont:v10];

    +[UIFont system15Tall];
  }
  else
  {
    objc_super v12 = +[UIFont system15];
    v13 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
    [v13 setFont:v12];

    +[UIFont system15];
  }
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = [(CuratedCollectionDescriptionTableViewCell *)self metadataLabel];
  [v14 setFont:v15];
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006B2620;
  v11[3] = &unk_1012F4B38;
  BOOL v12 = a3;
  id v4 = objc_retainBlock(v11);
  id v5 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1006B265C;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  ((void (*)(void *, void *, void *))v4[2])(v4, v5, v10);

  double v6 = [(CuratedCollectionDescriptionTableViewCell *)self authorLabel];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006B27B0;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  ((void (*)(void *, void *, void *))v4[2])(v4, v6, v9);

  id v7 = [(CuratedCollectionDescriptionTableViewCell *)self metadataLabel];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006B283C;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  ((void (*)(void *, void *, void *))v4[2])(v4, v7, v8);
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3
{
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_alwaysUseLightForegroundColors != a3)
  {
    self->_alwaysUseLightForegroundColors = a3;
    [(CuratedCollectionDescriptionTableViewCell *)self _updateColorsAnimated:a4];
  }
}

- (BOOL)expanded
{
  v2 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  unsigned __int8 v3 = [v2 isExpanded];

  return v3;
}

- (void)_descriptionLabelDidExpand
{
  unsigned __int8 v3 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
  if ([v3 isExpanded])
  {
  }
  else
  {
    id v4 = [(CuratedCollectionDescriptionTableViewCell *)self descriptionLabel];
    unsigned __int8 v5 = [v4 isShowingExpanded];

    if (v5) {
      return;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cellExpansionOccured:self];
}

- (void)_publisherLogoTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cellPublisherLogoTapped:self];
}

- (CuratedCollectionDescriptionTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CuratedCollectionDescriptionTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)alwaysUseLightForegroundColors
{
  return self->_alwaysUseLightForegroundColors;
}

- (CuratedCollectionDescriptionCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (void)setContentLayoutGuide:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (MUExpandingLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIImageView)authorImageView
{
  return self->_authorImageView;
}

- (void)setAuthorImageView:(id)a3
{
}

- (UITapGestureRecognizer)publisherTapGestureRecognizer
{
  return self->_publisherTapGestureRecognizer;
}

- (void)setPublisherTapGestureRecognizer:(id)a3
{
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
}

- (UILabel)metadataLabel
{
  return self->_metadataLabel;
}

- (void)setMetadataLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_publisherTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_authorImageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end