@interface WBReader
- (BOOL)reportProgress;
- (BOOL)start;
- (NSMutableDictionary)previousFlowElement;
- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4;
- (OCCEncryptionInfoReader)encryptionInfoReader;
- (WBReader)initWithCancelDelegate:(id)a3;
- (WBTextBoxReaderInfo)textBoxInfoAtIndex:(unint64_t)a3;
- (WDDocument)targetDocument;
- (WrdEshObjectFactory)eshObjectFactory;
- (id)annotationOwner:(int)a3;
- (id)annotationRangeStart;
- (id)annotationRangeStartForBookmarkIndex:(unint64_t)a3;
- (id)drawableForShapeId:(unsigned int)a3;
- (id)fontAtIndex:(int)a3;
- (id)officeArtState;
- (id)read;
- (id)readCharactersForTextRun:(WrdTextRun *)a3;
- (id)readCharactersFrom:(unsigned int)a3 to:(unsigned int)a4 textType:(int)a5;
- (id)styleAtIndex:(int)a3;
- (id)styleAtIndex:(int)a3 expectedType:(int)a4;
- (unint64_t)textBoxCount;
- (void)addFont:(id)a3 index:(int)a4;
- (void)addStyle:(id)a3 index:(int)a4;
- (void)annotationBookmarkTable;
- (void)annotationTable;
- (void)bookmarkTable;
- (void)cacheTextBox:(id)a3 withChainIndex:(unsigned __int16)a4;
- (void)dealloc;
- (void)endnoteTable;
- (void)fieldPositionTableForTextType:(int)a3;
- (void)fileShapeAddressHeaderTable;
- (void)fileShapeAddressTable;
- (void)footnoteTable;
- (void)headerStoryTable;
- (void)initialize;
- (void)lastRowParagraphProperties;
- (void)setAnnotationRangeStart:(id)a3;
- (void)setAnnotationRangeStart:(id)a3 forBookmarkIndex:(unint64_t)a4;
- (void)setLastRowParagraphProperties:(void *)a3;
- (void)setOfficeArtState:(id)a3;
- (void)setReportProgress:(BOOL)a3;
- (void)setTargetDocument:(id)a3;
- (void)storyTable;
- (void)tableHeaders;
@end

@implementation WBReader

