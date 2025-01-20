@interface CMBordersProperty
+ (BOOL)isStroked:(id)a3;
- (BOOL)isNoneAtLocation:(int)a3;
- (CMBordersProperty)init;
- (CMBordersProperty)initWithOADStroke:(id)a3;
- (id)colorString;
- (id)cssString;
- (id)cssStringForName:(id)a3;
- (id)stringFromColor:(id)a3;
- (id)stringFromStyleEnum:(int)a3;
- (id)stringFromWidthEnum:(int)a3;
- (id)styleString;
- (id)widthString;
- (void)adjustValues;
- (void)setFromOadStroke:(id)a3 atLocation:(int)a4 state:(id)a5;
- (void)setNoneAtLocation:(int)a3;
@end

@implementation CMBordersProperty

- (CMBordersProperty)init
{
  v7.receiver = self;
  v7.super_class = (Class)CMBordersProperty;
  v2 = [(CMBordersProperty *)&v7 init];
  v3 = v2;
  if (v2)
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      v2->mBorderStyle[i] = -1;
      v2->mBorderWidth[i] = -1;
    }
    mBorderColor = v2->mBorderColor;
    v2->mBorderColor = 0;

    v3->mCustomWidth = 0;
  }
  return v3;
}

- (void)adjustValues
{
  if (self->mBorderStyle[0] == -1)
  {
    int v2 = self->mBorderStyle[1];
    if (v2 == self->mBorderStyle[2] && v2 == self->mBorderStyle[3] && v2 == self->mBorderStyle[4]) {
      self->mBorderStyle[0] = v2;
    }
  }
  if (self->mBorderWidth[0] == -1)
  {
    int v3 = self->mBorderWidth[1];
    if (v3 == self->mBorderWidth[2] && v3 == self->mBorderWidth[3] && v3 == self->mBorderWidth[4]) {
      self->mBorderWidth[0] = v3;
    }
  }
  if (!self->mBorderColor)
  {
    mBorderTopColor = self->mBorderTopColor;
    if (mBorderTopColor == self->mBorderLeftColor
      && mBorderTopColor == self->mBorderRightColor
      && mBorderTopColor == self->mBorderBottomColor)
    {
      objc_storeStrong((id *)&self->mBorderColor, mBorderTopColor);
    }
  }
}

- (id)cssStringForName:(id)a3
{
  if (self->mBorderStyle[0])
  {
    int v3 = [(CMBordersProperty *)self cssString];
  }
  else
  {
    int v3 = @"border-style:none;";
  }
  return v3;
}

- (id)cssString
{
  int v3 = (void *)MEMORY[0x263F089D8];
  v4 = [(CMBordersProperty *)self styleString];
  v5 = [v3 stringWithString:v4];

  v6 = [(CMBordersProperty *)self widthString];
  [v5 appendString:v6];

  objc_super v7 = [(CMBordersProperty *)self colorString];
  [v5 appendString:v7];

  return v5;
}

- (id)styleString
{
  mBorderStyle = (unsigned int *)self->mBorderStyle;
  if (self->mBorderStyle[0] != -1)
  {
    v4 = [MEMORY[0x263F089D8] stringWithString:0x26EC19358];
    v5 = [(CMBordersProperty *)self stringFromStyleEnum:*mBorderStyle];
    [v4 appendString:v5];
    v6 = v4;
LABEL_12:

    goto LABEL_13;
  }
  if (self->mBorderStyle[1] == -1)
  {
    v6 = [MEMORY[0x263F089D8] stringWithString:&stru_26EBF24D8];
  }
  else
  {
    objc_super v7 = [MEMORY[0x263F089D8] stringWithString:0x26EC19398];
    v8 = [(CMBordersProperty *)self stringFromStyleEnum:mBorderStyle[1]];
    [v7 appendString:v8];

    v6 = v7;
  }
  if (mBorderStyle[2] != -1)
  {
    [v6 appendString:0x26EC192B8];
    v9 = [(CMBordersProperty *)self stringFromStyleEnum:mBorderStyle[2]];
    [v6 appendString:v9];
  }
  if (mBorderStyle[3] != -1)
  {
    [v6 appendString:0x26EC19238];
    v10 = [(CMBordersProperty *)self stringFromStyleEnum:mBorderStyle[3]];
    [v6 appendString:v10];
  }
  if (mBorderStyle[4] != -1)
  {
    [v6 appendString:0x26EC19318];
    v5 = [(CMBordersProperty *)self stringFromStyleEnum:mBorderStyle[4]];
    [v6 appendString:v5];
    goto LABEL_12;
  }
LABEL_13:
  id v11 = v6;

  return v11;
}

