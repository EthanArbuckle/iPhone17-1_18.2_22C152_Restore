@interface TSWPColumns
+ (id)columns;
- (BOOL)equalWidth;
- (BOOL)isEqual:(id)a3;
- (TSWPColumns)init;
- (TSWPColumns)initWithColumnCount:(unint64_t)a3;
- (TSWPColumns)initWithColumnCount:(unint64_t)a3 equalWidth:(BOOL)a4 widthArray:(double *)a5 gapArray:(double *)a6;
- (TSWPColumns)initWithEqualColumnCount:(unint64_t)a3 gapFraction:(double)a4;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)p_equalGapForEqualWidth:(double)a3;
- (double)p_equalWidthForEqualGap:(double)a3;
- (double)p_maxEqualGapForBodyWidth:(double)a3;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)columnCount;
- (void)p_setColumnCount:(unint64_t)a3 gapFraction:(double)a4;
- (void)p_setEqualWidth:(double)a3 equalGap:(double)a4;
- (void)setColumnCount:(unint64_t)a3;
- (void)setEqualWidth:(BOOL)a3;
- (void)setGap:(double)a3 forColumnIndex:(unint64_t)a4 bodyWidth:(double)a5;
- (void)setWidth:(double)a3 forColumnIndex:(unint64_t)a4 bodyWidth:(double)a5;
@end

@implementation TSWPColumns

- (unint64_t)columnCount
{
  return self->_columnCount;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  unint64_t v6 = 0;
  unint64_t v7 = self->_columnCount - 1;
  double v8 = 0.0;
  do
  {
    double v9 = v8;
    v10 = (double *)(&self->super.isa + v6);
    double v8 = v8 + v10[3];
    if (v7 > v6) {
      double v8 = v8 + v10[13];
    }
    ++v6;
  }
  while (a3 >= v6);
  if (a5) {
    *a5 = self->_widthArray[a3] * a4;
  }
  if (a6)
  {
    double v11 = 0.0;
    if (v7 > a3) {
      double v11 = self->_gapArray[a3] * a4;
    }
    *a6 = v11;
  }
  return v9 * a4;
}

- (TSWPColumns)initWithEqualColumnCount:(unint64_t)a3 gapFraction:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPColumns;
  unint64_t v6 = [(TSWPColumns *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    v6->_equalWidth = 1;
    [(TSWPColumns *)v6 p_setColumnCount:a3 gapFraction:a4];
  }
  return v7;
}

- (void)p_setEqualWidth:(double)a3 equalGap:(double)a4
{
  unint64_t columnCount = self->_columnCount;
  if (columnCount)
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = (double *)(&self->super.isa + v5);
      v6[3] = a3;
      if (columnCount - 1 > v5) {
        v6[13] = a4;
      }
      ++v5;
    }
    while (columnCount > v5);
  }
}

- (void)p_setColumnCount:(unint64_t)a3 gapFraction:(double)a4
{
  self->_unint64_t columnCount = a3;
  double v5 = (double)(a3 - 1);
  if (a3 >= 2) {
    a4 = fmin(v5 * a4, 0.75) / v5;
  }
  -[TSWPColumns p_setEqualWidth:equalGap:](self, "p_setEqualWidth:equalGap:", (1.0 - v5 * a4) / (double)a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  LOBYTE(columnCount) = a3 == self;
  if (a3 != self && v5)
  {
    unint64_t columnCount = self->_columnCount;
    if (columnCount != *(void *)(v5 + 8) || self->_equalWidth != *(unsigned __int8 *)(v5 + 16))
    {
LABEL_11:
      LOBYTE(columnCount) = 0;
      return columnCount;
    }
    if (columnCount)
    {
      uint64_t v7 = 0;
      unsigned int v8 = 1;
      while (*(double *)(v5 + 24 + 8 * v7) == self->_widthArray[v7])
      {
        uint64_t v7 = v8;
        BOOL v15 = columnCount > v8++;
        if (!v15)
        {
          unint64_t v9 = columnCount - 1;
          if (columnCount != 1) {
            goto LABEL_14;
          }
          return columnCount;
        }
      }
      goto LABEL_11;
    }
    unint64_t v9 = -1;
LABEL_14:
    unint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      double v13 = *(double *)(v5 + 104 + 8 * v11);
      double v14 = self->_gapArray[v11];
      LOBYTE(columnCount) = v13 == v14;
      unint64_t v11 = v12++;
      BOOL v15 = v13 == v14 && v9 > v11;
    }
    while (v15);
  }
  return columnCount;
}

