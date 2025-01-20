@interface OAXScene3D
+ (BOOL)isEmpty:(id)a3;
+ (id)cameraTypeEnumMap;
+ (id)lightRigDirectionEnumMap;
+ (id)lightRigTypeEnumMap;
+ (id)readBackdropFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readCameraFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readLightRigFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readScene3DFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5;
+ (void)writeBackdrop:(id)a3 to:(id)a4;
+ (void)writeCamera:(id)a3 to:(id)a4;
+ (void)writeLightRig:(id)a3 to:(id)a4;
+ (void)writeRotation3D:(id)a3 to:(id)a4;
+ (void)writeScene3D:(id)a3 to:(id)a4;
@end

@implementation OAXScene3D

+ (id)cameraTypeEnumMap
{
  v2 = (void *)+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap;
  if (!+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_10, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumStructs count:62 caseSensitive:1];
    v4 = (void *)+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap;
    +[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap;
  }
  return v2;
}

+ (id)lightRigTypeEnumMap
{
  v2 = (void *)+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap;
  if (!+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_265, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumStructs count:27 caseSensitive:1];
    v4 = (void *)+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap;
    +[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap;
  }
  return v2;
}

+ (id)lightRigDirectionEnumMap
{
  v2 = (void *)+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap;
  if (!+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_293, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumStructs count:9 caseSensitive:1];
    v4 = (void *)+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap;
    +[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap;
  }
  return v2;
}

+ (id)readCameraFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADCamera);
  v8 = [v6 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "rot");

  if (v9)
  {
    v10 = +[OAXBaseTypes readRotation3DFromXmlNode:v9];
    [(OADCamera *)v7 setRotation:v10];
  }
  v11 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  if (v11)
  {
    v12 = [a1 cameraTypeEnumMap];
    uint64_t v13 = [v12 valueForString:v11];

    [(OADCamera *)v7 setCameraType:v13];
  }
  uint64_t v18 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fov", &v18))
  {
    double v14 = (double)v18 / 60000.0;
    *(float *)&double v14 = v14;
    [(OADCamera *)v7 setFieldOfView:v14];
  }
  double v17 = 0.0;
  if (CXOptionalFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"zoom", &v17))
  {
    HIDWORD(v15) = HIDWORD(v17);
    *(float *)&double v15 = v17;
    [(OADCamera *)v7 setFieldOfView:v15];
  }

  return v7;
}

+ (id)readLightRigFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADLightRig);
  v8 = [v6 OAXMainNamespace];
  uint64_t v9 = OCXFindChild(a3, v8, "rot");

  if (v9)
  {
    v10 = +[OAXBaseTypes readRotation3DFromXmlNode:v9];
    [(OADLightRig *)v7 setRotation:v10];
  }
  v11 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rig", 0);
  if (v11)
  {
    v12 = [a1 lightRigTypeEnumMap];
    uint64_t v13 = [v12 valueForString:v11];

    [(OADLightRig *)v7 setType:v13];
  }
  double v14 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dir", 0);
  if (v14)
  {
    double v15 = [a1 lightRigDirectionEnumMap];
    uint64_t v16 = [v15 valueForString:v14];

    [(OADLightRig *)v7 setDirection:v16];
  }

  return v7;
}

+ (id)readBackdropFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(OADBackdrop);
  v7 = [v5 OAXMainNamespace];
  uint64_t v8 = OCXFindChild(a3, v7, "anchor");

  if (v8)
  {
    uint64_t v9 = +[OAXBaseTypes readPoint3DFromXmlNode:v8];
    [(OADBackdrop *)v6 setAnchor:v9];
  }
  v10 = [v5 OAXMainNamespace];
  uint64_t v11 = OCXFindChild(a3, v10, "norm");

  if (v11)
  {
    v12 = +[OAXBaseTypes readVector3DFromXmlNode:v11];
    [(OADBackdrop *)v6 setNormal:v12];
  }
  uint64_t v13 = [v5 OAXMainNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "up");

  if (v14)
  {
    double v15 = +[OAXBaseTypes readVector3DFromXmlNode:v14];
    [(OADBackdrop *)v6 setUp:v15];
  }
  return v6;
}