- (id)stringFromStyleEnum:(int)a3
{
  if (a3 > 4) {
    return @":solid;";
  }
  else {
    return off_264D687F0[a3];
  }
}

- (id)widthString
{
  mBorderWidth = (unsigned int *)self->mBorderWidth;
  if (self->mBorderWidth[0] != -1)
  {
    v4 = [MEMORY[0x263F089D8] stringWithString:0x26EC193D8];
    v5 = [(CMBordersProperty *)self stringFromWidthEnum:*mBorderWidth];
    [v4 appendString:v5];
    v6 = v4;
LABEL_12:

    goto LABEL_13;
  }
  if (self->mBorderWidth[1] == -1)
  {
    v6 = [MEMORY[0x263F089D8] stringWithString:&stru_26EBF24D8];
  }
  else
  {
    objc_super v7 = [MEMORY[0x263F089D8] stringWithString:0x26EC193B8];
    v8 = [(CMBordersProperty *)self stringFromWidthEnum:mBorderWidth[1]];
    [v7 appendString:v8];

    v6 = v7;
  }
  if (mBorderWidth[2] != -1)
  {
    [v6 appendString:0x26EC192D8];
    v9 = [(CMBordersProperty *)self stringFromWidthEnum:mBorderWidth[2]];
    [v6 appendString:v9];
  }
  if (mBorderWidth[3] != -1)
  {
    [v6 appendString:0x26EC19258];
    v10 = [(CMBordersProperty *)self stringFromWidthEnum:mBorderWidth[3]];
    [v6 appendString:v10];
  }
  if (mBorderWidth[4] != -1)
  {
    [v6 appendString:0x26EC19338];
    v5 = [(CMBordersProperty *)self stringFromWidthEnum:mBorderWidth[4]];
    [v6 appendString:v5];
    goto LABEL_12;
  }
LABEL_13:
  id v11 = v6;

  return v11;
}

- (id)stringFromWidthEnum:(int)a3
{
  v5 = @":0;";
  switch(a3)
  {
    case 0:
      goto LABEL_3;
    case 2:
      v5 = @":medium;";
      break;
    case 3:
      v5 = @":thick;";
      break;
    case 4:
      objc_msgSend(NSString, "stringWithFormat:", @": %d;", self->mCustomWidth);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = @":thin;";
LABEL_3:
      break;
  }
  return v5;
}

- (id)colorString
{
  if (self->mBorderColor)
  {
    uint64_t v3 = [MEMORY[0x263F089D8] stringWithString:0x26EC19278];
    [(CMBordersProperty *)self stringFromColor:self->mBorderColor];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F089D8] stringWithString:0x26EC19378];
    v5 = [(CMBordersProperty *)self stringFromColor:self->mBorderTopColor];
    [v3 appendString:v5];

    [v3 appendString:0x26EC19298];
    v6 = [(CMBordersProperty *)self stringFromColor:self->mBorderLeftColor];
    [v3 appendString:v6];

    [v3 appendString:0x26EC19218];
    objc_super v7 = [(CMBordersProperty *)self stringFromColor:self->mBorderBottomColor];
    [v3 appendString:v7];

    [v3 appendString:0x26EC192F8];
    [(CMBordersProperty *)self stringFromColor:self->mBorderRightColor];
  v4 = };
  [v3 appendString:v4];

  return v3;
}

- (id)stringFromColor:(id)a3
{
  id v3 = a3;
  if (([v3 isBlack] & 1) != 0
    || ([v3 redComponent], v5 == 1.0)
    && ([v3 greenComponent], v6 == 1.0)
    && ([v3 blueComponent], v7 == 1.0)
    && ([v3 alphaComponent], v8 == 0.0))
  {
    v4 = @":black;";
  }
  else
  {
    v9 = [[CMColorProperty alloc] initWithColor:v3];
    v4 = [(CMColorProperty *)v9 cssStringForName:&stru_26EBF24D8];
  }
  return v4;
}

