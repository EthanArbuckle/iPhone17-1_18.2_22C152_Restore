@interface WXReadState
- (BOOL)currentTableWraps;
- (BOOL)hasAnnotations;
- (BOOL)hasAnnotationsExtended;
- (BOOL)isNewSectionRequested;
- (BOOL)isThumbnail;
- (BOOL)readingMath;
- (CXNamespace)WXDrawingNamespace;
- (CXNamespace)WXGroupNamespace;
- (CXNamespace)WXMainNamespace;
- (CXNamespace)WXOOBibliographyNamespace;
- (CXNamespace)WXRelationshipNamespace;
- (CXNamespace)WXShapeNamespace;
- (TCCancelDelegate)cancelDelegate;
- (WXReadState)init;
- (_xmlNode)xmlAnnotationExtendedWithParaId:(unsigned int)a3;
- (_xmlNode)xmlAnnotationWithID:(int64_t)a3;
- (_xmlNode)xmlEndnoteWithID:(int64_t)a3;
- (_xmlNode)xmlFootnoteWithID:(int64_t)a3;
- (id)annotationExtendedPart;
- (id)annotationPart;
- (id)annotationWithId:(int64_t)a3;
- (id)annotationWithParaId:(unsigned int)a3;
- (id)bookmarkName:(int64_t)a3;
- (id)currentDeleteAuthor;
- (id)currentDeleteDate;
- (id)currentEditAuthor;
- (id)currentEditDate;
- (id)currentFormatAuthor;
- (id)currentFormatDate;
- (id)document;
- (id)drawingState;
- (id)initNoStacksWith:(id)a3;
- (id)nodesToBeAdded:(id)a3;
- (id)packagePart;
- (id)pendingBookmarks;
- (id)pendingComments;
- (id)readSymbolTo;
- (id)textBoxForFlowId:(id)a3;
- (id)wxoavState;
- (int)currentOfficeArtTextType;
- (unint64_t)currentCellCNFStyle;
- (unint64_t)currentRowCNFStyle;
- (void)addAnnotationId:(int64_t)a3 annotation:(id)a4;
- (void)addAnnotationParaId:(unsigned int)a3 annotation:(id)a4;
- (void)addBookmarkId:(int64_t)a3 name:(id)a4;
- (void)addPendingBookmark:(_xmlNode *)a3;
- (void)addPendingComment:(_xmlNode *)a3;
- (void)addText:(id)a3 node:(_xmlNode *)a4;
- (void)clearOutNodesToBeAdded:(id)a3;
- (void)clearPendingBookmarks;
- (void)clearPendingComments;
- (void)dealloc;
- (void)popDeleteAuthorDate;
- (void)popEditAuthorDate;
- (void)popFormatAuthorDate;
- (void)pushDeleteAuthor:(id)a3 date:(id)a4;
- (void)pushEditAuthor:(id)a3 date:(id)a4;
- (void)pushFormatAuthor:(id)a3 date:(id)a4;
- (void)setAnnotationExtendedPart:(id)a3;
- (void)setAnnotationPart:(id)a3;
- (void)setCancelDelegate:(id)a3;
- (void)setCurrentCellCNFStyle:(unint64_t)a3;
- (void)setCurrentOfficeArtTextType:(int)a3;
- (void)setCurrentRowCNFStyle:(unint64_t)a3;
- (void)setCurrentTableWraps:(BOOL)a3;
- (void)setDocument:(id)a3;
- (void)setDocumentPart:(id)a3;
- (void)setIsThumbnail:(BOOL)a3;
- (void)setNewSectionRequested:(BOOL)a3;
- (void)setPackagePart:(id)a3;
- (void)setReadSymbolTo:(id)a3;
- (void)setReadingMath:(BOOL)a3;
- (void)setTextBox:(id)a3 forFlowId:(id)a4;
- (void)setWXDrawingNamespace:(id)a3;
- (void)setWXGroupNamespace:(id)a3;
- (void)setWXMainNamespace:(id)a3;
- (void)setWXOOBibliographyNamespace:(id)a3;
- (void)setWXRelationshipNamespace:(id)a3;
- (void)setWXShapeNamespace:(id)a3;
- (void)setupNSForXMLFormat:(int)a3;
@end

@implementation WXReadState

