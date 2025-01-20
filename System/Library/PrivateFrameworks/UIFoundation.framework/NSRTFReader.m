@interface NSRTFReader
+ (NSArray)defaultTextHighlightColorSchemes;
+ (NSArray)defaultTextHighlightStyles;
- (BOOL)_currentBorderIsTable;
- (BOOL)_currentTableCellIsPlaceholder;
- (BOOL)includesTextListMarkers;
- (CGSize)paperSize;
- (CGSize)viewSize;
- (NSRTFReader)initWithPath:(id)a3;
- (NSRTFReader)initWithRTF:(id)a3;
- (NSRTFReader)initWithRTFD:(id)a3;
- (NSRTFReader)initWithRTFDFileWrapper:(id)a3;
- (double)_updateFontSizeForTextScalingIfNeeded:(uint64_t)a1;
- (double)defaultTabInterval;
- (id)_RTFDFileWrapper;
- (id)_currentTable;
- (id)_currentTableCell;
- (id)_listDefinitions;
- (id)_mutableParagraphStyle;
- (id)attributedString;
- (id)attributedStringToEndOfGroup;
- (id)attributesAtEndOfGroup;
- (id)defaultParagraphStyle;
- (id)documentAttributes;
- (id)mutableAttributedString;
- (id)mutableAttributes;
- (int64_t)_currentListLevel;
- (int64_t)_currentListNumber;
- (int64_t)baseWritingDirection;
- (int64_t)cocoaPlatform;
- (int64_t)cocoaTextScaling;
- (uint64_t)_beginTableRow;
- (uint64_t)_clearTableCells;
- (uint64_t)_determineFinalTextScalingType;
- (uint64_t)_determineSourceTextScalingType;
- (uint64_t)_documentInfoDictionary;
- (uint64_t)_ensureTableCells;
- (uint64_t)_setTableCells;
- (unint64_t)_currentBorderEdge;
- (unint64_t)textFlow;
- (void)_addListDefinition:(id)a3 forKey:(int64_t)a4;
- (void)_addOverride:(int64_t)a3 forKey:(int64_t)a4;
- (void)_endTableCell;
- (void)_endTableCellDefinition;
- (void)_endTableRow;
- (void)_lastTableRow;
- (void)_mergeTableCellsHorizontally;
- (void)_mergeTableCellsVertically;
- (void)_paragraphInTable;
- (void)_popState;
- (void)_popTableState;
- (void)_pushState;
- (void)_pushTableState;
- (void)_setCurrentBorderEdge:(unint64_t)a3 isTable:(BOOL)a4;
- (void)_setCurrentListLevel:(int64_t)a3;
- (void)_setCurrentListNumber:(int64_t)a3;
- (void)_setRTFDFileWrapper:(id)a3;
- (void)_setSourceTextScaling:(int64_t)a3;
- (void)_setTableNestingLevel:(int64_t)a3;
- (void)_setTargetTextScaling:(int64_t)a3;
- (void)_updateAttributes;
- (void)dealloc;
- (void)finalize;
- (void)processString:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3;
- (void)setBottomMargin:(double)a3;
- (void)setDefaultTabInterval:(double)a3;
- (void)setHyphenationFactor:(float)a3;
- (void)setIncludesTextListMarkers:(BOOL)a3;
- (void)setLeftMargin:(double)a3;
- (void)setMutableAttributedString:(id)a3;
- (void)setPaperSize:(CGSize)a3;
- (void)setReadLimit:(int64_t)a3;
- (void)setRightMargin:(double)a3;
- (void)setTextFlow:(unint64_t)a3;
- (void)setThumbnailLimit:(int64_t)a3;
- (void)setTopMargin:(double)a3;
- (void)setViewKind:(int64_t)a3;
- (void)setViewScale:(int64_t)a3;
- (void)setViewSize:(CGSize)a3;
@end

@implementation NSRTFReader

- (NSRTFReader)initWithRTFD:(id)a3
{
  v4 = (void *)[objc_allocWithZone(MEMORY[0x1E4F28CF0]) initWithSerializedRepresentation:a3];
  if (!v4) {
    goto LABEL_13;
  }
  v5 = v4;
  int v6 = [v4 isDirectory];
  if (v6)
  {
    uint64_t v7 = rtfDataFromFileWrapper(v5);
  }
  else
  {
    if (![v5 isRegularFile])
    {
LABEL_12:

LABEL_13:
      return 0;
    }
    uint64_t v7 = [v5 regularFileContents];
  }
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v9 = [(NSRTFReader *)self initWithRTF:v8];
  self = v9;
  char v10 = v6 ^ 1;
  if (!v9) {
    char v10 = 1;
  }
  if (v10)
  {

    if (self) {
      return self;
    }
    goto LABEL_13;
  }
  [(NSRTFReader *)v9 _setRTFDFileWrapper:v5];

  return self;
}

- (NSRTFReader)initWithPath:(id)a3
{
  char v11 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v11))goto LABEL_8; {
  if (v11)
  }
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28CF0]);
    uint64_t v6 = objc_msgSend(v5, "initWithURL:options:error:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", a3), 0, 0);
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [(NSRTFReader *)self initWithRTFDFileWrapper:v6];
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  uint64_t v9 = [objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:a3];
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v7 = (void *)v9;
  uint64_t v8 = [(NSRTFReader *)self initWithRTF:v9];
LABEL_7:
  self = v8;

  if (!self) {
    goto LABEL_8;
  }
  return self;
}

- (NSRTFReader)initWithRTFDFileWrapper:(id)a3
{
  id v3 = a3;
  if ([a3 isSymbolicLink]) {
    id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28CF0]), "initWithURL:options:error:", objc_msgSend(v3, "symbolicLinkDestinationURL"), 0, 0);
  }
  if ([v3 isDirectory]
    && (uint64_t v5 = rtfDataFromFileWrapper(v3)) != 0
    && (uint64_t v6 = v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (uint64_t v7 = [(NSRTFReader *)self initWithRTF:v6], (self = v7) != 0))
  {
    [(NSRTFReader *)v7 _setRTFDFileWrapper:v3];
  }
  else
  {

    return 0;
  }
  return self;
}

