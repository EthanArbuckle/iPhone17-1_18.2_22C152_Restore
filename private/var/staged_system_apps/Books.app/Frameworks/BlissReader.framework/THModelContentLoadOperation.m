@interface THModelContentLoadOperation
- (BOOL)isEpub;
- (THModelContentLoadOperation)initWithDelegate:(id)a3 contentNode:(id)a4 documentRoot:(id)a5 applePubURL:(id)a6 documentEntryURI:(id)a7;
- (THModelContentLoadOperationDelegate)delegate;
- (THModelContentNode)contentNode;
- (id)newNodeBodyWithContext:(id)a3 isFlow:(BOOL)a4;
- (void)appendMainThreadCompletionBlock:(id)a3;
- (void)dealloc;
- (void)loadContentNode;
- (void)loadEpubContentNode;
- (void)loadNavigationPageContentNode;
- (void)main;
- (void)p_fixPageCharacterRangeAfterStorageTruncationWithContentState:(id)a3;
- (void)p_populateParagraphStyle:(id)a3;
- (void)p_processHintsWithContentState:(id)a3;
- (void)processHintsInOrientation:(id)a3 contentState:(id)a4;
- (void)setContentNode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEpub:(BOOL)a3;
@end

@implementation THModelContentLoadOperation

- (THModelContentLoadOperation)initWithDelegate:(id)a3 contentNode:(id)a4 documentRoot:(id)a5 applePubURL:(id)a6 documentEntryURI:(id)a7
{
  v18.receiver = self;
  v18.super_class = (Class)THModelContentLoadOperation;
  v12 = [(THModelContentLoadOperation *)&v18 init];
  if (!v12) {
    return v12;
  }
  if (a5)
  {
    if (a6) {
      goto LABEL_4;
    }
LABEL_13:
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"] lineNumber:73 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"applePubURL"];
    if (a7) {
      goto LABEL_5;
    }
LABEL_14:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:74 description:@"invalid nil value for '%s'", "documentEntryURI"];
    goto LABEL_5;
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"] lineNumber:72 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"documentRoot"]];
  if (!a6) {
    goto LABEL_13;
  }
LABEL_4:
  if (!a7) {
    goto LABEL_14;
  }
LABEL_5:
  v12->_epub = objc_msgSend(@"epub", "isEqualToString:", objc_msgSend(objc_msgSend(a6, "pathExtension"), "lowercaseString"));
  v12->_contentNode = (THModelContentNode *)a4;
  v12->mDelegate = (THModelContentLoadOperationDelegate *)a3;
  v12->mDocumentRoot = (THDocumentRoot *)a5;
  v12->mApplePubURL = (NSURL *)[a6 copy];
  v13 = (NSString *)[a7 copy];
  v12->mDocumentEntryURI = v13;
  if (v12->mApplePubURL) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14
    || (v15 = [[PFXArchive alloc] initWithPath:[(NSURL *)v12->mApplePubURL path]], id v16 = [(PFXArchive *)v15 decryptEntryWithName:v12->mDocumentEntryURI error:0], v15, !v16))
  {

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THModelContentLoadOperation;
  [(THModelContentLoadOperation *)&v3 dealloc];
}

- (void)appendMainThreadCompletionBlock:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation appendMainThreadCompletionBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:116 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    mMainThreadCompletionBlocks = self->mMainThreadCompletionBlocks;
    if (!mMainThreadCompletionBlocks)
    {
      self->mMainThreadCompletionBlocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      if ([(THModelContentLoadOperation *)self completionBlock]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation appendMainThreadCompletionBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:125 description:@"already have a completion block"];
      }
      v6 = self->mMainThreadCompletionBlocks;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1DFB98;
      v7[3] = &unk_456E38;
      v7[4] = self;
      v7[5] = v6;
      [(THModelContentLoadOperation *)self setCompletionBlock:v7];
      mMainThreadCompletionBlocks = self->mMainThreadCompletionBlocks;
    }
    -[NSMutableArray addObject:](mMainThreadCompletionBlocks, "addObject:", [a3 copy]);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation appendMainThreadCompletionBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:117 description:@"invalid nil value for '%s'", "block"];
  }
}

