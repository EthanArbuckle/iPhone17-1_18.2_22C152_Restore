@interface WXText
+ (id)addNewSectionTo:(id)a3 state:(id)a4;
+ (void)createChildren:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)createChildrenFromStream:(_xmlTextReader *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)readFrom:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)readFrom:(_xmlNode *)a3 state:(id)a4;
+ (void)readFromParagraph:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)readFromStream:(_xmlTextReader *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)readFromStream:(_xmlTextReader *)a3 state:(id)a4;
+ (void)readFromString:(id)a3 to:(id)a4;
+ (void)readFromTable:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6;
+ (void)updateTextBoxIdsFromState:(id)a3;
@end

@implementation WXText

+ (void)readFrom:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
}

+ (void)createChildren:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v25 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = OCXFirstChild(a3);
  int v12 = 0;
  while (v11)
  {
    if ([v10 isNewSectionRequested])
    {
      uint64_t v13 = +[WXText addNewSectionTo:v9 state:v10];

      id v9 = (id)v13;
    }
    name = v11->name;
    if (xmlStrEqual(name, (const xmlChar *)"p"))
    {
      +[WXText readFromParagraph:v11 baseStyle:v25 to:v9 state:v10];
      ++v12;
      HIDWORD(v15) = 429496728 - 858993459 * v12;
      LODWORD(v15) = HIDWORD(v15);
      if ((v15 >> 2) <= 0xCCCCCCC)
      {
        v16 = [v10 cancelDelegate];
        int v17 = [v16 isCancelled];

        if (v17) {
          +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
        }
      }
    }
    else
    {
      if (xmlStrEqual(name, (const xmlChar *)"tbl"))
      {
        +[WXText readFromTable:v11 baseStyle:v25 to:v9 state:v10];
        goto LABEL_11;
      }
      if (xmlStrEqual(name, (const xmlChar *)"sdt"))
      {
        +[TCMessageContext reportWarning:WXFormsNotSupported];
        v18 = [v10 WXMainNamespace];
        uint64_t v19 = OCXFindChild(v11, v18, "sdtContent");

        if (v19) {
          +[WXText createChildren:v19 baseStyle:v25 to:v9 state:v10];
        }
      }
      else
      {
        if (xmlStrEqual(name, (const xmlChar *)"subSection") || xmlStrEqual(name, (const xmlChar *)"pBdrGroup"))
        {
          +[WXText createChildren:v11 baseStyle:v25 to:v9 state:v10];
          goto LABEL_11;
        }
        if (xmlStrEqual(name, (const xmlChar *)"annotation"))
        {
          [v10 addText:v9 node:v11];
          goto LABEL_11;
        }
        if (xmlStrEqual(name, (const xmlChar *)"sectPr"))
        {
          v20 = [v10 cancelDelegate];
          int v21 = [v20 isCancelled];

          if (v21) {
            +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
          }
          v24 = [v10 document];
          v22 = [v24 lastSection];
          +[WXSection readFrom:v11 to:v22 state:v10];
LABEL_24:

          v23 = v24;
          goto LABEL_25;
        }
        if (xmlStrEqual(name, (const xmlChar *)"bookmarkStart"))
        {
          [v10 addPendingBookmark:v11];
        }
        else if (xmlStrEqual(name, (const xmlChar *)"bookmarkEnd"))
        {
          v23 = [v9 lastBlock];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = v23;
            v22 = [v23 addBookmark];
            +[WXBookmark readFrom:v11 to:v22 state:v10];
            goto LABEL_24;
          }
          [v10 addPendingBookmark:v11];
LABEL_25:
        }
      }
    }
LABEL_11:
    v11 = OCXNextSibling(v11);
  }
}

+ (void)readFromStream:(_xmlTextReader *)a3 state:(id)a4
{
  id v8 = a4;
  v5 = [v8 document];
  v6 = [v5 addSection];
  v7 = [v6 text];
  +[WXText readFromStream:a3 baseStyle:0 to:v7 state:v8];

  +[WXText updateTextBoxIdsFromState:v8];
}

+ (void)readFromStream:(_xmlTextReader *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
}

