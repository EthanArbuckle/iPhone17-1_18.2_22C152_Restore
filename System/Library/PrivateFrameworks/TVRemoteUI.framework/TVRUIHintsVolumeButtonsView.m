@interface TVRUIHintsVolumeButtonsView
- (NSMutableArray)buttonConstraints;
- (TVRUIHintsGlyphView)glyphView;
- (TVRUIHintsStyleProvider)styleProvider;
- (TVRUIHintsVolumeButtonsView)initWithPresentation:(unint64_t)a3 styleProvider:(id)a4 buttonEdge:(unsigned int)a5 buttonHeight:(double)a6;
- (UIView)volumeDownButtonView;
- (UIView)volumeUpButtonView;
- (double)buttonHeight;
- (id)_constraintsForLeftAndRightSideButtonsWithButtonWidth:(double)a3;
- (unint64_t)presentation;
- (unsigned)buttonEdge;
- (void)_setupConstraintsForButtonEdge:(unsigned int)a3 buttonWidth:(double)a4;
- (void)_updateViewForButtonEdge:(unsigned int)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setButtonEdge:(unsigned int)a3;
- (void)setButtonHeight:(double)a3;
- (void)setGlyphView:(id)a3;
- (void)setPresentation:(unint64_t)a3;
- (void)setStyleProvider:(id)a3;
- (void)setVolumeDownButtonView:(id)a3;
- (void)setVolumeUpButtonView:(id)a3;
@end

@implementation TVRUIHintsVolumeButtonsView

- (TVRUIHintsVolumeButtonsView)initWithPresentation:(unint64_t)a3 styleProvider:(id)a4 buttonEdge:(unsigned int)a5 buttonHeight:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)TVRUIHintsVolumeButtonsView;
  v12 = -[TVRUIHintsVolumeButtonsView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v13 = v12;
  if (v12)
  {
    p_styleProvider = (id *)&v12->_styleProvider;
    objc_storeStrong((id *)&v12->_styleProvider, a4);
    v13->_presentation = a3;
    v13->_buttonHeight = a6;
    v13->_buttonEdge = v7;
    uint64_t v15 = [MEMORY[0x263EFF980] array];
    buttonConstraints = v13->_buttonConstraints;
    v13->_buttonConstraints = (NSMutableArray *)v15;

    v17 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    volumeUpButtonView = v13->_volumeUpButtonView;
    v13->_volumeUpButtonView = v17;

    [(UIView *)v13->_volumeUpButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_styleProvider buttonOutlineWidth];
    double v20 = v19;
    v21 = [(UIView *)v13->_volumeUpButtonView layer];
    [v21 setCornerRadius:v20];

    v22 = [*p_styleProvider primaryTintColor];
    [(UIView *)v13->_volumeUpButtonView setBackgroundColor:v22];

    [(TVRUIHintsVolumeButtonsView *)v13 addSubview:v13->_volumeUpButtonView];
    v23 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    volumeDownButtonView = v13->_volumeDownButtonView;
    v13->_volumeDownButtonView = v23;

    [(UIView *)v13->_volumeDownButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_styleProvider buttonOutlineWidth];
    double v26 = v25;
    v27 = [(UIView *)v13->_volumeDownButtonView layer];
    [v27 setCornerRadius:v26];

    v28 = [*p_styleProvider primaryTintColor];
    [(UIView *)v13->_volumeDownButtonView setBackgroundColor:v28];

    [(TVRUIHintsVolumeButtonsView *)v13 addSubview:v13->_volumeDownButtonView];
    v29 = [TVRUIHintsGlyphView alloc];
    v30 = [*p_styleProvider volumeImage];
    uint64_t v31 = [(TVRUIHintsGlyphView *)v29 initWithImage:v30 styleProvider:*p_styleProvider];
    glyphView = v13->_glyphView;
    v13->_glyphView = (TVRUIHintsGlyphView *)v31;

    [(TVRUIHintsGlyphView *)v13->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TVRUIHintsVolumeButtonsView *)v13 addSubview:v13->_glyphView];
    [(TVRUIHintsVolumeButtonsView *)v13 _updateViewForButtonEdge:v7];
  }

  return v13;
}

- (void)setPresentation:(unint64_t)a3
{
  if (self->_presentation != a3)
  {
    self->_presentation = a3;
    uint64_t v4 = [(TVRUIHintsVolumeButtonsView *)self buttonEdge];
    [(TVRUIHintsVolumeButtonsView *)self _updateViewForButtonEdge:v4];
  }
}

