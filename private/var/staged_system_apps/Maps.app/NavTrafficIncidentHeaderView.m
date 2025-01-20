@interface NavTrafficIncidentHeaderView
- (MKArtworkImageSource)imageSource;
- (MKArtworkImageView)artworkImageView;
- (NSLayoutConstraint)imageViewToPrimaryLabelHorizontalConstraint;
- (NSLayoutConstraint)imageViewWidthConstraint;
- (NSLayoutConstraint)primaryToSecondaryLabelBaselineConstraint;
- (NavTrafficIncidentHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (id)_initialConstraints;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_setupViews;
- (void)setArtworkImageView:(id)a3;
- (void)setImageSource:(id)a3;
- (void)setImageViewToPrimaryLabelHorizontalConstraint:(id)a3;
- (void)setImageViewWidthConstraint:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryToSecondaryLabelBaselineConstraint:(id)a3;
- (void)setPrimaryToSecondaryLabelBaselineSpacing:(double)a3;
- (void)setSecondaryLabel:(id)a3;
@end

@implementation NavTrafficIncidentHeaderView

- (NavTrafficIncidentHeaderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavTrafficIncidentHeaderView;
  v3 = -[NavTrafficIncidentHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NavTrafficIncidentHeaderView *)v3 _setupViews];
    [(NavTrafficIncidentHeaderView *)v4 setAccessibilityIdentifier:@"NavTrafficIncidentHeaderView"];
    v5 = [(NavTrafficIncidentHeaderView *)v4 _initialConstraints];
    +[NSLayoutConstraint activateConstraints:v5];
  }
  return v4;
}

