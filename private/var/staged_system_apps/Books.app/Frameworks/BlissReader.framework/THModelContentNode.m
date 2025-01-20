@interface THModelContentNode
+ (id)annotationIDForInfoID:(id)a3 contentNodeID:(id)a4;
+ (id)legacyBookmarkIDForInfoID:(id)a3 contentNodeID:(id)a4;
- (BOOL)containsInfo:(id)a3;
- (BOOL)glossaryTermExists;
- (BOOL)hasBodyStorageUID:(id)a3;
- (BOOL)hasCachedVersion;
- (BOOL)hasCachedVersionInZip:(id)a3;
- (BOOL)isBodyStorage:(id)a3;
- (BOOL)isLoaded;
- (BOOL)navigationPageNode;
- (BOOL)nodeBodyExists;
- (BOOL)p_possiblyReplaceCFIFragmentForExistingOffsetEntry:(id)a3 newEntry:(id)a4;
- (BOOL)paginatedBodyStale;
- (NSMutableDictionary)anchorForCfiFrag;
- (NSMutableDictionary)fragmentPhysicalPageIndexes;
- (NSMutableDictionary)storageAnchorsForAnchorID;
- (NSMutableDictionary)storageAnchorsForCfiFrag;
- (NSMutableDictionary)textChildOffsetStorageAnchorsForCfiFrag;
- (NSString)cfiBase;
- (NSString)description;
- (THModelContentNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5;
- (THReflowableContentPaginationOperation)paginationOperation;
- (THReflowablePaginationController)reflowablePaginationController;
- (TSUNoCopyDictionary)displayStartingPageFormats;
- (TSUNoCopyDictionary)displayStartingPageNumbers;
- (TSUNoCopyDictionary)presentationContentBodies;
- (id)annotationIDForInfo:(id)a3;
- (id)applePubEntryID;
- (id)applePubRelativePath;
- (id)bodyStorageForPresentationType:(id)a3;
- (id)cfiForOffset:(unint64_t)a3 storageUID:(id)a4 includeFilename:(BOOL)a5 pedantic:(BOOL)a6;
- (id)cfiForRange:(_NSRange)a3 storageUID:(id)a4 includeFilename:(BOOL)a5 pedantic:(BOOL)a6;
- (id)cfiFragWithOffset:(unint64_t)a3 storageUID:(id)a4 pedantic:(BOOL)a5;
- (id)cfiFragsForTextChildOffsets;
- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)expandableInfoForWidgetInfo:(id)a3 forPresentationType:(id)a4;
- (id)gutterStorageForPresentationType:(id)a3;
- (id)infoForNodeUniqueID:(id)a3;
- (id)infoForNodeUniqueID:(id)a3 forPresentationType:(id)a4;
- (id)legacyBookmarkIDForInfo:(id)a3;
- (id)nodeBodyForPresentationType:(id)a3;
- (id)nodeUniqueIDForInfo:(id)a3;
- (id)nodeUniqueIDForInfo:(id)a3 forPresentationType:(id)a4;
- (id)p_bodyForPresentationType:(id)a3;
- (id)p_cfiFragsForOffsetsComparator;
- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)pageInfoForStorageAnchor:(id)a3 forPresentationType:(id)a4;
- (id)pageNumberStringForAbsolutePageIndex:(unint64_t)a3 presentationType:(id)a4;
- (id)pagesForPresentationType:(id)a3;
- (id)storageAnchorAfterAnchor:(id)a3 forNthInstance:(unint64_t)a4 ofSearchString:(id)a5 presentationType:(id)a6;
- (id)storageAnchorForAnchorId:(id)a3;
- (id)storageAnchorForCfiFrag:(id)a3;
- (id)storageAnchorForCfiInnerPathReader:(id)a3;
- (id)storageAnchorForCfiReader:(id)a3;
- (id)storageAnchorForNodeRelativePageIndex:(unint64_t)a3;
- (id)storagesForAllPresentationTypes;
- (id)storagesForPresentationType:(id)a3;
- (int)displayStartingPageFormatForPresentationType:(id)a3;
- (int64_t)p_binarySearchPageArray:(id)a3 forCharacterIndex:(unint64_t)a4 min:(int64_t)a5 max:(int64_t)a6;
- (unint64_t)absolutePhysicalPageIndex:(unint64_t)a3 forFragment:(id)a4;
- (unint64_t)bodyCharIndexForGutterDrawableForWidgetInfo:(id)a3 forPresentationType:(id)a4;
- (unint64_t)displayStartingPageNumberForPresentationType:(id)a3;
- (unint64_t)pageCountForPresentationType:(id)a3;
- (unint64_t)relativeIndexOfPage:(id)a3 forPresentationType:(id)a4;
- (unint64_t)relativePageIndexForBodyCharacterIndex:(unint64_t)a3;
- (unint64_t)relativePageIndexForCharacterIndex:(unint64_t)a3 forInfo:(id)a4;
- (unint64_t)relativePageIndexForInfo:(id)a3 forPresentationType:(id)a4;
- (void)accumulateDisplayPageNumbersIntoAbsolutePageIndexMap:(id)a3 AndDisplayPageNumberArray:(id)a4;
- (void)addPageInfo:(id)a3 insertContext:(id)a4 forPresentationType:(id)a5;
- (void)cancelLoading;
- (void)contentLoadOperation:(id)a3 loadedContentBodies:(id)a4;
- (void)contentLoadOperationFailed:(id)mLoadOperation;
- (void)dealloc;
- (void)i_flushingBody:(id)a3;
- (void)invalidatePresentationType:(id)a3;
- (void)p_clearFieldsForFutureLoading;
- (void)p_releaseFlushedBodies;
- (void)p_setStorageAnchorsForCfis:(id)a3;
- (void)p_setTextChildOffsetStorageAnchorsForCfis:(id)a3;
- (void)paginationController:(id)a3 paginatedBody:(id)a4 forPresentationType:(id)a5;
- (void)performWhenFinishedLoading:(id)a3 onError:(id)a4;
- (void)releaseBodies;
- (void)retainBodies;
- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3 forFragment:(id)a4;
- (void)setAnchorForCfiFrag:(id)a3;
- (void)setApplePubEntryID:(id)a3;
- (void)setApplePubURLWithState:(id)a3;
- (void)setCfiBase:(id)a3;
- (void)setCfiBaseWithState:(id)a3;
- (void)setCfiFragsForTextChildOffsets:(id)a3;
- (void)setDisplayStartingPageFormat:(int)a3 presentationType:(id)a4;
- (void)setDisplayStartingPageFormats:(id)a3;
- (void)setDisplayStartingPageNumber:(unint64_t)a3 presentationType:(id)a4;
- (void)setDisplayStartingPageNumbers:(id)a3;
- (void)setFragmentPhysicalPageIndexes:(id)a3;
- (void)setGlossaryTermExists:(BOOL)a3;
- (void)setNavigationPageNode:(BOOL)a3;
- (void)setNodeUniqueID:(id)a3 forInfo:(id)a4 presentationType:(id)a5;
- (void)setPaginatedBodyStale:(BOOL)a3;
- (void)setPaginationOperation:(id)a3;
- (void)setPresentationContentBodies:(id)a3;
- (void)setReflowablePaginationController:(id)a3;
- (void)setStorage:(id)a3 range:(_NSRange)a4 forAnchorId:(id)a5;
- (void)setStorageAnchor:(id)a3 forAnchorId:(id)a4;
- (void)setStorageAnchorsForAnchorID:(id)a3;
- (void)setStorageAnchorsForAnchorIDs:(id)a3;
- (void)setStorageAnchorsForCfiFrag:(id)a3;
- (void)setTextChildOffsetStorageAnchorsForCfiFrag:(id)a3;
- (void)startLoading;
- (void)waitUntilFinishedLoading;
- (void)waitUntilFinishedLoadingAndPaginating;
- (void)willRead;
- (void)willReadJustLoad;
@end

