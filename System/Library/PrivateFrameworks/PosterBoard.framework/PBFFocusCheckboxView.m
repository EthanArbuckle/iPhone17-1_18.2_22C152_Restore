@interface PBFFocusCheckboxView
- (BOOL)isOn;
- (CGSize)intrinsicContentSize;
- (NSString)associatedPosterIdentifier;
- (PBFFocusCheckboxView)init;
- (void)_updateAccessibilityAttributes;
- (void)_updateColors;
- (void)setAssociatedPosterIdentifier:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PBFFocusCheckboxView

- (PBFFocusCheckboxView)init
{
  v41[6] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PBFFocusCheckboxView;
  v2 = [(PBFFocusCheckboxView *)&v40 init];
  v3 = v2;
  if (v2)
  {
    [(PBFFocusCheckboxView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4 = objc_alloc_init(_TtC11PosterBoard13PBFCircleView);
    circleView = v3->_circleView;
    v3->_circleView = v4;

    [(PBFCircleView *)v3->_circleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PBFCircleView *)v3->_circleView setStrokeWidth:3.0];
    v6 = v3->_circleView;
    v7 = [MEMORY[0x1E4FB1618] systemGray3Color];
    [(PBFCircleView *)v6 setStrokeColor:v7];

    v8 = v3->_circleView;
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PBFCircleView *)v8 setFillColor:v9];

    v10 = [(PBFCircleView *)v3->_circleView layer];
    [v10 setShadowOpacity:0.0];

    v11 = [(PBFCircleView *)v3->_circleView layer];
    [v11 setShadowRadius:2.0];

    v12 = [(PBFCircleView *)v3->_circleView layer];
    objc_msgSend(v12, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    [(PBFFocusCheckboxView *)v3 addSubview:v3->_circleView];
    v39 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:15.0];
    v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v39];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v38];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v13;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setHidden:1];
    v15 = v3->_imageView;
    v16 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v15 setTintColor:v16];

    [(PBFFocusCheckboxView *)v3 addSubview:v3->_imageView];
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [(PBFCircleView *)v3->_circleView leadingAnchor];
    v36 = [(PBFFocusCheckboxView *)v3 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:4.0];
    v41[0] = v35;
    v34 = [(PBFCircleView *)v3->_circleView trailingAnchor];
    v33 = [(PBFFocusCheckboxView *)v3 trailingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:-4.0];
    v41[1] = v32;
    v30 = [(PBFCircleView *)v3->_circleView topAnchor];
    v29 = [(PBFFocusCheckboxView *)v3 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:4.0];
    v41[2] = v28;
    v27 = [(PBFCircleView *)v3->_circleView bottomAnchor];
    v17 = [(PBFFocusCheckboxView *)v3 bottomAnchor];
    v18 = [v27 constraintEqualToAnchor:v17 constant:-4.0];
    v41[3] = v18;
    v19 = [(UIImageView *)v3->_imageView centerXAnchor];
    v20 = [(PBFFocusCheckboxView *)v3 centerXAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v41[4] = v21;
    v22 = [(UIImageView *)v3->_imageView centerYAnchor];
    v23 = [(PBFFocusCheckboxView *)v3 centerYAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v41[5] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
    [v31 activateConstraints:v25];
  }
  return v3;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    v4 = [(PBFCircleView *)self->_circleView layer];
    v5 = v4;
    LODWORD(v6) = 1046562734;
    if (!self->_on) {
      *(float *)&double v6 = 0.0;
    }
    [v4 setShadowOpacity:v6];

    [(UIImageView *)self->_imageView setHidden:!self->_on];
    [(PBFFocusCheckboxView *)self _updateColors];
    [(PBFFocusCheckboxView *)self _updateAccessibilityAttributes];
  }
}

- (void)_updateColors
{
  if (self->_on)
  {
    v3 = [(PBFFocusCheckboxView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    circleView = self->_circleView;
    if (v4 == 2) {
      [MEMORY[0x1E4FB1618] systemGray3Color];
    }
    else {
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    [(PBFCircleView *)circleView setStrokeColor:v10];

    v8 = self->_circleView;
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else
  {
    double v6 = self->_circleView;
    v7 = [MEMORY[0x1E4FB1618] systemGray3Color];
    [(PBFCircleView *)v6 setStrokeColor:v7];

    v8 = self->_circleView;
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  id v11 = (id)v9;
  -[PBFCircleView setFillColor:](v8, "setFillColor:");
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PBFFocusCheckboxView;
  id v4 = a3;
  [(PBFFocusCheckboxView *)&v7 traitCollectionDidChange:v4];
  v5 = [(PBFFocusCheckboxView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PBFFocusCheckboxView *)self _updateColors];
  }
}

- (void)setAssociatedPosterIdentifier:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    associatedPosterIdentifier = self->_associatedPosterIdentifier;
    self->_associatedPosterIdentifier = v4;

    [(PBFFocusCheckboxView *)self _updateAccessibilityAttributes];
  }
}

- (void)_updateAccessibilityAttributes
{
  if (self->_associatedPosterIdentifier)
  {
    -[PBFFocusCheckboxView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:");
    if ([(PBFFocusCheckboxView *)self isOn]) {
      uint64_t v3 = *MEMORY[0x1E4FB2590];
    }
    else {
      uint64_t v3 = 0;
    }
    [(PBFFocusCheckboxView *)self setAccessibilityTraits:v3];
  }
  else
  {
    -[PBFFocusCheckboxView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isOn
{
  return self->_on;
}

- (NSString)associatedPosterIdentifier
{
  return self->_associatedPosterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPosterIdentifier, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
}

@end