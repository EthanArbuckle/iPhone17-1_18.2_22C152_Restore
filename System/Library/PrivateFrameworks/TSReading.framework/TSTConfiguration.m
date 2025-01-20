@interface TSTConfiguration
+ (id)sharedTableConfiguration;
+ (void)resetSharedTableConfiguration;
- (BOOL)allowFreeformFormulaText;
- (BOOL)allowHorizontalAutoresize;
- (BOOL)allowWhitespaceInFormulas;
- (BOOL)allowsFullyFilteredTables;
- (BOOL)arrowKeyAtEdgeWhileEditingNavigates;
- (BOOL)arrowKeysNavigateWhenEditingBeganByTyping;
- (BOOL)arrowKeysWrap;
- (BOOL)backTabWraps;
- (BOOL)beginEditingOnSingleTap;
- (BOOL)cellEditorsCanScrollToNonLocalTableSelection;
- (BOOL)cornersCanDragResize;
- (BOOL)createLargeDefaultTables;
- (BOOL)disableImplicitNaming;
- (BOOL)dragByHandleOnly;
- (BOOL)exportPermanentHidingState;
- (BOOL)exportsCellAnnotations;
- (BOOL)exportsCellComments;
- (BOOL)formulaCellEditorSupportsTextTokenEditor;
- (BOOL)formulaEditorEvaluatesFormulas;
- (BOOL)formulaEqualsTokenIsSelectable;
- (BOOL)hasLargerFonts;
- (BOOL)headersFrozenByDefault;
- (BOOL)pasteFilterHidingAsUserHiding;
- (BOOL)pastesTile;
- (BOOL)requireMatchedFunctionTokens;
- (BOOL)returnWhileEditingNavigates;
- (BOOL)selectionUsesBezierPath;
- (BOOL)selectsCellOnInitialTap;
- (BOOL)showReferenceHighlightsOnFormulaCellSelection;
- (BOOL)showsAddressBarAlways;
- (BOOL)showsAddressBarHighlights;
- (BOOL)showsAddressBarLetteringAndNumbering;
- (BOOL)showsCellOverflowIndicator;
- (BOOL)showsHideUnhideUI;
- (BOOL)supportsAutoResizedTables;
- (BOOL)supportsAutofill;
- (BOOL)supportsCanvasReferenceEditing;
- (BOOL)supportsComplexFilterUI;
- (BOOL)supportsContainedTextEditing;
- (BOOL)supportsControlCells;
- (BOOL)supportsCreateChartFromSelection;
- (BOOL)supportsDragDropMoveMode;
- (BOOL)supportsFormulaEditing;
- (BOOL)supportsFrozenHeaders;
- (BOOL)supportsHiddenCells;
- (BOOL)supportsImplicitEditing;
- (BOOL)supportsMergedCells;
- (BOOL)supportsQuickFilterUI;
- (BOOL)supportsRepeatHeaderRowsOnEachPage;
- (BOOL)supportsResumingTextEditing;
- (BOOL)supportsRowColumnAdderKnob;
- (BOOL)tabAtEdgeAddsColumn;
- (BOOL)tabAtEdgeAddsRow;
- (BOOL)tabWhileEditingNavigates;
- (BOOL)tableNameEnabledInNewTables;
- (BOOL)tokenizeFormulaStringLiterals;
- (BOOL)usesLimitedAutomaticFormatParsing;
- (BOOL)usesLimitedNumberFormatInspector;
- (BOOL)usesWholeChromeResizer;
- (TSTConfiguration)init;
- (unsigned)maxNumberOfColumns;
- (unsigned)maxNumberOfPopulatedCells;
- (unsigned)maxNumberOfRows;
- (void)setAllowFreeformFormulaText:(BOOL)a3;
- (void)setAllowHorizontalAutoresize:(BOOL)a3;
- (void)setAllowWhitespaceInFormulas:(BOOL)a3;
- (void)setAllowsFullyFilteredTables:(BOOL)a3;
- (void)setArrowKeyAtEdgeWhileEditingNavigates:(BOOL)a3;
- (void)setArrowKeysNavigateWhenEditingBeganByTyping:(BOOL)a3;
- (void)setArrowKeysWrap:(BOOL)a3;
- (void)setBackTabWraps:(BOOL)a3;
- (void)setBeginEditingOnSingleTap:(BOOL)a3;
- (void)setCellEditorsCanScrollToNonLocalTableSelection:(BOOL)a3;
- (void)setCornersCanDragResize:(BOOL)a3;
- (void)setCreateLargeDefaultTables:(BOOL)a3;
- (void)setDisableImplicitNaming:(BOOL)a3;
- (void)setDragByHandleOnly:(BOOL)a3;
- (void)setExportPermanentHidingState:(BOOL)a3;
- (void)setExportsCellAnnotations:(BOOL)a3;
- (void)setExportsCellComments:(BOOL)a3;
- (void)setFormulaCellEditorSupportsTextTokenEditor:(BOOL)a3;
- (void)setFormulaEditorEvaluatesFormulas:(BOOL)a3;
- (void)setFormulaEqualsTokenIsSelectable:(BOOL)a3;
- (void)setHasLargerFonts:(BOOL)a3;
- (void)setHeadersFrozenByDefault:(BOOL)a3;
- (void)setMaxNumberOfColumns:(unsigned int)a3;
- (void)setMaxNumberOfPopulatedCells:(unsigned int)a3;
- (void)setMaxNumberOfRows:(unsigned int)a3;
- (void)setPasteFilterHidingAsUserHiding:(BOOL)a3;
- (void)setPastesTile:(BOOL)a3;
- (void)setRequireMatchedFunctionTokens:(BOOL)a3;
- (void)setReturnWhileEditingNavigates:(BOOL)a3;
- (void)setSelectionUsesBezierPath:(BOOL)a3;
- (void)setSelectsCellOnInitialTap:(BOOL)a3;
- (void)setShowReferenceHighlightsOnFormulaCellSelection:(BOOL)a3;
- (void)setShowsAddressBarAlways:(BOOL)a3;
- (void)setShowsAddressBarHighlights:(BOOL)a3;
- (void)setShowsAddressBarLetteringAndNumbering:(BOOL)a3;
- (void)setShowsCellOverflowIndicator:(BOOL)a3;
- (void)setShowsHideUnhideUI:(BOOL)a3;
- (void)setSupportsAutoResizedTables:(BOOL)a3;
- (void)setSupportsAutofill:(BOOL)a3;
- (void)setSupportsCanvasReferenceEditing:(BOOL)a3;
- (void)setSupportsComplexFilterUI:(BOOL)a3;
- (void)setSupportsContainedTextEditing:(BOOL)a3;
- (void)setSupportsControlCells:(BOOL)a3;
- (void)setSupportsCreateChartFromSelection:(BOOL)a3;
- (void)setSupportsDragDropMoveMode:(BOOL)a3;
- (void)setSupportsFormulaEditing:(BOOL)a3;
- (void)setSupportsFrozenHeaders:(BOOL)a3;
- (void)setSupportsHiddenCells:(BOOL)a3;
- (void)setSupportsImplicitEditing:(BOOL)a3;
- (void)setSupportsMergedCells:(BOOL)a3;
- (void)setSupportsQuickFilterUI:(BOOL)a3;
- (void)setSupportsRepeatHeaderRowsOnEachPage:(BOOL)a3;
- (void)setSupportsResumingTextEditing:(BOOL)a3;
- (void)setSupportsRowColumnAdderKnob:(BOOL)a3;
- (void)setTabAtEdgeAddsColumn:(BOOL)a3;
- (void)setTabAtEdgeAddsRow:(BOOL)a3;
- (void)setTabWhileEditingNavigates:(BOOL)a3;
- (void)setTableNameEnabledInNewTables:(BOOL)a3;
- (void)setTokenizeFormulaStringLiterals:(BOOL)a3;
- (void)setUsesLimitedAutomaticFormatParsing:(BOOL)a3;
- (void)setUsesLimitedNumberFormatInspector:(BOOL)a3;
- (void)setUsesWholeChromeResizer:(BOOL)a3;
@end

