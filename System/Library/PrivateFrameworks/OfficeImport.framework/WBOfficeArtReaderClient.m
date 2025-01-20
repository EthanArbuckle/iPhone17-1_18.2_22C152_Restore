@interface WBOfficeArtReaderClient
+ (BOOL)allowOverlap:(EshContentProperties *)a3;
+ (BOOL)behindText:(EshContentProperties *)a3;
+ (BOOL)escherIsFullySupported;
+ (BOOL)tablesAreAllowed;
+ (BOOL)xmlEquivalentOfDrawableCanBeUsed;
+ (double)wrapDistanceBottom:(EshContentProperties *)a3;
+ (double)wrapDistanceLeft:(EshContentProperties *)a3;
+ (double)wrapDistanceRight:(EshContentProperties *)a3;
+ (double)wrapDistanceTop:(EshContentProperties *)a3;
+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5;
+ (int)horizontalPosition:(EshContentProperties *)a3;
+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4;
+ (int)relativeHorizontalPosition:(EshContentProperties *)a3;
+ (int)relativeVerticalPosition:(EshContentProperties *)a3;
+ (int)verticalPosition:(EshContentProperties *)a3;
+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5;
+ (void)readClientDataFromObject:(id)a3 toDrawable:(id)a4 state:(id)a5;
+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 includeText:(BOOL)a5 state:(id)a6;
+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5;
+ (void)readFrom:(EshContentProperties *)a3 to:(id)a4;
@end

@implementation WBOfficeArtReaderClient

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5
{
}

+ (void)readFrom:(EshContentProperties *)a3 to:(id)a4
{
  id v6 = a4;
  objc_msgSend(v6, "setHorizontalPosition:", objc_msgSend(a1, "horizontalPosition:", a3));
  objc_msgSend(v6, "setRelativeHorizontalPosition:", objc_msgSend(a1, "relativeHorizontalPosition:", a3));
  objc_msgSend(v6, "setVerticalPosition:", objc_msgSend(a1, "verticalPosition:", a3));
  objc_msgSend(v6, "setRelativeVerticalPosition:", objc_msgSend(a1, "relativeVerticalPosition:", a3));
  [a1 wrapDistanceLeft:a3];
  objc_msgSend(v6, "setWrapDistanceLeft:");
  [a1 wrapDistanceTop:a3];
  objc_msgSend(v6, "setWrapDistanceTop:");
  [a1 wrapDistanceRight:a3];
  objc_msgSend(v6, "setWrapDistanceRight:");
  [a1 wrapDistanceBottom:a3];
  objc_msgSend(v6, "setWrapDistanceBottom:");
  objc_msgSend(v6, "setAllowOverlap:", objc_msgSend(a1, "allowOverlap:", a3));
  objc_msgSend(v6, "setZIndex:", objc_msgSend(v6, "zIndex") + 2);
  if ([a1 behindText:a3]) {
    objc_msgSend(v6, "setZIndex:", objc_msgSend(v6, "zIndex") - 503316480);
  }
}

+ (int)horizontalPosition:(EshContentProperties *)a3
{
  isPositionHorizontalSet = (EshContentProperties *)EshContentProperties::isPositionHorizontalSet(a3);
  if (isPositionHorizontalSet) {
    int result = EshContentProperties::getPositionHorizontal(a3);
  }
  else {
    int result = EshContentProperties::getDefaultPositionHorizontal(isPositionHorizontalSet);
  }
  if ((result - 1) >= 5) {
    return 0;
  }
  return result;
}

+ (int)relativeHorizontalPosition:(EshContentProperties *)a3
{
  isPositionHorizontalRelativeSet = (EshContentProperties *)EshContentProperties::isPositionHorizontalRelativeSet(a3);
  if (isPositionHorizontalRelativeSet) {
    int result = EshContentProperties::getPositionHorizontalRelative(a3);
  }
  else {
    int result = EshContentProperties::getDefaultPositionHorizontalRelative(isPositionHorizontalRelativeSet);
  }
  if (result >= 4) {
    return 2;
  }
  return result;
}

