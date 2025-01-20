@interface PUParallaxLayerStackDebugStyleTableViewCell
- (NSString)styleKind;
- (PUParallaxLayerStackDebugStyleTableViewCellDelegate)styleCellDelegate;
- (UIColorWell)colorButton1;
- (UIColorWell)colorButton2;
- (UISegmentedControl)tonalityControl;
- (UISlider)colorSlider;
- (UIView)controlsView;
- (id)colorButtonWithColor:(id)a3 title:(id)a4;
- (id)intensitySliderWithWidth:(double)a3;
- (id)newTonalityControl;
- (void)applyToStyle:(id)a3;
- (void)rebuildControlsViewForStyle:(id)a3;
- (void)setColorButton1:(id)a3;
- (void)setColorButton2:(id)a3;
- (void)setColorSlider:(id)a3;
- (void)setControlsView:(id)a3;
- (void)setStyleCellDelegate:(id)a3;
- (void)setStyleKind:(id)a3;
- (void)setTonalityControl:(id)a3;
- (void)updateColor:(id)a3;
- (void)updateDelegate:(id)a3;
- (void)updateSlider:(id)a3;
@end

@implementation PUParallaxLayerStackDebugStyleTableViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tonalityControl, 0);
  objc_storeStrong((id *)&self->_colorButton2, 0);
  objc_storeStrong((id *)&self->_colorButton1, 0);
  objc_storeStrong((id *)&self->_colorSlider, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_styleKind, 0);
  objc_destroyWeak((id *)&self->_styleCellDelegate);
}

- (void)setTonalityControl:(id)a3
{
}

- (UISegmentedControl)tonalityControl
{
  return self->_tonalityControl;
}

- (void)setColorButton2:(id)a3
{
}

- (UIColorWell)colorButton2
{
  return self->_colorButton2;
}

- (void)setColorButton1:(id)a3
{
}

- (UIColorWell)colorButton1
{
  return self->_colorButton1;
}

- (void)setColorSlider:(id)a3
{
}

- (UISlider)colorSlider
{
  return self->_colorSlider;
}

- (void)setControlsView:(id)a3
{
}

- (UIView)controlsView
{
  return self->_controlsView;
}

- (void)setStyleKind:(id)a3
{
}

- (NSString)styleKind
{
  return self->_styleKind;
}

- (void)setStyleCellDelegate:(id)a3
{
}

- (PUParallaxLayerStackDebugStyleTableViewCellDelegate)styleCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleCellDelegate);
  return (PUParallaxLayerStackDebugStyleTableViewCellDelegate *)WeakRetained;
}

- (void)updateDelegate:(id)a3
{
  id v4 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self styleCellDelegate];
  [v4 cellValueUpdated:self];
}

- (void)updateSlider:(id)a3
{
  id v13 = a3;
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFE8]])
  {
    id v4 = (void *)MEMORY[0x1E4F8CC78];
    id v5 = [(UIColorWell *)self->_colorButton1 selectedColor];
    v6 = objc_msgSend(v4, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));

    id v7 = objc_alloc(MEMORY[0x1E4F8CC78]);
    [v6 hue];
    double v9 = v8;
    [(UISlider *)self->_colorSlider value];
    v11 = (void *)[v7 initWithHue:v9 tone:v10];
    v12 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", objc_msgSend(v11, "CGColor"));
    [(UIColorWell *)self->_colorButton1 setSelectedColor:v12];
  }
  [(PUParallaxLayerStackDebugStyleTableViewCell *)self updateDelegate:v13];
}

- (void)updateColor:(id)a3
{
  id v8 = a3;
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFE8]])
  {
    id v4 = (void *)MEMORY[0x1E4F8CC78];
    id v5 = [v8 selectedColor];
    v6 = objc_msgSend(v4, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));

    [v6 tone];
    *(float *)&double v7 = v7;
    [(UISlider *)self->_colorSlider setValue:v7];
  }
  [(PUParallaxLayerStackDebugStyleTableViewCell *)self updateDelegate:v8];
}