- (BOOL)start
{
  v3 = [(WBReader *)self wrdReader];
  v4 = [(WBReader *)self wrdReader];
  if (v4)
  {
    v5 = [(OCDReader *)self fileName];

    if (v5)
    {
      id v6 = [(OCDReader *)self fileName];
      v7 = fopen((const char *)[v6 UTF8String], "rb");

      if (v7)
      {
        [(OCBReader *)self setFile:v7];
        (*(void (**)(void *, __sFILE *))(*(void *)v3 + 16))(v3, [(OCBReader *)self file]);
LABEL_7:
        LOBYTE(v4) = 1;
        return (char)v4;
      }
      uint64_t v12 = TCUnknownProblemMessage;
      v13 = [(OCDReader *)self fileName];
      +[TCMessageException raise:](TCMessageException, "raise:", v12, v13);
    }
    else
    {
      v8 = [(OCDReader *)self data];

      if (v8)
      {
        id v9 = [(OCDReader *)self data];
        uint64_t v10 = [v9 bytes];
        v11 = [(OCDReader *)self data];
        (*(void (**)(void *, uint64_t, uint64_t))(*(void *)v3 + 120))(v3, v10, [v11 length]);

        goto LABEL_7;
      }
    }
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  v2 = [(WBReader *)self wrdReader];
  if (v2) {
    return v2 + 3;
  }
  else {
    return 0;
  }
}

- (id)read
{
  v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  [(OCDEncryptedReader *)self useUnencryptedDocument];
  [(WBReader *)self initialize];
  v5 = +[WBDocument readFrom:self];

  return v5;
}

- (void)initialize
{
  v3 = [(WBReader *)self wrdReader];
  v4 = +[WBObjectFactory create:](WBObjectFactory, "create:", 38, WrdBinaryReader::initForReading(v3));
  if (v4) {
  else
  }
    v5 = 0;
  self->mFootnoteTable = v5;
  v5[2] = 0;
  (*((void (**)(WrdParser **))*v3 + 34))(v3);
  id v6 = +[WBObjectFactory create:38];
  if (v6) {
  else
  }
    v7 = 0;
  self->mEndnoteTable = v7;
  v7[2] = 1;
  (*((void (**)(WrdParser **))*v3 + 34))(v3);
  v8 = +[WBObjectFactory create:2];
  if (v8) {
  else
  }
    id v9 = 0;
  self->mAnnotationTable = v9;
  (*((void (**)(WrdParser **))*v3 + 37))(v3);
  uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  mAnnotationOwners = self->mAnnotationOwners;
  self->mAnnotationOwners = v10;

  uint64_t v12 = +[WBObjectFactory create:53];
  if (v12) {
  else
  }
    v13 = 0;
  *((_DWORD *)v13 + 2) = 36;
  (*((void (**)(WrdParser **, void *))*v3 + 38))(v3, v13);
  uint64_t v14 = (*(void *)(*((void *)v13 + 2) + 16) - *(void *)(*((void *)v13 + 2) + 8)) >> 3;
  if ((int)v14 >= 1)
  {
    int v15 = 0;
    do
    {
      v16 = objc_msgSend([NSString alloc], "initWithCsString:", WrdEmbeddedTTFRecordTable::getEmbeddedFontReference(*((WrdEmbeddedTTFRecordTable **)v13 + 2), (unsigned __int16)v15));
      [(NSMutableArray *)self->mAnnotationOwners addObject:v16];

      ++v15;
    }
    while (v14 != v15);
  }
  (*(void (**)(void *))(*(void *)v13 + 8))(v13);
  v17 = +[WBObjectFactory create:13];
  if (v17) {
  else
  }
    v18 = 0;
  self->mTableHeaders = v18;
  (*((void (**)(WrdParser **))*v3 + 43))(v3);
  v19 = +[WBObjectFactory create:8];
  if (v19) {
  else
  }
    v20 = 0;
  self->mBookmarkTable = v20;
  (*((void (**)(WrdParser **))*v3 + 33))(v3);
  v21 = +[WBObjectFactory create:8];
  if (v21) {
  else
  }
    v22 = 0;
  self->mAnnotationBookmarkTable = v22;
  v22[2] = 4;
  (*((void (**)(WrdParser **))*v3 + 33))(v3);
  uint64_t v23 = 0;
  while (1)
  {
    if (v23 == 3)
    {
      self->mFieldPositionTables[3] = 0;
    }
    else
    {
      v24 = +[WBObjectFactory create:23];
      if (v24) {
      else
      }
        v25 = 0;
      self->mFieldPositionTables[v23] = v25;
      *((_DWORD *)v25 + 2) = v23;
      (*((void (**)(WrdParser **))*v3 + 40))(v3);
    }
    if (++v23 == 8)
    {
      v26 = +[WBObjectFactory create:51];
      if (v26) {
      else
      }
        v27 = 0;
      self->mStoryTable = v27;
      v27[2] = 6;
      (*((void (**)(WrdParser **))*v3 + 42))(v3);
      v28 = +[WBObjectFactory create:51];
      if (v28) {
      else
      }
        v29 = 0;
      self->mHeaderStoryTable = v29;
      v29[2] = 7;
      (*((void (**)(WrdParser **))*v3 + 42))(v3);
      v30 = +[WBObjectFactory create:25];
      if (v30) {
      else
      }
        v31 = 0;
      self->mFileShapeAddressTable = v31;
      v31[2] = 0;
      (*((void (**)(WrdParser **))*v3 + 41))(v3);
      v32 = +[WBObjectFactory create:25];
      if (v32) {
      else
      }
        v33 = 0;
      self->mFileShapeAddressHeaderTable = v33;
      v33[2] = 2;
      (*((void (**)(WrdParser **))*v3 + 41))(v3);
      v34 = +[ESDObjectFactory threadLocalFactory];
      v35 = operator new(0x10uLL);
      v35[8] = 0;
      *(void *)v35 = &unk_26EBE5E40;
      [v34 setEshFactory:v35];

      v36 = [[WBOfficeArtReaderState alloc] initWithClient:objc_opt_class()];
      mOfficeArtState = self->mOfficeArtState;
      self->mOfficeArtState = v36;

      [(WBOfficeArtReaderState *)self->mOfficeArtState setReader:self];
      operator new();
    }
  }
}

- (void)setTargetDocument:(id)a3
{
}

- (void)addFont:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    mIndexToFonts = self->mIndexToFonts;
    v8 = [NSNumber numberWithInt:v4];
    [(OITSUNoCopyDictionary *)mIndexToFonts setObject:v9 forKey:v8];

    id v6 = v9;
  }
}

