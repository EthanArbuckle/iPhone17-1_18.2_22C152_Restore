@interface EBGraphic
+ (id)readGraphicWithDictionary:(id)a3 state:(id)a4;
+ (id)readMainChartWithState:(id)a3;
+ (int)objectTypeForShape:(id)a3;
+ (void)readChart:(id)a3 chartIndex:(signed __int16)a4 state:(id)a5;
+ (void)readGraphicsInChart:(id)a3 state:(id)a4;
+ (void)readGraphicsWithState:(id)a3;
+ (void)readImage:(id)a3 xlGraphicsInfo:(void *)a4 state:(id)a5;
+ (void)readNotesWithDictionary:(id)a3 state:(id)a4;
+ (void)readOle:(id)a3 xlGraphicsInfo:(void *)a4 state:(id)a5;
@end

@implementation EBGraphic

+ (void)readGraphicsWithState:(id)a3
{
  id v8 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = (XlBinaryReader *)[v8 xlReader];
  v6 = [v8 edSheet];
  while (XlBinaryReader::hasMoreGraphics(v5))
  {
    v7 = [a1 readGraphicWithDictionary:v4 state:v8];
    [v6 addDrawable:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 readNotesWithDictionary:v4 state:v8];
  }
}

+ (void)readNotesWithDictionary:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  v18 = &unk_26EBDB180;
  uint64_t v7 = [v6 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v7 + 400))(v7, &v18);
  id v8 = v19;
  if (((v20 - (void)v19) & 0x7FFFFFFF8) != 0)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = v8[v9];
      v11 = objc_alloc_init(EDComment);
      [(EDComment *)v11 setRowIndex:*(unsigned __int16 *)(v10 + 32)];
      [(EDComment *)v11 setColumnIndex:*(__int16 *)(v10 + 34)];
      uint64_t v12 = *(void *)(v10 + 16);
      v13 = [v6 resources];
      v14 = +[EBString edStringFromXlString:v12 edResources:v13];
      [(EDComment *)v11 setAuthor:v14];

      [(EDComment *)v11 setVisible:*(unsigned __int8 *)(v10 + 38)];
      v15 = [NSNumber numberWithInt:*(__int16 *)(v10 + 36)];
      v16 = [v5 objectForKey:v15];

      if (v16)
      {
        objc_opt_class();
        v17 = [v16 clientData];
        [v17 setComment:v11];
      }
      ++v9;
      id v8 = v19;
    }
    while (v9 < ((unint64_t)(v20 - (void)v19) >> 3));
  }
  v18 = &unk_26EBDAF88;
  CsSimpleHeapVector<XlRecord>::~CsSimpleHeapVector((void **)&v19);
}

+ (id)readGraphicWithDictionary:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (XlBinaryReader *)[v7 xlReader];
  XlGraphicsInfo::XlGraphicsInfo((XlGraphicsInfo *)v33);
  (*(void (**)(XlBinaryReader *, unsigned char *))(*(void *)v8 + 440))(v8, v33);
  unint64_t v9 = [v7 readerState];
  uint64_t v10 = +[EBEscher readRootObjectWithType:3 state:v9];

  if (!v10) {
    goto LABEL_7;
  }
  v11 = 0;
  if ((v34 - 11) >= 0xA && v34 != 7)
  {
    if (v34 == 48)
    {
      uint64_t v12 = [v10 eshObject];
      if ((*(unsigned int (**)(uint64_t))(*(void *)v12 + 16))(v12) == 61445)
      {
        v32 = [v7 readerState];
        v13 = [v32 oaState];
        +[OABDrawing applyRulesFromSolverContainer:v10 state:v13];
        v11 = 0;
        goto LABEL_30;
      }
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    uint64_t v15 = [v10 eshObject];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v15 + 16))(v15) == 61442)
    {
      v32 = [v10 shapeContainer];
      if ((unint64_t)[v32 childCount] <= 1)
      {
        v11 = 0;
        goto LABEL_35;
      }
      uint64_t v16 = [v32 childAt:1];

      uint64_t v10 = (void *)v16;
    }
    if (v34 == 5) {
      [v10 setChart:1];
    }
    v17 = [v7 readerState];
    v18 = [v17 oaState];

    v32 = v18;
    v11 = +[OABDrawable readDrawableFromObject:v10 state:v18];
    int v19 = [v11 altId];
    if (v19 == -1)
    {
      uint64_t v20 = [v10 eshObject];
      if ((*(unsigned int (**)(uint64_t))(*(void *)v20 + 16))(v20) == 7)
      {
        if (EshShapeProperties::isHyperlinkSet((EshShapeProperties *)([v10 eshShape] + 424)))
        {
          uint64_t v21 = [v11 drawableProperties];
          v22 = objc_alloc_init(OADHyperlink);
          [v21 setClickHyperlink:v22];
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v11;
      [v18 pushGroup:v23];
      uint64_t v24 = [v10 eshObject];
      int v25 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 40))(v24);
      int v26 = v25 - 1;
      if (v25 != 1)
      {
        do
        {
          if (!XlBinaryReader::hasMoreGraphics(v8)) {
            break;
          }
          v27 = [a1 readGraphicWithDictionary:v6 state:v7];
          if (v27) {
            [v23 addChild:v27];
          }

          --v26;
        }
        while (v26);
      }
      id v28 = (id)[v32 popGroup];
    }
    if (v19 != -1)
    {
LABEL_28:
      if (!v11)
      {
LABEL_35:

        goto LABEL_8;
      }
      v13 = [NSNumber numberWithInt:v35];
      [v6 setObject:v11 forKey:v13];
LABEL_30:

      goto LABEL_35;
    }
    if (v39)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        [a1 readOle:v11 xlGraphicsInfo:v33 state:v7];
        goto LABEL_28;
      }
    }
    if (v34 == 8)
    {
      if (v38)
      {
        objc_opt_class();
        [a1 readImage:v11 xlGraphicsInfo:v33 state:v7];
        goto LABEL_28;
      }
    }
    else if (v34 == 5 && v37)
    {
      objc_opt_class();
      id v29 = v11;
      objc_msgSend(a1, "readChart:chartIndex:state:", v29, (__int16)objc_msgSend(v7, "nextChartIndex"), v7);
      goto LABEL_44;
    }
    if (!v36) {
      goto LABEL_28;
    }
    id v29 = [v11 clientData];
    v30 = [v7 resources];
    v31 = +[EBTextBox edTextBoxFromXlGraphicsInfo:v33 edResources:v30];

    [v29 setTextBox:v31];