- (NSRTFReader)initWithRTF:(id)a3
{
  uint64_t v5 = [(NSRTFReader *)self zone];
  v13.receiver = self;
  v13.super_class = (Class)NSRTFReader;
  uint64_t v6 = [(NSRTFReader *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    _NSRTFInit((uint64_t)&v6->_private);
    v7->_private.reader = v7;
    _NSRTFSetPanicProc((uint64_t)&v7->_private, (uint64_t)raiseRTFException);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 0, (uint64_t)unknownClass);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 2uLL, (uint64_t)textClass);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 3uLL, (uint64_t)controlClass);
    _NSRTFSetClassCallback((uint64_t)&v7->_private, 1uLL, (uint64_t)groupClass);
    v7->_cocoaVersion = -1;
    v7->_rtfData = (NSData *)[a3 copyWithZone:v5];
    v7->_curAttributes = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v5), "initWithCapacity:", 4);
    v7->_attributesStack = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v5), "initWithCapacity:", 4);
    v7->_attributeInfoStack = (NSMutableData *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA58], "allocWithZone:", v5), "initWithCapacity:", 192);
    v7->_topAttributedString = (NSMutableAttributedString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28E48], "allocWithZone:", v5), "init");
    v7->_fontTable = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v5), "initWithCapacity:", 4);
    v7->_attributeInfo.toUniCharEncoding = 2817;
    v7->_defaultToUniCharEncoding = 2817;
    v7->_explicitCharSetEncountered = 0;
    v7->_level = 0;
    v7->_paperSize.width = 612.0;
    v7->_viewSize = (CGSize)*MEMORY[0x1E4F28AE0];
    *(void *)&v7->_viewScale = 100;
    v7->_tMargin = 72.0;
    *(_OWORD *)&v7->_paperSize.height = xmmword_18E5F7840;
    *(_OWORD *)&v7->_rMargin = xmmword_18E5F7850;
    *(_OWORD *)&v7->_hyphenationFactor = xmmword_18E5F7860;
    uint64_t v8 = (NSZone *)[(NSRTFReader *)v7 zone];
    NSMapTableKeyCallBacks keyCallBacks = *(NSMapTableKeyCallBacks *)byte_1EDD499D8;
    NSMapTableValueCallBacks v11 = *(NSMapTableValueCallBacks *)*(void *)&MEMORY[0x1E4F28788];
    v7->_cachedRTFFontTable = NSCreateMapTableWithZone(&keyCallBacks, &v11, 0x14uLL, v8);
    *(_DWORD *)((char *)&v7->_attributeInfo + 42) = *(_DWORD *)((char *)&v7->_attributeInfo + 42) & 0xFFFFC07F | 0x80;
    v7->_attributeInfo.codePageEncoding = -1;
    v7->_currentDefinitionColumn = 0;
    *(void *)&v7->_currentRow = 0;
    v7->_colorTblColorSpace = -1;
    v7->_verticalOrientationLocation = 0x7FFFFFFFFFFFFFFFLL;
    *(void *)&long long v9 = -1;
    *((void *)&v9 + 1) = -1;
    *(_OWORD *)&v7->_cocoaTextScaling = v9;
    *(_OWORD *)&v7->_targetTextScaling = v9;
    v7->_finalTextScaling = -1;
    v7->_includesTextListMarkers = 1;
    _NSRTFSetInput(&v7->_private.reader, (uint64_t)[(NSData *)v7->_rtfData bytes], [(NSData *)v7->_rtfData length]);
    if (_NSRTFGetToken(&v7->_private) == 1 && !v7->_private.major)
    {
      _NSRTFRouteToken((uint64_t)&v7->_private);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)_setRTFDFileWrapper:(id)a3
{
  document = self->_document;
  if (document != a3)
  {

    self->_document = (NSFileWrapper *)a3;
  }
}

- (id)_RTFDFileWrapper
{
  return self->_document;
}

- (void)setReadLimit:(int64_t)a3
{
  self->_readLimit = a3;
}

- (void)setThumbnailLimit:(int64_t)a3
{
  self->_thumbnailLimit = a3;
}

- (void)setPaperSize:(CGSize)a3
{
  self->_paperSize = a3;
}

- (CGSize)paperSize
{
  double width = self->_paperSize.width;
  double height = self->_paperSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewKind:(int64_t)a3
{
  self->_viewKind = a3;
}

- (void)setViewScale:(int64_t)a3
{
  self->_viewScale = a3;
}

- (void)setLeftMargin:(double)a3
{
  self->_lMargin = a3;
}

- (void)setRightMargin:(double)a3
{
  self->_rMargin = a3;
}

- (void)setTopMargin:(double)a3
{
  self->_tMargin = a3;
}

- (void)setBottomMargin:(double)a3
{
  self->_bMargin = a3;
}

- (void)setHyphenationFactor:(float)a3
{
  self->_hyphenationFactor = a3;
}

- (void)setBackgroundColor:(id)a3
{
  documentBackgroundColor = self->_documentBackgroundColor;
  if (documentBackgroundColor != a3)
  {

    self->_documentBackgroundColor = (NSColor *)[a3 copy];
  }
}

- (void)setDefaultTabInterval:(double)a3
{
  self->_defaultTabInterval = a3;
}

- (double)defaultTabInterval
{
  return self->_defaultTabInterval;
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  self->_isRTLDocument = a3 == 1;
}

- (int64_t)baseWritingDirection
{
  return self->_isRTLDocument;
}

- (void)setTextFlow:(unint64_t)a3
{
  if (self->_textFlow != a3)
  {
    *(_DWORD *)((char *)&self->_attributeInfo + 42) &= ~0x20u;
    self->_textFlow = a3;
  }
}

- (unint64_t)textFlow
{
  return self->_textFlow;
}

- (int64_t)cocoaPlatform
{
  return self->_cocoaPlatform;
}

- (int64_t)cocoaTextScaling
{
  return self->_cocoaTextScaling;
}

- (void)_setTargetTextScaling:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    self->_targetTextScaling = a3;
  }
}

- (void)_setSourceTextScaling:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    self->_sourceTextScaling = a3;
  }
}

