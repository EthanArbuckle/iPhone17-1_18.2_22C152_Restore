@interface SCRO2DBrailleCanvasDOT
- (BOOL)hasConsistentHorizontalPinSpacing;
- (BOOL)hasConsistentVerticalPinSpacing;
- (BOOL)skipPinBetweenCellsHorizontally;
- (BOOL)skipPinBetweenCellsVertically;
- (BOOL)supportsBrailleText;
- (SCRO2DBrailleCanvasDOT)init;
- (SCRO2DBrailleCanvasDOT)initWithWidth:(unint64_t)a3 initWithHeight:(unint64_t)a4;
- (char)mainCells;
- (double)horizontalPinSpacing;
- (double)interCellHorizontalSpacing;
- (double)interCellVerticalSpacing;
- (double)verticalPinSpacing;
- (unint64_t)detentCount;
- (unint64_t)mainCellsLength;
- (unint64_t)pinHeightStyle;
- (void)_print;
- (void)dealloc;
@end

@implementation SCRO2DBrailleCanvasDOT

- (SCRO2DBrailleCanvasDOT)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:@"SCRO2DBrailleException", @"use of %@ is not allowed", v3 format];

  return 0;
}

- (SCRO2DBrailleCanvasDOT)initWithWidth:(unint64_t)a3 initWithHeight:(unint64_t)a4
{
  id v7 = objc_alloc_init((Class)SCRO2DBrailleCanvasDescriptor);
  [v7 setHeight:a4];
  [v7 setWidth:a3];
  v8 = _SCROD_LOG();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSNumber numberWithUnsignedInteger:a4];
    v10 = +[NSNumber numberWithUnsignedInteger:a3];
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "BTLE Dot Pad height %@, width %@", (uint8_t *)&v13, 0x16u);
  }
  [v7 setCellHeight:4];
  [v7 setCellWidth:2];
  [v7 setHasConsistentHorizontalPinSpacing:1];
  [v7 setHasConsistentVerticalPinSpacing:1];
  [v7 setVerticalPinSpacing:2.0];
  [v7 setHorizontalPinSpacing:2.0];
  [(SCRO2DBrailleCanvasDOT *)self horizontalPinSpacing];
  objc_msgSend(v7, "setInterCellHorizontalSpacing:");
  [(SCRO2DBrailleCanvasDOT *)self verticalPinSpacing];
  objc_msgSend(v7, "setVerticalPinSpacing:");
  [v7 setSkipPinBetweenCellsHorizontally:1];
  [v7 setSkipPinBetweenCellsVertically:1];
  [v7 setPinHeightStyle:2];
  [v7 setDetentCount:2];
  v11 = [(SCRO2DBrailleCanvasDOT *)self initWithCanvasDescriptor:v7];
  v11->_cells = (char *)malloc_type_malloc([(SCRO2DBrailleCanvasDOT *)v11 mainCellsLength], 0x100004077774924uLL);

  return v11;
}

- (void)dealloc
{
  free(self->_cells);
  v3.receiver = self;
  v3.super_class = (Class)SCRO2DBrailleCanvasDOT;
  [(SCRO2DBrailleCanvasDOT *)&v3 dealloc];
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  return 1;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  return 1;
}

- (BOOL)supportsBrailleText
{
  return 1;
}

- (double)horizontalPinSpacing
{
  return 0.0;
}

- (double)verticalPinSpacing
{
  return 0.0;
}

- (double)interCellHorizontalSpacing
{
  return 0.0;
}

- (double)interCellVerticalSpacing
{
  return 0.0;
}

- (unint64_t)pinHeightStyle
{
  return 2;
}

- (unint64_t)detentCount
{
  return 2;
}

- (BOOL)skipPinBetweenCellsVertically
{
  return 1;
}

- (BOOL)skipPinBetweenCellsHorizontally
{
  return 0;
}

- (char)mainCells
{
  cells = self->_cells;
  v4 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
  id v5 = [v4 height];

  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      v8 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
      id v9 = [v8 width];

      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          unsigned __int8 v11 = [(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 y:v7];
          char v12 = v11 | (2
                     * [(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 y:v7 | 1]);
          char v13 = v12 | (4
                     * [(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 y:v7 | 2]);
          char v14 = v13 | ([(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 y:v7 | 3] << 6);
          char v15 = v14 | (8
                     * [(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 + 1 y:v7]);
          char v16 = v15 | (16
                     * [(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 + 1 y:v7 | 1]);
          char v17 = v16 | (32
                     * [(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 + 1 y:v7 | 2]);
          cells[v6++] = v17 | ([(SCRO2DBrailleCanvasDOT *)self pinStateForX:v10 + 1 y:v7 | 3] << 7);
          v18 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
          id v19 = [v18 width];

          v10 += 2;
        }
        while (v10 < (unint64_t)v19);
      }
      v7 += 4;
      v20 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
      id v21 = [v20 height];
    }
    while (v7 < (unint64_t)v21);
  }
  return self->_cells;
}

- (unint64_t)mainCellsLength
{
  objc_super v3 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
  unint64_t v4 = (unint64_t)[v3 width];
  id v5 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
  unint64_t v6 = v4 / (unint64_t)[v5 cellWidth];
  unint64_t v7 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
  unint64_t v8 = (void)[v7 height] * v6;
  id v9 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
  unint64_t v10 = v8 / (unint64_t)[v9 cellHeight];

  return v10;
}

- (void)_print
{
  objc_super v3 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
  id v4 = [v3 height];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
      id v7 = [v6 width];

      if (v7)
      {
        unint64_t v8 = 0;
        id v9 = &stru_82B8;
        do
        {
          if ([(SCRO2DBrailleCanvasDOT *)self pinStateForX:v8 y:v5]) {
            CFStringRef v10 = @"X";
          }
          else {
            CFStringRef v10 = @" ";
          }
          unsigned __int8 v11 = [(__CFString *)v9 stringByAppendingString:v10];

          ++v8;
          char v12 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
          id v13 = [v12 width];

          id v9 = v11;
        }
        while (v8 < (unint64_t)v13);
      }
      else
      {
        unsigned __int8 v11 = &stru_82B8;
      }

      ++v5;
      char v14 = [(SCRO2DBrailleCanvasDOT *)self descriptor];
      id v15 = [v14 height];
    }
    while (v5 < (unint64_t)v15);
  }
}

@end