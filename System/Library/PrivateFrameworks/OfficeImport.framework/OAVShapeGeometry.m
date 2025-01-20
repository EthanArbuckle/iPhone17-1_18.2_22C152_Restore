@interface OAVShapeGeometry
+ (OADAdjustCoord)readAdjustCoord:(id)a3;
+ (id)readFromManager:(id)a3;
+ (void)readAdjustValuesFromManager:(id)a3 toGeometry:(id)a4;
+ (void)readLimoFromManager:(id)a3 toGeometry:(id)a4;
+ (void)readTextBodyRectsFromManager:(id)a3 toGeometry:(id)a4;
@end

@implementation OAVShapeGeometry

+ (id)readFromManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 path];
  if (v5)
  {
    v6 = objc_alloc_init(OADCustomShapeGeometry);
    [(OADShapeGeometry *)v6 setIsEscher:1];
    [a1 readAdjustValuesFromManager:v4 toGeometry:v6];
    +[OAVDrawable readCoordBounds:](OAVDrawable, "readCoordBounds:", [v4 shape]);
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
    double MinX = CGRectGetMinX(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    v15[0] = (int)MinX;
    v15[1] = (int)MinY;
    v15[2] = (int)MaxX;
    v15[3] = (int)CGRectGetMaxY(v20);
    [(OADCustomShapeGeometry *)v6 setGeometryCoordSpace:v15];
    [a1 readLimoFromManager:v4 toGeometry:v6];
    [a1 readTextBodyRectsFromManager:v4 toGeometry:v6];
    +[OAVFormula readFormulasFromManager:v4 toGeometry:v6];
    +[OAVPath readPath:v5 toGeometry:v6];
  }
  else
  {
    v6 = objc_alloc_init(OADPresetShapeGeometry);
    [(OADShapeGeometry *)v6 setIsEscher:1];
    -[OADCustomShapeGeometry setType:](v6, "setType:", [v4 type]);
    [(OADShapeGeometry *)v6 setIsEscher:1];
    [a1 readAdjustValuesFromManager:v4 toGeometry:v6];
  }

  return v6;
}

+ (void)readAdjustValuesFromManager:(id)a3 toGeometry:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if ([v17 type] == 2)
  {
    v6 = (_xmlNode *)[v17 shape];
    CXDefaultStringAttribute(v6, (CXNamespace *)CXNoNamespace, (xmlChar *)"arcsize", 0);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7) {
      [v5 setAdjustValue:(int)(float)(OAVReadFraction(v7) * 21600.0) atIndex:0];
    }
  }
  v9 = (_xmlNode *)[v17 shape];
  v10 = CXDefaultStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"adj", 0);
  v11 = v10;
  if (v10)
  {
    v12 = [v10 componentsSeparatedByString:@","];
    for (unsigned int i = 0; [v12 count] > (unint64_t)i; ++i)
    {
      v14 = [v12 objectAtIndex:i];
      v15 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v16 = [v14 stringByTrimmingCharactersInSet:v15];

      if ([v16 length]) {
        objc_msgSend(v5, "setAdjustValue:atIndex:", objc_msgSend(v16, "intValue"), i);
      }
    }
  }
}

+ (void)readLimoFromManager:(id)a3 toGeometry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0x8000000080000000;
  unint64_t v19 = 0x8000000080000000;
  v8 = [v5 limo];
  v9 = v8;
  if (v8)
  {
    id v17 = v5;
    v10 = [v8 componentsSeparatedByString:@","];
    unint64_t v11 = 0;
    char v12 = 1;
    do
    {
      char v13 = v12;
      if ([v10 count] > v11)
      {
        v14 = [v10 objectAtIndex:v11];
        v15 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v16 = [v14 stringByTrimmingCharactersInSet:v15];

        if ([v16 length]) {
          *((_DWORD *)&v19 + v11) = [v16 intValue];
        }
      }
      char v12 = 0;
      unint64_t v11 = 1;
    }
    while ((v13 & 1) != 0);

    unint64_t v7 = v19;
    id v5 = v17;
  }
  unint64_t v18 = v7;
  [v6 setLimo:&v18];
}

+ (void)readTextBodyRectsFromManager:(id)a3 toGeometry:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v21 = a4;
  id v6 = [v19 textBodyRects];
  if (v6)
  {
    id v18 = v6;
    unint64_t v7 = [v6 componentsSeparatedByString:@";"];
    unsigned int v8 = 0;
    for (unsigned int i = v7; ; v7 = i)
    {
      unsigned int v9 = v8;
      if ([v7 count] <= (unint64_t)v8) {
        break;
      }
      v10 = [v7 objectAtIndex:v8];
      unint64_t v11 = [v10 componentsSeparatedByString:@","];
      uint64_t v12 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      do
      {
        char v13 = [v11 objectAtIndex:v12];
        v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v15 = [v13 stringByTrimmingCharactersInSet:v14];

        *((void *)&v22 + v12) = [a1 readAdjustCoord:v15];
        ++v12;
      }
      while (v12 != 4);
      v16 = [OADAdjustRect alloc];
      id v17 = -[OADAdjustRect initWithLeft:top:right:bottom:](v16, "initWithLeft:top:right:bottom:", v22, v23);

      [v21 addTextBodyRect:v17];
      unsigned int v8 = v9 + 1;
    }

    id v6 = v18;
  }
}

+ (OADAdjustCoord)readAdjustCoord:(id)a3
{
  id v3 = a3;
  int v4 = [v3 characterAtIndex:0];
  if (v4 == 64)
  {
    id v5 = [v3 substringFromIndex:1];
    uint64_t v6 = [v5 intValue];
  }
  else
  {
    uint64_t v6 = [v3 intValue];
  }

  return (OADAdjustCoord)((v4 == 64) | (unint64_t)(v6 << 32));
}

@end