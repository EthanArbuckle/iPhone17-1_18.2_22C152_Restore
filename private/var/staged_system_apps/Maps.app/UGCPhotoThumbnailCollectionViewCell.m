@interface UGCPhotoThumbnailCollectionViewCell
+ (NSString)reuseIdentifier;
- (NSString)assetIdentifier;
- (NSString)providerName;
- (UGCPhotoThumbnailCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)photoImageView;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateBadge;
- (void)prepareForReuse;
- (void)setAssetIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setPhotoImageView:(id)a3;
- (void)setProviderName:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UGCPhotoThumbnailCollectionViewCell

- (UGCPhotoThumbnailCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UGCPhotoThumbnailCollectionViewCell;
  v3 = -[UGCPhotoThumbnailCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v5 stringByReplacingOccurrencesOfString:@"UGC" withString:&stru_101324E70];
    [(UGCPhotoThumbnailCollectionViewCell *)v3 setAccessibilityIdentifier:v6];

    [(UGCPhotoThumbnailCollectionViewCell *)v3 _setupSubviews];
    [(UGCPhotoThumbnailCollectionViewCell *)v3 _setupConstraints];
  }
  return v3;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  photoImageView = self->_photoImageView;
  self->_photoImageView = v7;

  [(UIImageView *)self->_photoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_photoImageView setContentMode:2];
  [(UIImageView *)self->_photoImageView setClipsToBounds:1];
  [(UIImageView *)self->_photoImageView setAccessibilityIgnoresInvertColors:1];
  [(UIImageView *)self->_photoImageView setAccessibilityIdentifier:@"PhotoImageView"];
  v9 = [(UGCPhotoThumbnailCollectionViewCell *)self contentView];
  [v9 addSubview:self->_photoImageView];

  v10 = -[UGCPhotoThumbnailBadgeView initWithFrame:]([_TtC4Maps26UGCPhotoThumbnailBadgeView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  badgeView = self->_badgeView;
  self->_badgeView = v10;

  [(UGCPhotoThumbnailBadgeView *)self->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = self->_photoImageView;
  v13 = self->_badgeView;

  [(UIImageView *)v12 addSubview:v13];
}

- (void)_setupConstraints
{
  id v3 = [(UGCPhotoThumbnailCollectionViewCell *)self contentView];
  v37 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v36 = [v37 leadingAnchor];
  v35 = [v3 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v38[0] = v34;
  v33 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v32 = [v33 trailingAnchor];
  v31 = [v3 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v38[1] = v30;
  v28 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v27 = [v28 topAnchor];
  v29 = v3;
  v26 = [v3 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v38[2] = v25;
  v24 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v23 = [v24 bottomAnchor];
  v22 = [v3 bottomAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v38[3] = v21;
  v19 = [(UGCPhotoThumbnailBadgeView *)self->_badgeView leadingAnchor];
  v20 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v18 = [v20 leadingAnchor];
  v17 = [v19 constraintGreaterThanOrEqualToAnchor:v18 constant:kMUPlaceSystemSpacing];
  v38[4] = v17;
  v15 = [(UGCPhotoThumbnailBadgeView *)self->_badgeView trailingAnchor];
  v16 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v14 = [v16 trailingAnchor];
  v4 = [v15 constraintEqualToAnchor:v14];
  v38[5] = v4;
  v5 = [(UGCPhotoThumbnailBadgeView *)self->_badgeView bottomAnchor];
  v6 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v7 = [v6 bottomAnchor];
  objc_super v8 = [v5 constraintEqualToAnchor:v7];
  v38[6] = v8;
  v9 = [(UGCPhotoThumbnailBadgeView *)self->_badgeView topAnchor];
  v10 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  v11 = [v10 topAnchor];
  v12 = [v9 constraintGreaterThanOrEqualToAnchor:v11];
  v38[7] = v12;
  v13 = +[NSArray arrayWithObjects:v38 count:8];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = [(UGCPhotoThumbnailCollectionViewCell *)self photoImageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setProviderName:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_providerName, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    providerName = self->_providerName;
    self->_providerName = v4;

    [(UGCPhotoThumbnailCollectionViewCell *)self _updateBadge];
    [(UGCPhotoThumbnailBadgeView *)self->_badgeView setHidden:[(NSString *)self->_providerName length] == 0];
  }
}

- (void)_updateBadge
{
  if ([(NSString *)self->_providerName length])
  {
    id v3 = objc_alloc((Class)NSAttributedString);
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"%@ %@ [Badge format]" value:@"localized string not found" table:0];
    id v6 = [v3 initWithString:v5];

    id v7 = [objc_alloc((Class)NSAttributedString) initWithString:self->_providerName];
    id v8 = objc_alloc_init((Class)NSTextAttachment);
    v9 = +[UGCPhotoThumbnailBadgeView attributionFont];
    v10 = +[UIImageSymbolConfiguration configurationWithFont:v9];
    v11 = +[UIImage systemImageNamed:@"arrow.up.right.square.fill" withConfiguration:v10];
    [v8 setImage:v11];

    v12 = +[NSAttributedString attributedStringWithAttachment:v8];
    v13 = +[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v6, v7, v12);
    v19[0] = NSFontAttributeName;
    v14 = +[UGCPhotoThumbnailBadgeView attributionFont];
    v20[0] = v14;
    v19[1] = NSForegroundColorAttributeName;
    v15 = +[UIColor whiteColor];
    v20[1] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v13 addAttributes:v16 range:0, [v13 length]];

    id v17 = [v13 copy];
    [(UGCPhotoThumbnailBadgeView *)self->_badgeView setAttributedText:v17];
  }
  else
  {
    badgeView = self->_badgeView;
    [(UGCPhotoThumbnailBadgeView *)badgeView setAttributedText:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UGCPhotoThumbnailCollectionViewCell;
  id v4 = a3;
  [(UGCPhotoThumbnailCollectionViewCell *)&v9 traitCollectionDidChange:v4];
  id v5 = [(UGCPhotoThumbnailCollectionViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(UGCPhotoThumbnailCollectionViewCell *)self _updateBadge];
  }
}

+ (NSString)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)UGCPhotoThumbnailCollectionViewCell;
  [(UGCPhotoThumbnailCollectionViewCell *)&v5 prepareForReuse];
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = 0;

  [(UIImageView *)self->_photoImageView setImage:0];
  providerName = self->_providerName;
  self->_providerName = 0;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (UIImageView)photoImageView
{
  return self->_photoImageView;
}

- (void)setPhotoImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoImageView, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);

  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end