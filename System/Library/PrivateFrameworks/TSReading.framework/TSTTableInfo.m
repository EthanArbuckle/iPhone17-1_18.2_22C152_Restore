@interface TSTTableInfo
+ (BOOL)canPartition;
+ (id)geometryForPrototypeIndex:(int64_t)a3 withCanvasPoint:(CGPoint)a4;
+ (id)presetKinds;
+ (id)tablePrototypeWithIndex:(int64_t)a3 context:(id)a4 geometry:(id)a5 styles:(id)a6;
+ (unsigned)numberOfColumnsForProtoIndex:(unint64_t)a3;
+ (unsigned)numberOfRowsForProtoIndex:(unint64_t)a3;
+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5;
+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5 reservedCount:(unint64_t)a6;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellID;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)previousEditingCellID;
- ($CA3468F20078D5D2DB35E78E73CA60DA)editingCellRange;
- (BOOL)autoListRecognition;
- (BOOL)autoListTermination;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)hasReference;
- (BOOL)isFormulaEditing;
- (BOOL)isSafeToConvertToAttributedString;
- (BOOL)isSafeToConvertToImage;
- (BOOL)isSafeToConvertToText;
- (BOOL)reverseChunkingIsSupported;
- (BOOL)supportsAttachedComments;
- (BOOL)supportsHyperlinks;
- (BOOL)textIsVertical;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (TSKDocumentRoot)documentRoot;
- (TSTEditingState)editingState;
- (TSTMasterLayout)masterLayout;
- (TSTTableInfo)initWithContext:(id)a3 fromSourceInfo:(id)a4 carrySelection:(BOOL)a5;
- (TSTTableInfo)initWithContext:(id)a3 fromSourceInfo:(id)a4 cellRegion:(id)a5 carrySelection:(BOOL)a6;
- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4 rows:(unsigned __int16)a5 columns:(unsigned __int16)a6 styles:(id)a7;
- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4 styles:(id)a5;
- (TSTTableInfo)initWithContext:(id)a3 otherTableInfo:(id)a4;
- (TSTTableModel)tableModel;
- (TSTTablePartitioner)partitioner;
- (double)masterLayoutEffectiveTableNameHeight;
- (id)allWPStorages;
- (id)childCommandForApplyThemeCommand:(id)a3;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (id)descriptionForExactCopy;
- (id)descriptionForPasteboard;
- (id)descriptionForPasteboardWithSource:(id)a3;
- (id)initForTestingWithContext:(id)a3 rows:(unsigned __int16)a4 columns:(unsigned __int16)a5;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)referencedStyles;
- (id)searchForAnnotationsWithHitBlock:(id)a3;
- (id)searchForString:(id)a3 options:(unint64_t)a4 onHit:(id)a5;
- (id)tabularTextRepresentation;
- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4;
- (int)elementKind;
- (int64_t)contentWritingDirection;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 animationFilter:(id)a4;
- (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3;
- (void)acceptVisitor:(id)a3;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)clearPartitioner;
- (void)dealloc;
- (void)didCopy;
- (void)didReplaceTextsInStoragesWithPlaceHolderString;
- (void)p_didLoadRichTextPayloadTable:(id)a3;
- (void)performBlockWithStylesheetForAddingStyles:(id)a3;
- (void)replaceReferencedStylesUsingBlock:(id)a3;
- (void)scaleInfoGeometry:(CGSize)a3;
- (void)setContentWritingDirection:(int64_t)a3;
- (void)setEditingCellID:(id)a3;
- (void)setEditingState:(id)a3;
- (void)setFormulaEditing:(BOOL)a3;
- (void)setGeometry:(id)a3;
- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4;
- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4 scaleFactor:(CGSize)a5;
- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4 scaleFactor:(CGSize)a5 shouldClearObjectPlaceholderFlag:(BOOL)a6;
- (void)setHasReference:(BOOL)a3;
- (void)setupTableModelForPrototypeIndex:(int64_t)a3;
- (void)shiftGeometryToExcludeTableNameHeight;
- (void)shiftGeometryToIncludeTableNameHeight;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
- (void)willCopyWithOtherDrawables:(id)a3;
@end

@implementation TSTTableInfo

- (id)tabularTextRepresentation
{
  v17 = [(TSTTableInfo *)self tableModel];
  v3 = [[TSTCellIterator alloc] initWithTableModel:v17 range:[(TSTTableModel *)v17 range] flags:128];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([(TSTCellIterator *)v3 getNext:v18])
  {
    v5 = 0;
    int v6 = 0xFFFF;
    do
    {
      v7 = v21;
      int v8 = v19;
      int v9 = v20;
      int v11 = v22;
      unsigned int v10 = v23;
      if (v6 == v19)
      {
        [v4 appendString:v5];
      }
      else
      {
        if (v6 != 0xFFFF) {
          [v4 appendString:@"\n"];
        }
        int v6 = v8;
      }
      uint64_t v12 = v8 | (v9 << 16);
      if ((_WORD)v11 == 0xFFFF
        || (*(void *)&v11 & 0xFF0000) == 0xFF0000
        || v10 < 0x10000
        || !(_WORD)v10
        || ((v12 ^ v11) & 0xFFFFFF) == 0)
      {
        if (v7 && v7->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType == 267) {
          TSTCellCoerceCellToTextFormat(v7);
        }
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v12;
        v14 = TSTTableStringForCellAtCellID((uint64_t)v17, (__CFString *)v7, v2);
        if (v14)
        {
          v15 = v14;
          if ([(__CFString *)v14 rangeOfString:@"\n"] == 0x7FFFFFFFFFFFFFFFLL) {
            [v4 appendString:v15];
          }
          else {
            [v4 appendFormat:@"\"%@\"", v15];
          }
        }
        v13 = TSTTableInfoTextArchiving_TabSpacing;
      }
      else
      {
        v13 = &TSTTableInfoTextArchiving_MergeCellSpacing;
      }
      v5 = *v13;
    }
    while ([(TSTCellIterator *)v3 getNext:v18]);
  }

  return v4;
}

- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4 rows:(unsigned __int16)a5 columns:(unsigned __int16)a6 styles:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TSTTableInfo;
  uint64_t v12 = -[TSDDrawableInfo initWithContext:geometry:](&v17, sel_initWithContext_geometry_);
  if (v12)
  {
    *((void *)v12 + 18) = [[TSTTableModel alloc] initWithContext:a3 rows:v9 columns:v8 styles:a7 tableInfo:v12];
    *(_DWORD *)(v12 + 154) = 0xFFFFFF;
    *(_DWORD *)(v12 + 158) = 0xFFFFFF;
    *((void *)v12 + 21) = 0;
    *((void *)v12 + 22) = 0;
    *((void *)v12 + 23) = [[TSTEditingState alloc] initWithTableInfo:v12];
    [a4 size];
    double v14 = v13;
    [a4 size];
    TSTTableInitDefaultHeightAndWidth((TSTTableInfo *)v12, v14, v15);
  }
  return (TSTTableInfo *)v12;
}

- (id)initForTestingWithContext:(id)a3 rows:(unsigned __int16)a4 columns:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v9 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", 0.0, 0.0, 100.0, 200.0);
  v12.receiver = self;
  v12.super_class = (Class)TSTTableInfo;
  unsigned int v10 = [(TSDDrawableInfo *)&v12 initWithContext:a3 geometry:v9];
  if (v10)
  {
    *((void *)v10 + 18) = [[TSTTableModel alloc] initWithContext:a3 rows:v6 columns:v5 styles:+[TSTTableStyleNetwork networkWithContext:a3 presetIndex:0 colors:0 alternate:2] tableInfo:v10];
    *(_DWORD *)(v10 + 154) = 0xFFFFFF;
    *(_DWORD *)(v10 + 158) = 0xFFFFFF;
    *((void *)v10 + 21) = 0;
    *((void *)v10 + 22) = 0;
    *((void *)v10 + 23) = [[TSTEditingState alloc] initWithTableInfo:v10];
  }

  return v10;
}

- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4 styles:(id)a5
{
  [a4 size];
  unint64_t v10 = (unint64_t)(v9 / 22.0);
  [a4 size];
  unint64_t v12 = (unint64_t)(v11 / 98.0);
  id v13 = +[TSTConfiguration sharedTableConfiguration];
  id v14 = (id)[a4 mutableCopy];
  if (v12 > [v13 maxNumberOfColumns])
  {
    unsigned int v15 = [v13 maxNumberOfColumns];
    LOBYTE(v12) = v15;
    double v16 = (double)v15 * 98.0;
    [v14 size];
    [v14 setSize:v16];
  }
  if (v10 > [v13 maxNumberOfRows])
  {
    LOWORD(v10) = [v13 maxNumberOfRows];
    [v14 size];
    objc_msgSend(v14, "setSize:");
  }

  return [(TSTTableInfo *)self initWithContext:a3 geometry:v14 rows:(unsigned __int16)v10 columns:v12 styles:a5];
}

- (TSTTableInfo)initWithContext:(id)a3 geometry:(id)a4
{
  id v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSTTableInfo initWithContext:geometry:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 225, @"call - (id) initWithContext: (TSPObjectContext *) context geometry: (TSDInfoGeometry *) geometry styles:(TSTTableStyleNetwork *)styles please");
  return 0;
}

- (TSTTableInfo)initWithContext:(id)a3 otherTableInfo:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSTTableInfo;
  uint64_t v5 = -[TSDDrawableInfo initWithContext:geometry:](&v7, sel_initWithContext_geometry_, a3, [a4 geometry]);
  if (v5)
  {
    *((void *)v5 + 18) = *((id *)a4 + 18);
    *(_DWORD *)(v5 + 154) = 0xFFFFFF;
    *(_DWORD *)(v5 + 158) = 0xFFFFFF;
    *((void *)v5 + 21) = 0;
    *((void *)v5 + 22) = 0;
    *((void *)v5 + 23) = [[TSTEditingState alloc] initWithTableInfo:v5];
  }
  return (TSTTableInfo *)v5;
}

