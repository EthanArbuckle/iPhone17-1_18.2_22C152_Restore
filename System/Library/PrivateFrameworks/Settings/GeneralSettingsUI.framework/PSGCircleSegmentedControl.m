@interface PSGCircleSegmentedControl
- (PSGCircleSegmentedControl)init;
- (PSGCircleSegmentedControlDelegate)delegate;
- (UILabel)label;
- (id)_circleImageWithColor:(id)a3 fillColor:(id)a4 diameter:(double)a5;
- (id)styleSensitiveImage:(id)a3;
- (void)addSegmentWithTitle:(id)a3;
- (void)segmentTapped:(id)a3;
- (void)selectSegmentAtIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPositionConstraintsActive:(BOOL)a3 forButtonAtIndex:(unint64_t)a4;
- (void)setSelectedSegmentIndex:(unint64_t)a3;
@end

@implementation PSGCircleSegmentedControl

- (id)_circleImageWithColor:(id)a3 fillColor:(id)a4 diameter:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  CGFloat v11 = v10;
  v16.width = a5;
  v16.height = a5;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v11);

  v12 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", 1.0, 1.0, a5 + -2.0, a5 + -2.0);
  if (v8)
  {
    [v8 set];
    [v12 fill];
  }
  [v7 set];
  [v12 stroke];
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

- (PSGCircleSegmentedControl)init
{
  v61.receiver = self;
  v61.super_class = (Class)PSGCircleSegmentedControl;
  v2 = [(PSGCircleSegmentedControl *)&v61 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = [(PSGCircleSegmentedControl *)v2 styleSensitiveImage:&__block_literal_global_4];
    activeImage = v2->_activeImage;
    v2->_activeImage = (UIImage *)v3;

    v5 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
    [(UIImage *)v2->_activeImage size];
    uint64_t v6 = -[PSGCircleSegmentedControl _circleImageWithColor:fillColor:diameter:](v2, "_circleImageWithColor:fillColor:diameter:", v5, 0);
    placeholderImage = v2->_placeholderImage;
    v2->_placeholderImage = (UIImage *)v6;

    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __33__PSGCircleSegmentedControl_init__block_invoke_2;
    v57[3] = &unk_264E8D048;
    objc_copyWeak(&v59, &location);
    id v8 = v2;
    v58 = v8;
    uint64_t v9 = [(PSGCircleSegmentedControl *)v8 styleSensitiveImage:v57];
    buttonImage = v8->_buttonImage;
    v8->_buttonImage = (UIImage *)v9;

    uint64_t v52 = MEMORY[0x263EF8330];
    uint64_t v53 = 3221225472;
    v54 = __33__PSGCircleSegmentedControl_init__block_invoke_3;
    v55 = &unk_264E8D070;
    CGFloat v11 = v8;
    v56 = v11;
    uint64_t v12 = [(PSGCircleSegmentedControl *)v11 styleSensitiveImage:&v52];
    highlightedImage = v11->_highlightedImage;
    v11->_highlightedImage = (UIImage *)v12;

    uint64_t v14 = objc_opt_new();
    segmentPlaceholders = v11->_segmentPlaceholders;
    v11->_segmentPlaceholders = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    segments = v11->_segments;
    v11->_segments = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    selectedSegmentConstraints = v11->_selectedSegmentConstraints;
    v11->_selectedSegmentConstraints = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    segmentConstraints = v11->_segmentConstraints;
    v11->_segmentConstraints = (NSMutableArray *)v20;

    uint64_t v22 = objc_opt_new();
    stack = v11->_stack;
    v11->_stack = (UIStackView *)v22;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v11->_stack, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v52, v53, v54, v55);
    [(UIStackView *)v11->_stack setDistribution:3];
    [(UIStackView *)v11->_stack setAlignment:3];
    [(PSGCircleSegmentedControl *)v11 addSubview:v11->_stack];
    id v24 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v25 = objc_msgSend(v24, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v11->_label;
    v11->_label = (UILabel *)v25;

    [(UILabel *)v11->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v11->_label setTextAlignment:1];
    v27 = v11->_label;
    v28 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v27 setFont:v28];

    [(UILabel *)v11->_label setNumberOfLines:0];
    [(UILabel *)v11->_label setAdjustsFontSizeToFitWidth:1];
    [(PSGCircleSegmentedControl *)v11 addSubview:v11->_label];
    v29 = [(UIStackView *)v11->_stack topAnchor];
    v30 = [(PSGCircleSegmentedControl *)v11 topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(UIStackView *)v11->_stack leadingAnchor];
    v33 = [(PSGCircleSegmentedControl *)v11 leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(UIStackView *)v11->_stack trailingAnchor];
    v36 = [(PSGCircleSegmentedControl *)v11 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    v38 = [(UIStackView *)v11->_stack bottomAnchor];
    v39 = [(UILabel *)v11->_label topAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [(UILabel *)v11->_label leadingAnchor];
    v42 = [(PSGCircleSegmentedControl *)v11 leadingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v44 = [(UILabel *)v11->_label trailingAnchor];
    v45 = [(PSGCircleSegmentedControl *)v11 trailingAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    [v46 setActive:1];

    v47 = [(UILabel *)v11->_label bottomAnchor];
    v48 = [(PSGCircleSegmentedControl *)v11 bottomAnchor];
    [(UIImage *)v2->_activeImage size];
    v50 = [v47 constraintEqualToAnchor:v48 constant:-(v49 + 20.0)];
    [v50 setActive:1];

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __33__PSGCircleSegmentedControl_init__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  v1 = PSG_BundleForGeneralSettingsUIFramework();
  v2 = [v0 imageNamed:@"HomeButtonSelector-sshb" inBundle:v1 compatibleWithTraitCollection:0];
  uint64_t v3 = [MEMORY[0x263F825C8] systemBlueColor];
  v4 = [v2 _flatImageWithColor:v3];

  return v4;
}

id __33__PSGCircleSegmentedControl_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [MEMORY[0x263F825C8] systemBlueColor];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [*(id *)(*(void *)(a1 + 32) + 528) size];
  v5 = objc_msgSend(WeakRetained, "_circleImageWithColor:fillColor:diameter:", v3, v4);

  return v5;
}

id __33__PSGCircleSegmentedControl_init__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263F825C8] systemBlueColor];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v4 colorWithAlphaComponent:0.3];
  [*(id *)(*(void *)(a1 + 32) + 528) size];
  uint64_t v6 = objc_msgSend(v2, "_circleImageWithColor:fillColor:diameter:", v3, v5);

  return v6;
}