+ (id)columns
{
  v2 = (void *)[objc_alloc((Class)a1) initWithColumnCount:1];

  return v2;
}

- (TSWPColumns)initWithColumnCount:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPColumns;
  v4 = [(TSWPColumns *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    [(TSWPColumns *)v4 p_setColumnCount:a3 gapFraction:0.0500000007];
  }
  return v5;
}

- (TSWPColumns)init
{
  return [(TSWPColumns *)self initWithColumnCount:1];
}

- (TSWPColumns)initWithColumnCount:(unint64_t)a3 equalWidth:(BOOL)a4 widthArray:(double *)a5 gapArray:(double *)a6
{
  v15.receiver = self;
  v15.super_class = (Class)TSWPColumns;
  v10 = [(TSWPColumns *)&v15 init];
  unint64_t v11 = v10;
  if (v10)
  {
    if (a3)
    {
      unint64_t v12 = 10;
      if (a3 < 0xA) {
        unint64_t v12 = a3;
      }
      v10->_unint64_t columnCount = v12;
      v10->_equalWidth = a4;
      uint64_t v13 = 8 * v12;
      memcpy(v10->_widthArray, a5, 8 * v12);
      memcpy(v11->_gapArray, a6, v13 - 8);
    }
    else
    {
      [(TSWPColumns *)v10 p_setColumnCount:1 gapFraction:0.0500000007];
    }
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TSWPColumns allocWithZone:a3];
  unint64_t columnCount = self->_columnCount;
  BOOL equalWidth = self->_equalWidth;

  return [(TSWPColumns *)v4 initWithColumnCount:columnCount equalWidth:equalWidth widthArray:self->_widthArray gapArray:self->_gapArray];
}

- (void)setColumnCount:(unint64_t)a3
{
  if (a3 - 1 <= 9)
  {
    double v3 = 0.0500000007;
    if (self->_equalWidth && self->_columnCount >= 2) {
      double v3 = self->_gapArray[0];
    }
    -[TSWPColumns p_setColumnCount:gapFraction:](self, "p_setColumnCount:gapFraction:", v3);
  }
}

- (void)setEqualWidth:(BOOL)a3
{
  self->_BOOL equalWidth = a3;
  if (a3) {
    [(TSWPColumns *)self p_setColumnCount:self->_columnCount gapFraction:0.0500000007];
  }
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return self->_widthArray[a3] * a4;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return self->_gapArray[a3] * a4;
}

- (double)p_equalGapForEqualWidth:(double)a3
{
  unint64_t columnCount = self->_columnCount;
  double v4 = 0.0;
  if (columnCount >= 2)
  {
    double v5 = (double)columnCount * a3;
    if (v5 <= 0.0 || v5 > 1.0)
    {
      unsigned int v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPColumns p_equalGapForEqualWidth:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumns.mm"), 344, @"Bad column width fraction");
      unint64_t columnCount = self->_columnCount;
    }
    double v4 = 0.0;
    if ((1.0 - v5) / (double)(columnCount - 1) >= 0.0) {
      return (1.0 - v5) / (double)(columnCount - 1);
    }
  }
  return v4;
}

