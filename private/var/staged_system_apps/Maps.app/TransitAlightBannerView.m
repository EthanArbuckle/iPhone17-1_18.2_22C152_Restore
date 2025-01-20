@interface TransitAlightBannerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (TransitAlightBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (unint64_t)bannerType;
- (void)updateFromBannerItem;
- (void)wasDismissedByUser;
@end

@implementation TransitAlightBannerView

- (TransitAlightBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  BOOL v5 = a5;
  v37.receiver = self;
  v37.super_class = (Class)TransitAlightBannerView;
  v6 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v37, "initWithTarget:item:aperturePresentation:", a3, a4);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(TransitAlightBannerView *)v6 setAccessibilityIdentifier:v8];

    [(TransitAlightBannerView *)v6 setOverrideUserInterfaceStyle:2];
    uint64_t v9 = objc_opt_new();
    imageView = v6->_imageView;
    v6->_imageView = (MKArtworkImageView *)v9;

    [(MKArtworkImageView *)v6->_imageView setAccessibilityIdentifier:@"ImageView"];
    [(MKArtworkImageView *)v6->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKArtworkImageView *)v6->_imageView setContentMode:1];
    uint64_t v11 = objc_opt_new();
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v11;

    [(UILabel *)v6->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(UILabel *)v6->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_titleLabel setNumberOfLines:2];
    v13 = +[UIColor labelColor];
    v14 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    v15 = [v13 resolvedColorWithTraitCollection:v14];
    [(UILabel *)v6->_titleLabel setTextColor:v15];

    v16 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:UIFontWeightBold];
    [(UILabel *)v6->_titleLabel setFont:v16];

    uint64_t v17 = objc_opt_new();
    descriptionLabel = v6->_descriptionLabel;
    v6->_descriptionLabel = (UILabel *)v17;

    [(UILabel *)v6->_descriptionLabel setAccessibilityIdentifier:@"DescriptionLabel"];
    [(UILabel *)v6->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_descriptionLabel setNumberOfLines:4];
    v19 = +[UIColor secondaryLabelColor];
    v20 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    v21 = [v19 resolvedColorWithTraitCollection:v20];
    [(UILabel *)v6->_descriptionLabel setTextColor:v21];

    v22 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:UIFontWeightMedium];
    [(UILabel *)v6->_descriptionLabel setFont:v22];

    v23 = [(MKArtworkImageView *)v6->_imageView widthAnchor];
    v24 = [v23 constraintGreaterThanOrEqualToConstant:36.0];
    v38[0] = v24;
    v25 = [(MKArtworkImageView *)v6->_imageView heightAnchor];
    v26 = [v25 constraintEqualToConstant:36.0];
    v38[1] = v26;
    v27 = +[NSArray arrayWithObjects:v38 count:2];
    +[NSLayoutConstraint activateConstraints:v27];

    v28 = [[MapsBannerContent alloc] initWithHeaderView:0 iconView:v6->_imageView leadingTopView:v6->_titleLabel trailingTopView:0 bottomView:v6->_descriptionLabel footerView:0];
    v29 = [(MapsBannerView *)v6 contentView];
    [v29 setContent:v28];

    if (v5)
    {
      v30 = [(UILabel *)v6->_titleLabel _tightBoundingBoxLayoutGuide];
      v31 = [v30 topAnchor];
      v32 = [(TransitAlightBannerView *)v6 SBUISA_systemApertureObstructedAreaLayoutGuide];
      v33 = [v32 bottomAnchor];
      v34 = [v31 constraintEqualToAnchor:v33];

      LODWORD(v35) = 1144750080;
      [v34 setPriority:v35];
      [v34 setActive:1];
    }
    [(TransitAlightBannerView *)v6 updateFromBannerItem];
    v6->_cachedHeight = -1.0;
    v6->_calculatedWidth = -1.0;
  }
  return v6;
}

- (void)updateFromBannerItem
{
  v3 = [(MapsBannerView *)self item];
  v4 = +[MNNavigationService sharedService];
  BOOL v5 = [v4 route];

  v6 = [v3 alightMessage];
  v28 = v5;
  v7 = [v5 stepAtIndex:[v6 stepIndex]];

  v27 = v7;
  v8 = [v7 nextAlightingStep];
  uint64_t v9 = [v3 artwork];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = [v8 transitLine];
    v13 = [v12 artwork];
    v14 = v13;
    if (v13)
    {
      id v11 = v13;
    }
    else
    {
      v15 = [v8 transitLine];
      id v11 = [v15 alternateArtwork];
    }
  }

  id v16 = [objc_alloc((Class)MKSizedTransitArtwork) initWithArtwork:v11 shieldSize:7 artworkCache:0];
  [(MKArtworkImageView *)self->_imageView setImageSource:v16];

  uint64_t v17 = [v3 title];
  NSAttributedStringKey v31 = NSFontAttributeName;
  v18 = [(UILabel *)self->_titleLabel font];
  v32 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v20 = +[NSAttributedString _mapkit_attributedStringForComposedString:v17 defaultAttributes:v19];
  [(UILabel *)self->_titleLabel setAttributedText:v20];

  v21 = [v3 subtitle];
  NSAttributedStringKey v29 = NSFontAttributeName;
  v22 = [(UILabel *)self->_descriptionLabel font];
  v30 = v22;
  v23 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v24 = +[NSAttributedString _mapkit_attributedStringForComposedString:v21 defaultAttributes:v23];
  [(UILabel *)self->_descriptionLabel setAttributedText:v24];

  v25 = [(UILabel *)self->_descriptionLabel attributedText];
  BOOL v26 = [v25 length] == 0;

  [(UILabel *)self->_descriptionLabel setHidden:v26];
  self->_cachedHeight = -1.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    [(TransitAlightBannerView *)self _maps_compressedSizeForWidth:0 withBlock:a3.width];
    double v8 = v7;
    if ([(MapsBannerView *)self aperturePresentation])
    {
      uint64_t v9 = [(MapsBannerView *)self contentView];
      [v9 _maps_compressedSizeForWidth:0 withBlock:width];
      double v8 = v10 + 17.0;
    }
    if (v8 <= height)
    {
      self->_double cachedHeight = v8;
      self->_calculatedWidth = width;
      double cachedHeight = self->_cachedHeight;
    }
    else
    {
      id v11 = sub_1000AD30C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = [(MapsBannerView *)self item];
        v21.CGFloat width = width;
        v21.double height = height;
        v13 = NSStringFromCGSize(v21);
        int v15 = 138412802;
        id v16 = v12;
        __int16 v17 = 2112;
        v18 = v13;
        __int16 v19 = 2048;
        double v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v15, 0x20u);
      }
      double cachedHeight = height;
    }
  }
  double v14 = width;
  result.double height = cachedHeight;
  result.CGFloat width = v14;
  return result;
}

- (unint64_t)bannerType
{
  return 2;
}

- (void)wasDismissedByUser
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end