- (void)loadContentNode
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = [[PFXArchive alloc] initWithPath:[(NSURL *)self->mApplePubURL path]];
  [(PFXArchive *)v4 setAsset:[(THBookDescription *)[(THDocumentRoot *)self->mDocumentRoot bookDescription] asset]];
  if (![(PFXArchive *)v4 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadContentNode]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:167 description:@"Failed to load valid archive"];
  }
  if ([(PFXArchive *)v4 isValid])
  {
    id v5 = [(THModelContentLoadOperation *)self newNodeBodyWithContext:[(THDocumentRoot *)self->mDocumentRoot context] isFlow:1];
    id v6 = [(THModelContentLoadOperation *)self newNodeBodyWithContext:[(THDocumentRoot *)self->mDocumentRoot context] isFlow:0];
    v7 = [[PFAIContentState alloc] initWithDocumentRoot:self->mDocumentRoot contentNode:[(THModelContentLoadOperation *)self contentNode] flowNodeBody:v5 paginatedNodeBody:v6 archive:v4 documentEntryUri:self->mDocumentEntryURI];
    [(PFXHtmlReaderState *)v7 setNodeGUID:[(THModelNode *)[(THModelContentLoadOperation *)self contentNode] nodeGUID]];

    [(PFXHtmlReaderState *)v7 setPageContentWidth:600.0];
    if (![(PFXXmlStreamReaderState *)v7 streamAPI]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadContentNode]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:188 description:@"invalid nil value for '%s'", "contentState.streamAPI"];
    }
    if ([(PFXXmlStreamReaderState *)v7 streamAPI])
    {
      [(PFXHtmlReaderState *)v7 setLoadDelegate:self];
      unsigned int v8 = +[PFAIContentDocument readWithState:v7];
      [(PFXHtmlReaderState *)v7 setLoadDelegate:0];
    }
    else
    {
      unsigned int v8 = 0;
    }
    [(THModelContentLoadOperation *)self p_processHintsWithContentState:v7];
    if (v8)
    {
      id v9 = objc_alloc_init((Class)TSUNoCopyDictionary);
      v10 = [(PFAIContentState *)v7 paginatedState];
      if ([(PFAIDocOrientationState *)v10 contentNodeBody]
        && [(PFAIDocOrientationState *)v10 presentationType])
      {
        [v9 setObject:[self contentNodeBody] forUncopiedKey:[self presentationType]];
      }
      v11 = [(PFAIContentState *)v7 flowState];
      if ([(PFAIDocOrientationState *)v11 contentNodeBody]
        && [(PFAIDocOrientationState *)v11 presentationType])
      {
        [v9 setObject:[self contentNodeBody] forUncopiedKey:[self presentationType]];
      }
      v12 = [(PFXHtmlReaderState *)v7 storageAnchorsForAnchorID];
      [v9 setObject:v12 forKey:kTHModelStorageAnchorsForAnchorID];
      v13 = [(PFXHtmlReaderState *)v7 storageAnchorsForCfiFrag];
      [v9 setObject:v13 forKey:kTHModelStorageAnchorsForCfiFrag];
      BOOL v14 = [(PFXHtmlReaderState *)v7 textChildOffsetStorageAnchorsForCfiFrag];
      [v9 setObject:v14 forKey:kTHModelTextChildOffsetStorageAnchorsForCfiFrag];
      v15 = [(PFXHtmlReaderState *)v7 anchorForCfiFrag];
      [v9 setObject:v15 forKey:kTHModelAnchorForCfiFrag];
      [(THModelContentLoadOperationDelegate *)self->mDelegate contentLoadOperation:self loadedContentBodies:v9];

      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
  }
  if (([(THModelContentLoadOperation *)self isCancelled] & 1) == 0) {
    [(THModelContentLoadOperationDelegate *)self->mDelegate contentLoadOperationFailed:self];
  }
