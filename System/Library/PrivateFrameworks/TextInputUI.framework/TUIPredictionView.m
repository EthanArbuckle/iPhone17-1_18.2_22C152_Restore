@interface TUIPredictionView
- (BOOL)_ensureVisibleCellCount:(unint64_t)a3 forCellStackView:(id)a4;
- (BOOL)_shouldPadWithEmptyCellsForAutocorrectionList:(id)a3;
- (BOOL)disablesHighlight;
- (BOOL)drawsBackdropView;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldAnimateCells;
- (BOOL)useContinuousCornerInHighlight;
- (CGSize)intrinsicContentSize;
- (NSArray)displayedCandidates;
- (NSLocale)currentLocale;
- (TIAutocorrectionList)autocorrectionList;
- (TUIPredictionView)initWithFrame:(CGRect)a3;
- (TUIPredictionViewDelegate)delegate;
- (TUIPredictionViewStackView)cellStackView;
- (UIColor)highlightColor;
- (UIColor)separatorColor;
- (UIKBRenderConfig)renderConfig;
- (UILongPressGestureRecognizer)tapGestureRecognizer;
- (UIView)backdropView;
- (double)highlightCornerRadius;
- (double)highlightMargin;
- (double)maximumBackgroundWidth;
- (double)separatorMargin;
- (id)_candidatesToDisplayForAutocorrectionList:(id)a3;
- (id)allVisibleCells;
- (id)labelFontForCandidate:(id)a3;
- (id)test_cellForCandidate:(id)a3;
- (id)visibleCells;
- (int64_t)_numberOfEmojisToDisplayForAutocorrectionList:(id)a3 withCandidatesShown:(id)a4;
- (int64_t)layoutDirection;
- (int64_t)selectedIndex;
- (unint64_t)_predictionCellIndexAtLocation:(CGPoint)a3;
- (unint64_t)maximumEmojiCells;
- (unint64_t)minimumNumberOfCells;
- (void)_didRecognizeTapGesture:(id)a3;
- (void)_reloadCellsAnimated:(BOOL)a3;
- (void)_setRenderConfig:(id)a3;
- (void)_updateHighlightedCellForTouch:(id)a3;
- (void)_updateVisibleCellAppearance;
- (void)cancelTapGestureRecognizer;
- (void)configurePredictionCell:(id)a3 forCandidate:(id)a4 animated:(BOOL)a5;
- (void)layoutSubviews;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutocorrectionList:(id)a3 animated:(BOOL)a4;
- (void)setBackdropView:(id)a3;
- (void)setCellStackView:(id)a3;
- (void)setCurrentLocale:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablesHighlight:(BOOL)a3;
- (void)setDrawsBackdropView:(BOOL)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightCornerRadius:(double)a3;
- (void)setHighlightMargin:(double)a3;
- (void)setMaximumEmojiCells:(unint64_t)a3;
- (void)setMinimumNumberOfCells:(unint64_t)a3;
- (void)setRenderConfig:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorMargin:(double)a3;
- (void)setShouldAnimateCells:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUseContinuousCornerInHighlight:(BOOL)a3;
@end

@implementation TUIPredictionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cellStackView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setCellStackView:(id)a3
{
}

- (TUIPredictionViewStackView)cellStackView
{
  return self->_cellStackView;
}

- (void)setShouldAnimateCells:(BOOL)a3
{
  self->_shouldAnimateCells = a3;
}

- (BOOL)shouldAnimateCells
{
  return self->_shouldAnimateCells;
}

