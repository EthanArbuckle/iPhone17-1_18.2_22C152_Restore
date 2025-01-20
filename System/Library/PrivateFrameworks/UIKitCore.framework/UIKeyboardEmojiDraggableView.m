@interface UIKeyboardEmojiDraggableView
- (BOOL)dragEnabled;
- (CGSize)intrinsicContentSize;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIFont)font;
- (UIKeyboardEmojiDraggableView)initWithFrame:(CGRect)a3;
- (UIKeyboardEmojiDraggableViewDelegate)delegate;
- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4;
- (id)createLabel;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)newLiftContainerView;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)addSilhouetteFiltersToView:(id)a3;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)generateEmoji:(id)a3 withCompletion:(id)a4;
- (void)layoutSubviews;
- (void)registerPlainText:(id)a3 toItemProvider:(id)a4;
- (void)reset;
- (void)setAttributedText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragEnabled:(BOOL)a3;
- (void)setEmojiPopoverBackgroundHitTestingEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateDragInteraction;
- (void)updateLiftScale;
- (void)willCancelVariantsWithTouch:(id)a3;
@end

@implementation UIKeyboardEmojiDraggableView

- (UIKeyboardEmojiDraggableView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiDraggableView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIKeyboardEmojiDraggableView *)v3 updateLiftScale];
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:32.0];
    font = v4->_font;
    v4->_font = (UIFont *)v5;

    uint64_t v7 = [(UIKeyboardEmojiDraggableView *)v4 createLabel];
    fixedLabel = v4->_fixedLabel;
    v4->_fixedLabel = (UILabel *)v7;

    [(UIView *)v4 addSubview:v4->_fixedLabel];
    [(UIView *)v4 setUserInteractionEnabled:1];
    [(UIKeyboardEmojiDraggableView *)v4 updateDragInteraction];
  }
  return v4;
}

- (void)updateLiftScale
{
  self->_liftScale = 1.0;
}

- (id)createLabel
{
  v3 = [UILabel alloc];
  v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UILabel *)v4 setFont:self->_font];
  [(UIView *)v4 setOpaque:0];
  [(UILabel *)v4 setTextAlignment:1];
  [(UILabel *)v4 setText:self->_text];
  [(UIView *)self bounds];
  -[UILabel setFrame:](v4, "setFrame:");
  return v4;
}

- (id)newLiftContainerView
{
  [(UIView *)self bounds];
  double liftScale = self->_liftScale;
  double v5 = v4 * liftScale;
  double v7 = v6 * liftScale;
  double v8 = v4 * liftScale * 0.5;
  double v9 = v6 * liftScale * 0.5;
  objc_super v10 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v4 * liftScale, v6 * liftScale);
  v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v5, v7);
  [(UIView *)v10 addSubview:v11];
  v12 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", 0.0, 0.0, v5, v7);
  upscaledImageView = self->_upscaledImageView;
  self->_upscaledImageView = v12;

  [(UIImageView *)self->_upscaledImageView setContentMode:1];
  v14 = [(UIKeyboardEmojiDraggableView *)self createLabel];
  previewLabel = self->_previewLabel;
  self->_previewLabel = v14;

  font = self->_font;
  [(UIFont *)font pointSize];
  v18 = [(UIFont *)font fontWithSize:v17 * self->_liftScale];
  [(UILabel *)self->_previewLabel setFont:v18];

  -[UILabel setBounds:](self->_previewLabel, "setBounds:", 0.0, 0.0, v5, v7);
  -[UIView setCenter:](self->_previewLabel, "setCenter:", v8, v9);
  [(UIView *)v11 addSubview:self->_previewLabel];
  text = self->_text;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __52__UIKeyboardEmojiDraggableView_newLiftContainerView__block_invoke;
  v25 = &unk_1E52DFDB8;
  v26 = self;
  v27 = v11;
  v20 = v11;
  [(UIKeyboardEmojiDraggableView *)self generateEmoji:text withCompletion:&v22];
  -[UIKeyboardEmojiDraggableView addSilhouetteFiltersToView:](self, "addSilhouetteFiltersToView:", self->_fixedLabel, v22, v23, v24, v25, v26);
  self->_lifted = 1;

  return v10;
}

