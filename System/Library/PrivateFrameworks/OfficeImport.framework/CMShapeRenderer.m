@interface CMShapeRenderer
+ (CGColor)_copyCGColorFromOADColor:(id)a3 andState:(id)a4;
+ (CGColor)_copyCGColorFromOADFill:(id)a3 andState:(id)a4;
+ (CGImage)copyImageFromOADImageFill:(id)a3 withContext:(id)a4;
+ (CGImage)copyImageFromOADImageFill:(id)a3 withMapper:(id)a4;
+ (void)_renderCGPath:(CGPath *)a3 stroke:(id)a4 fill:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8;
+ (void)_setupDrawingStyleInDrawingContext:(id)a3 dash:(id)a4 state:(id)a5;
+ (void)_setupDrawingStyleInDrawingContext:(id)a3 fill:(id)a4 stroke:(id)a5 state:(id)a6;
+ (void)_setupDrawingStyleInDrawingContext:(id)a3 stroke:(id)a4 state:(id)a5;
+ (void)renderCanonicalShape:(int)a3 fill:(id)a4 stroke:(id)a5 adjustValues:(id)a6 orientedBounds:(id)a7 state:(id)a8 drawingContext:(id)a9;
+ (void)renderDiagramPath:(id)a3 fill:(id)a4 stroke:(id)a5 state:(id)a6 drawingContext:(id)a7;
+ (void)renderFreeForm:(id)a3 fill:(id)a4 stroke:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8;
+ (void)renderLine:(int)a3 stroke:(id)a4 adjustValues:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8;
@end

@implementation CMShapeRenderer

+ (void)renderCanonicalShape:(int)a3 fill:(id)a4 stroke:(id)a5 adjustValues:(id)a6 orientedBounds:(id)a7 state:(id)a8 drawingContext:(id)a9
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = objc_alloc_init(CMCanonicalShapeBuilder);
  [(CMShapeBuilder *)v21 setOrientedBounds:v18];
  [(CMShapeBuilder *)v21 setShapeType:v13];
  [(CMShapeBuilder *)v21 setAdjustValues:v17];
  -[CMShapeBuilder setFileFormat:](v21, "setFileFormat:", [v19 sourceFormat]);
  memset(&v26, 0, sizeof(v26));
  if (v21)
  {
    [(CMCanonicalShapeBuilder *)v21 affineTransform];
    if (v20)
    {
LABEL_3:
      [v20 currentTransform];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    if (v20) {
      goto LABEL_3;
    }
  }
  memset(&t2, 0, sizeof(t2));
LABEL_6:
  CGAffineTransformConcat(&v26, &t1, &t2);
  CGAffineTransform v23 = v26;
  v22 = [(CMCanonicalShapeBuilder *)v21 copyShapeWithTransform:&v23];
  if (v22)
  {
    [a1 _renderCGPath:v22 stroke:v16 fill:v15 orientedBounds:v18 state:v19 drawingContext:v20];
    CGPathRelease(v22);
  }
}

+ (void)_renderCGPath:(CGPath *)a3 stroke:(id)a4 fill:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8
{
  id v17 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = (CGImage *)[a1 copyImageFromOADImageFill:v13 withContext:v15];
    if (v16)
    {
      [v15 setFillImage:v16];
      CGImageRelease(v16);
    }
    [a1 _setupDrawingStyleInDrawingContext:v15 fill:v13 stroke:v17 state:v14];
    [v15 addPath:a3];
    [v15 setFillImage:0];
  }
  else
  {
    [a1 _setupDrawingStyleInDrawingContext:v15 fill:v13 stroke:v17 state:v14];
    [v15 addPath:a3];
  }
}

+ (void)_setupDrawingStyleInDrawingContext:(id)a3 fill:(id)a4 stroke:(id)a5 state:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a6;
  [a1 _setupDrawingStyleInDrawingContext:v13 stroke:a5 state:v11];
  if (!v10 || (GenericRGBA = (CGColor *)[a1 _copyCGColorFromOADFill:v10 andState:v11]) == 0) {
    GenericRGBA = CMShapeRendererCreateGenericRGBA(0.0, 0.0, 0.0, 0.0);
  }
  [v13 setFillColor:GenericRGBA];
  CGColorRelease(GenericRGBA);
}