- (double)p_equalWidthForEqualGap:(double)a3
{
  unint64_t columnCount = self->_columnCount;
  double v4 = 1.0;
  if (columnCount >= 2)
  {
    double v5 = (double)(columnCount - 1) * a3;
    if (v5 < 0.0 || v5 > 1.0)
    {
      unsigned int v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPColumns p_equalWidthForEqualGap:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumns.mm"), 365, @"Bad column gap fraction");
      unint64_t columnCount = self->_columnCount;
    }
    if ((1.0 - v5) / (double)columnCount <= 1.0) {
      return (1.0 - v5) / (double)columnCount;
    }
    else {
      return 1.0;
    }
  }
  return v4;
}

- (void)setWidth:(double)a3 forColumnIndex:(unint64_t)a4 bodyWidth:(double)a5
{
  unint64_t columnCount = self->_columnCount;
  if (columnCount < 2)
  {
    double v9 = 1.0;
    double v11 = 0.0;
LABEL_9:
    [(TSWPColumns *)self p_setEqualWidth:v9 equalGap:v11];
    return;
  }
  double v7 = 36.0 / a5;
  double v8 = a3 / a5;
  if (self->_equalWidth)
  {
    double v9 = (float)(1.0 / (float)columnCount);
    if (v8 >= v7) {
      double v10 = v8;
    }
    else {
      double v10 = v7;
    }
    double v11 = 0.0;
    if (v10 < v9)
    {
      -[TSWPColumns p_equalGapForEqualWidth:](self, "p_equalGapForEqualWidth:", a4, v10, 0.0);
      double v11 = v12;
      double v9 = v10;
    }
    goto LABEL_9;
  }
  double v13 = 1.0 - v7 * (double)(columnCount - 1);
  uint64_t v14 = 13;
  do
  {
    double v13 = v13 - *((double *)&self->super.isa + v14);
    unint64_t v15 = (v14++ - 12);
  }
  while (columnCount - 1 > v15);
  if (v8 <= v13) {
    double v13 = v8;
  }
  if (v13 >= v7) {
    double v16 = v13;
  }
  else {
    double v16 = v7;
  }
  widthArray = self->_widthArray;
  double v18 = self->_widthArray[a4] - v16;
  if (v18 == 0.0) {
    return;
  }
  if (a4 + 1 < columnCount) {
    unint64_t v19 = a4 + 1;
  }
  else {
    unint64_t v19 = 0;
  }
  if (v18 >= 0.0)
  {
    widthArray[v19] = v18 + widthArray[v19];
    goto LABEL_38;
  }
  double v20 = self->_widthArray[a4] - v16;
  if (v19 == a4) {
    goto LABEL_37;
  }
  double v20 = v18;
  while (1)
  {
    double v21 = widthArray[v19];
    if (v21 > v7) {
      break;
    }
LABEL_30:
    if (v19 + 1 < columnCount) {
      ++v19;
    }
    else {
      unint64_t v19 = 0;
    }
    if (v19 == a4) {
      goto LABEL_37;
    }
  }
  if (v20 + v21 < v7)
  {
    double v20 = v20 + v21 - v7;
    widthArray[v19] = v7;
    if (v20 < 0.000001 && v20 > -0.000001) {
      goto LABEL_37;
    }
    goto LABEL_30;
  }
  widthArray[v19] = v20 + v21;
  double v20 = 0.0;
LABEL_37:
  double v16 = widthArray[a4] + v20 - v18;
LABEL_38:
  widthArray[a4] = v16;
}

- (double)p_maxEqualGapForBodyWidth:(double)a3
{
  unint64_t columnCount = self->_columnCount;
  double v4 = 0.0;
  if (columnCount >= 2)
  {
    double v5 = ((float)((float)columnCount * -36.0) / a3 + 1.0) / (double)(columnCount - 1);
    double v4 = 0.0;
    if (v5 >= 0.0) {
      return v5;
    }
  }
  return v4;
}

