@interface THCFIReader
+ (_xmlNode)findRefNodeFromRoot:(_xmlNode *)a3 reader:(id)a4 ns:(id)a5 manifest:(_xmlNode *)a6;
+ (_xmlNode)lookupIDFrom:(_xmlNode *)a3 inManifest:(_xmlNode *)a4 ns:(id)a5;
+ (id)cfiRangeWithFilename:(id)a3 base:(id)a4 innerComponents1:(id)a5 innerComponents2:(id)a6;
+ (id)cfiWithFilename:(id)a3 base:(id)a4 innerComponents:(id)a5;
+ (id)getHrefFromNode:(_xmlNode *)a3 ns:(id)a4;
+ (id)mergeBackArrayComponentsWithEscapeIn:(id)a3 desiredMaxCount:(int64_t)a4 separator:(id)a5;
+ (unint64_t)componentOfArray:(id)a3 atIndex:(unint64_t)a4 identifier:(id *)a5;
- (THCFIReader)initWithCFI:(id)a3 error:(id *)a4;
- (id)innerPathMaxRangeReader;
- (id)innerPathReader;
- (unint64_t)componentAtIndex:(unint64_t)a3 identifier:(id *)a4;
- (unint64_t)componentCount;
- (void)dealloc;
- (void)parseTerminatingStep;
@end

@implementation THCFIReader

+ (id)getHrefFromNode:(_xmlNode *)a3 ns:(id)a4
{
  v8 = 0;
  if (CXOptionalStringAttribute(a3, (CXNamespace *)a4, (xmlChar *)"media-type", &v8)
    && [(NSString *)v8 isEqualToString:@"application/xhtml+xml"]
    && (v7 = 0, CXOptionalStringAttribute(a3, (CXNamespace *)a4, (xmlChar *)"href", &v7)))
  {
    return v7;
  }
  else
  {
    return 0;
  }
}

+ (_xmlNode)lookupIDFrom:(_xmlNode *)a3 inManifest:(_xmlNode *)a4 ns:(id)a5
{
  v11 = 0;
  objc_opt_class();
  BOOL v8 = CXOptionalStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"idref", &v11);
  result = 0;
  if (v8)
  {
    if (a4) {
      return (_xmlNode *)CXFindChildWithAttributeValue(a4, (CXNamespace *)a5, "item", "id", [(NSString *)v11 cStringUsingEncoding:4]);
    }
    v10 = CXGetRootElement(a3->doc);
    result = (_xmlNode *)CXFindChild(v10, (CXNamespace *)a5, "manifest");
    a4 = result;
    if (result) {
      return (_xmlNode *)CXFindChildWithAttributeValue(a4, (CXNamespace *)a5, "item", "id", [(NSString *)v11 cStringUsingEncoding:4]);
    }
  }
  return result;
}