+ (int)verticalPosition:(EshContentProperties *)a3
{
  isPositionVerticalSet = (EshContentProperties *)EshContentProperties::isPositionVerticalSet(a3);
  if (isPositionVerticalSet) {
    int result = EshContentProperties::getPositionVertical(a3);
  }
  else {
    int result = EshContentProperties::getDefaultPositionHorizontal(isPositionVerticalSet);
  }
  if ((result - 1) >= 5) {
    return 0;
  }
  return result;
}

+ (int)relativeVerticalPosition:(EshContentProperties *)a3
{
  isPositionVerticalRelativeSet = (EshContentProperties *)EshContentProperties::isPositionVerticalRelativeSet(a3);
  if (isPositionVerticalRelativeSet) {
    int result = EshContentProperties::getPositionVerticalRelative(a3);
  }
  else {
    int result = EshContentProperties::getDefaultPositionHorizontalRelative(isPositionVerticalRelativeSet);
  }
  if (result >= 4) {
    return 2;
  }
  return result;
}

+ (double)wrapDistanceLeft:(EshContentProperties *)a3
{
  isWrapDistanceLeftSet = (EshContentProperties *)EshContentProperties::isWrapDistanceLeftSet(a3);
  if (isWrapDistanceLeftSet) {
    int WrapDistanceLeft = EshContentProperties::getWrapDistanceLeft(a3);
  }
  else {
    int WrapDistanceLeft = EshContentProperties::getDefaultWrapDistanceLeft(isWrapDistanceLeftSet);
  }
  return (double)WrapDistanceLeft / 12700.0;
}

+ (double)wrapDistanceTop:(EshContentProperties *)a3
{
  isWrapDistanceTopSet = (EshContentProperties *)EshContentProperties::isWrapDistanceTopSet(a3);
  if (isWrapDistanceTopSet) {
    int WrapDistanceTop = EshContentProperties::getWrapDistanceTop(a3);
  }
  else {
    int WrapDistanceTop = EshContentProperties::getDefaultPositionHorizontal(isWrapDistanceTopSet);
  }
  return (double)WrapDistanceTop / 12700.0;
}

+ (double)wrapDistanceRight:(EshContentProperties *)a3
{
  isWrapDistanceRightSet = (EshContentProperties *)EshContentProperties::isWrapDistanceRightSet(a3);
  if (isWrapDistanceRightSet) {
    int WrapDistanceRight = EshContentProperties::getWrapDistanceRight(a3);
  }
  else {
    int WrapDistanceRight = EshContentProperties::getDefaultWrapDistanceLeft(isWrapDistanceRightSet);
  }
  return (double)WrapDistanceRight / 12700.0;
}

+ (double)wrapDistanceBottom:(EshContentProperties *)a3
{
  isWrapDistanceBottomSet = (EshContentProperties *)EshContentProperties::isWrapDistanceBottomSet(a3);
  if (isWrapDistanceBottomSet) {
    int WrapDistanceBottom = EshContentProperties::getWrapDistanceBottom(a3);
  }
  else {
    int WrapDistanceBottom = EshContentProperties::getDefaultPositionHorizontal(isWrapDistanceBottomSet);
  }
  return (double)WrapDistanceBottom / 12700.0;
}

+ (BOOL)allowOverlap:(EshContentProperties *)a3
{
  isAllowOverlapSet = (EshContentProperties *)EshContentProperties::isAllowOverlapSet(a3);
  if (isAllowOverlapSet)
  {
    return EshContentProperties::getAllowOverlap(a3);
  }
  else
  {
    return EshContentProperties::getDefaultAllowOverlap(isAllowOverlapSet);
  }
}