- (BOOL)useContinuousCornerInHighlight
{
  return self->_useContinuousCornerInHighlight;
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (double)highlightMargin
{
  return self->_highlightMargin;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)separatorMargin
{
  return self->_separatorMargin;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setDisablesHighlight:(BOOL)a3
{
  self->_disablesHighlight = a3;
}

- (BOOL)disablesHighlight
{
  return self->_disablesHighlight;
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (void)setMaximumEmojiCells:(unint64_t)a3
{
  self->_maximumEmojiCells = a3;
}

- (unint64_t)maximumEmojiCells
{
  return self->_maximumEmojiCells;
}

- (void)setMinimumNumberOfCells:(unint64_t)a3
{
  self->_minimumNumberOfCells = a3;
}

- (unint64_t)minimumNumberOfCells
{
  return self->_minimumNumberOfCells;
}

- (void)setBackdropView:(id)a3
{
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (BOOL)drawsBackdropView
{
  return self->_drawsBackdropView;
}

- (TIAutocorrectionList)autocorrectionList
{
  return self->_autocorrectionList;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TUIPredictionViewDelegate *)a3;
}

- (TUIPredictionViewDelegate)delegate
{
  return self->_delegate;
}

- (void)_updateHighlightedCellForTouch:(id)a3
{
  [a3 locationInView:self];
  unint64_t v4 = -[TUIPredictionView _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:");
  [(TUIPredictionView *)self setSelectedIndex:v4];
}

- (unint64_t)_predictionCellIndexAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = [(TUIPredictionView *)self allVisibleCells];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__TUIPredictionView__predictionCellIndexAtLocation___block_invoke;
  v9[3] = &unk_1E5593868;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];

  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

BOOL __52__TUIPredictionView__predictionCellIndexAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v8 superview];

  objc_msgSend(v7, "convertRect:fromView:", v17, v10, v12, v14, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v27.origin.CGFloat x = v19;
  v27.origin.CGFloat y = v21;
  v27.size.width = v23;
  v27.size.height = v25;
  BOOL result = CGRectContainsPoint(v27, *(CGPoint *)(a1 + 48));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_didRecognizeTapGesture:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  unint64_t v5 = -[TUIPredictionView _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:");
  if ([v4 state] == 1 || objc_msgSend(v4, "state") == 2)
  {
    [(TUIPredictionView *)self setSelectedIndex:v5];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = [(TUIPredictionView *)self allVisibleCells];
      unint64_t v7 = [v6 objectAtIndex:v5];

      id v8 = [v7 maskingScrollView];
      LODWORD(v6) = [v8 isDragging];

      if (v6)
      {
        [v4 setEnabled:0];
        [v4 setEnabled:1];
      }
    }
  }
  else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
  {
    if ([v4 state] == 3 && self->_selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = 0;
      double v24 = &v23;
      uint64_t v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__2216;
      CGRect v27 = __Block_byref_object_dispose__2217;
      id v28 = 0;
      double v9 = [v4 _activeEvents];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __45__TUIPredictionView__didRecognizeTapGesture___block_invoke;
      v22[3] = &unk_1E5593840;
      v22[4] = &v23;
      [v9 enumerateObjectsUsingBlock:v22];

      double v10 = [MEMORY[0x1E4FB1900] activeInstance];
      [v10 _attemptAuthenticationWithMessage:v24[5]];

      double v11 = [(TUIPredictionView *)self allVisibleCells];
      double v12 = [v11 objectAtIndex:self->_selectedIndex];

      double v13 = [(TUIPredictionView *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        double v15 = [v12 candidate];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = objc_alloc(MEMORY[0x1E4FAE318]);
          v17 = [v15 candidate];
          double v18 = [v15 input];
          CGFloat v19 = [v15 rawInput];
          uint64_t v20 = [v16 initWithCandidate:v17 forInput:v18 rawInput:v19];

          double v15 = (void *)v20;
        }
        CGFloat v21 = [(TUIPredictionView *)self delegate];
        [v21 predictionView:self didSelectCandidate:v15];
      }
      _Block_object_dispose(&v23, 8);
    }
    [(TUIPredictionView *)self setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

void __45__TUIPredictionView__didRecognizeTapGesture___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 _authenticationMessage];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)cancelTapGestureRecognizer
{
  v3 = [(TUIPredictionView *)self tapGestureRecognizer];
  [v3 setEnabled:0];

  id v4 = [(TUIPredictionView *)self tapGestureRecognizer];
  [v4 setEnabled:1];
}

- (void)setHighlightMargin:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_highlightMargin = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TUIPredictionView *)self cellStackView];
  uint64_t v5 = [v4 allVisibleCells];

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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setHighlightMargin:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setUseContinuousCornerInHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_useContinuousCornerInHighlight = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TUIPredictionView *)self cellStackView];
  uint64_t v5 = [v4 allVisibleCells];

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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setUseContinuousCornerInHighlight:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setHighlightCornerRadius:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_highlightCornerRadius = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TUIPredictionView *)self cellStackView];
  uint64_t v5 = [v4 allVisibleCells];

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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setHighlightCornerRadius:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setHighlightColor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_highlightColor, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(TUIPredictionView *)self cellStackView];
  uint64_t v7 = [v6 allVisibleCells];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setHighlightColor:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setSeparatorMargin:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_separatorMargin = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TUIPredictionView *)self cellStackView];
  id v5 = [v4 allVisibleCells];

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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setSeparatorMargin:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setSeparatorColor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_separatorColor, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(TUIPredictionView *)self cellStackView];
  uint64_t v7 = [v6 allVisibleCells];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setSeparatorColor:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setCurrentLocale:(id)a3
{
  id v7 = a3;
  if ((-[NSLocale isEqual:](self->_currentLocale, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentLocale, a3);
    int64_t v5 = [(TUIPredictionView *)self layoutDirection];
    uint64_t v6 = [(TUIPredictionView *)self cellStackView];
    [v6 setLayoutDirection:v5];
  }
}

- (int64_t)layoutDirection
{
  v2 = [(TUIPredictionView *)self currentLocale];
  BOOL v3 = [v2 localeIdentifier];
  int64_t IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft();

  return IsDefaultRightToLeft;
}

- (void)_setRenderConfig:(id)a3
{
  id v4 = (UIKBRenderConfig *)a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIPredictionView;
  [(TUIPredictionView *)&v5 _setRenderConfig:v4];
  if (self->_renderConfig != v4) {
    [(TUIPredictionView *)self setRenderConfig:v4];
  }
}

- (void)setRenderConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_renderConfig, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(TUIPredictionView *)self cellStackView];
  id v7 = [v6 allVisibleCells];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setRenderConfig:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setAutocorrectionList:(id)a3
{
}