- (uint64_t)_ensureTableCells
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(id *)(result + 2888);
    if (!v2)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(v1 + 2888) = v2;
    }
    if (!*(void *)(v1 + 2872))
    {
      id v3 = objc_alloc_init(NSTextTable);
      *(void *)(v1 + 2872) = v3;
      [(NSTextTable *)v3 setNumberOfColumns:1];
      [*(id *)(v1 + 2872) setLayoutAlgorithm:0];
      [*(id *)(v1 + 2872) setCollapsesBorders:1];
      [*(id *)(v1 + 2872) setHidesEmptyCells:0];
      *(_DWORD *)(v1 + 2904) = 0;
      id v2 = *(id *)(v1 + 2888);
    }
    CGSize result = [v2 count];
    for (unint64_t i = result; i <= *(int *)(v1 + 2908) || i <= *(int *)(v1 + 2912); unint64_t i = result)
    {
      uint64_t v5 = [[NSTextTableBlock alloc] initWithTable:*(void *)(v1 + 2872) startingRow:*(int *)(v1 + 2904) rowSpan:1 startingColumn:i columnSpan:1];
      [(NSTextBlock *)v5 setWidth:0 type:0 forLayer:1.0];
      [(NSTextBlock *)v5 setWidth:0 type:-1 forLayer:0 edge:5.0];
      [(NSTextBlock *)v5 setWidth:0 type:-1 forLayer:2 edge:5.0];
      [(NSTextBlock *)v5 setVerticalAlignment:1];
      -[NSTextBlock setBorderColor:](v5, "setBorderColor:", [(Class)getNSColorClass_3[0]() colorWithCalibratedWhite:0.75 alpha:1.0]);
      [*(id *)(v1 + 2888) addObject:v5];

      CGSize result = [*(id *)(v1 + 2888) count];
    }
  }
  return result;
}

- (uint64_t)_beginTableRow
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 2888)) {
      *(void *)(result + 2888) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (!*(void *)(v1 + 2872))
    {
      uint64_t v2 = *(void *)(v1 + 2880);
      if (v2)
      {
        *(void *)(v1 + 2872) = v2;
        *(void *)(v1 + 2880) = 0;
      }
      else
      {
        id v3 = objc_alloc_init(NSTextTable);
        *(void *)(v1 + 2872) = v3;
        [(NSTextTable *)v3 setNumberOfColumns:1];
        [*(id *)(v1 + 2872) setLayoutAlgorithm:0];
        [*(id *)(v1 + 2872) setCollapsesBorders:1];
        [*(id *)(v1 + 2872) setHidesEmptyCells:0];
        *(_DWORD *)(v1 + 2904) = 0;
      }
    }
    *(void *)(v1 + 2908) = 0;
    return -[NSRTFReader _ensureTableCells](v1);
  }
  return result;
}

- (id)_currentTable
{
  return self->_currentTable;
}

- (id)_currentTableCell
{
  if (!self->_currentTable) {
    return 0;
  }
  -[NSRTFReader _ensureTableCells]((uint64_t)self);
  currentRowArray = self->_currentRowArray;
  uint64_t currentDefinitionColumn = self->_currentDefinitionColumn;

  return (id)[(NSMutableArray *)currentRowArray objectAtIndex:currentDefinitionColumn];
}

- (unint64_t)_currentBorderEdge
{
  return self->_currentBorderEdge;
}

- (BOOL)_currentBorderIsTable
{
  return self->_currentBorderIsTable;
}

- (BOOL)_currentTableCellIsPlaceholder
{
  currentTable = self->_currentTable;
  if (currentTable)
  {
    -[NSRTFReader _ensureTableCells]((uint64_t)self);
    uint64_t v4 = [(NSMutableArray *)self->_currentRowArray objectAtIndex:self->_currentColumn];
    int currentColumn = self->_currentColumn;
    uint64_t v6 = (currentColumn - 1);
    if (currentColumn >= 1 && [(NSMutableArray *)self->_currentRowArray objectAtIndex:v6] == v4)
    {
      LOBYTE(currentTable) = 1;
    }
    else
    {
      previousRowArray = self->_previousRowArray;
      LOBYTE(currentTable) = previousRowArray
                          && [(NSMutableArray *)previousRowArray count] > (unint64_t)self->_currentColumn
                          && -[NSMutableArray objectAtIndex:](self->_previousRowArray, "objectAtIndex:") == v4;
    }
  }
  if (self->_setTableCells) {
    return (char)currentTable;
  }
  else {
    return 1;
  }
}

- (void)_setCurrentBorderEdge:(unint64_t)a3 isTable:(BOOL)a4
{
  self->_currentBorderEdge = a3;
  self->_currentBorderIsTable = a4;
}

- (void)_pushTableState
{
  if (a1)
  {
    uint64_t v4 = objc_alloc_init(NSRTFReaderTableState);
    -[NSRTFReader _ensureTableCells](a1);
    uint64_t v2 = v4;
    v4->_currentTable = *(NSTextTable **)(a1 + 2872);
    v4->_previousTable = *(NSTextTable **)(a1 + 2880);
    v4->_currentRowArray = *(NSMutableArray **)(a1 + 2888);
    v4->_previousRowArray = *(NSMutableArray **)(a1 + 2896);
    v4->_currentRow = *(_DWORD *)(a1 + 2904);
    v4->_int currentColumn = *(_DWORD *)(a1 + 2908);
    v4->_uint64_t currentDefinitionColumn = *(_DWORD *)(a1 + 2912);
    v4->_currentRowIsLast = *(unsigned char *)(a1 + 2916);
    *(_OWORD *)(a1 + 2901) = 0u;
    *(_OWORD *)(a1 + 2872) = 0u;
    *(_OWORD *)(a1 + 2888) = 0u;
    id v3 = *(id *)(a1 + 2864);
    if (!v3)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v2 = v4;
      *(void *)(a1 + 2864) = v3;
    }
    [v3 addObject:v2];
  }
}

- (void)_popTableState
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 2864) lastObject];

    if (v2)
    {
      *(void *)(a1 + 2872) = *(id *)(v2 + 8);
      *(void *)(a1 + 2880) = *(id *)(v2 + 16);
      *(void *)(a1 + 2888) = *(id *)(v2 + 24);
      *(void *)(a1 + 2896) = *(id *)(v2 + 32);
      *(_DWORD *)(a1 + 2904) = *(_DWORD *)(v2 + 40);
      *(_DWORD *)(a1 + 2908) = *(_DWORD *)(v2 + 44);
      *(_DWORD *)(a1 + 2912) = *(_DWORD *)(v2 + 48);
      *(unsigned char *)(a1 + 2916) = *(unsigned char *)(v2 + 52);
    }
    else
    {
      *(_OWORD *)(a1 + 2872) = 0u;
      *(_OWORD *)(a1 + 2888) = 0u;
    }
    [*(id *)(a1 + 2864) removeLastObject];
    if (![*(id *)(a1 + 2864) count])
    {

      *(void *)(a1 + 2864) = 0;
    }
  }
}

