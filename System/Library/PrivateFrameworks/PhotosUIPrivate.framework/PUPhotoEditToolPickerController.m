@interface PUPhotoEditToolPickerController
- (BOOL)blurredBackground;
- (NSArray)selectionIndicatorConstraints;
- (NSArray)toolButtonConstraints;
- (NSArray)toolButtons;
- (PUPhotoEditToolPickerController)initWithLayoutDirection:(int64_t)a3 style:(int64_t)a4 blurredBackground:(BOOL)a5;
- (PUPhotoEditToolPickerSpec)toolPickerSpec;
- (PUViewControllerSpec)parentSpec;
- (UIColor)backgroundColor;
- (UIView)contentView;
- (UIView)selectionIndicatorView;
- (UIVisualEffectView)blurEffectView;
- (double)interToolSpacing;
- (int64_t)layoutDirection;
- (int64_t)selectedToolTag;
- (int64_t)style;
- (void)_updateBackgroundColor;
- (void)loadView;
- (void)setBackgroundColor:(id)a3;
- (void)setBlurEffectView:(id)a3;
- (void)setBlurredBackground:(BOOL)a3;
- (void)setInterToolSpacing:(double)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setParentSpec:(id)a3;
- (void)setSelectedToolTag:(int64_t)a3;
- (void)setSelectionIndicatorConstraints:(id)a3;
- (void)setSelectionIndicatorView:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setToolButtonConstraints:(id)a3;
- (void)setToolButtons:(id)a3;
- (void)setToolPickerSpec:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PUPhotoEditToolPickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_toolPickerSpec, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorConstraints, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorView, 0);
  objc_storeStrong((id *)&self->_toolButtonConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_parentSpec, 0);
  objc_storeStrong((id *)&self->_toolButtons, 0);
}

- (void)setBlurredBackground:(BOOL)a3
{
  self->_blurredBackground = a3;
}

- (BOOL)blurredBackground
{
  return self->_blurredBackground;
}

- (void)setBlurEffectView:(id)a3
{
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setToolPickerSpec:(id)a3
{
}

- (PUPhotoEditToolPickerSpec)toolPickerSpec
{
  return self->_toolPickerSpec;
}

- (void)setInterToolSpacing:(double)a3
{
  self->_interToolSpacing = a3;
}

- (double)interToolSpacing
{
  return self->_interToolSpacing;
}

- (void)setSelectionIndicatorConstraints:(id)a3
{
}

- (NSArray)selectionIndicatorConstraints
{
  return self->_selectionIndicatorConstraints;
}

- (void)setSelectionIndicatorView:(id)a3
{
}

- (UIView)selectionIndicatorView
{
  return self->_selectionIndicatorView;
}

- (void)setToolButtonConstraints:(id)a3
{
}

- (NSArray)toolButtonConstraints
{
  return self->_toolButtonConstraints;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PUViewControllerSpec)parentSpec
{
  return self->_parentSpec;
}

- (int64_t)selectedToolTag
{
  return self->_selectedToolTag;
}

- (NSArray)toolButtons
{
  return self->_toolButtons;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setParentSpec:(id)a3
{
  objc_storeStrong((id *)&self->_parentSpec, a3);
  id v5 = a3;
  v6 = [(PUPhotoEditToolPickerController *)self toolPickerSpec];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PUPhotoEditToolPickerController_setParentSpec___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  v7[4] = self;
  [v6 performChanges:v7];

  [(PUPhotoEditToolPickerController *)self updateViewConstraints];
}

void __49__PUPhotoEditToolPickerController_setParentSpec___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) toolPickerSpec];
  v3 = [*(id *)(*(void *)(a1 + 32) + 1016) traitCollection];
  [v2 setTraitCollection:v3];

  id v4 = [*(id *)(a1 + 32) toolPickerSpec];
  [*(id *)(*(void *)(a1 + 32) + 1016) layoutReferenceSize];
  objc_msgSend(v4, "setLayoutReferenceSize:");
}

- (void)setSelectedToolTag:(int64_t)a3
{
  if ([(PUPhotoEditToolPickerController *)self selectedToolTag] != a3) {
    self->_selectedToolTag = a3;
  }
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditToolPickerController;
  [(PUPhotoEditToolPickerController *)&v15 viewDidLayoutSubviews];
  v3 = [(PUPhotoEditToolPickerController *)self toolPickerSpec];
  uint64_t v4 = [v3 currentLayoutStyle];

  if (v4 == 4)
  {
    id v5 = [(PUPhotoEditToolPickerController *)self view];
    v6 = [v5 layer];
    [v6 setCornerRadius:20.0];

    uint64_t v7 = *MEMORY[0x1E4F39EA8];
    v8 = [(PUPhotoEditToolPickerController *)self view];
    v9 = [v8 layer];
    [v9 setCornerCurve:v7];

    v10 = [(PUPhotoEditToolPickerController *)self blurEffectView];

    if (v10)
    {
      v11 = [(PUPhotoEditToolPickerController *)self blurEffectView];
      v12 = [v11 layer];
      [v12 setCornerRadius:20.0];

      v13 = [(PUPhotoEditToolPickerController *)self blurEffectView];
      v14 = [v13 layer];
      [v14 setCornerCurve:v7];
    }
  }
}

