@interface OADShapeStyle
+ (id)defaultOfficeShapeStyle;
+ (id)defaultShapeStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectReference;
- (id)fillReference;
- (id)fontReference;
- (id)lineReference;
- (void)applyToGraphicProperties:(id)a3 styleMatrix:(id)a4;
- (void)applyToGraphicProperties:(id)a3 styleMatrix:(id)a4 useNull:(BOOL)a5 strokeWidthMultiplier:(float)a6;
- (void)applyToParagraphProperties:(id)a3;
- (void)applyToTextBody:(id)a3;
- (void)applyToTextListStyle:(id)a3;
- (void)setEffectMatrixIndex:(unsigned int)a3 color:(id)a4;
- (void)setEffectReference:(id)a3;
- (void)setFillMatrixIndex:(unsigned int)a3 color:(id)a4;
- (void)setFillReference:(id)a3;
- (void)setFontReference:(id)a3;
- (void)setLineMatrixIndex:(unsigned int)a3 color:(id)a4;
- (void)setLineReference:(id)a3;
@end

@implementation OADShapeStyle

- (void)setLineReference:(id)a3
{
}

- (void)setFillReference:(id)a3
{
}

- (void)setEffectReference:(id)a3
{
}

- (void)setFontReference:(id)a3
{
}

- (void)applyToGraphicProperties:(id)a3 styleMatrix:(id)a4
{
  LODWORD(v4) = 1.0;
  [(OADShapeStyle *)self applyToGraphicProperties:a3 styleMatrix:a4 useNull:0 strokeWidthMultiplier:v4];
}

- (void)applyToGraphicProperties:(id)a3 styleMatrix:(id)a4 useNull:(BOOL)a5 strokeWidthMultiplier:(float)a6
{
  BOOL v7 = a5;
  id v29 = a3;
  id v10 = a4;
  uint64_t v11 = [v29 isMergedWithParent];
  [v29 setMergedWithParent:0];
  mLineReference = self->mLineReference;
  if (mLineReference)
  {
    v13 = objc_msgSend(v10, "strokeAtIndex:", -[OADStyleMatrixReference matrixIndex](mLineReference, "matrixIndex"));
    if (v13) {
      goto LABEL_7;
    }
  }
  else
  {
    v13 = 0;
  }
  if (v7)
  {
    v13 = +[OADStroke nullStroke];
  }
LABEL_7:
  if (v13)
  {
    v14 = (void *)[v13 copy];

    if (a6 != 1.0)
    {
      [v14 width];
      *(float *)&double v16 = v15 * a6;
      [v14 setWidth:v16];
    }
    v17 = [(OADStyleMatrixReference *)self->mLineReference color];
    if (v17) {
      [v14 setStyleColor:v17];
    }
    if ([v29 hasStroke])
    {
      v18 = [v29 stroke];
      [v18 setParent:v14];
    }
    else
    {
      [v29 setStroke:v14];
    }
  }
  else
  {
    v14 = 0;
  }
  mFillReference = self->mFillReference;
  if (mFillReference)
  {
    v20 = objc_msgSend(v10, "fillAtIndex:", -[OADStyleMatrixReference matrixIndex](mFillReference, "matrixIndex"));
    if (v20) {
      goto LABEL_23;
    }
  }
  else
  {
    v20 = 0;
  }
  if (v7)
  {
    v20 = +[OADNullFill nullFill];
  }
LABEL_23:
  if (v20)
  {
    v21 = (void *)[v20 copy];

    v22 = [(OADStyleMatrixReference *)self->mFillReference color];
    if (v22)
    {
      [v21 setStyleColor:v22];
    }
    else
    {
      uint64_t v23 = +[OADNullFill nullFill];

      v21 = (void *)v23;
    }
    if ([v29 hasFill])
    {
      v24 = [v29 fill];
      if ([v21 isMemberOfClass:objc_opt_class()]) {
        [v24 setParent:v21];
      }
    }
    else
    {
      [v21 setDefinedByStyle:1];
      [v29 setFill:v21];
    }

    v20 = v21;
  }
  if (([v29 hasEffects] & 1) == 0)
  {
    mEffectReference = self->mEffectReference;
    if (mEffectReference)
    {
      v26 = objc_msgSend(v10, "effectsAtIndex:", -[OADStyleMatrixReference matrixIndex](mEffectReference, "matrixIndex"));
    }
    else
    {
      v26 = 0;
    }
    if (!v26 && v7)
    {
      v26 = [MEMORY[0x263EFF8C0] array];
    }
    if (v26)
    {
      v27 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v26 copyItems:1];

      v28 = [(OADStyleMatrixReference *)self->mEffectReference color];
      if (v28) {
        [v27 makeObjectsPerformSelector:sel_setStyleColor_ withObject:v28];
      }
      [v29 setEffects:v27];
    }
  }
  [v29 setMergedWithParent:v11];
}

