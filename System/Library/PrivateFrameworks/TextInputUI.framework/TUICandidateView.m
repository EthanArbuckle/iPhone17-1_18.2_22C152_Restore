@interface TUICandidateView
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)changingLayout;
- (BOOL)handleNumberKey:(unint64_t)a3;
- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4 inGridType:(int64_t)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)reloadPrimaryGridDataIfNeeded;
- (BOOL)shouldAutomaticallyHideAndShowSortControl;
- (BOOL)shouldShowArrowButton;
- (BOOL)showingArrowButton;
- (BOOL)showingSortControl;
- (BOOL)toggleSortControl:(BOOL)a3 animated:(BOOL)a4;
- (CAShapeLayer)roundedBorderLayer;
- (CGRect)boundsForClipsToBoundsViewWithState:(id)a3;
- (CGSize)getArrowButtonSizeForGrid;
- (NSIndexPath)disambiguationSelectedIndexPath;
- (NSIndexPath)lastSelectedIndexPath;
- (NSIndexPath)selectedIndexPath;
- (NSString)inlineText;
- (TIKeyboardCandidate)selectedCandidate;
- (TIKeyboardCandidate)selectedDisambiguationCandidate;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TUICandidateArrowButton)arrowButton;
- (TUICandidateBackdropView)backdropView;
- (TUICandidateGrid)disambiguationGrid;
- (TUICandidateGrid)primaryGrid;
- (TUICandidateInlineTextView)inlineTextView;
- (TUICandidateMask)candidateMask;
- (TUICandidateSortControl)sortControl;
- (TUICandidateView)initWithCoder:(id)a3;
- (TUICandidateView)initWithFrame:(CGRect)a3;
- (TUICandidateViewDelegate)delegate;
- (TUICandidateViewState)state;
- (UIView)clipsToBoundsView;
- (double)arrowButtonHeight;
- (double)arrowButtonWidth;
- (double)disambiguationHeight;
- (double)inlineTextHeight;
- (double)sortControlHeight;
- (id)candidateGroupsForCurrentState;
- (id)filteredCandidates;
- (id)gridOfType:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)indexPathForCandidate:(id)a3;
- (id)sortControlTitles;
- (id)visibleCandidates;
- (int64_t)effectiveCandidateArrowButonPosition;
- (int64_t)rowForCandidate:(id)a3;
- (int64_t)selectedSortControlIndex;
- (int64_t)viewOffsetForCandidate:(id)a3;
- (void)candidateGrid:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5;
- (void)candidateGrid:(id)a3 didChangeContentSize:(CGSize)a4;
- (void)candidateGrid:(id)a3 didMoveHighlightFrame:(CGRect)a4;
- (void)candidateGridNeedsToExpand:(id)a3;
- (void)candidateGridSelectionDidChange:(id)a3;
- (void)changeLayoutInsideAnimationBlock;
- (void)commonInit;
- (void)didTapArrowButton:(id)a3;
- (void)didTapInlineText:(id)a3;
- (void)finalizeLayoutChange;
- (void)handleSortControlValueChanged;
- (void)layoutSubviews;
- (void)prepareForLayoutChange:(BOOL)a3;
- (void)reloadDisambiguationGridDataIfNeeded;
- (void)reloadGridsIfNeeded;
- (void)resetSortControlIndex;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setArrowButton:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setCandidateMask:(id)a3;
- (void)setCandidateResultSet:(id)a3;
- (void)setChangingLayout:(BOOL)a3;
- (void)setClipsToBoundsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisambiguationGrid:(id)a3;
- (void)setDisambiguationSelectedIndexPath:(id)a3;
- (void)setInlineText:(id)a3;
- (void)setInlineTextView:(id)a3;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setPrimaryGrid:(id)a3;
- (void)setRoundedBorderLayer:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setShouldShowArrowButton:(BOOL)a3;
- (void)setShowingSortControl:(BOOL)a3;
- (void)setSortControl:(id)a3;
- (void)setState:(id)a3;
- (void)setState:(id)a3 animated:(BOOL)a4 animator:(id)a5 options:(unint64_t)a6 force:(BOOL)a7 completion:(id)a8;
- (void)setState:(id)a3 animated:(BOOL)a4 force:(BOOL)a5 completion:(id)a6;
- (void)setState:(id)a3 animated:(BOOL)a4 options:(unint64_t)a5 force:(BOOL)a6 completion:(id)a7;
- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4 inGridType:(int64_t)a5;
- (void)updateArrowButtonVisibility;
- (void)updateCornerRadiusAfterFinalizingLayout:(BOOL)a3;
- (void)updateDisambiguationSelectionIndex;
- (void)updatePrimaryGridRowTypeWithOptions:(unint64_t)a3 animated:(BOOL)a4 animator:(id)a5 completion:(id)a6;
- (void)updateSortControlTitlesIfNeeded;
@end

@implementation TUICandidateView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_arrowButton, 0);
  objc_storeStrong((id *)&self->_inlineTextView, 0);
  objc_storeStrong((id *)&self->_sortControl, 0);
  objc_storeStrong((id *)&self->_disambiguationGrid, 0);
  objc_storeStrong((id *)&self->_primaryGrid, 0);
  objc_storeStrong((id *)&self->_candidateMask, 0);
  objc_storeStrong((id *)&self->_roundedBorderLayer, 0);
  objc_storeStrong((id *)&self->_clipsToBoundsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_inlineText, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setChangingLayout:(BOOL)a3
{
  self->_changingLayout = a3;
}

- (BOOL)changingLayout
{
  return self->_changingLayout;
}

- (void)setShouldShowArrowButton:(BOOL)a3
{
  self->_shouldShowArrowButton = a3;
}

- (BOOL)shouldShowArrowButton
{
  return self->_shouldShowArrowButton;
}

- (void)setShowingSortControl:(BOOL)a3
{
  self->_showingSortControl = a3;
}

- (BOOL)showingSortControl
{
  return self->_showingSortControl;
}

- (void)setBackdropView:(id)a3
{
}

- (TUICandidateBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setArrowButton:(id)a3
{
}

- (TUICandidateArrowButton)arrowButton
{
  return self->_arrowButton;
}

- (void)setInlineTextView:(id)a3
{
}

- (TUICandidateInlineTextView)inlineTextView
{
  return self->_inlineTextView;
}

- (void)setSortControl:(id)a3
{
}

- (TUICandidateSortControl)sortControl
{
  return self->_sortControl;
}

- (void)setDisambiguationGrid:(id)a3
{
}

- (TUICandidateGrid)disambiguationGrid
{
  return self->_disambiguationGrid;
}

- (void)setPrimaryGrid:(id)a3
{
}

- (TUICandidateGrid)primaryGrid
{
  return self->_primaryGrid;
}

- (void)setCandidateMask:(id)a3
{
}

- (TUICandidateMask)candidateMask
{
  return self->_candidateMask;
}

- (void)setRoundedBorderLayer:(id)a3
{
}

- (CAShapeLayer)roundedBorderLayer
{
  return self->_roundedBorderLayer;
}

- (void)setClipsToBoundsView:(id)a3
{
}

- (UIView)clipsToBoundsView
{
  return self->_clipsToBoundsView;
}

- (void)setDelegate:(id)a3
{
}

- (TUICandidateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUICandidateViewDelegate *)WeakRetained;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (NSString)inlineText
{
  return self->_inlineText;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (TUICandidateViewState)state
{
  return self->_state;
}

- (id)filteredCandidates
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TUICandidateView *)self candidateResultSet];
  int v4 = [v3 hasCandidates];

  if (v4)
  {
    v5 = [(TUICandidateView *)self candidateResultSet];
    v6 = [v5 sortMethods];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      v8 = [(TUICandidateView *)self candidateResultSet];
      v9 = [v8 sortMethodGroups];
      v10 = [(TUICandidateView *)self candidateResultSet];
      v11 = [v10 sortMethods];
      v12 = [v11 objectAtIndex:0];
      v13 = [v9 objectForKey:v12];
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4FAE308]);
      v16 = (void *)MEMORY[0x1E4F1CAA0];
      v17 = [(TUICandidateView *)self candidateResultSet];
      v18 = [v17 candidates];
      v19 = [v16 orderedSetWithArray:v18];
      v20 = (void *)[v15 initWithTitle:&stru_1EDC653C0 candidates:v19];
      v24[0] = v20;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    v21 = [v13 firstObject];
    v22 = [v21 candidates];
    v14 = [v22 array];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v14;
}

- (id)visibleCandidates
{
  v2 = [(TUICandidateView *)self primaryGrid];
  v3 = [v2 visibleCandidates];

  return v3;
}

- (void)candidateGridNeedsToExpand:(id)a3
{
  id v7 = a3;
  id v4 = [(TUICandidateView *)self primaryGrid];
  if (v4 == v7)
  {
    v5 = [(TUICandidateView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      goto LABEL_5;
    }
    id v4 = [(TUICandidateView *)self delegate];
    [v4 candidateViewNeedsToExpand:self];
  }

LABEL_5:
}

- (void)candidateGrid:(id)a3 didMoveHighlightFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(TUICandidateView *)self primaryGrid];

  if (v10 == v9)
  {
    v11 = [(TUICandidateView *)self state];
    v12 = [v11 style];
    v13 = [v12 leftEdgeSeparatorImage];
    if (v13)
    {
    }
    else
    {
      v14 = [(TUICandidateView *)self state];
      id v15 = [v14 style];
      v16 = [v15 rightEdgeSeparatorImage];

      if (!v16) {
        goto LABEL_13;
      }
    }
    -[TUICandidateView convertRect:fromView:](self, "convertRect:fromView:", v9, x, y, width, height);
    UIRectInset();
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v25 = [(UIView *)self _allLines];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [v30 frame];
          v42.origin.double x = v31;
          v42.origin.double y = v32;
          v42.size.double width = v33;
          v42.size.double height = v34;
          v41.origin.double x = v18;
          v41.origin.double y = v20;
          v41.size.double width = v22;
          v41.size.double height = v24;
          objc_msgSend(v30, "setHidden:", CGRectIntersectsRect(v41, v42));
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v27);
    }
  }
LABEL_13:
}

- (void)candidateGrid:(id)a3 didChangeContentSize:(CGSize)a4
{
  id v5 = a3;
  id v6 = [(TUICandidateView *)self primaryGrid];

  if (v6 == v5)
  {
    [(TUICandidateView *)self updateArrowButtonVisibility];
  }
}

- (void)candidateGridSelectionDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [(TUICandidateView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TUICandidateView *)self delegate];
    id v7 = [(TUICandidateView *)self primaryGrid];
    [v6 candidateViewSelectionDidChange:self inGridType:v7 != v8];
  }
}

