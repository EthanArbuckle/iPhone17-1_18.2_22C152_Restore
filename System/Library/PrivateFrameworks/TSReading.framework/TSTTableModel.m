@interface TSTTableModel
+ ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeForTableArea:(unsigned int)a3 givenTableSize:(id)a4 numberOfHeaderRows:(unsigned __int16)a5 numberOfFooterRows:(unsigned __int16)a6 numberOfHeaderColumns:(unsigned __int16)a7;
+ (id)unnamedTableString;
+ (unsigned)tableAreaForCellID:(id)a3 inTableWithHeaderColumns:(unsigned __int16)a4 headerRows:(unsigned __int16)a5 footerRows:(unsigned __int16)a6 totalRows:(unsigned __int16)a7;
- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyColumnRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyRowRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeForTableArea:(unsigned int)a3;
- ($CA3468F20078D5D2DB35E78E73CA60DA)footerRowRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)headerColumnRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)headerRowRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)minPopulatedCellRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)range;
- (BOOL)hasAlternatingRows;
- (BOOL)hasMergeRanges;
- (BOOL)hasTableBorder;
- (BOOL)headerColumnsFrozen;
- (BOOL)headerRowsFrozen;
- (BOOL)isColumnHidden:(unsigned __int8)a3 forAction:(int)a4;
- (BOOL)isRowHidden:(unsigned __int16)a3 forAction:(int)a4;
- (BOOL)repeatingHeaderColumnsEnabled;
- (BOOL)repeatingHeaderRowsEnabled;
- (BOOL)styleApplyClearsAll;
- (BOOL)tableNameBorderEnabled;
- (BOOL)tableNameEnabled;
- (BOOL)useBandedFill;
- (BOOL)wasUnarchivedFromAProvidedTable;
- (NSArray)columnWidths;
- (NSArray)rowHeights;
- (NSString)tableName;
- (TSDFill)backgroundFill;
- (TSDFill)bodyFill;
- (TSDFill)footerRowsFill;
- (TSDFill)headerColumnsFill;
- (TSDFill)headerRowsFill;
- (TSDStroke)bodyColumnStroke;
- (TSDStroke)bodyRowStroke;
- (TSDStroke)borderStrokeEvenIfNotVisible;
- (TSDStroke)footerRowBodyColumnStroke;
- (TSDStroke)footerRowBodyRowStroke;
- (TSDStroke)footerRowBorderStroke;
- (TSDStroke)footerRowSeparatorStroke;
- (TSDStroke)headerColumnBodyColumnStroke;
- (TSDStroke)headerColumnBodyRowStroke;
- (TSDStroke)headerColumnBorderStroke;
- (TSDStroke)headerColumnSeparatorStroke;
- (TSDStroke)headerRowBodyColumnStroke;
- (TSDStroke)headerRowBodyRowStroke;
- (TSDStroke)headerRowBorderStroke;
- (TSDStroke)headerRowSeparatorStroke;
- (TSDStroke)parentBorderStroke;
- (TSDStroke)tableNameBorderStroke;
- (TSKDocumentRoot)documentRoot;
- (TSTCell)defaultBodyCell;
- (TSTCell)defaultFooterRowCell;
- (TSTCell)defaultHeaderColumnCell;
- (TSTCell)defaultHeaderRowCell;
- (TSTCellDictionary)cellsPendingWrite;
- (TSTCellStyle)bodyCellStyle;
- (TSTCellStyle)footerRowCellStyle;
- (TSTCellStyle)headerColumnCellStyle;
- (TSTCellStyle)headerRowCellStyle;
- (TSTTableModel)init;
- (TSTTableModel)initWithContext:(id)a3 fromSourceModel:(id)a4 region:(id)a5 tableInfo:(id)a6;
- (TSTTableModel)initWithContext:(id)a3 rows:(unsigned __int16)a4 columns:(unsigned __int16)a5 styles:(id)a6 tableInfo:(id)a7;
- (TSTTableStyle)tableStyle;
- (TSWPParagraphStyle)bodyTextStyle;
- (TSWPParagraphStyle)footerRowTextStyle;
- (TSWPParagraphStyle)headerColumnTextStyle;
- (TSWPParagraphStyle)headerRowTextStyle;
- (TSWPParagraphStyle)tableNameStyle;
- (TSWPShapeStyle)tableNameShapeStyle;
- (__CFUUID)fromTableID;
- (__CFUUID)tableID;
- (double)tableNameHeight;
- (id)allRichTextPayloadStorages;
- (id)bandedFillObject;
- (id)cellRegionWithConditionalStyleMatchingCell:(id)a3;
- (id)dataStore;
- (id)defaultCellForTableArea:(unsigned int)a3;
- (id)defaultCellStyleForTableArea:(unsigned int)a3;
- (id)defaultTextStyleForTableArea:(unsigned int)a3;
- (id)mergedGridIndicesForDirection:(int)a3;
- (int)defaultCell:(id)a3 forTableArea:(unsigned int)a4;
- (int)hidingStateForColumn:(unsigned __int8)a3;
- (int)hidingStateForRow:(unsigned __int16)a3;
- (unint64_t)presetIndex;
- (unsigned)numberOfColumns;
- (unsigned)numberOfFooterRows;
- (unsigned)numberOfHeaderColumns;
- (unsigned)numberOfHeaderRows;
- (unsigned)numberOfHiddenColumns;
- (unsigned)numberOfHiddenRows;
- (unsigned)numberOfRows;
- (unsigned)numberOfUserHiddenColumns;
- (unsigned)numberOfUserHiddenRows;
- (unsigned)numberOfVisibleBodyColumns;
- (unsigned)numberOfVisibleBodyRows;
- (unsigned)tableAreaForCellID:(id)a3;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)dealloc;
- (void)defaultStrokesForCellID:(id)a3 inTableWithHeaderColumns:(unsigned __int16)a4 headerRows:(unsigned __int16)a5 footerRows:(unsigned __int16)a6 totalColumns:(unsigned __int16)a7 totalRows:(unsigned __int16)a8 tableArea:(unsigned int)a9 outTopStroke:(id *)a10 outLeftStroke:(id *)a11 outBottomStroke:(id *)a12 outRightStroke:(id *)a13;
- (void)defaultStrokesForCellID:(id)a3 outTopStroke:(id *)a4 outLeftStroke:(id *)a5 outBottomStroke:(id *)a6 outRightStroke:(id *)a7;
- (void)mapTableStylesToStylesheet:(id)a3 withMapper:(id)a4;
- (void)p_fetchCellHoldingReadLock:(void *)a3 returnCode:(void *)a4;
- (void)p_releaseExistingDefaultStyles;
- (void)p_scaleStrokeFromProperty:(int)a3 style:(id)a4 pmap:(id)a5 scale:(double)a6;
- (void)p_scaleStrokesOnCell:(id)a3 atCellID:(id)a4 transformedObjects:(id)a5 scale:(double)a6;
- (void)resetStyles:(id)a3;
- (void)setBodyCellStyle:(id)a3;
- (void)setBodyTextStyle:(id)a3;
- (void)setColumnWidths:(id)a3;
- (void)setDrawableIsBeingCopied:(BOOL)a3;
- (void)setFooterRowCellStyle:(id)a3;
- (void)setFooterRowTextStyle:(id)a3;
- (void)setHeaderColumnCellStyle:(id)a3;
- (void)setHeaderColumnTextStyle:(id)a3;
- (void)setHeaderColumnsFrozen:(BOOL)a3;
- (void)setHeaderRowCellStyle:(id)a3;
- (void)setHeaderRowTextStyle:(id)a3;
- (void)setHeaderRowsFrozen:(BOOL)a3;
- (void)setHeight:(double)a3 ofRow:(unsigned __int16)a4;
- (void)setNumberOfColumns:(unsigned __int16)a3;
- (void)setNumberOfFooterRows:(unsigned __int16)a3;
- (void)setNumberOfHeaderColumns:(unsigned __int16)a3;
- (void)setNumberOfHeaderRows:(unsigned __int16)a3;
- (void)setNumberOfRows:(unsigned __int16)a3;
- (void)setPresetIndex:(unint64_t)a3;
- (void)setRepeatingHeaderColumnsEnabled:(BOOL)a3;
- (void)setRepeatingHeaderRowsEnabled:(BOOL)a3;
- (void)setRowHeights:(id)a3;
- (void)setStorageParentToInfo:(id)a3;
- (void)setStyleApplyClearsAll:(BOOL)a3;
- (void)setTableID:(__CFUUID *)a3;
- (void)setTableName:(id)a3;
- (void)setTableNameBorderEnabled:(BOOL)a3;
- (void)setTableNameEnabled:(BOOL)a3;
- (void)setTableNameHeight:(double)a3;
- (void)setTableNameShapeStyle:(id)a3;
- (void)setTableNameStyle:(id)a3;
- (void)setTableStyle:(id)a3;
- (void)setWasUnarchivedFromAProvidedTable:(BOOL)a3;
- (void)setWidth:(double)a3 ofColumn:(unsigned __int8)a4;
- (void)setupDefaultCells;
- (void)transformStrokes:(CGAffineTransform *)a3 transformedObjects:(id)a4 inBounds:(CGRect)a5;
- (void)upgradeFromPreUFF;
- (void)validateStyles;
@end

@implementation TSTTableModel

+ (id)unnamedTableString
{
  if (+[TSTTableModel unnamedTableString]::onceToken != -1) {
    dispatch_once(&+[TSTTableModel unnamedTableString]::onceToken, &__block_literal_global_80);
  }
  return (id)+[TSTTableModel unnamedTableString]::sUnnamedTableString;
}

uint64_t __35__TSTTableModel_unnamedTableString__block_invoke()
{
  uint64_t v0 = [(id)TSTBundle() localizedStringForKey:@"Table %@" value:&stru_26D688A48 table:@"TSTables"];
  uint64_t v1 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26D73A7E8 numberStyle:1];
  uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", v0, v1);
  +[TSTTableModel unnamedTableString]::sUnnamedTableString = result;
  return result;
}

- (TSTTableModel)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSTTableModel init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 200, @"don't call -[TSTTableModel init] please");
  return 0;
}

- (void)p_releaseExistingDefaultStyles
{
  p_mStyles = &self->mStyles;

  p_mStyles->tableStyle = 0;
  p_mStyles->bodyCellStyle = 0;

  p_mStyles->headerRowCellStyle = 0;
  p_mStyles->headerColumnCellStyle = 0;

  p_mStyles->footerRowCellStyle = 0;
  p_mStyles->bodyTextStyle = 0;

  p_mStyles->headerRowTextStyle = 0;
  p_mStyles->headerColumnTextStyle = 0;

  p_mStyles->footerRowTextStyle = 0;
  p_mStyles->tableNameStyle = 0;

  p_mStyles->tableNameShapeStyle = 0;
}

