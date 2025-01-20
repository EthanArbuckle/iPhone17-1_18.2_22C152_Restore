@interface TUICandidateGrid
+ (BOOL)isSafariPasswordSuggestionCandidate:(id)a3;
+ (BOOL)isWritingToolSuggestionCandidate:(id)a3;
- (BOOL)animating;
- (BOOL)canExpandCandidateGrid;
- (BOOL)candidateNumberEnabled;
- (BOOL)collectionViewLayoutWasSkipped;
- (BOOL)handleNumberKey:(unint64_t)a3;
- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)indexPathIsFullyVisible:(id)a3 granularity:(int)a4;
- (BOOL)indexPathIsValid:(id)a3;
- (BOOL)isArrowButtonVisible;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)showingSlottedCandidates;
- (BOOL)suppressCollectionViewLayout;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGSize)arrowButtonSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)contentSize;
- (NSArray)candidateGroups;
- (NSArray)visibleCandidates;
- (NSIndexPath)firstIndexPath;
- (NSIndexPath)firstVisibleIndexPath;
- (NSIndexPath)lastSelectedIndexPath;
- (NSIndexPath)selectedIndexPath;
- (TIKeyboardCandidate)selectedCandidate;
- (TUICandidateGrid)initWithCoder:(id)a3;
- (TUICandidateGrid)initWithFrame:(CGRect)a3;
- (TUICandidateGridDelegate)delegate;
- (TUICandidateLayout)multiRowLayout;
- (TUICandidateLayout)singleRowLayout;
- (TUICandidateViewStyle)style;
- (TUICandidateViewStyle)stylePending;
- (UICollectionView)collectionView;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)customHeader;
- (UIView)selectedRowHighlightView;
- (double)collectionView:(id)a3 layout:(id)a4 widthForGroupHeaderInSection:(int64_t)a5;
- (double)lastUserSelectedCursorX;
- (double)maximumRowHeight;
- (double)rowHeight;
- (double)selectedRowY;
- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (id)_sectionIndexTitlesForCollectionView:(id)a3;
- (id)candidateAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewLayout;
- (id)indexPathForCandidate:(id)a3;
- (id)indexPathForCandidateNumber:(unint64_t)a3;
- (id)indexPathForVerticalCandidateNumber:(unint64_t)a3;
- (id)indexPathInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (id)indexPathsForSelectedRow;
- (id)indexPathsInTheRowThatContainsFrame:(CGRect)a3;
- (id)lastIndexPath;
- (id)visibleAttributes;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfNonPartialCandidatesInSection:(int64_t)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfTransliterationCandidatesInSection:(int64_t)a3;
- (int64_t)rowForCandidate:(id)a3;
- (int64_t)rowType;
- (int64_t)viewOffsetForCandidate:(id)a3;
- (unint64_t)candidateNumberForIndexPath:(id)a3;
- (unint64_t)candidateNumberInHorizontalLayoutForIndexPath:(id)a3;
- (unint64_t)candidateNumberInVerticalLayoutForIndexPath:(id)a3;
- (unint64_t)extraCandidatesCount;
- (unint64_t)slottedCandidatesCount;
- (void)addAppCandidatesRenderSignposts;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)commonInit;
- (void)didMoveHighlightFrame;
- (void)forceUpdateVisibleCells;
- (void)layoutSubviews;
- (void)scrollToCandidateAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)scrollToFirstCandidate;
- (void)scrollToTop;
- (void)scrollViewDidChangeContentSize:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setArrowButtonSize:(CGSize)a3;
- (void)setCandidateGroups:(id)a3;
- (void)setCandidateNumberEnabled:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayoutWasSkipped:(BOOL)a3;
- (void)setCustomHeader:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstVisibleIndexPath:(id)a3;
- (void)setIsArrowButtonVisible:(BOOL)a3;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setLastUserSelectedCursorX:(double)a3;
- (void)setMaximumRowHeight:(double)a3;
- (void)setMultiRowLayout:(id)a3;
- (void)setRowType:(int64_t)a3;
- (void)setRowType:(int64_t)a3 animated:(BOOL)a4;
- (void)setRowType:(int64_t)a3 options:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setRowType:(int64_t)a3 options:(unint64_t)a4 style:(id)a5 animated:(BOOL)a6 animator:(id)a7 completion:(id)a8;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setSelectedRowHighlightView:(id)a3;
- (void)setSelectedRowY:(double)a3;
- (void)setSingleRowLayout:(id)a3;
- (void)setSlottedSeparatorHidden:(BOOL)a3 inCollectionView:(id)a4 nearHighlightItemAtIndexPath:(id)a5;
- (void)setStyle:(id)a3;
- (void)setStyle:(id)a3 reload:(BOOL)a4;
- (void)setStylePending:(id)a3;
- (void)setSuppressCollectionViewLayout:(BOOL)a3;
- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)updateBounce;
- (void)updateCollectionViewFrameForArrowButton;
- (void)updateContentInset;
- (void)updateGradientLayerToCollectionView;
- (void)updateIndex;
- (void)updateSelectedRowHighlightView;
@end

@implementation TUICandidateGrid

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylePending, 0);
  objc_storeStrong((id *)&self->_selectedRowHighlightView, 0);
  objc_storeStrong((id *)&self->_firstVisibleIndexPath, 0);
  objc_storeStrong((id *)&self->_multiRowLayout, 0);
  objc_storeStrong((id *)&self->_singleRowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customHeader, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_candidateGroups, 0);
}

- (void)setMaximumRowHeight:(double)a3
{
  self->_maximumRowHeight = a3;
}

- (double)maximumRowHeight
{
  return self->_maximumRowHeight;
}

- (void)setStylePending:(id)a3
{
}

- (TUICandidateViewStyle)stylePending
{
  return self->_stylePending;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setCollectionViewLayoutWasSkipped:(BOOL)a3
{
  self->_collectionViewLayoutWasSkipped = a3;
}

- (BOOL)collectionViewLayoutWasSkipped
{
  return self->_collectionViewLayoutWasSkipped;
}

- (void)setSelectedRowHighlightView:(id)a3
{
}

- (UIView)selectedRowHighlightView
{
  return self->_selectedRowHighlightView;
}

- (void)setSelectedRowY:(double)a3
{
  self->_selectedRowY = a3;
}

- (double)selectedRowY
{
  return self->_selectedRowY;
}

- (void)setLastUserSelectedCursorX:(double)a3
{
  self->_lastUserSelectedCursorX = a3;
}

- (double)lastUserSelectedCursorX
{
  return self->_lastUserSelectedCursorX;
}

- (void)setFirstVisibleIndexPath:(id)a3
{
}

- (NSIndexPath)firstVisibleIndexPath
{
  return self->_firstVisibleIndexPath;
}

- (void)setMultiRowLayout:(id)a3
{
}

- (void)setSingleRowLayout:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)suppressCollectionViewLayout
{
  return self->_suppressCollectionViewLayout;
}

- (BOOL)isArrowButtonVisible
{
  return self->_isArrowButtonVisible;
}

- (void)setArrowButtonSize:(CGSize)a3
{
  self->_arrowButtonSize = a3;
}

- (CGSize)arrowButtonSize
{
  double width = self->_arrowButtonSize.width;
  double height = self->_arrowButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (TUICandidateGridDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUICandidateGridDelegate *)WeakRetained;
}

- (UIView)customHeader
{
  return self->_customHeader;
}

- (BOOL)candidateNumberEnabled
{
  return self->_candidateNumberEnabled;
}

- (int64_t)rowType
{
  return self->_rowType;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (NSArray)candidateGroups
{
  return self->_candidateGroups;
}

- (void)addAppCandidatesRenderSignposts
{
  v2 = (const void *)arc4random();
  kdebug_trace();
  kac_get_log();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, v2);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18D47E000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "appCandidatesRender", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v6 = (void *)*MEMORY[0x1E4FB2608];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TUICandidateGrid_addAppCandidatesRenderSignposts__block_invoke;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = v2;
  [v6 _performBlockAfterCATransactionCommits:v7];
}

void __51__TUICandidateGrid_addAppCandidatesRenderSignposts__block_invoke(uint64_t a1)
{
  kdebug_trace();
  kac_get_log();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)os_signpost_id_t v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_18D47E000, v2, OS_SIGNPOST_INTERVAL_END, v4, "appCandidatesRender", " enableTelemetry=YES ", v5, 2u);
    }
  }
}

- (int64_t)numberOfNonPartialCandidatesInSection:(int64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  os_signpost_id_t v5 = [(TUICandidateGrid *)self candidateGroups];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    v7 = [(TUICandidateGrid *)self candidateGroups];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 candidates];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__TUICandidateGrid_numberOfNonPartialCandidatesInSection___block_invoke;
    v12[3] = &unk_1E5593C98;
    v12[4] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __58__TUICandidateGrid_numberOfNonPartialCandidatesInSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 isPartialCandidate]) {
    *a4 = 1;
  }
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (int64_t)numberOfTransliterationCandidatesInSection:(int64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  os_signpost_id_t v5 = [(TUICandidateGrid *)self candidateGroups];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    v7 = [(TUICandidateGrid *)self candidateGroups];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 candidates];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__TUICandidateGrid_numberOfTransliterationCandidatesInSection___block_invoke;
    v12[3] = &unk_1E5593C98;
    v12[4] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __63__TUICandidateGrid_numberOfTransliterationCandidatesInSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 isTransliterationCandidate]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else {
    *a4 = 1;
  }
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:a5];
}

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = [(TUICandidateGrid *)self style];
  int v5 = [v4 showsIndex];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = [(TUICandidateGrid *)self candidateGroups];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = [v12 title];
          uint64_t v14 = [v13 length];

          if (v14)
          {
            uint64_t v15 = [v12 title];
            [v6 addObject:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      uint64_t v16 = v6;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }
  return v17;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 isEqualToString:@"Line"])
  {
    v12 = +[TUICandidateLine reuseIdentifier];
    uint64_t v13 = @"Line";
LABEL_3:
    int v5 = [v9 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v12 forIndexPath:v11];

    uint64_t v14 = [(TUICandidateGrid *)self style];
    [v5 setStyle:v14];
    goto LABEL_12;
  }
  if ([v10 isEqualToString:@"GroupHeader"])
  {
    uint64_t v15 = +[TUICandidateGroupHeader reuseIdentifier];
    int v5 = [v9 dequeueReusableSupplementaryViewOfKind:@"GroupHeader" withReuseIdentifier:v15 forIndexPath:v11];

    uint64_t v16 = [(TUICandidateGrid *)self style];
    [v5 setStyle:v16];

    id v17 = [(TUICandidateGrid *)self style];
    objc_msgSend(v5, "setAlignment:", objc_msgSend(v17, "cellTextAlignment"));

    uint64_t v14 = [(TUICandidateGrid *)self candidateGroups];
    v18 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
    long long v19 = [v18 title];
    [v5 setText:v19];

    goto LABEL_12;
  }
  if ([v10 isEqualToString:@"CustomHeader"])
  {
    int v5 = [v9 dequeueReusableSupplementaryViewOfKind:@"CustomHeader" withReuseIdentifier:@"CustomHeader" forIndexPath:v11];
    long long v20 = [v5 subviews];
    long long v21 = [v20 lastObject];
    [v21 removeFromSuperview];

    uint64_t v14 = [(TUICandidateGrid *)self customHeader];
    [v5 addSubview:v14];
    goto LABEL_12;
  }
  if ([v10 isEqualToString:@"SlottedCellSeparator"])
  {
    v12 = +[TUICandidateSlottedSeparator reuseIdentifier];
    uint64_t v13 = @"SlottedCellSeparator";
    goto LABEL_3;
  }
  if (![v10 isEqualToString:@"DummyCandidate"]) {
    goto LABEL_13;
  }
  int v5 = [v9 dequeueReusableSupplementaryViewOfKind:@"DummyCandidate" withReuseIdentifier:@"DummyCandidate" forIndexPath:v11];
  long long v22 = [(TUICandidateGrid *)self style];
  [v5 setStyle:v22];

  v23 = [(TUICandidateGrid *)self candidateAtIndexPath:v11];
  [v5 setCandidate:v23];

  uint64_t v14 = [(TUICandidateGrid *)self selectedIndexPath];
  objc_msgSend(v5, "setSelected:", objc_msgSend(v11, "isEqual:", v14));
LABEL_12:

LABEL_13:
  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUICandidateGrid *)self candidateAtIndexPath:v7];
  if ([v8 isSecureContentCandidate])
  {
    id v9 = +[TUIProactiveCandidateCell reuseIdentifier];
    id v10 = [v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

    id v11 = [(TUICandidateGrid *)self style];
    [v10 setStyle:v11];

    [v10 setCandidate:v8];
    goto LABEL_10;
  }
  if ([v8 isAutofillExtraCandidate])
  {
    v12 = TUIAutofillExtraCandidateCell;
LABEL_9:
    uint64_t v13 = [(__objc2_class *)v12 reuseIdentifier];
    id v10 = [v6 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v7];

    [v10 setCandidate:v8];
    uint64_t v14 = [(TUICandidateGrid *)self style];
    [v10 setStyle:v14];

    goto LABEL_10;
  }
  if ([(id)objc_opt_class() isWritingToolSuggestionCandidate:v8])
  {
    v12 = TUIWritingToolCandidateCell;
    goto LABEL_9;
  }
  if ([(id)objc_opt_class() isSafariPasswordSuggestionCandidate:v8])
  {
    v12 = TUISuggestionCandidateCell;
    goto LABEL_9;
  }
  uint64_t v16 = +[TUICandidateCell reuseIdentifier];
  id v17 = [v6 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v7];

  v18 = [(TUICandidateGrid *)self style];
  [v17 setStyle:v18];

  [(TUICandidateGrid *)self maximumRowHeight];
  objc_msgSend(v17, "setMinimumTextLabelHeight:");
  [v17 setCandidate:v8];
  long long v19 = [(TUICandidateGrid *)self style];
  objc_msgSend(v17, "setAlignment:", objc_msgSend(v19, "cellTextAlignment"));

  long long v20 = [(TUICandidateGrid *)self selectedIndexPath];
  objc_msgSend(v17, "setSelected:", objc_msgSend(v7, "isEqual:", v20));

  long long v21 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__TUICandidateGrid_collectionView_cellForItemAtIndexPath___block_invoke;
  v22[3] = &unk_1E55941A8;
  id v10 = v17;
  id v23 = v10;
  [v21 performWithoutAnimation:v22];

LABEL_10:
  return v10;
}

uint64_t __58__TUICandidateGrid_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v6 = [(TUICandidateGrid *)self slottedCandidatesCount];
  int64_t v7 = [(TUICandidateGrid *)self extraCandidatesCount] + v6;
  if (v7) {
    return v7;
  }
  id v9 = [(TUICandidateGrid *)self style];
  int v10 = [v9 hidesPartialCandidates];

  if (v10)
  {
    int64_t v7 = [(TUICandidateGrid *)self numberOfNonPartialCandidatesInSection:a4];
    uint64_t v11 = v7
        - [(TUICandidateGrid *)self numberOfTransliterationCandidatesInSection:a4];
    v12 = [(TUICandidateGrid *)self style];
    uint64_t v13 = [v12 minimumNumberOfCandidates];

    if (v11 >= v13) {
      return v7;
    }
  }
  uint64_t v14 = [(TUICandidateGrid *)self candidateGroups];
  uint64_t v15 = [v14 objectAtIndexedSubscript:a4];
  uint64_t v16 = [v15 candidates];
  int64_t v17 = [v16 count];

  return v17;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  os_signpost_id_t v3 = [(TUICandidateGrid *)self candidateGroups];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(TUICandidateGrid *)self didMoveHighlightFrame];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (void)didMoveHighlightFrame
{
  os_signpost_id_t v3 = [(TUICandidateGrid *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(TUICandidateGrid *)self collectionView];
    unint64_t v6 = [v5 indexPathsForSelectedItems];
    id v22 = [v6 firstObject];

    if (v22)
    {
      int64_t v7 = [(TUICandidateGrid *)self collectionView];
      uint64_t v8 = [v7 layoutAttributesForItemAtIndexPath:v22];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      int64_t v17 = [(TUICandidateGrid *)self collectionView];
      [v17 contentOffset];
      double v19 = v18;

      double v20 = v10 - v19;
    }
    else
    {
      double v20 = *MEMORY[0x1E4F1DB20];
      double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    long long v21 = [(TUICandidateGrid *)self delegate];
    objc_msgSend(v21, "candidateGrid:didMoveHighlightFrame:", self, v20, v12, v14, v16);
  }
}

- (void)setSlottedSeparatorHidden:(BOOL)a3 inCollectionView:(id)a4 nearHighlightItemAtIndexPath:(id)a5
{
  BOOL v6 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(TUICandidateGrid *)self slottedCandidatesCount];
  if (v10 + [(TUICandidateGrid *)self extraCandidatesCount])
  {
    double v11 = [v8 cellForItemAtIndexPath:v9];
    [v11 frame];

    UIRectInset();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    double v20 = objc_msgSend(v8, "subviews", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v34 + 1) + 8 * v24);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v25 frame];
            v41.origin.x = v26;
            v41.origin.y = v27;
            v41.size.double width = v28;
            v41.size.double height = v29;
            v40.origin.x = v13;
            v40.origin.y = v15;
            v40.size.double width = v17;
            v40.size.double height = v19;
            if (CGRectIntersectsRect(v40, v41)) {
              [v25 setHidden:v6];
            }
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }

    v30 = [(TUICandidateGrid *)self delegate];
    char v31 = objc_opt_respondsToSelector();

    if (v31)
    {
      v32 = [(TUICandidateGrid *)self delegate];
      v33 = v32;
      if (!v6)
      {
        double v13 = *MEMORY[0x1E4F1DB20];
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
      objc_msgSend(v32, "candidateGrid:didMoveHighlightFrame:", self, v13, v15, v17, v19);
    }
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    double v11 = [v30 layoutAttributesForItemAtIndexPath:v9];
    double v12 = [(TUICandidateGrid *)self style];
    int v13 = [v12 showExtraLineBeforeFirstRow];

    [v11 frame];
    double v15 = v14;
    [(TUICandidateGrid *)self selectedRowY];
    if (v15 == v16)
    {
      double v17 = [(TUICandidateGrid *)self selectedIndexPath];
      BOOL v18 = v17 != 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    [v10 setRowSelected:v18];
    double v19 = [(TUICandidateGrid *)self selectedIndexPath];
    objc_msgSend(v10, "setSelected:", objc_msgSend(v19, "isEqual:", v9));

    if ([(TUICandidateGrid *)self candidateNumberEnabled])
    {
      double v20 = [(TUICandidateGrid *)self style];
      uint64_t v21 = [v20 layoutOrientation];

      if (v21 == 1)
      {
        uint64_t v22 = 1;
      }
      else
      {
        int64_t v24 = [(TUICandidateGrid *)self rowType];
        BOOL v25 = v24 == 0;
        if ([(TUICandidateGrid *)self rowType] == 1)
        {
          CGFloat v26 = [(TUICandidateGrid *)self style];
          uint64_t v27 = [v26 columnsCount];

          BOOL v25 = v27 == 1 || v24 == 0;
        }
        uint64_t v22 = v18 | v25;
        CGFloat v29 = [(TUICandidateGrid *)self selectedIndexPath];
        if (v29)
        {
        }
        else if ([v11 row] == v13)
        {
          uint64_t v22 = 1;
        }
        else
        {
          uint64_t v22 = v22;
        }
      }
      [v10 setShouldShowCandidateNumber:v22];
      unint64_t v23 = [(TUICandidateGrid *)self candidateNumberForIndexPath:v9];
    }
    else
    {
      [v10 setShouldShowCandidateNumber:0];
      unint64_t v23 = 0;
    }
    [v10 setCandidateNumber:v23];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a4;
  int v5 = [(TUICandidateGrid *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int64_t v7 = [(TUICandidateGrid *)self delegate];
    id v8 = [(TUICandidateGrid *)self candidateAtIndexPath:v9];
    [v7 candidateGrid:self didAcceptCandidate:v8 atIndexPath:v9];
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  int64_t v7 = [a3 collectionViewLayout];
  id v8 = [(TUICandidateGrid *)self firstVisibleIndexPath];
  if (v8 && [(TUICandidateGrid *)self indexPathIsValid:v8])
  {
    id v9 = [(TUICandidateGrid *)self firstVisibleIndexPath];
    id v10 = [v7 layoutAttributesForItemAtIndexPath:v9];
    [v10 frame];
    CGFloat x = v11;
    double y = v12;

    if ([v7 rowType] == 1)
    {
      int v13 = [(TUICandidateGrid *)self style];
      [v13 rowHeight];
      double v15 = v14;

      if (y < v15) {
        double y = 0.0;
      }
      CGFloat x = 0.0;
    }
    else
    {
      double y = 0.0;
    }
  }

  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.CGFloat x = v16;
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TUICandidateGrid;
  if (-[TUICandidateGrid respondsToSelector:](&v10, sel_respondsToSelector_)) {
    return 1;
  }
  char v6 = [(TUICandidateGrid *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v8 = NSStringFromSelector(a3);
  BOOL v5 = [v8 rangeOfString:@"scrollView" options:1] != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TUICandidateGrid *)self collectionView];
  char v6 = [v5 visibleSupplementaryViewsOfKind:@"GroupHeader"];

  char v7 = [(TUICandidateGrid *)self collectionView];
  [v7 contentOffset];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(TUICandidateGrid *)self collectionView];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v43 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_msgSend(v22, "frame", (void)v42);
        v51.origin.double x = v9;
        v51.origin.double y = v11;
        v51.size.double width = v14;
        v51.size.double height = v16;
        CGRect v49 = CGRectIntersection(v48, v51);
        double x = v49.origin.x;
        double y = v49.origin.y;
        double width = v49.size.width;
        double height = v49.size.height;
        if (!CGRectIsNull(v49))
        {
          v50.origin.double x = x;
          v50.origin.double y = y;
          v50.size.double width = width;
          v50.size.double height = height;
          if (!CGRectIsEmpty(v50))
          {
            uint64_t v27 = [(TUICandidateGrid *)self collectionView];
            objc_msgSend(v22, "convertRect:fromView:", v27, x, y, width, height);
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;
            double v35 = v34;

            objc_msgSend(v22, "setVisibleBounds:", v29, v31, v33, v35);
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v19);
  }

  long long v36 = [(TUICandidateGrid *)self style];
  if ([v36 layoutOrientation] == 1)
  {

LABEL_15:
    [(TUICandidateGrid *)self forceUpdateVisibleCells];
    goto LABEL_17;
  }
  if ([(TUICandidateGrid *)self candidateNumberEnabled])
  {
    long long v37 = [(TUICandidateGrid *)self style];
    uint64_t v38 = [v37 columnsCount];

    if (v38 != 1) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

LABEL_17:
  uint64_t v39 = [(TUICandidateGrid *)self delegate];
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    CGRect v41 = [(TUICandidateGrid *)self delegate];
    [v41 scrollViewDidScroll:v4];
  }
  [(TUICandidateGrid *)self updateGradientLayerToCollectionView];
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  id v7 = a3;
  [(TUICandidateGrid *)self updateContentInset];
  [(TUICandidateGrid *)self updateGradientLayerToCollectionView];
  id v4 = [(TUICandidateGrid *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(TUICandidateGrid *)self delegate];
    [v7 contentSize];
    objc_msgSend(v6, "candidateGrid:didChangeContentSize:", self);
  }
}

- (double)collectionView:(id)a3 layout:(id)a4 widthForGroupHeaderInSection:(int64_t)a5
{
  id v7 = [(TUICandidateGrid *)self candidateGroups];
  double v8 = [v7 objectAtIndexedSubscript:a5];
  CGFloat v9 = [v8 title];

  if ([v9 length])
  {
    double v10 = [(TUICandidateGrid *)self style];
    uint64_t v11 = [v10 candidateFont];
    objc_msgSend(v9, "tui_optimizedSizeWithFont:", v11);
    double v13 = v12 + 20.0;

    CGFloat v14 = [(TUICandidateGrid *)self style];
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if (v11)
    {
      double v15 = [(TUICandidateGrid *)self style];
      [v15 groupHeaderPadding];
      double v13 = v13 + v16;
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(TUICandidateGrid *)self candidateAtIndexPath:a5];
  if (![v10 isSlottedCandidate] || (objc_msgSend(v10, "isStickerCandidate") & 1) != 0)
  {
    [(TUICandidateGrid *)self rowHeight];
    double v12 = v11;
    if ([v9 rowType] != 1 || objc_msgSend(v9, "transitionState") != 1)
    {
LABEL_18:
      if ([v10 isStickerCandidate])
      {
        BOOL v25 = [(TUICandidateGrid *)self style];
        [v25 minimumCellWidth];
        double v20 = v26;

        if (v12 >= v20) {
          double v20 = v12;
        }
      }
      else
      {
        BOOL v27 = [(TUICandidateGrid *)self candidateNumberEnabled];
        double v28 = [(TUICandidateGrid *)self style];
        +[TUICandidateCell widthForCandidate:v10 showCandidateNumber:v27 style:v28];
        double v20 = v29;
      }
      goto LABEL_23;
    }
    if ([(TUICandidateGrid *)self rowType])
    {
      double v13 = [(TUICandidateGrid *)self style];
    }
    else
    {
      double v13 = [(TUICandidateGrid *)self stylePending];
      if (!v13)
      {
        double v32 = [(TUICandidateGrid *)self style];
        [v32 rowHeight];
        double v24 = v33;

        uint64_t v22 = 0;
LABEL_16:

        if (v24 > 0.0) {
          double v12 = v24;
        }
        goto LABEL_18;
      }
    }
    uint64_t v22 = v13;
    [v13 rowHeight];
    double v24 = v23;
    goto LABEL_16;
  }
  unint64_t v14 = [(TUICandidateGrid *)self slottedCandidatesCount];
  double v15 = [(TUICandidateGrid *)self style];
  unint64_t v16 = [v15 maxNumberOfProactiveCells];

  if (v16 >= v14) {
    unint64_t v17 = v14;
  }
  else {
    unint64_t v17 = v16;
  }
  if (v17 <= 1) {
    unint64_t v18 = 1;
  }
  else {
    unint64_t v18 = v17;
  }
  [v8 bounds];
  double v20 = v19 / (double)v18;
  [(TUICandidateGrid *)self rowHeight];
  double v12 = v21;
LABEL_23:

  double v30 = v20;
  double v31 = v12;
  result.double height = v31;
  result.double width = v30;
  return result;
}

- (void)updateGradientLayerToCollectionView
{
  v18[2] = *MEMORY[0x1E4F143B8];
  [(TUICandidateGrid *)self contentSize];
  double v4 = v3;
  [(TUICandidateGrid *)self frame];
  double Width = CGRectGetWidth(v19);
  char v6 = [(TUICandidateGrid *)self style];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (([v6 widthOfGridGradient], v7 > 0.0) ? (BOOL v8 = v4 <= Width) : (BOOL v8 = 1), v8))
  {
    id v9 = [(UICollectionView *)self->_collectionView layer];
    [v9 setMask:0];
  }
  else
  {
    double v10 = [MEMORY[0x1E4F39BD0] layer];
    [(UICollectionView *)self->_collectionView bounds];
    objc_msgSend(v10, "setFrame:");
    id v11 = [MEMORY[0x1E4FB1618] whiteColor];
    v18[0] = [v11 CGColor];
    id v12 = [MEMORY[0x1E4FB1618] clearColor];
    v18[1] = [v12 CGColor];
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v10 setColors:v13];

    [v10 setLocations:&unk_1EDC79BD8];
    [(UICollectionView *)self->_collectionView frame];
    double v15 = v14;
    [v6 widthOfGridGradient];
    objc_msgSend(v10, "setStartPoint:", (v15 - v16) / v15, 0.5);
    objc_msgSend(v10, "setEndPoint:", 1.0, 0.5);
    unint64_t v17 = [(UICollectionView *)self->_collectionView layer];
    [v17 setMask:v10];
  }
}

- (void)forceUpdateVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = [(TUICandidateGrid *)self collectionView];
  double v4 = [v3 indexPathsForVisibleItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        double v10 = [(TUICandidateGrid *)self collectionView];
        id v11 = [v10 cellForItemAtIndexPath:v9];

        id v12 = [(TUICandidateGrid *)self collectionView];
        [(TUICandidateGrid *)self collectionView:v12 willDisplayCell:v11 forItemAtIndexPath:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)scrollToCandidateAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v40 = a3;
  uint64_t v6 = [(TUICandidateGrid *)self collectionView];
  uint64_t v7 = [v6 layoutAttributesForItemAtIndexPath:v40];
  [v7 frame];
  CGFloat v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  long long v16 = [(TUICandidateGrid *)self style];
  uint64_t v17 = [v16 layoutOrientation];

  if (v17)
  {
    v42.origin.double x = v9;
    v42.origin.double y = v11;
    v42.size.double width = v13;
    v42.size.double height = v15;
    double MaxX = CGRectGetMaxX(v42);
    CGRect v19 = [(TUICandidateGrid *)self collectionView];
    [v19 bounds];
    double v21 = MaxX - v20;

    double v11 = 0.0;
  }
  else
  {
    if ([v40 section] || objc_msgSend(v40, "item"))
    {
      double v22 = v9;
    }
    else
    {
      v43.origin.double x = v9;
      v43.origin.double y = v11;
      v43.size.double width = v13;
      v43.size.double height = v15;
      double v31 = CGRectGetMaxX(v43);
      [(TUICandidateGrid *)self bounds];
      double Width = CGRectGetWidth(v44);
      [(TUICandidateGrid *)self arrowButtonSize];
      double v34 = Width - v33;
      double v22 = 0.0;
      if (v31 > v34
        && ![(TUICandidateGrid *)self rowType]
        && ![(TUICandidateGrid *)self showingSlottedCandidates])
      {
        double v35 = [(TUICandidateGrid *)self collectionView];
        [v35 bounds];
        IsEmptdouble y = CGRectIsEmpty(v45);

        if (!IsEmpty)
        {
          v46.origin.double x = v9;
          v46.origin.double y = v11;
          v46.size.double width = v13;
          v46.size.double height = v15;
          double v37 = CGRectGetMaxX(v46);
          [(TUICandidateGrid *)self bounds];
          double v38 = v37 - CGRectGetWidth(v47);
          [(TUICandidateGrid *)self arrowButtonSize];
          double v22 = v38 + v39;
        }
      }
    }
    double v23 = [(TUICandidateGrid *)self style];
    [v23 rowHeight];
    if (v11 >= v24)
    {
    }
    else
    {
      BOOL v25 = [(TUICandidateGrid *)self style];
      [v25 gridLinePadding];
      double v27 = v26;

      if (v27 == 0.0) {
        double v11 = 0.0;
      }
    }
    int64_t v28 = [(TUICandidateGrid *)self rowType];
    if (v22 < 0.0 || v28 == 1) {
      double v21 = 0.0;
    }
    else {
      double v21 = v22;
    }
  }
  double v30 = [(TUICandidateGrid *)self collectionView];
  objc_msgSend(v30, "setContentOffset:animated:", v4, v21, v11);
}

- (void)updateSelectedRowHighlightView
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v3 = [(TUICandidateGrid *)self style];
  BOOL v4 = [v3 highlightedRowBackgroundColor];

  if (v4)
  {
    uint64_t v5 = [(TUICandidateGrid *)self indexPathsForSelectedRow];
    [(TUICandidateGrid *)self bounds];
    double Width = CGRectGetWidth(v31);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          CGFloat v13 = [(TUICandidateGrid *)self collectionView];
          double v14 = [v13 layoutAttributesForItemAtIndexPath:v12];

          [v14 frame];
          double MinX = CGRectGetMinX(v32);
          if (Width >= MinX) {
            double Width = MinX;
          }
          [v14 frame];
          double MinY = CGRectGetMinY(v33);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }
    else
    {
      double MinY = 0.0;
    }

    [(TUICandidateGrid *)self bounds];
    CGFloat v17 = CGRectGetWidth(v34) - Width;
    uint64_t v18 = [(TUICandidateGrid *)self style];
    [v18 rowHeight];
    double v20 = v19;

    double v21 = [(TUICandidateGrid *)self selectedRowHighlightView];
    objc_msgSend(v21, "setFrame:", Width, MinY, v17, v20);

    double v22 = [(TUICandidateGrid *)self selectedRowHighlightView];
    [v22 setHidden:0];
  }
  else
  {
    id v23 = [(TUICandidateGrid *)self selectedRowHighlightView];
    [v23 setHidden:1];
  }
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  BOOL v4 = [(TUICandidateGrid *)self indexPathForCandidateNumber:a3];
  BOOL v5 = [(TUICandidateGrid *)self indexPathIsValid:v4];
  if (v5)
  {
    uint64_t v6 = [(TUICandidateGrid *)self candidateAtIndexPath:v4];
    [(TUICandidateGrid *)self setSelectedIndexPath:v4];
    id v7 = [(TUICandidateGrid *)self delegate];
    [v7 candidateGrid:self didAcceptCandidate:v6 atIndexPath:v4];
  }
  return v5;
}

