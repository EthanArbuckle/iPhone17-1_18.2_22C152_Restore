@interface STUIStatusBarDualIndicatorItem
- (NSLayoutConstraint)itemSpacingConstraint;
- (STUIStatusBarDisplayableContainerView)iconsView;
- (STUIStatusBarImageView)iconView;
- (STUIStatusBarImageView)secondaryIconView;
- (double)additionRemovalDuration;
- (double)additionRemovalScale;
- (double)itemSpacing;
- (id)additionRemovalAnimationForSubItem:(id)a3 image:(id)a4 update:(id)a5 displayItem:(id)a6;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (id)dependentEntryKeys;
- (id)imageForUpdate:(id)a3 secondary:(BOOL)a4;
- (id)indicatorEntryKey;
- (id)secondaryIndicatorEntryKey;
- (id)secondarySystemImageNameForUpdate:(id)a3;
- (id)systemImageNameForUpdate:(id)a3;
- (void)_create_iconView;
- (void)_create_iconsView;
- (void)_create_secondaryIconView;
- (void)setAdditionRemovalDuration:(double)a3;
- (void)setAdditionRemovalScale:(double)a3;
- (void)setIconView:(id)a3;
- (void)setIconsView:(id)a3;
- (void)setItemSpacing:(double)a3;
- (void)setItemSpacingConstraint:(id)a3;
- (void)setSecondaryIconView:(id)a3;
@end

@implementation STUIStatusBarDualIndicatorItem

- (id)dependentEntryKeys
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(STUIStatusBarDualIndicatorItem *)self indicatorEntryKey];
  v5 = [(STUIStatusBarDualIndicatorItem *)self secondaryIndicatorEntryKey];
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return v6;
}

- (id)indicatorEntryKey
{
  return &stru_1F2F86950;
}

- (id)secondaryIndicatorEntryKey
{
  return &stru_1F2F86950;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (id)secondarySystemImageNameForUpdate:(id)a3
{
  return 0;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  v37[7] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)STUIStatusBarDualIndicatorItem;
  v4 = [(STUIStatusBarItem *)&v36 createDisplayItemForIdentifier:a3];
  v5 = [v4 identifier];
  v6 = [(id)objc_opt_class() defaultDisplayIdentifier];

  if (v5 == v6)
  {
    v7 = [(STUIStatusBarDualIndicatorItem *)self iconsView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(STUIStatusBarDualIndicatorItem *)self iconView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v8];
    v9 = [(STUIStatusBarDualIndicatorItem *)self secondaryIconView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v9];
    v10 = [v9 leadingAnchor];
    v11 = [v8 trailingAnchor];
    [(STUIStatusBarDualIndicatorItem *)self itemSpacing];
    v12 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11);
    [(STUIStatusBarDualIndicatorItem *)self setItemSpacingConstraint:v12];

    v35 = [v8 leadingAnchor];
    v33 = [v7 leadingAnchor];
    v32 = [v35 constraintEqualToAnchor:v33];
    v37[0] = v32;
    v34 = v8;
    v31 = [v8 topAnchor];
    v30 = [v7 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v37[1] = v29;
    v28 = [v8 bottomAnchor];
    v27 = [v7 bottomAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v37[2] = v26;
    v25 = [(STUIStatusBarDualIndicatorItem *)self itemSpacingConstraint];
    v37[3] = v25;
    v24 = [v9 topAnchor];
    v22 = [v7 topAnchor];
    v13 = [v24 constraintEqualToAnchor:v22];
    v37[4] = v13;
    v14 = [v9 bottomAnchor];
    v15 = [v7 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v37[5] = v16;
    v17 = [v9 trailingAnchor];
    [v7 trailingAnchor];
    v19 = v18 = v4;
    v20 = [v17 constraintEqualToAnchor:v19];
    v37[6] = v20;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:7];

    v4 = v18;
    [MEMORY[0x1E4F28DC8] activateConstraints:v23];
  }
  return v4;
}

- (STUIStatusBarDisplayableContainerView)iconsView
{
  iconsView = self->_iconsView;
  if (!iconsView)
  {
    [(STUIStatusBarDualIndicatorItem *)self _create_iconsView];
    iconsView = self->_iconsView;
  }
  return iconsView;
}

- (void)_create_iconsView
{
  v3 = [STUIStatusBarDisplayableContainerView alloc];
  v4 = -[STUIStatusBarDisplayableContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  iconsView = self->_iconsView;
  self->_iconsView = v4;
  MEMORY[0x1F41817F8](v4, iconsView);
}

- (STUIStatusBarImageView)iconView
{
  iconView = self->_iconView;
  if (!iconView)
  {
    [(STUIStatusBarDualIndicatorItem *)self _create_iconView];
    iconView = self->_iconView;
  }
  return iconView;
}

- (void)_create_iconView
{
  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;
  MEMORY[0x1F41817F8](v4, iconView);
}

- (STUIStatusBarImageView)secondaryIconView
{
  secondaryIconView = self->_secondaryIconView;
  if (!secondaryIconView)
  {
    [(STUIStatusBarDualIndicatorItem *)self _create_secondaryIconView];
    secondaryIconView = self->_secondaryIconView;
  }
  return secondaryIconView;
}

- (void)_create_secondaryIconView
{
  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  secondaryIconView = self->_secondaryIconView;
  self->_secondaryIconView = v4;
  MEMORY[0x1F41817F8](v4, secondaryIconView);
}

- (id)imageForUpdate:(id)a3 secondary:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [(STUIStatusBarDualIndicatorItem *)self secondarySystemImageNameForUpdate:v6];
  }
  else {
  v7 = [(STUIStatusBarDualIndicatorItem *)self systemImageNameForUpdate:v6];
  }
  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)additionRemovalAnimationForSubItem:(id)a3 image:(id)a4 update:(id)a5 displayItem:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__STUIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke;
  v14[3] = &unk_1E6AA46B0;
  id v15 = v9;
  id v16 = v8;
  v17 = self;
  id v10 = v8;
  id v11 = v9;
  v12 = +[STUIStatusBarAnimation animationWithBlock:v14];

  return v12;
}