- (void)addStyle:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  mIndexToStyles = self->mIndexToStyles;
  v7 = [NSNumber numberWithInt:v4];
  [(OITSUNoCopyDictionary *)mIndexToStyles setObject:v8 forKey:v7];
}

- (id)styleAtIndex:(int)a3
{
  mIndexToStyles = self->mIndexToStyles;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(OITSUNoCopyDictionary *)mIndexToStyles objectForKeyedSubscript:v4];

  return v5;
}

- (id)fontAtIndex:(int)a3
{
  mIndexToFonts = self->mIndexToFonts;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(OITSUNoCopyDictionary *)mIndexToFonts objectForKey:v4];

  return v5;
}

- (void)bookmarkTable
{
  return self->mBookmarkTable;
}

- (void)setReportProgress:(BOOL)a3
{
  self->mReportProgress = a3;
}

- (BOOL)reportProgress
{
  return self->mReportProgress;
}

- (void)footnoteTable
{
  return self->mFootnoteTable;
}

- (void)endnoteTable
{
  return self->mEndnoteTable;
}

- (void)annotationTable
{
  return self->mAnnotationTable;
}

- (void)annotationBookmarkTable
{
  return self->mAnnotationBookmarkTable;
}

- (void)fieldPositionTableForTextType:(int)a3
{
  return self->mFieldPositionTables[a3];
}

- (id)readCharactersForTextRun:(WrdTextRun *)a3
{
  return [(WBReader *)self readCharactersFrom:a3->var2 to:a3->var3 + a3->var2 textType:a3->var1];
}

- (id)readCharactersFrom:(unsigned int)a3 to:(unsigned int)a4 textType:(int)a5
{
  id v9 = [MEMORY[0x263F089D8] string];
  while (a3 < a4)
  {
    WrdText::WrdText((uint64_t)&v13, a5, a3, a4 - a3);
    uint64_t v10 = [(WBReader *)self wrdReader];
    (*(void (**)(void *, void **))(*(void *)v10 + 176))(v10, &v13);
    v11 = (void *)[[NSString alloc] initWithOcText:&v14];
    if (v11) {
      [v9 appendString:v11];
    }
    a3 += v14.var3;

    v13 = &unk_26EBE6E88;
    OcText::~OcText(&v14);
  }
  return v9;
}