- (void)setAutocorrectionList:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_autocorrectionList, a3);
  [(TUIPredictionView *)self _reloadCellsAnimated:v4];
}

- (void)setSelectedIndex:(int64_t)a3
{
  unint64_t v3 = a3;
  selectedIndeCGFloat x = self->_selectedIndex;
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL && selectedIndex != a3)
  {
    uint64_t v8 = [(TUIPredictionView *)self allVisibleCells];
    uint64_t v9 = [v8 objectAtIndex:self->_selectedIndex];

    [v9 setHighlighted:0];
    [v9 setShouldShowScalingAnimation:0];
  }
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [(TUIPredictionView *)self allVisibleCells];
    unint64_t v11 = [v10 count];

    if (v11 > v3)
    {
      long long v12 = [(TUIPredictionView *)self allVisibleCells];
      long long v13 = [v12 objectAtIndex:v3];

      long long v14 = [v13 candidate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        [v13 setShouldShowScalingAnimation:1];
        [v13 setHighlighted:1];
      }
    }
    int64_t v6 = v3;
  }
  self->_selectedIndeCGFloat x = v6;
  [(TUIPredictionView *)self _updateVisibleCellAppearance];
}

- (NSArray)displayedCandidates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(TUIPredictionView *)self allVisibleCells];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) candidate];
        uint64_t v10 = [v9 candidate];
        uint64_t v11 = [v10 length];

        if (v11) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)allVisibleCells
{
  v2 = [(TUIPredictionView *)self cellStackView];
  unint64_t v3 = [v2 allVisibleCells];

  return v3;
}

- (id)visibleCells
{
  v2 = [(TUIPredictionView *)self cellStackView];
  unint64_t v3 = [v2 visibleCells];

  return v3;
}

- (BOOL)_ensureVisibleCellCount:(unint64_t)a3 forCellStackView:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 visibleCells];
  uint64_t v7 = [v6 count];

  if (v7 != a3)
  {
    while (1)
    {
      uint64_t v8 = [v5 visibleCells];
      unint64_t v9 = [v8 count];

      if (v9 <= a3) {
        break;
      }
      uint64_t v10 = [v5 arrangedSubviews];
      uint64_t v11 = [v10 lastObject];
      [v11 removeFromSuperview];
    }
    long long v12 = [v5 visibleCells];
    unint64_t v13 = [v12 count];

    if (v13 < a3)
    {
      double v14 = *MEMORY[0x1E4F1DB28];
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        uint64_t v18 = -[TUIPredictionViewCell initWithFrame:]([TUIPredictionViewCell alloc], "initWithFrame:", v14, v15, v16, v17);
        [v5 addArrangedSubview:v18 beforeLastSubview:0];

        CGFloat v19 = [v5 visibleCells];
        unint64_t v20 = [v19 count];
      }
      while (v20 < a3);
    }
  }

  return v7 != a3;
}