- (TSTTableInfo)initWithContext:(id)a3 fromSourceInfo:(id)a4 cellRegion:(id)a5 carrySelection:(BOOL)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)TSTTableInfo;
  unint64_t v10 = -[TSDDrawableInfo initWithContext:geometry:](&v29, sel_initWithContext_geometry_, a3, [a4 geometry]);
  if (v10)
  {
    *((void *)v10 + 18) = -[TSTTableModel initWithContext:fromSourceModel:region:tableInfo:]([TSTTableModel alloc], "initWithContext:fromSourceModel:region:tableInfo:", a3, [a4 tableModel], a5, v10);
    *(_DWORD *)(v10 + 154) = 0xFFFFFF;
    *(_DWORD *)(v10 + 158) = 0xFFFFFF;
    *((void *)v10 + 21) = 0;
    *((void *)v10 + 22) = 0;
    double v11 = 0.0;
    if ([*((id *)v10 + 18) numberOfRows])
    {
      int v12 = 0;
      do
        double v11 = v11 + TSTTableHeightOfRow(*((void *)v10 + 18), (unsigned __int16)v12++, 0);
      while ([*((id *)v10 + 18) numberOfRows] > (unsigned __int16)v12);
    }
    if ([*((id *)v10 + 18) numberOfColumns])
    {
      int v13 = 0;
      double v14 = 0.0;
      do
        double v14 = v14 + TSTTableWidthOfColumn(*((void *)v10 + 18), v13++, 0);
      while ([*((id *)v10 + 18) numberOfColumns] > v13);
    }
    unsigned int v15 = [TSDInfoGeometry alloc];
    objc_msgSend((id)objc_msgSend(a4, "geometry"), "position");
    double v16 = -[TSDInfoGeometry initWithPosition:size:](v15, "initWithPosition:size:");
    [v10 setGeometry:v16 resizeInternal:0];

    *((void *)v10 + 23) = -[TSTEditingState initForPasteboardFromSourceInfo:stylesheet:]([TSTEditingState alloc], "initForPasteboardFromSourceInfo:stylesheet:", v10, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "tableModel"), "bodyTextStyle"), "stylesheet"));
    if (a6)
    {
      uint64_t v17 = [a5 boundingCellRange];
      v18 = -[TSTTableSelection initWithTableModel:andPreviousSelection:offsetBy:]([TSTTableSelection alloc], "initWithTableModel:andPreviousSelection:offsetBy:", *((void *)v10 + 18), objc_msgSend((id)objc_msgSend(a4, "editingState"), "selection"), -BYTE2(v17) - ((unint64_t)(unsigned __int16)v17 << 32));
      [*((id *)v10 + 23) setSelection:v18];
      objc_msgSend(*((id *)v10 + 23), "changeEditingMode:", objc_msgSend((id)objc_msgSend(a4, "editingState"), "editingMode"));
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unsigned __int16 v19 = objc_msgSend(v10, "allWPStorages", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) setParentInfo:v10];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v21);
    }
  }
  return (TSTTableInfo *)v10;
}

- (TSTTableInfo)initWithContext:(id)a3 fromSourceInfo:(id)a4 carrySelection:(BOOL)a5
{
  BOOL v5 = a5;
  if (a5) {
    id v9 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "editingState"), "selection"), "cellRegion");
  }
  else {
    id v9 = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", objc_msgSend((id)objc_msgSend(a4, "tableModel"), "range"));
  }

  return [(TSTTableInfo *)self initWithContext:a3 fromSourceInfo:a4 cellRegion:v9 carrySelection:v5];
}

- (void)dealloc
{
  mMasterLayout = self->mMasterLayout;
  if (mMasterLayout)
  {
    [(TSTMasterLayout *)mMasterLayout wasRemovedFromDocumentRoot];
    [(TSTMasterLayout *)self->mMasterLayout setTableInfo:0];

    self->mMasterLayout = 0;
  }

  mPartitioner = self->mPartitioner;
  if (mPartitioner)
  {

    self->mPartitioner = 0;
  }

  self->mEditingState = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTTableInfo;
  [(TSDDrawableInfo *)&v5 dealloc];
}

- (id)copyWithContext:(id)a3
{
  uint64_t v5 = [(TSTTableInfo *)self zone];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", v5), "initWithContext:fromSourceInfo:carrySelection:", a3, self, 0);
  objc_super v7 = (void *)v6;
  if (v6)
  {

    v7[11] = [(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self exteriorTextWrap] copyWithZone:v5];
  }
  return v7;
}

- (void)setupTableModelForPrototypeIndex:(int64_t)a3
{
  id v4 = [(TSTTableInfo *)self tableModel];
  uint64_t v5 = v4;
  switch(a3)
  {
    case 0:
      [(TSTTableModel *)v4 setNumberOfHeaderRows:1];
      [(TSTTableModel *)v5 setNumberOfHeaderColumns:1];
      break;
    case 1:
    case 4:
      [(TSTTableModel *)v4 setNumberOfHeaderRows:1];
      break;
    case 3:
      [(TSTTableModel *)v4 setNumberOfHeaderRows:1];
      [(TSTTableModel *)v5 setNumberOfHeaderColumns:1];
      [(TSTTableModel *)v5 setNumberOfFooterRows:1];
      break;
    default:
      break;
  }
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "headersFrozenByDefault"))
  {
    [(TSTTableModel *)v5 setHeaderRowsFrozen:1];
    [(TSTTableModel *)v5 setHeaderColumnsFrozen:1];
  }
  [(TSTTableModel *)v5 setRepeatingHeaderRowsEnabled:1];
  [(TSTTableModel *)v5 setRepeatingHeaderColumnsEnabled:1];
  if (a3 == 4)
  {
    unint64_t v6 = [(TSTTableModel *)v5 numberOfRows];
    objc_super v7 = objc_alloc_init(TSTCell);
    TSTCellClearValue((uint64_t)v7);
    *((unsigned char *)&v7->mPrivate + 1) = 6;
    int v16 = 0;
    long long v15 = 0u;
    long long v14 = 0u;
    int v13 = 263;
    TSTCellSetExplicitFormat((uint64_t)v7, (uint64_t)&v13);
    int mPrivate = (int)v7->mPrivate;
    if ((mPrivate & 0xFF00) == 0)
    {
      TSTCellClearValue((uint64_t)v7);
      *((unsigned char *)&v7->mPrivate + 1) = 6;
      int mPrivate = (int)v7->mPrivate;
    }
    if ((mPrivate & 0xFF00) == 0x600)
    {
      v7->mPrivate.mValue.mDate = 0;
    }
    else
    {
      id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void TSTCellSetBoolValue(TSTCell *, BOOL)");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 939, @"can't set BOOL value to non-BOOL cell: %p", v7);
    }
    TSTTableSetWidthOfColumn((uint64_t)v5, 1, 147.0);
    TSTTableSetWidthOfColumn((uint64_t)v5, 0, 49.0);
    if (v6 >= 2)
    {
      uint64_t v11 = v6;
      for (uint64_t i = 1; i != v11; ++i)
      {
        unint64_t v6 = v6 & 0xFFFFFFFF00000000 | i;
        TSTTableSetCellAtCellID((uint64_t)v5, v7, v6);
      }
    }
  }
}