@implementation THModelContentNode

- (TSUNoCopyDictionary)presentationContentBodies
{
  return self->mPresentationContentBodies;
}

- (void)setPresentationContentBodies:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mPresentationContentBodies = (TSUNoCopyDictionary *)a3;
}

- (TSUNoCopyDictionary)displayStartingPageNumbers
{
  return self->mDisplayStartingPageNumbers;
}

- (void)setDisplayStartingPageNumbers:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mDisplayStartingPageNumbers = (TSUNoCopyDictionary *)a3;
}

- (TSUNoCopyDictionary)displayStartingPageFormats
{
  return self->mDisplayStartingPageFormats;
}

- (void)setDisplayStartingPageFormats:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mDisplayStartingPageFormats = (TSUNoCopyDictionary *)a3;
}

- (NSMutableDictionary)fragmentPhysicalPageIndexes
{
  return self->mFragmentPhysicalPageIndexes;
}

- (void)setFragmentPhysicalPageIndexes:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mFragmentPhysicalPageIndexes = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)storageAnchorsForAnchorID
{
  return self->mStorageAnchorsForAnchorID;
}

- (void)setStorageAnchorsForAnchorID:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mStorageAnchorsForAnchorID = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)anchorForCfiFrag
{
  return self->mAnchorForCfiFrag;
}

- (void)setAnchorForCfiFrag:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mAnchorForCfiFrag = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)storageAnchorsForCfiFrag
{
  return self->mStorageAnchorsForCfiFrag;
}

- (void)setStorageAnchorsForCfiFrag:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mStorageAnchorsForCfiFrag = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)textChildOffsetStorageAnchorsForCfiFrag
{
  return self->mTextChildOffsetStorageAnchorsForCfiFrag;
}

- (void)setTextChildOffsetStorageAnchorsForCfiFrag:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mTextChildOffsetStorageAnchorsForCfiFrag = (NSMutableDictionary *)a3;
}

- (id)cfiFragsForTextChildOffsets
{
  return self->mCfiFragsForTextChildOffsets;
}

- (void)setCfiFragsForTextChildOffsets:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mCfiFragsForTextChildOffsets = (NSMutableDictionary *)a3;
}

- (NSString)cfiBase
{
  return self->mCfiBase;
}

- (void)setCfiBase:(id)a3
{
  [(THModelContentNode *)self willModify];
  id v5 = a3;

  self->mCfiBase = (NSString *)a3;
}

- (BOOL)glossaryTermExists
{
  return self->mGlossaryTermExists;
}

- (void)setGlossaryTermExists:(BOOL)a3
{
  self->mGlossaryTermExists = a3;
}

- (THModelContentNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)THModelContentNode;
  id v5 = [(THModelNode *)&v8 initWithTitle:a3 includeInTOC:a4 context:a5];
  if (v5)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    -[THModelContentNode setPresentationContentBodies:](v5, "setPresentationContentBodies:", [objc_alloc((Class)TSUNoCopyDictionary) initWithCFDictionary:Mutable]);
    CFRelease(Mutable);
    [(THModelContentNode *)v5 setStorageAnchorsForAnchorID:+[NSMutableDictionary dictionary]];
    [(THModelContentNode *)v5 setAnchorForCfiFrag:+[NSMutableDictionary dictionary]];
    [(THModelContentNode *)v5 setStorageAnchorsForCfiFrag:+[NSMutableDictionary dictionary]];
    [(THModelContentNode *)v5 setTextChildOffsetStorageAnchorsForCfiFrag:+[NSMutableDictionary dictionary]];
    v5->mCfiFragsForTextChildOffsets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(THModelContentNode *)v5 setDisplayStartingPageNumbers:+[TSUNoCopyDictionary dictionary]];
    [(THModelContentNode *)v5 setDisplayStartingPageFormats:+[TSUNoCopyDictionary dictionary]];
    [(THModelContentNode *)v5 setFragmentPhysicalPageIndexes:+[NSMutableDictionary dictionary]];
    v5->mLoadState = 0;
    v5->mLoadStateLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  unsigned int mLoadState = self->mLoadState;
  BOOL v4 = mLoadState > 5;
  int v5 = (1 << mLoadState) & 0x31;
  if (v4 || v5 == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:115 description:@"node should not be loading when deallocated"];
  }
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) ownerRelease];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  self->mFragmentPhysicalPageIndexes = 0;
  self->mPresentationContentBodies = 0;

  self->mPublicationContext = 0;
  self->mApplePubURL = 0;

  self->mLoadOperation = 0;
  self->mStorageAnchorsForAnchorID = 0;

  self->mStorageAnchorsForCfiFrag = 0;
  self->mTextChildOffsetStorageAnchorsForCfiFrag = 0;

  self->mCfiFragsForTextChildOffsets = 0;
  self->mAnchorForCfiFrag = 0;

  self->mDisplayStartingPageNumbers = 0;
  self->mDisplayStartingPageFormats = 0;

  self->_paginationOperation = 0;
  self->mBodyObjectsFlushed = 0;
  v13.receiver = self;
  v13.super_class = (Class)THModelContentNode;
  [(THModelNode *)&v13 dealloc];
}

- (void)i_flushingBody:(id)a3
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (self->mLoadState != 4) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode i_flushingBody:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:144 description:@"shouldn't be flushing a content node that isn't loaded"];
  }
  self->mBodyObjectsFlushed = 1;

  self->mLoadOperation = 0;

  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (id)p_bodyForPresentationType:(id)a3
{
  if (!a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode p_bodyForPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:152 description:@"Invalid parameter not satisfying: %s", @"presentationType != nil"];
    return 0;
  }
  if (self->mLoadState == 5) {
    return 0;
  }
  [(THModelContentNode *)self willRead];
  os_unfair_lock_lock(&self->mLoadStateLock);
  id v5 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] objectForKey:a3];
  [v5 ownerAutoreleasedAccess];
  os_unfair_lock_unlock(&self->mLoadStateLock);
  return v5;
}

- (void)p_releaseFlushedBodies
{
  if (self->mBodyObjectsFlushed)
  {
    objc_sync_enter(self);
    if (self->mBodyObjectsFlushed)
    {
      os_unfair_lock_lock(&self->mLoadStateLock);
      long long v9 = 0u;
      long long v10 = 0u;
      long long v7 = 0u;
      long long v8 = 0u;
      id v3 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v8;
        do
        {
          v6 = 0;
          do
          {
            if (*(void *)v8 != v5) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) ownerRelease];
            v6 = (char *)v6 + 1;
          }
          while (v4 != v6);
          id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        }
        while (v4);
      }
      [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] removeAllObjects];
      self->mBodyObjectsFlushed = 0;
      self->unsigned int mLoadState = 0;
      [(THModelContentNode *)self setPaginatedBodyStale:0];
      os_unfair_lock_unlock(&self->mLoadStateLock);
    }
    objc_sync_exit(self);
  }
}

