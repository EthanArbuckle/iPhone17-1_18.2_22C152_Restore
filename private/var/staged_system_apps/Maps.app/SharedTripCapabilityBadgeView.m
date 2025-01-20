@interface SharedTripCapabilityBadgeView
- (SharedTripCapabilityBadgeView)init;
- (UIImageView)imageView;
- (unint64_t)capabilityType;
- (void)_setAccessibilityIdentifier;
- (void)_updateImage;
- (void)setCapabilityType:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SharedTripCapabilityBadgeView

- (SharedTripCapabilityBadgeView)init
{
  v27.receiver = self;
  v27.super_class = (Class)SharedTripCapabilityBadgeView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v5 = -[SharedTripCapabilityBadgeView initWithFrame:](&v27, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1144750080;
    [(SharedTripCapabilityBadgeView *)v5 setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v8) = 1144750080;
    [(SharedTripCapabilityBadgeView *)v7 setContentCompressionResistancePriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(SharedTripCapabilityBadgeView *)v7 setContentHuggingPriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [(SharedTripCapabilityBadgeView *)v7 setContentHuggingPriority:1 forAxis:v10];
    v7->_capabilityType = 0;
    v11 = -[AutolayoutImageView initWithFrame:]([AutolayoutImageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = &v11->super;

    [(UIImageView *)v7->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v7->_imageView setContentMode:1];
    [(SharedTripCapabilityBadgeView *)v7 addSubview:v7->_imageView];
    v13 = [(SharedTripCapabilityBadgeView *)v7 heightAnchor];
    uint64_t v14 = [v13 constraintEqualToConstant:22.0];
    heightConstraint = v7->_heightConstraint;
    v7->_heightConstraint = (NSLayoutConstraint *)v14;

    id v16 = objc_alloc_init((Class)NSMutableArray);
    [v16 addObject:v7->_heightConstraint];
    v17 = [(UIImageView *)v7->_imageView _maps_constraintsForCenteringInView:v7];
    [v16 addObjectsFromArray:v17];

    +[NSLayoutConstraint activateConstraints:v16];
    v18 = [(SharedTripCapabilityBadgeView *)v7 layer];
    [v18 setMasksToBounds:0];

    v19 = [(SharedTripCapabilityBadgeView *)v7 layer];
    [v19 setShadowOffset:0.0, 2.0];

    id v20 = +[UIColor systemBlackColor];
    id v21 = [v20 CGColor];
    v22 = [(SharedTripCapabilityBadgeView *)v7 layer];
    [v22 setShadowColor:v21];

    v23 = [(SharedTripCapabilityBadgeView *)v7 layer];
    LODWORD(v24) = 1036831949;
    [v23 setShadowOpacity:v24];

    v25 = [(SharedTripCapabilityBadgeView *)v7 layer];
    [v25 setShadowRadius:5.0];

    [(SharedTripCapabilityBadgeView *)v7 _updateImage];
  }
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SharedTripCapabilityBadgeView;
  [(SharedTripCapabilityBadgeView *)&v10 traitCollectionDidChange:v4];
  v5 = [(SharedTripCapabilityBadgeView *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];
  if (v6 == [v4 userInterfaceIdiom])
  {
    v7 = [(SharedTripCapabilityBadgeView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];
    id v9 = [v4 userInterfaceStyle];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(SharedTripCapabilityBadgeView *)self _updateImage];
LABEL_6:
}

- (void)setCapabilityType:(unint64_t)a3
{
  self->_capabilityType = a3;
  [(SharedTripCapabilityBadgeView *)self _updateImage];
}

- (void)_updateImage
{
  v3 = [(SharedTripCapabilityBadgeView *)self traitCollection];
  [v3 userInterfaceIdiom];

  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
  unint64_t capabilityType = self->_capabilityType;
  if (capabilityType - 2 < 2)
  {
    v5 = [(SharedTripCapabilityBadgeView *)self traitCollection];
    [v5 displayScale];
    CFStringRef v6 = @"com.apple.MobileSMS";
LABEL_5:
    +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (capabilityType == 4)
  {
    CFStringRef v7 = (const __CFString *)MapsAppBundleId;
    v5 = [(SharedTripCapabilityBadgeView *)self traitCollection];
    [v5 displayScale];
    CFStringRef v6 = v7;
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:
  [(UIImageView *)self->_imageView setImage:v8];
  [(SharedTripCapabilityBadgeView *)self _setAccessibilityIdentifier];
  [(SharedTripCapabilityBadgeView *)self invalidateIntrinsicContentSize];
}

- (void)_setAccessibilityIdentifier
{
  unint64_t v2 = self->_capabilityType - 2;
  if (v2 > 2) {
    CFStringRef v3 = @"SharedTripCapabilityBadge.Unknown";
  }
  else {
    CFStringRef v3 = off_1012EF4E8[v2];
  }
  [(UIImageView *)self->_imageView setAccessibilityIdentifier:v3];
}

- (unint64_t)capabilityType
{
  return self->_capabilityType;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end