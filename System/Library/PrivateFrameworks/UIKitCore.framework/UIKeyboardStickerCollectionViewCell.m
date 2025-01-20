@interface UIKeyboardStickerCollectionViewCell
- (BOOL)allowsRearrange;
- (BOOL)isAccessibilityElement;
- (BOOL)isEmptyCell;
- (BOOL)rearrangeMode;
- (STKImageGlyph)imageGlyph;
- (UIButton)deleteButton;
- (UIEditMenuInteraction)editMenuInteraction;
- (UIKeyboardEmojiAndStickerCollectionViewCellDelegate)delegate;
- (UIKeyboardEmojiAndStickerCollectionViewDelegate)cellDelegate;
- (UIKeyboardStickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILongPressGestureRecognizer)longPressGR;
- (UITapGestureRecognizer)rearrangeViewTapGR;
- (UIView)navigationHighlightView;
- (UIView)rearrangingView;
- (UIView)stickerView;
- (double)_jiggleTranslationAnimationTranslation:(double)a3;
- (id)_jiggleAnimationWithVariation:(double)a3 keyPath:(id)a4 duration:(double)a5;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_didTapDuringRearrange:(id)a3;
- (void)_endJiggle;
- (void)_endRearrange;
- (void)_performDeleteAction;
- (void)_reportRearrangeStateChanged:(BOOL)a3;
- (void)_showRearrangeViewIfNecessary:(BOOL)a3;
- (void)_startJiggle;
- (void)_startRearrange;
- (void)didEndDisplaying;
- (void)didLongPress:(id)a3;
- (void)layoutSubviews;
- (void)performDeleteWithCompletionHandler:(id)a3;
- (void)prepareForReuse;
- (void)setCellDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setEditMenuInteraction:(id)a3;
- (void)setImageGlyph:(id)a3;
- (void)setLongPressGR:(id)a3;
- (void)setNavigationHighlightView:(id)a3;
- (void)setRearrangeMode:(BOOL)a3;
- (void)setRearrangeViewTapGR:(id)a3;
- (void)setRearrangingView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStickerView:(id)a3;
- (void)tappedAddEffect:(id)a3;
- (void)tappedNewEmoji:(id)a3;
- (void)tappedRearrange:(id)a3;
- (void)willDisplay;
@end

@implementation UIKeyboardStickerCollectionViewCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return (id)[(STKImageGlyph *)self->_imageGlyph toString];
}

- (id)accessibilityLabel
{
  v3 = [getSTKImageGlyphDataSourceClass() sharedInstance];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 accessibilityTextForItem:self->_imageGlyph],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = [(STKImageGlyph *)self->_imageGlyph toString];
  }

  return v4;
}

- (UIKeyboardStickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v4 = (void *)getSTKStickerViewClass_softClass;
    uint64_t v27 = getSTKStickerViewClass_softClass;
    if (!getSTKStickerViewClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getSTKStickerViewClass_block_invoke;
      v22 = &unk_1E52D9900;
      v23 = &v24;
      StickerKitLibraryCore_0();
      Class Class = objc_getClass("STKStickerView");
      *(void *)(v23[1] + 24) = Class;
      getSTKStickerViewClass_softClass Class = *(void *)(v23[1] + 24);
      v4 = (void *)v25[3];
    }
    v6 = v4;
    _Block_object_dispose(&v24, 8);
    id v7 = [v6 alloc];
    [(UIView *)v3 bounds];
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:");
    stickerView = v3->_stickerView;
    v3->_stickerView = (UIView *)v8;

    v10 = [(UICollectionViewCell *)v3 contentView];
    [v10 addSubview:v3->_stickerView];

    v11 = [[UIEditMenuInteraction alloc] initWithDelegate:v3];
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = v11;

    [(UIView *)v3 addInteraction:v3->_editMenuInteraction];
    v13 = [[UILongPressGestureRecognizer alloc] initWithTarget:v3 action:sel_didLongPress_];
    longPressGR = v3->_longPressGR;
    v3->_longPressGR = v13;

    [(UIView *)v3 addGestureRecognizer:v3->_longPressGR];
    v15 = [[UITapGestureRecognizer alloc] initWithTarget:v3 action:sel__didTapDuringRearrange_];
    rearrangeViewTapGR = v3->_rearrangeViewTapGR;
    v3->_rearrangeViewTapGR = v15;

    [(UIGestureRecognizer *)v3->_rearrangeViewTapGR setEnabled:0];
  }
  return v3;
}