- (WXReadState)init
{
  v40.receiver = self;
  v40.super_class = (Class)WXReadState;
  v2 = [(OCXState *)&v40 init];
  v3 = v2;
  if (v2)
  {
    mDocument = v2->mDocument;
    v2->mDocument = 0;

    v5 = objc_alloc_init(OITSUNoCopyDictionary);
    mTextNodesToBeAdded = v3->mTextNodesToBeAdded;
    v3->mTextNodesToBeAdded = v5;

    v7 = objc_alloc_init(OITSUNoCopyDictionary);
    mMapBookmarkIdToName = v3->mMapBookmarkIdToName;
    v3->mMapBookmarkIdToName = v7;

    v9 = objc_alloc_init(OITSUNoCopyDictionary);
    mMapAnnotationIdToAnnotation = v3->mMapAnnotationIdToAnnotation;
    v3->mMapAnnotationIdToAnnotation = v9;

    v11 = objc_alloc_init(OITSUNoCopyDictionary);
    mMapAnnotationParaIdToAnnotation = v3->mMapAnnotationParaIdToAnnotation;
    v3->mMapAnnotationParaIdToAnnotation = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mMapFlowIdToTextBox = v3->mMapFlowIdToTextBox;
    v3->mMapFlowIdToTextBox = v13;

    mPackagePart = v3->mPackagePart;
    v3->mPackagePart = 0;

    mAnnotationPart = v3->mAnnotationPart;
    v3->mAnnotationPart = 0;

    mAnnotationExtendedPart = v3->mAnnotationExtendedPart;
    v3->mAnnotationExtendedPart = 0;

    v3->mFootnotes = 0;
    v3->mEndnotes = 0;
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mDeleteAuthorStack = v3->mDeleteAuthorStack;
    v3->mDeleteAuthorStack = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mDeleteDateStack = v3->mDeleteDateStack;
    v3->mDeleteDateStack = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mEditAuthorStack = v3->mEditAuthorStack;
    v3->mEditAuthorStack = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mEditDateStack = v3->mEditDateStack;
    v3->mEditDateStack = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFormatAuthorStack = v3->mFormatAuthorStack;
    v3->mFormatAuthorStack = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFormatDateStack = v3->mFormatDateStack;
    v3->mFormatDateStack = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mPendingCommentNodes = v3->mPendingCommentNodes;
    v3->mPendingCommentNodes = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mPendingBookmarkNodes = v3->mPendingBookmarkNodes;
    v3->mPendingBookmarkNodes = v32;

    v34 = [[WXOAVReadState alloc] initWithWXReadState:v3];
    mWXOavState = v3->mWXOavState;
    v3->mWXOavState = v34;

    v36 = objc_alloc_init(WXOfficeArtClient);
    v37 = [[OAXDrawingState alloc] initWithClient:v36];
    mDrawingState = v3->mDrawingState;
    v3->mDrawingState = v37;

    [(OAXDrawingState *)v3->mDrawingState setDocumentState:v3];
    v3->mCurrentOfficeArtTextType = -1;
    [(OAVReadState *)v3->mWXOavState setOaxState:v3->mDrawingState];
    [(OAXDrawingState *)v3->mDrawingState setOavState:v3->mWXOavState];
    v3->mNewSectionRequested = 0;
    v3->mReadingMath = 0;
  }
  return v3;
}

