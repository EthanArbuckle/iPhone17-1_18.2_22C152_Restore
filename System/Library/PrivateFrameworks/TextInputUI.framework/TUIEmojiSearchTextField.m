@interface TUIEmojiSearchTextField
+ (double)preferredHeight;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isActive;
- (BOOL)isEditing;
- (BOOL)pretendsToBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)visibleRect;
- (TUIEmojiSearchTextField)initWithFrame:(CGRect)a3;
- (TUIEmojiSearchTextField)initWithFrame:(CGRect)a3 pretendsToBecomeFirstResponder:(BOOL)a4;
- (TUIEmojiSearchTextFieldDelegate)searchDelegate;
- (id)_clearButton;
- (id)_textAndGlyphColorForRenderConfig:(id)a3;
- (id)_textAndGlyphCompositingFilterForRenderConfig:(id)a3;
- (id)insertionPointColor;
- (id)portalView;
- (void)_matchPortalViewFrame:(CGRect)a3;
- (void)_setCursorVisibleAndBlinks:(BOOL)a3;
- (void)_setRenderConfig:(id)a3;
- (void)_updatePlaceholderPosition;
- (void)_windowBecameKeyNotificationPosted:(id)a3;
- (void)didMoveToWindow;
- (void)fieldEditorDidChange:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)paste:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSearchDelegate:(id)a3;
@end

@implementation TUIEmojiSearchTextField

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchDelegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_magnifyingGlassView, 0);
  objc_storeStrong((id *)&self->_highlightBeginTime, 0);
}

- (BOOL)pretendsToBecomeFirstResponder
{
  return self->_pretendsToBecomeFirstResponder;
}

- (void)setSearchDelegate:(id)a3
{
}

- (TUIEmojiSearchTextFieldDelegate)searchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
  return (TUIEmojiSearchTextFieldDelegate *)WeakRetained;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  v4 = [(TUIEmojiSearchTextField *)self searchDelegate];

  if (v4)
  {
    v5 = [(TUIEmojiSearchTextField *)self searchDelegate];
    [v5 emojiSearchTextFieldWillClear:self];

    v6 = [(TUIEmojiSearchTextField *)self searchDelegate];
    [v6 emojiSearchTextField:self didChangeSearchString:&stru_1EDC653C0];
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)fieldEditorDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextField;
  [(TUIEmojiSearchTextField *)&v14 fieldEditorDidChange:a3];
  if ([(TUIEmojiSearchTextField *)self hasMarkedText]
    && ([(TUIEmojiSearchTextField *)self text],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5 == 1))
  {
    v6 = [(TUIEmojiSearchTextField *)self text];
    v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    if ([v6 rangeOfCharacterFromSet:v7]) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v8 == 1;
    }
    char v10 = v9;
  }
  else
  {
    char v10 = 0;
  }
  v11 = [(TUIEmojiSearchTextField *)self searchDelegate];

  if (v11)
  {
    if ((v10 & 1) == 0)
    {
      v12 = [(TUIEmojiSearchTextField *)self searchDelegate];
      v13 = [(TUIEmojiSearchTextField *)self text];
      [v12 emojiSearchTextField:self didChangeSearchString:v13];
    }
  }
}

- (CGRect)visibleRect
{
  v2 = [(TUIEmojiSearchTextField *)self window];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)resignFirstResponder
{
  double v3 = [(TUIEmojiSearchTextField *)self searchDelegate];
  [v3 emojiSearchTextFieldWillBecomeInactive:self];

  if ([(TUIEmojiSearchTextField *)self pretendsToBecomeFirstResponder])
  {
    [(TUIEmojiSearchTextField *)self setActive:0];
    BOOL v4 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIEmojiSearchTextField;
    BOOL v4 = [(TUIEmojiSearchTextField *)&v7 resignFirstResponder];
  }
  double v5 = [(TUIEmojiSearchTextField *)self searchDelegate];
  [v5 emojiSearchTextFieldDidBecomeInactive:self];

  return v4;
}

