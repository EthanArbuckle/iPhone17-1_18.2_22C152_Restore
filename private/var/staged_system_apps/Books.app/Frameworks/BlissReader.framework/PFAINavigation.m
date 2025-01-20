@interface PFAINavigation
+ (BOOL)loadDocumentStructureWithState:(id)a3 isUpdate:(BOOL)a4;
+ (BOOL)readDocumentWithState:(id)a3;
+ (BOOL)readGlossaryNavPointFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (BOOL)readHeadFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (BOOL)readNavMapFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (BOOL)readNavPointFromStream:(_xmlTextReader *)a3 landscapeEntries:(id)a4 portraitEntries:(id)a5 depth:(int64_t)a6 readerState:(id)a7;
+ (BOOL)readNavigationFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (BOOL)updateDocumentWithState:(id)a3;
+ (id)createContentNodeWithId:(id)a3 label:(id)a4 entry:(id)a5 readerState:(id)a6;
+ (id)getTextFromFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (id)getTextFromNavLabelFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (id)getUrlFromContentFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (id)imageFromEntry:(id)a3 packageState:(id)a4;
+ (int)listNumberTypeForString:(id)a3;
+ (void)cacheAndTrimNode:(id)a3 inState:(id)a4;
+ (void)initialize;
@end

@implementation PFAINavigation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
  }
}

+ (int)listNumberTypeForString:(id)a3
{
  if ([a3 isEqualToString:@"upper-roman"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"lower-roman"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"lower-alpha"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"upper-alpha"]) {
    return 9;
  }
  [a3 isEqualToString:@"decimal"];
  return 0;
}

+ (BOOL)updateDocumentWithState:(id)a3
{
  return [a1 loadDocumentStructureWithState:a3 isUpdate:1];
}

+ (BOOL)readDocumentWithState:(id)a3
{
  id v5 = [a3 thDocumentRoot];
  if (![v5 rootNode])
  {
    v6 = -[THModelContainerNode initWithTitle:includeInTOC:context:]([THModelContainerNode alloc], "initWithTitle:includeInTOC:context:", 0, 0, [v5 context]);
    [v5 setRootNode:v6];
  }

  return [a1 loadDocumentStructureWithState:a3 isUpdate:0];
}

+ (void)cacheAndTrimNode:(id)a3 inState:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a4 addContentNodeToCache:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = [a3 childNodes];
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            [a1 cacheAndTrimNode:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11) inState:a4];
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }
  id v12 = [a3 parent];
  if (v12) {
    [v12 removeNode:a3];
  }
}

+ (BOOL)readHeadFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  id v6 = [a4 packageState];
  int v7 = xmlTextReaderDepth(a3);
  int v8 = xmlTextReaderRead(a3);
  if (v8 == 1)
  {
    while (1)
    {
      int v9 = xmlTextReaderDepth(a3);
      int v10 = xmlTextReaderNodeType(a3);
      if (v9 == v7 && v10 == 15) {
        break;
      }
      if (v7 + 1 == v9 && v10 == 1)
      {
        v11 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        id v12 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v11, v12))
        {
          long long v13 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual((const xmlChar *)"meta", v13))
          {
            Attribute = xmlTextReaderGetAttribute(a3, (const xmlChar *)"name");
            if (Attribute)
            {
              long long v15 = Attribute;
              long long v16 = +[NSString stringWithXmlString:Attribute];
              xmlFree(v15);
              if (v16)
              {
                for (int i = xmlTextReaderMoveToFirstAttribute(a3); ; int i = xmlTextReaderMoveToNextAttribute(a3))
                {
                  if (i != 1)
                  {
                    v19 = 0;
                    goto LABEL_16;
                  }
                  v18 = xmlTextReaderConstLocalName(a3);
                  if (xmlStrEqual(v18, (const xmlChar *)"content")) {
                    break;
                  }
                }
                v19 = +[NSString stringWithXmlString:xmlTextReaderConstValue(a3)];
LABEL_16:
                if ([PFXCommonNcxAdditionsId isEqualToString:v16])
                {
                  id v20 = [a4 absoluteEntryForRelativeUri:v19];
                  uint64_t v31 = 0;
                  CFDataRef v21 = (const __CFData *)objc_msgSend(objc_msgSend(v6, "archive"), "createDataWithName:error:", v20, &v31);
                  if (v21)
                  {
                    CFDataRef v22 = v21;
                    id v29 = v6;
                    CFErrorRef error = 0;
                    CFPropertyListRef v23 = CFPropertyListCreateWithData(kCFAllocatorDefault, v21, 0, 0, &error);

                    if (v23)
                    {
                      CFTypeID v24 = CFGetTypeID(v23);
                      if (v24 == CFDictionaryGetTypeID()) {
                        CFPropertyListRef v25 = v23;
                      }
                      else {
                        CFPropertyListRef v25 = 0;
                      }
                      [a4 setNcxAdditions:v25];
                      CFRelease(v23);
                    }
                    else
                    {
                      +[NSException raise:NSGenericException format:@"File is invalid."];
                    }
                    id v6 = v29;
                  }
                  else
                  {
                    if (v31)
                    {
                      v26 = (objc_class *)objc_opt_class();
                      v32 = NSStringFromClass(v26);
                      uint64_t v33 = v31;
                      v27 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
                    }
                    else
                    {
                      v27 = 0;
                    }
                    [+[NSException exceptionWithName:NSGenericException reason:0 userInfo:v27] raise];
                  }
                }
                [a4 setMetadataContents:v19 forName:v16];
              }
            }
          }
        }
      }
      int v8 = xmlTextReaderRead(a3);
      if (v8 != 1) {
        return v8 >= 0;
      }
    }
    int v8 = 1;
  }
  return v8 >= 0;
}

