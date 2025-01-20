@interface EXReadState
- (BOOL)isCancelled;
- (BOOL)isPredefinedDxfsBeingRead;
- (BOOL)isPredefinedTableStylesRead;
- (CXNamespace)EXSpreadsheetDrawingNamespace;
- (CXNamespace)EXSpreadsheetMLNamespace;
- (CXNamespace)EXSpreadsheetRelationsNamespace;
- (EXReadState)initWithWorkbookPart:(id)a3 cancelDelegate:(id)a4;
- (TCCancelDelegate)cancelDelegate;
- (_xmlNs)relationshipNameSpaceForWorkbook;
- (double)defaultColumnWidth;
- (double)defaultRowHeight;
- (id).cxx_construct;
- (id)arrayedFormulas;
- (id)authorForReference:(id)a3;
- (id)columnWidthConvertor;
- (id)currentPart;
- (id)currentSheet;
- (id)legacyDrawables;
- (id)oavState;
- (id)officeArtState;
- (id)resources;
- (id)sheetDimension;
- (id)textBoxForReference:(id)a3;
- (id)workbook;
- (id)workbookPart;
- (unint64_t)cellStyleXfsOffset;
- (unint64_t)sharedBaseFormulaIndexWithIndex:(int64_t)a3;
- (unsigned)currentRowMaxColumnIndex;
- (unsigned)currentRowMinColumnIndex;
- (unsigned)currentSheetIndex;
- (void)addSharedBaseFormulaIndex:(unint64_t)a3 withIndex:(int64_t)a4;
- (void)relationshipNameSpaceForWorkbook:(_xmlNs *)a3;
- (void)reportWarning:(id)a3;
- (void)reportWorksheetWarning:(id)a3;
- (void)resetForNewSheet;
- (void)setCellStyleXfsOffset:(unint64_t)a3;
- (void)setCurrentPart:(id)a3;
- (void)setCurrentRowMaxColumnIndex:(unsigned int)a3;
- (void)setCurrentRowMinColumnIndex:(unsigned int)a3;
- (void)setCurrentSheet:(id)a3;
- (void)setCurrentSheetIndex:(unsigned int)a3;
- (void)setDefaultColumnWidth:(double)a3;
- (void)setDefaultRowHeight:(double)a3;
- (void)setEXSpreadsheetDrawingNamespace:(id)a3;
- (void)setEXSpreadsheetMLNamespace:(id)a3;
- (void)setEXSpreadsheetRelationsNamespace:(id)a3;
- (void)setOfficeArtState:(id)a3;
- (void)setPredefinedDxfsBeingRead:(BOOL)a3;
- (void)setPredefinedTableStylesRead:(BOOL)a3;
- (void)setResources:(id)a3;
- (void)setSheetDimension:(id)a3;
- (void)setTextBox:(id)a3 author:(id)a4 forReference:(id)a5;
- (void)setWorkbook:(id)a3;
- (void)setupNSForXMLFormat:(int)a3;
@end

@implementation EXReadState

- (EXReadState)initWithWorkbookPart:(id)a3 cancelDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)EXReadState;
  v9 = [(OCXState *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWorkbookPart, a3);
    objc_storeStrong((id *)&v10->mCancelDelegate, a4);
    v10->mCurrentSheetIndex = 0;
    v10->mCellStyleXfsOffset = 0;
    v10->mDefaultColumnWidth = -1.0;
    v10->mDefaultRowHeight = -1.0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mArrayedFormulas = v10->mArrayedFormulas;
    v10->mArrayedFormulas = v11;

    v13 = [[EXOfficeArtState alloc] initWithExcelState:v10];
    mOfficeArtState = v10->mOfficeArtState;
    v10->mOfficeArtState = v13;

    v15 = [[EXOAVState alloc] initWithEXReadState:v10 packagePart:0];
    mOAVState = v10->mOAVState;
    v10->mOAVState = v15;

    [(OAXDrawingState *)v10->mOfficeArtState setOavState:v10->mOAVState];
    [(OAVReadState *)v10->mOAVState setOaxState:v10->mOfficeArtState];
    v10->mMaxColumnsWarned = 0;
    v10->mMaxRowsWarned = 0;
    v10->mIsPredefinedTableStylesRead = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mReferenceForCommentTextBox = v10->mReferenceForCommentTextBox;
    v10->mReferenceForCommentTextBox = v17;

    v10->mIsPredefinedDxfsBeingRead = 0;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mLegacyDrawables = v10->mLegacyDrawables;
    v10->mLegacyDrawables = v19;

    v10->mCurrentRowMinColumnIndex = 0;
    v10->mCurrentRowMaxColumnIndex = 0;
  }

  return v10;
}

