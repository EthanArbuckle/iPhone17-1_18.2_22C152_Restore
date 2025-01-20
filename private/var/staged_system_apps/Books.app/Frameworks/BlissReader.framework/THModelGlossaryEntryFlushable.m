@interface THModelGlossaryEntryFlushable
- (BOOL)hasCachedVersion;
- (BOOL)hasFlushableContent;
- (BOOL)readFromApplePubWithDelegate:(id)a3 error:(id *)a4;
- (THModelGlossaryEntry)parent;
- (THModelGlossaryEntryBody)body;
- (THModelGlossaryEntryFlushable)initWithParent:(id)a3;
- (id)applePubEntry;
- (id)applePubURL;
- (void)dealloc;
- (void)p_clearFlushableMembers;
- (void)p_populate;
- (void)p_populateParagraphStyle:(id)a3;
- (void)setBody:(id)a3;
- (void)setParent:(id)a3;
@end

@implementation THModelGlossaryEntryFlushable

- (THModelGlossaryEntryFlushable)initWithParent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THModelGlossaryEntryFlushable;
  v4 = [(THModelGlossaryEntryFlushable *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THModelGlossaryEntryFlushable *)v4 setParent:a3];
  }
  return v5;
}

- (void)p_clearFlushableMembers
{
  objc_sync_enter(self);

  self->mBody = 0;

  objc_sync_exit(self);
}

- (void)dealloc
{
  self->mParent = 0;
  [(THModelGlossaryEntryFlushable *)self p_clearFlushableMembers];
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntryFlushable;
  [(THModelGlossaryEntryFlushable *)&v3 dealloc];
}

- (BOOL)hasFlushableContent
{
  return self->mBody != 0;
}

- (THModelGlossaryEntryBody)body
{
  if (!self->mBody)
  {
    [(THModelGlossaryEntryFlushable *)self setBody:[[THModelGlossaryEntryBody alloc] initWithContext:[[(THModelGlossaryEntryFlushable *)self parent] context]]];
    [(THModelGlossaryEntryFlushable *)self readFromApplePubWithDelegate:0 error:0];
  }
  objc_sync_exit(self);
  return self->mBody;
}

- (THModelGlossaryEntry)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (THModelGlossaryEntry *)a3;
}

- (void)setBody:(id)a3
{
}

- (void)p_populateParagraphStyle:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E7E28;
  v7[3] = &unk_4574B8;
  v7[4] = a3;
  [+[TSWPParagraphStyle paragraphProperties] enumeratePropertiesUsingBlock:v7];
  v5 = [(THBookDescription *)[(THDocumentRoot *)[[(THModelGlossaryEntry *)self->mParent glossary] documentRoot] bookDescription] language];
  if (v5) {
    CFStringRef v6 = (const __CFString *)v5;
  }
  else {
    CFStringRef v6 = @"en";
  }
  [a3 setBoxedValue:v6 forProperty:39];
}

