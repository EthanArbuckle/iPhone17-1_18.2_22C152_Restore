@interface SBTraitsOrientedContentViewControllerView
- (BOOL)_counterTransformedToIdentityForContainerChange;
- (CGRect)contentViewBoundsInReferenceSpace;
- (NSString)description;
- (SBTraitsOrientedContentViewControllerView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)contentView;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setDebugColorsEnabled:(BOOL)a3;
- (void)addOverlayView:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewBoundsInReferenceSpace:(CGRect)a3;
@end

@implementation SBTraitsOrientedContentViewControllerView

- (void)setContentViewBoundsInReferenceSpace:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentViewBoundsInReferenceSpace = &self->_contentViewBoundsInReferenceSpace;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], a3))
  {
    p_contentViewBoundsInReferenceSpace->origin.CGFloat x = 0.0;
    self->_contentViewBoundsInReferenceSpace.origin.CGFloat y = 0.0;
    self->_contentViewBoundsInReferenceSpace.size = (CGSize)xmmword_1D8FD1A20;
  }
  else
  {
    v10.origin.CGFloat x = p_contentViewBoundsInReferenceSpace->origin.x;
    v10.origin.CGFloat y = self->_contentViewBoundsInReferenceSpace.origin.y;
    v10.size.CGFloat width = self->_contentViewBoundsInReferenceSpace.size.width;
    v10.size.CGFloat height = self->_contentViewBoundsInReferenceSpace.size.height;
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    if (!CGRectEqualToRect(v10, v11))
    {
      p_contentViewBoundsInReferenceSpace->origin.CGFloat x = x;
      self->_contentViewBoundsInReferenceSpace.origin.CGFloat y = y;
      self->_contentViewBoundsInReferenceSpace.size.CGFloat width = width;
      self->_contentViewBoundsInReferenceSpace.size.CGFloat height = height;
    }
  }
  [(SBTraitsOrientedContentViewControllerView *)self setNeedsLayout];
}

- (SBTraitsOrientedContentViewControllerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBTraitsOrientedContentViewControllerView;
  v7 = -[SBTraitsOrientedContentViewControllerView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[SBTraitsDirectionalRotationView initWithFrame:]([SBTraitsDirectionalRotationView alloc], "initWithFrame:", x, y, width, height);
    contentRotationView = v7->_contentRotationView;
    v7->_contentRotationView = v8;

    [(SBTraitsOrientedContentViewControllerView *)v7 addSubview:v7->_contentRotationView];
    [(SBTraitsOrientedContentViewControllerView *)v7 setContentView:0];
    -[SBTraitsOrientedContentViewControllerView setContentViewBoundsInReferenceSpace:](v7, "setContentViewBoundsInReferenceSpace:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  return v7;
}

- (void)setContentView:(id)a3
{
  v4 = (UIView *)a3;
  if (!v4 || self->_contentView != v4)
  {
    v23 = v4;
    if (v4)
    {
      [(SBTraitsOrientedContentViewControllerView *)self bs_setHitTestingDisabled:0];
      v5 = [(SBTraitsOrientedContentViewControllerView *)self window];
      objc_msgSend(v5, "bs_setHitTestingDisabled:", 0);

      [(UIView *)self->_contentView removeFromSuperview];
      [(UILabel *)self->_placeholderLabel removeFromSuperview];
      placeholderLabel = self->_placeholderLabel;
      self->_placeholderLabel = 0;

      contentView = self->_contentView;
      self->_contentView = 0;

      v8 = v23;
      v9 = self->_contentView;
      self->_contentView = v8;
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4FA6028]);
      double v11 = *MEMORY[0x1E4F1DB28];
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v15 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
      v16 = self->_contentView;
      self->_contentView = v15;

      v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v11, v12, v13, v14);
      v18 = self->_placeholderLabel;
      self->_placeholderLabel = v17;

      v19 = self->_placeholderLabel;
      v20 = [MEMORY[0x1E4F428B8] whiteColor];
      [(UILabel *)v19 setTextColor:v20];

      v21 = self->_placeholderLabel;
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"<%p>", self);
      [(UILabel *)v21 setText:v22];

      [(UILabel *)self->_placeholderLabel setNumberOfLines:8];
      [(UILabel *)self->_placeholderLabel sizeToFit];
      [(UIView *)self->_contentView addSubview:self->_placeholderLabel];
      [(SBTraitsOrientedContentViewControllerView *)self bs_setHitTestingDisabled:1];
      v9 = [(SBTraitsOrientedContentViewControllerView *)self window];
      objc_msgSend(v9, "bs_setHitTestingDisabled:", 1);
    }

    [(SBTraitsOrientedContentViewControllerView *)self _setDebugColorsEnabled:v23 == 0];
    [(SBTraitsDirectionalRotationView *)self->_contentRotationView addSubview:self->_contentView];
    [(SBTraitsOrientedContentViewControllerView *)self setNeedsLayout];
    v4 = v23;
  }
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v9 = v5;
    if (backgroundView)
    {
      [(UIView *)backgroundView removeFromSuperview];
      v8 = *p_backgroundView;
      *p_backgroundView = 0;
    }
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v5 = v9;
    if (v9)
    {
      [(SBTraitsOrientedContentViewControllerView *)self insertSubview:*p_backgroundView atIndex:0];
      v5 = v9;
    }
  }
}

