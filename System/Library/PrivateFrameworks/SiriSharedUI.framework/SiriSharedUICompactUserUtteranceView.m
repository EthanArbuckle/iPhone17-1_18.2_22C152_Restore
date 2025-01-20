@interface SiriSharedUICompactUserUtteranceView
- (BOOL)isEditing;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUICStreamingTextView)_editableStreamingTextView;
- (SUICStreamingTextView)_emojiMaskStreamingTextView;
- (SUICStreamingTextView)_streamingTextView;
- (SiriSharedUICompactUserUtteranceView)initWithContentInsets:(UIEdgeInsets)a3 cornerRadius:(double)a4;
- (SiriSharedUICompactUserUtteranceViewDelegate)delegate;
- (UIEdgeInsets)contentInsets;
- (UIVisualEffectView)_backgroundView;
- (double)maxWidth;
- (id)_createStreamingTextViewForEmojisOnly:(BOOL)a3;
- (id)_fontForStreamingTextView;
- (int64_t)currentDisplayType;
- (void)_handleTap:(id)a3;
- (void)_setBackgroundView:(id)a3;
- (void)_setEditableStreamingTextView:(id)a3;
- (void)_setEmojiMaskStreamingTextView:(id)a3;
- (void)_setStreamingText:(id)a3;
- (void)_setStreamingTextView:(id)a3;
- (void)_updateAmbientAppearance;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setLatencySummary:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setSpeechRecognitionHypothesis:(id)a3;
@end

@implementation SiriSharedUICompactUserUtteranceView

- (SiriSharedUICompactUserUtteranceView)initWithContentInsets:(UIEdgeInsets)a3 cornerRadius:(double)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v32.receiver = self;
  v32.super_class = (Class)SiriSharedUICompactUserUtteranceView;
  v9 = -[SiriSharedUICompactUserUtteranceView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = v9;
  if (v9)
  {
    v9->_contentInsets.CGFloat top = top;
    v9->_contentInsets.CGFloat left = left;
    v9->_contentInsets.CGFloat bottom = bottom;
    v9->_contentInsets.CGFloat right = right;
    v11 = (void *)MEMORY[0x263F82DF0];
    v12 = [MEMORY[0x263F824D8] effectWithStyle:8];
    v13 = [v11 effectForBlurEffect:v12 style:1];

    v14 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v13];
    [(SiriSharedUICompactUserUtteranceView *)v10 _setBackgroundView:v14];

    backgroundView = v10->_backgroundView;
    v16 = [MEMORY[0x263F825C8] clearColor];
    [(UIVisualEffectView *)backgroundView setBackgroundColor:v16];

    v17 = [(SiriSharedUICompactUserUtteranceView *)v10 _backgroundView];
    v18 = [v17 layer];
    [v18 setCornerRadius:a4];

    v19 = [(SiriSharedUICompactUserUtteranceView *)v10 _backgroundView];
    v20 = [v19 layer];
    [v20 setMaskedCorners:3];

    v21 = [(SiriSharedUICompactUserUtteranceView *)v10 _createStreamingTextViewForEmojisOnly:0];
    [(SiriSharedUICompactUserUtteranceView *)v10 _setStreamingTextView:v21];

    if ([MEMORY[0x263F286B8] isSAEEnabled]) {
      [(SUICStreamingTextView *)v10->_streamingTextView setEditTextSymbol:@"pencil"];
    }
    else {
      [(SiriSharedUICompactUserUtteranceView *)v10 addSubview:v10->_backgroundView];
    }
    v22 = [(SiriSharedUICompactUserUtteranceView *)v10 _createStreamingTextViewForEmojisOnly:1];
    [(SiriSharedUICompactUserUtteranceView *)v10 _setEmojiMaskStreamingTextView:v22];

    if ([MEMORY[0x263F286B8] isSAEEnabled])
    {
      v23 = [(SiriSharedUICompactUserUtteranceView *)v10 traitCollection];
      if ([v23 userInterfaceStyle] == 1) {
        [MEMORY[0x263F825C8] systemDarkGrayColor];
      }
      else {
      v24 = [MEMORY[0x263F825C8] systemLightGrayColor];
      }

      [(SUICStreamingTextView *)v10->_streamingTextView setStartTextColor:v24];
      [(SUICStreamingTextView *)v10->_streamingTextView setEndTextColor:v24];
      streamingTextView = v10->_streamingTextView;
      v28 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F81828]];
      [(SUICStreamingTextView *)streamingTextView setFont:v28];

      v25 = [(SiriSharedUICompactUserUtteranceView *)v10 _streamingTextView];
      v26 = v10;
    }
    else
    {
      v24 = [(UIVisualEffectView *)v10->_backgroundView contentView];
      v25 = [(SiriSharedUICompactUserUtteranceView *)v10 _streamingTextView];
      v26 = v24;
    }
    [(SiriSharedUICompactUserUtteranceView *)v26 addSubview:v25];

    v29 = [(SiriSharedUICompactUserUtteranceView *)v10 _emojiMaskStreamingTextView];
    [(SiriSharedUICompactUserUtteranceView *)v10 addSubview:v29];

    v30 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v10 action:sel__handleTap_];
    [(SiriSharedUICompactUserUtteranceView *)v10 addGestureRecognizer:v30];
  }
  return v10;
}

