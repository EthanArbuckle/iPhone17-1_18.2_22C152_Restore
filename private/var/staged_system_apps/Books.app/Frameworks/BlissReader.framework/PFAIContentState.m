@interface PFAIContentState
+ (Class)stackEntryClass;
- (BOOL)flowIsCurrent;
- (BOOL)inFlowHeader;
- (BOOL)paginatedIsCurrent;
- (BOOL)setFlowAsCurrent;
- (BOOL)setPaginatedAsCurrent;
- (BOOL)shouldCountText;
- (Class)drawablePlacementClass;
- (Class)textBodyClass;
- (PFAIContentState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 flowNodeBody:(id)a5 paginatedNodeBody:(id)a6 archive:(id)a7 documentEntryUri:(id)a8;
- (PFAIDocOrientationState)currentDocOrientationState;
- (PFAIDocOrientationState)flowState;
- (PFAIDocOrientationState)paginatedState;
- (PFAIStackEntry)currentStackEntry;
- (id)currentHtmlDocMediaState;
- (id)currentReferenceAnchorForEntryOrientation:(id)a3;
- (id)hintCollectionWithUrl:(id)a3 data:(id)a4;
- (id)hintCollectorForStorage:(id)a3;
- (id)readerForCurrentMediaStateWithStackEntry:(id)a3;
- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5;
- (id)uniqueIdForInfo:(id)a3;
- (int64_t)referenceAnchorStartForEntryOrientation:(id)a3;
- (unint64_t)orientationCount;
- (void)_setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 fromStackEntry:(id)a5;
- (void)dealloc;
- (void)popReader;
- (void)processHints;
- (void)setCfiPathForCurrentStorage;
- (void)setCfiPathForInfo:(id)a3 fromStackEntry:(id)a4;
- (void)setCfiPathForTextRun:(unint64_t)a3;
- (void)setCurrentReferenceAnchor:(id)a3 forEntryOrientation:(id)a4;
- (void)setInFlowHeader:(BOOL)a3;
- (void)setInTable:(BOOL)a3;
- (void)setReferenceAnchorStart:(int64_t)a3 forEntryOrientation:(id)a4;
- (void)setUniqueIdForTableCellStorage:(id)a3 withInfoId:(id)a4;
- (void)switchToOrientation:(unint64_t)a3;
@end

@implementation PFAIContentState

- (PFAIContentState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 flowNodeBody:(id)a5 paginatedNodeBody:(id)a6 archive:(id)a7 documentEntryUri:(id)a8
{
  v12.receiver = self;
  v12.super_class = (Class)PFAIContentState;
  v10 = [(PFXHtmlReaderState *)&v12 initWithDocumentRoot:a3 contentNode:a4 entry:a8 inArchive:a7];
  if (v10)
  {
    v10->mFlowState = (PFAIDocOrientationState *)[[PFAIDocOrientationState alloc] initWitContentNodeBody:a5 presentationType:+[THPresentationType flowPresentationTypeInContext:[(THDocumentRoot *)[(PFXHtmlReaderState *)v10 thDocumentRoot] context]] readerState:v10];
    v10->mPaginatedState = (PFAIDocOrientationState *)[[PFAIDocOrientationState alloc] initWitContentNodeBody:a6 presentationType:+[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(PFXHtmlReaderState *)v10 thDocumentRoot] context]] readerState:v10];
    v10->mCurrentReferenceAnchorForEntryOrientation = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v10->mReferenceAnchorStartForEntryOrientation = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v10->mHintCollectors = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
    v10->mHints = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10->mFlowHeader = 0;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIContentState;
  [(PFXHtmlReaderState *)&v3 dealloc];
}

- (void)setInTable:(BOOL)a3
{
  BOOL v3 = a3;
  +[PFAIReferenceAnchor endCurrentReferenceAnchorForEntryOrientation:[(PFXXmlStackEntry *)self->super.super.mCurrentEntry currentEntryOrientationState] contentState:self];
  v5.receiver = self;
  v5.super_class = (Class)PFAIContentState;
  [(PFXHtmlReaderState *)&v5 setInTable:v3];
}

- (PFAIStackEntry)currentStackEntry
{
  return (PFAIStackEntry *)self->super.super.mCurrentEntry;
}

- (id)currentHtmlDocMediaState
{
  return self->mCurrentOrientationState;
}

- (PFAIDocOrientationState)currentDocOrientationState
{
  return self->mCurrentOrientationState;
}

- (BOOL)paginatedIsCurrent
{
  return self->mCurrentOrientationState == self->mPaginatedState;
}

- (BOOL)flowIsCurrent
{
  return self->mCurrentOrientationState == self->mFlowState;
}

- (BOOL)setPaginatedAsCurrent
{
  self->mCurrentOrientationState = self->mPaginatedState;
  id v2 = [(PFXXmlStackEntry *)self->super.super.mCurrentEntry paginatedState];

  return [v2 processOrientation];
}

- (BOOL)setFlowAsCurrent
{
  self->mCurrentOrientationState = self->mFlowState;
  id v2 = [(PFXXmlStackEntry *)self->super.super.mCurrentEntry flowState];

  return [v2 processOrientation];
}

- (unint64_t)orientationCount
{
  return 2;
}

- (void)switchToOrientation:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(PFAIContentState *)self setFlowAsCurrent];
  }
  else if (!a3)
  {
    [(PFAIContentState *)self setPaginatedAsCurrent];
  }
}

