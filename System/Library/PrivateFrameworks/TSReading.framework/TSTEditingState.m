@interface TSTEditingState
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellID;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)lastEditingCellID;
- ($CA3468F20078D5D2DB35E78E73CA60DA)editingCellRange;
- (BOOL)cellWasEditedInCurrentSession;
- (BOOL)editingCellInProxy;
- (BOOL)isDispatchingPreflight;
- (BOOL)isEndingEditingDueToCancelOperation;
- (BOOL)p_shouldSetCellPostFlight;
- (NSArray)coloredReferences;
- (TSKCommandController)commandController;
- (TSTCell)editingCell;
- (TSTEditingState)initWithTableInfo:(id)a3;
- (TSTSearchReference)searchReference;
- (TSTTableInfo)tableInfo;
- (TSTTableModel)tableModel;
- (TSTTableSelection)selection;
- (TSTTextStatisticsTracker)tracker;
- (TSWPStorage)editingStorage;
- (id)initForPasteboardFromSourceInfo:(id)a3 stylesheet:(id)a4;
- (id)prepareEditingStorageToEditCell:(id)a3;
- (id)storageForCellID:(id)a3;
- (int)editingMode;
- (int)previousEditingMode;
- (unsigned)lastColumnHitByTap;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)changeEditingMode:(int)a3;
- (void)dealloc;
- (void)didEndEditingDueToCancelOperation;
- (void)p_performRichTextStorageDOLC:(id)a3 newStorage:(id)a4;
- (void)p_registerStorageObserver;
- (void)p_unregisterStorageObserver;
- (void)setCellWasEditedInCurrentSession:(BOOL)a3;
- (void)setDispatchingPreflight:(BOOL)a3;
- (void)setEditingCell:(id)a3;
- (void)setEditingCellID:(id)a3;
- (void)setEditingCellInProxy:(BOOL)a3;
- (void)setEditingStorage:(id)a3;
- (void)setEndingEditingDueToCancelOperation:(BOOL)a3;
- (void)setLastColumnHitByTap:(unsigned __int8)a3;
- (void)setLastEditingCellID:(id)a3;
- (void)setSearchReference:(id)a3;
- (void)setSelection:(id)a3;
- (void)setTableInfo:(id)a3;
- (void)setTracker:(id)a3;
- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6;
- (void)willEndEditingDueToCancelOperation;
@end

@implementation TSTEditingState

- (TSTCell)editingCell
{
  return self->mEditingCell;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mEditingCellID;
}

- (void)setEditingCellID:(id)a3
{
  self->mEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (BOOL)cellWasEditedInCurrentSession
{
  return self->mCellWasEditedInCurrentSession;
}

- (void)setCellWasEditedInCurrentSession:(BOOL)a3
{
  self->mCellWasEditedInCurrentSession = a3;
}

- (TSTEditingState)initWithTableInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSTEditingState;
  result = -[TSPObject initWithContext:](&v5, sel_initWithContext_, [a3 context]);
  if (result)
  {
    result->mTableInfo = (TSTTableInfo *)a3;
    result->mEditingMode = 0;
    result->mSelection = 0;
    result->mSelectionReflectingEditingState = 0;
    result->mColoredReferences = 0;
    result->mEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
    result->mCellWasEditedInCurrentSession = 0;
  }
  return result;
}

- (void)setSearchReference:(id)a3
{
  mSearchReference = self->mSearchReference;
  if (mSearchReference != a3)
  {

    self->mSearchReference = (TSTSearchReference *)a3;
  }
}