void __94__STUIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (a1[4])
  {
    objc_msgSend(a1[5], "setImage:");
    [a1[6] itemSpacing];
    double v7 = v6;
    id v8 = [a1[6] itemSpacingConstraint];
    [v8 setConstant:v7];

    [a1[6] additionRemovalScale];
    CGFloat v10 = v9;
    [a1[6] additionRemovalScale];
    CGAffineTransformMakeScale(&v31, v10, v11);
    id v12 = a1[5];
    CGAffineTransform v30 = v31;
    [v12 setTransform:&v30];
    [a1[5] setAlpha:0.0];
  }
  v13 = (void *)MEMORY[0x1E4FB1EB0];
  [a1[6] additionRemovalDuration];
  double v15 = v14;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __94__STUIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_2;
  v26[3] = &unk_1E6AA4660;
  id v27 = a1[4];
  id v16 = a1[5];
  id v17 = a1[6];
  id v28 = v16;
  id v29 = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__STUIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_3;
  v21[3] = &unk_1E6AA4688;
  id v22 = a1[5];
  id v18 = a1[4];
  id v19 = a1[6];
  id v23 = v18;
  id v24 = v19;
  id v25 = v5;
  id v20 = v5;
  [v13 animateWithDuration:v26 animations:v21 completion:v15];
}

uint64_t __94__STUIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v3 = (id *)(a1 + 40);
    v2 = *(void **)(a1 + 40);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v4;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v2 setTransform:v13];
    double v5 = 1.0;
  }
  else
  {
    [*(id *)(a1 + 48) additionRemovalScale];
    CGFloat v7 = v6;
    [*(id *)(a1 + 48) additionRemovalScale];
    CGAffineTransformMakeScale(&v12, v7, v8);
    double v9 = *(void **)(a1 + 40);
    v3 = (id *)(a1 + 40);
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];
    double v5 = 0.0;
  }
  return [*v3 setAlpha:v5];
}