- (void)p_populate
{
  objc_super v3 = [(THModelGlossaryEntryFlushable *)self body];
  id v4 = [(THModelGlossaryEntryBody *)v3 context];
  id v12 = [objc_alloc((Class)TSSStylesheet) initWithContext:v4 canCullStyles:0];
  [v12 setParent:[self glossary]->documentRoot->stylesheet];
  [(THModelGlossaryEntryBody *)v3 setStylesheet:v12];
  id v5 = +[TSWPParagraphStyle defaultStyleWithContext:v4];
  [(THModelGlossaryEntryFlushable *)self p_populateParagraphStyle:v5];
  [v12 addStyle:v5 withIdentifier:kTSWPDefaultGlossaryParagraphStyleIdentifier];
  id v6 = +[TSWPListStyle defaultStyleWithContext:v4];
  [v12 addStyle:v6 withIdentifier:TSWPDefaultListStyleIdentifier];
  id v7 = +[TSWPColumnStyle defaultStyleWithContext:v4];
  [v12 addStyle:v7 withIdentifier:kTSWPDefaultGlossaryColumnStyleIdentifier];
  v8 = [[THWPStorage alloc] initWithContext:v4 string:0 kind:0 stylesheet:v12 paragraphStyle:v5 listStyle:v6 section:0 columnStyle:v7];
  v9 = [[THWPStorage alloc] initWithContext:v4 string:0 kind:0 stylesheet:v12 paragraphStyle:v5 listStyle:v6 section:0 columnStyle:v7];
  v10 = [[THWPStorage alloc] initWithContext:v4 string:0 kind:0 stylesheet:v12 paragraphStyle:v5 listStyle:v6 section:0 columnStyle:v7];
  v11 = [[THWPStorage alloc] initWithContext:v4 string:0 kind:0 stylesheet:v12 paragraphStyle:v5 listStyle:v6 section:0 columnStyle:v7];
  [(THModelGlossaryEntryBody *)v3 setHeaderInfo:v8];
  [(THModelGlossaryEntryBody *)v3 setBodyStorage:v9];
  [(THModelGlossaryEntryBody *)v3 setRelatedTermsInfo:v10];
  [(THModelGlossaryEntryBody *)v3 setLinksInfo:v11];
}

- (id)applePubURL
{
  v2 = [[[(THModelGlossaryEntryFlushable *)self parent] glossary] applePubURL];

  return [(NSURL *)v2 path];
}

- (id)applePubEntry
{
  v2 = [(THModelGlossaryEntryFlushable *)self parent];

  return [(THModelGlossaryEntry *)v2 applePubRelativePath];
}

- (BOOL)readFromApplePubWithDelegate:(id)a3 error:(id *)a4
{
  id v5 = [(THModelGlossaryEntryFlushable *)self applePubURL];
  id v6 = [(THModelGlossaryEntryFlushable *)self applePubEntry];
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v8 = [[PFXArchive alloc] initWithPath:v5];
  if (![(PFXArchive *)v8 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelGlossaryEntryFlushable(ApplePubReading) readFromApplePubWithDelegate:error:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelGlossaryEntryFlushableAdditions.mm") lineNumber:164 description:@"Failed to load valid archive"];
  }
  if (![(PFXArchive *)v8 isValid])
  {
    v9 = 0;
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  [(THModelGlossaryEntryFlushable *)self p_populate];
  v9 = [[PFAIGlossaryState alloc] initWithEntryBody:[(THModelGlossaryEntryFlushable *)self body] documentRoot:[[(THModelGlossaryEntry *)self->mParent glossary] documentRoot] archive:v8 documentEntryUri:v6];
  [(PFXHtmlReaderState *)v9 setPageContentWidth:600.0];
  if (![(PFXXmlStreamReaderState *)v9 streamAPI]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelGlossaryEntryFlushable(ApplePubReading) readFromApplePubWithDelegate:error:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelGlossaryEntryFlushableAdditions.mm") lineNumber:179 description:@"invalid nil value for '%s'", "glossaryState.streamAPI"];
  }
  if (![(PFXXmlStreamReaderState *)v9 streamAPI]) {
    goto LABEL_9;
  }
  BOOL v10 = +[PFAIGlossaryDocument readWithState:v9];
LABEL_10:

  return v10;
}

- (BOOL)hasCachedVersion
{
  id v3 = [(THModelGlossaryEntryFlushable *)self applePubURL];
  id v4 = [(THModelGlossaryEntryFlushable *)self applePubEntry];
  BOOL v5 = 0;
  if (v3)
  {
    id v6 = v4;
    if (v4)
    {
      id v7 = [[PFXArchive alloc] initWithPath:v3];
      BOOL v5 = [(PFXArchive *)v7 decryptEntryWithName:v6 error:0] != 0;
    }
  }
  return v5;
}

@end