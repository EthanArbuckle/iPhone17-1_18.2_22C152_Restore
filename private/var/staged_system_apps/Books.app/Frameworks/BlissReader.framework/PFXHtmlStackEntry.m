@interface PFXHtmlStackEntry
- (NSURL)href;
- (PFSStyleSelector)styleSelector;
- (PFXHtmlEntryMediaState)currentEntryMediaState;
- (PFXHtmlReaderState)htmlReaderState;
- (PFXHtmlStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8;
- (PFXHtmlStackEntry)parentHtmlStackEntry;
- (PFXString)classAttribute;
- (PFXString)styleAttribute;
- (id)titleAttributeValue;
- (void)addAttributeName:(const char *)a3 withValue:(id)a4;
- (void)addChildAttributesToParentForResult:(id)a3;
- (void)dealloc;
- (void)setHref:(id)a3;
- (void)setStyleSelector:(id)a3;
@end

@implementation PFXHtmlStackEntry

- (void)setStyleSelector:(id)a3
{
  mSelector = self->mSelector;
  if (mSelector != a3)
  {

    self->mSelector = (PFSStyleSelector *)a3;
  }
}

- (PFXHtmlStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  v9.receiver = self;
  v9.super_class = (Class)PFXHtmlStackEntry;
  return [(PFXXmlStackEntry *)&v9 initWithParentEntry:a3 reader:a4 elementName:a5 elementNamespace:a6 cfiPath:a7 readerState:a8];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXHtmlStackEntry;
  [(PFXXmlStackEntry *)&v3 dealloc];
}

- (PFXHtmlStackEntry)parentHtmlStackEntry
{
  return (PFXHtmlStackEntry *)self->super.mParentEntry;
}

- (PFXHtmlReaderState)htmlReaderState
{
  return (PFXHtmlReaderState *)self->super.mReaderState;
}

- (void)addChildAttributesToParentForResult:(id)a3
{
  v5 = [[(PFXHtmlStackEntry *)self parentHtmlStackEntry] currentEntryMediaState];
  v6 = [(PFXXmlStackEntry *)self xmlAttributes];

  [(PFXHtmlEntryMediaState *)v5 addAttributes:v6 forResult:a3];
}

- (id)titleAttributeValue
{
  return [(PFXXmlStackEntry *)self valueForAttribute:"title"];
}

- (PFXHtmlEntryMediaState)currentEntryMediaState
{
  return self->mCurrentEntryMediaState;
}

- (PFXString)classAttribute
{
  return self->mClassAttribute;
}

- (PFXString)styleAttribute
{
  return self->mStyleAttribute;
}

- (NSURL)href
{
  return self->mHref;
}

- (void)setHref:(id)a3
{
}

- (PFSStyleSelector)styleSelector
{
  return self->mSelector;
}

- (void)addAttributeName:(const char *)a3 withValue:(id)a4
{
  if (xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"style"))
  {
    v7 = (objc_class *)a4;
    uint64_t v8 = 136;
  }
  else
  {
    if (!xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"class"))
    {
      v9.receiver = self;
      v9.super_class = (Class)PFXHtmlStackEntry;
      [(PFXXmlStackEntry *)&v9 addAttributeName:a3 withValue:a4];
      return;
    }
    v7 = (objc_class *)a4;
    uint64_t v8 = 128;
  }
  *(Class *)((char *)&self->super.super.isa + v8) = v7;
}

@end