- (void)invalidatePresentationType:(id)a3
{
  if ([a3 isFlow])
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode invalidatePresentationType:]");
    long long v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:192 description:@"Code for unloading the flow presentation type is not done."];
  }
  else if ([a3 isPaginated])
  {
    os_unfair_lock_lock(&self->mLoadStateLock);
    int mLoadState = self->mLoadState;
    if ((mLoadState - 3) <= 1)
    {
      if (mLoadState == 3)
      {
        [(THReflowableContentPaginationOperation *)self->_paginationOperation cancel];

        self->_paginationOperation = 0;
      }
      [(THModelContentNode *)self setPaginatedBodyStale:1];
    }
    [(THModelContentNode *)self setDisplayStartingPageNumber:0x7FFFFFFFFFFFFFFFLL presentationType:a3];
    [(THModelNode *)self setPageCount:0x7FFFFFFFFFFFFFFFLL forPresentationType:a3];
    os_unfair_lock_unlock(&self->mLoadStateLock);
  }
}

- (id)applePubRelativePath
{
  return self->mPublicationContext;
}

- (unint64_t)displayStartingPageNumberForPresentationType:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self displayStartingPageNumbers] objectForKey:a3];
  if (v3) {
    return (int)[v3 intValue];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setDisplayStartingPageNumber:(unint64_t)a3 presentationType:(id)a4
{
  v6 = [(THModelContentNode *)self displayStartingPageNumbers];
  long long v7 = +[NSNumber numberWithInteger:a3];

  [(TSUNoCopyDictionary *)v6 setObject:v7 forUncopiedKey:a4];
}

- (int)displayStartingPageFormatForPresentationType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self displayStartingPageFormats] objectForKey:a3];
  if (!v3) {
    return 0;
  }

  return [v3 intValue];
}

- (void)setDisplayStartingPageFormat:(int)a3 presentationType:(id)a4
{
  v6 = [(THModelContentNode *)self displayStartingPageFormats];
  long long v7 = +[NSNumber numberWithInteger:a3];

  [(TSUNoCopyDictionary *)v6 setObject:v7 forUncopiedKey:a4];
}

- (void)retainBodies
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  [(THModelContentNode *)self p_releaseFlushedBodies];
  if (self->mLoadState == 4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      long long v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v11 = v10;
          [v10 ownerAutoreleasedAccess];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      long long v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
    }
  }
  else
  {
    long long v8 = &OBJC_IVAR___THModelContentNode_mPreloadingBodyRetainCount;
  }
  ++*(void *)&self->super.TSPObject_opaque[*v8];
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)releaseBodies
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (self->mLoadState == 4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      long long v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    else
    {
      long long v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
    }
  }
  else
  {
    long long v8 = &OBJC_IVAR___THModelContentNode_mPreloadingBodyRetainCount;
  }
  --*(void *)&self->super.TSPObject_opaque[*v8];
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)willRead
{
  if (self->mLoadState != 5)
  {
    [(THModelContentNode *)self startLoading];
    [(THModelContentNode *)self waitUntilFinishedLoadingAndPaginating];
  }
}

- (void)willReadJustLoad
{
  if (self->mLoadState != 5)
  {
    [(THModelContentNode *)self startLoading];
    [(THModelContentNode *)self waitUntilFinishedLoading];
  }
}

- (BOOL)nodeBodyExists
{
  if (self->mLoadState == 4) {
    return 1;
  }
  else {
    return [(THModelContentNode *)self hasCachedVersion];
  }
}

- (id)bodyStorageForPresentationType:(id)a3
{
  id v3 = [(THModelContentNode *)self p_bodyForPresentationType:a3];

  return [v3 bodyStorage];
}

- (id)nodeBodyForPresentationType:(id)a3
{
  id v3 = a3;
  if (a3) {
    id v3 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] objectForKey:a3];
  }
  [v3 ownerAutoreleasedAccess];
  return v3;
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  if (!a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THModelContentNode pageCountForPresentationType:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"] lineNumber:322 description:@"Invalid parameter not satisfying: %s", @"presentationType != nil"];
LABEL_9:
    id v9 = [(THReflowablePaginationController *)[(THModelContentNode *)self reflowablePaginationController] paginationResultForContentNode:self];
    if (!v9) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    return (unint64_t)[v9 pageCount];
  }
  mPageCountByPresentationType = self->super.mPageCountByPresentationType;
  if (!mPageCountByPresentationType
    || (id v6 = [(TSUNoCopyDictionary *)mPageCountByPresentationType objectForKey:a3]) == 0
    || (unint64_t result = (unint64_t)[v6 unsignedIntegerValue], result == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v8 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] objectForKey:a3];
    if (!v8) {
      goto LABEL_9;
    }
    unint64_t result = (unint64_t)[v8 pageCount];
    if (result == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
  }
  return result;
}

- (id)pagesForPresentationType:(id)a3
{
  id v3 = [(THModelContentNode *)self p_bodyForPresentationType:a3];

  return [v3 pages];
}

- (void)addPageInfo:(id)a3 insertContext:(id)a4 forPresentationType:(id)a5
{
  if ([(THModelNode *)self state] == 2) {
    [a3 willBeAddedToDocumentRoot:[self documentRoot] context:a4];
  }
  [self p_bodyForPresentationType:a5 addPageInfo:a3];
  [a3 setParent:self];
  if ([(THModelNode *)self state] == 2)
  {
    id v9 = [(THModelContentNode *)self documentRoot];
    [a3 wasAddedToDocumentRoot:v9 context:a4];
  }
}

- (unint64_t)relativePageIndexForInfo:(id)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v5 relativePageIndexForInfo:a3];
}

- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  if ((unint64_t)objc_msgSend(objc_msgSend(v5, "pages"), "count") <= a3) {
    return 0;
  }
  id v7 = [v6 pages];

  return [v7 objectAtIndex:a3];
}

- (id)pageInfoForStorageAnchor:(id)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];
  id v6 = (char *)[a3 range];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v5 pages];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v18;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v18 != v10) {
      objc_enumerationMutation(v7);
    }
    long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
    long long v13 = (char *)[v12 bodyStorageRange];
    if (v13 <= v6 && &v13[v14] >= v6) {
      return v12;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (unint64_t)relativeIndexOfPage:(id)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = [v5 pages];

  return (unint64_t)[v6 indexOfObject:a3];
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id v5 = self;
  unint64_t v6 = [(THModelContentNode *)self pageCountForPresentationType:a4];
  if (v6 <= a3 || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THModelContentNode contentNodeForRelativePageIndex:forPresentationType:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"] lineNumber:419 description:@"Relative page index out of bounds"];
    return 0;
  }
  return v5;
}

- (id)storagesForPresentationType:(id)a3
{
  if (self->mLoadState != 4) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode storagesForPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:425 description:@"Requesting storages from unloaded content node titled '%@'", -[THModelNode title](self, "title")];
  }
  [(THModelContentNode *)self willRead];
  id v5 = [objc_alloc((Class)TSKDocumentModelEnumerator) initWithRootModelObject:[self p_bodyForPresentationType:a3] filter:&stru_457738];

  return v5;
}

- (id)storagesForAllPresentationTypes
{
  id v3 = +[TSUMutablePointerSet set];
  [(THModelContentNode *)self willRead];
  os_unfair_lock_lock(&self->mLoadStateLock);
  id v4 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] copy];
  os_unfair_lock_unlock(&self->mLoadStateLock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v17 = v4;
  id v5 = [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v9);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = [(THModelContentNode *)self storagesForPresentationType:v10];
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            long long v15 = 0;
            do
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v3 addObject:*(void *)(*((void *)&v18 + 1) + 8 * (void)v15)];
              long long v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  return v3;
}

