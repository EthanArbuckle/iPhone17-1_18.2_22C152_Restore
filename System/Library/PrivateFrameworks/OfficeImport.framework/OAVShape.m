@interface OAVShape
+ (id)managerWithShape:(_xmlNode *)a3 state:(id)a4;
+ (id)readFromShape:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5;
+ (unsigned)typeWithShape:(_xmlNode *)a3 state:(id)a4;
+ (void)readBoundsAndGeometryOfPolylineFromManager:(id)a3 toShape:(id)a4 state:(id)a5;
@end

@implementation OAVShape

+ (id)readFromShape:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7 = a5;
  v8 = [a1 managerWithShape:a3 state:v7];
  if ([v8 isImage])
  {
    v9 = objc_alloc_init(OADImage);
    v10 = 0;
    v21 = v9;
  }
  else
  {
    v9 = objc_alloc_init(OADShape);
    v21 = 0;
    v10 = v9;
  }
  v11 = v9;
  char v12 = [v8 isPolyline];
  +[OAVDrawable readFromDrawable:a3 toDrawable:v11 state:v7];
  v13 = [(OADGraphic *)v11 graphicProperties];
  int v14 = [v8 isWordArt];
  v15 = +[OAVFill readFromManager:v8 state:v7];
  [v13 setFill:v15];

  if (v14)
  {
    +[OAVWordArt readFromManager:v8 toShape:v10 state:v7];
  }
  else
  {
    if (v10)
    {
      if (v12)
      {
        [a1 readBoundsAndGeometryOfPolylineFromManager:v8 toShape:v10 state:v7];
      }
      else
      {
        v16 = +[OAVShapeGeometry readFromManager:v8];
        [(OADImage *)v10 setGeometry:v16];
      }
      +[OAVTextBodyProperties readFromManager:v8 toShape:v10 state:v7];
    }
    v17 = +[OAVStroke readFromManager:v8];
    [v13 setStroke:v17];

    v18 = +[OAVShadow readFromManager:v8];
    [v13 setEffects:v18];

    if (v21) {
      +[OAVImage readFromManager:v8 toImage:v21 state:v7];
    }
  }
  objc_msgSend((id)objc_msgSend(v7, "client"), "readClientDataFromShape:toGraphic:state:", a3, v11, v7);
  v19 = v11;

  return v19;
}

+ (id)managerWithShape:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 typeWithShape:a3 state:v6];
  v8 = [OAVShapeManager alloc];
  v9 = [v6 packagePart];
  v10 = [(OAVShapeManager *)v8 initWithShape:a3 type:v7 packagePart:v9 state:v6];

  return v10;
}

+ (unsigned)typeWithShape:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (xmlStrEqual(a3->name, (const xmlChar *)"shape"))
  {
    id v6 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
    uint64_t v7 = v6;
    if (v6)
    {
      v8 = [v6 substringFromIndex:1];

      int v9 = [v5 shapeTypeForId:v8];
      unsigned __int16 v10 = v9;
      if (!v9)
      {
        if ([v8 hasPrefix:@"_x0000_t"])
        {
          v11 = [v8 substringFromIndex:objc_msgSend(@"_x0000_t", "length")];
          unsigned __int16 v10 = [v11 intValue];
        }
        else
        {
          unsigned __int16 v10 = 0;
        }
      }
    }
    else
    {
      unsigned __int16 v10 = 0;
      v8 = 0;
    }
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"line"))
  {
    unsigned __int16 v10 = 20;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"polyline"))
  {
    unsigned __int16 v10 = 0;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"rect"))
  {
    unsigned __int16 v10 = 1;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"roundrect"))
  {
    unsigned __int16 v10 = 2;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"oval"))
  {
    unsigned __int16 v10 = 3;
  }
  else
  {
    unsigned __int16 v10 = 0;
  }

  return v10;
}

+ (void)readBoundsAndGeometryOfPolylineFromManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (xmlStrEqual(*(const xmlChar **)(*(void *)([v6 shape] + 40) + 16), (const xmlChar *)"group")) {
    double v8 = 1.0;
  }
  else {
    double v8 = 20.0;
  }
  int v9 = [v6 points];
  unsigned __int16 v10 = OAVReadLengthArray(v9);
  unint64_t v11 = [v10 count];
  if (v11 >= 2)
  {
    double x = *MEMORY[0x263F001A0];
    CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
    v16 = objc_alloc_init(OADCustomShapeGeometry);
    [v7 setGeometry:v16];
    [(OADShapeGeometry *)v16 setIsEscher:1];
    v17 = objc_alloc_init(OADPath);
    [(OADCustomShapeGeometry *)v16 addPath:v17];
    v30 = v9;
    v31 = v7;
    uint64_t v18 = 0;
    if (v11 >> 1 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v11 >> 1;
    }
    uint64_t v20 = 1;
    do
    {
      v21 = objc_msgSend(v10, "objectAtIndexedSubscript:", v20 - 1, v30, v31);
      [v21 doubleValue];
      double v23 = v22;

      v24 = [v10 objectAtIndexedSubscript:v20];
      [v24 doubleValue];
      double v26 = v25;

      v36.size.CGFloat width = 0.0;
      v36.size.CGFloat height = 0.0;
      v33.origin.double x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      v36.origin.double x = v23;
      v36.origin.CGFloat y = v26;
      CGRect v34 = CGRectUnion(v33, v36);
      double x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
      v27 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithToPoint:", (unint64_t)(int)(v8 * v23) << 32, (unint64_t)(int)(v8 * v26) << 32);
      [(OADPath *)v17 addElement:v27];

      ++v18;
      v20 += 2;
    }
    while (v19 != v18);
    v35.origin.double x = TSUMultiplyRectScalar(x, y, width, height, v8);
    int v9 = v30;
    id v7 = v31;
    OCChRectI4WithCGRect(v35, v32);
    [(OADCustomShapeGeometry *)v16 setGeometryCoordSpace:v32];
    v28 = [v31 drawableProperties];
    v29 = [v28 orientedBounds];
    objc_msgSend(v29, "setBounds:", x, y, width, height);
  }
}

@end