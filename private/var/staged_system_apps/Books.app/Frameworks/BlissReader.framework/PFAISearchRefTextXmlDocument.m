@interface PFAISearchRefTextXmlDocument
+ (BOOL)readWithState:(id)a3;
+ (char)getString:(id)a3;
@end

@implementation PFAISearchRefTextXmlDocument

+ (char)getString:(id)a3
{
  if (a3) {
    return (char *)[a3 cStringUsingEncoding:1];
  }
  else {
    return 0;
  }
}

+ (BOOL)readWithState:(id)a3
{
  v5 = (xmlTextReader *)[a3 streamAPI];
  if (!v5) {
    return (char)v5;
  }
  v6 = v5;
  int v7 = xmlTextReaderDepth(v5);
  id v41 = a3;
  id v35 = [a3 currentRID];
  v8 = [a1 getString:];
  if (!v8) {
    goto LABEL_67;
  }
  v9 = v8;
  uint64_t v36 = v7 + 1;
  uint64_t v40 = v7 + 2;
  uint64_t v37 = v7 + 3;
  while (1)
  {
    int v10 = xmlTextReaderRead(v6);
    if (v10 != 1) {
      break;
    }
    int v11 = xmlTextReaderDepth(v6);
    int v12 = xmlTextReaderNodeType(v6);
    if (!v11 && v12 == 1)
    {
      v13 = xmlTextReaderConstLocalName(v6);
      if (!xmlStrEqual(v13, (const xmlChar *)"reftext")) {
        goto LABEL_63;
      }
      LODWORD(v14) = xmlTextReaderMoveToFirstAttribute(v6);
      double v15 = 0.0;
      do
      {
        v16 = xmlTextReaderConstLocalName(v6);
        v17 = v16;
        if (v15 == 0.0 && xmlStrEqual(v16, (const xmlChar *)"currentVersion"))
        {
          double v42 = 0.0;
          v18 = (const char *)xmlTextReaderConstValue(v6);
          if (sscanf(v18, "%lf", &v42)) {
            double v15 = v42;
          }
          else {
            double v15 = 0.0;
          }
        }
        else if (xmlStrEqual(v17, (const xmlChar *)"requiredVersion"))
        {
          double v42 = 0.0;
          v19 = (const char *)xmlTextReaderConstValue(v6);
          if (sscanf(v19, "%lf", &v42)) {
            double v15 = v42;
          }
        }
      }
      while (xmlTextReaderMoveToNextAttribute(v6) == 1);
      uint64_t v14 = (int)v14;
      if (v15 < 0.0) {
        objc_msgSend(objc_msgSend(v41, "loadDelegate"), "cancel");
      }
      goto LABEL_64;
    }
    if (v36 != v11) {
      goto LABEL_63;
    }
    if (v12 != 1) {
      goto LABEL_63;
    }
    v20 = xmlTextReaderConstLocalName(v6);
    if (!xmlStrEqual(v20, (const xmlChar *)"rs")) {
      goto LABEL_63;
    }
    while (1)
    {
      int v21 = xmlTextReaderRead(v6);
      if (v21 != 1)
      {
        uint64_t v14 = v21;
        goto LABEL_64;
      }
      int v22 = xmlTextReaderDepth(v6);
      int v23 = xmlTextReaderNodeType(v6);
      if (v22 == v11 && v23 == 15) {
        goto LABEL_63;
      }
      if (v40 != v22 || v23 != 1 || (v24 = xmlTextReaderConstLocalName(v6), !xmlStrEqual(v24, (const xmlChar *)"r")))
      {
        uint64_t v14 = 1;
        goto LABEL_42;
      }
      int IsEmptyElement = xmlTextReaderIsEmptyElement(v6);
      LODWORD(v14) = xmlTextReaderMoveToFirstAttribute(v6);
      do
      {
        v25 = xmlTextReaderConstLocalName(v6);
        if (xmlStrEqual(v25, (const xmlChar *)"ri")) {
          v26 = xmlTextReaderConstValue(v6);
        }
        else {
          v26 = 0;
        }
      }
      while (xmlTextReaderMoveToNextAttribute(v6) == 1 && !v26);
      uint64_t v14 = (int)v14;
      if (!v26 || !xmlStrEqual(v9, v26)) {
        goto LABEL_42;
      }
      if (!IsEmptyElement) {
        break;
      }
      BOOL v27 = 0;
      id v28 = [v41 addRefText:&stru_46D7E8 forRID:v35];
LABEL_39:
      id v35 = v28;
      v9 = (const xmlChar *)[a1 getString];
      if (v27) {
        goto LABEL_64;
      }
LABEL_42:
      if ([v41 isCancelled]) {
        goto LABEL_64;
      }
    }
    while (1)
    {
      int v29 = xmlTextReaderRead(v6);
      if (v29 != 1)
      {
        uint64_t v14 = v29;
        v9 = (const xmlChar *)[a1 getString:v35];
        goto LABEL_42;
      }
      int v30 = xmlTextReaderDepth(v6);
      int v31 = xmlTextReaderNodeType(v6);
      if (v37 != v30 || v31 != 3)
      {
        BOOL v27 = v30 == v11 && v31 == 15;
        uint64_t v14 = 1;
        id v28 = v35;
        goto LABEL_39;
      }
      v32 = +[NSString stringWithXmlString:xmlTextReaderConstValue(v6)];
      if ([v41 isCancelled]) {
        break;
      }
      if (v32)
      {
        int v39 = 0;
LABEL_60:
        id v28 = [v41 addRefText:v32 forRID:v35];
        uint64_t v14 = 1;
        BOOL v27 = v39;
        goto LABEL_39;
      }
    }
    if (v32)
    {
      int v39 = 1;
      goto LABEL_60;
    }
    v9 = (const xmlChar *)[a1 getString:v35];
LABEL_63:
    uint64_t v14 = 1;
LABEL_64:
    if (([v41 isCancelled] & 1) != 0 || !v9)
    {
      if ((v14 & 0x8000000000000000) == 0) {
        goto LABEL_67;
      }
LABEL_69:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
  }
  if ((v10 & 0x8000000000000000) != 0) {
    goto LABEL_69;
  }
LABEL_67:
  LOBYTE(v5) = [v41 isCancelled] ^ 1;
  return (char)v5;
}

@end