- (id)hintCollectionWithUrl:(id)a3 data:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKey:](self->mHints, "objectForKey:");
  if (!v7)
  {
    id v7 = [objc_alloc((Class)TSWPLineHintCollection) initWithApplePubData:a4 context:[-[PFXHtmlReaderState thDocumentRoot](self, "thDocumentRoot") context]];
    if (v7)
    {
      [(NSMutableDictionary *)self->mHints setObject:v7 forKey:a3];
      id v8 = v7;
    }
  }
  return v7;
}

- (id)hintCollectorForStorage:(id)a3
{
  objc_super v5 = (PFAIHintCollector *)-[TSUNoCopyDictionary objectForKey:](self->mHintCollectors, "objectForKey:");
  if (!v5)
  {
    objc_super v5 = [[PFAIHintCollector alloc] initWithStorage:a3];
    [(TSUNoCopyDictionary *)self->mHintCollectors setObject:v5 forUncopiedKey:a3];
    v6 = v5;
  }
  return v5;
}

- (void)processHints
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(TSUNoCopyDictionary *)self->mHintCollectors objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) processHintCollections];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)currentReferenceAnchorForEntryOrientation:(id)a3
{
  return [(TSUNoCopyDictionary *)self->mCurrentReferenceAnchorForEntryOrientation objectForKey:a3];
}

- (void)setCurrentReferenceAnchor:(id)a3 forEntryOrientation:(id)a4
{
  mCurrentReferenceAnchorForEntryOrientation = self->mCurrentReferenceAnchorForEntryOrientation;
  if (a3) {
    [(TSUNoCopyDictionary *)mCurrentReferenceAnchorForEntryOrientation setObject:a3 forUncopiedKey:a4];
  }
  else {
    [(TSUNoCopyDictionary *)mCurrentReferenceAnchorForEntryOrientation removeObjectForKey:a4];
  }
}

- (int64_t)referenceAnchorStartForEntryOrientation:(id)a3
{
  id v3 = [(TSUNoCopyDictionary *)self->mReferenceAnchorStartForEntryOrientation objectForKey:a3];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (int64_t)[v3 integerValue];
}

- (void)setReferenceAnchorStart:(int64_t)a3 forEntryOrientation:(id)a4
{
  mReferenceAnchorStartForEntryOrientation = self->mReferenceAnchorStartForEntryOrientation;
  v6 = +[NSNumber numberWithInteger:a3];

  [(TSUNoCopyDictionary *)mReferenceAnchorStartForEntryOrientation setObject:v6 forUncopiedKey:a4];
}