- (id)annotationRangeStart
{
  return self->mAnnotationRangeStart;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (void)setOfficeArtState:(id)a3
{
}

- (void)setLastRowParagraphProperties:(void *)a3
{
  mLastRowParagraphProperties = self->mLastRowParagraphProperties;
  if (mLastRowParagraphProperties) {
    (*(void (**)(void *, SEL))(*(void *)mLastRowParagraphProperties + 8))(mLastRowParagraphProperties, a2);
  }
  self->mLastRowParagraphProperties = a3;
}

- (void)lastRowParagraphProperties
{
  return self->mLastRowParagraphProperties;
}

- (void)tableHeaders
{
  return self->mTableHeaders;
}

- (unint64_t)textBoxCount
{
  return (uint64_t)(*((void *)self->mTextBoxes + 1) - *(void *)self->mTextBoxes) >> 4;
}

- (void)dealloc
{
  v3 = [(WBReader *)self wrdReader];
  if (v3) {
    (*(void (**)(void *))(*(void *)v3 + 24))(v3);
  }
  mFootnoteTable = self->mFootnoteTable;
  if (mFootnoteTable) {
    (*(void (**)(void *))(*(void *)mFootnoteTable + 8))(mFootnoteTable);
  }
  mEndnoteTable = self->mEndnoteTable;
  if (mEndnoteTable) {
    (*(void (**)(void *))(*(void *)mEndnoteTable + 8))(mEndnoteTable);
  }
  mAnnotationTable = self->mAnnotationTable;
  if (mAnnotationTable) {
    (*(void (**)(void *))(*(void *)mAnnotationTable + 8))(mAnnotationTable);
  }
  mTableHeaders = self->mTableHeaders;
  if (mTableHeaders) {
    (*(void (**)(void *))(*(void *)mTableHeaders + 8))(mTableHeaders);
  }
  mBookmarkTable = self->mBookmarkTable;
  if (mBookmarkTable) {
    (*(void (**)(void *))(*(void *)mBookmarkTable + 8))(mBookmarkTable);
  }
  mAnnotationBookmarkTable = self->mAnnotationBookmarkTable;
  if (mAnnotationBookmarkTable) {
    (*(void (**)(void *))(*(void *)mAnnotationBookmarkTable + 8))(mAnnotationBookmarkTable);
  }
  mStoryTable = self->mStoryTable;
  if (mStoryTable) {
    (*(void (**)(void *))(*(void *)mStoryTable + 8))(mStoryTable);
  }
  mHeaderStoryTable = self->mHeaderStoryTable;
  if (mHeaderStoryTable) {
    (*(void (**)(void *))(*(void *)mHeaderStoryTable + 8))(mHeaderStoryTable);
  }
  mFileShapeAddressTable = self->mFileShapeAddressTable;
  if (mFileShapeAddressTable) {
    (*(void (**)(void *))(*(void *)mFileShapeAddressTable + 8))(mFileShapeAddressTable);
  }
  mFileShapeAddressHeaderTable = self->mFileShapeAddressHeaderTable;
  if (mFileShapeAddressHeaderTable) {
    (*(void (**)(void *))(*(void *)mFileShapeAddressHeaderTable + 8))(mFileShapeAddressHeaderTable);
  }
  mEshObjectFactory = self->mEshObjectFactory;
  if (mEshObjectFactory) {
    (*((void (**)(WrdEshObjectFactory *))mEshObjectFactory->var0 + 1))(mEshObjectFactory);
  }
  mLastRowParagraphProperties = self->mLastRowParagraphProperties;
  if (mLastRowParagraphProperties) {
    (*(void (**)(void *))(*(void *)mLastRowParagraphProperties + 8))(mLastRowParagraphProperties);
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    v17 = self->mFieldPositionTables[i];
    if (v17) {
      (*(void (**)(WrdFieldPositionTable *))(*(void *)v17 + 8))(v17);
    }
  }
  mTextBoxes = self->mTextBoxes;
  if (mTextBoxes)
  {
    v20 = (void **)self->mTextBoxes;
    std::vector<WBTextBoxReaderInfo>::__destroy_vector::operator()[abi:ne180100](&v20);
    MEMORY[0x23EC997B0](mTextBoxes, 0x20C40960023A9);
  }
  v19.receiver = self;
  v19.super_class = (Class)WBReader;
  [(OCBReader *)&v19 dealloc];
}

- (WDDocument)targetDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mTargetDocument);
  return (WDDocument *)WeakRetained;
}

- (void)cacheTextBox:(id)a3 withChainIndex:(unsigned __int16)a4
{
  id v6 = a3;
  mTextBoxes = (uint64_t *)self->mTextBoxes;
  id v8 = v6;
  unint64_t v9 = mTextBoxes[1];
  unint64_t v10 = mTextBoxes[2];
  if (v9 >= v10)
  {
    uint64_t v12 = (uint64_t)(v9 - *mTextBoxes) >> 4;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60) {
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v10 - *mTextBoxes;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    v25[4] = mTextBoxes + 2;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)(mTextBoxes + 2), v15);
    v18 = &v16[16 * v12];
    *(void *)v18 = v8;
    *((_WORD *)v18 + 4) = a4;
    uint64_t v19 = *mTextBoxes;
    uint64_t v20 = mTextBoxes[1];
    v21 = v18;
    if (v20 != *mTextBoxes)
    {
      uint64_t v22 = mTextBoxes[1];
      do
      {
        uint64_t v23 = *(void *)(v22 - 16);
        v22 -= 16;
        *(void *)uint64_t v22 = 0;
        *((void *)v21 - 2) = v23;
        v21 -= 16;
        *((_WORD *)v21 + 4) = *(_WORD *)(v22 + 8);
      }
      while (v22 != v19);
    }
    v11 = v18 + 16;
    uint64_t *mTextBoxes = (uint64_t)v21;
    v25[0] = v19;
    v25[1] = v19;
    mTextBoxes[1] = (uint64_t)(v18 + 16);
    v25[2] = v20;
    uint64_t v24 = mTextBoxes[2];
    mTextBoxes[2] = (uint64_t)&v16[16 * v17];
    v25[3] = v24;
    std::__split_buffer<WBTextBoxReaderInfo>::~__split_buffer((uint64_t)v25);
  }
  else
  {
    *(void *)unint64_t v9 = v8;
    *(_WORD *)(v9 + 8) = a4;
    v11 = (char *)(v9 + 16);
  }
  mTextBoxes[1] = (uint64_t)v11;
}