- (unsigned)currentSheetIndex
{
  return self->mCurrentSheetIndex;
}

- (void)setCurrentSheetIndex:(unsigned int)a3
{
  self->mCurrentSheetIndex = a3;
}

- (unsigned)currentRowMinColumnIndex
{
  return self->mCurrentRowMinColumnIndex;
}

- (void)setCurrentRowMinColumnIndex:(unsigned int)a3
{
  self->mCurrentRowMinColumnIndex = a3;
}

- (unsigned)currentRowMaxColumnIndex
{
  return self->mCurrentRowMaxColumnIndex;
}

- (void)setCurrentRowMaxColumnIndex:(unsigned int)a3
{
  self->mCurrentRowMaxColumnIndex = a3;
}

- (id)workbook
{
  return self->mWorkbook;
}

- (void)setWorkbook:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->mWorkbook, a3);
  mOfficeArtState = self->mOfficeArtState;
  v6 = [v9 blips];
  [(OAXDrawingState *)mOfficeArtState setTargetBlipCollection:v6];

  id v7 = self->mOfficeArtState;
  id v8 = [v9 bulletBlips];
  [(OAXDrawingState *)v7 setTargetBulletBlipArray:v8];
}

- (id)resources
{
  return self->mResources;
}

- (void)setResources:(id)a3
{
}

- (id)currentSheet
{
  return self->mCurrentSheet;
}

- (void)setCurrentSheet:(id)a3
{
  v5 = (EDSheet *)a3;
  if (self->mCurrentSheet != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->mCurrentSheet, a3);
    p_mSharedFormulasMap = &self->mSharedFormulasMap;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)p_mSharedFormulasMap, (void *)p_mSharedFormulasMap->__tree_.__pair1_.__value_.__left_);
    v5 = v7;
    p_mSharedFormulasMap->__tree_.__begin_node_ = &p_mSharedFormulasMap->__tree_.__pair1_;
    p_mSharedFormulasMap->__tree_.__pair3_.__value_ = 0;
    p_mSharedFormulasMap->__tree_.__pair1_.__value_.__left_ = 0;
  }
}

- (unint64_t)cellStyleXfsOffset
{
  return self->mCellStyleXfsOffset;
}

- (void)setCellStyleXfsOffset:(unint64_t)a3
{
  self->mCellStyleXfsOffset = a3;
}

- (double)defaultColumnWidth
{
  return self->mDefaultColumnWidth;
}

- (void)setDefaultColumnWidth:(double)a3
{
  self->mDefaultColumnWidth = a3;
}

- (double)defaultRowHeight
{
  return self->mDefaultRowHeight;
}

- (void)setDefaultRowHeight:(double)a3
{
  self->mDefaultRowHeight = a3;
}

- (id)currentPart
{
  return self->mCurrentPart;
}

- (void)setCurrentPart:(id)a3
{
  v5 = (OCPPackagePart *)a3;
  if (self->mCurrentPart != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mCurrentPart, a3);
    v5 = v6;
  }
}

- (id)workbookPart
{
  return self->mWorkbookPart;
}