@implementation TSTConfiguration

+ (id)sharedTableConfiguration
{
  if (+[TSTConfiguration sharedTableConfiguration]::onceToken != -1) {
    dispatch_once(&+[TSTConfiguration sharedTableConfiguration]::onceToken, &__block_literal_global_83);
  }
  return (id)sTableConfiguration;
}

uint64_t __44__TSTConfiguration_sharedTableConfiguration__block_invoke()
{
  uint64_t result = objc_opt_new();
  sTableConfiguration = result;
  return result;
}

+ (void)resetSharedTableConfiguration
{
  if (sTableConfiguration)
  {

    sTableConfiguration = 0;
    sTableConfiguration = objc_opt_new();
  }
}

- (TSTConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSTConfiguration;
  v2 = [(TSTConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 68) = 0xFF0000FFFFLL;
    *((_DWORD *)v2 + 19) = 0x7FFFFFFF;
    *((_DWORD *)v2 + 2) = 0x1000000;
    *((_WORD *)v2 + 6) = 0;
    v2[14] = 0;
    v2[29] = 1;
    *(void *)(v2 + 21) = 0x10000000100;
    *(_DWORD *)(v2 + 30) = 0;
    *(_DWORD *)(v2 + 33) = 0;
    *(_DWORD *)(v2 + 37) = 65537;
    v2[41] = 0;
    v2[42] = TSUPhoneUI() ^ 1;
    v3[43] = 1;
    [v3 setTokenizeFormulaStringLiterals:1];
    [v3 setFormulaCellEditorSupportsTextTokenEditor:1];
    *((_DWORD *)v3 + 11) = 1;
    *(_WORD *)(v3 + 19) = 1;
    *(_DWORD *)(v3 + 15) = 16777473;
    v3[48] = 1;
    *(void *)(v3 + 49) = 0;
    [v3 setFormulaEditorEvaluatesFormulas:0];
    [v3 setShowReferenceHighlightsOnFormulaCellSelection:1];
    [v3 setCellEditorsCanScrollToNonLocalTableSelection:1];
    [v3 setSupportsComplexFilterUI:0];
    [v3 setSupportsQuickFilterUI:0];
    [v3 setAllowsFullyFilteredTables:1];
    [v3 setPasteFilterHidingAsUserHiding:0];
    TSUFormatInit();
  }
  return (TSTConfiguration *)v3;
}