+ (void)createChildrenFromStream:(_xmlTextReader *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v32 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = objc_alloc_init(OCXSStream);
  uint64_t v12 = xmlTextReaderDepth(a3);
  [(OCXSStream *)v11 pushLevel:v12 name:xmlTextReaderConstLocalName(a3)];
  int v13 = 0;
  while (+[OCXStreamUtility readStream:a3 streamState:v11])
  {
    v14 = xmlTextReaderConstLocalName(a3);
    if ([v10 isNewSectionRequested])
    {
      uint64_t v15 = +[WXText addNewSectionTo:v9 state:v10];

      id v9 = (id)v15;
    }
    if (xmlStrEqual(v14, (const xmlChar *)"p"))
    {
      +[WXText readFromParagraph:xmlTextReaderExpand(a3) baseStyle:v32 to:v9 state:v10];
      ++v13;
      HIDWORD(v16) = -858993459 * v13 + 429496728;
      LODWORD(v16) = HIDWORD(v16);
      if ((v16 >> 2) <= 0xCCCCCCC)
      {
        int v17 = [v10 cancelDelegate];
        int v18 = [v17 isCancelled];

        if (v18) {
          +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
        }
      }
    }
    else if (xmlStrEqual(v14, (const xmlChar *)"tbl"))
    {
      +[WXText readFromTable:xmlTextReaderExpand(a3) baseStyle:v32 to:v9 state:v10];
    }
    else
    {
      if (xmlStrEqual(v14, (const xmlChar *)"sdt"))
      {
        +[TCMessageContext reportWarning:WXFormsNotSupported];
        uint64_t v19 = objc_alloc_init(OCXSStream);
        uint64_t v20 = xmlTextReaderDepth(a3);
        [(OCXSStream *)v19 pushLevel:v20 name:xmlTextReaderConstLocalName(a3)];
        while (+[OCXStreamUtility readStream:a3 streamState:v19])
        {
          int v21 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual(v21, (const xmlChar *)"sdtContent"))
          {
            +[WXText createChildrenFromStream:a3 baseStyle:v32 to:v9 state:v10];
            goto LABEL_16;
          }
        }
        goto LABEL_16;
      }
      if (xmlStrEqual(v14, (const xmlChar *)"subSection") || xmlStrEqual(v14, (const xmlChar *)"pBdrGroup"))
      {
        +[WXText createChildrenFromStream:a3 baseStyle:v32 to:v9 state:v10];
      }
      else if (xmlStrEqual(v14, (const xmlChar *)"annotation"))
      {
        [v10 addText:v9 node:xmlTextReaderExpand(a3)];
      }
      else
      {
        if (xmlStrEqual(v14, (const xmlChar *)"sectPr"))
        {
          v22 = [v10 cancelDelegate];
          int v23 = [v22 isCancelled];

          if (v23) {
            +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
          }
          xmlNodePtr v24 = xmlTextReaderExpand(a3);
          uint64_t v19 = [v10 document];
          uint64_t v25 = [(OCXSStream *)v19 lastSection];
          xmlNodePtr v26 = v24;
          v27 = (void *)v25;
          +[WXSection readFrom:v26 to:v25 state:v10];
          goto LABEL_26;
        }
        if (xmlStrEqual(v14, (const xmlChar *)"bookmarkStart"))
        {
          [v10 addPendingBookmark:xmlTextReaderExpand(a3)];
        }
        else if (xmlStrEqual(v14, (const xmlChar *)"bookmarkEnd"))
        {
          uint64_t v19 = [v9 lastBlock];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = [(OCXSStream *)v19 addBookmark];
            +[WXBookmark readFrom:xmlTextReaderExpand(a3) to:v27 state:v10];
LABEL_26:

            goto LABEL_16;
          }
          [v10 addPendingBookmark:xmlTextReaderExpand(a3)];
LABEL_16:
        }
        else
        {
          if (xmlStrEqual(v14, (const xmlChar *)"commentRangeStart"))
          {
            uint64_t v28 = objc_opt_class();
            v29 = [v9 lastBlock];
            TSUDynamicCast(v28, (uint64_t)v29);
            uint64_t v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              uint64_t v19 = [v9 addParagraph];
            }
            +[WXAnnotation readFrom:xmlTextReaderExpand(a3) to:v19 type:0 state:v10];
            goto LABEL_16;
          }
          if (xmlStrEqual(v14, (const xmlChar *)"commentRangeEnd"))
          {
            uint64_t v30 = objc_opt_class();
            v31 = [v9 lastBlock];
            TSUDynamicCast(v30, (uint64_t)v31);
            uint64_t v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              uint64_t v19 = [v9 addParagraph];
            }
            +[WXAnnotation readFrom:xmlTextReaderExpand(a3) to:v19 type:1 state:v10];
            goto LABEL_16;
          }
        }
      }
    }
  }
}

+ (void)readFromParagraph:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v25 = a5;
  id v10 = a6;
  xmlNodePtr v26 = v9;
  if ([v9 type] != 1)
  {

    xmlNodePtr v26 = 0;
  }
  if (a3)
  {
    v11 = [v25 addParagraph];
    uint64_t v12 = [v10 pendingComments];
    xmlNodePtr v24 = (void *)[v12 copy];
    int v23 = a3;

    [v10 clearPendingComments];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v24;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "pointerValue", v23), v11, 0, v10);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }

    [v10 pendingBookmarks];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "pointerValue", v23);
          v22 = [v11 addBookmark];
          +[WXBookmark readFrom:v21 to:v22 state:v10];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v18);
    }

    [v10 clearPendingBookmarks];
    +[WXParagraph readFrom:v23 baseStyle:v26 to:v11 state:v10];
  }
}

