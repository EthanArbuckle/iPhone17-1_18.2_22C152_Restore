@interface _UIDatePickerCompactDateLabel
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)highlightedForTouch;
- (BOOL)isEnabled;
- (BOOL)tapInteractionControlledExternally;
- (NSArray)titles;
- (NSDictionary)overrideAttributes;
- (UIButton)backgroundView;
- (_UIDatePickerCompactDateLabel)initWithFrame:(CGRect)a3;
- (_UIDatePickerCompactDateLabelDelegate)delegate;
- (_UIDatePickerLinkedLabel)textLabel;
- (_UIDatePickerOverlayPresentation)overlayPresentation;
- (_UIDatePickerStyle)visualStyle;
- (double)minimumScaleFactor;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)textAlignment;
- (void)activateLabel;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightedForTouch:(BOOL)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setOverlayPresentation:(id)a3;
- (void)setOverrideAttributes:(id)a3;
- (void)setTapInteractionControlledExternally:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextLabel:(id)a3;
- (void)setTitles:(id)a3;
- (void)setVisualStyle:(id)a3;
@end

@implementation _UIDatePickerCompactDateLabel

- (_UIDatePickerCompactDateLabel)initWithFrame:(CGRect)a3
{
  v61[8] = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)_UIDatePickerCompactDateLabel;
  v3 = -[UIView initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 traitCollection];
    uint64_t v6 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v5 userInterfaceIdiom]);
    visualStyle = v4->_visualStyle;
    v4->_visualStyle = (_UIDatePickerStyle *)v6;

    v4->_enabled = 1;
    [(_UIDatePickerStyle *)v4->_visualStyle compactLabelCornerRadius];
    -[UIView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
    v8 = objc_opt_new();
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    [v8 setFont:v9];

    [v8 setAdjustsFontForContentSizeCategory:1];
    [v8 setUserInteractionEnabled:0];
    LODWORD(v10) = 1144733696;
    [v8 setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1144766464;
    [v8 setContentHuggingPriority:0 forAxis:v11];
    objc_storeStrong((id *)&v4->_textLabel, v8);
    v51 = [(_UIDatePickerStyle *)v4->_visualStyle compactLabelBackgroundButtonConfiguration];
    objc_initWeak(&location, v4);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke;
    v57[3] = &unk_1E52DDB60;
    objc_copyWeak(&v58, &location);
    v12 = +[UIAction actionWithHandler:v57];
    v52 = +[UIButton buttonWithConfiguration:v51 primaryAction:v12];

    [v52 setConfigurationUpdateHandler:&__block_literal_global_123];
    [v52 setPreferredBehavioralStyle:1];
    [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v4->_backgroundView, v52);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_3;
    v55[3] = &unk_1E52DDB60;
    objc_copyWeak(&v56, &location);
    v13 = +[UIAction actionWithHandler:v55];
    [v52 addAction:v13 forControlEvents:17];

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_4;
    v53[3] = &unk_1E52DDB60;
    objc_copyWeak(&v54, &location);
    v14 = +[UIAction actionWithHandler:v53];
    [v52 addAction:v14 forControlEvents:480];

    [(UIView *)v4 addSubview:v52];
    [v52 addSubview:v8];
    v15 = [[UITapGestureRecognizer alloc] initWithTarget:v4 action:sel_activateLabel];
    [(UITapGestureRecognizer *)v15 setAllowedPressTypes:&unk_1ED3EF728];
    [(UIView *)v4 addGestureRecognizer:v15];
    v30 = v15;
    [(_UIDatePickerStyle *)v4->_visualStyle compactLabelBackgroundPadding];
    double v17 = v16;
    double v19 = v18;
    v31 = (void *)MEMORY[0x1E4F5B268];
    v50 = [(UIView *)v4 leadingAnchor];
    v49 = [v8 leadingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:-v17];
    v61[0] = v48;
    v47 = [(UIView *)v4 trailingAnchor];
    v46 = [v8 trailingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:v17];
    v61[1] = v45;
    v44 = [(UIView *)v4 topAnchor];
    v43 = [v8 topAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:-v19];
    v61[2] = v42;
    v41 = [(UIView *)v4 bottomAnchor];
    v40 = [v8 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:v19];
    v61[3] = v39;
    v37 = [v52 leadingAnchor];
    v38 = [v8 contentLayoutGuide];
    v36 = [v38 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:-v17];
    v61[4] = v35;
    v33 = [v52 trailingAnchor];
    v34 = [v8 contentLayoutGuide];
    v32 = [v34 trailingAnchor];
    v20 = [v33 constraintEqualToAnchor:v32 constant:v17];
    v61[5] = v20;
    v21 = [v52 topAnchor];
    v22 = [v8 topAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:-v19];
    v61[6] = v23;
    v24 = [v52 bottomAnchor];
    v25 = [v8 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:v19];
    v61[7] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:8];
    [v31 activateConstraints:v27];

    v28 = [[UIPointerInteraction alloc] initWithDelegate:v4];
    [(UIView *)v4 addInteraction:v28];

    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)activateLabel
{
  v3 = [(_UIDatePickerCompactDateLabel *)self overlayPresentation];
  if ([v3 activeMode] == 2)
  {
    [v3 dismissPresentationAnimated:1];
  }
  else
  {
    BOOL v4 = [(_UIDatePickerCompactDateLabel *)self tapInteractionControlledExternally];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46___UIDatePickerCompactDateLabel_activateLabel__block_invoke;
    v13[3] = &unk_1E52E0478;
    v13[4] = self;
    BOOL v14 = v4;
    v5 = _Block_copy(v13);
    uint64_t v6 = [(_UIDatePickerStyle *)self->_visualStyle compactLabelTextColorForEditingState:1];
    v7 = [(_UIDatePickerCompactDateLabel *)self textLabel];
    [v7 setTextColor:v6];

    v8 = [(_UIDatePickerCompactDateLabel *)self backgroundView];
    [v8 setSelected:1];

    if (v4)
    {
      [v3 activateEmptyPresentationWithMode:2 onDismiss:v5];
    }
    else
    {
      v9 = [(_UIDatePickerCompactDateLabel *)self delegate];
      [v9 compactDateLabelDidBeginEditing:self];

      double v10 = [(_UIDatePickerCompactDateLabel *)self delegate];
      double v11 = [v10 createDatePickerForCompactDateLabel:self];

      v12 = [v3 sourceView];
      [(UIView *)self bounds];
      objc_msgSend(v12, "convertRect:fromView:", self);
      objc_msgSend(v3, "setSourceRect:");

      [v3 presentDatePicker:v11 onDismiss:v5];
    }
  }
}

