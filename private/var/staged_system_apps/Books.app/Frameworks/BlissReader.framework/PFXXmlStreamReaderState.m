@interface PFXXmlStreamReaderState
+ (Class)stackEntryClass;
+ (id)newStackEntryFromReader:(id)a3 elementInfo:(id)a4 parentEntry:(id)a5 cfiPath:(id)a6 readerState:(id)a7;
- (BOOL)isCancelled;
- (BOOL)isRawAttribute:(const char *)a3;
- (BOOL)namespaceCheck;
- (BOOL)shouldCountText;
- (NSString)entryURI;
- (NSURL)entryNSURL;
- (PFXArchive)archive;
- (PFXXmlStackEntry)currentXmlStackEntry;
- (PFXXmlStreamReaderState)initWithEntry:(id)a3 inArchive:(id)a4;
- (_xmlTextReader)streamAPI;
- (id).cxx_construct;
- (id)absoluteEntryForRelativeUri:(id)a3;
- (id)absoluteUrlForRelativeUri:(id)a3;
- (id)ancestorEntryWithElementName:(const char *)a3;
- (id)ancestorEntryWithReaderClass:(Class)a3;
- (id)ancestorReaderWithClass:(Class)a3;
- (id)currentReader;
- (id)currentXPath;
- (id)documentRelativeEntryForRelativeUri:(id)a3;
- (unint64_t)totalTextRead;
- (void)cleanupEntry;
- (void)dealloc;
- (void)incrementTextReadBy:(int64_t)a3;
- (void)popReader;
- (void)pushReader:(id)a3 elementInfo:(id)a4;
- (void)pushReader:(id)a3 elementInfo:(id)a4 cfiPath:(id)a5;
- (void)resetTotalTextRead;
- (void)switchEntryTo:(id)a3;
@end

@implementation PFXXmlStreamReaderState

- (void)incrementTextReadBy:(int64_t)a3
{
  self->mTextRead += a3;
}

- (void)switchEntryTo:(id)a3
{
  v10 = self->mArchive;
  [(PFXXmlStreamReaderState *)self cleanupEntry];
  unsigned __int8 v5 = [a3 hasPrefix:@"/"];
  id v6 = a3;
  if ((v5 & 1) == 0) {
    id v6 = [@"/" stringByAppendingString:a3];
  }
  self->mEntryUri = (NSString *)v6;
  self->mEntryNSURL = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:self->mEntryUri isDirectory:0];
  v7 = v10;
  self->mArchive = v7;
  id v8 = [(PFXArchive *)v7 decryptEntryWithName:a3 error:0];
  if (v8)
  {
    v9 = (_xmlTextReader *)[v8 xmlReader];
    self->mStreamAPI = v9;
    xmlTextReaderSetParserProp(v9, 4, 1);
    xmlTextReaderSetErrorHandler(self->mStreamAPI, (xmlTextReaderErrorFunc)PFXStreamingErrorCallback, 0);
  }
}

- (PFXXmlStreamReaderState)initWithEntry:(id)a3 inArchive:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PFXXmlStreamReaderState;
  id v6 = [(PFXXmlStreamReaderState *)&v13 init];
  if (v6)
  {
    unsigned __int8 v7 = [a3 hasPrefix:@"/"];
    id v8 = a3;
    if ((v7 & 1) == 0) {
      id v8 = [@"/" stringByAppendingString:a3];
    }
    v6->mEntryUri = (NSString *)v8;
    v6->mEntryNSURL = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v6->mEntryUri isDirectory:0];
    v9 = (PFXArchive *)a4;
    v6->mArchive = v9;
    id v10 = [(PFXArchive *)v9 decryptEntryWithName:a3 error:0];
    if (v10)
    {
      v11 = (xmlTextReader *)[v10 xmlReader];
      v6->mStreamAPI = v11;
      xmlTextReaderSetParserProp(v11, 4, 1);
      xmlTextReaderSetErrorHandler(v6->mStreamAPI, (xmlTextReaderErrorFunc)PFXStreamingErrorCallback, 0);
    }
  }
  return v6;
}

