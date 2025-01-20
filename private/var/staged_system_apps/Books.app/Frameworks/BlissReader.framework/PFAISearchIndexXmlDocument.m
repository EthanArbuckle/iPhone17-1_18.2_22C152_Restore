@interface PFAISearchIndexXmlDocument
+ (BOOL)readWithState:(id)a3;
@end

@implementation PFAISearchIndexXmlDocument

+ (BOOL)readWithState:(id)a3
{
  id v3 = a3;
  v4 = (xmlTextReader *)[a3 streamAPI];
  if (!v4) {
    return (char)v4;
  }
  v5 = v4;
  uint64_t v62 = xmlTextReaderDepth(v4) + 1;
  id v60 = objc_msgSend(objc_msgSend(v3, "thDocumentRoot"), "searchIndex");
  id v58 = +[NSMutableSet set];
  uint64_t v64 = 0;
  int v6 = 0;
  do
  {
    if (xmlTextReaderRead(v5) != 1 || (v6 & v64 & HIDWORD(v64) & 1) != 0) {
      break;
    }
    int v7 = xmlTextReaderDepth(v5);
    int v8 = xmlTextReaderNodeType(v5);
    if (v7) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v8 == 1;
    }
    int v10 = !v9;
    if (((v10 | v64) & 1) == 0)
    {
      v40 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v40, (const xmlChar *)"index"))
      {
        if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
        {
          double v41 = 0.0;
          do
          {
            v42 = xmlTextReaderConstLocalName(v5);
            v43 = v42;
            if (v41 == 0.0 && xmlStrEqual(v42, (const xmlChar *)"currentVersion"))
            {
              uint64_t v67 = 0;
              v44 = (const char *)xmlTextReaderConstValue(v5);
              if (sscanf(v44, "%lf", &v67)) {
                double v41 = *(double *)&v67;
              }
              else {
                double v41 = 0.0;
              }
            }
            else if (xmlStrEqual(v43, (const xmlChar *)"requiredVersion"))
            {
              uint64_t v67 = 0;
              v45 = (const char *)xmlTextReaderConstValue(v5);
              if (sscanf(v45, "%lf", &v67)) {
                double v41 = *(double *)&v67;
              }
            }
          }
          while (xmlTextReaderMoveToNextAttribute(v5) == 1);
          if (v41 < 0.0) {
            objc_msgSend(objc_msgSend(v3, "loadDelegate"), "cancel");
          }
        }
        int v11 = 0;
        LODWORD(v64) = 1;
        continue;
      }
      LODWORD(v64) = 0;
