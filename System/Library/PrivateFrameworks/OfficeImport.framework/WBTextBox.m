@interface WBTextBox
+ (void)checkForOleObject:(id)a3;
+ (void)readFrom:(void *)a3 parent:(id)a4 reader:(id)a5;
+ (void)readTextFrom:(id)a3 to:(id)a4 chain:(unsigned __int16)a5;
@end

@implementation WBTextBox

+ (void)readFrom:(void *)a3 parent:(id)a4 reader:(id)a5
{
  id v42 = a4;
  id v7 = a5;
  v8 = (EshTextBox *)((char *)a3 + 272);
  int isTextIDSet = EshTextBox::isTextIDSet((EshTextBox *)((char *)a3 + 272));
  if (isTextIDSet)
  {
    unsigned int TextID = EshTextBox::getTextID((EshTextBox *)((char *)a3 + 272));
  }
  else
  {
    v10 = (EshShapeImageData *)((char *)a3 + 480);
    if (!EshShapeImageData::isOLEIDSet(v10)) {
      goto LABEL_19;
    }
    unsigned int TextID = EshShapeImageData::getOLEID(v10);
  }
  if (TextID != -1)
  {
    v41 = objc_alloc_init(WDATextBox);
    v11 = [v7 targetDocument];
    [v42 setTextBox:v41 document:v11];

    [(WDATextBox *)v41 setOle:isTextIDSet ^ 1u];
    [(WDATextBox *)v41 setParent:v42];
    v12 = [v7 targetDocument];
    [(WDATextBox *)v41 setDocument:v12];

    v13 = [v42 drawable];
    int v14 = [v13 id];

    if (EshTextBox::isNextTextboxSet(v8))
    {
      unsigned int NextTextbox = EshTextBox::getNextTextbox(v8);
      if (NextTextbox == v14) {
        unsigned int v16 = 0;
      }
      else {
        unsigned int v16 = NextTextbox;
      }
    }
    else
    {
      unsigned int v16 = 0;
    }
    [(WDATextBox *)v41 setNextTextBoxId:v16];
    v17 = [v42 drawable];
    v18 = [v7 previousFlowElement];
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[WDATextBox nextTextBoxId](v41, "nextTextBoxId"));
    [v18 setObject:v17 forKeyedSubscript:v19];

    v20 = [v7 previousFlowElement];
    v21 = NSNumber;
    v22 = [v42 drawable];
    v23 = objc_msgSend(v21, "numberWithUnsignedInt:", objc_msgSend(v22, "id"));
    v24 = [v20 objectForKeyedSubscript:v23];

    if (!v24)
    {
      v25 = NSNumber;
      v26 = [v42 drawable];
      v27 = objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v26, "id"));
      [(WDATextBox *)v41 setFlowId:v27];

      [(WDATextBox *)v41 setFlowSequence:&unk_26EC811B8];
      v24 = [v42 drawable];
    }
    v39 = [v24 clientData];
    for (i = [v39 textBox];
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = [v7 officeArtState];
      v31 = objc_msgSend(v30, "drawableForShapeId:", objc_msgSend(i, "nextTextBoxId"));
      v32 = TSUCheckedDynamicCast(v29, (uint64_t)v31);

      if (!v32) {
        break;
      }
      v33 = [v32 clientData];
      v34 = [v33 textBox];
      v35 = [i flowId];
      [v34 setFlowId:v35];

      v36 = NSNumber;
      v37 = [i flowSequence];
      v38 = objc_msgSend(v36, "numberWithUnsignedInt:", objc_msgSend(v37, "unsignedIntValue") + 1);
      [v34 setFlowSequence:v38];
    }
    if (!(_WORD)TextID) {
      [v7 cacheTextBox:v41 withChainIndex:HIWORD(TextID)];
    }
  }
LABEL_19:
}