- (unint64_t)sharedBaseFormulaIndexWithIndex:(int64_t)a3
{
  left = (char *)self->mSharedFormulasMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return 0xFFFFFFFFLL;
  }
  p_pair1 = &self->mSharedFormulasMap.__tree_.__pair1_;
  do
  {
    int64_t v5 = *((void *)left + 4);
    BOOL v6 = v5 < a3;
    if (v5 >= a3) {
      id v7 = (char **)left;
    }
    else {
      id v7 = (char **)(left + 8);
    }
    if (!v6) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<long, unsigned long>, void *>>> *)left;
    }
    left = *v7;
  }
  while (*v7);
  if (p_pair1 != &self->mSharedFormulasMap.__tree_.__pair1_ && (uint64_t)p_pair1[4].__value_.__left_ <= a3) {
    return (unint64_t)p_pair1[5].__value_.__left_;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

- (void)addSharedBaseFormulaIndex:(unint64_t)a3 withIndex:(int64_t)a4
{
  uint64_t v4 = a4;
  int64_t v5 = &v4;
  std::__tree<std::__value_type<long,unsigned long>,std::__map_value_compare<long,std::__value_type<long,unsigned long>,std::less<long>,true>,std::allocator<std::__value_type<long,unsigned long>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->mSharedFormulasMap, &v4, (uint64_t)&std::piecewise_construct, &v5)[5] = a3;
}

- (id)arrayedFormulas
{
  return self->mArrayedFormulas;
}

- (id)sheetDimension
{
  return self->mSheetDimension;
}

- (void)setSheetDimension:(id)a3
{
  int64_t v5 = (EDReference *)a3;
  if (self->mSheetDimension != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->mSheetDimension, a3);
    int64_t v5 = v6;
  }
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (void)setOfficeArtState:(id)a3
{
  int64_t v5 = (EXOfficeArtState *)a3;
  if (self->mOfficeArtState != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->mOfficeArtState, a3);
    int64_t v5 = v6;
  }
}

- (id)oavState
{
  return self->mOAVState;
}

- (void)setTextBox:(id)a3 author:(id)a4 forReference:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[OITSUPair alloc] initWithFirst:v11 second:v8];
  [(NSMutableDictionary *)self->mReferenceForCommentTextBox setObject:v10 forKey:v9];
}

- (id)textBoxForReference:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mReferenceForCommentTextBox objectForKey:a3];
  uint64_t v4 = [v3 first];

  return v4;
}

- (id)authorForReference:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mReferenceForCommentTextBox objectForKey:a3];
  uint64_t v4 = [v3 second];

  return v4;
}

- (BOOL)isPredefinedTableStylesRead
{
  return self->mIsPredefinedTableStylesRead;
}

- (void)setPredefinedTableStylesRead:(BOOL)a3
{
  self->mIsPredefinedTableStylesRead = a3;
}

- (void)resetForNewSheet
{
  [(NSMutableDictionary *)self->mReferenceForCommentTextBox removeAllObjects];
  [(OAXDrawingState *)self->mOfficeArtState resetForNewDrawing];
  [(OAVReadState *)self->mOAVState resetForNewDrawing];
  mLegacyDrawables = self->mLegacyDrawables;
  [(NSMutableArray *)mLegacyDrawables removeAllObjects];
}

- (BOOL)isPredefinedDxfsBeingRead
{
  return self->mIsPredefinedDxfsBeingRead;
}

- (void)setPredefinedDxfsBeingRead:(BOOL)a3
{
  self->mIsPredefinedDxfsBeingRead = a3;
}

- (_xmlNs)relationshipNameSpaceForWorkbook
{
  return self->mRelationshipNS;
}

- (void)relationshipNameSpaceForWorkbook:(_xmlNs *)a3
{
  self->mRelationshipNS = a3;
}

- (id)columnWidthConvertor
{
  mColumnWidthConvertor = self->mColumnWidthConvertor;
  if (!mColumnWidthConvertor)
  {
    uint64_t v4 = objc_alloc_init(ECColumnWidthConvertor);
    int64_t v5 = self->mColumnWidthConvertor;
    self->mColumnWidthConvertor = v4;

    BOOL v6 = self->mColumnWidthConvertor;
    id v7 = [(EDResources *)self->mResources styles];
    id v8 = [v7 defaultWorkbookStyle];
    id v9 = [v8 font];
    [(ECColumnWidthConvertor *)v6 setupWithEDFont:v9 state:0];

    mColumnWidthConvertor = self->mColumnWidthConvertor;
  }
  return mColumnWidthConvertor;
}

- (id)legacyDrawables
{
  return self->mLegacyDrawables;
}