- (id)initNoStacksWith:(id)a3
{
  v4 = (id *)a3;
  v12.receiver = self;
  v12.super_class = (Class)WXReadState;
  v5 = [(OCXState *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->mDocument, v4[4]);
    objc_storeStrong((id *)&v6->mTextNodesToBeAdded, v4[5]);
    objc_storeStrong((id *)&v6->mMapBookmarkIdToName, v4[6]);
    objc_storeStrong((id *)&v6->mPackagePart, v4[10]);
    objc_storeStrong((id *)&v6->mMapAnnotationIdToAnnotation, v4[7]);
    objc_storeStrong((id *)&v6->mMapAnnotationParaIdToAnnotation, v4[8]);
    objc_storeStrong((id *)&v6->mMapFlowIdToTextBox, v4[9]);
    v6->mFootnoteDocument = (_xmlDoc *)v4[13];
    v6->mFootnotes = (_xmlNode *)v4[14];
    v6->mEndnoteDocument = (_xmlDoc *)v4[15];
    v6->mAnnotationDocument = (_xmlDoc *)v4[17];
    v6->mAnnotations = (_xmlNode *)v4[18];
    v6->mAnnotationExtendedDocument = (_xmlDoc *)v4[19];
    v6->mAnnotationsExtended = (_xmlNode *)v4[20];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mPendingCommentNodes = v6->mPendingCommentNodes;
    v6->mPendingCommentNodes = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mPendingBookmarkNodes = v6->mPendingBookmarkNodes;
    v6->mPendingBookmarkNodes = v9;

    objc_storeStrong((id *)&v6->mWXOavState, v4[29]);
    objc_storeStrong((id *)&v6->mDrawingState, v4[30]);
    v6->mNewSectionRequested = *((unsigned char *)v4 + 264);
    v6->mCurrentRowCNFStyle = (unint64_t)v4[34];
    v6->mCurrentCellCNFStyle = (unint64_t)v4[35];
    v6->mCurrentTableWraps = *((unsigned char *)v4 + 288);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(OITSUNoCopyDictionary *)self->mTextNodesToBeAdded allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [(WXReadState *)self clearOutNodesToBeAdded:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [(WXReadState *)self clearPendingBookmarks];
  v7.receiver = self;
  v7.super_class = (Class)WXReadState;
  [(WXReadState *)&v7 dealloc];
}

- (id)document
{
  return self->mDocument;
}

- (void)setDocument:(id)a3
{
  uint64_t v4 = (WDDocument *)a3;
  uint64_t v5 = v4;
  if (!self->mDocument)
  {
    mDrawingState = self->mDrawingState;
    objc_super v7 = [(OCDDocument *)v4 blips];
    [(OAXDrawingState *)mDrawingState setTargetBlipCollection:v7];
  }
  mDocument = self->mDocument;
  self->mDocument = v5;
}

- (void)addText:(id)a3 node:(_xmlNode *)a4
{
  id v8 = a3;
  -[OITSUNoCopyDictionary objectForKey:](self->mTextNodesToBeAdded, "objectForKey:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(OITSUNoCopyDictionary *)self->mTextNodesToBeAdded setObject:v6 forUncopiedKey:v8];
  }
  objc_super v7 = objc_msgSend(NSNumber, "numberWithLong:", xmlCopyNode(a4, 1));
  [v6 addObject:v7];
}

- (id)nodesToBeAdded:(id)a3
{
  v3 = [(OITSUNoCopyDictionary *)self->mTextNodesToBeAdded objectForKey:a3];
  uint64_t v4 = [v3 objectEnumerator];

  return v4;
}

- (void)clearOutNodesToBeAdded:(id)a3
{
  id v5 = [(OITSUNoCopyDictionary *)self->mTextNodesToBeAdded objectForKey:a3];
  uint64_t v3 = [v5 count];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
      xmlFreeNode((xmlNodePtr)[v5 objectAtIndex:i]);
  }
  [v5 removeAllObjects];
}

- (void)addBookmarkId:(int64_t)a3 name:(id)a4
{
  id v8 = a4;
  mMapBookmarkIdToName = self->mMapBookmarkIdToName;
  objc_super v7 = [NSNumber numberWithLong:a3];
  [(OITSUNoCopyDictionary *)mMapBookmarkIdToName setObject:v8 forKey:v7];
}

- (id)bookmarkName:(int64_t)a3
{
  mMapBookmarkIdToName = self->mMapBookmarkIdToName;
  uint64_t v4 = [NSNumber numberWithLong:a3];
  id v5 = [(OITSUNoCopyDictionary *)mMapBookmarkIdToName objectForKey:v4];

  return v5;
}

- (void)addAnnotationId:(int64_t)a3 annotation:(id)a4
{
  id v8 = a4;
  mMapAnnotationIdToAnnotation = self->mMapAnnotationIdToAnnotation;
  objc_super v7 = [NSNumber numberWithLong:a3];
  [(OITSUNoCopyDictionary *)mMapAnnotationIdToAnnotation setObject:v8 forKey:v7];
}

- (id)annotationWithId:(int64_t)a3
{
  mMapAnnotationIdToAnnotation = self->mMapAnnotationIdToAnnotation;
  uint64_t v4 = [NSNumber numberWithLong:a3];
  id v5 = [(OITSUNoCopyDictionary *)mMapAnnotationIdToAnnotation objectForKey:v4];

  return v5;
}

- (BOOL)hasAnnotations
{
  return self->mAnnotations != 0;
}

- (void)addAnnotationParaId:(unsigned int)a3 annotation:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  mMapAnnotationParaIdToAnnotation = self->mMapAnnotationParaIdToAnnotation;
  objc_super v7 = [NSNumber numberWithUnsignedInt:v4];
  [(OITSUNoCopyDictionary *)mMapAnnotationParaIdToAnnotation setObject:v8 forKey:v7];
}