+ (unsigned)numberOfRowsForProtoIndex:(unint64_t)a3
{
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration", a3), "createLargeDefaultTables"))return 10; {
  else
  }
    return 5;
}

+ (unsigned)numberOfColumnsForProtoIndex:(unint64_t)a3
{
  if (objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration", a3), "createLargeDefaultTables"))return 5; {
  else
  }
    return 4;
}

+ (id)geometryForPrototypeIndex:(int64_t)a3 withCanvasPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v8 = objc_msgSend(a1, "numberOfRowsForProtoIndex:");
  double v9 = (float)((float)[a1 numberOfColumnsForProtoIndex:a3] * 98.0);
  uint64_t v10 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", x - v9 * 0.5, y - (float)((float)v8 * 22.0) * 0.5, v9, (float)((float)v8 * 22.0));

  return v10;
}

+ (id)tablePrototypeWithIndex:(int64_t)a3 context:(id)a4 geometry:(id)a5 styles:(id)a6
{
  objc_super v7 = -[TSTTableInfo initWithContext:geometry:rows:columns:styles:]([TSTTableInfo alloc], "initWithContext:geometry:rows:columns:styles:", a4, a5, objc_msgSend(a1, "numberOfRowsForProtoIndex:"), objc_msgSend(a1, "numberOfColumnsForProtoIndex:", a3), a6);
  [(TSTTableInfo *)v7 setupTableModelForPrototypeIndex:a3];
  return v7;
}

- (void)p_didLoadRichTextPayloadTable:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(a3, "allRichTextPayloadStorages", 0);
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setParentInfo:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)shiftGeometryToIncludeTableNameHeight
{
  v3 = [(TSDDrawableInfo *)self geometry];
  if ([(TSTTableModel *)[(TSTTableInfo *)self tableModel] tableNameEnabled])
  {
    +[TSTMasterLayout tableNameTextSize:self->mTableModel];
    double v5 = v4;
    uint64_t v6 = [TSDInfoGeometry alloc];
    [(TSDInfoGeometry *)v3 position];
    double v8 = v7;
    [(TSDInfoGeometry *)v3 position];
    double v10 = v9 - v5;
    [(TSDInfoGeometry *)v3 size];
    int v13 = -[TSDInfoGeometry initWithPosition:size:](v6, "initWithPosition:size:", v8, v10, v11, v12);
    [(TSTTableInfo *)self setGeometry:v13];
  }
}

- (void)shiftGeometryToExcludeTableNameHeight
{
  v3 = [(TSDDrawableInfo *)self geometry];
  +[TSTMasterLayout tableNameTextSize:self->mTableModel];
  double v5 = v4;
  uint64_t v6 = [TSDInfoGeometry alloc];
  [(TSDInfoGeometry *)v3 position];
  double v8 = v7;
  [(TSDInfoGeometry *)v3 position];
  double v10 = v5 + v9;
  [(TSDInfoGeometry *)v3 size];
  int v13 = -[TSDInfoGeometry initWithPosition:size:](v6, "initWithPosition:size:", v8, v10, v11, v12);
  [(TSTTableInfo *)self setGeometry:v13];
}

- (double)masterLayoutEffectiveTableNameHeight
{
  +[TSTMasterLayout effectiveTableNameHeightForModel:self->mTableModel];
  return result;
}

- (BOOL)isSafeToConvertToImage
{
  int v3 = [(TSTTableModel *)[(TSTTableInfo *)self tableModel] numberOfColumns];
  return [(TSTTableModel *)[(TSTTableInfo *)self tableModel] numberOfRows]
       * v3 < 0x7D0;
}

- (BOOL)isSafeToConvertToAttributedString
{
  int v3 = [(TSTTableModel *)[(TSTTableInfo *)self tableModel] numberOfColumns];
  return [(TSTTableModel *)[(TSTTableInfo *)self tableModel] numberOfRows]
       * v3 < 0xFA0;
}

- (BOOL)isSafeToConvertToText
{
  int v3 = [(TSTTableModel *)[(TSTTableInfo *)self tableModel] numberOfColumns];
  return [(TSTTableModel *)[(TSTTableInfo *)self tableModel] numberOfRows]
       * v3 < 0xFA0;
}

- (TSKDocumentRoot)documentRoot
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableInfo;
  return (TSKDocumentRoot *)[(TSPObject *)&v3 documentRoot];
}

- (TSTTableModel)tableModel
{
  return self->mTableModel;
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)editorClass
{
  return 0;
}

- (BOOL)supportsHyperlinks
{
  return 0;
}

- (TSTTablePartitioner)partitioner
{
  double result = self->mPartitioner;
  if (!result)
  {
    double result = [[TSTTablePartitioner alloc] initWithInfo:self];
    self->mPartitioner = result;
  }
  return result;
}

+ (BOOL)canPartition
{
  return 1;
}

- (void)clearPartitioner
{
  self->mPartitioner = 0;
}

- (TSTMasterLayout)masterLayout
{
  double result = self->mMasterLayout;
  if (!result)
  {
    double result = [[TSTMasterLayout alloc] initWithInfo:self];
    self->mMasterLayout = result;
  }
  return result;
}

- (int)elementKind
{
  return 4;
}