- (uint64_t)_setTableCells
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 2864);
    if (v2)
    {
      uint64_t v3 = [v2 count];

      if (v3)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        for (uint64_t i = 0; i != v3; ++i)
        {
          uint64_t v6 = [*(id *)(v1 + 2864) objectAtIndex:i];
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(v6 + 24), "objectAtIndex:", *(int *)(v6 + 44)));
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(v1 + 2888), "objectAtIndex:", *(int *)(v1 + 2908)));
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend(*(id *)(v1 + 2888), "objectAtIndex:", *(int *)(v1 + 2908)), 0);
LABEL_9:
    *(void *)(v1 + 2856) = v4;
    CGSize result = objc_msgSend((id)objc_msgSend((id)v1, "_mutableParagraphStyle"), "setTextBlocks:", *(void *)(v1 + 2856));
    *(unsigned char *)(v1 + 2917) = 1;
  }
  return result;
}

- (uint64_t)_clearTableCells
{
  if (result)
  {
    uint64_t v1 = result;

    *(void *)(v1 + 2856) = 0;
    CGSize result = objc_msgSend((id)objc_msgSend((id)v1, "_mutableParagraphStyle"), "setTextBlocks:", *(void *)(v1 + 2856));
    *(unsigned char *)(v1 + 2917) = 0;
  }
  return result;
}

- (void)_setTableNestingLevel:(int64_t)a3
{
  unint64_t nestedTables = (unint64_t)self->_nestedTables;
  if (nestedTables) {
    unint64_t nestedTables = [(id)nestedTables count];
  }
  if (a3 <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = a3;
  }
  if (nestedTables + 1 >= v6)
  {
    if (nestedTables + 1 > v6)
    {
      if (nestedTables + 1 - v6 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = nestedTables + 1 - v6;
      }
      do
      {
        -[NSRTFReader _popTableState]((uint64_t)self);
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    for (unint64_t i = v6 + ~nestedTables; i; --i)
      -[NSRTFReader _pushTableState]((uint64_t)self);
  }
  if (a3 < 1)
  {
    -[NSRTFReader _clearTableCells]((uint64_t)self);

    *(_OWORD *)((char *)&self->_previousRowArray + 5) = 0u;
    *(_OWORD *)&self->_currentTable = 0u;
    *(_OWORD *)&self->_currentRowArray = 0u;
  }
  else
  {
    if (!self->_currentTable) {
      -[NSRTFReader _beginTableRow]((uint64_t)self);
    }
    -[NSRTFReader _ensureTableCells]((uint64_t)self);
    -[NSRTFReader _setTableCells]((uint64_t)self);
  }
}

- (void)_endTableCellDefinition
{
  if (!self->_currentTable) {
    -[NSRTFReader _beginTableRow]((uint64_t)self);
  }
  ++self->_currentDefinitionColumn;

  -[NSRTFReader _ensureTableCells]((uint64_t)self);
}

- (void)_paragraphInTable
{
  if (!self->_currentTable) {
    -[NSRTFReader _beginTableRow]((uint64_t)self);
  }
  -[NSRTFReader _ensureTableCells]((uint64_t)self);

  -[NSRTFReader _setTableCells]((uint64_t)self);
}

- (void)_endTableCell
{
  currentTable = self->_currentTable;
  if (!currentTable)
  {
    -[NSRTFReader _beginTableRow]((uint64_t)self);
    currentTable = self->_currentTable;
  }
  ++self->_currentColumn;
  if ([(NSTextTable *)currentTable numberOfColumns] < self->_currentColumn) {
    -[NSTextTable setNumberOfColumns:](self->_currentTable, "setNumberOfColumns:");
  }
  -[NSRTFReader _ensureTableCells]((uint64_t)self);

  -[NSRTFReader _setTableCells]((uint64_t)self);
}

- (void)_lastTableRow
{
  self->_currentRowIsLast = 1;
}

- (void)_endTableRow
{
  -[NSRTFReader _clearTableCells]((uint64_t)self);
  ++self->_currentRow;
  *(void *)&self->_int currentColumn = 0;

  currentTable = self->_currentTable;
  if (self->_currentRowIsLast)
  {

    self->_currentRow = 0;
    *(_OWORD *)&self->_currentTable = 0u;
    *(_OWORD *)&self->_currentRowArray = 0u;
    if ([(NSMutableArray *)self->_nestedTables count]) {
      -[NSRTFReader _popTableState]((uint64_t)self);
    }
  }
  else
  {
    self->_previousTable = currentTable;
    self->_previousRowArray = self->_currentRowArray;
    self->_currentTable = 0;
    self->_currentRowArray = 0;
  }
  self->_currentRowIsLast = 0;
}

- (void)_mergeTableCellsHorizontally
{
  int currentDefinitionColumn = self->_currentDefinitionColumn;
  if (currentDefinitionColumn >= 1)
  {
    id v4 = (void *)[(NSMutableArray *)self->_currentRowArray objectAtIndex:(currentDefinitionColumn - 1)];
    uint64_t v5 = [v4 startingColumn];
    uint64_t v6 = [v4 columnSpan];
    [(NSMutableArray *)self->_currentRowArray replaceObjectAtIndex:self->_currentDefinitionColumn withObject:v4];
    uint64_t v7 = self->_currentDefinitionColumn;
    if (v6 + v5 <= v7)
    {
      [v4 _setColumnSpan:v7 - v5 + 1];
    }
  }
}

- (void)_mergeTableCellsVertically
{
  if (self->_currentRow >= 1)
  {
    previousRowArray = self->_previousRowArray;
    if (previousRowArray)
    {
      if ([(NSMutableArray *)previousRowArray count] > (unint64_t)self->_currentDefinitionColumn)
      {
        id v4 = (void *)-[NSMutableArray objectAtIndex:](self->_previousRowArray, "objectAtIndex:");
        uint64_t v5 = [v4 startingRow];
        uint64_t v6 = [v4 rowSpan];
        [(NSMutableArray *)self->_currentRowArray replaceObjectAtIndex:self->_currentDefinitionColumn withObject:v4];
        uint64_t currentRow = self->_currentRow;
        if (v6 + v5 <= currentRow)
        {
          [v4 _setRowSpan:currentRow - v5 + 1];
        }
      }
    }
  }
}

- (id)documentAttributes
{
  v16 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", self->_paperSize.width, self->_paperSize.height);
  uint64_t v14 = [NSNumber numberWithDouble:self->_lMargin];
  uint64_t v13 = [NSNumber numberWithDouble:self->_rMargin];
  uint64_t v3 = [NSNumber numberWithDouble:self->_tMargin];
  uint64_t v4 = [NSNumber numberWithDouble:self->_bMargin];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", self->_tMargin, self->_lMargin, self->_bMargin, self->_rMargin);
  uint64_t v6 = [NSNumber numberWithDouble:self->_hyphenationFactor];
  uint64_t v7 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v15, @"PaperSize", v14, @"LeftMargin", v13, @"RightMargin", v3, @"TopMargin", v4, @"BottomMargin", v5, @"PaperMargin", v6, @"HyphenationFactor", objc_msgSend(NSNumber, "numberWithDouble:", self->_defaultTabInterval), @"DefaultTabInterval", 0);
  if (!NSEqualSizes(self->_viewSize, *MEMORY[0x1E4F28AE0])) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", self->_viewSize.width, self->_viewSize.height), @"ViewSize");
  }
  int viewScale = self->_viewScale;
  if (viewScale != 100) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", (double)viewScale), @"ViewZoom");
  }
  if (self->_viewKind) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:"), @"ViewMode");
  }
  int cocoaVersion = self->_cocoaVersion;
  if (cocoaVersion == -1 || cocoaVersion >= 1)
  {
    if (cocoaVersion == -1) {
      int cocoaVersion = 80;
    }
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", (double)self->_cocoaSubVersion / 1000.0 + (double)cocoaVersion), 0x1EDD510D0);
  }
  if (self->_readOnly) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:"), @"ReadOnly");
  }
  documentBackgroundColor = self->_documentBackgroundColor;
  if (documentBackgroundColor) {
    [v7 setObject:documentBackgroundColor forKey:@"BackgroundColor"];
  }
  if (self->_isRTLDocument) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"RightToLeftDocument");
  }
  if (self->_readLimit >= 1 && self->_private.rtfHeaderEndLocation) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"), @"NSRTFHeaderEndLocation");
  }
  if (self->_documentInfoDictionary) {
    objc_msgSend(v7, "addEntriesFromDictionary:");
  }
  layoutOrientationSections = self->_layoutOrientationSections;
  if (layoutOrientationSections) {
    [v7 setObject:layoutOrientationSections forKey:@"NSTextLayoutSectionsAttribute"];
  }
  if ((self->_cocoaTextScaling & 0x8000000000000000) == 0) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:"), @"TextScaling");
  }
  return v7;
}