void __52__UIKeyboardEmojiDraggableView_newLiftContainerView__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setImage:a2];
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 432)];
  [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 424);
  *(void *)(v3 + 424) = 0;
}

- (void)reset
{
  uint64_t v3 = [(UIView *)self->_fixedLabel layer];
  [v3 setFilters:0];

  [(UIView *)self->_liftContainerView removeFromSuperview];
  liftContainerView = self->_liftContainerView;
  self->_liftContainerView = 0;

  previewLabel = self->_previewLabel;
  self->_previewLabel = 0;

  upscaledImageView = self->_upscaledImageView;
  self->_upscaledImageView = 0;

  container = self->_container;
  self->_container = 0;

  self->_lifted = 0;
  self->_shouldLiftFromLastTouchLocation = 0;
  BOOL dragEnabled = self->_dragEnabled;
  dragInteraction = self->_dragInteraction;
  [(UIDragInteraction *)dragInteraction setEnabled:dragEnabled];
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  id v5 = a3;
  [(UILabel *)self->_fixedLabel setFont:v5];
}

- (void)setText:(id)a3
{
  id v7 = a3;
  if ((-[NSString isEqual:](self->_text, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    if (v7) {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
    }
    else {
      id v5 = 0;
    }
    objc_storeStrong((id *)&self->_attributedText, v5);
    id v6 = v7;
    if (v7)
    {

      id v6 = v7;
    }
    [(UILabel *)self->_fixedLabel setText:v6];
    [(UIKeyboardEmojiDraggableView *)self reset];
  }
}

- (void)setAttributedText:(id)a3
{
  id v9 = a3;
  if ((-[NSAttributedString isEqual:](self->_attributedText, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    id v5 = [v9 string];
    text = self->_text;
    self->_text = v5;

    id v7 = [v9 attributesAtIndex:0 effectiveRange:0];
    double v8 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2040];
    if (v8) {
      objc_storeStrong((id *)&self->_font, v8);
    }
    [(UILabel *)self->_fixedLabel setAttributedText:v9];
    [(UIKeyboardEmojiDraggableView *)self reset];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_fixedLabel intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiDraggableView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UILabel setFrame:](self->_fixedLabel, "setFrame:");
  [(UIKeyboardEmojiDraggableView *)self updateLiftScale];
}

- (void)addSilhouetteFiltersToView:(id)a3
{
  v29[1] = *(double *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = +[UIColor tertiarySystemFillColor];
  [v4 getRed:&v26 green:&v27 blue:&v28 alpha:v29];

  float v5 = v26;
  float v6 = v27;
  float v7 = v28;
  float v8 = v29[0];
  id v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  v13[0] = 0;
  v13[1] = 0;
  float v14 = v5;
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  float v17 = v6;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  float v20 = v7;
  uint64_t v21 = 0;
  int v22 = 0;
  float v23 = v8;
  int v24 = 0;
  objc_super v10 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v13];
  [v9 setValue:v10 forKey:*MEMORY[0x1E4F3A168]];

  v25 = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v12 = [v3 layer];

  [v12 setFilters:v11];
}

- (void)updateDragInteraction
{
  id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v4 = [v3 preferencesActions];
  if ([v4 BOOLForPreferenceKey:@"ShowStickers"]) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = _UIApplicationIsFirstPartyStickers() ^ 1;
  }

  dragInteraction = self->_dragInteraction;
  if (self->_dragEnabled)
  {
    if (dragInteraction) {
      char v7 = 1;
    }
    else {
      char v7 = v5;
    }
    if ((v7 & 1) == 0)
    {
      float v8 = [[UIDragInteraction alloc] initWithDelegate:self];
      id v9 = self->_dragInteraction;
      self->_dragInteraction = v8;

      objc_super v10 = self->_dragInteraction;
      [(UIView *)self addInteraction:v10];
    }
  }
  else if (dragInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    v11 = self->_dragInteraction;
    self->_dragInteraction = 0;
  }
}

- (void)setDragEnabled:(BOOL)a3
{
  self->_BOOL dragEnabled = a3;
  [(UIKeyboardEmojiDraggableView *)self updateDragInteraction];
}

- (void)setEmojiPopoverBackgroundHitTestingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 emojiPopoverController];
  id v6 = [v5 popoverPresentationController];

  [v6 _setOverrideAllowsHitTestingOnBackgroundViews:v3];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = (id)[getTUIEmojiUpscalerClass() sharedInstance];
  [(UIKeyboardEmojiDraggableView *)self setEmojiPopoverBackgroundHitTestingEnabled:0];
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"UIKeyboardWillBeginLiftEmoji" object:self userInfo:0];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  -[UIKeyboardEmojiDraggableView setEmojiPopoverBackgroundHitTestingEnabled:](self, "setEmojiPopoverBackgroundHitTestingEnabled:", 1, a4);
  [(UIKeyboardEmojiDraggableView *)self reset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 dragDidEnd:self withOperation:a5];
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v10 = [[_UIStickerUsageEvent alloc] initForEmojiKeyboardUsage];
    [v10 setUsageType:1];
    [v10 send];
  }
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"UIKeyboardWillEndLiftEmoji" object:self userInfo:0];
  }
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 dragWillBegin:self];
  }
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__UIKeyboardEmojiDraggableView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v7[3] = &unk_1E52DC698;
  v7[4] = self;
  objc_msgSend(a5, "addCompletion:", v7, a4);
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"UIKeyboardWillCancelLiftEmoji" object:self userInfo:0];
  }
}