- (BOOL)supportsAttachedComments
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 animationFilter:(id)a4
{
  double v5 = [(TSTTableInfo *)self tableModel];

  return +[TSTAnimation stageCountForTextureDeliveryStyle:a3 andTable:v5];
}

- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4
{
  return +[TSTAnimation textureDeliveryStylesLocalized:](TSTAnimation, "textureDeliveryStylesLocalized:", a3, a4);
}

- (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3
{
  return +[TSTAnimation textureDeliveryStyleFromDeliveryString:a3];
}

- (BOOL)reverseChunkingIsSupported
{
  return 0;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  double v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4, a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSTTableInfo mixedObjectWithFraction:ofObject:]"];
  [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 763, @"%@ does not support %s!", objc_opt_class(), "-[TSTTableInfo mixedObjectWithFraction:ofObject:]" file lineNumber description];
  return 0;
}

- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4 scaleFactor:(CGSize)a5
{
}

- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4 scaleFactor:(CGSize)a5 shouldClearObjectPlaceholderFlag:(BOOL)a6
{
  BOOL v6 = a6;
  double v7 = (TSDInfoGeometry *)a3;
  [(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] size];
  double v10 = v9;
  double v12 = v11;
  [(TSDInfoGeometry *)v7 size];
  if (v10 != v14 || v12 != v13)
  {
    int v16 = [(TSTTableModel *)self->mTableModel numberOfRows];
    double v17 = (float)((float)(v16 - [(TSTTableModel *)self->mTableModel numberOfHiddenRows]) * 8.0);
    int v18 = [(TSTTableModel *)self->mTableModel numberOfColumns];
    double v19 = (float)((float)(v18 - [(TSTTableModel *)self->mTableModel numberOfHiddenColumns]) * 8.0);
    [(TSDInfoGeometry *)v7 size];
    double v21 = v20;
    double v23 = v22;
    [(TSDInfoGeometry *)v7 size];
    double v25 = v24;
    [(TSDInfoGeometry *)v7 size];
    double v27 = v26;
    [(TSDInfoGeometry *)v7 angle];
    if (v28 != 0.0 || (v27 >= v17 ? (BOOL v29 = v25 < v19) : (BOOL v29 = 1), v29))
    {
      if (v27 < v17) {
        double v23 = v17;
      }
      if (v25 < v19) {
        double v21 = v19;
      }
      v30 = [TSDInfoGeometry alloc];
      [(TSDInfoGeometry *)v7 position];
      double v7 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v30, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", [(TSDInfoGeometry *)v7 widthValid], [(TSDInfoGeometry *)v7 heightValid], [(TSDInfoGeometry *)v7 horizontalFlip], [(TSDInfoGeometry *)v7 verticalFlip], v31, v32, v21, v23, 0.0);
      if (v6) {
        goto LABEL_11;
      }
LABEL_17:
      BOOL v33 = [(TSDDrawableInfo *)self matchesObjectPlaceholderGeometry];
      v34.receiver = self;
      v34.super_class = (Class)TSTTableInfo;
      [(TSDDrawableInfo *)&v34 setGeometry:v7];
      [(TSDDrawableInfo *)self setMatchesObjectPlaceholderGeometry:v33];
      goto LABEL_18;
    }
  }
  if (!v6) {
    goto LABEL_17;
  }
LABEL_11:
  v35.receiver = self;
  v35.super_class = (Class)TSTTableInfo;
  [(TSDDrawableInfo *)&v35 setGeometry:v7];
LABEL_18:
  -[TSTTablePartitioner setScaleToFit:]([(TSTTableInfo *)self partitioner], "setScaleToFit:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)setGeometry:(id)a3 resizeInternal:(BOOL)a4
{
}

- (void)setGeometry:(id)a3
{
}

- (void)setContentWritingDirection:(int64_t)a3
{
  uint64_t v5 = [(TSTTableInfo *)self tableModel];
  BOOL v6 = objc_alloc_init(TSSPropertyMap);
  [(TSSPropertyMap *)v6 setIntValue:a3 forProperty:798];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__TSTTableInfo_setContentWritingDirection___block_invoke;
  v7[3] = &unk_2646B3A90;
  v7[4] = v5;
  v7[5] = v6;
  [(TSTTableInfo *)self performBlockWithStylesheetForAddingStyles:v7];
}

uint64_t __43__TSTTableInfo_setContentWritingDirection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "variationOfStyle:propertyMap:", objc_msgSend(*(id *)(a1 + 32), "tableStyle"), *(void *)(a1 + 40));
  double v4 = *(void **)(a1 + 32);

  return [v4 setTableStyle:v3];
}

- (int64_t)contentWritingDirection
{
  int v2 = [(TSSStyle *)[(TSTTableModel *)[(TSTTableInfo *)self tableModel] tableStyle] intValueForProperty:798];
  return v2 != 0x80000000 && v2 != -1 && v2 == 1;
}