+ (id)getTextFromFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  id v5 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0, a4);
  int v6 = xmlTextReaderDepth(a3);
  if (!xmlTextReaderIsEmptyElement(a3) && xmlTextReaderRead(a3) == 1)
  {
    do
    {
      int v7 = xmlTextReaderDepth(a3);
      int v8 = xmlTextReaderNodeType(a3);
      if (v7 == v6 && v8 == 15) {
        break;
      }
      if (v6 + 1 == v7 && v8 == 3) {
        [(NSMutableString *)v5 appendString:+[NSString stringWithXmlString:xmlTextReaderConstValue(a3)]];
      }
    }
    while (xmlTextReaderRead(a3) == 1);
  }
  return v5;
}

+ (id)getUrlFromContentFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  if (xmlTextReaderMoveToFirstAttribute(a3) != 1) {
    return 0;
  }
  while (1)
  {
    int v6 = xmlTextReaderConstLocalName(a3);
    if (xmlStrEqual(v6, (const xmlChar *)"src")) {
      break;
    }
    if (xmlTextReaderMoveToNextAttribute(a3) != 1) {
      return 0;
    }
  }
  int v8 = +[NSString stringWithXmlString:xmlTextReaderConstValue(a3)];

  return [a4 absoluteUrlForRelativeUri:v8];
}

+ (id)getTextFromNavLabelFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  int v7 = xmlTextReaderDepth(a3);
  while (xmlTextReaderRead(a3) == 1)
  {
    int v8 = xmlTextReaderDepth(a3);
    int v9 = xmlTextReaderNodeType(a3);
    if (v8 == v7 && v9 == 15) {
      break;
    }
    if (v7 + 1 == v8 && v9 == 1)
    {
      int v10 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      v11 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v10, v11))
      {
        id v12 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"text", v12))
        {
          return [a1 getTextFromFromStream:a3 readerState:a4];
        }
      }
    }
  }
  return 0;
}

+ (id)imageFromEntry:(id)a3 packageState:(id)a4
{
  id v5 = [a3 stringByRemovingPercentEncoding];
  id v6 = objc_msgSend(objc_msgSend(a4, "thDocumentRoot"), "context");

  return +[TSPData dataFromDocumentURI:v5 context:v6];
}