- (int64_t)rowForCandidate:(id)a3
{
  BOOL v4 = [(TUICandidateGrid *)self indexPathForCandidate:a3];
  if (v4)
  {
    BOOL v5 = [(TUICandidateGrid *)self collectionView];
    uint64_t v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

    int64_t v7 = [v6 row];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)viewOffsetForCandidate:(id)a3
{
  BOOL v4 = [(TUICandidateGrid *)self indexPathForCandidate:a3];
  if (v4)
  {
    BOOL v5 = [(TUICandidateGrid *)self collectionView];
    uint64_t v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

    [v6 frame];
    int64_t MinX = (uint64_t)CGRectGetMinX(v9);
  }
  else
  {
    int64_t MinX = 0x7FFFFFFFFFFFFFFFLL;
  }

  return MinX;
}

- (id)indexPathForCandidate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = [(TUICandidateGrid *)self candidateGroups];
    uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      int64_t v7 = 0;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        CGRect v9 = 0;
        uint64_t v10 = &v6[(void)v7];
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          double v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) candidates];
          uint64_t v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 indexOfObject:v4];
            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:&v9[(void)v7]];

              goto LABEL_14;
            }
          }

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        int64_t v7 = v10;
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)indexPathsForSelectedRow
{
  double v3 = [(TUICandidateGrid *)self selectedIndexPath];
  if ((v3 && [(TUICandidateGrid *)self indexPathIsValid:v3]
     || ([MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0],
         uint64_t v4 = objc_claimAutoreleasedReturnValue(),
         v3,
         (double v3 = (void *)v4) != 0))
    && [(TUICandidateGrid *)self indexPathIsValid:v3])
  {
    BOOL v5 = [(TUICandidateGrid *)self collectionView];
    uint64_t v6 = [v5 layoutAttributesForItemAtIndexPath:v3];

    [v6 frame];
    int64_t v7 = -[TUICandidateGrid indexPathsInTheRowThatContainsFrame:](self, "indexPathsInTheRowThatContainsFrame:");
  }
  else
  {
    int64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)indexPathsInTheRowThatContainsFrame:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3.origin.x, a3.origin.y, a3.size.width);
  int64_t v7 = [(TUICandidateGrid *)self collectionView];
  [v7 bounds];
  double v9 = v8;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [(TUICandidateGrid *)self collectionView];
  double v11 = [v10 collectionViewLayout];
  uint64_t v12 = objc_msgSend(v11, "layoutAttributesForElementsInRect:", 0.0, y, v9, height);

  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (![v17 representedElementCategory])
        {
          long long v18 = [v17 indexPath];
          [v6 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v6;
}

- (id)indexPathForCandidateNumber:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 <= 8)
  {
    BOOL v5 = [(TUICandidateGrid *)self style];
    uint64_t v6 = [v5 layoutOrientation];

    if (v6 == 1)
    {
      int64_t v7 = [(TUICandidateGrid *)self indexPathForVerticalCandidateNumber:a3];
      goto LABEL_29;
    }
    if ([(TUICandidateGrid *)self rowType] == 1
      && ([(TUICandidateGrid *)self style],
          double v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 columnsCount],
          v8,
          v9 == 1))
    {
      [(TUICandidateGrid *)self visibleAttributes];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            long long v16 = [v15 indexPath];
            unint64_t v17 = [(TUICandidateGrid *)self candidateNumberInVerticalLayoutForIndexPath:v16];

            if (v17 == a3)
            {
              int64_t v7 = [v15 indexPath];
LABEL_28:

              goto LABEL_29;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      long long v18 = 0;
    }
    else
    {
      long long v18 = [(TUICandidateGrid *)self indexPathsForSelectedRow];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v18;
    uint64_t v19 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v10);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          long long v24 = [(TUICandidateGrid *)self collectionView];
          uint64_t v25 = [v24 layoutAttributesForItemAtIndexPath:v23];

          if ([v25 candidateNumber] == a3)
          {
            int64_t v7 = [v25 indexPath];

            goto LABEL_28;
          }
        }
        uint64_t v20 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
  }
  int64_t v7 = 0;
LABEL_29:
  return v7;
}

- (id)indexPathForVerticalCandidateNumber:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(TUICandidateGrid *)self collectionView];
  [v5 visibleBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(TUICandidateGrid *)self visibleAttributes];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v27;
    unint64_t v19 = a3 - 1;
    while (2)
    {
      uint64_t v20 = 0;
      uint64_t v21 = v19 - v16;
      v16 += v15;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v22 = *(void **)(*((void *)&v26 + 1) + 8 * v20);
        objc_msgSend(v22, "frame", (void)v26);
        double MidX = CGRectGetMidX(v33);
        v34.origin.double x = v7;
        v34.origin.double y = v9;
        v34.size.double width = v11;
        v34.size.double height = v13;
        if (MidX > CGRectGetMaxX(v34)) {
          ++v17;
        }
        if (v21 + v17 == v20)
        {
          [v22 frame];
          double v24 = CGRectGetMidX(v35);
          v36.origin.double x = v7;
          v36.origin.double y = v9;
          v36.size.double width = v11;
          v36.size.double height = v13;
          if (v24 > CGRectGetMinX(v36))
          {
            uint64_t v15 = [v22 indexPath];
            goto LABEL_14;
          }
        }
        ++v20;
      }
      while (v15 != v20);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (id)v15;
}

