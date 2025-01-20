@interface PlaceCollectionListCell
- (MKPlaceCollectionViewModel)collectionItem;
- (NSUUID)updateIdentifier;
- (PlaceCollectionListCell)initWithFrame:(CGRect)a3;
- (UIImageView)collectionImageView;
- (UIImageView)publisherLogoImageView;
- (UILabel)collectionLabel;
- (UILabel)collectionSecondaryLabel;
- (UIStackView)collectionLabelStackView;
- (UIView)leftImageView;
- (void)configureWithModel:(id)a3;
- (void)prepareForReuse;
- (void)setCollectionImageView:(id)a3;
- (void)setCollectionItem:(id)a3;
- (void)setCollectionLabel:(id)a3;
- (void)setCollectionLabelStackView:(id)a3;
- (void)setCollectionSecondaryLabel:(id)a3;
- (void)setImageMetadata;
- (void)setLeftImageView:(id)a3;
- (void)setPublisherLogoImageView:(id)a3;
- (void)setTextMetadata;
- (void)setUpdateIdentifier:(id)a3;
- (void)setupConstraints;
- (void)setupCornerRadius;
- (void)setupImageView;
- (void)setupMetadata;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaceCollectionListCell

- (PlaceCollectionListCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PlaceCollectionListCell;
  v3 = -[PlaceCollectionListCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(PlaceCollectionListCell *)v3 setAccessibilityIdentifier:v5];

    [(PlaceCollectionListCell *)v3 setupSubviews];
    [(PlaceCollectionListCell *)v3 setupConstraints];
    [(PlaceCollectionListCell *)v3 setupCornerRadius];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PlaceCollectionListCell;
  id v4 = a3;
  [(PlaceCollectionListCell *)&v9 traitCollectionDidChange:v4];
  v5 = [v4 preferredContentSizeCategory];

  v6 = [(PlaceCollectionListCell *)self traitCollection];
  objc_super v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    v8 = [(PlaceCollectionListCell *)self collectionItem];
    [v8 contentCategorySizeDidChange];

    [(PlaceCollectionListCell *)self setTextMetadata];
  }
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)PlaceCollectionListCell;
  [(PlaceCollectionListCell *)&v8 prepareForReuse];
  v3 = [(PlaceCollectionListCell *)self collectionLabel];
  [v3 setAttributedText:0];

  id v4 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v4 setAttributedText:0];

  v5 = [(PlaceCollectionListCell *)self collectionImageView];
  [v5 setBackgroundColor:0];

  v6 = [(PlaceCollectionListCell *)self collectionImageView];
  [v6 setImage:0];

  objc_super v7 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v7 setImage:0];
}

- (void)setTextMetadata
{
  v3 = [(PlaceCollectionListCell *)self collectionItem];
  id v4 = [v3 collectionTitle];
  v5 = [(PlaceCollectionListCell *)self collectionLabel];
  [v5 setAttributedText:v4];

  v6 = [(PlaceCollectionListCell *)self collectionItem];
  objc_super v7 = [v6 secondaryCollectionTitle];
  objc_super v8 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v8 setAttributedText:v7];

  id v11 = [(PlaceCollectionListCell *)self collectionItem];
  objc_super v9 = [v11 backgroundColor];
  v10 = [(PlaceCollectionListCell *)self collectionImageView];
  [v10 setBackgroundColor:v9];
}

- (void)configureWithModel:(id)a3
{
  [(PlaceCollectionListCell *)self setCollectionItem:a3];
  [(PlaceCollectionListCell *)self setTextMetadata];

  [(PlaceCollectionListCell *)self setImageMetadata];
}

- (void)setImageMetadata
{
  v3 = +[NSUUID UUID];
  [(PlaceCollectionListCell *)self setUpdateIdentifier:v3];
  objc_initWeak(&location, self);
  id v4 = [(PlaceCollectionListCell *)self collectionItem];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100638DAC;
  v18[3] = &unk_1012F2930;
  objc_copyWeak(&v21, &location);
  id v5 = v3;
  id v19 = v5;
  v20 = self;
  [v4 publisherIconImageWithCompletion:v18];

  v6 = sub_10057611C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_super v7 = [(PlaceCollectionListCell *)self collectionItem];
    objc_super v8 = [v7 collectionTitle];
    objc_super v9 = [v8 string];
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[⌛]Requesting image for : %@", buf, 0xCu);
  }
  v10 = +[NSDate date];
  id v11 = [(PlaceCollectionListCell *)self collectionItem];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100638E68;
  v14[3] = &unk_1012F2958;
  objc_copyWeak(&v17, &location);
  v14[4] = self;
  id v12 = v5;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 collectionImageForSize:v14 onCompletion:50.0, 50.0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)setupSubviews
{
  [(PlaceCollectionListCell *)self setupImageView];

  [(PlaceCollectionListCell *)self setupMetadata];
}