- (void)candidateGrid:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5
{
  v14 = (TUICandidateGrid *)a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(TUICandidateView *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    BOOL v12 = self->_disambiguationGrid == v14;
    v13 = [(TUICandidateView *)self delegate];
    [v13 candidateView:self didAcceptCandidate:v8 atIndexPath:v9 inGridType:v12];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(TUICandidateView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TUICandidateView *)self delegate];
    [v6 candidateViewWillBeginDragging:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  if ([(TUICandidateView *)self shouldAutomaticallyHideAndShowSortControl])
  {
    id v4 = [v8 panGestureRecognizer];
    [v4 velocityInView:v8];
    double v6 = v5;

    if (v6 > 200.0 || v6 < -5.0) {
      [(TUICandidateView *)self toggleSortControl:v6 > 200.0 animated:1];
    }
  }
}

- (CGSize)getArrowButtonSizeForGrid
{
  double v3 = 0.0;
  double v4 = 0.0;
  if ([(TUICandidateView *)self effectiveCandidateArrowButonPosition] == 1)
  {
    [(TUICandidateView *)self arrowButtonWidth];
    double v4 = v5;
    double v6 = [(TUICandidateView *)self state];
    if (![v6 inlineTextViewPosition])
    {
      [(TUICandidateView *)self arrowButtonHeight];
      double v3 = v7;
    }
  }
  double v8 = v4;
  double v9 = v3;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (int64_t)effectiveCandidateArrowButonPosition
{
  double v3 = [(TUICandidateView *)self state];
  uint64_t v4 = [v3 arrowButtonPosition];

  uint64_t v5 = [(TUICandidateView *)self effectiveUserInterfaceLayoutDirection];
  int64_t v6 = 5;
  if (v5 != 1) {
    int64_t v6 = 1;
  }
  int64_t v7 = 5;
  if (v5 == 1) {
    int64_t v7 = 1;
  }
  if (v4 != 6) {
    int64_t v7 = v4;
  }
  if (v4 == 7) {
    return v6;
  }
  else {
    return v7;
  }
}

- (BOOL)showingArrowButton
{
  arrowButton = self->_arrowButton;
  if (arrowButton) {
    LOBYTE(arrowButton) = [(TUICandidateArrowButton *)arrowButton isHidden] ^ 1;
  }
  return (char)arrowButton;
}

- (void)updateArrowButtonVisibility
{
  BOOL v3 = [(TUICandidateView *)self shouldShowArrowButton];
  int64_t v4 = [(TUICandidateView *)self effectiveCandidateArrowButonPosition];
  uint64_t v5 = [(TUICandidateView *)self state];
  if ([v5 primaryGridRowType])
  {
    int64_t v6 = [(TUICandidateView *)self state];
    if ([v6 primaryGridRowType] != 1)
    {

LABEL_9:
      uint64_t v12 = 1;
      goto LABEL_13;
    }

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 4) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  int64_t v7 = [(TUICandidateView *)self primaryGrid];
  [v7 contentSize];
  double v9 = v8;
  id v10 = [(TUICandidateView *)self primaryGrid];
  [v10 frame];
  if (v9 <= CGRectGetWidth(v46))
  {
    v13 = [(TUICandidateView *)self primaryGrid];
    [v13 contentSize];
    double v15 = v14;
    v16 = [(TUICandidateView *)self primaryGrid];
    [v16 frame];
    BOOL v11 = v15 > CGRectGetHeight(v47);
  }
  else
  {
    BOOL v11 = 1;
  }

  double v17 = [(TUICandidateView *)self state];
  CGFloat v18 = [v17 style];
  double v19 = [v18 arrowButtonImageName];
  char v20 = [v19 hasPrefix:@"character.motion"];

  uint64_t v12 = 1;
  if (v20)
  {
    BOOL v3 = 1;
  }
  else
  {
    switch(v4)
    {
      case 1:
        if (v3 && !v11)
        {
          uint64_t v40 = [(TUICandidateView *)self state];
          if ([v40 arrowButtonDirection] == 2)
          {
            BOOL v3 = 1;
          }
          else
          {
            v43 = [(TUICandidateView *)self state];
            BOOL v3 = [v43 arrowButtonDirection] == 3;
          }
          goto LABEL_9;
        }
        break;
      case 2:
        uint64_t v12 = v11;
        break;
      case 4:
        BOOL v3 = v11;
        break;
      case 5:
        if (v3 && !v11)
        {
          CGRect v41 = [(TUICandidateView *)self state];
          [v41 additionalHeight];
          BOOL v3 = v42 != 0.0;
        }
        break;
      default:
        break;
    }
  }
LABEL_13:
  [(TUICandidateArrowButton *)self->_arrowButton setHidden:v3 ^ 1];
  [(TUICandidateArrowButton *)self->_arrowButton setEnabled:v12];
  id v44 = [(TUICandidateView *)self state];
  double v21 = [v44 style];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v22 = [(TUICandidateView *)self state];
    double v23 = [v22 style];
    int v24 = [v23 shouldUpdateCollectionViewWidthForArrowButtonVisibility];

    if (!v24) {
      return;
    }
    v25 = [(TUICandidateView *)self primaryGrid];
    [v25 setIsArrowButtonVisible:v3];

    if (!v3) {
      return;
    }
    uint64_t v26 = [(TUICandidateView *)self state];
    uint64_t v27 = [v26 sortControlPosition];

    if (v27 != 4) {
      return;
    }
    uint64_t v28 = [(TUICandidateView *)self sortControl];
    [v28 frame];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    [(TUICandidateView *)self bounds];
    double v36 = v35;
    [(TUICandidateView *)self getArrowButtonSizeForGrid];
    double v38 = v36 - v37;
    v39 = [(TUICandidateView *)self sortControl];
    objc_msgSend(v39, "setFrame:", v30, v32, v38, v34);

    id v44 = [(TUICandidateView *)self sortControl];
    [v44 layoutIfNeeded];
  }
  else
  {
  }
}

- (void)handleSortControlValueChanged
{
  id v7 = [(TUICandidateView *)self selectedIndexPath];
  [(TUICandidateView *)self reloadPrimaryGridDataIfNeeded];
  BOOL v3 = [(TUICandidateView *)self primaryGrid];
  [v3 scrollToFirstCandidate];

  if (v7)
  {
    int64_t v4 = [(TUICandidateView *)self primaryGrid];
    uint64_t v5 = [v4 firstIndexPath];
    if (v5)
    {
      [(TUICandidateView *)self setSelectedIndexPath:v5];
    }
    else
    {
      int64_t v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [(TUICandidateView *)self setSelectedIndexPath:v6];
    }
  }
}

- (BOOL)toggleSortControl:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a4 && [(TUICandidateView *)self showingSortControl] == a3) {
    return 0;
  }
  [(TUICandidateView *)self setShowingSortControl:v5];
  id v7 = [(TUICandidateView *)self sortControl];
  [v7 setHidden:0];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__TUICandidateView_toggleSortControl_animated___block_invoke;
  aBlock[3] = &unk_1E55941A8;
  aBlock[4] = self;
  double v8 = (void (**)(void))_Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__TUICandidateView_toggleSortControl_animated___block_invoke_2;
  v11[3] = &unk_1E5593588;
  v11[4] = self;
  BOOL v12 = v5;
  double v9 = (void (**)(void *, uint64_t))_Block_copy(v11);
  if (v4)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:v9 completion:0.1];
  }
  else
  {
    v8[2](v8);
    v9[2](v9, 1);
  }

  return 1;
}

uint64_t __47__TUICandidateView_toggleSortControl_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeLayoutInsideAnimationBlock];
}

uint64_t __47__TUICandidateView_toggleSortControl_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (BOOL)shouldAutomaticallyHideAndShowSortControl
{
  v2 = [(TUICandidateView *)self state];
  BOOL v3 = [v2 sortControlPosition] == 3;

  return v3;
}

- (id)sortControlTitles
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v4 = [(TUICandidateView *)self candidateResultSet];
  BOOL v5 = [v4 sortMethods];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = UIKeyboardLocalizedString();
        BOOL v12 = (void *)v11;
        if (v11) {
          v13 = (void *)v11;
        }
        else {
          v13 = v10;
        }
        id v14 = v13;

        [v3 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)didTapInlineText:(id)a3
{
  BOOL v4 = [(TUICandidateView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TUICandidateView *)self delegate];
    [v6 candidateViewDidTapInlineText:self];
  }
}

- (void)didTapArrowButton:(id)a3
{
  BOOL v4 = [(TUICandidateView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TUICandidateView *)self delegate];
    [v6 candidateViewDidTapArrowButton:self];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(TUICandidateView *)self clipsToBoundsView];
  [v8 frame];
  v21.double x = x;
  v21.double y = y;
  BOOL v9 = CGRectContainsPoint(v23, v21);

  if (v9)
  {
    id v10 = [(TUICandidateView *)self clipsToBoundsView];
    uint64_t v11 = [(TUICandidateView *)self clipsToBoundsView];
LABEL_6:
    long long v16 = v11;
    objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
    long long v17 = objc_msgSend(v10, "hitTest:withEvent:", v7);

    goto LABEL_8;
  }
  uint64_t v12 = [(TUICandidateView *)self arrowButton];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(TUICandidateView *)self arrowButton];
    [v14 frame];
    v22.double x = x;
    v22.double y = y;
    BOOL v15 = CGRectContainsPoint(v24, v22);

    if (v15)
    {
      id v10 = [(TUICandidateView *)self arrowButton];
      uint64_t v11 = [(TUICandidateView *)self arrowButton];
      goto LABEL_6;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)TUICandidateView;
  long long v17 = -[TUICandidateView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
LABEL_8:

  return v17;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TUICandidateView;
  if (!-[TUICandidateView pointInside:withEvent:](&v17, sel_pointInside_withEvent_, v9, x, y))
  {
    uint64_t v11 = [(TUICandidateView *)self clipsToBoundsView];
    char v12 = [v11 isHidden];
    if ((v12 & 1) != 0
      || ([(TUICandidateView *)self clipsToBoundsView],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          [(TUICandidateView *)self clipsToBoundsView],
          char v5 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "convertPoint:fromView:", self, x, y),
          (objc_msgSend(v4, "pointInside:withEvent:", v9) & 1) == 0))
    {
      v13 = [(TUICandidateView *)self arrowButton];
      if ([v13 isHidden])
      {

        char v10 = 0;
        if (v12) {
          goto LABEL_11;
        }
      }
      else
      {
        id v14 = [(TUICandidateView *)self arrowButton];
        BOOL v15 = [(TUICandidateView *)self arrowButton];
        objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
        char v10 = objc_msgSend(v14, "pointInside:withEvent:", v9);

        if (v12)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_11;
  }
  char v10 = 1;
LABEL_12:

  return v10;
}

- (TIKeyboardCandidate)selectedDisambiguationCandidate
{
  v2 = [(TUICandidateView *)self disambiguationGrid];
  BOOL v3 = [v2 selectedCandidate];

  return (TIKeyboardCandidate *)v3;
}

- (TIKeyboardCandidate)selectedCandidate
{
  v2 = [(TUICandidateView *)self primaryGrid];
  BOOL v3 = [v2 selectedCandidate];

  return (TIKeyboardCandidate *)v3;
}

- (void)setDisambiguationSelectedIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TUICandidateView *)self disambiguationGrid];
  [v5 setSelectedIndexPath:v4];
}