- (void)updateViewConstraints
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = [(PUPhotoEditToolPickerController *)self view];
  uint64_t v4 = [(PUPhotoEditToolPickerController *)v2 toolButtonConstraints];

  if (v4)
  {
    id v5 = [(PUPhotoEditToolPickerController *)v2 toolButtonConstraints];
    [v3 removeConstraints:v5];

    [(PUPhotoEditToolPickerController *)v2 setToolButtonConstraints:0];
  }
  v6 = objc_opt_new();
  uint64_t v7 = [(PUPhotoEditToolPickerController *)v2 toolButtons];
  v57 = [v7 lastObject];

  v56 = [(PUPhotoEditToolPickerController *)v2 toolPickerSpec];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = [(PUPhotoEditToolPickerController *)v2 toolButtons];
  uint64_t v8 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  v53 = v2;
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v54 = *(void *)v60;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v12 = v10;
      if (*(void *)v60 != v54) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      if ([(PUPhotoEditToolPickerController *)v2 layoutDirection])
      {
        v14 = [v13 topAnchor];
        if (v12)
        {
          objc_super v15 = [v12 bottomAnchor];
          v16 = [(PUPhotoEditToolPickerController *)v2 toolButtons];
          objc_msgSend(v56, "interToolVerticalSpacingForToolCount:", objc_msgSend(v16, "count"));
          v17 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
          [v6 addObject:v17];
        }
        else
        {
          objc_super v15 = [v3 topAnchor];
          [v56 toolParentViewEdgeSpacing];
          v16 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
          [v6 addObject:v16];
        }

        v20 = [v13 leftAnchor];
        v21 = [v3 leftAnchor];
        v22 = [v20 constraintEqualToAnchor:v21 constant:23.0];
        [v6 addObject:v22];

        v23 = [v13 rightAnchor];
        v24 = [v3 rightAnchor];
        v25 = [v23 constraintEqualToAnchor:v24 constant:-23.0];
        [v6 addObject:v25];

        v2 = v53;
        if (v13 == v57)
        {
          v26 = [v57 bottomAnchor];
          uint64_t v27 = [v3 bottomAnchor];
LABEL_19:
          v32 = (void *)v27;
          [v56 toolParentViewEdgeSpacing];
          v34 = [v26 constraintEqualToAnchor:v32 constant:-v33];
          [v6 addObject:v34];
        }
      }
      else
      {
        v18 = [v13 leftAnchor];
        if (v12)
        {
          v19 = [v12 rightAnchor];
          [v56 interToolSpacing];
        }
        else
        {
          v19 = [v3 leftAnchor];
          [v56 toolParentViewEdgeSpacing];
        }
        v28 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
        [v6 addObject:v28];

        v29 = [v13 centerYAnchor];
        v30 = [v3 centerYAnchor];
        v31 = [v29 constraintEqualToAnchor:v30];
        [v6 addObject:v31];

        if (v13 == v57)
        {
          v26 = [v57 rightAnchor];
          uint64_t v27 = [v3 rightAnchor];
          goto LABEL_19;
        }
      }
      id v10 = v13;
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  }
  while (v9);
LABEL_24:

  v35 = [(PUPhotoEditToolPickerController *)v2 blurEffectView];

  if (v35)
  {
    v46 = [(PUPhotoEditToolPickerController *)v2 blurEffectView];
    v55 = [v46 leftAnchor];
    id obja = [v3 leftAnchor];
    v50 = [v55 constraintEqualToAnchor:obja];
    v63[0] = v50;
    v49 = [(PUPhotoEditToolPickerController *)v2 blurEffectView];
    v48 = [v49 rightAnchor];
    v47 = [v3 rightAnchor];
    v45 = [v48 constraintEqualToAnchor:v47];
    v63[1] = v45;
    v44 = [(PUPhotoEditToolPickerController *)v2 blurEffectView];
    v43 = [v44 topAnchor];
    v36 = [v3 topAnchor];
    v37 = [v43 constraintEqualToAnchor:v36];
    v63[2] = v37;
    v38 = [(PUPhotoEditToolPickerController *)v2 blurEffectView];
    v39 = [v38 bottomAnchor];
    v40 = [v3 bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v63[3] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
    [v6 addObjectsFromArray:v42];

    v2 = v53;
  }
  [(PUPhotoEditToolPickerController *)v2 setToolButtonConstraints:v6];
  [v3 addConstraints:v6];
  v58.receiver = v2;
  v58.super_class = (Class)PUPhotoEditToolPickerController;
  [(PUPhotoEditToolPickerController *)&v58 updateViewConstraints];
}

