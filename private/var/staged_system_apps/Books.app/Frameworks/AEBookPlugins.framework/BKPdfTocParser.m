@interface BKPdfTocParser
- (BKPdfTocParser)initWithDocument:(CGPDFDocument *)a3;
- (id)pageDictionaryToPageNumber;
- (id)tocRoot;
- (void)dealloc;
- (void)parse;
@end

@implementation BKPdfTocParser

- (BKPdfTocParser)initWithDocument:(CGPDFDocument *)a3
{
  v4 = [(BKPdfTocParser *)self init];
  if (v4)
  {
    v4->_document = CGPDFDocumentRetain(a3);
    [(BKPdfTocParser *)v4 parse];
  }
  return v4;
}

- (void)dealloc
{
  CGPDFDocumentRelease(self->_document);
  v3.receiver = self;
  v3.super_class = (Class)BKPdfTocParser;
  [(BKPdfTocParser *)&v3 dealloc];
}

- (id)tocRoot
{
  return self->_tocRoot;
}

- (void)parse
{
  Catalog = CGPDFDocumentGetCatalog(self->_document);
  if (Catalog)
  {
    CGPDFDictionaryRef value = 0;
    if (CGPDFDictionaryGetDictionary(Catalog, "Outlines", &value))
    {
      CGPDFInteger v8 = 0;
      if (!CGPDFDictionaryGetInteger(value, "Count", &v8) || v8 >= 1)
      {
        v4 = [BKPdfTocEntry alloc];
        v5 = [(BKPdfTocEntry *)v4 initWithTocParser:self pdfDictionary:value forDocument:self->_document parent:0];
        tocRoot = self->_tocRoot;
        self->_tocRoot = v5;

        if (![(BKPdfTocEntry *)self->_tocRoot numberOfChildren])
        {
          v7 = self->_tocRoot;
          self->_tocRoot = 0;
        }
      }
    }
  }
}

- (id)pageDictionaryToPageNumber
{
  pageDictionaryToPageNumber = self->_pageDictionaryToPageNumber;
  if (!pageDictionaryToPageNumber)
  {
    size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_document);
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:NumberOfPages];
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:NumberOfPages];
    if (NumberOfPages)
    {
      uint64_t v7 = 0;
      do
      {
        Page = CGPDFDocumentGetPage(self->_document, ++v7);
        if (Page)
        {
          CGPDFDictionaryRef Dictionary = 0;
          CGPDFDictionaryRef Dictionary = CGPDFPageGetDictionary(Page);
          if (Dictionary)
          {
            id v9 = [objc_alloc((Class)NSValue) initWithBytes:&Dictionary objCType:"^v"];
            id v10 = [objc_alloc((Class)NSNumber) initWithInteger:v7];
            [v5 addObject:v9];
            [v6 addObject:v10];
          }
        }
      }
      while (NumberOfPages != v7);
    }
    v11 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithObjects:v6 forKeys:v5];
    v12 = self->_pageDictionaryToPageNumber;
    self->_pageDictionaryToPageNumber = v11;

    pageDictionaryToPageNumber = self->_pageDictionaryToPageNumber;
  }

  return pageDictionaryToPageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageDictionaryToPageNumber, 0);

  objc_storeStrong((id *)&self->_tocRoot, 0);
}

@end