- (NSIndexPath)disambiguationSelectedIndexPath
{
  v2 = [(TUICandidateView *)self disambiguationGrid];
  BOOL v3 = [v2 selectedIndexPath];

  return (NSIndexPath *)v3;
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(TUICandidateView *)self primaryGrid];
  [v9 setSelectedIndexPath:v8 animated:v6 scrollPosition:a5];
}

- (void)setSelectedIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TUICandidateView *)self primaryGrid];
  [v5 setSelectedIndexPath:v4];
}

- (NSIndexPath)selectedIndexPath
{
  v2 = [(TUICandidateView *)self primaryGrid];
  BOOL v3 = [v2 selectedIndexPath];

  return (NSIndexPath *)v3;
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  id v4 = [(TUICandidateView *)self primaryGrid];
  LOBYTE(a3) = [v4 handleNumberKey:a3];

  return a3;
}

- (int64_t)rowForCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUICandidateView *)self primaryGrid];
  int64_t v6 = [v5 rowForCandidate:v4];

  return v6;
}

- (int64_t)viewOffsetForCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUICandidateView *)self primaryGrid];
  int64_t v6 = [v5 viewOffsetForCandidate:v4];

  return v6;
}

- (id)indexPathForCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUICandidateView *)self primaryGrid];
  int64_t v6 = [v5 indexPathForCandidate:v4];

  return v6;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4 inGridType:(int64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v7 = [(TUICandidateView *)self gridOfType:a5];
  [v7 showCandidateInForwardDirection:v6 granularity:v5];
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4 inGridType:(int64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v7 = [(TUICandidateView *)self gridOfType:a5];
  LOBYTE(v5) = [v7 hasCandidateInForwardDirection:v6 granularity:v5];

  return v5;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  BOOL v4 = a3;
  if (a4 == 3)
  {
    BOOL v6 = [(TUICandidateSortControl *)self->_sortControl titles];
    uint64_t v7 = [v6 count];

    if (v7 >= 2)
    {
      id v8 = [(TUICandidateView *)self sortControl];
      uint64_t v9 = [v8 selectedIndex];
      uint64_t v10 = v7 - 1;
      if (v4) {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = (v10 + v9) % v7;
      char v12 = [(TUICandidateView *)self sortControl];
      [v12 setSelectedIndex:v11];

      [(TUICandidateView *)self handleSortControlValueChanged];
    }
  }
  else
  {
    -[TUICandidateView showCandidateInForwardDirection:granularity:inGridType:](self, "showCandidateInForwardDirection:granularity:inGridType:");
  }
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  if (a4 == 3)
  {
    uint64_t v5 = [(TUICandidateView *)self sortControl];
    if (v5
      && (BOOL v6 = (void *)v5,
          [(TUICandidateView *)self sortControl],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isHidden],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      uint64_t v11 = [(TUICandidateView *)self sortControl];
      char v12 = [v11 titles];
      if ((unint64_t)[v12 count] < 2)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        v13 = [(TUICandidateView *)self state];
        id v14 = [v13 style];
        int v9 = [v14 disableSwitchingSortingMethodByTabKey] ^ 1;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    return v9;
  }
  else
  {
    return -[TUICandidateView hasCandidateInForwardDirection:granularity:inGridType:](self, "hasCandidateInForwardDirection:granularity:inGridType:", a3);
  }
}

- (id)gridOfType:(int64_t)a3
{
  if (a3) {
    [(TUICandidateView *)self disambiguationGrid];
  }
  else {
  BOOL v3 = [(TUICandidateView *)self primaryGrid];
  }
  return v3;
}

- (id)candidateGroupsForCurrentState
{
  v37[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUICandidateView *)self candidateResultSet];
  BOOL v4 = [v3 sortMethods];
  uint64_t v5 = [v4 count];

  BOOL v6 = [(TUICandidateView *)self state];
  if ([v6 primaryGridRowType])
  {

LABEL_4:
    char v8 = [(TUICandidateView *)self sortControl];
    uint64_t v9 = [v8 selectedIndex];

    if (v9 > (unint64_t)(v5 - 1) || v9 < 0) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v9;
    }
    char v12 = [(TUICandidateView *)self candidateResultSet];
    v13 = [v12 sortMethodGroups];
    id v14 = [(TUICandidateView *)self candidateResultSet];
    BOOL v15 = [v14 sortMethods];
    long long v16 = [v15 objectAtIndex:v11];
    objc_super v17 = [v13 objectForKey:v16];

    if (v17) {
      goto LABEL_17;
    }
    id v18 = objc_alloc(MEMORY[0x1E4FAE308]);
    objc_super v19 = (void *)MEMORY[0x1E4F1CAA0];
    char v20 = [(TUICandidateView *)self candidateResultSet];
    CGPoint v21 = [v20 candidates];
    CGPoint v22 = [v19 orderedSetWithArray:v21];
    CGRect v23 = (void *)[v18 initWithTitle:&stru_1EDC653C0 candidates:v22];
    double v36 = v23;
    CGRect v24 = (void *)MEMORY[0x1E4F1C978];
    v25 = &v36;
    goto LABEL_12;
  }
  BOOL v7 = [(TUICandidateView *)self changingLayout];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v26 = [(TUICandidateView *)self candidateResultSet];
  int v27 = [v26 hasCandidates];

  if (v27)
  {
    if (!v5)
    {
      id v34 = objc_alloc(MEMORY[0x1E4FAE308]);
      double v35 = (void *)MEMORY[0x1E4F1CAA0];
      char v20 = [(TUICandidateView *)self candidateResultSet];
      CGPoint v21 = [v20 candidates];
      CGPoint v22 = [v35 orderedSetWithArray:v21];
      CGRect v23 = (void *)[v34 initWithTitle:&stru_1EDC653C0 candidates:v22];
      v37[0] = v23;
      CGRect v24 = (void *)MEMORY[0x1E4F1C978];
      v25 = (void **)v37;
LABEL_12:
      objc_super v17 = [v24 arrayWithObjects:v25 count:1];

      goto LABEL_17;
    }
    uint64_t v28 = [(TUICandidateView *)self candidateResultSet];
    double v29 = [v28 sortMethodGroups];
    double v30 = [(TUICandidateView *)self candidateResultSet];
    double v31 = [v30 sortMethods];
    double v32 = [v31 objectAtIndex:0];
    objc_super v17 = [v29 objectForKey:v32];
  }
  else
  {
    objc_super v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_17:
  return v17;
}

- (void)setInlineText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_inlineText, "isEqualToString:"))
  {
    BOOL v4 = (NSString *)[v8 copy];
    inlineText = self->_inlineText;
    self->_inlineText = v4;

    BOOL v6 = self->_inlineText;
    BOOL v7 = [(TUICandidateView *)self inlineTextView];
    [v7 setText:v6];
  }
}

- (void)updateDisambiguationSelectionIndex
{
  uint64_t v3 = [(TUICandidateView *)self candidateResultSet];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(TUICandidateView *)self candidateResultSet],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 selectedDisambiguationCandidateIndex],
        v5,
        v4,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v8 = (void *)MEMORY[0x1E4F28D58];
    id v11 = [(TUICandidateView *)self candidateResultSet];
    uint64_t v9 = objc_msgSend(v8, "indexPathForRow:inSection:", objc_msgSend(v11, "selectedDisambiguationCandidateIndex"), 0);
    uint64_t v10 = [(TUICandidateView *)self disambiguationGrid];
    [v10 setSelectedIndexPath:v9];
  }
  else
  {
    BOOL v7 = [(TUICandidateView *)self disambiguationGrid];
    [v7 setSelectedIndexPath:0];

    id v11 = [(TUICandidateView *)self disambiguationGrid];
    [v11 scrollToFirstCandidate];
  }
}

- (void)reloadDisambiguationGridDataIfNeeded
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FAE308]);
  BOOL v4 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v5 = [(TUICandidateView *)self candidateResultSet];
  uint64_t v6 = [v5 disambiguationCandidates];
  BOOL v7 = [v4 orderedSetWithArray:v6];
  id v8 = (void *)[v3 initWithTitle:&stru_1EDC653C0 candidates:v7];
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v10 = [(TUICandidateView *)self disambiguationGrid];
  [v10 setCandidateGroups:v9];

  [(TUICandidateView *)self updateDisambiguationSelectionIndex];
}

- (BOOL)reloadPrimaryGridDataIfNeeded
{
  id v3 = [(TUICandidateView *)self candidateGroupsForCurrentState];
  BOOL v4 = [(TUICandidateView *)self primaryGrid];
  uint64_t v5 = [v4 candidateGroups];
  char v6 = [v5 isEqual:v3];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = [(TUICandidateView *)self candidateGroupsForCurrentState];
    id v8 = [(TUICandidateView *)self primaryGrid];
    [v8 setCandidateGroups:v7];
  }
  return v6 ^ 1;
}

- (void)updateCornerRadiusAfterFinalizingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TUICandidateView *)self state];
  char v6 = [v5 style];
  if ([v6 doNotClipToBounds])
  {
    BOOL v7 = [(TUICandidateView *)self state];
    int v8 = [v7 hasBackdrop];

    if (v8)
    {
      id v114 = [(TUICandidateView *)self backdropView];
      uint64_t v9 = [(TUICandidateView *)self clipsToBoundsView];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v114 = [(TUICandidateView *)self clipsToBoundsView];
  uint64_t v9 = [(TUICandidateView *)self backdropView];
LABEL_6:
  uint64_t v10 = v9;
  [v9 _setContinuousCornerRadius:0.0];
  id v11 = [v10 layer];
  [v11 setMaskedCorners:15];

  char v12 = [(TUICandidateView *)self state];
  v13 = [v12 style];
  [v13 cornerRadius];
  objc_msgSend(v114, "_setContinuousCornerRadius:");

  id v14 = [(TUICandidateView *)self state];
  BOOL v15 = [v14 style];
  uint64_t v16 = [v15 maskedCorners];
  objc_super v17 = [v114 layer];
  [v17 setMaskedCorners:v16];

  id v18 = [(TUICandidateView *)self roundedBorderLayer];
  [v18 removeFromSuperlayer];

  objc_super v19 = [(TUICandidateView *)self state];
  char v20 = [v19 style];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_13;
  }
  CGPoint v21 = [(TUICandidateView *)self state];
  CGPoint v22 = [v21 style];
  uint64_t v23 = [v22 performSelector:sel_roundsArrowButtonEdge];

  if (!v23)
  {
LABEL_13:
    id v67 = [v114 layer];
    [v67 setMask:0];
    goto LABEL_22;
  }
  CGRect v24 = [(TUICandidateView *)self state];
  uint64_t v25 = [v24 arrowButtonPosition];

  uint64_t v26 = [(TUICandidateView *)self state];
  uint64_t v27 = [v26 arrowButtonPosition];

  [v114 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  if (v27 && v3)
  {
    [v114 bounds];
    double v37 = v36 * 0.5;
    int64_t v38 = [(TUICandidateView *)self effectiveCandidateArrowButonPosition];
    v39 = [(TUICandidateView *)self arrowButton];
    uint64_t v40 = v39;
    if (v38 == 5)
    {
      objc_msgSend(v39, "setArrowImageOffset:", v37 * 0.25, 0.0);

      CGRect v41 = [(TUICandidateView *)self arrowButton];
      [v41 arrowImageOffset];
      double v43 = v29 + v42;
      id v44 = [(TUICandidateView *)self arrowButton];
      [v44 arrowImageOffset];
      double v46 = v33 - v45;
      CGRect v47 = [(TUICandidateView *)self arrowButton];
      [v47 arrowImageOffset];
      double v49 = v35 + v48;

      v50 = (void *)MEMORY[0x1E4FB14C0];
      v51 = [(TUICandidateView *)self state];
      v52 = [v51 style];
      [v52 cornerRadius];
      double v54 = v53;
      v55 = [(TUICandidateView *)self state];
      v56 = [v55 style];
      [v56 cornerRadius];
      double v58 = v57;
      v59 = v50;
      double v60 = v43;
      double v61 = v31;
      double v62 = v46;
      double v63 = v49;
      double v64 = v37;
      double v65 = v54;
      double v66 = v37;
    }
    else
    {
      objc_msgSend(v39, "setArrowImageOffset:", v37 * -0.25, 0.0);

      v80 = [(TUICandidateView *)self arrowButton];
      [v80 arrowImageOffset];
      double v82 = v33 + v81;
      v83 = [(TUICandidateView *)self arrowButton];
      [v83 arrowImageOffset];
      double v85 = v35 + v84;

      v86 = (void *)MEMORY[0x1E4FB14C0];
      v51 = [(TUICandidateView *)self state];
      v52 = [v51 style];
      [v52 cornerRadius];
      double v88 = v87;
      v55 = [(TUICandidateView *)self state];
      v56 = [v55 style];
      [v56 cornerRadius];
      double v66 = v89;
      v59 = v86;
      double v60 = v29;
      double v61 = v31;
      double v62 = v82;
      double v63 = v85;
      double v64 = v88;
      double v65 = v37;
      double v58 = v37;
    }
    v90 = objc_msgSend(v59, "_bezierPathRect:topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:", v60, v61, v62, v63, v64, v65, v58, v66);

    v91 = [(TUICandidateView *)self arrowButton];
    [v91 layoutSubviews];

    id v78 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    id v76 = v90;
    objc_msgSend(v78, "setPath:", objc_msgSend(v76, "CGPath"));
    v92 = [v114 layer];
    [v92 setMask:v78];

    v79 = [(TUICandidateView *)self arrowButton];
    v93 = [v79 layer];
    [v93 setHidden:0];
  }
  else
  {
    if (!v25 || v3)
    {
      v94 = [(TUICandidateView *)self state];
      v95 = [v94 style];
      [v95 cornerRadius];
      double v97 = v96;

      objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathRect:topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:", v29, v31, v33, v35, v97, v97, v97, v97);
      id v76 = (id)objc_claimAutoreleasedReturnValue();
      id v78 = [v114 layer];
      [v78 setMask:0];
      goto LABEL_21;
    }
    v68 = (void *)MEMORY[0x1E4FB14C0];
    v69 = [(TUICandidateView *)self state];
    v70 = [v69 style];
    [v70 cornerRadius];
    double v72 = v71;
    v73 = [(TUICandidateView *)self state];
    v74 = [v73 style];
    [v74 cornerRadius];
    objc_msgSend(v68, "_bezierPathRect:topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:", v29, v31, v33, v35, v72, v75, 0.0, 0.0);
    id v76 = (id)objc_claimAutoreleasedReturnValue();

    v77 = [v114 layer];
    [v77 setMask:0];

    id v78 = [(TUICandidateView *)self arrowButton];
    v79 = [v78 layer];
    [v79 setHidden:1];
  }

LABEL_21:
  v98 = [v114 layer];
  [v98 setBorderWidth:0.0];

  id v67 = v76;
  uint64_t v99 = [v67 CGPath];
  v100 = [(TUICandidateView *)self roundedBorderLayer];
  [v100 setPath:v99];

  v101 = [(TUICandidateView *)self roundedBorderLayer];
  [v101 setLineWidth:1.3];

  v102 = [(TUICandidateView *)self state];
  v103 = [v102 style];
  id v104 = [v103 lineColor];
  uint64_t v105 = [v104 CGColor];
  v106 = [(TUICandidateView *)self roundedBorderLayer];
  [v106 setStrokeColor:v105];

  id v107 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  uint64_t v108 = [v107 CGColor];
  v109 = [(TUICandidateView *)self roundedBorderLayer];
  [v109 setFillColor:v108];

  v110 = [v114 layer];
  v111 = [(TUICandidateView *)self roundedBorderLayer];
  [v110 addSublayer:v111];

  v112 = [(TUICandidateView *)self arrowButton];
  v113 = [v112 contentView];
  [v113 setHidden:0];

LABEL_22:
}

- (void)resetSortControlIndex
{
  id v2 = [(TUICandidateView *)self sortControl];
  [v2 setSelectedIndex:0];
}

- (int64_t)selectedSortControlIndex
{
  uint64_t v3 = [(TUICandidateView *)self sortControl];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v4 = (void *)v3;
  uint64_t v5 = [(TUICandidateView *)self sortControl];
  char v6 = [v5 isHidden];

  if (v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v8 = [(TUICandidateView *)self sortControl];
  int64_t v9 = [v8 selectedIndex];

  return v9;
}

- (void)updateSortControlTitlesIfNeeded
{
  id v6 = [(TUICandidateView *)self state];
  if ([v6 sortControlPosition])
  {
    uint64_t v3 = [(TUICandidateView *)self state];
    uint64_t v4 = [v3 sortControlPosition];

    if (v4 == 5) {
      return;
    }
    id v6 = [(TUICandidateView *)self sortControlTitles];
    uint64_t v5 = [(TUICandidateView *)self sortControl];
    [v5 setTitles:v6];
  }
}

- (void)reloadGridsIfNeeded
{
  if ([(TUICandidateView *)self reloadPrimaryGridDataIfNeeded])
  {
    uint64_t v3 = [(TUICandidateView *)self primaryGrid];
    [v3 scrollToFirstCandidate];
  }
  [(TUICandidateView *)self reloadDisambiguationGridDataIfNeeded];
  [(TUICandidateView *)self updateSortControlTitlesIfNeeded];
}

- (void)setCandidateResultSet:(id)a3
{
  if (self->_candidateResultSet != a3)
  {
    objc_storeStrong((id *)&self->_candidateResultSet, a3);
    if (![(TUICandidateView *)self changingLayout]) {
      [(TUICandidateView *)self reloadGridsIfNeeded];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)setState:(id)a3
{
}

- (void)setState:(id)a3 animated:(BOOL)a4 force:(BOOL)a5 completion:(id)a6
{
}

- (void)setState:(id)a3 animated:(BOOL)a4 animator:(id)a5 options:(unint64_t)a6 force:(BOOL)a7 completion:(id)a8
{
  BOOL v12 = a4;
  BOOL v15 = (TUICandidateViewState *)a3;
  id v16 = a5;
  id v17 = a8;
  state = self->_state;
  if (state != v15 || a7 || v12)
  {
    uint64_t v19 = [(TUICandidateViewState *)state primaryGridRowType];
    BOOL v20 = v19 != [(TUICandidateViewState *)v15 primaryGridRowType];
    objc_storeStrong((id *)&self->_state, a3);
    [(TUICandidateView *)self prepareForLayoutChange:v20];
    if (v12)
    {
      [(TUICandidateView *)self layoutIfNeeded];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      void v24[2] = __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke;
      v24[3] = &unk_1E55941A8;
      v24[4] = self;
      [v16 addAnimations:v24];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_2;
      v23[3] = &unk_1E55933D8;
      v23[4] = self;
      [v16 addCompletion:v23];
      [(TUICandidateView *)self updatePrimaryGridRowTypeWithOptions:a6 animated:1 animator:v16 completion:&__block_literal_global_38];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_4;
      v21[3] = &unk_1E5593400;
      v21[4] = self;
      id v22 = v17;
      [v16 addCompletion:v21];
    }
    else
    {
      [(TUICandidateView *)self changeLayoutInsideAnimationBlock];
      [(TUICandidateView *)self updatePrimaryGridRowTypeWithOptions:a6 animated:0 animator:0 completion:0];
      [(TUICandidateView *)self finalizeLayoutChange];
      if (v17) {
        (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
      }
    }
  }
}

uint64_t __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeLayoutInsideAnimationBlock];
}

uint64_t __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalizeLayoutChange];
}

uint64_t __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadGridsIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setState:(id)a3 animated:(BOOL)a4 options:(unint64_t)a5 force:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  if (a4)
  {
    id v11 = (objc_class *)MEMORY[0x1E4FB1ED8];
    id v12 = a7;
    id v13 = a3;
    id v15 = (id)[[v11 alloc] initWithDuration:(a5 >> 16) & 7 curve:&__block_literal_global_751 animations:0.25];
    [(TUICandidateView *)self setState:v13 animated:1 animator:v15 options:a5 force:v7 completion:v12];

    [v15 startAnimation];
  }
  else
  {
    id v14 = a7;
    id v15 = a3;
    -[TUICandidateView setState:animated:animator:options:force:completion:](self, "setState:animated:animator:options:force:completion:");
  }
}