- (void)resetStyles:(id)a3
{
  if (a3)
  {
    self->mStyles.tableStyle = (TSTTableStyle *)(id)[a3 tableStyle];
    self->mStyles.bodyCellStyle = (TSTCellStyle *)(id)[a3 bodyCellStyle];
    self->mStyles.headerRowCellStyle = (TSTCellStyle *)(id)[a3 headerRowCellStyle];
    self->mStyles.headerColumnCellStyle = (TSTCellStyle *)(id)[a3 headerColumnCellStyle];
    self->mStyles.footerRowCellStyle = (TSTCellStyle *)(id)[a3 footerRowCellStyle];
    self->mStyles.bodyTextStyle = (TSWPParagraphStyle *)(id)[a3 bodyTextStyle];
    self->mStyles.headerRowTextStyle = (TSWPParagraphStyle *)(id)[a3 headerRowTextStyle];
    self->mStyles.headerColumnTextStyle = (TSWPParagraphStyle *)(id)[a3 headerColumnTextStyle];
    self->mStyles.footerRowTextStyle = (TSWPParagraphStyle *)(id)[a3 footerRowTextStyle];
    self->mStyles.tableNameStyle = (TSWPParagraphStyle *)(id)[a3 tableNameStyle];
    self->mStyles.tableNameShapeStyle = (TSWPShapeStyle *)(id)[a3 tableNameShapeStyle];
    self->mPresetIndex = [a3 presetIndex];
  }
  else
  {
    NSLog((NSString *)@"no styles to init, this should be a crash but is not yet");
  }
}

- (void)setupDefaultCells
{
  [(TSPObject *)self willModify];
  p_mDefaultCells = (uint64_t *)&self->mDefaultCells;
  defaultBodyCell = self->mDefaultCells.defaultBodyCell;
  if (defaultBodyCell) {

  }
  defaultHeaderRowCell = self->mDefaultCells.defaultHeaderRowCell;
  if (defaultHeaderRowCell) {

  }
  defaultHeaderColumnCell = self->mDefaultCells.defaultHeaderColumnCell;
  if (defaultHeaderColumnCell) {

  }
  defaultFooterRowCell = self->mDefaultCells.defaultFooterRowCell;
  if (defaultFooterRowCell) {

  }
  uint64_t *p_mDefaultCells = (uint64_t)objc_alloc_init(TSTCell);
  self->mDefaultCells.defaultHeaderRowCell = objc_alloc_init(TSTCell);
  self->mDefaultCells.defaultHeaderColumnCell = objc_alloc_init(TSTCell);
  self->mDefaultCells.defaultFooterRowCell = objc_alloc_init(TSTCell);
  uint64_t v8 = *p_mDefaultCells;
  TSTCellClearValue(*p_mDefaultCells);
  *(_DWORD *)(v8 + 8) &= 0xFFFF00FF;
  uint64_t v9 = *p_mDefaultCells;
  v10 = [(TSTTableModel *)self bodyCellStyle];
  v11 = *(TSTCellStyle **)(v9 + 40);
  if (v11 != v10)
  {
    v12 = v10;

    *(void *)(v9 + 40) = v12;
    *(_DWORD *)(v9 + 32) = 0;
  }
  uint64_t v13 = *p_mDefaultCells;
  v14 = [(TSTTableModel *)self bodyTextStyle];
  v15 = *(TSWPParagraphStyle **)(v13 + 56);
  if (v15 != v14)
  {
    v16 = v14;

    *(void *)(v13 + 56) = v16;
    *(_DWORD *)(v13 + 48) = 0;
  }
  v17 = self->mDefaultCells.defaultHeaderRowCell;
  TSTCellClearValue((uint64_t)v17);
  *(_DWORD *)&v17->mPrivate &= 0xFFFF00FF;
  v18 = self->mDefaultCells.defaultHeaderRowCell;
  v19 = [(TSTTableModel *)self headerRowCellStyle];
  mCellStyle = v18->mPrivate.mCellStyle;
  if (mCellStyle != v19)
  {
    v21 = v19;

    v18->mPrivate.mCellStyle = v21;
    v18->mPrivate.mCellStyleID = 0;
  }
  v22 = self->mDefaultCells.defaultHeaderRowCell;
  v23 = [(TSTTableModel *)self headerRowTextStyle];
  mTextStyle = v22->mPrivate.mTextStyle;
  if (mTextStyle != v23)
  {
    v25 = v23;

    v22->mPrivate.mTextStyle = v25;
    v22->mPrivate.mTextStyleID = 0;
  }
  v26 = self->mDefaultCells.defaultHeaderColumnCell;
  TSTCellClearValue((uint64_t)v26);
  *(_DWORD *)&v26->mPrivate &= 0xFFFF00FF;
  v27 = self->mDefaultCells.defaultHeaderColumnCell;
  v28 = [(TSTTableModel *)self headerColumnCellStyle];
  v29 = v27->mPrivate.mCellStyle;
  if (v29 != v28)
  {
    v30 = v28;

    v27->mPrivate.mCellStyle = v30;
    v27->mPrivate.mCellStyleID = 0;
  }
  v31 = self->mDefaultCells.defaultHeaderColumnCell;
  v32 = [(TSTTableModel *)self headerColumnTextStyle];
  v33 = v31->mPrivate.mTextStyle;
  if (v33 != v32)
  {
    v34 = v32;

    v31->mPrivate.mTextStyle = v34;
    v31->mPrivate.mTextStyleID = 0;
  }
  v35 = self->mDefaultCells.defaultFooterRowCell;
  TSTCellClearValue((uint64_t)v35);
  *(_DWORD *)&v35->mPrivate &= 0xFFFF00FF;
  v36 = self->mDefaultCells.defaultFooterRowCell;
  v37 = [(TSTTableModel *)self footerRowCellStyle];
  v38 = v36->mPrivate.mCellStyle;
  if (v38 != v37)
  {
    v39 = v37;

    v36->mPrivate.mCellStyle = v39;
    v36->mPrivate.mCellStyleID = 0;
  }
  v40 = self->mDefaultCells.defaultFooterRowCell;
  v41 = [(TSTTableModel *)self footerRowTextStyle];
  v42 = v40->mPrivate.mTextStyle;
  if (v42 != v41)
  {
    v43 = v41;

    v40->mPrivate.mTextStyle = v43;
    v40->mPrivate.mTextStyleID = 0;
  }
}

- (TSTTableModel)initWithContext:(id)a3 rows:(unsigned __int16)a4 columns:(unsigned __int16)a5 styles:(id)a6 tableInfo:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)TSTTableModel;
  v10 = -[TSPObject initWithContext:](&v13, sel_initWithContext_, a3, a4, a5, a6, a7);
  if (v10)
  {
    id v11 = +[TSTConfiguration sharedTableConfiguration];
    v10->mNumberOfColumns = a5;
    v10->mNumberOfRows = a4;
    v10->mNumberOfHeaderColumns = 0;
    v10->mNumberOfHeaderRows = 0;
    v10->mNumberOfFooterRows = 0;
    v10->mHeaderRowsFrozen = 0;
    v10->mHeaderColumnsFrozen = 0;
    v10->mDefaultRowHeight = 22.0;
    v10->mDefaultColumnWidth = 98.0;
    v10->mNumberOfHiddenRows = 0;
    v10->mNumberOfHiddenColumns = 0;
    v10->mNumberOfUserHiddenRows = 0;
    v10->mNumberOfUserHiddenColumns = 0;
    v10->mNumberOfFilteredRows = 0;
    v10->mDataStore = [[TSTTableDataStore alloc] initWithOwner:v10];
    v10->mTableName = (NSString *)+[TSTTableModel unnamedTableString];
    v10->mTableNameEnabled = [v11 tableNameEnabledInNewTables];
    v10->mRepeatingHeaderRowsEnabled = 0;
    v10->mRepeatingHeaderColumnsEnabled = 0;
    v10->mTableID = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
    v10->mPresetIndex = [a6 presetIndex];
    v10->mCellsPendingWrite = objc_alloc_init(TSTCellDictionary);
    v10->mWasUnarchivedFromAProvidedTable = 0;
    [(TSTTableModel *)v10 resetStyles:a6];
    [(TSTTableModel *)v10 setupDefaultCells];
  }
  return v10;
}