- (void)fileShapeAddressTable
{
  return self->mFileShapeAddressTable;
}

- (id)drawableForShapeId:(unsigned int)a3
{
  return [(OABReaderState *)self->mOfficeArtState drawableForShapeId:*(void *)&a3];
}

- (void)fileShapeAddressHeaderTable
{
  return self->mFileShapeAddressHeaderTable;
}

- (WBTextBoxReaderInfo)textBoxInfoAtIndex:(unint64_t)a3
{
  unint64_t v3 = *(void *)self->mTextBoxes + 16 * a3;
  id v4 = *(id *)v3;
  uint64_t v5 = *(unsigned __int16 *)(v3 + 8);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)storyTable
{
  return self->mStoryTable;
}

- (void)headerStoryTable
{
  return self->mHeaderStoryTable;
}

- (id)annotationOwner:(int)a3
{
  return (id)[(NSMutableArray *)self->mAnnotationOwners objectAtIndex:a3];
}

- (void)setAnnotationRangeStart:(id)a3
{
}

- (WBReader)initWithCancelDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBReader;
  uint64_t v5 = [(OCBReader *)&v16 initWithCancelDelegate:v4];
  if (v5)
  {
    id v6 = (WrdBinaryReader *)operator new(0x2C0uLL);
    WrdBinaryReader::WrdBinaryReader(v6);
    [(OCBReader *)v5 setBinaryReader:v6];
    v7 = objc_alloc_init(OITSUNoCopyDictionary);
    mIndexToStyles = v5->mIndexToStyles;
    v5->mIndexToStyles = v7;

    unint64_t v9 = objc_alloc_init(OITSUNoCopyDictionary);
    mIndexToFonts = v5->mIndexToFonts;
    v5->mIndexToFonts = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mBookmarkIndexToAnnotationRangeStartMap = v5->mBookmarkIndexToAnnotationRangeStartMap;
    v5->mBookmarkIndexToAnnotationRangeStartMap = v11;

    unint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mPreviousFlowElement = v5->mPreviousFlowElement;
    v5->mPreviousFlowElement = v13;
  }
  return v5;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
}

- (WrdEshObjectFactory)eshObjectFactory
{
  return self->mEshObjectFactory;
}

- (id)styleAtIndex:(int)a3 expectedType:(int)a4
{
  uint64_t v5 = [(WBReader *)self styleAtIndex:*(void *)&a3];
  id v6 = v5;
  if (v5 && [v5 type] != a4)
  {

    id v6 = 0;
  }
  return v6;
}

- (NSMutableDictionary)previousFlowElement
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mTargetDocument);
  objc_storeStrong((id *)&self->mBookmarkIndexToAnnotationRangeStartMap, 0);
  objc_storeStrong(&self->mAnnotationRangeStart, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mPreviousFlowElement, 0);
  objc_storeStrong((id *)&self->mIndexToFonts, 0);
  objc_storeStrong((id *)&self->mIndexToStyles, 0);
  objc_storeStrong((id *)&self->mAnnotationOwners, 0);
}

- (id)annotationRangeStartForBookmarkIndex:(unint64_t)a3
{
  mBookmarkIndexToAnnotationRangeStartMap = self->mBookmarkIndexToAnnotationRangeStartMap;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)mBookmarkIndexToAnnotationRangeStartMap objectForKeyedSubscript:v4];

  return v5;
}

- (void)setAnnotationRangeStart:(id)a3 forBookmarkIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    mBookmarkIndexToAnnotationRangeStartMap = self->mBookmarkIndexToAnnotationRangeStartMap;
    id v8 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)mBookmarkIndexToAnnotationRangeStartMap setObject:v9 forKeyedSubscript:v8];

    id v6 = v9;
  }
}

@end