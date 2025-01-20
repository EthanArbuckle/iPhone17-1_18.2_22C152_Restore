@interface UIKBUndoControl
+ (id)controlLableTextByType:(int64_t)a3 style:(id)a4 available:(BOOL)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSLayoutConstraint)coverConstraintBottomAnchor;
- (NSLayoutConstraint)coverConstraintLeftAnchor;
- (NSLayoutConstraint)coverConstraintRightAnchor;
- (NSLayoutConstraint)coverConstraintTopAnchor;
- (UIImageView)icon;
- (UIKBUndoControl)initWithType:(int64_t)a3 andStyling:(id)a4;
- (UIKBUndoStyling)style;
- (UILabel)label;
- (UIView)springCoverView;
- (_UISlotView)securePasteButtonSlotView;
- (id)controlImageByType:(int64_t)a3;
- (id)controlLabelImageNameByType:(int64_t)a3 isRTL:(BOOL)a4;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)type;
- (unsigned)_secureName;
- (void)configureSecurePasteButtonInRootView:(id)a3;
- (void)layoutControlForType:(int64_t)a3 andStyling:(id)a4;
- (void)layoutSubviews;
- (void)setCoverConstraintBottomAnchor:(id)a3;
- (void)setCoverConstraintLeftAnchor:(id)a3;
- (void)setCoverConstraintRightAnchor:(id)a3;
- (void)setCoverConstraintTopAnchor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSecurePasteButtonSlotView:(id)a3;
- (void)setSpringCoverView:(id)a3;
- (void)setStyle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateCoverWithTavelProcess:(double)a3 isRTL:(BOOL)a4;
- (void)updateUndoControlStyle;
@end

@implementation UIKBUndoControl

- (UIKBUndoControl)initWithType:(int64_t)a3 andStyling:(id)a4
{
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)UIKBUndoControl;
  v8 = [(UIView *)&v32 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_style, a4);
    v10 = +[UIColor clearColor];
    [(UIView *)v9 setBackgroundColor:v10];

    v11 = objc_alloc_init(UIView);
    springCoverView = v9->_springCoverView;
    v9->_springCoverView = v11;

    [(UIView *)v9->_springCoverView setUserInteractionEnabled:0];
    v13 = [v7 HUDbackgroundColor];
    [(UIView *)v9->_springCoverView setBackgroundColor:v13];

    [(UIView *)v9->_springCoverView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v9 addSubview:v9->_springCoverView];
    v14 = [(UIView *)v9->_springCoverView leftAnchor];
    v15 = [(UIView *)v9 leftAnchor];
    uint64_t v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    coverConstraintLeftAnchor = v9->_coverConstraintLeftAnchor;
    v9->_coverConstraintLeftAnchor = (NSLayoutConstraint *)v16;

    [(NSLayoutConstraint *)v9->_coverConstraintLeftAnchor setActive:1];
    v18 = [(UIView *)v9->_springCoverView rightAnchor];
    v19 = [(UIView *)v9 rightAnchor];
    uint64_t v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
    coverConstraintRightAnchor = v9->_coverConstraintRightAnchor;
    v9->_coverConstraintRightAnchor = (NSLayoutConstraint *)v20;

    [(NSLayoutConstraint *)v9->_coverConstraintRightAnchor setActive:1];
    v22 = [(UIView *)v9->_springCoverView topAnchor];
    v23 = [(UIView *)v9 topAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23 constant:0.0];
    coverConstraintTopAnchor = v9->_coverConstraintTopAnchor;
    v9->_coverConstraintTopAnchor = (NSLayoutConstraint *)v24;

    [(NSLayoutConstraint *)v9->_coverConstraintTopAnchor setActive:1];
    v26 = [(UIView *)v9->_springCoverView bottomAnchor];
    v27 = [(UIView *)v9 bottomAnchor];
    uint64_t v28 = [v26 constraintEqualToAnchor:v27 constant:0.0];
    coverConstraintBottomAnchor = v9->_coverConstraintBottomAnchor;
    v9->_coverConstraintBottomAnchor = (NSLayoutConstraint *)v28;

    [(NSLayoutConstraint *)v9->_coverConstraintBottomAnchor setActive:1];
    [(UIKBUndoControl *)v9 layoutControlForType:a3 andStyling:v7];
    [(UIView *)v9 _setDisableDictationTouchCancellation:1];
    v30 = v9;
  }

  return v9;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBUndoControl;
  [(UIView *)&v8 layoutSubviews];
  v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }

  v5 = [(UIKBUndoControl *)self style];
  [v5 setAppearance:v4];

  v6 = [(UIView *)self traitOverrides];
  id v7 = self;
  [v6 setNSIntegerValue:v4 forTrait:v7];
}