- (id)annotationWithParaId:(unsigned int)a3
{
  mMapAnnotationParaIdToAnnotation = self->mMapAnnotationParaIdToAnnotation;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [(OITSUNoCopyDictionary *)mMapAnnotationParaIdToAnnotation objectForKey:v4];

  return v5;
}

- (BOOL)hasAnnotationsExtended
{
  return self->mAnnotationsExtended != 0;
}

- (id)textBoxForFlowId:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->mMapFlowIdToTextBox objectForKeyedSubscript:a3];
  return v3;
}

- (void)setTextBox:(id)a3 forFlowId:(id)a4
{
}

- (_xmlNode)xmlFootnoteWithID:(int64_t)a3
{
  mFootnotes = self->mFootnotes;
  if (!mFootnotes) {
    return 0;
  }
  for (uint64_t i = OCXFirstChild(mFootnotes); i; uint64_t i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"footnote")
      && CXDefaultLongAttribute(i, self->mWXMainNamespace, (xmlChar *)"id", 0) == a3)
    {
      break;
    }
  }
  return i;
}

- (_xmlNode)xmlEndnoteWithID:(int64_t)a3
{
  mEndnotes = self->mEndnotes;
  if (!mEndnotes) {
    return 0;
  }
  for (uint64_t i = OCXFirstChild(mEndnotes); i; uint64_t i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"endnote")
      && CXDefaultLongAttribute(i, self->mWXMainNamespace, (xmlChar *)"id", 0) == a3)
    {
      break;
    }
  }
  return i;
}

- (_xmlNode)xmlAnnotationWithID:(int64_t)a3
{
  mAnnotations = self->mAnnotations;
  if (!mAnnotations) {
    return 0;
  }
  for (uint64_t i = OCXFirstChild(mAnnotations); i; uint64_t i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"comment")
      && CXDefaultLongAttribute(i, self->mWXMainNamespace, (xmlChar *)"id", 0) == a3)
    {
      break;
    }
  }
  return i;
}

- (_xmlNode)xmlAnnotationExtendedWithParaId:(unsigned int)a3
{
  if (!self->mAnnotationsExtended) {
    return 0;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  BOOL v6 = +[OCXSTValidator isValidValue:v5 simpleType:10];

  if (!v6) {
    return 0;
  }
  for (uint64_t i = OCXFirstChild(self->mAnnotationsExtended); i; uint64_t i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"commentEx"))
    {
      unsigned int v12 = 0;
      if (CXOptionalUnsignedAttributeFromHex8X(i, (CXNamespace *)WXWord2012Namespace, (xmlChar *)"paraId", &v12))
      {
        id v8 = [NSNumber numberWithUnsignedInt:v12];
        BOOL v9 = +[OCXSTValidator isValidValue:v8 simpleType:10];

        if (v12 == a3 && v9) {
          break;
        }
      }
    }
  }
  return i;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (void)setPackagePart:(id)a3
{
}

- (id)annotationPart
{
  return self->mAnnotationPart;
}

- (void)setAnnotationPart:(id)a3
{
}

- (id)annotationExtendedPart
{
  return self->mAnnotationExtendedPart;
}

- (void)setAnnotationExtendedPart:(id)a3
{
}

