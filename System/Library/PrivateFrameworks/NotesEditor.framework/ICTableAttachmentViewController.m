@interface ICTableAttachmentViewController
- (BOOL)acceptsKeystrokes;
- (BOOL)allowsNewTextLength:(unint64_t)a3;
- (BOOL)becomeFirstResponderForAuxStyling;
- (BOOL)canIndent;
- (BOOL)canIndentByamount:(int64_t)a3;
- (BOOL)canOutdent;
- (BOOL)canStyleText;
- (BOOL)canToggleTodo;
- (BOOL)containedInNoteSelection;
- (BOOL)cursorPrefersWordBoundary;
- (BOOL)didRecentlyAutoAddRow;
- (BOOL)isInResponderChain;
- (BOOL)isNoteEditable;
- (BOOL)isPerformingInitialLayout;
- (BOOL)isShowingTextStyleOptions;
- (BOOL)isUpdatingTiles;
- (BOOL)lockSelection;
- (BOOL)makeSpaceToPasteSourceTable:(id)a3;
- (BOOL)makingCellFirstResponder;
- (BOOL)pasteCellRange;
- (BOOL)performedInitialLayout;
- (BOOL)preventScrolling;
- (BOOL)resignFirstResponderForAuxStyling;
- (BOOL)shouldBeginInitialEditing;
- (BOOL)shouldPreventUndoCommands;
- (BOOL)updateAllColumnWidths;
- (BOOL)updateEditedColumnWidths;
- (BOOL)wantsUndoCommands;
- (CGPoint)currentDragGestureLocation;
- (CGPoint)initialDragOffset;
- (CGRect)editingViewport;
- (CGRect)frameOfCellForColumnTextView:(id)a3 row:(id)a4;
- (CGRect)proposedLineFragmentRect;
- (CGRect)selectionFrameFromContentFrame:(CGRect)a3;
- (CGRect)transitionViewport;
- (CGRect)viewport;
- (CGSize)intrinsicSize;
- (ICAppearanceInfo)draggingAppearance;
- (ICBaseTextView)noteTextView;
- (ICDimensionSumCache)columnWidthCache;
- (ICDimensionSumCache)rowHeightCache;
- (ICLayoutManager)noteLayoutManager;
- (ICTK2TextLayoutManager)noteTextLayoutManager;
- (ICTTTextStorage)currentlyEditingTextStorage;
- (ICTable)table;
- (ICTableAccessibilityController)tableAXController;
- (ICTableAttachmentProvider)tableAttachmentProvider;
- (ICTableAttachmentSelection)previousAXTableSelection;
- (ICTableAttachmentSelection)tableSelection;
- (ICTableAttachmentSelection)tableSelectionBeforeMerge;
- (ICTableAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5;
- (ICTableAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 textLayoutManager:(id)a5;
- (ICTableAutoScroller)tableAutoScroller;
- (ICTableClipView)headerClipView;
- (ICTableColumnRowButton)columnButton;
- (ICTableColumnRowButton)rowButton;
- (ICTableColumnTextView)activeTextView;
- (ICTableColumnTextView)currentlyEditingTextView;
- (ICTableContentView)tableContentView;
- (ICTableLayoutManager)tableLayoutManager;
- (ICTableScrollView)scrollView;
- (ICTableSelectionKnob)endKnob;
- (ICTableSelectionKnob)startKnob;
- (ICTableSelectionView)selectionHighlightView;
- (ICTableTextViewManager)textViewManager;
- (ICTableUndoTarget)undoTarget;
- (NSArray)stringSelectionBeforeDrag;
- (NSArray)stringSelectionBeforeMerge;
- (NSDictionary)cellTimestampsBeforeMerge;
- (NSIndexSet)selectedStyles;
- (NSMapTable)coalescingUndoGroupForStringDelegate;
- (NSMutableArray)undoCommands;
- (NSMutableDictionary)cellHeightCache;
- (NSMutableDictionary)visibleEmptyCellsBeforeMerge;
- (NSMutableOrderedSet)columnsBeforeMerge;
- (NSMutableOrderedSet)rowsBeforeMerge;
- (NSMutableSet)columnsNeedingWidthUpdate;
- (NSUUID)rangeSelectionAnchorColumn;
- (NSUUID)rangeSelectionAnchorRow;
- (NSUndoManager)undoManager;
- (UIScrollView)noteScrollView;
- (UIView)dragView;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (_NSRange)characterRangeForRange:(_NSRange)a3 inString:(id)a4 forLayoutManager:(id)a5;
- (_NSRange)columnGlyphRangeForRange:(_NSRange)a3 inString:(id)a4 forLayoutManager:(id)a5;
- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4;
- (_UIDragSnappingFeedbackGenerator)feedbackGenerator;
- (double)availableWidth;
- (double)previousAvailableWidth;
- (double)scrollerOutset;
- (id)RTFDataForSelection;
- (id)account;
- (id)attributedStringForTableSelectionInContext:(id)a3;
- (id)attributedStringFromPasteboard;
- (id)customPasteboardDataForSelection;
- (id)dataForSelectionOfType:(id)a3;
- (id)dataForSelectionWithDocumentAttributes:(id)a3;
- (id)dragSnapshotFromRect:(CGRect)a3 afterScreenUpdates:(BOOL)a4;
- (id)htmlDataForSelection;
- (id)icTableDataForSelection;
- (id)icTableDataFromPasteboard;
- (id)icTableFromPasteboard;
- (id)insertColumns:(unint64_t)a3 atIndex:(unint64_t)a4;
- (id)namedStylesForCurrentSelectionAndBIUS:(unint64_t *)a3;
- (id)note;
- (id)notesDataFromPasteboard;
- (id)pasteboardItemsForSelection;
- (id)plainTextDataForSelection;
- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4;
- (id)soloPlainTextStringFromPasteboard;
- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4;
- (id)webArchiveDataForSelection;
- (int64_t)textAlignmentForCurrentSelection;
- (int64_t)textDirectionForCurrentSelection;
- (unint64_t)currentDragIndex;
- (unint64_t)cursorPositionForLocation:(CGPoint)a3 inTextView:(id)a4;
- (unint64_t)editingCount;
- (unint64_t)lastDraggedOverColumnOrRowIndex;
- (unint64_t)preferredNavigationSelection;
- (unint64_t)selectedStyleBIUS;
- (void)addColumnAfterSelection:(id)a3;
- (void)addColumnAtIndex:(unint64_t)a3;
- (void)addColumnBeforeSelection:(id)a3;
- (void)addColumnLeftOfSelection:(id)a3;
- (void)addColumnRightOfSelection:(id)a3;
- (void)addRowAboveSelection:(id)a3;
- (void)addRowAtIndex:(unint64_t)a3;
- (void)addRowBelowSelection:(id)a3;
- (void)addUndoCommandsForObject:(id)a3 block:(id)a4;
- (void)announceCellRangeSelectionChangeForAccessibilityIfNecessary;
- (void)applyUndoGroup:(id)a3;
- (void)beginEditing;
- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 location:(unint64_t)a5;
- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 textRange:(id)a5;
- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 touchPoint:(CGPoint)a5;
- (void)beginEditingInitialCell;
- (void)beginEditingNoteAtOffset:(int64_t)a3;
- (void)beginEditingSelectedRangeInTextView:(id)a3;
- (void)cellRangeDragBeganOnView:(id)a3;
- (void)cellRangeDraggedAtLocation:(CGPoint)a3;
- (void)cleanDeletedColumn:(id)a3;
- (void)cleanDeletedRow:(id)a3;
- (void)convertTableToText:(id)a3;
- (void)copyTable:(id)a3;
- (void)cutSelection:(id)a3;
- (void)dealloc;
- (void)deleteColumns:(id)a3;
- (void)deleteRows:(id)a3;
- (void)deleteSelectedColumns:(id)a3;
- (void)deleteSelectedRows:(id)a3;
- (void)deleteSelection:(id)a3;
- (void)deleteSelectionCellContents;
- (void)deleteTable:(id)a3;
- (void)didBeginEditingWithTextView:(id)a3;
- (void)didPasteOrDropTextForTableColumnTextView:(id)a3;
- (void)disableBoldface:(id)a3;
- (void)disableItalics:(id)a3;
- (void)disableStrikethrough:(id)a3;
- (void)disableUnderline:(id)a3;
- (void)dragBeganOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4;
- (void)dragEndedOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4;
- (void)dragMovedOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4;
- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5;
- (void)enableBoldface:(id)a3;
- (void)enableItalics:(id)a3;
- (void)enableStrikethrough:(id)a3;
- (void)enableUnderline:(id)a3;
- (void)endCellEditingSessionWithTextView:(id)a3;
- (void)endEditing;
- (void)extendCellRangeSelectionInDirection:(unint64_t)a3 toEnd:(BOOL)a4;
- (void)flashAuthorHighlightsIfNeeded;
- (void)hideColumnRowButtons;
- (void)initializeTableAccessibilityControllerIfNecessary;
- (void)initializeTableLayout;
- (void)loadView;
- (void)moveCurrentColumnOrRow:(BOOL)a3 toIndex:(unint64_t)a4;
- (void)moveDownCell;
- (void)moveDownCellAtLocation:(unint64_t)a3;
- (void)moveIntoTableWithDirection:(unint64_t)a3;
- (void)moveLeftCell;
- (void)moveNextCell;
- (void)moveNextCellAtLocation:(unint64_t)a3;
- (void)moveNextLineAtLocation:(unint64_t)a3;
- (void)movePrevCell;
- (void)movePrevCellAtLocation:(unint64_t)a3;
- (void)moveReturnCell;
- (void)moveRightCell;
- (void)moveShiftReturnCell;
- (void)moveUpCell;
- (void)moveUpCellAtLocation:(unint64_t)a3;
- (void)pasteIntoSelection:(id)a3;
- (void)pasteTable:(id)a3 atColumnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5 shouldSetSelectionToPastedRange:(BOOL)a6;
- (void)performInitialLayoutIfNeeded;
- (void)postChangeNotification:(unint64_t)a3 columnOrRowUUIDs:(id)a4;
- (void)prepareForPrinting;
- (void)redraw;
- (void)redrawAndSave;
- (void)removeFromParentViewController;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 inFindableString:(id)a5;
- (void)reverseTableColumnDirection:(id)a3;
- (void)save;
- (void)saveAfterDelay;
- (void)saveAttachmentChanges;
- (void)saveAttachmentChangesInBackground:(BOOL)a3;
- (void)saveOnMainThread;
- (void)scrollToRange:(_NSRange)a3 inFindableString:(id)a4;
- (void)scrollToSelectionInTextView:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectTable;
- (void)selectionDidResignFirstResponder:(id)a3;
- (void)selectionWillBecomeFirstResponder:(id)a3;
- (void)setCellTimestampsBeforeMerge:(id)a3;
- (void)setColumnButton:(id)a3;
- (void)setColumnWidthCache:(id)a3;
- (void)setCurrentDragGestureLocation:(CGPoint)a3;
- (void)setCurrentDragIndex:(unint64_t)a3;
- (void)setCurrentlyEditingTextStorage:(id)a3;
- (void)setCurrentlyEditingTextView:(id)a3;
- (void)setDidRecentlyAutoAddRow:(BOOL)a3;
- (void)setDragView:(id)a3;
- (void)setDraggingAppearance:(id)a3;
- (void)setEditingCount:(unint64_t)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHidden:(BOOL)a3 forColumn:(id)a4;
- (void)setHidden:(BOOL)a3 forRow:(id)a4;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setInitialDragOffset:(CGPoint)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setInputView:(id)a3;
- (void)setIsPerformingInitialLayout:(BOOL)a3;
- (void)setLastDraggedOverColumnOrRowIndex:(unint64_t)a3;
- (void)setLockSelection:(BOOL)a3;
- (void)setMakingCellFirstResponder:(BOOL)a3;
- (void)setNoteLayoutManager:(id)a3;
- (void)setNoteTextLayoutManager:(id)a3;
- (void)setPerformedInitialLayout:(BOOL)a3;
- (void)setPreventScrolling:(BOOL)a3;
- (void)setPreviousAXTableSelection:(id)a3;
- (void)setPreviousAvailableWidth:(double)a3;
- (void)setProposedLineFragmentRect:(CGRect)a3;
- (void)setRangeSelectionAnchorColumn:(id)a3;
- (void)setRangeSelectionAnchorRow:(id)a3;
- (void)setRowButton:(id)a3;
- (void)setRowHeightCache:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectedRange:(_NSRange)a3 inFindableString:(id)a4;
- (void)setSelectionAlignment:(int64_t)a3;
- (void)setSelectionBIUSStyle:(unint64_t)a3 toggleOn:(BOOL)a4;
- (void)setSelectionBIUSStyle:(unint64_t)a3 toggleOn:(BOOL)a4 withColumns:(id)a5 rows:(id)a6;
- (void)setSelectionDirection:(int64_t)a3;
- (void)setSelectionNamedStyle:(unsigned int)a3;
- (void)setSelectionNamedStyle:(unsigned int)a3 withColumns:(id)a4 rows:(id)a5;
- (void)setShouldBeginInitialEditing:(BOOL)a3;
- (void)setShouldPreventUndoCommands:(BOOL)a3;
- (void)setStringSelectionBeforeDrag:(id)a3;
- (void)setStringSelectionBeforeMerge:(id)a3;
- (void)setTableAXController:(id)a3;
- (void)setTableAutoScroller:(id)a3;
- (void)setTableSelection:(id)a3;
- (void)setTableSelectionBeforeMerge:(id)a3;
- (void)setTransitionViewport:(CGRect)a3;
- (void)setTypingAttributesForTextView:(id)a3;
- (void)setUndoCommands:(id)a3;
- (void)setUpdatingTiles:(BOOL)a3;
- (void)setupTableTextView:(id)a3;
- (void)showColumnRowButtons;
- (void)tableAttachmentDidChange;
- (void)tableAttachmentProviderDidMergeTable:(id)a3;
- (void)tableAttachmentProviderWillMergeTable:(id)a3;
- (void)tableAttachmentViewControllerDidChange:(id)a3;
- (void)tableAttachmentWillChange;
- (void)tableAutoScroller:(id)a3 scrollOffsetDelta:(CGPoint)a4;
- (void)tableDidCreateColumnTextStorage:(id)a3;
- (void)tableDidInsertColumnID:(id)a3;
- (void)tableDidPopulateCellAtColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4;
- (void)tableValueDidChangeAtColumnID:(id)a3 rowID:(id)a4 delta:(int64_t)a5;
- (void)tableWillRemoveColumnID:(id)a3;
- (void)tappedTableAtLocation:(CGPoint)a3;
- (void)textRangeDragEnded;
- (void)textRangeDraggedAtLocation:(CGPoint)a3;
- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
- (void)textStorage:(id)a3 didReplace:(id)a4 with:(id)a5;
- (void)toggleBIUS:(unint64_t)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleEmphasis:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleStrikethrough:(id)a3;
- (void)toggleTodoStyle:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)updateAllColumnWidthsAndRedraw;
- (void)updateAttachmentParagraphForWritingDirection:(int64_t)a3;
- (void)updateAvailableWidth;
- (void)updateButtonFrames;
- (void)updateCellSizeAtColumn:(id)a3 row:(id)a4 immediateWidthUpdate:(BOOL)a5;
- (void)updateChrome;
- (void)updateColumnWidthForColumn:(id)a3;
- (void)updateContentSize;
- (void)updateEditedColumnWidthsAfterDelay;
- (void)updateHeightCacheForColumn:(id)a3 row:(id)a4;
- (void)updateTableCellsWithDirection:(int64_t)a3 columnIndexes:(id)a4 rowIndexes:(id)a5;
- (void)updateTableColumnDirectionForWritingDirection:(int64_t)a3;
- (void)updateTiles;
- (void)updateWidthsForChangeInColumn:(id)a3;
- (void)willBeginEditingWithTextView:(id)a3;
- (void)willFlashAuthorHighlights;
- (void)zoomFactorOrInsetsDidChange;
@end

@implementation ICTableAttachmentViewController

- (ICTableAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICTableAttachmentViewController;
  v9 = [(ICAttachmentViewController *)&v12 initWithTextAttachment:a3 forManualRendering:v5 layoutManager:v8];
  if (v9)
  {
    objc_opt_class();
    v10 = ICCheckedDynamicCast();
    objc_storeWeak((id *)&v9->_noteLayoutManager, v10);
  }
  return v9;
}

- (ICTableAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 textLayoutManager:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICTableAttachmentViewController;
  v9 = [(ICAttachmentViewController *)&v12 initWithTextAttachment:a3 forManualRendering:v5 textLayoutManager:v8];
  if (v9)
  {
    objc_opt_class();
    v10 = ICCheckedDynamicCast();
    objc_storeWeak((id *)&v9->_noteTextLayoutManager, v10);

    [(ICTableAttachmentViewController *)v9 initializeTableLayout];
  }

  return v9;
}

- (ICTable)table
{
  tableAttachmentProvider = self->_tableAttachmentProvider;
  if (!tableAttachmentProvider)
  {
    v4 = (void *)MEMORY[0x263F5AD40];
    BOOL v5 = [(ICAttachmentViewController *)self attachment];
    v6 = [v4 sharedProviderForAttachment:v5];
    v7 = self->_tableAttachmentProvider;
    self->_tableAttachmentProvider = v6;

    [(ICTableAttachmentProvider *)self->_tableAttachmentProvider setDelegate:self];
    id v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    coalescingUndoGroupForStringDelegate = self->_coalescingUndoGroupForStringDelegate;
    self->_coalescingUndoGroupForStringDelegate = v8;

    tableAttachmentProvider = self->_tableAttachmentProvider;
  }

  return (ICTable *)[(ICTableAttachmentProvider *)tableAttachmentProvider table];
}

- (CGSize)intrinsicSize
{
  if (![(ICTableAttachmentViewController *)self performedInitialLayout]) {
    [(ICTableAttachmentViewController *)self performInitialLayoutIfNeeded];
  }
  if (ICInternalSettingsIsTextKit2Enabled()) {
    [(ICTableAttachmentViewController *)self updateAvailableWidth];
  }
  v3 = [(ICTableAttachmentViewController *)self columnWidthCache];
  [v3 sum];
  double v5 = v4;

  v6 = [(ICTableAttachmentViewController *)self rowHeightCache];
  [v6 sum];
  double v8 = v7;

  if (v5 == 0.0)
  {
    v9 = [(ICTableAttachmentViewController *)self tableLayoutManager];
    v10 = [v9 columnWidthManager];
    [v10 singleColumnTableWidth];
    double v5 = v11;
  }
  if (v8 == 0.0)
  {
    objc_super v12 = [(ICTableAttachmentViewController *)self tableLayoutManager];
    [v12 emptyCellHeight];
    double v8 = v13;
  }
  double v14 = v5;
  double v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSUndoManager)undoManager
{
  v2 = [(ICAttachmentViewController *)self attachment];
  v3 = [v2 note];
  double v4 = [v3 textStorage];
  double v5 = [v4 undoManager];

  return (NSUndoManager *)v5;
}

- (ICBaseTextView)noteTextView
{
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    v3 = [(ICTableAttachmentViewController *)self noteTextLayoutManager];
    double v4 = [v3 textContainer];
    double v5 = ICCheckedDynamicCast();

    objc_opt_class();
    [v5 tk2TextView];
  }
  else
  {
    objc_opt_class();
    double v5 = [(ICTableAttachmentViewController *)self noteLayoutManager];
    [v5 textView];
  v6 = };
  double v7 = ICDynamicCast();

  return (ICBaseTextView *)v7;
}

- (BOOL)isNoteEditable
{
  v2 = [(ICAttachmentViewController *)self attachment];
  v3 = [v2 note];
  char v4 = [v3 isEditable];

  return v4;
}

- (void)loadView
{
  v55.receiver = self;
  v55.super_class = (Class)ICTableAttachmentViewController;
  [(ICAttachmentViewController *)&v55 loadView];
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0) {
    [(ICTableAttachmentViewController *)self initializeTableLayout];
  }
  v3 = [ICTableScrollView alloc];
  char v4 = [(ICTableAttachmentViewController *)self view];
  [v4 bounds];
  double v5 = -[ICTableScrollView initWithFrame:](v3, "initWithFrame:");
  [(ICTableAttachmentViewController *)self setScrollView:v5];

  v6 = [(ICTableAttachmentViewController *)self view];
  double v7 = [(ICTableAttachmentViewController *)self scrollView];
  [v6 addSubview:v7];

  double v8 = [ICTableContentView alloc];
  v9 = -[ICTableContentView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  tableContentView = self->_tableContentView;
  self->_tableContentView = v9;

  double v11 = [(ICTableAttachmentViewController *)self scrollView];
  objc_super v12 = [(ICTableAttachmentViewController *)self tableContentView];
  [v11 addSubview:v12];

  double v13 = [ICTableClipView alloc];
  double v14 = [(ICTableAttachmentViewController *)self view];
  [v14 bounds];
  double v15 = -[ICTableClipView initWithFrame:](v13, "initWithFrame:", 0.0, -30.0);
  headerClipView = self->_headerClipView;
  self->_headerClipView = v15;

  v17 = [(ICTableAttachmentViewController *)self view];
  v18 = [(ICTableAttachmentViewController *)self headerClipView];
  [v17 addSubview:v18];

  v19 = (ICTableAttachmentSelection *)objc_alloc_init(MEMORY[0x263F5B4A0]);
  tableSelection = self->_tableSelection;
  self->_tableSelection = v19;

  v21 = [ICTableTextViewManager alloc];
  v22 = [(ICTableAttachmentViewController *)self tableLayoutManager];
  v23 = [(ICTableAttachmentViewController *)self tableContentView];
  v24 = [(ICTableTextViewManager *)v21 initWithTableLayoutManager:v22 view:v23 cachedWidths:self->_columnWidthCache cachedRowHeights:self->_rowHeightCache cachedCellHeights:self->_cellHeightCache];
  textViewManager = self->_textViewManager;
  self->_textViewManager = v24;

  [(ICTableTextViewManager *)self->_textViewManager setDelegate:self];
  [(ICTableTextViewManager *)self->_textViewManager updateAuthorHighlights];
  [(ICTableTextViewManager *)self->_textViewManager restyleCells];
  v26 = objc_alloc_init(ICTableSelectionView);
  selectionHighlightView = self->_selectionHighlightView;
  self->_selectionHighlightView = v26;

  [(ICTableSelectionView *)self->_selectionHighlightView setDelegate:self];
  v28 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v29 = *MEMORY[0x263F5AB48];
  v30 = [(ICTableAttachmentViewController *)self tableAttachmentProvider];
  [v28 addObserver:self selector:sel_tableAttachmentProviderWillMergeTable_ name:v29 object:v30];

  v31 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v32 = *MEMORY[0x263F5AB40];
  v33 = [(ICTableAttachmentViewController *)self tableAttachmentProvider];
  [v31 addObserver:self selector:sel_tableAttachmentProviderDidMergeTable_ name:v32 object:v33];

  v34 = [MEMORY[0x263F08A00] defaultCenter];
  v35 = [(ICTableAttachmentViewController *)self table];
  [v34 addObserver:self selector:sel_tableAttachmentViewControllerDidChange_ name:@"ICTableAttachmentViewControllerDidChangeNotification" object:v35];

  v36 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v37 = *MEMORY[0x263F5B1F8];
  v38 = [(ICTableAttachmentViewController *)self tableSelection];
  [v36 addObserver:self selector:sel_tableAttachmentSelectionDidChange_ name:v37 object:v38];

  v39 = [ICTableUndoTarget alloc];
  v40 = [(ICTableAttachmentViewController *)self tableAttachmentProvider];
  v41 = [(ICTableUndoTarget *)v39 initWithProvider:v40 viewController:self];
  undoTarget = self->_undoTarget;
  self->_undoTarget = v41;

  v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  undoCommands = self->_undoCommands;
  self->_undoCommands = v43;

  v45 = [[ICTableSelectionKnob alloc] initWithTableAttachmentViewController:self];
  startKnob = self->_startKnob;
  self->_startKnob = v45;

  v47 = [[ICTableSelectionKnob alloc] initWithTableAttachmentViewController:self];
  endKnob = self->_endKnob;
  self->_endKnob = v47;

  v49 = [(ICTableAttachmentViewController *)self view];
  v50 = [v49 outsideViews];
  [v50 addObject:self->_startKnob];

  v51 = [(ICTableAttachmentViewController *)self view];
  v52 = [v51 outsideViews];
  [v52 addObject:self->_endKnob];

  v53 = [MEMORY[0x263EFF9C0] set];
  columnsNeedingWidthUpdate = self->_columnsNeedingWidthUpdate;
  self->_columnsNeedingWidthUpdate = v53;

  [(ICTableAttachmentViewController *)self setupEventHandling];
}

- (void)removeFromParentViewController
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v3 removeFromParentViewController];
  [(ICTableAttachmentViewController *)self hideColumnRowButtons];
}

- (void)dealloc
{
  objc_super v3 = [(ICTableAttachmentProvider *)self->_tableAttachmentProvider table];
  char v4 = [v3 cellChangeNotifier];
  [v4 removeObserver:self];

  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)ICTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v6 dealloc];
}

- (BOOL)isInResponderChain
{
  v2 = [(ICTableAttachmentViewController *)self tableSelection];
  BOOL v3 = [v2 type] != 0;

  return v3;
}

- (void)prepareForPrinting
{
  v2.receiver = self;
  v2.super_class = (Class)ICTableAttachmentViewController;
  [(ICAbstractAttachmentViewController *)&v2 prepareForPrinting];
}

- (void)zoomFactorOrInsetsDidChange
{
  if ([(ICTableAttachmentViewController *)self isViewLoaded])
  {
    BOOL v3 = [(ICTableAttachmentViewController *)self textViewManager];
    [v3 restyleCells];

    [(ICTableAttachmentViewController *)self viewport];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    objc_super v12 = [(ICTableAttachmentViewController *)self textViewManager];
    [v12 boundingRect];
    v25.origin.x = v13;
    v25.origin.y = v14;
    v25.size.width = v15;
    v25.size.height = v16;
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    BOOL v17 = CGRectIntersectsRect(v24, v25);

    if (v17)
    {
      [(ICTableAttachmentViewController *)self updateAllColumnWidthsAndRedraw];
    }
    else
    {
      v18 = [(ICTableAttachmentViewController *)self tableLayoutManager];
      id v22 = [v18 columnWidthManager];

      v19 = [(ICTableAttachmentViewController *)self textViewManager];
      v20 = [v19 columnIDs];
      id v21 = (id)[v22 invalidateWidthForColumns:v20];
    }
  }
}

- (CGRect)viewport
{
  if ([(ICAttachmentViewController *)self forManualRendering])
  {
    [(ICTableAttachmentViewController *)self availableWidth];
    double v4 = v3;
    double v5 = 0.0;
    double v6 = 1.79769313e308;
    double v7 = 0.0;
  }
  else
  {
    [(ICTableAttachmentViewController *)self transitionViewport];
    if (CGRectIsEmpty(v8)) {
      [(ICTableAttachmentViewController *)self editingViewport];
    }
    else {
      [(ICTableAttachmentViewController *)self transitionViewport];
    }
  }
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v5;
  return result;
}

- (void)updateTiles
{
  if (![(ICTableAttachmentViewController *)self isUpdatingTiles])
  {
    uint64_t v12 = 0;
    CGFloat v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    double v3 = [(ICTableAttachmentViewController *)self textViewManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__ICTableAttachmentViewController_updateTiles__block_invoke;
    v11[3] = &unk_2640BA0C0;
    v11[4] = &v12;
    [v3 enumerateTextViewsWithBlock:v11];

    if (*((unsigned char *)v13 + 24))
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __46__ICTableAttachmentViewController_updateTiles__block_invoke_2;
      v10[3] = &unk_2640B8140;
      v10[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v10);
    }
    else
    {
      [(ICTableAttachmentViewController *)self setUpdatingTiles:1];
      [(ICTableAttachmentViewController *)self setShouldPreventUndoCommands:1];
      double v4 = [(ICTableAttachmentViewController *)self textViewManager];
      [(ICTableAttachmentViewController *)self viewport];
      objc_msgSend(v4, "updateTilesWithViewport:redrawAll:", 0);
      double v6 = v5;
      double v8 = v7;

      if (v6 != *MEMORY[0x263F00148] || v8 != *(double *)(MEMORY[0x263F00148] + 8)) {
        -[ICTableAttachmentViewController adjustScrollPositionByOffset:](self, "adjustScrollPositionByOffset:", v6, v8);
      }
      [(ICTableAttachmentViewController *)self updateContentSize];
      [(ICTableAttachmentViewController *)self updateChrome];
      [(ICTableAttachmentViewController *)self setShouldPreventUndoCommands:0];
      [(ICTableAttachmentViewController *)self setUpdatingTiles:0];
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __46__ICTableAttachmentViewController_updateTiles__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  double v5 = [a2 layoutManager];
  double v6 = [v5 textStorage];
  int v7 = [v6 _isEditing];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __46__ICTableAttachmentViewController_updateTiles__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTiles];
}

- (void)updateContentSize
{
  [(ICTableAttachmentViewController *)self intrinsicSize];
  double v4 = v3;
  double v6 = v5;
  int v7 = [(ICTableAttachmentViewController *)self tableContentView];
  [v7 bounds];
  char v8 = TSDNearlyEqualSizes();

  if ((v8 & 1) == 0)
  {
    objc_opt_class();
    CGFloat v9 = [(ICTableAttachmentViewController *)self view];
    ICDynamicCast();
    id v41 = (id)objc_claimAutoreleasedReturnValue();

    if (![(ICTableAttachmentViewController *)self isPerformingInitialLayout]) {
      [v41 didChangeSize];
    }
    double v10 = [(ICAttachmentViewController *)self textAttachment];
    CGFloat v11 = [(ICTableAttachmentViewController *)self noteTextView];
    uint64_t v12 = [v11 textContainer];
    [v10 attachmentSizeForTextContainer:v12];
    double v14 = v13;

    [v41 frame];
    [v41 frame];
    TSDSanitizeRect();
    objc_msgSend(v41, "setFrame:");
    [v41 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(ICTableAttachmentViewController *)self scrollerOutset];
    double v24 = v23 + v22;
    CGRect v25 = [(ICTableAttachmentViewController *)self scrollView];
    objc_msgSend(v25, "setFrame:", v16, v18, v20, v24);

    if (vabdd_f64(v14, v4) >= 0.00999999978)
    {
      TSDSanitizeRect();
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      v26 = [(ICTableAttachmentViewController *)self tableContentView];
      v27 = v26;
      double v28 = v33;
      double v29 = v35;
      double v30 = v37;
      double v31 = v39;
    }
    else
    {
      v26 = [(ICTableAttachmentViewController *)self tableContentView];
      v27 = v26;
      double v28 = 0.0;
      double v29 = 0.0;
      double v30 = v14;
      double v31 = v6;
    }
    objc_msgSend(v26, "setFrame:", v28, v29, v30, v31);

    v40 = [(ICTableAttachmentViewController *)self tableContentView];
    objc_msgSend(v40, "ic_setNeedsLayout");

    [(ICTableAttachmentViewController *)self didUpdateContentSize];
  }
}

- (void)redraw
{
  [(ICTableAttachmentViewController *)self setShouldPreventUndoCommands:1];
  double v3 = [(ICTableAttachmentViewController *)self textViewManager];
  [(ICTableAttachmentViewController *)self viewport];
  objc_msgSend(v3, "redrawAllWithViewport:");

  [(ICTableAttachmentViewController *)self updateContentSize];
  [(ICTableAttachmentViewController *)self updateChrome];

  [(ICTableAttachmentViewController *)self setShouldPreventUndoCommands:0];
}

- (void)redrawAndSave
{
  [(ICTableAttachmentViewController *)self redraw];

  [(ICTableAttachmentViewController *)self save];
}

- (void)updateHeightCacheForColumn:(id)a3 row:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  int v7 = [(ICTableAttachmentViewController *)self textViewManager];
  char v8 = [v7 rowIDs];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    double v10 = [(ICTableAttachmentViewController *)self cellHeightCache];
    CGFloat v11 = [v10 objectForKey:v6];

    if (!v11)
    {
      CGFloat v11 = (void *)[objc_alloc(MEMORY[0x263F5AC28]) initWithComparator:&__block_literal_global_16];
      uint64_t v12 = [(ICTableAttachmentViewController *)self cellHeightCache];
      [v12 setObject:v11 forKey:v6];
    }
    if (v15)
    {
      double v13 = [(ICTableAttachmentViewController *)self tableLayoutManager];
      double v14 = [v13 columnLayoutManagerForColumn:v15];

      [v14 heightOfCellAtRowID:v6];
      objc_msgSend(v11, "setDimension:forKey:", v15);
    }
  }
}

uint64_t __66__ICTableAttachmentViewController_updateHeightCacheForColumn_row___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)performInitialLayoutIfNeeded
{
  if (![(ICTableAttachmentViewController *)self performedInitialLayout]
    && [(ICTableAttachmentViewController *)self isViewLoaded])
  {
    [(ICTableAttachmentViewController *)self setPerformedInitialLayout:1];
    [(ICTableAttachmentViewController *)self setIsPerformingInitialLayout:1];
    [(ICTableAttachmentViewController *)self updateAvailableWidth];
    double v3 = [(ICTableAttachmentViewController *)self textViewManager];
    [(ICTableAttachmentViewController *)self viewport];
    objc_msgSend(v3, "initialScrollPointForViewport:");
    double v5 = v4;
    double v7 = v6;

    [(ICTableAttachmentViewController *)self updateContentSize];
    char v8 = [(ICTableAttachmentViewController *)self scrollView];
    objc_msgSend(v8, "setContentOffset:", v5, v7);

    [(ICTableAttachmentViewController *)self setIsPerformingInitialLayout:0];
  }
}

- (double)scrollerOutset
{
  return 0.0;
}

- (void)tableValueDidChangeAtColumnID:(id)a3 rowID:(id)a4 delta:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(ICTableAttachmentViewController *)self columnsNeedingWidthUpdate];
  [v10 addObject:v8];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__ICTableAttachmentViewController_tableValueDidChangeAtColumnID_rowID_delta___block_invoke;
  v13[3] = &unk_2640BA108;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __77__ICTableAttachmentViewController_tableValueDidChangeAtColumnID_rowID_delta___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1 < 0) {
    uint64_t v1 = -v1;
  }
  return [*(id *)(a1 + 32) updateCellSizeAtColumn:*(void *)(a1 + 40) row:*(void *)(a1 + 48) immediateWidthUpdate:(unint64_t)v1 > 2];
}

- (void)updateCellSizeAtColumn:(id)a3 row:(id)a4 immediateWidthUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v21 = a3;
  id v8 = a4;
  id v9 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  double v10 = [v9 columnID];
  int v11 = [v10 isEqual:v21];

  if (v11)
  {
    if (v5) {
      [(ICTableAttachmentViewController *)self updateColumnWidthForColumn:v21];
    }
    else {
      [(ICTableAttachmentViewController *)self updateEditedColumnWidthsAfterDelay];
    }
  }
  else
  {
    [(ICTableAttachmentViewController *)self updateEditedColumnWidths];
  }
  [(ICTableAttachmentViewController *)self updateHeightCacheForColumn:v21 row:v8];
  id v12 = [(ICTableAttachmentViewController *)self rowHeightCache];
  [v12 dimensionForKey:v8];
  double v14 = v13;

  id v15 = [(ICTableAttachmentViewController *)self cellHeightCache];
  int64_t v16 = [v15 objectForKey:v8];
  [v16 max];
  double v18 = v17;

  if (v14 != v18)
  {
    double v19 = [(ICTableAttachmentViewController *)self rowHeightCache];
    [v19 setDimension:v8 forKey:v18];

    double v20 = [(ICTableAttachmentViewController *)self textViewManager];
    [v20 heightChangedForRow:v8 by:v18 - v14];

    [(ICTableAttachmentViewController *)self updateContentSize];
  }
}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [(ICAttachmentViewController *)self attachment];
  objc_msgSend(v12, "filterInlineAttachmentsInTableColumnTextStorage:range:", v13, location, length);

  objc_msgSend(v13, "textStorage:didProcessEditing:range:changeInLength:", v11, a4, location, length, a6);
}

- (void)textStorage:(id)a3 didReplace:(id)a4 with:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if ([v12 length])
  {
    id v8 = [(ICAttachmentViewController *)self attachment];
    id v9 = [v8 note];
    [v9 markBlockAndInlineAttachmentsForDeletion:1 inAttributedString:v12];
  }
  if ([v7 length])
  {
    double v10 = [(ICAttachmentViewController *)self attachment];
    id v11 = [v10 note];
    [v11 markBlockAndInlineAttachmentsForDeletion:0 inAttributedString:v7];
  }
}

- (void)tappedTableAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(ICTableAttachmentViewController *)self textViewManager];
  id v22 = 0;
  id v23 = 0;
  int v7 = objc_msgSend(v6, "cellContainingPoint:columnID:rowID:", &v23, &v22, x, y);
  id v8 = v23;
  id v9 = v22;

  if (v7)
  {
    -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:touchPoint:](self, "beginEditingCellWithColumnID:andRowID:touchPoint:", v8, v9, x, y);
    goto LABEL_14;
  }
  uint64_t v10 = [(ICTableAttachmentViewController *)self table];
  if (!v10) {
    goto LABEL_6;
  }
  id v11 = (void *)v10;
  id v12 = [(ICTableAttachmentViewController *)self table];
  if (![v12 columnCount])
  {

    goto LABEL_10;
  }
  id v13 = [(ICTableAttachmentViewController *)self table];
  uint64_t v14 = [v13 rowCount];

  if (!v14)
  {
LABEL_10:
    int64_t v16 = [(ICTableAttachmentViewController *)self table];
    uint64_t v17 = [v16 columnCount];

    double v18 = [(ICTableAttachmentViewController *)self table];
    double v19 = v18;
    if (v17) {
      id v20 = (id)[v18 insertRowAtIndex:0];
    }
    else {
      id v21 = (id)[v18 insertColumnAtIndex:0];
    }

    [(ICTableAttachmentViewController *)self redrawAndSave];
    -[ICTableAttachmentViewController tappedTableAtLocation:](self, "tappedTableAtLocation:", x, y);
    goto LABEL_14;
  }
LABEL_6:
  id v15 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[ICTableAttachmentViewController tappedTableAtLocation:](self, v15);
  }

LABEL_14:
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 touchPoint:(CGPoint)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_touchPoint___block_invoke;
  v5[3] = &unk_2640BA130;
  v5[4] = self;
  CGPoint v6 = a5;
  [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:a3 andRowID:a4 textRange:v5];
}

uint64_t __84__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_touchPoint___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 tableContentView];
  objc_msgSend(v4, "convertPoint:fromView:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v6 = objc_msgSend(v3, "cursorPositionForLocation:inTextView:", v4);

  return v6;
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 location:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __82__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_location___block_invoke;
  uint64_t v14 = &unk_2640BA158;
  id v15 = v8;
  unint64_t v16 = a5;
  id v9 = v8;
  [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:a3 andRowID:v9 textRange:&v11];
  uint64_t v10 = [(ICTableAttachmentViewController *)self tableAXController];
  [v10 tableRowOrColumnSelectionDidChange];
}

uint64_t __82__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_location___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 textStorage];

  BOOL v5 = ICDynamicCast();

  uint64_t v6 = [v5 characterRangeForRowID:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v6;
  }
  if (v8 == 1) {
    uint64_t v9 = v6;
  }
  if (v8 == 2) {
    uint64_t v10 = v6 + v7;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

- (void)beginEditingInitialCell
{
  id v3 = [(ICTableAttachmentViewController *)self table];
  id v9 = [v3 stringForColumnIndex:0 rowIndex:0];

  BOOL v4 = [v9 length] != 0;
  BOOL v5 = [(ICTableAttachmentViewController *)self table];
  uint64_t v6 = [v5 identifierForColumnAtIndex:v4];

  uint64_t v7 = [(ICTableAttachmentViewController *)self table];
  uint64_t v8 = [v7 identifierForRowAtIndex:0];

  [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v6 andRowID:v8 location:2];
}

- (void)beginEditingSelectedRangeInTextView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 textStorage];
  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = objc_msgSend(v8, "rowAtIndex:rowRange:", objc_msgSend(v4, "selectedRange"), 0);
  uint64_t v7 = [v4 columnID];

  [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v7 andRowID:v6 textRange:&__block_literal_global_69];
}

uint64_t __71__ICTableAttachmentViewController_beginEditingSelectedRangeInTextView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectedRange];
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 textRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (uint64_t (**)(id, void *))a5;
  uint64_t v11 = [(ICTableAttachmentViewController *)self textViewManager];
  uint64_t v12 = [v11 textViewForColumn:v8 createIfNeeded:1];

  if (v12)
  {
    [(ICTableAttachmentViewController *)self setPreventScrolling:1];
    [(ICTableAttachmentViewController *)self setDidRecentlyAutoAddRow:0];
    [(ICTableAttachmentViewController *)self willBeginEditingWithTextView:v12];
    uint64_t v13 = v10[2](v10, v12);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v12, "setSelectedRange:", v13, v14);
    }
    id v15 = [(ICTableAttachmentViewController *)self textViewManager];
    [v15 ensureCellPositionForColumn:v8 andRow:v9];

    if ((objc_msgSend(v12, "ic_isFirstResponder") & 1) == 0)
    {
      [(ICTableAttachmentViewController *)self setMakingCellFirstResponder:1];
      unint64_t v16 = (void *)MEMORY[0x263F82E00];
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      double v19 = __83__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke;
      id v20 = &unk_2640B82D8;
      id v21 = self;
      id v22 = v12;
      objc_msgSend(v16, "ic_performWithoutAnimation:", &v17);
      -[ICTableAttachmentViewController setMakingCellFirstResponder:](self, "setMakingCellFirstResponder:", 0, v17, v18, v19, v20, v21);
    }
    [(ICTableAttachmentViewController *)self didBeginEditingWithTextView:v12];
  }
}

uint64_t __83__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_makeFirstResponder:", *(void *)(a1 + 40));
}

- (void)moveIntoTableWithDirection:(unint64_t)a3
{
  BOOL v5 = [(ICTableAttachmentViewController *)self table];
  uint64_t v6 = v5;
  if (a3 == 1)
  {
    char v7 = [v5 isLeftToRight];

    if ((v7 & 1) == 0)
    {
LABEL_3:
      id v8 = [(ICTableAttachmentViewController *)self table];
      id v9 = [(ICTableAttachmentViewController *)self table];
      objc_msgSend(v8, "identifierForColumnAtIndex:", objc_msgSend(v9, "columnCount") - 1);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = [(ICTableAttachmentViewController *)self table];
      uint64_t v11 = [(ICTableAttachmentViewController *)self table];
      uint64_t v12 = objc_msgSend(v10, "identifierForRowAtIndex:", objc_msgSend(v11, "rowCount") - 1);

      uint64_t v13 = self;
      id v14 = v20;
      id v15 = v12;
      uint64_t v16 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    int v17 = [v5 isRightToLeft];

    if (!v17) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = [(ICTableAttachmentViewController *)self table];
  id v20 = [v18 identifierForColumnAtIndex:0];

  double v19 = [(ICTableAttachmentViewController *)self table];
  uint64_t v12 = [v19 identifierForRowAtIndex:0];

  uint64_t v13 = self;
  id v14 = v20;
  id v15 = v12;
  uint64_t v16 = 0;
LABEL_6:
  [(ICTableAttachmentViewController *)v13 beginEditingCellWithColumnID:v14 andRowID:v15 location:v16];
}

- (void)willBeginEditingWithTextView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICTableAttachmentViewController *)self auxiliaryTextViewHost];
  [v5 setAuxiliaryResponder:v4];

  uint64_t v6 = [v4 TTTextStorage];

  [v6 breakUndoCoalescing];

  [(ICTableAttachmentViewController *)self updateEditedColumnWidths];
}

- (void)didBeginEditingWithTextView:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEditable])
  {
    objc_opt_class();
    BOOL v5 = [v4 textStorage];
    uint64_t v6 = ICDynamicCast();

    char v7 = [v6 columnID];
    id v8 = objc_msgSend(v6, "rowAtIndex:rowRange:", objc_msgSend(v4, "selectedRange"), 0);
    id v9 = objc_alloc_init(MEMORY[0x263F5B4A0]);
    [v9 selectCellAtColumn:v7 row:v8];
    uint64_t v10 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    [v10 setTextSelectionHidden:0];

    uint64_t v11 = [(ICTableAttachmentViewController *)self tableSelection];
    char v12 = [v11 isEqual:v9];

    if (v12)
    {
LABEL_8:
      [(ICTableAttachmentViewController *)self setTypingAttributesForTextView:v4];
      [(ICTableAttachmentViewController *)self updateChrome];

      goto LABEL_9;
    }
    uint64_t v13 = [(ICTableAttachmentViewController *)self undoTarget];
    [v6 setOverrideUndoTarget:v13];

    [(ICTableAttachmentViewController *)self setCurrentlyEditingTextView:v4];
    [(ICTableAttachmentViewController *)self setCurrentlyEditingTextStorage:v6];
    id v14 = [(ICTableAttachmentViewController *)self tableSelection];
    [v14 selectCellAtColumn:v7 row:v8];

    [(ICTableAttachmentViewController *)self cellFirstResponderChanged];
    v23[0] = v7;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v22 = v8;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [(ICTableAttachmentViewController *)self showButtonsAtColumns:v15 rows:v16];

    int v17 = [(ICTableAttachmentViewController *)self noteTextView];
    [v17 selectedRange];
    if (v18)
    {
      double v19 = [v4 window];

      if (!v19)
      {
LABEL_7:
        [(ICTableAttachmentViewController *)self setTypingAttributesForTextView:v4];
        goto LABEL_8;
      }
      int v17 = [(ICTableAttachmentViewController *)self noteTextView];
      uint64_t v20 = [v17 selectedRange];
      id v21 = [(ICTableAttachmentViewController *)self noteTextView];
      objc_msgSend(v21, "setSelectedRange:", v20, 0);
    }
    goto LABEL_7;
  }
LABEL_9:
}

- (void)endCellEditingSessionWithTextView:(id)a3
{
  id v13 = a3;
  if (objc_msgSend(v13, "ic_isFirstResponder")) {
    [(ICTableAttachmentViewController *)self ic_resignFirstResponder:v13];
  }
  [(ICTableAttachmentViewController *)self cellFirstResponderChanged];
  [(ICTableAttachmentViewController *)self setCurrentlyEditingTextView:0];
  [(ICTableAttachmentViewController *)self setCurrentlyEditingTextStorage:0];
  id v4 = [(ICTableAttachmentViewController *)self tableAttachmentProvider];
  [v4 updateTableFromMOC];

  BOOL v5 = [(ICTableAttachmentViewController *)self tableSelection];
  char v6 = [v5 isRangeOrSpanningSelection];

  if ((v6 & 1) == 0) {
    [(ICTableAttachmentViewController *)self hideColumnRowButtons];
  }
  char v7 = [(ICTableAttachmentViewController *)self auxiliaryTextViewHost];
  id v8 = [v7 auxiliaryResponder];

  if (v8 == v13)
  {
    id v9 = [(ICTableAttachmentViewController *)self auxiliaryTextViewHost];
    [v9 setAuxiliaryResponder:0];
  }
  uint64_t v10 = [(ICTableAttachmentViewController *)self textViewManager];
  uint64_t v11 = [v13 columnID];
  char v12 = [v10 textViewForColumn:v11];

  objc_msgSend(v12, "ic_setNeedsDisplay");
}

- (void)setTypingAttributesForTextView:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  id v3 = [v12 textStorage];
  id v4 = ICDynamicCast();

  objc_opt_class();
  BOOL v5 = [v4 styler];
  char v6 = ICDynamicCast();

  if (v6)
  {
    uint64_t v7 = [v12 selectedRange];
    uint64_t v9 = v8;
    uint64_t v10 = [v12 typingAttributes];
    uint64_t v11 = objc_msgSend(v6, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v7, v9, 1, v10, v4);
    [v12 setTypingAttributes:v11];
  }
}

- (BOOL)containedInNoteSelection
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (![(ICTableAttachmentViewController *)self performedInitialLayout]
    || [(ICTableAttachmentViewController *)self shouldBeginInitialEditing])
  {
    return 0;
  }
  id v4 = [(ICTableAttachmentViewController *)self noteTextView];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    [v4 textLayoutManager];
  }
  else
  {
    objc_opt_class();
    [v4 layoutManager];
  BOOL v5 = };
  char v6 = ICCheckedDynamicCast();

  uint64_t v7 = [(ICAttachmentViewController *)self attachment];
  NSUInteger v8 = [v6 rangeForAttachment:v7 withTextAttachment:0];
  NSUInteger v10 = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = objc_msgSend(v4, "ic_selectedRanges", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v23.NSUInteger location = [*(id *)(*((void *)&v17 + 1) + 8 * i) rangeValue];
        v24.NSUInteger location = v8;
        v24.NSUInteger length = v10;
        if (NSIntersectionRange(v23, v24).length)
        {
          BOOL v3 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 0;
LABEL_17:

  return v3;
}

- (BOOL)acceptsKeystrokes
{
  BOOL v3 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v3 moving])
  {
    char v4 = 0;
  }
  else
  {
    BOOL v5 = [(ICAttachmentViewController *)self attachment];
    char v6 = [v5 note];
    char v4 = [v6 isEditable];
  }
  return v4;
}

- (BOOL)cursorPrefersWordBoundary
{
  return 0;
}

- (unint64_t)cursorPositionForLocation:(CGPoint)a3 inTextView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  NSUInteger v8 = objc_msgSend(v7, "closestPositionToPoint:", x, y);
  NSUInteger v9 = [v7 beginningOfDocument];
  unint64_t v10 = [v7 offsetFromPosition:v9 toPosition:v8];

  if ([(ICTableAttachmentViewController *)self cursorPrefersWordBoundary])
  {
    uint64_t v11 = [v7 textStorage];
    uint64_t v12 = [v11 string];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      if (!objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v10 - 1)))
      {
LABEL_7:

        goto LABEL_14;
      }
    }
    if ([v12 length] <= v10 + 1)
    {
      BOOL v14 = (unint64_t)[v12 length] > 1;
      if (!v10) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      if (objc_msgSend(v13, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v10 + 1)))
      {

        if (!v10) {
          goto LABEL_14;
        }
        goto LABEL_7;
      }
      BOOL v14 = (unint64_t)[v12 length] > 1;

      if (!v10)
      {
LABEL_12:
        if (v14)
        {
          unint64_t v10 = 0;
LABEL_16:

          goto LABEL_17;
        }
LABEL_14:
        id v15 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        unint64_t v10 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v15, 0, v10, objc_msgSend(v12, "length") - v10);

        if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v10 = [v12 length];
        }
        goto LABEL_16;
      }
    }

    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
LABEL_17:

  return v10;
}

- (void)scrollToSelectionInTextView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v39 = a5;
  id v8 = a3;
  [v8 selectionRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  long long v17 = [(ICTableAttachmentViewController *)self tableContentView];
  objc_msgSend(v17, "convertRect:fromView:", v8, v10, v12, v14, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v26 = [(ICTableAttachmentViewController *)self textViewManager];
  v27 = [v8 columnID];

  [v26 frameOfColumn:v27];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  v41.origin.double x = v29;
  v41.origin.double y = v31;
  v41.size.width = v33;
  v41.size.height = v35;
  double MinX = CGRectGetMinX(v41);
  v42.origin.double x = v19;
  v42.origin.double y = v21;
  v42.size.width = v23;
  v42.size.height = v25;
  double MinY = CGRectGetMinY(v42);
  v43.origin.double x = v29;
  v43.origin.double y = v31;
  v43.size.width = v33;
  v43.size.height = v35;
  double Width = CGRectGetWidth(v43);
  v44.origin.double x = v19;
  v44.origin.double y = v21;
  v44.size.width = v23;
  v44.size.height = v25;
  -[ICTableAttachmentViewController scrollToRect:animated:completion:](self, "scrollToRect:animated:completion:", v5, v39, MinX, MinY, Width, CGRectGetHeight(v44));
}

- (void)beginEditingNoteAtOffset:(int64_t)a3
{
  BOOL v5 = [(ICTableAttachmentViewController *)self tableSelection];
  [v5 unselect];

  char v6 = [(ICAttachmentViewController *)self attachment];
  id v7 = [v6 note];
  id v8 = [(ICAttachmentViewController *)self attachment];
  unint64_t v9 = [v7 rangeForAttachment:v8];

  if (v9 <= -a3 && a3 <= 0) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = v9 + a3;
  }

  -[ICTableAttachmentViewController beginEditingNoteAtRange:](self, "beginEditingNoteAtRange:", v11, 0);
}

- (void)selectTable
{
  BOOL v3 = [(ICTableAttachmentViewController *)self tableSelection];
  [v3 unselect];

  char v4 = [(ICAttachmentViewController *)self attachment];
  BOOL v5 = [v4 note];
  char v6 = [(ICAttachmentViewController *)self attachment];
  uint64_t v7 = [v5 rangeForAttachment:v6];
  uint64_t v9 = v8;

  -[ICTableAttachmentViewController beginEditingNoteAtRange:](self, "beginEditingNoteAtRange:", v7, v9);
}

- (id)dragSnapshotFromRect:(CGRect)a3 afterScreenUpdates:(BOOL)a4
{
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);

  return v4;
}

- (unint64_t)preferredNavigationSelection
{
  return 0;
}

- (id)account
{
  objc_super v2 = [(ICAttachmentViewController *)self attachment];
  BOOL v3 = [v2 note];
  id v4 = [v3 account];

  return v4;
}

- (id)note
{
  objc_super v2 = [(ICAttachmentViewController *)self attachment];
  BOOL v3 = [v2 note];

  return v3;
}

- (CGRect)frameOfCellForColumnTextView:(id)a3 row:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICTableAttachmentViewController *)self textViewManager];
  uint64_t v9 = [v7 columnID];
  [v8 frameOfCellAtColumn:v9 row:v6];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [v7 superview];
  objc_msgSend(v18, "convertRect:toView:", v7, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)movePrevCell
{
  unint64_t v3 = [(ICTableAttachmentViewController *)self preferredNavigationSelection];

  [(ICTableAttachmentViewController *)self movePrevCellAtLocation:v3];
}

- (void)moveNextCell
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "moveNextCell: column or row index not found", v2, v3, v4, v5, v6);
}

- (void)moveShiftReturnCell
{
  unint64_t v3 = [(ICTableAttachmentViewController *)self preferredNavigationSelection];

  [(ICTableAttachmentViewController *)self moveUpCellAtLocation:v3];
}

- (void)moveReturnCell
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "moveReturnCell: row index not found", v2, v3, v4, v5, v6);
}

- (void)moveUpCell
{
}

- (void)moveDownCell
{
}

- (void)moveLeftCell
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self table];
  int v4 = [v3 isLeftToRight];

  if (v4)
  {
    [(ICTableAttachmentViewController *)self movePrevCellAtLocation:2];
  }
  else
  {
    [(ICTableAttachmentViewController *)self moveNextCellAtLocation:0];
  }
}

- (void)moveRightCell
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self table];
  int v4 = [v3 isLeftToRight];

  if (v4)
  {
    [(ICTableAttachmentViewController *)self moveNextCellAtLocation:0];
  }
  else
  {
    [(ICTableAttachmentViewController *)self movePrevCellAtLocation:2];
  }
}

- (BOOL)pasteCellRange
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self icTableFromPasteboard];
  if (v3)
  {
    int v4 = [(ICTableAttachmentViewController *)self table];
    uint64_t v5 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v6 = [v5 type];
    BOOL v7 = v6 != 0;

    if (v6)
    {
      uint64_t v8 = [(ICTableAttachmentViewController *)self tableSelection];
      uint64_t v9 = [v8 rows];
      double v10 = [v9 firstObject];

      if (!v10) {
        objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((selectedRow) != nil)", "-[ICTableAttachmentViewController pasteCellRange]", 1, 0, @"Expected non-nil value for '%s'", "selectedRow");
      }
      uint64_t v11 = [v4 rowIndexForIdentifier:v10];
      double v12 = [(ICTableAttachmentViewController *)self tableSelection];
      double v13 = [v12 columns];
      double v14 = [v13 firstObject];

      if (!v14) {
        objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((selectedColumn) != nil)", "-[ICTableAttachmentViewController pasteCellRange]", 1, 0, @"Expected non-nil value for '%s'", "selectedColumn");
      }
      uint64_t v15 = [v4 columnIndexForIdentifier:v14];
      if ([(ICTableAttachmentViewController *)self makeSpaceToPasteSourceTable:v3])
      {
        [(ICTableAttachmentViewController *)self pasteTable:v3 atColumnIndex:v15 rowIndex:v11 shouldSetSelectionToPastedRange:0];
      }
      else
      {
        double v16 = [v3 joinedAttributedStringForColumns:0 rows:0];
        double v17 = [(ICAttachmentViewController *)self attachment];
        double v18 = [v17 managedObjectContext];
        double v19 = objc_msgSend(v16, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v18);

        double v20 = [(ICAttachmentViewController *)self attachment];
        double v21 = [v20 managedObjectContext];
        double v22 = objc_msgSend(v19, "ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:", v21);

        double v23 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        CGFloat v33 = objc_msgSend(v23, "ic_selectedRanges");

        double v24 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
        [v24 setIsReadingSelectionFromPasteboard:1];

        double v25 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
        double v26 = [v33 firstObject];
        uint64_t v27 = [v26 rangeValue];
        objc_msgSend(v25, "replaceCharactersInRange:withAttributedString:", v27, v28, v22);

        double v29 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        double v30 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        objc_msgSend(v29, "setSelectedRange:", objc_msgSend(v30, "selectedRange") + objc_msgSend(v22, "length"), 0);

        CGFloat v31 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
        [v31 setIsReadingSelectionFromPasteboard:0];

        [(ICTableAttachmentViewController *)self save];
        [(ICTableAttachmentViewController *)self updateCellSizeAtColumn:v14 row:v10 immediateWidthUpdate:1];
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)didPasteOrDropTextForTableColumnTextView:(id)a3
{
  int v4 = [a3 columnID];
  [(ICTableAttachmentViewController *)self updateColumnWidthForColumn:v4];

  [(ICTableAttachmentViewController *)self save];
}

- (void)moveNextLineAtLocation:(unint64_t)a3
{
  uint64_t v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (v5)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self table];
    BOOL v7 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v8 = [v7 rows];
    uint64_t v9 = [v8 firstObject];
    unint64_t v10 = [v6 rowIndexForIdentifier:v9];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ICTableAttachmentViewController moveNextLineAtLocation:]();
      }
    }
    else
    {
      double v12 = [(ICTableAttachmentViewController *)self table];
      unint64_t v13 = [v12 rowCount] - 1;

      if (v10 < v13)
      {
        double v14 = [(ICTableAttachmentViewController *)self table];
        id v17 = [v14 identifierForRowAtIndex:v10 + 1];

        uint64_t v15 = [(ICTableAttachmentViewController *)self table];
        double v16 = [v15 identifierForColumnAtIndex:0];

        [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v16 andRowID:v17 location:a3];
        [(ICTableAttachmentViewController *)self speakAccessibilityAnnouncementForMoveToCellWithColumnID:v16 rowID:v17];
      }
    }
  }
}

- (void)moveUpCellAtLocation:(unint64_t)a3
{
  uint64_t v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (v5)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self table];
    BOOL v7 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v8 = [v7 columns];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v6 columnIndexForIdentifier:v9];

    uint64_t v11 = [(ICTableAttachmentViewController *)self table];
    double v12 = [(ICTableAttachmentViewController *)self tableSelection];
    unint64_t v13 = [v12 rows];
    double v14 = [v13 firstObject];
    uint64_t v15 = [v11 rowIndexForIdentifier:v14];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ICTableAttachmentViewController moveUpCellAtLocation:]();
      }
    }
    else if (v15)
    {
      double v16 = [(ICTableAttachmentViewController *)self table];
      id v20 = [v16 identifierForColumnAtIndex:v10];

      id v17 = [(ICTableAttachmentViewController *)self table];
      double v18 = [v17 identifierForRowAtIndex:v15 - 1];

      [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v20 andRowID:v18 location:a3];
      [(ICTableAttachmentViewController *)self speakAccessibilityAnnouncementForMoveToCellWithColumnID:v20 rowID:v18];
    }
    else
    {
      [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:-1];
    }
  }
}

- (void)moveDownCellAtLocation:(unint64_t)a3
{
  uint64_t v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (v5)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self table];
    BOOL v7 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v8 = [v7 columns];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v6 columnIndexForIdentifier:v9];

    uint64_t v11 = [(ICTableAttachmentViewController *)self table];
    double v12 = [(ICTableAttachmentViewController *)self tableSelection];
    unint64_t v13 = [v12 rows];
    double v14 = [v13 firstObject];
    unint64_t v15 = [v11 rowIndexForIdentifier:v14];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v21 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ICTableAttachmentViewController moveDownCellAtLocation:]();
      }
    }
    else
    {
      double v16 = [(ICTableAttachmentViewController *)self table];
      unint64_t v17 = [v16 rowCount] - 1;

      if (v15 >= v17)
      {
        [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:2];
      }
      else
      {
        double v18 = [(ICTableAttachmentViewController *)self table];
        id v22 = [v18 identifierForColumnAtIndex:v10];

        double v19 = [(ICTableAttachmentViewController *)self table];
        id v20 = [v19 identifierForRowAtIndex:v15 + 1];

        [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v22 andRowID:v20 location:a3];
        [(ICTableAttachmentViewController *)self speakAccessibilityAnnouncementForMoveToCellWithColumnID:v22 rowID:v20];
      }
    }
  }
}

- (void)movePrevCellAtLocation:(unint64_t)a3
{
  uint64_t v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (v5)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self table];
    BOOL v7 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v8 = [v7 columns];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v6 columnIndexForIdentifier:v9];

    uint64_t v11 = [(ICTableAttachmentViewController *)self table];
    double v12 = [(ICTableAttachmentViewController *)self tableSelection];
    unint64_t v13 = [v12 rows];
    double v14 = [v13 firstObject];
    uint64_t v15 = [v11 rowIndexForIdentifier:v14];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v20 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[ICTableAttachmentViewController movePrevCellAtLocation:]();
      }
    }
    else if (v10 | v15)
    {
      if (!v10)
      {
        double v16 = [(ICTableAttachmentViewController *)self table];
        uint64_t v10 = [v16 columnCount];

        --v15;
      }
      unint64_t v17 = [(ICTableAttachmentViewController *)self table];
      id v21 = [v17 identifierForColumnAtIndex:v10 - 1];

      double v18 = [(ICTableAttachmentViewController *)self table];
      double v19 = [v18 identifierForRowAtIndex:v15];

      [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v21 andRowID:v19 location:a3];
      [(ICTableAttachmentViewController *)self speakAccessibilityAnnouncementForMoveToCellWithColumnID:v21 rowID:v19];
    }
    else
    {
      [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:0];
    }
  }
}

- (void)moveNextCellAtLocation:(unint64_t)a3
{
  uint64_t v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (!v5) {
    return;
  }
  uint64_t v6 = [(ICTableAttachmentViewController *)self table];
  BOOL v7 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v8 = [v7 columns];
  uint64_t v9 = [v8 firstObject];
  unint64_t v10 = [v6 columnIndexForIdentifier:v9];

  uint64_t v11 = [(ICTableAttachmentViewController *)self table];
  double v12 = [(ICTableAttachmentViewController *)self tableSelection];
  unint64_t v13 = [v12 rows];
  double v14 = [v13 firstObject];
  unint64_t v15 = [v11 rowIndexForIdentifier:v14];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ICTableAttachmentViewController moveNextCellAtLocation:]();
    }
  }
  else
  {
    double v16 = [(ICTableAttachmentViewController *)self table];
    if (v10 < [v16 columnCount] - 1)
    {

LABEL_11:
      id v20 = [(ICTableAttachmentViewController *)self table];
      unint64_t v21 = [v20 columnCount] - 1;

      if (v10 < v21)
      {
        unint64_t v22 = v10 + 1;
      }
      else
      {
        ++v15;
        unint64_t v22 = 0;
      }
      double v23 = [(ICTableAttachmentViewController *)self table];
      id v26 = [v23 identifierForColumnAtIndex:v22];

      double v24 = [(ICTableAttachmentViewController *)self table];
      double v25 = [v24 identifierForRowAtIndex:v15];

      [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v26 andRowID:v25 location:a3];
      [(ICTableAttachmentViewController *)self speakAccessibilityAnnouncementForMoveToCellWithColumnID:v26 rowID:v25];

      return;
    }
    double v18 = [(ICTableAttachmentViewController *)self table];
    unint64_t v19 = [v18 rowCount] - 1;

    if (v15 < v19) {
      goto LABEL_11;
    }
    [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:1];
  }
}

- (BOOL)makeSpaceToPasteSourceTable:(id)a3
{
  id v4 = a3;
  [(ICTableAttachmentViewController *)self beginEditing];
  uint64_t v5 = [(ICTableAttachmentViewController *)self table];
  uint64_t v6 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v6 type] != 1) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"ICTableAttachmentSelectionTypeCell == tableSelection.type" functionName:"-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]" simulateCrash:1 showAlert:0 format:@"Expected a cell editing selection when pasting a cell range"];
  }
  BOOL v7 = [v6 columns];
  uint64_t v8 = [v5 columnIndexesForIdentifiers:v7];

  if ([v8 count] != 1) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"1 == selectedColumnIndexes.count" functionName:"-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]" simulateCrash:1 showAlert:0 format:@"Expected a single column in this selection"];
  }
  uint64_t v9 = [v6 rows];
  unint64_t v10 = [v5 rowIndexesForIdentifiers:v9];

  if ([v10 count] != 1) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"1 == selectedRowIndexes.count" functionName:"-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]" simulateCrash:1 showAlert:0 format:@"Expected a single row in this selection"];
  }
  uint64_t v11 = [v8 firstIndex];
  CGRect v42 = v10;
  uint64_t v12 = [v10 firstIndex];
  unint64_t v13 = [v4 columnCount];
  unint64_t v14 = [v4 rowCount];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"selectedColumnIndex >= 0 && selectedColumnIndex != NSNotFound", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, @"Expected valid selected column index, got %lu.", 0x7FFFFFFFFFFFFFFFLL functionName simulateCrash showAlert format];
  }
  CGRect v43 = v4;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"selectedRowIndex >= 0 && selectedRowIndex != NSNotFound", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, @"Expected valid selected row index, got %lu.", 0x7FFFFFFFFFFFFFFFLL functionName simulateCrash showAlert format];
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v11, v13);
  v40 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v12, v14);
  CGRect v41 = (void *)v15;
  if ((objc_msgSend(v5, "isEmptyAtColumnIndexes:rowIndexes:", v15) & 1) == 0)
  {
    id v39 = self;
    unint64_t v17 = [v5 rowCount];
    unint64_t v18 = [v5 columnCount];
    if ([v5 rowIsEmptyAtIndex:v12])
    {
      double v37 = v8;
      double v38 = v6;
      uint64_t v19 = 1;
      while (1)
      {
        unint64_t v20 = v14 - v19;
        BOOL v21 = v14 != v19;
        if (v14 == v19 || v12 + v19 >= v17) {
          break;
        }
        ++v19;
        if ((objc_msgSend(v5, "rowIsEmptyAtIndex:") & 1) == 0)
        {
          BOOL v21 = 1;
          break;
        }
      }
      id v22 = (id)[v5 insertRows:v20 atIndex:v12];
      if (v13 >= v18 - v11) {
        unint64_t v23 = v13 - (v18 - v11);
      }
      else {
        unint64_t v23 = 0;
      }
      double v24 = [(ICTableAttachmentViewController *)v39 table];

      if (v5 != v24) {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"destinationTable == self.table" functionName:"-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]" simulateCrash:1 showAlert:0 format:@"destination table should be self.table"];
      }
      self = v39;
      id v25 = [(ICTableAttachmentViewController *)v39 insertColumns:v23 atIndex:v18];
      char v26 = v13 > v18 - v11 || v21;
      if ((v26 & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      if (![v5 columnIsEmptyAtIndex:v11])
      {
        BOOL v16 = 0;
        self = v39;
        goto LABEL_47;
      }
      double v37 = v8;
      double v38 = v6;
      uint64_t v27 = 1;
      while (1)
      {
        unint64_t v28 = v13 - v27;
        BOOL v29 = v13 != v27;
        if (v13 == v27 || v11 + v27 >= v18) {
          break;
        }
        ++v27;
        if ((objc_msgSend(v5, "rowIsEmptyAtIndex:") & 1) == 0)
        {
          BOOL v29 = 1;
          break;
        }
      }
      double v30 = [(ICTableAttachmentViewController *)v39 table];

      if (v5 != v30) {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"destinationTable == self.table" functionName:"-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]" simulateCrash:1 showAlert:0 format:@"destination table should be self.table"];
      }
      id v31 = [(ICTableAttachmentViewController *)v39 insertColumns:v28 atIndex:v11];
      if (v14 >= v17 - v12) {
        unint64_t v32 = v14 - (v17 - v12);
      }
      else {
        unint64_t v32 = 0;
      }
      int v33 = v14 > v17 - v12 || v29;
      unint64_t v34 = v17;
      self = v39;
      id v35 = (id)[v5 insertRows:v32 atIndex:v34];
      if (v33 != 1) {
        goto LABEL_29;
      }
    }
    [(ICTableAttachmentViewController *)self postChangeNotification:2 columnOrRowUUIDs:0];
    [(ICTableAttachmentViewController *)self redrawAndSave];
LABEL_29:
    BOOL v16 = 1;
    uint64_t v8 = v37;
    uint64_t v6 = v38;
    goto LABEL_47;
  }
  BOOL v16 = 1;
LABEL_47:
  [(ICTableAttachmentViewController *)self endEditing];

  return v16;
}

- (void)beginEditing
{
  unint64_t v3 = [(ICTableAttachmentViewController *)self editingCount] + 1;

  [(ICTableAttachmentViewController *)self setEditingCount:v3];
}

- (void)endEditing
{
  if ([(ICTableAttachmentViewController *)self editingCount]) {
    [(ICTableAttachmentViewController *)self setEditingCount:[(ICTableAttachmentViewController *)self editingCount] - 1];
  }
  if (![(ICTableAttachmentViewController *)self editingCount])
  {
    unint64_t v3 = [(ICTableAttachmentViewController *)self undoCommands];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = [(ICTableAttachmentViewController *)self undoCommands];
      uint64_t v6 = (void *)[v5 copy];

      BOOL v7 = [(ICTableAttachmentViewController *)self undoTarget];
      uint64_t v8 = [(ICTableAttachmentViewController *)self undoManager];
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      unint64_t v14 = __45__ICTableAttachmentViewController_endEditing__block_invoke;
      uint64_t v15 = &unk_2640BA1A0;
      id v16 = v7;
      id v17 = v6;
      id v9 = v6;
      id v10 = v7;
      [v8 registerUndoWithTarget:v10 handler:&v12];

      uint64_t v11 = [(ICTableAttachmentViewController *)self undoCommands];
      [v11 removeAllObjects];
    }
  }
}

void __45__ICTableAttachmentViewController_endEditing__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) tableAttachmentViewControllerForUndo];
  [v2 tableAttachmentWillChange];
  [v2 beginEditing];
  unint64_t v3 = [v2 table];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "reverseObjectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [v2 endEditing];
  [v2 tableAttachmentDidChange];
  [v2 save];
}

- (unint64_t)selectedStyleBIUS
{
  unint64_t v4 = 0;
  id v2 = [(ICTableAttachmentViewController *)self namedStylesForCurrentSelectionAndBIUS:&v4];
  return v4;
}

- (NSIndexSet)selectedStyles
{
  return (NSIndexSet *)[(ICTableAttachmentViewController *)self namedStylesForCurrentSelectionAndBIUS:0];
}

- (BOOL)canIndent
{
  return 0;
}

- (BOOL)canOutdent
{
  return 0;
}

- (BOOL)canStyleText
{
  return 0;
}

- (BOOL)canToggleTodo
{
  return 0;
}

- (BOOL)canIndentByamount:(int64_t)a3
{
  return 0;
}

- (void)toggleTodoStyle:(id)a3
{
  unint64_t v4 = [(ICTableAttachmentViewController *)self selectedStyles];
  int v5 = [v4 containsIndex:103];

  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 103;
  }

  [(ICTableAttachmentViewController *)self setSelectionNamedStyle:v6];
}

- (void)disableBoldface:(id)a3
{
}

- (void)disableItalics:(id)a3
{
}

- (void)disableStrikethrough:(id)a3
{
}

- (void)disableUnderline:(id)a3
{
}

- (void)enableBoldface:(id)a3
{
}

- (void)enableItalics:(id)a3
{
}

- (void)enableStrikethrough:(id)a3
{
}

- (void)enableUnderline:(id)a3
{
}

- (void)toggleBoldface:(id)a3
{
}

- (void)toggleItalics:(id)a3
{
}

- (void)toggleUnderline:(id)a3
{
}

- (void)toggleStrikethrough:(id)a3
{
}

- (void)toggleEmphasis:(id)a3
{
}

- (void)toggleBIUS:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v5 = [(ICTableAttachmentViewController *)self namedStylesForCurrentSelectionAndBIUS:&v6];
  [(ICTableAttachmentViewController *)self setSelectionBIUSStyle:a3 toggleOn:(a3 & ~v6) != 0];
}

- (BOOL)becomeFirstResponderForAuxStyling
{
  return 0;
}

- (BOOL)resignFirstResponderForAuxStyling
{
  return 0;
}

- (void)copyTable:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = [(ICTableAttachmentViewController *)self table];
  long long v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "columnCount"));

  long long v10 = [(ICTableAttachmentViewController *)self table];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __45__ICTableAttachmentViewController_copyTable___block_invoke;
  v24[3] = &unk_2640BA1C8;
  id v25 = v9;
  id v11 = v9;
  [v10 enumerateColumnsWithBlock:v24];

  long long v12 = (void *)MEMORY[0x263EFF980];
  uint64_t v13 = [(ICTableAttachmentViewController *)self table];
  uint64_t v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "rowCount"));

  uint64_t v15 = [(ICTableAttachmentViewController *)self table];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  BOOL v21 = __45__ICTableAttachmentViewController_copyTable___block_invoke_2;
  id v22 = &unk_2640BA1C8;
  id v23 = v14;
  id v16 = v14;
  [v15 enumerateRowsWithBlock:&v19];

  id v17 = [(ICTableAttachmentViewController *)self tableSelection];
  [v17 selectCellRangeAtColumns:v11 rows:v16];

  [(ICTableAttachmentViewController *)self copySelection:v4];
  unint64_t v18 = [(ICTableAttachmentViewController *)self tableSelection];
  [v18 setSelectionEqualTo:v6];
}

uint64_t __45__ICTableAttachmentViewController_copyTable___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __45__ICTableAttachmentViewController_copyTable___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)convertTableToText:(id)a3
{
  id v4 = [(ICTableAttachmentViewController *)self table];
  id v5 = [(ICAttachmentViewController *)self attachment];
  uint64_t v6 = [v5 note];
  id v25 = [v4 joinedAttributedStringForColumns:0 rows:0 deepCopyInlineAttachments:1 note:v6 parentAttachment:0];

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    uint64_t v7 = [(ICTableAttachmentViewController *)self noteTextView];
    [v7 textLayoutManager];
  }
  else
  {
    objc_opt_class();
    uint64_t v7 = [(ICTableAttachmentViewController *)self noteTextView];
    [v7 layoutManager];
  uint64_t v8 = };
  long long v9 = ICDynamicCast();

  long long v10 = [(ICAttachmentViewController *)self attachment];
  uint64_t v11 = [v9 rangeForAttachment:v10 withTextAttachment:0];
  uint64_t v13 = v12;

  uint64_t v14 = [(ICTableAttachmentViewController *)self noteTextView];
  uint64_t v15 = [v14 textStorage];
  [v15 beginEditing];

  id v16 = [(ICTableAttachmentViewController *)self noteTextView];
  id v17 = [v16 textStorage];
  objc_msgSend(v17, "replaceCharactersInRange:withAttributedString:", v11, v13, v25);

  unint64_t v18 = [(ICTableAttachmentViewController *)self noteTextView];
  uint64_t v19 = [v18 textStorage];
  [v19 endEditing];

  uint64_t v20 = [(ICTableAttachmentViewController *)self noteTextView];
  BOOL v21 = [v20 delegate];
  id v22 = [(ICTableAttachmentViewController *)self noteTextView];
  [v21 textViewDidChange:v22];

  uint64_t v23 = [v25 length];
  double v24 = [(ICTableAttachmentViewController *)self noteTextView];
  objc_msgSend(v24, "setSelectedRange:", v11, v23);
}

- (void)updateTableColumnDirectionForWritingDirection:(int64_t)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = [(ICTableAttachmentViewController *)self table];
  int v6 = [v5 isRightToLeft];

  if (a3 == 1)
  {
    if (v6) {
      return;
    }
  }
  else if (!v6)
  {
    return;
  }
  uint64_t v7 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v8 = [v7 columns];

  long long v9 = [(ICTableAttachmentViewController *)self tableSelection];
  long long v10 = [v9 rows];

  if (![v10 count])
  {
    uint64_t v11 = [(ICTableAttachmentViewController *)self table];
    uint64_t v12 = [v11 identifierForRowAtIndex:0];
    v16[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

    long long v10 = (void *)v13;
  }
  [(ICTableAttachmentViewController *)self hideColumnRowButtons];
  uint64_t v14 = [(ICTableAttachmentViewController *)self table];
  [v14 reverseColumnDirection];

  [(ICTableAttachmentViewController *)self updateTableCellsWithDirection:a3 columnIndexes:0 rowIndexes:0];
  uint64_t v15 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (v15)
  {
    [(ICTableAttachmentViewController *)self setRowButton:0];
    [(ICTableAttachmentViewController *)self setColumnButton:0];
    [(ICTableAttachmentViewController *)self showButtonsAtColumns:v8 rows:v10];
  }
  [(ICTableAttachmentViewController *)self redrawAndSave];
  [(ICTableAttachmentViewController *)self updateAttachmentParagraphForWritingDirection:a3];
}

- (void)reverseTableColumnDirection:(id)a3
{
  id v4 = [(ICTableAttachmentViewController *)self table];
  if ([v4 isRightToLeft]) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 1;
  }

  [(ICTableAttachmentViewController *)self updateTableColumnDirectionForWritingDirection:v5];
}

- (void)updateAttachmentParagraphForWritingDirection:(int64_t)a3
{
  id v17 = [(ICAttachmentViewController *)self attachment];
  uint64_t v5 = [v17 note];
  int v6 = [v5 textStorage];

  objc_opt_class();
  uint64_t v7 = [v6 styler];
  uint64_t v8 = ICDynamicCast();

  uint64_t v9 = [v17 rangeInNote];
  uint64_t v11 = v10;
  uint64_t v12 = [v6 string];
  uint64_t v13 = objc_msgSend(v12, "paragraphRangeForRange:", v9, v11);
  uint64_t v15 = v14;

  id v16 = [(ICTableAttachmentViewController *)self noteTextView];
  objc_msgSend(v8, "setParagraphWritingDirectionInRange:toDirection:inTextView:", v13, v15, a3, v16);
}

- (void)applyUndoGroup:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICCheckedDynamicCast();
  int v6 = [v5 columnID];
  uint64_t v7 = [v5 rowID];
  uint64_t v8 = [(ICTableAttachmentViewController *)self table];
  if ([v8 containsColumn:v6] && objc_msgSend(v8, "containsRow:", v7))
  {
    uint64_t v9 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v10 = [(ICTableAttachmentViewController *)self textViewManager];
    uint64_t v11 = [v10 textViewForColumn:v6];

    objc_opt_class();
    id v39 = v11;
    uint64_t v12 = [v11 textStorage];
    uint64_t v13 = ICDynamicCast();

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke;
    aBlock[3] = &unk_2640BA1F0;
    aBlock[4] = self;
    id v40 = v6;
    id v45 = v40;
    id v36 = v7;
    id v46 = v36;
    id v37 = v13;
    id v47 = v37;
    id v48 = v4;
    uint64_t v14 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v15 = [v5 tableSelection];
    uint64_t v16 = [v15 type];

    double v38 = v9;
    if (v16 != 1)
    {
      uint64_t v19 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

      if (v19)
      {
        uint64_t v20 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        [(ICTableAttachmentViewController *)self endCellEditingSessionWithTextView:v20];
      }
      v14[2](v14);
      BOOL v21 = [(ICTableAttachmentViewController *)self tableSelection];
      id v22 = [v5 tableSelection];
      [v21 setSelectionEqualTo:v22];

      [(ICTableAttachmentViewController *)self updateChrome];
      uint64_t v23 = [v5 tableSelection];
      if (![v23 type])
      {
        double v30 = [(ICTableAttachmentViewController *)self noteTextView];
        int v31 = [v30 isEditable];

        BOOL v29 = v37;
        if (v31)
        {
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_3;
          v41[3] = &unk_2640BA218;
          id v42 = v37;
          id v43 = v36;
          [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v40 andRowID:v43 textRange:v41];
        }
        goto LABEL_18;
      }

LABEL_17:
      BOOL v29 = v37;
LABEL_18:
      [(ICTableAttachmentViewController *)self updateColumnWidthForColumn:v40];
      [(ICTableAttachmentViewController *)self save];

      goto LABEL_19;
    }
    if ([v9 type] == 1)
    {
      id v17 = [v9 columns];
      unint64_t v18 = [v17 objectAtIndexedSubscript:0];
      if ([v40 isEqual:v18])
      {
        unint64_t v34 = [v9 rows];
        int v33 = [v34 objectAtIndexedSubscript:0];
        if (objc_msgSend(v36, "isEqual:"))
        {

          goto LABEL_14;
        }
        char v32 = [v39 isEditable];

        if ((v32 & 1) == 0)
        {
LABEL_14:
          double v24 = [(ICTableAttachmentViewController *)self tableSelection];
          uint64_t v25 = [v24 type];

          if (v25 == 1)
          {
            v14[2](v14);
          }
          else
          {
            char v26 = [(ICTableAttachmentViewController *)self tableSelection];
            uint64_t v27 = [v5 tableSelection];
            [v26 setSelectionEqualTo:v27];

            v14[2](v14);
            unint64_t v28 = [(ICTableAttachmentViewController *)self tableSelection];
            [v28 unselect];
          }
          goto LABEL_17;
        }
      }
      else
      {
        int v35 = [v39 isEditable];

        if (!v35) {
          goto LABEL_14;
        }
      }
    }
    else if (([v39 isEditable] & 1) == 0)
    {
      goto LABEL_14;
    }
    [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v40 andRowID:v36 location:0];
    goto LABEL_14;
  }
LABEL_19:
}

void __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) table];
  unint64_t v3 = [v2 mergeableStringForColumnID:*(void *)(a1 + 40) rowID:*(void *)(a1 + 48)];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_2;
  v6[3] = &unk_2640B82D8;
  id v7 = v3;
  id v4 = *(void **)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v5 = v3;
  [v4 applyUndoWithBlock:v6];
}

uint64_t __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyUndoCommand:*(void *)(a1 + 40)];
}

uint64_t __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) characterRangeForRowID:*(void *)(a1 + 40)];
  return v1 + v2;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  [(ICTableAttachmentViewController *)self beginEditing];
  int v6 = [(ICTableAttachmentViewController *)self undoCommands];
  id v7 = _Block_copy(v5);

  [v6 addObject:v7];

  [(ICTableAttachmentViewController *)self endEditing];
}

- (BOOL)wantsUndoCommands
{
  return 1;
}

- (id)icTableDataFromPasteboard
{
  return 0;
}

- (id)soloPlainTextStringFromPasteboard
{
  return 0;
}

- (id)notesDataFromPasteboard
{
  return 0;
}

- (id)attributedStringFromPasteboard
{
  unint64_t v3 = [(ICTableAttachmentViewController *)self notesDataFromPasteboard];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = [MEMORY[0x263F5ACA8] pasteboardDataFromPersistenceData:v3];
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = v4;
  int v6 = (void *)MEMORY[0x263F086A0];
  id v7 = [v4 attributedStringData];
  id v8 = [v5 dataPersister];
  uint64_t v9 = [(ICAttachmentViewController *)self attachment];
  uint64_t v10 = [v9 note];
  uint64_t v11 = [(ICAttachmentViewController *)self attachment];
  uint64_t v12 = objc_msgSend(v6, "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:forParentAttachment:error:", v7, v8, v10, v11, 0);

  if (!v12)
  {
LABEL_4:
    uint64_t v13 = [(ICTableAttachmentViewController *)self soloPlainTextStringFromPasteboard];
    if (v13) {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v13];
    }
    else {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (id)icTableFromPasteboard
{
  unint64_t v3 = [(ICTableAttachmentViewController *)self icTableDataFromPasteboard];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = objc_alloc(MEMORY[0x263F5AD48]);
  id v5 = [(ICTableAttachmentViewController *)self table];
  int v6 = [v5 document];
  id v7 = [v6 replica];
  if (v7)
  {
    id v8 = (void *)[v4 initWithData:v3 replicaID:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    id v8 = (void *)[v4 initWithData:v3 replicaID:v9];
  }
  uint64_t v10 = [v8 table];

  if (!v10)
  {
LABEL_6:
    uint64_t v11 = [(ICTableAttachmentViewController *)self attributedStringFromPasteboard];
    uint64_t v12 = [(ICAttachmentViewController *)self attachment];
    uint64_t v13 = [v12 managedObjectContext];
    uint64_t v14 = objc_msgSend(v11, "ic_attributedStringByFlatteningCalculateAttachmentsWithContext:", v13);

    uint64_t v15 = (void *)MEMORY[0x263F5ABB0];
    uint64_t v16 = [(ICAttachmentViewController *)self attachment];
    id v17 = [v16 managedObjectContext];
    unint64_t v18 = [(ICTableAttachmentViewController *)self table];
    uint64_t v19 = [v18 document];
    uint64_t v20 = [v19 replica];
    if (v20)
    {
      BOOL v21 = [v15 tableFromAttributedString:v14 managedObjectContext:v17 replicaID:v20];
    }
    else
    {
      id v22 = [MEMORY[0x263F08C38] UUID];
      BOOL v21 = [v15 tableFromAttributedString:v14 managedObjectContext:v17 replicaID:v22];
    }
    uint64_t v10 = [v21 table];
  }

  return v10;
}

- (id)icTableDataForSelection
{
  unint64_t v3 = [(ICTableAttachmentViewController *)self table];
  id v4 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v5 = [v4 type];
  uint64_t v6 = v5;
  if (v5 == 4 || v5 == 2)
  {
    id v7 = [v4 columns];
    id v8 = [v3 columnIndexesForIdentifiers:v7];
  }
  else
  {
    id v8 = 0;
  }
  if ((unint64_t)(v6 - 3) > 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = [v4 rows];
    uint64_t v10 = [v3 rowIndexesForIdentifiers:v9];
  }
  unint64_t v28 = v3;
  id v11 = objc_alloc(MEMORY[0x263F5ABD0]);
  uint64_t v12 = [(ICTableAttachmentViewController *)self table];
  uint64_t v13 = [v12 document];
  uint64_t v14 = [v13 replica];
  uint64_t v15 = (void *)[v11 initWithReplica:v14];

  uint64_t v16 = [(ICTableAttachmentViewController *)self table];
  id v17 = [v16 subtableWithDocument:v15 forSelectionContainingColumnIndices:v8 rowIndices:v10];

  [v15 setRootObject:v17];
  id v18 = objc_alloc(MEMORY[0x263F5AD48]);
  uint64_t v19 = [(ICTableAttachmentViewController *)self table];
  uint64_t v20 = [v19 document];
  BOOL v21 = [v20 replica];
  if (v21)
  {
    id v22 = (void *)[v18 initWithData:0 replicaID:v21];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x263F08C38] UUID];
    id v22 = (void *)[v18 initWithData:0 replicaID:v23];
  }
  uint64_t v24 = [MEMORY[0x263F5AD48] serializationVersion];
  uint64_t v25 = [v15 archivedData];
  [v22 mergeVersion:v24 fromData:v25];

  char v26 = [v22 serialize];

  return v26;
}

- (id)attributedStringForTableSelectionInContext:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5AB78];
  uint64_t v5 = (void *)MEMORY[0x263F08C38];
  id v6 = a3;
  id v7 = [v5 UUID];
  id v8 = [v7 UUIDString];
  uint64_t v9 = (void *)[v4 newObjectWithIdentifier:v8 context:v6];

  [v9 setTypeUTI:*MEMORY[0x263F5A9A0]];
  uint64_t v10 = [(ICTableAttachmentViewController *)self icTableDataForSelection];
  [v9 setMergeableData:v10];

  id v11 = [MEMORY[0x263F5B4D0] textAttachmentWithAttachment:v9];
  uint64_t v12 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v11];
  uint64_t v13 = (void *)[v12 mutableCopy];

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x263F814A0], v11, 0, objc_msgSend(v13, "length"));
  uint64_t v14 = [MEMORY[0x263F5AD08] paragraphStyleNamed:3];
  uint64_t v15 = [(ICTableAttachmentViewController *)self table];
  objc_msgSend(v14, "setWritingDirection:", objc_msgSend(v15, "isRightToLeft"));

  uint64_t v16 = *MEMORY[0x263F5AB28];
  id v17 = (void *)[v14 copy];
  objc_msgSend(v13, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v13, "length"));

  id v18 = (void *)[v13 copy];

  return v18;
}

- (id)plainTextDataForSelection
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F81548];
  uint64_t v4 = *MEMORY[0x263F814C0];
  v8[0] = *MEMORY[0x263F814D8];
  v8[1] = v4;
  v9[0] = v3;
  v9[1] = &unk_26C1390D8;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [(ICTableAttachmentViewController *)self dataForSelectionWithDocumentAttributes:v5];

  return v6;
}

- (id)htmlDataForSelection
{
  return [(ICTableAttachmentViewController *)self dataForSelectionOfType:*MEMORY[0x263F81508]];
}

- (id)webArchiveDataForSelection
{
  uint64_t v3 = [(id)*MEMORY[0x263F1DD70] identifier];
  uint64_t v4 = [(ICTableAttachmentViewController *)self dataForSelectionOfType:v3];

  return v4;
}

- (id)RTFDataForSelection
{
  return [(ICTableAttachmentViewController *)self dataForSelectionOfType:*MEMORY[0x263F81550]];
}

- (id)dataForSelectionOfType:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F814D8];
  v10[0] = a3;
  uint64_t v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(ICTableAttachmentViewController *)self dataForSelectionWithDocumentAttributes:v6];

  return v7;
}

- (id)dataForSelectionWithDocumentAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__10;
  uint64_t v19 = __Block_byref_object_dispose__10;
  id v20 = 0;
  id v5 = [MEMORY[0x263F5ACA0] sharedContext];
  id v6 = [v5 snapshotManagedObjectContext];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__ICTableAttachmentViewController_dataForSelectionWithDocumentAttributes___block_invoke;
  v11[3] = &unk_2640B89F8;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __74__ICTableAttachmentViewController_dataForSelectionWithDocumentAttributes___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) attributedStringForTableSelectionInContext:*(void *)(a1 + 40)];
  id v2 = objc_alloc(MEMORY[0x263F5B498]);
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = (id)[v2 initWithAttributedString:v10 replicaID:v3];

  [v4 setFilterSubstringAttributes:1];
  id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F814D8]];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F81548]];

  if (v6) {
    [v4 setFilterSubstringAttributesForPlainText:1];
  }
  uint64_t v7 = objc_msgSend(v4, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v4, "length"), *(void *)(a1 + 48), 0);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)customPasteboardDataForSelection
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__10;
  char v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  id v3 = objc_alloc(MEMORY[0x263F5AC10]);
  id v4 = [(ICAttachmentViewController *)self attachment];
  id v5 = [v4 identifier];
  int v6 = (void *)[v3 initWithObjectIdentifier:v5 forPasteboard:1];

  uint64_t v7 = [MEMORY[0x263F5ACA0] sharedContext];
  uint64_t v8 = [v7 snapshotManagedObjectContext];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __67__ICTableAttachmentViewController_customPasteboardDataForSelection__block_invoke;
  uint64_t v17 = &unk_2640B88B8;
  id v18 = self;
  id v9 = v8;
  id v19 = v9;
  BOOL v21 = &v22;
  id v10 = v6;
  id v20 = v10;
  [v9 performBlockAndWait:&v14];
  if (v23[5])
  {
    id v11 = objc_alloc(MEMORY[0x263F5ACA8]);
    id v12 = objc_msgSend(v11, "initWithAttributedStringData:dataPersister:", v23[5], v10, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __67__ICTableAttachmentViewController_customPasteboardDataForSelection__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attributedStringForTableSelectionInContext:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v5, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, *(void *)(a1 + 48), *(void *)(a1 + 40), 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)pasteboardItemsForSelection
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(ICTableAttachmentViewController *)self webArchiveDataForSelection];
  if (v4)
  {
    id v5 = [(id)*MEMORY[0x263F1DD70] identifier];
    [v3 setObject:v4 forKeyedSubscript:v5];
  }
  int v6 = [(ICTableAttachmentViewController *)self htmlDataForSelection];

  if (v6)
  {
    uint64_t v7 = [(id)*MEMORY[0x263F1DB00] identifier];
    [v3 setObject:v6 forKeyedSubscript:v7];
  }
  uint64_t v8 = [(ICTableAttachmentViewController *)self RTFDataForSelection];

  if (v8)
  {
    id v9 = [(id)*MEMORY[0x263F1DAA8] identifier];
    [v3 setObject:v8 forKeyedSubscript:v9];
  }
  id v10 = [(ICTableAttachmentViewController *)self plainTextDataForSelection];

  if (v10)
  {
    id v11 = [(id)*MEMORY[0x263F1DD38] identifier];
    [v3 setObject:v10 forKeyedSubscript:v11];
  }
  id v12 = [(ICTableAttachmentViewController *)self icTableDataForSelection];
  [v3 setObject:v12 forKeyedSubscript:@"com.apple.notes.table"];

  id v13 = [(ICTableAttachmentViewController *)self customPasteboardDataForSelection];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 persistenceData];
    [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x263F5AA90]];
  }
  uint64_t v16 = (void *)[v3 copy];

  return v16;
}

- (void)tableDidCreateColumnTextStorage:(id)a3
{
}

- (void)tableDidPopulateCellAtColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4
{
  uint64_t v7 = [(ICTableAttachmentViewController *)self table];
  uint64_t v8 = [v7 identifierForColumnAtIndex:a3];

  id v9 = [(ICTableAttachmentViewController *)self table];
  id v10 = [v9 identifierForRowAtIndex:a4];

  id v11 = [(ICTableAttachmentViewController *)self table];
  id v12 = [v11 textStorageForColumn:v8];
  int v13 = [v12 isEditing];

  if (v13)
  {
    uint64_t v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_20BE60000, v14, OS_LOG_TYPE_INFO, "Not ensuring cell exists in column layout manager because its text storage is editing", v17, 2u);
    }
  }
  else
  {
    uint64_t v15 = [(ICTableAttachmentViewController *)self tableLayoutManager];
    uint64_t v16 = [v15 columnLayoutManagerForColumn:v8];

    [v16 ensureCellExistsAtRowID:v10];
  }
}

- (void)tableWillRemoveColumnID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableAttachmentViewController *)self table];
  id v9 = [v5 textStorageForColumn:v4];

  if (!v9) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((storage) != nil)", "-[ICTableAttachmentViewController tableWillRemoveColumnID:]", 1, 0, @"Expected non-nil value for '%s'", "storage");
  }
  int v6 = [(ICAttachmentViewController *)self attachment];
  uint64_t v7 = [v6 note];
  uint64_t v8 = [v9 attributedString];
  [v7 markBlockAndInlineAttachmentsForDeletion:1 inAttributedString:v8];
}

- (void)tableDidInsertColumnID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableAttachmentViewController *)self table];
  id v9 = [v5 textStorageForColumn:v4];

  if (!v9) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((storage) != nil)", "-[ICTableAttachmentViewController tableDidInsertColumnID:]", 1, 0, @"Expected non-nil value for '%s'", "storage");
  }
  int v6 = [(ICAttachmentViewController *)self attachment];
  uint64_t v7 = [v6 note];
  uint64_t v8 = [v9 attributedString];
  [v7 markBlockAndInlineAttachmentsForDeletion:0 inAttributedString:v8];
}

- (void)showColumnRowButtons
{
  uint64_t v3 = [(ICAttachmentViewController *)self attachment];
  id v4 = [v3 note];
  int v5 = [v4 isEditable];

  int v6 = [(ICTableAttachmentViewController *)self columnButton];
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 setHidden:0];

    uint64_t v8 = [(ICTableAttachmentViewController *)self rowButton];
    id v10 = v8;
    uint64_t v9 = 0;
  }
  else
  {
    [v6 setHidden:1];

    uint64_t v8 = [(ICTableAttachmentViewController *)self rowButton];
    id v10 = v8;
    uint64_t v9 = 1;
  }
  [v8 setHidden:v9];
}

- (void)hideColumnRowButtons
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
  [v3 unselect];

  id v4 = [(ICTableAttachmentViewController *)self columnButton];
  [v4 setHidden:1];

  int v5 = [(ICTableAttachmentViewController *)self rowButton];
  [v5 setHidden:1];

  [(ICTableAttachmentViewController *)self unselectColumnRow];
}

- (CGRect)selectionFrameFromContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  uint64_t v9 = [v8 layer];
  [v9 borderWidth];
  CGFloat v11 = v10 * -0.5;

  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRect v30 = CGRectInset(v29, v11, v11);
  CGFloat v12 = v30.origin.x;
  CGFloat v13 = v30.origin.y;
  CGFloat v14 = v30.size.width;
  CGFloat v15 = v30.size.height;
  uint64_t v16 = [(ICTableAttachmentViewController *)self tableContentView];
  [v16 bounds];
  v34.origin.CGFloat x = v17;
  v34.origin.CGFloat y = v18;
  v34.size.CGFloat width = v19;
  v34.size.CGFloat height = v20;
  v31.origin.CGFloat x = v12;
  v31.origin.CGFloat y = v13;
  v31.size.CGFloat width = v14;
  v31.size.CGFloat height = v15;
  CGRect v32 = CGRectIntersection(v31, v34);
  CGFloat v21 = v32.origin.x;
  CGFloat v22 = v32.origin.y;
  CGFloat v23 = v32.size.width;
  CGFloat v24 = v32.size.height;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)updateChrome
{
  v326[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v4 = [v3 type];

  int v5 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v6 = [v5 type];

  if ((unint64_t)(v6 - 2) >= 2)
  {
    if (v6 == 4)
    {
      v62 = [(ICTableAttachmentViewController *)self tableSelection];
      v63 = [v62 columns];
      if ([v63 count])
      {
        v64 = [(ICTableAttachmentViewController *)self tableSelection];
        v65 = [v64 rows];
        uint64_t v66 = [v65 count];

        if (!v66) {
          goto LABEL_92;
        }
        v67 = [(ICTableAttachmentViewController *)self selectionHighlightView];
        v68 = [v67 superview];

        if (!v68)
        {
          v69 = [(ICTableAttachmentViewController *)self scrollView];
          v70 = [(ICTableAttachmentViewController *)self selectionHighlightView];
          [v69 addSubview:v70];
        }
        v71 = [(ICTableAttachmentViewController *)self tableSelection];
        v72 = [v71 columns];
        v62 = [v72 firstObject];

        v73 = [(ICTableAttachmentViewController *)self tableSelection];
        v74 = [v73 rows];
        v63 = [v74 firstObject];

        v75 = [(ICTableAttachmentViewController *)self tableSelection];
        v76 = [v75 columns];
        v77 = [v76 lastObject];

        v78 = [(ICTableAttachmentViewController *)self tableSelection];
        v79 = [v78 rows];
        v80 = [v79 lastObject];

        v81 = [(ICTableAttachmentViewController *)self textViewManager];
        [v81 frameOfCellAtColumn:v62 row:v63];
        CGFloat v83 = v82;
        CGFloat v85 = v84;
        CGFloat v87 = v86;
        CGFloat v89 = v88;

        v90 = [(ICTableAttachmentViewController *)self textViewManager];
        [v90 frameOfCellAtColumn:v77 row:v80];
        CGFloat v92 = v91;
        CGFloat v94 = v93;
        CGFloat v96 = v95;
        CGFloat v98 = v97;

        v329.origin.CGFloat x = v83;
        v329.origin.CGFloat y = v85;
        v329.size.CGFloat width = v87;
        v329.size.CGFloat height = v89;
        v358.origin.CGFloat x = v92;
        v358.origin.CGFloat y = v94;
        v358.size.CGFloat width = v96;
        v358.size.CGFloat height = v98;
        CGRect v330 = CGRectUnion(v329, v358);
        CGRect v331 = CGRectIntegral(v330);
        -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v331.origin.x, v331.origin.y, v331.size.width, v331.size.height);
        double v100 = v99;
        double v102 = v101;
        double v104 = v103;
        double v106 = v105;
        v107 = [(ICTableAttachmentViewController *)self tableContentView];
        v108 = [(ICTableAttachmentViewController *)self scrollView];
        objc_msgSend(v107, "convertRect:toView:", v108, v100, v102, v104, v106);
        double v110 = v109;
        double v112 = v111;
        double v114 = v113;
        double v116 = v115;
        v117 = [(ICTableAttachmentViewController *)self selectionHighlightView];
        objc_msgSend(v117, "setFrame:", v110, v112, v114, v116);

        v118 = [(ICTableAttachmentViewController *)self selectionHighlightView];
        v119 = [v118 layer];
        [v119 setMaskedCorners:15];

        v120 = [(ICTableAttachmentViewController *)self startKnob];
        v121 = [v120 superview];

        if (!v121)
        {
          v122 = [(ICTableAttachmentViewController *)self view];
          v123 = [(ICTableAttachmentViewController *)self startKnob];
          [v122 addSubview:v123];
        }
        v124 = [(ICTableAttachmentViewController *)self endKnob];
        v125 = [v124 superview];

        if (!v125)
        {
          v126 = [(ICTableAttachmentViewController *)self view];
          v127 = [(ICTableAttachmentViewController *)self endKnob];
          [v126 addSubview:v127];
        }
        double v128 = *MEMORY[0x263F5B1B8];
        v129 = [(ICTableAttachmentViewController *)self selectionHighlightView];
        v130 = [v129 layer];
        [v130 borderWidth];
        double v132 = v131;

        if (v132 >= v104) {
          double v133 = v104;
        }
        else {
          double v133 = v132;
        }
        double v134 = v133 * 0.5;
        v135 = [(ICTableAttachmentViewController *)self selectionHighlightView];
        v136 = [v135 layer];
        [v136 borderWidth];
        double v138 = v137;

        if (v138 >= v106) {
          double v139 = v106;
        }
        else {
          double v139 = v138;
        }
        CGFloat v140 = v139 * 0.5;
        v332.origin.CGFloat x = v100;
        v332.origin.CGFloat y = v102;
        v332.size.CGFloat width = v104;
        v332.size.CGFloat height = v106;
        CGRect v333 = CGRectInset(v332, v134, v140);
        CGFloat x = v333.origin.x;
        CGFloat y = v333.origin.y;
        CGFloat width = v333.size.width;
        CGFloat height = v333.size.height;
        v145 = [(ICTableAttachmentViewController *)self table];
        int v146 = [v145 isLeftToRight];

        CGFloat v147 = x;
        CGFloat v148 = y;
        CGFloat v149 = width;
        CGFloat v150 = height;
        if (v146)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v147);
          v334.origin.CGFloat x = x;
          v334.origin.CGFloat y = y;
          v334.size.CGFloat width = width;
          v334.size.CGFloat height = height;
          double MinY = CGRectGetMinY(v334);
          v335.origin.CGFloat x = x;
          v335.origin.CGFloat y = y;
          v335.size.CGFloat width = width;
          v335.size.CGFloat height = height;
          double MaxX = CGRectGetMaxX(v335);
        }
        else
        {
          double MinX = CGRectGetMaxX(*(CGRect *)&v147);
          v350.origin.CGFloat x = x;
          v350.origin.CGFloat y = y;
          v350.size.CGFloat width = width;
          v350.size.CGFloat height = height;
          double MinY = CGRectGetMinY(v350);
          v351.origin.CGFloat x = x;
          v351.origin.CGFloat y = y;
          v351.size.CGFloat width = width;
          v351.size.CGFloat height = height;
          double MaxX = CGRectGetMinX(v351);
        }
        double v280 = MaxX;
        v352.origin.CGFloat x = x;
        v352.origin.CGFloat y = y;
        v352.size.CGFloat width = width;
        v352.size.CGFloat height = height;
        CGFloat v281 = CGRectGetMaxY(v352) - v128;
        double v282 = v280 - v128;
        v283 = [(ICTableAttachmentViewController *)self startKnob];
        v284 = [v283 superview];
        v285 = [(ICTableAttachmentViewController *)self tableContentView];
        objc_msgSend(v284, "convertRect:fromView:", v285, MinX - v128, MinY - v128, v128 + v128, v128 + v128);
        double v287 = v286;
        double v289 = v288;
        double v291 = v290;
        double v293 = v292;
        v294 = [(ICTableAttachmentViewController *)self startKnob];
        objc_msgSend(v294, "setFrame:", v287, v289, v291, v293);

        v295 = [(ICTableAttachmentViewController *)self endKnob];
        v296 = [v295 superview];
        v297 = [(ICTableAttachmentViewController *)self tableContentView];
        objc_msgSend(v296, "convertRect:fromView:", v297, v282, v281, v128 + v128, v128 + v128);
        double v299 = v298;
        double v301 = v300;
        double v303 = v302;
        double v305 = v304;
        v306 = [(ICTableAttachmentViewController *)self endKnob];
        objc_msgSend(v306, "setFrame:", v299, v301, v303, v305);

        v307 = [(ICTableAttachmentViewController *)self startKnob];
        [v307 frame];
        double MidX = CGRectGetMidX(v353);
        if (MidX < 0.0)
        {
          BOOL v311 = 1;
        }
        else
        {
          v296 = [(ICTableAttachmentViewController *)self startKnob];
          [v296 frame];
          double v309 = CGRectGetMidX(v354);
          v297 = [(ICTableAttachmentViewController *)self view];
          [v297 bounds];
          BOOL v311 = v309 > v310;
        }
        v312 = [(ICTableAttachmentViewController *)self startKnob];
        [v312 setHidden:v311];

        if (MidX >= 0.0)
        {
        }
        v313 = [(ICTableAttachmentViewController *)self endKnob];
        [v313 frame];
        double v314 = CGRectGetMidX(v355);
        if (v314 < 0.0)
        {
          BOOL v317 = 1;
        }
        else
        {
          v296 = [(ICTableAttachmentViewController *)self endKnob];
          [v296 frame];
          double v315 = CGRectGetMidX(v356);
          v297 = [(ICTableAttachmentViewController *)self view];
          [v297 bounds];
          BOOL v317 = v315 > v316;
        }
        v318 = [(ICTableAttachmentViewController *)self endKnob];
        [v318 setHidden:v317];

        if (v314 >= 0.0)
        {
        }
        v319 = [(ICTableAttachmentViewController *)self columnButton];
        [v319 setHidden:1];

        v320 = [(ICTableAttachmentViewController *)self rowButton];
        [v320 setHidden:1];
      }
    }
    else
    {
      v189 = [(ICTableAttachmentViewController *)self selectionHighlightView];
      [v189 removeFromSuperview];

      v190 = [(ICTableAttachmentViewController *)self startKnob];
      [v190 removeFromSuperview];

      v62 = [(ICTableAttachmentViewController *)self endKnob];
      [v62 removeFromSuperview];
    }

    goto LABEL_92;
  }
  uint64_t v7 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  uint64_t v8 = [v7 superview];

  if (!v8)
  {
    uint64_t v9 = [(ICTableAttachmentViewController *)self scrollView];
    double v10 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v9 addSubview:v10];
  }
  CGFloat v11 = [(ICTableAttachmentViewController *)self tableSelection];
  CGFloat v12 = [v11 columns];
  uint64_t v13 = [v12 firstObject];

  CGFloat v14 = [(ICTableAttachmentViewController *)self tableSelection];
  CGFloat v15 = [v14 rows];
  uint64_t v16 = [v15 firstObject];

  CGFloat v17 = [(ICTableAttachmentViewController *)self tableSelection];
  CGFloat v18 = [v17 columns];
  uint64_t v19 = [v18 lastObject];

  CGFloat v20 = [(ICTableAttachmentViewController *)self tableSelection];
  CGFloat v21 = [v20 rows];
  uint64_t v22 = [v21 lastObject];

  v323 = (void *)v22;
  v324 = (void *)v16;
  if (v4 == 2)
  {
    CGFloat v23 = [(ICTableAttachmentViewController *)self textViewManager];
    [v23 frameOfColumn:v13];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    CGRect v32 = [(ICTableAttachmentViewController *)self textViewManager];
    [v32 frameOfColumn:v19];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;

    v327.origin.CGFloat x = v25;
    v327.origin.CGFloat y = v27;
    v327.size.CGFloat width = v29;
    v327.size.CGFloat height = v31;
    v357.origin.CGFloat x = v34;
    v357.origin.CGFloat y = v36;
    v357.size.CGFloat width = v38;
    v357.size.CGFloat height = v40;
    CGRect v328 = CGRectUnion(v327, v357);
    -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v328.origin.x, v328.origin.y, v328.size.width, v328.size.height);
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    v49 = [(ICTableAttachmentViewController *)self tableContentView];
    v50 = [(ICTableAttachmentViewController *)self scrollView];
    objc_msgSend(v49, "convertRect:toView:", v50, v42, v44, v46, v48);
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    v59 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

    v60 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    v61 = [v60 layer];
    [v61 setMaskedCorners:12];
LABEL_28:

    goto LABEL_31;
  }
  if (v4 == 3)
  {
    v154 = [(ICTableAttachmentViewController *)self textViewManager];
    [v154 frameOfRow:v16];
    CGFloat v156 = v155;
    CGFloat v158 = v157;
    CGFloat v160 = v159;
    CGFloat v162 = v161;

    v163 = [(ICTableAttachmentViewController *)self textViewManager];
    [v163 frameOfRow:v22];
    CGFloat v165 = v164;
    CGFloat v167 = v166;
    CGFloat v169 = v168;
    CGFloat v171 = v170;

    v336.origin.CGFloat x = v156;
    v336.origin.CGFloat y = v158;
    v336.size.CGFloat width = v160;
    v336.size.CGFloat height = v162;
    v359.origin.CGFloat x = v165;
    v359.origin.CGFloat y = v167;
    v359.size.CGFloat width = v169;
    v359.size.CGFloat height = v171;
    CGRect v337 = CGRectUnion(v336, v359);
    -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v337.origin.x, v337.origin.y, v337.size.width, v337.size.height);
    double v42 = v172;
    double v44 = v173;
    double v46 = v174;
    double v48 = v175;
    v176 = [(ICTableAttachmentViewController *)self tableContentView];
    v177 = [(ICTableAttachmentViewController *)self scrollView];
    objc_msgSend(v176, "convertRect:toView:", v177, v42, v44, v46, v48);
    double v179 = v178;
    double v181 = v180;
    double v183 = v182;
    double v185 = v184;
    v186 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    objc_msgSend(v186, "setFrame:", v179, v181, v183, v185);

    v60 = [(ICTableAttachmentViewController *)self table];
    if ([v60 isLeftToRight]) {
      uint64_t v187 = 10;
    }
    else {
      uint64_t v187 = 5;
    }
    v61 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    v188 = [v61 layer];
    [v188 setMaskedCorners:v187];

    goto LABEL_28;
  }
  double v46 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v48 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v42 = *MEMORY[0x263F001A8];
  double v44 = *(double *)(MEMORY[0x263F001A8] + 8);
LABEL_31:
  v191 = [(ICTableAttachmentViewController *)self table];
  v192 = [(ICTableAttachmentViewController *)self tableSelection];
  v193 = [v192 columns];

  if ([v193 count]) {
    goto LABEL_37;
  }
  v194 = [(ICTableAttachmentViewController *)self columnButton];
  v195 = [v194 columnOrRowIdentifiers];
  uint64_t v196 = [v195 count];

  if (v196)
  {
    v197 = [(ICTableAttachmentViewController *)self columnButton];
    uint64_t v198 = [v197 columnOrRowIdentifiers];
LABEL_36:
    v199 = (void *)v198;

    v193 = v199;
    goto LABEL_37;
  }
  if ([v191 columnCount])
  {
    v197 = [v191 identifierForColumnAtIndex:0];
    v326[0] = v197;
    uint64_t v198 = [MEMORY[0x263EFF8C0] arrayWithObjects:v326 count:1];
    goto LABEL_36;
  }

  v193 = 0;
LABEL_37:
  v200 = [(ICTableAttachmentViewController *)self tableSelection];
  v201 = [v200 rows];

  if ([v201 count])
  {
LABEL_43:
    if (v193 && v201) {
      [(ICTableAttachmentViewController *)self showButtonsAtColumns:v193 rows:v201];
    }
    goto LABEL_46;
  }
  v202 = [(ICTableAttachmentViewController *)self rowButton];
  v203 = [v202 columnOrRowIdentifiers];
  uint64_t v204 = [v203 count];

  if (v204)
  {
    v205 = [(ICTableAttachmentViewController *)self rowButton];
    uint64_t v206 = [v205 columnOrRowIdentifiers];
LABEL_42:
    v207 = (void *)v206;

    v201 = v207;
    goto LABEL_43;
  }
  if ([v191 rowCount])
  {
    v205 = [v191 identifierForRowAtIndex:0];
    v325 = v205;
    uint64_t v206 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v325 count:1];
    goto LABEL_42;
  }

  v201 = 0;
LABEL_46:
  v208 = [(ICTableAttachmentViewController *)self startKnob];
  v209 = [v208 superview];

  if (!v209)
  {
    v210 = [(ICTableAttachmentViewController *)self view];
    v211 = [(ICTableAttachmentViewController *)self startKnob];
    [v210 addSubview:v211];
  }
  v212 = [(ICTableAttachmentViewController *)self endKnob];
  v213 = [v212 superview];

  if (!v213)
  {
    v214 = [(ICTableAttachmentViewController *)self view];
    v215 = [(ICTableAttachmentViewController *)self endKnob];
    [v214 addSubview:v215];
  }
  double v216 = *MEMORY[0x263F5B1B8];
  v217 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  v218 = [v217 layer];
  [v218 borderWidth];
  double v220 = v219;

  if (v220 >= v46) {
    double v221 = v46;
  }
  else {
    double v221 = v220;
  }
  double v222 = v221 * 0.5;
  v223 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  v224 = [v223 layer];
  [v224 borderWidth];
  double v226 = v225;

  if (v226 >= v48) {
    double v227 = v48;
  }
  else {
    double v227 = v226;
  }
  CGFloat v228 = v227 * 0.5;
  v338.origin.CGFloat x = v42;
  v338.origin.CGFloat y = v44;
  v338.size.CGFloat width = v46;
  v338.size.CGFloat height = v48;
  CGRect v339 = CGRectInset(v338, v222, v228);
  CGFloat v229 = v339.origin.x;
  CGFloat v230 = v339.origin.y;
  CGFloat v231 = v339.size.width;
  CGFloat v232 = v339.size.height;
  v321 = v191;
  if (v4 == 2)
  {
    double v233 = CGRectGetMinX(v339) - v216;
    v340.origin.CGFloat x = v229;
    v340.origin.CGFloat y = v230;
    v340.size.CGFloat width = v231;
    v340.size.CGFloat height = v232;
    double v234 = CGRectGetMidY(v340) - v216;
    v341.origin.CGFloat x = v229;
    v341.origin.CGFloat y = v230;
    v341.size.CGFloat width = v231;
    v341.size.CGFloat height = v232;
    double v235 = CGRectGetMaxX(v341) - v216;
    v342.origin.CGFloat x = v229;
    v342.origin.CGFloat y = v230;
    v342.size.CGFloat width = v231;
    v342.size.CGFloat height = v232;
    double v236 = CGRectGetMidY(v342) - v216;
    v237 = [(ICTableAttachmentViewController *)self table];
    int v238 = [v237 isLeftToRight];

    if (v238) {
      double v239 = v236;
    }
    else {
      double v239 = v234;
    }
    if (v238) {
      double v240 = v235;
    }
    else {
      double v240 = v233;
    }
    if (!v238)
    {
      double v234 = v236;
      double v233 = v235;
    }
    double v241 = v240;
  }
  else
  {
    double v233 = CGRectGetMidX(v339) - v216;
    v343.origin.CGFloat x = v229;
    v343.origin.CGFloat y = v230;
    v343.size.CGFloat width = v231;
    v343.size.CGFloat height = v232;
    double v234 = CGRectGetMinY(v343) - v216;
    v344.origin.CGFloat x = v229;
    v344.origin.CGFloat y = v230;
    v344.size.CGFloat width = v231;
    v344.size.CGFloat height = v232;
    double v241 = CGRectGetMidX(v344) - v216;
    v345.origin.CGFloat x = v229;
    v345.origin.CGFloat y = v230;
    v345.size.CGFloat width = v231;
    v345.size.CGFloat height = v232;
    double v239 = CGRectGetMaxY(v345) - v216;
  }
  v242 = (void *)v19;
  v243 = [(ICTableAttachmentViewController *)self startKnob];
  v244 = [v243 superview];
  v245 = [(ICTableAttachmentViewController *)self tableContentView];
  objc_msgSend(v244, "convertRect:fromView:", v245, v233, v234, v216 + v216, v216 + v216);
  double v247 = v246;
  double v249 = v248;
  double v251 = v250;
  double v253 = v252;
  v254 = [(ICTableAttachmentViewController *)self startKnob];
  objc_msgSend(v254, "setFrame:", v247, v249, v251, v253);

  v255 = [(ICTableAttachmentViewController *)self endKnob];
  v256 = [v255 superview];
  v257 = [(ICTableAttachmentViewController *)self tableContentView];
  objc_msgSend(v256, "convertRect:fromView:", v257, v241, v239, v216 + v216, v216 + v216);
  double v259 = v258;
  double v261 = v260;
  double v263 = v262;
  double v265 = v264;
  v266 = [(ICTableAttachmentViewController *)self endKnob];
  objc_msgSend(v266, "setFrame:", v259, v261, v263, v265);

  v267 = [(ICTableAttachmentViewController *)self startKnob];
  [v267 frame];
  double v268 = CGRectGetMidX(v346);
  v269 = (void *)v13;
  if (v268 < 0.0)
  {
    BOOL v272 = 1;
  }
  else
  {
    v266 = [(ICTableAttachmentViewController *)self startKnob];
    [v266 frame];
    double v270 = CGRectGetMidX(v347);
    v255 = [(ICTableAttachmentViewController *)self view];
    [v255 bounds];
    BOOL v272 = v270 > v271;
  }
  v273 = [(ICTableAttachmentViewController *)self startKnob];
  [v273 setHidden:v272];

  if (v268 >= 0.0)
  {
  }
  v274 = [(ICTableAttachmentViewController *)self endKnob];
  [v274 frame];
  double v275 = CGRectGetMidX(v348);
  if (v275 < 0.0)
  {
    BOOL v278 = 1;
  }
  else
  {
    v266 = [(ICTableAttachmentViewController *)self endKnob];
    [v266 frame];
    double v276 = CGRectGetMidX(v349);
    v255 = [(ICTableAttachmentViewController *)self view];
    [v255 bounds];
    BOOL v278 = v276 > v277;
  }
  v279 = [(ICTableAttachmentViewController *)self endKnob];
  [v279 setHidden:v278];

  if (v275 >= 0.0)
  {
  }
LABEL_92:
  [(ICTableAttachmentViewController *)self updateButtonFrames];
}

- (void)updateButtonFrames
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v4 = [v3 columns];
  int v5 = [v4 firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    id v139 = v5;
  }
  else
  {
    uint64_t v7 = [(ICTableAttachmentViewController *)self columnButton];
    uint64_t v8 = [v7 columnOrRowIdentifiers];
    id v139 = [v8 firstObject];
  }
  uint64_t v9 = [(ICTableAttachmentViewController *)self tableSelection];
  double v10 = [v9 columns];
  CGFloat v11 = [v10 lastObject];
  CGFloat v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    CGFloat v14 = [(ICTableAttachmentViewController *)self columnButton];
    CGFloat v15 = [v14 columnOrRowIdentifiers];
    id v13 = [v15 lastObject];
  }
  if (v139)
  {
    uint64_t v16 = [(ICTableAttachmentViewController *)self columnButton];
    if ([v16 isHidden])
    {
    }
    else
    {
      CGFloat v17 = [(ICTableAttachmentViewController *)self textViewManager];
      CGFloat v18 = [v17 columnIDs];
      int v19 = [v18 containsObject:v139];

      if (v19)
      {
        CGFloat v20 = [(ICTableAttachmentViewController *)self textViewManager];
        [v20 frameOfColumn:v139];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;

        CGFloat v29 = [(ICTableAttachmentViewController *)self textViewManager];
        [v29 frameOfColumn:v13];
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;

        v141.origin.CGFloat x = v22;
        v141.origin.CGFloat y = v24;
        v141.size.double width = v26;
        v141.size.CGFloat height = v28;
        v153.origin.CGFloat x = v31;
        v153.origin.CGFloat y = v33;
        v153.size.double width = v35;
        v153.size.CGFloat height = v37;
        CGRect v142 = CGRectUnion(v141, v153);
        -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v142.origin.x, v142.origin.y, v142.size.width, v142.size.height);
        double width = v143.size.width;
        double MinX = CGRectGetMinX(v143);
        double v40 = *MEMORY[0x263F5B168];
        double v41 = -*MEMORY[0x263F5B168];
        double v42 = [(ICTableAttachmentViewController *)self tableContentView];
        double v43 = [(ICTableAttachmentViewController *)self headerClipView];
        objc_msgSend(v42, "convertRect:toView:", v43, MinX, v41, width, v40);
        double v45 = v44;
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        double v52 = [(ICTableAttachmentViewController *)self columnButton];
        objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

        goto LABEL_13;
      }
    }
  }
  double v42 = [(ICTableAttachmentViewController *)self headerClipView];
  [v42 bounds];
  double v54 = v53;
  double v43 = [(ICTableAttachmentViewController *)self columnButton];
  objc_msgSend(v43, "setFrame:", v54, 0.0, 0.0, 0.0);
LABEL_13:

  double v55 = [(ICTableAttachmentViewController *)self tableSelection];
  double v56 = [v55 rows];
  double v57 = [v56 firstObject];
  double v58 = v57;
  if (v57)
  {
    id v59 = v57;
  }
  else
  {
    v60 = [(ICTableAttachmentViewController *)self rowButton];
    v61 = [v60 columnOrRowIdentifiers];
    id v59 = [v61 firstObject];
  }
  v62 = [(ICTableAttachmentViewController *)self tableSelection];
  v63 = [v62 rows];
  v64 = [v63 lastObject];
  v65 = v64;
  if (v64)
  {
    id v66 = v64;
  }
  else
  {
    v67 = [(ICTableAttachmentViewController *)self rowButton];
    v68 = [v67 columnOrRowIdentifiers];
    id v66 = [v68 lastObject];
  }
  if (!v59) {
    goto LABEL_33;
  }
  v69 = [(ICTableAttachmentViewController *)self rowButton];
  if ([v69 isHidden]) {
    goto LABEL_32;
  }
  v70 = [(ICTableAttachmentViewController *)self textViewManager];
  v71 = [v70 rowIDs];
  int v72 = [v71 containsObject:v59];

  if (!v72) {
    goto LABEL_33;
  }
  v73 = [(ICTableAttachmentViewController *)self textViewManager];
  [v73 frameOfRow:v59];
  CGFloat v75 = v74;
  CGFloat v77 = v76;
  CGFloat v79 = v78;
  CGFloat v81 = v80;

  double v82 = [(ICTableAttachmentViewController *)self textViewManager];
  [v82 frameOfRow:v66];
  CGFloat v84 = v83;
  CGFloat v86 = v85;
  CGFloat v88 = v87;
  CGFloat v90 = v89;

  v144.origin.CGFloat x = v75;
  v144.origin.CGFloat y = v77;
  v144.size.double width = v79;
  v144.size.CGFloat height = v81;
  v154.origin.CGFloat x = v84;
  v154.origin.CGFloat y = v86;
  v154.size.double width = v88;
  v154.size.CGFloat height = v90;
  CGRect v145 = CGRectUnion(v144, v154);
  -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v145.origin.x, v145.origin.y, v145.size.width, v145.size.height);
  CGFloat v92 = v91;
  CGFloat v94 = v93;
  CGFloat v96 = v95;
  double v98 = v97;
  double v99 = [(ICTableAttachmentViewController *)self table];
  int v100 = [v99 isLeftToRight];

  if (!v100)
  {
    v149.origin.CGFloat x = v92;
    v149.origin.CGFloat y = v94;
    v149.size.double width = v96;
    v149.size.CGFloat height = v98;
    double MaxX = CGRectGetMaxX(v149);
    v150.origin.CGFloat x = v92;
    v150.origin.CGFloat y = v94;
    v150.size.double width = v96;
    v150.size.CGFloat height = v98;
    double MinY = CGRectGetMinY(v150);
    double v122 = *MEMORY[0x263F5B168];
    v123 = [(ICTableAttachmentViewController *)self tableContentView];
    v124 = [(ICTableAttachmentViewController *)self view];
    objc_msgSend(v123, "convertRect:toView:", v124, MaxX, MinY, v122, v98);
    CGFloat v126 = v125;
    CGFloat v128 = v127;
    CGFloat v130 = v129;
    CGFloat v113 = v131;

    CGFloat v135 = v130;
    CGFloat v137 = v126;
    v151.origin.CGFloat x = v126;
    v151.origin.CGFloat y = v128;
    v151.size.double width = v130;
    v151.size.CGFloat height = v113;
    double v132 = CGRectGetMaxX(v151);
    v152.origin.CGFloat x = MaxX;
    v152.origin.CGFloat y = MinY;
    v152.size.double width = v122;
    v152.size.CGFloat height = v98;
    double v133 = CGRectGetMaxX(v152);
    double v116 = [(ICTableAttachmentViewController *)self rowButton];
    v69 = v116;
    if (v132 < v133)
    {
      double v119 = v135;
      double v117 = v137;
      double v118 = v128;
      goto LABEL_27;
    }
    double v117 = MaxX;
    double v118 = MinY;
    double v119 = v122;
LABEL_30:
    double v134 = v98;
    goto LABEL_31;
  }
  double v101 = *MEMORY[0x263F5B168];
  double v102 = -*MEMORY[0x263F5B168];
  v146.origin.CGFloat x = v92;
  v146.origin.CGFloat y = v94;
  v146.size.double width = v96;
  v146.size.CGFloat height = v98;
  double v103 = CGRectGetMinY(v146);
  double v104 = [(ICTableAttachmentViewController *)self tableContentView];
  double v105 = [(ICTableAttachmentViewController *)self view];
  objc_msgSend(v104, "convertRect:toView:", v105, v102, v103, v101, v98);
  CGFloat v107 = v106;
  CGFloat v109 = v108;
  CGFloat v111 = v110;
  CGFloat v113 = v112;

  CGFloat v136 = v109;
  CGFloat v138 = v107;
  v147.origin.CGFloat x = v107;
  v147.origin.CGFloat y = v109;
  v147.size.double width = v111;
  v147.size.CGFloat height = v113;
  double v114 = CGRectGetMinX(v147);
  v148.origin.CGFloat x = v102;
  v148.origin.CGFloat y = v103;
  v148.size.double width = v101;
  v148.size.CGFloat height = v98;
  double v115 = CGRectGetMinX(v148);
  double v116 = [(ICTableAttachmentViewController *)self rowButton];
  v69 = v116;
  if (v114 <= v115)
  {
    double v117 = v102;
    double v118 = v103;
    double v119 = v101;
    goto LABEL_30;
  }
  double v118 = v136;
  double v117 = v138;
  double v119 = v111;
LABEL_27:
  double v134 = v113;
LABEL_31:
  objc_msgSend(v116, "setFrame:", v117, v118, v119, v134, *(void *)&v135);
LABEL_32:

LABEL_33:
}

- (void)addColumnLeftOfSelection:(id)a3
{
  uint64_t v4 = [(ICTableAttachmentViewController *)self tableSelection];
  int v5 = [v4 columns];
  id v8 = [v5 firstObject];

  uint64_t v6 = [(ICTableAttachmentViewController *)self table];
  uint64_t v7 = [v6 columnIndexForIdentifier:v8];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(ICTableAttachmentViewController *)self addColumnAtIndex:v7];
  }
}

- (void)addColumnRightOfSelection:(id)a3
{
  uint64_t v4 = [(ICTableAttachmentViewController *)self tableSelection];
  int v5 = [v4 columns];
  id v8 = [v5 lastObject];

  uint64_t v6 = [(ICTableAttachmentViewController *)self table];
  uint64_t v7 = [v6 columnIndexForIdentifier:v8];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(ICTableAttachmentViewController *)self addColumnAtIndex:v7 + 1];
  }
}

- (void)addColumnBeforeSelection:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ICTableAttachmentViewController *)self table];
  int v5 = [v4 isLeftToRight];

  if (v5) {
    [(ICTableAttachmentViewController *)self addColumnLeftOfSelection:v6];
  }
  else {
    [(ICTableAttachmentViewController *)self addColumnRightOfSelection:v6];
  }
}

- (void)addColumnAfterSelection:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ICTableAttachmentViewController *)self table];
  int v5 = [v4 isLeftToRight];

  if (v5) {
    [(ICTableAttachmentViewController *)self addColumnRightOfSelection:v6];
  }
  else {
    [(ICTableAttachmentViewController *)self addColumnLeftOfSelection:v6];
  }
}

- (id)insertColumns:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(ICTableAttachmentViewController *)self table];
  id v8 = [v7 insertColumns:a3 atIndex:a4];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        CGFloat v15 = [(ICTableAttachmentViewController *)self tableLayoutManager];
        uint64_t v16 = [v15 columnWidthManager];
        uint64_t v31 = v14;
        CGFloat v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
        id v18 = (id)[v16 invalidateWidthForColumns:v17];

        int v19 = [(ICTableAttachmentViewController *)self tableLayoutManager];
        CGFloat v20 = [v19 columnWidthManager];
        [v20 widthOfColumn:v14];
        double v22 = v21;

        double v23 = [(ICTableAttachmentViewController *)self columnWidthCache];
        [v23 setDimension:v14 forKey:v22];

        uint64_t v30 = v14;
        CGFloat v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        [(ICTableAttachmentViewController *)self postChangeNotification:0 columnOrRowUUIDs:v24];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }

  return v9;
}

- (void)addColumnAtIndex:(unint64_t)a3
{
  [(ICTableAttachmentViewController *)self beginEditing];
  id v11 = [(ICTableAttachmentViewController *)self insertColumns:1 atIndex:a3];
  int v5 = [v11 firstObject];
  [(ICTableAttachmentViewController *)self redrawAndSave];
  id v6 = [(ICTableAttachmentViewController *)self table];
  uint64_t v7 = [v6 identifierForRowAtIndex:0];

  [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v5 andRowID:v7 location:0];
  [(ICTableAttachmentViewController *)self endEditing];
  id v8 = [MEMORY[0x263F086E0] mainBundle];
  id v9 = [v8 localizedStringForKey:@"ADD_COLUMN_UNDO_STRING" value:@"Add Column" table:@"Localizable"];

  uint64_t v10 = [(ICTableAttachmentViewController *)self undoManager];
  [v10 setActionName:v9];
}

- (void)addRowAboveSelection:(id)a3
{
  uint64_t v4 = [(ICTableAttachmentViewController *)self tableSelection];
  int v5 = [v4 rows];
  id v8 = [v5 firstObject];

  id v6 = [(ICTableAttachmentViewController *)self table];
  uint64_t v7 = [v6 rowIndexForIdentifier:v8];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(ICTableAttachmentViewController *)self addRowAtIndex:v7];
  }
}

- (void)addRowBelowSelection:(id)a3
{
  uint64_t v4 = [(ICTableAttachmentViewController *)self tableSelection];
  int v5 = [v4 rows];
  id v8 = [v5 lastObject];

  id v6 = [(ICTableAttachmentViewController *)self table];
  uint64_t v7 = [v6 rowIndexForIdentifier:v8];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(ICTableAttachmentViewController *)self addRowAtIndex:v7 + 1];
  }
}

- (void)addRowAtIndex:(unint64_t)a3
{
  [(ICTableAttachmentViewController *)self willAddRow];
  [(ICTableAttachmentViewController *)self beginEditing];
  int v5 = [(ICTableAttachmentViewController *)self table];
  id v11 = [v5 insertRowAtIndex:a3];

  [(ICTableAttachmentViewController *)self redrawAndSave];
  [(ICTableAttachmentViewController *)self postChangeNotification:1 columnOrRowUUIDs:0];
  id v6 = [(ICTableAttachmentViewController *)self table];
  uint64_t v7 = [v6 identifierForColumnAtIndex:0];

  [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v7 andRowID:v11 location:0];
  [(ICTableAttachmentViewController *)self endEditing];
  id v8 = [(ICTableAttachmentViewController *)self undoManager];
  id v9 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"Add Row" value:&stru_26C10E100 table:0];
  [v8 setActionName:v10];
}

- (void)deleteTable:(id)a3
{
  uint64_t v4 = [(ICTableAttachmentViewController *)self tableSelection];
  [v4 unselect];

  int v5 = [(ICAttachmentViewController *)self attachment];
  id v6 = [v5 note];
  uint64_t v7 = [(ICAttachmentViewController *)self attachment];
  uint64_t v8 = [v6 rangeForAttachment:v7];
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [(ICTableAttachmentViewController *)self noteTextView];
    objc_msgSend((id)v11, "setSelectedRange:", v8, 0);

    LOBYTE(v11) = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    if (v11)
    {
      objc_opt_class();
      uint64_t v12 = [(ICTableAttachmentViewController *)self noteTextView];
      id v13 = [v12 textLayoutManager];
      uint64_t v14 = ICDynamicCast();
      CGFloat v15 = [v14 textContentStorage];
      uint64_t v16 = [v15 textStorage];
      ICDynamicCast();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = [(ICTableAttachmentViewController *)self noteTextView];
      id v13 = [v12 layoutManager];
      uint64_t v14 = [v13 textStorage];
      ICDynamicCast();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }

    [v20 beginEditing];
    objc_msgSend(v20, "replaceCharactersInRange:withString:", v8, v10, &stru_26C10E100);
    [v20 endEditing];
    CGFloat v17 = [(ICTableAttachmentViewController *)self noteTextView];
    id v18 = [v17 delegate];
    int v19 = [(ICTableAttachmentViewController *)self noteTextView];
    [v18 textViewDidChange:v19];
  }
}

- (void)deleteColumns:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(ICTableAttachmentViewController *)self table];
  id v6 = [v5 columnsIntersectingWithColumns:v4];

  unint64_t v7 = [v6 count];
  unint64_t v8 = [v5 columnCount];
  if (v7 && v7 < v8)
  {
    [(ICTableAttachmentViewController *)self beginEditing];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v32 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      unint64_t v13 = -1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          unint64_t v16 = [v5 columnIndexForIdentifier:v15];
          [v5 removeColumnAtIndex:v16];
          [(ICTableAttachmentViewController *)self cleanDeletedColumn:v15];
          if (v13 >= v16) {
            unint64_t v13 = v16;
          }
          CGFloat v17 = [(ICTableAttachmentViewController *)self tableAXController];
          [v17 invalidateAXElementsForColumnID:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v13 = -1;
    }

    [(ICTableAttachmentViewController *)self postChangeNotification:3 columnOrRowUUIDs:v9];
    id v18 = [(ICTableAttachmentViewController *)self tableLayoutManager];
    int v19 = [v18 columnWidthManager];
    id v20 = (id)[v19 invalidateWidthForColumns:v9];

    [(ICTableAttachmentViewController *)self hideColumnRowButtons];
    [(ICTableAttachmentViewController *)self redrawAndSave];
    if ([v5 columnCount] && objc_msgSend(v5, "rowCount"))
    {
      uint64_t v21 = [v5 columnCount];
      if (v13 >= v21 - 1) {
        unint64_t v22 = v21 - 1;
      }
      else {
        unint64_t v22 = v13;
      }
      double v23 = [v5 identifierForColumnAtIndex:v22];
      CGFloat v24 = [(ICTableAttachmentViewController *)self rowButton];
      double v25 = [v24 columnOrRowIdentifiers];
      long long v26 = [v25 firstObject];

      [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v23 andRowID:v26 location:2];
    }
    [(ICTableAttachmentViewController *)self endEditing];
    long long v27 = [(ICTableAttachmentViewController *)self undoManager];
    long long v28 = NSString;
    long long v29 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v30 = [v29 localizedStringForKey:@"Delete %lu Column" value:&stru_26C10E100 table:0];
    uint64_t v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v7);
    [v27 setActionName:v31];

    id v6 = v32;
  }
  else if (v7 == [v5 columnCount])
  {
    [(ICTableAttachmentViewController *)self deleteTable:self];
  }
}

- (void)deleteSelectedColumns:(id)a3
{
  id v4 = [(ICTableAttachmentViewController *)self tableSelection];
  id v5 = [v4 columns];

  [(ICTableAttachmentViewController *)self deleteColumns:v5];
}

- (void)deleteRows:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICTableAttachmentViewController *)self table];
  id v6 = [v5 rowsIntersectingWithRows:v4];

  unint64_t v7 = [v6 count];
  unint64_t v8 = [v5 rowCount];
  if (v7 && v7 < v8)
  {
    [(ICTableAttachmentViewController *)self beginEditing];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      unint64_t v13 = -1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          unint64_t v16 = [v5 rowIndexForIdentifier:v15];
          [v5 removeRowAtIndex:v16];
          [(ICTableAttachmentViewController *)self cleanDeletedRow:v15];
          if (v13 >= v16) {
            unint64_t v13 = v16;
          }
          CGFloat v17 = [(ICTableAttachmentViewController *)self tableAXController];
          [v17 invalidateAXElementsForRowID:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v13 = -1;
    }

    [(ICTableAttachmentViewController *)self postChangeNotification:4 columnOrRowUUIDs:v9];
    [(ICTableAttachmentViewController *)self hideColumnRowButtons];
    [(ICTableAttachmentViewController *)self redrawAndSave];
    uint64_t v18 = [v5 rowCount];
    if (v13 >= v18 - 1) {
      unint64_t v19 = v18 - 1;
    }
    else {
      unint64_t v19 = v13;
    }
    id v20 = [v5 identifierForRowAtIndex:v19];
    if ([v5 columnCount] && objc_msgSend(v5, "rowCount"))
    {
      uint64_t v21 = [(ICTableAttachmentViewController *)self columnButton];
      unint64_t v22 = [v21 columnOrRowIdentifiers];
      double v23 = [v22 firstObject];

      [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v23 andRowID:v20 location:2];
    }
    [(ICTableAttachmentViewController *)self endEditing];
    CGFloat v24 = [(ICTableAttachmentViewController *)self undoManager];
    double v25 = NSString;
    long long v26 = [MEMORY[0x263F086E0] mainBundle];
    long long v27 = [v26 localizedStringForKey:@"Delete %lu Row" value:&stru_26C10E100 table:0];
    long long v28 = objc_msgSend(v25, "localizedStringWithFormat:", v27, v7);
    [v24 setActionName:v28];

    id v6 = v29;
  }
  else if (v7 == [v5 rowCount])
  {
    [(ICTableAttachmentViewController *)self deleteTable:self];
  }
}

- (void)deleteSelectedRows:(id)a3
{
  id v4 = [(ICTableAttachmentViewController *)self tableSelection];
  id v5 = [v4 rows];

  [(ICTableAttachmentViewController *)self deleteRows:v5];
}

- (void)cleanDeletedColumn:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICTableAttachmentViewController *)self columnWidthCache];
  [v5 removeDimensionForKey:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(ICTableAttachmentViewController *)self cellHeightCache];
  unint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v11++) removeDimensionForKey:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(ICTableAttachmentViewController *)self tableLayoutManager];
  [v12 removeColumnLayoutManagerForColumn:v4];

  unint64_t v13 = [(ICTableAttachmentViewController *)self tableContentView];
  [v13 setVerticalLinePosition:0 forKey:v4];

  uint64_t v14 = [(ICTableAttachmentViewController *)self textViewManager];
  [v14 removeColumn:v4];
}

- (void)cleanDeletedRow:(id)a3
{
  id v18 = a3;
  id v4 = [(ICTableAttachmentViewController *)self rowHeightCache];
  [v4 removeDimensionForKey:v18];

  id v5 = [(ICTableAttachmentViewController *)self cellHeightCache];
  [v5 removeObjectForKey:v18];

  id v6 = [(ICTableAttachmentViewController *)self tableLayoutManager];
  unint64_t v7 = [v6 rowPositions];
  [v7 removeObjectForKey:v18];

  uint64_t v8 = [(ICTableAttachmentViewController *)self table];
  uint64_t v9 = [v8 columnCount];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [(ICTableAttachmentViewController *)self table];
      uint64_t v12 = [v11 identifierForColumnAtIndex:v10];

      unint64_t v13 = [(ICTableAttachmentViewController *)self tableLayoutManager];
      uint64_t v14 = [v13 columnLayoutManagerForColumn:v12];

      [v14 removeRow:v18];
      ++v10;
      long long v15 = [(ICTableAttachmentViewController *)self table];
      unint64_t v16 = [v15 columnCount];
    }
    while (v10 < v16);
  }
  long long v17 = [(ICTableAttachmentViewController *)self tableContentView];
  [v17 setHorizontalLinePosition:0 forKey:v18];
}

- (void)dragBeganOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v8 = [MEMORY[0x263F5AB70] currentInfo];
  [(ICTableAttachmentViewController *)self setDraggingAppearance:v8];

  uint64_t v9 = [(ICTableAttachmentViewController *)self draggingAppearance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke;
  v10[3] = &unk_2640BA240;
  v10[4] = self;
  BOOL v11 = a3;
  *(CGFloat *)&void v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  [v9 performAsDefaultAppearance:v10];
}

void __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke(uint64_t a1)
{
  uint64_t v166 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) tableSelection];
  [v2 setMoving:1];

  uint64_t v3 = [*(id *)(a1 + 32) currentlyEditingTextView];
  [v3 setTextSelectionHidden:1];

  LODWORD(v3) = *(unsigned __int8 *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) tableSelection];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 columns];

    unint64_t v7 = [*(id *)(a1 + 32) textViewManager];
    uint64_t v8 = [v6 firstObject];
    [v7 frameOfColumn:v8];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    long long v17 = [*(id *)(a1 + 32) textViewManager];
    id v18 = [v6 lastObject];
    [v17 frameOfColumn:v18];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v167.origin.double x = v10;
    v167.origin.double y = v12;
    v167.size.double width = v14;
    v167.size.double height = v16;
    v177.origin.double x = v20;
    v177.origin.double y = v22;
    v177.size.double width = v24;
    v177.size.double height = v26;
    CGRect v168 = CGRectUnion(v167, v177);
    double x = v168.origin.x;
    double y = v168.origin.y;
    double width = v168.size.width;
    double height = v168.size.height;
    long long v31 = [*(id *)(a1 + 32) rowButton];
    [v31 setHidden:1];

    long long v32 = [*(id *)(a1 + 32) table];
    long long v33 = [v6 firstObject];
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDragIndex:", objc_msgSend(v32, "columnIndexForIdentifier:", v33));

    long long v34 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v35 = [*(id *)(a1 + 32) textViewManager];
    [v35 setDraggedColumns:v34];
  }
  else
  {
    id v6 = [v4 rows];

    long long v36 = [*(id *)(a1 + 32) textViewManager];
    CGFloat v37 = [v6 firstObject];
    [v36 frameOfRow:v37];
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;

    double v46 = [*(id *)(a1 + 32) textViewManager];
    double v47 = [v6 lastObject];
    [v46 frameOfRow:v47];
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;

    v169.origin.double x = v39;
    v169.origin.double y = v41;
    v169.size.double width = v43;
    v169.size.double height = v45;
    v178.origin.double x = v49;
    v178.origin.double y = v51;
    v178.size.double width = v53;
    v178.size.double height = v55;
    CGRect v170 = CGRectUnion(v169, v178);
    double x = v170.origin.x;
    double y = v170.origin.y;
    double width = v170.size.width;
    double height = v170.size.height;
    double v56 = [*(id *)(a1 + 32) columnButton];
    [v56 setHidden:1];

    double v57 = [*(id *)(a1 + 32) table];
    double v58 = [v6 firstObject];
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDragIndex:", objc_msgSend(v57, "rowIndexForIdentifier:", v58));

    long long v34 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v35 = [*(id *)(a1 + 32) textViewManager];
    [v35 setDraggedRows:v34];
  }

  id v59 = [*(id *)(a1 + 32) tableSelection];
  if ([v59 type] == 2)
  {
  }
  else
  {
    v60 = [*(id *)(a1 + 32) tableSelection];
    uint64_t v61 = [v60 type];

    if (v61 != 3) {
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "selectionFrameFromContentFrame:", x, y, width, height);
  double x = v62;
  double y = v63;
  double width = v64;
  double height = v65;
LABEL_8:
  id v66 = objc_msgSend(*(id *)(a1 + 32), "dragSnapshotFromRect:afterScreenUpdates:", 1, x, y, width, height);
  [*(id *)(a1 + 32) setDragView:v66];

  v67 = [*(id *)(a1 + 32) view];
  v68 = [*(id *)(a1 + 32) tableContentView];
  objc_msgSend(v67, "convertRect:fromView:", v68, x, y, width, height);
  double v70 = v69;
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  CGFloat v77 = [*(id *)(a1 + 32) dragView];
  objc_msgSend(v77, "setFrame:", v70, v72, v74, v76);

  double v78 = [*(id *)(a1 + 32) dragView];
  CGFloat v79 = [v78 layer];
  [v79 setMasksToBounds:1];

  double v80 = [*(id *)(a1 + 32) tableContentView];
  [v80 innerBorderWidth];
  double v82 = v81;
  double v83 = [*(id *)(a1 + 32) dragView];
  CGFloat v84 = [v83 layer];
  [v84 setBorderWidth:v82];

  double v85 = [*(id *)(a1 + 32) tableContentView];
  id v86 = [v85 innerBorderColor];
  uint64_t v87 = [v86 CGColor];
  CGFloat v88 = [*(id *)(a1 + 32) dragView];
  double v89 = [v88 layer];
  [v89 setBorderColor:v87];

  CGFloat v90 = [*(id *)(a1 + 32) tableSelection];
  if ([v90 type] == 2)
  {
  }
  else
  {
    double v91 = [*(id *)(a1 + 32) tableSelection];
    uint64_t v92 = [v91 type];

    if (v92 != 3) {
      goto LABEL_12;
    }
  }
  double v93 = [*(id *)(a1 + 32) dragView];
  CGFloat v94 = [v93 layer];
  [v94 setBorderWidth:0.0];

  double v95 = [*(id *)(a1 + 32) selectionHighlightView];
  CGFloat v96 = [v95 layer];
  [v96 cornerRadius];
  double v98 = v97;
  double v99 = [*(id *)(a1 + 32) dragView];
  int v100 = [v99 layer];
  [v100 setCornerRadius:v98];

  double v101 = [*(id *)(a1 + 32) selectionHighlightView];
  double v102 = [v101 layer];
  uint64_t v103 = [v102 maskedCorners];
  double v104 = [*(id *)(a1 + 32) dragView];
  double v105 = [v104 layer];
  [v105 setMaskedCorners:v103];

LABEL_12:
  double v106 = [*(id *)(a1 + 32) view];
  CGFloat v107 = [*(id *)(a1 + 32) dragView];
  [v106 addSubview:v107];

  Mutable = CGPathCreateMutable();
  CGFloat v109 = [*(id *)(a1 + 32) dragView];
  [v109 bounds];
  CGRect v172 = CGRectInset(v171, -20.0, -20.0);
  CGPathAddRect(Mutable, 0, v172);

  double v110 = [*(id *)(a1 + 32) dragView];
  [v110 bounds];
  CGPathAddRect(Mutable, 0, v173);

  CGFloat v111 = [MEMORY[0x263F15880] layer];
  [v111 setPath:Mutable];
  [v111 setFillRule:*MEMORY[0x263F15AC0]];
  CGPathRelease(Mutable);
  double v112 = [MEMORY[0x263F157E8] layer];
  [v112 setMask:v111];
  [v112 setShadowRadius:*MEMORY[0x263F5B1A8]];
  objc_msgSend(v112, "setShadowOffset:", *MEMORY[0x263F5B198], *(double *)(MEMORY[0x263F5B198] + 8));
  double v113 = *MEMORY[0x263F5B1A0];
  *(float *)&double v113 = *MEMORY[0x263F5B1A0];
  [v112 setShadowOpacity:v113];
  id v114 = [MEMORY[0x263F825C8] blackColor];
  objc_msgSend(v112, "setShadowColor:", objc_msgSend(v114, "CGColor"));

  double v115 = [*(id *)(a1 + 32) dragView];
  [v115 bounds];
  double v116 = CGPathCreateWithRect(v174, 0);

  [v112 setShadowPath:v116];
  CGPathRelease(v116);
  double v117 = [*(id *)(a1 + 32) dragView];
  double v118 = [v117 layer];
  [v118 addSublayer:v112];

  double v119 = [[ICTableAutoScroller alloc] initWithTableAttachmentViewController:*(void *)(a1 + 32) scrollDirectionMode:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 32) setTableAutoScroller:v119];

  v120 = *(void **)(a1 + 32);
  v121 = [v120 tableAutoScroller];
  [v121 setDelegate:v120];

  if (*(unsigned char *)(a1 + 56))
  {
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v122 = v6;
    uint64_t v123 = [v122 countByEnumeratingWithState:&v160 objects:v165 count:16];
    if (v123)
    {
      uint64_t v124 = v123;
      uint64_t v125 = *(void *)v161;
      do
      {
        for (uint64_t i = 0; i != v124; ++i)
        {
          if (*(void *)v161 != v125) {
            objc_enumerationMutation(v122);
          }
          [*(id *)(a1 + 32) setHidden:1 forColumn:*(void *)(*((void *)&v160 + 1) + 8 * i)];
        }
        uint64_t v124 = [v122 countByEnumeratingWithState:&v160 objects:v165 count:16];
      }
      while (v124);
    }

    double v127 = [*(id *)(a1 + 32) headerClipView];
    CGFloat v128 = [v127 layer];
    double v129 = v128;
    uint64_t v130 = 0;
  }
  else
  {
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    id v131 = v6;
    uint64_t v132 = [v131 countByEnumeratingWithState:&v156 objects:v164 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v157;
      do
      {
        for (uint64_t j = 0; j != v133; ++j)
        {
          if (*(void *)v157 != v134) {
            objc_enumerationMutation(v131);
          }
          [*(id *)(a1 + 32) setHidden:1 forRow:*(void *)(*((void *)&v156 + 1) + 8 * j)];
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v156 objects:v164 count:16];
      }
      while (v133);
    }

    double v127 = [*(id *)(a1 + 32) headerClipView];
    CGFloat v128 = [v127 layer];
    double v129 = v128;
    uint64_t v130 = 1;
  }
  [v128 setMasksToBounds:v130];

  CGFloat v136 = [*(id *)(a1 + 32) dragView];
  [v136 frame];
  CGFloat v137 = CGRectGetMidX(v175) - *(double *)(a1 + 40);
  CGFloat v138 = [*(id *)(a1 + 32) dragView];
  [v138 frame];
  objc_msgSend(*(id *)(a1 + 32), "setInitialDragOffset:", v137, CGRectGetMidY(v176) - *(double *)(a1 + 48));

  v154[0] = MEMORY[0x263EF8330];
  v154[1] = 3221225472;
  v154[2] = __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke_2;
  v154[3] = &unk_2640B9320;
  char v155 = *(unsigned char *)(a1 + 56);
  v154[4] = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F82E00], "ic_animateWithDuration:animations:completion:", v154, 0, 0.1);
  id v139 = [*(id *)(a1 + 32) selectionHighlightView];
  objc_msgSend(v139, "ic_setAlpha:", 0.0);

  CGFloat v140 = [*(id *)(a1 + 32) startKnob];
  [v140 removeFromSuperview];

  CGRect v141 = [*(id *)(a1 + 32) endKnob];
  [v141 removeFromSuperview];

  CGRect v142 = [*(id *)(a1 + 32) currentlyEditingTextStorage];
  CGRect v143 = [v142 savedSelectionWithSelectionAffinity:0];
  [*(id *)(a1 + 32) setStringSelectionBeforeDrag:v143];

  id v144 = objc_alloc(MEMORY[0x263F82F40]);
  CGRect v145 = [*(id *)(a1 + 32) view];
  CGRect v146 = (void *)[v144 initWithCoordinateSpace:v145];
  [*(id *)(a1 + 32) setFeedbackGenerator:v146];

  CGRect v147 = [*(id *)(a1 + 32) feedbackGenerator];
  [v147 userInteractionStarted];

  CGRect v148 = [*(id *)(a1 + 32) feedbackGenerator];
  [v148 draggedObjectLifted];

  LODWORD(v145) = *(unsigned __int8 *)(a1 + 56);
  CGRect v149 = [MEMORY[0x263F086E0] mainBundle];
  CGRect v150 = v149;
  if (v145) {
    CGRect v151 = @"Reordering column %lu";
  }
  else {
    CGRect v151 = @"Reordering row %lu";
  }
  CGRect v152 = [v149 localizedStringForKey:v151 value:&stru_26C10E100 table:0];

  CGRect v153 = objc_msgSend(NSString, "localizedStringWithFormat:", v152, objc_msgSend(*(id *)(a1 + 32), "currentDragIndex") + 1);
  UIAccessibilityPostNotification(*MEMORY[0x263F83188], v153);
  objc_msgSend(*(id *)(a1 + 32), "setLastDraggedOverColumnOrRowIndex:", objc_msgSend(*(id *)(a1 + 32), "currentDragIndex"));
}

void __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) dragView];
  [v3 frame];
  if (v2)
  {
    CGRect v39 = CGRectOffset(*(CGRect *)&v4, 0.0, -5.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    CGFloat v12 = [*(id *)(a1 + 32) dragView];
    double v13 = objc_msgSend(v12, "ic_animator");
    objc_msgSend(v13, "setFrame:", x, y, width, height);

    id v37 = [*(id *)(a1 + 32) columnButton];
    [v37 frame];
    CGRect v41 = CGRectOffset(v40, 0.0, -5.0);
    double v14 = v41.origin.x;
    double v15 = v41.origin.y;
    double v16 = v41.size.width;
    double v17 = v41.size.height;
    id v18 = [*(id *)(a1 + 32) columnButton];
    double v19 = objc_msgSend(v18, "ic_animator");
    objc_msgSend(v19, "setFrame:", v14, v15, v16, v17);
  }
  else
  {
    CGRect v42 = CGRectOffset(*(CGRect *)&v4, -5.0, 0.0);
    double v20 = v42.origin.x;
    double v21 = v42.origin.y;
    double v22 = v42.size.width;
    double v23 = v42.size.height;
    CGFloat v24 = [*(id *)(a1 + 32) dragView];
    double v25 = objc_msgSend(v24, "ic_animator");
    objc_msgSend(v25, "setFrame:", v20, v21, v22, v23);

    CGFloat v26 = [*(id *)(a1 + 32) rowButton];
    [v26 frame];
    CGRect v44 = CGRectOffset(v43, -5.0, 0.0);
    double v27 = v44.origin.x;
    double v28 = v44.origin.y;
    double v29 = v44.size.width;
    double v30 = v44.size.height;
    long long v31 = [*(id *)(a1 + 32) rowButton];
    long long v32 = objc_msgSend(v31, "ic_animator");
    objc_msgSend(v32, "setFrame:", v27, v28, v29, v30);

    long long v33 = [*(id *)(a1 + 32) tableContentView];
    long long v34 = [*(id *)(a1 + 32) view];
    objc_msgSend(v33, "convertPoint:toView:", v34, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    double v36 = v35;

    if (v36 >= -1.0) {
      return;
    }
    id v37 = [*(id *)(a1 + 32) rowButton];
    id v18 = objc_msgSend(v37, "ic_animator");
    objc_msgSend(v18, "ic_setAlpha:", 0.0);
  }
}

- (void)dragMovedOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v8 = [(ICTableAttachmentViewController *)self draggingAppearance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke;
  void v9[3] = &unk_2640BA240;
  v9[4] = self;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  BOOL v10 = a3;
  [v8 performAsDefaultAppearance:v9];
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke(uint64_t a1)
{
  uint64_t v557 = *MEMORY[0x263EF8340];
  uint64_t v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDragGestureLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  int v2 = [*v1 dragView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  if (*(unsigned char *)(a1 + 56))
  {
    double v7 = *(double *)(a1 + 40);
    [*(id *)(a1 + 32) initialDragOffset];
    double v9 = v8;
    BOOL v10 = [*(id *)(a1 + 32) dragView];
    [v10 frame];
    double v12 = v11;
    double v13 = [*(id *)(a1 + 32) dragView];
    objc_msgSend(v13, "setFrame:", v7 + v9 + v4 * -0.5, v12, v4, v6);

    double v14 = [*(id *)(a1 + 32) view];
    double v15 = [*(id *)(a1 + 32) columnButton];
    double v16 = [v15 superview];
    objc_msgSend(v14, "convertPoint:toView:", v16, *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v18 = v17;
    [*(id *)(a1 + 32) initialDragOffset];
    double v20 = v19;
    double v21 = [*(id *)(a1 + 32) columnButton];
    [v21 frame];
    double v23 = v22;
    CGFloat v24 = [*(id *)(a1 + 32) columnButton];
    [v24 frame];
    double v26 = v25;
    double v27 = [*(id *)(a1 + 32) columnButton];
    [v27 frame];
    double v29 = v28;
    double v30 = [*(id *)(a1 + 32) columnButton];
    [v30 frame];
    double v32 = v31;
    long long v33 = [*(id *)(a1 + 32) columnButton];
    double v34 = v18 + v20 + v23 * -0.5;
  }
  else
  {
    double v35 = [*(id *)(a1 + 32) dragView];
    [v35 frame];
    double v37 = v36;
    double v38 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) initialDragOffset];
    double v40 = v39;
    CGRect v41 = [*(id *)(a1 + 32) dragView];
    objc_msgSend(v41, "setFrame:", v37, v38 + v40 + v6 * -0.5, v4, v6);

    double v14 = [*(id *)(a1 + 32) rowButton];
    [v14 frame];
    double v34 = v42;
    double v15 = [*(id *)(a1 + 32) view];
    double v16 = [*(id *)(a1 + 32) rowButton];
    double v21 = [v16 superview];
    objc_msgSend(v15, "convertPoint:toView:", v21, *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v44 = v43;
    [*(id *)(a1 + 32) initialDragOffset];
    double v46 = v45;
    CGFloat v24 = [*(id *)(a1 + 32) rowButton];
    [v24 frame];
    double v48 = v47;
    double v27 = [*(id *)(a1 + 32) rowButton];
    [v27 frame];
    double v29 = v49;
    double v30 = [*(id *)(a1 + 32) rowButton];
    [v30 frame];
    double v32 = v50;
    long long v33 = [*(id *)(a1 + 32) rowButton];
    double v26 = v44 + v46 + v48 * -0.5;
  }
  objc_msgSend(v33, "setFrame:", v34, v26, v29, v32);

  CGFloat v51 = [*(id *)(a1 + 32) tableContentView];
  double v52 = [*(id *)(a1 + 32) dragView];
  [v52 frame];
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  uint64_t v61 = [*(id *)(a1 + 32) dragView];
  double v62 = [(id)v61 superview];
  objc_msgSend(v51, "convertRect:fromView:", v62, v54, v56, v58, v60);
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;

  double v71 = [*(id *)(a1 + 32) tableAutoScroller];
  objc_msgSend(v71, "setTargetFrame:", v64, v66, v68, v70);

  LOBYTE(v61) = *(unsigned char *)(a1 + 56) == 0;
  double v72 = [*(id *)(a1 + 32) textViewManager];
  double v73 = *(void **)(a1 + 32);
  v482.origin.CGFloat x = v64;
  CGFloat v477 = v68;
  CGFloat v479 = v66;
  CGFloat rect = v70;
  if (v61)
  {
    CGFloat v109 = [v73 rowButton];
    double v110 = [v109 columnOrRowIdentifiers];
    CGFloat v111 = [v110 firstObject];
    [v72 frameOfRow:v111];
    CGFloat v113 = v112;
    CGFloat v115 = v114;
    CGFloat v117 = v116;
    CGFloat v119 = v118;

    v120 = [*v1 textViewManager];
    v121 = [*v1 rowButton];
    id v122 = [v121 columnOrRowIdentifiers];
    uint64_t v123 = [v122 lastObject];
    [v120 frameOfRow:v123];
    CGFloat v125 = v124;
    CGFloat v127 = v126;
    CGFloat v129 = v128;
    CGFloat v131 = v130;

    v561.origin.CGFloat x = v113;
    v561.origin.CGFloat y = v115;
    v561.size.CGFloat width = v117;
    v561.size.CGFloat height = v119;
    v585.origin.CGFloat x = v125;
    v585.origin.CGFloat y = v127;
    v585.size.CGFloat width = v129;
    v585.size.CGFloat height = v131;
    CGRect v562 = CGRectUnion(v561, v585);
    CGFloat x = v562.origin.x;
    CGFloat y = v562.origin.y;
    CGFloat width = v562.size.width;
    CGFloat height = v562.size.height;
    v562.origin.CGFloat x = v482.origin.x;
    v562.size.CGFloat width = v477;
    v562.origin.CGFloat y = v479;
    v562.size.CGFloat height = rect;
    double MidY = CGRectGetMidY(v562);
    v563.origin.CGFloat x = x;
    v563.origin.CGFloat y = y;
    v563.size.CGFloat width = width;
    v563.size.CGFloat height = height;
    unsigned int v474 = MidY < CGRectGetMidY(v563);
    CGFloat v137 = [*v1 tableContentView];
    CGFloat v138 = [*v1 dragView];
    [v138 frame];
    double MidX = CGRectGetMidX(v564);
    CGFloat v140 = [*v1 dragView];
    [v140 frame];
    if (v474) {
      double MinY = CGRectGetMinY(*(CGRect *)&v141);
    }
    else {
      double MinY = CGRectGetMaxY(*(CGRect *)&v141);
    }
    double v170 = MinY;
    CGRect v171 = [*v1 view];
    objc_msgSend(v137, "convertPoint:fromView:", v171, MidX, v170);
    double v173 = v172;

    CGRect v174 = [*v1 textViewManager];
    [v174 boundingRect];
    CGFloat v176 = v175;
    CGFloat v178 = v177;
    CGFloat v180 = v179;
    CGFloat v182 = v181;

    v568.origin.CGFloat x = v176;
    v568.origin.CGFloat y = v178;
    v568.size.CGFloat width = v180;
    v568.size.CGFloat height = v182;
    double v183 = CGRectGetMinY(v568);
    if (v183 >= v173) {
      double v173 = v183;
    }
    v569.origin.CGFloat x = v176;
    CGFloat v162 = v482.origin.x;
    v569.origin.CGFloat y = v178;
    v569.size.CGFloat width = v180;
    CGFloat v164 = v477;
    CGFloat v163 = v479;
    v569.size.CGFloat height = v182;
    CGFloat v165 = rect;
    double MaxY = CGRectGetMaxY(v569);
    if (v173 >= MaxY) {
      double v173 = MaxY;
    }
    CGRect v167 = [*v1 textViewManager];
    [v167 rowContainingY:v173];
    uint64_t v168 = v169 = 0;
  }
  else
  {
    double v74 = [v73 columnButton];
    double v75 = [v74 columnOrRowIdentifiers];
    double v76 = [v75 firstObject];
    [v72 frameOfColumn:v76];
    CGFloat v78 = v77;
    CGFloat v80 = v79;
    CGFloat v82 = v81;
    CGFloat v84 = v83;

    double v85 = [*v1 textViewManager];
    id v86 = [*v1 columnButton];
    uint64_t v87 = [v86 columnOrRowIdentifiers];
    CGFloat v88 = [v87 lastObject];
    [v85 frameOfColumn:v88];
    CGFloat v90 = v89;
    CGFloat v92 = v91;
    CGFloat v94 = v93;
    CGFloat v96 = v95;

    v558.origin.CGFloat x = v78;
    v558.origin.CGFloat y = v80;
    v558.size.CGFloat width = v82;
    v558.size.CGFloat height = v84;
    v584.origin.CGFloat x = v90;
    v584.origin.CGFloat y = v92;
    v584.size.CGFloat width = v94;
    v584.size.CGFloat height = v96;
    CGRect v559 = CGRectUnion(v558, v584);
    CGFloat v97 = v559.origin.x;
    CGFloat v98 = v559.origin.y;
    CGFloat v99 = v559.size.width;
    CGFloat v100 = v559.size.height;
    v559.origin.CGFloat x = v482.origin.x;
    v559.size.CGFloat width = v477;
    v559.origin.CGFloat y = v479;
    v559.size.CGFloat height = rect;
    double v101 = CGRectGetMidX(v559);
    v560.origin.CGFloat x = v97;
    v560.origin.CGFloat y = v98;
    v560.size.CGFloat width = v99;
    v560.size.CGFloat height = v100;
    unsigned int v474 = v101 < CGRectGetMidX(v560);
    double v102 = [*v1 tableContentView];
    uint64_t v103 = [*v1 dragView];
    [v103 frame];
    if (v474) {
      double MinX = CGRectGetMinX(*(CGRect *)&v104);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v104);
    }
    double v146 = MinX;
    CGRect v147 = [*v1 dragView];
    [v147 frame];
    double v148 = CGRectGetMidY(v565);
    CGRect v149 = [*v1 view];
    objc_msgSend(v102, "convertPoint:fromView:", v149, v146, v148);
    double v151 = v150;

    CGRect v152 = [*v1 textViewManager];
    [v152 boundingRect];
    CGFloat v154 = v153;
    CGFloat v156 = v155;
    CGFloat v158 = v157;
    CGFloat v160 = v159;

    v566.origin.CGFloat x = v154;
    v566.origin.CGFloat y = v156;
    v566.size.CGFloat width = v158;
    v566.size.CGFloat height = v160;
    double v161 = CGRectGetMinX(v566);
    if (v161 >= v151) {
      double v151 = v161;
    }
    v567.origin.CGFloat x = v154;
    CGFloat v162 = v482.origin.x;
    v567.origin.CGFloat y = v156;
    v567.size.CGFloat width = v158;
    CGFloat v164 = v477;
    CGFloat v163 = v479;
    v567.size.CGFloat height = v160;
    CGFloat v165 = rect;
    double MaxX = CGRectGetMaxX(v567);
    if (v151 >= MaxX) {
      double v151 = MaxX;
    }
    CGRect v167 = [*v1 textViewManager];
    [v167 columnContainingX:v151];
    v169 = uint64_t v168 = 0;
  }

  v478 = (void *)v169;
  if (!(v169 | v168)) {
    goto LABEL_250;
  }
  recta = (void *)v168;
  BOOL v185 = *(unsigned char *)(a1 + 56) == 0;
  v186 = [*(id *)(a1 + 32) table];
  uint64_t v187 = v186;
  if (v185)
  {
    unint64_t v188 = [v186 rowIndexForIdentifier:v168];

    v189 = [*v1 table];
    v190 = [*v1 rowButton];
    v191 = [v190 columnOrRowIdentifiers];
    v192 = [v191 firstObject];
    uint64_t v193 = [v189 rowIndexForIdentifier:v192];
  }
  else
  {
    unint64_t v188 = [v186 columnIndexForIdentifier:v478];

    v189 = [*v1 table];
    v190 = [*v1 columnButton];
    v191 = [v190 columnOrRowIdentifiers];
    v192 = [v191 firstObject];
    uint64_t v193 = [v189 columnIndexForIdentifier:v192];
  }
  unint64_t v473 = v193;

  if (*(unsigned char *)(a1 + 56)
    && ([*v1 table],
        v194 = objc_claimAutoreleasedReturnValue(),
        int v195 = [v194 isRightToLeft],
        v194,
        v195))
  {
    if (v188 < v473) {
      char v196 = v474;
    }
    else {
      char v196 = 0;
    }
    if (v196) {
      uint64_t v197 = 1;
    }
    else {
      uint64_t v197 = (uint64_t)((unint64_t)((v188 > v473) & ~v474) << 63) >> 63;
    }
  }
  else
  {
    if (v188 > v473) {
      char v198 = v474;
    }
    else {
      char v198 = 0;
    }
    if (v198) {
      uint64_t v197 = -1;
    }
    else {
      uint64_t v197 = (v188 < v473) & ~v474;
    }
  }
  if ([*v1 currentDragIndex] == v188 + v197) {
    goto LABEL_238;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
LABEL_43:
    v202 = [*v1 rowButton];
    v203 = [v202 columnOrRowIdentifiers];
    char v204 = [v203 containsObject:recta];

    if (v204) {
      goto LABEL_238;
    }
    v205 = [*v1 rowButton];
    id v480 = [v205 columnOrRowIdentifiers];

    id v206 = [MEMORY[0x263EFF980] array];
    id v207 = recta;
    v208 = [*v1 textViewManager];
    if (v474)
    {
      v209 = [v480 firstObject];
      [v208 frameOfRow:v209];
      double v211 = v210;
      while (1)
      {

        v212 = [*v1 textViewManager];
        [v212 frameOfRow:v207];
        if (v213 >= v211)
        {
          char v214 = [v480 containsObject:v207];

          if ((v214 & 1) == 0) {
            break;
          }
        }
        else
        {
        }
        v570.origin.CGFloat x = v162;
        v570.origin.CGFloat y = v163;
        v570.size.CGFloat width = v164;
        v570.size.CGFloat height = v165;
        double v215 = CGRectGetMinY(v570);
        double v216 = [*v1 textViewManager];
        [v216 frameOfRow:v207];
        if (v215 >= CGRectGetMidY(v571))
        {
        }
        else
        {
          char v217 = [v480 containsObject:v207];

          if ((v217 & 1) == 0) {
            [v206 addObject:v207];
          }
        }
        v218 = [*v1 table];
        unint64_t v219 = [v218 rowIndexForIdentifier:v207];

        double v220 = [*v1 table];
        unint64_t v221 = [v220 rowCount] - 1;

        if (v219 >= v221) {
          break;
        }
        v208 = [*v1 table];
        [v208 identifierForRowAtIndex:v219 + 1];
        v209 = v207;
        id v207 = (id)objc_claimAutoreleasedReturnValue();
      }
      if ([v206 count])
      {
        long long v513 = 0u;
        long long v514 = 0u;
        long long v511 = 0u;
        long long v512 = 0u;
        id v245 = v480;
        uint64_t v246 = [v245 countByEnumeratingWithState:&v511 objects:v551 count:16];
        if (v246)
        {
          uint64_t v247 = *(void *)v512;
          v482.origin.CGFloat x = 0.0;
          do
          {
            for (uint64_t i = 0; i != v246; ++i)
            {
              if (*(void *)v512 != v247) {
                objc_enumerationMutation(v245);
              }
              uint64_t v249 = *(void *)(*((void *)&v511 + 1) + 8 * i);
              double v250 = [*v1 rowHeightCache];
              [v250 dimensionForKey:v249];
              double v252 = v251;

              v482.origin.CGFloat x = v482.origin.x + v252;
            }
            uint64_t v246 = [v245 countByEnumeratingWithState:&v511 objects:v551 count:16];
          }
          while (v246);
          goto LABEL_134;
        }
LABEL_133:
        v482.origin.CGFloat x = 0.0;
LABEL_134:

LABEL_135:
        double v299 = [*v1 table];
        double v300 = [v206 firstObject];
        unint64_t v301 = [v299 rowIndexForIdentifier:v300];

        uint64_t v302 = 0x7FFFFFFFFFFFFFFFLL;
        if (v301 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v301 > v473) {
            unsigned int v303 = v474;
          }
          else {
            unsigned int v303 = 0;
          }
          if (v303 == 1) {
            uint64_t v302 = v301 - 1;
          }
          else {
            uint64_t v302 = v301 + ((v301 < v473) & ~v474);
          }
        }
        uint64_t v472 = v302;
        double v304 = [*v1 textViewManager];
        double v305 = [v304 rowIDs];
        v306 = [*v1 rowButton];
        v307 = [v306 columnOrRowIdentifiers];
        v308 = [v307 firstObject];
        unint64_t v309 = [v305 indexOfObject:v308];

        if (v474)
        {
          BOOL v310 = v309 >= [v206 count];
        }
        else
        {
          uint64_t v311 = [v480 count];
          uint64_t v312 = [v206 count];
          v313 = [*v1 table];
          BOOL v310 = v309 + v311 + v312 - 1 <= [v313 rowCount];
        }
        if ([v206 count]
          && [*v1 currentDragIndex] != v472
          && v309 != 0x7FFFFFFFFFFFFFFFLL
          && v310)
        {
          long long v505 = 0u;
          long long v506 = 0u;
          long long v503 = 0u;
          long long v504 = 0u;
          id v314 = v206;
          uint64_t v315 = [v314 countByEnumeratingWithState:&v503 objects:v549 count:16];
          double v316 = *MEMORY[0x263F001A8];
          double v317 = *(double *)(MEMORY[0x263F001A8] + 8);
          double v318 = *(double *)(MEMORY[0x263F001A8] + 16);
          double v319 = *(double *)(MEMORY[0x263F001A8] + 24);
          if (v315)
          {
            uint64_t v320 = *(void *)v504;
            do
            {
              for (uint64_t j = 0; j != v315; ++j)
              {
                if (*(void *)v504 != v320) {
                  objc_enumerationMutation(v314);
                }
                uint64_t v322 = *(void *)(*((void *)&v503 + 1) + 8 * j);
                v323 = [*v1 textViewManager];
                [v323 frameOfRow:v322];
                CGFloat v325 = v324;
                CGFloat v327 = v326;
                CGFloat v329 = v328;
                CGFloat v331 = v330;

                v578.origin.CGFloat x = v316;
                v578.origin.CGFloat y = v317;
                v578.size.CGFloat width = v318;
                v578.size.CGFloat height = v319;
                if (CGRectIsEmpty(v578))
                {
                  double v316 = v325;
                  double v317 = v327;
                  double v318 = v329;
                  double v319 = v331;
                }
                else
                {
                  v579.origin.CGFloat x = v316;
                  v579.origin.CGFloat y = v317;
                  v579.size.CGFloat width = v318;
                  v579.size.CGFloat height = v319;
                  v586.origin.CGFloat x = v325;
                  v586.origin.CGFloat y = v327;
                  v586.size.CGFloat width = v329;
                  v586.size.CGFloat height = v331;
                  CGRect v580 = CGRectUnion(v579, v586);
                  double v316 = v580.origin.x;
                  double v317 = v580.origin.y;
                  double v318 = v580.size.width;
                  double v319 = v580.size.height;
                }
              }
              uint64_t v315 = [v314 countByEnumeratingWithState:&v503 objects:v549 count:16];
            }
            while (v315);
          }

          v470 = objc_msgSend(*v1, "dragSnapshotFromRect:afterScreenUpdates:", 0, v316, v317, v318, v319);
          CGRect v332 = [*v1 scrollView];
          CGRect v333 = [*v1 tableContentView];
          objc_msgSend(v332, "convertRect:fromView:", v333, v316, v317, v318, v319);
          objc_msgSend(v470, "setFrame:");

          CGRect v334 = [*v1 scrollView];
          [v334 addSubview:v470];

          long long v501 = 0u;
          long long v502 = 0u;
          long long v499 = 0u;
          long long v500 = 0u;
          id v335 = v314;
          uint64_t v336 = [v335 countByEnumeratingWithState:&v499 objects:v548 count:16];
          if (v336)
          {
            uint64_t v337 = *(void *)v500;
            do
            {
              for (uint64_t k = 0; k != v336; ++k)
              {
                if (*(void *)v500 != v337) {
                  objc_enumerationMutation(v335);
                }
                [*v1 setHidden:1 forRow:*(void *)(*((void *)&v499 + 1) + 8 * k)];
              }
              uint64_t v336 = [v335 countByEnumeratingWithState:&v499 objects:v548 count:16];
            }
            while (v336);
          }

          CGRect v339 = [*v1 textViewManager];
          CGRect v340 = [v335 firstObject];
          [v339 frameOfRow:v340];
          uint64_t v342 = v341;
          uint64_t v344 = v343;
          uint64_t v346 = v345;
          uint64_t v348 = v347;

          uint64_t v527 = 0;
          v528 = &v527;
          uint64_t v529 = 0x2020000000;
          CGFloat v530 = 0.0;
          uint64_t v349 = v342;
          uint64_t v350 = v344;
          uint64_t v351 = v346;
          uint64_t v352 = v348;
          if (v474)
          {
            CGFloat v530 = CGRectGetMinY(*(CGRect *)&v349);
            v496[0] = MEMORY[0x263EF8330];
            v496[1] = 3221225472;
            v496[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_6;
            v496[3] = &unk_2640BA268;
            v496[4] = *v1;
            v498 = &v527;
            id v497 = v335;
            [v480 enumerateObjectsWithOptions:0 usingBlock:v496];
          }
          else
          {
            CGFloat v530 = CGRectGetMaxY(*(CGRect *)&v349);
            v493[0] = MEMORY[0x263EF8330];
            v493[1] = 3221225472;
            v493[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_7;
            v493[3] = &unk_2640BA268;
            v493[4] = *v1;
            v495 = &v527;
            id v494 = v335;
            [v480 enumerateObjectsWithOptions:2 usingBlock:v493];
          }
          _Block_object_dispose(&v527, 8);
          long long v491 = 0u;
          long long v492 = 0u;
          long long v489 = 0u;
          long long v490 = 0u;
          id v444 = v335;
          uint64_t v445 = [v444 countByEnumeratingWithState:&v489 objects:v547 count:16];
          if (v445)
          {
            uint64_t v446 = *(void *)v490;
            do
            {
              for (uint64_t m = 0; m != v445; ++m)
              {
                if (*(void *)v490 != v446) {
                  objc_enumerationMutation(v444);
                }
                uint64_t v448 = *(void *)(*((void *)&v489 + 1) + 8 * m);
                v449 = [*v1 tableLayoutManager];
                v450 = [v449 rowPositions];
                v451 = [v450 objectForKey:v448];
                [v451 doubleValue];
                double v453 = v452;

                v454 = [*v1 tableLayoutManager];
                CGFloat v455 = v482.origin.x + v453;
                [v454 setYPosition:v448 forRow:1 shouldInvalidate:v455];

                v456 = [*v1 tableContentView];
                v457 = [NSNumber numberWithDouble:v455];
                [v456 setHorizontalLinePosition:v457 forKey:v448];
              }
              uint64_t v445 = [v444 countByEnumeratingWithState:&v489 objects:v547 count:16];
            }
            while (v445);
          }

          v458 = (void *)MEMORY[0x263F82E00];
          v439 = v488;
          v488[0] = MEMORY[0x263EF8330];
          v488[1] = 3221225472;
          v488[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_8;
          v488[3] = &unk_2640B94E8;
          id v459 = v470;
          v488[4] = v459;
          v488[5] = *(void *)&v482.origin.x;
          p_CGFloat y = (id *)&v482.origin.y;
          *(void *)&v482.origin.CGFloat y = MEMORY[0x263EF8330];
          *(void *)&v482.size.CGFloat width = 3221225472;
          *(void *)&v482.size.CGFloat height = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_9;
          v483 = &unk_2640B8C20;
          id v206 = v444;
          id v460 = *v1;
          id v484 = v206;
          id v485 = v460;
          id v486 = v459;
          id v480 = v480;
          id v487 = v480;
          id v443 = v459;
          objc_msgSend(v458, "ic_animateWithDuration:animations:completion:", v488, &v482.origin.y, 0.2);
          goto LABEL_236;
        }
        goto LABEL_237;
      }
    }
    else
    {
      double v226 = [v480 lastObject];
      [v208 frameOfRow:v226];
      double v228 = v227;
      while (1)
      {

        CGFloat v229 = [*v1 textViewManager];
        [v229 frameOfRow:v207];
        if (v230 <= v228)
        {
          char v231 = [v480 containsObject:v207];

          if ((v231 & 1) == 0) {
            break;
          }
        }
        else
        {
        }
        v572.origin.CGFloat x = v162;
        v572.origin.CGFloat y = v163;
        v572.size.CGFloat width = v164;
        v572.size.CGFloat height = v165;
        double v232 = CGRectGetMaxY(v572);
        double v233 = [*v1 textViewManager];
        [v233 frameOfRow:v207];
        if (v232 <= CGRectGetMidY(v573))
        {
        }
        else
        {
          char v234 = [v480 containsObject:v207];

          if ((v234 & 1) == 0) {
            [v206 addObject:v207];
          }
        }
        double v235 = [*v1 table];
        uint64_t v236 = [v235 rowIndexForIdentifier:v207];

        if (!v236) {
          break;
        }
        v208 = [*v1 table];
        [v208 identifierForRowAtIndex:v236 - 1];
        double v226 = v207;
        id v207 = (id)objc_claimAutoreleasedReturnValue();
      }
      if ([v206 count])
      {
        long long v509 = 0u;
        long long v510 = 0u;
        long long v507 = 0u;
        long long v508 = 0u;
        id v237 = v480;
        uint64_t v238 = [v237 countByEnumeratingWithState:&v507 objects:v550 count:16];
        if (v238)
        {
          uint64_t v239 = *(void *)v508;
          v482.origin.CGFloat x = 0.0;
          do
          {
            for (uint64_t n = 0; n != v238; ++n)
            {
              if (*(void *)v508 != v239) {
                objc_enumerationMutation(v237);
              }
              uint64_t v241 = *(void *)(*((void *)&v507 + 1) + 8 * n);
              v242 = [*v1 rowHeightCache];
              [v242 dimensionForKey:v241];
              double v244 = v243;

              v482.origin.CGFloat x = v482.origin.x - v244;
            }
            uint64_t v238 = [v237 countByEnumeratingWithState:&v507 objects:v550 count:16];
          }
          while (v238);
          goto LABEL_134;
        }
        goto LABEL_133;
      }
    }
    v482.origin.CGFloat x = 0.0;
    goto LABEL_135;
  }
  v199 = [*v1 columnButton];
  v200 = [v199 columnOrRowIdentifiers];
  char v201 = [v200 containsObject:v478];

  if (v201)
  {
    if (*(unsigned char *)(a1 + 56)) {
      goto LABEL_238;
    }
    goto LABEL_43;
  }
  double v222 = [*v1 columnButton];
  id v480 = [v222 columnOrRowIdentifiers];

  id v206 = [MEMORY[0x263EFF980] array];
  id v223 = v478;
  v224 = [*v1 table];
  char v225 = [v224 isLeftToRight];
  if (v474)
  {
    if (v225) {
      [v480 firstObject];
    }
    else {
    double v253 = [v480 lastObject];
    }

    v254 = [*v1 textViewManager];
    [v254 frameOfColumn:v253];
    double v256 = v255;
    while (1)
    {

      v257 = [*v1 textViewManager];
      [v257 frameOfColumn:v223];
      if (v258 >= v256)
      {
        char v259 = [v480 containsObject:v223];

        if ((v259 & 1) == 0) {
          goto LABEL_106;
        }
      }
      else
      {
      }
      v574.origin.CGFloat x = v162;
      v574.origin.CGFloat y = v163;
      v574.size.CGFloat width = v164;
      v574.size.CGFloat height = v165;
      double v260 = CGRectGetMinX(v574);
      double v261 = [*v1 textViewManager];
      [v261 frameOfColumn:v223];
      if (v260 >= CGRectGetMidX(v575))
      {
      }
      else
      {
        char v262 = [v480 containsObject:v223];

        if ((v262 & 1) == 0) {
          [v206 addObject:v223];
        }
      }
      double v263 = [*v1 table];
      unint64_t v264 = [v263 columnIndexForIdentifier:v223];

      double v265 = [*v1 table];
      if ([v265 isLeftToRight])
      {
        v266 = [*v1 table];
        unint64_t v267 = [v266 columnCount] - 1;

        if (v264 < v267)
        {
          uint64_t v268 = 1;
          goto LABEL_105;
        }
      }
      else
      {
      }
      v269 = [*v1 table];
      int v270 = [v269 isRightToLeft];

      if (!v270 || !v264)
      {
LABEL_106:
        if ([v206 count])
        {
          long long v546 = 0u;
          long long v545 = 0u;
          long long v544 = 0u;
          long long v543 = 0u;
          id v272 = v480;
          uint64_t v273 = [v272 countByEnumeratingWithState:&v543 objects:v556 count:16];
          if (v273)
          {
            uint64_t v274 = *(void *)v544;
            v482.origin.CGFloat x = 0.0;
            do
            {
              for (iuint64_t i = 0; ii != v273; ++ii)
              {
                if (*(void *)v544 != v274) {
                  objc_enumerationMutation(v272);
                }
                uint64_t v276 = *(void *)(*((void *)&v543 + 1) + 8 * ii);
                double v277 = [*v1 columnWidthCache];
                [v277 dimensionForKey:v276];
                double v279 = v278;

                v482.origin.CGFloat x = v482.origin.x + v279;
              }
              uint64_t v273 = [v272 countByEnumeratingWithState:&v543 objects:v556 count:16];
            }
            while (v273);
            goto LABEL_180;
          }
LABEL_179:
          v482.origin.CGFloat x = 0.0;
          goto LABEL_180;
        }
LABEL_178:
        v482.origin.CGFloat x = 0.0;
        goto LABEL_181;
      }
      uint64_t v268 = -1;
LABEL_105:
      v254 = [*v1 table];
      uint64_t v271 = [v254 identifierForColumnAtIndex:v264 + v268];

      id v223 = (id)v271;
    }
  }
  if (v225) {
    [v480 lastObject];
  }
  else {
  double v253 = [v480 firstObject];
  }

  double v280 = [*v1 textViewManager];
  [v280 frameOfColumn:v253];
  double v282 = v281;
  while (1)
  {

    v283 = [*v1 textViewManager];
    [v283 frameOfColumn:v223];
    if (v284 <= v282)
    {
      char v285 = [v480 containsObject:v223];

      if ((v285 & 1) == 0) {
        goto LABEL_169;
      }
    }
    else
    {
    }
    v576.origin.CGFloat x = v162;
    v576.origin.CGFloat y = v163;
    v576.size.CGFloat width = v164;
    v576.size.CGFloat height = v165;
    double v286 = CGRectGetMaxX(v576);
    double v287 = [*v1 textViewManager];
    [v287 frameOfColumn:v223];
    if (v286 <= CGRectGetMidX(v577))
    {
    }
    else
    {
      char v288 = [v480 containsObject:v223];

      if ((v288 & 1) == 0) {
        [v206 addObject:v223];
      }
    }
    double v289 = [*v1 table];
    unint64_t v290 = [v289 columnIndexForIdentifier:v223];

    double v291 = [*v1 table];
    char v292 = [v291 isLeftToRight];
    if (v290) {
      char v293 = v292;
    }
    else {
      char v293 = 0;
    }

    v294 = [*v1 table];
    double v280 = v294;
    if (v293)
    {
      uint64_t v295 = -1;
      goto LABEL_132;
    }
    if (([v294 isRightToLeft] & 1) == 0) {
      break;
    }
    v296 = [*v1 table];
    unint64_t v297 = [v296 columnCount] - 1;

    if (v290 >= v297) {
      goto LABEL_169;
    }
    double v280 = [*v1 table];
    uint64_t v295 = 1;
LABEL_132:
    uint64_t v298 = [v280 identifierForColumnAtIndex:v290 + v295];

    id v223 = (id)v298;
  }

LABEL_169:
  if (![v206 count]) {
    goto LABEL_178;
  }
  long long v542 = 0u;
  long long v541 = 0u;
  long long v540 = 0u;
  long long v539 = 0u;
  id v353 = v480;
  uint64_t v354 = [v353 countByEnumeratingWithState:&v539 objects:v555 count:16];
  if (!v354) {
    goto LABEL_179;
  }
  uint64_t v355 = *(void *)v540;
  v482.origin.CGFloat x = 0.0;
  do
  {
    for (juint64_t j = 0; jj != v354; ++jj)
    {
      if (*(void *)v540 != v355) {
        objc_enumerationMutation(v353);
      }
      uint64_t v357 = *(void *)(*((void *)&v539 + 1) + 8 * jj);
      CGRect v358 = [*v1 columnWidthCache];
      [v358 dimensionForKey:v357];
      double v360 = v359;

      v482.origin.CGFloat x = v482.origin.x - v360;
    }
    uint64_t v354 = [v353 countByEnumeratingWithState:&v539 objects:v555 count:16];
  }
  while (v354);
LABEL_180:

LABEL_181:
  v361 = [*v1 table];
  v362 = [v206 firstObject];
  unint64_t v363 = [v361 columnIndexForIdentifier:v362];

  v364 = [*v1 table];
  LODWORD(v361) = [v364 isLeftToRight];

  if (v361)
  {
    if (v363 > v473) {
      char v365 = v474;
    }
    else {
      char v365 = 0;
    }
    if ((v365 & 1) == 0)
    {
      uint64_t v366 = (v363 < v473) & ~v474;
      goto LABEL_195;
    }
  }
  else
  {
    if (v363 <= v473) {
      int v367 = 1;
    }
    else {
      int v367 = v474;
    }
    if (v367 == 1)
    {
      if (v363 < v473) {
        uint64_t v366 = v474;
      }
      else {
        uint64_t v366 = 0;
      }
      goto LABEL_195;
    }
  }
  uint64_t v366 = -1;
LABEL_195:
  v368 = [*v1 textViewManager];
  v369 = [v368 columnIDs];
  v370 = [v480 firstObject];
  unint64_t v371 = [v369 indexOfObject:v370];

  if (v474)
  {
    BOOL v372 = v371 >= [v206 count];
  }
  else
  {
    uint64_t v373 = [v480 count];
    uint64_t v374 = [v206 count];
    v375 = [*v1 table];
    BOOL v372 = v371 + v373 + v374 - 1 <= [v375 columnCount];
  }
  if ([v206 count]
    && [*v1 currentDragIndex] != v363 + v366
    && v371 != 0x7FFFFFFFFFFFFFFFLL
    && v372)
  {
    uint64_t v472 = v363 + v366;
    long long v538 = 0u;
    long long v537 = 0u;
    long long v535 = 0u;
    long long v536 = 0u;
    id v376 = v206;
    uint64_t v377 = [v376 countByEnumeratingWithState:&v535 objects:v554 count:16];
    double v378 = *MEMORY[0x263F001A0];
    double v379 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v380 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v381 = *(double *)(MEMORY[0x263F001A0] + 24);
    if (v377)
    {
      uint64_t v382 = *(void *)v536;
      do
      {
        for (kuint64_t k = 0; kk != v377; ++kk)
        {
          if (*(void *)v536 != v382) {
            objc_enumerationMutation(v376);
          }
          uint64_t v384 = *(void *)(*((void *)&v535 + 1) + 8 * kk);
          v385 = [*v1 textViewManager];
          [v385 frameOfColumn:v384];
          CGFloat v387 = v386;
          CGFloat v389 = v388;
          CGFloat v391 = v390;
          CGFloat v393 = v392;

          v581.origin.CGFloat x = v378;
          v581.origin.CGFloat y = v379;
          v581.size.CGFloat width = v380;
          v581.size.CGFloat height = v381;
          v587.origin.CGFloat x = v387;
          v587.origin.CGFloat y = v389;
          v587.size.CGFloat width = v391;
          v587.size.CGFloat height = v393;
          CGRect v582 = CGRectUnion(v581, v587);
          double v378 = v582.origin.x;
          double v379 = v582.origin.y;
          double v380 = v582.size.width;
          double v381 = v582.size.height;
        }
        uint64_t v377 = [v376 countByEnumeratingWithState:&v535 objects:v554 count:16];
      }
      while (v377);
    }

    v471 = objc_msgSend(*v1, "dragSnapshotFromRect:afterScreenUpdates:", 0, v378, v379, v380, v381);
    v394 = [*v1 tableContentView];
    [v394 innerBorderWidth];
    double v396 = v395;
    v397 = [v471 layer];
    [v397 setBorderWidth:v396];

    v398 = [*v1 tableContentView];
    id v399 = [v398 innerBorderColor];
    uint64_t v400 = [v399 CGColor];
    v401 = [v471 layer];
    [v401 setBorderColor:v400];

    v402 = [*v1 scrollView];
    v403 = [*v1 tableContentView];
    objc_msgSend(v402, "convertRect:fromView:", v403, v378, v379, v380, v381);
    objc_msgSend(v471, "setFrame:");

    v404 = [*v1 scrollView];
    [v404 addSubview:v471];

    long long v533 = 0u;
    long long v534 = 0u;
    long long v531 = 0u;
    long long v532 = 0u;
    id v405 = v376;
    uint64_t v406 = [v405 countByEnumeratingWithState:&v531 objects:v553 count:16];
    if (v406)
    {
      uint64_t v407 = *(void *)v532;
      do
      {
        for (uint64_t mm = 0; mm != v406; ++mm)
        {
          if (*(void *)v532 != v407) {
            objc_enumerationMutation(v405);
          }
          [*v1 setHidden:1 forColumn:*(void *)(*((void *)&v531 + 1) + 8 * mm)];
        }
        uint64_t v406 = [v405 countByEnumeratingWithState:&v531 objects:v553 count:16];
      }
      while (v406);
    }

    v409 = [*v1 textViewManager];
    v410 = [v405 firstObject];
    [v409 frameOfColumn:v410];
    uint64_t v412 = v411;
    uint64_t v414 = v413;
    uint64_t v416 = v415;
    uint64_t v418 = v417;

    uint64_t v527 = 0;
    v528 = &v527;
    uint64_t v529 = 0x2020000000;
    CGFloat v530 = 0.0;
    uint64_t v419 = v412;
    uint64_t v420 = v414;
    uint64_t v421 = v416;
    uint64_t v422 = v418;
    if (v474)
    {
      CGFloat v530 = CGRectGetMinX(*(CGRect *)&v419);
      v524[0] = MEMORY[0x263EF8330];
      v524[1] = 3221225472;
      v524[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_2;
      v524[3] = &unk_2640BA268;
      v524[4] = *v1;
      v526 = &v527;
      id v525 = v405;
      [v480 enumerateObjectsWithOptions:0 usingBlock:v524];
    }
    else
    {
      CGFloat v530 = CGRectGetMaxX(*(CGRect *)&v419);
      v521[0] = MEMORY[0x263EF8330];
      v521[1] = 3221225472;
      v521[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_3;
      v521[3] = &unk_2640BA268;
      v521[4] = *v1;
      v523 = &v527;
      id v522 = v405;
      [v480 enumerateObjectsWithOptions:2 usingBlock:v521];
    }
    _Block_object_dispose(&v527, 8);
    long long v519 = 0u;
    long long v520 = 0u;
    long long v517 = 0u;
    long long v518 = 0u;
    id v423 = v405;
    uint64_t v424 = [v423 countByEnumeratingWithState:&v517 objects:v552 count:16];
    if (v424)
    {
      uint64_t v425 = *(void *)v518;
      do
      {
        for (nuint64_t n = 0; nn != v424; ++nn)
        {
          if (*(void *)v518 != v425) {
            objc_enumerationMutation(v423);
          }
          uint64_t v427 = *(void *)(*((void *)&v517 + 1) + 8 * nn);
          v428 = [*v1 textViewManager];
          v429 = [v428 textViewForColumn:v427];

          [v429 frame];
          double v430 = CGRectGetMinX(v583);
          [v429 frame];
          double v432 = v431;
          [v429 frame];
          double v434 = v433;
          [v429 frame];
          CGFloat v435 = v482.origin.x + v430;
          objc_msgSend(v429, "setFrame:", v435, v432, v434);
          v436 = [*v1 tableContentView];
          v437 = [NSNumber numberWithDouble:v435];
          [v436 setVerticalLinePosition:v437 forKey:v427];
        }
        uint64_t v424 = [v423 countByEnumeratingWithState:&v517 objects:v552 count:16];
      }
      while (v424);
    }

    v438 = (void *)MEMORY[0x263F82E00];
    v439 = v516;
    v516[0] = MEMORY[0x263EF8330];
    v516[1] = 3221225472;
    v516[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_4;
    v516[3] = &unk_2640B94E8;
    id v440 = v471;
    v516[4] = v440;
    v516[5] = *(void *)&v482.origin.x;
    p_CGFloat y = (id *)v515;
    v515[0] = MEMORY[0x263EF8330];
    v515[1] = 3221225472;
    v515[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_5;
    v515[3] = &unk_2640B8C20;
    id v206 = v423;
    id v442 = *v1;
    v515[4] = v206;
    v515[5] = v442;
    v515[6] = v440;
    id v480 = v480;
    v515[7] = v480;
    id v443 = v440;
    objc_msgSend(v438, "ic_animateWithDuration:animations:completion:", v516, v515, 0.2);
LABEL_236:
    [*v1 setCurrentDragIndex:v472];
  }
LABEL_237:

LABEL_238:
  uint64_t v461 = [*v1 lastDraggedOverColumnOrRowIndex];
  if (v461 != [*v1 currentDragIndex])
  {
    v462 = [*(id *)(a1 + 32) feedbackGenerator];
    [v462 dropTargetUpdated];

    BOOL v463 = v473 == [*(id *)(a1 + 32) currentDragIndex];
    int v464 = *(unsigned __int8 *)(a1 + 56);
    v465 = [MEMORY[0x263F086E0] mainBundle];
    v466 = v465;
    if (v463)
    {
      if (v464) {
        [v465 localizedStringForKey:@"Cancel reorder column" value:&stru_26C10E100 table:0];
      }
      else {
      v469 = [v465 localizedStringForKey:@"Cancel reorder row" value:&stru_26C10E100 table:0];
      }
      v468 = v466;
    }
    else
    {
      if (v464) {
        v467 = @"Column %lu";
      }
      else {
        v467 = @"Row %lu";
      }
      v468 = [v465 localizedStringForKey:v467 value:&stru_26C10E100 table:0];

      v469 = objc_msgSend(NSString, "localizedStringWithFormat:", v468, objc_msgSend(*v1, "currentDragIndex") + 1);
    }

    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v469);
  }
  objc_msgSend(*v1, "setLastDraggedOverColumnOrRowIndex:", objc_msgSend(*v1, "currentDragIndex"));
  uint64_t v168 = (uint64_t)recta;
LABEL_250:
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 textViewManager];
  id v18 = [v5 textViewForColumn:v4];

  double v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  [v18 frame];
  double v8 = v7;
  [v18 frame];
  double v10 = v9;
  [v18 frame];
  objc_msgSend(v18, "setFrame:", v6, v8, v10);
  double v11 = [*(id *)(a1 + 32) tableContentView];
  double v12 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v11 setVerticalLinePosition:v12 forKey:v4];

  double v13 = [*(id *)(a1 + 32) textViewManager];
  double v14 = [v13 columnIDs];
  uint64_t v15 = [v14 indexOfObject:v4];

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v16 = [*(id *)(a1 + 32) textViewManager];
    objc_msgSend(v16, "moveColumnAtIndex:toIndex:", v15, v15 - objc_msgSend(*(id *)(a1 + 40), "count"));
  }
  [v18 frame];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 textViewManager];
  id v19 = [v5 textViewForColumn:v4];

  [v19 frame];
  double v7 = v6;
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v6;
  [v19 frame];
  double v10 = v9;
  [v19 frame];
  double v12 = v11;
  [v19 frame];
  objc_msgSend(v19, "setFrame:", v8, v10, v12);
  double v13 = [*(id *)(a1 + 32) tableContentView];
  double v14 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v7];
  [v13 setVerticalLinePosition:v14 forKey:v4];

  uint64_t v15 = [*(id *)(a1 + 32) textViewManager];
  double v16 = [v15 columnIDs];
  uint64_t v17 = [v16 indexOfObject:v4];

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = [*(id *)(a1 + 32) textViewManager];
    objc_msgSend(v18, "moveColumnAtIndex:toIndex:", v17, objc_msgSend(*(id *)(a1 + 40), "count") + v17);
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              - v7;
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  CGRect v9 = CGRectOffset(v8, *(CGFloat *)(a1 + 40), 0.0);
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  objc_msgSend(*(id *)(a1 + 32), "ic_animator");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", x, y, width, height);
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_5(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        [a1[5] setHidden:0 forColumn:*(void *)(*((void *)&v18 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  [a1[6] removeFromSuperview];
  double v7 = [a1[5] tableSelection];
  int v8 = [v7 moving];

  if (v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = a1[7];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(a1[5], "setHidden:forColumn:", 1, *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_6(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) tableLayoutManager];
  [v3 setYPosition:v12 forRow:1 shouldInvalidate:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

  uint64_t v4 = [*(id *)(a1 + 32) tableContentView];
  uint64_t v5 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v4 setHorizontalLinePosition:v5 forKey:v12];

  uint64_t v6 = [*(id *)(a1 + 32) textViewManager];
  double v7 = [v6 rowIDs];
  uint64_t v8 = [v7 indexOfObject:v12];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [*(id *)(a1 + 32) textViewManager];
    objc_msgSend(v9, "moveRowAtIndex:toIndex:", v8, v8 - objc_msgSend(*(id *)(a1 + 40), "count"));
  }
  uint64_t v10 = [*(id *)(a1 + 32) rowHeightCache];
  [v10 dimensionForKey:v12];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
}

double __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 rowHeightCache];
  [v5 dimensionForKey:v4];
  double v7 = v6;

  uint64_t v8 = [*(id *)(a1 + 32) tableLayoutManager];
  [v8 setYPosition:v4 forRow:1 shouldInvalidate:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v7];

  id v9 = [*(id *)(a1 + 32) tableContentView];
  uint64_t v10 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - v7];
  [v9 setHorizontalLinePosition:v10 forKey:v4];

  double v11 = [*(id *)(a1 + 32) textViewManager];
  id v12 = [v11 rowIDs];
  uint64_t v13 = [v12 indexOfObject:v4];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v14 = [*(id *)(a1 + 32) textViewManager];
    objc_msgSend(v14, "moveRowAtIndex:toIndex:", v13, objc_msgSend(*(id *)(a1 + 40), "count") + v13);
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = *(double *)(v15 + 24) - v7;
  *(double *)(v15 + 24) = result;
  return result;
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  CGRect v9 = CGRectOffset(v8, 0.0, *(CGFloat *)(a1 + 40));
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  objc_msgSend(*(id *)(a1 + 32), "ic_animator");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", x, y, width, height);
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_9(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        [a1[5] setHidden:0 forRow:*(void *)(*((void *)&v18 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  [a1[6] removeFromSuperview];
  double v7 = [a1[5] tableSelection];
  int v8 = [v7 moving];

  if (v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = a1[7];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(a1[5], "setHidden:forRow:", 1, *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)dragEndedOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4
{
  uint64_t v6 = [(ICTableAttachmentViewController *)self draggingAppearance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__ICTableAttachmentViewController_dragEndedOnColumnOrRow_atLocation___block_invoke;
  v7[3] = &unk_2640B9320;
  v7[4] = self;
  BOOL v8 = a3;
  [v6 performAsDefaultAppearance:v7];

  [(ICTableAttachmentViewController *)self setDraggingAppearance:0];
}

uint64_t __69__ICTableAttachmentViewController_dragEndedOnColumnOrRow_atLocation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [v1 currentDragIndex];

  return [v1 moveCurrentColumnOrRow:v2 toIndex:v3];
}

- (void)moveCurrentColumnOrRow:(BOOL)a3 toIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v137 = *MEMORY[0x263EF8340];
  double v7 = [(ICTableAttachmentViewController *)self table];
  if (v5)
  {
    BOOL v8 = [(ICTableAttachmentViewController *)self columnButton];
    id v9 = [v8 columnOrRowIdentifiers];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v7 columnIndexForIdentifier:v10];
  }
  else
  {
    BOOL v8 = [(ICTableAttachmentViewController *)self rowButton];
    id v9 = [v8 columnOrRowIdentifiers];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v7 rowIndexForIdentifier:v10];
  }
  unint64_t v115 = v11;

  uint64_t v12 = [(ICTableAttachmentViewController *)self textViewManager];
  [v12 setDraggedColumns:0];

  uint64_t v13 = [(ICTableAttachmentViewController *)self textViewManager];
  [v13 setDraggedRows:0];

  if (a4 == 0x7FFFFFFFFFFFFFFFLL || v115 == a4)
  {
    long long v19 = [(ICTableAttachmentViewController *)self textViewManager];
    [(ICTableAttachmentViewController *)self viewport];
    objc_msgSend(v19, "redrawAllWithViewport:");

    if (v5) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = 2 * (v115 < a4);
    if (v5)
    {
      long long v15 = [(ICTableAttachmentViewController *)self columnButton];
      long long v16 = [v15 columnOrRowIdentifiers];
      v133[0] = MEMORY[0x263EF8330];
      v133[1] = 3221225472;
      v133[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke;
      v133[3] = &unk_2640BA290;
      v133[4] = self;
      v133[5] = a4;
      v133[6] = v115;
      [v16 enumerateObjectsWithOptions:v14 usingBlock:v133];

      [(ICTableAttachmentViewController *)self redrawAndSave];
      long long v17 = [(ICTableAttachmentViewController *)self columnButton];
      long long v18 = [v17 columnOrRowIdentifiers];
      [(ICTableAttachmentViewController *)self postChangeNotification:5 columnOrRowUUIDs:v18];

LABEL_9:
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v20 = [(ICTableAttachmentViewController *)self columnButton];
      long long v21 = [v20 columnOrRowIdentifiers];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v128 objects:v136 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v129;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v129 != v24) {
              objc_enumerationMutation(v21);
            }
            [(ICTableAttachmentViewController *)self setHidden:1 forColumn:*(void *)(*((void *)&v128 + 1) + 8 * i)];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v128 objects:v136 count:16];
        }
        while (v23);
      }

      double v26 = [(ICTableAttachmentViewController *)self textViewManager];
      double v27 = [(ICTableAttachmentViewController *)self columnButton];
      double v28 = [v27 columnOrRowIdentifiers];
      double v29 = [v28 firstObject];
      [v26 frameOfColumn:v29];
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;

      double v38 = [(ICTableAttachmentViewController *)self textViewManager];
      double v39 = [(ICTableAttachmentViewController *)self columnButton];
      double v40 = [v39 columnOrRowIdentifiers];
      CGRect v41 = [v40 lastObject];
      [v38 frameOfColumn:v41];
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;

      v138.origin.CGFloat x = v31;
      v138.origin.CGFloat y = v33;
      v138.size.CGFloat width = v35;
      v138.size.CGFloat height = v37;
      v142.origin.CGFloat x = v43;
      v142.origin.CGFloat y = v45;
      v142.size.CGFloat width = v47;
      v142.size.CGFloat height = v49;
      CGRect v139 = CGRectUnion(v138, v142);
      CGFloat x = v139.origin.x;
      CGFloat y = v139.origin.y;
      CGFloat width = v139.size.width;
      CGFloat height = v139.size.height;
      goto LABEL_36;
    }
    double v54 = [(ICTableAttachmentViewController *)self rowButton];
    double v55 = [v54 columnOrRowIdentifiers];
    v132[0] = MEMORY[0x263EF8330];
    v132[1] = 3221225472;
    v132[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_2;
    v132[3] = &unk_2640BA290;
    v132[4] = self;
    v132[5] = a4;
    v132[6] = v115;
    [v55 enumerateObjectsWithOptions:v14 usingBlock:v132];

    [(ICTableAttachmentViewController *)self redrawAndSave];
    double v56 = [(ICTableAttachmentViewController *)self rowButton];
    double v57 = [v56 columnOrRowIdentifiers];
    [(ICTableAttachmentViewController *)self postChangeNotification:6 columnOrRowUUIDs:v57];
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  double v58 = [(ICTableAttachmentViewController *)self rowButton];
  double v59 = [v58 columnOrRowIdentifiers];

  uint64_t v60 = [v59 countByEnumeratingWithState:&v124 objects:v135 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v125;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v125 != v62) {
          objc_enumerationMutation(v59);
        }
        [(ICTableAttachmentViewController *)self setHidden:1 forColumn:*(void *)(*((void *)&v124 + 1) + 8 * j)];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v124 objects:v135 count:16];
    }
    while (v61);
  }

  double v64 = [(ICTableAttachmentViewController *)self textViewManager];
  double v65 = [(ICTableAttachmentViewController *)self rowButton];
  double v66 = [v65 columnOrRowIdentifiers];
  double v67 = [v66 firstObject];
  [v64 frameOfRow:v67];
  CGFloat v69 = v68;
  CGFloat v71 = v70;
  CGFloat v73 = v72;
  CGFloat v75 = v74;

  double v76 = [(ICTableAttachmentViewController *)self textViewManager];
  double v77 = [(ICTableAttachmentViewController *)self rowButton];
  CGFloat v78 = [v77 columnOrRowIdentifiers];
  double v79 = [v78 lastObject];
  [v76 frameOfRow:v79];
  CGFloat v81 = v80;
  CGFloat v83 = v82;
  CGFloat v85 = v84;
  CGFloat v87 = v86;

  v140.origin.CGFloat x = v69;
  v140.origin.CGFloat y = v71;
  v140.size.CGFloat width = v73;
  v140.size.CGFloat height = v75;
  v143.origin.CGFloat x = v81;
  v143.origin.CGFloat y = v83;
  v143.size.CGFloat width = v85;
  v143.size.CGFloat height = v87;
  CGRect v141 = CGRectUnion(v140, v143);
  CGFloat x = v141.origin.x;
  CGFloat y = v141.origin.y;
  CGFloat width = v141.size.width;
  CGFloat height = v141.size.height;
  CGFloat v88 = [(ICTableAttachmentViewController *)self rowButton];
  double v89 = [v88 columnOrRowIdentifiers];
  unint64_t v90 = [v89 count] + v115;
  double v91 = [(ICTableAttachmentViewController *)self table];
  unint64_t v92 = [v91 rowCount];

  if (v90 < v92)
  {
    BOOL v112 = v5;
    unint64_t v113 = a4;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    double v93 = [(ICTableAttachmentViewController *)self textViewManager];
    CGFloat v94 = [v93 columnIDs];

    obuint64_t j = v94;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v120 objects:v134 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v121;
      do
      {
        for (uint64_t k = 0; k != v96; ++k)
        {
          if (*(void *)v121 != v97) {
            objc_enumerationMutation(obj);
          }
          uint64_t v99 = *(void *)(*((void *)&v120 + 1) + 8 * k);
          CGFloat v100 = [(ICTableAttachmentViewController *)self textViewManager];
          double v101 = [v100 textViewForColumn:v99];

          objc_opt_class();
          double v102 = [v101 textStorage];
          uint64_t v103 = ICDynamicCast();

          uint64_t v104 = [(ICTableAttachmentViewController *)self table];
          double v105 = [(ICTableAttachmentViewController *)self rowButton];
          double v106 = [v105 columnOrRowIdentifiers];
          CGFloat v107 = objc_msgSend(v104, "identifierForRowAtIndex:", objc_msgSend(v106, "count") + v115);

          uint64_t v108 = [v103 characterRangeForRowID:v107];
          if (v108 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v109 = v108;
            double v110 = [v101 layoutManager];
            objc_msgSend(v110, "invalidateLayoutForCharacterRange:actualCharacterRange:", v109, 1, 0);
          }
        }
        uint64_t v96 = [obj countByEnumeratingWithState:&v120 objects:v134 count:16];
      }
      while (v96);
    }

    a4 = v113;
    LOBYTE(v5) = v112;
  }
LABEL_36:
  CGFloat v111 = [(ICTableAttachmentViewController *)self tableAutoScroller];
  [v111 stopAndInvalidate];

  [(ICTableAttachmentViewController *)self setTableAutoScroller:0];
  v118[0] = MEMORY[0x263EF8330];
  v118[1] = 3221225472;
  v118[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_3;
  v118[3] = &unk_2640BA2B8;
  v118[4] = self;
  *(CGFloat *)&v118[5] = x;
  *(CGFloat *)&v118[6] = y;
  *(CGFloat *)&v118[7] = width;
  *(CGFloat *)&v118[8] = height;
  BOOL v119 = v5;
  v116[0] = MEMORY[0x263EF8330];
  v116[1] = 3221225472;
  v116[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_4;
  v116[3] = &unk_2640BA240;
  BOOL v117 = v5;
  v116[4] = self;
  v116[5] = v115;
  v116[6] = a4;
  objc_msgSend(MEMORY[0x263F82E00], "ic_animateWithDuration:animations:completion:", v118, v116, 0.2);
  [(ICTableAttachmentViewController *)self setLastDraggedOverColumnOrRowIndex:0x7FFFFFFFFFFFFFFFLL];
}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 table];
  uint64_t v8 = [v7 columnIndexForIdentifier:v6];

  unint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = v9 + a3;
  if (v9 > *(void *)(a1 + 48))
  {
    uint64_t v11 = [*(id *)(a1 + 32) columnButton];
    uint64_t v12 = [v11 columnOrRowIdentifiers];
    uint64_t v10 = v10 - [v12 count] + 1;
  }
  id v13 = [*(id *)(a1 + 32) table];
  [v13 moveColumnAtIndex:v8 toIndex:(unint64_t)(double)(unint64_t)v10];
}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  BOOL v5 = [*(id *)(a1 + 32) table];
  uint64_t v6 = [v5 rowIndexForIdentifier:v13];

  unint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = v7 + a3;
  if (v7 > *(void *)(a1 + 48))
  {
    unint64_t v9 = [*(id *)(a1 + 32) rowButton];
    uint64_t v10 = [v9 columnOrRowIdentifiers];
    uint64_t v8 = v8 - [v10 count] + 1;
  }
  uint64_t v11 = [*(id *)(a1 + 32) table];
  [v11 moveRowAtIndex:v6 toIndex:(unint64_t)(double)(unint64_t)v8];

  uint64_t v12 = [*(id *)(a1 + 32) tableLayoutManager];
  [v12 updateForMovedRow:v13];
}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dragView];
  uint64_t v3 = [v2 superview];
  uint64_t v4 = [*(id *)(a1 + 32) tableContentView];
  objc_msgSend(v3, "convertRect:fromView:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [*(id *)(a1 + 32) dragView];
  uint64_t v14 = objc_msgSend(v13, "ic_animator");
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  long long v15 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72))
  {
    long long v16 = [v15 columnButton];
    long long v17 = [v16 superview];
    long long v18 = [*(id *)(a1 + 32) tableContentView];
    objc_msgSend(v17, "convertRect:fromView:", v18, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    double MidX = CGRectGetMidX(v45);

    long long v20 = [*(id *)(a1 + 32) columnButton];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;

    id v43 = [*(id *)(a1 + 32) columnButton];
    [v43 frame];
    double v26 = v25 + 5.0;
    double v27 = [*(id *)(a1 + 32) columnButton];
    double v28 = objc_msgSend(v27, "ic_animator");
    objc_msgSend(v28, "setFrame:", MidX + v22 * -0.5, v26, v22, v24);
  }
  else
  {
    double v29 = [v15 rowButton];
    double v30 = [v29 superview];
    CGFloat v31 = [*(id *)(a1 + 32) tableContentView];
    objc_msgSend(v30, "convertRect:fromView:", v31, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    double MidY = CGRectGetMidY(v46);

    CGFloat v33 = [*(id *)(a1 + 32) rowButton];
    [v33 frame];
    double v35 = v34;
    double v37 = v36;

    double v38 = [*(id *)(a1 + 32) rowButton];
    [v38 frame];
    double v40 = v39 + 5.0;
    CGRect v41 = [*(id *)(a1 + 32) rowButton];
    double v42 = objc_msgSend(v41, "ic_animator");
    objc_msgSend(v42, "setFrame:", v40, MidY + v37 * -0.5, v35, v37);

    id v43 = [*(id *)(a1 + 32) rowButton];
    double v27 = objc_msgSend(v43, "ic_animator");
    objc_msgSend(v27, "ic_setAlpha:", 1.0);
  }
}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_4(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) tableSelection];
  [v2 setMoving:0];

  uint64_t v3 = [*(id *)(a1 + 32) dragView];
  [v3 removeFromSuperview];

  [*(id *)(a1 + 32) setDragView:0];
  uint64_t v4 = [*(id *)(a1 + 32) selectionHighlightView];
  objc_msgSend(v4, "ic_setAlpha:", 1.0);

  [*(id *)(a1 + 32) updateChrome];
  double v5 = [*(id *)(a1 + 32) headerClipView];
  double v6 = [v5 layer];
  [v6 setMasksToBounds:1];

  if (*(unsigned char *)(a1 + 56))
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    double v7 = [*(id *)(a1 + 32) columnButton];
    double v8 = [v7 columnOrRowIdentifiers];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) setHidden:0 forColumn:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v10);
    }
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v13 = [*(id *)(a1 + 32) rowButton];
    double v8 = [v13 columnOrRowIdentifiers];

    uint64_t v14 = [v8 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) setHidden:0 forRow:*(void *)(*((void *)&v46 + 1) + 8 * j)];
        }
        uint64_t v15 = [v8 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v15);
    }
  }

  long long v18 = [*(id *)(a1 + 32) currentlyEditingTextView];

  if (v18)
  {
    long long v19 = [*(id *)(a1 + 32) columnButton];
    long long v20 = [v19 columnOrRowIdentifiers];
    double v21 = [v20 firstObject];

    double v22 = [*(id *)(a1 + 32) rowButton];
    double v23 = [v22 columnOrRowIdentifiers];
    double v24 = [v23 firstObject];

    [*(id *)(a1 + 32) beginEditingCellWithColumnID:v21 andRowID:v24 location:2];
    double v25 = *(void **)(a1 + 32);
    double v55 = v21;
    double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    double v54 = v24;
    double v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
    [v25 showButtonsAtColumns:v26 rows:v27];

    double v28 = [*(id *)(a1 + 32) currentlyEditingTextStorage];
    double v29 = [*(id *)(a1 + 32) stringSelectionBeforeDrag];
    [v28 restoreSelection:v29];
  }
  double v30 = [*(id *)(a1 + 32) currentlyEditingTextView];
  [v30 setTextSelectionHidden:0];

  uint64_t v31 = *(void *)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 48);
  int v33 = *(unsigned __int8 *)(a1 + 56);
  double v34 = [MEMORY[0x263F086E0] mainBundle];
  double v35 = v34;
  if (v31 == v32)
  {
    if (v33) {
      double v36 = @"Canceled reordering column";
    }
    else {
      double v36 = @"Canceled reordering row";
    }
    double v39 = [v34 localizedStringForKey:v36 value:&stru_26C10E100 table:0];
  }
  else
  {
    if (v33) {
      double v37 = @"Moved column %lu to position %lu";
    }
    else {
      double v37 = @"Moved row %lu to position %lu";
    }
    uint64_t v38 = [v34 localizedStringForKey:v37 value:&stru_26C10E100 table:0];

    double v39 = objc_msgSend(NSString, "localizedStringWithFormat:", v38, *(void *)(a1 + 40) + 1, *(void *)(a1 + 48) + 1);
    double v35 = (void *)v38;
  }

  double v40 = [*(id *)(a1 + 32) feedbackGenerator];
  [v40 draggedObjectLanded];

  CGRect v41 = [*(id *)(a1 + 32) feedbackGenerator];
  [v41 userInteractionEnded];

  [*(id *)(a1 + 32) setFeedbackGenerator:0];
  UIAccessibilityNotifications v42 = *MEMORY[0x263F831C0];
  id v43 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    [v43 columnButton];
  }
  else {
  double v44 = [v43 rowButton];
  }
  UIAccessibilityPostNotification(v42, v44);

  id v45 = v39;
  dispatchMainAfterDelay();
}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_5(uint64_t a1)
{
}

- (void)setHidden:(BOOL)a3 forColumn:(id)a4
{
  unsigned int v4 = a3;
  id v27 = a4;
  double v6 = [(ICTableAttachmentViewController *)self textViewManager];
  double v7 = [v6 textViewForColumn:v27];

  v4 ^= 1u;
  objc_msgSend(v7, "ic_setAlpha:", (double)v4);
  if (v4)
  {
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    double v8 = [(ICTableAttachmentViewController *)self textViewManager];
    [v8 frameOfColumn:v27];
    double x = v9;
    double y = v11;
    double width = v13;
    double height = v15;

    long long v17 = [(ICTableAttachmentViewController *)self tableContentView];
    [v17 exclusionRect];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v29.origin.double x = v19;
    v29.origin.double y = v21;
    v29.size.double width = v23;
    v29.size.double height = v25;
    if (!CGRectIsEmpty(v29))
    {
      v30.origin.double x = v19;
      v30.origin.double y = v21;
      v30.size.double width = v23;
      v30.size.double height = v25;
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      CGRect v31 = CGRectUnion(v30, v32);
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;
    }
  }
  double v26 = [(ICTableAttachmentViewController *)self tableContentView];
  objc_msgSend(v26, "setExclusionRect:", x, y, width, height);
}

- (void)setHidden:(BOOL)a3 forRow:(id)a4
{
  BOOL v4 = a3;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v4)
  {
    long long v55 = 0uLL;
    long long v56 = 0uLL;
    long long v53 = 0uLL;
    long long v54 = 0uLL;
    double v7 = [(ICTableAttachmentViewController *)self textViewManager];
    double v8 = [v7 columnIDs];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v14 = [(ICTableAttachmentViewController *)self tableLayoutManager];
          double v15 = [v14 columnLayoutManagerForColumn:v13];

          uint64_t v16 = [v15 hiddenRows];
          long long v17 = (void *)[v16 mutableCopy];
          double v18 = v17;
          if (v17)
          {
            id v19 = v17;
          }
          else
          {
            id v19 = [MEMORY[0x263EFF980] array];
          }
          double v20 = v19;

          [v20 addObject:v6];
          [v15 setHiddenRows:v20];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v10);
    }

    CGFloat v21 = [(ICTableAttachmentViewController *)self textViewManager];
    [v21 frameOfRow:v6];
    double x = v22;
    double y = v24;
    double width = v26;
    double height = v28;

    CGRect v30 = [(ICTableAttachmentViewController *)self tableContentView];
    [v30 exclusionRect];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v60.origin.double x = v32;
    v60.origin.double y = v34;
    v60.size.double width = v36;
    v60.size.double height = v38;
    if (!CGRectIsEmpty(v60))
    {
      v61.origin.double x = v32;
      v61.origin.double y = v34;
      v61.size.double width = v36;
      v61.size.double height = v38;
      v63.origin.double x = x;
      v63.origin.double y = y;
      v63.size.double width = width;
      v63.size.double height = height;
      CGRect v62 = CGRectUnion(v61, v63);
      double x = v62.origin.x;
      double y = v62.origin.y;
      double width = v62.size.width;
      double height = v62.size.height;
    }
  }
  else
  {
    long long v51 = 0uLL;
    long long v52 = 0uLL;
    *((void *)&v49 + 1) = 0;
    long long v50 = 0uLL;
    double v39 = [(ICTableAttachmentViewController *)self textViewManager];
    double v40 = [v39 columnIDs];

    uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v50 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          long long v46 = [(ICTableAttachmentViewController *)self tableLayoutManager];
          long long v47 = [v46 columnLayoutManagerForColumn:v45];

          [v47 setHiddenRows:0];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v42);
    }

    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  long long v48 = [(ICTableAttachmentViewController *)self tableContentView];
  objc_msgSend(v48, "setExclusionRect:", x, y, width, height);
}

- (void)tableAutoScroller:(id)a3 scrollOffsetDelta:(CGPoint)a4
{
  double y = a4.y;
  uint64_t v6 = objc_msgSend(a3, "scrollDirectionMode", a4.x);
  [(ICTableAttachmentViewController *)self currentDragGestureLocation];
  if (v6 == 1)
  {
    double v9 = v7;
  }
  else
  {
    [(ICTableAttachmentViewController *)self currentDragGestureLocation];
    double v9 = v10;
    [(ICTableAttachmentViewController *)self currentDragGestureLocation];
    double v8 = y + v11;
  }

  -[ICTableAttachmentViewController dragMovedOnColumnOrRow:atLocation:](self, "dragMovedOnColumnOrRow:atLocation:", v6 == 1, v9, v8);
}

- (void)textRangeDraggedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v34[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [(ICTableAttachmentViewController *)self columnButton];
  double v7 = [v6 columnOrRowIdentifiers];
  double v8 = [v7 firstObject];

  double v9 = [(ICTableAttachmentViewController *)self rowButton];
  double v10 = [v9 columnOrRowIdentifiers];
  double v11 = [v10 firstObject];

  double v12 = [(ICTableAttachmentViewController *)self textViewManager];
  [v12 frameOfCellAtColumn:v8 row:v11];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  CGFloat v21 = [(ICTableAttachmentViewController *)self tableSelection];
  [v21 setDraggingText:1];

  double v22 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v23 = [v22 type];

  if (v23 == 1)
  {
    v37.origin.double x = v14;
    v37.origin.double y = v16;
    v37.size.double width = v18;
    v37.size.double height = v20;
    CGRect v38 = CGRectInset(v37, -*MEMORY[0x263F5B178], -*MEMORY[0x263F5B178]);
    v35.double x = x;
    v35.double y = y;
    if (!CGRectContainsPoint(v38, v35))
    {
      double v24 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
      [v24 setTextSelectionHidden:1];

      id v25 = v11;
      id v26 = v8;
      id v27 = [(ICTableAttachmentViewController *)self tableSelection];
      v34[0] = v26;
      double v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
      id v33 = v25;
      CGRect v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      [v27 selectCellRangeAtColumns:v28 rows:v29];

      [(ICTableAttachmentViewController *)self setRangeSelectionAnchorColumn:v26];
      [(ICTableAttachmentViewController *)self setRangeSelectionAnchorRow:v25];
LABEL_7:

      [(ICTableAttachmentViewController *)self updateChrome];
    }
  }
  else
  {
    CGRect v30 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v31 = [v30 type];

    if (v31 == 4)
    {
      v39.origin.double x = v14;
      v39.origin.double y = v16;
      v39.size.double width = v18;
      v39.size.double height = v20;
      v36.double x = x;
      v36.double y = y;
      if (!CGRectContainsPoint(v39, v36))
      {
        -[ICTableAttachmentViewController cellRangeDraggedAtLocation:](self, "cellRangeDraggedAtLocation:", x, y);
        goto LABEL_9;
      }
      CGFloat v32 = [(ICTableAttachmentViewController *)self tableSelection];
      [v32 selectCellAtColumn:v8 row:v11];

      id v25 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
      [v25 setTextSelectionHidden:0];
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)textRangeDragEnded
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  [v3 setTextSelectionHidden:0];

  BOOL v4 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v5 = [v4 type];

  if (v5 == 4)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self tableSelection];
    double v7 = [v6 columns];

    double v8 = [(ICTableAttachmentViewController *)self tableSelection];
    double v9 = [v8 rows];

    double v10 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v10 removeFromSuperview];

    double v11 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    [(ICTableAttachmentViewController *)self endCellEditingSessionWithTextView:v11];

    double v12 = [(ICTableAttachmentViewController *)self tableSelection];
    [v12 selectCellRangeAtColumns:v7 rows:v9];

    [(ICTableAttachmentViewController *)self updateChrome];
    double v13 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [(ICTableAttachmentViewController *)self ic_makeFirstResponder:v13];
  }
  id v14 = [(ICTableAttachmentViewController *)self tableSelection];
  [v14 setDraggingText:0];
}

- (void)cellRangeDragBeganOnView:(id)a3
{
  id v37 = a3;
  id v4 = [(ICTableAttachmentViewController *)self startKnob];
  if (v4 == v37)
  {
  }
  else
  {
    id v5 = [(ICTableAttachmentViewController *)self endKnob];

    uint64_t v6 = v37;
    if (v5 != v37) {
      goto LABEL_26;
    }
  }
  double v7 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v8 = [v7 type];

  if (v8 == 4)
  {
    id v9 = [(ICTableAttachmentViewController *)self startKnob];

    if (v9 == v37)
    {
      uint64_t v31 = [(ICTableAttachmentViewController *)self tableSelection];
      CGFloat v32 = [v31 columns];
      id v33 = [v32 lastObject];
      [(ICTableAttachmentViewController *)self setRangeSelectionAnchorColumn:v33];

      id v14 = [(ICTableAttachmentViewController *)self tableSelection];
      double v15 = [v14 rows];
      uint64_t v16 = [v15 lastObject];
    }
    else
    {
      id v10 = [(ICTableAttachmentViewController *)self endKnob];

      uint64_t v6 = v37;
      if (v10 != v37) {
        goto LABEL_26;
      }
      double v11 = [(ICTableAttachmentViewController *)self tableSelection];
      double v12 = [v11 columns];
      double v13 = [v12 firstObject];
      [(ICTableAttachmentViewController *)self setRangeSelectionAnchorColumn:v13];

      id v14 = [(ICTableAttachmentViewController *)self tableSelection];
      double v15 = [v14 rows];
      uint64_t v16 = [v15 firstObject];
    }
    CGFloat v34 = (void *)v16;
    [(ICTableAttachmentViewController *)self setRangeSelectionAnchorRow:v16];

    goto LABEL_25;
  }
  double v17 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v18 = [v17 type];

  if (v18 != 2)
  {
    double v24 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v25 = [v24 type];

    uint64_t v6 = v37;
    if (v25 != 3) {
      goto LABEL_26;
    }
    id v26 = [(ICTableAttachmentViewController *)self startKnob];

    if (v26 == v37)
    {
      double v28 = [(ICTableAttachmentViewController *)self tableSelection];
      CGRect v29 = [v28 rows];
      uint64_t v30 = [v29 lastObject];
    }
    else
    {
      id v27 = [(ICTableAttachmentViewController *)self endKnob];

      if (v27 != v37)
      {
LABEL_24:
        [(ICTableAttachmentViewController *)self setRangeSelectionAnchorColumn:0];
        goto LABEL_25;
      }
      double v28 = [(ICTableAttachmentViewController *)self tableSelection];
      CGRect v29 = [v28 rows];
      uint64_t v30 = [v29 firstObject];
    }
    CGPoint v36 = (void *)v30;
    [(ICTableAttachmentViewController *)self setRangeSelectionAnchorRow:v30];

    goto LABEL_24;
  }
  id v19 = [(ICTableAttachmentViewController *)self startKnob];

  if (v19 == v37)
  {
    CGFloat v21 = [(ICTableAttachmentViewController *)self tableSelection];
    double v22 = [v21 columns];
    uint64_t v23 = [v22 lastObject];
    goto LABEL_20;
  }
  id v20 = [(ICTableAttachmentViewController *)self endKnob];

  if (v20 == v37)
  {
    CGFloat v21 = [(ICTableAttachmentViewController *)self tableSelection];
    double v22 = [v21 columns];
    uint64_t v23 = [v22 firstObject];
LABEL_20:
    CGPoint v35 = (void *)v23;
    [(ICTableAttachmentViewController *)self setRangeSelectionAnchorColumn:v23];
  }
  [(ICTableAttachmentViewController *)self setRangeSelectionAnchorRow:0];
LABEL_25:
  uint64_t v6 = v37;
LABEL_26:
}

- (void)cellRangeDraggedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double v5 = fmax(a3.x, 0.0);
  uint64_t v6 = [(ICTableAttachmentViewController *)self tableContentView];
  [v6 bounds];
  double v8 = v7 + -1.0;

  if (v5 >= v8) {
    double v5 = v8;
  }
  double v9 = fmax(y, 0.0);
  id v10 = [(ICTableAttachmentViewController *)self tableContentView];
  [v10 bounds];
  double v12 = v11 + -1.0;

  if (v9 >= v12) {
    double v9 = v12;
  }
  double v13 = [(ICTableAttachmentViewController *)self textViewManager];
  id v46 = 0;
  id v47 = 0;
  int v14 = objc_msgSend(v13, "cellContainingPoint:columnID:rowID:", &v47, &v46, v5, v9);
  id v15 = v47;
  id v16 = v46;

  double v17 = [(ICTableAttachmentViewController *)self table];
  if (v14)
  {
    uint64_t v18 = [(ICTableAttachmentViewController *)self rangeSelectionAnchorColumn];
    if (v18)
    {
      id v19 = [(ICTableAttachmentViewController *)self rangeSelectionAnchorColumn];
      unint64_t v20 = [v17 columnIndexForIdentifier:v19];
    }
    else
    {
      unint64_t v20 = 0;
    }

    CGFloat v21 = [(ICTableAttachmentViewController *)self rangeSelectionAnchorRow];
    if (v21)
    {
      double v22 = [(ICTableAttachmentViewController *)self rangeSelectionAnchorRow];
      unint64_t v23 = [v17 rowIndexForIdentifier:v22];
    }
    else
    {
      unint64_t v23 = 0;
    }

    unint64_t v24 = [v17 columnIndexForIdentifier:v15];
    unint64_t v25 = [v17 rowIndexForIdentifier:v16];
    id v26 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v27 = [v26 type];

    if (v27 == 4)
    {
      id v45 = v15;
      double v28 = [MEMORY[0x263EFF980] array];
      CGRect v29 = [MEMORY[0x263EFF980] array];
      if (v20 >= v24) {
        unint64_t v30 = v24;
      }
      else {
        unint64_t v30 = v20;
      }
      if (v20 > v24) {
        unint64_t v24 = v20;
      }
      do
      {
        uint64_t v31 = [v17 identifierForColumnAtIndex:v30];
        [v28 addObject:v31];

        ++v30;
      }
      while (v30 <= v24);
      if (v23 >= v25) {
        unint64_t v32 = v25;
      }
      else {
        unint64_t v32 = v23;
      }
      if (v23 <= v25) {
        unint64_t v33 = v25;
      }
      else {
        unint64_t v33 = v23;
      }
      do
      {
        CGFloat v34 = [v17 identifierForRowAtIndex:v32];
        [v29 addObject:v34];

        ++v32;
      }
      while (v32 <= v33);
      CGPoint v35 = [(ICTableAttachmentViewController *)self tableSelection];
      [v35 selectCellRangeAtColumns:v28 rows:v29];

      [(ICTableAttachmentViewController *)self announceCellRangeSelectionChangeForAccessibilityIfNecessary];
      goto LABEL_44;
    }
    CGPoint v36 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v37 = [v36 type];

    if (v37 == 2)
    {
      id v45 = v15;
      double v28 = [MEMORY[0x263EFF980] array];
      if (v20 >= v24) {
        unint64_t v38 = v24;
      }
      else {
        unint64_t v38 = v20;
      }
      if (v20 <= v24) {
        unint64_t v20 = v24;
      }
      do
      {
        CGRect v39 = [v17 identifierForColumnAtIndex:v38];
        [v28 addObject:v39];

        ++v38;
      }
      while (v38 <= v20);
      CGRect v29 = [(ICTableAttachmentViewController *)self tableSelection];
      [v29 selectColumns:v28];
      goto LABEL_44;
    }
    double v40 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v41 = [v40 type];

    if (v41 == 3)
    {
      id v45 = v15;
      double v28 = [MEMORY[0x263EFF980] array];
      if (v23 >= v25) {
        unint64_t v42 = v25;
      }
      else {
        unint64_t v42 = v23;
      }
      if (v23 <= v25) {
        unint64_t v43 = v25;
      }
      else {
        unint64_t v43 = v23;
      }
      do
      {
        double v44 = [v17 identifierForRowAtIndex:v42];
        [v28 addObject:v44];

        ++v42;
      }
      while (v42 <= v43);
      CGRect v29 = [(ICTableAttachmentViewController *)self tableSelection];
      [v29 selectRows:v28];
LABEL_44:

      id v15 = v45;
    }
  }
  [(ICTableAttachmentViewController *)self updateChrome];
}

- (id)namedStylesForCurrentSelectionAndBIUS:(unint64_t *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICTableAttachmentViewController *)self table];
  double v22 = [(ICTableAttachmentViewController *)self tableSelection];
  id v20 = objc_alloc_init(MEMORY[0x263F089C8]);
  if ([v22 type]
    || [(ICTableAttachmentViewController *)self containedInNoteSelection])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v4 = [v22 columns];
    double v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v37 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (!v5)
          {
            double v5 = [MEMORY[0x263F089C8] indexSet];
          }
          uint64_t v10 = [v3 columnIndexForIdentifier:v9];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v6);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v11 = [v22 rows];
    double v12 = 0;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          if (!v12)
          {
            double v12 = [MEMORY[0x263F089C8] indexSet];
          }
          uint64_t v17 = [v3 rowIndexForIdentifier:v16];
          if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
            [v12 addIndex:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v13);
    }

    uint64_t v28 = 0;
    CGRect v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    void v23[2] = __73__ICTableAttachmentViewController_namedStylesForCurrentSelectionAndBIUS___block_invoke;
    v23[3] = &unk_2640BA2E0;
    id v24 = v22;
    unint64_t v25 = self;
    id v26 = v20;
    uint64_t v27 = &v28;
    [v3 enumerateCellObjectsInCellSelectionContainingColumnIndices:v5 rowIndices:v12 copyItems:0 usingBlock:v23];
    if (a3) {
      *a3 = v29[3];
    }

    _Block_object_dispose(&v28, 8);
  }

  return v20;
}

uint64_t __73__ICTableAttachmentViewController_namedStylesForCurrentSelectionAndBIUS___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = [a2 attributedString];
  if ([*(id *)(a1 + 32) type] == 1)
  {
    uint64_t v7 = [*(id *)(a1 + 40) currentlyEditingTextView];
    double v8 = [*(id *)(a1 + 40) table];
    uint64_t v9 = [v8 identifierForRowAtIndex:a4];

    objc_opt_class();
    uint64_t v10 = [*(id *)(a1 + 40) currentlyEditingTextStorage];
    ICDynamicCast();
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = [v11 characterRangeForRowID:v9];
    id v13 = [*(id *)(a1 + 40) currentlyEditingTextView];
    unint64_t v14 = [v13 selectedRange] - v12;
    id v15 = [*(id *)(a1 + 40) currentlyEditingTextView];
    [v15 selectedRange];
    uint64_t v17 = v16;
  }
  else
  {
    if (!v6)
    {
      unint64_t v14 = 0;
      uint64_t v17 = 0;
      goto LABEL_8;
    }
    id v18 = objc_alloc(MEMORY[0x263F5B498]);
    id v19 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = (void *)[v18 initWithAttributedString:v6 replicaID:v19];

    id v11 = objc_alloc_init(MEMORY[0x263F81680]);
    id v13 = objc_alloc_init(MEMORY[0x263F81648]);
    [v9 addLayoutManager:v13];
    [v11 replaceLayoutManager:v13];
    id v20 = [ICBaseTextView alloc];
    uint64_t v7 = -[ICBaseTextView initWithFrame:textContainer:](v20, "initWithFrame:textContainer:", v11, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    CGFloat v21 = [(ICBaseTextView *)v7 textStorage];
    -[ICBaseTextView setSelectedRange:](v7, "setSelectedRange:", 0, [v21 length]);

    unint64_t v14 = [(ICBaseTextView *)v7 selectedRange];
    uint64_t v17 = v22;
  }

  if (v7)
  {
    unint64_t v23 = [(ICBaseTextView *)v7 ic_selectedStyles];
    [*(id *)(a1 + 48) addIndexes:v23];
  }
LABEL_8:
  if ([v6 length])
  {
    if (v14 >= [v6 length])
    {
      unint64_t v14 = [v6 length] - 1;
      uint64_t v17 = 1;
    }
    id v24 = objc_msgSend(v6, "attributesAtIndex:longestEffectiveRange:inRange:", v14, 0, v14, v17);
    unint64_t v25 = [v24 objectForKeyedSubscript:*MEMORY[0x263F5AB18]];
    char v26 = [v25 intValue];

    if (v26) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 1uLL;
    }
    if ((v26 & 2) != 0) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 2uLL;
    }
    uint64_t v27 = [v24 objectForKeyedSubscript:*MEMORY[0x263F5AB38]];
    int v28 = [v27 BOOLValue];

    if (v28) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 4uLL;
    }
    CGRect v29 = [v24 objectForKeyedSubscript:*MEMORY[0x263F5AB30]];
    int v30 = [v29 BOOLValue];

    if (v30) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 8uLL;
    }
    uint64_t v31 = [v24 objectForKeyedSubscript:*MEMORY[0x263F5AB10]];
    [v31 intValue];

    if (ICEmphasisColorTypeForTag()) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x10uLL;
    }
  }
  return 0;
}

- (void)setSelectionBIUSStyle:(unint64_t)a3 toggleOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(ICTableAttachmentViewController *)self tableSelection];
  id v10 = [v7 columns];

  double v8 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v9 = [v8 rows];

  [(ICTableAttachmentViewController *)self setSelectionBIUSStyle:a3 toggleOn:v4 withColumns:v10 rows:v9];
}

- (void)setSelectionBIUSStyle:(unint64_t)a3 toggleOn:(BOOL)a4 withColumns:(id)a5 rows:(id)a6
{
  unint64_t v30 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a6;
  long long v32 = self;
  id v10 = [(ICTableAttachmentViewController *)self table];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        if (!v14)
        {
          unint64_t v14 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v14, "addIndex:", objc_msgSend(v10, "columnIndexForIdentifier:", v17, v30));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = 0;
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    CGFloat v21 = 0;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        if (!v21)
        {
          CGFloat v21 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v21, "addIndex:", objc_msgSend(v10, "rowIndexForIdentifier:", v24, v30));
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v20);
  }
  else
  {
    CGFloat v21 = 0;
  }

  unint64_t v25 = [(ICTableAttachmentViewController *)v32 undoTarget];
  char v26 = [(ICTableAttachmentViewController *)v32 undoManager];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke;
  v33[3] = &unk_2640BA330;
  v33[4] = v32;
  v33[5] = v30;
  BOOL v34 = a4;
  [v10 enumerateTextStoragesForColumnIndexes:v14 rowIndexes:v21 undoTarget:v25 undoManager:v26 usingBlock:v33];

  [(ICTableAttachmentViewController *)v32 save];
  uint64_t v27 = [(ICTableAttachmentViewController *)v32 undoManager];
  int v28 = [MEMORY[0x263F086E0] mainBundle];
  CGRect v29 = [v28 localizedStringForKey:@"Styling" value:&stru_26C10E100 table:0];
  [v27 setActionName:v29];
}

void __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) table];
  uint64_t v7 = [v6 identifierForColumnAtIndex:a3];

  objc_opt_class();
  id v8 = [*(id *)(a1 + 32) tableLayoutManager];
  id v9 = [v8 columnLayoutManagerForColumn:v7];
  id v10 = [v9 textStorage];
  id v11 = ICDynamicCast();

  [v11 beginEditing];
  uint64_t v12 = [v5 length];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke_2;
  v15[3] = &unk_2640BA308;
  uint64_t v13 = *(void *)(a1 + 40);
  char v18 = *(unsigned char *)(a1 + 48);
  id v16 = v5;
  uint64_t v17 = v13;
  id v14 = v5;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v15);
  [v11 endEditing];
}

void __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v21 = v7;
  if (v7)
  {
    id v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    uint64_t v13 = (uint64_t *)MEMORY[0x263F5AB18];
    id v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB18]];
    int v15 = [v14 intValue];

    id v16 = NSNumber;
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v17 = v15 | 1u;
    }
    else {
      uint64_t v17 = v15 & 0xFFFFFFFE;
    }
    goto LABEL_18;
  }
  if ((v10 & 2) != 0)
  {
    uint64_t v13 = (uint64_t *)MEMORY[0x263F5AB18];
    char v18 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB18]];
    int v19 = [v18 intValue];

    id v16 = NSNumber;
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v17 = v19 | 2u;
    }
    else {
      uint64_t v17 = v19 & 0xFFFFFFFD;
    }
LABEL_18:
    id v11 = [v16 numberWithUnsignedInt:v17];
    uint64_t v20 = *v13;
LABEL_21:
    [v9 setObject:v11 forKey:v20];

    goto LABEL_22;
  }
  if ((v10 & 4) != 0)
  {
    id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v12 = (uint64_t *)MEMORY[0x263F5AB38];
    goto LABEL_20;
  }
  if ((v10 & 8) != 0)
  {
    id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v12 = (uint64_t *)MEMORY[0x263F5AB30];
    goto LABEL_20;
  }
  if ((v10 & 0x10) == 0) {
    goto LABEL_22;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v11 = [NSNumber numberWithInteger:ic_currentEmphasisColorTypeDefault()];
    uint64_t v12 = (uint64_t *)MEMORY[0x263F5AB10];
LABEL_20:
    uint64_t v20 = *v12;
    goto LABEL_21;
  }
  [v8 removeObjectForKey:*MEMORY[0x263F5AB10]];
  [v9 removeObjectForKey:*MEMORY[0x263F5AB20]];
  [v9 removeObjectForKey:*MEMORY[0x263F5AD90]];
LABEL_22:
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
}

- (void)setSelectionNamedStyle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(ICTableAttachmentViewController *)self tableSelection];
  id v8 = [v5 columns];

  uint64_t v6 = [(ICTableAttachmentViewController *)self tableSelection];
  id v7 = [v6 rows];

  [(ICTableAttachmentViewController *)self setSelectionNamedStyle:v3 withColumns:v8 rows:v7];
}

- (void)setSelectionNamedStyle:(unsigned int)a3 withColumns:(id)a4 rows:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v32 = self;
  id v9 = [(ICTableAttachmentViewController *)self table];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if (!v13)
        {
          uint64_t v13 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v13, "addIndex:", objc_msgSend(v9, "columnIndexForIdentifier:", v16));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        if (!v20)
        {
          uint64_t v20 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v20, "addIndex:", objc_msgSend(v9, "rowIndexForIdentifier:", v23));
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }

  uint64_t v24 = [MEMORY[0x263F5AD10] paragraphStyleNamed:a3];
  unint64_t v25 = [(ICTableAttachmentViewController *)v32 undoTarget];
  char v26 = [(ICTableAttachmentViewController *)v32 undoManager];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke;
  v33[3] = &unk_2640BA380;
  unsigned int v35 = a3;
  v33[4] = v32;
  id v34 = v24;
  id v27 = v24;
  [v9 enumerateTextStoragesForColumnIndexes:v13 rowIndexes:v20 undoTarget:v25 undoManager:v26 usingBlock:v33];

  [(ICTableAttachmentViewController *)v32 save];
  int v28 = [(ICTableAttachmentViewController *)v32 undoManager];
  CGRect v29 = [MEMORY[0x263F086E0] mainBundle];
  unint64_t v30 = [v29 localizedStringForKey:@"Styling" value:&stru_26C10E100 table:0];
  [v28 setActionName:v30];
}

void __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) table];
  id v7 = [v6 identifierForColumnAtIndex:a3];

  objc_opt_class();
  id v8 = [*(id *)(a1 + 32) tableLayoutManager];
  id v9 = [v8 columnLayoutManagerForColumn:v7];
  id v10 = [v9 textStorage];
  uint64_t v11 = ICDynamicCast();

  [v11 beginEditing];
  uint64_t v12 = [v5 attributedString];
  uint64_t v13 = [v12 string];
  uint64_t v14 = [v5 length];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke_2;
  uint64_t v20 = &unk_2640BA358;
  id v21 = v12;
  int v24 = *(_DWORD *)(a1 + 48);
  id v22 = *(id *)(a1 + 40);
  id v23 = v5;
  id v15 = v5;
  id v16 = v12;
  objc_msgSend(v13, "ic_enumerateParagraphsInRange:usingBlock:", 0, v14, &v17);

  objc_msgSend(v11, "endEditing", v17, v18, v19, v20);
}

void __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v3 = [*(id *)(a1 + 32) attributesAtIndex:a2 effectiveRange:&v10];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 mutableCopy];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v6 = (void *)v5;
  id v7 = (void *)MEMORY[0x263F5AB28];
  id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];
  id v9 = v8;
  if (!v8 || [v8 style] != *(_DWORD *)(a1 + 56)) {
    [v6 setObject:*(void *)(a1 + 40) forKeyedSubscript:*v7];
  }
  objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v6, v10, v11);
}

- (int64_t)textAlignmentForCurrentSelection
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
  BOOL v4 = [(ICTableAttachmentViewController *)self table];
  if ([v3 isRangeOrSpanningSelection]
    && [v4 columnCount]
    && [v4 rowCount])
  {
    uint64_t v5 = [v3 columns];
    uint64_t v6 = [v5 firstObject];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v4 identifierForColumnAtIndex:0];
    }
    uint64_t v11 = v8;

    uint64_t v12 = [v3 rows];
    uint64_t v13 = [v12 firstObject];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v4 identifierForRowAtIndex:0];
    }
    id v16 = v15;

    uint64_t v17 = [v4 stringForColumnID:v11 rowID:v16];
    if ([v17 length])
    {
      uint64_t v18 = [v17 attributesAtIndex:0 effectiveRange:0];
      uint64_t v19 = [v18 objectForKey:*MEMORY[0x263F5AB28]];
      int64_t v9 = [v19 alignment];
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)setSelectionAlignment:(int64_t)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  BOOL v4 = [(ICTableAttachmentViewController *)self table];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v6 = [v5 columns];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        if (!v9)
        {
          int64_t v9 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v9, "addIndex:", objc_msgSend(v4, "columnIndexForIdentifier:", v12));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v14 = [v13 rows];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        if (!v17)
        {
          uint64_t v17 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v17, "addIndex:", objc_msgSend(v4, "rowIndexForIdentifier:", v20));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  id v21 = [(ICTableAttachmentViewController *)self undoTarget];
  id v22 = [(ICTableAttachmentViewController *)self undoManager];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke;
  v28[3] = &unk_2640BA3D0;
  id v29 = v4;
  unint64_t v30 = self;
  int64_t v31 = a3;
  id v23 = v4;
  [v23 enumerateTextStoragesForColumnIndexes:v9 rowIndexes:v17 undoTarget:v21 undoManager:v22 usingBlock:v28];

  [(ICTableAttachmentViewController *)self save];
  int v24 = [(ICTableAttachmentViewController *)self undoManager];
  unint64_t v25 = [MEMORY[0x263F086E0] mainBundle];
  char v26 = [v25 localizedStringForKey:@"Format" value:&stru_26C10E100 table:0];
  [v24 setActionName:v26];
}

void __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) identifierForColumnAtIndex:a3];
  objc_opt_class();
  uint64_t v7 = [*(id *)(a1 + 40) tableLayoutManager];
  uint64_t v8 = [v7 columnLayoutManagerForColumn:v6];
  int64_t v9 = [v8 textStorage];
  uint64_t v10 = ICDynamicCast();

  [v10 beginEditing];
  uint64_t v11 = [v5 length];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke_2;
  uint64_t v17 = &unk_2640BA3A8;
  uint64_t v12 = *(void *)(a1 + 48);
  id v18 = v5;
  uint64_t v19 = v12;
  id v13 = v5;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, &v14);
  objc_msgSend(v10, "endEditing", v14, v15, v16, v17);
}

void __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v15 = v7;
  if (v7)
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  int64_t v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x263F5AB28];
  uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (!v12)
  {
    id v13 = [MEMORY[0x263F5AD10] defaultParagraphStyle];
    uint64_t v12 = (void *)[v13 mutableCopy];
  }
  [v12 setAlignment:*(void *)(a1 + 40)];
  uint64_t v14 = (void *)[v12 copy];
  [v9 setObject:v14 forKeyedSubscript:*v10];

  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
}

- (int64_t)textDirectionForCurrentSelection
{
  int64_t v3 = [MEMORY[0x263F81658] defaultWritingDirectionForLanguage:0];
  BOOL v4 = [(ICTableAttachmentViewController *)self tableSelection];
  id v5 = [(ICTableAttachmentViewController *)self table];
  if ([v4 isRangeOrSpanningSelection]
    && [v5 columnCount]
    && [v5 rowCount])
  {
    uint64_t v6 = [v4 columns];
    id v7 = [v6 firstObject];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v5 identifierForColumnAtIndex:0];
    }
    uint64_t v10 = v9;

    uint64_t v11 = [v4 rows];
    uint64_t v12 = [v11 firstObject];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v5 identifierForRowAtIndex:0];
    }
    id v15 = v14;

    uint64_t v16 = [v5 stringForColumnID:v10 rowID:v15];
    if ([v16 length])
    {
      uint64_t v17 = [v16 attributesAtIndex:0 effectiveRange:0];
      id v18 = [v17 objectForKey:*MEMORY[0x263F5AB28]];
      int64_t v3 = [v18 writingDirection];
    }
  }

  return v3;
}

- (void)setSelectionDirection:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v4 = [(ICTableAttachmentViewController *)self table];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v6 = [v5 columns];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (!v9)
        {
          id v9 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v9, "addIndex:", objc_msgSend(v4, "columnIndexForIdentifier:", v12));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = [(ICTableAttachmentViewController *)self tableSelection];
  id v14 = [v13 rows];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        if (!v17)
        {
          uint64_t v17 = [MEMORY[0x263F089C8] indexSet];
        }
        objc_msgSend(v17, "addIndex:", objc_msgSend(v4, "rowIndexForIdentifier:", v20));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  [(ICTableAttachmentViewController *)self updateTableCellsWithDirection:a3 columnIndexes:v9 rowIndexes:v17];
  [(ICTableAttachmentViewController *)self save];
  id v21 = [(ICTableAttachmentViewController *)self undoManager];
  id v22 = [MEMORY[0x263F086E0] mainBundle];
  id v23 = [v22 localizedStringForKey:@"Format" value:&stru_26C10E100 table:0];
  [v21 setActionName:v23];
}

- (void)updateTableCellsWithDirection:(int64_t)a3 columnIndexes:(id)a4 rowIndexes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(ICTableAttachmentViewController *)self table];
  uint64_t v11 = [(ICTableAttachmentViewController *)self undoTarget];
  uint64_t v12 = [(ICTableAttachmentViewController *)self undoManager];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke;
  v14[3] = &unk_2640BA3D0;
  id v15 = v10;
  uint64_t v16 = self;
  int64_t v17 = a3;
  id v13 = v10;
  [v13 enumerateTextStoragesForColumnIndexes:v9 rowIndexes:v8 undoTarget:v11 undoManager:v12 usingBlock:v14];
}

void __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) identifierForColumnAtIndex:a3];
  objc_opt_class();
  uint64_t v7 = [*(id *)(a1 + 40) tableLayoutManager];
  id v8 = [v7 columnLayoutManagerForColumn:v6];
  id v9 = [v8 textStorage];
  uint64_t v10 = ICDynamicCast();

  [v10 beginEditing];
  uint64_t v11 = [v5 length];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke_2;
  int64_t v17 = &unk_2640BA3A8;
  uint64_t v12 = *(void *)(a1 + 48);
  id v18 = v5;
  uint64_t v19 = v12;
  id v13 = v5;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, &v14);
  objc_msgSend(v10, "endEditing", v14, v15, v16, v17);
}

void __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v15 = v7;
  if (v7)
  {
    id v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x263F5AB28];
  uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (!v12)
  {
    id v13 = [MEMORY[0x263F5AD10] defaultParagraphStyle];
    uint64_t v12 = (void *)[v13 mutableCopy];
  }
  [v12 setWritingDirection:*(void *)(a1 + 40)];
  [v12 setAlignment:4];
  uint64_t v14 = (void *)[v12 copy];
  [v9 setObject:v14 forKeyedSubscript:*v10];

  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
}

- (void)setHighlightColor:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAbstractAttachmentViewController *)self highlightColor];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)ICTableAttachmentViewController;
    [(ICAbstractAttachmentViewController *)&v9 setHighlightColor:v4];
    id v7 = [(ICTableAttachmentViewController *)self tableContentView];
    [v7 setHighlightColor:v4];

    id v8 = [(ICTableAttachmentViewController *)self tableContentView];
    objc_msgSend(v8, "ic_setNeedsLayout");
  }
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableAttachmentViewController;
  id v4 = a3;
  [(ICAbstractAttachmentViewController *)&v6 setHighlightPatternRegexFinder:v4];
  id v5 = [(ICTableAttachmentViewController *)self tableLayoutManager];
  [v5 setHighlightPatternRegexFinder:v4];
}

- (void)setupTableTextView:(id)a3
{
  id v25 = a3;
  [(ICTableAttachmentViewController *)self makeDelegateOfTextView:v25];
  [v25 setCellDelegate:self];
  [v25 setSelectionDelegate:self];
  objc_opt_class();
  id v4 = [v25 textStorage];
  id v5 = ICDynamicCast();

  objc_super v6 = [(ICAttachmentViewController *)self attachment];
  id v7 = [v6 note];

  id v8 = [v7 textStorage];
  objc_super v9 = [v8 undoManager];
  [v5 setUndoManager:v9];

  uint64_t v10 = [(ICTableAttachmentViewController *)self undoTarget];
  [v5 setOverrideUndoTarget:v10];

  [v5 setUndoHelper:self];
  objc_opt_class();
  uint64_t v11 = [v5 styler];
  uint64_t v12 = ICCheckedDynamicCast();

  id v13 = [(ICAttachmentViewController *)self attachment];
  uint64_t v14 = [v13 note];
  [v12 setNote:v14];

  [(ICTableAttachmentViewController *)self setTypingAttributesForTextView:v25];
  objc_opt_class();
  id v15 = [(ICAttachmentViewController *)self attachment];
  uint64_t v16 = [v15 note];
  int64_t v17 = [v16 textStorage];
  id v18 = [v17 styler];
  uint64_t v19 = ICCheckedDynamicCast();

  if (!v19) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteTextController) != nil)", "-[ICTableAttachmentViewController setupTableTextView:]", 1, 0, @"Expected non-nil value for '%s'", "noteTextController");
  }
  objc_opt_class();
  uint64_t v20 = [v25 columnTextStorage];
  id v21 = [v20 styler];
  id v22 = ICCheckedDynamicCast();

  id v23 = [v19 authorHighlightsController];
  [v22 setAuthorHighlightsController:v23];

  int v24 = [v19 zoomController];
  [v22 setZoomController:v24];
}

- (BOOL)allowsNewTextLength:(unint64_t)a3
{
  id v4 = [(ICAttachmentViewController *)self attachment];
  id v5 = [v4 note];
  LOBYTE(a3) = [v5 allowsNewTextLength:a3];

  return a3;
}

- (void)selectionWillBecomeFirstResponder:(id)a3
{
  id v5 = a3;
  if (![(ICTableAttachmentViewController *)self lockSelection])
  {
    id v4 = [(ICTableAttachmentViewController *)self auxiliaryTextViewHost];
    [v4 setAuxiliaryResponder:v5];
  }
}

- (void)selectionDidResignFirstResponder:(id)a3
{
  id v7 = a3;
  if (![(ICTableAttachmentViewController *)self lockSelection])
  {
    [(ICTableAttachmentViewController *)self hideColumnRowButtons];
    id v4 = [(ICTableAttachmentViewController *)self auxiliaryTextViewHost];
    id v5 = [v4 auxiliaryResponder];

    if (v5 == v7)
    {
      objc_super v6 = [(ICTableAttachmentViewController *)self auxiliaryTextViewHost];
      [v6 setAuxiliaryResponder:0];
    }
  }
}

- (void)deleteSelection:(id)a3
{
  id v15 = a3;
  id v4 = [(ICTableAttachmentViewController *)self table];
  id v5 = [(ICTableAttachmentViewController *)self tableSelection];
  objc_super v6 = [v5 rows];
  id v7 = [v4 rowsIntersectingWithRows:v6];

  id v8 = [v5 columns];
  objc_super v9 = [v4 columnsIntersectingWithColumns:v8];

  if ([v5 type] != 4)
  {
    if ([v5 type] == 2)
    {
      if ([v4 isEmptyAtColumnIdentifiers:v9 rowIdentifiers:0])
      {
        [(ICTableAttachmentViewController *)self deleteSelectedColumns:v15];
        goto LABEL_14;
      }
    }
    else
    {
      if ([v5 type] != 3) {
        goto LABEL_14;
      }
      if ([v4 isEmptyAtColumnIdentifiers:0 rowIdentifiers:v7])
      {
        [(ICTableAttachmentViewController *)self deleteSelectedRows:v15];
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
  uint64_t v10 = [v7 count];
  uint64_t v11 = [v4 rowCount];
  uint64_t v12 = [v9 count];
  uint64_t v13 = [v4 columnCount];
  uint64_t v14 = v13;
  if (v10 != v11 && v12 != v13 || ![v4 isEmptyAtColumnIdentifiers:v9 rowIdentifiers:v7])
  {
LABEL_13:
    [(ICTableAttachmentViewController *)self deleteSelectionCellContents];
    goto LABEL_14;
  }
  if (v10 == v11)
  {
    [(ICTableAttachmentViewController *)self deleteColumns:v9];
  }
  else if (v12 == v14)
  {
    [(ICTableAttachmentViewController *)self deleteRows:v7];
  }
LABEL_14:
}

- (void)cutSelection:(id)a3
{
  [(ICTableAttachmentViewController *)self copySelection:self];

  [(ICTableAttachmentViewController *)self deleteSelectionCellContents];
}

- (void)pasteIntoSelection:(id)a3
{
  id v36 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v36 type] == 1) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"ICTableAttachmentSelectionTypeCell != tableSelection.type" functionName:"-[ICTableAttachmentViewController pasteIntoSelection:]" simulateCrash:1 showAlert:0 format:@"Not expecting a call to -pasteIntoSelection: when editing a cell."];
  }
  id v4 = [(ICTableAttachmentViewController *)self icTableFromPasteboard];
  if (!v4)
  {
    uint64_t v5 = [(ICTableAttachmentViewController *)self soloPlainTextStringFromPasteboard];
    if (!v5) {
      goto LABEL_31;
    }
    objc_super v6 = (void *)v5;
    id v7 = objc_alloc(MEMORY[0x263F5AD48]);
    id v8 = [(ICTableAttachmentViewController *)self table];
    objc_super v9 = [v8 document];
    uint64_t v10 = [v9 replica];
    if (v10)
    {
      uint64_t v11 = (void *)[v7 initWithData:0 replicaID:v10];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F08C38] UUID];
      uint64_t v11 = (void *)[v7 initWithData:0 replicaID:v12];
    }
    id v4 = [v11 table];
    id v13 = (id)[v4 insertRowAtIndex:0];
    id v14 = (id)[v4 insertColumnAtIndex:0];
    id v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6];
    [v4 setAttributedString:v15 columnIndex:0 rowIndex:0];
  }
  uint64_t v16 = [(ICTableAttachmentViewController *)self table];
  int64_t v17 = [v36 columns];
  if ([v17 count])
  {
    id v18 = [v36 columns];
    uint64_t v19 = [v18 objectAtIndexedSubscript:0];
    uint64_t v35 = [v16 columnIndexForIdentifier:v19];
  }
  else
  {
    uint64_t v35 = 0;
  }

  uint64_t v20 = [v36 rows];
  if ([v20 count])
  {
    id v21 = [v36 rows];
    id v22 = [v21 objectAtIndexedSubscript:0];
    uint64_t v34 = [v16 rowIndexForIdentifier:v22];
  }
  else
  {
    uint64_t v34 = 0;
  }

  unint64_t v23 = [v4 columnCount];
  unint64_t v24 = [v4 rowCount];
  id v25 = [v36 columns];
  unint64_t v26 = [v25 count];
  if (!v26) {
    unint64_t v26 = [v16 columnCount];
  }

  long long v27 = [v36 rows];
  unint64_t v28 = [v27 count];
  if (!v28) {
    unint64_t v28 = [v16 rowCount];
  }

  if (v23 >= v26) {
    unint64_t v29 = v23 - v26;
  }
  else {
    unint64_t v29 = 0;
  }
  long long v30 = [(ICTableAttachmentViewController *)self table];

  if (v16 != v30) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"destinationTable == self.table" functionName:"-[ICTableAttachmentViewController pasteIntoSelection:]" simulateCrash:1 showAlert:0 format:@"destination table should be self.table"];
  }
  id v31 = [(ICTableAttachmentViewController *)self insertColumns:v29 atIndex:v26 + v35];
  if (v24 >= v28) {
    unint64_t v32 = v24 - v28;
  }
  else {
    unint64_t v32 = 0;
  }
  id v33 = (id)[v16 insertRows:v32 atIndex:v28 + v34];
  if (v23 > v26 || v24 > v28)
  {
    [(ICTableAttachmentViewController *)self postChangeNotification:2 columnOrRowUUIDs:0];
    [(ICTableAttachmentViewController *)self redrawAndSave];
  }
  [(ICTableAttachmentViewController *)self pasteTable:v4 atColumnIndex:v35 rowIndex:v34 shouldSetSelectionToPastedRange:1];

LABEL_31:
}

- (void)deleteSelectionCellContents
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  int64_t v3 = [(ICTableAttachmentViewController *)self table];
  id v4 = [MEMORY[0x263F089C8] indexSet];
  uint64_t v5 = [MEMORY[0x263F089C8] indexSet];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  objc_super v6 = [(ICTableAttachmentViewController *)self tableSelection];
  id v7 = [v6 columns];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v4, "addIndex:", objc_msgSend(v3, "columnIndexForIdentifier:", *(void *)(*((void *)&v38 + 1) + 8 * i)));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [(ICTableAttachmentViewController *)self tableSelection];
  id v13 = [v12 rows];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v5, "addIndex:", objc_msgSend(v3, "rowIndexForIdentifier:", *(void *)(*((void *)&v34 + 1) + 8 * j)));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v15);
  }

  id v18 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v19 = [v18 type];

  if (v19 == 2)
  {
    uint64_t v20 = [(ICTableAttachmentViewController *)self table];
    uint64_t v21 = [v20 rowCount];

    if (v21)
    {
      unint64_t v22 = 0;
      do
      {
        [v5 addIndex:v22++];
        unint64_t v23 = [(ICTableAttachmentViewController *)self table];
        unint64_t v24 = [v23 rowCount];
      }
      while (v22 < v24);
    }
  }
  else
  {
    id v25 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v26 = [v25 type];

    if (v26 == 3)
    {
      long long v27 = [(ICTableAttachmentViewController *)self table];
      uint64_t v28 = [v27 columnCount];

      if (v28)
      {
        unint64_t v29 = 0;
        do
        {
          [v4 addIndex:v29++];
          long long v30 = [(ICTableAttachmentViewController *)self table];
          unint64_t v31 = [v30 columnCount];
        }
        while (v29 < v31);
      }
    }
  }
  unint64_t v32 = [(ICTableAttachmentViewController *)self undoTarget];
  id v33 = [(ICTableAttachmentViewController *)self undoManager];
  [v3 enumerateTextStoragesForColumnIndexes:v4 rowIndexes:v5 undoTarget:v32 undoManager:v33 usingBlock:&__block_literal_global_217];

  [(ICTableAttachmentViewController *)self save];
}

void __62__ICTableAttachmentViewController_deleteSelectionCellContents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, objc_msgSend(v2, "length"), &stru_26C10E100);
}

- (void)pasteTable:(id)a3 atColumnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5 shouldSetSelectionToPastedRange:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if (v10)
  {
    [(ICTableAttachmentViewController *)self beginEditing];
    [(ICTableAttachmentViewController *)self table];
    uint64_t v11 = v27 = v6;
    uint64_t v12 = [v10 columnCount];
    uint64_t v13 = [v10 rowCount];
    uint64_t v25 = v12;
    uint64_t v14 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", a4, v12);
    uint64_t v26 = v13;
    uint64_t v15 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", a5, v13);
    uint64_t v16 = [(ICTableAttachmentViewController *)self undoTarget];
    int64_t v17 = [(ICTableAttachmentViewController *)self undoManager];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __101__ICTableAttachmentViewController_pasteTable_atColumnIndex_rowIndex_shouldSetSelectionToPastedRange___block_invoke;
    v28[3] = &unk_2640BA418;
    unint64_t v31 = a4;
    unint64_t v32 = a5;
    id v29 = v10;
    long long v30 = self;
    [v11 enumerateTextStoragesForColumnIndexes:v14 rowIndexes:v15 undoTarget:v16 undoManager:v17 usingBlock:v28];

    [(ICTableAttachmentViewController *)self endEditing];
    id v18 = [(ICTableAttachmentViewController *)self undoManager];
    uint64_t v19 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v20 = [v19 localizedStringForKey:@"Paste" value:&stru_26C10E100 table:0];
    [v18 setActionName:v20];

    if (v27)
    {
      uint64_t v21 = [v11 identifiersForColumnIndexes:v14];
      unint64_t v22 = [v11 identifiersForRowIndexes:v15];
      unint64_t v23 = [(ICTableAttachmentViewController *)self tableSelection];
      [v23 selectCellRangeAtColumns:v21 rows:v22];

      [(ICTableAttachmentViewController *)self updateChrome];
    }
    else
    {
      uint64_t v21 = [v11 identifierForColumnAtIndex:a4 + v25 - 1];
      unint64_t v22 = [v11 identifierForRowAtIndex:a5 + v26 - 1];
      [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v21 andRowID:v22 location:2];
    }

    unint64_t v24 = [(ICTableAttachmentViewController *)self textViewManager];
    [v24 updateAuthorHighlights];

    [(ICTableAttachmentViewController *)self save];
  }
}

void __101__ICTableAttachmentViewController_pasteTable_atColumnIndex_rowIndex_shouldSetSelectionToPastedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3 - *(void *)(a1 + 48);
  uint64_t v6 = a4 - *(void *)(a1 + 56);
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 stringForColumnIndex:v5 rowIndex:v6];
  id v10 = [*(id *)(a1 + 40) attachment];
  uint64_t v11 = [v10 managedObjectContext];
  uint64_t v12 = objc_msgSend(v9, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v11);

  uint64_t v13 = [*(id *)(a1 + 40) attachment];
  uint64_t v14 = [v13 managedObjectContext];
  objc_msgSend(v12, "ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:", v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15) {
    id v15 = objc_alloc_init(MEMORY[0x263F086A0]);
  }
  [v8 setIsReadingSelectionFromPasteboard:1];
  objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v8, "length"), v15);
  [v8 setIsReadingSelectionFromPasteboard:0];
}

- (void)extendCellRangeSelectionInDirection:(unint64_t)a3 toEnd:(BOOL)a4
{
  BOOL v4 = a4;
  v114[1] = *MEMORY[0x263EF8340];
  id v7 = [(ICTableAttachmentViewController *)self tableSelection];
  id v8 = (void *)[v7 copy];

  if ([v8 type] != 4)
  {
    uint64_t v9 = [(ICTableAttachmentViewController *)self tableSelection];
    id v10 = [v9 columns];
    uint64_t v11 = [v10 firstObject];

    uint64_t v12 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v13 = [v12 rows];
    uint64_t v14 = [v13 firstObject];

    if (!v11 || !v14)
    {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICTableAttachmentViewController extendCellRangeSelectionInDirection:toEnd:]" simulateCrash:1 showAlert:0 format:@"We tried to extend an invalid selection"];

      goto LABEL_46;
    }
    id v15 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v15 removeFromSuperview];

    uint64_t v16 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    [(ICTableAttachmentViewController *)self endCellEditingSessionWithTextView:v16];

    int64_t v17 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    [v17 setTextSelectionHidden:1];

    id v18 = [(ICTableAttachmentViewController *)self tableSelection];
    v114[0] = v11;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:1];
    unint64_t v113 = v14;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
    [v18 selectCellRangeAtColumns:v19 rows:v20];
  }
  uint64_t v21 = [v8 columns];
  uint64_t v22 = [v21 count];

  if (v22 == 1)
  {
    unint64_t v23 = [v8 columns];
    unint64_t v24 = [v23 firstObject];
    [(ICTableAttachmentViewController *)self setRangeSelectionAnchorColumn:v24];
  }
  uint64_t v25 = [v8 rows];
  uint64_t v26 = [v25 count];

  if (v26 == 1)
  {
    BOOL v27 = [v8 rows];
    uint64_t v28 = [v27 firstObject];
    [(ICTableAttachmentViewController *)self setRangeSelectionAnchorRow:v28];
  }
  id v29 = [(ICTableAttachmentViewController *)self table];
  long long v30 = [(ICTableAttachmentViewController *)self rangeSelectionAnchorColumn];
  unint64_t v31 = [v29 columnIndexForIdentifier:v30];

  unint64_t v32 = [(ICTableAttachmentViewController *)self table];
  id v33 = [(ICTableAttachmentViewController *)self rangeSelectionAnchorRow];
  unint64_t v34 = [v32 rowIndexForIdentifier:v33];

  switch(a3)
  {
    case 0uLL:
      long long v35 = [(ICTableAttachmentViewController *)self table];
      char v36 = [v35 isLeftToRight];

      if (v36) {
        goto LABEL_15;
      }
      long long v37 = [(ICTableAttachmentViewController *)self table];
      int v38 = [v37 isRightToLeft];

      if (v38) {
        goto LABEL_24;
      }
      goto LABEL_43;
    case 1uLL:
      long long v39 = [(ICTableAttachmentViewController *)self table];
      int v40 = [v39 isRightToLeft];

      if (v40)
      {
LABEL_15:
        if (v4)
        {
          long long v41 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v31 + 1);
LABEL_26:
          long long v55 = [(ICTableAttachmentViewController *)self table];
          uint64_t v56 = [v55 identifiersForColumnIndexes:v41];
LABEL_27:
          uint64_t v45 = (void *)v56;
LABEL_28:

          uint64_t v46 = [(ICTableAttachmentViewController *)self tableSelection];
          id v47 = [v8 rows];
          long long v48 = v46;
          long long v49 = v45;
          goto LABEL_40;
        }
        double v57 = [(ICTableAttachmentViewController *)self table];
        uint64_t v58 = [v8 columns];
        uint64_t v59 = [v58 lastObject];
        unint64_t v60 = [v57 columnIndexForIdentifier:v59];

        if (v60 > v31)
        {
          CGRect v61 = [v8 columns];
          long long v41 = (void *)[v61 mutableCopy];

          [v41 removeLastObject];
          goto LABEL_38;
        }
        CGFloat v83 = [(ICTableAttachmentViewController *)self table];
        double v84 = [v8 columns];
        CGFloat v85 = [v84 firstObject];
        uint64_t v86 = [v83 columnIndexForIdentifier:v85];

        if (v86)
        {
          CGFloat v87 = [(ICTableAttachmentViewController *)self table];
          long long v41 = [v87 identifierForColumnAtIndex:v86 - 1];

          BOOL v112 = v41;
          long long v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v112 count:1];
          CGFloat v88 = [v8 columns];
          uint64_t v45 = [v55 arrayByAddingObjectsFromArray:v88];

          goto LABEL_28;
        }
      }
      else
      {
        long long v51 = [(ICTableAttachmentViewController *)self table];
        int v52 = [v51 isLeftToRight];

        if ((v52 & 1) == 0) {
          goto LABEL_43;
        }
LABEL_24:
        if (v4)
        {
          long long v53 = (void *)MEMORY[0x263F088D0];
          long long v54 = [(ICTableAttachmentViewController *)self table];
          long long v41 = objc_msgSend(v53, "indexSetWithIndexesInRange:", v31, objc_msgSend(v54, "columnCount") - v31);

          goto LABEL_26;
        }
        CGFloat v73 = [(ICTableAttachmentViewController *)self table];
        double v74 = [v8 columns];
        CGFloat v75 = [v74 firstObject];
        unint64_t v76 = [v73 columnIndexForIdentifier:v75];

        if (v76 < v31)
        {
          double v77 = [v8 columns];
          long long v41 = (void *)[v77 mutableCopy];

          [v41 removeObjectAtIndex:0];
LABEL_38:
          uint64_t v45 = [(ICTableAttachmentViewController *)self tableSelection];
          uint64_t v46 = (void *)[v41 copy];
          uint64_t v72 = [v8 rows];
LABEL_39:
          id v47 = (void *)v72;
          long long v48 = v45;
          long long v49 = v46;
LABEL_40:
          long long v50 = v47;
LABEL_41:
          [v48 selectCellRangeAtColumns:v49 rows:v50];
LABEL_42:

          goto LABEL_43;
        }
        uint64_t v104 = [(ICTableAttachmentViewController *)self table];
        double v105 = [v8 columns];
        double v106 = [v105 lastObject];
        unint64_t v107 = [v104 columnIndexForIdentifier:v106];

        uint64_t v108 = [(ICTableAttachmentViewController *)self table];
        unint64_t v109 = [v108 columnCount] - 1;

        if (v107 < v109)
        {
          double v110 = [(ICTableAttachmentViewController *)self table];
          long long v41 = [v110 identifierForColumnAtIndex:v107 + 1];

          long long v55 = [v8 columns];
          uint64_t v56 = [v55 arrayByAddingObject:v41];
          goto LABEL_27;
        }
      }
LABEL_43:
      CGFloat v78 = [(ICTableAttachmentViewController *)self tableSelection];
      char v79 = [v8 isEqual:v78];

      if ((v79 & 1) == 0)
      {
        [(ICTableAttachmentViewController *)self announceCellRangeSelectionChangeForAccessibilityIfNecessary];
        [(ICTableAttachmentViewController *)self updateChrome];
        double v80 = [(ICTableAttachmentViewController *)self selectionHighlightView];
        char v81 = objc_msgSend(v80, "ic_isFirstResponder");

        if ((v81 & 1) == 0)
        {
          double v82 = [(ICTableAttachmentViewController *)self selectionHighlightView];
          [(ICTableAttachmentViewController *)self ic_makeFirstResponder:v82];
        }
      }
      break;
    case 2uLL:
      if (v4)
      {
        long long v41 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v34 + 1);
        goto LABEL_21;
      }
      CGRect v62 = [(ICTableAttachmentViewController *)self table];
      CGRect v63 = [v8 rows];
      double v64 = [v63 lastObject];
      unint64_t v65 = [v62 rowIndexForIdentifier:v64];

      if (v65 > v34)
      {
        double v66 = [v8 rows];
        long long v41 = (void *)[v66 mutableCopy];

        [v41 removeLastObject];
        goto LABEL_35;
      }
      double v89 = [(ICTableAttachmentViewController *)self table];
      unint64_t v90 = [v8 rows];
      double v91 = [v90 firstObject];
      uint64_t v92 = [v89 rowIndexForIdentifier:v91];

      if (!v92) {
        goto LABEL_43;
      }
      double v93 = [(ICTableAttachmentViewController *)self table];
      long long v41 = [v93 identifierForRowAtIndex:v92 - 1];

      CGFloat v111 = v41;
      uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v111 count:1];
      CGFloat v94 = [v8 rows];
      uint64_t v45 = [v44 arrayByAddingObjectsFromArray:v94];

      goto LABEL_22;
    case 3uLL:
      if (v4)
      {
        uint64_t v42 = (void *)MEMORY[0x263F088D0];
        long long v43 = [(ICTableAttachmentViewController *)self table];
        long long v41 = objc_msgSend(v42, "indexSetWithIndexesInRange:", v34, objc_msgSend(v43, "rowCount") - v34);

LABEL_21:
        uint64_t v44 = [(ICTableAttachmentViewController *)self table];
        uint64_t v45 = [v44 identifiersForRowIndexes:v41];
LABEL_22:

        uint64_t v46 = [(ICTableAttachmentViewController *)self tableSelection];
        id v47 = [v8 columns];
        long long v48 = v46;
        long long v49 = v47;
        long long v50 = v45;
        goto LABEL_41;
      }
      double v67 = [(ICTableAttachmentViewController *)self table];
      double v68 = [v8 rows];
      CGFloat v69 = [v68 firstObject];
      unint64_t v70 = [v67 rowIndexForIdentifier:v69];

      if (v70 < v34)
      {
        CGFloat v71 = [v8 rows];
        long long v41 = (void *)[v71 mutableCopy];

        [v41 removeObjectAtIndex:0];
LABEL_35:
        uint64_t v45 = [(ICTableAttachmentViewController *)self tableSelection];
        uint64_t v46 = [v8 columns];
        uint64_t v72 = [v41 copy];
        goto LABEL_39;
      }
      uint64_t v95 = [(ICTableAttachmentViewController *)self table];
      uint64_t v96 = [v8 rows];
      uint64_t v97 = [v96 lastObject];
      unint64_t v98 = [v95 rowIndexForIdentifier:v97];

      uint64_t v99 = [(ICTableAttachmentViewController *)self table];
      unint64_t v100 = [v99 rowCount] - 1;

      if (v98 >= v100) {
        goto LABEL_43;
      }
      double v101 = [(ICTableAttachmentViewController *)self table];
      long long v41 = [v101 identifierForRowAtIndex:v98 + 1];

      double v102 = [v8 rows];
      uint64_t v45 = [v102 arrayByAddingObject:v41];

      uint64_t v46 = [(ICTableAttachmentViewController *)self tableSelection];
      id v47 = [v8 columns];
      uint64_t v103 = (void *)[v45 copy];
      [v46 selectCellRangeAtColumns:v47 rows:v103];

      goto LABEL_42;
    default:
      goto LABEL_43;
  }
LABEL_46:
}

- (void)saveAttachmentChanges
{
}

- (void)saveAttachmentChangesInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_save object:0];
  uint64_t v5 = [(ICTableAttachmentViewController *)self table];
  uint64_t v6 = [v5 document];
  id v7 = [v6 archivedData];

  id v8 = [(ICTableAttachmentViewController *)self tableAttachmentProvider];
  uint64_t v9 = v8;
  if (v3) {
    [v8 backgroundAttachment];
  }
  else {
  id v10 = [v8 attachment];
  }

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __69__ICTableAttachmentViewController_saveAttachmentChangesInBackground___block_invoke;
  uint64_t v19 = &unk_2640B82D8;
  id v11 = v10;
  id v20 = v11;
  id v21 = v7;
  id v12 = v7;
  uint64_t v13 = _Block_copy(&v16);
  uint64_t v14 = objc_msgSend(v11, "managedObjectContext", v16, v17, v18, v19);
  id v15 = v14;
  if (v3) {
    [v14 performBlock:v13];
  }
  else {
    [v14 performBlockAndWait:v13];
  }
}

void __69__ICTableAttachmentViewController_saveAttachmentChangesInBackground___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) attachmentModel];
  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 updateAttachmentByMergingWithTableData:*(void *)(a1 + 40)];
  [v8 regenerateTextContentInNote];
  if ([*(id *)(a1 + 32) isInNoteTitleOrSnippet])
  {
    BOOL v3 = [*(id *)(a1 + 32) note];
    int v4 = [v3 regenerateTitle:1 snippet:1];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) note];
      [v5 markShareDirtyIfNeededWithReason:@"Updated title from table change"];

      uint64_t v6 = [*(id *)(a1 + 32) note];
      [v6 updateChangeCountWithReason:@"Updated title from table change"];
    }
  }
  id v7 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v7, "ic_save");
}

- (void)tableAttachmentProviderWillMergeTable:(id)a3
{
  [(ICTableAttachmentViewController *)self tableAttachmentWillChange];

  [(ICTableAttachmentViewController *)self willFlashAuthorHighlights];
}

- (void)tableAttachmentProviderDidMergeTable:(id)a3
{
  [(ICTableAttachmentViewController *)self tableAttachmentDidChange];

  [(ICTableAttachmentViewController *)self flashAuthorHighlightsIfNeeded];
}

- (void)tableAttachmentWillChange
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICTableAttachmentViewController tableAttachmentWillChange]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  BOOL v3 = [(ICTableAttachmentViewController *)self table];
  if ([v3 columnCount])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v3 identifierForColumnAtIndex:v4];
      uint64_t v6 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
      objc_msgSend(v6, "ic_addNonNilObject:", v5);

      ++v4;
    }
    while (v4 < [v3 columnCount]);
  }
  if ([v3 rowCount])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v3 identifierForRowAtIndex:v7];
      uint64_t v9 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
      objc_msgSend(v9, "ic_addNonNilObject:", v8);

      ++v7;
    }
    while (v7 < [v3 rowCount]);
  }
  id v10 = [(ICTableAttachmentViewController *)self textViewManager];
  uint64_t v26 = self;
  id v11 = [(ICTableAttachmentViewController *)self visibleEmptyCellsBeforeMerge];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v29 = v10;
  obuint64_t j = [v10 columnIDs];
  uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v12;
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v14 = [v29 rowIDs];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              id v20 = [v3 mergeableStringForColumnID:v13 rowID:v19];
              if (!v20)
              {
                id v21 = [v11 objectForKeyedSubscript:v13];
                if (!v21)
                {
                  id v21 = [MEMORY[0x263EFF9C0] set];
                  [v11 setObject:v21 forKeyedSubscript:v13];
                }
                objc_msgSend(v21, "ic_addNonNilObject:", v19);
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v16);
        }

        uint64_t v12 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v30);
  }

  uint64_t v22 = [(ICTableAttachmentViewController *)v26 tableSelection];
  unint64_t v23 = (void *)[v22 copy];
  [(ICTableAttachmentViewController *)v26 setTableSelectionBeforeMerge:v23];

  unint64_t v24 = [(ICTableAttachmentViewController *)v26 currentlyEditingTextStorage];
  uint64_t v25 = [v24 savedSelectionWithSelectionAffinity:0];
  [(ICTableAttachmentViewController *)v26 setStringSelectionBeforeMerge:v25];
}

- (void)tableAttachmentDidChange
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICTableAttachmentViewController tableAttachmentDidChange]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  BOOL v3 = [(ICTableAttachmentViewController *)self table];
  unint64_t v4 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v3, "columnCount"));
  if ([v3 columnCount])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v3 identifierForColumnAtIndex:v5];
      [v4 addObject:v6];

      ++v5;
    }
    while (v5 < [v3 columnCount]);
  }
  unint64_t v7 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v3, "rowCount"));
  if ([v3 rowCount])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v3 identifierForRowAtIndex:v8];
      [v7 addObject:v9];

      ++v8;
    }
    while (v8 < [v3 rowCount]);
  }
  id v10 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
  unint64_t v107 = v7;
  if ([v4 isEqual:v10])
  {
    id v11 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
    char v12 = [v7 isEqual:v11];

    if (v12) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  double v105 = v3;
  uint64_t v13 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
  uint64_t v14 = (void *)[v13 mutableCopy];

  double v106 = v4;
  [v14 minusOrderedSet:v4];
  uint64_t v15 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
  uint64_t v16 = (void *)[v15 mutableCopy];

  [v16 minusOrderedSet:v7];
  uint64_t v17 = [(ICTableAttachmentViewController *)self tableSelection];
  id v18 = [v14 array];
  uint64_t v108 = v16;
  uint64_t v19 = [v16 array];
  id v20 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
  id v21 = [v20 array];
  uint64_t v22 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
  unint64_t v23 = [v22 array];
  char v24 = [v17 removeColumns:v18 rows:v19 previousColumns:v21 previousRows:v23];

  if ((v24 & 1) == 0) {
    [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:1];
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v25 = v14;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v133 objects:v142 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v134;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v134 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v133 + 1) + 8 * i);
        [(ICTableAttachmentViewController *)self cleanDeletedColumn:v30];
        uint64_t v31 = [(ICTableAttachmentViewController *)self visibleEmptyCellsBeforeMerge];
        [v31 removeObjectForKey:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v133 objects:v142 count:16];
    }
    while (v27);
  }

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v32 = v108;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v129 objects:v141 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v130;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v130 != v35) {
          objc_enumerationMutation(v32);
        }
        [(ICTableAttachmentViewController *)self cleanDeletedRow:*(void *)(*((void *)&v129 + 1) + 8 * j)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v129 objects:v141 count:16];
    }
    while (v34);
  }
  uint64_t v104 = v25;

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v37 = [(ICTableAttachmentViewController *)self visibleEmptyCellsBeforeMerge];
  long long v38 = [v37 allKeys];

  uint64_t v39 = [v38 countByEnumeratingWithState:&v125 objects:v140 count:16];
  unint64_t v109 = v32;
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v126;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v126 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v125 + 1) + 8 * k);
        uint64_t v44 = [(ICTableAttachmentViewController *)self visibleEmptyCellsBeforeMerge];
        uint64_t v45 = [v44 objectForKeyedSubscript:v43];

        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        id v46 = v32;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v121 objects:v139 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v122;
          do
          {
            for (uint64_t m = 0; m != v48; ++m)
            {
              if (*(void *)v122 != v49) {
                objc_enumerationMutation(v46);
              }
              [v45 removeObject:*(void *)(*((void *)&v121 + 1) + 8 * m)];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v121 objects:v139 count:16];
          }
          while (v48);
        }

        id v32 = v109;
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v125 objects:v140 count:16];
    }
    while (v40);
  }

  if ([v104 count])
  {
    long long v51 = [v104 array];
    [(ICTableAttachmentViewController *)self postChangeNotification:3 columnOrRowUUIDs:v51];
  }
  if ([v32 count])
  {
    int v52 = [v32 array];
    [(ICTableAttachmentViewController *)self postChangeNotification:4 columnOrRowUUIDs:v52];
  }
  long long v53 = (void *)[v106 mutableCopy];
  long long v54 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
  [v53 minusOrderedSet:v54];

  if ([v53 count])
  {
    long long v55 = [v53 array];
    [(ICTableAttachmentViewController *)self postChangeNotification:0 columnOrRowUUIDs:v55];
  }
  uint64_t v56 = (void *)[v107 mutableCopy];
  double v57 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
  [v56 minusOrderedSet:v57];

  if ([v56 count])
  {
    uint64_t v58 = [v56 array];
    [(ICTableAttachmentViewController *)self postChangeNotification:1 columnOrRowUUIDs:v58];
  }
  uint64_t v59 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
  unint64_t v60 = objc_msgSend(v106, "ic_objectsMovedFromOrderedSet:", v59);

  if ([v60 count])
  {
    CGRect v61 = [v60 allObjects];
    [(ICTableAttachmentViewController *)self postChangeNotification:5 columnOrRowUUIDs:v61];
  }
  double v102 = v60;
  uint64_t v103 = v56;
  CGRect v62 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
  CGRect v63 = objc_msgSend(v107, "ic_objectsMovedFromOrderedSet:", v62);

  if ([v63 count])
  {
    double v64 = [v63 allObjects];
    [(ICTableAttachmentViewController *)self postChangeNotification:6 columnOrRowUUIDs:v64];

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v65 = v63;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v117 objects:v138 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v118;
      do
      {
        for (uint64_t n = 0; n != v67; ++n)
        {
          if (*(void *)v118 != v68) {
            objc_enumerationMutation(v65);
          }
          uint64_t v70 = *(void *)(*((void *)&v117 + 1) + 8 * n);
          CGFloat v71 = [(ICTableAttachmentViewController *)self tableLayoutManager];
          [v71 updateForMovedRow:v70];
        }
        uint64_t v67 = [v65 countByEnumeratingWithState:&v117 objects:v138 count:16];
      }
      while (v67);
    }
  }
  if ([v53 count] || objc_msgSend(v104, "count"))
  {
    uint64_t v72 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v104, "count") + objc_msgSend(v53, "count"));
    CGFloat v73 = [v53 array];
    [v72 addObjectsFromArray:v73];

    double v74 = [v104 array];
    [v72 addObjectsFromArray:v74];

    CGFloat v75 = [(ICTableAttachmentViewController *)self tableLayoutManager];
    unint64_t v76 = [v75 columnWidthManager];
    id v77 = (id)[v76 invalidateWidthForColumns:v72];
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v78 = v53;
  uint64_t v79 = [v78 countByEnumeratingWithState:&v113 objects:v137 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v114;
    do
    {
      for (iuint64_t i = 0; ii != v80; ++ii)
      {
        if (*(void *)v114 != v81) {
          objc_enumerationMutation(v78);
        }
        uint64_t v83 = *(void *)(*((void *)&v113 + 1) + 8 * ii);
        double v84 = [(ICTableAttachmentViewController *)self tableLayoutManager];
        CGFloat v85 = [v84 columnWidthManager];
        [v85 widthOfColumn:v83];
        double v87 = v86;

        CGFloat v88 = [(ICTableAttachmentViewController *)self columnWidthCache];
        [v88 setDimension:v83 forKey:v87];
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v113 objects:v137 count:16];
    }
    while (v80);
  }

  [(ICTableAttachmentViewController *)self redraw];
  unint64_t v4 = v106;
  unint64_t v7 = v107;
  BOOL v3 = v105;
LABEL_73:
  double v89 = [(ICTableAttachmentViewController *)self columnsBeforeMerge];
  [v89 removeAllObjects];

  unint64_t v90 = [(ICTableAttachmentViewController *)self rowsBeforeMerge];
  [v90 removeAllObjects];

  double v91 = [(ICTableAttachmentViewController *)self visibleEmptyCellsBeforeMerge];
  v110[0] = MEMORY[0x263EF8330];
  v110[1] = 3221225472;
  v110[2] = __59__ICTableAttachmentViewController_tableAttachmentDidChange__block_invoke;
  v110[3] = &unk_2640BA440;
  id v111 = v3;
  BOOL v112 = self;
  id v92 = v3;
  [v91 enumerateKeysAndObjectsUsingBlock:v110];

  double v93 = [(ICTableAttachmentViewController *)self visibleEmptyCellsBeforeMerge];
  [v93 removeAllObjects];

  CGFloat v94 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v95 = [(ICTableAttachmentViewController *)self tableSelectionBeforeMerge];
  int v96 = [v94 isEqual:v95];

  if (v96)
  {
    uint64_t v97 = [(ICTableAttachmentViewController *)self stringSelectionBeforeMerge];

    if (v97)
    {
      unint64_t v98 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
      uint64_t v99 = [(ICTableAttachmentViewController *)self stringSelectionBeforeMerge];
      [v98 restoreSelection:v99];
LABEL_78:

      unint64_t v7 = v107;
    }
  }
  else if ([v94 type] == 1)
  {
    unint64_t v98 = [v94 columns];
    uint64_t v99 = [v98 objectAtIndexedSubscript:0];
    unint64_t v100 = [v94 rows];
    double v101 = [v100 objectAtIndexedSubscript:0];
    [(ICTableAttachmentViewController *)self beginEditingCellWithColumnID:v99 andRowID:v101 location:[(ICTableAttachmentViewController *)self preferredNavigationSelection]];

    goto LABEL_78;
  }
}

void __59__ICTableAttachmentViewController_tableAttachmentDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(a3, "copy", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        char v12 = [*(id *)(a1 + 32) mergeableStringForColumnID:v5 rowID:v11];
        if (v12)
        {
          uint64_t v13 = [*(id *)(a1 + 40) tableLayoutManager];
          uint64_t v14 = [v13 columnLayoutManagerForColumn:v5];

          [v14 ensureCellExistsAtRowID:v11];
          objc_msgSend(*(id *)(a1 + 40), "tableValueDidChangeAtColumnID:rowID:delta:", v5, v11, objc_msgSend(v12, "length"));
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)postChangeNotification:(unint64_t)a3 columnOrRowUUIDs:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13[0] = @"ICTableAttachmentViewControllerKey";
  v13[1] = @"ICTableAttachmentViewControllerChangeKindKey";
  v14[0] = self;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  v14[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  if (v6)
  {
    uint64_t v9 = (void *)[v8 mutableCopy];
    [v9 setObject:v6 forKeyedSubscript:@"ICTableAttachmentViewControllerColumnOrRowUUIDsKey"];
    uint64_t v10 = [v9 copy];

    uint64_t v8 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  char v12 = [(ICTableAttachmentViewController *)self table];
  [v11 postNotificationName:@"ICTableAttachmentViewControllerDidChangeNotification" object:v12 userInfo:v8];
}

- (void)tableAttachmentViewControllerDidChange:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(ICTableAttachmentViewController *)self table];

  if (v5 == v6)
  {
    uint64_t v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"ICTableAttachmentViewControllerKey"];
    if (v8 != self)
    {
      uint64_t v45 = v8;
      uint64_t v9 = [v7 objectForKeyedSubscript:@"ICTableAttachmentViewControllerChangeKindKey"];
      uint64_t v10 = [v9 unsignedIntegerValue];

      uint64_t v11 = [v7 objectForKeyedSubscript:@"ICTableAttachmentViewControllerColumnOrRowUUIDsKey"];
      char v12 = v11;
      switch(v10)
      {
        case 0:
          uint64_t v44 = v7;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          uint64_t v13 = [v11 countByEnumeratingWithState:&v58 objects:v65 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v59 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v58 + 1) + 8 * i);
                long long v18 = [(ICTableAttachmentViewController *)self tableLayoutManager];
                uint64_t v19 = [v18 columnWidthManager];
                [v19 widthOfColumn:v17];
                double v21 = v20;

                uint64_t v22 = [(ICTableAttachmentViewController *)self columnWidthCache];
                [v22 setDimension:v17 forKey:v21];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v58 objects:v65 count:16];
            }
            while (v14);
          }
          id v23 = [(ICTableAttachmentViewController *)self tableLayoutManager];
          char v24 = [v23 columnWidthManager];
          id v25 = (id)[v24 invalidateAvailableWidth];

          uint64_t v7 = v44;
          goto LABEL_31;
        case 3:
          uint64_t v26 = [(ICTableAttachmentViewController *)self tableSelection];
          char v27 = [v26 removeColumns:v12 rows:MEMORY[0x263EFFA68]];

          if ((v27 & 1) == 0) {
            [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:1];
          }
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v23 = v12;
          uint64_t v28 = [v23 countByEnumeratingWithState:&v54 objects:v64 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v55 != v30) {
                  objc_enumerationMutation(v23);
                }
                [(ICTableAttachmentViewController *)self cleanDeletedColumn:*(void *)(*((void *)&v54 + 1) + 8 * j)];
              }
              uint64_t v29 = [v23 countByEnumeratingWithState:&v54 objects:v64 count:16];
            }
            while (v29);
          }
          goto LABEL_31;
        case 4:
          id v32 = [(ICTableAttachmentViewController *)self tableSelection];
          char v33 = [v32 removeColumns:MEMORY[0x263EFFA68] rows:v12];

          if ((v33 & 1) == 0) {
            [(ICTableAttachmentViewController *)self beginEditingNoteAtOffset:1];
          }
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v23 = v12;
          uint64_t v34 = [v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v51;
            do
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v51 != v36) {
                  objc_enumerationMutation(v23);
                }
                [(ICTableAttachmentViewController *)self cleanDeletedRow:*(void *)(*((void *)&v50 + 1) + 8 * k)];
              }
              uint64_t v35 = [v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
            }
            while (v35);
          }
LABEL_31:

          break;
        case 6:
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v38 = [v11 countByEnumeratingWithState:&v46 objects:v62 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v47;
            do
            {
              for (uint64_t m = 0; m != v39; ++m)
              {
                if (*(void *)v47 != v40) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v42 = *(void *)(*((void *)&v46 + 1) + 8 * m);
                uint64_t v43 = [(ICTableAttachmentViewController *)self tableLayoutManager];
                [v43 updateForMovedRow:v42];
              }
              uint64_t v39 = [v12 countByEnumeratingWithState:&v46 objects:v62 count:16];
            }
            while (v39);
          }
          break;
        default:
          break;
      }
      [(ICTableAttachmentViewController *)self redraw];

      uint64_t v8 = v45;
    }
  }
}

- (void)willFlashAuthorHighlights
{
  BOOL v3 = [(ICTableAttachmentViewController *)self cellTimestampsBeforeMerge];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x263EFF9A0];
    id v5 = [(ICTableAttachmentViewController *)self table];
    id v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "columnCount"));

    uint64_t v7 = [(ICTableAttachmentViewController *)self table];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    char v12 = __60__ICTableAttachmentViewController_willFlashAuthorHighlights__block_invoke;
    uint64_t v13 = &unk_2640BA468;
    uint64_t v14 = self;
    id v15 = v6;
    id v8 = v6;
    [v7 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:&v10];

    uint64_t v9 = objc_msgSend(v8, "copy", v10, v11, v12, v13, v14);
    [(ICTableAttachmentViewController *)self setCellTimestampsBeforeMerge:v9];
  }
}

uint64_t __60__ICTableAttachmentViewController_willFlashAuthorHighlights__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 table];
  uint64_t v10 = [v9 identifierForColumnAtIndex:a3];

  uint64_t v11 = [*(id *)(a1 + 32) table];
  char v12 = [v11 identifierForRowAtIndex:a4];

  uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
  if (v13)
  {
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v10];
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v15 = [*(id *)(a1 + 32) table];
    long long v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "rowCount"));
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:v10];
  }
  uint64_t v17 = [v8 timestamp];

  long long v18 = (void *)[v17 copy];
  uint64_t v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
  [v19 setObject:v18 forKeyedSubscript:v12];

  return 0;
}

- (void)flashAuthorHighlightsIfNeeded
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self cellTimestampsBeforeMerge];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(ICAttachmentViewController *)self attachment];
    id v6 = [v5 note];
    int v7 = [v6 isSharedViaICloud];

    if (v7)
    {
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x2020000000;
      uint64_t v13 = 0;
      id v8 = [(ICTableAttachmentViewController *)self textViewManager];
      uint64_t v9 = [v8 anchorColumn];

      uint64_t v13 = v9;
      uint64_t v10 = [(ICTableAttachmentViewController *)self textViewManager];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke;
      v11[3] = &unk_2640BA508;
      v11[4] = self;
      void v11[5] = v12;
      [v10 enumerateTextViewsWithBlock:v11];

      [(ICTableAttachmentViewController *)self setCellTimestampsBeforeMerge:0];
      _Block_object_dispose(v12, 8);
    }
  }
}

void __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [*(id *)(a1 + 32) table];
  id v6 = [MEMORY[0x263F088D0] indexSetWithIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_2;
  v28[3] = &unk_2640BA4B8;
  void v28[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v29 = v7;
  id v8 = v4;
  id v30 = v8;
  [v5 enumerateCellObjectsInCellSelectionContainingColumnIndices:v6 rowIndices:0 copyItems:0 usingBlock:v28];

  if ([v8 count])
  {
    objc_opt_class();
    uint64_t v9 = [*(id *)(a1 + 32) attachment];
    uint64_t v10 = [v9 note];
    uint64_t v11 = [v10 textStorage];
    char v12 = [v11 styler];
    uint64_t v13 = ICDynamicCast();

    id v14 = [v13 authorHighlightsController];
    id v15 = [v7 TTTextStorage];
    uint64_t v16 = objc_msgSend(v15, "ic_range");
    uint64_t v18 = v17;
    uint64_t v19 = [v7 TTTextStorage];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    void v23[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_4;
    v23[3] = &unk_2640BA4E0;
    id v24 = v8;
    id v25 = v13;
    id v20 = v7;
    uint64_t v21 = *(void *)(a1 + 32);
    id v26 = v20;
    uint64_t v27 = v21;
    id v22 = v13;
    objc_msgSend(v14, "performHighlightUpdatesForRange:inTextStorage:updates:", v16, v18, v19, v23);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1[4];
  id v8 = a2;
  uint64_t v9 = [v7 table];
  uint64_t v10 = [v9 identifierForColumnAtIndex:a3];

  uint64_t v11 = [a1[4] table];
  char v12 = [v11 identifierForRowAtIndex:a4];

  uint64_t v13 = [a1[4] cellTimestampsBeforeMerge];
  id v14 = [v13 objectForKeyedSubscript:v10];
  id v15 = [v14 objectForKeyedSubscript:v12];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_3;
  v18[3] = &unk_2640BA490;
  id v19 = a1[5];
  id v20 = v12;
  id v21 = a1[6];
  id v16 = v12;
  [v8 enumerateHighlightableRangesModifiedAfter:v15 includingAttributes:0 usingBlock:v18];

  return 0;
}

void __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) columnTextStorage];
  uint64_t v7 = [v6 characterRangeForRowID:*(void *)(a1 + 40)];

  uint64_t v8 = v7 + a2;
  uint64_t v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v8, a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v9 addObject:v10];
}

void __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_4(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = a1[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        uint64_t v11 = [a1[5] authorHighlightsController];
        uint64_t v12 = [v10 rangeValue];
        uint64_t v14 = v13;
        id v15 = [a1[6] TTTextStorage];
        objc_msgSend(v11, "extendHighlightsForRange:inTextStorage:", v12, v14, v15);

        id v16 = [a1[7] note];
        if ([v16 isSharedViaICloud])
        {
          uint64_t v17 = [a1[7] note];
          char v18 = [v17 isFastSyncSessionActive];

          if (v18) {
            goto LABEL_10;
          }
          id v16 = [a1[5] authorHighlightsController];
          id v19 = [a1[6] TTTextStorage];
          objc_msgSend(v16, "flashHighlightsForRange:withDuration:inTextStorage:", a2, a3, 0, v19);
        }
LABEL_10:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (double)availableWidth
{
  id v3 = [(ICAttachmentViewController *)self textAttachment];
  if (!v3) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textAttachment) != nil)", "-[ICTableAttachmentViewController availableWidth]", 1, 0, @"Expected non-nil value for '%s'", "textAttachment");
  }
  if ([(ICAttachmentViewController *)self forManualRendering])
  {
    [v3 lastAvailableWidth];
    double v5 = v4;
  }
  else
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self noteTextView];
    uint64_t v7 = [v6 textContainer];
    if (v7) {
      goto LABEL_7;
    }
    uint64_t v8 = [(ICTableAttachmentViewController *)self noteLayoutManager];
    uint64_t v9 = [v8 textContainers];
    uint64_t v7 = [v9 firstObject];

    if (v7)
    {
LABEL_7:
      [v3 availableWidthForTextContainer:v7];
      double v5 = v10;
    }
    else
    {
      [v3 lastAvailableWidth];
      if (v12 == 0.0) {
        double v5 = 42.0;
      }
      else {
        double v5 = v12;
      }
    }
  }
  return v5;
}

- (void)updateWidthsForChangeInColumn:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(ICTableAttachmentViewController *)self tableLayoutManager];
  uint64_t v6 = [v5 columnWidthManager];
  v9[0] = v4;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  uint64_t v8 = [v6 invalidateWidthForColumns:v7];

  if ([v8 count]) {
    [(ICTableAttachmentViewController *)self redraw];
  }
}

- (void)updateColumnWidthForColumn:(id)a3
{
  id v4 = a3;
  double v5 = [(ICTableAttachmentViewController *)self columnsNeedingWidthUpdate];
  [v5 addObject:v4];

  [(ICTableAttachmentViewController *)self updateEditedColumnWidths];
}

- (BOOL)updateAllColumnWidths
{
  id v3 = [(ICTableAttachmentViewController *)self textViewManager];
  id v4 = [v3 columnIDs];
  unint64_t v5 = [v4 count];

  if (v5 <= *MEMORY[0x263F5B190]) {
    unint64_t v6 = *MEMORY[0x263F5B190];
  }
  else {
    unint64_t v6 = v5;
  }
  uint64_t v7 = [(ICTableAttachmentViewController *)self table];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __56__ICTableAttachmentViewController_updateAllColumnWidths__block_invoke;
  void v9[3] = &unk_2640BA530;
  v9[4] = self;
  v9[5] = v6;
  [v7 enumerateColumnsWithBlock:v9];

  return [(ICTableAttachmentViewController *)self updateEditedColumnWidths];
}

void __56__ICTableAttachmentViewController_updateAllColumnWidths__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 columnsNeedingWidthUpdate];
  [v9 addObject:v8];

  if (*(void *)(a1 + 40) <= a3) {
    *a4 = 1;
  }
}

- (void)updateAllColumnWidthsAndRedraw
{
  if (![(ICTableAttachmentViewController *)self updateAllColumnWidths])
  {
    [(ICTableAttachmentViewController *)self redraw];
  }
}

- (BOOL)updateEditedColumnWidths
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICTableAttachmentViewController updateEditedColumnWidths]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v3 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
  int v4 = [v3 isEditingOrConvertingMarkedText:0];

  if (v4)
  {
    [(ICTableAttachmentViewController *)self updateEditedColumnWidthsAfterDelay];
    return 0;
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateEditedColumnWidths object:0];
  unint64_t v5 = [(ICTableAttachmentViewController *)self columnsNeedingWidthUpdate];
  uint64_t v6 = [v5 count];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(ICTableAttachmentViewController *)self tableLayoutManager];
  id v8 = [v7 columnWidthManager];

  uint64_t v9 = [(ICTableAttachmentViewController *)self columnsNeedingWidthUpdate];
  double v10 = [v9 allObjects];
  uint64_t v11 = [v8 invalidateWidthForColumns:v10];

  if (![v11 count])
  {
    char v18 = [(ICTableAttachmentViewController *)self columnsNeedingWidthUpdate];
    [v18 removeAllObjects];

    return 0;
  }
  [(ICTableAttachmentViewController *)self redraw];
  double v12 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];

  if (v12)
  {
    uint64_t v13 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    [(ICTableAttachmentViewController *)self scrollToCaretIfNeededForTextView:v13];
  }
  uint64_t v14 = [(ICTableAttachmentViewController *)self columnsNeedingWidthUpdate];
  [v14 removeAllObjects];

  id v15 = [MEMORY[0x263F08A00] defaultCenter];
  id v16 = [(ICTableAttachmentViewController *)self noteTextView];
  [v15 postNotificationName:@"ICTextViewLayoutDidChangeNotification" object:v16];

  return 1;
}

- (void)updateEditedColumnWidthsAfterDelay
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateEditedColumnWidths object:0];
  double v3 = *MEMORY[0x263F5B1D8];

  [(ICTableAttachmentViewController *)self performSelector:sel_updateEditedColumnWidths withObject:0 afterDelay:v3];
}

- (void)updateAvailableWidth
{
  [(ICTableAttachmentViewController *)self availableWidth];
  double v4 = v3;
  [(ICTableAttachmentViewController *)self previousAvailableWidth];
  if (v4 != v5)
  {
    [(ICTableAttachmentViewController *)self setPreviousAvailableWidth:v4];
    uint64_t v6 = [(ICTableAttachmentViewController *)self tableLayoutManager];
    uint64_t v7 = [v6 columnWidthManager];
    id v8 = (id)[v7 invalidateAvailableWidth];

    [(ICTableAttachmentViewController *)self redraw];
  }
}

- (void)saveOnMainThread
{
}

- (void)save
{
  double v3 = [(ICAttachmentViewController *)self attachment];
  char v4 = [v3 isReadOnly];

  if ((v4 & 1) == 0)
  {
    double v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
    int v6 = [v5 isEditingOrConvertingMarkedText:0];

    if (v6)
    {
      [(ICTableAttachmentViewController *)self saveAfterDelay];
    }
    else
    {
      [(ICTableAttachmentViewController *)self saveAttachmentChangesInBackground:1];
    }
  }
}

- (void)saveAfterDelay
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_save object:0];
  double v3 = [(ICAttachmentViewController *)self attachment];
  char v4 = [v3 note];
  int v5 = [v4 isFastSyncSessionActive];
  int v6 = (double *)MEMORY[0x263F5B580];
  if (!v5) {
    int v6 = (double *)MEMORY[0x263F5B578];
  }
  double v7 = *v6;

  [(ICTableAttachmentViewController *)self performSelector:sel_save withObject:0 afterDelay:v7];
}

- (void)initializeTableAccessibilityControllerIfNecessary
{
  double v3 = [(ICTableAttachmentViewController *)self tableAXController];

  if (!v3)
  {
    char v4 = [[ICTableAccessibilityController alloc] initWithTableAttachmentViewController:self];
    [(ICTableAttachmentViewController *)self setTableAXController:v4];
  }
}

- (void)announceCellRangeSelectionChangeForAccessibilityIfNecessary
{
  double v3 = [(ICTableAttachmentViewController *)self tableSelection];
  char v4 = [(ICTableAttachmentViewController *)self previousAXTableSelection];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    int v6 = [(ICTableAttachmentViewController *)self tableAXController];
    double v7 = [(ICTableAttachmentViewController *)self tableSelection];
    [v6 speakCellRangeSelection:v7];

    id v9 = [(ICTableAttachmentViewController *)self tableSelection];
    id v8 = (void *)[v9 copy];
    [(ICTableAttachmentViewController *)self setPreviousAXTableSelection:v8];
  }
}

- (void)initializeTableLayout
{
  id v33 = [(ICTableAttachmentViewController *)self table];
  double v3 = [[ICTableLayoutManager alloc] initWithTable:v33 delegate:self];
  tableLayoutManager = self->_tableLayoutManager;
  self->_tableLayoutManager = v3;

  char v5 = [v33 cellChangeNotifier];
  [v5 addObserver:self];

  uint64_t v6 = [v33 columnCount];
  double v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v6];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v9 = [v33 identifierForColumnAtIndex:i];
      [v7 addObject:v9];
    }
  }
  uint64_t v10 = [v33 rowCount];
  uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:v10];
  if (v10)
  {
    for (uint64_t j = 0; j != v10; ++j)
    {
      uint64_t v13 = [v33 identifierForRowAtIndex:j];
      [v11 addObject:v13];
    }
  }
  uint64_t v14 = [(ICTableLayoutManager *)self->_tableLayoutManager columnWidthManager];
  [v14 singleColumnTableWidth];
  double v16 = v15;

  uint64_t v17 = (ICDimensionSumCache *)[objc_alloc(MEMORY[0x263F5AC30]) initWithKeys:v7 andEstimateDimension:v16];
  columnWidthCache = self->_columnWidthCache;
  self->_columnWidthCache = v17;

  id v19 = (ICDimensionSumCache *)[objc_alloc(MEMORY[0x263F5AC30]) initWithKeys:v11 andEstimateDimension:44.0];
  rowHeightCache = self->_rowHeightCache;
  self->_rowHeightCache = v19;

  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v33, "rowCount"));
  long long v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  cellHeightCache = self->_cellHeightCache;
  self->_cellHeightCache = v21;

  long long v23 = [MEMORY[0x263EFF9A0] dictionary];
  visibleEmptyCellsBeforeMerge = self->_visibleEmptyCellsBeforeMerge;
  self->_visibleEmptyCellsBeforeMerge = v23;

  id v25 = (void *)MEMORY[0x263EFF9B0];
  uint64_t v26 = [(ICTableAttachmentViewController *)self table];
  objc_msgSend(v25, "orderedSetWithCapacity:", objc_msgSend(v26, "columnCount"));
  uint64_t v27 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  columnsBeforeMerge = self->_columnsBeforeMerge;
  self->_columnsBeforeMerge = v27;

  id v29 = (void *)MEMORY[0x263EFF9B0];
  id v30 = [(ICTableAttachmentViewController *)self table];
  objc_msgSend(v29, "orderedSetWithCapacity:", objc_msgSend(v30, "rowCount"));
  uint64_t v31 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  rowsBeforeMerge = self->_rowsBeforeMerge;
  self->_rowsBeforeMerge = v31;
}

- (ICTableUndoTarget)undoTarget
{
  return self->_undoTarget;
}

- (NSMapTable)coalescingUndoGroupForStringDelegate
{
  return self->_coalescingUndoGroupForStringDelegate;
}

- (BOOL)preventScrolling
{
  return self->preventScrolling;
}

- (void)setPreventScrolling:(BOOL)a3
{
  self->preventScrolling = a3;
}

- (BOOL)lockSelection
{
  return self->_lockSelection;
}

- (void)setLockSelection:(BOOL)a3
{
  self->_lockSelectiouint64_t n = a3;
}

- (ICTableAttachmentSelection)tableSelection
{
  return self->_tableSelection;
}

- (void)setTableSelection:(id)a3
{
}

- (BOOL)isShowingTextStyleOptions
{
  return self->_showingTextStyleOptions;
}

- (ICTableTextViewManager)textViewManager
{
  return self->_textViewManager;
}

- (ICTableScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (ICTableColumnTextView)activeTextView
{
  return self->_activeTextView;
}

- (BOOL)shouldBeginInitialEditing
{
  return self->_shouldBeginInitialEditing;
}

- (void)setShouldBeginInitialEditing:(BOOL)a3
{
  self->_shouldBeginInitialEditing = a3;
}

- (ICTTTextStorage)currentlyEditingTextStorage
{
  return self->_currentlyEditingTextStorage;
}

- (void)setCurrentlyEditingTextStorage:(id)a3
{
}

- (ICTableColumnTextView)currentlyEditingTextView
{
  return self->_currentlyEditingTextView;
}

- (void)setCurrentlyEditingTextView:(id)a3
{
}

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
}

- (ICTableAttachmentProvider)tableAttachmentProvider
{
  return self->_tableAttachmentProvider;
}

- (NSMutableDictionary)visibleEmptyCellsBeforeMerge
{
  return self->_visibleEmptyCellsBeforeMerge;
}

- (NSMutableOrderedSet)columnsBeforeMerge
{
  return self->_columnsBeforeMerge;
}

- (NSMutableOrderedSet)rowsBeforeMerge
{
  return self->_rowsBeforeMerge;
}

- (ICTableAttachmentSelection)tableSelectionBeforeMerge
{
  return self->_tableSelectionBeforeMerge;
}

- (void)setTableSelectionBeforeMerge:(id)a3
{
}

- (NSArray)stringSelectionBeforeMerge
{
  return self->_stringSelectionBeforeMerge;
}

- (void)setStringSelectionBeforeMerge:(id)a3
{
}

- (CGPoint)initialDragOffset
{
  double x = self->_initialDragOffset.x;
  double y = self->_initialDragOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDragOffset:(CGPoint)a3
{
  self->_initialDragOffset = a3;
}

- (unint64_t)currentDragIndex
{
  return self->_currentDragIndex;
}

- (void)setCurrentDragIndex:(unint64_t)a3
{
  self->_currentDragIndedouble x = a3;
}

- (NSArray)stringSelectionBeforeDrag
{
  return self->_stringSelectionBeforeDrag;
}

- (void)setStringSelectionBeforeDrag:(id)a3
{
}

- (NSMutableArray)undoCommands
{
  return self->_undoCommands;
}

- (void)setUndoCommands:(id)a3
{
}

- (unint64_t)editingCount
{
  return self->_editingCount;
}

- (void)setEditingCount:(unint64_t)a3
{
  self->_editingCount = a3;
}

- (CGPoint)currentDragGestureLocation
{
  double x = self->_currentDragGestureLocation.x;
  double y = self->_currentDragGestureLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentDragGestureLocation:(CGPoint)a3
{
  self->_currentDragGestureLocatiouint64_t n = a3;
}

- (NSMutableSet)columnsNeedingWidthUpdate
{
  return self->_columnsNeedingWidthUpdate;
}

- (BOOL)isUpdatingTiles
{
  return self->_updatingTiles;
}

- (void)setUpdatingTiles:(BOOL)a3
{
  self->_updatingTiles = a3;
}

- (BOOL)didRecentlyAutoAddRow
{
  return self->_didRecentlyAutoAddRow;
}

- (void)setDidRecentlyAutoAddRow:(BOOL)a3
{
  self->_didRecentlyAutoAddRow = a3;
}

- (unint64_t)lastDraggedOverColumnOrRowIndex
{
  return self->_lastDraggedOverColumnOrRowIndex;
}

- (void)setLastDraggedOverColumnOrRowIndex:(unint64_t)a3
{
  self->_lastDraggedOverColumnOrRowIndedouble x = a3;
}

- (ICTableAttachmentSelection)previousAXTableSelection
{
  return self->_previousAXTableSelection;
}

- (void)setPreviousAXTableSelection:(id)a3
{
}

- (BOOL)isPerformingInitialLayout
{
  return self->_isPerformingInitialLayout;
}

- (void)setIsPerformingInitialLayout:(BOOL)a3
{
  self->_isPerformingInitialLayout = a3;
}

- (ICLayoutManager)noteLayoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteLayoutManager);

  return (ICLayoutManager *)WeakRetained;
}

- (void)setNoteLayoutManager:(id)a3
{
}

- (ICTK2TextLayoutManager)noteTextLayoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteTextLayoutManager);

  return (ICTK2TextLayoutManager *)WeakRetained;
}

- (void)setNoteTextLayoutManager:(id)a3
{
}

- (double)previousAvailableWidth
{
  return self->_previousAvailableWidth;
}

- (void)setPreviousAvailableWidth:(double)a3
{
  self->_previousAvailabledouble Width = a3;
}

- (BOOL)shouldPreventUndoCommands
{
  return self->_shouldPreventUndoCommands;
}

- (void)setShouldPreventUndoCommands:(BOOL)a3
{
  self->_shouldPreventUndoCommands = a3;
}

- (NSDictionary)cellTimestampsBeforeMerge
{
  return self->_cellTimestampsBeforeMerge;
}

- (void)setCellTimestampsBeforeMerge:(id)a3
{
}

- (ICAppearanceInfo)draggingAppearance
{
  return self->_draggingAppearance;
}

- (void)setDraggingAppearance:(id)a3
{
}

- (_UIDragSnappingFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (CGRect)editingViewport
{
  double x = self->_editingViewport.origin.x;
  double y = self->_editingViewport.origin.y;
  double width = self->_editingViewport.size.width;
  double height = self->_editingViewport.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)transitionViewport
{
  double x = self->_transitionViewport.origin.x;
  double y = self->_transitionViewport.origin.y;
  double width = self->_transitionViewport.size.width;
  double height = self->_transitionViewport.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTransitionViewport:(CGRect)a3
{
  self->_transitionViewport = a3;
}

- (ICTableContentView)tableContentView
{
  return self->_tableContentView;
}

- (UIScrollView)noteScrollView
{
  return self->_noteScrollView;
}

- (ICTableLayoutManager)tableLayoutManager
{
  return self->_tableLayoutManager;
}

- (ICDimensionSumCache)columnWidthCache
{
  return self->_columnWidthCache;
}

- (void)setColumnWidthCache:(id)a3
{
}

- (ICDimensionSumCache)rowHeightCache
{
  return self->_rowHeightCache;
}

- (void)setRowHeightCache:(id)a3
{
}

- (NSMutableDictionary)cellHeightCache
{
  return self->_cellHeightCache;
}

- (ICTableClipView)headerClipView
{
  return self->_headerClipView;
}

- (ICTableColumnRowButton)columnButton
{
  return self->_columnButton;
}

- (void)setColumnButton:(id)a3
{
}

- (ICTableColumnRowButton)rowButton
{
  return self->_rowButton;
}

- (void)setRowButton:(id)a3
{
}

- (ICTableSelectionView)selectionHighlightView
{
  return self->_selectionHighlightView;
}

- (ICTableSelectionKnob)startKnob
{
  return self->_startKnob;
}

- (ICTableSelectionKnob)endKnob
{
  return self->_endKnob;
}

- (NSUUID)rangeSelectionAnchorColumn
{
  return self->_rangeSelectionAnchorColumn;
}

- (void)setRangeSelectionAnchorColumn:(id)a3
{
}

- (NSUUID)rangeSelectionAnchorRow
{
  return self->_rangeSelectionAnchorRow;
}

- (void)setRangeSelectionAnchorRow:(id)a3
{
}

- (UIView)dragView
{
  return self->_dragView;
}

- (void)setDragView:(id)a3
{
}

- (BOOL)performedInitialLayout
{
  return self->_performedInitialLayout;
}

- (void)setPerformedInitialLayout:(BOOL)a3
{
  self->_performedInitialLayout = a3;
}

- (BOOL)makingCellFirstResponder
{
  return self->_makingCellFirstResponder;
}

- (void)setMakingCellFirstResponder:(BOOL)a3
{
  self->_makingCellFirstResponder = a3;
}

- (CGRect)proposedLineFragmentRect
{
  double x = self->_proposedLineFragmentRect.origin.x;
  double y = self->_proposedLineFragmentRect.origin.y;
  double width = self->_proposedLineFragmentRect.size.width;
  double height = self->_proposedLineFragmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setProposedLineFragmentRect:(CGRect)a3
{
  self->_proposedLineFragmentRect = a3;
}

- (ICTableAccessibilityController)tableAXController
{
  return self->_tableAXController;
}

- (void)setTableAXController:(id)a3
{
}

- (ICTableAutoScroller)tableAutoScroller
{
  return self->_tableAutoScroller;
}

- (void)setTableAutoScroller:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableAutoScroller, 0);
  objc_storeStrong((id *)&self->_tableAXController, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_rangeSelectionAnchorRow, 0);
  objc_storeStrong((id *)&self->_rangeSelectionAnchorColumn, 0);
  objc_storeStrong((id *)&self->_endKnob, 0);
  objc_storeStrong((id *)&self->_startKnob, 0);
  objc_storeStrong((id *)&self->_selectionHighlightView, 0);
  objc_storeStrong((id *)&self->_rowButton, 0);
  objc_storeStrong((id *)&self->_columnButton, 0);
  objc_storeStrong((id *)&self->_headerClipView, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);
  objc_storeStrong((id *)&self->_rowHeightCache, 0);
  objc_storeStrong((id *)&self->_columnWidthCache, 0);
  objc_storeStrong((id *)&self->_tableLayoutManager, 0);
  objc_storeStrong((id *)&self->_noteScrollView, 0);
  objc_storeStrong((id *)&self->_tableContentView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_draggingAppearance, 0);
  objc_storeStrong((id *)&self->_cellTimestampsBeforeMerge, 0);
  objc_destroyWeak((id *)&self->_noteTextLayoutManager);
  objc_destroyWeak((id *)&self->_noteLayoutManager);
  objc_storeStrong((id *)&self->_previousAXTableSelection, 0);
  objc_storeStrong((id *)&self->_columnsNeedingWidthUpdate, 0);
  objc_storeStrong((id *)&self->_undoCommands, 0);
  objc_storeStrong((id *)&self->_stringSelectionBeforeDrag, 0);
  objc_storeStrong((id *)&self->_stringSelectionBeforeMerge, 0);
  objc_storeStrong((id *)&self->_tableSelectionBeforeMerge, 0);
  objc_storeStrong((id *)&self->_rowsBeforeMerge, 0);
  objc_storeStrong((id *)&self->_columnsBeforeMerge, 0);
  objc_storeStrong((id *)&self->_visibleEmptyCellsBeforeMerge, 0);
  objc_storeStrong((id *)&self->_tableAttachmentProvider, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_currentlyEditingTextView, 0);
  objc_storeStrong((id *)&self->_currentlyEditingTextStorage, 0);
  objc_storeStrong((id *)&self->_activeTextView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_textViewManager, 0);
  objc_storeStrong((id *)&self->_tableSelection, 0);
  objc_storeStrong((id *)&self->_coalescingUndoGroupForStringDelegate, 0);

  objc_storeStrong((id *)&self->_undoTarget, 0);
}

- (_NSRange)characterRangeForRange:(_NSRange)a3 inString:(id)a4 forLayoutManager:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 attribute:@"SearchTableRow" atIndex:location effectiveRange:0];
  double v12 = [(ICTableAttachmentViewController *)self table];
  uint64_t v13 = objc_msgSend(v12, "identifierForRowAtIndex:", objc_msgSend(v11, "unsignedIntegerValue"));

  if ((ICInternalSettingsIsAsyncFindEnabled() & 1) == 0)
  {
    v19[0] = 0;
    v19[1] = 0;
    id v14 = (id)[v9 attribute:@"SearchTableColumn" atIndex:location effectiveRange:v19];
    location -= v19[0];
  }
  double v15 = [v10 columnTextStorage];
  uint64_t v16 = [v15 characterRangeForRowID:v13];

  NSUInteger v17 = v16 + location;
  NSUInteger v18 = length;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)columnGlyphRangeForRange:(_NSRange)a3 inString:(id)a4 forLayoutManager:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  uint64_t v10 = -[ICTableAttachmentViewController characterRangeForRange:inString:forLayoutManager:](self, "characterRangeForRange:inString:forLayoutManager:", location, length, a4, v9);
  uint64_t v12 = objc_msgSend(v9, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v11, 0);
  NSUInteger v14 = v13;

  NSUInteger v15 = v12;
  NSUInteger v16 = v14;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (location + length <= [v7 length])
  {
    id v9 = [v7 attribute:@"SearchTableColumn" atIndex:location effectiveRange:0];
    uint64_t v10 = v9;
    if (v9
      && (unint64_t v11 = [v9 unsignedIntegerValue],
          [(ICTableAttachmentViewController *)self table],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          unint64_t v13 = [v12 columnCount],
          v12,
          v11 < v13))
    {
      NSUInteger v14 = [(ICTableAttachmentViewController *)self table];
      NSUInteger v15 = objc_msgSend(v14, "identifierForColumnAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));

      NSUInteger v16 = [(ICTableAttachmentViewController *)self textViewManager];
      id v8 = [v16 textViewForColumn:v15 createIfNeeded:1];

      NSUInteger v17 = [v7 attribute:@"SearchTableRow" atIndex:location effectiveRange:0];
      NSUInteger v18 = v17;
      if (v17)
      {
        unint64_t v19 = [v17 unsignedIntegerValue];
        id v20 = [(ICTableAttachmentViewController *)self table];
        unint64_t v21 = [v20 rowCount];

        if (v19 < v21)
        {
          long long v22 = [(ICTableAttachmentViewController *)self table];
          long long v23 = objc_msgSend(v22, "identifierForRowAtIndex:", objc_msgSend(v18, "unsignedIntegerValue"));

          long long v24 = [(ICTableAttachmentViewController *)self textViewManager];
          [v24 ensureCellPositionForColumn:v15 andRow:v23];
        }
      }
    }
    else
    {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICTableAttachmentViewController(Findable) viewForRange:inFindableString:]", 1, 0, @"No findable view found, since string lacks column attribute" functionName simulateCrash showAlert format];
      id v8 = [(ICTableAttachmentViewController *)self view];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  objc_opt_class();
  id v8 = -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v7);
  id v9 = ICDynamicCast();

  objc_opt_class();
  uint64_t v10 = [v9 layoutManager];
  unint64_t v11 = ICDynamicCast();

  uint64_t v12 = -[ICTableAttachmentViewController columnGlyphRangeForRange:inString:forLayoutManager:](self, "columnGlyphRangeForRange:inString:forLayoutManager:", location, length, v7, v11);
  uint64_t v14 = v13;

  NSUInteger v15 = objc_msgSend(v11, "rectsForGlyphRange:", v12, v14);

  return v15;
}

- (void)scrollToRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a4;
  objc_opt_class();
  id v8 = -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v7);
  id v9 = ICDynamicCast();

  if (v9)
  {
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
    uint64_t v14 = -[ICTableAttachmentViewController rectsForRange:inFindableString:](self, "rectsForRange:inFindableString:", location, length, v7);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v18) CGRectValue];
          v40.origin.double x = v19;
          v40.origin.double y = v20;
          v40.size.double width = v21;
          v40.size.double height = v22;
          v38.origin.double x = x;
          v38.origin.double y = y;
          v38.size.double width = width;
          v38.size.double height = height;
          CGRect v39 = CGRectUnion(v38, v40);
          double x = v39.origin.x;
          double y = v39.origin.y;
          double width = v39.size.width;
          double height = v39.size.height;
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }
    long long v23 = [(ICTableAttachmentViewController *)self tableContentView];
    objc_msgSend(v23, "convertRect:fromView:", v9, x, y, width, height);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    -[ICTableAttachmentViewController scrollToRect:animated:completion:](self, "scrollToRect:animated:completion:", 0, 0, v25, v27, v29, v31);
  }
}

- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v19 = a4;
  id v9 = a5;
  objc_opt_class();
  uint64_t v10 = ICDynamicCast();

  objc_opt_class();
  unint64_t v11 = [v10 layoutManager];
  uint64_t v12 = ICDynamicCast();

  if (v12)
  {
    uint64_t v13 = -[ICTableAttachmentViewController columnGlyphRangeForRange:inString:forLayoutManager:](self, "columnGlyphRangeForRange:inString:forLayoutManager:", location, length, v19, v12);
    uint64_t v15 = v14;
    [v10 textContainerInset];
    double v17 = v16;
    [v10 textContainerInset];
    objc_msgSend(v12, "drawGlyphsForGlyphRange:atPoint:", v13, v15, v17, v18);
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 inFindableString:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  id v10 = a4;
  objc_opt_class();
  unint64_t v11 = -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v9);
  ICDynamicCast();
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  uint64_t v12 = [v18 layoutManager];
  uint64_t v13 = ICDynamicCast();

  uint64_t v14 = -[ICTableAttachmentViewController characterRangeForRange:inString:forLayoutManager:](self, "characterRangeForRange:inString:forLayoutManager:", location, length, v9, v13);
  uint64_t v16 = v15;

  double v17 = [v18 textStorage];
  objc_msgSend(v17, "replaceCharactersInRange:withString:", v14, v16, v10);

  [(ICTableAttachmentViewController *)self saveOnMainThread];
}

- (void)setSelectedRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  objc_opt_class();
  id v8 = -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v7);
  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v9 = [v14 layoutManager];
  id v10 = ICDynamicCast();

  uint64_t v11 = -[ICTableAttachmentViewController characterRangeForRange:inString:forLayoutManager:](self, "characterRangeForRange:inString:forLayoutManager:", location, length, v7, v10);
  uint64_t v13 = v12;

  objc_msgSend(v14, "setSelectedRange:", v11, v13);
}

- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = [(ICTableAttachmentViewController *)self textViewManager];
  id v8 = [v7 columnIDs];

  id v9 = (id)[v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v44;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v11);
        uint64_t v13 = [(ICTableAttachmentViewController *)self textViewManager];
        id v14 = [v13 textViewForColumn:v12];

        [v14 selectedRange];
        if (v15)
        {
          id v9 = v12;
          uint64_t v38 = 0;
          CGRect v39 = 0;
          id v19 = [v14 columnTextStorage];
          uint64_t v16 = objc_msgSend(v19, "rowAtIndex:rowRange:", objc_msgSend(v14, "selectedRange"), &v38);

          uint64_t v20 = [v14 selectedRange];
          uint64_t v21 = v38;
          [v14 selectedRange];
          uint64_t v17 = v22;

          uint64_t v18 = v20 - v21;
          goto LABEL_11;
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = (id)[v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  uint64_t v38 = 0;
  CGRect v39 = &v38;
  uint64_t v40 = 0x3010000000;
  uint64_t v41 = &unk_20C1E2BF2;
  long long v42 = xmmword_20C1794E0;
  if (v17)
  {
    long long v23 = [(ICTableAttachmentViewController *)self table];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __87__ICTableAttachmentViewController_Findable__selectedRangeWithinRange_inFindableString___block_invoke;
    v30[3] = &unk_2640BB8A8;
    id v31 = v6;
    id v24 = v23;
    id v32 = v24;
    id v33 = v9;
    id v34 = v16;
    long long v35 = &v38;
    uint64_t v36 = v18;
    uint64_t v37 = v17;
    objc_msgSend(v31, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v30);

    uint64_t v25 = v39[4];
    NSUInteger v26 = v39[5];
  }
  else
  {
    NSUInteger v26 = 0;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v38, 8);

  NSUInteger v27 = v25;
  NSUInteger v28 = v26;
  result.NSUInteger length = v28;
  result.NSUInteger location = v27;
  return result;
}

void __87__ICTableAttachmentViewController_Findable__selectedRangeWithinRange_inFindableString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v13 = [*(id *)(a1 + 32) attribute:@"SearchTableColumn" atIndex:a3 effectiveRange:0];
  id v8 = [*(id *)(a1 + 32) attribute:@"SearchTableRow" atIndex:a3 effectiveRange:0];
  id v9 = objc_msgSend(*(id *)(a1 + 40), "identifierForColumnAtIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "identifierForRowAtIndex:", objc_msgSend(v8, "unsignedIntegerValue"));
  if ([v9 isEqual:*(void *)(a1 + 48)]
    && [v10 isEqual:*(void *)(a1 + 56)])
  {
    uint64_t v11 = *(void *)(a1 + 80);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    *(void *)(v12 + 32) = *(void *)(a1 + 72) + a3;
    *(void *)(v12 + 40) = v11;
    *a5 = 1;
  }
}

- (void)tappedTableAtLocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v3 = [a1 table];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "tappedTableAtLocation: Unable to find cell for tapped location in table: %@", (uint8_t *)&v4, 0xCu);
}

- (void)moveNextLineAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "moveNextLine: row index not found", v2, v3, v4, v5, v6);
}

- (void)moveUpCellAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "moveUp: column or row index not found", v2, v3, v4, v5, v6);
}

- (void)moveDownCellAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "moveDown: column or row index not found", v2, v3, v4, v5, v6);
}

- (void)movePrevCellAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "movePrev: column or row index not found", v2, v3, v4, v5, v6);
}

- (void)moveNextCellAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "moveNext: column or row index not found", v2, v3, v4, v5, v6);
}

@end