- (TSTTableModel)initWithContext:(id)a3 fromSourceModel:(id)a4 region:(id)a5 tableInfo:(id)a6
{
  unint64_t v7 = (unint64_t)a5;
  unint64_t v10 = [a5 boundingCellRange];
  unint64_t v11 = HIWORD(v10);
  id v12 = +[TSTTableStyleNetwork networkFromTableModel:a4];
  if ([(id)v7 isRectangle]) {
    BOOL v13 = (([a4 range] ^ v10) & 0xFFFFFFFF00FFFFFFLL) == 0;
  }
  else {
    BOOL v13 = 0;
  }
  v14 = [(TSTTableModel *)self initWithContext:a3 rows:v11 columns:WORD2(v10) styles:v12 tableInfo:a6];
  if (v14)
  {
    if (a4)
    {
      v15 = (__CFUUID *)[a4 tableID];
      v14->mFromTableID = v15;
      CFRetain(v15);
    }
    v14->mRepeatingHeaderRowsEnabled = [a4 repeatingHeaderRowsEnabled];
    v14->mRepeatingHeaderColumnsEnabled = [a4 repeatingHeaderColumnsEnabled];
    v14->mHeaderRowsFrozen = [a4 headerRowsFrozen];
    v14->mHeaderColumnsFrozen = [a4 headerColumnsFrozen];
    Mutable = CFDictionaryCreateMutable(0, 1, 0, 0);
    CFDictionarySetValue(Mutable, (const void *)[a4 tableID], v14->mTableID);
    if ([a4 numberOfHeaderRows] <= (unsigned __int16)v10) {
      LOWORD(v17) = 0;
    }
    else {
      int v17 = [a4 numberOfHeaderRows] - v10;
    }
    p_mNumberOfHeaderRows = &v14->mNumberOfHeaderRows;
    v14->mNumberOfHeaderRows = v17;
    if (BYTE2(v10) >= [a4 numberOfHeaderColumns]) {
      LOWORD(v18) = 0;
    }
    else {
      int v18 = [a4 numberOfHeaderColumns] - BYTE2(v10);
    }
    p_mNumberOfHeaderColumns = &v14->mNumberOfHeaderColumns;
    v14->mNumberOfHeaderColumns = v18;
    int v19 = [a4 numberOfRows];
    if ((int)(v19 - [a4 numberOfFooterRows]) <= (unsigned __int16)(v10 + HIWORD(v10) - 1))
    {
      int v21 = [a4 numberOfRows];
      int v20 = v11 + v10 - v21 + [a4 numberOfFooterRows];
    }
    else
    {
      LOWORD(v20) = 0;
    }
    v14->mNumberOfFooterRows = v20;
    int mNumberOfRows = v14->mNumberOfRows;
    if (mNumberOfRows == (unsigned __int16)v20)
    {
      LOWORD(v20) = v20 - 1;
      v14->mNumberOfFooterRows = v20;
      int mNumberOfRows = v14->mNumberOfRows;
    }
    int v23 = *p_mNumberOfHeaderRows;
    if (v23 == mNumberOfRows)
    {
      LOWORD(v23) = mNumberOfRows - 1;
      unsigned __int16 *p_mNumberOfHeaderRows = mNumberOfRows - 1;
      LOWORD(v20) = v14->mNumberOfFooterRows;
      int mNumberOfRows = v14->mNumberOfRows;
    }
    if ((unsigned __int16)v20 + (unsigned __int16)v23 == mNumberOfRows) {
      v14->mNumberOfFooterRows = v20 - 1;
    }
    int v24 = *p_mNumberOfHeaderColumns;
    if (v24 == v14->mNumberOfColumns) {
      unsigned __int16 *p_mNumberOfHeaderColumns = v24 - 1;
    }
    v14->mTableNameEnabled = [a4 tableNameEnabled];
    if (v13)
    {
      -[TSTTableModel setTableName:](v14, "setTableName:", [a4 tableName]);
      -[TSTTableModel setTableNameBorderEnabled:](v14, "setTableNameBorderEnabled:", [a4 tableNameBorderEnabled]);
      [a4 tableNameHeight];
      -[TSTTableModel setTableNameHeight:](v14, "setTableNameHeight:");
      -[TSTTableModel setStyleApplyClearsAll:](v14, "setStyleApplyClearsAll:", [a4 styleApplyClearsAll]);
    }
    cf = Mutable;
    if (a4)
    {
      double v25 = *((double *)a4 + 12);
      [(TSPObject *)v14 willModify];
      v14->mDefaultRowHeight = v25;
      double v26 = *((double *)a4 + 13);
    }
    else
    {
      [(TSPObject *)v14 willModify];
      v14->mDefaultRowHeight = 10.0;
      double v26 = 0.0;
    }
    [(TSPObject *)v14 willModify];
    v14->mDefaultColumnWidth = v26;
    id v57 = a4;
    unint64_t v59 = v7;
    v27 = objc_msgSend(TSTTableMergeRangesForCellRegion((uint64_t)a4, (void *)v7), "iterator");
    if ([v27 hasNextMergeRegion])
    {
      uint64_t v28 = v10 & 0xFF0000;
      do
      {
        uint64_t v29 = objc_msgSend(v27, "nextMergeRegion", v57);
        unint64_t v7 = v29 - v10;
        uint64_t v30 = (v29 - v28) & 0xFF0000 | (unsigned __int16)(v29 - v10);
        int v31 = [(TSTTableModel *)v14 tableAreaForCellID:v30];
        if (v31 == 4)
        {
          int v32 = 1;
        }
        else
        {
          int v32 = v31;
          if (v31 == 5) {
            int v32 = 3;
          }
        }
        int v33 = [(TSTTableModel *)v14 tableAreaForCellID:(v29 - v28 + ((v29 & 0xFFFFFFFF00000000) >> 16) + 16711680) & 0xFF0000 | (unsigned __int16)(v7 + HIWORD(v29) - 1)];
        if (v33 == 4)
        {
          int v33 = 1;
        }
        else if (v33 == 5)
        {
          int v33 = 3;
        }
        if (v32 == v33) {
          goto LABEL_46;
        }
        v34 = &v14->mNumberOfHeaderRows;
        if (v32 != 1)
        {
          if (v32 != 2) {
            goto LABEL_44;
          }
          v34 = &v14->mNumberOfHeaderColumns;
        }
        unsigned __int16 *v34 = 0;
LABEL_44:
        if (v33 == 3) {
          v14->mNumberOfFooterRows = 0;
        }
LABEL_46:
        TSTTableDataStoreMerge(&v14->mDataStore->super.super.isa, v30 | v29 & 0xFFFFFFFF00000000);
      }
      while (([v27 hasNextMergeRegion] & 1) != 0);
    }
    v35 = [[TSTCellIterator alloc] initWithTableModel:v57 region:v59 flags:32];
    id v36 = a3;
    if (TSTCellIteratorGetNextCell(v35, v74))
    {
      while (1)
      {
        char v37 = v76;
        __int16 v38 = v75;
        v39 = v77;
        if (!v77) {
          goto LABEL_74;
        }
        if (*((unsigned __int8 *)&v77->mPrivate + 1) << 8 == 768)
        {
          if (v77->mPrivate.mValue.mString.mID)
          {
            v77->mPrivate.mValue.mString.mID = 0;
            v39 = v77;
            if (!v77) {
              goto LABEL_74;
            }
          }
        }
        if (v39->mPrivate.mRichTextPayloadID)
        {
          v39->mPrivate.mRichTextPayloadID = 0;
          v40 = [(TSTRichTextPayload *)v39->mPrivate.mRichTextPayload copyWithContext:v36];
          TSTCellSetRichTextPayloadClearingIDConvertToPlaintext((TSTRichTextPayload *)v77, v40, 1, 1);

          v39 = v77;
          if (!v77) {
            goto LABEL_74;
          }
        }
        if (v39->mPrivate.mCommentStorageID)
        {
          v39->mPrivate.mCommentStorageID = 0;
          v41 = (TSDCommentStorage *)[(TSDCommentStorage *)v39->mPrivate.mCommentStorage copyWithContext:v36];
          TSTCellSetCommentStorageClearingID((TSDCommentStorage *)v77, v41, 1);

          v39 = v77;
          if (!v77) {
            goto LABEL_74;
          }
        }
        if (!v39->mPrivate.mCellFormats.mCurrentCellFormatID) {
          goto LABEL_70;
        }
        v39->mPrivate.mCellFormats.mCurrentCellFormatID = 0;
        v39->mPrivate.mCellFormats.mNumberFormatID = 0;
        v39->mPrivate.mCellFormats.mCurrencyFormatID = 0;
        v39->mPrivate.mCellFormats.mDurationFormatID = 0;
        v39->mPrivate.mCellFormats.mDateFormatID = 0;
        v39->mPrivate.mCellFormats.mControlFormatID = 0;
        v39->mPrivate.mCellFormats.uint64_t mCustomFormatID = 0;
        v39->mPrivate.mCellFormats.mBaseFormatID = 0;
        v39->mPrivate.mCellFormats.mMultipleChoiceListFormatID = 0;
        char v73 = 0;
        __int16 v72 = 0;
        int mFormatType = v39->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
        int v42 = *(&v39->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType + 1);
        uint64_t mCustomFormatID = v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mCustomFormatStruct.mCustomFormatID;
        long long v45 = *(_OWORD *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
        int mDisplayFormatType = v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mControlFormatStruct.mDisplayFormatType;
        char v47 = *((unsigned char *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 28);
        char v48 = *((unsigned char *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 31);
        __int16 v72 = *(_WORD *)((char *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 29);
        char v73 = v48;
        if (mFormatType == 266)
        {
          v65[0] = 266;
          v65[1] = v42;
          uint64_t v66 = mCustomFormatID;
          long long v67 = v45;
          int v68 = mDisplayFormatType;
          char v69 = v47;
          __int16 v70 = v72;
          char v71 = v73;
          TSTCellSetFormatClearingID((uint64_t)v39, (uint64_t)v65, 1);
          goto LABEL_69;
        }
        mMultipleChoiceListFormatRef = v39->mPrivate.mCellFormats.mMultipleChoiceListFormatRef;
        if (mMultipleChoiceListFormatRef)
        {
          [(TSUFormatReferenceObject *)mMultipleChoiceListFormatRef getFormatStruct];
          int v50 = DWORD1(v85);
          uint64_t v51 = DWORD2(v85);
          long long v52 = v86;
          __int16 v72 = *(_WORD *)((char *)&v87 + 5);
          char v73 = HIBYTE(v87);
          if (v85 == 266) {
            break;
          }
        }
LABEL_69:
        v39 = v77;
        if (v77)
        {
LABEL_70:
          if (v39->mPrivate.mCellStyleID) {
            v39->mPrivate.mCellStyleID = 0;
          }
          if (v39->mPrivate.mTextStyleID) {
            v39->mPrivate.mTextStyleID = 0;
          }
        }
LABEL_74:
        unint64_t v7 = (unsigned __int16)(v38 - v10) | ((unint64_t)(v37 - BYTE2(v10)) << 16) | v7 & 0xFFFFFFFF00000000;
        TSTTableDataStoreSetCellAtCellID(v14->mDataStore, v39, v7);
        if ((TSTCellIteratorGetNextCell(v35, v74) & 1) == 0) {
          goto LABEL_75;
        }
      }
      char v58 = BYTE4(v87);
      int v60 = v87;
      v53 = v77;
      if (v77)
      {
        v54 = v77->mPrivate.mCellFormats.mMultipleChoiceListFormatRef;
        if (v54)
        {
          [(TSUFormatReferenceObject *)v54 getFormatStruct];
          if (v85 == 266 && *((void *)&v85 + 1) == v51) {
            goto LABEL_68;
          }
        }
        else
        {
          uint64_t v87 = 0;
          long long v85 = 0u;
          long long v86 = 0u;
        }

        id v55 = objc_alloc(MEMORY[0x263F7C850]);
        v78[0] = 266;
        v78[1] = v50;
        uint64_t v79 = v51;
        long long v80 = v52;
        int v81 = v60;
        char v82 = v58;
        __int16 v83 = v72;
        char v84 = v73;
        v53->mPrivate.mCellFormats.mMultipleChoiceListFormatRef = (TSUFormatReferenceObject *)[v55 initWithTSUFormatFormatStruct:v78];
        v53->mPrivate.mCellFormats.mMultipleChoiceListFormatID = 0;
      }
LABEL_68:
      id v36 = a3;
      goto LABEL_69;
    }
LABEL_75:

    CFRelease(cf);
  }
  return v14;
}

- (TSKDocumentRoot)documentRoot
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableModel;
  return (TSKDocumentRoot *)[(TSPObject *)&v3 documentRoot];
}

- (void)dealloc
{
  [(TSTTableModel *)self p_releaseExistingDefaultStyles];
  CFRelease(self->mTableID);
  mFromTableID = self->mFromTableID;
  if (mFromTableID) {
    CFRelease(mFromTableID);
  }

  self->mCellsPendingWrite = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSTTableModel;
  [(TSTTableModel *)&v4 dealloc];
}

- (void)setDrawableIsBeingCopied:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TSTTableModel *)self dataStore];

  [v4 setDrawableIsBeingCopied:v3];
}

- (NSString)tableName
{
  return self->mTableName;
}

- (void)setTableName:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mTableName = (NSString *)a3;
}

- (BOOL)tableNameEnabled
{
  return self->mTableNameEnabled;
}

- (void)setTableNameEnabled:(BOOL)a3
{
  self->mTableNameEnabled = a3;
}

- (BOOL)tableNameBorderEnabled
{
  return self->mTableNameBorderEnabled;
}

- (void)setTableNameBorderEnabled:(BOOL)a3
{
  self->mTableNameBorderEnabled = a3;
}

- (double)tableNameHeight
{
  return self->mTableNameHeight;
}

- (void)setTableNameHeight:(double)a3
{
  self->mTableNameHeight = a3;
}

- (BOOL)repeatingHeaderRowsEnabled
{
  return self->mRepeatingHeaderRowsEnabled;
}

- (void)setRepeatingHeaderRowsEnabled:(BOOL)a3
{
  self->mRepeatingHeaderRowsEnabled = a3;
}

- (BOOL)repeatingHeaderColumnsEnabled
{
  return self->mRepeatingHeaderColumnsEnabled;
}

- (void)setRepeatingHeaderColumnsEnabled:(BOOL)a3
{
  self->mRepeatingHeaderColumnsEnabled = a3;
}

- (BOOL)styleApplyClearsAll
{
  return self->mStyleApplyClearsAll;
}

- (void)setStyleApplyClearsAll:(BOOL)a3
{
  self->mStyleApplyClearsAll = a3;
}

- (unsigned)numberOfRows
{
  return self->mNumberOfRows;
}

- (void)setNumberOfRows:(unsigned __int16)a3
{
  self->int mNumberOfRows = a3;
}

