@interface PFXStreamReader
+ (BOOL)readWithElementReaders:(id)a3 textReader:(Class)a4 piReader:(Class)a5 readerState:(id)a6;
+ (BOOL)skipSubtreeWithStream:(_xmlTextReader *)a3 endNodeType:(int64_t)a4 readerState:(id)a5;
@end

@implementation PFXStreamReader

+ (BOOL)readWithElementReaders:(id)a3 textReader:(Class)a4 piReader:(Class)a5 readerState:(id)a6
{
  v11 = (xmlTextReader *)[a6 streamAPI];
  if (!v11)
  {
    LOBYTE(v36) = 0;
    return v36;
  }
  v12 = v11;
  __p = 0;
  v39 = 0;
  v40 = 0;
  while (2)
  {
    int v13 = xmlTextReaderRead(v12);
    if (v13 == 1)
    {
      int v14 = xmlTextReaderDepth(v12);
      switch(xmlTextReaderNodeType(v12))
      {
        case 1:
          v16 = v39;
          if (v39 >= v40)
          {
            v20 = (char *)__p;
            uint64_t v21 = (v39 - (unsigned char *)__p) >> 3;
            unint64_t v22 = v21 + 1;
            if ((unint64_t)(v21 + 1) >> 61) {
              sub_3D1D0();
            }
            uint64_t v23 = v40 - (unsigned char *)__p;
            if ((v40 - (unsigned char *)__p) >> 2 > v22) {
              unint64_t v22 = v23 >> 2;
            }
            if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v24 = v22;
            }
            if (v24)
            {
              v25 = (char *)sub_4374C((uint64_t)&v40, v24);
              v20 = (char *)__p;
              v16 = v39;
            }
            else
            {
              v25 = 0;
            }
            v26 = &v25[8 * v21];
            *(void *)v26 = 0;
            v17 = v26 + 8;
            while (v16 != v20)
            {
              uint64_t v27 = *((void *)v16 - 1);
              v16 -= 8;
              *((void *)v26 - 1) = v27;
              v26 -= 8;
            }
            __p = v26;
            v39 = v17;
            v40 = &v25[8 * v24];
            if (v20) {
              operator delete(v20);
            }
          }
          else
          {
            *(void *)v39 = 0;
            v17 = v16 + 8;
          }
          uint64_t v28 = v14;
          v39 = v17;
          if (v14 >= 1)
          {
            v29 = (char *)__p + 8 * v14;
            uint64_t v30 = *((void *)v29 - 1);
            uint64_t v31 = 1;
            if ((v30 & 1) == 0) {
              uint64_t v31 = 2;
            }
            *((void *)v29 - 1) = v30 + v31;
          }
          v32 = (const xmlChar *)"";
          if ([a6 namespaceCheck]) {
            v32 = xmlTextReaderConstNamespaceUri(v12);
          }
          id v33 = [a3 elementInfoForElementName:xmlTextReaderConstLocalName(v12) elementNamespace:v32];
          v34 = (objc_class *)[v33 mappingClass];
          if (!v34)
          {
            unsigned __int8 v18 = [a1 skipSubtreeWithStream:v12 endNodeType:15 readerState:a6];
            v39 -= 8;
            goto LABEL_43;
          }
          id v35 = objc_alloc_init(v34);
          [a6 pushReader:v35 elementInfo:v33 cfiPath:[PFXCommon cfiPathToNodeWithDepth:v28 nodeArray:&__p idArray:0]];
          if ([v35 mapStartElementWithState:a6])
          {
            if (!xmlTextReaderIsEmptyElement(v12))
            {
LABEL_48:

              goto LABEL_49;
            }
            objc_msgSend(objc_msgSend(objc_msgSend(a6, "currentXmlStackEntry"), "reader"), "mapEndElementWithState:", a6);
            [a6 popReader];
LABEL_47:
            v39 -= 8;
            goto LABEL_48;
          }
          if ([a1 skipSubtreeWithStream:v12 endNodeType:15 readerState:a6])
          {
            [a6 popReader];
            goto LABEL_47;
          }

          break;
        case 3:
        case 13:
        case 14:
          if (a4)
          {
            if (v14 < 1)
            {
              uint64_t v15 = 1;
            }
            else
            {
              uint64_t v15 = *((void *)v39 - 1);
              if ((v15 & 1) == 0) {
                *((void *)v39 - 1) = ++v15;
              }
            }
            [(objc_class *)a4 readTextFromStream:v12 childIndex:v15 readerState:a6];
            if ([a6 shouldCountText])
            {
              v19 = xmlTextReaderConstValue(v12);
              [a6 incrementTextReadBy:xmlStrlen(v19)];
            }
          }
          goto LABEL_49;
        case 6:
          unsigned __int8 v18 = [a1 skipSubtreeWithStream:v12 endNodeType:16 readerState:a6];
LABEL_43:
          if ((v18 & 1) == 0) {
            break;
          }
          goto LABEL_49;
        case 7:
          if (a5) {
            [(objc_class *)a5 readProcessingInstructionFromStream:v12 readerState:a6];
          }
          goto LABEL_49;
        case 15:
          objc_msgSend(objc_msgSend(objc_msgSend(a6, "currentXmlStackEntry"), "reader"), "mapEndElementWithState:", a6);
          [a6 popReader];
          v39 -= 8;
          goto LABEL_49;
        default:
LABEL_49:
          if ([a6 isCancelled]) {
            goto LABEL_53;
          }
          continue;
      }
    }
    else if ((v13 & 0x80000000) == 0)
    {
LABEL_53:
      unsigned int v36 = [a6 isCancelled] ^ 1;
      goto LABEL_56;
    }
    break;
  }
  LOBYTE(v36) = 0;
LABEL_56:
  if (__p)
  {
    v39 = (char *)__p;
    operator delete(__p);
  }
  return v36;
}

+ (BOOL)skipSubtreeWithStream:(_xmlTextReader *)a3 endNodeType:(int64_t)a4 readerState:(id)a5
{
  int v8 = xmlTextReaderNodeType(a3);
  int v9 = xmlTextReaderDepth(a3);
  if (v8 == a4) {
    return 1;
  }
  int v10 = v9;
  if (v8 == 1)
  {
    if (xmlTextReaderIsEmptyElement(a3)) {
      return 1;
    }
  }
  int v12 = xmlTextReaderRead(a3);
  if (v12 == 1)
  {
    while (1)
    {
      int v13 = xmlTextReaderDepth(a3);
      unsigned int v14 = xmlTextReaderNodeType(a3);
      if (v13 == v10 && v14 == a4) {
        break;
      }
      if (v14 <= 0xE && ((1 << v14) & 0x6008) != 0)
      {
        if ([a5 shouldCountText])
        {
          uint64_t v15 = xmlTextReaderConstValue(a3);
          [a5 incrementTextReadBy:xmlStrlen(v15)];
        }
      }
      int v12 = xmlTextReaderRead(a3);
      if (v12 != 1) {
        return v12 >= 0;
      }
    }
    int v12 = 1;
  }
  return v12 >= 0;
}

@end