- (void)_updateVisibleCellAppearance
{
  unint64_t v3 = [(TUIPredictionView *)self allVisibleCells];
  uint64_t v4 = [v3 count];

  id v5 = [(TUIPredictionView *)self allVisibleCells];
  uint64_t v6 = v5;
  if (v4 == 1)
  {
    id v10 = [v5 firstObject];

    [v10 setVisibleSeparatorEdges:10];
    [v10 setRoundedHighlightEdges:10];
  }
  else
  {
    uint64_t v7 = [v5 indexesOfObjectsPassingTest:&__block_literal_global_39];

    uint64_t v8 = [(TUIPredictionView *)self allVisibleCells];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__TUIPredictionView__updateVisibleCellAppearance__block_invoke_2;
    v11[3] = &unk_1E5593818;
    v11[4] = self;
    id v12 = v7;
    uint64_t v13 = v4;
    id v9 = v7;
    [v8 enumerateObjectsUsingBlock:v11];
  }
}

void __49__TUIPredictionView__updateVisibleCellAppearance__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v12 = a2;
  id v5 = [*(id *)(a1 + 32) allVisibleCells];
  if ([v5 count] - 1 <= a3)
  {

    goto LABEL_7;
  }
  char v6 = [*(id *)(a1 + 40) containsIndex:a3 + 1];

  if (v6)
  {
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) layoutDirection] == 1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 8;
  }
LABEL_8:
  [v12 setVisibleSeparatorEdges:v7];
  if (![*(id *)(a1 + 32) drawsBackdropView])
  {
    uint64_t v11 = 10;
    goto LABEL_18;
  }
  if (a3)
  {
    if (*(void *)(a1 + 48) - 1 != a3)
    {
      uint64_t v11 = 0;
      goto LABEL_18;
    }
    BOOL v8 = [*(id *)(a1 + 32) layoutDirection] == 1;
    uint64_t v9 = 8;
    uint64_t v10 = 2;
  }
  else
  {
    BOOL v8 = [*(id *)(a1 + 32) layoutDirection] == 1;
    uint64_t v9 = 2;
    uint64_t v10 = 8;
  }
  if (v8) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
LABEL_18:
  [v12 setRoundedHighlightEdges:v11];
}

uint64_t __49__TUIPredictionView__updateVisibleCellAppearance__block_invoke(uint64_t a1, void *a2)
{
  return [a2 highlighted];
}

- (void)configurePredictionCell:(id)a3 forCandidate:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TUIPredictionView *)self renderConfig];
  [v8 setRenderConfig:v10];

  uint64_t v11 = [(TUIPredictionView *)self separatorColor];
  [v8 setSeparatorColor:v11];

  [(TUIPredictionView *)self separatorMargin];
  objc_msgSend(v8, "setSeparatorMargin:");
  id v12 = [(TUIPredictionView *)self highlightColor];
  [v8 setHighlightColor:v12];

  [(TUIPredictionView *)self highlightMargin];
  objc_msgSend(v8, "setHighlightMargin:");
  [(TUIPredictionView *)self highlightCornerRadius];
  objc_msgSend(v8, "setHighlightCornerRadius:");
  objc_msgSend(v8, "setUseContinuousCornerInHighlight:", -[TUIPredictionView useContinuousCornerInHighlight](self, "useContinuousCornerInHighlight"));
  uint64_t v13 = [(TUIPredictionView *)self labelFontForCandidate:v9];
  [v8 setLabelFont:v13];

  double v14 = [(TUIPredictionView *)self autocorrectionList];
  double v15 = [v14 corrections];
  id v16 = [v15 autocorrection];

  BOOL v17 = [(TUIPredictionView *)self disablesHighlight];
  uint64_t v18 = 0;
  if (!v17 && v16 == v9)
  {
    if ((objc_msgSend(v9, "candidateProperty", 0) & 4) != 0)
    {
      uint64_t v18 = 1;
    }
    else
    {
      CGFloat v19 = [v9 candidate];
      unint64_t v20 = [v9 input];
      int v21 = [v19 isEqualToString:v20];

      uint64_t v18 = v21 ^ 1u;
    }
  }
  [v8 setHighlighted:v18];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __67__TUIPredictionView_configurePredictionCell_forCandidate_animated___block_invoke;
  v37[3] = &unk_1E55937D0;
  id v22 = v9;
  id v38 = v22;
  v39 = self;
  id v23 = v8;
  id v40 = v23;
  double v24 = __67__TUIPredictionView_configurePredictionCell_forCandidate_animated___block_invoke((uint64_t)v37);
  if (v24)
  {
    [v23 setImage:v24];
    uint64_t v25 = [(TUIPredictionView *)self autocorrectionList];
    v26 = [v25 predictions];
    uint64_t v27 = [v26 count];

    if (v27 == 1) {
      int v29 = 1132068864;
    }
    else {
      int v29 = 1148846080;
    }
    LODWORD(v28) = v29;
    [v23 setContentHuggingPriority:0 forAxis:v28];
  }
  else
  {
    [v23 setImage:0];
  }
  if (objc_opt_respondsToSelector())
  {
    v30 = [v22 customView];
    [v23 setCustomView:v30];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [v22 textSuggestion];
    if (objc_opt_respondsToSelector())
    {
      v32 = [v31 foregroundColor];
      [v23 setPreferredForegroundColor:v32];
    }
    else
    {
      [v23 setPreferredForegroundColor:0];
    }
    if (objc_opt_respondsToSelector())
    {
      v33 = [v31 backgroundColor];

      if (v33)
      {
        v34 = [(TUIPredictionView *)self cellStackView];
        [v34 setCellsHaveBackgroundColor:1];

        v35 = [v31 backgroundColor];
        [v23 setPreferredBackgroundColor:v35];
      }
    }
    else
    {
      v36 = [(TUIPredictionView *)self cellStackView];
      [v36 setCellsHaveBackgroundColor:0];

      [v23 setPreferredBackgroundColor:0];
    }
  }
  else
  {
    [v23 setPreferredForegroundColor:0];
    [v23 setPreferredBackgroundColor:0];
    v31 = [(TUIPredictionView *)self cellStackView];
    [v31 setCellsHaveBackgroundColor:0];
  }

  [v23 setCandidate:v22 animated:v5];
}