+ (id)readScene3DFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v7 = a5;
  uint64_t v8 = objc_alloc_init(OADScene3D);
  uint64_t v9 = [v7 OAXMainNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "camera");

  if (v10)
  {
    uint64_t v11 = [a1 readCameraFromXmlNode:v10 drawingState:v7];
    [(OADScene3D *)v8 setCamera:v11];
  }
  v12 = [v7 OAXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "lightRig");

  if (v13)
  {
    uint64_t v14 = [a1 readLightRigFromXmlNode:v13 drawingState:v7];
    [(OADScene3D *)v8 setLightRig:v14];
  }
  double v15 = [v7 OAXMainNamespace];
  uint64_t v16 = OCXFindChild(a3, v15, "backdrop");

  if (v16)
  {
    double v17 = [a1 readBackdropFromXmlNode:v16 drawingState:v7];
    [(OADScene3D *)v8 setBackdrop:v17];
  }
  return v8;
}

+ (void)writeScene3D:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 backdrop];
  if (v7)
  {
    [v6 startOAElement:@"backdrop"];
    [a1 writeBackdrop:v7 to:v6];
    [v6 endElement];
  }
  uint64_t v8 = [v10 camera];
  if (v8)
  {
    [v6 startOAElement:@"camera"];
    [a1 writeCamera:v8 to:v6];
    [v6 endElement];
  }
  uint64_t v9 = [v10 lightRig];
  if (v9)
  {
    [v6 startOAElement:@"lightRig"];
    [a1 writeLightRig:v9 to:v6];
    [v6 endElement];
  }
}

+ (BOOL)isEmpty:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 camera];
    if (v5)
    {
      id v6 = [v4 lightRig];
      BOOL v7 = v6 == 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (void)writeBackdrop:(id)a3 to:(id)a4
{
  id v63 = a3;
  id v5 = a4;
  id v6 = [v63 anchor];
  if (v6)
  {
    [v5 startOAElement:@"anchor"];
    BOOL v7 = NSNumber;
    [v6 x];
    *(float *)&double v9 = v8 * 12700.0;
    id v10 = [v7 numberWithFloat:v9];
    uint64_t v11 = [v10 longValue];

    v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v11);
    [v5 writeOAAttribute:@"x" content:v12];

    uint64_t v13 = NSNumber;
    [v6 y];
    *(float *)&double v15 = v14 * 12700.0;
    uint64_t v16 = [v13 numberWithFloat:v15];
    uint64_t v17 = [v16 longValue];

    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v17);
    [v5 writeOAAttribute:@"y" content:v18];

    v19 = NSNumber;
    [v6 z];
    *(float *)&double v21 = v20 * 12700.0;
    v22 = [v19 numberWithFloat:v21];
    uint64_t v23 = [v22 longValue];

    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v23);
    [v5 writeOAAttribute:@"z" content:v24];

    [v5 endElement];
  }
  v25 = [v63 normal];
  if (v25)
  {
    [v5 startOAElement:@"norm"];
    v26 = NSNumber;
    [v25 dx];
    *(float *)&double v28 = v27 * 12700.0;
    v29 = [v26 numberWithFloat:v28];
    uint64_t v30 = [v29 longValue];

    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v30);
    [v5 writeOAAttribute:@"dx" content:v31];

    v32 = NSNumber;
    [v25 dy];
    *(float *)&double v34 = v33 * 12700.0;
    v35 = [v32 numberWithFloat:v34];
    uint64_t v36 = [v35 longValue];

    v37 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v36);
    [v5 writeOAAttribute:@"dy" content:v37];

    v38 = NSNumber;
    [v25 dz];
    *(float *)&double v40 = v39 * 12700.0;
    v41 = [v38 numberWithFloat:v40];
    uint64_t v42 = [v41 longValue];

    v43 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v42);
    [v5 writeOAAttribute:@"dz" content:v43];

    [v5 endElement];
  }
  v44 = [v63 up];
  if (v44)
  {
    [v5 startOAElement:@"up"];
    v45 = NSNumber;
    [v44 dx];
    *(float *)&double v47 = v46 * 12700.0;
    v48 = [v45 numberWithFloat:v47];
    uint64_t v49 = [v48 longValue];

    v50 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v49);
    [v5 writeOAAttribute:@"dx" content:v50];

    v51 = NSNumber;
    [v44 dy];
    *(float *)&double v53 = v52 * 12700.0;
    v54 = [v51 numberWithFloat:v53];
    uint64_t v55 = [v54 longValue];

    v56 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v55);
    [v5 writeOAAttribute:@"dy" content:v56];

    v57 = NSNumber;
    [v44 dz];
    *(float *)&double v59 = v58 * 12700.0;
    v60 = [v57 numberWithFloat:v59];
    uint64_t v61 = [v60 longValue];

    v62 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v61);
    [v5 writeOAAttribute:@"dz" content:v62];

    [v5 endElement];
  }
}