- (void)setGap:(double)a3 forColumnIndex:(unint64_t)a4 bodyWidth:(double)a5
{
  double v5 = self;
  unint64_t columnCount = self->_columnCount;
  if (columnCount < 2)
  {
    double v11 = 1.0;
    double v12 = 0.0;
LABEL_8:
    [(TSWPColumns *)self p_setEqualWidth:v11 equalGap:v12];
    return;
  }
  if (self->_equalWidth)
  {
    -[TSWPColumns p_maxEqualGapForBodyWidth:](self, "p_maxEqualGapForBodyWidth:", a4, a5);
    if (a3 / a5 <= v9) {
      double v10 = a3 / a5;
    }
    else {
      double v10 = v9;
    }
    [(TSWPColumns *)v5 p_equalWidthForEqualGap:v10];
    self = v5;
    double v12 = v10;
    goto LABEL_8;
  }
  uint64_t v13 = 0;
  double v14 = a3 / a5;
  double v15 = 36.0 / a5;
  double v16 = 1.0 - 36.0 / a5 * (double)columnCount;
  gapArray = self->_gapArray;
  do
  {
    if (a4 != v13) {
      double v16 = v16 - gapArray[v13];
    }
    ++v13;
  }
  while (columnCount - 1 > v13);
  if (v14 > v16) {
    double v14 = v16;
  }
  double v18 = 0.0;
  if (v14 >= 0.0) {
    double v18 = v14;
  }
  double v19 = gapArray[a4] - v18;
  if (v19 == 0.0) {
    return;
  }
  if (a4 + 1 < columnCount) {
    unint64_t v20 = a4 + 1;
  }
  else {
    unint64_t v20 = 0;
  }
  if (v19 >= 0.0)
  {
    self->_widthArray[v20] = v19 + self->_widthArray[v20];
    goto LABEL_38;
  }
  double v21 = gapArray[a4] - v18;
  if (v20 == a4) {
    goto LABEL_37;
  }
  widthArray = self->_widthArray;
  double v21 = v19;
  while (1)
  {
    double v23 = widthArray[v20];
    if (v23 > v15) {
      break;
    }
LABEL_30:
    if (v20 + 1 < columnCount) {
      ++v20;
    }
    else {
      unint64_t v20 = 0;
    }
    if (v20 == a4) {
      goto LABEL_37;
    }
  }
  if (v21 + v23 < v15)
  {
    double v21 = v21 + v23 - v15;
    widthArray[v20] = v15;
    if (v21 < 0.000001 && v21 > -0.000001) {
      goto LABEL_37;
    }
    goto LABEL_30;
  }
  widthArray[v20] = v21 + v23;
  double v21 = 0.0;
LABEL_37:
  double v18 = gapArray[a4] + v21 - v19;
LABEL_38:
  gapArray[a4] = v18;
}

- (id)description
{
  if (self->_equalWidth)
  {
    double v3 = objc_msgSend([NSString alloc], "initWithFormat:", @" %lu equal columns", self->_columnCount);
  }
  else
  {
    double v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"%f", *(void *)&self->_widthArray[0]);
    if (self->_columnCount >= 2)
    {
      unsigned int v5 = 2;
      uint64_t v6 = 1;
      do
      {
        objc_msgSend(v4, "appendFormat:", @" (%f) %f", *(void *)&self->_widthArray[v5 + 8], *(void *)&self->_widthArray[v6]);
        uint64_t v6 = v5;
      }
      while (self->_columnCount > v5++);
    }
    double v3 = (void *)[[NSString alloc] initWithFormat:@" %lu columns: { %@ }", self->_columnCount, v4];
  }
  double v8 = NSString;
  double v9 = (objc_class *)objc_opt_class();
  double v10 = (void *)[v8 stringWithFormat:@"<%@: %p>%@", NSStringFromClass(v9), self, v3];

  return v10;
}

- (BOOL)equalWidth
{
  return self->_equalWidth;
}

@end