@interface OABStroke
+ (char)readPresetDashStyle:(int)a3;
+ (id)readLineEndWithType:(int)a3 width:(int)a4 length:(int)a5;
+ (id)readStrokeFromShapeBaseManager:(id)a3 state:(id)a4;
+ (int)writeCapStyle:(unsigned __int8)a3;
+ (int)writeCompoundType:(unsigned __int8)a3;
+ (int)writeLineEndLength:(unsigned __int8)a3;
+ (int)writeLineEndType:(unsigned __int8)a3;
+ (int)writeLineEndWidth:(unsigned __int8)a3;
+ (int)writePresetDashStyle:(char)a3;
+ (unsigned)readCapStyle:(int)a3;
+ (unsigned)readCompoundType:(int)a3;
+ (unsigned)readLineEndLength:(int)a3;
+ (unsigned)readLineEndType:(int)a3;
+ (unsigned)readLineEndWidth:(int)a3;
+ (void)writePresetDashStyleForCustomDash:(id)a3 toStroke:(EshStroke *)a4 state:(id)a5;
@end

@implementation OABStroke

+ (char)readPresetDashStyle:(int)a3
{
  if ((a3 - 1) > 9) {
    return 0;
  }
  else {
    return byte_238EDC262[a3 - 1];
  }
}

+ (unsigned)readLineEndType:(int)a3
{
  if (a3 >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unsigned)readLineEndWidth:(int)a3
{
  if (a3 >= 3) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (unsigned)readLineEndLength:(int)a3
{
  if (a3 >= 3) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (unsigned)readCapStyle:(int)a3
{
  if (a3 >= 3) {
    return 2;
  }
  else {
    return a3;
  }
}

+ (unsigned)readCompoundType:(int)a3
{
  if (a3 >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)readStrokeFromShapeBaseManager:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39 = v7;
  v8 = objc_alloc_init(OADStroke);
  if (v6) {
    [v6 strokeFgColor];
  }
  else {
    EshColor v44 = 0;
  }
  float v9 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 strokeFgAlpha]);
  EshColor::EshColor(&v43, &v44);
  *(float *)&double v10 = v9;
  v40 = +[OABShapeProperties targetColorWithSourceColor:&v43 alpha:v6 colorPropertiesManager:v7 state:v10];
  [(OADStroke *)v8 setColor:v40];
  char v11 = [v6 isStroked];
  int v12 = [v6 strokeFillType];
  if (v11)
  {
    if (v12 == 1)
    {
      uint64_t v14 = [v6 strokeFillBlipID];
      v15 = [v6 strokeFillBlipName];
      v16 = +[OABFill patternFromBlipId:blipName:blipDataReference:state:](OABFill, "patternFromBlipId:blipName:blipDataReference:state:", v14, v15, [v6 strokeFillBlipDataReference], v7);
      if (v16)
      {
        if (v6) {
          [v6 strokeBgColor];
        }
        else {
          EshColor v42 = 0;
        }
        EshColor::EshColor(&v41, &v42);
        *(float *)&double v17 = v9;
        v18 = +[OABShapeProperties targetColorWithSourceColor:&v41 alpha:v6 colorPropertiesManager:v7 state:v17];
        v13 = objc_alloc_init(OADPatternFill);
        [(OADPatternFill *)v13 setFgColor:v40];
        [(OADPatternFill *)v13 setBgColor:v18];
        [(OADPatternFill *)v13 setPattern:v16];
      }
      else
      {
        v13 = +[OADNullFill nullFill];
      }
    }
    else if (v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_alloc_init(OADSolidFill);
      [(OADPatternFill *)v13 setColor:v40];
    }
  }
  else
  {
    v13 = +[OADNullFill nullFill];
  }
  [(OADStroke *)v8 setFill:v13];
  v38 = v13;
  uint64_t v19 = [v6 strokeCustomDash];
  if (v19)
  {
    v20 = objc_alloc_init(OADCustomDash);
    v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:((*(void *)(v19 + 16) - *(void *)(v19 + 8)) >> 3) & 0x7FFFFFFFLL];
    if (((*(void *)(v19 + 16) - *(void *)(v19 + 8)) & 0x3FFFFFFF8) != 0)
    {
      unsigned int v22 = 0;
      unsigned int v23 = 1;
      do
      {
        int v24 = *(_DWORD *)EshBasicTablePropVal<int>::operator[](v19, v23 - 1);
        v25 = (int *)EshBasicTablePropVal<int>::operator[](v19, v23);
        *(float *)&double v26 = (float)v24;
        *(float *)&double v27 = (float)*v25;
        +[OADDashStop addStopWithDash:v21 space:v26 toArray:v27];
        ++v22;
        v23 += 2;
      }
      while (v22 < (((*(void *)(v19 + 16) - *(void *)(v19 + 8)) >> 3) & 0x7FFFFFFF));
    }
    [(OADCustomDash *)v20 setStops:v21];
  }
  else
  {
    uint64_t v28 = objc_msgSend(a1, "readPresetDashStyle:", objc_msgSend(v6, "strokePresetDash"));
    v20 = objc_alloc_init(OADPresetDash);
    [(OADCustomDash *)v20 setType:v28];
  }
  [(OADStroke *)v8 setDash:v20];
  int v29 = [v6 strokeJoinStyle];
  switch(v29)
  {
    case 0:
      v30 = off_264D60508;
      goto LABEL_28;
    case 1:
      float v32 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 strokeMiterLimit]);
      v31 = objc_alloc_init(OADMiterLineJoin);
      *(float *)&double v33 = v32;
      [(OADMiterLineJoin *)v31 setLimit:v33];
      break;
    case 2:
      v30 = off_264D60540;