+ (void)writeRotation3D:(id)a3 to:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  if (v24)
  {
    [v5 startOAElement:@"rot"];
    id v6 = NSNumber;
    [v24 latitude];
    *(float *)&double v8 = v7 * 60000.0;
    double v9 = [v6 numberWithFloat:v8];
    uint64_t v10 = [v9 longValue];

    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
    [v5 writeOAAttribute:@"lat" content:v11];

    v12 = NSNumber;
    [v24 longitude];
    *(float *)&double v14 = v13 * 60000.0;
    double v15 = [v12 numberWithFloat:v14];
    uint64_t v16 = [v15 longValue];

    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16);
    [v5 writeOAAttribute:@"lon" content:v17];

    uint64_t v18 = NSNumber;
    [v24 revolution];
    *(float *)&double v20 = v19 * 60000.0;
    double v21 = [v18 numberWithFloat:v20];
    uint64_t v22 = [v21 longValue];

    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v22);
    [v5 writeOAAttribute:@"rev" content:v23];

    [v5 endElement];
  }
}

+ (void)writeCamera:(id)a3 to:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  float v7 = [a1 cameraTypeEnumMap];
  double v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v22, "cameraType"));

  [v6 writeOAAttribute:@"prst" content:v8];
  double v9 = NSNumber;
  [v22 fieldOfView];
  *(float *)&double v11 = v10 * 60000.0;
  v12 = [v9 numberWithFloat:v11];
  uint64_t v13 = [v12 longValue];

  double v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v13);
  [v6 writeOAAttribute:@"fov" content:v14];

  double v15 = NSNumber;
  [v22 zoom];
  *(float *)&double v17 = v16 * 100000.0;
  uint64_t v18 = [v15 numberWithFloat:v17];
  uint64_t v19 = [v18 longValue];

  double v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v19);
  [v6 writeOAAttribute:@"zoom" content:v20];

  double v21 = [v22 rotation];
  [a1 writeRotation3D:v21 to:v6];
}

+ (void)writeLightRig:(id)a3 to:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  float v7 = [a1 lightRigTypeEnumMap];
  double v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v12, "type"));

  [v6 writeOAAttribute:@"rig" content:v8];
  double v9 = [a1 lightRigDirectionEnumMap];
  float v10 = objc_msgSend(v9, "stringForValue:", objc_msgSend(v12, "direction"));

  [v6 writeOAAttribute:@"dir" content:v10];
  double v11 = [v12 rotation];
  [a1 writeRotation3D:v11 to:v6];
}

@end