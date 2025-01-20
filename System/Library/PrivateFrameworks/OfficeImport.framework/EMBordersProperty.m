@interface EMBordersProperty
- (BOOL)hasSameColorsAs:(id)a3;
- (BOOL)hasSameStylesAs:(id)a3;
- (BOOL)hasSameWidthsAs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoneAtLocation:(int)a3;
- (EMBordersProperty)initWithEDBorders:(id)a3;
- (EMBordersProperty)initWithOADStroke:(id)a3;
- (id)borderColor;
- (id)colorString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cssString;
- (id)cssStringForName:(id)a3;
- (id)stringFromColor:(id)a3;
- (id)stringFromStyleEnum:(int)a3;
- (id)stringFromWidthEnum:(int)a3;
- (id)styleHashNumber;
- (id)styleString;
- (id)widthHashNumber;
- (id)widthString;
- (int)borderStyles;
- (int)borderWidths;
- (void)setBorderStyleAndWidth:(int)a3 location:(unsigned int)a4;
- (void)setNoneAtLocation:(int)a3;
@end

@implementation EMBordersProperty

- (EMBordersProperty)initWithEDBorders:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)EMBordersProperty;
  v5 = [(EMBordersProperty *)&v29 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = [v4 topBorder];
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", [v7 type], 0);
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", [v7 type], 1);
      uint64_t v8 = [v7 color];
      mBorderColor = v6->mBorderColor;
      v6->mBorderColor = (OITSUColor *)v8;

      objc_storeStrong((id *)&v6->mBorderTopColor, v6->mBorderColor);
      v10 = [v4 leftBorder];

      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", [v10 type], 2);
      uint64_t v11 = [v10 color];
      mBorderLeftColor = v6->mBorderLeftColor;
      v6->mBorderLeftColor = (OITSUColor *)v11;

      mBorderStyle = v6->mBorderStyle;
      if (v6->mBorderStyle[2] != v6->mBorderStyle[0]) {
        int *mBorderStyle = -1;
      }
      mBorderWidth = v6->mBorderWidth;
      if (v6->mBorderWidth[2] != v6->mBorderWidth[0]) {
        int *mBorderWidth = -1;
      }
      v15 = v6->mBorderColor;
      if (v15 && ![(OITSUColor *)v15 isEqual:v6->mBorderLeftColor])
      {
        v16 = v6->mBorderColor;
        v6->mBorderColor = 0;
      }
      v17 = [v4 bottomBorder];

      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", [v17 type], 3);
      uint64_t v18 = [v17 color];
      mBorderBottomColor = v6->mBorderBottomColor;
      v6->mBorderBottomColor = (OITSUColor *)v18;

      if (v6->mBorderStyle[3] != v6->mBorderStyle[0]) {
        int *mBorderStyle = -1;
      }
      if (v6->mBorderWidth[3] != *mBorderWidth) {
        int *mBorderWidth = -1;
      }
      v20 = v6->mBorderColor;
      if (v20 && ![(OITSUColor *)v20 isEqual:v6->mBorderBottomColor])
      {
        v21 = v6->mBorderColor;
        v6->mBorderColor = 0;
      }
      v22 = [v4 rightBorder];

      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", [v22 type], 4);
      uint64_t v23 = [v22 color];
      mBorderRightColor = v6->mBorderRightColor;
      v6->mBorderRightColor = (OITSUColor *)v23;

      if (v6->mBorderStyle[4] != v6->mBorderStyle[0]) {
        int *mBorderStyle = -1;
      }
      if (v6->mBorderWidth[4] != *mBorderWidth) {
        int *mBorderWidth = -1;
      }
      v25 = v6->mBorderColor;
      if (v25 && ![(OITSUColor *)v25 isEqual:v6->mBorderRightColor])
      {
        v26 = v6->mBorderColor;
        v6->mBorderColor = 0;
      }
    }
    else
    {
      [(EMBordersProperty *)v5 setBorderStyleAndWidth:6 location:1];
      [(EMBordersProperty *)v6 setBorderStyleAndWidth:13 location:2];
      [(EMBordersProperty *)v6 setBorderStyleAndWidth:12 location:3];
      [(EMBordersProperty *)v6 setBorderStyleAndWidth:0 location:4];
      v6->mBorderStyle[0] = -1;
      v6->mBorderWidth[0] = -1;
      uint64_t v27 = +[OITSUColor blackColor];
      v22 = v6->mBorderColor;
      v6->mBorderColor = (OITSUColor *)v27;
    }
  }
  return v6;
}