- (void)updateUndoControlStyle
{
  UIControlState v3 = [(UIControl *)self state];
  if (v3 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
    [WeakRetained setAlpha:0.0];

    id v7 = [(UIKBUndoStyling *)self->_style buttonGlyphColorDisabled];
    [(UILabel *)self->_label setTextColor:v7];
    [(UIView *)self->_icon setTintColor:v7];

    springCoverView = self->_springCoverView;
    [(UIView *)springCoverView setAlpha:1.0];
  }
  else
  {
    if (v3 == 1)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
        [v10 setAlpha:1.0];

        +[UIColor clearColor];
      }
      else
      {
        [(UIKBUndoStyling *)self->_style buttonGlyphColorPressed];
      v14 = };
      [(UILabel *)self->_label setTextColor:v14];
      [(UIView *)self->_icon setTintColor:v14];

      v12 = [(UIKBUndoControl *)self springCoverView];
      id v15 = v12;
      double v13 = 0.0;
    }
    else
    {
      if (v3) {
        return;
      }
      id v4 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

      if (v4)
      {
        id v5 = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
        [v5 setAlpha:0.8];

        +[UIColor clearColor];
      }
      else
      {
        [(UIKBUndoStyling *)self->_style buttonGlyphColorEnabled];
      v11 = };
      [(UILabel *)self->_label setTextColor:v11];
      [(UIView *)self->_icon setTintColor:v11];

      v12 = [(UIKBUndoControl *)self springCoverView];
      id v15 = v12;
      double v13 = 1.0;
    }
    [v12 setAlpha:v13];
  }
}

- (void)updateCoverWithTavelProcess:(double)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(UIKBUndoControl *)self type] == 1)
  {
    if (v4)
    {
LABEL_3:
      [(UIView *)self bounds];
      double v7 = CGRectGetWidth(v16) * a3;
      objc_super v8 = [(UIKBUndoControl *)self coverConstraintLeftAnchor];
LABEL_14:
      v14 = v8;
      [v8 setConstant:v7];

      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if ([(UIKBUndoControl *)self type] == 2)
  {
    if (!v4) {
      goto LABEL_3;
    }
LABEL_6:
    [(UIView *)self bounds];
    double v7 = -(a3 * CGRectGetWidth(v17));
LABEL_13:
    objc_super v8 = [(UIKBUndoControl *)self coverConstraintRightAnchor];
    goto LABEL_14;
  }
  if ([(UIKBUndoControl *)self type] == 4 || [(UIKBUndoControl *)self type] == 3)
  {
    [(UIView *)self bounds];
    CGFloat v9 = CGRectGetWidth(v18) * a3 * 0.5;
    id v10 = [(UIKBUndoControl *)self coverConstraintLeftAnchor];
    [v10 setConstant:v9];

    [(UIView *)self bounds];
    double v7 = -(a3 * CGRectGetWidth(v19)) * 0.5;
    goto LABEL_13;
  }
  if ([(UIKBUndoControl *)self type] == 5 || [(UIKBUndoControl *)self type] == 6)
  {
    double v11 = 1.0 - a3;
    [(UIView *)self bounds];
    double v12 = (1.0 - a3) * CGRectGetWidth(v20) * 0.5;
    double v13 = [(UIKBUndoControl *)self coverConstraintLeftAnchor];
    [v13 setConstant:v12];

    [(UIView *)self bounds];
    double v7 = v11 * CGRectGetWidth(v21) * -0.5;
    goto LABEL_13;
  }
LABEL_15:
  [(UIView *)self layoutIfNeeded];
}

- (id)controlLabelImageNameByType:(int64_t)a3 isRTL:(BOOL)a4
{
  switch(a3)
  {
    case 1:
      id v5 = @"arrow.uturn.backward";
      v6 = @"arrow.uturn.forward";
      goto LABEL_6;
    case 2:
      id v5 = @"arrow.uturn.forward";
      v6 = @"arrow.uturn.backward";
LABEL_6:
      if (a4) {
        id v5 = v6;
      }
      BOOL v4 = v5;
      break;
    case 3:
      BOOL v4 = @"scissors";
      break;
    case 4:
      BOOL v4 = @"doc.on.doc";
      break;
    case 5:
    case 6:
      BOOL v4 = @"doc.on.clipboard";
      break;
    default:
      BOOL v4 = 0;
      break;
  }
  return v4;
}

- (id)controlImageByType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    BOOL v4 = 0;
  }
  else
  {
    UIControlState v3 = +[UIImage systemImageNamed:off_1E52FEE70[a3 - 1]];
    BOOL v4 = [v3 imageWithRenderingMode:2];
  }
  return v4;
}