+ (BOOL)behindText:(EshContentProperties *)a3
{
  isBehindTextSet = (EshContentProperties *)EshContentProperties::isBehindTextSet(a3);
  if (isBehindTextSet)
  {
    return EshContentProperties::getBehindText(a3);
  }
  else
  {
    return EshContentProperties::getDefaultPositionHorizontal(isBehindTextSet);
  }
}

+ (BOOL)escherIsFullySupported
{
  return 0;
}

+ (BOOL)tablesAreAllowed
{
  return 0;
}

+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(WDAContent);
  [v8 setClientData:v10];
  [(WDAContent *)v10 setDrawable:v8];
  objc_opt_class();
  id v11 = v9;
  -[WDAContent setTextType:](v10, "setTextType:", [v11 currentTextType]);

  if (+[OABReaderClient sourceDrawableIsTopLevel:v16])
  {
    id v12 = [(WDAContent *)v10 createAnchor];
    uint64_t v13 = [v16 eshGroup];
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 136))(v13);
    v15 = [(WDAContent *)v10 anchor];
    [a1 readFrom:v14 to:v15];
  }
}

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 includeText:(BOOL)a5 state:(id)a6
{
  BOOL v7 = a5;
  id v20 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(WDAContent);
  [v10 setClientData:v12];
  [(WDAContent *)v12 setDrawable:v10];
  objc_opt_class();
  id v13 = v11;
  -[WDAContent setTextType:](v12, "setTextType:", [v13 currentTextType]);

  uint64_t v14 = (const void *)[v20 eshShape];
  if (+[OABReaderClient sourceDrawableIsTopLevel:v20])
  {
    id v15 = [(WDAContent *)v12 createAnchor];
    uint64_t v16 = (*(uint64_t (**)(const void *))(*(void *)v14 + 168))(v14);
    v17 = [(WDAContent *)v12 anchor];
    [a1 readFrom:v16 to:v17];
  }
  if (v7)
  {
    if (v14) {
    else
    }
      v18 = 0;
    objc_opt_class();
    v19 = [v13 reader];
    +[WBTextBox readFrom:v18 parent:v12 reader:v19];
  }
}

+ (BOOL)xmlEquivalentOfDrawableCanBeUsed
{
  return 0;
}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4
{
  return -1;
}

+ (void)readClientDataFromObject:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = TSUDynamicCast(v11, (uint64_t)v9);
  objc_opt_class();
  if (v12)
  {
    id v13 = v8;
    [a1 readClientDataFromGroup:v13 toGroup:v12 state:v10];
    uint64_t v14 = [v12 children];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__WBOfficeArtReaderClient_readClientDataFromObject_toDrawable_state___block_invoke;
    v16[3] = &unk_264D68370;
    id v19 = a1;
    id v15 = v13;
    id v17 = v15;
    id v18 = v10;
    [v14 enumerateObjectsUsingBlock:v16];
  }
  else
  {
    [a1 readClientDataFromShape:v8 toGraphic:v9 includeText:1 state:v10];
  }
}

void __69__WBOfficeArtReaderClient_readClientDataFromObject_toDrawable_state___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 32) childAt:a3 + 1];
  [v5 readClientDataFromObject:v6 toDrawable:v7 state:*(void *)(a1 + 40)];
}

+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  id v11 = v10;
  id v12 = [v11 xmlDrawingState];
  [v12 setPackagePart:v8];
  xmlNodePtr v13 = OCXGetRootElement((_xmlDoc *)[v8 xmlDocument]);
  uint64_t v14 = [v8 contentType];
  int v15 = [v14 isEqualToString:@"application/vnd.ms-office.DrsE2oDoc+xml"];

  if (v15)
  {
    uint64_t v16 = +[OAXGraphicalObject readFromParentXmlNode:v13 inNamespace:0 drawingState:v12];
    [a1 readClientDataFromObject:v9 toDrawable:v16 state:v11];
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v12 setPackagePart:0];

  return v16;
}

@end