+ (id)createContentNodeWithId:(id)a3 label:(id)a4 entry:(id)a5 readerState:(id)a6
{
  id v11 = [a6 packageState];
  id v12 = [v11 thDocumentRoot];
  id v13 = [v12 context];
  long long v14 = [[THModelContentNode alloc] initWithTitle:a4 includeInTOC:1 context:v13];
  [(THModelNode *)v14 setNodeGUID:a3];
  [(THModelContentNode *)v14 setApplePubEntryID:a5];
  [(THModelContentNode *)v14 setApplePubURLWithState:v11];
  [(THModelContentNode *)v14 setCfiBaseWithState:v11];
  unsigned __int8 v15 = objc_msgSend(objc_msgSend(v12, "bookDescription"), "isEpub");
  id v16 = [a6 additionalPropertiesForNavPointId:a3];
  if (v16)
  {
    v17 = v16;
    objc_opt_class();
    [v17 objectForKey:PFXCommonTocIncludeInTOC[0]];
    v18 = (void *)TSUDynamicCast();
    if (v18) {
      -[THModelNode setIncludeInTOC:](v14, "setIncludeInTOC:", [v18 BOOLValue]);
    }
    objc_opt_class();
    [v17 objectForKey:PFXCommonTocNumberOfPages[0]];
    v19 = (void *)TSUDynamicCast();
    if (v19)
    {
      if ((v15 & 1) == 0) {
        -[THModelNode setPageCount:forPresentationType:](v14, "setPageCount:forPresentationType:", [v19 unsignedIntegerValue], +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", v13));
      }
      [(THModelNode *)v14 setPageCount:1 forPresentationType:+[THPresentationType flowPresentationTypeInContext:v13]];
    }
    objc_opt_class();
    [v17 objectForKey:PFXCommonTocDisplayStartPageNumber[0]];
    id v20 = (void *)TSUDynamicCast();
    if (v20)
    {
      id v21 = [v20 unsignedIntegerValue];
      [(THModelContentNode *)v14 setDisplayStartingPageNumber:v21 presentationType:+[THPresentationType flowPresentationTypeInContext:v13]];
      [(THModelContentNode *)v14 setDisplayStartingPageNumber:v21 presentationType:+[THPresentationType paginatedPresentationTypeInContext:v13]];
    }
    objc_opt_class();
    [v17 objectForKey:PFXCommonTocDisplayPageNumberFormat[0]];
    uint64_t v22 = TSUDynamicCast();
    if (v22)
    {
      uint64_t v23 = +[PFAINavigation listNumberTypeForString:v22];
      [(THModelContentNode *)v14 setDisplayStartingPageFormat:v23 presentationType:+[THPresentationType flowPresentationTypeInContext:v13]];
      [(THModelContentNode *)v14 setDisplayStartingPageFormat:v23 presentationType:+[THPresentationType paginatedPresentationTypeInContext:v13]];
    }
    objc_opt_class();
    [v17 objectForKey:PFXCommonTocGlossaryTermLink[0]];
    uint64_t v24 = TSUDynamicCast();
    if (v24) {
      objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a6, "packageState"), "thDocumentRoot"), "glossary"), "setGlossaryTermPaths:forContentNode:", v24, v14);
    }
    objc_opt_class();
    [v17 objectForKey:PFXCommonTocGlossaryTermExists[0]];
    CFPropertyListRef v25 = (void *)TSUDynamicCast();
    if (v25) {
      -[THModelContentNode setGlossaryTermExists:](v14, "setGlossaryTermExists:", [v25 BOOLValue]);
    }
    id v26 = [a6 currentTocTile];
    objc_opt_class();
    [v17 objectForKey:@"tinyThumbs"];
    v27 = (void *)TSUDynamicCast();
    if (v27)
    {
      v28 = v27;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v29 = [v27 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v48;
        do
        {
          for (int i = 0; i != v30; int i = (char *)i + 1)
          {
            if (*(void *)v48 != v31) {
              objc_enumerationMutation(v28);
            }
            id v33 = [a1 imageFromEntry:*(void *)(*((void *)&v47 + 1) + 8 * i) packageState:[a6 packageState]];
            if (v33) {
              [v26 addTinyThumb:v33];
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v30);
      }
    }
    objc_opt_class();
    [v17 objectForKey:@"largerThumbs"];
    v34 = (void *)TSUDynamicCast();
    if (v34)
    {
      v35 = v34;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v36 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v44;
        do
        {
          for (j = 0; j != v37; j = (char *)j + 1)
          {
            if (*(void *)v44 != v38) {
              objc_enumerationMutation(v35);
            }
            id v40 = *(id *)(*((void *)&v43 + 1) + 8 * (void)j);
            if ([v40 hasPrefix:@"/"]) {
              id v40 = [v40 substringFromIndex:1];
            }
            id v41 = [a1 imageFromEntry:v40 packageState:[a6 packageState]];
            if (v41) {
              [v26 addLargerThumb:v41];
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v37);
      }
    }
  }
  return v14;
}

+ (BOOL)readGlossaryNavPointFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  int v7 = xmlTextReaderDepth(a3);
  uint64_t v8 = v7 + 1;
  if (xmlTextReaderRead(a3) == 1)
  {
    id v9 = 0;
    do
    {
      int v10 = xmlTextReaderDepth(a3);
      int v11 = xmlTextReaderNodeType(a3);
      if (v10 == v7 && v11 == 15) {
        break;
      }
      if (v8 == v10 && v11 == 1)
      {
        id v12 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        id v13 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v12, v13))
        {
          long long v14 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual((const xmlChar *)"navLabel", v14))
          {
            id v9 = [a1 getTextFromNavLabelFromStream:a3 readerState:a4];
          }
          else if (xmlStrEqual((const xmlChar *)"content", v14))
          {
            id v24 = [a1 getUrlFromContentFromStream:a3 readerState:a4];
            if (v9 && v24) {
              objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "packageState"), "thDocumentRoot"), "glossary"), "addEntryForPath:andTerm:", objc_msgSend(v24, "path"), v9), "setLoadedFromApplePub:", 1);
            }
            break;
          }
        }
      }
    }
    while (xmlTextReaderRead(a3) == 1);
  }
  int v15 = xmlTextReaderRead(a3);
  if (v15 != 1) {
    return v15 >= 0;
  }
  while (1)
  {
    int v16 = xmlTextReaderDepth(a3);
    int v17 = xmlTextReaderNodeType(a3);
    BOOL v18 = v16 == v7 && v17 == 15;
    BOOL v19 = v18;
    if (v18) {
      break;
    }
    if (v8 == v16 && v17 == 1)
    {
      id v20 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      id v21 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v20, v21))
      {
        uint64_t v22 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"navPoint", v22))
        {
          if (![a1 readGlossaryNavPointFromStream:a3 readerState:a4]) {
            break;
          }
        }
      }
    }
    int v15 = xmlTextReaderRead(a3);
    if (v15 != 1) {
      return v15 >= 0;
    }
  }
  return v19;
}