- (void)setImageGlyph:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(UIView *)self->_stickerView configureWithImage:0 imageGlyph:v5 effect:0];
    objc_storeStrong((id *)&self->_imageGlyph, a3);
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIKeyboardStickerCollectionViewCell *)self navigationHighlightView];

  if (v5)
  {
    if (v3)
    {
LABEL_3:
      v6 = +[UIColor systemBlueColor];
      id v7 = [(UIKeyboardStickerCollectionViewCell *)self navigationHighlightView];
      [v7 setBackgroundColor:v6];

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = [UIView alloc];
    [(UIView *)self bounds];
    v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
    [(UIKeyboardStickerCollectionViewCell *)self setNavigationHighlightView:v9];

    v10 = [(UICollectionViewCell *)self contentView];
    v11 = [(UIKeyboardStickerCollectionViewCell *)self navigationHighlightView];
    [v10 insertSubview:v11 belowSubview:self->_stickerView];

    v12 = [(UIKeyboardStickerCollectionViewCell *)self navigationHighlightView];
    v13 = [v12 layer];
    [v13 setCornerRadius:5.0];

    if (v3) {
      goto LABEL_3;
    }
  }
  v6 = [(UIKeyboardStickerCollectionViewCell *)self navigationHighlightView];
  [v6 setBackgroundColor:0];
LABEL_6:

  [(UIView *)self setNeedsDisplay];
}

- (void)performDeleteWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 325.0, 32.0, 0.0, 0.0);
  v6 = [[UIViewPropertyAnimator alloc] initWithDuration:v5 timingParameters:0.4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  [(UIViewPropertyAnimator *)v6 addAnimations:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E52EA988;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(UIViewPropertyAnimator *)v6 addCompletion:v8];
  [(UIViewPropertyAnimator *)v6 startAnimation];
}

void __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stickerView];
  [v2 setAlpha:0.0];

  CGAffineTransformMakeScale(&v5, 0.1, 0.1);
  BOOL v3 = [*(id *)(a1 + 32) stickerView];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

uint64_t __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImageGlyph:0];
  v2 = [*(id *)(a1 + 32) stickerView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v6];

  CGAffineTransform v4 = [*(id *)(a1 + 32) stickerView];
  [v4 setAlpha:0.0];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setRearrangeMode:(BOOL)a3
{
  BOOL v4 = a3 && [(UIKeyboardStickerCollectionViewCell *)self allowsRearrange];
  if (self->_rearrangeMode != v4)
  {
    self->_rearrangeMode = v4;
    [(UIGestureRecognizer *)self->_rearrangeViewTapGR setEnabled:v4];
    if (v4)
    {
      [(UIKeyboardStickerCollectionViewCell *)self _startRearrange];
    }
    else
    {
      [(UIKeyboardStickerCollectionViewCell *)self _endRearrange];
    }
  }
}

- (BOOL)allowsRearrange
{
  uint64_t v3 = [(UIKeyboardStickerCollectionViewCell *)self delegate];
  if (!v3) {
    goto LABEL_4;
  }
  BOOL v4 = (void *)v3;
  CGAffineTransform v5 = [(UIKeyboardStickerCollectionViewCell *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    goto LABEL_4;
  }
  id v7 = [(UIKeyboardStickerCollectionViewCell *)self delegate];
  int v8 = [v7 isRearrangingAllowed];

  if (!v8)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_4:
    id v9 = [getSTKImageGlyphDataSourceClass() sharedInstance];
    v10 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
    v11 = [v9 indexPathForItem:v10];

    if (objc_msgSend(v9, "isStickerSection:", objc_msgSend(v11, "section"))) {
      BOOL v12 = ![(UIKeyboardStickerCollectionViewCell *)self isEmptyCell];
    }
    else {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (BOOL)isEmptyCell
{
  uint64_t v3 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  CGAffineTransform v5 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
  char v6 = [v5 isEmpty];

  return v6;
}

- (void)willDisplay
{
  uint64_t v3 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
    [v5 willDisplay];
  }
}

- (void)didEndDisplaying
{
  uint64_t v3 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
    [v5 didEndDisplaying];
  }
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  [(UICollectionViewCell *)&v10 prepareForReuse];
  imageGlyph = self->_imageGlyph;
  self->_imageGlyph = 0;

  [(UIView *)self->_stickerView setAlpha:1.0];
  stickerView = self->_stickerView;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v5;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)stickerView setTransform:v9];
  self->_rearrangeMode = 0;
  [(UIView *)self->_rearrangingView setHidden:1];
  char v6 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
    [v8 prepareForReuse];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  [(UICollectionViewCell *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_stickerView, "setFrame:");
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_navigationHighlightView, "setFrame:");
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_rearrangingView, "setFrame:");
}

