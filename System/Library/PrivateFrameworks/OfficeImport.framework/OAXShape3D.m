@interface OAXShape3D
+ (BOOL)isEmpty:(id)a3;
+ (id)bevelTypeEnumMap;
+ (id)materialEnumMap;
+ (id)readBevelFromXmlNode:(_xmlNode *)a3;
+ (id)readShape3DFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5;
+ (void)writeBevel:(id)a3 to:(id)a4;
+ (void)writeShape3D:(id)a3 to:(id)a4;
+ (void)writeShape3DMaterialOnly:(id)a3 to:(id)a4;
@end

@implementation OAXShape3D

+ (id)readBevelFromXmlNode:(_xmlNode *)a3
{
  v5 = objc_alloc_init(OADBevel);
  uint64_t v13 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", &v13))
  {
    double v6 = (double)v13 / 12700.0;
    *(float *)&double v6 = v6;
    [(OADBevel *)v5 setWidth:v6];
  }
  uint64_t v12 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"h", &v12))
  {
    double v7 = (double)v12 / 12700.0;
    *(float *)&double v7 = v7;
    [(OADBevel *)v5 setHeight:v7];
  }
  v8 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  if (v8)
  {
    v9 = [a1 bevelTypeEnumMap];
    uint64_t v10 = [v9 valueForString:v8];

    [(OADBevel *)v5 setType:v10];
  }

  return v5;
}

+ (id)materialEnumMap
{
  v2 = (void *)+[OAXShape3D materialEnumMap]::materialEnumMap;
  if (!+[OAXShape3D materialEnumMap]::materialEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_79, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXShape3D materialEnumMap]::materialEnumStructs count:15 caseSensitive:1];
    v4 = (void *)+[OAXShape3D materialEnumMap]::materialEnumMap;
    +[OAXShape3D materialEnumMap]::materialEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXShape3D materialEnumMap]::materialEnumMap;
  }
  return v2;
}

+ (id)bevelTypeEnumMap
{
  v2 = (void *)+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap;
  if (!+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_11, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumStructs count:12 caseSensitive:1];
    v4 = (void *)+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap;
    +[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap;
  }
  return v2;
}

+ (id)readShape3DFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(OADShape3D);
  v9 = [v7 OAXMainNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "bevelT");

  if (v10)
  {
    v11 = [a1 readBevelFromXmlNode:v10];
    [(OADShape3D *)v8 setTopBevel:v11];
  }
  uint64_t v12 = [v7 OAXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "bevelB");

  if (v13)
  {
    v14 = [a1 readBevelFromXmlNode:v13];
    [(OADShape3D *)v8 setBottomBevel:v14];
  }
  v15 = [v7 OAXMainNamespace];
  uint64_t v16 = OCXFindChild(a3, v15, "extrusionClr");

  if (v16)
  {
    v17 = +[OAXColor readColorFromParentXmlNode:v16];
    [(OADShape3D *)v8 setExtrusionColor:v17];
  }
  v18 = [v7 OAXMainNamespace];
  uint64_t v19 = OCXFindChild(a3, v18, "contourClr");

  if (v19)
  {
    v20 = +[OAXColor readColorFromParentXmlNode:v19];
    [(OADShape3D *)v8 setContourColor:v20];
  }
  uint64_t v30 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"z", &v30, 12))
  {
    double v21 = (double)v30 / 12700.0;
    *(float *)&double v21 = v21;
    [(OADShape3D *)v8 setShapeDepth:v21];
  }
  uint64_t v29 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"extrusionH", &v29))
  {
    double v22 = (double)v29 / 12700.0;
    *(float *)&double v22 = v22;
    [(OADShape3D *)v8 setExtrusionHeight:v22];
  }
  uint64_t v28 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"contourW", &v28))
  {
    double v23 = (double)v28 / 12700.0;
    *(float *)&double v23 = v23;
    [(OADShape3D *)v8 setContourWidth:v23];
  }
  v24 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prstMaterial", 0);
  if (v24)
  {
    v25 = [a1 materialEnumMap];
    uint64_t v26 = [v25 valueForString:v24];

    [(OADShape3D *)v8 setMaterial:v26];
  }

  return v8;
}

+ (void)writeBevel:(id)a3 to:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = [a1 bevelTypeEnumMap];
  v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v21, "type"));

  [v6 writeOAAttribute:@"prst" content:v8];
  v9 = NSNumber;
  [v21 width];
  *(float *)&double v11 = v10 * 12700.0;
  uint64_t v12 = [v9 numberWithFloat:v11];
  uint64_t v13 = [v12 longValue];

  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v13);
  [v6 writeOAAttribute:@"w" content:v14];

  v15 = NSNumber;
  [v21 height];
  *(float *)&double v17 = v16 * 12700.0;
  v18 = [v15 numberWithFloat:v17];
  uint64_t v19 = [v18 longValue];

  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v19);
  [v6 writeOAAttribute:@"h" content:v20];
}

+ (void)writeShape3D:(id)a3 to:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  id v7 = NSNumber;
  [v31 shapeDepth];
  *(float *)&double v9 = v8 * 12700.0;
  float v10 = [v7 numberWithFloat:v9];
  uint64_t v11 = [v10 longValue];

  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v11);
  [v6 writeOAAttribute:@"z" content:v12];

  uint64_t v13 = NSNumber;
  [v31 extrusionHeight];
  *(float *)&double v15 = v14 * 12700.0;
  float v16 = [v13 numberWithFloat:v15];
  uint64_t v17 = [v16 longValue];

  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v17);
  [v6 writeOAAttribute:@"extrusionH" content:v18];

  uint64_t v19 = NSNumber;
  [v31 contourWidth];
  *(float *)&double v21 = v20 * 12700.0;
  double v22 = [v19 numberWithFloat:v21];
  uint64_t v23 = [v22 longValue];

  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v23);
  [v6 writeOAAttribute:@"contourW" content:v24];

  v25 = [a1 materialEnumMap];
  uint64_t v26 = objc_msgSend(v25, "stringForValue:", objc_msgSend(v31, "material"));

  [v6 writeOAAttribute:@"prstMaterial" content:v26];
  v27 = [v31 topBevel];
  if (v27)
  {
    [v6 startOAElement:@"bevelT"];
    [a1 writeBevel:v27 to:v6];
    [v6 endElement];
  }
  uint64_t v28 = [v31 bottomBevel];
  if (v28)
  {
    [v6 startOAElement:@"bevelB"];
    [a1 writeBevel:v28 to:v6];
    [v6 endElement];
  }
  uint64_t v29 = [v31 extrusionColor];
  if (v29)
  {
    [v6 startOAElement:@"extrusionClr"];
    +[OAXColor writeColor:v29 to:v6];
    [v6 endElement];
  }
  uint64_t v30 = [v31 contourColor];
  if (v30)
  {
    [v6 startOAElement:@"contourClr"];
    +[OAXColor writeColor:v30 to:v6];
    [v6 endElement];
  }
}

+ (void)writeShape3DMaterialOnly:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!+[OAXShape3D isEmpty:v9])
  {
    id v7 = [a1 materialEnumMap];
    float v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v9, "material"));
    [v6 writeOAAttribute:@"prstMaterial" content:v8];
  }
}

+ (BOOL)isEmpty:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 material])
  {
    id v6 = [a1 materialEnumMap];
    id v7 = objc_msgSend(v6, "stringForValue:", objc_msgSend(v5, "material"));
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

@end