- (void)_setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 fromStackEntry:(id)a5
{
  long long v9 = [(PFAIDocOrientationState *)[(PFAIContentState *)self currentDocOrientationState] contentNodeBody];

  [(PFXHtmlReaderState *)self setCfiPathForInfo:a3 childIndex:a4 nodeBody:v9 fromStackEntry:a5];
}

- (void)setCfiPathForInfo:(id)a3 fromStackEntry:(id)a4
{
}

- (void)setCfiPathForCurrentStorage
{
  id v3 = [(PFAIContentState *)self currentStackEntry];
  id v4 = [[-[PFAIStackEntry currentEntryMediaState](v3, "currentEntryMediaState") storage]];

  [(PFAIContentState *)self setCfiPathForInfo:v4 fromStackEntry:v3];
}

- (void)setCfiPathForTextRun:(unint64_t)a3
{
  if (a3 >= 2)
  {
    v6 = [(PFAIContentState *)self currentStackEntry];
    id v7 = [[-[PFAIStackEntry currentEntryMediaState](v6, "currentEntryMediaState") storage]];
    [(PFAIContentState *)self _setCfiPathForInfo:v7 childIndex:a3 fromStackEntry:v6];
  }
}

- (void)setUniqueIdForTableCellStorage:(id)a3 withInfoId:(id)a4
{
  v6 = [(PFAIDocOrientationState *)[(PFAIContentState *)self currentDocOrientationState] contentNodeBody];
  if ([(THModelContentNodeBody *)v6 infoForNodeUniqueID:a4]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFAIContentState setUniqueIdForTableCellStorage:withInfoId:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAIContentState.mm") lineNumber:275 description:@"Info already registered."];
  }

  [(THModelContentNodeBody *)v6 setNodeUniqueID:a4 forInfo:a3];
}

- (id)uniqueIdForInfo:(id)a3
{
  id v4 = [(PFAIDocOrientationState *)[(PFAIContentState *)self currentDocOrientationState] contentNodeBody];

  return [(THModelContentNodeBody *)v4 nodeUniqueIDForInfo:a3];
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  long long v9 = [(PFAIDocOrientationState *)[(PFAIContentState *)self currentDocOrientationState] contentNodeBody];

  return [(PFXHtmlReaderState *)self setUniqueIdForInfo:a3 nodeBody:v9 withPostfix:a4 fromStackEntry:a5];
}

- (void)popReader
{
  if ((__end_cap_ **)((char *)self->super.super.mContextStack.var0 - (char *)self->super.super.mContextStack.__begin_) <= (__end_cap_ **)((char *)&stru_20.cmdsize + 3)) {
    +[TCProgressContext setProgress:(double)xmlTextReaderByteConsumed(self->super.super.mStreamAPI)];
  }
  v3.receiver = self;
  v3.super_class = (Class)PFAIContentState;
  [(PFXXmlStreamReaderState *)&v3 popReader];
}

- (BOOL)shouldCountText
{
  return 1;
}

- (PFAIDocOrientationState)paginatedState
{
  return self->mPaginatedState;
}

- (PFAIDocOrientationState)flowState
{
  return self->mFlowState;
}

- (BOOL)inFlowHeader
{
  return self->mFlowHeader;
}

- (void)setInFlowHeader:(BOOL)a3
{
  self->mFlowHeader = a3;
}

+ (Class)stackEntryClass
{
  return (Class)objc_opt_class();
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class();
}

- (Class)textBodyClass
{
  return (Class)objc_opt_class();
}

- (id)readerForCurrentMediaStateWithStackEntry:(id)a3
{
  id v4 = [a3 reader];
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (!v5) {
    return v4;
  }
  v6 = (void *)v5;
  id v7 = [a3 applePubReaderState];

  return [v6 currentSubreaderWithState:v7];
}

@end