- (id)styleSensitiveImage:(id)a3
{
  uint64_t v20 = self;
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F82DA0];
  v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  v21 = objc_msgSend(v4, "traitCollectionWithDisplayScale:");

  id v6 = objc_alloc_init(MEMORY[0x263F827F0]);
  uint64_t v7 = 0;
  id v8 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  char v9 = 1;
  do
  {
    char v10 = v9;
    CGFloat v11 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithUserInterfaceStyle:", *((void *)&xmmword_23D2C6210 + v7), v20);

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__PSGCircleSegmentedControl_styleSensitiveImage___block_invoke;
    v22[3] = &unk_264E8D098;
    id v24 = &v25;
    id v12 = v3;
    id v23 = v12;
    [v11 performAsCurrentTraitCollection:v22];
    uint64_t v13 = v26[5];
    uint64_t v14 = (void *)MEMORY[0x263F82DA0];
    v31[0] = v21;
    v31[1] = v11;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    uint64_t v16 = [v14 traitCollectionWithTraitsFromCollections:v15];
    [v6 registerImage:v13 withTraitCollection:v16];

    char v9 = 0;
    uint64_t v7 = 1;
    id v8 = v11;
  }
  while ((v10 & 1) != 0);
  v17 = [(PSGCircleSegmentedControl *)v20 traitCollection];
  uint64_t v18 = [v6 imageWithTraitCollection:v17];

  _Block_object_dispose(&v25, 8);
  return v18;
}

uint64_t __49__PSGCircleSegmentedControl_styleSensitiveImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setPositionConstraintsActive:(BOOL)a3 forButtonAtIndex:(unint64_t)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_segmentConstraints, "objectAtIndexedSubscript:", a4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setActive:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addSegmentWithTitle:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  BOOL v4 = (objc_class *)MEMORY[0x263F82828];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithImage:self->_placeholderImage];
  [(NSMutableArray *)self->_segmentPlaceholders addObject:v6];
  [(UIStackView *)self->_stack addArrangedSubview:v6];
  uint64_t v7 = +[PSGCircleSegment buttonWithType:0];
  [v7 setImage:self->_buttonImage animated:0];
  [v7 setImage:self->_highlightedImage forState:1];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setTitle:v5 forState:0];

  [v7 addTarget:self action:sel_segmentTapped_ forControlEvents:0x2000];
  [(NSMutableArray *)self->_segments addObject:v7];
  [(PSGCircleSegmentedControl *)self addSubview:v7];
  uint64_t v8 = [v7 centerXAnchor];
  uint64_t v9 = [v6 centerXAnchor];
  long long v10 = [v8 constraintEqualToAnchor:v9];

  long long v11 = [v7 centerYAnchor];
  long long v12 = [v6 centerYAnchor];
  long long v13 = [v11 constraintEqualToAnchor:v12];

  segmentConstraints = self->_segmentConstraints;
  v16[0] = v10;
  v16[1] = v13;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [(NSMutableArray *)segmentConstraints addObject:v15];

  [(PSGCircleSegmentedControl *)self setPositionConstraintsActive:1 forButtonAtIndex:[(NSMutableArray *)self->_segmentConstraints count] - 1];
}