LABEL_20:
}

- (void)loadNavigationPageContentNode
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = [[PFXArchive alloc] initWithPath:[(NSURL *)self->mApplePubURL path]];
  [(PFXArchive *)v4 setAsset:[(THBookDescription *)[(THDocumentRoot *)self->mDocumentRoot bookDescription] asset]];
  if (![(PFXArchive *)v4 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadNavigationPageContentNode]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:253 description:@"Failed to load valid archive"];
  }
  if (![(PFXArchive *)v4 isValid])
  {
    v12 = 0;
LABEL_23:
    [(THModelContentLoadOperationDelegate *)self->mDelegate contentLoadOperationFailed:self];
    goto LABEL_24;
  }
  id v5 = [(THModelContentLoadOperation *)self newNodeBodyWithContext:[(THDocumentRoot *)self->mDocumentRoot context] isFlow:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(THTOCModel *)[(THDocumentRoot *)self->mDocumentRoot tocModel] tiles];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v16 = v3;
    uint64_t v8 = *(void *)v18;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      v11 = (THModelContentNode *)[v10 browserPageNode];
      if (v11 == [(THModelContentLoadOperation *)self contentNode]) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_6;
        }
        v10 = 0;
        break;
      }
    }
    id v3 = v16;
  }
  else
  {
    v10 = 0;
  }
  v12 = [[PFAITocConfigState alloc] initWithDocumentRoot:self->mDocumentRoot nodeBody:v5 tocTile:v10 archive:v4 documentEntryUri:self->mDocumentEntryURI];
  [(PFAITocConfigState *)v12 setNodeGUID:[(THModelNode *)[(THModelContentLoadOperation *)self contentNode] nodeGUID]];

  if (![(PFXXmlStreamReaderState *)v12 streamAPI]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadNavigationPageContentNode]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:279 description:@"invalid nil value for '%s'", "tocState.streamAPI"];
  }
  if (![(PFXXmlStreamReaderState *)v12 streamAPI]) {
    goto LABEL_23;
  }
  [(PFAITocConfigState *)v12 setLoadDelegate:self];
  unsigned __int8 v13 = +[PFAITocConfig readWithState:v12];
  [(PFAITocConfigState *)v12 setLoadDelegate:0];
  if ((v13 & 1) == 0) {
    goto LABEL_23;
  }
  id v14 = objc_alloc_init((Class)TSUNoCopyDictionary);
  v15 = [(PFAITocConfigState *)v12 thNodeBody];
  if (v15) {
    [v14 setObject:v15 forUncopiedKey:[THPresentationType paginatedPresentationTypeInContext:[self context]]];
  }
  [(THModelContentLoadOperationDelegate *)self->mDelegate contentLoadOperation:self loadedContentBodies:v14];

LABEL_24:
}