+ (void)_setupDrawingStyleInDrawingContext:(id)a3 stroke:(id)a4 state:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if (![v8 isFillOverridden]
      || ([v8 fill],
          id v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) == 0))
    {
      GenericRGBA = CMShapeRendererCreateGenericRGBA(0.0, 0.0, 0.0, 0.0);
      [v17 setStrokeColor:GenericRGBA];
      [v17 setFillColor:GenericRGBA];
      CGColorRelease(GenericRGBA);
      goto LABEL_16;
    }
    v12 = [v8 color];
    if (!v12)
    {
      v12 = [v8 fill];
      if (!v12) {
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_15:

        goto LABEL_16;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [v12 color];
      }
      else
      {
LABEL_10:
        uint64_t v13 = 0;
      }

      v12 = (void *)v13;
    }
    id v15 = (CGColor *)[a1 _copyCGColorFromOADColor:v12 andState:v9];
    if (v15)
    {
      [v17 setStrokeColor:v15];
      [v17 setFillColor:v15];
      CGColorRelease(v15);
    }
    [v8 width];
    objc_msgSend(v17, "setLineWidth:");
    id v16 = [v8 dash];
    [a1 _setupDrawingStyleInDrawingContext:v17 dash:v16 state:v9];

    goto LABEL_15;
  }
LABEL_16:
}

+ (CGColor)_copyCGColorFromOADFill:(id)a3 andState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = +[CMColorProperty nsColorFromOADFill:v5 state:v6];
    [v8 redComponent];
    double v10 = v9;
    [v8 greenComponent];
    double v12 = v11;
    [v8 blueComponent];
    double v14 = v13;
    [v8 alphaComponent];
    float v15 = v10;
    float v16 = v12;
    float v17 = v14;
    float v19 = v18;
    GenericRGBA = CMShapeRendererCreateGenericRGBA(v15, v16, v17, v19);
  }
  else
  {
    GenericRGBA = CMShapeRendererCreateGenericRGBA(1.0, 1.0, 1.0, 0.0);
  }

  return GenericRGBA;
}

+ (CGColor)_copyCGColorFromOADColor:(id)a3 andState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = +[CMColorProperty nsColorFromOADColor:v5 state:v6];
    [v7 redComponent];
    double v9 = v8;
    [v7 greenComponent];
    double v11 = v10;
    [v7 blueComponent];
    double v13 = v12;
    [v7 alphaComponent];
    float v14 = v9;
    float v15 = v11;
    float v16 = v13;
    float v18 = v17;
    GenericRGBA = CMShapeRendererCreateGenericRGBA(v14, v15, v16, v18);
  }
  else
  {
    GenericRGBA = CMShapeRendererCreateGenericRGBA(1.0, 1.0, 1.0, 1.0);
  }

  return GenericRGBA;
}

+ (void)_setupDrawingStyleInDrawingContext:(id)a3 dash:(id)a4 state:(id)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    if ([v7 type])
    {
      uint64_t v9 = [v7 equivalentCustomDash];

      id v7 = (id)v9;
LABEL_5:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v10 = objc_opt_new();
        double v11 = NSNumber;
        [v7 dash];
        double v12 = objc_msgSend(v11, "numberWithFloat:");
        [v10 addObject:v12];

        double v13 = NSNumber;
        [v7 space];
        float v14 = objc_msgSend(v13, "numberWithFloat:");
        [v10 addObject:v14];

        float v15 = v10;
      }
      else
      {
        float v15 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v16 = [v7 stops];
        unint64_t v17 = [v16 count];
        if (v17 >= 3) {
          uint64_t v18 = 3;
        }
        else {
          uint64_t v18 = v17;
        }
        float v19 = objc_opt_new();

        if (v18)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            v21 = NSNumber;
            v22 = [v16 objectAtIndexedSubscript:i];
            [v22 dash];
            CGAffineTransform v23 = objc_msgSend(v21, "numberWithFloat:");
            [v19 addObject:v23];

            v24 = NSNumber;
            v25 = [v16 objectAtIndexedSubscript:i];
            [v25 space];
            CGAffineTransform v26 = objc_msgSend(v24, "numberWithFloat:");
            [v19 addObject:v26];
          }
        }

        if (!v19) {
          goto LABEL_19;
        }
      }
      else
      {
        float v19 = v15;
        if (!v15)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      [v27 setLineDash:v19];
      goto LABEL_19;
    }
    [v27 setLineDash:0];
  }
LABEL_20:
}

+ (void)renderLine:(int)a3 stroke:(id)a4 adjustValues:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  float v19 = objc_alloc_init(CMLineShapeBuilder);
  [(CMShapeBuilder *)v19 setOrientedBounds:v16];
  [(CMShapeBuilder *)v19 setShapeType:v12];
  [(CMLineShapeBuilder *)v19 setStroke:v14];
  [(CMShapeBuilder *)v19 setAdjustValues:v15];
  -[CMShapeBuilder setFileFormat:](v19, "setFileFormat:", [v17 sourceFormat]);
  memset(&v24, 0, sizeof(v24));
  if (v19)
  {
    [(CMShapeBuilder *)v19 affineTransform];
    if (v18)
    {
LABEL_3:
      [v18 currentTransform];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&t1, 0, sizeof(t1));
    if (v18) {
      goto LABEL_3;
    }
  }
  memset(&t2, 0, sizeof(t2));