LABEL_125:
      int v11 = 0;
      continue;
    }
    int v11 = 0;
    uint64_t v65 = v7;
    if (v62 != v7 || v8 != 1 || (v6 & HIDWORD(v64) & 1) != 0) {
      continue;
    }
    v12 = xmlTextReaderConstLocalName(v5);
    v13 = v12;
    uint64_t v63 = v65 + 1;
    if ((v6 & 1) != 0 || !xmlStrEqual(v12, (const xmlChar *)"ts"))
    {
      if ((v64 & 0x100000000) != 0)
      {
LABEL_127:
        int v11 = 0;
        HIDWORD(v64) = 1;
        continue;
      }
      if (!xmlStrEqual(v13, (const xmlChar *)"rs"))
      {
        HIDWORD(v64) = 0;
        goto LABEL_125;
      }
      while (1)
      {
        if (xmlTextReaderRead(v5) != 1) {
          goto LABEL_127;
        }
        int v46 = xmlTextReaderDepth(v5);
        int v47 = xmlTextReaderNodeType(v5);
        if (v46 == v65 && v47 == 15) {
          goto LABEL_127;
        }
        if (v63 != v46) {
          goto LABEL_160;
        }
        if (v47 != 1) {
          goto LABEL_160;
        }
        v48 = xmlTextReaderConstLocalName(v5);
        if (!xmlStrEqual(v48, (const xmlChar *)"r")) {
          goto LABEL_160;
        }
        if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
        {
          id v49 = 0;
          id v50 = 0;
          do
          {
            if (v50 && v49) {
              break;
            }
            v51 = xmlTextReaderConstLocalName(v5);
            if (xmlStrEqual(v51, (const xmlChar *)"ri"))
            {

              id v50 = [objc_alloc((Class)NSString) initWithXmlString:xmlTextReaderConstValue(v5)];
            }
            else if (xmlStrEqual(v51, (const xmlChar *)"fi"))
            {

              id v49 = [objc_alloc((Class)NSString) initWithXmlString:xmlTextReaderConstValue(v5)];
            }
          }
          while (xmlTextReaderMoveToNextAttribute(v5) == 1);
          BOOL v52 = v49 != 0;
          if (v50 && v49)
          {
            id v53 = [v58 member:v50];
            if (v53) {
              [v60 addReference:v53 cfi:v49];
            }
            else {
              NSLog(@"CFI with refID='%@' is not referenced in search index. Dropping CFI '%@'.", v50, v49);
            }
            goto LABEL_159;
          }
          if (v50)
          {
            if (v49) {
              goto LABEL_154;
            }
LABEL_153:
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAISearchIndexXmlDocument readWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAISearchIndexDocument.mm") lineNumber:420 description:@"No CFI for ri='%@'", v50];
            goto LABEL_154;
          }
        }
        else
        {
          id v49 = 0;
          BOOL v52 = 0;
        }
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAISearchIndexXmlDocument readWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAISearchIndexDocument.mm") lineNumber:419 description:@"No ri for CFI='%@'", v49];
        id v50 = 0;
        if (!v52) {
          goto LABEL_153;
        }
LABEL_154:
        NSLog(@"Unable to parse CFI/refID combination '%@'/'%@'.", v49, v50);
LABEL_159:

LABEL_160:
        if ([v3 isCancelled])
        {
          HIDWORD(v64) = 1;
          goto LABEL_125;
        }
      }
    }
    id v61 = objc_alloc_init((Class)NSMutableSet);
    do
    {
      if (xmlTextReaderRead(v5) != 1) {
        break;
      }
      int v14 = xmlTextReaderDepth(v5);
      int v15 = xmlTextReaderNodeType(v5);
      int v66 = v14;
      if (v14 == v65 && v15 == 15) {
        break;
      }
      if (v63 == v14 && v15 == 1)
      {
        v16 = xmlTextReaderConstLocalName(v5);
        if (xmlStrEqual(v16, (const xmlChar *)"t"))
        {
          if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
          {
            do
            {
              v17 = xmlTextReaderConstLocalName(v5);
              if (xmlStrEqual(v17, (const xmlChar *)"s")) {
                id v18 = [objc_alloc((Class)NSString) initWithXmlString:xmlTextReaderConstValue(v5)];
              }
              else {
                id v18 = 0;
              }
            }
            while (xmlTextReaderMoveToNextAttribute(v5) == 1 && !v18);
            if (v18)
            {
              id v19 = [v60 addTermWithStem:v18];
              if (xmlTextReaderRead(v5) == 1)
              {
                id v56 = v3;
                v57 = v19;
                char v55 = 0;
                do
                {
                  int v20 = xmlTextReaderDepth(v5);
                  int v21 = xmlTextReaderNodeType(v5);
                  if (v20 == v66 && v21 == 15) {
                    break;
                  }
                  if (v65 + 2 == v20 && v21 == 1)
                  {
                    v22 = xmlTextReaderConstLocalName(v5);
                    if (xmlStrEqual(v22, (const xmlChar *)"i"))
                    {
                      if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
                      {
                        do
                        {
                          v23 = xmlTextReaderConstLocalName(v5);
                          if (xmlStrEqual(v23, (const xmlChar *)"sr")) {
                            id v24 = [objc_alloc((Class)NSString) initWithXmlString:xmlTextReaderConstValue(v5)];
                          }
                          else {
                            id v24 = 0;
                          }
                        }
                        while (xmlTextReaderMoveToNextAttribute(v5) == 1 && !v24);
                        if (v57 && v24)
                        {
                          id v59 = [v57 addInflection:v24];
                          while (xmlTextReaderRead(v5) == 1)
                          {
                            int v25 = xmlTextReaderDepth(v5);
                            int v26 = xmlTextReaderNodeType(v5);
                            if (v25 == v20 && v26 == 15) {
                              break;
                            }
                            if (v65 + 3 == v25 && v26 == 1)
                            {
                              v27 = xmlTextReaderConstLocalName(v5);
                              if (xmlStrEqual(v27, (const xmlChar *)"o"))
                              {
                                if (xmlTextReaderMoveToFirstAttribute(v5) == 1)
                                {
                                  id v28 = 0;
                                  id v29 = 0;
                                  uint64_t v30 = -1;
                                  uint64_t v31 = -1;
                                  uint64_t v32 = -1;
                                  do
                                  {
                                    if (v32 != -1 && v29 && v31 != -1 && v30 != -1 && v28) {
                                      break;
                                    }
                                    v33 = xmlTextReaderConstLocalName(v5);
                                    v34 = v33;
                                    if (v32 == -1 && xmlStrEqual(v33, (const xmlChar *)"rk"))
                                    {
                                      uint64_t v67 = 0;
                                      v35 = (const char *)xmlTextReaderConstValue(v5);
                                      uint64_t v32 = sscanf(v35, "%ld", &v67) ? v67 : -1;
                                    }
                                    else if (v29 || !xmlStrEqual(v34, (const xmlChar *)"ri"))
                                    {
                                      if (v31 == -1 && xmlStrEqual(v34, (const xmlChar *)"oi"))
                                      {
                                        uint64_t v67 = 0;
                                        v36 = (const char *)xmlTextReaderConstValue(v5);
                                        uint64_t v31 = sscanf(v36, "%ld", &v67) ? v67 : -1;
                                      }
                                      else if (v30 == -1 && xmlStrEqual(v34, (const xmlChar *)"pn"))
                                      {
                                        uint64_t v67 = 0;
                                        v37 = (const char *)xmlTextReaderConstValue(v5);
                                        uint64_t v30 = sscanf(v37, "%ld", &v67) ? v67 : -1;
                                      }
                                      else if (!v28)
                                      {
                                        if (xmlStrEqual(v34, (const xmlChar *)"dpn")) {
                                          id v28 = [objc_alloc((Class)NSString) initWithXmlString:xmlTextReaderConstValue(v5)];
                                        }
                                        else {
                                          id v28 = 0;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      id v29 = [objc_alloc((Class)NSString) initWithCString:xmlTextReaderConstValue(v5) encoding:1];
                                    }
                                  }
                                  while (xmlTextReaderMoveToNextAttribute(v5) == 1);
                                  if (v59 && v32 >= 1 && v29 && v31 >= 1)
                                  {
                                    if (v28)
                                    {
                                      id v38 = [v61 member:v28];
                                      if (!v38)
                                      {
                                        [v61 addObject:v28];
                                        id v38 = v28;
                                      }
                                    }
                                    else
                                    {
                                      id v38 = 0;
                                    }
                                    id v39 = [v58 member:v29];
                                    if (!v39)
                                    {
                                      [v58 addObject:v29];
                                      id v39 = v29;
                                    }
                                    [v59 addOccurrence:v39 rank:v32 paragraphIndex:v31 pageNumber:v30 displayPageNumber:v38];
                                  }
                                  id v3 = v56;
                                }
                                else
                                {
                                  id v28 = 0;
                                  id v29 = 0;
                                }
                              }
                            }
                            if ([v3 isCancelled])
                            {
                              char v55 = 1;
                              break;
                            }
                          }
                        }
                      }
                      else
                      {
                        id v24 = 0;
                      }
                    }
                  }
                }
                while (xmlTextReaderRead(v5) == 1);

                if (v55)
                {
                  int v11 = 1;
                  goto LABEL_108;
                }
                continue;
              }
            }
          }
          else
          {
            id v18 = 0;
          }
        }
      }
    }
    while (![v3 isCancelled]);
    int v11 = 0;
LABEL_108:

    int v6 = 1;
  }
  while (([v3 isCancelled] & 1) == 0 && !v11);
  LOBYTE(v4) = 0;
  if ((v6 & 1) != 0 && (v64 & 1) != 0 && (v64 & 0x100000000) != 0) {
    LOBYTE(v4) = [v3 isCancelled] ^ 1;
  }
  return (char)v4;
}

@end