- (void)applyToStyle:(id)a3
{
  id v21 = a3;
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8D028]]
    || [(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFD8]])
  {
    tonalityControl = self->_tonalityControl;
    id v5 = v21;
    if ([(UISegmentedControl *)tonalityControl selectedSegmentIndex]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 3;
    }
    [v5 setTonality:v6];
    goto LABEL_14;
  }
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFE8]])
  {
    double v7 = (void *)MEMORY[0x1E4F8CC78];
    colorButton1 = self->_colorButton1;
    id v9 = v21;
    id v10 = [(UIColorWell *)colorButton1 selectedColor];
    objc_msgSend(v7, "colorWithCGColor:", objc_msgSend(v10, "CGColor"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [v5 hue];
    double v12 = v11;
    id v13 = objc_alloc(MEMORY[0x1E4F8CC78]);
    [(UISlider *)self->_colorSlider value];
    v15 = (void *)[v13 initWithHue:v12 tone:v14];
    [v9 setColor:v15];

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFF8]]
    || [(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8D000]]
    || [(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8D018]])
  {
    v16 = (void *)MEMORY[0x1E4F8CC78];
    id v5 = [(UIColorWell *)self->_colorButton1 selectedColor];
    v15 = objc_msgSend(v16, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));
    [v21 setColor:v15];
    goto LABEL_13;
  }
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFF0]])
  {
    v17 = (void *)MEMORY[0x1E4F8CC78];
    id v18 = [(UIColorWell *)self->_colorButton1 selectedColor];
    v19 = objc_msgSend(v17, "colorWithCGColor:", objc_msgSend(v18, "CGColor"));
    [v21 setPrimaryColor:v19];

    v20 = (void *)MEMORY[0x1E4F8CC78];
    id v5 = [(UIColorWell *)self->_colorButton2 selectedColor];
    v15 = objc_msgSend(v20, "colorWithCGColor:", objc_msgSend(v5, "CGColor"));
    [v21 setSecondaryColor:v15];
    goto LABEL_13;
  }
LABEL_15:
}

- (void)rebuildControlsViewForStyle:(id)a3
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 kind];
  styleKind = self->_styleKind;
  self->_styleKind = v5;

  double v7 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self controlsView];
  [v7 removeFromSuperview];

  [(PUParallaxLayerStackDebugStyleTableViewCell *)self setControlsView:0];
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8D028]]
    || [(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFD8]])
  {
    id v8 = v4;
    id v9 = StackView(1);
    [v9 setAlignment:1];
    id v10 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self newTonalityControl];
    tonalityControl = self->_tonalityControl;
    self->_tonalityControl = v10;

    uint64_t v12 = [v8 tonality];
    [(UISegmentedControl *)self->_tonalityControl setSelectedSegmentIndex:v12 != 3];
    [v9 addArrangedSubview:self->_tonalityControl];
    [(PUParallaxLayerStackDebugStyleTableViewCell *)self setControlsView:v9];
LABEL_17:

    goto LABEL_18;
  }
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFE8]])
  {
    id v13 = v4;
    id v9 = StackView(1);
    [v9 setAlignment:1];
    float v14 = StackView(0);
    v15 = [v13 color];
    [v15 tone];
    double v17 = v16;

    [MEMORY[0x1E4F8A308] lowKeyTone];
    double v19 = v18;
    [MEMORY[0x1E4F8A308] highKeyTone];
    double v21 = v20;
    v22 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self intensitySliderWithWidth:100.0];
    colorSlider = self->_colorSlider;
    self->_colorSlider = v22;

    *(float *)&double v24 = v19;
    [(UISlider *)self->_colorSlider setMinimumValue:v24];
    *(float *)&double v25 = v21;
    [(UISlider *)self->_colorSlider setMaximumValue:v25];
    if (v17 >= v21) {
      double v26 = v21;
    }
    else {
      double v26 = v17;
    }
    if (v19 >= v26) {
      double v26 = v19;
    }
    *(float *)&double v26 = v26;
    [(UISlider *)self->_colorSlider setValue:v26];
    [v14 addArrangedSubview:self->_colorSlider];
    id v27 = objc_alloc(MEMORY[0x1E4FB1618]);
    v28 = [v13 color];

    v29 = objc_msgSend(v27, "initWithCGColor:", objc_msgSend(v28, "CGColor"));
    goto LABEL_15;
  }
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFF8]]
    || [(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8D000]]
    || [(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8D018]])
  {
    id v9 = StackView(1);
    [v9 setAlignment:1];
    float v14 = StackView(0);
    v30 = (void *)MEMORY[0x1E4FB1618];
    v31 = [v4 color];
    v29 = objc_msgSend(v30, "colorWithCGColor:", objc_msgSend(v31, "CGColor"));

LABEL_15:
    v32 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self colorButtonWithColor:v29 title:@"Color"];
    colorButton1 = self->_colorButton1;
    self->_colorButton1 = v32;

    [v14 addArrangedSubview:self->_colorButton1];
    [v9 addArrangedSubview:v14];
    [(PUParallaxLayerStackDebugStyleTableViewCell *)self setControlsView:v9];