- (void)setBorderStyleAndWidth:(int)a3 location:(unsigned int)a4
{
  switch(a3)
  {
    case 3:
    case 5:
    case 8:
      mBorderStyle = self->mBorderStyle;
      uint64_t v5 = a4;
      int v6 = 3;
      goto LABEL_5;
    case 4:
      mBorderStyle = self->mBorderStyle;
      uint64_t v5 = a4;
      int v6 = 4;
LABEL_5:
      mBorderStyle[a4] = v6;
      int v7 = 1;
      break;
    case 6:
      uint64_t v8 = self->mBorderStyle;
      uint64_t v5 = a4;
      int v7 = 1;
      goto LABEL_10;
    case 11:
      uint64_t v5 = a4;
      self->mBorderStyle[a4] = 1;
      int v7 = 2;
      break;
    case 12:
      uint64_t v5 = a4;
      self->mBorderStyle[a4] = 1;
      int v7 = 3;
      break;
    case 13:
      uint64_t v8 = self->mBorderStyle;
      uint64_t v5 = a4;
      int v7 = 2;
LABEL_10:
      v8[a4] = v7;
      break;
    default:
      int v7 = 0;
      uint64_t v5 = a4;
      self->mBorderStyle[a4] = 0;
      break;
  }
  self->mBorderWidth[v5] = v7;
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

- (id)cssStringForName:(id)a3
{
  if (self->mBorderStyle[0])
  {
    v3 = [(EMBordersProperty *)self cssString];
  }
  else
  {
    v3 = &stru_26EBF24D8;
  }
  return v3;
}

- (id)cssString
{
  v3 = [(EMBordersProperty *)self styleString];
  id v4 = [(EMBordersProperty *)self widthString];
  uint64_t v5 = [(EMBordersProperty *)self colorString];
  if ([v3 length] || objc_msgSend(v4, "length") || objc_msgSend(v5, "length"))
  {
    id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v3 length]) {
      [v6 appendString:v3];
    }
    if ([v4 length]) {
      [v6 appendString:v4];
    }
    if ([v5 length]) {
      [v6 appendString:v5];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)styleString
{
  v14[4] = *MEMORY[0x263EF8340];
  v3 = [(EMBordersProperty *)self styleHashNumber];
  p_vtable = &OBJC_METACLASS___EMChartMapper.vtable;
  uint64_t v5 = +[EMWorkbookMapper borderStyleCache];
  id v6 = [v5 objectForKey:v3];

  if (v6)
  {
    id v7 = v6;
    goto LABEL_19;
  }
  if (self->mBorderStyle[0] != -1)
  {
    uint64_t v8 = -[EMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:");
    if (v8)
    {
      id v7 = [MEMORY[0x263F089D8] stringWithString:0x26EC19358];
      [v7 appendString:v8];
    }
    else
    {
      id v7 = 0;
    }

    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v14[0] = @"border-top-style";
  v14[1] = @"border-left-style";
  v14[2] = @"border-bottom-style";
  uint64_t v9 = 0;
  id v7 = 0;
  v14[3] = @"border-right-style";
  do
  {
    v10 = [(EMBordersProperty *)self stringFromStyleEnum:self->mBorderStyle[dword_238EF1580[v9]]];
    if (v10)
    {
      if (!v7) {
        id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
      }
      [v7 appendString:v14[v9]];
      [v7 appendString:v10];
    }

    ++v9;
  }
  while (v9 != 4);
  uint64_t v11 = 3;
  p_vtable = (void **)(&OBJC_METACLASS___EMChartMapper + 24);
  do

  while (v11 != -1);
  if (v7)
  {
LABEL_18:
    v12 = [p_vtable + 102 borderStyleCache];
    [v12 setObject:v7 forKey:v3];
  }
LABEL_19:

  return v7;
}

- (id)styleHashNumber
{
  uint64_t v2 = self->mBorderStyle[0];
  if (v2 == -1) {
    uint64_t v2 = vaddvq_s32(vmulq_s32(*(int32x4_t *)&self->mBorderStyle[1], (int32x4_t)xmmword_238EF1570));
  }
  return (id)[NSNumber numberWithInt:v2];
}

- (id)stringFromStyleEnum:(int)a3
{
  if (a3 > 4) {
    return @":solid;";
  }
  else {
    return (id)qword_264D68AF8[a3];
  }
}

- (id)widthString
{
  v14[4] = *MEMORY[0x263EF8340];
  v3 = [(EMBordersProperty *)self widthHashNumber];
  p_vtable = &OBJC_METACLASS___EMChartMapper.vtable;
  uint64_t v5 = +[EMWorkbookMapper borderWidthCache];
  id v6 = [v5 objectForKey:v3];

  if (v6)
  {
    id v7 = v6;
    goto LABEL_19;
  }
  if (self->mBorderStyle[0] != -1)
  {
    uint64_t v8 = [(EMBordersProperty *)self stringFromWidthEnum:self->mBorderWidth[0]];
    if (v8)
    {
      id v7 = [MEMORY[0x263F089D8] stringWithString:0x26EC193D8];
      [v7 appendString:v8];
    }
    else
    {
      id v7 = 0;
    }

    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v14[0] = @"border-top-width";
  v14[1] = @"border-left-width";
  v14[2] = @"border-bottom-width";
  uint64_t v9 = 0;
  id v7 = 0;
  v14[3] = @"border-right-width";
  do
  {
    v10 = [(EMBordersProperty *)self stringFromWidthEnum:self->mBorderWidth[dword_238EF1580[v9]]];
    if (v10)
    {
      if (!v7) {
        id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
      }
      [v7 appendString:v14[v9]];
      [v7 appendString:v10];
    }

    ++v9;
  }
  while (v9 != 4);
  uint64_t v11 = 3;
  p_vtable = (void **)(&OBJC_METACLASS___EMChartMapper + 24);
  do

  while (v11 != -1);
  if (v7)
  {
LABEL_18:
    v12 = [p_vtable + 102 borderWidthCache];
    [v12 setObject:v7 forKey:v3];
  }
LABEL_19:

  return v7;
}

- (id)widthHashNumber
{
  uint64_t v2 = self->mBorderWidth[0];
  if (v2 == -1) {
    uint64_t v2 = vaddvq_s32(vmulq_s32(*(int32x4_t *)&self->mBorderWidth[1], (int32x4_t)xmmword_238EF1570));
  }
  return (id)[NSNumber numberWithInt:v2];
}

- (id)stringFromWidthEnum:(int)a3
{
  if (a3 > 3) {
    return @":solid;";
  }
  else {
    return (id)qword_264D68B20[a3];
  }
}

- (id)colorString
{
  if (self->mBorderColor)
  {
    v3 = [MEMORY[0x263F089D8] stringWithString:0x26EC19278];
    [(EMBordersProperty *)self stringFromColor:self->mBorderColor];
  }
  else
  {
    v3 = [MEMORY[0x263F089D8] stringWithString:0x26EC19378];
    uint64_t v5 = [(EMBordersProperty *)self stringFromColor:self->mBorderTopColor];
    [v3 appendString:v5];

    [v3 appendString:0x26EC19298];
    id v6 = [(EMBordersProperty *)self stringFromColor:self->mBorderLeftColor];
    [v3 appendString:v6];

    [v3 appendString:0x26EC19218];
    id v7 = [(EMBordersProperty *)self stringFromColor:self->mBorderBottomColor];
    [v3 appendString:v7];

    [v3 appendString:0x26EC192F8];
    [(EMBordersProperty *)self stringFromColor:self->mBorderRightColor];
  id v4 = };
  [v3 appendString:v4];

  return v3;
}

- (id)stringFromColor:(id)a3
{
  id v3 = a3;
  if ([v3 isBlack])
  {
    id v4 = @":black;";
  }
  else
  {
    uint64_t v5 = [[CMColorProperty alloc] initWithColor:v3];
    id v4 = [(CMColorProperty *)v5 cssStringForName:&stru_26EBF24D8];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(EMBordersProperty *)self isNoneAtLocation:0]
      && ([v5 isNoneAtLocation:0] & 1) != 0)
    {
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = [(EMBordersProperty *)self hasSameColorsAs:v5]
        && [(EMBordersProperty *)self hasSameStylesAs:v5]
        && [(EMBordersProperty *)self hasSameWidthsAs:v5];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[EMBordersProperty allocWithZone:a3] init];
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->mBorderColor, self->mBorderColor);
    objc_storeStrong(p_isa + 3, self->mBorderTopColor);
    objc_storeStrong(p_isa + 4, self->mBorderLeftColor);
    objc_storeStrong(p_isa + 5, self->mBorderBottomColor);
    objc_storeStrong(p_isa + 6, self->mBorderRightColor);
    for (uint64_t i = 0; i != 5; ++i)
      *(_DWORD *)((char *)p_isa + i * 4 + 56) = self->mBorderStyle[i];
    for (uint64_t j = 0; j != 5; ++j)
      *(_DWORD *)((char *)p_isa + j * 4 + 76) = self->mBorderWidth[j];
    uint64_t v8 = p_isa;
  }

  return p_isa;
}

- (EMBordersProperty)initWithOADStroke:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EMBordersProperty;
  id v5 = [(EMBordersProperty *)&v26 init];
  if (!v5) {
    goto LABEL_19;
  }
  if (![v4 isFillOverridden]
    || ([v4 fill],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) == 0))
  {
    v5->mBorderStyle[0] = 0;
    goto LABEL_19;
  }
  uint64_t v8 = [v4 fill];
  v5->mBorderWidth[0] = 1;
  if ([v4 isDashOverridden])
  {
    uint64_t v9 = [v4 dash];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v4 dash];
      int v11 = [v10 type];

      if (v11)
      {
        int v12 = 3;
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  if ([v4 isCompoundTypeOverridden] && objc_msgSend(v4, "compoundType"))
  {
    v5->mBorderStyle[0] = 2;
    v5->mBorderWidth[0] = 2;
    goto LABEL_15;
  }
  int v12 = 1;
LABEL_14:
  v5->mBorderStyle[0] = v12;
LABEL_15:
  uint64_t v13 = +[OITSUColor blackColor];
  mBorderColor = v5->mBorderColor;
  v5->mBorderColor = (OITSUColor *)v13;

  if ([v8 isColorOverridden])
  {
    v15 = [v8 color];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if (v16)
    {
      v17 = [v8 color];
      [v17 red];
      float v19 = v18;
      [v17 green];
      float v21 = v20;
      [v17 blue];
      uint64_t v23 = +[OITSUColor colorWithCalibratedRed:v19 green:v21 blue:v22 alpha:1.0];
      v24 = v5->mBorderColor;
      v5->mBorderColor = (OITSUColor *)v23;
    }
  }

LABEL_19:
  return v5;
}