uint64_t __83__UIKeyboardEmojiDraggableView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)generateEmoji:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [getTUIEmojiUpscalerClass() sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke;
  v9[3] = &unk_1E52DFDE0;
  id v10 = v5;
  id v8 = v5;
  [v7 generateEmoji:v6 completion:v9];
}

void __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke_2;
  v13[3] = &unk_1E52DC7E8;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  id v17 = *(id *)(a1 + 32);
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    double v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    id v3 = *(id *)(a1 + 40);
    if (!v3) {
      id v3 = *(id *)(a1 + 48);
    }
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)registerPlainText:(id)a3 toItemProvider:(id)a4
{
  id v5 = a3;
  id v6 = (void *)*MEMORY[0x1E4F44470];
  id v7 = a4;
  id v8 = [v6 identifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__UIKeyboardEmojiDraggableView_registerPlainText_toItemProvider___block_invoke;
  v10[3] = &unk_1E52DD3E0;
  id v11 = v5;
  id v9 = v5;
  [v7 registerDataRepresentationForTypeIdentifier:v8 visibility:0 loadHandler:v10];
}

uint64_t __65__UIKeyboardEmojiDraggableView_registerPlainText_toItemProvider___block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 dataUsingEncoding:4];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);

  return 0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v6 = self->_text;
  if (dyld_program_sdk_at_least() && (_UIApplicationIsFirstPartyStickers() & 1) == 0)
  {
    [(UIKeyboardEmojiDraggableView *)self registerPlainText:v6 toItemProvider:v5];
    int v7 = 0;
  }
  else
  {
    int v7 = 1;
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke;
  id v16 = &unk_1E52DFE30;
  id v17 = self;
  id v9 = v6;
  uint64_t v18 = v9;
  [v5 registerObjectOfClass:v8 visibility:0 loadHandler:&v13];
  if (v7) {
    -[UIKeyboardEmojiDraggableView registerPlainText:toItemProvider:](self, "registerPlainText:toItemProvider:", v9, v5, v13, v14, v15, v16, v17);
  }
  objc_msgSend(v5, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", @"com.apple.sticker", 0, &__block_literal_global_83, v13, v14, v15, v16, v17);
  id v10 = [[UIDragItem alloc] initWithItemProvider:v5];
  v19[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  return v11;
}

uint64_t __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke_2;
  v8[3] = &unk_1E52DFE08;
  v8[4] = v5;
  id v9 = v3;
  id v6 = v3;
  [v5 generateEmoji:v4 withCompletion:v8];

  return 0;
}

void __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, UIImage *image, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    UIImagePNGRepresentation(image);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [UIImage alloc];
    id v6 = [*(id *)(a1 + 32) window];
    int v7 = [v6 screen];
    [v7 scale];
    uint64_t v8 = -[UIImage initWithData:scale:](v5, "initWithData:scale:", v9);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UIKeyboardEmojiDraggableView *)self newLiftContainerView];
  liftContainerView = self->_liftContainerView;
  self->_liftContainerView = v11;

  uint64_t v13 = objc_alloc_init(UIDragPreviewParameters);
  uint64_t v14 = objc_alloc_init(UIBezierPath);
  [(UIPreviewParameters *)v13 setShadowPath:v14];

  id v15 = +[UIColor clearColor];
  [(UIPreviewParameters *)v13 setBackgroundColor:v15];

  id v16 = [(UIView *)self window];
  [(UIView *)self center];
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [(UIView *)self superview];
  objc_msgSend(v16, "convertPoint:fromView:", v21, v18, v20);
  double x = v22;
  double y = v24;

  if (self->_shouldLiftFromLastTouchLocation)
  {
    double x = self->_lastTouchLocation.x;
    double y = self->_lastTouchLocation.y;
  }
  [(UIView *)self bounds];
  double v27 = 60.0;
  memset(&v43.c, 0, 32);
  if (v26 > 1.0) {
    double v27 = 60.0 / v26;
  }
  *(_OWORD *)&v43.a = 0uLL;
  CGAffineTransformMakeScale(&v43, v27, v27);
  -[UIView setCenter:](self->_liftContainerView, "setCenter:", x, y);
  double v28 = [UIDragPreviewTarget alloc];
  v29 = [(UIView *)self window];
  CGAffineTransform v42 = v43;
  v30 = -[UIPreviewTarget initWithContainer:center:transform:](v28, "initWithContainer:center:transform:", v29, &v42, x, y);

  v31 = [[UITargetedDragPreview alloc] initWithView:self->_liftContainerView parameters:v13 target:v30];
  v32 = [getTUIEmojiUpscalerClass() sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    v33 = [v32 imageFromEmoji:self->_text];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    v34 = (void *)qword_1EB25BCB8;
    uint64_t v47 = qword_1EB25BCB8;
    if (!qword_1EB25BCB8)
    {
      *(void *)&v42.a = MEMORY[0x1E4F143A8];
      *(void *)&v42.b = 3221225472;
      *(void *)&v42.c = __get_MSStickerDragPreviewContainerViewClass_block_invoke;
      *(void *)&v42.d = &unk_1E52D9900;
      *(void *)&v42.tdouble x = &v44;
      __get_MSStickerDragPreviewContainerViewClass_block_invoke((uint64_t)&v42);
      v34 = (void *)v45[3];
    }
    id v35 = v9;
    id v36 = v8;
    v37 = v34;
    _Block_object_dispose(&v44, 8);
    if (v37
      && [(objc_class *)v37 instancesRespondToSelector:sel_initWithIsDropAnimation_])
    {
      v41 = v33;
      v38 = (void *)[[v37 alloc] initWithIsDropAnimation:0];
      if (objc_opt_respondsToSelector())
      {
        [v38 setImage:v41];
        [v38 setUseEmojiKeyboardMeshTransform:1];
        [(UITargetedDragPreview *)v31 _setPreviewContainer:v38];
        objc_storeStrong((id *)&self->_container, v38);
      }
      if (objc_opt_respondsToSelector())
      {
        v39 = [(objc_class *)v37 shadowPropertiesForDrag];
        [(UIDragPreviewParameters *)v13 _setShadowProperties:v39];
      }
      v33 = v41;
    }

    id v8 = v36;
    id v9 = v35;
  }

  return v31;
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  uint64_t v4 = objc_opt_new();
  objc_msgSend(v4, "set_rotatable:", 1);
  objc_msgSend(v4, "set_resizable:", 1);
  objc_msgSend(v4, "set_maximumResizableSize:", 300.0, 300.0);
  objc_msgSend(v4, "set_wantsElasticEffects:", 1);
  objc_msgSend(v4, "set_avoidsKeyboardSuppression:", 1);
  return v4;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  container = self->_container;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__UIKeyboardEmojiDraggableView__dragInteractionDidCancelLiftWithoutDragging___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  [(_MSStickerDragPreviewContainerView *)container _animateLiftCancellationAlongsideAnimator:0 completion:v6];
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"UIKeyboardWillCancelLiftEmoji" object:self userInfo:0];
  }
}