- (unsigned)numberOfColumns
{
  return self->mNumberOfColumns;
}

- (void)setNumberOfColumns:(unsigned __int16)a3
{
  self->mNumberOfColumns = a3;
}

- (unsigned)numberOfHeaderRows
{
  return self->mNumberOfHeaderRows;
}

- (void)setNumberOfHeaderRows:(unsigned __int16)a3
{
  self->mNumberOfHeaderRows = a3;
}

- (unsigned)numberOfFooterRows
{
  return self->mNumberOfFooterRows;
}

- (void)setNumberOfFooterRows:(unsigned __int16)a3
{
  self->mNumberOfFooterRows = a3;
}

- (unsigned)numberOfHeaderColumns
{
  return self->mNumberOfHeaderColumns;
}

- (void)setNumberOfHeaderColumns:(unsigned __int16)a3
{
  self->mNumberOfHeaderColumns = a3;
}

- (unint64_t)presetIndex
{
  return self->mPresetIndex;
}

- (void)setPresetIndex:(unint64_t)a3
{
  self->mPresetIndex = a3;
}

- (BOOL)headerRowsFrozen
{
  return self->mHeaderRowsFrozen;
}

- (void)setHeaderRowsFrozen:(BOOL)a3
{
  self->mHeaderRowsFrozen = a3;
}

- (BOOL)headerColumnsFrozen
{
  return self->mHeaderColumnsFrozen;
}

- (void)setHeaderColumnsFrozen:(BOOL)a3
{
  self->mHeaderColumnsFrozen = a3;
}

- (TSTTableStyle)tableStyle
{
  return self->mStyles.tableStyle;
}

- (void)setTableStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mStyles.tableStyle = (TSTTableStyle *)a3;
}

- (TSTCellStyle)bodyCellStyle
{
  return self->mStyles.bodyCellStyle;
}

- (void)setBodyCellStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._identifier = (int64_t)a3;
}

- (TSTCellStyle)headerRowCellStyle
{
  return self->mStyles.headerRowCellStyle;
}

- (void)setHeaderRowCellStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._modifyObjectToken = (int64_t)a3;
}

- (TSTCellStyle)headerColumnCellStyle
{
  return self->mStyles.headerColumnCellStyle;
}

- (void)setHeaderColumnCellStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._unarchiverIdentifier = (int64_t)a3;
}

- (TSTCellStyle)footerRowCellStyle
{
  return self->mStyles.footerRowCellStyle;
}

- (void)setFooterRowCellStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._unknownContent = (TSPUnknownContent *)a3;
}

- (TSWPParagraphStyle)bodyTextStyle
{
  return self->mStyles.bodyTextStyle;
}

- (void)setBodyTextStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._delegate = (TSPObjectDelegate *)a3;
}

- (TSWPParagraphStyle)headerRowTextStyle
{
  return self->mStyles.headerRowTextStyle;
}

- (void)setHeaderRowTextStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->mDataStore = (TSTTableDataStore *)a3;
}

- (TSWPParagraphStyle)headerColumnTextStyle
{
  return self->mStyles.headerColumnTextStyle;
}

- (void)setHeaderColumnTextStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->mTableID = (__CFUUID *)a3;
}

- (TSWPParagraphStyle)footerRowTextStyle
{
  return self->mStyles.footerRowTextStyle;
}

- (void)setFooterRowTextStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->mFromTableID = (__CFUUID *)a3;
}

- (TSWPParagraphStyle)tableNameStyle
{
  return self->mStyles.tableNameStyle;
}

- (void)setTableNameStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  *(void *)&v4->int mNumberOfRows = a3;
}

- (TSWPShapeStyle)tableNameShapeStyle
{
  return self->mStyles.tableNameShapeStyle;
}

- (void)setTableNameShapeStyle:(id)a3
{
  id v4 = self;
  [(TSPObject *)self willModify];
  id v5 = a3;
  id v4 = (TSTTableModel *)((char *)v4 + 160);

  *(void *)&v4->mNumberOfFooterRows = a3;
}

- (BOOL)hasTableBorder
{
  return [(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796] != 0;
}

- (BOOL)hasAlternatingRows
{
  return [(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:769] != 0;
}

- (TSDStroke)tableNameBorderStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:782];
}

- (id)dataStore
{
  return self->mDataStore;
}

- (__CFUUID)tableID
{
  return self->mTableID;
}

- (void)setTableID:(__CFUUID *)a3
{
  self->mTableID = a3;
}

- (__CFUUID)fromTableID
{
  return self->mFromTableID;
}

- (TSTCell)defaultBodyCell
{
  return self->mDefaultCells.defaultBodyCell;
}

- (TSTCell)defaultFooterRowCell
{
  return self->mDefaultCells.defaultFooterRowCell;
}

- (TSTCell)defaultHeaderRowCell
{
  return self->mDefaultCells.defaultHeaderRowCell;
}

- (TSTCell)defaultHeaderColumnCell
{
  return self->mDefaultCells.defaultHeaderColumnCell;
}

- (BOOL)useBandedFill
{
  return [(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:769] != 0;
}

- (id)bandedFillObject
{
  v2 = [(TSTTableModel *)self tableStyle];

  return [(TSSStyle *)v2 valueForProperty:770];
}

- (void)setStorageParentToInfo:(id)a3
{
}

- (unsigned)tableAreaForCellID:(id)a3
{
  return +[TSTTableModel tableAreaForCellID:*(unsigned int *)&a3 inTableWithHeaderColumns:self->mNumberOfHeaderColumns headerRows:self->mNumberOfHeaderRows footerRows:self->mNumberOfFooterRows totalRows:self->mNumberOfRows];
}

+ (unsigned)tableAreaForCellID:(id)a3 inTableWithHeaderColumns:(unsigned __int16)a4 headerRows:(unsigned __int16)a5 footerRows:(unsigned __int16)a6 totalRows:(unsigned __int16)a7
{
  if (a3.var0 >= a7 - a6) {
    int v7 = 3;
  }
  else {
    int v7 = 0;
  }
  if (!a6) {
    int v7 = 0;
  }
  if (a3.var0 >= a5) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  if (a3.var0 >= a7 - a6) {
    int v9 = 5;
  }
  else {
    int v9 = 2;
  }
  if (a3.var0 >= a5) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = 4;
  }
  if (a4 > a3.var1) {
    return v10;
  }
  else {
    return v8;
  }
}

+ ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeForTableArea:(unsigned int)a3 givenTableSize:(id)a4 numberOfHeaderRows:(unsigned __int16)a5 numberOfFooterRows:(unsigned __int16)a6 numberOfHeaderColumns:(unsigned __int16)a7
{
  switch(a3)
  {
    case 0u:
      if ((unsigned __int16)(a4.var0 - a7) >= 0xFFu) {
        uint64_t v7 = 255;
      }
      else {
        uint64_t v7 = (unsigned __int16)(a4.var0 - a7);
      }
      unint64_t v8 = ((unint64_t)(a4.var1 - (a6 + a5)) << 48) | (v7 << 32) | a5 & 0xFF00FFFF | ((unint64_t)a7 << 16);
      break;
    case 1u:
      if ((unsigned __int16)(a4.var0 - a7) >= 0xFFu) {
        uint64_t v9 = 255;
      }
      else {
        uint64_t v9 = (unsigned __int16)(a4.var0 - a7);
      }
      unint64_t v8 = (a5 << 48) | (unint64_t)(v9 << 32) | ((unint64_t)a7 << 16);
      break;
    case 2u:
      if (a7 >= 0xFFu) {
        uint64_t v10 = 255;
      }
      else {
        uint64_t v10 = a7;
      }
      unint64_t v8 = (v10 << 32) | ((unint64_t)(a4.var1 - (a6 + a5)) << 48) | a5;
      break;
    case 3u:
      if ((unsigned __int16)(a4.var0 - a7) >= 0xFFu) {
        uint64_t v11 = 255;
      }
      else {
        uint64_t v11 = (unsigned __int16)(a4.var0 - a7);
      }
      unint64_t v8 = (a6 << 48) | (unint64_t)(v11 << 32) | (unsigned __int16)(a4.var1 - a6) | ((unint64_t)a7 << 16);
      break;
    case 4u:
      if (a7 >= 0xFFu) {
        uint64_t v12 = 255;
      }
      else {
        uint64_t v12 = a7;
      }
      unint64_t v8 = (a5 << 48) | (unint64_t)(v12 << 32);
      break;
    case 5u:
      if (a7 >= 0xFFu) {
        uint64_t v13 = 255;
      }
      else {
        uint64_t v13 = a7;
      }
      unint64_t v8 = (a5 << 48) | (unint64_t)(v13 << 32) | (unsigned __int16)(a4.var1 - a6);
      break;
    default:
      unint64_t v8 = 0xFFFFFFLL;
      break;
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v8;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeForTableArea:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_opt_class();
  unint64_t v6 = (unint64_t)[(TSTTableModel *)self range] >> 32;
  uint64_t v7 = [(TSTTableModel *)self numberOfHeaderRows];
  uint64_t v8 = [(TSTTableModel *)self numberOfFooterRows];
  uint64_t v9 = [(TSTTableModel *)self numberOfHeaderColumns];

  return ($CA3468F20078D5D2DB35E78E73CA60DA)[v5 cellRangeForTableArea:v3 givenTableSize:v6 numberOfHeaderRows:v7 numberOfFooterRows:v8 numberOfHeaderColumns:v9];
}

- (id)defaultCellForTableArea:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      id result = self->mDefaultCells.defaultBodyCell;
      break;
    case 1u:
    case 4u:
      id result = self->mDefaultCells.defaultHeaderRowCell;
      break;
    case 2u:
      id result = self->mDefaultCells.defaultHeaderColumnCell;
      break;
    case 3u:
    case 5u:
      id result = self->mDefaultCells.defaultFooterRowCell;
      break;
    default:
      id v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSTTableModel defaultCellForTableArea:]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 1670, @"illegal table region");
      id result = 0;
      break;
  }
  return result;
}

- (int)defaultCell:(id)a3 forTableArea:(unsigned int)a4
{
  return 0;
}

- (void)p_fetchCellHoldingReadLock:(void *)a3 returnCode:(void *)a4
{
  *(_DWORD *)a4 = TSTCellAtCellIDSuppressingFormula(*(void *)a3, *((_DWORD *)a3 + 2), *((void **)a3 + 2), 0);
}

- (id)defaultCellStyleForTableArea:(unsigned int)a3
{
  uint64_t v3 = [(TSTTableModel *)self defaultCellForTableArea:*(void *)&a3];
  if (v3) {
    return v3[5];
  }
  uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableModel defaultCellStyleForTableArea:]"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 2260, @"null default cell");
  return 0;
}

- (id)defaultTextStyleForTableArea:(unsigned int)a3
{
  uint64_t v3 = [(TSTTableModel *)self defaultCellForTableArea:*(void *)&a3];
  if (v3) {
    return v3[7];
  }
  uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableModel defaultTextStyleForTableArea:]"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 2327, @"null default cell");
  return 0;
}

- (void)setHeight:(double)a3 ofRow:(unsigned __int16)a4
{
}

- (void)setWidth:(double)a3 ofColumn:(unsigned __int8)a4
{
}