- (void)_updateViewForButtonEdge:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TVRUIHintsStyleProvider *)self->_styleProvider buttonOutlineWidth];
  double v6 = v5;
  unint64_t presentation = self->_presentation;
  if (presentation)
  {
    if (presentation == 1)
    {
      [(TVRUIHintsGlyphView *)self->_glyphView setAlpha:0.0];
      [(UIView *)self->_volumeUpButtonView setAlpha:1.0];
      volumeDownButtonView = self->_volumeDownButtonView;
      double v9 = 0.0;
    }
    else
    {
      if (presentation != 2) {
        goto LABEL_10;
      }
      [(TVRUIHintsGlyphView *)self->_glyphView setAlpha:0.0];
      [(UIView *)self->_volumeUpButtonView setAlpha:0.0];
      volumeDownButtonView = self->_volumeDownButtonView;
      double v9 = 1.0;
    }
    [(UIView *)volumeDownButtonView setAlpha:v9];
    v10 = [(TVRUIHintsVolumeButtonsView *)self styleProvider];
    if ([v10 supportsSBHints])
    {
      id v11 = [(TVRUIHintsVolumeButtonsView *)self styleProvider];
      [v11 hintButtonWidth];
      double v6 = v12;
    }
  }
  else
  {
    [(TVRUIHintsGlyphView *)self->_glyphView setAlpha:1.0];
    [(UIView *)self->_volumeUpButtonView setAlpha:1.0];
    [(UIView *)self->_volumeDownButtonView setAlpha:1.0];
  }
LABEL_10:
  v13 = [(UIView *)self->_volumeUpButtonView layer];
  [v13 setCornerRadius:v6];

  v14 = [(UIView *)self->_volumeDownButtonView layer];
  [v14 setCornerRadius:v6];

  [(TVRUIHintsVolumeButtonsView *)self _setupConstraintsForButtonEdge:v3 buttonWidth:v6];
}

- (void)_setupConstraintsForButtonEdge:(unsigned int)a3 buttonWidth:(double)a4
{
  v68[10] = *MEMORY[0x263EF8340];
  uint64_t v7 = [(TVRUIHintsVolumeButtonsView *)self buttonConstraints];

  unint64_t v8 = 0x263F08000uLL;
  if (v7)
  {
    double v9 = (void *)MEMORY[0x263F08938];
    v10 = [(TVRUIHintsVolumeButtonsView *)self buttonConstraints];
    [v9 deactivateConstraints:v10];

    id v11 = [(TVRUIHintsVolumeButtonsView *)self buttonConstraints];
    [v11 removeAllObjects];
  }
  if (a3 == 2)
  {
    buttonConstraints = self->_buttonConstraints;
    v22 = [(TVRUIHintsVolumeButtonsView *)self _constraintsForLeftAndRightSideButtonsWithButtonWidth:a4];
    [(NSMutableArray *)buttonConstraints addObjectsFromArray:v22];

    v14 = self->_buttonConstraints;
    uint64_t v15 = [(TVRUIHintsVolumeButtonsView *)self glyphView];
    v16 = [v15 rightAnchor];
    v17 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
    v18 = [v17 leftAnchor];
    double v19 = [(TVRUIHintsVolumeButtonsView *)self styleProvider];
    [v19 imageMargin];
    double v20 = -v23;
  }
  else
  {
    if (a3 == 1)
    {
      v52 = self->_buttonConstraints;
      v67 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
      v66 = [v67 heightAnchor];
      v65 = [v66 constraintEqualToConstant:a4 + a4];
      v68[0] = v65;
      v64 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
      v63 = [v64 leftAnchor];
      v62 = [(TVRUIHintsVolumeButtonsView *)self leftAnchor];
      v61 = [v63 constraintEqualToAnchor:v62];
      v68[1] = v61;
      v60 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
      v59 = [v60 widthAnchor];
      [(TVRUIHintsVolumeButtonsView *)self buttonHeight];
      v58 = objc_msgSend(v59, "constraintEqualToConstant:");
      v68[2] = v58;
      v57 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
      v56 = [v57 bottomAnchor];
      v55 = [(TVRUIHintsVolumeButtonsView *)self bottomAnchor];
      v54 = [v56 constraintEqualToAnchor:v55 constant:a4];
      v68[3] = v54;
      v53 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
      v51 = [v53 heightAnchor];
      v50 = [v51 constraintEqualToConstant:a4 + a4];
      v68[4] = v50;
      v49 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
      v48 = [v49 widthAnchor];
      [(TVRUIHintsVolumeButtonsView *)self buttonHeight];
      v47 = objc_msgSend(v48, "constraintEqualToConstant:");
      v68[5] = v47;
      v46 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
      v45 = [v46 rightAnchor];
      v44 = [(TVRUIHintsVolumeButtonsView *)self rightAnchor];
      v43 = [v45 constraintEqualToAnchor:v44];
      v68[6] = v43;
      v42 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
      v41 = [v42 bottomAnchor];
      v40 = [(TVRUIHintsVolumeButtonsView *)self bottomAnchor];
      v39 = [v41 constraintEqualToAnchor:v40 constant:a4];
      v68[7] = v39;
      v38 = [(TVRUIHintsVolumeButtonsView *)self glyphView];
      double v25 = [v38 centerXAnchor];
      double v26 = [(TVRUIHintsVolumeButtonsView *)self centerXAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      v68[8] = v27;
      v28 = [(TVRUIHintsVolumeButtonsView *)self glyphView];
      v29 = [v28 topAnchor];
      v30 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
      uint64_t v31 = [v30 bottomAnchor];
      [(TVRUIHintsStyleProvider *)self->_styleProvider imageMargin];
      v32 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31);
      v68[9] = v32;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:10];
      [(NSMutableArray *)v52 addObjectsFromArray:v33];

      unint64_t v8 = 0x263F08000;
      goto LABEL_13;
    }
    if (a3)
    {
      uint64_t v15 = _TVRUIHintsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[TVRUIHintsVolumeButtonsView _setupConstraintsForButtonEdge:buttonWidth:](v15);
      }
      goto LABEL_12;
    }
    double v12 = self->_buttonConstraints;
    v13 = [(TVRUIHintsVolumeButtonsView *)self _constraintsForLeftAndRightSideButtonsWithButtonWidth:a4];
    [(NSMutableArray *)v12 addObjectsFromArray:v13];

    v14 = self->_buttonConstraints;
    uint64_t v15 = [(TVRUIHintsVolumeButtonsView *)self glyphView];
    v16 = [v15 leftAnchor];
    v17 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
    v18 = [v17 rightAnchor];
    double v19 = [(TVRUIHintsVolumeButtonsView *)self styleProvider];
    [v19 imageMargin];
  }
  v24 = [v16 constraintEqualToAnchor:v18 constant:v20];
  [(NSMutableArray *)v14 addObject:v24];