- (void)finalizeLayoutChange
{
  id v10 = [(TUICandidateView *)self state];
  if (([v10 hasBackdrop] & 1) == 0)
  {
    uint64_t v3 = [(TUICandidateView *)self backdropView];
    [v3 setHidden:1];
  }
  int64_t v4 = [(TUICandidateView *)self effectiveCandidateArrowButonPosition];
  if (![v10 arrowButtonPosition])
  {
    [(TUICandidateView *)self setShouldShowArrowButton:0];
    [(TUICandidateView *)self updateArrowButtonVisibility];
    goto LABEL_10;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    uint64_t v5 = [(TUICandidateView *)self clipsToBoundsView];
    id v6 = [(TUICandidateView *)self arrowButton];
    [v5 addSubview:v6];
  }
  else
  {
    if (v4 != 2) {
      goto LABEL_10;
    }
    uint64_t v5 = [(TUICandidateView *)self arrowButton];
    [(TUICandidateView *)self addSubview:v5];
  }

LABEL_10:
  if (![v10 inlineTextViewPosition])
  {
    BOOL v7 = [(TUICandidateView *)self inlineTextView];
    [v7 setHidden:1];
  }
  if (![v10 sortControlPosition])
  {
    int v8 = [(TUICandidateView *)self sortControl];
    [v8 setHidden:1];

    goto LABEL_16;
  }
  if ([v10 sortControlPosition] == 5) {
LABEL_16:
  }
    [(TUICandidateView *)self setShowingSortControl:0];
  [(TUICandidateView *)self updateCornerRadiusAfterFinalizingLayout:1];
  int64_t v9 = [(TUICandidateView *)self primaryGrid];
  [v9 setSuppressCollectionViewLayout:0];

  [(TUICandidateView *)self setChangingLayout:0];
}

- (void)updatePrimaryGridRowTypeWithOptions:(unint64_t)a3 animated:(BOOL)a4 animator:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v16 = [(TUICandidateView *)self primaryGrid];
  id v12 = [(TUICandidateView *)self state];
  uint64_t v13 = [v12 primaryGridRowType];
  id v14 = [(TUICandidateView *)self state];
  id v15 = [v14 style];
  [v16 setRowType:v13 options:a3 style:v15 animated:v7 animator:v11 completion:v10];
}

- (void)changeLayoutInsideAnimationBlock
{
  uint64_t v3 = [(TUICandidateView *)self state];
  [(TUICandidateView *)self boundsForClipsToBoundsViewWithState:v3];
  double v5 = v4;
  double v259 = v6;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(TUICandidateView *)self primaryGrid];
  [v11 bounds];
  CGFloat v262 = v13;
  CGFloat v263 = v12;
  CGFloat v260 = v15;
  CGFloat v261 = v14;

  id v16 = [(TUICandidateView *)self sortControl];
  [v16 frame];
  double v18 = v17;
  double v266 = v20;
  double v267 = v19;
  double v265 = v21;

  id v22 = [(TUICandidateView *)self backdropView];
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v8, v10);

  uint64_t v23 = [v3 style];
  CGRect v24 = [(TUICandidateView *)self backdropView];
  [v24 setStyle:v23];

  uint64_t v25 = [v3 style];
  LODWORD(v24) = [v25 doNotClipToBounds];

  if (v24)
  {
    uint64_t v26 = [(TUICandidateView *)self clipsToBoundsView];
    uint64_t v27 = [v3 style];
    [v26 _setShowsLinesOnEdges:0 style:v27];

    [(TUICandidateView *)self backdropView];
  }
  else
  {
    double v28 = [(TUICandidateView *)self backdropView];
    double v29 = [v3 style];
    [v28 _setShowsLinesOnEdges:0 style:v29];

    [(TUICandidateView *)self clipsToBoundsView];
  double v30 = };
  uint64_t v31 = [v3 borders];
  double v32 = [v3 style];
  [v30 _setShowsLinesOnEdges:v31 style:v32];

  int64_t v33 = [(TUICandidateView *)self effectiveCandidateArrowButonPosition];
  double v34 = [v3 style];
  double v35 = [(TUICandidateView *)self sortControl];
  [v35 setStyle:v34];

  if ([v3 sortControlPosition] == 1)
  {
    double v36 = [(TUICandidateView *)self sortControl];
    [v36 setAlpha:1.0];

    double v18 = 0.0;
    double v37 = 0.0;
    if (v33 == 1) {
      [(TUICandidateView *)self arrowButtonWidth];
    }
    double v266 = v8 - v37;
    [(TUICandidateView *)self sortControlHeight];
    double v265 = v38;
    [(TUICandidateView *)self sortControlHeight];
    double v40 = v39 + 0.0;
    double v268 = v8;
    double v269 = v10 - (v39 + 0.0);
    double v267 = 0.0;
    goto LABEL_41;
  }
  if ([v3 sortControlPosition] == 2)
  {
    CGRect v41 = [(TUICandidateView *)self sortControl];
    [v41 setAlpha:1.0];

    [(TUICandidateView *)self sortControlHeight];
    double v43 = v42;
    double v18 = 0.0;
    double v44 = 0.0;
    if (v33 == 3) {
      [(TUICandidateView *)self arrowButtonWidth];
    }
    double v266 = v8 - v44;
    double v267 = v10 - v43;
    [(TUICandidateView *)self sortControlHeight];
    double v265 = v45;
    [(TUICandidateView *)self sortControlHeight];
    double v269 = v10 - (v46 + 0.0);
    goto LABEL_12;
  }
  if ([v3 sortControlPosition] == 3)
  {
    CGRect v47 = [(TUICandidateView *)self sortControl];
    [v47 setAlpha:1.0];

    BOOL v48 = [(TUICandidateView *)self showingSortControl];
    double v18 = 0.0;
    double v49 = 0.0;
    if (v48) {
      [(TUICandidateView *)self sortControlHeight];
    }
    double v267 = v10 - v49;
    [(TUICandidateView *)self sortControlHeight];
    double v265 = v50;
    if (![(TUICandidateView *)self showingSortControl])
    {
      double v266 = v8;
      double v269 = v10;
LABEL_12:
      double v268 = v8;
      double v40 = 0.0;
LABEL_41:
      double v270 = 0.0;
      goto LABEL_42;
    }
    [(TUICandidateView *)self sortControlHeight];
    double v40 = 0.0;
    double v269 = v10 - (v51 + 0.0);
    double v266 = v8;
LABEL_40:
    double v268 = v8;
    goto LABEL_41;
  }
  if ([v3 sortControlPosition] == 4)
  {
    v52 = [(TUICandidateView *)self state];
    uint64_t v53 = [v52 arrowButtonPosition];

    if (v53 == 5)
    {
      double v54 = [(TUICandidateView *)self arrowButton];
      [v54 frame];
      double v56 = v55 + 0.0;
      double v57 = v8 - (v55 + 0.0);
    }
    else
    {
      double v54 = [(TUICandidateView *)self state];
      double v66 = [v54 style];
      if (([v66 arrowButtonBackgroundHidden] & 1) == 0)
      {

        double v56 = 0.0;
        double v268 = v8;
LABEL_95:

LABEL_96:
        double v270 = v56;
        v250 = [(TUICandidateView *)self sortControl];
        [v250 setAlpha:1.0];

        double v40 = 0.0;
        goto LABEL_97;
      }
      id v67 = [(TUICandidateView *)self state];
      v68 = [v67 style];
      if (objc_opt_respondsToSelector())
      {
        v69 = [(TUICandidateView *)self state];
        v70 = [v69 style];
        char v71 = [v70 shouldUpdateCollectionViewWidthForArrowButtonVisibility];

        double v56 = 0.0;
        double v268 = v8;
        if (v71) {
          goto LABEL_96;
        }
      }
      else
      {
      }
      double v54 = [(TUICandidateView *)self arrowButton];
      [v54 frame];
      double v56 = 0.0;
      double v57 = v8 - (v249 + 0.0);
    }
    double v268 = v57;
    goto LABEL_95;
  }
  double v58 = [(TUICandidateView *)self sortControl];
  double v40 = 0.0;
  [v58 setAlpha:0.0];

  uint64_t v59 = [v3 sortControlPosition];
  if (v59 == 5) {
    double v60 = v8;
  }
  else {
    double v60 = v266;
  }
  double v61 = v267;
  if (v59 == 5) {
    double v61 = v10;
  }
  double v266 = v60;
  double v267 = v61;
  double v62 = [(TUICandidateView *)self state];
  uint64_t v63 = [v62 arrowButtonPosition];

  if (v63 != 5)
  {
    double v72 = [(TUICandidateView *)self state];
    v73 = [v72 style];
    if ([v73 arrowButtonBackgroundHidden])
    {
      v74 = [(TUICandidateView *)self state];
      double v75 = [v74 style];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_99:
        v251 = [(TUICandidateView *)self arrowButton];
        [v251 frame];
        double v268 = v8 - (v252 + 0.0);

        v253 = [(TUICandidateView *)self primaryGrid];
        [v253 arrowButtonSize];
        double v255 = v254;
        v256 = [(TUICandidateView *)self primaryGrid];
        objc_msgSend(v256, "setArrowButtonSize:", 0.0, v255);

        double v269 = v10;
        goto LABEL_41;
      }
      id v76 = [(TUICandidateView *)self state];
      v77 = [v76 style];
      char v78 = [v77 shouldUpdateCollectionViewWidthForArrowButtonVisibility];

      if ((v78 & 1) == 0) {
        goto LABEL_99;
      }
    }
    else
    {
    }
    double v269 = v10;
    goto LABEL_40;
  }
  double v64 = [(TUICandidateView *)self arrowButton];
  [v64 frame];
  double v270 = v65 + 0.0;
  double v268 = v8 - (v65 + 0.0);

LABEL_97:
  double v269 = v10;
LABEL_42:
  double v258 = v18;
  if ([v3 inlineTextViewPosition] == 1)
  {
    v79 = [v3 style];
    v80 = [(TUICandidateView *)self inlineTextView];
    [v80 setStyle:v79];

    double v81 = [(TUICandidateView *)self arrowButton];
    [v81 frame];
    double v83 = v8 - v82;
    [(TUICandidateView *)self inlineTextHeight];
    double v85 = v84;

    double v86 = 0.0;
    if ([v3 sortControlPosition] == 1)
    {
      v275.origin.double x = 0.0;
      v275.origin.double y = 0.0;
      v275.size.double width = v83;
      v275.size.double height = v85;
      double v86 = CGRectGetHeight(v275) + 0.0;
    }
    double v87 = [(TUICandidateView *)self inlineTextView];
    [v87 setAlpha:1.0];

    double v88 = [(TUICandidateView *)self inlineTextView];
    objc_msgSend(v88, "setFrame:", 0.0, v86, v83, v85);

    [(TUICandidateView *)self inlineTextHeight];
    double v40 = v40 + v89;
    double v269 = v269 - (v89 + 0.0);
    double v270 = v270 + 0.0;
  }
  else
  {
    v90 = [(TUICandidateView *)self inlineTextView];
    [v90 setAlpha:0.0];
  }
  if ([v3 inlineTextViewPosition] == 1) {
    goto LABEL_48;
  }
  v94 = [v3 style];
  if (objc_opt_respondsToSelector())
  {
    v95 = [v3 style];
    int v96 = [v95 arrowButtonBackgroundHidden];

    if (v96)
    {
LABEL_48:
      v91 = [(TUICandidateView *)self arrowButton];
      v92 = v91;
      uint64_t v93 = 0;
      goto LABEL_54;
    }
  }
  else
  {
  }
  v91 = [(TUICandidateView *)self arrowButton];
  v92 = v91;
  uint64_t v93 = 1;