- (BOOL)becomeFirstResponder
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(TUIEmojiSearchTextField *)self isActive])
  {
    if ([(TUIEmojiSearchTextField *)self pretendsToBecomeFirstResponder]) {
      goto LABEL_8;
    }
  }
  else
  {
    double v3 = [(TUIEmojiSearchTextField *)self searchDelegate];
    [v3 emojiSearchTextFieldWillBecomeActive:self];

    if ([(TUIEmojiSearchTextField *)self pretendsToBecomeFirstResponder])
    {
      [(TUIEmojiSearchTextField *)self setActive:1];
      BOOL v4 = [(TUIEmojiSearchTextField *)self searchDelegate];
      [v4 emojiSearchTextFieldDidBecomeActive:self];

      goto LABEL_8;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TUIEmojiSearchTextField;
  if ([(TUIEmojiSearchTextField *)&v11 becomeFirstResponder])
  {
    double v5 = [(TUIEmojiSearchTextField *)self searchDelegate];
    [v5 emojiSearchTextFieldDidBecomeActive:self];

    BOOL v6 = 1;
    goto LABEL_9;
  }
LABEL_8:
  BOOL v6 = 0;
LABEL_9:
  portalView = self->_portalView;
  if (portalView)
  {
    [(TUIEmojiSearchTextFieldPortalView *)portalView frame];
    -[TUIEmojiSearchTextField _matchPortalViewFrame:](self, "_matchPortalViewFrame:");
  }
  double v12 = @"ButtonConfiguration";
  v13[0] = &unk_1EDC79AA0;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"TUIEmojiSearchViewButtonConfigurationWillChangeNotification" object:0 userInfo:v8];

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  return ![(TUIEmojiSearchTextField *)self pretendsToBecomeFirstResponder];
}

- (void)_windowBecameKeyNotificationPosted:(id)a3
{
  if ([(TUIEmojiSearchTextField *)self pretendsToBecomeFirstResponder])
  {
    [(TUIEmojiSearchTextField *)self setActive:0];
  }
}

- (BOOL)isEditing
{
  if (self->_pretendsToBecomeFirstResponder)
  {
    return [(TUIEmojiSearchTextField *)self isActive];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TUIEmojiSearchTextField;
    return [(TUIEmojiSearchTextField *)&v3 isEditing];
  }
}

- (BOOL)isActive
{
  if (self->_pretendsToBecomeFirstResponder) {
    return self->_active;
  }
  else {
    return [(TUIEmojiSearchTextField *)self isFirstResponder];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    -[TUIEmojiSearchTextField _setCursorVisibleAndBlinks:](self, "_setCursorVisibleAndBlinks:");
    if (v3)
    {
      [(TUIEmojiSearchTextField *)self _attachFieldEditor];
      id v5 = [(TUIEmojiSearchTextField *)self interactionAssistant];
      [v5 activateSelection];
    }
    else
    {
      [(TUIEmojiSearchTextField *)self _detachFieldEditor];
      id v5 = [(TUIEmojiSearchTextField *)self interactionAssistant];
      [v5 deactivateSelection];
    }
  }
}

- (void)_setCursorVisibleAndBlinks:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUIEmojiSearchTextField *)self interactionAssistant];
  [v5 setCursorVisible:v3];

  BOOL v6 = [(TUIEmojiSearchTextField *)self interactionAssistant];
  char v7 = objc_opt_respondsToSelector();

  double v8 = [(TUIEmojiSearchTextField *)self interactionAssistant];
  id v10 = v8;
  if (v7)
  {
    [v8 setCursorBlinkAnimationEnabled:v3];
  }
  else
  {
    double v9 = [v8 selectionView];
    [v9 setCaretBlinks:v3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField setHighlighted:](&v13, sel_setHighlighted_);
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    highlightBeginTime = self->_highlightBeginTime;
    self->_highlightBeginTime = v5;

    backgroundView = self->_backgroundView;
    uint64_t v8 = 2;
    BOOL v9 = 1;
  }
  else
  {
    id v10 = self->_backgroundView;
    objc_super v11 = self->_highlightBeginTime;
    if (v11)
    {
      [(NSDate *)v11 timeIntervalSinceNow];
      BOOL v9 = v12 < -0.3;
    }
    else
    {
      BOOL v9 = 0;
    }
    backgroundView = v10;
    uint64_t v8 = 1;
  }
  [(TUIEmojiSearchTextFieldBackgroundView *)backgroundView setBackgroundStyle:v8 animated:v9];
}