+ (id)addNewSectionTo:(id)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [a3 lastBlock];
  if ([v6 blockType]) {
    [v6 blockType];
  }
  else {
    +[WXParagraph readFromString:@"\f" to:v6];
  }
  [v5 setNewSectionRequested:0];
  v7 = [v5 document];
  id v8 = [v7 addSection];
  id v9 = [v8 text];

  return v9;
}

+ (void)readFromTable:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  if (!a3) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v11 = [v9 addTable];
  +[WXTable readFrom:a3 to:v11 state:v10];
}

+ (void)updateTextBoxIdsFromState:(id)a3
{
  id v3 = a3;
  v4 = [v3 wxoavState];
  id v5 = [v4 nextVmlShapeIdToTextBoxMap];
  long long v28 = [v5 keyEnumerator];
  char v6 = 1;
  while (1)
  {

    v4 = [v28 nextObject];
    if (!v4) {
      break;
    }
    v7 = [v3 wxoavState];
    id v8 = [v7 nextVmlShapeIdToTextBoxMap];
    id v5 = [v8 objectForKey:v4];

    id v9 = [v3 wxoavState];
    unsigned int v10 = [v9 officeArtShapeIdWithVmlShapeId:v4];

    [v5 setNextTextBoxId:v10];
    uint64_t v11 = objc_opt_class();
    id v12 = [v3 drawingState];
    id v13 = objc_msgSend(v12, "drawableForShapeId:", objc_msgSend(v5, "nextTextBoxId"));
    uint64_t v14 = [v13 clientData];
    uint64_t v15 = TSUDynamicCast(v11, (uint64_t)v14);

    uint64_t v16 = objc_opt_class();
    id v17 = [v15 textBox];
    uint64_t v18 = TSUDynamicCast(v16, (uint64_t)v17);

    uint64_t v19 = [v5 nextTextBoxId];
    uint64_t v20 = [v5 parent];
    uint64_t v21 = [v20 drawable];
    int v22 = [v21 id];

    if (v19 == v22 || v18 == v5) {
      objc_msgSend(v5, "setNextTextBoxId:", 0, v28);
    }
    int v23 = objc_msgSend(v5, "flowId", v28);
    if (v23)
    {
      xmlNodePtr v24 = [v5 flowSequence];
      BOOL v25 = v24 == 0;

      v6 &= v25;
    }
  }
  if (v6)
  {
    xmlNodePtr v26 = [v3 wxoavState];
    long long v27 = [v26 nextVmlShapeIdToTextBoxMap];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __45__WXText_Private__updateTextBoxIdsFromState___block_invoke;
    v29[3] = &unk_264D684A8;
    id v30 = v3;
    [v27 enumerateKeysAndObjectsUsingBlock:v29];
  }
}

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v8 = a4;
  id v5 = [v8 document];
  char v6 = [v5 addSection];
  v7 = [v6 text];
  +[WXText readFrom:a3 baseStyle:0 to:v7 state:v8];

  +[WXText updateTextBoxIdsFromState:v8];
}

+ (void)readFromString:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v5 = [a4 addParagraph];
  +[WXParagraph readFromString:v6 to:v5];
}

void __45__WXText_Private__updateTextBoxIdsFromState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  id v6 = [v5 flowId];
  if (!v6
    || ([v5 flowSequence],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    id v8 = v5;
    id v9 = NSNumber;
    unsigned int v10 = [v8 parent];
    uint64_t v11 = [v10 drawable];
    id v12 = objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v11, "id"));
    [v8 setFlowId:v12];

    [v8 setFlowSequence:&unk_26EC811E8];
    while ([v8 nextTextBoxId])
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [*(id *)(a1 + 32) drawingState];
      uint64_t v15 = objc_msgSend(v14, "drawableForShapeId:", objc_msgSend(v8, "nextTextBoxId"));
      uint64_t v16 = [v15 clientData];
      id v17 = TSUDynamicCast(v13, (uint64_t)v16);

      uint64_t v18 = objc_opt_class();
      uint64_t v19 = [v17 textBox];
      uint64_t v20 = TSUDynamicCast(v18, (uint64_t)v19);

      if (v20)
      {
        uint64_t v21 = NSNumber;
        int v22 = [v8 flowSequence];
        int v23 = objc_msgSend(v21, "numberWithUnsignedInt:", objc_msgSend(v22, "unsignedIntValue") + 1);
        [v20 setFlowSequence:v23];

        xmlNodePtr v24 = [v8 flowId];
        [v20 setFlowId:v24];
      }
      id v8 = v20;
    }
  }
}

@end