- (void)setupCornerRadius
{
  v3 = [(PlaceCollectionListCell *)self collectionImageView];
  [v3 _setContinuousCornerRadius:8.0];

  id v4 = [(PlaceCollectionListCell *)self collectionImageView];
  id v5 = [v4 layer];
  [v5 setMasksToBounds:1];

  v6 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  objc_super v7 = [v6 layer];
  [v7 setMasksToBounds:1];

  id v8 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v8 _setContinuousCornerRadius:5.0];
}

- (void)setupConstraints
{
  v85 = [(PlaceCollectionListCell *)self collectionImageView];
  v83 = [v85 leadingAnchor];
  v84 = [(PlaceCollectionListCell *)self leftImageView];
  v82 = [v84 leadingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v86[0] = v81;
  v80 = [(PlaceCollectionListCell *)self collectionImageView];
  v78 = [v80 topAnchor];
  v79 = [(PlaceCollectionListCell *)self leftImageView];
  v77 = [v79 topAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v86[1] = v76;
  v75 = [(PlaceCollectionListCell *)self collectionImageView];
  v73 = [v75 bottomAnchor];
  v74 = [(PlaceCollectionListCell *)self leftImageView];
  v72 = [v74 bottomAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v86[2] = v71;
  v70 = [(PlaceCollectionListCell *)self collectionImageView];
  v68 = [v70 trailingAnchor];
  v69 = [(PlaceCollectionListCell *)self leftImageView];
  v67 = [v69 trailingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v86[3] = v66;
  v65 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  v64 = [v65 heightAnchor];
  v63 = [v64 constraintEqualToConstant:25.0];
  v86[4] = v63;
  v62 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  v61 = [v62 widthAnchor];
  v60 = [v61 constraintEqualToConstant:25.0];
  v86[5] = v60;
  v59 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  v57 = [v59 bottomAnchor];
  v58 = [(PlaceCollectionListCell *)self collectionImageView];
  v56 = [v58 bottomAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:5.0];
  v86[6] = v55;
  v54 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  v52 = [v54 trailingAnchor];
  v53 = [(PlaceCollectionListCell *)self collectionImageView];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:5.0];
  v86[7] = v50;
  v49 = [(PlaceCollectionListCell *)self leftImageView];
  v48 = [v49 heightAnchor];
  v47 = [v48 constraintEqualToConstant:50.0];
  v86[8] = v47;
  v46 = [(PlaceCollectionListCell *)self leftImageView];
  v45 = [v46 widthAnchor];
  v44 = [v45 constraintEqualToConstant:50.0];
  v86[9] = v44;
  v43 = [(PlaceCollectionListCell *)self leftImageView];
  v41 = [v43 leadingAnchor];
  v42 = [(PlaceCollectionListCell *)self contentView];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v86[10] = v39;
  v38 = [(PlaceCollectionListCell *)self leftImageView];
  v36 = [v38 centerYAnchor];
  v37 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  v35 = [v37 centerYAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v86[11] = v34;
  v33 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  v31 = [v33 leadingAnchor];
  v32 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  v30 = [v32 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:10.0];
  v86[12] = v29;
  v28 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  v26 = [v28 trailingAnchor];
  v27 = [(PlaceCollectionListCell *)self contentView];
  v25 = [v27 trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:-16.0];
  v86[13] = v24;
  v23 = [(PlaceCollectionListCell *)self contentView];
  id v21 = [v23 topAnchor];
  v22 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  v20 = [v22 topAnchor];
  id v19 = [v21 constraintLessThanOrEqualToAnchor:v20 constant:-16.0];
  v86[14] = v19;
  v18 = [(PlaceCollectionListCell *)self contentView];
  id v16 = [v18 topAnchor];
  id v17 = [(PlaceCollectionListCell *)self leftImageView];
  id v15 = [v17 topAnchor];
  v14 = [v16 constraintLessThanOrEqualToAnchor:v15 constant:-16.0];
  v86[15] = v14;
  id v13 = [(PlaceCollectionListCell *)self contentView];
  v3 = [v13 bottomAnchor];
  id v4 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  id v5 = [v4 bottomAnchor];
  v6 = [v3 constraintGreaterThanOrEqualToAnchor:v5 constant:16.0];
  v86[16] = v6;
  objc_super v7 = [(PlaceCollectionListCell *)self contentView];
  id v8 = [v7 bottomAnchor];
  objc_super v9 = [(PlaceCollectionListCell *)self leftImageView];
  v10 = [v9 bottomAnchor];
  id v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:16.0];
  v86[17] = v11;
  id v12 = +[NSArray arrayWithObjects:v86 count:18];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)setupImageView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(PlaceCollectionListCell *)self setLeftImageView:v7];

  id v8 = [(PlaceCollectionListCell *)self leftImageView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(PlaceCollectionListCell *)self leftImageView];
  [v9 setAccessibilityIdentifier:@"LeftImageView"];

  id v10 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(PlaceCollectionListCell *)self setCollectionImageView:v10];

  id v11 = [(PlaceCollectionListCell *)self collectionImageView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(PlaceCollectionListCell *)self collectionImageView];
  [v12 setAccessibilityIgnoresInvertColors:1];

  id v13 = [(PlaceCollectionListCell *)self collectionImageView];
  [v13 setAccessibilityIdentifier:@"CollectionImage"];

  v14 = [(PlaceCollectionListCell *)self collectionImageView];
  [v14 setContentMode:1];

  id v15 = [(PlaceCollectionListCell *)self leftImageView];
  id v16 = [(PlaceCollectionListCell *)self collectionImageView];
  [v15 addSubview:v16];

  id v17 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(PlaceCollectionListCell *)self setPublisherLogoImageView:v17];

  v18 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v19 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v19 setAccessibilityIgnoresInvertColors:1];

  v20 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v20 setAccessibilityIdentifier:@"PublisherLogoImage"];

  id v21 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v21 setContentMode:1];

  v22 = [(PlaceCollectionListCell *)self leftImageView];
  v23 = [(PlaceCollectionListCell *)self publisherLogoImageView];
  [v22 addSubview:v23];

  id v25 = [(PlaceCollectionListCell *)self contentView];
  v24 = [(PlaceCollectionListCell *)self leftImageView];
  [v25 addSubview:v24];
}

