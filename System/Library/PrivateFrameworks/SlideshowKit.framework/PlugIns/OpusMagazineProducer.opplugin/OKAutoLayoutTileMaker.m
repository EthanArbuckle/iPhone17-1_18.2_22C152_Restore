@interface OKAutoLayoutTileMaker
- (BOOL)_isQualifiedFrame:(CGRect)a3;
- (BOOL)_isQualifiedOneUpLayout:(id)a3;
- (OKAutoLayoutTileMaker)init;
- (double)croppingScoreOfLayout:(id)a3 forAspectRatios:(id)a4;
- (double)maxFrameAspectRatio;
- (double)minFrameArea;
- (double)minFrameAspectRatio;
- (double)oneUpWhitespaceAllowed;
- (id)convertTiles:(id)a3 toResolution:(unint64_t)a4 :(unint64_t)a5 borderInPx:(unint64_t)a6 offsetX:(unint64_t)a7 offsetY:(unint64_t)a8;
- (id)layoutsForFrames:(unint64_t)a3 inRect:(CGRect)a4 borderInPx:(unint64_t)a5;
- (unint64_t)columns;
- (unint64_t)rows;
- (void)_findNextFrameFromGrid:(id)a3 curIndex:(unint64_t)a4 maxIndex:(unint64_t)a5 curFrames:(id)a6 layouts:(id)a7;
- (void)_oneUpLayouts:(id)a3;
- (void)_prepare:(double)a3;
- (void)dealloc;
- (void)setColumns:(unint64_t)a3;
- (void)setMaxFrameAspectRatio:(double)a3;
- (void)setMinFrameArea:(double)a3;
- (void)setMinFrameAspectRatio:(double)a3;
- (void)setOneUpWhitespaceAllowed:(double)a3;
- (void)setRows:(unint64_t)a3;
@end

@implementation OKAutoLayoutTileMaker