uint64_t __94__STUIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
    if (!*(void *)(a1 + 40))
    {
      v3 = [*(id *)(a1 + 48) itemSpacingConstraint];
      [v3 setConstant:0.0];
    }
    long long v4 = *(void **)(a1 + 32);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v7];
    [*(id *)(a1 + 32) setAlpha:1.0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [v7 identifier];
  double v9 = [(id)objc_opt_class() defaultDisplayIdentifier];
  if (v8 != v9)
  {

LABEL_25:
    id v29 = 0;
    goto LABEL_26;
  }
  int v10 = [v7 isEnabled];

  if (!v10 || ![v6 dataChanged]) {
    goto LABEL_25;
  }
  CGAffineTransform v11 = [(STUIStatusBarDualIndicatorItem *)self iconView];
  uint64_t v12 = [v11 image];

  v13 = [(STUIStatusBarDualIndicatorItem *)self secondaryIconView];
  uint64_t v14 = [v13 image];

  double v15 = [v6 data];
  id v16 = [(STUIStatusBarDualIndicatorItem *)self indicatorEntryKey];
  id v17 = [v15 valueForKey:v16];

  id v18 = [v6 data];
  id v19 = [(STUIStatusBarDualIndicatorItem *)self secondaryIndicatorEntryKey];
  id v20 = [v18 valueForKey:v19];
  v21 = v20;
  if (v17) {
    BOOL v22 = v12 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v14) {
    BOOL v22 = 1;
  }
  BOOL v37 = v22;
  if (v20) {
    BOOL v23 = v17 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (v20) {
    BOOL v24 = v14 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  uint64_t v25 = v12 | v14;
  if (v12) {
    char v26 = 1;
  }
  else {
    char v26 = v24;
  }

  if (!v25 || !v23 || !v37 || (v26 & 1) == 0)
  {
    v39.receiver = self;
    v39.super_class = (Class)STUIStatusBarDualIndicatorItem;
    id v29 = [(STUIStatusBarItem *)&v39 applyUpdate:v6 toDisplayItem:v7];
    id v27 = [(STUIStatusBarDualIndicatorItem *)self imageForUpdate:v6 secondary:0];
    CGAffineTransform v31 = [(STUIStatusBarDualIndicatorItem *)self iconView];
    [v31 setImage:v27];

    v32 = [(STUIStatusBarDualIndicatorItem *)self imageForUpdate:v6 secondary:1];
    v33 = [(STUIStatusBarDualIndicatorItem *)self secondaryIconView];
    [v33 setImage:v32];

    double v34 = 0.0;
    if (v27 && v32)
    {
      [(STUIStatusBarDualIndicatorItem *)self itemSpacing];
      double v34 = v35;
    }
    objc_super v36 = [(STUIStatusBarDualIndicatorItem *)self itemSpacingConstraint];
    [v36 setConstant:v34];

    goto LABEL_36;
  }
  if (v17)
  {
    id v27 = [(STUIStatusBarDualIndicatorItem *)self imageForUpdate:v6 secondary:0];
    uint64_t v28 = [(STUIStatusBarDualIndicatorItem *)self iconView];
LABEL_35:
    v32 = (void *)v28;
    id v29 = [(STUIStatusBarDualIndicatorItem *)self additionRemovalAnimationForSubItem:v28 image:v27 update:v6 displayItem:v7];
LABEL_36:

    goto LABEL_26;
  }
  if (v21)
  {
    id v27 = [(STUIStatusBarDualIndicatorItem *)self imageForUpdate:v6 secondary:1];
    uint64_t v28 = [(STUIStatusBarDualIndicatorItem *)self secondaryIconView];
    goto LABEL_35;
  }
  v38.receiver = self;
  v38.super_class = (Class)STUIStatusBarDualIndicatorItem;
  id v29 = [(STUIStatusBarItem *)&v38 applyUpdate:v6 toDisplayItem:v7];
LABEL_26:

  return v29;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (double)additionRemovalScale
{
  return self->_additionRemovalScale;
}

- (void)setAdditionRemovalScale:(double)a3
{
  self->_additionRemovalScale = a3;
}

- (double)additionRemovalDuration
{
  return self->_additionRemovalDuration;
}

- (void)setAdditionRemovalDuration:(double)a3
{
  self->_additionRemovalDuration = a3;
}

- (void)setIconsView:(id)a3
{
}

- (void)setIconView:(id)a3
{
}

- (void)setSecondaryIconView:(id)a3
{
}

- (NSLayoutConstraint)itemSpacingConstraint
{
  return self->_itemSpacingConstraint;
}

- (void)setItemSpacingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryIconView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);
}

@end