- (unsigned)maxNumberOfRows
{
  return self->mMaxNumberOfRows;
}

- (void)setMaxNumberOfRows:(unsigned int)a3
{
  self->mMaxNumberOfRows = a3;
}

- (unsigned)maxNumberOfColumns
{
  return self->mMaxNumberOfColumns;
}

- (void)setMaxNumberOfColumns:(unsigned int)a3
{
  self->mMaxNumberOfColumns = a3;
}

- (unsigned)maxNumberOfPopulatedCells
{
  return self->mMaxNumberOfPopulatedCells;
}

- (void)setMaxNumberOfPopulatedCells:(unsigned int)a3
{
  self->mMaxNumberOfPopulatedCells = a3;
}

- (BOOL)supportsContainedTextEditing
{
  return self->mSupportsContainedTextEditing;
}

- (void)setSupportsContainedTextEditing:(BOOL)a3
{
  self->mSupportsContainedTextEditing = a3;
}

- (BOOL)supportsResumingTextEditing
{
  return self->mSupportsResumingTextEditing;
}

- (void)setSupportsResumingTextEditing:(BOOL)a3
{
  self->mSupportsResumingTextEditing = a3;
}

- (BOOL)beginEditingOnSingleTap
{
  return self->mBeginEditingOnSingleTap;
}

- (void)setBeginEditingOnSingleTap:(BOOL)a3
{
  self->mBeginEditingOnSingleTap = a3;
}

- (BOOL)supportsMergedCells
{
  return self->mSupportsMergedCells;
}

- (void)setSupportsMergedCells:(BOOL)a3
{
  self->mSupportsMergedCells = a3;
}

- (BOOL)supportsHiddenCells
{
  return self->mSupportsHiddenCells;
}

- (void)setSupportsHiddenCells:(BOOL)a3
{
  self->mSupportsHiddenCells = a3;
}

- (BOOL)returnWhileEditingNavigates
{
  return self->mReturnWhileEditingNavigates;
}

- (void)setReturnWhileEditingNavigates:(BOOL)a3
{
  self->mReturnWhileEditingNavigates = a3;
}

- (BOOL)tabWhileEditingNavigates
{
  return self->mTabWhileEditingNavigates;
}

- (void)setTabWhileEditingNavigates:(BOOL)a3
{
  self->mTabWhileEditingNavigates = a3;
}

