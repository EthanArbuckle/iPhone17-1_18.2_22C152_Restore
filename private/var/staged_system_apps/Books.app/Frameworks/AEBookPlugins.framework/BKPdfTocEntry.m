@interface BKPdfTocEntry
- (BKPdfTocEntry)initWithTocParser:(id)a3 pdfDictionary:(CGPDFDictionary *)a4 forDocument:(CGPDFDocument *)a5 parent:(id)a6;
- (BOOL)childDictionaryReferencesParent:(CGPDFDictionary *)a3;
- (CGPDFDictionary)dictionary;
- (CGPDFDocument)document;
- (id)childAtIndex:(unint64_t)a3;
- (id)parent;
- (id)title;
- (int64_t)_getDestination;
- (unint64_t)_pageDictionaryToPageNumber:(CGPDFDictionary *)a3;
- (unint64_t)numberOfChildren;
- (unint64_t)pageNumber;
@end

@implementation BKPdfTocEntry

- (CGPDFDocument)document
{
  return self->_document;
}

- (CGPDFDictionary)dictionary
{
  return self->_dictionary;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)numberOfChildren
{
  return (unint64_t)[(NSMutableArray *)self->_children count];
}

- (id)title
{
  return self->_title;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (id)childAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_children count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_children objectAtIndex:a3];
  }

  return v5;
}

- (BOOL)childDictionaryReferencesParent:(CGPDFDictionary *)a3
{
  unint64_t v5 = [(BKPdfTocEntry *)self numberOfChildren];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [(BKPdfTocEntry *)self childAtIndex:v7];
      v9 = (CGPDFDictionary *)[v8 dictionary];

      if (v9 == a3) {
        return 1;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v10 = self;
    do
    {
      v11 = [(BKPdfTocEntry *)v10 dictionary];
      BOOL v12 = v11 == a3;
      if (v11 == a3) {
        break;
      }
      uint64_t v13 = [(BKPdfTocEntry *)v10 parent];

      v10 = (BKPdfTocEntry *)v13;
    }
    while (v13);
  }
  return v12;
}

- (unint64_t)_pageDictionaryToPageNumber:(CGPDFDictionary *)a3
{
  v9 = a3;
  v3 = [(BKPdfTocParser *)self->_tocParser pageDictionaryToPageNumber];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSValue) initWithBytes:&v9 objCType:"^v"];
    unint64_t v5 = [v3 objectForKey:v4];
    unint64_t v6 = v5;
    if (v5) {
      unint64_t v7 = (unint64_t)[v5 integerValue];
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)_getDestination
{
  CGPDFInteger v12 = 0x7FFFFFFFFFFFFFFFLL;
  CGPDFArrayRef array = 0;
  CGPDFObjectRef object = 0;
  CGPDFDictionaryRef value = 0;
  if (CGPDFDictionaryGetDictionary(self->_dictionary, "A", &value))
  {
    __s1 = 0;
    CGPDFDictionaryGetName(value, "S", (const char **)&__s1);
    if (!strcmp(__s1, "GoTo"))
    {
      dictionary = value;
LABEL_6:
      CGPDFDictionaryGetObject(dictionary, "D", &object);
    }
  }
  else if (!CGPDFDictionaryGetObject(self->_dictionary, "Dest", &object))
  {
    dictionary = self->_dictionary;
    goto LABEL_6;
  }
  if (!object) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (CGPDFObjectGetValue(object, kCGPDFObjectTypeString, 0)
    || CGPDFObjectGetValue(object, kCGPDFObjectTypeName, 0))
  {
    Destination = (CGPDFObject *)CGPDFDocumentGetDestination();
    CGPDFObjectRef object = Destination;
    if (Destination)
    {
      __s1 = 0;
      if (CGPDFObjectGetValue(Destination, kCGPDFObjectTypeDictionary, &__s1)) {
        CGPDFDictionaryGetObject((CGPDFDictionaryRef)__s1, "D", &object);
      }
    }
  }
  if (!CGPDFObjectGetValue(object, kCGPDFObjectTypeArray, &array) || !CGPDFArrayGetCount(array)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  __s1 = 0;
  if (CGPDFArrayGetDictionary(array, 0, (CGPDFDictionaryRef *)&__s1)) {
    return [(BKPdfTocEntry *)self _pageDictionaryToPageNumber:__s1];
  }
  BOOL Integer = CGPDFArrayGetInteger(array, 0, &v12);
  int64_t result = v12;
  if (Integer)
  {
    ++v12;
    size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_document);
    if (v12 <= NumberOfPages) {
      return v12;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (BKPdfTocEntry)initWithTocParser:(id)a3 pdfDictionary:(CGPDFDictionary *)a4 forDocument:(CGPDFDocument *)a5 parent:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  CGPDFStringRef value = 0;
  uint64_t v13 = [(BKPdfTocEntry *)self init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tocParser, a3);
    v14->_document = a5;
    v14->_dictionary = a4;
    objc_storeStrong((id *)&v14->_parent, a6);
    v14->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
    if (v12)
    {
      if (CGPDFDictionaryGetString(v14->_dictionary, "Title", &value))
      {
        CFStringRef v15 = CGPDFStringCopyTextString(value);
        title = v14->_title;
        v14->_title = &v15->isa;
      }
      v14->_pageNumber = [(BKPdfTocEntry *)v14 _getDestination];
    }
    CGPDFDictionaryRef dict = 0;
    if (CGPDFDictionaryGetDictionary(v14->_dictionary, "First", &dict))
    {
      v17 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      children = v14->_children;
      v14->_children = v17;

      if (!v14->_children)
      {
LABEL_13:
        v22 = 0;
        goto LABEL_12;
      }
      do
      {
        if ([(BKPdfTocEntry *)v14 childDictionaryReferencesParent:dict]) {
          break;
        }
        v19 = [BKPdfTocEntry alloc];
        v20 = [(BKPdfTocEntry *)v19 initWithTocParser:v14->_tocParser pdfDictionary:dict forDocument:v14->_document parent:v14];
        if (!v20) {
          goto LABEL_13;
        }
        v21 = v20;
        [(NSMutableArray *)v14->_children addObject:v20];
      }
      while (CGPDFDictionaryGetDictionary(dict, "Next", &dict));
    }
  }
  v22 = v14;
LABEL_12:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_tocParser, 0);

  objc_storeStrong((id *)&self->_parent, 0);
}

@end