- (OKAutoLayoutTileMaker)init
{
  v3.receiver = self;
  v3.super_class = (Class)OKAutoLayoutTileMaker;
  result = [(OKAutoLayoutTileMaker *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_rows = vdupq_n_s64(2uLL);
    result->_minFrameArea = 0.0;
    result->_oneUpWhitespaceAllowed = 0.0;
    result->_maxFrameAspectRatio = 100.0;
    result->_minFrameAspectRatio = 0.0;
  }
  return result;
}

- (void)dealloc
{
  tileTable = self->_tileTable;
  if (tileTable)
  {

    self->_tileTable = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OKAutoLayoutTileMaker;
  [(OKAutoLayoutTileMaker *)&v4 dealloc];
}

- (double)croppingScoreOfLayout:(id)a3 forAspectRatios:(id)a4
{
  return 1.0;
}

- (void)_prepare:(double)a3
{
  self->_blockAspectRatio = (double)self->_rows * a3 / (double)self->_columns;
  tileTable = self->_tileTable;
  if (tileTable)
  {

    self->_tileTable = 0;
  }
  self->_tileTable = [[OKAutoLayoutGrid alloc] initWithRows:self->_rows columns:self->_columns];
}

- (BOOL)_isQualifiedOneUpLayout:(id)a3
{
  if ([a3 count] != (char *)&dword_0 + 1) {
    return 0;
  }
  objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "CGRectValue");
  unint64_t rows = self->_rows;
  unint64_t columns = self->_columns;
  if (1.0 - v7 * v8 / (double)(columns * rows) > self->_oneUpWhitespaceAllowed) {
    return 0;
  }
  double v11 = (double)columns;
  double v12 = (double)rows;
  if (v8 != (double)rows && v7 != v11) {
    return 0;
  }
  if (v5 != 0.0)
  {
    double v14 = v7 + v5 * 2.0;
    double v15 = v7 + v5;
    if (v14 != v11 && v15 != v11) {
      return 0;
    }
  }
  if (v6 == 0.0) {
    return 1;
  }
  double v17 = v8 + v6 * 2.0;
  double v18 = v8 + v6;
  return v17 == v12 && v18 != v12;
}

- (BOOL)_isQualifiedFrame:(CGRect)a3
{
  BOOL result = 0;
  if (a3.size.width * a3.size.height / (double)(self->_rows * self->_columns) >= self->_minFrameArea)
  {
    double v3 = a3.size.width * self->_blockAspectRatio / a3.size.height;
    if (v3 <= self->_maxFrameAspectRatio && v3 >= self->_minFrameAspectRatio) {
      return 1;
    }
  }
  return result;
}

- (void)_oneUpLayouts:(id)a3
{
  v23 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, 0.0, (double)self->_columns, (double)self->_rows);
  objc_msgSend(a3, "addObject:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  double oneUpWhitespaceAllowed = self->_oneUpWhitespaceAllowed;
  if (oneUpWhitespaceAllowed != 0.0)
  {
    float v6 = oneUpWhitespaceAllowed / (1.0 / (double)self->_columns);
    uint64_t v7 = vcvtms_u32_f32(v6);
    if (v7 >= 1)
    {
      uint64_t v8 = v7 + 1;
      do
      {
        uint64_t v9 = 0;
        do
        {
          double v10 = (double)(self->_columns - v7);
          double rows = (double)self->_rows;
          if (-[OKAutoLayoutTileMaker _isQualifiedFrame:](self, "_isQualifiedFrame:", (double)v9, 0.0, v10, rows))
          {
            v22 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", (double)v9, 0.0, v10, rows);
            double v12 = +[NSArray arrayWithObjects:&v22 count:1];
            if ([(OKAutoLayoutTileMaker *)self _isQualifiedOneUpLayout:v12]) {
              [a3 addObject:v12];
            }
          }
          ++v9;
        }
        while (v8 != v9);
        BOOL v13 = v7-- <= 1;
      }
      while (!v13);
      double oneUpWhitespaceAllowed = self->_oneUpWhitespaceAllowed;
    }
    float v14 = oneUpWhitespaceAllowed / (1.0 / (double)self->_rows);
    uint64_t v15 = vcvtms_u32_f32(v14);
    if (v15 >= 1)
    {
      uint64_t v16 = v15 + 1;
      do
      {
        uint64_t v17 = 0;
        do
        {
          double columns = (double)self->_columns;
          double v19 = (double)(self->_rows - v15);
          if (-[OKAutoLayoutTileMaker _isQualifiedFrame:](self, "_isQualifiedFrame:", 0.0, (double)v17, columns, v19))
          {
            v21 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, (double)v17, columns, v19);
            v20 = +[NSArray arrayWithObjects:&v21 count:1];
            if ([(OKAutoLayoutTileMaker *)self _isQualifiedOneUpLayout:v20]) {
              [a3 addObject:v20];
            }
          }
          ++v17;
        }
        while (v16 != v17);
        BOOL v13 = v15-- <= 1;
      }
      while (!v13);
    }
  }
}

- (void)_findNextFrameFromGrid:(id)a3 curIndex:(unint64_t)a4 maxIndex:(unint64_t)a5 curFrames:(id)a6 layouts:(id)a7
{
  *(void *)&long long v25 = a5;
  *((void *)&v25 + 1) = a4;
  if (a4 <= a5)
  {
    if (v25 == 0)
    {
      [(OKAutoLayoutTileMaker *)self _oneUpLayouts:a7];
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      if (a5) {
        BOOL v9 = a4 == a5;
      }
      else {
        BOOL v9 = 0;
      }
      uint64_t v10 = v9;
      id obj = objc_msgSend(a3, "nextPossibleRects:", v10, a7);
      id v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            [v15 CGRectValue];
            double v17 = v16;
            double v19 = v18;
            double v21 = v20;
            double v23 = v22;
            if (-[OKAutoLayoutTileMaker _isQualifiedFrame:](self, "_isQualifiedFrame:"))
            {
              [a3 mark:*((void *)&v25 + 1) forAreaX:(unint64_t)v17 Y:(unint64_t)v19 W:(unint64_t)v21 H:(unint64_t)v23];
              [a6 addObject:v15];
              if (*((void *)&v25 + 1) + 1 <= (unint64_t)v25)
              {
                -[OKAutoLayoutTileMaker _findNextFrameFromGrid:curIndex:maxIndex:curFrames:layouts:](self, "_findNextFrameFromGrid:curIndex:maxIndex:curFrames:layouts:", a3);
              }
              else if (([a3 hasAnyEmptyTiles] & 1) == 0)
              {
                if ([a6 count]) {
                  objc_msgSend(v24, "addObject:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", a6));
                }
              }
              [a6 removeLastObject];
              [a3 unmarkForAreaX:(unint64_t)v17 Y:(unint64_t)v19 W:(unint64_t)v21 H:(unint64_t)v23];
            }
          }
          id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v12);
      }
    }
  }
}