- (id)borderColor
{
  return self->mBorderColor;
}

- (int)borderStyles
{
  return self->mBorderStyle;
}

- (int)borderWidths
{
  return self->mBorderWidth;
}

- (BOOL)isNoneAtLocation:(int)a3
{
  return self->mBorderStyle[a3] == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBorderRightColor, 0);
  objc_storeStrong((id *)&self->mBorderBottomColor, 0);
  objc_storeStrong((id *)&self->mBorderLeftColor, 0);
  objc_storeStrong((id *)&self->mBorderTopColor, 0);
  objc_storeStrong((id *)&self->mBorderColor, 0);
}

- (BOOL)hasSameStylesAs:(id)a3
{
  id v4 = (int *)[a3 borderStyles];
  int v5 = self->mBorderStyle[0];
  int v6 = *v4;
  if (v5 != -1) {
    return v6 == v5;
  }
  return v6 == -1
      && v4[1] == self->mBorderStyle[1]
      && v4[2] == self->mBorderStyle[2]
      && v4[3] == self->mBorderStyle[3]
      && v4[4] == self->mBorderStyle[4];
}

- (BOOL)hasSameWidthsAs:(id)a3
{
  id v4 = (int *)[a3 borderWidths];
  int v5 = self->mBorderWidth[0];
  int v6 = *v4;
  if (v5 != -1) {
    return v6 == v5;
  }
  return v6 == -1
      && v4[1] == self->mBorderWidth[1]
      && v4[2] == self->mBorderWidth[2]
      && v4[3] == self->mBorderWidth[3]
      && v4[4] == self->mBorderWidth[4];
}

- (BOOL)hasSameColorsAs:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  mBorderColor = self->mBorderColor;
  if (mBorderColor)
  {
    id v7 = [v4 borderColor];
    LOBYTE(mBorderColor) = [(OITSUColor *)mBorderColor isEqual:v7];
  }
  return (char)mBorderColor;
}

@end