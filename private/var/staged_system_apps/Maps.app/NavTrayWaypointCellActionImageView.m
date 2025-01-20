@interface NavTrayWaypointCellActionImageView
- (CGSize)intrinsicContentSize;
- (NavTrayWaypointCellActionImageView)initWithImage:(id)a3 style:(id)a4 weight:(double)a5 sideLength:(double)a6;
@end

@implementation NavTrayWaypointCellActionImageView

- (NavTrayWaypointCellActionImageView)initWithImage:(id)a3 style:(id)a4 weight:(double)a5 sideLength:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v37.receiver = self;
  v37.super_class = (Class)NavTrayWaypointCellActionImageView;
  v13 = -[NavTrayWaypointCellActionImageView initWithFrame:](&v37, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v14 = v13;
  if (v13)
  {
    id v36 = v11;
    objc_storeStrong((id *)&v13->_image, a3);
    objc_storeStrong((id *)&v14->_style, a4);
    v14->_weight = a5;
    v14->_sideLength = a6;
    v15 = +[UIFont _preferredFontForTextStyle:v14->_style weight:v14->_weight];
    v16 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryLarge];
    v35 = [v15 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v16];

    id v17 = objc_alloc((Class)UIImageView);
    image = v14->_image;
    v19 = +[UIImageSymbolConfiguration configurationWithFont:v35];
    v20 = [(UIImage *)image imageByApplyingSymbolConfiguration:v19];
    v21 = (UIImageView *)[v17 initWithImage:v20];
    imageView = v14->_imageView;
    v14->_imageView = v21;

    [(UIImageView *)v14->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v14->_imageView setUserInteractionEnabled:0];
    [(UIImageView *)v14->_imageView setContentMode:4];
    [(NavTrayWaypointCellActionImageView *)v14 addSubview:v14->_imageView];
    v23 = [(UIImageView *)v14->_imageView centerXAnchor];
    v24 = [(NavTrayWaypointCellActionImageView *)v14 centerXAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v38[0] = v25;
    v26 = [(UIImageView *)v14->_imageView centerYAnchor];
    v27 = [(NavTrayWaypointCellActionImageView *)v14 centerYAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v38[1] = v28;
    +[NSArray arrayWithObjects:v38 count:2];
    v30 = id v29 = v12;
    +[NSLayoutConstraint activateConstraints:v30];

    id v12 = v29;
    v31 = +[UIColor tertiarySystemFillColor];
    [(NavTrayWaypointCellActionImageView *)v14 setBackgroundColor:v31];

    double v32 = v14->_sideLength * 0.5;
    v33 = [(NavTrayWaypointCellActionImageView *)v14 layer];
    [v33 setCornerRadius:v32];

    id v11 = v36;
    [(NavTrayWaypointCellActionImageView *)v14 setIsAccessibilityElement:1];
    [(NavTrayWaypointCellActionImageView *)v14 setAccessibilityTraits:UIAccessibilityTraitUpdatesFrequently | UIAccessibilityTraitAllowsDirectInteraction | UIAccessibilityTraitButton | UIAccessibilityTraitImage];
  }
  return v14;
}

- (CGSize)intrinsicContentSize
{
  double sideLength = self->_sideLength;
  double v3 = sideLength;
  result.height = v3;
  result.width = sideLength;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end