- (CMBordersProperty)initWithOADStroke:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CMBordersProperty;
  double v5 = [(CMBordersProperty *)&v28 init];
  double v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  v5->mCustomWidth = 0;
  if (![v4 isFillOverridden]
    || ([v4 width], v7 == 0.0)
    || ([v4 fill],
        double v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) == 0))
  {
    v6->mBorderStyle[0] = 0;
    goto LABEL_10;
  }
  v10 = [v4 fill];
  v6->mBorderWidth[0] = 1;
  if ([v4 isDashOverridden])
  {
    id v11 = [v4 dash];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v4 dash];
      int v13 = [v12 type];

      if (v13)
      {
        int v14 = 3;
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  if ([v4 isCompoundTypeOverridden] && objc_msgSend(v4, "compoundType"))
  {
    v6->mBorderStyle[0] = 2;
    v6->mBorderWidth[0] = 2;
    goto LABEL_17;
  }
  int v14 = 1;
LABEL_16:
  v6->mBorderStyle[0] = v14;
LABEL_17:
  uint64_t v16 = +[OITSUColor blackColor];
  mBorderColor = v6->mBorderColor;
  v6->mBorderColor = (OITSUColor *)v16;

  if ([v10 isColorOverridden])
  {
    v18 = [v10 color];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      v20 = [v10 color];
      [v20 red];
      float v22 = v21;
      [v20 green];
      float v24 = v23;
      [v20 blue];
      uint64_t v26 = +[OITSUColor colorWithCalibratedRed:v22 green:v24 blue:v25 alpha:1.0];
      v27 = v6->mBorderColor;
      v6->mBorderColor = (OITSUColor *)v26;
    }
  }

LABEL_10:
  return v6;
}

+ (BOOL)isStroked:(id)a3
{
  id v3 = a3;
  if ([v3 isFillOverridden])
  {
    id v4 = [v3 fill];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setFromOadStroke:(id)a3 atLocation:(int)a4 state:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  if (![v22 isFillOverridden]
    || ([v22 fill],
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) == 0))
  {
    self->mBorderStyle[a4] = 0;
    goto LABEL_23;
  }
  id v11 = [v22 fill];
  mBorderWidth = self->mBorderWidth;
  self->mBorderWidth[a4] = 1;
  if ([v22 isDashOverridden])
  {
    int v13 = [v22 dash];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [v22 dash];
      int v15 = [v14 type];

      if (v15)
      {
        mBorderStyle = self->mBorderStyle;
        int v17 = 3;
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  if ([v22 isCompoundTypeOverridden] && objc_msgSend(v22, "compoundType"))
  {
    self->mBorderStyle[a4] = 2;
    mBorderWidth[a4] = 2;
    goto LABEL_14;
  }
  mBorderStyle = self->mBorderStyle;
  int v17 = 1;
LABEL_13:
  mBorderStyle[a4] = v17;
LABEL_14:
  if ([v22 isWidthOverridden])
  {
    [v22 width];
    if (v18 > 1.5)
    {
      int *mBorderWidth = 4;
      [v22 width];
      self->mCustomWidth = (int)v19;
    }
  }
  if ([v11 isColorOverridden])
  {
    v20 = +[CMColorProperty nsColorFromOADFill:v11 state:v8];
    if ((a4 - 1) >= 4) {
      float v21 = &OBJC_IVAR___CMBordersProperty_mBorderColor;
    }
    else {
      float v21 = off_264D687D0[a4 - 1];
    }
    objc_storeStrong((id *)((char *)&self->super.super.isa + *v21), v20);
  }
LABEL_23:
}

- (BOOL)isNoneAtLocation:(int)a3
{
  return self->mBorderStyle[a3] == 0;
}

- (void)setNoneAtLocation:(int)a3
{
  mBorderStyle = self->mBorderStyle;
  self->mBorderStyle[a3] = 0;
  if (a3)
  {
    if (*mBorderStyle) {
      int *mBorderStyle = -1;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBorderRightColor, 0);
  objc_storeStrong((id *)&self->mBorderBottomColor, 0);
  objc_storeStrong((id *)&self->mBorderLeftColor, 0);
  objc_storeStrong((id *)&self->mBorderTopColor, 0);
  objc_storeStrong((id *)&self->mBorderColor, 0);
}

@end