- (void)setMutableAttributedString:(id)a3
{
  topAttributedString = self->_topAttributedString;
  if (topAttributedString != a3)
  {
    if (topAttributedString)
    {
      uint64_t v6 = [(NSMutableAttributedString *)topAttributedString length];
      uint64_t v7 = self->_topAttributedString;
      if (v6)
      {
        [a3 setAttributedString:v7];
        uint64_t v7 = self->_topAttributedString;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }

    self->_topAttributedString = (NSMutableAttributedString *)a3;
  }
}

- (id)mutableAttributedString
{
  return self->_topAttributedString;
}

- (id)mutableAttributes
{
  uint64_t v3 = (_NSAttributeInfo *)((char *)&self->_attributeInfo + 42);
  int v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  *(_DWORD *)((char *)&self->_attributeInfo + 42) = v4 & 0xFFFFFFDF;
  id result = self->_curAttributes;
  if ((v4 & 0x4000) != 0)
  {
    id result = (id)[result mutableCopy];
    self->_curAttributes = (NSMutableDictionary *)result;
    v3->toUniCharEncoding &= ~0x4000u;
  }
  return result;
}

- (id)defaultParagraphStyle
{
  id result = (id)defaultParagraphStyle_defaultParagraphStyle;
  if (!defaultParagraphStyle_defaultParagraphStyle)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    int v4 = objc_alloc_init(NSMutableParagraphStyle);
    [(NSMutableParagraphStyle *)v4 setTabStops:v3];
    [(NSMutableParagraphStyle *)v4 setBaseWritingDirection:0];
    [(NSMutableParagraphStyle *)v4 setAlignment:0];
    uint64_t v5 = 0;
    atomic_compare_exchange_strong(&defaultParagraphStyle_defaultParagraphStyle, (unint64_t *)&v5, (unint64_t)v4);
    if (v5) {

    }
    return (id)defaultParagraphStyle_defaultParagraphStyle;
  }
  return result;
}

- (id)_mutableParagraphStyle
{
  id result = self->_attributeInfo.paraStyle;
  if (result)
  {
    unsigned int v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42);
    if ((v4 & 0x8000) != 0)
    {
      id result = (id)[result mutableCopy];
      self->_attributeInfo.paraStyle = (NSMutableParagraphStyle *)result;
      unsigned int v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42) & 0xFFFF7FFF;
    }
  }
  else
  {
    uint64_t v5 = (NSMutableParagraphStyle *)objc_msgSend(-[NSRTFReader defaultParagraphStyle](self, "defaultParagraphStyle"), "mutableCopyWithZone:", -[NSRTFReader zone](self, "zone"));
    self->_attributeInfo.paraStyle = v5;
    [(NSMutableParagraphStyle *)v5 setDefaultTabInterval:self->_defaultTabInterval];
    if (self->_isRTLDocument) {
      [(NSMutableParagraphStyle *)self->_attributeInfo.paraStyle setBaseWritingDirection:1];
    }
    unsigned int v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42) & 0xFFFF7FFF;
    id result = self->_attributeInfo.paraStyle;
  }
  *(_DWORD *)((char *)&self->_attributeInfo + 42) = v4 & 0xFFFFFFF7;
  return result;
}