- (void)setSelectedSegmentIndex:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
  id v5 = (PSGCircleSegment *)objc_claimAutoreleasedReturnValue();
  p_selectedSegment = &self->_selectedSegment;
  if (v5 != self->_selectedSegment)
  {
    uint64_t v7 = -[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:");
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v7;
      [(PSGCircleSegment *)*p_selectedSegment setSelected:0];
      [(PSGCircleSegment *)*p_selectedSegment setUserInteractionEnabled:1];
      [(PSGCircleSegmentedControl *)self setPositionConstraintsActive:1 forButtonAtIndex:v8];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = self->_selectedSegmentConstraints;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) setActive:0];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)self->_selectedSegmentConstraints removeAllObjects];
    objc_storeStrong((id *)&self->_selectedSegment, v5);
    [(PSGCircleSegment *)*p_selectedSegment setSelected:1];
    [(PSGCircleSegment *)*p_selectedSegment setUserInteractionEnabled:0];
    [(PSGCircleSegmentedControl *)self setPositionConstraintsActive:0 forButtonAtIndex:a3];
    selectedSegmentConstraints = self->_selectedSegmentConstraints;
    uint64_t v14 = [(PSGCircleSegment *)*p_selectedSegment centerXAnchor];
    uint64_t v15 = [(PSGCircleSegmentedControl *)self centerXAnchor];
    uint64_t v16 = [v14 constraintEqualToAnchor:v15];
    v27[0] = v16;
    v17 = [(PSGCircleSegment *)*p_selectedSegment bottomAnchor];
    uint64_t v18 = [(PSGCircleSegmentedControl *)self bottomAnchor];
    [v17 constraintEqualToAnchor:v18];
    uint64_t v20 = v19 = v5;
    v27[1] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    [(NSMutableArray *)selectedSegmentConstraints addObjectsFromArray:v21];

    id v5 = v19;
    [MEMORY[0x263F08938] activateConstraints:self->_selectedSegmentConstraints];
  }
}

- (void)segmentTapped:(id)a3
{
  unint64_t v4 = [(NSMutableArray *)self->_segments indexOfObject:a3];
  if (v4 < [(NSMutableArray *)self->_segments count])
  {
    [(PSGCircleSegmentedControl *)self selectSegmentAtIndex:v4];
    id v5 = [(PSGCircleSegmentedControl *)self delegate];
    [v5 segmentedControl:self didSelectSegmentAtIndex:v4];
  }
}

- (void)selectSegmentAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_segments indexOfObject:self->_selectedSegment] != a3)
  {
    id v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    selectedSegment = self->_selectedSegment;
    uint64_t v7 = (void *)MEMORY[0x263F82E00];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __50__PSGCircleSegmentedControl_selectSegmentAtIndex___block_invoke;
    uint64_t v12 = &unk_264E8CC80;
    long long v13 = self;
    unint64_t v14 = a3;
    uint64_t v8 = selectedSegment;
    [v7 animateWithDuration:0 delay:&v9 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:0.7 completion:0.0];
    objc_msgSend(v5, "setImage:animated:", self->_activeImage, 1, v9, v10, v11, v12, v13, v14);
    [(PSGCircleSegment *)v8 setImage:self->_buttonImage animated:1];
  }
}

uint64_t __50__PSGCircleSegmentedControl_selectSegmentAtIndex___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedSegmentIndex:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (PSGCircleSegmentedControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSGCircleSegmentedControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeImage, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_selectedSegmentConstraints, 0);
  objc_storeStrong((id *)&self->_segmentConstraints, 0);
  objc_storeStrong((id *)&self->_selectedSegment, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_segmentPlaceholders, 0);
}

@end