- (BOOL)arrowKeyAtEdgeWhileEditingNavigates
{
  return self->mArrowKeyAtEdgeWhileEditingNavigates;
}

- (void)setArrowKeyAtEdgeWhileEditingNavigates:(BOOL)a3
{
  self->mArrowKeyAtEdgeWhileEditingNavigates = a3;
}

- (BOOL)arrowKeysWrap
{
  return self->mArrowKeysWrap;
}

- (void)setArrowKeysWrap:(BOOL)a3
{
  self->mArrowKeysWrap = a3;
}

- (BOOL)arrowKeysNavigateWhenEditingBeganByTyping
{
  return self->mArrowKeysNavigateWhenEditingBeganByTyping;
}

- (void)setArrowKeysNavigateWhenEditingBeganByTyping:(BOOL)a3
{
  self->mArrowKeysNavigateWhenEditingBeganByTyping = a3;
}

- (BOOL)backTabWraps
{
  return self->mBackTabWraps;
}

- (void)setBackTabWraps:(BOOL)a3
{
  self->mBackTabWraps = a3;
}

- (BOOL)tabAtEdgeAddsRow
{
  return self->mTabAtEdgeAddsRow;
}

- (void)setTabAtEdgeAddsRow:(BOOL)a3
{
  self->mTabAtEdgeAddsRow = a3;
}

- (BOOL)tabAtEdgeAddsColumn
{
  return self->mTabAtEdgeAddsColumn;
}

- (void)setTabAtEdgeAddsColumn:(BOOL)a3
{
  self->mTabAtEdgeAddsColumn = a3;
}

- (BOOL)pastesTile
{
  return self->mPastesTile;
}

- (void)setPastesTile:(BOOL)a3
{
  self->mPastesTile = a3;
}

- (BOOL)allowHorizontalAutoresize
{
  return self->mAllowHorizontalAutoresize;
}

- (void)setAllowHorizontalAutoresize:(BOOL)a3
{
  self->mAllowHorizontalAutoresize = a3;
}

- (BOOL)selectsCellOnInitialTap
{
  return self->mSelectsCellOnInitialTap;
}

- (void)setSelectsCellOnInitialTap:(BOOL)a3
{
  self->mSelectsCellOnInitialTap = a3;
}

- (BOOL)dragByHandleOnly
{
  return self->mDragByHandleOnly;
}

- (void)setDragByHandleOnly:(BOOL)a3
{
  self->mDragByHandleOnly = a3;
}

- (BOOL)cornersCanDragResize
{
  return self->mCornersCanDragResize;
}

- (void)setCornersCanDragResize:(BOOL)a3
{
  self->mCornersCanDragResize = a3;
}

- (BOOL)supportsControlCells
{
  return self->mSupportsControlCells;
}

- (void)setSupportsControlCells:(BOOL)a3
{
  self->mSupportsControlCells = a3;
}

- (BOOL)hasLargerFonts
{
  return self->mHasLargerFonts;
}

- (void)setHasLargerFonts:(BOOL)a3
{
  self->mHasLargerFonts = a3;
}

- (BOOL)supportsFrozenHeaders
{
  return self->mSupportsFrozenHeaders;
}

- (void)setSupportsFrozenHeaders:(BOOL)a3
{
  self->mSupportsFrozenHeaders = a3;
}

- (BOOL)supportsAutoResizedTables
{
  return self->mSupportsAutoResizedTables;
}

- (void)setSupportsAutoResizedTables:(BOOL)a3
{
  self->mSupportsAutoResizedTables = a3;
}

- (BOOL)supportsCreateChartFromSelection
{
  return self->mSupportsCreateChartFromSelection;
}

- (void)setSupportsCreateChartFromSelection:(BOOL)a3
{
  self->mSupportsCreateChartFromSelection = a3;
}

- (BOOL)showsAddressBarAlways
{
  return self->mShowsAddressBarAlways;
}

- (void)setShowsAddressBarAlways:(BOOL)a3
{
  self->mShowsAddressBarAlways = a3;
}

- (BOOL)showsAddressBarHighlights
{
  return self->mShowsAddressBarHighlights;
}

- (void)setShowsAddressBarHighlights:(BOOL)a3
{
  self->mShowsAddressBarHighlights = a3;
}

- (BOOL)showsAddressBarLetteringAndNumbering
{
  return self->mShowsAddressBarLetteringAndNumbering;
}