- (int64_t)p_binarySearchPageArray:(id)a3 forCharacterIndex:(unint64_t)a4 min:(int64_t)a5 max:(int64_t)a6
{
  if (a6 < a5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v7 = a6;
  int64_t v8 = a5;
  int64_t v6 = a5 + (a6 - a5) / 2;
  id v12 = [a3 objectAtIndex:v6];
  if ((unint64_t)[v12 pageStartCharIndex] <= a4)
  {
    if ((unint64_t)[v12 pageEndCharIndex] > a4) {
      return v6;
    }
    int64_t v8 = v6 + 1;
  }
  else
  {
    int64_t v7 = v6 - 1;
  }

  return [(THModelContentNode *)self p_binarySearchPageArray:a3 forCharacterIndex:a4 min:v8 max:v7];
}

- (unint64_t)relativePageIndexForBodyCharacterIndex:(unint64_t)a3
{
  id v5 = [[self p_bodyForPresentationType:[THPresentationType paginatedPresentationTypeInContext:self.context]] pages];
  if ([v5 count] == (char *)&dword_0 + 1) {
    return 0;
  }
  unint64_t result = -[THModelContentNode p_binarySearchPageArray:forCharacterIndex:min:max:](self, "p_binarySearchPageArray:forCharacterIndex:min:max:", v5, a3, 0, (char *)[v5 count] - 1);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a3) {
      return 0;
    }
    if (objc_msgSend(objc_msgSend(v5, "objectAtIndex:", (char *)objc_msgSend(v5, "count") - 1), "pageEndCharIndex") == (id)a3) {
      return (unint64_t)[v5 count] - 1;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (unint64_t)relativePageIndexForCharacterIndex:(unint64_t)a3 forInfo:(id)a4
{
  if (!a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (v7 && [(THModelContentNode *)self isBodyStorage:v7])
  {
    return [(THModelContentNode *)self relativePageIndexForBodyCharacterIndex:a3];
  }
  else
  {
    id v9 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)self context]];
    return [(THModelContentNode *)self relativePageIndexForInfo:a4 forPresentationType:v9];
  }
}

- (void)accumulateDisplayPageNumbersIntoAbsolutePageIndexMap:(id)a3 AndDisplayPageNumberArray:(id)a4
{
  id v7 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)self context]];
  unint64_t v8 = [(THModelContentNode *)self pageCountForPresentationType:v7];
  unint64_t v9 = [(THModelNode *)self precedingPageCountForPresentationType:v7];
  unint64_t v10 = [(THModelContentNode *)self displayStartingPageNumberForPresentationType:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = v10;
    uint64_t v14 = [(THModelContentNode *)self displayStartingPageFormatForPresentationType:v7];
    if (v8)
    {
      uint64_t v15 = v14;
      do
      {
        long long v16 = [[NSString stringForValue:withListNumberFormat:includeFormatting:] lowercaseString];
        id v17 = [a3 objectForKey:v16];
        if (!v17)
        {
          id v17 = +[NSMutableArray array];
          [a3 setObject:v17 forKey:v16];
        }
        [v17 addObject:[NSNumber numberWithUnsignedInteger:v9]];
        if (v16)
        {
          id v18 = a4;
          long long v19 = v16;
        }
        else
        {
          long long v19 = +[NSNull null];
          id v18 = a4;
        }
        [v18 insertObject:v19 atIndex:v9];
        unint64_t v13 = (v13 + 1);
        ++v9;
        --v8;
      }
      while (v8);
    }
  }
}

- (id)nodeUniqueIDForInfo:(id)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];

  return [v5 nodeUniqueIDForInfo:a3];
}

- (id)infoForNodeUniqueID:(id)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];

  return [v5 infoForNodeUniqueID:a3];
}

- (id)infoForNodeUniqueID:(id)a3
{
  id v5 = [(THModelNode *)self paginatedPresentationType];

  return [(THModelContentNode *)self infoForNodeUniqueID:a3 forPresentationType:v5];
}

- (void)setNodeUniqueID:(id)a3 forInfo:(id)a4 presentationType:(id)a5
{
  id v7 = [(THModelContentNode *)self p_bodyForPresentationType:a5];

  [v7 setNodeUniqueID:a3 forInfo:a4];
}

- (BOOL)isBodyStorage:(id)a3
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  int mLoadState = self->mLoadState;
  if ((mLoadState - 3) >= 2)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode isBodyStorage:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:597 description:@"Asking about an info from unloaded node. Where did the info even come from?"];
    int mLoadState = self->mLoadState;
  }
  unsigned int v7 = mLoadState - 1;
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (v7 <= 1) {
    [(THModelContentNode *)self willReadJustLoad];
  }
  os_unfair_lock_lock(p_mLoadStateLock);
  id v8 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
  os_unfair_lock_unlock(p_mLoadStateLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) bodyStorage] == a3)
        {
          LOBYTE(v9) = 1;
          return (char)v9;
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v10 = v9;
      if (v9) {
        continue;
      }
      break;
    }
  }
  return (char)v9;
}

- (BOOL)hasBodyStorageUID:(id)a3
{
  [(THModelContentNode *)self willReadJustLoad];
  id v5 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "nodeUniqueIDForInfo:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "bodyStorage")), "isEqualToString:", a3))
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v6;
}

- (id)nodeUniqueIDForInfo:(id)a3
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  unsigned int v6 = self->mLoadState - 1;
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (v6 <= 1) {
    [(THModelContentNode *)self willReadJustLoad];
  }
  os_unfair_lock_lock(p_mLoadStateLock);
  id v7 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (self->mLoadState < 3u) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v8)
  {
LABEL_12:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode nodeUniqueIDForInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:671 description:@"Couldn't find unique ID for info: %@", a3];
    return 0;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v14;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v14 != v10) {
      objc_enumerationMutation(v7);
    }
    id result = [*(id *)(*((void *)&v13 + 1) + 8 * v11) nodeUniqueIDForInfo:a3];
    if (result) {
      return result;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
}

- (BOOL)containsInfo:(id)a3
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  int mLoadState = self->mLoadState;
  if ((mLoadState - 3) >= 2)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode containsInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:680 description:@"Asking for id from unloaded node. Where did the info even come from?"];
    int mLoadState = self->mLoadState;
  }
  unsigned int v7 = mLoadState - 1;
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (v7 <= 1) {
    [(THModelContentNode *)self willReadJustLoad];
  }
  os_unfair_lock_lock(p_mLoadStateLock);
  id v8 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] allValues];
  os_unfair_lock_unlock(p_mLoadStateLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "infos"), "containsObject:", a3))
        {
          LOBYTE(v9) = 1;
          return (char)v9;
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v10 = v9;
      if (v9) {
        continue;
      }
      break;
    }
  }
  return (char)v9;
}

- (void)setStorageAnchor:(id)a3 forAnchorId:(id)a4
{
  if ([a3 contentNode] != self) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode setStorageAnchor:forAnchorId:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:708 description:@"THModelStorageAnchor.context should match THModelContentNodeBody.context"];
  }
  [(THModelContentNode *)self willModify];
  mStorageAnchorsForAnchorID = self->mStorageAnchorsForAnchorID;

  [(NSMutableDictionary *)mStorageAnchorsForAnchorID setObject:a3 forKey:a4];
}

- (id)storageAnchorForNodeRelativePageIndex:(unint64_t)a3
{
  [(THModelContentNode *)self willRead];
  id v5 = [(THModelContentNode *)self pageAtRelativeIndex:a3 forPresentationType:+[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)self context]]];
  if (!v5) {
    return 0;
  }
  unsigned int v6 = v5;
  id v7 = [v5 bodyStorageRange];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (![(THModelContentNode *)self reflowablePaginationController]) {
      return 0;
    }
    id v9 = [(THReflowablePaginationController *)[(THModelContentNode *)self reflowablePaginationController] paginationResultForContentNode:self];
    if (!v9) {
      return 0;
    }
    id v7 = [v9 hintRangeForRelativePageIndex:a3];
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = -[THModelContentNode nodeUniqueIDForInfo:](self, "nodeUniqueIDForInfo:", [v6 bodyStorage]);

  return +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", self, v13, v11, v12);
}

