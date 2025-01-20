@interface ICAudioBarView
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (CALayer)borderLayer;
- (ICAudioBarView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)heightConstraint;
- (UIButton)doneButton;
- (double)height;
- (double)oldWidth;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)layoutSubviews;
- (void)setBorderLayer:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setHeight:(double)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setOldWidth:(double)a3;
- (void)setupConstraints;
- (void)updateLayoutMargins;
@end

@implementation ICAudioBarView

- (id)accessibilityElements
{
  v2 = [(ICAudioBarView *)self _accessibleSubviews];
  v3 = [v2 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_13];

  return v3;
}

uint64_t __60__ICAudioBarView_ICAccessibility_iOS__accessibilityElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 accessibilityFrame];
  double v7 = v6;
  [v5 accessibilityFrame];
  if (v7 >= v8)
  {
    [v4 accessibilityFrame];
    double v11 = v10;
    [v5 accessibilityFrame];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Audio playback bar" value:&stru_26C10E100 table:0];

  return v3;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (ICAudioBarView)initWithFrame:(CGRect)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)ICAudioBarView;
  v3 = -[ICAudioBarView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
    id v5 = objc_msgSend(v4, "ic_resolvedColorForNoteEditor");
    [(ICAudioBarView *)v3 setBackgroundColor:v5];

    [(ICAudioBarView *)v3 setPreservesSuperviewLayoutMargins:1];
    double v6 = objc_msgSend(MEMORY[0x263F824F0], "ic_plainButtonConfiguration");
    double v7 = objc_msgSend(MEMORY[0x263F827E8], "ic_largeSystemImageNamed:", @"xmark.circle.fill");
    [v6 setImage:v7];

    double v8 = [MEMORY[0x263F825C8] systemGray3Color];
    [v6 setBaseForegroundColor:v8];

    uint64_t v9 = [MEMORY[0x263F824E8] buttonWithConfiguration:v6 primaryAction:0];
    objc_msgSend(v9, "setIc_preferredContentSizeCategory:", *MEMORY[0x263F83470]);
    [(ICAudioBarView *)v3 setDoneButton:v9];
    [(ICAudioBarView *)v3 addSubview:v9];
    [(ICAudioBarView *)v3 setupConstraints];
    [(ICAudioBarView *)v3 updateLayoutMargins];
    double v10 = [MEMORY[0x263F157E8] layer];
    [(ICAudioBarView *)v3 setBorderLayer:v10];
    double v11 = [(ICAudioBarView *)v3 layer];
    [v11 addSublayer:v10];

    v16[0] = objc_opt_class();
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    id v13 = (id)[(ICAudioBarView *)v3 registerForTraitChanges:v12 withAction:sel_updateLayoutMargins];
  }
  return v3;
}

- (void)setHeight:(double)a3
{
  id v4 = [(ICAudioBarView *)self heightConstraint];
  [v4 setConstant:a3];
}

- (double)height
{
  v2 = [(ICAudioBarView *)self heightConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setupConstraints
{
  [(ICAudioBarView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  double v3 = [MEMORY[0x263F08938] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:45.0];
  [(ICAudioBarView *)self setHeightConstraint:v3];

  double v4 = [(ICAudioBarView *)self heightConstraint];
  [(ICAudioBarView *)self addConstraint:v4];

  id v5 = [(ICAudioBarView *)self doneButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = (void *)MEMORY[0x263F08938];
  double v7 = [(ICAudioBarView *)self doneButton];
  double v8 = [v6 constraintWithItem:v7 attribute:6 relatedBy:0 toItem:self attribute:18 multiplier:1.0 constant:0.0];
  [(ICAudioBarView *)self addConstraint:v8];

  uint64_t v9 = (void *)MEMORY[0x263F08938];
  id v11 = [(ICAudioBarView *)self doneButton];
  double v10 = [v9 constraintWithItem:v11 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [(ICAudioBarView *)self addConstraint:v10];
}

- (void)updateLayoutMargins
{
  double v3 = [(ICAudioBarView *)self traitCollection];
  if ([v3 horizontalSizeClass] != 2) {
    [MEMORY[0x263F5AE70] isLargerCompactHorizontalWidthDevice];
  }

  [(ICAudioBarView *)self directionalLayoutMargins];

  [(ICAudioBarView *)self setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)ICAudioBarView;
  [(ICAudioBarView *)&v17 layoutSubviews];
  [(ICAudioBarView *)self bounds];
  double Width = CGRectGetWidth(v18);
  [(ICAudioBarView *)self oldWidth];
  if (Width != v4) {
    [(ICAudioBarView *)self updateLayoutMargins];
  }
  [(ICAudioBarView *)self ic_hairlineWidth];
  double v6 = v5;
  double v7 = [(ICAudioBarView *)self safeAreaLayoutGuide];
  [v7 layoutFrame];
  double v9 = v8;
  double v11 = v10;

  [(ICAudioBarView *)self bounds];
  CGFloat v12 = CGRectGetMaxY(v19) - v6;
  id v13 = [(ICAudioBarView *)self borderLayer];
  objc_msgSend(v13, "setFrame:", v9, v12, v11, v6);

  id v14 = [MEMORY[0x263F825C8] separatorColor];
  uint64_t v15 = [v14 CGColor];
  v16 = [(ICAudioBarView *)self borderLayer];
  [v16 setBackgroundColor:v15];

  [(ICAudioBarView *)self setOldWidth:Width];
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (double)oldWidth
{
  return self->_oldWidth;
}

- (void)setOldWidth:(double)a3
{
  self->_olddouble Width = a3;
}

- (CALayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);

  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end