- (void)setLatencySummary:(id)a3
{
  self->_currentDisplayType = 2;
  [(SiriSharedUICompactUserUtteranceView *)self _setStreamingText:a3];
  [(SUICStreamingTextView *)self->_streamingTextView setShowEditTextImage:0];
  [(SiriSharedUICompactUserUtteranceView *)self setNeedsLayout];
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
  id v13 = a3;
  if (self->_speechRecognitionHypothesis)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userUtteranceView:self speechRecognitionHypothesisDidDisappear:self->_speechRecognitionHypothesis];
  }
  self->_currentDisplayType = v13 != 0;
  v5 = (SRUIFSpeechRecognitionHypothesis *)[v13 copy];
  speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
  self->_speechRecognitionHypothesis = v5;

  v7 = [v13 userUtterance];
  uint64_t v8 = [v7 bestTextInterpretation];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_26C1A19D8;
  }
  [(SiriSharedUICompactUserUtteranceView *)self _setStreamingText:v10];

  if ([v13 isFinal]) {
    BOOL v11 = !self->_isInAmbient;
  }
  else {
    BOOL v11 = 0;
  }
  [(SUICStreamingTextView *)self->_streamingTextView setShowEditTextImage:v11];
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  [v12 userUtteranceView:self speechRecognitionHypothesisDidAppear:self->_speechRecognitionHypothesis];

  [(SiriSharedUICompactUserUtteranceView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SiriSharedUICompactUserUtteranceView *)self _streamingTextView];
  v7 = [v6 text];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    p_contentInsets = &self->_contentInsets;
    double v10 = width - self->_contentInsets.left - self->_contentInsets.right;
    double v11 = height - self->_contentInsets.top - self->_contentInsets.bottom;
    id v12 = [(SiriSharedUICompactUserUtteranceView *)self _streamingTextView];
    objc_msgSend(v12, "sizeThatFits:", v10, v11);
    double v14 = v13;
    double v16 = v15;

    if ([MEMORY[0x263F286B8] isSAEEnabled]) {
      double width = fmax(v14 + p_contentInsets->left + p_contentInsets->right, 50.0);
    }
    double v17 = v16 + p_contentInsets->top + p_contentInsets->bottom + 0.0;
  }
  else
  {
    double width = *MEMORY[0x263F001B0];
    double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v18 = width;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SiriSharedUICompactUserUtteranceView;
  [(SiriSharedUICompactUserUtteranceView *)&v19 layoutSubviews];
  [(SiriSharedUICompactUserUtteranceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  backgroundView = self->_backgroundView;
  [(SiriSharedUICompactUserUtteranceView *)self bounds];
  -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");
  uint64_t v8 = [(SUICStreamingTextView *)self->_streamingTextView text];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    double left = self->_contentInsets.left;
    double right = self->_contentInsets.right;
    if ([MEMORY[0x263F286B8] isSAEEnabled]) {
      double v12 = self->_maxWidth - self->_contentInsets.left - self->_contentInsets.right;
    }
    else {
      double v12 = v4 - left - right;
    }
    -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:", v12, v6);
    double v14 = v13;
    double top = self->_contentInsets.top;
    double v15 = self->_contentInsets.left;
    double v17 = [(SiriSharedUICompactUserUtteranceView *)self _streamingTextView];
    objc_msgSend(v17, "setFrame:", v15, top, v12, v14);

    double v18 = [(SiriSharedUICompactUserUtteranceView *)self _emojiMaskStreamingTextView];
    objc_msgSend(v18, "setFrame:", v15, top, v12, v14);
  }
}

- (id)_createStreamingTextViewForEmojisOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F75450]);
  double v6 = [(SiriSharedUICompactUserUtteranceView *)self _fontForStreamingTextView];
  [v5 setFont:v6];
  [v5 setAnimationDuration:0.3];
  v7 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v8 = [v7 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  double v10 = 0.0;
  if (IsAccessibilityCategory) {
    double v10 = 0.5;
  }
  [v5 setHyphenationFactor:v10];
  if (v3) {
    [v5 setRenderEmojisOnly:1];
  }
  else {
    [v5 setRenderEmojis:0];
  }

  return v5;
}

- (void)_handleTap:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([a3 state] == 3)
  {
    double v4 = (os_log_t *)MEMORY[0x263F28348];
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[SiriSharedUICompactUserUtteranceView _handleTap:]";
      _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: tap to edit experience requested", (uint8_t *)&v8, 0xCu);
    }
    if (self->_isInAmbient)
    {
      double v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        uint64_t v9 = "-[SiriSharedUICompactUserUtteranceView _handleTap:]";
        _os_log_impl(&dword_20C9D5000, v6, OS_LOG_TYPE_DEFAULT, "%s #compact: tap to edit ignored due to ambient mode", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      v7 = [(SiriSharedUICompactUserUtteranceView *)self delegate];
      [v7 userUtteranceViewTapped:self];
    }
  }
}