- (unint64_t)candidateNumberInVerticalLayoutForIndexPath:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TUICandidateGrid *)self candidateNumberEnabled])
  {
    BOOL v5 = [(TUICandidateGrid *)self collectionView];
    [v5 visibleBounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    [(TUICandidateGrid *)self visibleAttributes];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v29;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v18 + v16;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v14);
          }
          long long v22 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
          objc_msgSend(v22, "frame", (void)v28);
          double MidX = CGRectGetMidX(v34);
          v35.origin.double x = v7;
          v35.origin.double y = v9;
          v35.size.double width = v11;
          v35.size.double height = v13;
          if (MidX > CGRectGetMaxX(v35)) {
            ++v17;
          }
          double v24 = [v22 indexPath];
          char v25 = [v24 isEqual:v4];

          if (v25)
          {
            uint64_t v21 = v18 + v20;
            goto LABEL_16;
          }
          ++v20;
        }
        while (v16 != v20);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v18 = v21;
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v21 = 0;
    }
LABEL_16:

    unint64_t v26 = v21 - v17 + 1;
  }
  else
  {
    unint64_t v26 = 0;
  }

  return v26;
}

- (id)visibleAttributes
{
  double v3 = [(TUICandidateGrid *)self collectionView];
  [v3 visibleBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(TUICandidateGrid *)self collectionView];
  CGFloat v13 = [v12 collectionViewLayout];
  id v14 = objc_msgSend(v13, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_56];
  uint64_t v16 = [v14 filteredArrayUsingPredicate:v15];

  uint64_t v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_58];

  return v17;
}

uint64_t __37__TUICandidateGrid_visibleAttributes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 indexPath];
  double v6 = [v4 indexPath];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __37__TUICandidateGrid_visibleAttributes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 representedElementCategory] == 0;
}

- (unint64_t)candidateNumberInHorizontalLayoutForIndexPath:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(TUICandidateGrid *)self style];
  uint64_t v6 = [v5 columnsCount];

  uint64_t v7 = [(TUICandidateGrid *)self collectionView];
  double v8 = v7;
  if (v6 == 1)
  {
    [v7 visibleBounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    [(TUICandidateGrid *)self visibleAttributes];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v32;
      while (2)
      {
        uint64_t v23 = 0;
        uint64_t v24 = v21 + v19;
        do
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v17);
          }
          char v25 = *(void **)(*((void *)&v31 + 1) + 8 * v23);
          objc_msgSend(v25, "frame", (void)v31);
          double MidY = CGRectGetMidY(v37);
          v38.origin.double x = v10;
          v38.origin.double y = v12;
          v38.size.double width = v14;
          v38.size.double height = v16;
          if (MidY < CGRectGetMinY(v38)) {
            ++v20;
          }
          long long v27 = [v25 indexPath];
          char v28 = [v27 isEqual:v4];

          if (v28)
          {
            uint64_t v24 = v21 + v23;
            goto LABEL_16;
          }
          ++v23;
        }
        while (v19 != v23);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
        uint64_t v21 = v24;
        if (v19) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v24 = 0;
    }
LABEL_16:

    unint64_t v29 = v24 - v20 + 1;
  }
  else
  {
    id v17 = [v7 layoutAttributesForItemAtIndexPath:v4];

    unint64_t v29 = [v17 candidateNumber];
  }

  return v29;
}

- (BOOL)canExpandCandidateGrid
{
  double v3 = [(TUICandidateGrid *)self style];
  if ([v3 scrollDisabled])
  {
    char v4 = 1;
  }
  else
  {
    double v5 = [(TUICandidateGrid *)self style];
    char v4 = [v5 allowCandidateGridExpanding];
  }
  return v4;
}

- (unint64_t)candidateNumberForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(TUICandidateGrid *)self style];
  uint64_t v6 = [v5 layoutOrientation];

  if (v6 == 1) {
    unint64_t v7 = [(TUICandidateGrid *)self candidateNumberInVerticalLayoutForIndexPath:v4];
  }
  else {
    unint64_t v7 = [(TUICandidateGrid *)self candidateNumberInHorizontalLayoutForIndexPath:v4];
  }
  unint64_t v8 = v7;

  return v8;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  unint64_t v7 = -[TUICandidateGrid indexPathInForwardDirection:granularity:](self, "indexPathInForwardDirection:granularity:");
  if (!v7)
  {
    uint64_t v19 = [(TUICandidateGrid *)self selectedIndexPath];

    if (v19) {
      return;
    }
    if (v5)
    {
      uint64_t v20 = [(TUICandidateGrid *)self firstIndexPath];
    }
    else
    {
      unint64_t v29 = [(TUICandidateGrid *)self style];
      char v30 = [v29 dontSelectLastItemByBackwardMoving];

      if (v30) {
        return;
      }
      uint64_t v20 = [(TUICandidateGrid *)self lastIndexPath];
    }
    unint64_t v7 = (void *)v20;
    if (!v20) {
      return;
    }
  }
  [(TUICandidateGrid *)self setSelectedIndexPath:v7 animated:0 scrollPosition:0];
  id v31 = v7;
  unint64_t v8 = [(TUICandidateGrid *)self style];
  int v9 = [v8 showOneMoreCandidate];

  id v10 = v31;
  if (v9)
  {
    double v11 = [(TUICandidateGrid *)self indexPathInForwardDirection:v5 granularity:v4];
    if (v11) {
      CGFloat v12 = v11;
    }
    else {
      CGFloat v12 = v31;
    }
    id v10 = v12;
  }
  if (![(TUICandidateGrid *)self indexPathIsFullyVisible:v10 granularity:v4])
  {
    if ([(TUICandidateGrid *)self canExpandCandidateGrid]
      && (([(TUICandidateGrid *)self style],
           double v13 = objc_claimAutoreleasedReturnValue(),
           int v14 = [v13 showOneMoreCandidate],
           v13,
           !v14)
       || v5))
    {
      char v28 = [(TUICandidateGrid *)self delegate];
      [v28 candidateGridNeedsToExpand:self];
    }
    else
    {
      double v15 = [(TUICandidateGrid *)self style];
      int v16 = [v15 showOneMoreCandidate];

      if (v16 && v5)
      {
        BOOL v17 = 1;
        uint64_t v18 = 36;
      }
      else
      {
        uint64_t v21 = [(TUICandidateGrid *)self style];
        uint64_t v22 = [v21 layoutOrientation];
        BOOL v17 = v4 != 1 || v22 != 1;

        if (v17) {
          uint64_t v18 = 9;
        }
        else {
          uint64_t v18 = 33;
        }
      }
      uint64_t v24 = [(TUICandidateGrid *)self style];
      uint64_t v25 = [v24 columnsCount];

      if (v4) {
        BOOL v26 = 0;
      }
      else {
        BOOL v26 = v25 == 1;
      }
      BOOL v27 = !v26 && v17;
      char v28 = [(TUICandidateGrid *)self collectionView];
      [v28 scrollToItemAtIndexPath:v10 atScrollPosition:v18 animated:v27];
    }
  }
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  unint64_t v7 = [(TUICandidateGrid *)self selectedIndexPath];

  if (v7)
  {
    uint64_t v8 = [(TUICandidateGrid *)self indexPathInForwardDirection:v5 granularity:v4];
    int v9 = (void *)v8;
  }
  else
  {
    int v9 = [(TUICandidateGrid *)self candidateGroups];
    uint64_t v8 = [v9 count];
  }
  BOOL v10 = v8 != 0;

  return v10;
}

- (BOOL)indexPathIsFullyVisible:(id)a3 granularity:(int)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(TUICandidateGrid *)self collectionView];
  [v7 visibleBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;

  [(TUICandidateGrid *)self arrowButtonSize];
  double v17 = v16;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v18 = [(TUICandidateGrid *)self collectionView];
  uint64_t v19 = [v18 indexPathsForVisibleItems];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    double v22 = v13 - v17;
    uint64_t v23 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v19);
        }
        if ([v6 isEqual:*(void *)(*((void *)&v36 + 1) + 8 * i)])
        {
          BOOL v26 = [(TUICandidateGrid *)self collectionView];
          BOOL v27 = [v26 layoutAttributesForItemAtIndexPath:v6];

          char v28 = [(TUICandidateGrid *)self style];
          if (objc_opt_respondsToSelector())
          {
            unint64_t v29 = [(TUICandidateGrid *)self style];
            unsigned __int8 v30 = [v29 shouldScrollIfShowingLastVisibleRow];

            if (((a4 == 1) & v30) != 0) {
              double v15 = v15 + -1.0;
            }
          }
          else
          {
          }
          [v27 frame];
          v43.origin.double x = v31;
          v43.origin.double y = v32;
          v43.size.double width = v33;
          v43.size.double height = v34;
          v42.origin.double x = v9;
          v42.origin.double y = v11;
          v42.size.double width = v22;
          v42.size.double height = v15;
          BOOL v25 = CGRectContainsRect(v42, v43);

          goto LABEL_16;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  BOOL v25 = 0;
LABEL_16:

  return v25;
}

- (id)indexPathInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  BOOL v5 = a3;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(TUICandidateGrid *)self selectedIndexPath];
  if (![(TUICandidateGrid *)self indexPathIsValid:v7]) {
    goto LABEL_63;
  }
  if (a4)
  {
    if (a4 == 1)
    {
      double v8 = [(TUICandidateGrid *)self style];
      uint64_t v9 = [v8 layoutOrientation];

      double v10 = [(TUICandidateGrid *)self collectionView];
      CGFloat v11 = [v10 layoutAttributesForItemAtIndexPath:v7];
      [v11 frame];
      double v15 = v14;
      double v17 = v16;
      if (v9 == 1)
      {
        double v18 = v12;
        double v19 = v13;

        uint64_t v20 = [(TUICandidateGrid *)self collectionView];
        [v20 bounds];
        double v22 = 1.0;
        if (v5) {
          double v22 = -1.0;
        }
        double v23 = v18 + v21 * v22;

        uint64_t v24 = [(TUICandidateGrid *)self collectionView];
        BOOL v25 = [v24 collectionViewLayout];
        BOOL v26 = objc_msgSend(v25, "layoutAttributesForElementsInRect:", v23, v15, v19, v17);

        id v27 = [v26 sortedArrayUsingComparator:&__block_literal_global_50];

        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        if (v5)
        {
          id v28 = v27;
        }
        else
        {
          id v28 = [v27 reverseObjectEnumerator];
        }
        v67 = v28;
        long long v38 = (void *)[v28 countByEnumeratingWithState:&v98 objects:v103 count:16];
        if (v38)
        {
          uint64_t v68 = *(void *)v99;
          while (2)
          {
            for (uint64_t i = 0; i != v38; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v99 != v68) {
                objc_enumerationMutation(v67);
              }
              v70 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              if (![v70 representedElementCategory])
              {
                [v70 frame];
                v113.origin.double x = v71;
                v113.origin.double y = v72;
                v113.size.double width = v73;
                v113.size.double height = v74;
                v108.origin.double x = v23;
                v108.origin.double y = v15;
                v108.size.double width = v19;
                v108.size.double height = v17;
                CGRect v109 = CGRectIntersection(v108, v113);
                if (v109.size.width > v19 * 0.25)
                {
                  long long v38 = objc_msgSend(v70, "indexPath", v109.origin.x, v109.origin.y);
                  goto LABEL_51;
                }
              }
            }
            long long v38 = (void *)[v67 countByEnumeratingWithState:&v98 objects:v103 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }
LABEL_51:
      }
      else
      {

        double v39 = -1.0;
        if (v5) {
          double v39 = 1.0;
        }
        double v40 = v15 + v17 * v39;
        [(TUICandidateGrid *)self bounds];
        double v42 = v41;
        CGRect v43 = [(TUICandidateGrid *)self collectionView];
        CGRect v44 = [v43 collectionViewLayout];
        CGRect v45 = objc_msgSend(v44, "layoutAttributesForElementsInRect:", 0.0, v40, v42, v17);

        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v27 = v45;
        uint64_t v46 = [v27 countByEnumeratingWithState:&v94 objects:v102 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          long long v38 = 0;
          uint64_t v48 = *(void *)v95;
          double v49 = 1.79769313e308;
          while (2)
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              if (*(void *)v95 != v48) {
                objc_enumerationMutation(v27);
              }
              CGRect v51 = *(void **)(*((void *)&v94 + 1) + 8 * j);
              if (!objc_msgSend(v51, "representedElementCategory", (void)v94))
              {
                [v51 frame];
                double MinX = CGRectGetMinX(v106);
                [(TUICandidateGrid *)self lastUserSelectedCursorX];
                if (MinX < v53)
                {
                  [v51 frame];
                  double MaxX = CGRectGetMaxX(v107);
                  [(TUICandidateGrid *)self lastUserSelectedCursorX];
                  if (MaxX > v55)
                  {
                    uint64_t v66 = [v51 indexPath];

                    long long v38 = (void *)v66;
                    goto LABEL_53;
                  }
                }
                [v51 frame];
                UIRectGetCenter();
                double v57 = v56;
                [(TUICandidateGrid *)self lastUserSelectedCursorX];
                double v59 = v57 - v58;
                if (v59 >= 0.0) {
                  double v60 = v59;
                }
                else {
                  double v60 = -v59;
                }
                if (v60 < v49)
                {
                  uint64_t v61 = [v51 indexPath];

                  double v49 = v60;
                  long long v38 = (void *)v61;
                }
              }
            }
            uint64_t v47 = [v27 countByEnumeratingWithState:&v94 objects:v102 count:16];
            if (v47) {
              continue;
            }
            break;
          }
        }
        else
        {
          long long v38 = 0;
        }
LABEL_53:
      }
    }
    else
    {
      long long v38 = 0;
    }
  }
  else
  {
    uint64_t v29 = [v7 section];
    uint64_t v30 = [v7 row];
    if (v5) {
      unint64_t v31 = v30 + 1;
    }
    else {
      unint64_t v31 = v30 - 1;
    }
    if ((v31 & 0x8000000000000000) != 0)
    {
      if (v29-- < 1)
      {
        unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v63 = [(TUICandidateGrid *)self candidateGroups];
        v64 = [v63 objectAtIndexedSubscript:v29];
        v65 = [v64 candidates];
        unint64_t v31 = [v65 count] - 1;
      }
    }
    else
    {
      CGFloat v32 = [(TUICandidateGrid *)self candidateGroups];
      CGFloat v33 = [v32 objectAtIndexedSubscript:v29];
      CGFloat v34 = [v33 candidates];
      unint64_t v35 = [v34 count];

      if (v31 >= v35)
      {
        ++v29;
        long long v36 = [(TUICandidateGrid *)self candidateGroups];
        unint64_t v37 = [v36 count];

        if (v29 >= v37) {
          unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = 0;
        }
      }
    }
    long long v38 = [MEMORY[0x1E4F28D58] indexPathForRow:v31 inSection:v29];
  }
  if (!-[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v38, (void)v94))
  {

LABEL_63:
    long long v38 = 0;
    goto LABEL_64;
  }
  if (!a4 && v38)
  {
    v75 = [(TUICandidateGrid *)self collectionView];
    v76 = [v75 layoutAttributesForItemAtIndexPath:v38];
    [v76 frame];
    CGFloat v78 = v77;
    CGFloat v80 = v79;
    CGFloat v82 = v81;
    CGFloat v84 = v83;

    v110.origin.double x = v78;
    v110.origin.double y = v80;
    v110.size.double width = v82;
    v110.size.double height = v84;
    if (CGRectGetMinX(v110) == 0.0)
    {
      double v85 = 0.0;
    }
    else
    {
      v111.origin.double x = v78;
      v111.origin.double y = v80;
      v111.size.double width = v82;
      v111.size.double height = v84;
      double v87 = CGRectGetMaxX(v111);
      v88 = [(TUICandidateGrid *)self collectionView];
      [v88 bounds];
      double v89 = CGRectGetMaxX(v112);

      CGFloat v90 = v78;
      CGFloat v91 = v80;
      CGFloat v92 = v82;
      CGFloat v93 = v84;
      if (v87 == v89) {
        double v85 = CGRectGetMaxX(*(CGRect *)&v90);
      }
      else {
        UIRectGetCenter();
      }
    }
    [(TUICandidateGrid *)self setLastUserSelectedCursorX:v85];
  }