+ (BOOL)readNavPointFromStream:(_xmlTextReader *)a3 landscapeEntries:(id)a4 portraitEntries:(id)a5 depth:(int64_t)a6 readerState:(id)a7
{
  int v11 = xmlTextReaderDepth(a3);
  if (xmlTextReaderMoveToFirstAttribute(a3) == 1)
  {
    while (1)
    {
      id v12 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual(v12, (const xmlChar *)"id")) {
        break;
      }
      if (xmlTextReaderMoveToNextAttribute(a3) != 1) {
        goto LABEL_4;
      }
    }
    v51 = +[NSString stringWithXmlString:xmlTextReaderConstValue(a3)];
  }
  else
  {
LABEL_4:
    v51 = 0;
  }
  uint64_t v13 = v11 + 1;
  if (xmlTextReaderRead(a3) == 1)
  {
    id v14 = 0;
    do
    {
      int v15 = xmlTextReaderDepth(a3);
      int v16 = xmlTextReaderNodeType(a3);
      if (v15 == v11 && v16 == 15) {
        break;
      }
      if (v13 == v15 && v16 == 1)
      {
        int v17 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        BOOL v18 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v17, v18))
        {
          BOOL v19 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual((const xmlChar *)"navLabel", v19))
          {
            id v14 = [a1 getTextFromNavLabelFromStream:a3 readerState:a7];
          }
          else if (xmlStrEqual((const xmlChar *)"content", v19))
          {
            id v20 = [a1 getUrlFromContentFromStream:a3 readerState:a7];
            goto LABEL_20;
          }
        }
      }
    }
    while (xmlTextReaderRead(a3) == 1);
  }
  else
  {
    id v14 = 0;
  }
  id v20 = 0;
LABEL_20:
  id v45 = a4;
  id v46 = a1;
  long long v49 = v20;
  id v21 = [v20 path];
  id v22 = [a7 additionalPropertiesForNavPointId:v51];
  if (v22)
  {
    uint64_t v23 = v22;
    objc_opt_class();
    [v23 objectForKey:PFXCommonTocSectionIdentifier[0]];
    uint64_t v48 = TSUDynamicCast();
    objc_opt_class();
    [v23 objectForKey:PFXCommonTocIncludeInTOC[0]];
    id v24 = (void *)TSUDynamicCast();
    if (v24) {
      unsigned int v50 = [v24 BOOLValue];
    }
    else {
      unsigned int v50 = 1;
    }
    objc_opt_class();
    [v23 objectForKey:PFXCommonTocDisplayStartPageNumber[0]];
    v27 = (void *)TSUDynamicCast();
    if (v27) {
      uint64_t v47 = (uint64_t)[v27 integerValue];
    }
    else {
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_opt_class();
    [v23 objectForKey:PFXCommonTocDisplayPageNumberFormat[0]];
    uint64_t v28 = TSUDynamicCast();
    if (v28) {
      uint64_t v25 = +[PFAINavigation listNumberTypeForString:v28];
    }
    else {
      uint64_t v25 = 0;
    }
    objc_opt_class();
    [v23 objectForKey:PFXCommonTocNumberOfPages[0]];
    id v29 = (void *)TSUDynamicCast();
    if (v29) {
      uint64_t v26 = (uint64_t)[v29 unsignedIntegerValue];
    }
    else {
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 1;
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v48 = 0;
    unsigned int v50 = 1;
  }
  id v30 = [a7 contentNodeForEntry:v21];
  if (v30)
  {
    id v31 = v30;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v31 = [v46 createContentNodeWithId:v51 label:v14 entry:v21 readerState:a7];
    objc_msgSend(objc_msgSend(a7, "currentContainerNode"), "addNode:", v31);
    [a7 setContentNode:v31 forEntry:v21];
    unsigned int v32 = v50;
    if (!v31) {
      unsigned int v32 = 0;
    }
    if (v32 == 1)
    {
      id v33 = objc_alloc_init(THTOCTileModelEntry);
      -[THTOCTileModelEntry setNodeGUID:](v33, "setNodeGUID:", [v31 nodeGUID]);
      [(THTOCTileModelEntry *)v33 setIndentLevel:a6];
      [(THTOCTileModelEntry *)v33 setTitle:v14];
      -[v33 setModelLink:[v31 modelLinkWithFragment:[v49 fragment]]];
      [(THTOCTileModelEntry *)v33 setSectionIdentifier:v48];
      [(THTOCTileModelEntry *)v33 setPageCount:v26];
      [(THTOCTileModelEntry *)v33 setDisplayPageNumberFormat:v25];
      [(THTOCTileModelEntry *)v33 setDisplayPageNumberValue:v47];
      [(THTOCTileModelEntry *)v33 setIncludeInTOC:1];
      [v45 addObject:v33];
    }
    else
    {
      id v45 = 0;
      v34 = 0;
      if (!v31) {
        goto LABEL_42;
      }
    }
  }
  v35 = objc_alloc_init(THTOCTileModelEntry);
  -[THTOCTileModelEntry setNodeGUID:](v35, "setNodeGUID:", [v31 nodeGUID]);
  [(THTOCTileModelEntry *)v35 setIndentLevel:a6];
  [(THTOCTileModelEntry *)v35 setTitle:v14];
  [v35 setModelLink:[v31 modelLinkWithFragment:[v49 fragment]]];
  [(THTOCTileModelEntry *)v35 setSectionIdentifier:v48];
  [(THTOCTileModelEntry *)v35 setPageCount:v26];
  [(THTOCTileModelEntry *)v35 setDisplayPageNumberFormat:v25];
  [(THTOCTileModelEntry *)v35 setDisplayPageNumberValue:v47];
  [(THTOCTileModelEntry *)v35 setIncludeInTOC:v50];
  [a5 addObject:v35];

  v34 = v31;
LABEL_42:

  int v36 = xmlTextReaderRead(a3);
  if (v36 != 1) {
    return v36 >= 0;
  }
  while (1)
  {
    int v37 = xmlTextReaderDepth(a3);
    int v38 = xmlTextReaderNodeType(a3);
    BOOL v39 = v37 == v11 && v38 == 15;
    BOOL v40 = v39;
    if (v39) {
      break;
    }
    if (v13 == v37 && v38 == 1)
    {
      id v41 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      v42 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v41, v42))
      {
        long long v43 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"navPoint", v43))
        {
          if (![v46 readNavPointFromStream:a3 landscapeEntries:v45 portraitEntries:a5 depth:a6 + 1 readerState:a7])break; {
        }
          }
      }
    }
    int v36 = xmlTextReaderRead(a3);
    if (v36 != 1) {
      return v36 >= 0;
    }
  }
  return v40;
}