- (void)scaleInfoGeometry:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((*MEMORY[0x263F001B0] != a3.width || *(double *)(MEMORY[0x263F001B0] + 8) != a3.height)
    && (a3.width != 1.0 || a3.height != 1.0))
  {
    double v8 = [(TSDDrawableInfo *)self geometry];
    [(TSDInfoGeometry *)v8 size];
    double v10 = width * v9;
    [(TSDInfoGeometry *)v8 size];
    double v12 = height * v11;
    double v13 = [TSDInfoGeometry alloc];
    [(TSDInfoGeometry *)v8 position];
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [(TSDInfoGeometry *)v8 widthValid];
    uint64_t v19 = [(TSDInfoGeometry *)v8 heightValid];
    uint64_t v20 = [(TSDInfoGeometry *)v8 horizontalFlip];
    uint64_t v21 = [(TSDInfoGeometry *)v8 verticalFlip];
    [(TSDInfoGeometry *)v8 angle];
    double v23 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v13, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", v18, v19, v20, v21, v15, v17, v10, v12, v22);
    [(TSTTableInfo *)self setGeometry:v23 resizeInternal:1];
  }
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v7 = [(TSTTableInfo *)self tableModel];
  int v8 = [(TSTTableModel *)v7 numberOfColumns];
  if (v8 == [(TSTTableModel *)v7 numberOfHeaderColumns]) {
    [(TSTTableModel *)v7 setNumberOfHeaderColumns:(unsigned __int16)([(TSTTableModel *)v7 numberOfHeaderColumns] - 1)];
  }
  int v9 = [(TSTTableModel *)v7 numberOfRows];
  int v10 = [(TSTTableModel *)v7 numberOfHeaderRows];
  if ([(TSTTableModel *)v7 numberOfFooterRows] + v10 == v9)
  {
    if ([(TSTTableModel *)v7 numberOfFooterRows]) {
      [(TSTTableModel *)v7 setNumberOfFooterRows:(unsigned __int16)([(TSTTableModel *)v7 numberOfFooterRows] - 1)];
    }
    else {
      [(TSTTableModel *)v7 setNumberOfHeaderRows:(unsigned __int16)([(TSTTableModel *)v7 numberOfHeaderRows] - 1)];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [(TSTTableInfo *)self allWPStorages];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v16 willBeAddedToDocumentRoot:a3 dolcContext:a4];
        [v16 setParentInfo:self];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  [(TSWPStorage *)[(TSTEditingState *)self->mEditingState editingStorage] willBeAddedToDocumentRoot:a3 dolcContext:a4];
  [(TSTMasterLayout *)self->mMasterLayout willBeAddedToDocumentRoot:a3];
  v17.receiver = self;
  v17.super_class = (Class)TSTTableInfo;
  [(TSDDrawableInfo *)&v17 willBeAddedToDocumentRoot:a3 context:a4];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)TSTTableInfo;
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](&v17, sel_wasAddedToDocumentRoot_context_);
  double v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"kObjectWasAddedToDocumentNotification" object:a3 userInfo:0];
  if (TSTTableNumberOfComments([(TSTTableInfo *)self tableModel])) {
    [v7 postNotificationName:@"kTSDAnnotationInvalidatedNotification" object:a3];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(TSTTableInfo *)self allWPStorages];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) wasAddedToDocumentRoot:a3 dolcContext:a4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
  [(TSWPStorage *)[(TSTEditingState *)self->mEditingState editingStorage] wasAddedToDocumentRoot:a3 dolcContext:a4];
  if (![(TSTEditingState *)self->mEditingState selection])
  {
    [(TSTEditingState *)self->mEditingState setSelection:[[TSTTableSelection alloc] initWithTableModel:[(TSTTableInfo *)self tableModel] selectionType:5]];
    [(TSTEditingState *)self->mEditingState changeEditingMode:0];
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_respondsToSelector();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TSTTableInfo *)self allWPStorages];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) willBeRemovedFromDocumentRoot:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(TSWPStorage *)[(TSTEditingState *)self->mEditingState editingStorage] willBeRemovedFromDocumentRoot:a3];
  v10.receiver = self;
  v10.super_class = (Class)TSTTableInfo;
  [(TSDDrawableInfo *)&v10 willBeRemovedFromDocumentRoot:a3];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"kObjectWasRemovedFromDocumentNotification" object:a3 userInfo:0];
  if (TSTTableNumberOfComments([(TSTTableInfo *)self tableModel])) {
    [v5 postNotificationName:@"kTSDAnnotationInvalidatedNotification" object:a3];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(TSTTableInfo *)self allWPStorages];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) wasRemovedFromDocumentRoot:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(TSWPStorage *)[(TSTEditingState *)self->mEditingState editingStorage] wasRemovedFromDocumentRoot:a3];
  [(TSTMasterLayout *)self->mMasterLayout wasRemovedFromDocumentRoot];
  v11.receiver = self;
  v11.super_class = (Class)TSTTableInfo;
  [(TSDDrawableInfo *)&v11 wasRemovedFromDocumentRoot:a3];
}

- (id)childEnumerator
{
  id v2 = [(TSTTableInfo *)self allWPStorages];

  return (id)[v2 objectEnumerator];
}

- (void)acceptVisitor:(id)a3
{
}

- (id)searchForString:(id)a3 options:(unint64_t)a4 onHit:(id)a5
{
  return 0;
}

- (id)searchForAnnotationsWithHitBlock:(id)a3
{
  return 0;
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5 reservedCount:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v10 = [a4 stylesheet];
  uint64_t v11 = [a4 context];
  unint64_t v12 = 6 - a6;
  id v19 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6 - a6];
  if ([a3 isEqual:String])
  {
    id v18 = a3;
    if (a6 != 6)
    {
      uint64_t v13 = 0;
      if (v12 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v12;
      }
      do
      {
        long long v15 = -[TSTTableStylePreset initWithStyleNetwork:index:]([TSTTableStylePreset alloc], "initWithStyleNetwork:index:", +[TSTTableStyleNetwork createStylesInStylesheet:presetIndex:colors:alternate:](TSTTableStyleNetwork, "createStylesInStylesheet:presetIndex:colors:alternate:", v10, v13, [a4 colors], v7), v13);
        if ([(TSPObject *)v15 context] != (TSPObjectContext *)v11)
        {
          uint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v17 = [NSString stringWithUTF8String:"+[TSTTableInfo bootstrapPresetsOfKind:inTheme:alternate:reservedCount:]"];
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 1252, @"expected equality between %s and %s", "p.context", "context");
        }
        [v19 addObject:v15];

        ++v13;
      }
      while (v14 != v13);
    }
    [a4 setPresets:v19 ofKind:v18];
  }
}