- (NSArray)rowHeights
{
  uint64_t v3 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:self->mNumberOfRows];
  if (self->mNumberOfRows)
  {
    int v4 = 0;
    do
      -[NSArray addObject:](v3, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", TSTTableHeightOfRow((uint64_t)self, (unsigned __int16)v4++, 0)));
    while (self->mNumberOfRows > (unsigned __int16)v4);
  }
  return v3;
}

- (NSArray)columnWidths
{
  uint64_t v3 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:self->mNumberOfColumns];
  if (self->mNumberOfColumns)
  {
    int v4 = 0;
    do
      -[NSArray addObject:](v3, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", TSTTableWidthOfColumn((uint64_t)self, v4++, 0)));
    while (self->mNumberOfColumns > v4);
  }
  return v3;
}

- (void)setColumnWidths:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__TSTTableModel_setColumnWidths___block_invoke;
  v3[3] = &unk_2646B36F8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

uint64_t __33__TSTTableModel_setColumnWidths___block_invoke(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a2, "tsu_CGFloatValue");

  return TSTTableSetWidthOfColumn(v4, a3, v5);
}

- (void)setRowHeights:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__TSTTableModel_setRowHeights___block_invoke;
  v3[3] = &unk_2646B36F8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

uint64_t __31__TSTTableModel_setRowHeights___block_invoke(uint64_t a1, void *a2, unsigned __int16 a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a2, "tsu_CGFloatValue");

  return TSTTableSetHeightOfRow(v4, a3, v5);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)range
{
  if (self->mNumberOfColumns >= 0xFFu) {
    uint64_t mNumberOfColumns = 255;
  }
  else {
    uint64_t mNumberOfColumns = self->mNumberOfColumns;
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((mNumberOfColumns << 32) | ((unint64_t)self->mNumberOfRows << 48));
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyRange
{
  uint64_t mNumberOfHeaderRows = self->mNumberOfHeaderRows;
  int v3 = mNumberOfHeaderRows + self->mNumberOfFooterRows;
  unint64_t v4 = mNumberOfHeaderRows & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)self->mNumberOfHeaderColumns << 16);
  uint64_t v5 = self->mNumberOfRows - v3;
  if ((unsigned __int16)(self->mNumberOfColumns - self->mNumberOfHeaderColumns) >= 0xFFu) {
    uint64_t v6 = 255;
  }
  else {
    uint64_t v6 = (unsigned __int16)(self->mNumberOfColumns - self->mNumberOfHeaderColumns);
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((v6 << 32) | (v5 << 48) | v4);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyColumnRange
{
  unsigned __int16 mNumberOfHeaderColumns = self->mNumberOfHeaderColumns;
  if ((unsigned __int16)(self->mNumberOfColumns - mNumberOfHeaderColumns) >= 0xFFu) {
    uint64_t v3 = 255;
  }
  else {
    uint64_t v3 = (unsigned __int16)(self->mNumberOfColumns - mNumberOfHeaderColumns);
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((v3 << 32) | ((unint64_t)self->mNumberOfRows << 48) | ((unint64_t)self->mNumberOfHeaderColumns << 16));
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyRowRange
{
  if (self->mNumberOfColumns >= 0xFFu) {
    uint64_t mNumberOfColumns = 255;
  }
  else {
    uint64_t mNumberOfColumns = self->mNumberOfColumns;
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((mNumberOfColumns << 32) | ((unint64_t)(self->mNumberOfRows
                                                                                          - (self->mNumberOfHeaderRows
                                                                                           + self->mNumberOfFooterRows)) << 48) | self->mNumberOfHeaderRows);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)headerRowRange
{
  if (self->mNumberOfHeaderRows)
  {
    if (self->mNumberOfColumns >= 0xFFu) {
      uint64_t mNumberOfColumns = 255;
    }
    else {
      uint64_t mNumberOfColumns = self->mNumberOfColumns;
    }
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(((unint64_t)self->mNumberOfHeaderRows << 48) | (mNumberOfColumns << 32));
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)headerColumnRange
{
  if (self->mNumberOfHeaderColumns)
  {
    if (self->mNumberOfHeaderColumns >= 0xFFu) {
      uint64_t mNumberOfHeaderColumns = 255;
    }
    else {
      uint64_t mNumberOfHeaderColumns = self->mNumberOfHeaderColumns;
    }
    return ($CA3468F20078D5D2DB35E78E73CA60DA)((mNumberOfHeaderColumns << 32) | ((unint64_t)self->mNumberOfRows << 48));
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)footerRowRange
{
  int mNumberOfFooterRows = self->mNumberOfFooterRows;
  if (self->mNumberOfFooterRows)
  {
    int mNumberOfHeaderRows = self->mNumberOfHeaderRows;
    if (self->mNumberOfRows - mNumberOfFooterRows >= mNumberOfHeaderRows) {
      LOWORD(mNumberOfHeaderRows) = self->mNumberOfRows - mNumberOfFooterRows;
    }
    unsigned int mNumberOfColumns = self->mNumberOfColumns;
    if (mNumberOfColumns >= 0xFF) {
      unsigned int mNumberOfColumns = 255;
    }
    return ($CA3468F20078D5D2DB35E78E73CA60DA)((unsigned __int16)mNumberOfHeaderRows | ((unint64_t)(mNumberOfColumns | (mNumberOfFooterRows << 16)) << 32));
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
}

- (BOOL)isRowHidden:(unsigned __int16)a3 forAction:(int)a4
{
  return (TSTHidingActionForRow((uint64_t)self, a3) & a4) != 0;
}

- (BOOL)isColumnHidden:(unsigned __int8)a3 forAction:(int)a4
{
  return (TSTHidingActionForColumn((uint64_t)self, a3) & a4) != 0;
}

- (int)hidingStateForRow:(unsigned __int16)a3
{
  return TSTHidingActionForRow((uint64_t)self, a3);
}

- (int)hidingStateForColumn:(unsigned __int8)a3
{
  return TSTHidingActionForColumn((uint64_t)self, a3);
}

- (unsigned)numberOfVisibleBodyRows
{
  unsigned __int16 mNumberOfHiddenRows = self->mNumberOfHiddenRows;
  if (mNumberOfHiddenRows)
  {
    if (self->mNumberOfHeaderRows)
    {
      $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTTableModel *)self headerRowRange];
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0 = v4.var0;
      int v6 = *(_DWORD *)&v4.var0 + *(_DWORD *)&v4.var1.var1 - 1;
      if ((unsigned __int16)(v4.var0.var0 + v4.var1.var1 - 1) >= v4.var0.var0)
      {
        do
        {
          mNumberOfHiddenRows -= TSTHidingActionForRow((uint64_t)self, var0.var0) != 0;
          ++*(_DWORD *)&var0;
        }
        while (var0.var0 <= (unsigned __int16)v6);
      }
    }
    if (self->mNumberOfFooterRows)
    {
      $CA3468F20078D5D2DB35E78E73CA60DA v7 = [(TSTTableModel *)self footerRowRange];
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v8 = v7.var0;
      int v9 = *(_DWORD *)&v7.var0 + *(_DWORD *)&v7.var1.var1 - 1;
      if ((unsigned __int16)(v7.var0.var0 + v7.var1.var1 - 1) >= v7.var0.var0)
      {
        do
        {
          mNumberOfHiddenRows -= TSTHidingActionForRow((uint64_t)self, v8.var0) != 0;
          ++*(_DWORD *)&v8;
        }
        while (v8.var0 <= (unsigned __int16)v9);
      }
    }
  }
  return ((unint64_t)[(TSTTableModel *)self bodyRowRange] >> 48) - mNumberOfHiddenRows;
}

- (unsigned)numberOfVisibleBodyColumns
{
  unsigned __int16 mNumberOfHiddenColumns = self->mNumberOfHiddenColumns;
  if (mNumberOfHiddenColumns)
  {
    if (self->mNumberOfHeaderColumns)
    {
      $CA3468F20078D5D2DB35E78E73CA60DA v4 = [(TSTTableModel *)self headerColumnRange];
      unsigned int v5 = *(_DWORD *)&v4.var1 + HIWORD(*(_DWORD *)&v4.var0) + 255;
      if (v4.var0.var1 <= (LOBYTE(v4.var1.var0) + v4.var0.var1 - 1))
      {
        unint64_t v6 = *(unint64_t *)&v4 >> 16;
        do
        {
          mNumberOfHiddenColumns -= TSTHidingActionForColumn((uint64_t)self, v6) != 0;
          LODWORD(v6) = v6 + 1;
        }
        while (v6 <= v5);
      }
    }
  }
  return ((unint64_t)[(TSTTableModel *)self bodyColumnRange] >> 32) - mNumberOfHiddenColumns;
}

- (BOOL)hasMergeRanges
{
  return TSTTableDataStoreHasMergeRanges((uint64_t)self->mDataStore);
}

- (id)mergedGridIndicesForDirection:(int)a3
{
  return (id)TSTTableDataStoreMergedGridIndicesForDirection((uint64_t)self->mDataStore, *(uint64_t *)&a3);
}

- (TSDFill)backgroundFill
{
  return 0;
}

- (TSDFill)bodyFill
{
  v2 = [(TSTTableModel *)self bodyCellStyle];

  return (TSDFill *)[(TSSStyle *)v2 valueForProperty:898];
}

- (TSDFill)headerColumnsFill
{
  v2 = [(TSTTableModel *)self headerColumnCellStyle];

  return (TSDFill *)[(TSSStyle *)v2 valueForProperty:898];
}

- (TSDFill)headerRowsFill
{
  v2 = [(TSTTableModel *)self headerRowCellStyle];

  return (TSDFill *)[(TSSStyle *)v2 valueForProperty:898];
}

- (TSDFill)footerRowsFill
{
  v2 = [(TSTTableModel *)self footerRowCellStyle];

  return (TSDFill *)[(TSSStyle *)v2 valueForProperty:898];
}

- (TSDStroke)borderStrokeEvenIfNotVisible
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:771];
}

- (TSDStroke)parentBorderStroke
{
  uint64_t v3 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] parent];
  if (!v3) {
    uint64_t v3 = [(TSTTableModel *)self tableStyle];
  }

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:771];
}

- (TSDStroke)bodyColumnStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:788]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:774];
}

- (TSDStroke)bodyRowStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:789]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:773];
}

- (TSDStroke)headerColumnBorderStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:778];
}

- (TSDStroke)headerColumnBodyColumnStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:777];
}

- (TSDStroke)headerColumnBodyRowStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:793]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:776];
}

- (TSDStroke)headerColumnSeparatorStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:775];
}

- (TSDStroke)headerRowBorderStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:782];
}

- (TSDStroke)headerRowBodyColumnStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:791]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:780];
}

- (TSDStroke)headerRowBodyRowStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:781];
}

- (TSDStroke)headerRowSeparatorStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:779];
}

- (TSDStroke)footerRowBorderStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:786];
}

- (TSDStroke)footerRowBodyColumnStroke
{
  if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:795]) {
    return 0;
  }
  uint64_t v3 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v3 valueForProperty:784];
}

- (TSDStroke)footerRowBodyRowStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:785];
}

- (TSDStroke)footerRowSeparatorStroke
{
  v2 = [(TSTTableModel *)self tableStyle];

  return (TSDStroke *)[(TSSStyle *)v2 valueForProperty:783];
}