- (id)storageAnchorForAnchorId:(id)a3
{
  [(THModelContentNode *)self willRead];
  id v5 = [(THModelContentNode *)self storageAnchorsForAnchorID];

  return [(NSMutableDictionary *)v5 objectForKey:a3];
}

- (void)setStorage:(id)a3 range:(_NSRange)a4 forAnchorId:(id)a5
{
  id v7 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", self, [(THModelContentNode *)self nodeUniqueIDForInfo:a3], a4.location, a4.length);

  [(THModelContentNode *)self setStorageAnchor:v7 forAnchorId:a5];
}

- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3 forFragment:(id)a4
{
  [(THModelContentNode *)self willModify];
  id v7 = [(THModelContentNode *)self fragmentPhysicalPageIndexes];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:a3];

  [(NSMutableDictionary *)v7 setObject:v8 forKey:a4];
}

- (unint64_t)absolutePhysicalPageIndex:(unint64_t)a3 forFragment:(id)a4
{
  id v4 = [(NSMutableDictionary *)[(THModelContentNode *)self fragmentPhysicalPageIndexes] objectForKey:a4];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v4 unsignedIntegerValue];
}

- (void)setStorageAnchorsForAnchorIDs:(id)a3
{
  [(NSMutableDictionary *)self->mStorageAnchorsForAnchorID removeAllObjects];
  id v5 = [a3 allKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [a3 objectForKey:v10];
        [v11 setContentNode:self];
        [(NSMutableDictionary *)self->mStorageAnchorsForAnchorID setObject:v11 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)p_setStorageAnchorsForCfis:(id)a3
{
  [(NSMutableDictionary *)self->mStorageAnchorsForCfiFrag removeAllObjects];
  id v5 = [a3 allKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [a3 objectForKey:v10];
        [v11 setContentNode:self];
        [(NSMutableDictionary *)self->mStorageAnchorsForCfiFrag setObject:v11 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)p_cfiFragsForOffsetsComparator
{
  return &stru_457778;
}

- (BOOL)p_possiblyReplaceCFIFragmentForExistingOffsetEntry:(id)a3 newEntry:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(a3, "first"), "compare:", objc_msgSend(a4, "first"));
  if (!v6)
  {
    id v7 = [[[a4 second] componentsSeparatedByString:@"/"] count];
    if (v7 > objc_msgSend(objc_msgSend(objc_msgSend(a3, "second"), "componentsSeparatedByString:", @"/"), "count"))objc_msgSend(a3, "setSecond:", objc_msgSend(a4, "second")); {
  }
    }
  return v6 == 0;
}

- (void)p_setTextChildOffsetStorageAnchorsForCfis:(id)a3
{
  [(NSMutableDictionary *)self->mTextChildOffsetStorageAnchorsForCfiFrag removeAllObjects];
  [(NSMutableDictionary *)self->mCfiFragsForTextChildOffsets removeAllObjects];
  id v5 = [a3 allKeys];
  id v19 = [(THModelContentNode *)self p_cfiFragsForOffsetsComparator];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138543362;
    long long v18 = v7;
    do
    {
      uint64_t v10 = 0;
      id v20 = v8;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v10);
        id v12 = [a3 objectForKey:v11, v18];
        [v12 setContentNode:self];
        [(NSMutableDictionary *)self->mTextChildOffsetStorageAnchorsForCfiFrag setObject:v12 forKey:v11];
        if ([v12 storageUID])
        {
          if ([v12 storageUID])
          {
            id v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->mCfiFragsForTextChildOffsets, "objectForKeyedSubscript:", [v12 storageUID]);
            if (!v13)
            {
              id v13 = +[NSMutableArray array];
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->mCfiFragsForTextChildOffsets, "setObject:forKeyedSubscript:", v13, [v12 storageUID]);
            }
            long long v14 = +[TSUMutablePair pairWithFirst:second:](TSUMutablePair, "pairWithFirst:second:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 range]), v11);
            long long v15 = [(char *)[v13 indexOfObject:v14 inSortedRange:0 options:1024 usingComparator:v19]];
            id v8 = v20;
            if (([v13 count] <= v15
               || !-[THModelContentNode p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:](self, "p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:", [v13 objectAtIndexedSubscript:v15], v14))&& (!v15|| objc_msgSend(v13, "count") <= v15 - 1|| !-[THModelContentNode p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:](self, "p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:", objc_msgSend(v13, "objectAtIndexedSubscript:"), v14)))
            {
              [v13 insertObject:v14 atIndex:v15];
            }
          }
        }
        else
        {
          long long v16 = THLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = [v12 description];
            *(_DWORD *)buf = v18;
            id v27 = v17;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Encountered invalid anchor %{public}@.  This can happen when two TSWPStorages share an ID.  Will not use this anchor in the CFI fragment reverse map.", buf, 0xCu);
          }
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }
}

- (id)storageAnchorForCfiFrag:(id)a3
{
  [(THModelContentNode *)self willRead];
  id result = [(NSMutableDictionary *)[(THModelContentNode *)self storageAnchorsForCfiFrag] objectForKey:a3];
  if (!result)
  {
    id v6 = [(THModelContentNode *)self textChildOffsetStorageAnchorsForCfiFrag];
    return [(NSMutableDictionary *)v6 objectForKey:a3];
  }
  return result;
}

- (id)cfiFragWithOffset:(unint64_t)a3 storageUID:(id)a4 pedantic:(BOOL)a5
{
  BOOL v5 = a5;
  [(THModelContentNode *)self willRead];
  if (v5)
  {
    id v9 = [(THModelContentNode *)self p_cfiFragsForOffsetsComparator];
    id v10 = [(NSMutableDictionary *)self->mCfiFragsForTextChildOffsets objectForKeyedSubscript:a4];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = +[NSNumber numberWithUnsignedInteger:a3];
      id v13 = [v11 indexOfObject:+[TSUMutablePair pairWithFirst:second:](TSUMutablePair, "pairWithFirst:second:", v12, &stru_46D7E8) inSortedRange:0 options:1024 usingComparator:v9];
      if ([v11 count] > v13
        && !objc_msgSend(objc_msgSend(objc_msgSend(v11, "objectAtIndexedSubscript:", v13), "first"), "compare:", v12))
      {
        id v15 = [[v11 objectAtIndexedSubscript:v13] second];
        int64_t v16 = 0;
LABEL_30:
        id v19 = v15;
        if (v15) {
          goto LABEL_31;
        }
        return 0;
      }
      if (v13 && [v11 count] > v13 - 1)
      {
        id v14 = [v11 objectAtIndexedSubscript:];
        id v15 = [v14 second];
        int64_t v16 = a3 - [v14 first].integerValue;
        goto LABEL_30;
      }
    }
    return 0;
  }
  id v17 = [(NSMutableDictionary *)self->mStorageAnchorsForCfiFrag keyEnumerator];
  id v18 = [v17 nextObject];
  if (!v18) {
    return 0;
  }
  id v19 = v18;
  id v15 = 0;
  int64_t v16 = -1;
  while (1)
  {
    id v20 = [(THModelContentNode *)self storageAnchorForCfiFrag:v19];
    if (objc_msgSend(objc_msgSend(v20, "storageUID"), "isEqualToString:", a4)) {
      break;
    }
LABEL_26:
    id v19 = [v17 nextObject];
    if (!v19) {
      goto LABEL_30;
    }
  }
  id v21 = [v20 range];
  uint64_t v22 = a3 - (void)v21;
  if ((id)a3 != v21)
  {
    BOOL v24 = v16 == -1 || v22 < v16;
    BOOL v25 = !v24;
    if (v24) {
      id v26 = v19;
    }
    else {
      id v26 = v15;
    }
    if (v25) {
      unint64_t v27 = v16;
    }
    else {
      unint64_t v27 = a3 - (void)v21;
    }
    if (v22 >= 1)
    {
      id v15 = v26;
      int64_t v16 = v27;
    }
    goto LABEL_26;
  }
  int64_t v16 = 0;
