@interface THSearchIndexLoadOperation
- (THSearchIndexLoadOperation)initWithDelegate:(id)a3 documentRoot:(id)a4;
- (void)main;
@end

@implementation THSearchIndexLoadOperation

- (THSearchIndexLoadOperation)initWithDelegate:(id)a3 documentRoot:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THSearchIndexLoadOperation;
  v6 = [(THSearchIndexLoadOperation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mDelegate = (THSearchIndexLoadOperationDelegate *)a3;
    v6->mDocumentRoot = (THDocumentRoot *)a4;
    v6->mApplePubURL = (NSURL *)[a4 zipPackage];
    v7->mSearchIndexEntry = (NSString *)objc_msgSend(objc_msgSend(a4, "properties"), "searchIndexEntry");
  }
  return v7;
}

- (void)main
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = [[PFXArchive alloc] initWithPath:[(NSURL *)self->mApplePubURL path]];
  if (![(PFXArchive *)v4 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndexLoadOperation main]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchIndexLoadOperation.mm") lineNumber:48 description:@"Failed to load valid archive"];
  }
  if (![(PFXArchive *)v4 isValid])
  {
    v5 = 0;
LABEL_10:
    [(THSearchIndexLoadOperationDelegate *)self->mDelegate searchIndexLoadOperationFailed:self];
    goto LABEL_11;
  }
  v5 = [[PFAISearchIndexState alloc] initWithEntry:self->mSearchIndexEntry inArchive:v4 documentRoot:self->mDocumentRoot];
  [(PFAISearchIndexState *)v5 setLoadDelegate:self];
  if (![(PFXXmlStreamReaderState *)v5 streamAPI]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndexLoadOperation main]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchIndexLoadOperation.mm") lineNumber:54 description:@"invalid nil value for '%s'", "searchState.streamAPI"];
  }
  if (![(PFXXmlStreamReaderState *)v5 streamAPI]
    || !+[PFAISearchIndexDocument processSearchIndexWithState:v5])
  {
    goto LABEL_10;
  }
LABEL_11:
}

@end