- (void)setDocumentPart:(id)a3
{
  id v5 = (OCPPackagePart *)a3;
  p_mPackagePart = &self->mPackagePart;
  if (self->mPackagePart != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)p_mPackagePart, a3);
    objc_super v7 = OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXFootnotesRelationshipType);
    id v8 = (_xmlDoc *)[v7 xmlDocument];
    self->mFootnoteDocument = v8;
    if (v8) {
      self->mFootnotes = OCXGetRootElement(v8);
    }
    BOOL v9 = OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXEndnotesRelationshipType);
    long long v10 = (_xmlDoc *)[v9 xmlDocument];
    self->mEndnoteDocument = v10;
    if (v10) {
      self->mEndnotes = OCXGetRootElement(v10);
    }
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXCommentsRelationshipType);
    long long v11 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
    mAnnotationPart = self->mAnnotationPart;
    self->mAnnotationPart = v11;

    uint64_t v13 = [(OCPPackagePart *)self->mAnnotationPart xmlDocument];
    self->mAnnotationDocument = v13;
    if (v13) {
      self->mAnnotations = OCXGetRootElement(v13);
    }
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXCommentsExtendedRelationshipType);
    v14 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
    mAnnotationExtendedPart = self->mAnnotationExtendedPart;
    self->mAnnotationExtendedPart = v14;

    v16 = [(OCPPackagePart *)self->mAnnotationExtendedPart xmlDocument];
    self->mAnnotationExtendedDocument = v16;
    if (v16) {
      self->mAnnotationsExtended = OCXGetRootElement(v16);
    }
    [(OAVReadState *)self->mWXOavState setPackagePart:v17];
    [(OAXDrawingState *)self->mDrawingState setPackagePart:v17];
  }
  MEMORY[0x270F9A790](p_mPackagePart);
}

- (id)wxoavState
{
  return self->mWXOavState;
}

- (void)pushDeleteAuthor:(id)a3 date:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  mDeleteAuthorStack = self->mDeleteAuthorStack;
  if (mDeleteAuthorStack && self->mDeleteDateStack)
  {
    if (v8) {
      [(NSMutableArray *)mDeleteAuthorStack addObject:v8];
    }
    if (v6) {
      [(NSMutableArray *)self->mDeleteDateStack addObject:v6];
    }
  }
}

- (void)popDeleteAuthorDate
{
  mDeleteAuthorStack = self->mDeleteAuthorStack;
  if (mDeleteAuthorStack && self->mDeleteDateStack)
  {
    [(NSMutableArray *)mDeleteAuthorStack removeLastObject];
    mDeleteDateStack = self->mDeleteDateStack;
    [(NSMutableArray *)mDeleteDateStack removeLastObject];
  }
}

- (id)currentDeleteAuthor
{
  return (id)[(NSMutableArray *)self->mDeleteAuthorStack lastObject];
}

- (id)currentDeleteDate
{
  return (id)[(NSMutableArray *)self->mDeleteDateStack lastObject];
}

- (void)pushEditAuthor:(id)a3 date:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  mEditAuthorStack = self->mEditAuthorStack;
  if (mEditAuthorStack && self->mEditDateStack)
  {
    if (v8) {
      [(NSMutableArray *)mEditAuthorStack addObject:v8];
    }
    if (v6) {
      [(NSMutableArray *)self->mEditDateStack addObject:v6];
    }
  }
}

- (void)popEditAuthorDate
{
  mEditAuthorStack = self->mEditAuthorStack;
  if (mEditAuthorStack && self->mEditDateStack)
  {
    if ([(NSMutableArray *)mEditAuthorStack count]) {
      [(NSMutableArray *)self->mEditDateStack count];
    }
    [(NSMutableArray *)self->mEditAuthorStack removeLastObject];
    mEditDateStack = self->mEditDateStack;
    [(NSMutableArray *)mEditDateStack removeLastObject];
  }
}

- (id)currentEditAuthor
{
  return (id)[(NSMutableArray *)self->mEditAuthorStack lastObject];
}

- (id)currentEditDate
{
  return (id)[(NSMutableArray *)self->mEditDateStack lastObject];
}

- (void)pushFormatAuthor:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [(NSMutableArray *)self->mFormatAuthorStack addObject:v7];
  }
  if (v6) {
    [(NSMutableArray *)self->mFormatDateStack addObject:v6];
  }
}

- (void)popFormatAuthorDate
{
  [(NSMutableArray *)self->mFormatAuthorStack removeLastObject];
  mFormatDateStack = self->mFormatDateStack;
  [(NSMutableArray *)mFormatDateStack removeLastObject];
}

- (id)currentFormatAuthor
{
  return (id)[(NSMutableArray *)self->mFormatAuthorStack lastObject];
}

- (id)currentFormatDate
{
  return (id)[(NSMutableArray *)self->mFormatDateStack lastObject];
}

- (void)addPendingComment:(_xmlNode *)a3
{
  mPendingCommentNodes = self->mPendingCommentNodes;
  id v4 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  -[NSMutableArray addObject:](mPendingCommentNodes, "addObject:");
}

