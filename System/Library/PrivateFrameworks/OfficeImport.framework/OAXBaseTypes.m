@interface OAXBaseTypes
+ (CGPoint)readPoint2DFromXmlNode:(_xmlNode *)a3;
+ (CGSize)readSize2DFromXmlNode:(_xmlNode *)a3;
+ (double)readOptionalAngleFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (double)readRequiredAngleFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (float)readOptionalFractionFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (float)readOptionalLengthFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (float)readRequiredFractionFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (float)readRequiredLengthFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (id)readPoint3DFromXmlNode:(_xmlNode *)a3;
+ (id)readRelativeRectFromXmlNode:(_xmlNode *)a3;
+ (id)readRotation3DFromXmlNode:(_xmlNode *)a3;
+ (id)readVector3DFromXmlNode:(_xmlNode *)a3;
+ (id)rectAlignmentEnumMap;
+ (id)stringForRectAlignment:(int)a3;
+ (int)readRectAlignmentFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (int64_t)readOptionalLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (int64_t)readOptionalLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 desiredOutputUnit:(int)a5;
+ (int64_t)readRequiredLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4;
+ (int64_t)readRequiredLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 desiredOutputUnit:(int)a5;
+ (void)writeRectAlignment:(int)a3 to:(id)a4;
+ (void)writeRelativeRect:(id)a3 to:(id)a4;
@end

@implementation OAXBaseTypes

+ (float)readRequiredFractionFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  CXRequiredFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4);
  return v4;
}

+ (int64_t)readRequiredLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (int64_t)CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4);
}

+ (int)readRectAlignmentFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  v5 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0);
  if (v5)
  {
    v6 = [a1 rectAlignmentEnumMap];
    int v7 = [v6 valueForString:v5];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)readRelativeRectFromXmlNode:(_xmlNode *)a3
{
  if (a3)
  {
    [a1 readOptionalFractionFromXmlNode:a3 name:"l"];
    int v6 = v5;
    [a1 readOptionalFractionFromXmlNode:a3 name:"t"];
    int v8 = v7;
    [a1 readOptionalFractionFromXmlNode:a3 name:"r"];
    int v10 = v9;
    [a1 readOptionalFractionFromXmlNode:a3 name:"b"];
    int v12 = v11;
  }
  else
  {
    int v6 = 0;
    int v8 = 0;
    int v10 = 0;
    int v12 = 0;
  }
  v13 = [OADRelativeRect alloc];
  LODWORD(v14) = v6;
  LODWORD(v15) = v8;
  LODWORD(v16) = v10;
  LODWORD(v17) = v12;
  v18 = [(OADRelativeRect *)v13 initWithLeft:v14 top:v15 right:v16 bottom:v17];
  return v18;
}

+ (float)readOptionalFractionFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0.0);
}

+ (int64_t)readOptionalLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0);
}

+ (double)readOptionalAngleFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)[a1 readOptionalLongFromXmlNode:a3 name:a4] / 60000.0;
}

+ (CGPoint)readPoint2DFromXmlNode:(_xmlNode *)a3
{
  [a1 readRequiredLengthFromXmlNode:a3 name:"x"];
  double v6 = v5;
  [a1 readRequiredLengthFromXmlNode:a3 name:"y"];
  double v8 = v7;
  double v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

+ (float)readRequiredLengthFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)[a1 readRequiredLongFromXmlNode:a3 name:a4 desiredOutputUnit:12] / 12700.0;
}