- (void)cleanupEntry
{
  mStreamAPI = self->mStreamAPI;
  if (mStreamAPI) {
    xmlFreeTextReader(mStreamAPI);
  }

  if (self->mContextStack.var0 != self->mContextStack.__begin_)
  {
    [(PFXXmlStreamReaderState *)self isCancelled];
    while (1)
    {
      var0 = self->mContextStack.var0;
      if (var0 == self->mContextStack.__begin_) {
        break;
      }
      unsigned __int8 v5 = *(var0 - 1);
      self->mContextStack.var0 = var0 - 1;
    }
  }

  mEntryNSURL = self->mEntryNSURL;
}

- (void)dealloc
{
  [(PFXXmlStreamReaderState *)self cleanupEntry];
  v3.receiver = self;
  v3.super_class = (Class)PFXXmlStreamReaderState;
  [(PFXXmlStreamReaderState *)&v3 dealloc];
}

- (BOOL)namespaceCheck
{
  return 1;
}

- (void)pushReader:(id)a3 elementInfo:(id)a4 cfiPath:(id)a5
{
  id v6 = (PFXXmlStackEntry *)[(id)objc_opt_class() newStackEntryFromReader:a3 elementInfo:a4 parentEntry:self->mCurrentEntry cfiPath:a5 readerState:self];
  value = self->mContextStack.var1.__value_;
  var0 = self->mContextStack.var0;
  if (var0 >= (__end_cap_ **)value)
  {
    begin = self->mContextStack.__begin_;
    uint64_t v11 = var0 - begin;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_3D1D0();
    }
    uint64_t v12 = (char *)value - (char *)begin;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      v15 = (char *)sub_4374C((uint64_t)&self->mContextStack.var1, v14);
    }
    else {
      v15 = 0;
    }
    v16 = (__end_ **)&v15[8 * v11];
    v17 = (id *)&v15[8 * v14];
    *v16 = (__end_ *)v6;
    v9 = v16 + 1;
    v19 = self->mContextStack.__begin_;
    v18 = self->mContextStack.var0;
    if (v18 != v19)
    {
      do
      {
        v20 = *--v18;
        *--v16 = v20;
      }
      while (v18 != v19);
      v18 = self->mContextStack.__begin_;
    }
    self->mContextStack.__begin_ = v16;
    self->mContextStack.var0 = v9;
    self->mContextStack.var1.__value_ = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *var0 = (__end_cap_ *)v6;
    v9 = var0 + 1;
  }
  self->mContextStack.var0 = v9;
  self->mCurrentEntry = v6;
}

- (void)pushReader:(id)a3 elementInfo:(id)a4
{
}

- (void)popReader
{
  if (self->mContextStack.var0 != self->mContextStack.__begin_)
  {
    [[(PFXXmlStackEntry *)self->mCurrentEntry parentEntry] addResultFromChildEntry:self->mCurrentEntry];
    --self->mContextStack.var0;

    self->mCurrentEntry = 0;
    var0 = self->mContextStack.var0;
    if (var0 != self->mContextStack.__begin_) {
      self->mCurrentEntry = (PFXXmlStackEntry *)*(var0 - 1);
    }
  }
}

- (id)currentReader
{
  return [(PFXXmlStackEntry *)self->mCurrentEntry reader];
}

- (id)ancestorEntryWithReaderClass:(Class)a3
{
  int64_t v3 = (char *)self->mContextStack.var0 - (char *)self->mContextStack.__begin_;
  if ((unint64_t)v3 >= 9)
  {
    for (uint64_t i = (v3 >> 3) - 2; i != -1; --i)
    {
      id v6 = self->mContextStack.__begin_[i];
      [(__end_ *)v6 reader];
      if (objc_opt_isKindOfClass()) {
        return v6;
      }
    }
  }
  return 0;
}