- (id)_fontForStreamingTextView
{
  id v3 = (id)*MEMORY[0x263F83570];
  if (self->_isInAmbient && !self->_isInAmbientInteractivity)
  {
    id v5 = (id)*MEMORY[0x263F83610];

    double v4 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v5 variant:1280];
    id v3 = v5;
  }
  else
  {
    double v4 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v3 variant:256];
  }

  return v4;
}

- (void)_setStreamingText:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  double v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v8 = (void *)v28[5];
    v28[5] = (uint64_t)v7;

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 0;
    uint64_t v9 = [v6 length];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    double v13 = __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke;
    double v14 = &unk_2640E36E8;
    double v16 = v19;
    double v17 = &v21;
    id v10 = v6;
    id v15 = v10;
    double v18 = &v27;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, &v11);
    if (v22[5]) {
      objc_msgSend((id)v28[5], "addObject:", v11, v12, v13, v14);
    }
    if (!objc_msgSend((id)v28[5], "count", v11, v12, v13, v14) && objc_msgSend(v10, "length")) {
      [(id)v28[5] addObject:v10];
    }
    [(SUICStreamingTextView *)self->_streamingTextView setWords:v28[5]];
    [(SUICStreamingTextView *)self->_emojiMaskStreamingTextView setWords:v28[5]];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v21, 8);
  }
  _Block_object_dispose(&v27, 8);
}

void __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length] != 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_msgSend(v12, "appendString:");
  }
  uint64_t v13 = a3 - a5;
  if (a3 != a5)
  {
    double v14 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a5, a3 - a5);
    [v12 appendString:v14];
  }
  [v12 appendString:v11];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v12];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  uint64_t v17 = a6 - (v13 + a4);
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    char v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke_2;
    v22[3] = &unk_2640E36C0;
    v22[4] = *(void *)(a1 + 48);
    objc_msgSend(v21, "enumerateSubstringsInRange:options:usingBlock:", a3 + a4, v17, 1026, v22);
  }
}

uint64_t __58__SiriSharedUICompactUserUtteranceView__setStreamingText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:a2];
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    [(SiriSharedUICompactUserUtteranceView *)self _updateAmbientAppearance];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    self->_isInAmbientInteractivity = a3;
    [(SiriSharedUICompactUserUtteranceView *)self _updateAmbientAppearance];
  }
}

- (void)_updateAmbientAppearance
{
  if ([(SRUIFSpeechRecognitionHypothesis *)self->_speechRecognitionHypothesis isFinal]) {
    BOOL v3 = !self->_isInAmbient;
  }
  else {
    BOOL v3 = 0;
  }
  [(SUICStreamingTextView *)self->_streamingTextView setShowEditTextImage:v3];
  streamingTextView = self->_streamingTextView;
  id v5 = [(SiriSharedUICompactUserUtteranceView *)self _fontForStreamingTextView];
  [(SUICStreamingTextView *)streamingTextView setFont:v5];

  emojiMaskStreamingTextView = self->_emojiMaskStreamingTextView;
  id v7 = [(SiriSharedUICompactUserUtteranceView *)self _fontForStreamingTextView];
  [(SUICStreamingTextView *)emojiMaskStreamingTextView setFont:v7];

  int v8 = self->_streamingTextView;
  uint64_t v9 = [(SUICStreamingTextView *)v8 words];
  [(SUICStreamingTextView *)v8 setWords:v9];

  id v10 = self->_emojiMaskStreamingTextView;
  id v11 = [(SUICStreamingTextView *)v10 words];
  [(SUICStreamingTextView *)v10 setWords:v11];
}

- (SiriSharedUICompactUserUtteranceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUICompactUserUtteranceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentDisplayType
{
  return self->_currentDisplayType;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (SUICStreamingTextView)_streamingTextView
{
  return self->_streamingTextView;
}

- (void)_setStreamingTextView:(id)a3
{
}

- (SUICStreamingTextView)_emojiMaskStreamingTextView
{
  return self->_emojiMaskStreamingTextView;
}

- (void)_setEmojiMaskStreamingTextView:(id)a3
{
}

- (SUICStreamingTextView)_editableStreamingTextView
{
  return self->_editableStreamingTextView;
}

- (void)_setEditableStreamingTextView:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (UIVisualEffectView)_backgroundView
{
  return self->_backgroundView;
}

- (void)_setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_editableStreamingTextView, 0);
  objc_storeStrong((id *)&self->_emojiMaskStreamingTextView, 0);
  objc_storeStrong((id *)&self->_streamingTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userUtteranceEditingDataManager, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
}

@end