LABEL_64:

  return v38;
}

uint64_t __60__TUICandidateGrid_indexPathInForwardDirection_granularity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 indexPath];
  id v6 = [v4 indexPath];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (TIKeyboardCandidate)selectedCandidate
{
  double v3 = [(TUICandidateGrid *)self selectedIndexPath];
  id v4 = [(TUICandidateGrid *)self candidateAtIndexPath:v3];

  return (TIKeyboardCandidate *)v4;
}

- (BOOL)indexPathIsValid:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4 || [v4 section] < 0 || objc_msgSend(v5, "row") < 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    id v6 = [(TUICandidateGrid *)self candidateGroups];
    unint64_t v7 = [v6 count];
    if (v7 <= [v5 section])
    {
      BOOL v12 = 0;
    }
    else
    {
      double v8 = [(TUICandidateGrid *)self candidateGroups];
      uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
      double v10 = [v9 candidates];
      unint64_t v11 = [v10 count];
      BOOL v12 = v11 > [v5 row];
    }
  }

  return v12;
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v9 = (NSIndexPath *)a3;
  double v10 = v9;
  if (self->_selectedIndexPath != v9 || [(NSIndexPath *)v9 isEqual:v9])
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    if (v10
      && [(TUICandidateGrid *)self indexPathIsValid:v10]
      && ([(TUICandidateGrid *)self collectionView],
          unint64_t v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = objc_msgSend(v11, "numberOfItemsInSection:", -[NSIndexPath section](v10, "section")),
          uint64_t v13 = [(NSIndexPath *)v10 row],
          v11,
          v12 > v13))
    {
      double v14 = [(TUICandidateGrid *)self collectionView];
      [v14 selectItemAtIndexPath:v10 animated:v6 scrollPosition:a5];

      double v15 = [(TUICandidateGrid *)self collectionView];
      double v16 = [v15 layoutAttributesForItemAtIndexPath:v10];

      [v16 frame];
      [(TUICandidateGrid *)self setSelectedRowY:v17];
    }
    else
    {
      double v18 = [(TUICandidateGrid *)self collectionView];
      double v19 = [v18 indexPathsForSelectedItems];
      double v16 = [v19 firstObject];

      if (v16)
      {
        uint64_t v20 = [(TUICandidateGrid *)self collectionView];
        [v20 deselectItemAtIndexPath:v16 animated:0];
      }
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__TUICandidateGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke;
    v22[3] = &unk_1E55941A8;
    void v22[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v22];
    double v21 = [(TUICandidateGrid *)self delegate];
    [v21 candidateGridSelectionDidChange:self];

    [(TUICandidateGrid *)self didMoveHighlightFrame];
  }
}

uint64_t __65__TUICandidateGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) forceUpdateVisibleCells];
  v2 = *(void **)(a1 + 32);
  return [v2 updateSelectedRowHighlightView];
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (id)lastIndexPath
{
  double v3 = [(TUICandidateGrid *)self candidateGroups];
  if (![v3 count])
  {
    double v15 = 0;
    goto LABEL_5;
  }
  id v4 = [(TUICandidateGrid *)self candidateGroups];
  BOOL v5 = [(TUICandidateGrid *)self candidateGroups];
  BOOL v6 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
  unint64_t v7 = [v6 candidates];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28D58];
    double v3 = [(TUICandidateGrid *)self candidateGroups];
    double v10 = [(TUICandidateGrid *)self candidateGroups];
    unint64_t v11 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
    uint64_t v12 = [v11 candidates];
    uint64_t v13 = [v12 count] - 1;
    double v14 = [(TUICandidateGrid *)self candidateGroups];
    double v15 = objc_msgSend(v9, "indexPathForRow:inSection:", v13, objc_msgSend(v14, "count") - 1);

LABEL_5:
    goto LABEL_7;
  }
  double v15 = 0;
LABEL_7:
  return v15;
}

- (NSIndexPath)firstIndexPath
{
  double v3 = [(TUICandidateGrid *)self candidateGroups];
  if (![v3 count])
  {

    goto LABEL_10;
  }
  id v4 = [(TUICandidateGrid *)self candidateGroups];
  BOOL v5 = [v4 objectAtIndexedSubscript:0];
  BOOL v6 = [v5 candidates];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
LABEL_10:
    double v19 = 0;
    goto LABEL_11;
  }
  unint64_t v8 = [(TUICandidateGrid *)self numberOfTransliterationCandidatesInSection:0];
  uint64_t v9 = [(TUICandidateGrid *)self style];
  int v10 = [v9 skipInlineCandidate];

  if (v10)
  {
    unint64_t v11 = [(TUICandidateGrid *)self candidateGroups];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 candidates];
    unint64_t v14 = [v13 count];

    if (v8 < v14)
    {
      double v15 = [(TUICandidateGrid *)self candidateGroups];
      double v16 = [v15 objectAtIndexedSubscript:0];
      double v17 = [v16 candidates];
      double v18 = [v17 objectAtIndexedSubscript:v8];

      if (objc_opt_respondsToSelector()) {
        v8 += [v18 isInlineCandidate];
      }
    }
  }
  double v19 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:0];
LABEL_11:
  return (NSIndexPath *)v19;
}

- (void)updateCollectionViewFrameForArrowButton
{
  [(TUICandidateGrid *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(TUICandidateGrid *)self isArrowButtonVisible])
  {
    [(TUICandidateGrid *)self arrowButtonSize];
    double v8 = v8 - v11;
  }
  id v17 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [(TUICandidateGrid *)self style];
    if ([v12 shouldUpdateCollectionViewWidthForArrowButtonVisibility])
    {
      uint64_t v13 = [(TUICandidateGrid *)self collectionView];
      [v13 frame];
      double v15 = v14;

      if (v8 == v15) {
        return;
      }
      double v16 = [(TUICandidateGrid *)self collectionView];
      objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

      id v17 = [(TUICandidateGrid *)self collectionView];
      [v17 layoutIfNeeded];
    }
    else
    {
    }
  }
}

- (void)setIsArrowButtonVisible:(BOOL)a3
{
  self->_isArrowButtonVisible = a3;
  [(TUICandidateGrid *)self updateCollectionViewFrameForArrowButton];
}

- (CGSize)contentSize
{
  double v3 = [(TUICandidateGrid *)self collectionView];
  [v3 contentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(TUICandidateGrid *)self firstIndexPath];
  double v9 = (double)[v8 row];
  double v10 = [(TUICandidateGrid *)self style];
  [v10 rowHeight];
  double v12 = v11 * v9;

  double v13 = 0.0;
  if (v12 < v7) {
    double v13 = v12;
  }
  double v14 = v7 - v13;
  double v15 = v5;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (unint64_t)extraCandidatesCount
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v3 = [(TUICandidateGrid *)self candidateGroups];
  double v4 = [v3 firstObject];
  double v5 = [v4 candidates];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 += [v12 isAutofillExtraCandidate];
        v8 += [v12 isWritingToolsButtonCandidate];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }

  double v13 = [(TUICandidateGrid *)self style];
  uint64_t v14 = [v13 maxNumberOfProactiveCells];

  return ((v8 - v14) & ~((v8 - v14) >> 63)) + v9;
}

- (unint64_t)slottedCandidatesCount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v3 = [(TUICandidateGrid *)self candidateGroups];
  double v4 = [v3 firstObject];
  double v5 = [v4 candidates];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 isSlottedCandidate]
          && ([v11 isAutofillExtraCandidate] & 1) == 0)
        {
          v8 += [v11 isStickerCandidate] ^ 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  if (![(TUICandidateGrid *)self rowType])
  {
    double v12 = [(TUICandidateGrid *)self style];
    unint64_t v13 = [v12 maxNumberOfProactiveCells];

    if (v8 >= v13) {
      return v13;
    }
  }
  return v8;
}

- (BOOL)showingSlottedCandidates
{
  unint64_t v3 = [(TUICandidateGrid *)self slottedCandidatesCount];
  return v3 + [(TUICandidateGrid *)self extraCandidatesCount] != 0;
}

- (id)candidateAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(TUICandidateGrid *)self indexPathIsValid:v4])
  {
    double v5 = [(TUICandidateGrid *)self candidateGroups];
    uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    uint64_t v7 = [v6 candidates];
    unint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)scrollToTop
{
  unint64_t v3 = [(TUICandidateGrid *)self collectionView];
  [v3 setShowsVerticalScrollIndicator:0];

  id v4 = [(TUICandidateGrid *)self style];
  uint64_t v5 = [v4 layoutOrientation];

  if (v5 == 1)
  {
    uint64_t v6 = [(TUICandidateGrid *)self collectionView];
    [v6 contentSize];
    double v8 = v7 + -1.0;
    double v9 = 1.0;
  }
  else
  {
    double v9 = 1.0;
    double v8 = 0.0;
  }
  uint64_t v10 = [(TUICandidateGrid *)self collectionView];
  objc_msgSend(v10, "scrollRectToVisible:animated:", 0, v8, 0.0, v9, v9);

  id v11 = [(TUICandidateGrid *)self collectionView];
  [v11 setShowsVerticalScrollIndicator:1];
}

- (double)rowHeight
{
  unint64_t v3 = [(TUICandidateGrid *)self style];
  [v3 rowHeight];
  double v5 = v4;

  [(TUICandidateGrid *)self maximumRowHeight];
  if (v5 >= v6) {
    double v6 = v5;
  }
  [(TUICandidateGrid *)self setMaximumRowHeight:v6];
  double v7 = [(TUICandidateGrid *)self style];
  [v7 rowHeight];
  double v9 = v8;

  return v9;
}