LABEL_54:
  [v91 setShowsBackground:v93];

  if ([v3 disambiguationGridPosition] == 2)
  {
    [(TUICandidateView *)self disambiguationHeight];
    double v98 = v97;
    [(TUICandidateView *)self disambiguationHeight];
    double v100 = v40 + v99;
    double v269 = v269 - (v99 + 0.0);
    double v270 = v270 + 0.0;
    v101 = [(TUICandidateView *)self disambiguationGrid];
    objc_msgSend(v101, "setFrame:", 0.0, v40, v8, v98);

    [(TUICandidateView *)self disambiguationHeight];
    double v103 = v102;
  }
  else
  {
    double v264 = v40;
    double v103 = 0.0;
    if ([v3 disambiguationGridPosition] != 1) {
      goto LABEL_59;
    }
    double v270 = v270 + 0.0;
    double v100 = v264 + 0.0;
    double v268 = v268 + -68.0;
    id v104 = [(TUICandidateView *)self disambiguationGrid];
    objc_msgSend(v104, "setFrame:", v8 + -68.0, v264, 68.0, v269);
  }
  double v264 = v100;
LABEL_59:
  if (v33)
  {
    [(TUICandidateView *)self setShouldShowArrowButton:1];
    uint64_t v105 = [v3 style];
    v106 = [(TUICandidateView *)self arrowButton];
    [v106 setStyle:v105];

    uint64_t v107 = [v3 arrowButtonDirection];
    uint64_t v108 = [(TUICandidateView *)self arrowButton];
    [v108 setArrowDirection:v107];

    switch(v33)
    {
      case 1:
        double v257 = v5;
        [(TUICandidateView *)self arrowButtonWidth];
        double v110 = v8 - v109;
        [(TUICandidateView *)self arrowButtonWidth];
        double v112 = v111;
        [(TUICandidateView *)self arrowButtonHeight];
        double v114 = v113;
        v115 = [(TUICandidateView *)self arrowButton];
        objc_msgSend(v115, "setFrame:", v110, v103, v112, v114);

        v116 = [(TUICandidateView *)self arrowButton];
        v117 = [v3 style];
        v118 = [v117 arrowButtonSeparatorImage];
        v119 = [v3 style];
        [v116 _setImage:v118 onEdges:2 outside:1 style:v119];

        v120 = [(TUICandidateView *)self arrowButton];
        [v120 _setContinuousCornerRadius:0.0];

        v121 = [(TUICandidateView *)self arrowButton];
        v122 = [v121 layer];
        [v122 setMasksToBounds:0];

        v123 = [v3 style];
        [v123 cornerRadius];
        double v125 = v124;

        v126 = [v3 style];
        LODWORD(v122) = [v126 doNotClipToBounds];

        if (v122)
        {
          v127 = [(TUICandidateView *)self state];
          uint64_t v128 = [v127 borders] & 8;

          v129 = [v3 style];
          [v129 cornerRadius];
          double v125 = v130;

          BOOL v131 = v103 == 0.0;
          uint64_t v132 = 2;
        }
        else
        {
          BOOL v131 = 0;
          uint64_t v128 = 0;
          uint64_t v132 = 15;
        }
        double v5 = v257;
        goto LABEL_74;
      case 2:
        [v3 arrowButtonOffset];
        double v134 = v8 + v133;
        [v3 arrowButtonOffset];
        double v136 = v103 + v135;
        [(TUICandidateView *)self arrowButtonWidth];
        double v137 = v5;
        double v139 = v138;
        [(TUICandidateView *)self arrowButtonHeight];
        double v141 = v140;
        v142 = [(TUICandidateView *)self arrowButton];
        double v143 = v139;
        double v5 = v137;
        objc_msgSend(v142, "setFrame:", v134, v136, v143, v141);

        v144 = [(TUICandidateView *)self arrowButton];
        v145 = [v3 style];
        [v144 _setImage:0 onEdges:2 outside:1 style:v145];

        v146 = [v3 style];
        [v146 cornerRadius];
        double v148 = v147;
        v149 = [(TUICandidateView *)self arrowButton];
        [v149 _setContinuousCornerRadius:v148];

        v150 = [(TUICandidateView *)self arrowButton];
        v151 = [v150 layer];
        [v151 setMasksToBounds:1];

        v152 = [(TUICandidateView *)self arrowButton];
        v153 = [v152 layer];
        [v153 setMaskedCorners:1];
        goto LABEL_66;
      case 3:
        [(TUICandidateView *)self arrowButtonWidth];
        double v155 = v8 - v154;
        [(TUICandidateView *)self arrowButtonHeight];
        double v157 = v10 - v156;
        [(TUICandidateView *)self arrowButtonWidth];
        double v158 = v5;
        double v160 = v159;
        [(TUICandidateView *)self arrowButtonHeight];
        double v162 = v161;
        v163 = [(TUICandidateView *)self arrowButton];
        double v164 = v160;
        double v5 = v158;
        objc_msgSend(v163, "setFrame:", v155, v157, v164, v162);

        v165 = [(TUICandidateView *)self arrowButton];
        v166 = [v3 style];
        v167 = [v166 arrowButtonSeparatorImage];
        v168 = [v3 style];
        [v165 _setImage:v167 onEdges:2 outside:1 style:v168];

        v169 = [(TUICandidateView *)self arrowButton];
        [v169 _setContinuousCornerRadius:0.0];

        v152 = [(TUICandidateView *)self arrowButton];
        v153 = [v152 layer];
        [v153 setMasksToBounds:0];
LABEL_66:

        goto LABEL_68;
      case 4:
        [(TUICandidateView *)self arrowButtonHeight];
        double v171 = v10 - v170;
        [(TUICandidateView *)self arrowButtonHeight];
        double v173 = v172;
        v174 = [(TUICandidateView *)self arrowButton];
        objc_msgSend(v174, "setFrame:", 0.0, v171, v8, v173);

        v175 = [(TUICandidateView *)self arrowButton];
        v176 = [v3 style];
        [v175 _setImage:0 onEdges:2 outside:1 style:v176];

        v177 = [v3 style];
        [v177 cornerRadius];
        double v179 = v178;
        v180 = [(TUICandidateView *)self arrowButton];
        [v180 _setContinuousCornerRadius:v179];

        v181 = [(TUICandidateView *)self arrowButton];
        v182 = [v181 layer];
        [v182 setMaskedCorners:0];

        v183 = [(TUICandidateView *)self arrowButton];
        v184 = [v183 layer];
        [v184 setMasksToBounds:0];

        [(TUICandidateView *)self arrowButtonHeight];
        double v269 = v269 - v185;
        goto LABEL_68;
      case 5:
        [(TUICandidateView *)self arrowButtonWidth];
        double v188 = v187;
        [(TUICandidateView *)self arrowButtonHeight];
        double v190 = v189;
        v191 = [(TUICandidateView *)self arrowButton];
        objc_msgSend(v191, "setFrame:", 0.0, v103, v188, v190);

        v192 = [(TUICandidateView *)self arrowButton];
        v193 = [v3 style];
        v194 = [v193 arrowButtonSeparatorImage];
        v195 = [v3 style];
        [v192 _setImage:v194 onEdges:8 outside:1 style:v195];

        v196 = [(TUICandidateView *)self arrowButton];
        [v196 _setContinuousCornerRadius:0.0];

        v197 = [(TUICandidateView *)self arrowButton];
        v198 = [v197 layer];
        [v198 setMasksToBounds:0];

        v199 = [v3 style];
        [v199 cornerRadius];
        double v125 = v200;

        v201 = [v3 style];
        LODWORD(v198) = [v201 doNotClipToBounds];

        if (v198)
        {
          v202 = [(TUICandidateView *)self state];
          uint64_t v128 = [v202 borders] & 2;

          v203 = [v3 style];
          [v203 cornerRadius];
          double v125 = v204;

          BOOL v131 = v103 == 0.0;
          uint64_t v132 = 1;
        }
        else
        {
          BOOL v131 = 0;
          uint64_t v128 = 0;
          uint64_t v132 = 15;
        }
LABEL_74:
        double v186 = v258;
        v205 = [(TUICandidateView *)self arrowButton];
        v206 = [v205 contentView];
        v207 = [v3 style];
        [v206 _setShowsLinesOnEdges:v128 style:v207];

        v208 = [(TUICandidateView *)self arrowButton];
        v209 = [v208 contentView];
        [v209 _setContinuousCornerRadius:v125];

        v210 = [(TUICandidateView *)self arrowButton];
        v211 = [v210 contentView];
        v212 = [v211 layer];
        [v212 setMaskedCorners:v132];

        v213 = [(TUICandidateView *)self arrowButton];
        v214 = [v213 contentView];
        v215 = [v214 layer];
        [v215 setMasksToBounds:v131];

        goto LABEL_75;
      default:
        goto LABEL_68;
    }
  }
  [(TUICandidateView *)self setShouldShowArrowButton:0];
LABEL_68:
  double v186 = v258;
