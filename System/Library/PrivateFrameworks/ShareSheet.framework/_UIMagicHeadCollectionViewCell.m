@interface _UIMagicHeadCollectionViewCell
- (NSArray)largeTextMHConstraints;
- (NSArray)regularMHConstraints;
- (SFMagicHeadWheelView)magicHeadWheelView;
- (UIView)magicHeadView;
- (void)_setupConstraints;
- (void)_updateMHForCurrentSizeCategory;
- (void)configureLayoutIfNeeded:(id)a3;
- (void)setLargeTextMHConstraints:(id)a3;
- (void)setMagicHeadView:(id)a3;
- (void)setMagicHeadWheelView:(id)a3;
- (void)setRegularMHConstraints:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDarkening;
@end

@implementation _UIMagicHeadCollectionViewCell

- (void)configureLayoutIfNeeded:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UIMagicHeadCollectionViewCell;
  id v4 = a3;
  [(UIAirDropGroupActivityCell *)&v14 configureLayoutIfNeeded:v4];
  uint64_t v5 = objc_msgSend(v4, "deviceClass", v14.receiver, v14.super_class);

  v6 = &regularHeight_0;
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    v6 = &compactHeight_0;
  }
  if (v5 == 3) {
    v6 = &regularHeight5_8Rounded_0;
  }
  layout_0 = (uint64_t)v6;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(_UIMagicHeadCollectionViewCell *)self setMagicHeadView:v7];

  v8 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  [v9 setAlpha:1.0];

  v10 = [(_UIMagicHeadCollectionViewCell *)self contentView];
  v11 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  [v10 addSubview:v11];

  v12 = [(_UIMagicHeadCollectionViewCell *)self contentView];
  v13 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  [v12 bringSubviewToFront:v13];

  [(_UIMagicHeadCollectionViewCell *)self _setupConstraints];
}