- (void)_setupViews
{
  v3 = [MapsThemeLabel alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v7 = -[MapsThemeLabel initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  v9 = +[UIFont _maps_boldSystemFontWithFixedSize:23.0];
  [(UILabel *)self->_primaryLabel setFont:v9];

  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_primaryLabel setNumberOfLines:0];
  [(UILabel *)self->_primaryLabel setLineBreakStrategy:0];
  LODWORD(v10) = 1148829696;
  [(UILabel *)self->_primaryLabel setContentCompressionResistancePriority:1 forAxis:v10];
  v11 = +[UIColor labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v11];

  [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  [(NavTrafficIncidentHeaderView *)self addSubview:self->_primaryLabel];
  v12 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = &v12->super;

  v14 = +[UIFont _maps_systemFontWithFixedSize:20.0];
  [(UILabel *)self->_secondaryLabel setFont:v14];

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  [(UILabel *)self->_secondaryLabel setLineBreakStrategy:0];
  LODWORD(v15) = 1148829696;
  [(UILabel *)self->_secondaryLabel setContentCompressionResistancePriority:1 forAxis:v15];
  v16 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v16];

  [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  [(NavTrafficIncidentHeaderView *)self addSubview:self->_secondaryLabel];
  v17 = [objc_alloc((Class)MKArtworkImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  artworkImageView = self->_artworkImageView;
  self->_artworkImageView = v17;

  [(MKArtworkImageView *)self->_artworkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKArtworkImageView *)self->_artworkImageView setContentMode:1];
  [(MKArtworkImageView *)self->_artworkImageView setAccessibilityIdentifier:@"ArtworkImageView"];
  v19 = self->_artworkImageView;

  [(NavTrafficIncidentHeaderView *)self addSubview:v19];
}

- (id)_initialConstraints
{
  v3 = [(MKArtworkImageView *)self->_artworkImageView widthAnchor];
  v4 = [v3 constraintEqualToConstant:0.0];
  imageViewWidthConstraint = self->_imageViewWidthConstraint;
  self->_imageViewWidthConstraint = v4;

  v6 = [(UILabel *)self->_primaryLabel leadingAnchor];
  objc_super v7 = [(MKArtworkImageView *)self->_artworkImageView trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  imageViewToPrimaryLabelHorizontalConstraint = self->_imageViewToPrimaryLabelHorizontalConstraint;
  self->_imageViewToPrimaryLabelHorizontalConstraint = v8;

  double v10 = [(UILabel *)self->_secondaryLabel firstBaselineAnchor];
  v11 = [(UILabel *)self->_primaryLabel lastBaselineAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:24.0];
  primaryToSecondaryLabelBaselineConstraint = self->_primaryToSecondaryLabelBaselineConstraint;
  self->_primaryToSecondaryLabelBaselineConstraint = v12;

  v48 = [(MKArtworkImageView *)self->_artworkImageView leadingAnchor];
  v47 = [(NavTrafficIncidentHeaderView *)self leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v14 = self->_imageViewToPrimaryLabelHorizontalConstraint;
  v49[0] = v46;
  v49[1] = v14;
  v49[2] = self->_imageViewWidthConstraint;
  v45 = [(UILabel *)self->_primaryLabel trailingAnchor];
  v44 = [(NavTrafficIncidentHeaderView *)self trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v49[3] = v43;
  v42 = [(UILabel *)self->_secondaryLabel leadingAnchor];
  v41 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v49[4] = v40;
  v39 = [(UILabel *)self->_secondaryLabel trailingAnchor];
  v38 = [(NavTrafficIncidentHeaderView *)self trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v49[5] = v37;
  v36 = [(MKArtworkImageView *)self->_artworkImageView topAnchor];
  v35 = [(NavTrafficIncidentHeaderView *)self topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:23.0];
  v49[6] = v34;
  v33 = [(MKArtworkImageView *)self->_artworkImageView heightAnchor];
  v32 = [(MKArtworkImageView *)self->_artworkImageView widthAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v49[7] = v31;
  v30 = [(NavTrafficIncidentHeaderView *)self bottomAnchor];
  v29 = [(MKArtworkImageView *)self->_artworkImageView bottomAnchor];
  v28 = [v30 constraintGreaterThanOrEqualToAnchor:v29 constant:22.0];
  v49[8] = v28;
  double v15 = [(UILabel *)self->_primaryLabel firstBaselineAnchor];
  v16 = [(NavTrafficIncidentHeaderView *)self topAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:40.0];
  v18 = self->_primaryToSecondaryLabelBaselineConstraint;
  v49[9] = v17;
  v49[10] = v18;
  v19 = [(NavTrafficIncidentHeaderView *)self bottomAnchor];
  v20 = [(UILabel *)self->_secondaryLabel lastBaselineAnchor];
  v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20 constant:21.0];
  v49[11] = v21;
  v22 = [(NavTrafficIncidentHeaderView *)self bottomAnchor];
  v23 = [(UILabel *)self->_secondaryLabel lastBaselineAnchor];
  LODWORD(v24) = 1148829696;
  v25 = [v22 constraintEqualToAnchor:v23 constant:21.0 priority:v24];
  v49[12] = v25;
  v26 = +[NSArray arrayWithObjects:v49 count:13];

  return v26;
}

- (void)setPrimaryToSecondaryLabelBaselineSpacing:(double)a3
{
}

- (id)viewForFirstBaselineLayout
{
  return self->_primaryLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_secondaryLabel;
}

- (void)setImageSource:(id)a3
{
  -[MKArtworkImageView setImageSource:](self->_artworkImageView, "setImageSource:");
  double v5 = 40.0;
  if (a3)
  {
    double v6 = 13.0;
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  [(NSLayoutConstraint *)self->_imageViewWidthConstraint setConstant:v5];
  imageViewToPrimaryLabelHorizontalConstraint = self->_imageViewToPrimaryLabelHorizontalConstraint;

  [(NSLayoutConstraint *)imageViewToPrimaryLabelHorizontalConstraint setConstant:v6];
}

- (MKArtworkImageSource)imageSource
{
  return (MKArtworkImageSource *)[(MKArtworkImageView *)self->_artworkImageView imageSource];
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (MKArtworkImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
}

- (NSLayoutConstraint)imageViewToPrimaryLabelHorizontalConstraint
{
  return self->_imageViewToPrimaryLabelHorizontalConstraint;
}

- (void)setImageViewToPrimaryLabelHorizontalConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewWidthConstraint
{
  return self->_imageViewWidthConstraint;
}

- (void)setImageViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryToSecondaryLabelBaselineConstraint
{
  return self->_primaryToSecondaryLabelBaselineConstraint;
}

- (void)setPrimaryToSecondaryLabelBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryToSecondaryLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewToPrimaryLabelHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end