- (id)attributedStringToEndOfGroup
{
  unsigned int level = self->_level;
  curAttributedString = self->_curAttributedString;
  uint64_t v5 = (NSMutableAttributedString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28E48], "allocWithZone:", -[NSRTFReader zone](self, "zone")), "init");
  self->_curAttributedString = v5;
  do
  {
    if (_NSRTFGetToken(&self->_private) == 4) {
      break;
    }
    _NSRTFRouteToken((uint64_t)&self->_private);
    if (self->_level < level) {
      break;
    }
  }
  while (!self->_limitReached);
  self->_curAttributedString = curAttributedString;
  return v5;
}

- (id)attributedString
{
  unsigned int level = self->_level;
  topAttributedString = self->_topAttributedString;
  self->_curAttributedString = topAttributedString;
  [(NSMutableAttributedString *)topAttributedString beginEditing];
  do
  {
    if (_NSRTFGetToken(&self->_private) == 4) {
      break;
    }
    _NSRTFRouteToken((uint64_t)&self->_private);
    if (self->_level < level) {
      break;
    }
  }
  while (!self->_limitReached);
  [(NSMutableAttributedString *)self->_topAttributedString endEditing];
  if (self->_verticalOrientationLocation != 0x7FFFFFFFFFFFFFFFLL)
  {
    layoutOrientationSections = self->_layoutOrientationSections;
    if (!layoutOrientationSections)
    {
      layoutOrientationSections = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      self->_layoutOrientationSections = layoutOrientationSections;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = [NSNumber numberWithInteger:1];
    -[NSMutableArray addObject:](layoutOrientationSections, "addObject:", objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"NSTextLayoutSectionOrientation", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_verticalOrientationLocation, -[NSMutableAttributedString length](self->_curAttributedString, "length") - self->_verticalOrientationLocation), @"NSTextLayoutSectionRange", 0));
  }
  if (self->_private.class == 4) {
    return 0;
  }
  else {
    return self->_topAttributedString;
  }
}

- (id)attributesAtEndOfGroup
{
  id v3 = 0;
  unsigned int level = self->_level;
  p_private = &self->_private;
  do
  {
    if (_NSRTFGetToken(p_private) == 4) {
      break;
    }
    if (self->_private.class == 1 && self->_private.major == 1 && self->_level == level)
    {
      [(NSRTFReader *)self _updateAttributes];
      id v3 = (id)objc_msgSend(-[NSRTFReader mutableAttributes](self, "mutableAttributes"), "copyWithZone:", -[NSRTFReader zone](self, "zone"));
    }
    _NSRTFRouteToken((uint64_t)p_private);
  }
  while (self->_level >= level);
  return v3;
}

- (uint64_t)_documentInfoDictionary
{
  if (result)
  {
    uint64_t v1 = result;
    id result = *(void *)(result + 472);
    if (!result)
    {
      id result = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
      *(void *)(v1 + 472) = result;
    }
  }
  return result;
}

- (uint64_t)_determineSourceTextScalingType
{
  if (result)
  {
    uint64_t v1 = result;
    id result = *(void *)(result + 2968);
    if ((result & 0x8000000000000000) == 0) {
      goto LABEL_14;
    }
    uint64_t v2 = *(void *)(v1 + 2984);
    id result = *(void *)(v1 + 2992);
    if ((result & 0x8000000000000000) == 0 && (v2 & 0x8000000000000000) == 0) {
      goto LABEL_14;
    }
    int v3 = *(_DWORD *)(v1 + 340);
    if (v3 == -1) {
      int v3 = 80;
    }
    double v4 = (double)*(int *)(v1 + 344) / 1000.0 + (double)v3;
    if (v4 <= 80.0)
    {
      if (!v2)
      {
        id result = 1;
        goto LABEL_14;
      }
    }
    else
    {
      if (v4 < 2466.0)
      {
        id result = dyld_program_sdk_at_least() ^ 1;
LABEL_14:
        *(void *)(v1 + 2992) = result;
        return result;
      }
      id result = *(void *)(v1 + 2984);
      if ((v2 & 0x8000000000000000) == 0) {
        goto LABEL_14;
      }
    }
    id result = _NSTextScalingTypeForCurrentEnvironment();
    goto LABEL_14;
  }
  return result;
}

- (uint64_t)_determineFinalTextScalingType
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    id result = _NSTextScalingTypeForCurrentEnvironment();
    unint64_t v2 = result;
    if (result < 0) {
      id result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__determineFinalTextScalingType, v1, @"NSRTFReader.m", 1173, @"Scaling type for current environment must be >= 0");
    }
    unint64_t v3 = v1[373];
    if (v3 < 2 || (unint64_t v3 = v2, v2 <= 1))
    {
      v1[371] = v3;
      unint64_t v2 = v3;
    }
    v1[375] = v2;
  }
  return result;
}

- (double)_updateFontSizeForTextScalingIfNeeded:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if ((*(void *)(a1 + 2992) & 0x8000000000000000) != 0) {
    -[NSRTFReader _determineSourceTextScalingType](a1);
  }
  uint64_t v4 = *(void *)(a1 + 3000);
  if (v4 < 0)
  {
    -[NSRTFReader _determineFinalTextScalingType](a1);
    uint64_t v4 = *(void *)(a1 + 3000);
  }
  uint64_t v5 = *(void *)(a1 + 2992);
  if (v5 == v4) {
    return a2;
  }

  return _NSTextScalingConvertFontPointSize(v5, v4, a2);
}