LABEL_12:
LABEL_13:
  objc_super v34 = [(TVRUIHintsVolumeButtonsView *)self buttonConstraints];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    v36 = *(void **)(v8 + 2360);
    v37 = [(TVRUIHintsVolumeButtonsView *)self buttonConstraints];
    [v36 activateConstraints:v37];
  }
}

- (id)_constraintsForLeftAndRightSideButtonsWithButtonWidth:(double)a3
{
  v43[9] = *MEMORY[0x263EF8340];
  v42 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
  v41 = [v42 widthAnchor];
  double v5 = a3 + a3;
  v40 = [v41 constraintEqualToConstant:a3 + a3];
  v43[0] = v40;
  v39 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
  v38 = [v39 leftAnchor];
  v37 = [(TVRUIHintsVolumeButtonsView *)self leftAnchor];
  double v6 = -a3;
  v36 = [v38 constraintEqualToAnchor:v37 constant:v6];
  v43[1] = v36;
  uint64_t v35 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
  objc_super v34 = [v35 topAnchor];
  v33 = [(TVRUIHintsVolumeButtonsView *)self topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v43[2] = v32;
  uint64_t v31 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
  v30 = [v31 heightAnchor];
  [(TVRUIHintsVolumeButtonsView *)self buttonHeight];
  v29 = objc_msgSend(v30, "constraintEqualToConstant:");
  v43[3] = v29;
  v28 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
  v27 = [v28 widthAnchor];
  double v26 = [v27 constraintEqualToConstant:v5];
  v43[4] = v26;
  double v25 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
  v24 = [v25 leftAnchor];
  double v23 = [(TVRUIHintsVolumeButtonsView *)self leftAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:v6];
  v43[5] = v22;
  v21 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
  double v20 = [v21 bottomAnchor];
  double v19 = [(TVRUIHintsVolumeButtonsView *)self bottomAnchor];
  uint64_t v7 = [v20 constraintEqualToAnchor:v19];
  v43[6] = v7;
  unint64_t v8 = [(TVRUIHintsVolumeButtonsView *)self volumeDownButtonView];
  double v9 = [v8 heightAnchor];
  v10 = [(TVRUIHintsVolumeButtonsView *)self volumeUpButtonView];
  id v11 = [v10 heightAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v43[7] = v12;
  v13 = [(TVRUIHintsVolumeButtonsView *)self glyphView];
  v14 = [v13 centerYAnchor];
  uint64_t v15 = [(TVRUIHintsVolumeButtonsView *)self centerYAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v43[8] = v16;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:9];

  return v18;
}

- (TVRUIHintsGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (UIView)volumeUpButtonView
{
  return self->_volumeUpButtonView;
}

- (void)setVolumeUpButtonView:(id)a3
{
}

- (UIView)volumeDownButtonView
{
  return self->_volumeDownButtonView;
}

- (void)setVolumeDownButtonView:(id)a3
{
}

- (unint64_t)presentation
{
  return self->_presentation;
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
}

- (NSMutableArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (unsigned)buttonEdge
{
  return self->_buttonEdge;
}

- (void)setButtonEdge:(unsigned int)a3
{
  self->_buttonEdge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_volumeDownButtonView, 0);
  objc_storeStrong((id *)&self->_volumeUpButtonView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

- (void)_setupConstraintsForButtonEdge:(os_log_t)log buttonWidth:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_227326000, log, OS_LOG_TYPE_FAULT, "Volume buttons edge is being reported as the bottom of the device", v1, 2u);
}

@end