- (id)ancestorEntryWithElementName:(const char *)a3
{
  var0 = self->mContextStack.var0;
  if ((unint64_t)((char *)var0 - (char *)self->mContextStack.__begin_) >= 9)
  {
    for (uint64_t i = var0 - 1; i != self->mContextStack.__begin_; --i)
    {
      id v8 = *(i - 1);
      unsigned __int8 v7 = v8;
      if (xmlStrEqual((const xmlChar *)[v8 xmlElementName], (const xmlChar *)a3)) {
        return v7;
      }
    }
  }
  return 0;
}

- (id)ancestorReaderWithClass:(Class)a3
{
  var0 = self->mContextStack.var0;
  if ((unint64_t)((char *)var0 - (char *)self->mContextStack.__begin_) >= 9)
  {
    unsigned __int8 v5 = var0 - 1;
    while (v5 != self->mContextStack.__begin_)
    {
      unsigned __int8 v7 = *--v5;
      id v6 = v7;
      [v7 reader:a3];
      if (objc_opt_isKindOfClass())
      {
        return [v6 reader];
      }
    }
  }
  return 0;
}

- (id)absoluteUrlForRelativeUri:(id)a3
{
  return +[NSURL URLWithString:a3 relativeToURL:self->mEntryNSURL];
}

- (id)absoluteEntryForRelativeUri:(id)a3
{
  return +[PFXCommon absolutePathWithUrl:a3 relativeToFile:self->mEntryUri];
}

- (id)documentRelativeEntryForRelativeUri:(id)a3
{
  int64_t v3 = +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", a3, +[NSURL URLWithString:self->mEntryUri]);
  v4 = [(NSURL *)v3 pathComponents];
  id v5 = +[NSMutableString string];
  if ([(NSArray *)v4 count])
  {
    id v6 = 0;
    do
    {
      id v7 = [(NSArray *)v4 objectAtIndex:v6];
      if (v6 || ([v7 isEqualToString:@"/"] & 1) == 0)
      {
        [v5 appendString:[v4 objectAtIndex:v6]];
        if (v6 < (char *)[(NSArray *)v4 count] - 1) {
          [v5 appendString:@"/"];
        }
      }
      ++v6;
    }
    while (v6 < (char *)[(NSArray *)v4 count]);
  }
  id v8 = [(NSURL *)v3 fragment];
  if (v8) {
    [v5 appendFormat:@"#%@", v8];
  }
  return v5;
}

- (BOOL)isRawAttribute:(const char *)a3
{
  return 0;
}

- (void)resetTotalTextRead
{
  self->mTextRead = 0;
}

- (unint64_t)totalTextRead
{
  return self->mTextRead;
}

- (BOOL)shouldCountText
{
  return 0;
}

- (id)currentXPath
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:&stru_46D7E8];
  for (uint64_t i = (id *)self->mContextStack.__begin_; i != (id *)self->mContextStack.var0; ++i)
  {
    id v5 = *i;
    [v3 appendFormat:@"/%s", [*i xmlElementName]];
    if ([v5 xmlElementId]) {
      objc_msgSend(v3, "appendFormat:", @"[id='%s']", objc_msgSend(v5, "xmlElementId"));
    }
  }

  return v3;
}

- (_xmlTextReader)streamAPI
{
  return self->mStreamAPI;
}

- (PFXArchive)archive
{
  return self->mArchive;
}

- (NSString)entryURI
{
  return self->mEntryUri;
}

- (NSURL)entryNSURL
{
  return self->mEntryNSURL;
}

- (PFXXmlStackEntry)currentXmlStackEntry
{
  return self->mCurrentEntry;
}

- (void).cxx_destruct
{
  begin = self->mContextStack.__begin_;
  if (begin)
  {
    self->mContextStack.var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (BOOL)isCancelled
{
  return 0;
}

+ (Class)stackEntryClass
{
  return (Class)objc_opt_class();
}

+ (id)newStackEntryFromReader:(id)a3 elementInfo:(id)a4 parentEntry:(id)a5 cfiPath:(id)a6 readerState:(id)a7
{
  id v12 = [a1 stackEntryClass];

  return [v12 createFromReader:a3 elementInfo:a4 parentEntry:a5 cfiPath:a6 readerState:a7];
}

@end