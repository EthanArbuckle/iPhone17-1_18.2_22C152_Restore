@interface TVRUIHintsUserIntentButtonView
- (NSArray)buttonConstraints;
- (TVRUIHintsGlyphView)glyphView;
- (TVRUIHintsStyleProvider)styleProvider;
- (TVRUIHintsUserIntentButtonView)initWithPresentation:(unint64_t)a3 styleProvider:(id)a4 buttonEdge:(unsigned int)a5;
- (UIView)buttonOutline;
- (unint64_t)presentation;
- (unsigned)buttonEdge;
- (void)_setupConstraintsForButtonEdge:(unsigned int)a3 buttonWidth:(double)a4;
- (void)_updateViewForButtonEdge:(unsigned int)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setButtonEdge:(unsigned int)a3;
- (void)setButtonOutline:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setPresentation:(unint64_t)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation TVRUIHintsUserIntentButtonView

- (TVRUIHintsUserIntentButtonView)initWithPresentation:(unint64_t)a3 styleProvider:(id)a4 buttonEdge:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TVRUIHintsUserIntentButtonView;
  v10 = -[TVRUIHintsUserIntentButtonView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v11 = v10;
  if (v10)
  {
    p_styleProvider = (id *)&v10->_styleProvider;
    objc_storeStrong((id *)&v10->_styleProvider, a4);
    v11->_presentation = a3;
    v11->_buttonEdge = v5;
    id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(TVRUIHintsUserIntentButtonView *)v11 setButtonOutline:v13];

    v14 = [(TVRUIHintsUserIntentButtonView *)v11 buttonOutline];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [*p_styleProvider primaryTintColor];
    v16 = [(TVRUIHintsUserIntentButtonView *)v11 buttonOutline];
    [v16 setBackgroundColor:v15];

    v17 = [(TVRUIHintsUserIntentButtonView *)v11 buttonOutline];
    [(TVRUIHintsUserIntentButtonView *)v11 addSubview:v17];

    v18 = [*p_styleProvider siriImage];
    v19 = [[TVRUIHintsGlyphView alloc] initWithImage:v18 styleProvider:*p_styleProvider];
    glyphView = v11->_glyphView;
    v11->_glyphView = v19;

    [(TVRUIHintsGlyphView *)v11->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TVRUIHintsUserIntentButtonView *)v11 addSubview:v11->_glyphView];
    [(TVRUIHintsUserIntentButtonView *)v11 _updateViewForButtonEdge:v5];
  }
  return v11;
}

- (void)setPresentation:(unint64_t)a3
{
  if (self->_presentation != a3)
  {
    self->_presentation = a3;
    uint64_t v4 = [(TVRUIHintsUserIntentButtonView *)self buttonEdge];
    [(TVRUIHintsUserIntentButtonView *)self _updateViewForButtonEdge:v4];
  }
}

- (void)_updateViewForButtonEdge:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TVRUIHintsStyleProvider *)self->_styleProvider buttonOutlineWidth];
  double v6 = v5;
  unint64_t presentation = self->_presentation;
  v8 = [(TVRUIHintsUserIntentButtonView *)self glyphView];
  id v9 = v8;
  if (presentation == 1)
  {
    [v8 setAlpha:0.0];

    id v9 = [(TVRUIHintsUserIntentButtonView *)self styleProvider];
    if ([v9 supportsSBHints])
    {
      v10 = [(TVRUIHintsUserIntentButtonView *)self styleProvider];
      [v10 hintButtonWidth];
      double v6 = v11;
    }
  }
  else
  {
    [v8 setAlpha:1.0];
  }

  v12 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
  id v13 = [v12 layer];
  [v13 setCornerRadius:v6];

  [(TVRUIHintsUserIntentButtonView *)self _setupConstraintsForButtonEdge:v3 buttonWidth:v6];
}