+ (id)presetKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:String];
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  [(TSTTableModel *)[(TSTTableInfo *)self tableModel] adoptStylesheet:a3 withMapper:a4];
  uint64_t v7 = [(TSTTableInfo *)self editingState];

  [(TSTEditingState *)v7 adoptStylesheet:a3 withMapper:a4];
}

- (id)referencedStyles
{
  id v2 = [(TSTTableInfo *)self tableModel];
  id v3 = +[TSTTableStyleNetwork networkFromTableModel:v2];
  double v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithArray:", objc_msgSend(v3, "styleArray"));
  id v5 = [[TSTCellIterator alloc] initWithTableModel:v2 flags:352];
  if (TSTCellIteratorGetNextCell(v5, v8))
  {
    do
    {
      uint64_t v6 = v9;
      if (v9)
      {
        if (*(void *)(v9 + 40)) {
          objc_msgSend(v4, "addObject:");
        }
        if (*(void *)(v6 + 56)) {
          objc_msgSend(v4, "addObject:");
        }
      }
    }
    while ((TSTCellIteratorGetNextCell(v5, v8) & 1) != 0);
  }

  return v4;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend(+[TSTTableStyleNetwork networkFromTableModel:](TSTTableStyleNetwork, "networkFromTableModel:", -[TSTTableInfo tableModel](self, "tableModel")), "styleArray");
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [(id)v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation((id)v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v12);
        v9 |= v13 != v12;
        [v6 addObject:v13];
      }
      uint64_t v8 = [(id)v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
    if (v9)
    {
      unint64_t v5 = [TSTTableStyleNetwork alloc];
      uint64_t v14 = (TSTTableStyleNetwork *)objc_msgSend((id)v5, "initWithContext:fromArray:presetIndex:", -[TSPObject context](self, "context"), v6, -[TSTTableModel presetIndex](-[TSTTableInfo tableModel](self, "tableModel"), "presetIndex"));
      [(TSTTableModel *)[(TSTTableInfo *)self tableModel] resetStyles:v14];
    }
  }
  long long v15 = [[TSTCellIterator alloc] initWithTableModel:[(TSTTableInfo *)self tableModel] flags:48];
  uint64_t v16 = [[TSTEphemeralCellMap alloc] initWithCapacity:1];
  if ([(TSTCellIterator *)v15 getNext:v28])
  {
    do
    {
      uint64_t v17 = v30;
      if (!v30) {
        continue;
      }
      uint64_t v18 = *(void *)(v30 + 40);
      if (v18)
      {
        objc_opt_class();
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v18);
        uint64_t v19 = TSUDynamicCast();
        uint64_t v17 = v30;
        if (v19 != v18)
        {
          long long v20 = (void *)v19;
          long long v21 = *(void **)(v30 + 40);
          if (v21 != (void *)v19)
          {

            *(void *)(v17 + 40) = v20;
            *(_DWORD *)(v17 + 32) = 0;
            uint64_t v17 = v30;
            if (!v30) {
              goto LABEL_24;
            }
          }
          int v22 = 1;
          goto LABEL_19;
        }
        if (!v30) {
          continue;
        }
      }
      int v22 = 0;
LABEL_19:
      uint64_t v23 = *(void *)(v17 + 56);
      if (v23)
      {
        objc_opt_class();
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v23);
        uint64_t v24 = TSUDynamicCast();
        if (v24 != v23)
        {
          double v25 = (void *)v24;
          uint64_t v26 = v30;
          double v27 = *(void **)(v30 + 56);
          if (v27 != (void *)v24)
          {

            *(void *)(v26 + 56) = v25;
            *(_DWORD *)(v26 + 48) = 0;
          }
LABEL_24:
          unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v29;
          [(TSTEphemeralCellMap *)v16 addCell:v30 andCellID:v5];
          continue;
        }
      }
      if (v22) {
        goto LABEL_24;
      }
    }
    while ([(TSTCellIterator *)v15 getNext:v28]);
  }
}

- (id)childCommandForApplyThemeCommand:(id)a3
{
  return 0;
}

- (id)descriptionForPasteboard
{
  v7[5] = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)TSTTableInfo;
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", -[TSDDrawableInfo descriptionForPasteboard](&v5, sel_descriptionForPasteboard));
  v6[0] = kTSTDescriptionHasFormulas;
  v7[0] = [NSNumber numberWithBool:0];
  v6[1] = kTSTDescriptionNumberOfRows;
  v7[1] = objc_msgSend(NSNumber, "numberWithInt:", -[TSTTableModel numberOfRows](self->mTableModel, "numberOfRows"));
  v6[2] = kTSTDescriptionNumberOfColumns;
  v7[2] = objc_msgSend(NSNumber, "numberWithInt:", -[TSTTableModel numberOfColumns](self->mTableModel, "numberOfColumns"));
  v6[3] = kTSTDescriptionHasMergeRanges;
  v7[3] = objc_msgSend(NSNumber, "numberWithInt:", -[TSTTableModel hasMergeRanges](self->mTableModel, "hasMergeRanges"));
  v6[4] = kTSTDescriptionFullyFilteredTable;
  v7[4] = [NSNumber numberWithBool:0];
  objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 5));
  return v3;
}

