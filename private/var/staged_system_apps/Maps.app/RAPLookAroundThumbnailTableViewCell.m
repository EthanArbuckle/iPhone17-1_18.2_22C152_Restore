@interface RAPLookAroundThumbnailTableViewCell
+ (NSString)reuseIdentifier;
- (GEOPDMuninViewState)viewState;
- (RAPLookAroundThumbnailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)thumbnailImage;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateFonts;
- (void)setThumbnailImage:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation RAPLookAroundThumbnailTableViewCell

- (RAPLookAroundThumbnailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RAPLookAroundThumbnailTableViewCell;
  v4 = [(RAPLookAroundThumbnailTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(RAPLookAroundThumbnailTableViewCell *)v4 _setupSubviews];
    [(RAPLookAroundThumbnailTableViewCell *)v5 _setupConstraints];
    [(RAPLookAroundThumbnailTableViewCell *)v5 _updateFonts];
    [(RAPLookAroundThumbnailTableViewCell *)v5 setSelectionStyle:0];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)setThumbnailImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_thumbnailImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_thumbnailImage, a3);
    [(UIImageView *)self->_thumbnailImageView setImage:self->_thumbnailImage];
    v5 = v6;
  }
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  thumbnailImageView = self->_thumbnailImageView;
  self->_thumbnailImageView = v7;

  [(UIImageView *)self->_thumbnailImageView setContentMode:2];
  [(UIImageView *)self->_thumbnailImageView setClipsToBounds:1];
  v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  nameLabel = self->_nameLabel;
  self->_nameLabel = v9;

  [(UILabel *)self->_nameLabel setNumberOfLines:0];
  [(UILabel *)self->_nameLabel setLineBreakMode:0];
  v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  locationLabel = self->_locationLabel;
  self->_locationLabel = v11;

  [(UILabel *)self->_locationLabel setNumberOfLines:0];
  [(UILabel *)self->_locationLabel setLineBreakMode:0];
  v13 = +[UIColor labelColor];
  [(UILabel *)self->_nameLabel setTextColor:v13];

  v14 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_locationLabel setTextColor:v14];

  id v15 = [(RAPLookAroundThumbnailTableViewCell *)self contentView];
  [v15 addSubview:self->_thumbnailImageView];
  [v15 addSubview:self->_nameLabel];
  [v15 addSubview:self->_locationLabel];
  [(RAPLookAroundThumbnailTableViewCell *)self _updateFonts];
}

- (void)_setupConstraints
{
  id v3 = [(RAPLookAroundThumbnailTableViewCell *)self contentView];
  [(UIImageView *)self->_thumbnailImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_locationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(UILabel *)self->_nameLabel firstBaselineAnchor];
  v5 = [v3 topAnchor];
  v6 = [(UILabel *)self->_nameLabel font];
  [v6 _scaledValueForValue:60.0];
  [v4 constraintEqualToAnchor:v5];
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToNameBaselineConstraint = self->_topToNameBaselineConstraint;
  self->_topToNameBaselineConstraint = v7;

  v9 = [(UILabel *)self->_locationLabel firstBaselineAnchor];
  v10 = [(UILabel *)self->_nameLabel lastBaselineAnchor];
  v11 = [(UILabel *)self->_locationLabel font];
  [v11 _scaledValueForValue:22.0];
  [v9 constraintEqualToAnchor:v10];
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  nameToLocationBaselineConstraint = self->_nameToLocationBaselineConstraint;
  self->_nameToLocationBaselineConstraint = v12;

  v14 = [(UILabel *)self->_locationLabel lastBaselineAnchor];
  id v15 = [v3 bottomAnchor];
  v16 = [(UILabel *)self->_locationLabel font];
  [v16 _scaledValueForValue:-48.0];
  [v14 constraintEqualToAnchor:v15];
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  locationToBottomBaselineConstraint = self->_locationToBottomBaselineConstraint;
  self->_locationToBottomBaselineConstraint = v17;

  v45 = [v3 leadingAnchor];
  v44 = [(UIImageView *)self->_thumbnailImageView leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:-20.0];
  v46[0] = v43;
  v42 = [(UIImageView *)self->_thumbnailImageView heightAnchor];
  v41 = [v42 constraintEqualToConstant:110.0];
  v46[1] = v41;
  v40 = [(UIImageView *)self->_thumbnailImageView widthAnchor];
  v39 = [v40 constraintEqualToConstant:90.0];
  v46[2] = v39;
  v38 = [(UIImageView *)self->_thumbnailImageView trailingAnchor];
  v37 = [(UILabel *)self->_nameLabel leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:-16.0];
  v46[3] = v36;
  v35 = [(UILabel *)self->_locationLabel leadingAnchor];
  v34 = [(UILabel *)self->_nameLabel leadingAnchor];
  v32 = [v35 constraintEqualToAnchor:v34];
  v46[4] = v32;
  v19 = [(UIImageView *)self->_thumbnailImageView centerYAnchor];
  v20 = v3;
  v33 = v3;
  v21 = [v3 centerYAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v46[5] = v22;
  v23 = [(UILabel *)self->_nameLabel trailingAnchor];
  v24 = [v20 trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:-16.0];
  v46[6] = v25;
  v26 = [(UILabel *)self->_locationLabel trailingAnchor];
  v27 = [v20 trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v29 = self->_topToNameBaselineConstraint;
  v46[7] = v28;
  v46[8] = v29;
  v30 = self->_locationToBottomBaselineConstraint;
  v46[9] = self->_nameToLocationBaselineConstraint;
  v46[10] = v30;
  v31 = +[NSArray arrayWithObjects:v46 count:11];
  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)setViewState:(id)a3
{
  v5 = (GEOPDMuninViewState *)a3;
  p_viewState = &self->_viewState;
  if (self->_viewState != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_viewState, a3);
    v7 = [(GEOPDMuninViewState *)*p_viewState locationInfo];
    objc_super v8 = [v7 locationName];
    [(UILabel *)self->_nameLabel setText:v8];

    v9 = [(GEOPDMuninViewState *)*p_viewState locationInfo];
    v10 = [v9 localityName];
    [(UILabel *)self->_locationLabel setText:v10];

    v5 = v11;
  }
}

- (void)_contentSizeDidChange
{
  [(RAPLookAroundThumbnailTableViewCell *)self _updateFonts];
  id v3 = [(UILabel *)self->_nameLabel font];
  [v3 _scaledValueForValue:60.0];
  -[NSLayoutConstraint setConstant:](self->_topToNameBaselineConstraint, "setConstant:");

  v4 = [(UILabel *)self->_locationLabel font];
  [v4 _scaledValueForValue:22.0];
  -[NSLayoutConstraint setConstant:](self->_nameToLocationBaselineConstraint, "setConstant:");

  id v5 = [(UILabel *)self->_locationLabel font];
  [v5 _scaledValueForValue:-48.0];
  -[NSLayoutConstraint setConstant:](self->_locationToBottomBaselineConstraint, "setConstant:");
}

- (void)_updateFonts
{
  id v3 = +[UIFont system17];
  [(UILabel *)self->_nameLabel setFont:v3];

  id v4 = +[UIFont system17];
  [(UILabel *)self->_locationLabel setFont:v4];
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"RAPLookAroundThumbnailTableViewCell";
}

- (GEOPDMuninViewState)viewState
{
  return self->_viewState;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_locationToBottomBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_nameToLocationBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToNameBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
}

@end