- (UIView)rearrangingView
{
  v22[2] = *MEMORY[0x1E4F143B8];
  rearrangingView = self->_rearrangingView;
  if (!rearrangingView)
  {
    char v4 = [UIView alloc];
    [(UIView *)self bounds];
    long long v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    char v6 = self->_rearrangingView;
    self->_rearrangingView = v5;

    [(UIView *)self->_rearrangingView setClipsToBounds:0];
    [(UIView *)self->_rearrangingView setTranslatesAutoresizingMaskIntoConstraints:0];
    char v7 = [(UIKeyboardStickerCollectionViewCell *)self deleteButton];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    int v8 = self->_rearrangingView;
    id v9 = [(UIKeyboardStickerCollectionViewCell *)self deleteButton];
    [(UIView *)v8 addSubview:v9];

    uint64_t v20 = (void *)MEMORY[0x1E4F5B268];
    v21 = [(UIKeyboardStickerCollectionViewCell *)self deleteButton];
    objc_super v10 = [v21 centerXAnchor];
    v11 = [(UIView *)self->_rearrangingView leadingAnchor];
    BOOL v12 = [v10 constraintEqualToAnchor:v11 constant:0.0];
    v22[0] = v12;
    v13 = [(UIKeyboardStickerCollectionViewCell *)self deleteButton];
    v14 = [v13 centerYAnchor];
    v15 = [(UIView *)self->_rearrangingView topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    v22[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v20 activateConstraints:v17];

    objc_super v18 = [(UICollectionViewCell *)self contentView];
    [v18 addSubview:self->_rearrangingView];

    [(UIView *)self->_rearrangingView setHidden:1];
    [(UIView *)self->_rearrangingView addGestureRecognizer:self->_rearrangeViewTapGR];
    rearrangingView = self->_rearrangingView;
  }
  return rearrangingView;
}

- (void)_reportRearrangeStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(UIKeyboardStickerCollectionViewCell *)self delegate];

  if (v5)
  {
    id v6 = [(UIKeyboardStickerCollectionViewCell *)self delegate];
    [v6 rearrangeStateChanged:v3];
  }
}

- (UIButton)deleteButton
{
  deleteButton = self->_deleteButton;
  if (!deleteButton)
  {
    char v4 = +[UIImage systemImageNamed:@"minus"];
    long long v5 = +[UIColor systemGrayColor];
    id v6 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v5];
    char v7 = [v4 imageByApplyingSymbolConfiguration:v6];

    int v8 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:1 scale:15.0];
    id v9 = [v7 imageByApplyingSymbolConfiguration:v8];

    objc_super v10 = +[UIBackgroundConfiguration clearConfiguration];
    v11 = +[UIBlurEffect effectWithStyle:5];
    [v10 setVisualEffect:v11];

    BOOL v12 = +[UIButtonConfiguration plainButtonConfiguration];
    [v12 setImage:v9];
    [v12 setBackground:v10];
    [v12 setCornerStyle:4];
    [v12 setButtonSize:1];
    objc_msgSend(v12, "setContentInsets:", 3.0, 3.0, 3.0, 3.0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__UIKeyboardStickerCollectionViewCell_deleteButton__block_invoke;
    v17[3] = &unk_1E52DB038;
    v17[4] = self;
    v13 = +[UIAction actionWithHandler:v17];
    v14 = +[UIButton buttonWithConfiguration:v12 primaryAction:v13];
    v15 = self->_deleteButton;
    self->_deleteButton = v14;

    deleteButton = self->_deleteButton;
  }
  return deleteButton;
}