+ (CGSize)readSize2DFromXmlNode:(_xmlNode *)a3
{
  [a1 readRequiredLengthFromXmlNode:a3 name:"cx"];
  double v6 = v5;
  [a1 readRequiredLengthFromXmlNode:a3 name:"cy"];
  double v8 = v7;
  double v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (id)rectAlignmentEnumMap
{
  v2 = (void *)+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap;
  if (!+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_0, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumStructs count:9 caseSensitive:1];
    double v4 = (void *)+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap;
    +[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap;
  }
  return v2;
}

+ (id)readRotation3DFromXmlNode:(_xmlNode *)a3
{
  [a1 readRequiredAngleFromXmlNode:a3 name:"lat"];
  float v6 = v5;
  [a1 readRequiredAngleFromXmlNode:a3 name:"lon"];
  float v8 = v7;
  [a1 readRequiredAngleFromXmlNode:a3 name:"rev"];
  float v10 = v9;
  int v11 = [OADRotation3D alloc];
  *(float *)&double v12 = v6;
  *(float *)&double v13 = v8;
  *(float *)&double v14 = v10;
  double v15 = [(OADRotation3D *)v11 initWithLatitude:v12 longitude:v13 revolution:v14];
  return v15;
}

+ (double)readRequiredAngleFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)[a1 readRequiredLongFromXmlNode:a3 name:a4] / 60000.0;
}

+ (float)readOptionalLengthFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)[a1 readOptionalLongFromXmlNode:a3 name:a4 desiredOutputUnit:12] / 12700.0;
}

+ (int64_t)readRequiredLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 desiredOutputUnit:(int)a5
{
  return (int64_t)CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, a5);
}

+ (int64_t)readOptionalLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 desiredOutputUnit:(int)a5
{
  return CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0, a5);
}

+ (id)stringForRectAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v4 = [a1 rectAlignmentEnumMap];
  double v5 = [v4 stringForValue:v3];

  return v5;
}

+ (void)writeRelativeRect:(id)a3 to:(id)a4
{
  id v30 = a3;
  id v5 = a4;
  float v6 = NSNumber;
  [v30 left];
  *(float *)&double v8 = v7 * 100000.0;
  double v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  int v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
  [v5 writeOAAttribute:@"l" content:v11];

  double v12 = NSNumber;
  [v30 top];
  *(float *)&double v14 = v13 * 100000.0;
  double v15 = [v12 numberWithFloat:v14];
  uint64_t v16 = [v15 longValue];

  double v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16);
  [v5 writeOAAttribute:@"t" content:v17];

  v18 = NSNumber;
  [v30 right];
  *(float *)&double v20 = v19 * 100000.0;
  v21 = [v18 numberWithFloat:v20];
  uint64_t v22 = [v21 longValue];

  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v22);
  [v5 writeOAAttribute:@"r" content:v23];

  v24 = NSNumber;
  [v30 bottom];
  *(float *)&double v26 = v25 * 100000.0;
  v27 = [v24 numberWithFloat:v26];
  uint64_t v28 = [v27 longValue];

  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v28);
  [v5 writeOAAttribute:@"b" content:v29];
}

+ (void)writeRectAlignment:(int)a3 to:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  float v6 = [a1 rectAlignmentEnumMap];
  float v7 = [v6 stringForValue:v4];

  [v8 writeOAAttribute:@"algn" content:v7];
}

+ (id)readVector3DFromXmlNode:(_xmlNode *)a3
{
  [a1 readRequiredLengthFromXmlNode:a3 name:"dx"];
  int v6 = v5;
  [a1 readRequiredLengthFromXmlNode:a3 name:"dy"];
  int v8 = v7;
  [a1 readRequiredLengthFromXmlNode:a3 name:"dz"];
  int v10 = v9;
  int v11 = [OADVector3D alloc];
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;
  double v15 = [(OADVector3D *)v11 initWithDx:v12 dy:v13 dz:v14];
  return v15;
}

+ (id)readPoint3DFromXmlNode:(_xmlNode *)a3
{
  [a1 readRequiredLengthFromXmlNode:a3 name:"x"];
  int v6 = v5;
  [a1 readRequiredLengthFromXmlNode:a3 name:"y"];
  int v8 = v7;
  [a1 readRequiredLengthFromXmlNode:a3 name:"z"];
  int v10 = v9;
  int v11 = [OADPoint3D alloc];
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;
  double v15 = [(OADPoint3D *)v11 initWithX:v12 y:v13 z:v14];
  return v15;
}

@end