- (void)updateBounce
{
  int64_t v3 = [(TUICandidateGrid *)self rowType];
  if (v3 == 1)
  {
    id v6 = [(TUICandidateGrid *)self style];
    BOOL v4 = [v6 layoutOrientation] == 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  double v5 = [(TUICandidateGrid *)self collectionView];
  [v5 setAlwaysBounceVertical:v4];

  if (v3 == 1)
  {
  }
}

- (void)updateContentInset
{
  int64_t v3 = [(TUICandidateGrid *)self collectionView];
  [v3 contentInset];

  double v4 = 0.0;
  double Height = 0.0;
  if ([(TUICandidateGrid *)self rowType])
  {
    id v6 = [(TUICandidateGrid *)self customHeader];
    [v6 frame];
    double Height = CGRectGetHeight(v49);
  }
  double v7 = [(TUICandidateGrid *)self collectionView];
  [v7 contentSize];
  double v9 = v8;
  double v11 = v10;

  double v12 = [(TUICandidateGrid *)self style];
  uint64_t v13 = [v12 layoutOrientation];

  uint64_t v14 = [(TUICandidateGrid *)self style];
  [v14 rowHeight];
  double v16 = v15;
  long long v17 = [(TUICandidateGrid *)self firstIndexPath];
  double v18 = (double)[v17 row];

  double v19 = v11 - v16 * v18;
  if (v13) {
    double v20 = v9 - v16 * v18;
  }
  else {
    double v20 = v9;
  }
  if (v13) {
    double v21 = v11;
  }
  else {
    double v21 = v19;
  }
  if ([(TUICandidateGrid *)self rowType] == 1)
  {
    double v22 = [(TUICandidateGrid *)self collectionView];
    [v22 bounds];
    double v24 = v23;

    if (v21 < v24)
    {
      BOOL v25 = [(TUICandidateGrid *)self collectionView];
      [v25 bounds];
      double v4 = v26 - v21;
    }
  }
  double v27 = 0.0;
  if ([(TUICandidateGrid *)self rowType] == 1)
  {
    id v28 = [(TUICandidateGrid *)self style];
    if ([v28 layoutOrientation] == 1)
    {
      uint64_t v29 = [(TUICandidateGrid *)self collectionView];
      [v29 bounds];
      double v31 = v30;

      if (v20 >= v31) {
        goto LABEL_17;
      }
      id v28 = [(TUICandidateGrid *)self collectionView];
      [v28 bounds];
      double v27 = v32 - v20;
    }
  }
LABEL_17:
  CGFloat v33 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v34 = [(TUICandidateGrid *)self style];
    char v35 = [v34 shouldUpdateCollectionViewWidthForArrowButtonVisibility];
  }
  else
  {
    char v35 = 0;
  }

  double v36 = 0.0;
  if (![(TUICandidateGrid *)self rowType])
  {
    [(TUICandidateGrid *)self bounds];
    char v38 = v9 <= v37 ? 1 : v35;
    if ((v38 & 1) == 0)
    {
      [(TUICandidateGrid *)self arrowButtonSize];
      double v36 = v39;
    }
  }
  double v40 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    [(TUICandidateGrid *)self bounds];
    double v42 = v41;

    if (v9 <= v42) {
      goto LABEL_30;
    }
    double v40 = [(TUICandidateGrid *)self style];
    [v40 widthOfGridGradient];
    double v36 = v36 + v43;
  }

LABEL_30:
  CGRect v44 = [(TUICandidateGrid *)self collectionView];
  objc_msgSend(v44, "setContentInset:", Height, v27, v4, v36);

  if ([(TUICandidateGrid *)self rowType])
  {
    [(TUICandidateGrid *)self arrowButtonSize];
    double v46 = v45;
  }
  else
  {
    double v46 = 0.0;
  }
  id v47 = [(TUICandidateGrid *)self collectionView];
  objc_msgSend(v47, "setVerticalScrollIndicatorInsets:", v46, 0.0, 0.0, 0.0);
}

- (UIEdgeInsets)safeAreaInsets
{
  int64_t v3 = [(TUICandidateGrid *)self window];
  [v3 bounds];
  double MaxY = CGRectGetMaxY(v17);
  double v5 = [(TUICandidateGrid *)self window];
  [(TUICandidateGrid *)self bounds];
  objc_msgSend(v5, "convertRect:fromView:", self);
  double v6 = MaxY - CGRectGetMaxY(v18);

  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v10 = [(TUICandidateGrid *)self window];
  [v10 safeAreaInsets];
  double v12 = fmax(v11 - fmax(v6, 0.0), 0.0);

  double v13 = v7;
  double v14 = v8;
  double v15 = v12;
  double v16 = v9;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setCustomHeader:(id)a3
{
  double v5 = (UIView *)a3;
  p_customHeader = &self->_customHeader;
  double v14 = v5;
  if (self->_customHeader != v5)
  {
    objc_storeStrong((id *)p_customHeader, a3);
    p_customHeader = (UIView **)[(TUICandidateGrid *)self updateContentInset];
    double v5 = v14;
  }
  if (v5)
  {
    p_customHeader = [(TUICandidateGrid *)self rowType];
    double v5 = v14;
    if (p_customHeader == (UIView **)1)
    {
      double v7 = [(TUICandidateGrid *)self customHeader];
      [v7 frame];
      double Height = CGRectGetHeight(v16);
      double v9 = [(TUICandidateGrid *)self collectionViewLayout];
      [v9 setCustomHeaderHeight:Height];

      double v10 = [(TUICandidateGrid *)self collectionViewLayout];
      [v10 invalidateLayout];

      double v11 = [(TUICandidateGrid *)self collectionView];
      double v12 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      double v13 = [v11 supplementaryViewForElementKind:@"CustomHeader" atIndexPath:v12];
      [v13 addSubview:v14];

      double v5 = v14;
    }
  }
  MEMORY[0x1F41817F8](p_customHeader, v5);
}

- (void)setCandidateNumberEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_candidateNumberEnabled = a3;
  id v4 = [(TUICandidateGrid *)self collectionViewLayout];
  [v4 setCandidateNumberEnabled:v3];
}

- (void)setRowType:(int64_t)a3 options:(unint64_t)a4 style:(id)a5 animated:(BOOL)a6 animator:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  if (self->_rowType == a3)
  {
    [(TUICandidateGrid *)self setStyle:v13];
  }
  else
  {
    self->_rowType = a3;
    CGRect v16 = [(TUICandidateGrid *)self style];

    if (!v16) {
      [(TUICandidateGrid *)self setStyle:v13];
    }
    objc_initWeak(location, self->_collectionView);
    [(TUICandidateGrid *)self updateBounce];
    id WeakRetained = objc_loadWeakRetained(location);
    CGRect v18 = [WeakRetained indexPathsForVisibleItems];
    double v19 = [v18 valueForKeyPath:@"@min.self"];
    [(TUICandidateGrid *)self setFirstVisibleIndexPath:v19];

    if (!a3) {
      [(TUICandidateGrid *)self setLastUserSelectedCursorX:0.0];
    }
    if (v10)
    {
      double v20 = [(TUICandidateGrid *)self collectionView];
      [v20 setShowsVerticalScrollIndicator:0];

      [(TUICandidateGrid *)self setAnimating:1];
      [(TUICandidateGrid *)self setStylePending:v13];
      id v21 = objc_loadWeakRetained(location);
      double v22 = [(TUICandidateGrid *)self firstVisibleIndexPath];
      double v23 = [v21 layoutAttributesForItemAtIndexPath:v22];

      if (a3 == 1)
      {
        id v24 = v13;
      }
      else
      {
        id v24 = [(TUICandidateGrid *)self style];
      }
      id v28 = v24;
      uint64_t v29 = objc_alloc_init(TUICandidateLayout);
      [(TUICandidateLayout *)v29 setRowType:1];
      [(TUICandidateLayout *)v29 setCandidateNumberEnabled:[(TUICandidateGrid *)self candidateNumberEnabled]];
      [(TUICandidateLayout *)v29 setTransitionState:1];
      double v30 = [(TUICandidateGrid *)self firstVisibleIndexPath];
      [(TUICandidateLayout *)v29 setOldFirstVisibleIndexPath:v30];

      [v23 frame];
      double MinX = CGRectGetMinX(v64);
      double v32 = [(TUICandidateGrid *)self collectionView];
      [v32 contentOffset];
      [(TUICandidateLayout *)v29 setOldFirstVisibleOffset:MinX - v33];

      if (objc_opt_respondsToSelector()) {
        uint64_t v34 = [v28 shouldJustifyRow];
      }
      else {
        uint64_t v34 = 0;
      }
      [(TUICandidateLayout *)v29 setShouldJustifyRow:v34];
      -[TUICandidateLayout setColumnsCount:](v29, "setColumnsCount:", [v28 columnsCount]);
      -[TUICandidateLayout setLayoutOrientation:](v29, "setLayoutOrientation:", [v28 layoutOrientation]);
      [v28 gridPadding];
      -[TUICandidateLayout setGridPadding:](v29, "setGridPadding:");
      [v28 gridLinePadding];
      -[TUICandidateLayout setGridLinePadding:](v29, "setGridLinePadding:");
      char v35 = objc_opt_respondsToSelector();
      double v36 = 0.0;
      double v37 = 0.0;
      if (v35) {
        objc_msgSend(v28, "interRowSpacing", 0.0);
      }
      [(TUICandidateLayout *)v29 setInterRowSpacing:v37];
      if (objc_opt_respondsToSelector())
      {
        [v28 slottedCandidatesIterItemSpacing];
        double v36 = v38;
      }
      [(TUICandidateLayout *)v29 setSlottedCandidatesIterItemSpacing:v36];
      if (objc_opt_respondsToSelector()) {
        uint64_t v39 = [v28 hideSlottedCellSeparators];
      }
      else {
        uint64_t v39 = 0;
      }
      [(TUICandidateLayout *)v29 setHideSlottedCellSeparators:v39];
      [v28 gridLineOffset];
      -[TUICandidateLayout setGridLineOffset:](v29, "setGridLineOffset:");
      if (a3 == 1)
      {
        double v40 = [(TUICandidateGrid *)self stylePending];
        [(TUICandidateGrid *)self setStyle:v40 reload:0];

        id v41 = objc_loadWeakRetained(location);
        [v41 setCollectionViewLayout:v29 animated:0];

        id v42 = objc_loadWeakRetained(location);
        [v42 layoutIfNeeded];

        [(TUICandidateGrid *)self forceUpdateVisibleCells];
        double v43 = [(TUICandidateGrid *)self firstVisibleIndexPath];
        BOOL v44 = [(TUICandidateGrid *)self indexPathIsValid:v43];

        if (v44)
        {
          double v45 = [(TUICandidateGrid *)self firstVisibleIndexPath];
          [(TUICandidateGrid *)self scrollToCandidateAtIndexPath:v45 animated:0];
        }
        double v46 = (void *)[(TUICandidateLayout *)v29 copy];
        [v46 setTransitionState:2];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke;
        v60[3] = &unk_1E5593FF8;
        objc_copyWeak(&v62, location);
        id v61 = v46;
        id v47 = v46;
        [v14 addAnimations:v60];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_2;
        v57[3] = &unk_1E5593C30;
        objc_copyWeak(&v59, location);
        v57[4] = self;
        id v58 = v15;
        [v14 addCompletion:v57];

        objc_destroyWeak(&v59);
        objc_destroyWeak(&v62);
      }
      else
      {
        uint64_t v48 = (void *)[(TUICandidateLayout *)v29 copy];
        [v48 setTransitionState:2];
        id v49 = objc_loadWeakRetained(location);
        [v49 setCollectionViewLayout:v48 animated:0];

        id v50 = objc_loadWeakRetained(location);
        [v50 layoutIfNeeded];

        [(TUICandidateGrid *)self forceUpdateVisibleCells];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_3;
        v54[3] = &unk_1E5593FF8;
        objc_copyWeak(&v56, location);
        double v55 = v29;
        [v14 addAnimations:v54];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_4;
        v51[3] = &unk_1E5593C30;
        v51[4] = self;
        objc_copyWeak(&v53, location);
        id v52 = v15;
        [v14 addCompletion:v51];

        objc_destroyWeak(&v53);
        objc_destroyWeak(&v56);
      }
    }
    else
    {
      [(TUICandidateGrid *)self setStyle:v13];
      id v25 = objc_loadWeakRetained(location);
      double v26 = [(TUICandidateGrid *)self collectionViewLayout];
      [v25 setCollectionViewLayout:v26];

      [(TUICandidateGrid *)self updateGradientLayerToCollectionView];
      double v27 = [(TUICandidateGrid *)self firstVisibleIndexPath];
      [(TUICandidateGrid *)self scrollToCandidateAtIndexPath:v27 animated:0];

      [(TUICandidateGrid *)self setFirstVisibleIndexPath:0];
      if (v15) {
        (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
      }
    }
    objc_destroyWeak(location);
  }
}

void __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCollectionViewLayout:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 layoutIfNeeded];
}