- (id)pendingComments
{
  return self->mPendingCommentNodes;
}

- (void)clearPendingComments
{
}

- (void)addPendingBookmark:(_xmlNode *)a3
{
  xmlNodePtr v4 = xmlCopyNode(a3, 1);
  mPendingBookmarkNodes = self->mPendingBookmarkNodes;
  id v6 = [MEMORY[0x263F08D40] valueWithPointer:v4];
  -[NSMutableArray addObject:](mPendingBookmarkNodes, "addObject:");
}

- (id)pendingBookmarks
{
  return self->mPendingBookmarkNodes;
}

- (void)clearPendingBookmarks
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->mPendingBookmarkNodes;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        xmlFreeNode((xmlNodePtr)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "pointerValue", (void)v7));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)self->mPendingBookmarkNodes removeAllObjects];
}

- (id)drawingState
{
  return self->mDrawingState;
}

- (id)readSymbolTo
{
  return self->mReadSymbolTo;
}

- (void)setReadSymbolTo:(id)a3
{
}

- (BOOL)isNewSectionRequested
{
  return self->mNewSectionRequested;
}

- (void)setNewSectionRequested:(BOOL)a3
{
  self->mNewSectionRequested = a3;
}

- (unint64_t)currentRowCNFStyle
{
  return self->mCurrentRowCNFStyle;
}

- (void)setCurrentRowCNFStyle:(unint64_t)a3
{
  self->mCurrentRowCNFStyle = a3;
}

- (unint64_t)currentCellCNFStyle
{
  return self->mCurrentCellCNFStyle;
}

- (void)setCurrentCellCNFStyle:(unint64_t)a3
{
  self->mCurrentCellCNFStyle = a3;
}

- (void)setCurrentTableWraps:(BOOL)a3
{
  self->mCurrentTableWraps = a3;
}