- (id)initForPasteboardFromSourceInfo:(id)a3 stylesheet:(id)a4
{
  objc_super v5 = [(TSTEditingState *)self initWithTableInfo:a3];
  if (v5) {
    v5->mEditingStorage = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", -[TSPObject context](v5, "context"), &stru_26D688A48, 5, a4, -[TSTTableModel bodyTextStyle](-[TSTEditingState tableModel](v5, "tableModel"), "bodyTextStyle"), [a4 defaultListStyle], 0, 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  self->mEditingCell = 0;
  [(TSTEditingState *)self p_unregisterStorageObserver];
  [(TSWPStorage *)self->mEditingStorage removeObserver:self->mTracker];
  self->mTracker = 0;

  self->mEditingStorage = 0;
  self->mSelection = 0;

  self->mSelectionReflectingEditingState = 0;
  mColoredReferences = self->mColoredReferences;
  if (mColoredReferences)
  {

    self->mColoredReferences = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTEditingState;
  [(TSTEditingState *)&v4 dealloc];
}

- (void)p_performRichTextStorageDOLC:(id)a3 newStorage:(id)a4
{
  v6 = [(TSTTableInfo *)[(TSTEditingState *)self tableInfo] documentRoot];
  if ([a4 documentRoot])
  {
    if (v6 != (TSKDocumentRoot *)[a4 documentRoot])
    {
      v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSTEditingState p_performRichTextStorageDOLC:newStorage:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTEditingState.mm"), 223, @"expected equality between %s and %s", "documentRoot", "newStorage.documentRoot");
    }
  }
  else if (a4 && a4 != a3)
  {
    [a4 willBeAddedToDocumentRoot:v6 dolcContext:0];
    [a4 wasAddedToDocumentRoot:v6 dolcContext:0];
  }
  if (a3 && a4 != a3 && [a3 documentRoot])
  {
    if (v6 != (TSKDocumentRoot *)[a3 documentRoot])
    {
      v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSTEditingState p_performRichTextStorageDOLC:newStorage:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTEditingState.mm"), 231, @"expected equality between %s and %s", "documentRoot", "oldStorage.documentRoot");
    }
    [a3 willBeRemovedFromDocumentRoot:v6];
    [a3 wasRemovedFromDocumentRoot:v6];
  }
}

- (void)setEditingStorage:(id)a3
{
  if (self->mEditingStorage != a3)
  {
    [(TSPObject *)self willModify];
    [(TSTEditingState *)self p_unregisterStorageObserver];
    [(TSTEditingState *)self p_performRichTextStorageDOLC:self->mEditingStorage newStorage:a3];
    [(TSWPStorage *)self->mEditingStorage removeObserver:self->mTracker];

    self->mEditingStorage = (TSWPStorage *)a3;
    [(TSWPStorage *)self->mEditingStorage setParentInfo:[(TSTEditingState *)self tableInfo]];
    [(TSWPStorage *)self->mEditingStorage addObserver:self->mTracker];
    [(TSTEditingState *)self p_registerStorageObserver];
  }
}

- (void)setTableInfo:(id)a3
{
  self->mTableInfo = (TSTTableInfo *)a3;
  mEditingStorage = self->mEditingStorage;
  if (mEditingStorage) {
    -[TSWPStorage setParentInfo:](mEditingStorage, "setParentInfo:");
  }
}

- (TSTTableModel)tableModel
{
  return [(TSTTableInfo *)self->mTableInfo tableModel];
}

- (TSTTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (TSTTableSelection)selection
{
  return TSTEditingStateGetSelection(self, 1);
}

- (void)setSelection:(id)a3
{
}

- (void)setEditingCell:(id)a3
{
  mEditingCell = self->mEditingCell;
  if (mEditingCell != a3 && (unint64_t)a3 | (unint64_t)mEditingCell)
  {
    [(TSPObject *)self willModify];
    v6 = (TSTCell *)[a3 copy];
    v7 = v6;
    if (v6)
    {
      mCommentStorage = v6->mPrivate.mCommentStorage;
      if (mCommentStorage) {
        TSTCellSetCommentStorageClearingID((TSDCommentStorage *)v6, (TSDCommentStorage *)(id)[(TSDCommentStorage *)mCommentStorage copyWithContext:[(TSPObject *)self context]], 1);
      }
    }

    self->mEditingCell = v7;
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)editingCellRange
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v3 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTEditingState *)self editingCellID];
  unint64_t v4 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTEditingState *)self tableModel], *(_DWORD *)&v3);
  if ((_WORD)v4 == 0xFFFF) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  }
  BOOL v5 = (v4 & 0xFF0000) == 0xFF0000 || HIWORD(v4) == 0;
  if (v5 || (v4 & 0xFFFF00000000) == 0) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v4;
}