LABEL_31:
  if (v5 || (id v28 = [(NSMutableDictionary *)self->mAnchorForCfiFrag objectForKey:v19]) == 0) {
    CFStringRef v29 = &stru_46D7E8;
  }
  else {
    CFStringRef v29 = +[NSString stringWithFormat:@"[%@]", v28];
  }
  return [v19 stringByAppendingFormat:@"%@:%ld", v29, v16];
}

- (id)storageAnchorForCfiInnerPathReader:(id)a3
{
  uint64_t v20 = 0;
  BOOL v5 = (char *)[a3 componentCount];
  id v6 = [a3 pathStringNoIds];
  if (v5)
  {
    id v7 = v6;
    int v8 = 0;
    do
    {
      if (v8)
      {
        [a3 componentAtIndex:--v5 identifier:&v20];
        id v7 = [v7 stringByDeletingLastPathComponent];
        id v9 = 0;
      }
      else
      {
        id v9 = (char *)[a3 characterOffsetTerminatingStepIdentifier:&v20];
        --v5;
      }
      if (v20)
      {
        id v10 = -[THModelContentNode storageAnchorForAnchorId:](self, "storageAnchorForAnchorId:");
        if (v10)
        {
          id v12 = v10;
          if ((v8 & 1) == 0) {
            goto LABEL_17;
          }
          goto LABEL_20;
        }
      }
      id v11 = [(THModelContentNode *)self storageAnchorForCfiFrag:v7];
      id v12 = v11;
      if (v11) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v8 == 0;
      }
      if (v13) {
        int v8 = 1;
      }
    }
    while (!v11 && v5);
    if ((v8 & 1) == 0)
    {
LABEL_17:
      if (!v12) {
        return 0;
      }
      goto LABEL_18;
    }
LABEL_20:
    id v17 = [-self cfiFragWithOffset:[v12 range] storageUID:[v12 storageUID] pedantic:0];
    if (v17 && [a3 updateWithCfiFrag:v17 toIndex:v5 + 1])
    {
      id v18 = [a3 pathStringNoIds];
      id v19 = v12;
      if (v18)
      {
        id v19 = [(THModelContentNode *)self storageAnchorForCfiFrag:v18];
        id v9 = (char *)[a3 characterOffsetTerminatingStepIdentifier:&v20];
      }
    }
    else
    {
      id v19 = v12;
    }
    if (v19) {
      id v12 = v19;
    }
    else {
      id v9 = 0;
    }
    if (v12)
    {
LABEL_18:
      id v14 = [v12 range];
      return +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", self, [v12 storageUID], &v9[(void)v14], v15);
    }
  }
  return 0;
}

- (id)storageAnchorForCfiReader:(id)a3
{
  [(THModelContentNode *)self willRead];
  id v5 = [a3 innerPathReader];
  id v6 = [a3 innerPathMaxRangeReader];
  id v7 = [(THModelContentNode *)self storageAnchorForCfiInnerPathReader:v5];
  id v8 = [(THModelContentNode *)self storageAnchorForCfiInnerPathReader:v6];
  if (v7)
  {
    id v9 = v8;
    if (v8)
    {
      if (objc_msgSend(objc_msgSend(v7, "storageUID"), "isEqualToString:", objc_msgSend(v8, "storageUID")))
      {
        id v10 = [v9 range];
        if (v10 <= [v7 range])
        {
          id v11 = [v9 range];
          id v14 = [v7 range];
          int64_t v13 = v14 - (unsigned char *)[v9 range];
        }
        else
        {
          id v11 = [v7 range];
          id v12 = [v9 range];
          int64_t v13 = v12 - (unsigned char *)[v7 range];
        }
        [v7 setRange:v11, v13];
      }
      else
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode storageAnchorForCfiReader:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:1046 description:@"Cannot resolve a modelStorageAnchorRange across storages."];
      }
    }
  }
  return v7;
}

- (id)storageAnchorAfterAnchor:(id)a3 forNthInstance:(unint64_t)a4 ofSearchString:(id)a5 presentationType:(id)a6
{
  if (!a3) {
    return 0;
  }
  -[THModelContentNode infoForNodeUniqueID:forPresentationType:](self, "infoForNodeUniqueID:forPresentationType:", [a3 storageUID], a6);
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  if (!v9) {
    return a3;
  }
  id v10 = (void *)v9;
  id v11 = (char *)[a3 range];
  id v12 = [v10 length];
  int64_t v13 = [a3 range];
  if (!a4) {
    return a3;
  }
  id v14 = (char *)(v12 - v13);
  uint64_t v15 = (THModelStorageAnchor *)a3;
  do
  {
    if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || v14 == 0) {
      break;
    }
    id v17 = [v10 rangeOfString:a5 searchOptions:1 range:v11 v14];
    if (v17 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v19 = v18;
    if (!v18) {
      break;
    }
    uint64_t v20 = v17;
    if (a4 == 1)
    {
      id v21 = a5;
      id v22 = [a3 contentNode];
      id v23 = [a3 storageUID];
      id v24 = v22;
      a5 = v21;
      uint64_t v15 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v24, v23, v20, v19);
    }
    else
    {
      id v11 = &v17[v18];
      id v14 = (char *)((unsigned char *)[v10 length] - &v17[v18]);
    }
    --a4;
  }
  while (a4);
  return v15;
}

- (id)cfiForOffset:(unint64_t)a3 storageUID:(id)a4 includeFilename:(BOOL)a5 pedantic:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  [(THModelContentNode *)self willRead];
  if (!self->mCfiBase) {
    self->mCfiBase = (NSString *)&stru_46D7E8;
  }
  id v11 = [(THModelContentNode *)self cfiFragWithOffset:a3 storageUID:a4 pedantic:v6];
  if (v7) {
    id v12 = [(NSURL *)self->mApplePubURL lastPathComponent];
  }
  else {
    id v12 = 0;
  }
  mCfiBase = self->mCfiBase;

  return +[THCFIReader cfiWithFilename:v12 base:mCfiBase innerComponents:v11];
}

- (id)cfiForRange:(_NSRange)a3 storageUID:(id)a4 includeFilename:(BOOL)a5 pedantic:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(THModelContentNode *)self willRead];
  if (self->mCfiBase)
  {
    if (length) {
      goto LABEL_3;
    }
  }
  else
  {
    self->mCfiBase = (NSString *)&stru_46D7E8;
    if (length)
    {
LABEL_3:
      id v12 = [(THModelContentNode *)self cfiFragWithOffset:location storageUID:a4 pedantic:v6];
      id v13 = [(THModelContentNode *)self cfiFragWithOffset:location + length storageUID:a4 pedantic:v6];
      if (v7)
      {
        id v14 = [(NSURL *)self->mApplePubURL lastPathComponent];
        if (!v12) {
          return 0;
        }
      }
      else
      {
        id v14 = 0;
        if (!v12) {
          return 0;
        }
      }
      if (v13)
      {
        mCfiBase = self->mCfiBase;
        return +[THCFIReader cfiRangeWithFilename:v14 base:mCfiBase innerComponents1:v12 innerComponents2:v13];
      }
      return 0;
    }
  }

  return [(THModelContentNode *)self cfiForOffset:location storageUID:a4 includeFilename:v7 pedantic:v6];
}