+ (void)readTextFrom:(id)a3 to:(id)a4 chain:(unsigned __int16)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 parent];
  int v11 = [v10 textType];

  if (v11 == 2) {
    v12 = (WrdBookmarkTable *)[v8 headerStoryTable];
  }
  else {
    v12 = (WrdBookmarkTable *)[v8 storyTable];
  }
  if (v5 - 1 < ((*((void *)v12 + 3) - *((void *)v12 + 2)) >> 3))
  {
    uint64_t v13 = *(void *)(WrdBookmarkTable::getBookmark(v12, v5 - 1) + 8);
    v22 = &unk_26EBE4AC0;
    int v14 = [v9 parent];
    int v15 = [v14 textType];

    if (v15 == 2) {
      int v16 = 7;
    }
    else {
      int v16 = 6;
    }
    unsigned int v23 = v16;
    uint64_t v24 = v13;
    v17 = [v9 text];

    if (!v17)
    {
      v18 = [WDText alloc];
      v19 = [v9 document];
      v20 = [(WDText *)v18 initWithDocument:v19 textType:v23];

      [v9 setText:v20];
    }
    v21 = [v9 text];
    +[WBText readFrom:v8 text:v21 textRun:&v22];

    [a1 checkForOleObject:v9];
  }
}

+ (void)checkForOleObject:(id)a3
{
  id v23 = a3;
  if ([v23 isOle])
  {
    v3 = [v23 text];
    uint64_t v4 = [v3 blockCount];

    if (v4 != 1)
    {
      v18 = [v23 text];
      uint64_t v19 = [v18 blockCount];

      if (v19 != 2) {
        goto LABEL_39;
      }
      v20 = [v23 text];
      v6 = [v20 blockAt:1];

      if ([v6 blockType]) {
        goto LABEL_38;
      }
      id v7 = v6;
      if ((unint64_t)[v7 runCount] > 1) {
        goto LABEL_37;
      }
      if ([v7 runCount] == 1)
      {
        int v11 = [v7 runAt:0];
        if ([v11 runType])
        {
LABEL_36:

          goto LABEL_37;
        }
        v21 = [v11 string];
        uint64_t v22 = [v21 length];

        if (v22)
        {
LABEL_37:

          v6 = v7;
          goto LABEL_38;
        }
      }
    }
    int v5 = [v23 text];
    v6 = [v5 blockAt:0];

    if ([v6 blockType])
    {
LABEL_38:

      goto LABEL_39;
    }
    id v7 = v6;
    unint64_t v8 = [v7 runCount];
    if (v8)
    {
      uint64_t v9 = 0;
      int v10 = 0;
      int v11 = 0;
      while (2)
      {
        v12 = [v7 runAt:v9];
        int v13 = [v12 runType];
        switch(v10)
        {
          case 0:
            if (v13 == 7 && [v12 fieldMarkerType] == 19) {
              goto LABEL_14;
            }
            goto LABEL_27;
          case 1:
            if (v13)
            {
              if (v13 != 7 || [v12 fieldMarkerType] != 20) {
                goto LABEL_27;
              }
LABEL_19:
              int v10 = 2;
            }
            else
            {
LABEL_14:
              int v10 = 1;
            }
LABEL_22:

            if (++v9 < v8) {
              continue;
            }
            if (v10 == 3 && v11)
            {
              int v15 = [v23 parent];
              v12 = [v15 drawable];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v16 = [v11 drawable];
                v17 = [v16 ole];
                [v12 setOle:v17];
              }
LABEL_27:
            }
            break;
          case 2:
            switch(v13)
            {
              case 12:
                goto LABEL_19;
              case 7:
                if ([v12 fieldMarkerType] != 21) {
                  goto LABEL_27;
                }
                int v10 = 3;
                break;
              case 5:
                id v14 = v12;

                int v10 = 2;
                int v11 = v14;
                break;
              default:
                goto LABEL_27;
            }
            goto LABEL_22;
          case 3:
            goto LABEL_27;
          default:
            goto LABEL_22;
        }
        break;
      }
    }
    else
    {
      int v11 = 0;
    }
    goto LABEL_36;
  }
LABEL_39:
}

@end