+ (id)controlLableTextByType:(int64_t)a3 style:(id)a4 available:(BOOL)a5
{
  id v7 = a4;
  objc_super v8 = v7;
  switch(a3)
  {
    case 1:
      if (a5)
      {
        CGFloat v9 = @"UNDO_BUTTON_TITLE_LABEL_IN_HUD";
        id v10 = @"Undo";
        goto LABEL_21;
      }
      CGFloat v9 = @"Nothing to Undo";
      goto LABEL_20;
    case 2:
      if (a5)
      {
        CGFloat v9 = @"REDO_BUTTON_TITLE_LABEL_IN_HUD";
        id v10 = @"Redo";
      }
      else
      {
        CGFloat v9 = @"Nothing to Redo";
LABEL_20:
        id v10 = v9;
      }
LABEL_21:
      double v11 = _UILocalizedStringInSystemLanguage(v9, v10);
LABEL_22:

      return v11;
    case 3:
      if (a5) {
        CGFloat v9 = @"Cut";
      }
      else {
        CGFloat v9 = @"Nothing to Cut";
      }
      goto LABEL_20;
    case 4:
      if (a5) {
        CGFloat v9 = @"Copy";
      }
      else {
        CGFloat v9 = @"Nothing to Copy";
      }
      goto LABEL_20;
    case 5:
      if (a5) {
        CGFloat v9 = @"Paste";
      }
      else {
        CGFloat v9 = @"Nothing to Paste";
      }
      goto LABEL_20;
    case 6:
      if ([v7 tooSmallForInstructionalText])
      {
        CGFloat v9 = @"PASTE_ALLOW_BUTTON_WITHOUT_EXPLANATION_TEXT";
        id v10 = @"Allow Paste";
      }
      else
      {
        CGFloat v9 = @"PASTE_ALLOW_BUTTON_TEXT";
        id v10 = @"Allow";
      }
      goto LABEL_21;
    default:
      double v11 = 0;
      goto LABEL_22;
  }
}