+ (BOOL)readNavMapFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  id v4 = a4;
  id v6 = [a4 packageState];
  id v7 = [v6 thDocumentRoot];
  id v8 = [v7 context];
  id v90 = [v7 tocModel];
  v93 = v6;
  id v92 = [v6 glossaryEntryUri];
  int v9 = xmlTextReaderDepth(a3);
  int v10 = -[THModelContainerNode initWithTitle:includeInTOC:context:]([THModelContainerNode alloc], "initWithTitle:includeInTOC:context:", [v4 title], 0, v8);
  [(THModelNode *)v10 setNodeGUID:+[NSString stringWithUUID]];
  v88 = v7;
  v91 = v10;
  [v7 setRootNode:v10];
  id obj = objc_alloc_init((Class)NSMutableArray);
  int v11 = xmlTextReaderRead(a3);
  if (v11 == 1)
  {
    id v84 = v8;
    uint64_t v95 = v9 + 1;
    int v97 = v9;
    uint64_t v12 = v9 + 2;
    while (1)
    {
      int v13 = xmlTextReaderDepth(a3);
      int v14 = xmlTextReaderNodeType(a3);
      if (v13 == v97 && v14 == 15) {
        break;
      }
      if (v95 == v13 && v14 == 1)
      {
        int v15 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        int v16 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v15, v16))
        {
          int v17 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual(v17, (const xmlChar *)"navPoint"))
          {
            for (int i = xmlTextReaderMoveToFirstAttribute(a3); ; int i = xmlTextReaderMoveToNextAttribute(a3))
            {
              if (i != 1)
              {
                id v20 = 0;
                goto LABEL_15;
              }
              BOOL v19 = xmlTextReaderConstLocalName(a3);
              if (xmlStrEqual(v19, (const xmlChar *)"id")) {
                break;
              }
            }
            id v20 = +[NSString stringWithXmlString:xmlTextReaderConstValue(a3)];
LABEL_15:
            if (xmlTextReaderRead(a3) == 1)
            {
              CFStringRef v21 = &stru_46D7E8;
              while (1)
              {
                int v22 = xmlTextReaderDepth(a3);
                int v23 = xmlTextReaderNodeType(a3);
                if (v22 == v13 && v23 == 15)
                {
LABEL_26:
                  id v27 = 0;
                  goto LABEL_28;
                }
                if (v12 == v22 && v23 == 1)
                {
                  id v24 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
                  uint64_t v25 = xmlTextReaderConstNamespaceUri(a3);
                  if (xmlStrEqual(v24, v25))
                  {
                    uint64_t v26 = xmlTextReaderConstLocalName(a3);
                    if (xmlStrEqual((const xmlChar *)"navLabel", v26))
                    {
                      CFStringRef v21 = (const __CFString *)[a1 getTextFromNavLabelFromStream:a3 readerState:v4];
                    }
                    else if (xmlStrEqual((const xmlChar *)"content", v26))
                    {
                      id v27 = [a1 getUrlFromContentFromStream:a3 readerState:v4];
                      goto LABEL_28;
                    }
                  }
                }
                if (xmlTextReaderRead(a3) != 1) {
                  goto LABEL_26;
                }
              }
            }
            id v27 = 0;
            CFStringRef v21 = &stru_46D7E8;
LABEL_28:
            id v28 = [v27 path];
            if ([v28 isEqualToString:v92])
            {
              objc_msgSend(objc_msgSend(v88, "glossary"), "setApplePubURLWithState:", v93);
              while (xmlTextReaderRead(a3) == 1)
              {
                int v29 = xmlTextReaderDepth(a3);
                int v30 = xmlTextReaderNodeType(a3);
                if (v29 == v13 && v30 == 15) {
                  break;
                }
                if (v12 == v29 && v30 == 1)
                {
                  id v31 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
                  unsigned int v32 = xmlTextReaderConstNamespaceUri(a3);
                  if (xmlStrEqual(v31, v32))
                  {
                    id v33 = xmlTextReaderConstLocalName(a3);
                    if (xmlStrEqual((const xmlChar *)"navPoint", v33)) {
                      [a1 readGlossaryNavPointFromStream:a3 readerState:v4];
                    }
                  }
                }
              }
            }
            else if (v27)
            {
              v81 = v27;
              id v34 = [v4 additionalPropertiesForNavPointId:v20];
              objc_opt_class();
              v89 = v34;
              [v34 objectForKey:PFXCommonTocIncludeInTOC[0]];
              v35 = (void *)TSUDynamicCast();
              if (v35) {
                unsigned int v36 = [v35 BOOLValue];
              }
              else {
                unsigned int v36 = 1;
              }
              int v37 = [[THModelContainerNode alloc] initWithTitle:v21 includeInTOC:1 context:v84];
              [(THModelNode *)v37 setNodeGUID:+[NSString stringWithUUID]];
              [(THModelContainerNode *)v91 addNode:v37];
              v87 = v37;
              [v4 setCurrentContainerNode:v37];
              unsigned int v38 = v36;
              v82 = v20;
              if (v36)
              {
                unsigned int v80 = v36;
                id v83 = objc_alloc_init((Class)NSMutableArray);
                id v85 = objc_alloc_init((Class)NSMutableArray);
                BOOL v39 = v4;
                BOOL v40 = [[THTOCTileModel alloc] initWithTOCModel:v90];
                [(THTOCTileModel *)v40 setFrontOrdinalText:@" "];
                [(THTOCTileModel *)v40 setFrontTitleText:v21];
                unsigned int v38 = v80;
                [(THTOCTileModel *)v40 setBackOrdinalText:@" "];
                [(THTOCTileModel *)v40 setBackTitleText:v21];
                v86 = v40;
                id v41 = v40;
                id v4 = v39;
                [v39 setCurrentTocTile:v41];
              }
              else
              {
                id v85 = 0;
                v86 = 0;
                id v83 = 0;
              }
              id v42 = [a1 createContentNodeWithId:v20 label:v21 entry:v28 readerState:v4];
              [(THModelContainerNode *)v87 addNode:v42];
              [v4 setContentNode:v42 forEntry:v28];
              long long v43 = v85;
              if (v38)
              {
                if ((objc_msgSend(objc_msgSend(objc_msgSend(v93, "thDocumentRoot"), "bookDescription"), "isEpub") & 1) == 0)
                {
                  id v44 = [v81 absoluteString];
                  objc_opt_class();
                  [v89 objectForKey:PFXCommonTocConfig[0]];
                  uint64_t v45 = TSUDynamicCast();
                  if (v45) {
                    id v44 = (id)v45;
                  }
                  id v46 = -[THModelContentNode initWithTitle:includeInTOC:context:]([THModelContentNode alloc], "initWithTitle:includeInTOC:context:", v21, 0, objc_msgSend(objc_msgSend(objc_msgSend(v4, "packageState"), "thDocumentRoot"), "context"));
                  [(THModelNode *)v46 setNodeGUID:+[NSString stringWithFormat:@"%@-browserPage", v82]];
                  [(THModelContentNode *)v46 setApplePubEntryID:v44];
                  [(THModelContentNode *)v46 setApplePubURLWithState:v93];
                  [(THModelContentNode *)v46 setNavigationPageNode:1];
                  [(THTOCTileModel *)v86 setBrowserPageNode:v46];

                  long long v43 = v85;
                }
                uint64_t v47 = objc_alloc_init(THTOCTileModelEntry);
                -[THTOCTileModelEntry setNodeGUID:](v47, "setNodeGUID:", [v42 nodeGUID]);
                [(THTOCTileModelEntry *)v47 setIndentLevel:0];
                [(THTOCTileModelEntry *)v47 setTitle:v21];
                -[v47 setModelLink:[v42 modelLinkWithFragment:[v81 fragment]]];
                objc_opt_class();
                [v89 objectForKey:PFXCommonTocSectionIdentifier[0]];
                [(THTOCTileModelEntry *)v47 setSectionIdentifier:TSUDynamicCast()];
                [(THTOCTileModelEntry *)v47 setPageCount:1];
                [(THTOCTileModelEntry *)v47 setIncludeInTOC:1];
                objc_opt_class();
                [v89 objectForKey:PFXCommonTocNumberOfPages[0]];
                uint64_t v48 = (void *)TSUDynamicCast();
                if (v48) {
                  -[THTOCTileModelEntry setPageCount:](v47, "setPageCount:", [v48 unsignedIntegerValue]);
                }
                objc_opt_class();
                [v89 objectForKey:PFXCommonTocDisplayStartPageNumber[0]];
                long long v49 = (void *)TSUDynamicCast();
                if (v49) {
                  -[THTOCTileModelEntry setDisplayPageNumberValue:](v47, "setDisplayPageNumberValue:", [v49 integerValue]);
                }
                objc_opt_class();
                [v89 objectForKey:PFXCommonTocDisplayPageNumberFormat[0]];
                uint64_t v50 = TSUDynamicCast();
                if (v50) {
                  [(THTOCTileModelEntry *)v47 setDisplayPageNumberFormat:+[PFAINavigation listNumberTypeForString:v50]];
                }
                objc_opt_class();
                [v89 objectForKey:PFXCommonTocThumb[0]];
                uint64_t v51 = TSUDynamicCast();
                if (v51)
                {
                  id v52 = [a1 imageFromEntry:v51 packageState:[v4 packageState]];
                  if (v52) {
                    [(THTOCTileModel *)v86 setTocThumb:v52];
                  }
                }
                objc_opt_class();
                [v89 objectForKey:PFXCommonTocNotesThumb[0]];
                uint64_t v53 = TSUDynamicCast();
                if (v53)
                {
                  id v54 = [a1 imageFromEntry:v53 packageState:[v4 packageState]];
                  if (v54) {
                    [(THTOCTileModel *)v86 setNotesThumb:v54];
                  }
                }
                [v43 addObject:v47];
              }
              while (xmlTextReaderRead(a3) == 1)
              {
                int v55 = xmlTextReaderDepth(a3);
                int v56 = xmlTextReaderNodeType(a3);
                if (v55 == v13 && v56 == 15) {
                  break;
                }
                if (v12 == v55 && v56 == 1)
                {
                  v57 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
                  v58 = xmlTextReaderConstNamespaceUri(a3);
                  if (xmlStrEqual(v57, v58))
                  {
                    v59 = xmlTextReaderConstLocalName(a3);
                    if (xmlStrEqual((const xmlChar *)"navPoint", v59)) {
                      [a1 readNavPointFromStream:a3 landscapeEntries:v83 portraitEntries:v43 depth:1 readerState:v4];
                    }
                  }
                }
              }
              if (v86)
              {
                [(THTOCTileModel *)v86 setLandscapeEntries:v83];
                [(THTOCTileModel *)v86 setPortraitEntries:v43];

                [obj addObject:v86];
              }
              [v4 clearNodesByEntry];

              [v4 setCurrentContainerNode:0];
              [v4 setCurrentTocTile:0];
            }
          }
        }
      }
      int v11 = xmlTextReaderRead(a3);
      if (v11 != 1) {
        goto LABEL_79;
      }
    }
    int v11 = 1;
  }