- (void)_updateAttributes
{
  v27[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (unsigned int *)((char *)&self->_attributeInfo + 42);
  int v4 = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  if ((v4 & 4) != 0)
  {
    if ((v4 & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    if (self->_readLimit <= 0
      && (double v5 = -[NSRTFReader _updateFontSizeForTextScalingIfNeeded:]((uint64_t)self, self->_attributeInfo.fontSize),
          self->_readLimit < 1))
    {
      double v19 = v5;
      font = self->_attributeInfo.font;
      unsigned int v20 = *v3;
      int fontPalette = (unsigned __int16)self->_attributeInfo.fontPalette;
      v22 = [(UIFont *)font fontDescriptor];
      UIFontDescriptorSymbolicTraits v23 = [(UIFontDescriptor *)v22 symbolicTraits];
      unsigned int v24 = __rbit32(v20) >> 30;
      if (fontPalette)
      {
        uint64_t v26 = *MEMORY[0x1E4F245C8];
        v27[0] = [NSNumber numberWithShort:(__int16)fontPalette];
        v22 = -[UIFontDescriptor fontDescriptorByAddingAttributes:](v22, "fontDescriptorByAddingAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1]);
      }
      if ((v24 & ~v23) != 0) {
        v22 = [(UIFontDescriptor *)v22 fontDescriptorWithSymbolicTraits:v23 & 0xF0000000 | v24];
      }
      if (![(UIFontDescriptor *)[(UIFont *)font fontDescriptor] isEqual:v22]|| ([(UIFont *)font pointSize], v25 != v19))
      {
        font = +[UIFont fontWithDescriptor:v22 size:v19];
      }
    }
    else
    {
      font = self->_attributeInfo.font;
    }
    unsigned int v7 = *v3;
    if (font)
    {
      *unint64_t v3 = v7 & 0xFFFFFFDF;
      curAttributes = self->_curAttributes;
      if ((v7 & 0x4000) != 0)
      {
        curAttributes = (NSMutableDictionary *)[(NSMutableDictionary *)curAttributes mutableCopy];
        self->_curAttributes = curAttributes;
        *v3 &= ~0x4000u;
      }
      [(NSMutableDictionary *)curAttributes setObject:font forKey:@"NSFont"];
      unsigned int v7 = *v3;
    }
    int v4 = v7 | 4;
    *unint64_t v3 = v4;
    if ((v4 & 8) != 0)
    {
LABEL_3:
      if ((v4 & 0x10) != 0) {
        return;
      }
      goto LABEL_22;
    }
  }
  paraStyle = self->_attributeInfo.paraStyle;
  if (paraStyle)
  {
    char v10 = [(NSParagraphStyle *)self->_attributeInfo.paraStyle textBlocks];
    if (v10 == self->_textBlocks || (-[NSArray isEqual:](v10, "isEqual:") & 1) != 0)
    {
      id v11 = [(NSMutableParagraphStyle *)paraStyle copyWithZone:[(NSRTFReader *)self zone]];
    }
    else
    {
      id v11 = [(NSParagraphStyle *)paraStyle mutableCopyWithZone:[(NSRTFReader *)self zone]];
      [v11 setTextBlocks:self->_textBlocks];
    }
    unsigned int v12 = *v3;
    *v3 &= ~0x20u;
    uint64_t v13 = self->_curAttributes;
    if ((v12 & 0x4000) != 0)
    {
      uint64_t v13 = (NSMutableDictionary *)[(NSMutableDictionary *)v13 mutableCopy];
      self->_curAttributes = v13;
      *v3 &= ~0x4000u;
    }
    [(NSMutableDictionary *)v13 setObject:v11 forKey:@"NSParagraphStyle"];

    int v4 = *v3;
  }
  v4 |= 8u;
  *unint64_t v3 = v4;
  if ((v4 & 0x10) == 0)
  {
LABEL_22:
    double kern = self->_attributeInfo.kern;
    unsigned int v15 = v4 & 0xFFFFFFDF;
    if (kern == 0.0)
    {
      *unint64_t v3 = v15;
      v16 = self->_curAttributes;
      if ((v4 & 0x4000) != 0)
      {
        v16 = (NSMutableDictionary *)[(NSMutableDictionary *)v16 mutableCopy];
        self->_curAttributes = v16;
        *v3 &= ~0x4000u;
      }
      [(NSMutableDictionary *)v16 removeObjectForKey:@"NSKern"];
    }
    else
    {
      *unint64_t v3 = v15;
      v17 = self->_curAttributes;
      if (kern == -100000.0)
      {
        if ((v4 & 0x4000) != 0)
        {
          v17 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_curAttributes mutableCopy];
          self->_curAttributes = v17;
          *v3 &= ~0x4000u;
        }
        v18 = NSNumber;
        double kern = 0.0;
      }
      else
      {
        if ((v4 & 0x4000) != 0)
        {
          v17 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_curAttributes mutableCopy];
          self->_curAttributes = v17;
          *v3 &= ~0x4000u;
          double kern = self->_attributeInfo.kern;
        }
        v18 = NSNumber;
      }
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", [v18 numberWithDouble:kern], @"NSKern");
    }
    *v3 |= 0x10u;
  }
}

- (int64_t)_currentListNumber
{
  return self->_currentListNumber;
}

- (void)_setCurrentListNumber:(int64_t)a3
{
  self->_currentListNumber = a3;
}

- (int64_t)_currentListLevel
{
  return self->_currentListLevel;
}

- (void)_setCurrentListLevel:(int64_t)a3
{
  self->_currentListLevel = a3;
}

- (id)_listDefinitions
{
  return self->_listDefinitions;
}

- (void)_addListDefinition:(id)a3 forKey:(int64_t)a4
{
  listDefinitions = self->_listDefinitions;
  if (!listDefinitions)
  {
    listDefinitions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_listDefinitions = listDefinitions;
  }
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithArray:a3];
  uint64_t v9 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)listDefinitions setObject:v8 forKey:v9];
}

- (void)_addOverride:(int64_t)a3 forKey:(int64_t)a4
{
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_listDefinitions, "objectForKey:", [NSNumber numberWithInteger:a4]);
  uint64_t v7 = [v6 count];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = v7;
    char v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = 0;
    do
    {
      unsigned int v12 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v11), "copy");
      [v10 addObject:v12];

      ++v11;
    }
    while (v9 != v11);
    [(NSRTFReader *)self _addListDefinition:v10 forKey:a3];
  }
}