- (void)setHighlightedForTouch:(BOOL)a3
{
  if (self->_highlightedForTouch != a3)
  {
    BOOL v3 = a3;
    self->_highlightedForTouch = a3;
    id v4 = [(_UIDatePickerCompactDateLabel *)self textLabel];
    v5 = [v4 traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] == 2;

    double v7 = dbl_186B935B0[v6];
    v9[1] = 3221225472;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[2] = ___UIDateLabelAnimateHighlight_block_invoke;
    v9[3] = &unk_1E52D9CD0;
    if (!v3) {
      double v7 = 1.0;
    }
    id v10 = v4;
    double v11 = v7;
    id v8 = v4;
    +[UIView animateWithDuration:327684 delay:v9 options:0 animations:0.47 completion:0.0];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  if ([a4 _pointerType] == 1) {
    double v7 = @"datePicker.date.all.pencil";
  }
  else {
    double v7 = @"datePicker.date.all";
  }
  [v6 rect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v7, v9, v11, v13, v15);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = objc_msgSend(a4, "identifier", a3);
  int v6 = [v5 isEqual:@"datePicker.date.all.pencil"];

  if (v6)
  {
    double v7 = (UITargetedPreview *)objc_opt_new();
    double v8 = [(_UIDatePickerCompactDateLabel *)self backgroundView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(UIView *)self layer];
    [v17 cornerRadius];
    double v19 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v18);
    [(UITargetedPreview *)v7 setShadowPath:v19];

    v20 = [[UITargetedPreview alloc] initWithView:self parameters:v7];
    v21 = +[UIPointerEffect effectWithPreview:v20];
    v22 = [(_UIDatePickerCompactDateLabel *)self backgroundView];
    [v22 frame];
    CGRect v39 = CGRectInset(v38, 5.0, 5.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;

    v27 = [(UIView *)self layer];
    [v27 cornerRadius];
    double v29 = v28;
  }
  else
  {
    v30 = [UITargetedPreview alloc];
    v31 = [(_UIDatePickerCompactDateLabel *)self textLabel];
    double v7 = [(UITargetedPreview *)v30 initWithView:v31];

    v21 = +[UIPointerEffect effectWithPreview:v7];
    v32 = [(_UIDatePickerCompactDateLabel *)self backgroundView];
    [v32 frame];
    CGRect v41 = CGRectInset(v40, 2.0, 2.0);
    double x = v41.origin.x;
    double y = v41.origin.y;
    double width = v41.size.width;
    double height = v41.size.height;

    v20 = [(UIView *)self layer];
    [(UITargetedPreview *)v20 cornerRadius];
    double v29 = v33 + -2.0;
  }

  v34 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v29);
  v35 = +[UIPointerStyle styleWithEffect:v21 shape:v34];

  return v35;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    id v5 = [(_UIDatePickerCompactDateLabel *)self backgroundView];
    [v5 setEnabled:v3];
  }
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  [v4 setAdjustsFontSizeToFitWidth:v3];
}

- (BOOL)adjustsFontSizeToFitWidth
{
  v2 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  char v3 = [v2 adjustsFontSizeToFitWidth];

  return v3;
}

- (double)minimumScaleFactor
{
  v2 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  [v2 minimumScaleFactor];
  double v4 = v3;

  return v4;
}

- (void)setMinimumScaleFactor:(double)a3
{
  id v4 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  [v4 setMinimumScaleFactor:a3];
}

- (NSArray)titles
{
  v2 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  double v3 = [v2 titles];

  return (NSArray *)v3;
}

- (void)setTitles:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  [v5 setTitles:v4];
}

- (int64_t)textAlignment
{
  v2 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  int64_t v3 = [v2 textAlignment];

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  [v4 setTextAlignment:a3];
}

- (NSDictionary)overrideAttributes
{
  v2 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  int64_t v3 = [v2 overrideAttributes];

  return (NSDictionary *)v3;
}

- (void)setOverrideAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDatePickerCompactDateLabel *)self textLabel];
  [v5 setOverrideAttributes:v4];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)tapInteractionControlledExternally
{
  return self->_tapInteractionControlledExternally;
}

- (void)setTapInteractionControlledExternally:(BOOL)a3
{
  self->_tapInteractionControlledExternalldouble y = a3;
}

- (_UIDatePickerCompactDateLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDatePickerCompactDateLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIDatePickerOverlayPresentation)overlayPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayPresentation);
  return (_UIDatePickerOverlayPresentation *)WeakRetained;
}

- (void)setOverlayPresentation:(id)a3
{
}

- (UIButton)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (_UIDatePickerStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (_UIDatePickerLinkedLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (BOOL)highlightedForTouch
{
  return self->_highlightedForTouch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_overlayPresentation);
  objc_destroyWeak((id *)&self->_delegate);
}

@end