id __67__TUIPredictionView_configurePredictionCell_forCandidate_animated___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 32) icon], v2 = objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    unint64_t v3 = [*(id *)(a1 + 32) icon];
  }
  else if ([*(id *)(a1 + 32) customInfoType] == 32)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
    BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v6 = [v4 imageNamed:@"kb-autofill-key" inBundle:v5];
    uint64_t v7 = [*(id *)(a1 + 48) textColor];
    unint64_t v3 = [v6 _flatImageWithColor:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [*(id *)(a1 + 32) textSuggestion];
      if (objc_opt_respondsToSelector())
      {
        unint64_t v3 = [v8 image];
      }
      else
      {
        unint64_t v3 = 0;
      }
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)labelFontForCandidate:(id)a3
{
  if ([a3 isSupplementalItemCandidate])
  {
    unint64_t v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (void)_reloadCellsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(TUIPredictionView *)self setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
  id v48 = [(TUIPredictionView *)self _candidatesToDisplayForAutocorrectionList:self->_autocorrectionList];
  BOOL v5 = [v48 lastObject];
  uint64_t v6 = [v5 customInfoType];

  uint64_t v7 = [v48 indexOfObjectPassingTest:&__block_literal_global_18];
  unint64_t v8 = [(TUIPredictionView *)self _numberOfEmojisToDisplayForAutocorrectionList:self->_autocorrectionList withCandidatesShown:v48];
  uint64_t v46 = v6;
  if (!v8) {
    goto LABEL_9;
  }
  if (v6 != 0x8000 && v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    uint64_t v13 = objc_msgSend(v48, "subarrayWithRange:", 0, objc_msgSend(v48, "count", v6) - 1);
    double v14 = v48;
    goto LABEL_11;
  }
  if ((unint64_t)[v48 count] < 2)
  {
    if (v6 == 0x8000)
    {
LABEL_9:
      double v15 = v48;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v10 = [v48 lastObject];
  uint64_t v11 = objc_msgSend(v48, "subarrayWithRange:", 0, objc_msgSend(v48, "count") - 2);
  id v12 = [v48 lastObject];
  uint64_t v13 = [v11 arrayByAddingObject:v12];

  double v14 = (void *)v10;
LABEL_11:

  double v15 = (void *)v13;
LABEL_12:
  id v49 = v15;
  uint64_t v16 = objc_msgSend(v15, "count", v46);
  BOOL v17 = [(TUIPredictionView *)self cellStackView];
  [(TUIPredictionView *)self _ensureVisibleCellCount:v16 forCellStackView:v17];

  BOOL v18 = [(TUIPredictionView *)self shouldAnimateCells];
  if ([v49 count])
  {
    unint64_t v19 = 0;
    do
    {
      unint64_t v20 = [v49 objectAtIndex:v19];
      int v21 = [(TUIPredictionView *)self cellStackView];
      id v22 = [v21 visibleCells];
      id v23 = [v22 objectAtIndex:v19];

      uint64_t v24 = [v20 candidateProperty] == 2 || v18;
      [(TUIPredictionView *)self configurePredictionCell:v23 forCandidate:v20 animated:v24];

      ++v19;
    }
    while (v19 < [v49 count]);
  }
  uint64_t v25 = [(TIAutocorrectionList *)self->_autocorrectionList emojiList];
  v26 = v25;
  if (v8)
  {
    if ([v25 count] > v8)
    {
      uint64_t v27 = objc_msgSend(v26, "subarrayWithRange:", 0, v8);

      v26 = (void *)v27;
    }
    double v28 = [(TUIPredictionView *)self cellStackView];
    int v29 = [v28 subStackViews];
    uint64_t v30 = [v29 count];

    if (v30)
    {
      v31 = [(TUIPredictionView *)self cellStackView];
      v32 = [v31 subStackViews];
      v33 = [v32 firstObject];
    }
    else
    {
      v36 = [TUIPredictionViewStackView alloc];
      v33 = -[TUIPredictionViewStackView initWithFrame:](v36, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    [(TUIPredictionViewStackView *)v33 setLayoutDirection:[(TUIPredictionView *)self layoutDirection]];
    -[TUIPredictionView _ensureVisibleCellCount:forCellStackView:](self, "_ensureVisibleCellCount:forCellStackView:", [v26 count], v33);
    if ([v26 count])
    {
      unint64_t v37 = 0;
      do
      {
        id v38 = [v26 objectAtIndex:v37];
        v39 = [(TUIPredictionViewStackView *)v33 visibleCells];
        id v40 = [v39 objectAtIndex:v37];

        [(TUIPredictionView *)self configurePredictionCell:v40 forCandidate:v38 animated:v3];
        ++v37;
      }
      while (v37 < [v26 count]);
    }
    v34 = [(TUIPredictionView *)self cellStackView];
    [v34 addArrangedSubview:v33 beforeLastSubview:v47 == 0x8000];
  }
  else
  {
    v33 = [(TUIPredictionView *)self cellStackView];
    v34 = [(TUIPredictionViewStackView *)v33 subStackViews];
    v35 = [v34 firstObject];
    [v35 removeFromSuperview];
  }
  [(TUIPredictionView *)self _updateVisibleCellAppearance];
  v41 = [(TUIPredictionView *)self visibleCells];
  uint64_t v42 = [v41 count];

  if (v42 == 1) {
    double v43 = 30.0;
  }
  else {
    double v43 = 0.0;
  }
  v44 = [(TUIPredictionView *)self cellStackView];
  objc_msgSend(v44, "setContentMargin:", 0.0, v43, 0.0, v43);

  v45 = [(TUIPredictionView *)self cellStackView];
  [v45 setNeedsLayout];
}

BOOL __42__TUIPredictionView__reloadCellsAnimated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 candidateProperty] == 8;
}

- (int64_t)_numberOfEmojisToDisplayForAutocorrectionList:(id)a3 withCandidatesShown:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [(TUIPredictionView *)self maximumEmojiCells];
  uint64_t v7 = [(TUIPredictionView *)self autocorrectionList];
  unint64_t v8 = [v7 emojiList];
  unint64_t v9 = [v8 count];

  if (v6 >= v9) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = v6;
  }
  uint64_t v11 = [v5 predictions];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [v5 predictions];
    uint64_t v14 = [v13 indexOfObjectPassingTest:&__block_literal_global_16];

    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v10 = 0;
    }
  }

  return v10;
}