- (void)addOverlayView:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_overlayView)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    overlayView = self->_overlayView;
    self->_overlayView = v6;

    [(SBTraitsOrientedContentViewControllerView *)self addSubview:self->_overlayView];
    [(SBTraitsOrientedContentViewControllerView *)self bringSubviewToFront:self->_overlayView];
  }
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_overlayView addSubview:v4];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(UIView *)self->_overlayView leadingAnchor];
  v20 = [v4 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v22[0] = v19;
  v18 = [(UIView *)self->_overlayView trailingAnchor];
  v8 = [v4 trailingAnchor];
  v9 = [v18 constraintEqualToAnchor:v8];
  v22[1] = v9;
  id v10 = [(UIView *)self->_overlayView topAnchor];
  double v11 = [v4 topAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v22[2] = v12;
  double v13 = [(UIView *)self->_overlayView bottomAnchor];
  double v14 = [v4 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v22[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  [v17 activateConstraints:v16];
}

- (void)setContentOrientation:(int64_t)a3
{
  if (self->_contentOrientation != a3)
  {
    self->_contentOrientation = a3;
    [(SBTraitsOrientedContentViewControllerView *)self setNeedsLayout];
  }
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    [(SBTraitsOrientedContentViewControllerView *)self setNeedsLayout];
  }
}

- (void)setClipsToBounds:(BOOL)a3
{
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)SBTraitsOrientedContentViewControllerView;
  [(SBTraitsOrientedContentViewControllerView *)&v31 layoutSubviews];
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  id v4 = [v3 fixedCoordinateSpace];
  id v5 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:1 withReferenceCoordinateSpace:v4 inOrientation:1];

  v6 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v5, self->_contentViewBoundsInReferenceSpace.origin.x, self->_contentViewBoundsInReferenceSpace.origin.y, self->_contentViewBoundsInReferenceSpace.size.width, self->_contentViewBoundsInReferenceSpace.size.height);
  v7 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:self->_contentOrientation withReferenceCoordinateSpace:v6 inOrientation:1];
  contentRotationView = self->_contentRotationView;
  [v7 bounds];
  -[SBTraitsDirectionalRotationView setBounds:](contentRotationView, "setBounds:");
  contentView = self->_contentView;
  [(SBTraitsDirectionalRotationView *)self->_contentRotationView bounds];
  -[UIView setBounds:](contentView, "setBounds:");
  overlayView = self->_overlayView;
  [v7 bounds];
  -[UIView setBounds:](overlayView, "setBounds:");
  backgroundView = self->_backgroundView;
  [v7 bounds];
  -[UIView setBounds:](backgroundView, "setBounds:");
  [(_UIDirectionalRotationView *)self->_contentRotationView setCounterTransformView:[(SBTraitsOrientedContentViewControllerView *)self _counterTransformedToIdentityForContainerChange]];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  SBFTransformFromOrientationToOrientation();
  double v12 = self->_contentRotationView;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  [(SBTraitsDirectionalRotationView *)v12 setTransform:&v25];
  double v13 = self->_backgroundView;
  long long v25 = v28;
  long long v26 = v29;
  long long v27 = v30;
  [(UIView *)v13 setTransform:&v25];
  double v14 = self->_overlayView;
  long long v25 = v28;
  long long v26 = v29;
  long long v27 = v30;
  [(UIView *)v14 setTransform:&v25];
  self->_previousContainerLayoutOrientation = self->_containerOrientation;
  self->_previousContentLayoutOrientation = self->_contentOrientation;
  v15 = self->_contentRotationView;
  [(SBTraitsOrientedContentViewControllerView *)self bounds];
  UIRectGetCenter();
  -[SBTraitsDirectionalRotationView setCenter:](v15, "setCenter:");
  v16 = self->_contentView;
  [(SBTraitsDirectionalRotationView *)self->_contentRotationView bounds];
  UIRectGetCenter();
  -[UIView setCenter:](v16, "setCenter:");
  v17 = self->_backgroundView;
  [(SBTraitsOrientedContentViewControllerView *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](v17, "setCenter:");
  v18 = self->_overlayView;
  [(SBTraitsOrientedContentViewControllerView *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](v18, "setCenter:");
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    v20 = NSString;
    v21 = BSInterfaceOrientationDescription();
    v22 = BSInterfaceOrientationDescription();
    v23 = [v20 stringWithFormat:@"<%p>\ncontainer:\n%@\n\ncontent:\n%@", self, v21, v22];
    [(UILabel *)placeholderLabel setText:v23];

    [(UILabel *)self->_placeholderLabel sizeToFit];
    v24 = self->_placeholderLabel;
    [(UIView *)self->_contentView bounds];
    UIRectGetCenter();
    -[UILabel setCenter:](v24, "setCenter:");
  }
}