- (void)setShowsAddressBarLetteringAndNumbering:(BOOL)a3
{
  self->mShowsAddressBarLetteringAndNumbering = a3;
}

- (BOOL)selectionUsesBezierPath
{
  return self->mSelectionUsesBezierPath;
}

- (void)setSelectionUsesBezierPath:(BOOL)a3
{
  self->mSelectionUsesBezierPath = a3;
}

- (BOOL)usesWholeChromeResizer
{
  return self->mUsesWholeChromeResizer;
}

- (void)setUsesWholeChromeResizer:(BOOL)a3
{
  self->mUsesWholeChromeResizer = a3;
}

- (BOOL)supportsCanvasReferenceEditing
{
  return self->mSupportsCanvasReferenceEditing;
}

- (void)setSupportsCanvasReferenceEditing:(BOOL)a3
{
  self->mSupportsCanvasReferenceEditing = a3;
}

- (BOOL)usesLimitedAutomaticFormatParsing
{
  return self->mUsesLimitedAutomaticFormatParsing;
}

- (void)setUsesLimitedAutomaticFormatParsing:(BOOL)a3
{
  self->mUsesLimitedAutomaticFormatParsing = a3;
}

- (BOOL)supportsFormulaEditing
{
  return self->mSupportsFormulaEditing;
}

- (void)setSupportsFormulaEditing:(BOOL)a3
{
  self->mSupportsFormulaEditing = a3;
}

- (BOOL)supportsImplicitEditing
{
  return self->mSupportsImplicitEditing;
}

- (void)setSupportsImplicitEditing:(BOOL)a3
{
  self->mSupportsImplicitEditing = a3;
}

- (BOOL)formulaEqualsTokenIsSelectable
{
  return self->mFormulaEqualsTokenIsSelectable;
}

- (void)setFormulaEqualsTokenIsSelectable:(BOOL)a3
{
  self->mFormulaEqualsTokenIsSelectable = a3;
}

- (BOOL)allowFreeformFormulaText
{
  return self->mAllowFreeformFormulaText;
}

- (void)setAllowFreeformFormulaText:(BOOL)a3
{
  self->mAllowFreeformFormulaText = a3;
}

- (BOOL)allowWhitespaceInFormulas
{
  return self->mAllowWhitespaceInFormulas;
}

- (void)setAllowWhitespaceInFormulas:(BOOL)a3
{
  self->mAllowWhitespaceInFormulas = a3;
}

- (BOOL)requireMatchedFunctionTokens
{
  return self->mRequireMatchedFunctionTokens;
}

- (void)setRequireMatchedFunctionTokens:(BOOL)a3
{
  self->mRequireMatchedFunctionTokens = a3;
}

- (BOOL)showsHideUnhideUI
{
  return self->mShowsHideUnhideUI;
}

- (void)setShowsHideUnhideUI:(BOOL)a3
{
  self->mShowsHideUnhideUI = a3;
}

- (BOOL)exportPermanentHidingState
{
  return self->mExportPermanentHidingState;
}

- (void)setExportPermanentHidingState:(BOOL)a3
{
  self->mExportPermanentHidingState = a3;
}

- (BOOL)showsCellOverflowIndicator
{
  return self->mShowsCellOverflowIndicator;
}

- (void)setShowsCellOverflowIndicator:(BOOL)a3
{
  self->mShowsCellOverflowIndicator = a3;
}

- (BOOL)supportsAutofill
{
  return self->mSupportsAutofill;
}

- (void)setSupportsAutofill:(BOOL)a3
{
  self->mSupportsAutofill = a3;
}

- (BOOL)usesLimitedNumberFormatInspector
{
  return self->mUsesLimitedNumberFormatInspector;
}

- (void)setUsesLimitedNumberFormatInspector:(BOOL)a3
{
  self->mUsesLimitedNumberFormatInspector = a3;
}

- (BOOL)headersFrozenByDefault
{
  return self->mHeadersFrozenByDefault;
}

- (void)setHeadersFrozenByDefault:(BOOL)a3
{
  self->mHeadersFrozenByDefault = a3;
}

- (BOOL)createLargeDefaultTables
{
  return self->mCreateLargeDefaultTables;
}