LABEL_44:

    goto LABEL_28;
  }
LABEL_8:

  XlGraphicsInfo::~XlGraphicsInfo((XlGraphicsInfo *)v33);
  return v11;
}

+ (id)readMainChartWithState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHDChart);
  id v6 = objc_alloc_init(EDOfficeArtClient);
  -[EDOfficeArtClient setBounds:](v6, "setBounds:", 0.0, 0.0, 200.0, 200.0);
  [(OADDrawable *)v5 setClientData:v6];
  [a1 readChart:v5 chartIndex:0xFFFFFFFFLL state:v4];

  return v5;
}

+ (void)readChart:(id)a3 chartIndex:(signed __int16)a4 state:(id)a5
{
  signed int v6 = a4;
  id v11 = a3;
  id v7 = a5;
  id v8 = (XlChartBinaryReader *)[v7 xlReader];
  if ((__int16)XlChartBinaryReader::getChartCount(v8) > v6)
  {
    XlChartBinaryReader::setChart(v8, v6);
    +[CHBReader readChart:v11 state:v7];
    unint64_t v9 = objc_msgSend(v11, "clientData", XlChartBinaryReader::closeChart(v8));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v7 edSheet];
      [v9 setSheet:v10];
    }
  }
}

+ (void)readGraphicsInChart:(id)a3 state:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = (XlBinaryReader *)[v6 xlReader];
    while (XlBinaryReader::hasMoreGraphics(v8))
    {
      unint64_t v9 = [a1 readGraphicWithDictionary:v7 state:v6];
      [v10 addChild:v9];
    }
  }
}

+ (void)readOle:(id)a3 xlGraphicsInfo:(void *)a4 state:(id)a5
{
  id v16 = a3;
  id v7 = a5;
  uint64_t v8 = *((void *)a4 + 16);
  uint64_t v9 = [v7 xlReader];
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 88))(v9);
  if (v8)
  {
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v7 readerState];
      v13 = [v12 cancelDelegate];

      v14 = [NSString stringWithOcText:v8 + 8];
      uint64_t v15 = +[OABOle readFromParentStorage:v11 storageName:v14 cancel:v13];

      [v16 setOle:v15];
    }
  }
}

+ (void)readImage:(id)a3 xlGraphicsInfo:(void *)a4 state:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  XlBinaryData::XlBinaryData((XlBinaryData *)&v22);
  unsigned int v9 = *((_DWORD *)a4 + 28);
  uint64_t v10 = [MEMORY[0x263EFF990] dataWithCapacity:v9];
  int v11 = *((_DWORD *)a4 + 29);
  if (v11 == 2)
  {
    if (*((_DWORD *)a4 + 30) == 1) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 6;
    }
  }
  else
  {
    uint64_t v12 = v11 == 9;
  }
  OcBinaryData::setMinimumCapacity(&v23, 0x1000u);
  unsigned int v13 = 0;
  int v24 = *((_DWORD *)a4 + 27);
  unsigned int v25 = v9;
  __int16 v26 = 127;
  while (1)
  {
    v23.var1 = v13;
    if (v13 >= v9) {
      break;
    }
    uint64_t v14 = [v8 xlReader];
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v14 + 144))(v14, &v22);
    unsigned int var3 = v23.var3;
    if (!v23.var3) {
      break;
    }
    v13 += v23.var3;
    unsigned int v16 = v9 - v13;
    if (v9 < v13)
    {
      unsigned int var3 = v16 + v23.var3;
      OcBinaryData::setMinimumCapacity(&v23, v16 + v23.var3);
      v23.unsigned int var3 = var3;
    }
    [v10 appendBytes:v23.var5 length:var3];
  }
  v17 = [v7 imageProperties];
  v18 = [v17 imageFill];
  int v19 = [v18 blipRef];
  uint64_t v20 = [[OADSubBlip alloc] initWithData:v10 type:v12];
  uint64_t v21 = objc_alloc_init(OADBlip);
  [(OADBlip *)v21 setMainSubBlip:v20];
  [v19 setBlip:v21];

  OcBinaryData::~OcBinaryData(&v23);
}

+ (int)objectTypeForShape:(id)a3
{
  int result = EshShapeProperties::getShapeType((EshShapeProperties *)([a3 eshShape] + 424));
  if (result > 19)
  {
    if (result > 200)
    {
      if (result == 201) {
        return 5;
      }
      if (result == 202) {
        return 6;
      }
    }
    else
    {
      if (result == 20) {
        return 1;
      }
      if (result == 75) {
        return 8;
      }
    }
  }
  else if (result > 2)
  {
    if (result == 3) {
      return result;
    }
    if (result == 19) {
      return 4;
    }
  }
  else
  {
    if ((result - 1) < 2) {
      return 2;
    }
    if (!result) {
      return 9;
    }
  }
  return 30;
}

@end