- (BOOL)_counterTransformedToIdentityForContainerChange
{
  int64_t previousContainerLayoutOrientation = self->_previousContainerLayoutOrientation;
  int64_t containerOrientation = self->_containerOrientation;
  if (previousContainerLayoutOrientation == containerOrientation) {
    return 0;
  }
  int64_t previousContentLayoutOrientation = self->_previousContentLayoutOrientation;
  if (previousContentLayoutOrientation != self->_contentOrientation) {
    return 0;
  }
  BOOL v5 = (unint64_t)(previousContainerLayoutOrientation - 1) <= 1
    && (unint64_t)(previousContentLayoutOrientation - 1) < 2;
  if ((unint64_t)(previousContainerLayoutOrientation - 3) <= 1) {
    BOOL v6 = (unint64_t)(previousContentLayoutOrientation - 3) < 2;
  }
  else {
    BOOL v6 = v5;
  }
  BOOL v7 = previousContainerLayoutOrientation != previousContentLayoutOrientation && v6;
  return previousContentLayoutOrientation == containerOrientation && v7;
}

- (void)_setDebugColorsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBTraitsOrientedContentViewControllerView *)self layer];
  if (v3)
  {
    id v6 = [MEMORY[0x1E4F428B8] blueColor];
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    BOOL v7 = [(SBTraitsDirectionalRotationView *)self->_contentRotationView layer];
    id v8 = [MEMORY[0x1E4F428B8] greenColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    v9 = [(UIView *)self->_contentView layer];
    id v10 = [MEMORY[0x1E4F428B8] magentaColor];
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    double v11 = [(SBTraitsOrientedContentViewControllerView *)self layer];
    [v11 setBorderWidth:2.0];

    double v12 = [(SBTraitsDirectionalRotationView *)self->_contentRotationView layer];
    [v12 setBorderWidth:3.0];

    double v13 = [(UIView *)self->_contentView layer];
    [v13 setBorderWidth:1.0];

    contentView = self->_contentView;
    v15 = [MEMORY[0x1E4F428B8] colorWithRed:0.0392156863 green:0.784313725 blue:0.0784313725 alpha:0.6];
    [(UIView *)contentView setBackgroundColor:v15];

    [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.8];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F428B8] clearColor];
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    v17 = [(SBTraitsDirectionalRotationView *)self->_contentRotationView layer];
    id v18 = [MEMORY[0x1E4F428B8] clearColor];
    objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

    v19 = [(UIView *)self->_contentView layer];
    id v20 = [MEMORY[0x1E4F428B8] clearColor];
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    v21 = [(SBTraitsOrientedContentViewControllerView *)self layer];
    [v21 setBorderWidth:0.0];

    v22 = [(UIView *)self->_contentView layer];
    [v22 setBorderWidth:0.0];

    v23 = [(SBTraitsDirectionalRotationView *)self->_contentRotationView layer];
    [v23 setBorderWidth:0.0];

    [MEMORY[0x1E4F428B8] clearColor];
  }
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [(SBTraitsOrientedContentViewControllerView *)self setBackgroundColor:v24];
}

- (id)succinctDescription
{
  v2 = [(SBTraitsOrientedContentViewControllerView *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = SBFStringForBSInterfaceOrientation();
  BOOL v7 = SBFStringForBSInterfaceOrientation();
  id v8 = [v3 stringWithFormat:@"<%@:%p container: %@, content: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = SBFStringForBSInterfaceOrientation();
  [v3 appendString:v4 withName:@"containerOrientation"];

  BOOL v5 = SBFStringForBSInterfaceOrientation();
  [v3 appendString:v5 withName:@"contentOrientation"];

  id v6 = NSStringFromCGRect(self->_contentViewBoundsInReferenceSpace);
  [v3 appendString:v6 withName:@"contentReferenceBounds"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBTraitsOrientedContentViewControllerView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (CGRect)contentViewBoundsInReferenceSpace
{
  double x = self->_contentViewBoundsInReferenceSpace.origin.x;
  double y = self->_contentViewBoundsInReferenceSpace.origin.y;
  double width = self->_contentViewBoundsInReferenceSpace.size.width;
  double height = self->_contentViewBoundsInReferenceSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRotationView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end