- (void)_setupConstraints
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v40 = [(_UIMagicHeadCollectionViewCell *)self contentView];
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 _referenceBounds];
  if (v4 >= 414.0)
  {
    v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v5 = 80.0;
    }
    else {
      double v5 = 84.0;
    }
  }
  else
  {
    double v5 = 80.0;
  }

  v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  v10 = [v9 widthAnchor];
  v11 = [v10 constraintEqualToConstant:v5];
  v43[0] = v11;
  v12 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  v13 = [v12 heightAnchor];
  objc_super v14 = [v13 constraintEqualToConstant:v5];
  v43[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v39 = [v8 arrayWithArray:v15];

  v16 = [(_UIMagicHeadCollectionViewCell *)self traitCollection];
  v17 = [v16 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

  v37 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  v18 = [v37 centerYAnchor];
  v19 = [v40 centerYAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v42[0] = v20;
  v21 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  v22 = [v21 centerXAnchor];
  v23 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v24 = [v23 centerXAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v42[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  [(_UIMagicHeadCollectionViewCell *)self setLargeTextMHConstraints:v26];

  v27 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  v28 = [v27 topAnchor];
  v29 = [v40 topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:*(double *)layout_0 + -9.0];
  v41[0] = v30;
  v31 = [(_UIMagicHeadCollectionViewCell *)self magicHeadView];
  v32 = [v31 centerXAnchor];
  v33 = [v40 centerXAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v41[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [(_UIMagicHeadCollectionViewCell *)self setRegularMHConstraints:v35];

  if (IsAccessibilityCategory) {
    [(_UIMagicHeadCollectionViewCell *)self largeTextMHConstraints];
  }
  else {
  v36 = [(_UIMagicHeadCollectionViewCell *)self regularMHConstraints];
  }
  [v39 addObjectsFromArray:v36];

  [MEMORY[0x1E4F28DC8] activateConstraints:v39];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIMagicHeadCollectionViewCell;
  id v4 = a3;
  [(UIAirDropGroupActivityCell *)&v8 traitCollectionDidChange:v4];
  double v5 = [(_UIMagicHeadCollectionViewCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(_UIMagicHeadCollectionViewCell *)self _updateMHForCurrentSizeCategory];
  }
}

- (void)_updateMHForCurrentSizeCategory
{
  v3 = [(_UIMagicHeadCollectionViewCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = (void *)MEMORY[0x1E4F28DC8];
  if (IsAccessibilityCategory)
  {
    uint64_t v7 = [(_UIMagicHeadCollectionViewCell *)self regularMHConstraints];
    [v6 deactivateConstraints:v7];

    objc_super v8 = (void *)MEMORY[0x1E4F28DC8];
    [(_UIMagicHeadCollectionViewCell *)self largeTextMHConstraints];
  }
  else
  {
    v9 = [(_UIMagicHeadCollectionViewCell *)self largeTextMHConstraints];
    [v6 deactivateConstraints:v9];

    objc_super v8 = (void *)MEMORY[0x1E4F28DC8];
    [(_UIMagicHeadCollectionViewCell *)self regularMHConstraints];
  v10 = };
  [v8 activateConstraints:v10];

  [(_UIMagicHeadCollectionViewCell *)self layoutIfNeeded];
}

- (void)updateDarkening
{
  v3 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  id v4 = [v3 layer];
  id v31 = [v4 contents];

  double v5 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  v6 = [v5 layer];
  uint64_t v7 = [v6 contents];

  objc_super v8 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v9 = [v8 layer];
  v10 = [v9 contents];

  v11 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v12 = [v11 layer];
  [v12 setContents:v31];

  v13 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  objc_super v14 = [v13 layer];
  [v14 setContents:v7];

  id v15 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v16 = [v15 layer];
  [v16 setContents:v10];

  if (([(_UIMagicHeadCollectionViewCell *)self isHighlighted] & 1) != 0
    || [(UIAirDropGroupActivityCell *)self isDisabled])
  {
    id v15 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v17 = [v15 CGColor];
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
    uint64_t v17 = 0;
  }
  v19 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v20 = [v19 layer];
  [v20 setContentsMultiplyColor:v17];

  if (v18) {
  if (([(_UIMagicHeadCollectionViewCell *)self isHighlighted] & 1) != 0
  }
    || [(UIAirDropGroupActivityCell *)self isDisabled])
  {
    id v15 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v21 = [v15 CGColor];
    int v22 = 1;
  }
  else
  {
    int v22 = 0;
    uint64_t v21 = 0;
  }
  v23 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v24 = [v23 layer];
  [v24 setContentsMultiplyColor:v21];

  if (v22) {
  if (([(_UIMagicHeadCollectionViewCell *)self isHighlighted] & 1) != 0
  }
    || [(UIAirDropGroupActivityCell *)self isDisabled])
  {
    id v15 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v25 = [v15 CGColor];
    int v26 = 1;
  }
  else
  {
    int v26 = 0;
    uint64_t v25 = 0;
  }
  v27 = [(_UIMagicHeadCollectionViewCell *)self magicHeadWheelView];
  v28 = [v27 selectedHead];
  v29 = [v28 imageSlotView];
  v30 = [v29 layer];
  [v30 setContentsMultiplyColor:v25];

  if (v26) {
}
  }

- (UIView)magicHeadView
{
  return self->_magicHeadView;
}

- (void)setMagicHeadView:(id)a3
{
}

- (SFMagicHeadWheelView)magicHeadWheelView
{
  return self->_magicHeadWheelView;
}

- (void)setMagicHeadWheelView:(id)a3
{
}

- (NSArray)regularMHConstraints
{
  return self->_regularMHConstraints;
}

- (void)setRegularMHConstraints:(id)a3
{
}

- (NSArray)largeTextMHConstraints
{
  return self->_largeTextMHConstraints;
}

- (void)setLargeTextMHConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextMHConstraints, 0);
  objc_storeStrong((id *)&self->_regularMHConstraints, 0);
  objc_storeStrong((id *)&self->_magicHeadWheelView, 0);
  objc_storeStrong((id *)&self->_magicHeadView, 0);
}

@end