uint64_t __51__UIKeyboardStickerCollectionViewCell_deleteButton__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = +[_UISignalAnalytics getIASignalGenmojiEdit];
  BOOL v3 = +[_UISignalAnalytics getIAPayloadKeyGenmojiEditType];
  char v7 = v3;
  char v4 = +[_UISignalAnalytics getIAPayloadValueGenmojiEditTypeDelete];
  v8[0] = v4;
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  +[_UISignalAnalytics sendGenmojiSignal:v2 payload:v5];

  return [*(id *)(a1 + 32) _performDeleteAction];
}

- (void)_showRearrangeViewIfNecessary:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(UIKeyboardStickerCollectionViewCell *)self rearrangingView];
  [v4 setHidden:v3];
}

- (void)_startRearrange
{
  [(UIKeyboardStickerCollectionViewCell *)self _startJiggle];
  [(UIKeyboardStickerCollectionViewCell *)self _showRearrangeViewIfNecessary:1];
}

- (void)_endRearrange
{
  [(UIKeyboardStickerCollectionViewCell *)self _endJiggle];
  [(UIKeyboardStickerCollectionViewCell *)self _showRearrangeViewIfNecessary:0];
}

- (void)_performDeleteAction
{
  id v4 = [getSTKImageGlyphDataSourceClass() sharedInstance];
  BOOL v3 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
  [v4 deleteItem:v3 completionHandler:&__block_literal_global_251];
}

- (void)_didTapDuringRearrange:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UIKeyboardStickerCollectionViewCell *)self _reportRearrangeStateChanged:0];
  }
}

- (void)didLongPress:(id)a3
{
  if (!self->_rearrangeMode && ![(UIKeyboardStickerCollectionViewCell *)self isEmptyCell])
  {
    [(UIView *)self frame];
    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v4 * 0.5, 0.0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set_ignoresKeyboardAvoidance:", 1);
    long long v5 = [(UIKeyboardStickerCollectionViewCell *)self editMenuInteraction];
    [v5 presentEditMenuWithConfiguration:v6];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  int v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (self->_rearrangeMode)
  {
    p_deleteButton = (void **)&self->_deleteButton;
    if (-[UIView pointInside:withEvent:](self->_deleteButton, "pointInside:withEvent:", v7, x, y))
    {
LABEL_5:
      int v8 = (UIView *)*p_deleteButton;
      goto LABEL_6;
    }
    int v8 = v9;
    if (v9 == self->_stickerView)
    {
      p_deleteButton = (void **)&self->_rearrangingView;
      goto LABEL_5;
    }
  }
LABEL_6:
  v11 = v8;

  return v11;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = [(UIKeyboardStickerCollectionViewCell *)self cellDelegate];
  char v7 = [v6 isSearching];

  if ((v7 & 1) != 0
    || ([(UIKeyboardStickerCollectionViewCell *)self imageGlyph],
        int v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 type],
        v8,
        v9 != 1))
  {
    v22 = 0;
  }
  else
  {
    objc_super v10 = [getSTKImageGlyphDataSourceClass() sharedInstance];
    v11 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
    BOOL v12 = [v10 indexPathForItem:v11];

    v37 = v12;
    int v13 = objc_msgSend(v10, "isStickerSection:", objc_msgSend(v12, "section"));
    v14 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
    if ([v14 stickerSourceType] == 1) {
      int v15 = v13;
    }
    else {
      int v15 = 0;
    }
    int v34 = v15;

    v16 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
    if ([v16 stickerSourceType] == 6) {
      int v17 = v13;
    }
    else {
      int v17 = 0;
    }
    int v33 = v17;

    BOOL v32 = [(UIKeyboardStickerCollectionViewCell *)self allowsRearrange];
    objc_super v18 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
    uint64_t v19 = [v18 stickerEffectType];

    uint64_t v20 = _UINSLocalizedStringWithDefaultValue(@"Rearrange", @"Rearrange");
    v40[5] = MEMORY[0x1E4F143A8];
    v40[6] = 3221225472;
    v40[7] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
    v40[8] = &unk_1E52DB038;
    v40[9] = self;
    v36 = (void *)v20;
    v35 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:");
    if (v19) {
      v21 = @"Edit Effect";
    }
    else {
      v21 = @"Add Effect";
    }
    v23 = _UINSLocalizedStringWithDefaultValue(v21, v21);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
    v40[3] = &unk_1E52DB038;
    v40[4] = self;
    uint64_t v24 = +[UIAction actionWithTitle:v23 image:0 identifier:0 handler:v40];
    v25 = _UINSLocalizedStringWithDefaultValue(@"New Emoji", @"New Emoji");
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3;
    v39[3] = &unk_1E52DB038;
    v39[4] = self;
    uint64_t v26 = +[UIAction actionWithTitle:v25 image:0 identifier:0 handler:v39];
    uint64_t v27 = _UINSLocalizedStringWithDefaultValue(@"Delete", @"Delete");
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4;
    v38[3] = &unk_1E52DB038;
    v38[4] = self;
    v28 = +[UIAction actionWithTitle:v27 image:0 identifier:0 handler:v38];
    [v28 setAttributes:2];
    v29 = objc_opt_new();
    v30 = v29;
    if (v32) {
      [v29 addObject:v35];
    }
    if (v34) {
      [v30 addObject:v24];
    }
    if (v33) {
      [v30 addObject:v26];
    }
    if (v13) {
      [v30 addObject:v28];
    }
    v22 = +[UIMenu menuWithChildren:v30];
  }
  return v22;
}