- (id)descriptionForExactCopy
{
  v10[6] = *MEMORY[0x263EF8340];
  $CA3468F20078D5D2DB35E78E73CA60DA v3 = [(TSTTableModel *)[(TSTTableInfo *)self tableModel] range];
  if ([(TSTEditingState *)[(TSTTableInfo *)self editingState] selection]) {
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v4 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTCellRegion *)[(TSTTableSelection *)[(TSTEditingState *)[(TSTTableInfo *)self editingState] selection] cellRegion] boundingCellRange];
  }
  else {
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v4 = 0;
  }
  objc_super v5 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x263EFFB08], [(TSTTableModel *)[(TSTTableInfo *)self tableModel] tableID]);
  uint64_t v6 = v5;
  v10[0] = v5;
  v9[0] = kTSTDescriptionSourceTableID;
  v9[1] = kTSTDescriptionSourceRange;
  $CA3468F20078D5D2DB35E78E73CA60DA v8 = v3;
  v10[1] = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:8];
  v9[2] = kTSTDescriptionSourceOrigin;
  v8.var0 = v4;
  v10[2] = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:4];
  v9[3] = kTSTDescriptionSourceNumHeaderRows;
  v10[3] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[TSTTableModel numberOfHeaderRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfHeaderRows"));
  v9[4] = kTSTDescriptionSourceNumHeaderColumns;
  v10[4] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[TSTTableModel numberOfHeaderColumns](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfHeaderColumns"));
  v9[5] = kTSTDescriptionSourceNumFooterRows;
  v10[5] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[TSTTableModel numberOfFooterRows](-[TSTTableInfo tableModel](self, "tableModel"), "numberOfFooterRows"));
  return (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
}

- (id)descriptionForPasteboardWithSource:(id)a3
{
  objc_opt_class();
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v4 = (void *)TSUDynamicCast();
  id v5 = [(TSTTableInfo *)self descriptionForPasteboard];
  if (v4)
  {
    uint64_t v6 = [v4 descriptionForExactCopy];
    id v5 = (id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
    [v5 addEntriesFromDictionary:v6];
  }
  return v5;
}

- (id)childInfos
{
  return 0;
}

- (void)setEditingCellID:(id)a3
{
  if (a3.var0 == 0xFFFF || (*(void *)&a3.var0 & 0xFF0000) == 0xFF0000) {
    self->mPreviousEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
  }
  else {
    self->mPreviousEditingCellID = self->mEditingCellID;
  }
  self->mEditingCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)editingCellRange
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v3 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTTableInfo *)self editingCellID];
  unint64_t v4 = TSTTableMergeRangeAtCellID((uint64_t)[(TSTTableInfo *)self tableModel], *(_DWORD *)&v3);
  if ((_WORD)v4 == 0xFFFF) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  }
  BOOL v5 = (v4 & 0xFF0000) == 0xFF0000 || HIWORD(v4) == 0;
  if (v5 || (v4 & 0xFFFF00000000) == 0) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(*(unsigned int *)&v3 | 0x1000100000000);
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v4;
}

- (void)setFormulaEditing:(BOOL)a3
{
  if (self->mIsFormulaEditing == a3)
  {
    BOOL v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableInfo setFormulaEditing:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableInfo.mm"), 1553, @"Calling setFormulaEditing with the same value as existing.  These should be paired up.");
  }
  self->mIsFormulaEditing = a3;
}

- (void)setHasReference:(BOOL)a3
{
  if (self->mHasReference != a3) {
    self->mHasReference = a3;
  }
}

- (void)willCopyWithOtherDrawables:(id)a3
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v3 = [(TSTTableInfo *)self tableModel];

  [(TSTTableModel *)v3 setDrawableIsBeingCopied:1];
}

- (void)didCopy
{
  id v2 = [(TSTTableInfo *)self tableModel];

  [(TSTTableModel *)v2 setDrawableIsBeingCopied:0];
}

- (BOOL)autoListRecognition
{
  return 1;
}

- (BOOL)autoListTermination
{
  return 1;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (id)allWPStorages
{
  id v2 = [(TSTTableInfo *)self tableModel];

  return [(TSTTableModel *)v2 allRichTextPayloadStorages];
}

- (void)didReplaceTextsInStoragesWithPlaceHolderString
{
  [(TSUConcurrentCache *)[(TSTMasterLayout *)self->mMasterLayout dupContentCache] removeAllObjects];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v3 = [(TSTMasterLayout *)self->mMasterLayout cellIDToWPColumnCache];

  [(TSUConcurrentCache *)v3 removeAllObjects];
}

- (void)performBlockWithStylesheetForAddingStyles:(id)a3
{
  BOOL v5 = [(TSTTableInfo *)self documentRoot];
  uint64_t v6 = [(TSKDocumentRoot *)v5 stylesheet];
  uint64_t v7 = [(TSSTheme *)[(TSKDocumentRoot *)v5 theme] stylesheet];
  if ([(TSDDrawableInfo *)self isThemeContent])
  {
    if ([(TSSStylesheet *)v7 isLocked])
    {
      [(TSSStylesheet *)v7 setIsLocked:0];
      (*((void (**)(id, TSSStylesheet *))a3 + 2))(a3, v7);
      [(TSSStylesheet *)v7 setIsLocked:1];
      return;
    }
  }
  else
  {
    uint64_t v7 = (TSSStylesheet *)v6;
  }
  $CA3468F20078D5D2DB35E78E73CA60DA v8 = (void (*)(id, TSSStylesheet *))*((void *)a3 + 2);

  v8(a3, v7);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mEditingCellID;
}

- (TSTEditingState)editingState
{
  return self->mEditingState;
}

- (void)setEditingState:(id)a3
{
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)previousEditingCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mPreviousEditingCellID;
}

- (BOOL)isFormulaEditing
{
  return self->mIsFormulaEditing;
}

- (BOOL)hasReference
{
  return self->mHasReference;
}

@end