- (void)setupMetadata
{
  id v3 = objc_alloc((Class)UIStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(PlaceCollectionListCell *)self setCollectionLabelStackView:v7];

  id v8 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  [v9 setAxis:1];

  id v10 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  [v10 setDistribution:4];

  id v11 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  [v11 setSpacing:2.0];

  id v12 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  [v12 setAccessibilityIdentifier:@"CollectionLabelStack"];

  id v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(PlaceCollectionListCell *)self setCollectionLabel:v13];

  v14 = [(PlaceCollectionListCell *)self collectionLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v15 = [(PlaceCollectionListCell *)self collectionLabel];
  [v15 setNumberOfLines:0];

  id v16 = [(PlaceCollectionListCell *)self collectionLabel];
  [v16 setAccessibilityIdentifier:@"CollectionLabel"];

  id v17 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  v18 = [(PlaceCollectionListCell *)self collectionLabel];
  [v17 addArrangedSubview:v18];

  id v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(PlaceCollectionListCell *)self setCollectionSecondaryLabel:v19];

  v20 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v21 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v21 setNumberOfLines:0];

  v22 = +[UIColor secondaryLabelColor];
  v23 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v23 setTextColor:v22];

  v24 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v24 setAccessibilityIdentifier:@"CollectionSecondaryLabel"];

  id v25 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  v26 = [(PlaceCollectionListCell *)self collectionSecondaryLabel];
  [v25 addArrangedSubview:v26];

  id v28 = [(PlaceCollectionListCell *)self contentView];
  v27 = [(PlaceCollectionListCell *)self collectionLabelStackView];
  [v28 addSubview:v27];
}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (void)setPublisherLogoImageView:(id)a3
{
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (void)setCollectionImageView:(id)a3
{
}

- (UIView)leftImageView
{
  return self->_leftImageView;
}

- (void)setLeftImageView:(id)a3
{
}

- (UILabel)collectionLabel
{
  return self->_collectionLabel;
}

- (void)setCollectionLabel:(id)a3
{
}

- (UILabel)collectionSecondaryLabel
{
  return self->_collectionSecondaryLabel;
}

- (void)setCollectionSecondaryLabel:(id)a3
{
}

- (UIStackView)collectionLabelStackView
{
  return self->_collectionLabelStackView;
}

- (void)setCollectionLabelStackView:(id)a3
{
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
}

- (MKPlaceCollectionViewModel)collectionItem
{
  return self->_collectionItem;
}

- (void)setCollectionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionItem, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionLabelStackView, 0);
  objc_storeStrong((id *)&self->_collectionSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_collectionLabel, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);

  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
}

@end