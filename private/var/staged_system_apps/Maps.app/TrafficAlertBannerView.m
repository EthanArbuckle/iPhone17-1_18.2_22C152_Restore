@interface TrafficAlertBannerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (TrafficAlertBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (unint64_t)bannerType;
- (void)updateFromBannerItem;
@end

@implementation TrafficAlertBannerView

- (TrafficAlertBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  BOOL v5 = a5;
  v37.receiver = self;
  v37.super_class = (Class)TrafficAlertBannerView;
  v6 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v37, "initWithTarget:item:aperturePresentation:", a3, a4);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(TrafficAlertBannerView *)v6 setAccessibilityIdentifier:v8];

    v9 = (MKArtworkImageView *)objc_alloc_init((Class)MKArtworkImageView);
    artworkImageView = v6->_artworkImageView;
    v6->_artworkImageView = v9;

    [(MKArtworkImageView *)v6->_artworkImageView setAccessibilityIdentifier:@"ArtworkImageView"];
    [(MKArtworkImageView *)v6->_artworkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKArtworkImageView *)v6->_artworkImageView setContentMode:1];
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

    v16 = +[UIFont systemFontOfSize:26.0 weight:UIFontWeightHeavy];
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

    v22 = +[UIFont systemFontOfSize:26.0 weight:UIFontWeightMedium];
    [(UILabel *)v6->_descriptionLabel setFont:v22];

    v23 = [(MKArtworkImageView *)v6->_artworkImageView widthAnchor];
    v24 = [v23 constraintEqualToConstant:46.0];
    v38[0] = v24;
    v25 = [(MKArtworkImageView *)v6->_artworkImageView heightAnchor];
    v26 = [v25 constraintEqualToConstant:46.0];
    v38[1] = v26;
    v27 = +[NSArray arrayWithObjects:v38 count:2];
    +[NSLayoutConstraint activateConstraints:v27];

    v28 = [[MapsBannerContent alloc] initWithHeaderView:0 iconView:v6->_artworkImageView leadingTopView:v6->_titleLabel trailingTopView:0 bottomView:v6->_descriptionLabel footerView:0];
    v29 = [(MapsBannerView *)v6 contentView];
    [v29 setContent:v28];

    if (v5)
    {
      v30 = [(UILabel *)v6->_titleLabel _tightBoundingBoxLayoutGuide];
      v31 = [v30 topAnchor];
      v32 = [(TrafficAlertBannerView *)v6 SBUISA_systemApertureObstructedAreaLayoutGuide];
      v33 = [v32 bottomAnchor];
      v34 = [v31 constraintEqualToAnchor:v33];

      LODWORD(v35) = 1144750080;
      [v34 setPriority:v35];
      [v34 setActive:1];
    }
    [(TrafficAlertBannerView *)v6 updateFromBannerItem];
    v6->_cachedHeight = -1.0;
    v6->_calculatedWidth = -1.0;
  }
  return v6;
}

- (void)updateFromBannerItem
{
  id v26 = [(MapsBannerView *)self item];
  v3 = [(UILabel *)self->_titleLabel text];
  v4 = [v26 title];
  uint64_t v5 = v3;
  unint64_t v6 = v4;
  if (v5 | v6)
  {
    unsigned int v7 = [(id)v5 isEqual:v6];

    if (!v7) {
      goto LABEL_10;
    }
  }
  v8 = [(UILabel *)self->_descriptionLabel text];
  v9 = [v26 subtitle];
  unint64_t v10 = v8;
  unint64_t v11 = v9;
  if (v10 | v11)
  {
    unsigned int v12 = [(id)v10 isEqual:v11];

    if (!v12)
    {

LABEL_10:
      goto LABEL_11;
    }
  }
  v13 = [(MKArtworkImageView *)self->_artworkImageView image];
  v14 = [v26 icon];
  unint64_t v15 = v13;
  unint64_t v16 = v14;
  if (!(v15 | v16))
  {

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v17 = (void *)v16;
  unsigned __int8 v18 = [(id)v15 isEqual:v16];

  if ((v18 & 1) == 0)
  {
LABEL_11:
    v19 = [v26 title];
    [(UILabel *)self->_titleLabel setText:v19];

    v20 = [v26 title];
    if (v20)
    {
      v21 = [v26 title];
      -[UILabel setHidden:](self->_titleLabel, "setHidden:", [v21 length] == 0);
    }
    else
    {
      [(UILabel *)self->_titleLabel setHidden:1];
    }

    v22 = [v26 subtitle];
    [(UILabel *)self->_descriptionLabel setText:v22];

    v23 = [v26 subtitle];
    if (v23)
    {
      v24 = [v26 subtitle];
      -[UILabel setHidden:](self->_descriptionLabel, "setHidden:", [v24 length] == 0);
    }
    else
    {
      [(UILabel *)self->_descriptionLabel setHidden:1];
    }

    self->_cachedHeight = -1.0;
    v25 = [v26 icon];
    [(MKArtworkImageView *)self->_artworkImageView setImageSource:v25];

    uint64_t v5 = [v26 icon];
    [(MKArtworkImageView *)self->_artworkImageView setHidden:v5 == 0];
    goto LABEL_18;
  }
LABEL_19:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    if ([(MapsBannerView *)self aperturePresentation])
    {
      unsigned int v7 = [(TrafficAlertBannerView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
      [v7 layoutFrame];
      double MaxY = CGRectGetMaxY(v25);
      v9 = [(MapsBannerView *)self contentView];
      [v9 _maps_compressedSizeForWidth:0 withBlock:width];
      double v11 = MaxY + v10 + 17.0;
    }
    else
    {
      [(TrafficAlertBannerView *)self _maps_compressedSizeForWidth:0 withBlock:width];
      double v11 = v12;
    }
    if (v11 <= height)
    {
      self->_double cachedHeight = v11;
      self->_calculatedWidth = width;
      double cachedHeight = self->_cachedHeight;
    }
    else
    {
      v13 = sub_1000AD30C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = [(MapsBannerView *)self item];
        v23.CGFloat width = width;
        v23.double height = height;
        unint64_t v15 = NSStringFromCGSize(v23);
        int v17 = 138412802;
        unsigned __int8 v18 = v14;
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2048;
        double v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v17, 0x20u);
      }
      double cachedHeight = height;
    }
  }
  double v16 = width;
  result.double height = cachedHeight;
  result.CGFloat width = v16;
  return result;
}

- (unint64_t)bannerType
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end