- (void)processString:(id)a3
{
  unint64_t v5 = [(NSMutableAttributedString *)self->_curAttributedString length];
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_curAttributedString, "replaceCharactersInRange:withString:", v5, 0, a3);
  unint64_t v6 = [(NSMutableAttributedString *)self->_curAttributedString length];
  uint64_t v7 = (_NSAttributeInfo *)((char *)&self->_attributeInfo + 42);
  unsigned int toUniCharEncoding = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  if ((~toUniCharEncoding & 0x1C) != 0)
  {
    [(NSRTFReader *)self _updateAttributes];
    unsigned int toUniCharEncoding = v7->toUniCharEncoding;
  }
  if ((toUniCharEncoding & 0x20) == 0)
  {
    if (self->_readLimit > 0) {
      goto LABEL_5;
    }
    -[NSMutableAttributedString setAttributes:range:](self->_curAttributedString, "setAttributes:range:", self->_curAttributes, v5, v6 - v5);
    if (!v5
      || ((double v25 = (void *)[(NSMutableAttributedString *)self->_curAttributedString string],
           v12 = (void *)[(NSMutableDictionary *)self->_curAttributes objectForKey:@"NSParagraphStyle"], uint64_t v13 = [(NSMutableAttributedString *)self->_curAttributedString attribute:@"NSParagraphStyle" atIndex:v5 - 1 effectiveRange:0], v12)? (v14 = v13 == 0): (v14 = 1), !v14 ? (v15 = v6 > v5) : (v15 = 0), !v15))
    {
LABEL_35:
      int textFlow = self->_textFlow;
      if (textFlow == 4) {
        goto LABEL_38;
      }
      if (textFlow == 1)
      {
        if (self->_verticalOrientationLocation == 0x7FFFFFFFFFFFFFFFLL) {
          self->_verticalOrientationLocation = v5;
        }
        goto LABEL_5;
      }
      if (!self->_textFlow)
      {
LABEL_38:
        if (self->_verticalOrientationLocation != 0x7FFFFFFFFFFFFFFFLL)
        {
          layoutOrientationSections = self->_layoutOrientationSections;
          if (!layoutOrientationSections)
          {
            layoutOrientationSections = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
            self->_layoutOrientationSections = layoutOrientationSections;
          }
          UIFontDescriptorSymbolicTraits v23 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v24 = [NSNumber numberWithInteger:1];
          -[NSMutableArray addObject:](layoutOrientationSections, "addObject:", objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, @"NSTextLayoutSectionOrientation", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_verticalOrientationLocation, v5 - self->_verticalOrientationLocation), @"NSTextLayoutSectionRange", 0));
          self->_verticalOrientationLocation = 0x7FFFFFFFFFFFFFFFLL;
          int textFlow = self->_textFlow;
        }
        if (textFlow == 4) {
          -[NSMutableAttributedString addAttribute:value:range:](self->_curAttributedString, "addAttribute:value:range:", @"CTVerticalForms", [NSNumber numberWithInteger:0], v5, objc_msgSend(a3, "length"));
        }
      }
LABEL_5:
      v7->toUniCharEncoding |= 0x20u;
      goto LABEL_6;
    }
    uint64_t v16 = v13;
    int v17 = [v25 characterAtIndex:v5 - 1];
    if (v17 > 132)
    {
      if ((v17 - 8232) < 2 || v17 == 133) {
        goto LABEL_35;
      }
    }
    else if (v17 == 10 {
           || v17 == 12
    }
           || v17 == 13
           && (v5 >= [v25 length] || objc_msgSend(v25, "characterAtIndex:", v5) != 10))
    {
      goto LABEL_35;
    }
    if (([v12 isEqual:v16] & 1) == 0)
    {
      curAttributedString = self->_curAttributedString;
      uint64_t v19 = objc_msgSend(v25, "paragraphRangeForRange:", v5, v6 - v5);
      [(NSMutableAttributedString *)curAttributedString addAttribute:@"NSParagraphStyle", v12, v19, v20 value range];
    }
    goto LABEL_35;
  }
LABEL_6:
  previousTable = self->_previousTable;
  if (previousTable)
  {

    self->_previousTable = 0;
    self->_uint64_t currentRow = 0;
  }
  int64_t readLimit = self->_readLimit;
  if (readLimit >= 1 && v6 > readLimit) {
    self->_limitReached = 1;
  }
  int64_t thumbnailLimit = self->_thumbnailLimit;
  if (thumbnailLimit >= 1 && v6 > thumbnailLimit) {
    self->_limitReached = 1;
  }
}

- (void)_pushState
{
  *(_DWORD *)((char *)&self->_attributeInfo + 42) |= 0xC000u;
}

- (void)_popState
{
  --self->_level;
  unint64_t v3 = (_NSAttributeInfo *)((char *)&self->_attributeInfo + 42);
  unsigned int toUniCharEncoding = *(_DWORD *)((char *)&self->_attributeInfo + 42);
  if ((toUniCharEncoding & 0x4000) == 0)
  {

    unsigned int toUniCharEncoding = v3->toUniCharEncoding;
  }
  if ((toUniCharEncoding & 0x8000) == 0) {

  }
  self->_curAttributes = (NSMutableDictionary *)[(NSMutableArray *)self->_attributesStack lastObject];
  [(NSMutableArray *)self->_attributesStack removeLastObject];
  -[NSMutableData getBytes:range:](self->_attributeInfoStack, "getBytes:range:", &self->_attributeInfo, 48 * self->_level, 48);
  [(NSMutableData *)self->_attributeInfoStack setLength:48 * self->_level];
  v3->toUniCharEncoding &= ~0x20u;
}

- (void)dealloc
{
  _NSRTFDealloc(&self->_private, a2);

  cachedRTFFontTable = self->_cachedRTFFontTable;
  if (cachedRTFFontTable) {
    NSFreeMapTable(cachedRTFFontTable);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSRTFReader;
  [(NSRTFReader *)&v4 dealloc];
}

- (void)finalize
{
  _NSRTFDealloc(&self->_private, a2);

  cachedRTFFontTable = self->_cachedRTFFontTable;
  if (cachedRTFFontTable) {
    NSFreeMapTable(cachedRTFFontTable);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSRTFReader;
  [(NSRTFReader *)&v4 finalize];
}

+ (NSArray)defaultTextHighlightStyles
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"NSTextHighlightStyleDefault";
  v3[1] = @"NSTextHighlightStyleOutlined";
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
}

+ (NSArray)defaultTextHighlightColorSchemes
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = @"NSTextHighlightColorSchemePurple";
  v3[1] = @"NSTextHighlightColorSchemePink";
  v3[2] = @"NSTextHighlightColorSchemeOrange";
  void v3[3] = @"NSTextHighlightColorSchemeMint";
  v3[4] = @"NSTextHighlightColorSchemeBlue";
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
}

- (BOOL)includesTextListMarkers
{
  return self->_includesTextListMarkers;
}

- (void)setIncludesTextListMarkers:(BOOL)a3
{
  self->_includesTextListMarkers = a3;
}

@end