- (id)storageForCellID:(id)a3
{
  BOOL v5 = objc_alloc_init(TSTCell);
  uint64_t v6 = a3;
  if (TSTCellAtCellID((uint64_t)[(TSTEditingState *)self tableModel], *(_DWORD *)&a3, v5)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7 || *((unsigned __int8 *)&v5->mPrivate + 1) << 8 != 2304)
  {
    BOOL v9 = [(TSDDrawableInfo *)[(TSTEditingState *)self tableInfo] isThemeContent];
    uint64_t v10 = [(TSTTableInfo *)[(TSTEditingState *)self tableInfo] documentRoot];
    if (v9) {
      uint64_t v10 = [(TSKDocumentRoot *)v10 theme];
    }
    v11 = [(TSKDocumentRoot *)v10 stylesheet];
    TextStyleAtCellID = TSTTableGetTextStyleAtCellID((uint64_t *)[(TSTEditingState *)self tableModel], v6, 0);
    if (v5)
    {
      unsigned int v13 = *((unsigned __int8 *)&v5->mPrivate + 1);
      BOOL v14 = v13 > 7;
      int v15 = (1 << v13) & 0xA4;
      if (!v14 && v15 != 0)
      {
        id v17 = [(TSTMasterLayout *)[(TSTTableInfo *)[(TSTEditingState *)self tableInfo] masterLayout] accountingParagraphStylePropertyMapForCell:v5 atCellID:v6];
        if (v17) {
          TextStyleAtCellID = [(TSSStylesheet *)v11 variationOfStyle:TextStyleAtCellID propertyMap:v17];
        }
      }
    }
    int v18 = [(TSSStyle *)TextStyleAtCellID intValueForProperty:44];
    if (v18 == -1) {
      int v18 = [(TSSStyle *)[(TSTTableModel *)[(TSTEditingState *)self tableModel] tableStyle] intValueForProperty:798] == 1;
    }
    LODWORD(v21) = v18;
    uint64_t v8 = [[TSWPStorage alloc] initWithContext:[(TSPObject *)self context] string:NSStringForEditingWithTSTCell(v5) kind:5 stylesheet:v11 paragraphStyle:TextStyleAtCellID listStyle:[(TSSStylesheet *)v11 defaultListStyle] section:0 columnStyle:0 paragraphDirection:v21];
  }
  else
  {
    uint64_t v8 = [(TSWPStorage *)[(TSTRichTextPayload *)v5->mPrivate.mRichTextPayload storage] copyWithContext:[(TSPObject *)self context]];
  }
  v19 = v8;

  return v19;
}

- (id)prepareEditingStorageToEditCell:(id)a3
{
  return 0;
}

- (int)editingMode
{
  return self->mEditingMode;
}

- (void)changeEditingMode:(int)a3
{
  int mEditingMode = self->mEditingMode;
  if (mEditingMode != a3)
  {
    self->mPreviousEditingMode = mEditingMode;
    self->int mEditingMode = a3;

    self->mSelectionReflectingEditingState = 0;
    if (a3 != 6) {
      self->mEditingCellInProxy = 0;
    }
  }
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
}

- (void)p_registerStorageObserver
{
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "supportsContainedTextEditing"))
  {
    mEditingStorage = self->mEditingStorage;
    [(TSWPStorage *)mEditingStorage addObserver:self];
  }
}

- (void)p_unregisterStorageObserver
{
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  uint64_t v6 = [(TSTEditingState *)self editingStorage];

  [(TSWPStorage *)v6 adoptStylesheet:a3 withMapper:a4];
}

- (BOOL)p_shouldSetCellPostFlight
{
  if (([(TSKCommandController *)[(TSTEditingState *)self commandController] isUndoing] & 1) != 0
    || ([(TSKCommandController *)[(TSTEditingState *)self commandController] isRedoing] & 1) != 0)
  {
    return 0;
  }

  return [(TSTEditingState *)self cellWasEditedInCurrentSession];
}

- (void)willEndEditingDueToCancelOperation
{
}

- (void)didEndEditingDueToCancelOperation
{
}

- (TSWPStorage)editingStorage
{
  return self->mEditingStorage;
}

- (BOOL)editingCellInProxy
{
  return self->mEditingCellInProxy;
}

- (void)setEditingCellInProxy:(BOOL)a3
{
  self->mEditingCellInProxy = a3;
}

- (TSTSearchReference)searchReference
{
  return self->mSearchReference;
}

- (BOOL)isEndingEditingDueToCancelOperation
{
  return self->mEndingEditingDueToCancelOperation;
}

- (void)setEndingEditingDueToCancelOperation:(BOOL)a3
{
  self->mEndingEditingDueToCancelOperation = a3;
}

- (TSTTextStatisticsTracker)tracker
{
  return self->mTracker;
}

- (void)setTracker:(id)a3
{
  self->mTracker = (TSTTextStatisticsTracker *)a3;
}

- (unsigned)lastColumnHitByTap
{
  return self->mLastColumnHitByTap;
}

- (void)setLastColumnHitByTap:(unsigned __int8)a3
{
  self->mLastColumnHitByTap = a3;
}

- (int)previousEditingMode
{
  return self->mPreviousEditingMode;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)lastEditingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_lastEditingCellID;
}

- (void)setLastEditingCellID:(id)a3
{
  self->_lastEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (NSArray)coloredReferences
{
  return self->_coloredReferences;
}

- (TSKCommandController)commandController
{
  return self->_commandController;
}

- (BOOL)isDispatchingPreflight
{
  return self->_dispatchingPreflight;
}

- (void)setDispatchingPreflight:(BOOL)a3
{
  self->_dispatchingPreflight = a3;
}

@end