uint64_t __87__TUIPredictionView__numberOfEmojisToDisplayForAutocorrectionList_withCandidatesShown___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAlternativeInput];
}

- (id)_candidatesToDisplayForAutocorrectionList:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = [v4 corrections];
  uint64_t v7 = [v6 autocorrection];

  v65 = v4;
  uint64_t v8 = [v4 predictions];
  unint64_t v9 = [v7 input];
  if ([v9 length])
  {
  }
  else
  {
    int64_t v10 = [v7 candidate];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      id v12 = self;

      uint64_t v7 = 0;
      goto LABEL_11;
    }
  }
  if (!v7)
  {
    id v12 = self;
    goto LABEL_11;
  }
  if ([v7 isContinuousPathConversion])
  {
    id v12 = self;
    [v5 addObject:v7];
LABEL_11:
    unint64_t v19 = 0;
    v64 = 0;
    goto LABEL_29;
  }
  uint64_t v13 = [v7 input];
  uint64_t v14 = [v7 rawInput];
  double v15 = [MEMORY[0x1E4FB1900] activeInstance];
  uint64_t v16 = [v15 smartPunctuationController];

  v61 = (void *)v8;
  v63 = v14;
  if (v16)
  {
    id v17 = [v16 smartPunctuationedStringForString:v13];
    id v18 = [v16 smartPunctuationedStringForString:v14];
  }
  else
  {
    id v17 = v13;
    id v18 = v14;
  }
  id v20 = v18;
  int v21 = [(TUIPredictionView *)self currentLocale];
  v62 = v17;
  v60 = v20;
  uint64_t v22 = +[TUITypedStringCandidate typedStringCandidateWithLocale:v21 candidateString:v17 inputString:v17 rawInputString:v20];

  v64 = (void *)v22;
  [v5 addObject:v22];
  id v23 = [v7 candidate];
  if ([v23 isEqualToString:v13])
  {

LABEL_16:
    if ([v7 candidateProperty] != 4 && !objc_msgSend(v7, "isSupplementalItemCandidate")) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  [v7 candidate];
  v25 = uint64_t v24 = v13;
  int v26 = [v25 isEqualToString:v63];

  uint64_t v13 = v24;
  if (v26) {
    goto LABEL_16;
  }
LABEL_18:
  [v5 addObject:v7];
LABEL_19:
  uint64_t v8 = (uint64_t)v61;
  if (v61)
  {
    v59 = v13;
    uint64_t v27 = [v61 indexOfObjectWithOptions:0 passingTest:&__block_literal_global_2245];
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v19 = 0;
    }
    else
    {
      uint64_t v28 = v27;
      int v29 = [v61 objectAtIndex:v27];
      uint64_t v30 = [v29 candidate];

      if (v16)
      {
        id v31 = [v16 smartPunctuationedStringForString:v30];
      }
      else
      {
        id v31 = v30;
      }
      v32 = v31;
      v33 = [(TUIPredictionView *)self currentLocale];
      unint64_t v19 = +[TUITypedStringCandidate typedStringCandidateWithLocale:v33 candidateString:v32 inputString:v62 rawInputString:v60];

      v34 = (void *)[v61 mutableCopy];
      [v34 removeObjectAtIndex:v28];
      uint64_t v8 = [v34 copy];
    }
    uint64_t v13 = v59;
  }
  else
  {
    unint64_t v19 = 0;
  }
  id v12 = self;

