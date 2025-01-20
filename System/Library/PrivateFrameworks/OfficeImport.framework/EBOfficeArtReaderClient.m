@interface EBOfficeArtReaderClient
+ (BOOL)escherIsFullySupported;
+ (BOOL)tablesAreAllowed;
+ (BOOL)xmlEquivalentOfDrawableCanBeUsed;
+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5;
+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4;
+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5;
+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5;
+ (void)readEshClientAnchor:(const void *)a3 targetClientData:(id)a4 state:(id)a5;
+ (void)setAutoInsetForShape:(void *)a3;
@end

@implementation EBOfficeArtReaderClient

+ (BOOL)escherIsFullySupported
{
  return 0;
}

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(EDOfficeArtClient);
  v11 = (uint64_t *)[v15 eshObject];
  if (v11) {
  uint64_t v12 = v11[72];
  }
  if (v12) {
    +[EBOfficeArtReaderClient readEshClientAnchor:v12 targetClientData:v10 state:v9];
  }
  else {
    -[EDOfficeArtClient setBounds:](v10, "setBounds:", (double)*((int *)v11 + 64), (double)*((int *)v11 + 65), (double)(*((_DWORD *)v11 + 66) - *((_DWORD *)v11 + 64)), (double)(*((_DWORD *)v11 + 67) - *((_DWORD *)v11 + 65)));
  }
  [v8 setClientData:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v8 textBody];
    v14 = [v13 properties];

    [v14 setVerticalOverflowType:2];
    objc_msgSend(a1, "setAutoInsetForShape:", objc_msgSend(v15, "eshShape"));
  }
}

+ (void)readEshClientAnchor:(const void *)a3 targetClientData:(id)a4 state:(id)a5
{
  id v18 = a4;
  v6 = objc_alloc_init(EDTwoCellAnchor);
  [v18 setAnchor:v6];
  [(EDTwoCellAnchor *)v6 setRelative:1];
  int v7 = *((__int16 *)a3 + 14);
  int v8 = v7 << 17;
  if (v7 >= 0) {
    int v9 = 1;
  }
  else {
    int v9 = 2;
  }
  [(EDTwoCellAnchor *)v6 setEditAs:v9 & (v8 >> 31)];
  uint64_t v10 = *((void *)a3 + 4);
  float32x2_t v11 = vcvt_f32_s32(*(int32x2_t *)((char *)a3 + 48));
  v12.i32[0] = 981467136;
  v12.i32[0] = vmul_f32(v11, v12).u32[0];
  float32x2_t v13 = (float32x2_t)vdup_n_s32(0x437E0000u);
  v12.i32[1] = vdiv_f32(v11, v13).i32[1];
  v14.i64[0] = v10;
  v14.i64[1] = HIDWORD(v10);
  [(EDTwoCellAnchor *)v6 setFrom:vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)v12, 0x20uLL), v14)];
  uint64_t v15 = *((void *)a3 + 5);
  float32x2_t v16 = vcvt_f32_s32(*(int32x2_t *)((char *)a3 + 56));
  v17.i32[0] = 981467136;
  v17.i32[0] = vmul_f32(v16, v17).u32[0];
  v17.i32[1] = vdiv_f32(v16, v13).i32[1];
  v14.i64[0] = v15;
  v14.i64[1] = HIDWORD(v15);
  [(EDTwoCellAnchor *)v6 setTo:vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)v17, 0x20uLL), v14)];
}

+ (void)setAutoInsetForShape:(void *)a3
{
  v3 = (EshTextBox *)((char *)a3 + 272);
  int DefaultPositionHorizontal = EshContentProperties::getDefaultPositionHorizontal((EshContentProperties *)a1);
  if (EshTextBox::isAutoInsetSet(v3))
  {
    if ((EshTextBox::getAutoInset(v3) & 1) == 0) {
      return;
    }
  }
  else if (!DefaultPositionHorizontal)
  {
    return;
  }
  EshTextBox::setInsetLeft(v3, 0x594Cu);
  EshTextBox::setInsetRight(v3, 0x594Cu);
  EshTextBox::setInsetTop(v3, 0x594Cu);
  EshTextBox::setInsetBottom(v3, 0x594Cu);
}

+ (BOOL)tablesAreAllowed
{
  return 0;
}

+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(EDOfficeArtClient);
    +[EBOfficeArtReaderClient readEshClientAnchor:v9 targetClientData:v10 state:v8];
    [v7 setClientData:v10];
  }
}

+ (BOOL)xmlEquivalentOfDrawableCanBeUsed
{
  return 1;
}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4
{
  return -1;
}

+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5
{
  id v6 = a3;
  id v7 = [a5 xmlDrawingState];
  id v8 = [v7 excelState];
  [v7 setPackagePart:v6];
  xmlNodePtr v9 = OCXGetRootElement((_xmlDoc *)[v6 xmlDocument]);
  if (xmlStrEqual(v9->name, (const xmlChar *)"anchor"))
  {
    uint64_t v10 = +[EXDrawing readAnchorNode:OCXFirstChild(v9) state:v8];
  }
  else if (xmlStrEqual(v9->name, (const xmlChar *)"object"))
  {
    id v11 = OCXFirstChild(v9);
    float32x2_t v12 = [v8 EXSpreadsheetDrawingNamespace];
    uint64_t v10 = +[OAXDrawable readDrawableFromXmlNode:v11 inNamespace:v12 drawingState:v7];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v7 setPackagePart:0];

  return v10;
}

@end