- (id)layoutsForFrames:(unint64_t)a3 inRect:(CGRect)a4 borderInPx:(unint64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = +[NSMutableArray array];
  id v13 = +[NSMutableArray array];
  [(OKAutoLayoutTileMaker *)self _prepare:(double)(unint64_t)width / (double)(unint64_t)height];
  [(OKAutoLayoutTileMaker *)self _findNextFrameFromGrid:self->_tileTable curIndex:0 maxIndex:a3 - 1 curFrames:v13 layouts:v12];
  id v14 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v14, "addObject:", -[OKAutoLayoutTileMaker convertTiles:toResolution::borderInPx:offsetX:offsetY:](self, "convertTiles:toResolution::borderInPx:offsetX:offsetY:", *(void *)(*((void *)&v20 + 1) + 8 * i), (unint64_t)width, (unint64_t)height, a5, (unint64_t)x, (unint64_t)y));
      }
      id v16 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
  return v14;
}

- (id)convertTiles:(id)a3 toResolution:(unint64_t)a4 :(unint64_t)a5 borderInPx:(unint64_t)a6 offsetX:(unint64_t)a7 offsetY:(unint64_t)a8
{
  unint64_t rows = self->_rows;
  unint64_t columns = self->_columns;
  id v16 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    double v19 = (double)a7;
    double v20 = (double)((a4 - a6) / columns);
    double v21 = (double)(a6 >> 1);
    double v22 = (double)a8;
    double v23 = (double)((a5 - a6) / rows);
    uint64_t v24 = *(void *)v40;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) CGRectValue];
        double v30 = v19 + v29 * v20 + v21;
        double v31 = v28 * v23;
        if (v29 + v27 == (double)self->_columns) {
          double v32 = (double)a4 - v30 - v21;
        }
        else {
          double v32 = v27 * v20;
        }
        double v33 = v26 + v28;
        double v34 = (double)a5 - (v22 + v26 * v23 + v21) - v21;
        if (v33 != (double)self->_rows) {
          double v34 = v31;
        }
        double v35 = v30;
        double v36 = v22 + v26 * v23 + v21;
        CGRect v44 = CGRectInset(*(CGRect *)(&v32 - 2), (double)(a6 >> 1), (double)(a6 >> 1));
        objc_msgSend(v16, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height));
      }
      id v18 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v18);
  }
  return v16;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_unint64_t rows = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_unint64_t columns = a3;
}

- (double)maxFrameAspectRatio
{
  return self->_maxFrameAspectRatio;
}

- (void)setMaxFrameAspectRatio:(double)a3
{
  self->_maxFrameAspectRatio = a3;
}

- (double)minFrameAspectRatio
{
  return self->_minFrameAspectRatio;
}

- (void)setMinFrameAspectRatio:(double)a3
{
  self->_minFrameAspectRatio = a3;
}

- (double)minFrameArea
{
  return self->_minFrameArea;
}

- (void)setMinFrameArea:(double)a3
{
  self->_minFrameArea = a3;
}

- (double)oneUpWhitespaceAllowed
{
  return self->_oneUpWhitespaceAllowed;
}

- (void)setOneUpWhitespaceAllowed:(double)a3
{
  self->_double oneUpWhitespaceAllowed = a3;
}

@end