LABEL_16:

    goto LABEL_17;
  }
  if ([(NSString *)self->_styleKind isEqualToString:*MEMORY[0x1E4F8CFF0]])
  {
    id v44 = v4;
    id v9 = StackView(1);
    [v9 setAlignment:1];
    float v14 = StackView(0);
    v45 = (void *)MEMORY[0x1E4FB1618];
    v46 = [v44 primaryColor];
    v29 = objc_msgSend(v45, "colorWithCGColor:", objc_msgSend(v46, "CGColor"));

    v47 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self colorButtonWithColor:v29 title:@"Primary Color"];
    v48 = self->_colorButton1;
    self->_colorButton1 = v47;

    [v14 addArrangedSubview:self->_colorButton1];
    v49 = (void *)MEMORY[0x1E4FB1618];
    v50 = [v44 secondaryColor];

    v51 = objc_msgSend(v49, "colorWithCGColor:", objc_msgSend(v50, "CGColor"));

    v52 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self colorButtonWithColor:v51 title:@"Secondary Color"];
    colorButton2 = self->_colorButton2;
    self->_colorButton2 = v52;

    [v14 addArrangedSubview:self->_colorButton2];
    [v9 addArrangedSubview:v14];
    [(PUParallaxLayerStackDebugStyleTableViewCell *)self setControlsView:v9];

    goto LABEL_16;
  }
LABEL_18:
  if (self->_controlsView)
  {
    v34 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self contentView];
    [v34 addSubview:self->_controlsView];

    [(UIView *)self->_controlsView setTranslatesAutoresizingMaskIntoConstraints:0];
    v35 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(UIView *)self->_controlsView trailingAnchor];
    v37 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:-50.0];
    v54[0] = v38;
    v39 = [(UIView *)self->_controlsView centerYAnchor];
    v40 = [(PUParallaxLayerStackDebugStyleTableViewCell *)self contentView];
    v41 = [v40 centerYAnchor];
    v42 = [v39 constraintEqualToAnchor:v41];
    v54[1] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    [v35 activateConstraints:v43];
  }
}

- (id)intensitySliderWithWidth:(double)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4FB1C38]);
  uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setMinimumValue:0.0];
  LODWORD(v7) = 1.0;
  [v6 setMaximumValue:v7];
  LODWORD(v8) = 1.0;
  [v6 setValue:v8];
  [v6 addTarget:self action:sel_updateSlider_ forControlEvents:4096];
  id v9 = (void *)MEMORY[0x1E4F28DC8];
  id v10 = [v6 widthAnchor];
  double v11 = [v10 constraintEqualToConstant:a3];
  v14[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v9 activateConstraints:v12];

  return v6;
}

- (id)colorButtonWithColor:(id)a3 title:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FB1630];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v10 setSupportsAlpha:0];
  [v10 setSelectedColor:v8];

  [v10 setTitle:v7];
  [v10 addTarget:self action:sel_updateColor_ forControlEvents:4096];
  return v10;
}

- (id)newTonalityControl
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F078AF40];
  [v3 addTarget:self action:sel_updateDelegate_ forControlEvents:4096];
  return v3;
}

@end