- (void)applyToTextListStyle:(id)a3
{
  id v7 = a3;
  double v4 = [v7 defaultProperties];
  [(OADShapeStyle *)self applyToParagraphProperties:v4];

  for (uint64_t i = 0; i != 9; ++i)
  {
    v6 = [v7 propertiesForListLevel:i];
    [(OADShapeStyle *)self applyToParagraphProperties:v6];
  }
}

- (void)applyToParagraphProperties:(id)a3
{
}

- (void)applyToTextBody:(id)a3
{
  id v9 = a3;
  double v4 = [v9 overrideTextListStyle];
  if (v4)
  {
    [(OADShapeStyle *)self applyToTextListStyle:v4];
  }
  else
  {
    uint64_t v5 = [v9 paragraphCount];
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [v9 paragraphAtIndex:i];
        v8 = [v7 properties];
        [(OADShapeStyle *)self applyToParagraphProperties:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(OADStyleMatrixReference *)self->mLineReference copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(OADStyleMatrixReference *)self->mFillReference copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(OADStyleMatrixReference *)self->mEffectReference copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(OADFontReference *)self->mFontReference copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)fillReference
{
  return self->mFillReference;
}

- (id)lineReference
{
  return self->mLineReference;
}

- (id)fontReference
{
  return self->mFontReference;
}

- (void)setFillMatrixIndex:(unsigned int)a3 color:(id)a4
{
  id v8 = a4;
  id v6 = [[OADStyleMatrixReference alloc] initWithMatrixIndex:a3 color:v8];
  mFillReference = self->mFillReference;
  self->mFillReference = v6;
}

- (void)setLineMatrixIndex:(unsigned int)a3 color:(id)a4
{
  id v8 = a4;
  id v6 = [[OADStyleMatrixReference alloc] initWithMatrixIndex:a3 color:v8];
  mLineReference = self->mLineReference;
  self->mLineReference = v6;
}

- (void)setEffectMatrixIndex:(unsigned int)a3 color:(id)a4
{
  id v8 = a4;
  id v6 = [[OADStyleMatrixReference alloc] initWithMatrixIndex:a3 color:v8];
  mEffectReference = self->mEffectReference;
  self->mEffectReference = v6;
}

+ (id)defaultShapeStyle
{
  v2 = (void *)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle;
  if (!+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle)
  {
    v3 = objc_alloc_init(OADShapeStyle);
    double v4 = (void *)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle;
    +[OADShapeStyle defaultShapeStyle]::defaultShapeStyle = (uint64_t)v3;

    [(id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle setLineMatrixIndex:0 color:0];
    [(id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle setFillMatrixIndex:0 color:0];
    [(id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle setEffectMatrixIndex:0 color:0];
    uint64_t v5 = objc_alloc_init(OADFontReference);
    [(OADFontReference *)v5 setIndex:0xFFFFFFFFLL];
    [(id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle setFontReference:v5];

    v2 = (void *)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle;
  }
  return v2;
}

+ (id)defaultOfficeShapeStyle
{
  v2 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
  if (!+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle)
  {
    v3 = objc_alloc_init(OADShapeStyle);
    double v4 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    +[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle = (uint64_t)v3;

    uint64_t v5 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    id v6 = +[OADSchemeColor schemeColorWithIndex:4];
    [v5 setLineMatrixIndex:1 color:v6];

    id v7 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    id v8 = +[OADSchemeColor schemeColorWithIndex:4];
    [v7 setFillMatrixIndex:3 color:v8];

    id v9 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    id v10 = +[OADSchemeColor schemeColorWithIndex:4];
    [v9 setEffectMatrixIndex:2 color:v10];

    uint64_t v11 = objc_alloc_init(OADFontReference);
    [(OADFontReference *)v11 setIndex:1];
    id v12 = +[OADSchemeColor schemeColorWithIndex:1];
    [(OADFontReference *)v11 setColor:v12];

    [(id)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle setFontReference:v11];
    v2 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
  }
  return v2;
}

- (id)effectReference
{
  return self->mEffectReference;
}

- (id)description
{
  v3 = +[OITSUDescription descriptionWithObject:self class:objc_opt_class()];
  double v4 = [(OADStyleMatrixReference *)self->mLineReference description];
  [v3 addField:@"Line" value:v4];

  uint64_t v5 = [(OADStyleMatrixReference *)self->mFillReference description];
  [v3 addField:@"Fill" value:v5];

  id v6 = [(OADStyleMatrixReference *)self->mEffectReference description];
  [v3 addField:@"Effect" value:v6];

  id v7 = [(OADFontReference *)self->mFontReference description];
  [v3 addField:@"Font" value:v7];

  id v8 = [v3 descriptionString];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontReference, 0);
  objc_storeStrong((id *)&self->mEffectReference, 0);
  objc_storeStrong((id *)&self->mFillReference, 0);
  objc_storeStrong((id *)&self->mLineReference, 0);
}

@end