- (void)_matchPortalViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(TUIEmojiSearchTextField *)self superview];
  BOOL v9 = [(TUIEmojiSearchTextFieldPortalView *)self->_portalView superview];
  objc_msgSend(v8, "convertRect:fromView:", v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[TUIEmojiSearchTextField setFrame:](self, "setFrame:", v11, v13, v15, v17);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kFrameChangeContext == a6)
  {
    char v7 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4);
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    -[TUIEmojiSearchTextField _matchPortalViewFrame:](self, "_matchPortalViewFrame:", v9, v11, v13, v15);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TUIEmojiSearchTextField;
    -[TUIEmojiSearchTextField observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)insertionPointColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.004 green:0.525 blue:0.988 alpha:1.0];
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField clearButtonRectForBounds:](&v17, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = TUIRemoteEmojiSearchViewControllerEnabled();
  double v12 = 0.0;
  if (v11) {
    double v12 = -3.0;
  }
  double v13 = v4 + v12;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField rightViewRectForBounds:](&v8, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIRectInsetEdges();
  double v7 = width - v5 + -10.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v7;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField leftViewRectForBounds:](&v14, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIRectInsetEdges();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  int v9 = TUIRemoteEmojiSearchViewControllerEnabled();
  double v10 = 10.0;
  if (v9) {
    double v10 = 3.0;
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)layoutSubviews
{
  [(TUIEmojiSearchTextField *)self setLeftView:self->_magnifyingGlassView];
  [(TUIEmojiSearchTextField *)self setRightView:0];
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchTextField;
  [(TUIEmojiSearchTextField *)&v3 layoutSubviews];
  [(TUIEmojiSearchTextField *)self bounds];
  -[TUIEmojiSearchTextFieldBackgroundView setFrame:](self->_backgroundView, "setFrame:");
  if ([(TUIEmojiSearchTextField *)self isActive]) {
    [(TUIEmojiSearchTextField *)self _setCursorVisibleAndBlinks:1];
  }
}

- (void)_updatePlaceholderPosition
{
  if ([(TUIEmojiSearchTextField *)self _shouldReverseLayoutDirection]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [(TUIEmojiSearchTextField *)self _placeholderLabel];
  [v4 setTextAlignment:v3];
}

- (id)portalView
{
  if (!self->_portalView)
  {
    uint64_t v3 = [(_UIPortalView *)[TUIEmojiSearchTextFieldPortalView alloc] initWithSourceView:self];
    portalView = self->_portalView;
    self->_portalView = v3;

    [(TUIEmojiSearchTextFieldPortalView *)self->_portalView setHitTestView:self];
    [(_UIPortalView *)self->_portalView setHidesSourceView:1];
    [(_UIPortalView *)self->_portalView setForwardsClientHitTestingToSourceView:1];
    [(TUIEmojiSearchTextFieldPortalView *)self->_portalView addObserver:self forKeyPath:@"frame" options:1 context:kFrameChangeContext];
    [(TUIEmojiSearchTextFieldPortalView *)self->_portalView addObserver:self forKeyPath:@"bounds" options:1 context:kFrameChangeContext];
    double v5 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
    double v6 = v5;
    if (v5)
    {
      double v7 = [v5 scene];
      if (v7)
      {
        double v8 = [MEMORY[0x1E4FB1D68] activeTextEffectsWindowForWindowScene:v7];
        int v9 = v8;
        if (v8) {
          [v8 addSubview:self];
        }
      }
    }
  }
  [(TUIEmojiSearchTextField *)self frame];
  -[_UIPortalView setFrame:](self->_portalView, "setFrame:");
  double v10 = self->_portalView;
  return v10;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchTextField;
  [(TUIEmojiSearchTextField *)&v4 didMoveToWindow];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__windowBecameKeyNotificationPosted_ name:*MEMORY[0x1E4FB30E8] object:0];
}

- (id)_clearButton
{
  v9.receiver = self;
  v9.super_class = (Class)TUIEmojiSearchTextField;
  uint64_t v3 = [(TUIEmojiSearchTextField *)&v9 _clearButton];
  objc_super v4 = [(TUIEmojiSearchTextField *)self _inheritedRenderConfig];
  double v5 = [(TUIEmojiSearchTextField *)self _textAndGlyphCompositingFilterForRenderConfig:v4];
  double v6 = [v3 layer];
  [v6 setCompositingFilter:v5];

  double v7 = [(TUIEmojiSearchTextField *)self _textAndGlyphColorForRenderConfig:v4];
  [v3 setTintColor:v7];

  return v3;
}

- (void)_setRenderConfig:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TUIEmojiSearchTextField;
  id v4 = a3;
  [(TUIEmojiSearchTextField *)&v15 _setRenderConfig:v4];
  double v5 = -[TUIEmojiSearchTextField _textAndGlyphColorForRenderConfig:](self, "_textAndGlyphColorForRenderConfig:", v4, v15.receiver, v15.super_class);
  double v6 = [(TUIEmojiSearchTextField *)self _textAndGlyphCompositingFilterForRenderConfig:v4];
  [(UIImageView *)self->_magnifyingGlassView setTintColor:v5];
  double v7 = [(TUIEmojiSearchTextField *)self _placeholderLabel];
  [v7 setTextColor:v5];

  double v8 = [(TUIEmojiSearchTextField *)self _clearButton];
  [v8 setTintColor:v5];

  objc_super v9 = [(UIImageView *)self->_magnifyingGlassView layer];
  [v9 setCompositingFilter:v6];

  double v10 = [(TUIEmojiSearchTextField *)self _placeholderLabel];
  double v11 = [v10 layer];
  [v11 setCompositingFilter:v6];

  uint64_t v12 = [(TUIEmojiSearchTextField *)self _clearButton];
  double v13 = [(id)v12 layer];
  [v13 setCompositingFilter:v6];

  LOBYTE(v12) = [v4 lightKeyboard];
  if (v12) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  objc_super v14 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [(TUIEmojiSearchTextField *)self setTextColor:v14];
}

