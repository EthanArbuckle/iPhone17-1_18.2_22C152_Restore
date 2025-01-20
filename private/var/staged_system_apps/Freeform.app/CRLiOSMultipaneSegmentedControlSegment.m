@interface CRLiOSMultipaneSegmentedControlSegment
+ (id)segmentWithImage:(id)a3 edgeInsets:(UIEdgeInsets)a4;
+ (id)segmentWithObject:(id)a3 edgeInsets:(UIEdgeInsets)a4;
+ (id)segmentWithString:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (BOOL)isEnabled;
- (CRLiOSMultipaneSegmentedControlSegment)initWithType:(int64_t)a3 title:(id)a4 image:(id)a5 edgeInsets:(UIEdgeInsets)a6;
- (NSLayoutConstraint)distanceBetweenPreviousAndNextSegmentConstraint;
- (NSLayoutConstraint)equalWidthConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSLayoutDimension)distanceToPreviousTrailingAnchor;
- (NSLayoutXAxisAnchor)previousTrailingAnchor;
- (NSString)title;
- (UIButton)button;
- (UIEdgeInsets)edgeInsets;
- (UIImage)image;
- (double)width;
- (int64_t)type;
- (void)setButton:(id)a3;
- (void)setDistanceBetweenPreviousAndNextSegmentConstraint:(id)a3;
- (void)setDistanceToPreviousTrailingAnchor:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEqualWidthConstraint:(id)a3;
- (void)setImage:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setPreviousTrailingAnchor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setWidth:(double)a3;
- (void)setWidthConstraint:(id)a3;
- (void)updateAccessibilityLabel;
@end

@implementation CRLiOSMultipaneSegmentedControlSegment

- (CRLiOSMultipaneSegmentedControlSegment)initWithType:(int64_t)a3 title:(id)a4 image:(id)a5 edgeInsets:(UIEdgeInsets)a6
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  id v14 = a4;
  id v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLiOSMultipaneSegmentedControlSegment;
  v16 = [(CRLiOSMultipaneSegmentedControlSegment *)&v22 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_title, a4);
    uint64_t v18 = [v15 imageWithRenderingMode:2];
    image = v17->_image;
    v17->_image = (UIImage *)v18;

    v20 = [v15 accessibilityLabel];
    [(UIImage *)v17->_image setAccessibilityLabel:v20];

    v17->_width = 0.0;
    v17->_edgeInsets.CGFloat top = top;
    v17->_edgeInsets.CGFloat left = left;
    v17->_edgeInsets.CGFloat bottom = bottom;
    v17->_edgeInsets.CGFloat right = right;
    v17->_enabled = 1;
    [(CRLiOSMultipaneSegmentedControlSegment *)v17 updateAccessibilityLabel];
  }

  return v17;
}

+ (id)segmentWithString:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithType:0 title:v9 image:0 edgeInsets:top, left, bottom, right];

  return v10;
}

+ (id)segmentWithImage:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithType:1 title:0 image:v9 edgeInsets:top, left, bottom, right];

  return v10;
}

+ (id)segmentWithObject:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v11 = sub_1002469D0(v10, v9);
  if (v11)
  {
    v12 = [a1 segmentWithString:v11 edgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    id v14 = sub_1002469D0(v13, v9);
    if (v14)
    {
      v12 = [a1 segmentWithImage:v14 edgeInsets:UIEdgeInsetsMake(top, left, bottom, right)];
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)setTitle:(id)a3
{
  self->_type = 0;
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  image = self->_image;
  self->_image = 0;

  [(CRLiOSMultipaneSegmentedControlSegment *)self updateAccessibilityLabel];
}

- (void)setImage:(id)a3
{
  title = self->_title;
  self->_type = 1;
  self->_title = 0;
  id v5 = a3;

  v6 = [v5 imageWithRenderingMode:2];

  image = self->_image;
  self->_image = v6;

  [(CRLiOSMultipaneSegmentedControlSegment *)self updateAccessibilityLabel];
}

- (void)updateAccessibilityLabel
{
  if (self->_type)
  {
    v3 = [(UIImage *)self->_image accessibilityLabel];
  }
  else
  {
    v3 = self->_title;
  }
  v4 = v3;
  [(CRLiOSMultipaneSegmentedControlSegment *)self setAccessibilityLabel:v3];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)equalWidthConstraint
{
  return self->_equalWidthConstraint;
}

- (void)setEqualWidthConstraint:(id)a3
{
}

- (NSLayoutXAxisAnchor)previousTrailingAnchor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousTrailingAnchor);

  return (NSLayoutXAxisAnchor *)WeakRetained;
}

- (void)setPreviousTrailingAnchor:(id)a3
{
}

- (NSLayoutDimension)distanceToPreviousTrailingAnchor
{
  return self->_distanceToPreviousTrailingAnchor;
}

- (void)setDistanceToPreviousTrailingAnchor:(id)a3
{
}

- (NSLayoutConstraint)distanceBetweenPreviousAndNextSegmentConstraint
{
  return self->_distanceBetweenPreviousAndNextSegmentConstraint;
}

- (void)setDistanceBetweenPreviousAndNextSegmentConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceBetweenPreviousAndNextSegmentConstraint, 0);
  objc_storeStrong((id *)&self->_distanceToPreviousTrailingAnchor, 0);
  objc_destroyWeak((id *)&self->_previousTrailingAnchor);
  objc_storeStrong((id *)&self->_equalWidthConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end