uint64_t __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) collectionViewLayout];
  [WeakRetained setCollectionViewLayout:v4];

  [*(id *)(a1 + 32) updateGradientLayerToCollectionView];
  id v5 = objc_loadWeakRetained(v2);
  [v5 setShowsVerticalScrollIndicator:1];

  [*(id *)(a1 + 32) setFirstVisibleIndexPath:0];
  [*(id *)(a1 + 32) setAnimating:0];
  double v6 = [*(id *)(a1 + 32) stylePending];

  if (v6)
  {
    double v7 = [*(id *)(a1 + 32) stylePending];
    [*(id *)(a1 + 32) setStyle:v7];
  }
  [*(id *)(a1 + 32) setStylePending:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

void __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCollectionViewLayout:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 layoutIfNeeded];
}

uint64_t __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 stylePending];
  [v2 setStyle:v3 reload:0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [*(id *)(a1 + 32) collectionViewLayout];
  [WeakRetained setCollectionViewLayout:v5 animated:0];

  [*(id *)(a1 + 32) updateGradientLayerToCollectionView];
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 setShowsVerticalScrollIndicator:1];

  double v7 = *(void **)(a1 + 32);
  double v8 = [v7 firstVisibleIndexPath];
  LODWORD(v7) = [v7 indexPathIsValid:v8];

  if (v7)
  {
    double v9 = *(void **)(a1 + 32);
    BOOL v10 = [v9 firstVisibleIndexPath];
    [v9 scrollToCandidateAtIndexPath:v10 animated:0];
  }
  [*(id *)(a1 + 32) setFirstVisibleIndexPath:0];
  [*(id *)(a1 + 32) setAnimating:0];
  [*(id *)(a1 + 32) setStylePending:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

- (void)setRowType:(int64_t)a3 options:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  if (a5)
  {
    double v9 = (objc_class *)MEMORY[0x1E4FB1ED8];
    id v10 = a6;
    id v13 = (id)[[v9 alloc] initWithDuration:(a4 >> 16) & 7 curve:&__block_literal_global_37 animations:0.25];
    double v11 = [(TUICandidateGrid *)self style];
    [(TUICandidateGrid *)self setRowType:a3 options:a4 style:v11 animated:1 animator:v13 completion:v10];

    [v13 startAnimation];
  }
  else
  {
    id v12 = a6;
    id v13 = [(TUICandidateGrid *)self style];
    -[TUICandidateGrid setRowType:options:style:animated:animator:completion:](self, "setRowType:options:style:animated:animator:completion:", a3, a4);
  }
}

- (void)setRowType:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setRowType:(int64_t)a3
{
}

- (void)setStyle:(id)a3 reload:(BOOL)a4
{
  int v4 = a4;
  id v5 = a3;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  p_style = &self->_style;
  if ([(TUICandidateViewStyle *)self->_style isEqual:v7]) {
    goto LABEL_44;
  }
  double v9 = [(TUICandidateViewStyle *)*p_style backgroundColor];
  id v10 = [v7 backgroundColor];
  if (v9 == v10)
  {
LABEL_5:
    id v136 = v5;
    id v13 = [(TUICandidateViewStyle *)*p_style lineColor];
    id v14 = [v7 lineColor];
    if (v13 == v14)
    {
      int v17 = 0;
    }
    else
    {
      [(TUICandidateViewStyle *)*p_style lineColor];
      id v15 = v133 = v4;
      CGRect v16 = [v7 lineColor];
      int v17 = [v15 isEqual:v16] ^ 1;

      int v4 = v133;
    }

    id v12 = v134;
    double v11 = v135;
    int v18 = v17;
    id v5 = v136;
    if (v9 == v10) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double v11 = [(TUICandidateViewStyle *)*p_style backgroundColor];
  id v12 = [v7 backgroundColor];
  if ([v11 isEqual:v12])
  {
    v134 = v12;
    v135 = v11;
    goto LABEL_5;
  }
  int v18 = 1;
LABEL_10:

LABEL_11:
  int v19 = [(TUICandidateViewStyle *)*p_style hidesPartialCandidates];
  int v20 = [v7 hidesPartialCandidates];
  if (v4) {
    int v4 = v18 | v19 ^ v20;
  }
  if (*p_style)
  {
    int v21 = [(TUICandidateViewStyle *)*p_style showsIndex];
    int v22 = v21 ^ [v7 showsIndex];
  }
  else
  {
    int v22 = 1;
  }
  objc_storeStrong((id *)&self->_style, v5);
  double v23 = [v7 gridBackgroundColor];
  [v7 backgroundOpacity];
  if (v24 < 1.0)
  {
    double v141 = 0.0;
    [v23 getRed:0 green:0 blue:0 alpha:&v141];
    double v25 = v141;
    [v7 backgroundOpacity];
    uint64_t v27 = [v23 colorWithAlphaComponent:v25 * v26];

    double v23 = (void *)v27;
  }
  [(TUICandidateGrid *)self setBackgroundColor:v23];
  id v28 = [v7 textColor];
  uint64_t v29 = [(TUICandidateGrid *)self collectionView];
  [v29 setTintColor:v28];

  [v7 cornerRadius];
  -[TUICandidateGrid _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  uint64_t v30 = [v7 gridMaskedCorners];
  double v31 = [(TUICandidateGrid *)self layer];
  [v31 setMaskedCorners:v30];

  double v32 = [v7 highlightedRowBackgroundColor];
  double v33 = [(TUICandidateGrid *)self selectedRowHighlightView];
  [v33 setBackgroundColor:v32];

  if ([v7 scrollDisabled]) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = [v7 dragGestureDisabled] ^ 1;
  }
  char v35 = [(TUICandidateGrid *)self collectionView];
  [v35 setScrollEnabled:v34];

  [v7 foregroundOpacity];
  double v37 = v36;
  double v38 = [(TUICandidateGrid *)self collectionView];
  [v38 setAlpha:v37];

  [v7 gridPadding];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  id v47 = [(TUICandidateGrid *)self singleRowLayout];
  objc_msgSend(v47, "setGridPadding:", v40, v42, v44, v46);

  [v7 gridLinePadding];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  id v56 = [(TUICandidateGrid *)self singleRowLayout];
  objc_msgSend(v56, "setGridLinePadding:", v49, v51, v53, v55);

  [v7 gridLineOffset];
  double v58 = v57;
  double v60 = v59;
  id v61 = [(TUICandidateGrid *)self singleRowLayout];
  objc_msgSend(v61, "setGridLineOffset:", v58, v60);

  uint64_t v62 = [v7 layoutOrientation];
  v63 = [(TUICandidateGrid *)self singleRowLayout];
  [v63 setLayoutOrientation:v62];

  uint64_t v64 = [v7 showsIndex];
  v65 = [(TUICandidateGrid *)self singleRowLayout];
  [v65 setShowsIndex:v64];

  uint64_t v66 = [(TUICandidateGrid *)self style];
  uint64_t v67 = [v66 showExtraLineBeforeFirstRow];
  uint64_t v68 = [(TUICandidateGrid *)self singleRowLayout];
  [v68 setShowExtraLineBeforeFirstRow:v67];

  uint64_t v69 = [v7 fillGridWithLines];
  v70 = [(TUICandidateGrid *)self singleRowLayout];
  [v70 setFillGridWithLines:v69];

  [v7 gridPadding];
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  double v79 = [(TUICandidateGrid *)self multiRowLayout];
  objc_msgSend(v79, "setGridPadding:", v72, v74, v76, v78);

  [v7 gridLinePadding];
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  v88 = [(TUICandidateGrid *)self multiRowLayout];
  objc_msgSend(v88, "setGridLinePadding:", v81, v83, v85, v87);

  double v89 = 0.0;
  double v90 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v7 interRowSpacing];
    double v90 = v91;
  }
  CGFloat v92 = [(TUICandidateGrid *)self multiRowLayout];
  [v92 setInterRowSpacing:v90];

  if (objc_opt_respondsToSelector())
  {
    [v7 slottedCandidatesIterItemSpacing];
    double v89 = v93;
  }
  long long v94 = [(TUICandidateGrid *)self multiRowLayout];
  [v94 setSlottedCandidatesIterItemSpacing:v89];

  if (objc_opt_respondsToSelector()) {
    uint64_t v95 = [v7 hideSlottedCellSeparators];
  }
  else {
    uint64_t v95 = 0;
  }
  long long v96 = [(TUICandidateGrid *)self multiRowLayout];
  [v96 setHideSlottedCellSeparators:v95];

  [v7 gridLineOffset];
  double v98 = v97;
  double v100 = v99;
  long long v101 = [(TUICandidateGrid *)self multiRowLayout];
  objc_msgSend(v101, "setGridLineOffset:", v98, v100);

  [v7 minimumInterItemSpacing];
  double v103 = v102;
  uint64_t v104 = [(TUICandidateGrid *)self multiRowLayout];
  [v104 setMinimumInterItemSpacing:v103];

  uint64_t v105 = [v7 layoutOrientation];
  CGRect v106 = [(TUICandidateGrid *)self multiRowLayout];
  [v106 setLayoutOrientation:v105];

  if (objc_opt_respondsToSelector()) {
    uint64_t v107 = [v7 shouldJustifyRow];
  }
  else {
    uint64_t v107 = 0;
  }
  CGRect v108 = [(TUICandidateGrid *)self multiRowLayout];
  [v108 setShouldJustifyRow:v107];

  uint64_t v109 = [v7 columnsCount];
  CGRect v110 = [(TUICandidateGrid *)self multiRowLayout];
  [v110 setColumnsCount:v109];

  uint64_t v111 = [v7 showsIndex];
  CGRect v112 = [(TUICandidateGrid *)self multiRowLayout];
  [v112 setShowsIndex:v111];

  CGRect v113 = [(TUICandidateGrid *)self style];
  uint64_t v114 = [v113 showExtraLineBeforeFirstRow];
  v115 = [(TUICandidateGrid *)self multiRowLayout];
  [v115 setShowExtraLineBeforeFirstRow:v114];

  uint64_t v116 = [v7 fillGridWithLines];
  v117 = [(TUICandidateGrid *)self multiRowLayout];
  [v117 setFillGridWithLines:v116];

  [v7 singleSlottedCellMargin];
  double v119 = v118;
  v120 = [(TUICandidateGrid *)self singleRowLayout];
  [v120 setSingleSlottedCellMargin:v119];

  [v7 minimumInterItemSpacing];
  double v122 = v121;
  v123 = [(TUICandidateGrid *)self singleRowLayout];
  [v123 setMinimumInterItemSpacing:v122];

  v124 = [(TUICandidateGrid *)self style];
  -[TUICandidateGrid setClipsToBounds:](self, "setClipsToBounds:", [v124 doNotClipToBounds] ^ 1);

  [(TUICandidateGrid *)self updateBounce];
  if (v4)
  {
    v125 = [(TUICandidateGrid *)self collectionView];
    [v125 reloadData];
  }
  else
  {
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    v126 = [(TUICandidateGrid *)self collectionView];
    v127 = [v126 visibleCells];

    uint64_t v128 = [v127 countByEnumeratingWithState:&v137 objects:v142 count:16];
    if (v128)
    {
      uint64_t v129 = v128;
      uint64_t v130 = *(void *)v138;
      do
      {
        for (uint64_t i = 0; i != v129; ++i)
        {
          if (*(void *)v138 != v130) {
            objc_enumerationMutation(v127);
          }
          [*(id *)(*((void *)&v137 + 1) + 8 * i) setStyle:v7];
        }
        uint64_t v129 = [v127 countByEnumeratingWithState:&v137 objects:v142 count:16];
      }
      while (v129);
    }

    v125 = [(TUICandidateGrid *)self collectionView];
    v132 = [v125 collectionViewLayout];
    [v132 invalidateLayout];
  }
  if (v22) {
    [(TUICandidateGrid *)self updateIndex];
  }

LABEL_44:
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  if ([(TUICandidateGrid *)self animating]) {
    [(TUICandidateGrid *)self setStylePending:v4];
  }
  else {
    [(TUICandidateGrid *)self setStyle:v4 reload:1];
  }
}

- (void)updateIndex
{
  BOOL v3 = [(TUICandidateGrid *)self collectionView];
  [v3 _reloadSectionIndexTitles];

  id v4 = [(TUICandidateGrid *)self collectionView];
  id v5 = [v4 accessoryViewAtEdge:1];

  id v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  [v5 _removeAllAnimations:0];
  id v7 = [(TUICandidateGrid *)self style];
  if ([v7 showsIndex])
  {
    double v8 = [(TUICandidateGrid *)self collectionView];
    double v9 = [(TUICandidateGrid *)self _sectionIndexTitlesForCollectionView:v8];
    uint64_t v10 = [v9 count];
    BOOL v11 = v10 != 0;
    if (v10) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
  }
  else
  {
    BOOL v11 = 0;
    double v12 = 0.0;
  }

  [v5 alpha];
  if (v12 != v13)
  {
    if (v11)
    {
      [v5 setHidden:0];
      [v5 setAlpha:v12];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __31__TUICandidateGrid_updateIndex__block_invoke;
      v16[3] = &unk_1E55941A8;
      id v17 = v5;
      [v14 performWithoutAnimation:v16];
    }
  }
  id v15 = [(TUICandidateGrid *)self collectionView];
  [v15 setShowsVerticalScrollIndicator:1];
}

