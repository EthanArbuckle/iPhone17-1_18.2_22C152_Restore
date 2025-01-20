@interface PFXHtmlMonoMediaStackEntry
+ (id)makeLayoutModeStateWithStackEntry:(id)a3 parentEntryMediaState:(id)a4 documentOrientationState:(id)a5;
- (PFXHtmlMonoMediaStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8;
- (void)addResultFromChildEntry:(id)a3;
@end

@implementation PFXHtmlMonoMediaStackEntry

+ (id)makeLayoutModeStateWithStackEntry:(id)a3 parentEntryMediaState:(id)a4 documentOrientationState:(id)a5
{
  v7 = [[PFXHtmlEntryMediaState alloc] initWithHtmlStackEntry:a3 parentEntryMediaState:a4];
  if (v7)
  {
    if (a4)
    {
      -[PFXHtmlEntryMediaState setStartCharIndex:](v7, "setStartCharIndex:", objc_msgSend(objc_msgSend(a4, "storage"), "length"));
      [a4 blockWidth];
    }
    else
    {
      id v8 = [a5 bodyStorage];
      [(PFXHtmlEntryMediaState *)v7 setOverriddenStorage:v8];
      -[PFXHtmlEntryMediaState setStartCharIndex:](v7, "setStartCharIndex:", [v8 length]);
      objc_msgSend(objc_msgSend(a5, "readerState"), "pageContentWidth");
    }
    -[PFXHtmlEntryMediaState setBlockWidth:](v7, "setBlockWidth:");
    -[PFXHtmlEntryMediaState setStylesheet:](v7, "setStylesheet:", [a5 stylesheet]);
  }
  return v7;
}

- (PFXHtmlMonoMediaStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  v12.receiver = self;
  v12.super_class = (Class)PFXHtmlMonoMediaStackEntry;
  v10 = -[PFXHtmlStackEntry initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:](&v12, "initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:", a3, a4, a5, a6, a7);
  if (v10) {
    v10->super.mCurrentEntryMediaState = (PFXHtmlEntryMediaState *)[PFXHtmlMonoMediaStackEntry makeLayoutModeStateWithStackEntry:parentEntryMediaState:documentOrientationState:](PFXHtmlMonoMediaStackEntry, "makeLayoutModeStateWithStackEntry:parentEntryMediaState:documentOrientationState:", v10, [a3 currentEntryMediaState], [a8 currentHtmlDocMediaState]);
  }
  return v10;
}

- (void)addResultFromChildEntry:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFXHtmlMonoMediaStackEntry;
  -[PFXXmlStackEntry addResultFromChildEntry:](&v5, "addResultFromChildEntry:");
  -[PFXHtmlEntryMediaState addElementName:result:](-[PFXHtmlStackEntry currentEntryMediaState](self, "currentEntryMediaState"), "addElementName:result:", [a3 xmlElementName], objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "result"));
}

@end