- (id)pageNumberStringForAbsolutePageIndex:(unint64_t)a3 presentationType:(id)a4
{
  unint64_t v7 = [(THModelContentNode *)self displayStartingPageNumberForPresentationType:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11.receiver = self;
    v11.super_class = (Class)THModelContentNode;
    return [(THModelNode *)&v11 pageNumberStringForAbsolutePageIndex:a3 presentationType:a4];
  }
  else
  {
    uint64_t v9 = [(THModelNode *)self relativePageIndexForAbsolutePageIndex:a3 forPresentationType:a4]+ v7;
    uint64_t v10 = [(THModelContentNode *)self displayStartingPageFormatForPresentationType:a4];
    return +[NSString stringForValue:v9 withListNumberFormat:v10 includeFormatting:0];
  }
}

- (id)gutterStorageForPresentationType:(id)a3
{
  id v3 = [(THModelContentNode *)self p_bodyForPresentationType:a3];

  return [v3 gutterDrawableStorage];
}

- (id)expandableInfoForWidgetInfo:(id)a3 forPresentationType:(id)a4
{
  id v5 = [(THModelContentNode *)self p_bodyForPresentationType:a4];

  return [v5 expandableInfoForWidgetInfo:a3];
}

- (unint64_t)bodyCharIndexForGutterDrawableForWidgetInfo:(id)a3 forPresentationType:(id)a4
{
  id v6 = -[THModelContentNode expandableInfoForWidgetInfo:forPresentationType:](self, "expandableInfoForWidgetInfo:forPresentationType:", a3);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = v6;
  id v8 = [(THModelContentNode *)self p_bodyForPresentationType:a4];

  return (unint64_t)[v8 bodyCharIndexOfGutterDrawable:v7];
}

- (void)p_clearFieldsForFutureLoading
{
  self->mStorageAnchorsForAnchorID = 0;
  self->mStorageAnchorsForCfiFrag = 0;

  self->mTextChildOffsetStorageAnchorsForCfiFrag = 0;
  self->mCfiFragsForTextChildOffsets = 0;

  self->mAnchorForCfiFrag = 0;
  [(THModelContentNode *)self setStorageAnchorsForAnchorID:+[NSMutableDictionary dictionary]];
  [(THModelContentNode *)self setStorageAnchorsForCfiFrag:+[NSMutableDictionary dictionary]];
  [(THModelContentNode *)self setTextChildOffsetStorageAnchorsForCfiFrag:+[NSMutableDictionary dictionary]];
  [(THModelContentNode *)self setCfiFragsForTextChildOffsets:+[NSMutableDictionary dictionary]];
  id v3 = +[NSMutableDictionary dictionary];

  [(THModelContentNode *)self setAnchorForCfiFrag:v3];
}

- (void)startLoading
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  [(THModelContentNode *)self p_releaseFlushedBodies];
  if (!self->mLoadState)
  {
    id v4 = _os_activity_create(&dword_0, "Content Node Load", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_39990;
    block[3] = &unk_4577A0;
    block[4] = self;
    block[5] = &v9;
    os_activity_apply(v4, block);
  }
  if ([(THModelContentNode *)self paginatedBodyStale])
  {
    id v5 = _os_activity_create(&dword_0, "Content Node Load Paginated Body Stale", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_39AFC;
    v7[3] = &unk_456E38;
    v7[4] = self;
    v7[5] = v5;
    os_activity_apply(v5, v7);
  }
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (*((unsigned char *)v10 + 24))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_39B8C;
    v6[3] = &unk_4577C8;
    v6[4] = self;
    +[THPerformanceRegressionLogger logEventWithBlock:v6];
  }
  _Block_object_dispose(&v9, 8);
}

- (void)cancelLoading
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  int mLoadState = self->mLoadState;
  if ((mLoadState - 1) >= 2)
  {
    if (mLoadState == 3)
    {
      [(THReflowableContentPaginationOperation *)self->_paginationOperation cancel];

      self->_paginationOperation = 0;
    }
  }
  else
  {
    [(THModelContentLoadOperation *)self->mLoadOperation cancel];
    self->int mLoadState = 0;

    self->mLoadOperation = 0;
    [(THModelContentNode *)self p_clearFieldsForFutureLoading];
  }
  [(THModelContentNode *)self setPaginatedBodyStale:0];

  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)performWhenFinishedLoading:(id)a3 onError:(id)a4
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  int mLoadState = self->mLoadState;
  if (!mLoadState)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode performWhenFinishedLoading:onError:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:1283 description:@"should be loading before this is called"];
    int mLoadState = self->mLoadState;
  }
  if (mLoadState != 5)
  {
    if (mLoadState != 4)
    {
      mLoadOperation = self->mLoadOperation;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_39DE8;
      v11[3] = &unk_4577F0;
      v11[4] = self;
      v11[5] = a4;
      v11[6] = a3;
      [(THModelContentLoadOperation *)mLoadOperation appendMainThreadCompletionBlock:v11];
      os_unfair_lock_unlock(p_mLoadStateLock);
      return;
    }
    a4 = a3;
  }
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (a4)
  {
    uint64_t v9 = (void (*)(id))*((void *)a4 + 2);
    v9(a4);
  }
}

- (void)waitUntilFinishedLoading
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  unsigned int mLoadState = self->mLoadState;
  if (!mLoadState)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode waitUntilFinishedLoading]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m") lineNumber:1311 description:@"should be loading before this is called"];
    unsigned int mLoadState = self->mLoadState;
  }
  if (mLoadState == 1)
  {
    self->unsigned int mLoadState = 2;
LABEL_6:
    id v5 = self->mLoadOperation;
    goto LABEL_8;
  }
  if (mLoadState <= 2) {
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_8:
  os_unfair_lock_unlock(p_mLoadStateLock);
  [(THModelContentLoadOperation *)v5 waitUntilFinished];
}