- (void)loadEpubContentNode
{
  v4 = [[PFXArchive alloc] initWithPath:[(NSURL *)self->mApplePubURL path]];
  [(PFXArchive *)v4 setAsset:[(THBookDescription *)[(THDocumentRoot *)self->mDocumentRoot bookDescription] asset]];
  if (![(PFXArchive *)v4 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadEpubContentNode]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:331 description:@"Failed to load valid archive"];
  }
  if (![(PFXArchive *)v4 isValid]
    || ([(THModelContentLoadOperation *)self isCancelled] & 1) != 0)
  {
    id v5 = 0;
    id v6 = 0;
LABEL_12:
    [(THModelContentLoadOperationDelegate *)self->mDelegate contentLoadOperationFailed:self];
    goto LABEL_13;
  }
  id v5 = [(THModelContentLoadOperation *)self newNodeBodyWithContext:[(THDocumentRoot *)self->mDocumentRoot context] isFlow:1];
  id v6 = [[PFEIReaderState alloc] initWithDocumentRoot:self->mDocumentRoot contentNode:[(THModelContentLoadOperation *)self contentNode] flowNodeBody:v5 archive:v4 documentEntryUri:self->mDocumentEntryURI];
  [(PFXHtmlReaderState *)v6 setNodeGUID:[(THModelNode *)[(THModelContentLoadOperation *)self contentNode] nodeGUID]];
  [(PFXHtmlReaderState *)v6 setPageContentWidth:600.0];
  if (![(PFXXmlStreamReaderState *)v6 streamAPI]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THModelContentLoadOperation loadEpubContentNode]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"] lineNumber:347 description:@"invalid nil value for '%s'", "readerSate.streamAPI"];
  }
  if (![(PFXXmlStreamReaderState *)v6 streamAPI]) {
    goto LABEL_12;
  }
  if ([(THModelContentLoadOperation *)self isCancelled]) {
    goto LABEL_12;
  }
  [(PFXHtmlReaderState *)v6 setLoadDelegate:self];
  if (!+[PFEIContentDocument readWithState:v6]
    || ([(THModelContentLoadOperation *)self isCancelled] & 1) != 0)
  {
    goto LABEL_12;
  }
  id v7 = objc_alloc_init((Class)TSUNoCopyDictionary);
  uint64_t v8 = [(PFEIReaderState *)v6 orientationState];
  if ([(PFAIDocOrientationState *)v8 contentNodeBody]
    && [(PFAIDocOrientationState *)v8 presentationType])
  {
    [v7 setObject:[self contentNodeBody] forUncopiedKey:[self presentationType]];
  }
  uint64_t v9 = [(PFXHtmlReaderState *)v6 storageAnchorsForAnchorID];
  [v7 setObject:v9 forKey:kTHModelStorageAnchorsForAnchorID];
  v10 = [(PFXHtmlReaderState *)v6 storageAnchorsForCfiFrag];
  [v7 setObject:v10 forKey:kTHModelStorageAnchorsForCfiFrag];
  v11 = [(PFXHtmlReaderState *)v6 textChildOffsetStorageAnchorsForCfiFrag];
  [v7 setObject:v11 forKey:kTHModelTextChildOffsetStorageAnchorsForCfiFrag];
  v12 = [(PFXHtmlReaderState *)v6 anchorForCfiFrag];
  [v7 setObject:v12 forKey:kTHModelAnchorForCfiFrag];
  [(THModelContentLoadOperationDelegate *)self->mDelegate contentLoadOperation:self loadedContentBodies:v7];

LABEL_13:
  [(PFXHtmlReaderState *)v6 setLoadDelegate:0];
}

- (void)main
{
  if (([(THModelContentLoadOperation *)self isCancelled] & 1) == 0)
  {
    if ([(THModelContentLoadOperation *)self isEpub])
    {
      [(THModelContentLoadOperation *)self loadEpubContentNode];
    }
    else if ([(THModelContentLoadOperationDelegate *)self->mDelegate navigationPageNode])
    {
      [(THModelContentLoadOperation *)self loadNavigationPageContentNode];
    }
    else
    {
      [(THModelContentLoadOperation *)self loadContentNode];
    }
  }
}

- (void)processHintsInOrientation:(id)a3 contentState:(id)a4
{
  if ([a3 hasHints])
  {
    id v6 = [a3 contentNodeBody];
    id v7 = [(THDocumentRoot *)self->mDocumentRoot context];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [v6 pages];
    id v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v10;
          v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v12 = [v11 modelBodyInfos];
          id v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if (![v17 lineHints])
                {
                  id v18 = [objc_alloc((Class)TSWPLineHintCollection) initForEmptyShapeWithPreviousRange:v9 context:v8];
                  [v17 setLineHints:v18];
                }
                id v19 = [v17 lineHints];
                long long v20 = (char *)[v19 hints];
                if (v20)
                {
                  v21 = v20;
                  if ([v19 hintsCount])
                  {
                    v22 = &v21[56 * (void)[v19 hintsCount]];
                    uint64_t v9 = *((void *)v22 - 3);
                    uint64_t v8 = *((void *)v22 - 2);
                  }
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v14);
          }
          uint64_t v10 = v26 + 1;
        }
        while ((id)(v26 + 1) != v25);
        id v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v25);
    }
  }
}

