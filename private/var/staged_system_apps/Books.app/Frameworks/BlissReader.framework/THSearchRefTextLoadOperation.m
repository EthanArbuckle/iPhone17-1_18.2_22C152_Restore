@interface THSearchRefTextLoadOperation
- (THSearchRefTextLoadOperation)initWithDelegate:(id)a3 documentRoot:(id)a4 searchArray:(id)a5;
- (void)dealloc;
- (void)main;
@end

@implementation THSearchRefTextLoadOperation

- (THSearchRefTextLoadOperation)initWithDelegate:(id)a3 documentRoot:(id)a4 searchArray:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)THSearchRefTextLoadOperation;
  v8 = [(THSearchRefTextLoadOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->mDelegate = (THSearchRefTextLoadOperationDelegate *)a3;
    v8->mDocumentRoot = (THDocumentRoot *)a4;
    v8->mApplePubURL = (NSURL *)[a4 zipPackage];
    v9->mSearchRefTextEntry = (NSString *)objc_msgSend(objc_msgSend(a4, "properties"), "searchRefTextEntry");
    v9->mSearchArray = (NSArray *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THSearchRefTextLoadOperation;
  [(THSearchRefTextLoadOperation *)&v3 dealloc];
}

- (void)main
{
  mDelegate = self->mDelegate;
  objc_sync_enter(mDelegate);
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = [[PFXArchive alloc] initWithPath:[(NSURL *)self->mApplePubURL path]];
  if (![(PFXArchive *)v5 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchRefTextLoadOperation main]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchRefTextLoadOperation.mm") lineNumber:57 description:@"Failed to load valid archive"];
  }
  if (![(PFXArchive *)v5 isValid])
  {
    v6 = 0;
LABEL_10:
    [(THSearchRefTextLoadOperationDelegate *)self->mDelegate searchRefTextLoadOperationFailed:self];
    goto LABEL_11;
  }
  v6 = [[PFAISearchRefTextState alloc] initWithEntry:self->mSearchRefTextEntry searchArray:self->mSearchArray inArchive:v5 documentRoot:self->mDocumentRoot];
  [(PFAISearchRefTextState *)v6 setLoadDelegate:self];
  if (![(PFXXmlStreamReaderState *)v6 streamAPI]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchRefTextLoadOperation main]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchRefTextLoadOperation.mm") lineNumber:63 description:@"invalid nil value for '%s'", "searchState.streamAPI"];
  }
  if (![(PFXXmlStreamReaderState *)v6 streamAPI]
    || !+[PFAISearchRefTextDocument processSearchRefTextWithState:v6])
  {
    goto LABEL_10;
  }
LABEL_11:
  [(THSearchRefTextLoadOperationDelegate *)self->mDelegate setSearchRefText:[(PFAISearchRefTextState *)v6 refTextForRIDs]];

  objc_sync_exit(mDelegate);
}

@end