- (void)setCreateLargeDefaultTables:(BOOL)a3
{
  self->mCreateLargeDefaultTables = a3;
}

- (BOOL)tableNameEnabledInNewTables
{
  return self->mTableNameEnabledInNewTables;
}

- (void)setTableNameEnabledInNewTables:(BOOL)a3
{
  self->mTableNameEnabledInNewTables = a3;
}

- (BOOL)supportsRowColumnAdderKnob
{
  return self->mSupportsRowColumnAdderKnob;
}

- (void)setSupportsRowColumnAdderKnob:(BOOL)a3
{
  self->mSupportsRowColumnAdderKnob = a3;
}

- (BOOL)supportsDragDropMoveMode
{
  return self->mSupportsDragDropMoveMode;
}

- (void)setSupportsDragDropMoveMode:(BOOL)a3
{
  self->mSupportsDragDropMoveMode = a3;
}

- (BOOL)exportsCellComments
{
  return self->mExportsCellComments;
}

- (void)setExportsCellComments:(BOOL)a3
{
  self->mExportsCellComments = a3;
}

- (BOOL)exportsCellAnnotations
{
  return self->mExportsCellAnnotations;
}

- (void)setExportsCellAnnotations:(BOOL)a3
{
  self->mExportsCellAnnotations = a3;
}

- (BOOL)supportsRepeatHeaderRowsOnEachPage
{
  return self->mSupportsRepeatHeaderRowsOnEachPage;
}

- (void)setSupportsRepeatHeaderRowsOnEachPage:(BOOL)a3
{
  self->mSupportsRepeatHeaderRowsOnEachPage = a3;
}

- (BOOL)formulaEditorEvaluatesFormulas
{
  return self->_formulaEditorEvaluatesFormulas;
}

- (void)setFormulaEditorEvaluatesFormulas:(BOOL)a3
{
  self->_formulaEditorEvaluatesFormulas = a3;
}

- (BOOL)showReferenceHighlightsOnFormulaCellSelection
{
  return self->_showReferenceHighlightsOnFormulaCellSelection;
}

- (void)setShowReferenceHighlightsOnFormulaCellSelection:(BOOL)a3
{
  self->_showReferenceHighlightsOnFormulaCellSelection = a3;
}

- (BOOL)tokenizeFormulaStringLiterals
{
  return self->_tokenizeFormulaStringLiterals;
}

- (void)setTokenizeFormulaStringLiterals:(BOOL)a3
{
  self->_tokenizeFormulaStringLiterals = a3;
}

- (BOOL)cellEditorsCanScrollToNonLocalTableSelection
{
  return self->_cellEditorsCanScrollToNonLocalTableSelection;
}

- (void)setCellEditorsCanScrollToNonLocalTableSelection:(BOOL)a3
{
  self->_cellEditorsCanScrollToNonLocalTableSelection = a3;
}

- (BOOL)formulaCellEditorSupportsTextTokenEditor
{
  return self->_formulaCellEditorSupportsTextTokenEditor;
}

- (void)setFormulaCellEditorSupportsTextTokenEditor:(BOOL)a3
{
  self->_formulaCellEditorSupportsTextTokenEditor = a3;
}

- (BOOL)disableImplicitNaming
{
  return self->_disableImplicitNaming;
}

- (void)setDisableImplicitNaming:(BOOL)a3
{
  self->_disableImplicitNaming = a3;
}

- (BOOL)supportsComplexFilterUI
{
  return self->_supportsComplexFilterUI;
}

- (void)setSupportsComplexFilterUI:(BOOL)a3
{
  self->_supportsComplexFilterUI = a3;
}

- (BOOL)supportsQuickFilterUI
{
  return self->_supportsQuickFilterUI;
}

- (void)setSupportsQuickFilterUI:(BOOL)a3
{
  self->_supportsQuickFilterUI = a3;
}

- (BOOL)pasteFilterHidingAsUserHiding
{
  return self->_pasteFilterHidingAsUserHiding;
}

- (void)setPasteFilterHidingAsUserHiding:(BOOL)a3
{
  self->_pasteFilterHidingAsUserHiding = a3;
}

- (BOOL)allowsFullyFilteredTables
{
  return self->_allowsFullyFilteredTables;
}

- (void)setAllowsFullyFilteredTables:(BOOL)a3
{
  self->_allowsFullyFilteredTables = a3;
}

@end