- (void)defaultStrokesForCellID:(id)a3 outTopStroke:(id *)a4 outLeftStroke:(id *)a5 outBottomStroke:(id *)a6 outRightStroke:(id *)a7
{
  uint64_t v11 = a3;
  LODWORD(v12) = [(TSTTableModel *)self tableAreaForCellID:*(unsigned int *)&a3];
  [(TSTTableModel *)self defaultStrokesForCellID:v11 inTableWithHeaderColumns:[(TSTTableModel *)self numberOfHeaderColumns] headerRows:[(TSTTableModel *)self numberOfHeaderRows] footerRows:[(TSTTableModel *)self numberOfFooterRows] totalColumns:[(TSTTableModel *)self numberOfColumns] totalRows:[(TSTTableModel *)self numberOfRows] tableArea:v12 outTopStroke:a4 outLeftStroke:a5 outBottomStroke:a6 outRightStroke:a7];
}

- (void)defaultStrokesForCellID:(id)a3 inTableWithHeaderColumns:(unsigned __int16)a4 headerRows:(unsigned __int16)a5 footerRows:(unsigned __int16)a6 totalColumns:(unsigned __int16)a7 totalRows:(unsigned __int16)a8 tableArea:(unsigned int)a9 outTopStroke:(id *)a10 outLeftStroke:(id *)a11 outBottomStroke:(id *)a12 outRightStroke:(id *)a13
{
  int v13 = a8;
  int v43 = a7;
  unsigned __int16 var0 = a3.var0;
  uint64_t v16 = *(void *)&a3.var0 >> 16;
  int v17 = a5;
  int v18 = a4;
  switch(a9)
  {
    case 0u:
      if (!a10) {
        goto LABEL_57;
      }
      double v26 = [(TSTTableModel *)self tableStyle];
      if (v17 == var0 && v17)
      {
        uint64_t v27 = 779;
LABEL_41:
        id v31 = [(TSSStyle *)v26 valueForProperty:v27];
        goto LABEL_56;
      }
      if ([(TSSStyle *)v26 intValueForProperty:789])
      {
        double v26 = [(TSTTableModel *)self tableStyle];
        uint64_t v27 = 773;
        goto LABEL_41;
      }
      id v31 = 0;
LABEL_56:
      *a10 = v31;
LABEL_57:
      if (a12)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:789])
        {
          id v33 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:773];
        }
        else
        {
          id v33 = 0;
        }
        *a12 = v33;
      }
      if (!a11) {
        goto LABEL_71;
      }
      v34 = [(TSTTableModel *)self tableStyle];
      if (v18 && v16 == v18)
      {
        uint64_t v35 = 775;
LABEL_68:
        id v36 = [(TSSStyle *)v34 valueForProperty:v35];
        goto LABEL_70;
      }
      if ([(TSSStyle *)v34 intValueForProperty:788])
      {
        v34 = [(TSTTableModel *)self tableStyle];
        uint64_t v35 = 774;
        goto LABEL_68;
      }
      id v36 = 0;
LABEL_70:
      *a11 = v36;
LABEL_71:
      if (a13)
      {
        if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:788])goto LABEL_75; {
        uint64_t v29 = [(TSTTableModel *)self tableStyle];
        }
        uint64_t v30 = 774;
        goto LABEL_74;
      }
LABEL_77:
      if (a10) {
        BOOL v38 = var0 == 0;
      }
      else {
        BOOL v38 = 0;
      }
      if (v38)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796])
        {
          id v39 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:771];
        }
        else
        {
          id v39 = 0;
        }
        *a10 = v39;
      }
      if (a12 && var0 == v13 - 1)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796])
        {
          id v40 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:771];
        }
        else
        {
          id v40 = 0;
        }
        *a12 = v40;
      }
      if (a11 && !(_BYTE)v16)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796])
        {
          id v41 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:771];
        }
        else
        {
          id v41 = 0;
        }
        *a11 = v41;
      }
      if (a13 && v16 == v43 - 1)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:796])
        {
          id v42 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:771];
        }
        else
        {
          id v42 = 0;
        }
        *a13 = v42;
      }
      return;
    case 1u:
    case 4u:
      if (a10) {
        *a10 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:781];
      }
      if (a12)
      {
        int v19 = [(TSTTableModel *)self tableStyle];
        if (v17 - 1 == var0) {
          uint64_t v20 = 779;
        }
        else {
          uint64_t v20 = 781;
        }
        *a12 = [(TSSStyle *)v19 valueForProperty:v20];
      }
      if (a11)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:791])
        {
          id v21 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:780];
        }
        else
        {
          id v21 = 0;
        }
        *a11 = v21;
      }
      if (a13)
      {
        if (![(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:791])goto LABEL_75; {
        uint64_t v29 = [(TSTTableModel *)self tableStyle];
        }
        uint64_t v30 = 780;
        goto LABEL_74;
      }
      goto LABEL_77;
    case 2u:
      if (a10)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:793])
        {
          id v28 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:776];
        }
        else
        {
          id v28 = 0;
        }
        *a10 = v28;
      }
      if (a12)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:793])
        {
          id v32 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:776];
        }
        else
        {
          id v32 = 0;
        }
        *a12 = v32;
      }
      if (a11) {
        *a11 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:777];
      }
      if (a13)
      {
        uint64_t v29 = [(TSTTableModel *)self tableStyle];
        if (v18 - 1 == v16) {
          uint64_t v30 = 775;
        }
        else {
          uint64_t v30 = 777;
        }
        goto LABEL_74;
      }
      goto LABEL_77;
    case 3u:
    case 5u:
      if (a10)
      {
        int v22 = a8 - a6;
        int v23 = [(TSTTableModel *)self tableStyle];
        if (v22 == var0) {
          uint64_t v24 = 783;
        }
        else {
          uint64_t v24 = 785;
        }
        *a10 = [(TSSStyle *)v23 valueForProperty:v24];
      }
      if (a12) {
        *a12 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:785];
      }
      if (a11)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:795])
        {
          id v25 = [(TSSStyle *)[(TSTTableModel *)self tableStyle] valueForProperty:784];
        }
        else
        {
          id v25 = 0;
        }
        *a11 = v25;
      }
      if (a13)
      {
        if ([(TSSStyle *)[(TSTTableModel *)self tableStyle] intValueForProperty:795])
        {
          uint64_t v29 = [(TSTTableModel *)self tableStyle];
          uint64_t v30 = 784;
LABEL_74:
          id v37 = [(TSSStyle *)v29 valueForProperty:v30];
        }
        else
        {
LABEL_75:
          id v37 = 0;
        }
        *a13 = v37;
      }
      goto LABEL_77;
    default:
      goto LABEL_77;
  }
}

- (id)cellRegionWithConditionalStyleMatchingCell:(id)a3
{
  unsigned int v5 = TSTTableDataStoreCellStorageRefAtCellID((uint64_t)[(TSTTableModel *)self dataStore], *(_DWORD *)&a3);
  if (!v5) {
    return 0;
  }
  if ((v5[5] & 4) != 0)
  {
    Element = (unsigned int *)TSTCellStorageGetElement((uint64_t)v5, 1024);
    if (!Element)
    {
      $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"TSTTableDataListKey TSTCellStorageConditionalStyleSetID(TSTCellStorage *)"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStorage.h"), 212, @"Can't get conditional style ID storage element!");
    }
    uint64_t v6 = *Element;
  }
  else
  {
    uint64_t v6 = 0;
  }
  unsigned int v10 = TSTTableDataStoreConditionalStyleRefCountForKey((uint64_t)[(TSTTableModel *)self dataStore], v6);
  if (!v6) {
    return 0;
  }
  unsigned int v11 = v10;
  uint64_t v12 = [[TSTEphemeralCellMap alloc] initWithCapacity:[(TSTTableModel *)self numberOfRows]* (unint64_t)[(TSTTableModel *)self numberOfColumns]];
  int v13 = [[TSTCellIterator alloc] initWithTableModel:self region:+[TSTCellRegion regionFromRange:[(TSTTableModel *)self range]] flags:34];
  if (TSTCellIteratorGetNextCell(v13, v25))
  {
    unint64_t v14 = v11;
    if (v11)
    {
      unint64_t v15 = 0;
      do
      {
        if (!v27) {
          goto LABEL_20;
        }
        if ((*(unsigned char *)(v27 + 5) & 4) != 0)
        {
          int v17 = (int *)TSTCellStorageGetElement(v27, 1024);
          if (!v17)
          {
            int v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v19 = [NSString stringWithUTF8String:"TSTTableDataListKey TSTCellStorageConditionalStyleSetID(TSTCellStorage *)"];
            objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStorage.h"), 212, @"Can't get conditional style ID storage element!");
          }
          int v16 = *v17;
        }
        else
        {
          int v16 = 0;
        }
        if (v16 == v6)
        {
          unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v26;
          [(TSTEphemeralCellMap *)v12 addCell:0 andCellID:v3];
          ++v15;
        }
        else
        {
LABEL_20:
          if ((_WORD)v28 != 0xFFFF
            && (v28 & 0xFF0000) != 0xFF0000
            && v29 >= 0x10000
            && (unsigned __int16)v29 != 0
            && ((v26 ^ v28) & 0xFFFFFF) != 0)
          {
            unint64_t v24 = v24 & 0xFFFFFFFF00000000 | v28;
            if (-[TSTEphemeralCellMap containsCellID:](v12, "containsCellID:"))
            {
              unint64_t v23 = v23 & 0xFFFFFFFF00000000 | v26;
              -[TSTEphemeralCellMap addCell:andCellID:](v12, "addCell:andCellID:", 0);
            }
          }
        }
      }
      while (TSTCellIteratorGetNextCell(v13, v25) && v15 < v14);
    }
  }

  id v21 = +[TSTCellRegion regionFromCellMap:v12];
  return v21;
}