LABEL_75:
  if ([v3 sortControlPosition] == 4) {
    double v216 = v268;
  }
  else {
    double v216 = v266;
  }
  v217 = [(TUICandidateView *)self sortControl];
  [v217 frame];
  double v219 = v218;

  if (v219 == 0.0)
  {
    v274[0] = MEMORY[0x1E4F143A8];
    v274[1] = 3221225472;
    v274[2] = __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke;
    v274[3] = &unk_1E55933B0;
    v274[4] = self;
    *(double *)&v274[5] = v186;
    *(double *)&v274[6] = v267;
    *(double *)&v274[7] = v216;
    *(double *)&v274[8] = v265;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v274];
  }
  else
  {
    v220 = [(TUICandidateView *)self sortControl];
    objc_msgSend(v220, "setFrame:", v186, v267, v216, v265);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_2;
  aBlock[3] = &unk_1E55933B0;
  aBlock[4] = self;
  *(double *)&void aBlock[5] = v270;
  *(double *)&aBlock[6] = v264;
  *(double *)&aBlock[7] = v268;
  *(double *)&aBlock[8] = v269;
  v221 = (void (**)(void))_Block_copy(aBlock);
  if (v269 >= 0.0) {
    double v222 = v269;
  }
  else {
    double v222 = 0.0;
  }
  double v223 = v270;
  double v224 = v264;
  double v225 = v268;
  double Height = CGRectGetHeight(*(CGRect *)(&v222 - 3));
  v276.origin.double y = v262;
  v276.origin.double x = v263;
  v276.size.double height = v260;
  v276.size.double width = v261;
  if (Height <= CGRectGetHeight(v276))
  {
    v230 = [v3 style];
    char v231 = [v230 doNotClipToBounds];

    if (v231)
    {
      v232 = [(TUICandidateView *)self primaryGrid];
      [v232 setSuppressCollectionViewLayout:1];
    }
    v221[2](v221);
    v229 = [(TUICandidateView *)self primaryGrid];
    [v229 layoutIfNeeded];
  }
  else
  {
    v227 = [(TUICandidateView *)self primaryGrid];
    objc_msgSend(v227, "setOrigin:", v270, v264);

    v228 = (void *)MEMORY[0x1E4FB1EB0];
    v271[0] = MEMORY[0x1E4F143A8];
    v271[1] = 3221225472;
    v271[2] = __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_3;
    v271[3] = &unk_1E5593540;
    v271[4] = self;
    v272 = v221;
    [v228 performWithoutAnimation:v271];
    v229 = v272;
  }

  [(TUICandidateView *)self updateArrowButtonVisibility];
  v233 = [v3 style];
  v234 = [v233 leftEdgeSeparatorImage];
  v235 = [v3 style];
  [(UIView *)self _setImage:v234 onEdges:2 outside:0 style:v235];

  v236 = [v3 style];
  v237 = [v236 rightEdgeSeparatorImage];
  v238 = [v3 style];
  [(UIView *)self _setImage:v237 onEdges:8 outside:0 style:v238];

  v239 = [(TUICandidateView *)self clipsToBoundsView];
  objc_msgSend(v239, "setFrame:", v5, v259, v8, v10);

  v240 = [v3 style];
  v241 = [v240 backgroundColor];
  v242 = [(TUICandidateView *)self clipsToBoundsView];
  [v242 setBackgroundColor:v241];

  v243 = [(TUICandidateView *)self clipsToBoundsView];
  v244 = [v243 layer];
  [v244 setMask:0];

  v245 = [(TUICandidateView *)self state];
  v246 = [v245 style];
  [v246 cornerRadius];
  double v248 = v247;

  if (v248 > 0.0) {
    [(TUICandidateView *)self updateCornerRadiusAfterFinalizingLayout:0];
  }
}

void __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) sortControl];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

void __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = [*(id *)(a1 + 32) candidateMask];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  double v7 = *(double *)(a1 + 40);
  double v8 = *(double *)(a1 + 48);
  double v9 = *(double *)(a1 + 56);
  double v10 = *(double *)(a1 + 64);
  id v11 = [*(id *)(a1 + 32) primaryGrid];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);
}

void __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) primaryGrid];
  [v2 layoutIfNeeded];
}

- (void)prepareForLayoutChange:(BOOL)a3
{
  BOOL v3 = a3;
  v142[1] = *MEMORY[0x1E4F143B8];
  [(TUICandidateView *)self setChangingLayout:1];
  double v5 = [(TUICandidateView *)self state];
  double v6 = [v5 style];
  uint64_t v7 = [v6 doNotClipToBounds] ^ 1;
  double v8 = [(TUICandidateView *)self clipsToBoundsView];
  [v8 setClipsToBounds:v7];

  [(TUICandidateView *)self boundsForClipsToBoundsViewWithState:v5];
  double v10 = v9;
  if ([v5 hasBackdrop])
  {
    id v11 = [(TUICandidateView *)self backdropView];

    if (!v11)
    {
      double v12 = [TUICandidateBackdropView alloc];
      [(TUICandidateView *)self bounds];
      double v13 = -[TUICandidateBackdropView initWithFrame:](v12, "initWithFrame:");
      [(TUICandidateView *)self setBackdropView:v13];

      double v14 = [v5 style];
      double v15 = [(TUICandidateView *)self backdropView];
      [v15 setStyle:v14];

      id v16 = [(TUICandidateView *)self clipsToBoundsView];
      double v17 = [(TUICandidateView *)self backdropView];
      [v16 insertSubview:v17 atIndex:0];
    }
    double v18 = [v5 style];
    uint64_t v19 = [v18 doNotClipToBounds];
    double v20 = [(TUICandidateView *)self backdropView];
    [v20 setClipsToBounds:v19];

    double v21 = [(TUICandidateView *)self backdropView];
    [v21 setHidden:0];
  }
  if ([v5 inlineTextViewPosition])
  {
    id v22 = [(TUICandidateView *)self inlineTextView];

    if (!v22)
    {
      uint64_t v23 = [TUICandidateInlineTextView alloc];
      [(TUICandidateView *)self bounds];
      CGRect v24 = -[TUICandidateInlineTextView initWithFrame:](v23, "initWithFrame:");
      [(TUICandidateView *)self setInlineTextView:v24];

      uint64_t v25 = [(TUICandidateView *)self clipsToBoundsView];
      uint64_t v26 = [(TUICandidateView *)self inlineTextView];
      uint64_t v27 = [(TUICandidateView *)self primaryGrid];
      [v25 insertSubview:v26 belowSubview:v27];

      double v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapInlineText_];
      double v29 = [(TUICandidateView *)self inlineTextView];
      [v29 addGestureRecognizer:v28];

      double v30 = [(TUICandidateView *)self inlineTextView];
      [v30 setHidden:1];
    }
    uint64_t v31 = [(TUICandidateView *)self inlineTextView];
    int v32 = [v31 isHidden];

    if (v32)
    {
      int64_t v33 = [(TUICandidateView *)self inlineTextView];
      [v33 setHidden:0];

      double v34 = [(TUICandidateView *)self inlineTextView];
      [v34 setAlpha:0.0];
    }
    double v35 = [(TUICandidateView *)self inlineText];
    double v36 = [(TUICandidateView *)self inlineTextView];
    [v36 setText:v35];
  }
  double v37 = [(TUICandidateView *)self disambiguationGrid];

  if (!v37)
  {
    double v38 = [TUICandidateGrid alloc];
    [(TUICandidateView *)self disambiguationHeight];
    double v40 = -[TUICandidateGrid initWithFrame:](v38, "initWithFrame:", 0.0, 0.0, v10, v39);
    [(TUICandidateView *)self setDisambiguationGrid:v40];

    CGRect v41 = [(TUICandidateView *)self disambiguationGrid];
    [v41 setDelegate:self];
  }
  if ([v5 disambiguationGridPosition])
  {
    double v42 = [(TUICandidateView *)self clipsToBoundsView];
    double v43 = [(TUICandidateView *)self disambiguationGrid];
    double v44 = [(TUICandidateView *)self primaryGrid];
    [v42 insertSubview:v43 aboveSubview:v44];

    double v45 = [v5 disambiguationStyle];
    double v46 = [(TUICandidateView *)self disambiguationGrid];
    [v46 setStyle:v45];

    uint64_t v47 = [v5 disambiguationGridRowType];
    BOOL v48 = [(TUICandidateView *)self disambiguationGrid];
    [v48 setRowType:v47];

    id v49 = objc_alloc(MEMORY[0x1E4FAE308]);
    double v50 = (void *)MEMORY[0x1E4F1CAA0];
    double v51 = [(TUICandidateView *)self candidateResultSet];
    v52 = [v51 disambiguationCandidates];
    uint64_t v53 = [v50 orderedSetWithArray:v52];
    double v54 = (void *)[v49 initWithTitle:&stru_1EDC653C0 candidates:v53];
    v142[0] = v54;
    double v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:1];
    double v56 = [(TUICandidateView *)self disambiguationGrid];
    [v56 setCandidateGroups:v55];

    [(TUICandidateView *)self updateDisambiguationSelectionIndex];
    double v57 = [(TUICandidateView *)self disambiguationGrid];
    [v57 setHidden:0];
  }
  if ([v5 disambiguationGridPosition] == 2)
  {
    if ([v5 inlineTextViewPosition] == 1) {
      uint64_t v58 = 5;
    }
    else {
      uint64_t v58 = 4;
    }
    uint64_t v59 = [(TUICandidateView *)self disambiguationGrid];
    double v60 = [v59 style];
    if (objc_opt_respondsToSelector())
    {
      double v61 = [(TUICandidateView *)self disambiguationGrid];
      double v62 = [v61 style];
      int v63 = [v62 hideLinesOnDisambiguationGridEdges];

      if (v63) {
        uint64_t v58 = 0;
      }
    }
    else
    {
    }
    goto LABEL_31;
  }
  uint64_t v64 = [v5 disambiguationGridPosition];
  double v65 = [(TUICandidateView *)self disambiguationGrid];
  double v66 = v65;
  if (v64 == 1)
  {
    id v67 = [v65 style];
    if (objc_opt_respondsToSelector())
    {
      v68 = [(TUICandidateView *)self disambiguationGrid];
      v69 = [v68 style];
      int v70 = [v69 hideLinesOnDisambiguationGridEdges];

      if (v70) {
        uint64_t v58 = 0;
      }
      else {
        uint64_t v58 = 2;
      }
    }
    else
    {

      uint64_t v58 = 2;
    }
LABEL_31:
    char v71 = [(TUICandidateView *)self disambiguationGrid];
    double v72 = [v5 style];
    v73 = v71;
    uint64_t v74 = v58;
    goto LABEL_32;
  }
  [v65 setHidden:1];

  char v71 = [(TUICandidateView *)self disambiguationGrid];
  double v72 = [v5 style];
  v73 = v71;
  uint64_t v74 = 0;