+ (_xmlNode)findRefNodeFromRoot:(_xmlNode *)a3 reader:(id)a4 ns:(id)a5 manifest:(_xmlNode *)a6
{
  v10 = (char *)[a4 componentCount];
  if (!v10) {
    return a3;
  }
  v11 = v10;
  for (i = 0; i != v11; ++i)
  {
    uint64_t v20 = 0;
    unint64_t v13 = (unint64_t)[a4 componentAtIndex:i identifier:&v20];
    if (!v20
      || (v14 = (_xmlNode *)CXFirstNodeMatchingXPathQuery(a3, (const xmlChar *)[+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*[@id='%@']", v20) cStringUsingEncoding:4])) == 0&& (v14 = (_xmlNode *)CXFirstNodeMatchingXPathQuery(a3, (const xmlChar *)[+[NSString stringWithFormat:@"//*[@id=%@]", v20] cStringUsingEncoding:4])) == 0)
    {
      v15 = CXFirstChild(a3);
      if (v15) {
        a3 = v15;
      }
      BOOL v16 = a3 != 0;
      if (v13 >= 3 && a3)
      {
        unint64_t v17 = 4;
        while (a3->next)
        {
          v18 = CXNextSibling(a3);
          if (v18) {
            a3 = v18;
          }
          if (!i && !*a6 && CXNodeHasName(a3, (CXNamespace *)a5, (xmlChar *)"manifest")) {
            *a6 = a3;
          }
          BOOL v16 = a3 != 0;
          if (v17 >= v13) {
            goto LABEL_21;
          }
          v17 += 2;
        }
        BOOL v16 = 1;
      }
LABEL_21:
      if ((v13 & 1) != 0 && v16)
      {
        do
        {
          v14 = a3;
          if (xmlNodeIsText(a3)) {
            break;
          }
          a3 = a3->next;
        }
        while (a3);
      }
      else
      {
        v14 = a3;
      }
    }
    a3 = v14;
  }
  return v14;
}

- (void)parseTerminatingStep
{
  [(THCFIInnerPathReader *)self->mInnerPathReader parseTerminatingStep];
  mInnerPathRangeMaxReader = self->mInnerPathRangeMaxReader;

  [(THCFIInnerPathReader *)mInnerPathRangeMaxReader parseTerminatingStep];
}

+ (id)mergeBackArrayComponentsWithEscapeIn:(id)a3 desiredMaxCount:(int64_t)a4 separator:(id)a5
{
  id v8 = [a3 mutableCopy];
  id v9 = [a3 count];
  uint64_t v10 = (uint64_t)v9 - 2;
  if ((uint64_t)v9 >= 2)
  {
    int64_t v11 = (int64_t)v9;
    if ((uint64_t)v9 > a4)
    {
      do
      {
        id v12 = [v8 objectAtIndex:v10];
        if ([v12 length])
        {
          BOOL v13 = objc_msgSend(v12, "characterAtIndex:", (char *)objc_msgSend(v12, "length") - 1) == 94
             && v10 + 1 < v11;
          if (v13)
          {
            [v8 replaceObjectAtIndex:v10, [v12 stringByAppendingFormat:@"%@%@", a5, [v8 objectAtIndex:v10 + 1]] withObject];
            [v8 removeObjectAtIndex:v10 + 1];
            --v11;
          }
        }
        BOOL v13 = v10-- < 1;
      }
      while (!v13 && v11 > a4);
    }
  }

  return v8;
}

- (THCFIReader)initWithCFI:(id)a3 error:(id *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)THCFIReader;
  v6 = [(THCFIReader *)&v19 init];
  if (v6)
  {
    v7 = [a3 rangeOfString:@"#epubcfi(/"];
    if (v8)
    {
      id v9 = [a3 substringWithRange:&v7[v8] length:[a3 length] - (char *)&v7[v8]];
      id v10 = [v9 componentsSeparatedByString:@"!/"];
      int64_t v11 = (char *)[v10 count];
      if (v11 == (unsigned char *)&dword_0 + 2) {
        goto LABEL_8;
      }
      if ((unint64_t)v11 > 1
        || (id v10 = [v9 componentsSeparatedByString:@"!"],
            id v12 = (char *)[v10 count],
            (unint64_t)v12 >= 3))
      {
        id v10 = +[THCFIReader mergeBackArrayComponentsWithEscapeIn:v10 desiredMaxCount:2 separator:@"!/"];
        id v12 = (char *)[v10 count];
      }
      if (v12 == (unsigned char *)&dword_0 + 2)
      {
LABEL_8:
        v6->mOutsidePathComponents = (NSArray *)objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "componentsSeparatedByString:", @"/");
        id v13 = [v10 objectAtIndex:1];
        id v14 = [v13 componentsSeparatedByString:@","];
        if ([v14 count] == (char *)&dword_0 + 3)
        {
          id v15 = [v14 objectAtIndex:0];
          id v16 = [v15 stringByAppendingString:[v14 objectAtIndex:1]];
          id v13 = [v15 stringByAppendingString:[v14 objectAtIndex:2]];
          v6->mInnerPathReader = [[THCFIInnerPathReader alloc] initWithInnerCfiFrag:v16];
          uint64_t v17 = 24;
        }
        else
        {
          uint64_t v17 = 16;
        }
        *(Class *)((char *)&v6->super.isa + v17) = (Class)[[THCFIInnerPathReader alloc] initWithInnerCfiFrag:v13];
        v6->mOutsidePathComponents = (NSArray *)+[THCFIReader mergeBackArrayComponentsWithEscapeIn:v6->mOutsidePathComponents desiredMaxCount:0 separator:@"/"];
        [(THCFIReader *)v6 parseTerminatingStep];
      }
    }
    else if (a4)
    {
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.iWork.Compatibility.CFIImport", 0, +[NSDictionary dictionaryWithObjectsAndKeys:@"invalid CFI.", NSLocalizedDescriptionKey, 0]);
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THCFIReader;
  [(THCFIReader *)&v3 dealloc];
}

+ (unint64_t)componentOfArray:(id)a3 atIndex:(unint64_t)a4 identifier:(id *)a5
{
  id v6 = [a3 objectAtIndex:a4];
  v7 = [v6 rangeOfString:@"["];
  if (v8)
  {
    id v9 = v7;
    id v10 = (char *)[v6 length];
    if (a5) {
      *a5 = [[v6 substringWithRange:v9 + 1, v10 - v9 - 2] tsu_stringByRemovingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"^"]];
    }
    id v6 = [v6 substringToIndex:v9];
  }

  return (unint64_t)[v6 integerValue];
}

- (unint64_t)componentAtIndex:(unint64_t)a3 identifier:(id *)a4
{
  return +[THCFIReader componentOfArray:self->mOutsidePathComponents atIndex:a3 identifier:a4];
}

- (unint64_t)componentCount
{
  return [(NSArray *)self->mOutsidePathComponents count];
}

- (id)innerPathReader
{
  return self->mInnerPathReader;
}

- (id)innerPathMaxRangeReader
{
  return self->mInnerPathRangeMaxReader;
}

+ (id)cfiWithFilename:(id)a3 base:(id)a4 innerComponents:(id)a5
{
  v7 = (__CFString *)[a3 stringByAppendingString:@"#"];
  CFStringRef v8 = &stru_46D7E8;
  if (!v7) {
    v7 = &stru_46D7E8;
  }
  if (a5) {
    CFStringRef v8 = (const __CFString *)a5;
  }
  return [(__CFString *)v7 stringByAppendingFormat:@"epubcfi(/%@!/%@)", a4, v8];
}

+ (id)cfiRangeWithFilename:(id)a3 base:(id)a4 innerComponents1:(id)a5 innerComponents2:(id)a6
{
  id v9 = [a5 componentsSeparatedByString:@"/"];
  id v10 = [a6 componentsSeparatedByString:@"/"];
  int64_t v11 = (char *)[v9 count];
  id v12 = (char *)[v10 count];
  id v13 = objc_alloc_init((Class)NSMutableString);
  if (v11 >= v12) {
    id v14 = v12;
  }
  else {
    id v14 = v11;
  }
  id v22 = a4;
  id v23 = a3;
  id v15 = 0;
  if (v14)
  {
    while (1)
    {
      id v16 = [v9 objectAtIndex:v15];
      if (!objc_msgSend(v16, "isEqualToString:", objc_msgSend(v10, "objectAtIndex:", v15))) {
        break;
      }
      [v13 appendFormat:@"/"];
      [v13 appendString:v16];
      if (v14 == ++v15)
      {
        id v15 = v14;
        break;
      }
    }
  }
  id v17 = objc_alloc_init((Class)NSMutableString);
  if (v15 < v11)
  {
    v18 = v15;
    do
    {
      [v17 appendFormat:@"/"];
      [v17 appendString:[v9 objectAtIndex:v18++]];
    }
    while (v11 != v18);
  }
  id v19 = objc_alloc_init((Class)NSMutableString);
  if (v15 < v12)
  {
    do
    {
      [v19 appendFormat:@"/"];
      [v19 appendString:[v10 objectAtIndex:v15++]];
    }
    while (v12 != v15);
  }
  uint64_t v20 = +[NSString stringWithFormat:@"epubcfi(/%@!%@,%@,%@)", v22, v13, v17, v19];
  if (v23) {
    uint64_t v20 = (NSString *)[v23 stringByAppendingFormat:@"#%@", v20];
  }

  return v20;
}

@end