- (void)mapTableStylesToStylesheet:(id)a3 withMapper:(id)a4
{
  id v6 = +[TSTTableStyleNetwork networkFromTableModel:self];
  uint64_t v12 = [[TSTTableStyleNetwork alloc] initWithContext:[(TSPObject *)self context]];
  -[TSTTableStyleNetwork setPresetIndex:](v12, "setPresetIndex:", [v6 presetIndex]);
  -[TSTTableStyleNetwork setTableStyle:](v12, "setTableStyle:", objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "tableStyle")));
  objc_opt_class();
  objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "tableNameStyle"));
  [(TSTTableStyleNetwork *)v12 setTableNameStyle:TSUDynamicCast()];
  -[TSTTableStyleNetwork setTableNameShapeStyle:](v12, "setTableNameShapeStyle:", objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "tableNameShapeStyle")));
  uint64_t v7 = 0;
  do
  {
    -[TSTTableStyleNetwork setCellStyle:forTableArea:](v12, "setCellStyle:forTableArea:", objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "cellStyleForTableArea:", v7)), v7);
    uint64_t v8 = [v6 textStyleForTableArea:v7];
    objc_opt_class();
    [a4 mappedStyleForStyle:v8];
    uint64_t v9 = TSUDynamicCast();
    if (!v9)
    {
      unsigned int v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSTTableModel mapTableStylesToStylesheet:withMapper:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 5402, @"invalid nil value for '%s'", "targetStyle");
    }
    [(TSTTableStyleNetwork *)v12 setTextStyle:v9 forTableArea:v7];
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 4);
  [(TSTTableModel *)self resetStyles:v12];
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  -[TSTTableModel mapTableStylesToStylesheet:withMapper:](self, "mapTableStylesToStylesheet:withMapper:");
  [(TSTTableModel *)self setupDefaultCells];
  uint64_t v7 = [[TSTCellIterator alloc] initWithTableModel:self flags:48];
  uint64_t v8 = [[TSTEphemeralCellMap alloc] initWithCapacity:self->mNumberOfColumns * (unint64_t)self->mNumberOfRows];
  if (TSTCellIteratorGetNextCell(v7, v29))
  {
    do
    {
      uint64_t v9 = v31;
      if (v31)
      {
        uint64_t v10 = *(void *)(v31 + 40);
        BOOL v11 = v10 != 0;
        if (v10)
        {
          uint64_t v12 = objc_msgSend(a4, "mappedStyleForStyle:");
          int v13 = *(void **)(v9 + 40);
          if (v13 != (void *)v12)
          {
            unint64_t v14 = (void *)v12;

            *(void *)(v9 + 40) = v14;
            *(_DWORD *)(v9 + 32) = 0;
          }
        }
        uint64_t v15 = *(void *)(v9 + 56);
        if (v15)
        {
          objc_opt_class();
          [a4 mappedStyleForStyle:v15];
          uint64_t v16 = TSUDynamicCast();
          int v17 = *(void **)(v9 + 56);
          if (v17 != (void *)v16)
          {
            int v18 = (void *)v16;

            *(void *)(v9 + 56) = v18;
            *(_DWORD *)(v9 + 48) = 0;
          }
        }
        uint64_t v19 = *(void **)(v9 + 72);
        if (v19 || *(_DWORD *)(v9 + 64)) {
          objc_msgSend((id)objc_msgSend(v19, "storage"), "adoptStylesheet:withMapper:", a3, a4);
        }
        if (v11)
        {
LABEL_16:
          unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v30;
          [(TSTEphemeralCellMap *)v8 addCell:v9 andCellID:v4];
          continue;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      if (v15) {
        goto LABEL_16;
      }
    }
    while ((TSTCellIteratorGetNextCell(v7, v29) & 1) != 0);
  }
  TSTTableSetCellsWithCellMapIgnoringFormulas((uint64_t)self, v8);

  if ([(TSTTableModel *)self numberOfRows])
  {
    unsigned __int16 v20 = 0;
    do
    {
      uint64_t v21 = TSTTableDataStoreHeaderInfoForRow((uint64_t)self->mDataStore, v20, 0, 0);
      if (v21)
      {
        uint64_t v22 = v21;
        if (*(void *)(v21 + 8))
        {
          uint64_t v23 = *(void *)(v21 + 16);
          *(void *)(v21 + 8) = (id)objc_msgSend(a4, "mappedStyleForStyle:");
          *(void *)(v22 + 16) = (id)[a4 mappedStyleForStyle:v23];
        }
      }
      ++v20;
    }
    while ([(TSTTableModel *)self numberOfRows] > v20);
  }
  if ([(TSTTableModel *)self numberOfColumns])
  {
    unsigned __int8 v24 = 0;
    do
    {
      uint64_t v25 = TSTTableDataStoreHeaderInfoForColumn((uint64_t)self->mDataStore, v24, 0, 0);
      if (v25)
      {
        uint64_t v26 = v25;
        if (*(void *)(v25 + 8))
        {
          uint64_t v27 = *(void *)(v25 + 16);
          *(void *)(v25 + 8) = (id)objc_msgSend(a4, "mappedStyleForStyle:");
          *(void *)(v26 + 16) = (id)[a4 mappedStyleForStyle:v27];
        }
      }
      ++v24;
    }
    while ([(TSTTableModel *)self numberOfColumns] > v24);
  }
}

- (void)validateStyles
{
  [(TSTTableStyle *)[(TSTTableModel *)self tableStyle] validate];
  [(TSTCellStyle *)[(TSTTableModel *)self bodyCellStyle] validate];
  [(TSTCellStyle *)[(TSTTableModel *)self headerRowCellStyle] validate];
  [(TSTCellStyle *)[(TSTTableModel *)self headerColumnCellStyle] validate];
  [(TSTCellStyle *)[(TSTTableModel *)self footerRowCellStyle] validate];
  unint64_t v3 = [[TSTCellIterator alloc] initWithTableModel:self];
  if (TSTCellIteratorGetNextCell(v3, v5))
  {
    do
    {
      if (v6) {
        unint64_t v4 = *(void **)(v6 + 40);
      }
      else {
        unint64_t v4 = 0;
      }
      [v4 validate];
    }
    while ((TSTCellIteratorGetNextCell(v3, v5) & 1) != 0);
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)minPopulatedCellRange
{
  uint64_t v2 = self->mNumberOfHeaderRows + 1;
  if ((unsigned __int16)(self->mNumberOfHeaderColumns + 1) >= 0xFFu) {
    unsigned __int16 v3 = 255;
  }
  else {
    unsigned __int16 v3 = self->mNumberOfHeaderColumns + 1;
  }
  unsigned int mNumberOfColumns = self->mNumberOfColumns;
  int mNumberOfRows = self->mNumberOfRows;
  if (mNumberOfColumns >= 0xFF) {
    unsigned int mNumberOfColumns = 255;
  }
  int mNumberOfFooterRows = self->mNumberOfFooterRows;
  uint64_t v7 = [[TSTCellIterator alloc] initWithTableModel:self range:(unint64_t)(mNumberOfColumns | (mNumberOfRows << 16)) << 32 flags:33];
  if (TSTCellIteratorGetNextCell(v7, v26))
  {
    while (1)
    {
      uint64_t v8 = v29;
      if (!v29) {
        goto LABEL_24;
      }
      int mPrivate = (int)v29->mPrivate;
      int mFormatType = v29->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
      if (mFormatType == 267 && BYTE1(mPrivate) == 2) {
        break;
      }
      if (mFormatType == 263 && BYTE1(mPrivate) == 6)
      {
        if (!BYTE1(mPrivate)) {
          goto LABEL_46;
        }
        if (BYTE1(mPrivate) != 6)
        {
          uint64_t v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v24 = [NSString stringWithUTF8String:"BOOL TSTCellBoolValue(TSTCell *)"];
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 925, @"can't get BOOL value from non-BOOL cell: %p", v8);
          goto LABEL_46;
        }
        goto LABEL_22;
      }
      if (BYTE1(mPrivate) != 3) {
        goto LABEL_23;
      }
      int v13 = (__CFString *)v29;
LABEL_26:
      uint64_t v16 = NSStringFromNativeTSTCell(v13);
      if (v16 && [(__CFString *)v16 length])
      {
LABEL_28:
        int v17 = v27;
        unsigned int v18 = v28;
        if ((_WORD)v30 != 0xFFFF)
        {
          unint64_t v19 = HIWORD(v30);
          BOOL v20 = (v30 & 0xFF0000) == 0xFF0000 || v19 == 0;
          if (!v20 && (v30 & 0xFFFF00000000) != 0)
          {
            unsigned int v18 = ((v30 + ((v30 >> 16) & 0xFF0000) + 16711680) >> 16);
            int v17 = v30 + 0xFFFF + v19;
          }
        }
        if ((unsigned __int16)v17 >= (unsigned __int16)v2
          && ~mNumberOfFooterRows + mNumberOfRows >= (unsigned __int16)v17)
        {
          uint64_t v2 = (v17 + 1);
        }
        else
        {
          uint64_t v2 = v2;
        }
        if (v18 >= v3) {
          unsigned __int16 v3 = v18 + 1;
        }
      }
LABEL_46:
      if ((TSTCellIteratorGetNextCell(v7, v26) & 1) == 0) {
        goto LABEL_47;
      }
    }
    if ((*(_DWORD *)&v29->mPrivate & 0xFB00) != 0x200)
    {
      unint64_t v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"double TSTCellDoubleValue(TSTCell *)"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, @"can't get value from non-value cell: %p", v8);
      goto LABEL_46;
    }
LABEL_22:
    if (v29->mPrivate.mValue.mDouble == 0.0) {
      goto LABEL_46;
    }
LABEL_23:
    if (*((unsigned char *)&v29->mPrivate + 1)) {
      goto LABEL_28;
    }
LABEL_24:
    if (TSTCellIteratorCellHasCommentStorage((uint64_t)v26)) {
      goto LABEL_28;
    }
    int v13 = (__CFString *)v29;
    goto LABEL_26;
  }
LABEL_47:

  return ($CA3468F20078D5D2DB35E78E73CA60DA)((v2 << 48) | ((unint64_t)v3 << 32));
}

- (void)p_scaleStrokeFromProperty:(int)a3 style:(id)a4 pmap:(id)a5 scale:(double)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "valueForProperty:"), "mutableCopy");
  if (v9)
  {
    id v11 = v9;
    [v9 width];
    [v11 setWidth:v10 * a6];
    [a5 setObject:v11 forProperty:v8];
  }
}