LABEL_28:
      v31 = (OADMiterLineJoin *)objc_alloc_init(*v30);
      break;
    default:
      v31 = 0;
      break;
  }
  [(OADStroke *)v8 setJoin:v31];
  v34 = -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", objc_msgSend(a1, "readLineEndType:", objc_msgSend(v6, "strokeStartArrowType")), objc_msgSend(a1, "readLineEndWidth:", objc_msgSend(v6, "strokeStartArrowWidth")), objc_msgSend(a1, "readLineEndLength:", objc_msgSend(v6, "strokeStartArrowLength")));
  [(OADStroke *)v8 setTail:v34];
  v35 = -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", objc_msgSend(a1, "readLineEndType:", objc_msgSend(v6, "strokeEndArrowType")), objc_msgSend(a1, "readLineEndWidth:", objc_msgSend(v6, "strokeEndArrowWidth")), objc_msgSend(a1, "readLineEndLength:", objc_msgSend(v6, "strokeEndArrowLength")));
  [(OADStroke *)v8 setHead:v35];
  *(float *)&double v36 = (float)(int)[v6 strokeWidth] / 12700.0;
  [(OADStroke *)v8 setWidth:v36];
  -[OADStroke setCap:](v8, "setCap:", objc_msgSend(a1, "readCapStyle:", objc_msgSend(v6, "strokeCapStyle")));
  -[OADStroke setCompoundType:](v8, "setCompoundType:", objc_msgSend(a1, "readCompoundType:", objc_msgSend(v6, "strokeCompoundType")));

  return v8;
}

+ (id)readLineEndWithType:(int)a3 width:(int)a4 length:(int)a5
{
  v5 = -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", [a1 readLineEndType:*(void *)&a3], objc_msgSend(a1, "readLineEndWidth:", *(void *)&a4), objc_msgSend(a1, "readLineEndLength:", *(void *)&a5));
  return v5;
}

+ (int)writeCompoundType:(unsigned __int8)a3
{
  if (((a3 - 1) & 0xFC) != 0) {
    return 0;
  }
  else {
    return (a3 - 1) + 1;
  }
}

+ (int)writePresetDashStyle:(char)a3
{
  uint64_t v3 = a3 - 1;
  if (v3 > 9) {
    return 0;
  }
  else {
    return dword_238EDC26C[v3];
  }
}

+ (int)writeLineEndType:(unsigned __int8)a3
{
  if ((a3 - 1) < 5) {
    return (a3 - 1) + 1;
  }
  else {
    return 0;
  }
}

+ (int)writeLineEndWidth:(unsigned __int8)a3
{
  if (a3 >= 3u) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (int)writeLineEndLength:(unsigned __int8)a3
{
  if (a3 >= 3u) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (int)writeCapStyle:(unsigned __int8)a3
{
  if (a3 >= 2u) {
    return 2;
  }
  else {
    return a3;
  }
}

+ (void)writePresetDashStyleForCustomDash:(id)a3 toStroke:(EshStroke *)a4 state:(id)a5
{
  id v14 = [a3 stops];
  uint64_t v6 = [v14 count];
  id v7 = [v14 objectAtIndexedSubscript:0];
  [v7 dash];
  if (v8 >= 2.0)
  {
    [v7 dash];
    if (v6 == 2) {
      int v12 = 9;
    }
    else {
      int v12 = 10;
    }
    if (v6 == 1) {
      int v12 = 7;
    }
    if (v6 == 2) {
      int v13 = 8;
    }
    else {
      int v13 = 10;
    }
    if (v6 == 1) {
      int v13 = 6;
    }
    if (v11 < 4.0) {
      unsigned int v10 = v13;
    }
    else {
      unsigned int v10 = v12;
    }
  }
  else
  {
    if (v6 == 2) {
      int v9 = 3;
    }
    else {
      int v9 = 4;
    }
    if (v6 == 1) {
      unsigned int v10 = 2;
    }
    else {
      unsigned int v10 = v9;
    }
  }
  EshStroke::setPredefDashStyle((uint64_t)a4, v10);
}

@end