- (void)_setupConstraintsForButtonEdge:(unsigned int)a3 buttonWidth:(double)a4
{
  v7 = [(TVRUIHintsUserIntentButtonView *)self buttonConstraints];

  unint64_t v8 = 0x263F08000uLL;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x263F08938];
    v10 = [(TVRUIHintsUserIntentButtonView *)self buttonConstraints];
    [v9 deactivateConstraints:v10];

    [(TVRUIHintsUserIntentButtonView *)self setButtonConstraints:0];
  }
  if (a3 == 2)
  {
    v52 = (void *)MEMORY[0x263EFF8C0];
    v68 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v66 = [v68 widthAnchor];
    v48 = [v66 constraintEqualToConstant:a4 + a4];
    v64 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v62 = [v64 rightAnchor];
    v60 = [(TVRUIHintsUserIntentButtonView *)self rightAnchor];
    v70 = [v62 constraintEqualToAnchor:v60 constant:a4];
    v58 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v56 = [v58 topAnchor];
    v54 = [(TVRUIHintsUserIntentButtonView *)self topAnchor];
    v38 = [v56 constraintEqualToAnchor:v54];
    v50 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v46 = [v50 bottomAnchor];
    v44 = [(TVRUIHintsUserIntentButtonView *)self bottomAnchor];
    objc_super v22 = [v46 constraintEqualToAnchor:v44];
    v42 = [(TVRUIHintsUserIntentButtonView *)self glyphView];
    v40 = [v42 centerYAnchor];
    v23 = [(TVRUIHintsUserIntentButtonView *)self centerYAnchor];
    v24 = [v40 constraintEqualToAnchor:v23];
    v25 = [(TVRUIHintsUserIntentButtonView *)self glyphView];
    v26 = [v25 rightAnchor];
    v27 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v28 = [v27 leftAnchor];
    [(TVRUIHintsStyleProvider *)self->_styleProvider imageMargin];
    v30 = [v26 constraintEqualToAnchor:v28 constant:-v29];
    objc_msgSend(v52, "arrayWithObjects:", v48, v70, v38, v22, v24, v30, 0);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    buttonConstraints = self->_buttonConstraints;
    self->_buttonConstraints = v31;

    unint64_t v8 = 0x263F08000;
    v21 = v68;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v49 = (void *)MEMORY[0x263EFF8C0];
    v65 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v63 = [v65 heightAnchor];
    v69 = [v63 constraintEqualToConstant:a4 + a4];
    v61 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v59 = [v61 leftAnchor];
    v57 = [(TVRUIHintsUserIntentButtonView *)self leftAnchor];
    v67 = [v59 constraintEqualToAnchor:v57];
    v55 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v53 = [v55 rightAnchor];
    v51 = [(TVRUIHintsUserIntentButtonView *)self rightAnchor];
    v37 = [v53 constraintEqualToAnchor:v51];
    v47 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v45 = [v47 bottomAnchor];
    v43 = [(TVRUIHintsUserIntentButtonView *)self bottomAnchor];
    double v11 = [v45 constraintEqualToAnchor:v43 constant:a4];
    v41 = [(TVRUIHintsUserIntentButtonView *)self glyphView];
    v39 = [v41 centerXAnchor];
    v12 = [(TVRUIHintsUserIntentButtonView *)self centerXAnchor];
    id v13 = [v39 constraintEqualToAnchor:v12];
    v14 = [(TVRUIHintsUserIntentButtonView *)self glyphView];
    v15 = [v14 topAnchor];
    v16 = [(TVRUIHintsUserIntentButtonView *)self buttonOutline];
    v17 = [v16 bottomAnchor];
    [(TVRUIHintsStyleProvider *)self->_styleProvider imageMargin];
    v18 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
    objc_msgSend(v49, "arrayWithObjects:", v69, v67, v37, v11, v13, v18, 0);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_buttonConstraints;
    self->_buttonConstraints = v19;

    unint64_t v8 = 0x263F08000;
    v21 = v65;
LABEL_7:

    goto LABEL_11;
  }
  v33 = _TVRUIHintsLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
    -[TVRUIHintsUserIntentButtonView _setupConstraintsForButtonEdge:buttonWidth:](v33);
  }

LABEL_11:
  v34 = [(TVRUIHintsUserIntentButtonView *)self buttonConstraints];

  if (v34)
  {
    v35 = *(void **)(v8 + 2360);
    v36 = [(TVRUIHintsUserIntentButtonView *)self buttonConstraints];
    [v35 activateConstraints:v36];
  }
}

- (TVRUIHintsGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (unint64_t)presentation
{
  return self->_presentation;
}

- (UIView)buttonOutline
{
  return self->_buttonOutline;
}

- (void)setButtonOutline:(id)a3
{
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (NSArray)buttonConstraints
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
  objc_storeStrong((id *)&self->_buttonOutline, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

- (void)_setupConstraintsForButtonEdge:(os_log_t)log buttonWidth:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_227326000, log, OS_LOG_TYPE_FAULT, "User intent buttons edge is being reported as the left or bottom of the device", v1, 2u);
}

@end