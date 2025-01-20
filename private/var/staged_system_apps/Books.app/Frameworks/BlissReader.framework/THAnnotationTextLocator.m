@interface THAnnotationTextLocator
- (BOOL)locateAnnotationText:(id)a3 leftContext:(id)a4 rightContext:(id)a5 contentNodeID:(id *)a6 storageID:(id *)a7;
- (THAnnotationTextLocator)initWithDocumentRoot:(id)a3;
- (THDocumentRoot)documentRoot;
- (THModelSearchIndex)searchIndex;
- (void)dealloc;
- (void)setDocumentRoot:(id)a3;
- (void)setSearchIndex:(id)a3;
@end

@implementation THAnnotationTextLocator

- (THAnnotationTextLocator)initWithDocumentRoot:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)THAnnotationTextLocator;
  v4 = [(THAnnotationTextLocator *)&v10 init];
  if (v4)
  {
    v5 = (THDocumentRoot *)a3;
    v4->_documentRoot = v5;
    v6 = [(THDocumentRoot *)v5 searchIndex];
    v4->_searchIndex = v6;
    if (![(THSearchIndex *)v6 loaded])
    {
      v7 = [[THSearchIndexLoadOperation alloc] initWithDelegate:0 documentRoot:v4->_documentRoot];
      id v8 = objc_alloc_init((Class)NSOperationQueue);
      [v8 addOperation:v7];
      [v8 waitUntilAllOperationsAreFinished];
      [(THSearchIndex *)v4->_searchIndex finishLoading];

      if (![(THSearchIndex *)v4->_searchIndex loaded]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator initWithDocumentRoot:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m") lineNumber:64 description:@"failed to load search index"];
      }
    }
    if (![(THSearchIndex *)v4->_searchIndex loaded])
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationTextLocator;
  [(THAnnotationTextLocator *)&v3 dealloc];
}

- (BOOL)locateAnnotationText:(id)a3 leftContext:(id)a4 rightContext:(id)a5 contentNodeID:(id *)a6 storageID:(id *)a7
{
  v7 = self;
  LOBYTE(self) = 0;
  if (a6 && a7)
  {
    if (a4
      && a5
      && (v11 = [(THSearchIndex *)v7->_searchIndex unambiguousCFIForString:+[NSString stringWithFormat:@"%@%@%@", a4, a3, a5]]) != 0|| (self = [(THSearchIndex *)v7->_searchIndex unambiguousCFIForString:a3], (v11 = self) != 0))
    {
      id v12 = [(THDocumentRoot *)v7->_documentRoot contentNodeForCfi:v11 error:0];
      if (v12)
      {
        id v13 = [v12 nodeGUID];
        id v14 = [+[THCFISplitter sharedInstance] storageIDFromCFI:v11];
        if (![v14 length]) {
          id v14 = v13;
        }
        if (v13)
        {
          if (v14)
          {
            *a6 = v13;
            *a7 = v14;
            LOBYTE(self) = 1;
            return (char)self;
          }
          goto LABEL_15;
        }
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator locateAnnotationText:leftContext:rightContext:contentNodeID:storageID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m") lineNumber:127 description:@"invalid nil value for '%s'", "contentNodeID"];
        if (!v14) {
LABEL_15:
        }
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator locateAnnotationText:leftContext:rightContext:contentNodeID:storageID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m") lineNumber:128 description:@"invalid nil value for '%s'", "storageID"];
      }
      else
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator locateAnnotationText:leftContext:rightContext:contentNodeID:storageID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m") lineNumber:114 description:@"invalid nil value for '%s'", "contentNode"];
      }
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (THModelSearchIndex)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(id)a3
{
}

@end