- (id)_textAndGlyphCompositingFilterForRenderConfig:(id)a3
{
  int v3 = [a3 lightKeyboard];
  id v4 = (void **)MEMORY[0x1E4F3A2E0];
  if (!v3) {
    id v4 = (void **)MEMORY[0x1E4F3A2E8];
  }
  double v5 = *v4;
  return v5;
}

- (id)_textAndGlyphColorForRenderConfig:(id)a3
{
  int v3 = [a3 lightKeyboard];
  double v4 = 0.36;
  if (v3) {
    double v4 = 0.6;
  }
  double v5 = (void *)MEMORY[0x1E4FB1618];
  return (id)[v5 colorWithWhite:v4 alpha:1.0];
}

- (TUIEmojiSearchTextField)initWithFrame:(CGRect)a3 pretendsToBecomeFirstResponder:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)TUIEmojiSearchTextField;
  double v5 = -[TUIEmojiSearchTextField initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    v5->_pretendsToBecomeFirstResponder = a4;
    uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (TUIEmojiSearchTextFieldBackgroundView *)v7;

    [(TUIEmojiSearchTextField *)v6 insertSubview:v6->_backgroundView atIndex:0];
    objc_super v9 = [(TUIEmojiSearchTextField *)v6 layer];
    [v9 setAllowsGroupBlending:0];

    [(TUIEmojiSearchTextField *)v6 setClearButtonMode:1];
    [(TUIEmojiSearchTextField *)v6 setAutocapitalizationType:0];
    [(TUIEmojiSearchTextField *)v6 setDelegate:v6];
    double v10 = (void *)MEMORY[0x1E4FB1830];
    double v11 = [(TUIEmojiSearchTextField *)v6 font];
    uint64_t v12 = [v10 configurationWithFont:v11];
    double v13 = [v12 _configurationIgnoringDynamicType];

    objc_super v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass" withConfiguration:v13];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
    magnifyingGlassView = v6->_magnifyingGlassView;
    v6->_magnifyingGlassView = (UIImageView *)v15;

    [(UIImageView *)v6->_magnifyingGlassView setContentMode:4];
    uint64_t v17 = *MEMORY[0x1E4F3A2E0];
    v18 = [(TUIEmojiSearchTextField *)v6 _placeholderLabel];
    v19 = [v18 layer];
    [v19 setCompositingFilter:v17];

    [(UIImageView *)v6->_magnifyingGlassView sizeToFit];
    [(TUIEmojiSearchTextField *)v6 setLeftView:v6->_magnifyingGlassView];
    [(TUIEmojiSearchTextField *)v6 setLeftViewMode:3];
    [(TUIEmojiSearchTextField *)v6 setRightViewMode:3];
    v20 = [MEMORY[0x1E4FB1618] _systemInteractionTintColor];
    [(TUIEmojiSearchTextField *)v6 setTintColor:v20];
  }
  return v6;
}

- (TUIEmojiSearchTextField)initWithFrame:(CGRect)a3
{
  return -[TUIEmojiSearchTextField initWithFrame:pretendsToBecomeFirstResponder:](self, "initWithFrame:pretendsToBecomeFirstResponder:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (double)preferredHeight
{
  return 49.0;
}

- (void)paste:(id)a3
{
  if (self->_pretendsToBecomeFirstResponder)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4FB1A78], "generalPasteboard", a3);
    id v5 = [v4 string];

    [(TUIEmojiSearchTextField *)self insertText:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIEmojiSearchTextField;
    [(TUIEmojiSearchTextField *)&v6 paste:a3];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_paste_ == a3)
  {
    if ([(TUIEmojiSearchTextField *)self isEditing])
    {
      double v11 = [MEMORY[0x1E4FB1A78] generalPasteboard];
      char v12 = [v11 hasStrings];
LABEL_20:
      BOOL v10 = v12;

      goto LABEL_23;
    }
LABEL_21:
    BOOL v10 = 0;
    goto LABEL_23;
  }
  if (sel_selectAll_ == a3)
  {
    if ([(TUIEmojiSearchTextField *)self isEditing]
      && [(TUIEmojiSearchTextField *)self hasText])
    {
      double v11 = [(TUIEmojiSearchTextField *)self selectedTextRange];
      char v12 = [v11 isEmpty];
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (sel_replace_ == a3)
  {
    BOOL v10 = 1;
    goto LABEL_23;
  }
  if (sel__share_ == a3 || sel__define_ == a3 || sel__translate_ == a3 || sel_captureTextFromCamera_ == a3) {
    goto LABEL_21;
  }
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextField;
  BOOL v10 = [(TUIEmojiSearchTextField *)&v14 canPerformAction:a3 withSender:v6];
LABEL_23:

  return v10;
}

@end