- (void)p_scaleStrokesOnCell:(id)a3 atCellID:(id)a4 transformedObjects:(id)a5 scale:(double)a6
{
  if (a3)
  {
    uint64_t v11 = *((void *)a3 + 5);
    uint64_t v12 = (void *)[a5 objectForKey:v11];
    if (!v12)
    {
      if (!v11) {
        return;
      }
      int v13 = objc_alloc_init(TSSPropertyMap);
      [(TSTTableModel *)self p_scaleStrokeFromProperty:899 style:v11 pmap:v13 scale:a6];
      [(TSTTableModel *)self p_scaleStrokeFromProperty:900 style:v11 pmap:v13 scale:a6];
      [(TSTTableModel *)self p_scaleStrokeFromProperty:901 style:v11 pmap:v13 scale:a6];
      [(TSTTableModel *)self p_scaleStrokeFromProperty:902 style:v11 pmap:v13 scale:a6];
      id v14 = [(TSSStylesheet *)[(TSKDocumentRoot *)[(TSTTableModel *)self documentRoot] stylesheet] variationOfStyle:v11 propertyMap:v13];

      id v15 = (id)*((void *)a3 + 5);
      if (v15 != v14)
      {

        *((void *)a3 + 5) = v14;
        *((_DWORD *)a3 + 8) = 0;
      }
      if (v14) {
        [a5 setObject:v14 forKey:v11];
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v12 = (void *)[a5 objectForKey:a6];
    if (!v12) {
      return;
    }
  }
  uint64_t v16 = (void *)*((void *)a3 + 5);
  if (v16 != v12)
  {

    *((void *)a3 + 5) = v12;
    *((_DWORD *)a3 + 8) = 0;
  }
LABEL_11:

  TSTTableSetCellAtCellIDIgnoringFormula((uint64_t)self, a3, *(_DWORD *)&a4);
}

- (void)transformStrokes:(CGAffineTransform *)a3 transformedObjects:(id)a4 inBounds:(CGRect)a5
{
  if (!objc_msgSend(a4, "objectForKey:", self, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))
  {
    [a4 setObject:self forUncopiedKey:self];
    uint64_t v8 = [(TSTTableModel *)self tableStyle];
    uint64_t v9 = [a4 objectForKey:v8];
    double v10 = fmin(a3->a, a3->d);
    if (v8 != (TSTTableStyle *)v9)
    {
      uint64_t v11 = v9;
      if (!v9)
      {
        a3 = objc_alloc_init(TSSPropertyMap);
        [(TSTTableModel *)self p_scaleStrokeFromProperty:773 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:774 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:771 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:772 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:781 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:780 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:782 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:779 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:776 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:777 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:778 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:775 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:785 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:784 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:786 style:v8 pmap:a3 scale:v10];
        [(TSTTableModel *)self p_scaleStrokeFromProperty:783 style:v8 pmap:a3 scale:v10];
        uint64_t v11 = [(TSSStylesheet *)[(TSSStyle *)v8 stylesheet] variationOfStyle:v8 propertyMap:a3];

        if (v8)
        {
          if (v11) {
            [a4 setObject:v11 forKey:v8];
          }
        }
      }
      [(TSTTableModel *)self setTableStyle:v11];
    }
    uint64_t v12 = [[TSTCellIterator alloc] initWithTableModel:self range:[(TSTTableModel *)self range]];
    if (TSTCellIteratorGetNextCell(v12, v13))
    {
      do
      {
        a3 = (CGAffineTransform *)((unint64_t)a3 & 0xFFFFFFFF00000000 | v14);
        [(TSTTableModel *)self p_scaleStrokesOnCell:v15 atCellID:a3 transformedObjects:a4 scale:v10];
      }
      while ((TSTCellIteratorGetNextCell(v12, v13) & 1) != 0);
    }
  }
}

- (void)upgradeFromPreUFF
{
  p_mStyles = &self->mStyles;
  if (!self->mStyles.tableNameStyle)
  {
    [(TSPObject *)self willModifyForUpgrade];
    p_mStyles->tableNameStyle = (TSWPParagraphStyle *)(id)objc_msgSend(+[TSTTableStyleNetwork networkFromTheme:presetIndex:](TSTTableStyleNetwork, "networkFromTheme:presetIndex:", -[TSKDocumentRoot theme](-[TSTTableModel documentRoot](self, "documentRoot"), "theme"), self->mPresetIndex), "tableNameStyle");
  }
  if (!p_mStyles->tableNameShapeStyle)
  {
    [(TSPObject *)self willModifyForUpgrade];
    p_mStyles->tableNameShapeStyle = (TSWPShapeStyle *)(id)objc_msgSend(+[TSTTableStyleNetwork networkFromTheme:presetIndex:](TSTTableStyleNetwork, "networkFromTheme:presetIndex:", -[TSKDocumentRoot theme](-[TSTTableModel documentRoot](self, "documentRoot"), "theme"), self->mPresetIndex), "tableNameShapeStyle");
  }
  if (self->mDeprecatedProvider)
  {
    unint64_t v5 = [TSTEphemeralCellMap alloc];
    uint64_t v6 = (TSTEphemeralCellMap *)objc_msgSend((id)v5, "initWithCapacity:", -[TSTTableModel numberOfColumns](self, "numberOfColumns")* (unint64_t)-[TSTTableModel numberOfRows](self, "numberOfRows"));
    uint64_t v7 = [[TSTCellIterator alloc] initWithTableModel:self flags:289];
    uint64_t v8 = objc_alloc_init(TSTCell);
    TSTCellClear((uint64_t)v8);
    if (TSTCellIteratorGetNextCell(v7, (const char *)v44))
    {
      id v37 = v6;
      do
      {
        uint64_t v9 = (void *)MEMORY[0x223CB9570]();
        if (*((void *)&v44[0] + 1) && *(unsigned __int8 *)(*((void *)&v44[0] + 1) + 9) << 8 == 1024)
        {
          TSTCellCopy(*((uint64_t *)&v44[0] + 1), (uint64_t)v8);
          unint64_t v2 = v2 & 0xFFFFFFFF00000000 | DWORD1(v44[0]);
          uint64_t v10 = -[TSWPStorage rangeForCellID:includingBreak:](self->mDeprecatedProvider, "rangeForCellID:includingBreak:");
          if (v11)
          {
            uint64_t v12 = v10;
            uint64_t v13 = v11;
            id v14 = -[TSWPStorage newSubstorageWithRange:context:flags:kind:](self->mDeprecatedProvider, "newSubstorageWithRange:context:flags:kind:", v10, v11, [(TSPObject *)self context], 0, 5);
            BOOL v38 = (TSTEphemeralCellMap *)v5;
            if ([v14 canBeStoredInAStringValueCell])
            {
              TSTCellClearValue((uint64_t)v8);
              *((unsigned char *)&v8->mPrivate + 1) = 3;
              uint64_t v15 = (NSString *)[v14 stringValue];
              int mPrivate = (int)v8->mPrivate;
              if ((mPrivate & 0xFF00) == 0)
              {
                TSTCellClearValue((uint64_t)v8);
                *((unsigned char *)&v8->mPrivate + 1) = 3;
                int mPrivate = (int)v8->mPrivate;
              }
              if ((mPrivate & 0xFF00) == 0x300)
              {
                mString = v8->mPrivate.mValue.mString.mString;
                if (mString != v15)
                {

                  v8->mPrivate.mValue.mString.mString = v15;
                  int v18 = HIWORD(*(_DWORD *)&v8->mPrivate);
                  uint64_t v19 = -[NSString rangeOfCharacterFromSet:](v15, "rangeOfCharacterFromSet:", [MEMORY[0x263F08708] newlineCharacterSet]);
                  __int16 v20 = v18 | 1;
                  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
                    __int16 v20 = v18 & 0xFFFE;
                  }
                  *((_WORD *)&v8->mPrivate + 1) = v20;
                  v8->mPrivate.mValue.mString.mID = 0;
                }
              }
              else
              {
                uint64_t v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", "void TSTCellSetStringValueClearingID(TSTCell *, NSString *, BOOL)");
                objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1003, @"can't set string on non-string cell: %p", v8);
              }
              uint64_t v25 = (void *)[v14 paragraphStyleAtCharIndex:0 effectiveRange:0];
              unint64_t v5 = (unint64_t)v38;
              if (v25)
              {
                uint64_t v26 = [v25 propertyMap];
                unsigned __int16 v27 = [(TSSStylesheet *)[(TSKDocumentRoot *)[(TSTTableModel *)self documentRoot] stylesheet] variationOfStyle:[(TSTTableModel *)self defaultTextStyleForTableArea:[(TSTTableModel *)self tableAreaForCellID:DWORD1(v44[0])]] propertyMap:v26];
                mTextStyle = v8->mPrivate.mTextStyle;
                if (mTextStyle != v27)
                {
                  unsigned int v29 = v27;

                  v8->mPrivate.mTextStyle = v29;
                  v8->mPrivate.mTextStyleID = 0;
                }
              }
            }
            else
            {
              id v21 = -[TSWPStorage newSubstorageWithRange:context:flags:kind:](self->mDeprecatedProvider, "newSubstorageWithRange:context:flags:kind:", v12, v13, [(TSPObject *)self context], 0, 5);
              objc_msgSend(v21, "willBeAddedToDocumentRoot:dolcContext:", -[TSTTableModel documentRoot](self, "documentRoot"), 0);
              objc_msgSend(v21, "wasAddedToDocumentRoot:dolcContext:", -[TSTTableModel documentRoot](self, "documentRoot"), 0);
              uint64_t v22 = [[TSTRichTextPayload alloc] initWithStorage:v21];
              TSTCellClearValue((uint64_t)v8);
              *((unsigned char *)&v8->mPrivate + 1) = 9;
              TSTCellSetRichTextPayloadClearingIDConvertToPlaintext((TSTRichTextPayload *)v8, v22, 1, 1);

              unint64_t v5 = (unint64_t)v38;
            }

            v39[0] = 260;
            TSTCellSetExplicitFormat((uint64_t)v8, (uint64_t)v39);
            uint64_t v6 = v37;
          }
          else
          {
            TSTCellClearValue((uint64_t)v8);
            TSTCellClearValue((uint64_t)v8);
            *(_DWORD *)&v8->mPrivate &= 0xFFFF00FF;
          }
          unint64_t v5 = v5 & 0xFFFFFFFF00000000 | DWORD1(v44[0]);
          [(TSTEphemeralCellMap *)v6 addCell:v8 andCellID:v5];
        }
      }
      while ((TSTCellIteratorGetNextCell(v7, (const char *)v44) & 1) != 0);
    }

    TSTTableSetCellsWithCellMapIgnoringFormulas((uint64_t)self, v6);
    self->mDeprecatedProvider = 0;
  }
  else
  {
    unint64_t v30 = [(TSKDocumentRoot *)[(TSTTableModel *)self documentRoot] stylesheet];
    id v31 = +[TSTTableStyleNetwork networkFromTableModel:self];
    id v32 = [[TSTCellIterator alloc] initWithTableModel:self flags:48];
    if ([(TSTCellIterator *)v32 getNext:v44])
    {
      do
      {
        if (*((void *)&v44[0] + 1))
        {
          id v33 = *(void **)(*((void *)&v44[0] + 1) + 72);
          if (v33)
          {
            v34 = (void *)[v33 storage];
            uint64_t v35 = [v34 range];
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __34__TSTTableModel_upgradeFromPreUFF__block_invoke;
            v40[3] = &unk_2646B3720;
            v40[4] = v30;
            v40[5] = v31;
            long long v41 = v44[0];
            long long v42 = v44[1];
            uint64_t v43 = v45;
            v40[6] = self;
            v40[7] = v34;
            objc_msgSend(v34, "enumerateWithAttributeKind:inRange:usingBlock:", 0, v35, v36, v40);
          }
        }
      }
      while ([(TSTCellIterator *)v32 getNext:v44]);
    }
  }
}

uint64_t __34__TSTTableModel_upgradeFromPreUFF__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (![a2 stylesheet]
    || (uint64_t result = [a2 stylesheet], result == *(void *)(a1 + 32))
    && (uint64_t result = [a2 parent]) == 0)
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "variationOfStyle:propertyMap:", objc_msgSend(*(id *)(a1 + 40), "textStyleForTableArea:", objc_msgSend(*(id *)(a1 + 48), "tableAreaForCellID:", *(unsigned int *)(a1 + 68))), objc_msgSend(a2, "propertyMap"));
    uint64_t v10 = *(void **)(a1 + 56);
    return objc_msgSend(v10, "setParagraphStyle:forCharRange:undoTransaction:", v9, a3, a4, 0);
  }
  return result;
}

- (id)allRichTextPayloadStorages
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(-[TSTTableModel dataStore](self, "dataStore") + 96), "object"), "allRichTextPayloadStorages");
  unsigned __int16 v3 = (void *)MEMORY[0x263EFFA08];

  return (id)[v3 setWithArray:v2];
}

- (unsigned)numberOfHiddenRows
{
  return self->mNumberOfHiddenRows;
}

- (unsigned)numberOfHiddenColumns
{
  return self->mNumberOfHiddenColumns;
}

- (unsigned)numberOfUserHiddenRows
{
  return self->mNumberOfUserHiddenRows;
}

- (unsigned)numberOfUserHiddenColumns
{
  return self->mNumberOfUserHiddenColumns;
}

- (BOOL)wasUnarchivedFromAProvidedTable
{
  return self->mWasUnarchivedFromAProvidedTable;
}

- (void)setWasUnarchivedFromAProvidedTable:(BOOL)a3
{
  self->mWasUnarchivedFromAProvidedTable = a3;
}

- (TSTCellDictionary)cellsPendingWrite
{
  return self->mCellsPendingWrite;
}

@end