LABEL_79:
  int v96 = v11;
  v98 = v4;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v60 = [obj countByEnumeratingWithState:&v104 objects:v109 count:16];
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = 0;
    uint64_t v63 = *(void *)v105;
    do
    {
      for (j = 0; j != v61; j = (char *)j + 1)
      {
        if (*(void *)v105 != v63) {
          objc_enumerationMutation(obj);
        }
        v65 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v66 = [v65 portraitEntries];
        id v67 = [v66 countByEnumeratingWithState:&v100 objects:v108 count:16];
        if (v67)
        {
          id v68 = v67;
          uint64_t v69 = *(void *)v101;
          do
          {
            for (k = 0; k != v68; k = (char *)k + 1)
            {
              if (*(void *)v101 != v69) {
                objc_enumerationMutation(v66);
              }
              v71 = *(void **)(*((void *)&v100 + 1) + 8 * (void)k);
              if ([v71 pageCount] == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                [v71 setPageIndex:0x7FFFFFFFFFFFFFFFLL];
              }
              else
              {
                [v71 setPageIndex:v62];
                v62 += (uint64_t)[v71 pageCount];
              }
            }
            id v68 = [v66 countByEnumeratingWithState:&v100 objects:v108 count:16];
          }
          while (v68);
        }
      }
      id v61 = [obj countByEnumeratingWithState:&v104 objects:v109 count:16];
    }
    while (v61);
  }
  [v90 setBookTitle:[v98 title]];
  [v90 setBookSubtitle:[v98 subtitle]];
  [v90 setTiles:obj];
  objc_opt_class();
  objc_msgSend(objc_msgSend(v98, "ncxAdditions"), "objectForKey:", @"tocHeaderImage");
  uint64_t v72 = TSUDynamicCast();
  if (v72) {
    [v90 setTocHeaderImageData:[a1 imageFromEntry:v72 packageState:v93]];
  }
  objc_opt_class();
  id v73 = [v98 ncxAdditions];
  [v73 objectForKey:PFXCommonTocShowPageNumbers[0]];
  v74 = (void *)TSUDynamicCast();
  if (v74) {
    [v90 setShowPageNumbers:[v74 BOOLValue]];
  }
  objc_opt_class();
  id v75 = [v98 ncxAdditions];
  [v75 objectForKey:PFXCommonTocFigureReference[0]];
  uint64_t v76 = TSUDynamicCast();
  if (v76) {
    [v90 setFigureReference:v76];
  }
  id v77 = [obj count];

  return v96 >= 0 && v77 != 0;
}