void __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = +[_UISignalAnalytics getIASignalGenmojiEdit];
  long long v5 = +[_UISignalAnalytics getIAPayloadKeyGenmojiEditType];
  int v8 = v5;
  id v6 = +[_UISignalAnalytics getIAPayloadValueGenmojiEditTypeRearrange];
  v9[0] = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  +[_UISignalAnalytics sendGenmojiSignal:v4 payload:v7];

  [*(id *)(a1 + 32) tappedRearrange:v3];
}

uint64_t __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) tappedAddEffect:a2];
}

void __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = +[_UISignalAnalytics getIASignalGenmojiExistingGenmojiLongPressedThenNewEmojiSelected];
  +[_UISignalAnalytics sendGenmojiCreationSignal:v3 payload:0];

  [*(id *)(a1 + 32) tappedNewEmoji:v4];
}

void __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_UISignalAnalytics getIASignalGenmojiEdit];
  long long v5 = +[_UISignalAnalytics getIAPayloadKeyGenmojiEditType];
  int v8 = v5;
  id v6 = +[_UISignalAnalytics getIAPayloadValueGenmojiEditTypeDelete];
  v9[0] = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  +[_UISignalAnalytics sendGenmojiSignal:v4 payload:v7];

  [*(id *)(a1 + 32) tappedDelete:v3];
}

- (void)tappedRearrange:(id)a3
{
  if (!self->_rearrangeMode) {
    [(UIKeyboardStickerCollectionViewCell *)self _reportRearrangeStateChanged:1];
  }
}

- (void)tappedAddEffect:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  long long v5 = [v4 window];
  id v6 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v25 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
  uint64_t v26 = [v25 stickerUUID];
  int v33 = @"UIEmojiAndStickerShouldEditNotificationUserInfoSourceRectKey";
  v32[0] = v17;
  v32[1] = v19;
  v32[2] = v21;
  v32[3] = v23;
  uint64_t v27 = [MEMORY[0x1E4F29238] valueWithBytes:v32 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v34[0] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  [v24 postNotificationName:@"UIEmojiAndStickerShouldEditNotification" object:v26 userInfo:v28];

  v29 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  [v29 setAlpha:0.0];

  v30[4] = self;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke;
  v31[3] = &unk_1E52D9F70;
  v31[4] = self;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke_2;
  v30[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:v31 animations:v30 completion:0.5];
}

void __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stickerView];
  [v1 setAlpha:0.001];
}

void __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stickerView];
  [v1 setAlpha:1.0];
}