LABEL_32:
  [v73 _setShowsLinesOnEdges:v74 style:v72];

  if ([v5 sortControlPosition]
    && ([(TUICandidateView *)self state],
        double v75 = objc_claimAutoreleasedReturnValue(),
        uint64_t v76 = [v75 sortControlPosition],
        v75,
        v76 != 5))
  {
    char v78 = [(TUICandidateView *)self sortControl];
    [v78 setHidden:0];

    [(TUICandidateView *)self updateSortControlTitlesIfNeeded];
  }
  else
  {
    v77 = [(TUICandidateView *)self sortControl];
    [v77 setHidden:1];

    [(TUICandidateView *)self resetSortControlIndex];
  }
  if ([v5 sortControlPosition] == 4)
  {
    v79 = [(TUICandidateView *)self sortControl];
    v80 = [v79 superview];
    double v81 = [(TUICandidateView *)self clipsToBoundsView];

    if (v80 == v81)
    {
      double v82 = [(TUICandidateView *)self sortControl];
      [v82 removeFromSuperview];
    }
    double v83 = [(TUICandidateView *)self sortControl];
    double v84 = [(TUICandidateView *)self primaryGrid];
    [v84 setCustomHeader:v83];

    double v85 = [(TUICandidateView *)self sortControl];
    [v85 setAlpha:1.0];

    [(TUICandidateView *)self sortControlHeight];
    double v87 = v86;
    double v88 = [(TUICandidateView *)self sortControl];
    objc_msgSend(v88, "setFrame:", 0.0, 0.0, v10, v87);

    double v89 = [(TUICandidateView *)self sortControl];
    v90 = [v5 style];
    [v89 _setShowsLinesOnEdges:0 style:v90];
  }
  else
  {
    v91 = [(TUICandidateView *)self primaryGrid];
    [v91 setCustomHeader:0];

    v92 = [(TUICandidateView *)self sortControl];
    uint64_t v93 = [v92 superview];
    v94 = [(TUICandidateView *)self clipsToBoundsView];

    if (v93 == v94) {
      goto LABEL_43;
    }
    v95 = [(TUICandidateView *)self sortControl];
    [v95 removeFromSuperview];

    double v89 = [(TUICandidateView *)self clipsToBoundsView];
    v90 = [(TUICandidateView *)self sortControl];
    [v89 addSubview:v90];
  }

LABEL_43:
  int v96 = [v5 style];
  if (objc_opt_respondsToSelector())
  {
    double v97 = [v5 style];
    uint64_t v98 = [v97 performSelector:sel_hasShadow];

    if (!v98) {
      goto LABEL_47;
    }
    id v99 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v100 = [v99 CGColor];
    v101 = [(TUICandidateView *)self layer];
    [v101 setShadowColor:v100];

    double v102 = [(TUICandidateView *)self layer];
    objc_msgSend(v102, "setShadowOffset:", 0.0, 3.0);

    double v103 = [(TUICandidateView *)self layer];
    LODWORD(v104) = 1045220557;
    [v103 setShadowOpacity:v104];

    int v96 = [(TUICandidateView *)self layer];
    [v96 setShadowRadius:8.0];
  }

LABEL_47:
  uint64_t v105 = [v5 style];
  v106 = [v105 sortControlBackgroundColor];
  [v106 alphaComponent];
  if (v107 <= 0.0)
  {
  }
  else
  {
    if ([v5 sortControlPosition] == 2 || objc_msgSend(v5, "sortControlPosition") == 3)
    {

LABEL_51:
      uint64_t v108 = [(TUICandidateView *)self sortControl];
      double v109 = [v5 style];
      double v110 = v108;
      uint64_t v111 = 1;
      goto LABEL_54;
    }
    uint64_t v141 = [v5 sortControlPosition];

    if (v141 == 5) {
      goto LABEL_51;
    }
  }
  uint64_t v108 = [(TUICandidateView *)self sortControl];
  double v109 = [v5 style];
  double v110 = v108;
  uint64_t v111 = 0;
LABEL_54:
  [v110 _setShowsLinesOnEdges:v111 style:v109];

  if ([(TUICandidateView *)self effectiveCandidateArrowButonPosition])
  {
    double v112 = [(TUICandidateView *)self arrowButton];

    if (!v112)
    {
      double v113 = [TUICandidateArrowButton alloc];
      [(TUICandidateView *)self arrowButtonWidth];
      double v115 = v114;
      [(TUICandidateView *)self arrowButtonHeight];
      v117 = -[TUICandidateArrowButton initWithFrame:](v113, "initWithFrame:", 0.0, 0.0, v115, v116);
      [(TUICandidateView *)self setArrowButton:v117];

      v118 = [(TUICandidateView *)self arrowButton];
      [v118 addTarget:self action:sel_didTapArrowButton_ forControlEvents:64];

      v119 = [(TUICandidateView *)self clipsToBoundsView];
      v120 = [(TUICandidateView *)self arrowButton];
      [v119 addSubview:v120];
    }
    [(TUICandidateView *)self setShouldShowArrowButton:1];
    [(TUICandidateView *)self updateArrowButtonVisibility];
  }
  uint64_t v121 = [v5 candidateNumberEnabled];
  v122 = [(TUICandidateView *)self primaryGrid];
  [v122 setCandidateNumberEnabled:v121];

  [(TUICandidateView *)self getArrowButtonSizeForGrid];
  double v124 = v123;
  double v126 = v125;
  v127 = [(TUICandidateView *)self primaryGrid];
  objc_msgSend(v127, "setArrowButtonSize:", v124, v126);

  uint64_t v128 = [(TUICandidateView *)self state];
  v129 = [v128 style];
  double v130 = [v129 leftEdgeMaskImage];
  if (v130)
  {
  }
  else
  {
    BOOL v131 = [(TUICandidateView *)self state];
    uint64_t v132 = [v131 style];
    double v133 = [v132 rightEdgeMaskImage];

    if (!v133)
    {
      double v139 = [(TUICandidateView *)self primaryGrid];
      [v139 setMaskView:0];
      goto LABEL_64;
    }
  }
  double v134 = [(TUICandidateView *)self candidateMask];

  if (!v134)
  {
    double v135 = [TUICandidateMask alloc];
    [(TUICandidateView *)self bounds];
    double v136 = -[TUICandidateMask initWithFrame:](v135, "initWithFrame:");
    [(TUICandidateView *)self setCandidateMask:v136];
  }
  double v137 = [v5 style];
  double v138 = [(TUICandidateView *)self candidateMask];
  [v138 setStyle:v137];

  double v139 = [(TUICandidateView *)self candidateMask];
  double v140 = [(TUICandidateView *)self primaryGrid];
  [v140 setMaskView:v139];

LABEL_64:
  if (v3) {
    [(TUICandidateView *)self reloadPrimaryGridDataIfNeeded];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUICandidateView;
  [(TUICandidateView *)&v3 layoutSubviews];
  if (![(TUICandidateView *)self changingLayout])
  {
    [(TUICandidateView *)self prepareForLayoutChange:0];
    [(TUICandidateView *)self changeLayoutInsideAnimationBlock];
    [(TUICandidateView *)self updatePrimaryGridRowTypeWithOptions:0 animated:0 animator:0 completion:0];
    [(TUICandidateView *)self finalizeLayoutChange];
  }
}

- (double)arrowButtonWidth
{
  objc_super v3 = [(TUICandidateView *)self state];
  double v4 = [v3 style];
  [v4 arrowButtonPadding];
  double v6 = v5;
  uint64_t v7 = [(TUICandidateView *)self state];
  double v8 = [v7 style];
  [v8 arrowButtonPadding];
  double v10 = v6 + v9;
  [(TUICandidateView *)self arrowButtonHeight];
  if (v11 == 0.0) {
    double v11 = 42.0;
  }
  double v12 = v10 + v11;

  return v12;
}

- (double)arrowButtonHeight
{
  objc_super v3 = [(TUICandidateView *)self state];
  double v4 = [v3 style];
  [v4 arrowButtonHeight];
  if (v5 == 0.0)
  {
    double v6 = [(TUICandidateView *)self state];
    uint64_t v7 = [v6 style];
    [v7 rowHeight];
    double v9 = v8;
  }
  else
  {
    double v9 = v5;
  }

  return v9;
}

- (double)disambiguationHeight
{
  objc_super v3 = [(TUICandidateView *)self state];
  double v4 = [v3 disambiguationStyle];
  [v4 rowHeight];
  double v6 = v5;
  uint64_t v7 = [(TUICandidateView *)self state];
  double v8 = [v7 disambiguationStyle];
  [v8 gridPadding];
  double v10 = v6 + v9;

  return v10;
}

- (double)inlineTextHeight
{
  id v2 = [(TUICandidateView *)self state];
  objc_super v3 = [v2 style];
  [v3 rowHeight];
  double v5 = v4;

  return v5;
}

- (double)sortControlHeight
{
  objc_super v3 = [(TUICandidateView *)self state];
  double v4 = [v3 style];
  [v4 rowHeight];
  double v6 = v5;
  uint64_t v7 = [(TUICandidateView *)self state];
  double v8 = [v7 style];
  [v8 sortControlPadding];
  double v10 = v6 + v9;
  double v11 = [(TUICandidateView *)self state];
  double v12 = [v11 style];
  [v12 sortControlPadding];
  double v14 = v10 + v13;

  return v14;
}

- (CGRect)boundsForClipsToBoundsViewWithState:(id)a3
{
  id v4 = a3;
  [(TUICandidateView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 yOffset];
  double v14 = v13 + v8;
  [v4 additionalHeight];
  double v16 = v15;

  double v17 = v12 + v16;
  double v18 = v6;
  double v19 = v14;
  double v20 = v10;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (TUICandidateView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateView;
  objc_super v3 = [(TUICandidateView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(TUICandidateView *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateView;
  objc_super v3 = -[TUICandidateView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(TUICandidateView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  [(TUICandidateView *)self setClipsToBounds:0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(TUICandidateView *)self bounds];
  id v4 = objc_msgSend(v3, "initWithFrame:");
  [(TUICandidateView *)self setClipsToBoundsView:v4];

  double v5 = [(TUICandidateView *)self clipsToBoundsView];
  [v5 setClipsToBounds:1];

  objc_super v6 = [(TUICandidateView *)self clipsToBoundsView];
  [(TUICandidateView *)self addSubview:v6];

  double v7 = [MEMORY[0x1E4F39C88] layer];
  [(TUICandidateView *)self setRoundedBorderLayer:v7];

  double v8 = [TUICandidateGrid alloc];
  [(TUICandidateView *)self bounds];
  double v9 = -[TUICandidateGrid initWithFrame:](v8, "initWithFrame:");
  [(TUICandidateView *)self setPrimaryGrid:v9];

  double v10 = [(TUICandidateView *)self primaryGrid];
  [v10 setDelegate:self];

  double v11 = [(TUICandidateView *)self clipsToBoundsView];
  double v12 = [(TUICandidateView *)self primaryGrid];
  [v11 addSubview:v12];

  double v13 = [TUICandidateSortControl alloc];
  [(TUICandidateView *)self bounds];
  double v14 = -[TUICandidateSortControl initWithFrame:](v13, "initWithFrame:");
  [(TUICandidateView *)self setSortControl:v14];

  double v15 = [(TUICandidateView *)self sortControl];
  [v15 setHidden:1];

  double v16 = [(TUICandidateView *)self sortControl];
  [v16 addTarget:self action:sel_handleSortControlValueChanged forControlEvents:4096];

  id v18 = [(TUICandidateView *)self clipsToBoundsView];
  double v17 = [(TUICandidateView *)self sortControl];
  [v18 addSubview:v17];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

@end