- (void)layoutControlForType:(int64_t)a3 andStyling:(id)a4
{
  id v59 = a4;
  v6 = [(UIKBUndoControl *)self controlImageByType:a3];
  id v7 = [[UIImageView alloc] initWithImage:v6];
  icon = self->_icon;
  self->_icon = v7;

  [(UIImageView *)self->_icon setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_icon setContentMode:1];
  CGFloat v9 = [v59 undoInteractiveControlLabelFont];
  id v10 = +[UIImageSymbolConfiguration configurationWithFont:v9];
  [(UIImageView *)self->_icon setPreferredSymbolConfiguration:v10];

  if ([(UIKBUndoStyling *)self->_style isRTL]) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 3;
  }
  [(UIImageView *)self->_icon setSemanticContentAttribute:v11];
  [(UIView *)self addSubview:self->_icon];
  if ((unint64_t)(a3 - 3) > 3)
  {
    if (![v59 undoRedoIconOnly])
    {
      v35 = objc_alloc_init(UILabel);
      label = self->_label;
      self->_label = v35;

      [(UIView *)self addSubview:self->_label];
      [(UIView *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
      v37 = [(id)objc_opt_class() controlLableTextByType:a3 style:self->_style available:1];
      [(UILabel *)self->_label setText:v37];

      v38 = [(UIKBUndoStyling *)self->_style undoInteractiveControlLabelFont];
      [(UILabel *)self->_label setFont:v38];

      v39 = [(UIView *)self->_icon firstBaselineAnchor];
      v40 = [(UIView *)self->_label firstBaselineAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      [v41 setActive:1];

      v42 = [(UIView *)self->_label centerYAnchor];
      v43 = [(UIView *)self centerYAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      [v44 setActive:1];

      if (a3 == 1)
      {
        v45 = [(UIView *)self->_icon leadingAnchor];
        v46 = [(UIView *)self leadingAnchor];
        v47 = [v45 constraintEqualToAnchor:v46 constant:21.0];
        [v47 setActive:1];

        v48 = [(UIView *)self->_label leadingAnchor];
        v49 = [(UIView *)self->_icon trailingAnchor];
        v50 = [v48 constraintEqualToAnchor:v49 constant:4.0];
        [v50 setActive:1];

        objc_super v32 = [(UIView *)self trailingAnchor];
        v33 = [(UIView *)self->_label trailingAnchor];
        double v51 = 22.0;
      }
      else
      {
        v52 = [(UIView *)self->_label leadingAnchor];
        v53 = [(UIView *)self leadingAnchor];
        v54 = [v52 constraintEqualToAnchor:v53 constant:22.0];
        [v54 setActive:1];

        v55 = [(UIView *)self->_icon leadingAnchor];
        v56 = [(UIView *)self->_label trailingAnchor];
        v57 = [v55 constraintEqualToAnchor:v56 constant:4.0];
        [v57 setActive:1];

        objc_super v32 = [(UIView *)self trailingAnchor];
        v33 = [(UIView *)self->_icon trailingAnchor];
        double v51 = 21.0;
      }
      v34 = [v32 constraintEqualToAnchor:v33 constant:v51];
      goto LABEL_16;
    }
    CGRect v17 = [(UIView *)self->_icon centerXAnchor];
    CGRect v18 = [(UIView *)self centerXAnchor];
    CGRect v19 = [v17 constraintEqualToAnchor:v18];
  }
  else
  {
    int v12 = [v59 cutCopyPasteIconOnly];
    double v13 = self->_icon;
    if (!v12)
    {
      [(UIView *)v13 removeFromSuperview];
      v22 = objc_alloc_init(UILabel);
      v23 = self->_label;
      self->_label = v22;

      [(UIView *)self addSubview:self->_label];
      [(UIView *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)self->_label setTextAlignment:1];
      uint64_t v24 = [(id)objc_opt_class() controlLableTextByType:a3 style:self->_style available:1];
      [(UILabel *)self->_label setText:v24];

      v25 = [v59 undoInteractiveControlLabelFont];
      [(UILabel *)self->_label setFont:v25];

      v26 = [(UIView *)self->_label leadingAnchor];
      v27 = [(UIView *)self leadingAnchor];
      uint64_t v28 = [v26 constraintEqualToAnchor:v27 constant:16.0];
      [v28 setActive:1];

      v29 = [(UIView *)self trailingAnchor];
      v30 = [(UIView *)self->_label trailingAnchor];
      v31 = [v29 constraintEqualToAnchor:v30 constant:16.0];
      [v31 setActive:1];

      CGRect v21 = self->_label;
      goto LABEL_11;
    }
    v14 = [(UIView *)v13 leadingAnchor];
    id v15 = [(UIView *)self leadingAnchor];
    CGRect v16 = [v14 constraintEqualToAnchor:v15 constant:16.0];
    [v16 setActive:1];

    CGRect v17 = [(UIView *)self trailingAnchor];
    CGRect v18 = [(UIView *)self->_icon trailingAnchor];
    CGRect v19 = [v17 constraintEqualToAnchor:v18 constant:16.0];
  }
  CGRect v20 = v19;
  [v19 setActive:1];

  CGRect v21 = self->_icon;
LABEL_11:
  objc_super v32 = [v21 centerYAnchor];
  v33 = [(UIView *)self centerYAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
LABEL_16:
  v58 = v34;
  [v34 setActive:1];
}

- (void)configureSecurePasteButtonInRootView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

  if (WeakRetained)
  {
    v6 = (_UISlotView *)objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  }
  else
  {
    v6 = objc_alloc_init(_UISlotView);
    objc_storeWeak((id *)&self->_securePasteButtonSlotView, v6);
  }
  BOOL v7 = [(UIKBUndoStyling *)self->_style cutCopyPasteIconOnly];
  objc_super v8 = (void *)MEMORY[0x1E4F881E0];
  [(UIKBUndoStyling *)self->_style cutControlMinWidth];
  if (v7) {
    objc_msgSend(v8, "undoInteractionHUDIconPasteButtonTagWithMinWidth:");
  }
  else {
  CGFloat v9 = objc_msgSend(v8, "undoInteractionHUDTextPasteButtonTagWithMinWidth:");
  }
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke;
  v18[3] = &unk_1E52DDC40;
  id v10 = v9;
  id v19 = v10;
  [(_UISlotView *)v6 _setSlotStyleResolver:v18];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_2;
  id v15 = &unk_1E52DDCB8;
  id v11 = v10;
  id v16 = v11;
  objc_copyWeak(&v17, &location);
  [(_UISlotView *)v6 _setSlotAnyContentProvider:&v12];
  -[_UISlotView _overlayView:centerInView:](v6, "_overlayView:centerInView:", v4, self, v12, v13, v14, v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

uint64_t __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedStyleForStyle:a2];
}

void __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  CGFloat v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_3;
  block[3] = &unk_1E52DDC90;
  v16[1] = a2;
  id v13 = v7;
  id v14 = *(id *)(a1 + 32);
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_3(uint64_t a1)
{
  v2 = +[_UIConcretePasteboard _remoteContentForLayerContextWithId:*(void *)(a1 + 64) slotStyle:*(void *)(a1 + 32) pasteButtonTag:*(void *)(a1 + 40)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_4;
    block[3] = &unk_1E52DDC68;
    id v5 = *(id *)(a1 + 48);
    id v4 = v2;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
  }
}

void __56__UIKBUndoControl_configureSecurePasteButtonInRootView___block_invoke_4(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained updateUndoControlStyle];
  }
}

- (unsigned)_secureName
{
  return (self->_type == 5) << 16;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6 + -20.0;
  double v9 = v8 + 40.0;
  double v11 = v10 + -20.0;
  double v13 = v12 + 40.0;
  CGFloat v14 = x;
  CGFloat v15 = y;
  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v14);
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIKBUndoStyling)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (UIView)springCoverView
{
  return self->_springCoverView;
}