- (UIView)contentView
{
  id v3 = (id)[(PUPhotoEditToolPickerController *)self view];
  uint64_t v4 = [(PUPhotoEditToolPickerController *)self blurEffectView];
  id v5 = [v4 contentView];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(PUPhotoEditToolPickerController *)self view];
  }
  uint64_t v8 = v7;

  return (UIView *)v8;
}

- (void)_updateBackgroundColor
{
  BOOL v3 = [(PUPhotoEditToolPickerController *)self blurredBackground];
  id v6 = [(PUPhotoEditToolPickerController *)self backgroundColor];
  if (v3)
  {
    uint64_t v4 = [(PUPhotoEditToolPickerController *)self blurEffectView];
    [v4 setBackgroundColor:v6];

    id v6 = [(PUPhotoEditToolPickerController *)self view];
    [v6 setBackgroundColor:0];
  }
  else
  {
    id v5 = [(PUPhotoEditToolPickerController *)self view];
    [v5 setBackgroundColor:v6];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    [(PUPhotoEditToolPickerController *)self _updateBackgroundColor];
    id v5 = v6;
  }
}

- (void)setToolButtons:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  val = self;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v4 = self->_toolButtons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "removeFromSuperview", v27);
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [v27 copy];
  toolButtons = val->_toolButtons;
  val->_toolButtons = (NSArray *)v8;

  id v10 = [(PUPhotoEditToolPickerController *)val toolPickerSpec];
  [v10 toolButtonPointerInteractionHighlightPadding];

  PXEdgeInsetsMake();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = [(PUPhotoEditToolPickerController *)val contentView];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v20 = val->_toolButtons;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        objc_msgSend(v19, "addSubview:", v24, v27);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = v24;
          objc_initWeak(&location, val);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __50__PUPhotoEditToolPickerController_setToolButtons___block_invoke;
          v29[3] = &unk_1E5F27108;
          v30[1] = v12;
          v30[2] = v14;
          v30[3] = v16;
          v30[4] = v18;
          objc_copyWeak(v30, &location);
          [v25 setPointerStyleProvider:v29];
          objc_destroyWeak(v30);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v21);
  }

  v26 = [(PUPhotoEditToolPickerController *)val view];
  [v26 setNeedsUpdateConstraints];
}

id __50__PUPhotoEditToolPickerController_setToolButtons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 frame];
  PXEdgeInsetsInsetRect();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = (void *)MEMORY[0x1E4FB1AE0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16 = [WeakRetained view];
  v17 = [v16 layer];
  [v17 cornerRadius];
  v19 = objc_msgSend(v14, "shapeWithRoundedRect:cornerRadius:", v7, v9, v11, v13, v18);

  v20 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v5 shape:v19];

  return v20;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    id v3 = [(PUPhotoEditToolPickerController *)self view];
    [v3 setNeedsUpdateConstraints];
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
  id v3 = [(PUPhotoEditToolPickerController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditToolPickerController;
  [(PUPhotoEditToolPickerController *)&v3 viewDidLoad];
  [(PUPhotoEditToolPickerController *)self setLayoutDirection:self->_layoutDirection];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PUPhotoEditToolPickerController *)self setView:v6];
  if ([(PUPhotoEditToolPickerController *)self blurredBackground])
  {
    uint64_t v4 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:12.0];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setClipsToBounds:1];
    [v6 addSubview:v5];
    [(PUPhotoEditToolPickerController *)self setBlurEffectView:v5];
  }
}

- (PUPhotoEditToolPickerController)initWithLayoutDirection:(int64_t)a3 style:(int64_t)a4 blurredBackground:(BOOL)a5
{
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditToolPickerController;
  double v8 = [(PUPhotoEditToolPickerController *)&v14 initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    v8->_layoutDirection = a3;
    v8->_style = a4;
    double v10 = objc_alloc_init(PUPhotoEditToolPickerSpec);
    toolPickerSpec = v9->_toolPickerSpec;
    v9->_toolPickerSpec = v10;

    v9->_blurredBackground = a5;
    double v12 = v9;
  }

  return v9;
}

@end