uint64_t __77__UIKeyboardEmojiDraggableView__dragInteractionDidCancelLiftWithoutDragging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardEmojiDraggableView;
  [(UIResponder *)&v21 touchesBegan:a3 withEvent:a4];
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v5 = [(UIView *)self superview];
    [(UIView *)self frame];
    objc_msgSend(v5, "convertRect:toView:", 0);
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    uint64_t v14 = [(UIKeyboardEmojiDraggableView *)self text];
    id v15 = [(UIView *)self window];
    if (!v15)
    {
      id v16 = +[UIKeyboard activeKeyboard];
      id v15 = [v16 window];
    }
    if (v14)
    {
      if (v15)
      {
        v23[0] = v14;
        v22[0] = @"emoji";
        v22[1] = @"frame";
        v20[0] = v7;
        v20[1] = v9;
        v20[2] = v11;
        v20[3] = v13;
        double v17 = [MEMORY[0x1E4F29238] valueWithBytes:v20 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v22[2] = @"window";
        v23[1] = v17;
        v23[2] = v15;
        double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

        double v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v19 postNotificationName:@"UIKeyboardBeganTouchEmoji" object:self userInfo:v18];
      }
    }
  }
}

- (void)willCancelVariantsWithTouch:(id)a3
{
  id v4 = a3;
  if (![(UIKeyboardEmojiDraggableView *)self dragEnabled])
  {
    [(UIKeyboardEmojiDraggableView *)self setDragEnabled:1];
    self->_BOOL dragEnabled = 0;
    self->_shouldLiftFromLastTouchLocation = 1;
    id v5 = [(UIView *)self window];
    [v4 locationInView:v5];
    self->_lastTouchLocation.double x = v6;
    self->_lastTouchLocation.double y = v7;

    dragInteraction = self->_dragInteraction;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__UIKeyboardEmojiDraggableView_willCancelVariantsWithTouch___block_invoke;
    v9[3] = &unk_1E52DC3A0;
    void v9[4] = self;
    [(UIDragInteraction *)dragInteraction _immediatelyBeginDragWithTouch:v4 completion:v9];
  }
}

uint64_t __60__UIKeyboardEmojiDraggableView_willCancelVariantsWithTouch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (UIKeyboardEmojiDraggableViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardEmojiDraggableViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)dragEnabled
{
  return self->_dragEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_upscaledImageView, 0);
  objc_storeStrong((id *)&self->_previewLabel, 0);
  objc_storeStrong((id *)&self->_liftContainerView, 0);
  objc_storeStrong((id *)&self->_fixedLabel, 0);
}

@end