- (void)waitUntilFinishedLoadingAndPaginating
{
  [(THModelContentNode *)self waitUntilFinishedLoading];
  os_unfair_lock_lock(&self->mLoadStateLock);
  if ([(THModelContentNode *)self paginatedBodyStale])
  {
    os_activity_t v3 = _os_activity_create(&dword_0, "Model Node Wait Until Finished Paginating", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    [(THReflowableContentPaginationOperation *)self->_paginationOperation cancel];

    self->_paginationOperation = 0;
    [(THModelContentNode *)self setPaginatedBodyStale:0];
    self->unsigned int mLoadState = 3;
    self->_paginationOperation = (THReflowableContentPaginationOperation *)[(THReflowablePaginationController *)[(THModelContentNode *)self reflowablePaginationController] paginateContentNode:self paginationCompletionDelegate:self priority:8 isForeground:1 activity:v3];
  }
  if (self->mLoadState == 3) {
    id v4 = self->_paginationOperation;
  }
  else {
    id v4 = 0;
  }
  os_unfair_lock_unlock(&self->mLoadStateLock);
  [(THReflowableContentPaginationOperation *)v4 waitUntilFinished];
}

- (BOOL)isLoaded
{
  return self->mLoadState == 4;
}

- (void)paginationController:(id)a3 paginatedBody:(id)a4 forPresentationType:(id)a5
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (self->mLoadState != 3) {
    goto LABEL_15;
  }
  id v9 = [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] objectForKey:a5];
  if (!v9)
  {
    int64_t mLoadedBodyRetainCount = self->mLoadedBodyRetainCount;
    goto LABEL_8;
  }
  uint64_t v10 = v9;
  [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] removeObjectForKey:a5];
  [v10 ownerRelease];
  p_int64_t mLoadedBodyRetainCount = &self->mLoadedBodyRetainCount;
  if (self->mLoadedBodyRetainCount >= 1)
  {
    int64_t v12 = 0;
    do
    {

      ++v12;
      int64_t mLoadedBodyRetainCount = *p_mLoadedBodyRetainCount;
    }
    while (v12 < *p_mLoadedBodyRetainCount);
LABEL_8:
    p_int64_t mLoadedBodyRetainCount = &self->mLoadedBodyRetainCount;
    if (mLoadedBodyRetainCount >= 1)
    {
      int64_t v14 = 0;
      do
      {
        id v15 = a4;
        ++v14;
      }
      while (v14 < *p_mLoadedBodyRetainCount);
    }
  }
  [a4 ownerRetain];
  [a4 setParent:self];
  [(TSUNoCopyDictionary *)[(THModelContentNode *)self presentationContentBodies] setObject:a4 forUncopiedKey:a5];
  -[THModelNode setPageCount:forPresentationType:](self, "setPageCount:forPresentationType:", [a4 pageCount], a5);
  if (self->mPreloadingBodyRetainCount >= 1)
  {
    int64_t v16 = 0;
    do
    {
      id v17 = a4;
      ++v16;
    }
    while (v16 < self->mPreloadingBodyRetainCount);
  }
  [a4 ownerAutoreleasedAccess];

  self->_paginationOperation = 0;
  *p_mLoadedBodyRetainCount += self->mPreloadingBodyRetainCount;
  self->mPreloadingBodyRetainCount = 0;
  self->unsigned int mLoadState = 4;
LABEL_15:

  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)contentLoadOperationFailed:(id)mLoadOperation
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if ([mLoadOperation isCancelled])
  {
    self->unsigned int mLoadState = 0;

    self->mLoadOperation = 0;
    [(THModelContentNode *)self p_clearFieldsForFutureLoading];
  }
  else
  {
    self->unsigned int mLoadState = 5;
    [self documentRoot].isCorrupt = 1;
    if (self->mLoadOperation != mLoadOperation)
    {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THModelContentNode contentLoadOperationFailed:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"] lineNumber:1441 description:@"unknown operation failed"];
      mLoadOperation = self->mLoadOperation;
    }

    self->mLoadOperation = 0;
  }

  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)contentLoadOperation:(id)a3 loadedContentBodies:(id)a4
{
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if ([a3 isCancelled])
  {
    self->unsigned int mLoadState = 0;

    self->mLoadOperation = 0;
    [(THModelContentNode *)self p_clearFieldsForFutureLoading];
  }
  else
  {
    id v8 = _os_activity_create(&dword_0, "Load Operation Finished", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3A4B8;
    block[3] = &unk_4572E8;
    block[4] = self;
    block[5] = a4;
    void block[6] = v8;
    block[7] = a3;
    os_activity_apply(v8, block);
  }
  os_unfair_lock_unlock(p_mLoadStateLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3A9CC;
  v9[3] = &unk_4577C8;
  v9[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v9];
}

- (id)annotationIDForInfo:(id)a3
{
  id result = [(THModelContentNode *)self nodeUniqueIDForInfo:a3];
  if (result)
  {
    id v5 = result;
    id v6 = objc_opt_class();
    id v7 = [(THModelNode *)self nodeGUID];
    return [v6 annotationIDForInfoID:v5 contentNodeID:v7];
  }
  return result;
}

+ (id)annotationIDForInfoID:(id)a3 contentNodeID:(id)a4
{
  if (a3 && a4) {
    return +[NSString stringWithFormat:@"%@-%@", a4, a3];
  }
  else {
    return 0;
  }
}

- (id)legacyBookmarkIDForInfo:(id)a3
{
  id result = [(THModelContentNode *)self nodeUniqueIDForInfo:a3];
  if (result)
  {
    id v5 = result;
    id v6 = objc_opt_class();
    id v7 = [(THModelNode *)self nodeGUID];
    return [v6 legacyBookmarkIDForInfoID:v5 contentNodeID:v7];
  }
  return result;
}

+ (id)legacyBookmarkIDForInfoID:(id)a3 contentNodeID:(id)a4
{
  if (a4) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (NSString)description
{
  id v3 = +[THPresentationType paginatedPresentationTypeInContext:0];
  unint64_t v4 = [(THModelContentNode *)self displayStartingPageNumberForPresentationType:v3];
  return +[NSString stringWithFormat:@"<%@* %p title=%@ pp. %lu-%lu presentations = %@>", objc_opt_class(), self, [(THModelNode *)self title], v4, (char *)[(THModelContentNode *)self pageCountForPresentationType:v3]+ v4- 1, self->mPresentationContentBodies];
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  self->_reflowablePaginationController = (THReflowablePaginationController *)a3;
}

- (BOOL)navigationPageNode
{
  return self->_navigationPageNode;
}

- (void)setNavigationPageNode:(BOOL)a3
{
  self->_navigationPageNode = a3;
}

- (THReflowableContentPaginationOperation)paginationOperation
{
  return self->_paginationOperation;
}

- (void)setPaginationOperation:(id)a3
{
}

- (BOOL)paginatedBodyStale
{
  return self->_paginatedBodyStale;
}

- (void)setPaginatedBodyStale:(BOOL)a3
{
  self->_paginatedBodyStale = a3;
}

- (BOOL)hasCachedVersion
{
  if (!self->mApplePubURL || !self->mPublicationContext) {
    return 0;
  }
  id v3 = [[PFXArchive alloc] initWithPath:[(NSURL *)self->mApplePubURL path]];
  BOOL v4 = [(PFXArchive *)v3 entryWithName:self->mPublicationContext] != 0;

  return v4;
}

- (id)applePubEntryID
{
  return self->mPublicationContext;
}

- (void)setApplePubEntryID:(id)a3
{
  if (self->mPublicationContext != a3)
  {
    id v3 = a3;
    if ([a3 hasPrefix:@"/"]) {
      id v3 = [v3 substringFromIndex:1];
    }

    self->mPublicationContext = (NSString *)v3;
  }
}

- (void)setCfiBaseWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "spineURLToCfi"), "objectForKey:", objc_msgSend(@"/", "stringByAppendingString:", self->mPublicationContext));
  if (![(NSString *)self->mCfiBase isEqualToString:v4])
  {
    id v5 = v4;

    self->mCfiBase = (NSString *)v4;
  }
}

- (BOOL)hasCachedVersionInZip:(id)a3
{
  id v4 = [(NSString *)self->mPublicationContext stringByAppendingString:@"/"];

  return +[PFXUtilities hasEntry:v4 inArchive:a3];
}

- (void)setApplePubURLWithState:(id)a3
{
  id v5 = (NSURL *)[a3 applePubZipURL];
  if (-[THModelContentNode hasCachedVersionInZip:](self, "hasCachedVersionInZip:", [a3 archive]))
  {
    mApplePubURL = self->mApplePubURL;
    if (mApplePubURL != v5)
    {

      self->mApplePubURL = v5;
    }
  }
}

@end