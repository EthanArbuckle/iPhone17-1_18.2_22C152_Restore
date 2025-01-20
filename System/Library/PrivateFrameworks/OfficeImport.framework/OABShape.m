@interface OABShape
+ (id)readShape:(id)a3 state:(id)a4;
+ (id)readShapeFromBinary:(id)a3 state:(id)a4;
+ (id)readShapeFromXml:(id)a3 state:(id)a4;
+ (void)readGraphicDefaults:(id)a3 to:(id)a4 state:(id)a5;
@end

@implementation OABShape

+ (void)readGraphicDefaults:(id)a3 to:(id)a4 state:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (const void *)[v15 eshObject];
  if (v9)
  {
    if (v10)
    {
      v11 = [[OABShapeBaseManager alloc] initWithShapeBase:v10 shapeType:1 masterShape:0];
      v12 = +[OABFill readFillFromFillPropertiesManager:v11 state:v8];
      [v7 setFill:v12];

      v13 = +[OABStroke readStrokeFromShapeBaseManager:v11 state:v8];
      [v7 setStroke:v13];

      v14 = +[OABShadow readShadowFromShapeBaseManager:v11 state:v8];
      [v7 setEffects:v14];
    }
  }
}

+ (id)readShape:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 readShapeFromXml:v6 state:v7];
  if (!v8) {
    goto LABEL_4;
  }
  uint64_t v9 = objc_opt_class();
  v10 = TSUDynamicCast(v9, (uint64_t)v8);
  if (v10)
  {

LABEL_4:
    id v11 = +[OABShape readShapeFromBinary:v6 state:v7];
    goto LABEL_6;
  }
  id v11 = v8;
LABEL_6:
  v12 = v11;

  return v12;
}

+ (id)readShapeFromBinary:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v34 = v5;
  uint64_t v7 = [v5 eshShape];
  v33 = (EshContentProperties *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 160))(v7);
  uint64_t v8 = [v5 eshShape];
  if ([v5 isChart])
  {
    uint64_t v9 = 0;
    v10 = objc_alloc_init(CHDChart);
  }
  else
  {
    id v11 = (EshShapeImageData *)(v8 + 480);
    if ((EshShapeImageData::isBlipSet(v11) & 1) == 0
      && (EshShapeImageData::isBlipNameSet(v11) & 1) == 0
      && EshShapeProperties::getShapeType((EshShapeProperties *)(v7 + 424)) != 75)
    {
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    v10 = objc_alloc_init(OADImage);
    uint64_t v9 = v10;
  }
  v12 = v10;
  if (v10)
  {
    v13 = 0;
    goto LABEL_13;
  }
LABEL_10:
  int isConnector = EshShape::isConnector((EshShape *)v7);
  id v15 = off_264D60510;
  if (!isConnector) {
    id v15 = off_264D60548;
  }
  v13 = (CHDChart *)objc_alloc_init(*v15);
  v12 = v13;
LABEL_13:
  if (EshShapeProperties::isMasterIdSet((EshShapeProperties *)(v7 + 424)))
  {
    uint64_t MasterId = EshShapeProperties::getMasterId((EshShapeProperties *)(v7 + 424));
    v17 = [v6 drawableForShapeId:MasterId];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(OADGraphic *)v12 setMasterGraphic:v17];
    }
    v18 = [v6 contentObjectForId:MasterId];
    uint64_t v19 = [v18 eshObject];
    if (v19 && (*(unsigned int (**)(uint64_t))(*(void *)v19 + 16))(v19) == 7) {
      uint64_t v20 = [v18 eshShape];
    }
    else {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  +[OABContent readFromContentObject:v34 toDrawable:v12 state:v6];
  v21 = [(OADGraphic *)v12 graphicProperties];
  v22 = [[OABShapeManager alloc] initWithShape:v7 masterShape:v20];
  v23 = +[OABFill readFillFromFillPropertiesManager:v22 state:v6];
  [v21 setFill:v23];

  if ([(OABShapeManager *)v22 isTextPath])
  {
    +[OABWordArt readFromShapeManager:v22 toShape:v13 state:v6];
  }
  else
  {
    if (v13) {
      +[OABShapeGeometry readFromShape:v7 toShape:v13];
    }
    v24 = +[OABStroke readStrokeFromShapeBaseManager:v22 state:v6];
    [v21 setStroke:v24];

    v25 = +[OABShadow readShadowFromShapeBaseManager:v22 state:v6];
    [v21 setEffects:v25];

    if (v9) {
      +[OABImage readfromShape:v34 toImage:v9 state:v6];
    }
  }
  if (EshContentProperties::isBehindTextSet(v33)) {
    [v21 setIsBehindText:EshContentProperties::getBehindText(v33)];
  }
  if (EshShapeProperties::isAltSet((EshShapeProperties *)(v7 + 424)))
  {
    v26 = (void *)[[NSString alloc] initWithCsString:EshShapeProperties::getAlt((EshShapeProperties *)(v7 + 424))];
    [v21 setAltTitle:v26];
  }
  [(OADDrawable *)v12 setDrawableProperties:v21];
  objc_msgSend((id)objc_msgSend(v6, "client"), "readClientDataFromShape:toGraphic:state:", v34, v12, v6);
  if (v13 && ![(OABShapeManager *)v22 isTextPath])
  {
    v32 = v13;
    v27 = [(CHDChart *)v13 textBody];
    v28 = [v27 properties];
    v29 = [(OADGraphic *)v13 masterGraphic];
    +[OABTextBodyProperties readTextBodyProperties:v28 textBox:v7 + 272 useDefaults:v29 == 0 state:v6];

    v13 = v32;
  }
  [(OADDrawable *)v12 setHidden:[(OABShapeManager *)v22 hidden]];
  v30 = v12;

  return v30;
}

+ (id)readShapeFromXml:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 eshShape];
  if (objc_msgSend((id)objc_msgSend(v6, "client"), "xmlEquivalentOfDrawableCanBeUsed")
    && (uint64_t v8 = (EshContentProperties *)(v7 + 424), EshContentProperties::isXmlEquivalentSet(v8)))
  {
    uint64_t v9 = +[OABDrawable readDrawableFromZipPackageData:EshContentProperties::getXmlEquivalent(v8) foundInObject:v5 state:v6];
    if (v9) {
      objc_opt_class();
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end