- (void)p_processHintsWithContentState:(id)a3
{
  id v5 = [[[a3 paginatedState] contentNodeBody] bodyStorage];
  id v6 = (char *)[v5 length];
  [a3 processHints];
  -[THModelContentLoadOperation processHintsInOrientation:contentState:](self, "processHintsInOrientation:contentState:", [a3 paginatedState], a3);
  -[THModelContentLoadOperation processHintsInOrientation:contentState:](self, "processHintsInOrientation:contentState:", [a3 flowState], a3);
  if (v6 != [v5 length])
  {
    if (v6 != (char *)[v5 length] + 1) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation p_processHintsWithContentState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm") lineNumber:486 description:@"expected equality between %s and %s", "paginatedBodyInitialLength", "paginatedBodyStorage.length + 1"];
    }
    if (v6 == (char *)[v5 length] + 1)
    {
      [(THModelContentLoadOperation *)self p_fixPageCharacterRangeAfterStorageTruncationWithContentState:a3];
    }
  }
}

- (void)p_fixPageCharacterRangeAfterStorageTruncationWithContentState:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "paginatedState"), "contentNodeBody");
  id v4 = [v3 pages];
  if ([v4 count])
  {
    id v5 = [v4 lastObject];
    id v6 = objc_msgSend(objc_msgSend(v3, "bodyStorage"), "length");
    [v5 setPageEndCharIndex:v6];
  }
}

- (id)newNodeBodyWithContext:(id)a3 isFlow:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [[THModelContentNodeBody alloc] initWithContext:a3];
  id v8 = [objc_alloc((Class)TSSStylesheet) initWithContext:a3 canCullStyles:0];
  [(THModelContentNodeBody *)v7 setStylesheet:v8];
  [v8 setParent:[self->mDocumentRoot stylesheet]];

  id v9 = +[TSWPParagraphStyle defaultStyleWithContext:a3];
  [(THModelContentLoadOperation *)self p_populateParagraphStyle:v9];
  [v8 addStyle:v9 withIdentifier:kTSWPDefaultContentParagraphStyleIdentifier];
  id v10 = +[TSWPListStyle defaultStyleWithContext:a3];
  [v8 addStyle:v10 withIdentifier:TSWPDefaultListStyleIdentifier];
  id v11 = +[TSWPColumnStyle defaultStyleWithContext:a3];
  [v8 addStyle:v11];
  id v12 = [[THWPStorage alloc] initWithContext:a3 string:0 kind:0 stylesheet:v8 paragraphStyle:v9 listStyle:v10 section:0 columnStyle:v11];
  [(THWPStorage *)v12 setUsesApplicationFontScaling:v4];
  [(THModelContentNodeBody *)v7 setBodyStorage:v12];

  return v7;
}

- (void)p_populateParagraphStyle:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E13B4;
  v7[3] = &unk_4574B8;
  v7[4] = a3;
  [+[TSWPParagraphStyle paragraphProperties] enumeratePropertiesUsingBlock:v7];
  id v5 = [(THBookDescription *)[(THDocumentRoot *)self->mDocumentRoot bookDescription] language];
  if (v5) {
    CFStringRef v6 = (const __CFString *)v5;
  }
  else {
    CFStringRef v6 = @"en";
  }
  [a3 setBoxedValue:v6 forProperty:39];
}

- (THModelContentLoadOperationDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THModelContentLoadOperationDelegate *)a3;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
  self->_contentNode = (THModelContentNode *)a3;
}

- (BOOL)isEpub
{
  return self->_epub;
}

- (void)setEpub:(BOOL)a3
{
  self->_epub = a3;
}

@end