LABEL_29:
  v35 = (void *)v8;
  [v5 addObjectsFromArray:v8];
  v36 = [v5 lastObject];
  uint64_t v37 = [v36 customInfoType];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v38 = v5;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v69;
    while (2)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v69 != v41) {
          objc_enumerationMutation(v38);
        }
        if ([*(id *)(*((void *)&v68 + 1) + 8 * i) candidateProperty] == 8)
        {

          goto LABEL_40;
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }

  if (v37 == 0x8000)
  {
LABEL_40:
    uint64_t v43 = 1;
    unint64_t v45 = 4;
    unsigned int v44 = 1;
  }
  else
  {
    uint64_t v43 = 0;
    unsigned int v44 = 0;
    unint64_t v45 = 3;
  }
  if ([v38 count] > v45)
  {
    uint64_t v46 = [v38 lastObject];
    uint64_t v47 = [v46 customInfoType];

    if (v47 == 32) {
      uint64_t v48 = 1;
    }
    else {
      uint64_t v48 = v44;
    }
    objc_msgSend(v38, "removeObjectsInRange:", v45 - v48, objc_msgSend(v38, "count") - v45);
  }
  uint64_t v49 = [v38 count];
  if ([(TUIPredictionView *)v12 _shouldPadWithEmptyCellsForAutocorrectionList:v65])
  {
    unint64_t v50 = [(TUIPredictionView *)v12 minimumNumberOfCells] + v43;
    while ([v38 count] < v50)
    {
      v51 = +[TUIPlaceholderCandidate placeholderCandidate];
      if (v44) {
        objc_msgSend(v38, "insertObject:atIndex:", v51, objc_msgSend(v38, "count") - 1);
      }
      else {
        [v38 addObject:v51];
      }
    }
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke_2;
  v66[3] = &unk_1E55937A8;
  id v52 = v7;
  id v67 = v52;
  uint64_t v53 = [v38 indexOfObjectWithOptions:0 passingTest:v66];
  if (v53 == 0x7FFFFFFFFFFFFFFFLL && v49 == 1) {
    uint64_t v53 = [v38 indexOfObjectWithOptions:0 passingTest:&__block_literal_global_14];
  }
  if (v53 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v38, "exchangeObjectAtIndex:withObjectAtIndex:", 1);
  }
  if (v19)
  {
    uint64_t v54 = [v38 count];
    v55 = [v38 lastObject];
    uint64_t v56 = [v55 customInfoType];

    uint64_t v57 = -2;
    if (v56 != 0x8000) {
      uint64_t v57 = -1;
    }
    if (__CFADD__(v57, v54)) {
      [v38 replaceObjectAtIndex:v57 + v54 withObject:v19];
    }
  }

  return v38;
}