+ (BOOL)readNavigationFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  while (xmlTextReaderRead(a3) == 1)
  {
    int v7 = xmlTextReaderDepth(a3);
    int v8 = xmlTextReaderNodeType(a3);
    if (!v7 && v8 == 1)
    {
      int v9 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual((const xmlChar *)"ncx", v9))
      {
        int v10 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
        int v11 = xmlTextReaderConstNamespaceUri(a3);
        if (xmlStrEqual(v10, v11)) {
          break;
        }
      }
    }
  }
  int v12 = xmlTextReaderDepth(a3);
  int v13 = xmlTextReaderRead(a3);
  if (v13 != 1) {
    return v13 >= 0;
  }
  while (1)
  {
    int v14 = xmlTextReaderDepth(a3);
    int v15 = xmlTextReaderNodeType(a3);
    BOOL v16 = v14 == v12 && v15 == 15;
    BOOL v17 = v16;
    if (v16) {
      break;
    }
    if (v12 + 1 == v14 && v15 == 1)
    {
      BOOL v18 = (const xmlChar *)PFXCommonEpubNavigationNS[0];
      BOOL v19 = xmlTextReaderConstNamespaceUri(a3);
      if (xmlStrEqual(v18, v19))
      {
        id v20 = xmlTextReaderConstLocalName(a3);
        if (xmlStrEqual((const xmlChar *)"head", v20))
        {
          if (([a1 readHeadFromStream:a3 readerState:a4] & 1) == 0) {
            return v17;
          }
        }
        else if (xmlStrEqual((const xmlChar *)"docTitle", v20))
        {
          id v21 = [a1 getTextFromNavLabelFromStream:a3 readerState:a4];
          if (v21) {
            [a4 setTitle:v21];
          }
        }
        else if (xmlStrEqual((const xmlChar *)"navMap", v20) {
               && ![a1 readNavMapFromStream:a3 readerState:a4])
        }
        {
          return v17;
        }
      }
    }
    int v13 = xmlTextReaderRead(a3);
    if (v13 != 1) {
      return v13 >= 0;
    }
  }
  return v17;
}

+ (BOOL)loadDocumentStructureWithState:(id)a3 isUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a3 thDocumentRoot];
  id v8 = [a3 ncxEntryUri];
  id v9 = [a3 archive];
  id v10 = objc_alloc_init((Class)NSAutoreleasePool);
  int v11 = [[PFAINavigationState alloc] initWithEntry:v8 inArchive:v9];
  [(PFAINavigationState *)v11 setPackageState:a3];
  objc_opt_class();
  objc_msgSend(objc_msgSend(a3, "metadata"), "objectForKey:", @"dc:title");
  [(PFAINavigationState *)v11 setTitle:TSUDynamicCast()];
  if ([(PFXXmlStreamReaderState *)v11 streamAPI])
  {
    if (v4) {
      [a1 cacheAndTrimNode:[v7 rootNode] inState:v11];
    }
    unsigned __int8 v12 = [a1 readNavigationFromStream:-[PFXXmlStreamReaderState streamAPI](v11, "streamAPI") readerState:v11];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
  if (v11) {

  }
  return v12;
}

@end