uint64_t __31__TUICandidateGrid_updateIndex__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TUICandidateGrid;
  [(TUICandidateGrid *)&v13 layoutSubviews];
  BOOL v3 = [(TUICandidateGrid *)self suppressCollectionViewLayout];
  if (!v3)
  {
    [(TUICandidateGrid *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(TUICandidateGrid *)self collectionView];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    [(TUICandidateGrid *)self updateContentInset];
    [(TUICandidateGrid *)self updateSelectedRowHighlightView];
    [(TUICandidateGrid *)self updateCollectionViewFrameForArrowButton];
  }
  [(TUICandidateGrid *)self setCollectionViewLayoutWasSkipped:v3];
  [(TUICandidateGrid *)self updateGradientLayerToCollectionView];
}

- (void)setSuppressCollectionViewLayout:(BOOL)a3
{
  if (self->_suppressCollectionViewLayout != a3)
  {
    self->_suppressCollectionViewLayout = a3;
    if (!a3)
    {
      if ([(TUICandidateGrid *)self collectionViewLayoutWasSkipped])
      {
        [(TUICandidateGrid *)self setNeedsLayout];
      }
    }
  }
}

- (NSArray)visibleCandidates
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v41 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(TUICandidateGrid *)self collectionView];
  double v4 = [v3 indexPathsForVisibleItems];
  double v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_5195];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        double v12 = [(TUICandidateGrid *)self collectionView];
        objc_super v13 = [v12 cellForItemAtIndexPath:v11];

        id v14 = [v13 window];

        if (v14)
        {
          id v15 = [(TUICandidateGrid *)self window];
          [v13 frame];
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v24 = [(TUICandidateGrid *)self collectionView];
          objc_msgSend(v15, "convertRect:fromView:", v24, v17, v19, v21, v23);
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;

          double v33 = [(TUICandidateGrid *)self window];
          v49.origin.double x = v26;
          v49.origin.double y = v28;
          v49.size.double width = v30;
          v49.size.double height = v32;
          double MinX = CGRectGetMinX(v49);
          v50.origin.double x = v26;
          v50.origin.double y = v28;
          v50.size.double width = v30;
          v50.size.double height = v32;
          char v35 = objc_msgSend(v33, "hitTest:withEvent:", 0, MinX, CGRectGetMidY(v50));

          double v36 = [(TUICandidateGrid *)self window];
          v51.origin.double x = v26;
          v51.origin.double y = v28;
          v51.size.double width = v30;
          v51.size.double height = v32;
          CGFloat v37 = CGRectGetMaxX(v51) + -0.01;
          v52.origin.double x = v26;
          v52.origin.double y = v28;
          v52.size.double width = v30;
          v52.size.double height = v32;
          double v38 = objc_msgSend(v36, "hitTest:withEvent:", 0, v37, CGRectGetMidY(v52));

          if (([v35 isDescendantOfView:v13] & 1) != 0
            || [v38 isDescendantOfView:v13])
          {
            double v39 = [(TUICandidateGrid *)self candidateAtIndexPath:v11];
            if (v39) {
              [v41 addObject:v39];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v8);
  }

  return (NSArray *)v41;
}

uint64_t __37__TUICandidateGrid_visibleCandidates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)scrollToFirstCandidate
{
  id v6 = [(TUICandidateGrid *)self firstIndexPath];
  if (-[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:")
    && ([(TUICandidateGrid *)self collectionView],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 contentOffset],
        double v5 = v4,
        v3,
        v5 >= 0.0))
  {
    [(TUICandidateGrid *)self scrollToCandidateAtIndexPath:v6 animated:0];
  }
  else
  {
    [(TUICandidateGrid *)self scrollToTop];
  }
}

- (void)setCandidateGroups:(id)a3
{
  id v10 = a3;
  uint64_t v5 = [(NSArray *)self->_candidateGroups isEqual:v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_candidateGroups, a3);
    uint64_t v7 = [(TUICandidateGrid *)self collectionView];
    [v7 reloadData];

    [(TUICandidateGrid *)self updateIndex];
    if (self->_selectedIndexPath)
    {
      uint64_t v8 = [(TUICandidateGrid *)self collectionView];
      [v8 deselectItemAtIndexPath:self->_selectedIndexPath animated:0];

      selectedIndexPath = self->_selectedIndexPath;
      self->_selectedIndexPath = 0;

      [(TUICandidateGrid *)self didMoveHighlightFrame];
    }
    self->_lastUserSelectedCursorX = 0.0;
    [(TUICandidateGrid *)self updateSelectedRowHighlightView];
    uint64_t v5 = [(TUICandidateGrid *)self addAppCandidatesRenderSignposts];
    id v6 = v10;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (TUICandidateLayout)multiRowLayout
{
  multiRowLayout = self->_multiRowLayout;
  if (!multiRowLayout)
  {
    double v4 = objc_alloc_init(TUICandidateLayout);
    uint64_t v5 = self->_multiRowLayout;
    self->_multiRowLayout = v4;

    [(TUICandidateLayout *)self->_multiRowLayout setRowType:1];
    multiRowLayout = self->_multiRowLayout;
  }
  return multiRowLayout;
}

- (TUICandidateLayout)singleRowLayout
{
  singleRowLayout = self->_singleRowLayout;
  if (!singleRowLayout)
  {
    double v4 = objc_alloc_init(TUICandidateLayout);
    uint64_t v5 = self->_singleRowLayout;
    self->_singleRowLayout = v4;

    [(TUICandidateLayout *)self->_singleRowLayout setRowType:0];
    singleRowLayout = self->_singleRowLayout;
  }
  return singleRowLayout;
}

- (id)collectionViewLayout
{
  if ([(TUICandidateGrid *)self rowType]) {
    [(TUICandidateGrid *)self multiRowLayout];
  }
  else {
  BOOL v3 = [(TUICandidateGrid *)self singleRowLayout];
  }
  objc_msgSend(v3, "setCandidateNumberEnabled:", -[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled"));
  double v4 = [(TUICandidateGrid *)self customHeader];
  [v4 frame];
  [v3 setCustomHeaderHeight:CGRectGetHeight(v24)];

  uint64_t v5 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(TUICandidateGrid *)self style];
    objc_msgSend(v3, "setShouldJustifyRow:", objc_msgSend(v6, "shouldJustifyRow"));
  }
  else
  {
    [v3 setShouldJustifyRow:0];
  }

  uint64_t v7 = [(TUICandidateGrid *)self style];
  objc_msgSend(v3, "setColumnsCount:", objc_msgSend(v7, "columnsCount"));

  uint64_t v8 = [(TUICandidateGrid *)self style];
  objc_msgSend(v3, "setLayoutOrientation:", objc_msgSend(v8, "layoutOrientation"));

  uint64_t v9 = [(TUICandidateGrid *)self style];
  [v9 gridPadding];
  objc_msgSend(v3, "setGridPadding:");

  id v10 = [(TUICandidateGrid *)self style];
  [v10 gridLinePadding];
  objc_msgSend(v3, "setGridLinePadding:");

  uint64_t v11 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    double v12 = [(TUICandidateGrid *)self style];
    [v12 interRowSpacing];
    objc_msgSend(v3, "setInterRowSpacing:");
  }
  else
  {
    [v3 setInterRowSpacing:0.0];
  }

  objc_super v13 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    id v14 = [(TUICandidateGrid *)self style];
    [v14 slottedCandidatesIterItemSpacing];
    objc_msgSend(v3, "setSlottedCandidatesIterItemSpacing:");
  }
  else
  {
    [v3 setSlottedCandidatesIterItemSpacing:0.0];
  }

  id v15 = [(TUICandidateGrid *)self style];
  if (objc_opt_respondsToSelector())
  {
    double v16 = [(TUICandidateGrid *)self style];
    objc_msgSend(v3, "setHideSlottedCellSeparators:", objc_msgSend(v16, "hideSlottedCellSeparators"));
  }
  else
  {
    [v3 setHideSlottedCellSeparators:0];
  }

  double v17 = [(TUICandidateGrid *)self style];
  [v17 gridLineOffset];
  objc_msgSend(v3, "setGridLineOffset:");

  double v18 = [(TUICandidateGrid *)self style];
  [v18 minimumInterItemSpacing];
  objc_msgSend(v3, "setMinimumInterItemSpacing:");

  double v19 = [(TUICandidateGrid *)self style];
  [v19 singleSlottedCellMargin];
  objc_msgSend(v3, "setSingleSlottedCellMargin:");

  double v20 = [(TUICandidateGrid *)self style];
  objc_msgSend(v3, "setShowExtraLineBeforeFirstRow:", objc_msgSend(v20, "showExtraLineBeforeFirstRow"));

  double v21 = [(TUICandidateGrid *)self style];
  objc_msgSend(v3, "setFillGridWithLines:", objc_msgSend(v21, "fillGridWithLines"));

  return v3;
}

- (UICollectionView)collectionView
{
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    double v4 = [TUICandidateCollectionView alloc];
    [(TUICandidateGrid *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    objc_super v13 = [(TUICandidateGrid *)self collectionViewLayout];
    id v14 = -[TUICandidateCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
    id v15 = self->_collectionView;
    self->_collectionView = v14;

    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setDataSource:self];
    [(UICollectionView *)self->_collectionView setAllowsMultipleSelection:0];
    double v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)self->_collectionView setBackgroundColor:v16];

    [(UICollectionView *)self->_collectionView setDelaysContentTouches:0];
    [(UICollectionView *)self->_collectionView _setAutomaticContentOffsetAdjustmentEnabled:0];
    double v17 = self->_collectionView;
    uint64_t v18 = objc_opt_class();
    double v19 = +[TUICandidateCell reuseIdentifier];
    [(UICollectionView *)v17 registerClass:v18 forCellWithReuseIdentifier:v19];

    double v20 = self->_collectionView;
    uint64_t v21 = objc_opt_class();
    double v22 = +[TUIAutofillExtraCandidateCell reuseIdentifier];
    [(UICollectionView *)v20 registerClass:v21 forCellWithReuseIdentifier:v22];

    double v23 = self->_collectionView;
    uint64_t v24 = objc_opt_class();
    double v25 = +[TUISuggestionCandidateCell reuseIdentifier];
    [(UICollectionView *)v23 registerClass:v24 forCellWithReuseIdentifier:v25];

    CGFloat v26 = self->_collectionView;
    uint64_t v27 = objc_opt_class();
    CGFloat v28 = +[TUIWritingToolCandidateCell reuseIdentifier];
    [(UICollectionView *)v26 registerClass:v27 forCellWithReuseIdentifier:v28];

    double v29 = self->_collectionView;
    uint64_t v30 = objc_opt_class();
    double v31 = +[TUIProactiveCandidateCell reuseIdentifier];
    [(UICollectionView *)v29 registerClass:v30 forCellWithReuseIdentifier:v31];

    CGFloat v32 = self->_collectionView;
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = +[TUICandidateLine reuseIdentifier];
    [(UICollectionView *)v32 registerClass:v33 forSupplementaryViewOfKind:@"Line" withReuseIdentifier:v34];

    char v35 = self->_collectionView;
    uint64_t v36 = objc_opt_class();
    CGFloat v37 = +[TUICandidateSlottedSeparator reuseIdentifier];
    [(UICollectionView *)v35 registerClass:v36 forSupplementaryViewOfKind:@"SlottedCellSeparator" withReuseIdentifier:v37];

    double v38 = self->_collectionView;
    uint64_t v39 = objc_opt_class();
    double v40 = +[TUICandidateGroupHeader reuseIdentifier];
    [(UICollectionView *)v38 registerClass:v39 forSupplementaryViewOfKind:@"GroupHeader" withReuseIdentifier:v40];

    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"CustomHeader" withReuseIdentifier:@"CustomHeader"];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"DummyCandidate" withReuseIdentifier:@"DummyCandidate"];
    [(TUICandidateGrid *)self addSubview:self->_collectionView];
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (TUICandidateGrid)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGrid;
  BOOL v3 = [(TUICandidateGrid *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(TUICandidateGrid *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateGrid)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGrid;
  BOOL v3 = -[TUICandidateGrid initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(TUICandidateGrid *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  [(TUICandidateGrid *)self setRowType:0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(TUICandidateGrid *)self setSelectedRowHighlightView:v4];

  double v5 = [(TUICandidateGrid *)self selectedRowHighlightView];
  objc_super v6 = [v5 layer];
  [v6 setZPosition:-1.0];

  double v7 = [(TUICandidateGrid *)self selectedRowHighlightView];
  [v7 setUserInteractionEnabled:0];

  id v9 = [(TUICandidateGrid *)self collectionView];
  double v8 = [(TUICandidateGrid *)self selectedRowHighlightView];
  [v9 insertSubview:v8 atIndex:0];
}

+ (BOOL)isSafariPasswordSuggestionCandidate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 isWritingToolsButtonCandidate] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)isWritingToolSuggestionCandidate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isWritingToolsButtonCandidate];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end