- (BOOL)currentTableWraps
{
  return self->mCurrentTableWraps;
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v32.receiver = self;
  v32.super_class = (Class)WXReadState;
  -[OCXState setupNSForXMLFormat:](&v32, sel_setupNSForXMLFormat_);
  uint64_t v5 = [CXNamespace alloc];
  uint64_t v6 = v5;
  if (v3)
  {
    long long v7 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/wordprocessingml/2006/main"];
    long long v8 = [(CXNamespace *)v6 initWithUri:"http://purl.oclc.org/ooxml/wordprocessingml/main" fallbackNamespace:v7];
    [(WXReadState *)self setWXMainNamespace:v8];

    long long v9 = [CXNamespace alloc];
    long long v10 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"];
    long long v11 = [(CXNamespace *)v9 initWithUri:"http://purl.oclc.org/ooxml/drawingml/wordprocessingDrawing" fallbackNamespace:v10];
    [(WXReadState *)self setWXDrawingNamespace:v11];

    uint64_t v12 = [CXNamespace alloc];
    uint64_t v13 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"];
    v14 = [(CXNamespace *)v12 initWithUri:"http://purl.oclc.org/ooxml/drawingml/wordprocessingDrawing" fallbackNamespace:v13];
    [(WXReadState *)self setWXShapeNamespace:v14];

    v15 = [(WXReadState *)self WXShapeNamespace];
    v16 = [v15 fallbackNamespace];
    [v16 setFallbackNamespace:WXShapeNamespace];

    v17 = [CXNamespace alloc];
    v18 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"];
    v19 = [(CXNamespace *)v17 initWithUri:"http://purl.oclc.org/ooxml/drawingml/wordprocessingDrawing" fallbackNamespace:v18];
    [(WXReadState *)self setWXGroupNamespace:v19];

    v20 = [(WXReadState *)self WXGroupNamespace];
    v21 = [v20 fallbackNamespace];
    [v21 setFallbackNamespace:WXGroupNamespace];

    v22 = [CXNamespace alloc];
    v23 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/bibliography"];
    v24 = [(CXNamespace *)v22 initWithUri:"http://purl.oclc.org/ooxml/officeDocument/bibliography" fallbackNamespace:v23];
    [(WXReadState *)self setWXOOBibliographyNamespace:v24];

    v25 = [CXNamespace alloc];
    v26 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    v27 = [(CXNamespace *)v25 initWithUri:"http://purl.oclc.org/ooxml/officeDocument/relationships" fallbackNamespace:v26];
    [(WXReadState *)self setWXRelationshipNamespace:v27];
  }
  else
  {
    v28 = [(CXNamespace *)v5 initWithUri:"http://schemas.openxmlformats.org/wordprocessingml/2006/main"];
    [(WXReadState *)self setWXMainNamespace:v28];

    v29 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"];
    [(WXReadState *)self setWXDrawingNamespace:v29];

    [(WXReadState *)self setWXShapeNamespace:WXShapeNamespace];
    [(WXReadState *)self setWXGroupNamespace:WXGroupNamespace];
    v30 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"];
    [(WXReadState *)self setWXDrawingNamespace:v30];

    v31 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/bibliography"];
    [(WXReadState *)self setWXOOBibliographyNamespace:v31];

    v26 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    [(WXReadState *)self setWXRelationshipNamespace:v26];
  }

  [(OAXDrawingState *)self->mDrawingState setupNSForXMLFormat:v3];
  [(OCXState *)self->mWXOavState setupNSForXMLFormat:v3];
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (CXNamespace)WXMainNamespace
{
  return self->mWXMainNamespace;
}

- (void)setWXMainNamespace:(id)a3
{
}

- (CXNamespace)WXDrawingNamespace
{
  return self->mWXDrawingNamespace;
}

- (void)setWXDrawingNamespace:(id)a3
{
}

- (CXNamespace)WXShapeNamespace
{
  return self->mWXShapeNamespace;
}

- (void)setWXShapeNamespace:(id)a3
{
}

- (CXNamespace)WXGroupNamespace
{
  return self->mWXGroupNamespace;
}

- (void)setWXGroupNamespace:(id)a3
{
}

- (CXNamespace)WXOOBibliographyNamespace
{
  return self->mWXOOBibliographyNamespace;
}

- (void)setWXOOBibliographyNamespace:(id)a3
{
}

- (CXNamespace)WXRelationshipNamespace
{
  return self->mWXRelationshipNamespace;
}

- (void)setWXRelationshipNamespace:(id)a3
{
}

- (BOOL)readingMath
{
  return self->mReadingMath;
}

- (void)setReadingMath:(BOOL)a3
{
  self->mReadingMath = a3;
}

- (int)currentOfficeArtTextType
{
  return self->mCurrentOfficeArtTextType;
}

- (void)setCurrentOfficeArtTextType:(int)a3
{
  self->mCurrentOfficeArtTextType = a3;
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (void)setCancelDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWXRelationshipNamespace, 0);
  objc_storeStrong((id *)&self->mWXOOBibliographyNamespace, 0);
  objc_storeStrong((id *)&self->mWXGroupNamespace, 0);
  objc_storeStrong((id *)&self->mWXShapeNamespace, 0);
  objc_storeStrong((id *)&self->mWXDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mWXMainNamespace, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
  objc_storeStrong((id *)&self->mReadSymbolTo, 0);
  objc_storeStrong((id *)&self->mDrawingState, 0);
  objc_storeStrong((id *)&self->mWXOavState, 0);
  objc_storeStrong((id *)&self->mPendingBookmarkNodes, 0);
  objc_storeStrong((id *)&self->mPendingCommentNodes, 0);
  objc_storeStrong((id *)&self->mFormatDateStack, 0);
  objc_storeStrong((id *)&self->mFormatAuthorStack, 0);
  objc_storeStrong((id *)&self->mEditDateStack, 0);
  objc_storeStrong((id *)&self->mEditAuthorStack, 0);
  objc_storeStrong((id *)&self->mDeleteDateStack, 0);
  objc_storeStrong((id *)&self->mDeleteAuthorStack, 0);
  objc_storeStrong((id *)&self->mAnnotationExtendedPart, 0);
  objc_storeStrong((id *)&self->mAnnotationPart, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
  objc_storeStrong((id *)&self->mMapFlowIdToTextBox, 0);
  objc_storeStrong((id *)&self->mMapAnnotationParaIdToAnnotation, 0);
  objc_storeStrong((id *)&self->mMapAnnotationIdToAnnotation, 0);
  objc_storeStrong((id *)&self->mMapBookmarkIdToName, 0);
  objc_storeStrong((id *)&self->mTextNodesToBeAdded, 0);
  objc_storeStrong((id *)&self->mDocument, 0);
}

@end