- (void)reportWarning:(id)a3
{
  id v6 = a3;
  mCurrentSheet = self->mCurrentSheet;
  if (mCurrentSheet) {
    [(EDSheet *)mCurrentSheet warnings];
  }
  else {
  int64_t v5 = [(EDWorkbook *)self->mWorkbook warnings];
  }
  [v5 addWarning:v6];
}

- (void)reportWorksheetWarning:(id)a3
{
  id v6 = a3;
  if (self->mCurrentSheet && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [(EDSheet *)self->mCurrentSheet worksheetWarnings];
  }
  else
  {
    uint64_t v4 = [(EDWorkbook *)self->mWorkbook warnings];
  }
  int64_t v5 = v4;
  [v4 addWarning:v6];
}

- (BOOL)isCancelled
{
  return [(TCCancelDelegate *)self->mCancelDelegate isCancelled];
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)EXReadState;
  -[OCXState setupNSForXMLFormat:](&v17, sel_setupNSForXMLFormat_);
  int64_t v5 = [CXNamespace alloc];
  if (v3)
  {
    id v6 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/spreadsheetml/2006/main"];
    id v7 = [(CXNamespace *)v5 initWithUri:"http://purl.oclc.org/ooxml/spreadsheetml/main" fallbackNamespace:v6];
    [(EXReadState *)self setEXSpreadsheetMLNamespace:v7];

    id v8 = [CXNamespace alloc];
    id v9 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing"];
    v10 = [(CXNamespace *)v8 initWithUri:"http://purl.oclc.org/ooxml/drawingml/spreadsheetDrawing" fallbackNamespace:v9];
    [(EXReadState *)self setEXSpreadsheetDrawingNamespace:v10];

    id v11 = [CXNamespace alloc];
    v12 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    v13 = [(CXNamespace *)v11 initWithUri:"http://purl.oclc.org/ooxml/officeDocument/relationships" fallbackNamespace:v12];
    [(EXReadState *)self setEXSpreadsheetRelationsNamespace:v13];
  }
  else
  {
    v14 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/spreadsheetml/2006/7/main"];
    v15 = [(CXNamespace *)v5 initWithUri:"http://schemas.openxmlformats.org/spreadsheetml/2006/main" fallbackNamespace:v14];
    [(EXReadState *)self setEXSpreadsheetMLNamespace:v15];

    v16 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing"];
    [(EXReadState *)self setEXSpreadsheetDrawingNamespace:v16];

    v12 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    [(EXReadState *)self setEXSpreadsheetRelationsNamespace:v12];
  }

  [(OAXDrawingState *)self->mOfficeArtState setupNSForXMLFormat:v3];
  [(OCXState *)self->mOAVState setupNSForXMLFormat:v3];
}

- (CXNamespace)EXSpreadsheetMLNamespace
{
  return self->mEXSpreadsheetMLNamespace;
}

- (void)setEXSpreadsheetMLNamespace:(id)a3
{
}

- (CXNamespace)EXSpreadsheetDrawingNamespace
{
  return self->mEXSpreadsheetDrawingNamespace;
}

- (void)setEXSpreadsheetDrawingNamespace:(id)a3
{
}

- (CXNamespace)EXSpreadsheetRelationsNamespace
{
  return self->mEXSpreadsheetRelationsNamespace;
}

- (void)setEXSpreadsheetRelationsNamespace:(id)a3
{
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEXSpreadsheetRelationsNamespace, 0);
  objc_storeStrong((id *)&self->mEXSpreadsheetDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mEXSpreadsheetMLNamespace, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
  objc_storeStrong((id *)&self->mLegacyDrawables, 0);
  objc_storeStrong((id *)&self->mColumnWidthConvertor, 0);
  objc_storeStrong((id *)&self->mReferenceForCommentTextBox, 0);
  objc_storeStrong((id *)&self->mOAVState, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mSheetDimension, 0);
  objc_storeStrong((id *)&self->mArrayedFormulas, 0);
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)&self->mSharedFormulasMap, (void *)self->mSharedFormulasMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->mWorkbookPart, 0);
  objc_storeStrong((id *)&self->mCurrentPart, 0);
  objc_storeStrong((id *)&self->mCurrentSheet, 0);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = (char *)self + 96;
  return self;
}

@end