@interface OABDrawable
+ (id)readDrawableFromObject:(id)a3 state:(id)a4;
+ (id)readDrawableFromZipPackageData:(const CsData *)a3 foundInObject:(id)a4 state:(id)a5;
+ (id)readDrawablesFromContainer:(id)a3 state:(id)a4;
+ (void)setUpXmlDrawingState:(id)a3 withBinaryReaderState:(id)a4 targetDocument:(id)a5 colorMap:(id)a6;
@end

@implementation OABDrawable

+ (id)readDrawablesFromContainer:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [v6 childCount];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [v6 childAt:i];
      v12 = [a1 readDrawableFromObject:v11 state:v7];

      if (v12) {
        [v8 addObject:v12];
      }
    }
  }

  return v8;
}

+ (id)readDrawableFromObject:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 eshObject];
  int v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
  if (v8 == 7)
  {
    uint64_t v15 = +[OABShape readShape:v5 state:v6];
LABEL_13:
    v14 = (void *)v15;
    goto LABEL_14;
  }
  if (v8 != 61443)
  {
    v14 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend((id)objc_msgSend(v6, "client"), "tablesAreAllowed"))
  {
LABEL_12:
    uint64_t v15 = +[OABGroup readGroup:v5 state:v6];
    goto LABEL_13;
  }
  uint64_t v9 = objc_opt_class();
  v10 = TSUDynamicCast(v9, (uint64_t)v5);
  uint64_t v11 = [v10 eshGroup];
  if (!v11
    || (v12 = (EshGroupProperties *)(v11 + 288),
        !EshGroupProperties::isTablePropertiesSet((EshGroupProperties *)(v11 + 288))))
  {

    goto LABEL_12;
  }
  int v13 = *(unsigned __int8 *)EshGroupProperties::getTableProperties(v12);

  if (!v13) {
    goto LABEL_12;
  }
  v14 = +[OABTable readTable:v5 state:v6];
  if (!v14) {
    goto LABEL_12;
  }
LABEL_14:

  return v14;
}

+ (void)setUpXmlDrawingState:(id)a3 withBinaryReaderState:(id)a4 targetDocument:(id)a5 colorMap:(id)a6
{
  id v21 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 theme];
  int v13 = [v12 baseStyles];
  v14 = [v13 styleMatrix];
  [v21 setStyleMatrix:v14];

  uint64_t v15 = [v12 baseStyles];
  v16 = [v15 colorScheme];
  [v21 setColorScheme:v16];

  [v21 setColorMap:v11];
  v17 = [v12 baseStyles];
  v18 = [v17 fontScheme];
  [v21 setFontScheme:v18];

  v19 = [v10 blips];
  [v21 setTargetBlipCollection:v19];

  v20 = [v9 groupStackReference];
  [v21 replaceGroupStack:v20];
}

+ (id)readDrawableFromZipPackageData:(const CsData *)a3 foundInObject:(id)a4 state:(id)a5
{
  v29[5] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  char v9 = [v8 useXmlBlobs];
  if (a3) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  if ((v10 & 1) != 0
    && a3->var1
    && (OCPNewZipPackageWithCsData((CsData *)a3), (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v29[0] = @"http://schemas.microsoft.com/office/2006/relationships/shapeXml";
    v29[1] = @"http://schemas.microsoft.com/office/2006/relationships/connectorXml";
    v29[2] = @"http://schemas.microsoft.com/office/2006/relationships/pictureXml";
    v29[3] = @"http://schemas.microsoft.com/office/2006/relationships/graphicFrameDoc";
    v29[4] = @"http://schemas.microsoft.com/office/2006/relationships/groupShapeXml";
    [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:5];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v17 = objc_msgSend(v11, "relationshipsByType:", v16, (void)v24);
          if ([v17 count])
          {
            objc_opt_class();
            id v21 = [v11 partByRelationshipType:v16];
            v22 = objc_msgSend((id)objc_msgSend(v8, "client"), "readDrawableFromPackagePart:foundInObject:state:", v21, v7, v8);
            v18 = v22;
            if (v22)
            {
              objc_msgSend(v22, "setAltId:", objc_msgSend(v22, "id"));
              uint64_t v23 = [v7 shapeID];
              [v18 setId:v23];
              [v8 setDrawable:v18 forShapeId:v23];
            }

            goto LABEL_23;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    v18 = 0;
LABEL_23:

    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

@end