- (void)tappedNewEmoji:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(UIKeyboardStickerCollectionViewCell *)self imageGlyph];
  long long v5 = [v4 stickerUUID];
  [v6 postNotificationName:@"UIEmojiAndStickerShouldCreateNotification" object:v5 userInfo:0];
}

- (void)_startJiggle
{
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v13);
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v14);
  if (Height >= Width) {
    double Width = Height;
  }
  double v5 = 1.0 / (Width / 100.0);
  if (v5 >= 1.0) {
    double v6 = 0.03;
  }
  else {
    double v6 = v5 * 0.03;
  }
  id v11 = [(UIKeyboardStickerCollectionViewCell *)self _jiggleAnimationWithVariation:@"transform.translation.x" keyPath:0.4 duration:0.134];
  double v7 = [(UIKeyboardStickerCollectionViewCell *)self _jiggleAnimationWithVariation:@"transform.translation.y" keyPath:0.4 duration:0.142];
  double v8 = [(UIKeyboardStickerCollectionViewCell *)self _jiggleAnimationWithVariation:@"transform.rotation" keyPath:-v6 duration:0.128];
  double v9 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  double v10 = [v9 layer];
  [v10 addAnimation:v11 forKey:@"XTranslationJitterAnimation"];
  [v10 addAnimation:v7 forKey:@"YTranslationJitterAnimation"];
  [v10 addAnimation:v8 forKey:@"RotationJitterAnimation"];
  if (objc_opt_respondsToSelector()) {
    [v9 setIsDragInteractionEnabled:0];
  }
}

- (void)_endJiggle
{
  id v3 = [(UIKeyboardStickerCollectionViewCell *)self stickerView];
  v2 = [v3 layer];
  [v2 removeAllAnimations];

  if (objc_opt_respondsToSelector()) {
    [v3 setIsDragInteractionEnabled:1];
  }
}

- (double)_jiggleTranslationAnimationTranslation:(double)a3
{
  return a3 * 0.4;
}

- (id)_jiggleAnimationWithVariation:(double)a3 keyPath:(id)a4 duration:(double)a5
{
  double v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
  [v7 setDuration:a5];
  [v7 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  double v8 = [NSNumber numberWithDouble:a3];
  [v7 setFromValue:v8];

  double v9 = [NSNumber numberWithDouble:-a3];
  [v7 setToValue:v9];

  LODWORD(v10) = 1052266988;
  LODWORD(v11) = 1059145646;
  LODWORD(v12) = 1.0;
  CGRect v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v10 :0.0 :v11 :v12];
  [v7 setTimingFunction:v13];

  LODWORD(v14) = 2139095040;
  [v7 setRepeatCount:v14];
  [v7 setAutoreverses:1];
  [v7 setRemovedOnCompletion:0];
  return v7;
}

- (STKImageGlyph)imageGlyph
{
  return self->_imageGlyph;
}

- (BOOL)rearrangeMode
{
  return self->_rearrangeMode;
}

- (UIKeyboardEmojiAndStickerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardEmojiAndStickerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIKeyboardEmojiAndStickerCollectionViewDelegate)cellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellDelegate);
  return (UIKeyboardEmojiAndStickerCollectionViewDelegate *)WeakRetained;
}

- (void)setCellDelegate:(id)a3
{
}

- (UIView)stickerView
{
  return self->_stickerView;
}

- (void)setStickerView:(id)a3
{
}

- (void)setRearrangingView:(id)a3
{
}

- (void)setDeleteButton:(id)a3
{
}

- (UITapGestureRecognizer)rearrangeViewTapGR
{
  return self->_rearrangeViewTapGR;
}

- (void)setRearrangeViewTapGR:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGR
{
  return self->_longPressGR;
}

- (void)setLongPressGR:(id)a3
{
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
}

- (UIView)navigationHighlightView
{
  return self->_navigationHighlightView;
}

- (void)setNavigationHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationHighlightView, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGR, 0);
  objc_storeStrong((id *)&self->_rearrangeViewTapGR, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_rearrangingView, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
  objc_destroyWeak((id *)&self->_cellDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageGlyph, 0);
}

@end