- (void)setSpringCoverView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIImageView)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (_UISlotView)securePasteButtonSlotView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  return (_UISlotView *)WeakRetained;
}

- (void)setSecurePasteButtonSlotView:(id)a3
{
}

- (NSLayoutConstraint)coverConstraintLeftAnchor
{
  return self->_coverConstraintLeftAnchor;
}

- (void)setCoverConstraintLeftAnchor:(id)a3
{
}

- (NSLayoutConstraint)coverConstraintRightAnchor
{
  return self->_coverConstraintRightAnchor;
}

- (void)setCoverConstraintRightAnchor:(id)a3
{
}

- (NSLayoutConstraint)coverConstraintTopAnchor
{
  return self->_coverConstraintTopAnchor;
}

- (void)setCoverConstraintTopAnchor:(id)a3
{
}

- (NSLayoutConstraint)coverConstraintBottomAnchor
{
  return self->_coverConstraintBottomAnchor;
}

- (void)setCoverConstraintBottomAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverConstraintBottomAnchor, 0);
  objc_storeStrong((id *)&self->_coverConstraintTopAnchor, 0);
  objc_storeStrong((id *)&self->_coverConstraintRightAnchor, 0);
  objc_storeStrong((id *)&self->_coverConstraintLeftAnchor, 0);
  objc_destroyWeak((id *)&self->_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_springCoverView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end