LABEL_6:
  CGAffineTransformConcat(&v24, &t1, &t2);
  CGAffineTransform v21 = v24;
  id v20 = [(CMLineShapeBuilder *)v19 copyShapeWithTransform:&v21];
  if (v20)
  {
    [a1 _renderCGPath:v20 stroke:v14 fill:0 orientedBounds:v16 state:v17 drawingContext:v18];
    CGPathRelease(v20);
  }
}

+ (void)renderFreeForm:(id)a3 fill:(id)a4 stroke:(id)a5 orientedBounds:(id)a6 state:(id)a7 drawingContext:(id)a8
{
  id v13 = a3;
  id v29 = a4;
  id v30 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = [v13 pathCount];
  if (v17)
  {
    for (uint64_t i = 0; v17 != i; ++i)
    {
      float v19 = [v13 pathAtIndex:i];
      if (v13)
      {
        [v13 geometryCoordSpace];
        int v20 = v36;
        int v21 = HIDWORD(v36);
      }
      else
      {
        int v21 = 0;
        int v20 = 0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
      }
      [v14 bounds];
      double v24 = v23;
      if (v23 == 0.0 || (double v25 = v22, v22 == 0.0))
      {

        break;
      }
      CGAffineTransform v26 = objc_alloc_init(CMFreeFormShapeBuilder);
      [(CMShapeBuilder *)v26 setOrientedBounds:v14];
      [(CMFreeFormShapeBuilder *)v26 setPath:v19];
      [(CMLineShapeBuilder *)v26 setStroke:v30];
      -[CMShapeBuilder setFileFormat:](v26, "setFileFormat:", [v15 sourceFormat]);
      -[CMFreeFormShapeBuilder setSpace:](v26, "setSpace:", (double)v20 / v24, (double)v21 / v25);
      memset(&v34, 0, sizeof(v34));
      if (v26)
      {
        [(CMFreeFormShapeBuilder *)v26 affineTransform];
        if (!v16) {
          goto LABEL_12;
        }
      }
      else
      {
        memset(&t1, 0, sizeof(t1));
        if (!v16)
        {
LABEL_12:
          memset(&t2, 0, sizeof(t2));
          goto LABEL_13;
        }
      }
      [v16 currentTransform];
LABEL_13:
      CGAffineTransformConcat(&v34, &t1, &t2);
      CGAffineTransform v31 = v34;
      id v27 = [(CMFreeFormShapeBuilder *)v26 copyShapeWithTransform:&v31];
      if (v27)
      {
        [a1 _renderCGPath:v27 stroke:v30 fill:v29 orientedBounds:v14 state:v15 drawingContext:v16];
        CGPathRelease(v27);
      }
    }
  }
}

+ (void)renderDiagramPath:(id)a3 fill:(id)a4 stroke:(id)a5 state:(id)a6 drawingContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = objc_alloc_init(CMFreeFormShapeBuilder);
  [(CMFreeFormShapeBuilder *)v17 setPath:v12];
  [(CMLineShapeBuilder *)v17 setStroke:v14];
  -[CMShapeBuilder setFileFormat:](v17, "setFileFormat:", [v15 sourceFormat]);
  -[CMFreeFormShapeBuilder setSpace:](v17, "setSpace:", 1.0, 1.0);
  if (v16) {
    [v16 currentTransform];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  id v18 = [(CMFreeFormShapeBuilder *)v17 copyShapeWithTransform:v19];
  if (v18)
  {
    [a1 _renderCGPath:v18 stroke:v14 fill:v13 orientedBounds:0 state:v15 drawingContext:v16];
    CGPathRelease(v18);
  }
}

+ (CGImage)copyImageFromOADImageFill:(id)a3 withMapper:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 isBlipRefOverridden])
  {
    id v8 = 0;
    goto LABEL_9;
  }
  id v7 = [v5 blipRef];
  id v8 = [v7 blip];
  if (v8)
  {

LABEL_4:
    uint64_t v9 = [v8 mainSubBlip];
    char v10 = [v9 load];

    if (v10)
    {
      double v11 = [v8 mainSubBlip];
      id v7 = [v11 data];

      if (v7)
      {
        id v12 = CGImageSourceCreateWithData((CFDataRef)v7, 0);
        id v13 = v12;
        if (v12)
        {
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
          CFRelease(v13);
LABEL_15:

          goto LABEL_16;
        }
      }
LABEL_14:
      ImageAtIndex = 0;
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v15 = [v7 index];
  if ((int)v15 < 1)
  {
    id v8 = 0;
    goto LABEL_14;
  }
  id v8 = [v6 blipAtIndex:v15];

  if (v8) {
    goto LABEL_4;
  }
LABEL_9:
  ImageAtIndex = 0;
LABEL_16:

  return ImageAtIndex;
}

+ (CGImage)copyImageFromOADImageFill:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 mapper];
  id v8 = (CGImage *)[a1 copyImageFromOADImageFill:v6 withMapper:v7];

  return v8;
}

@end