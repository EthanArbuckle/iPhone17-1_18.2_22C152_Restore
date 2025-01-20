@interface PFEIReaderState
- (Class)drawablePlacementClass;
- (NSString)referenceAnchorID;
- (PFAIDocOrientationState)orientationState;
- (PFEIReaderState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 flowNodeBody:(id)a5 archive:(id)a6 documentEntryUri:(id)a7;
- (TSUNoCopyDictionary)anchorsForCFIFrag;
- (id)currentHtmlDocMediaState;
- (id)readerForCurrentMediaStateWithStackEntry:(id)a3;
- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5;
- (id)uniqueIdForInfo:(id)a3;
- (int64_t)referenceAnchorStartIndex;
- (void)_setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 fromStackEntry:(id)a5;
- (void)dealloc;
- (void)setAnchorsForCFIFrag:(id)a3;
- (void)setCfiPathForCurrentStorage;
- (void)setCfiPathForInfo:(id)a3 fromStackEntry:(id)a4;
- (void)setCfiPathForTextRun:(unint64_t)a3;
- (void)setReferenceAnchorID:(id)a3;
- (void)setReferenceAnchorStartIndex:(int64_t)a3;
- (void)setUniqueIdForTableCellStorage:(id)a3 withInfoId:(id)a4;
@end

@implementation PFEIReaderState

- (PFEIReaderState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 flowNodeBody:(id)a5 archive:(id)a6 documentEntryUri:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)PFEIReaderState;
  v8 = [(PFXHtmlReaderState *)&v10 initWithDocumentRoot:a3 contentNode:a4 entry:a7 inArchive:a6];
  if (v8)
  {
    v8->_orientationState = (PFAIDocOrientationState *)[[PFAIDocOrientationState alloc] initWitContentNodeBody:a5 presentationType:+[THPresentationType flowPresentationTypeInContext:[(THDocumentRoot *)[(PFXHtmlReaderState *)v8 thDocumentRoot] context]] readerState:v8];
    v8->_anchorsForCFIFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFEIReaderState;
  [(PFXHtmlReaderState *)&v3 dealloc];
}

- (void)_setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 fromStackEntry:(id)a5
{
  v9 = [(PFAIDocOrientationState *)self->_orientationState contentNodeBody];

  [(PFXHtmlReaderState *)self setCfiPathForInfo:a3 childIndex:a4 nodeBody:v9 fromStackEntry:a5];
}

- (void)setCfiPathForInfo:(id)a3 fromStackEntry:(id)a4
{
  v7 = [(PFAIDocOrientationState *)self->_orientationState contentNodeBody];

  [(PFXHtmlReaderState *)self setCfiPathForInfo:a3 childIndex:0 nodeBody:v7 fromStackEntry:a4];
}

- (void)setCfiPathForCurrentStorage
{
  objc_super v3 = [(PFXHtmlReaderState *)self currentHtmlStackEntry];
  v4 = [(PFXHtmlEntryMediaState *)[(PFXHtmlStackEntry *)v3 currentEntryMediaState] storage];

  [(PFEIReaderState *)self setCfiPathForInfo:v4 fromStackEntry:v3];
}

- (void)setCfiPathForTextRun:(unint64_t)a3
{
  v5 = [(PFXHtmlReaderState *)self currentHtmlStackEntry];
  v6 = [(PFXHtmlEntryMediaState *)[(PFXHtmlStackEntry *)v5 currentEntryMediaState] storage];

  [(PFEIReaderState *)self _setCfiPathForInfo:v6 childIndex:a3 fromStackEntry:v5];
}

- (void)setUniqueIdForTableCellStorage:(id)a3 withInfoId:(id)a4
{
  v6 = [(PFAIDocOrientationState *)self->_orientationState contentNodeBody];
  if ([(THModelContentNodeBody *)v6 infoForNodeUniqueID:a4]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIReaderState setUniqueIdForTableCellStorage:withInfoId:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIReaderState.mm") lineNumber:84 description:@"Info already registered."];
  }

  [(THModelContentNodeBody *)v6 setNodeUniqueID:a4 forInfo:a3];
}

- (id)uniqueIdForInfo:(id)a3
{
  v4 = [(PFAIDocOrientationState *)self->_orientationState contentNodeBody];

  return [(THModelContentNodeBody *)v4 nodeUniqueIDForInfo:a3];
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  v9 = [(PFAIDocOrientationState *)self->_orientationState contentNodeBody];

  return [(PFXHtmlReaderState *)self setUniqueIdForInfo:a3 nodeBody:v9 withPostfix:a4 fromStackEntry:a5];
}

- (id)currentHtmlDocMediaState
{
  return self->_orientationState;
}

- (PFAIDocOrientationState)orientationState
{
  return self->_orientationState;
}

- (int64_t)referenceAnchorStartIndex
{
  return self->_referenceAnchorStartIndex;
}

- (void)setReferenceAnchorStartIndex:(int64_t)a3
{
  self->_referenceAnchorStartIndex = a3;
}

- (NSString)referenceAnchorID
{
  return self->_referenceAnchorID;
}

- (void)setReferenceAnchorID:(id)a3
{
}

- (TSUNoCopyDictionary)anchorsForCFIFrag
{
  return self->_anchorsForCFIFrag;
}

- (void)setAnchorsForCFIFrag:(id)a3
{
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class();
}

- (id)readerForCurrentMediaStateWithStackEntry:(id)a3
{
  return [a3 reader];
}

@end