BOOL __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

uint64_t __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isSupplementalItemCandidate];
}

uint64_t __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAlternativeInput];
}

- (BOOL)_shouldPadWithEmptyCellsForAutocorrectionList:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = objc_msgSend(a3, "predictions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  BOOL v5 = 1;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        unsigned int v10 = [(id)objc_opt_class() type];
        uint64_t v11 = [v9 candidateProperty];
        if (v10 > 8 || ((1 << v10) & 0x124) == 0)
        {
          uint64_t v13 = v11;
          if ([v9 customInfoType] != 0x8000
            && ([v9 isAlternativeInput] & 1) == 0
            && v13 != 8)
          {
            BOOL v5 = 0;
            goto LABEL_18;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
    BOOL v5 = 1;
  }
LABEL_18:

  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = 45.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)maximumBackgroundWidth
{
  [(TUIPredictionView *)self bounds];
  return v2 * 0.84;
}

- (void)setDrawsBackdropView:(BOOL)a3
{
  BOOL v3 = a3;
  self->_drawsBackdropView = a3;
  BOOL v5 = [(TUIPredictionView *)self backdropView];
  id v13 = v5;
  if (v3)
  {

    if (!v13)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(TUIPredictionView *)self setBackdropView:v7];

      uint64_t v8 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
      unint64_t v9 = [(TUIPredictionView *)self backdropView];
      [v9 setBackgroundColor:v8];

      unsigned int v10 = [(TUIPredictionView *)self backdropView];
      [v10 _setContinuousCornerRadius:10.0];

      uint64_t v11 = [(TUIPredictionView *)self backdropView];
      [(TUIPredictionView *)self insertSubview:v11 atIndex:0];

      [(TUIPredictionView *)self setNeedsLayout];
    }
    BOOL v5 = [(TUIPredictionView *)self backdropView];
    id v13 = v5;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  [v5 setHidden:v12];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TUIPredictionView;
  [(TUIPredictionView *)&v13 layoutSubviews];
  [(TUIPredictionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TUIPredictionView *)self cellStackView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if ([(TUIPredictionView *)self drawsBackdropView])
  {
    uint64_t v12 = [(TUIPredictionView *)self backdropView];
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
  }
}

- (TUIPredictionView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TUIPredictionView;
  double v3 = -[TUIPredictionView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [TUIPredictionViewStackView alloc];
    double v5 = -[TUIPredictionViewStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUIPredictionView *)v3 setCellStackView:v5];

    double v6 = [(TUIPredictionView *)v3 cellStackView];
    [(TUIPredictionView *)v3 addSubview:v6];

    v3->_selectedIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel__didRecognizeTapGesture_];
    [(TUIPredictionView *)v3 setTapGestureRecognizer:v7];

    double v8 = [(TUIPredictionView *)v3 tapGestureRecognizer];
    [v8 setMinimumPressDuration:0.0];

    double v9 = [(TUIPredictionView *)v3 tapGestureRecognizer];
    [v9 setCancelsTouchesInView:0];

    double v10 = [(TUIPredictionView *)v3 tapGestureRecognizer];
    [v10 setDelegate:v3];

    uint64_t v11 = [(TUIPredictionView *)v3 tapGestureRecognizer];
    [(TUIPredictionView *)v3 addGestureRecognizer:v11];

    [(TUIPredictionView *)v3 setMinimumNumberOfCells:3];
    [(TUIPredictionView *)v3 setMaximumEmojiCells:3];
    uint64_t v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    [(TUIPredictionView *)v3 setCurrentLocale:v12];

    [(TUIPredictionView *)v3 setSeparatorMargin:10.0];
    [(TUIPredictionView *)v3 setShouldAnimateCells:1];
    objc_super v13 = [(TUIPredictionView *)v3 layer];
    [v13 setHitTestsAsOpaque:1];
  }
  return v3;
}

- (id)test_cellForCandidate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(TUIPredictionView *)self allVisibleCells];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [v9 candidate];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end