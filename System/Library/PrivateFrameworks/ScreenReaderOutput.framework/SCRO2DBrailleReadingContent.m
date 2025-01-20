@interface SCRO2DBrailleReadingContent
- (BOOL)canPanLeft;
- (BOOL)canPanRight;
- (SCRO2DBrailleReadingContent)initWithBrailleData:(id)a3 canvas:(id)a4 wordWrap:(BOOL)a5;
- (void)drawOnCanvas:(id)a3;
- (void)panLeft;
- (void)panRight;
@end

@implementation SCRO2DBrailleReadingContent

- (SCRO2DBrailleReadingContent)initWithBrailleData:(id)a3 canvas:(id)a4 wordWrap:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SCRO2DBrailleReadingContent;
  v11 = [(SCRO2DBrailleReadingContent *)&v32 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v13 = [v10 descriptor];
    v12->_width = [v13 numberOfCellsInRowAvailable];

    v14 = [v10 descriptor];
    v12->_height = [v14 numberOfTextLinesAvailable];

    uint64_t v15 = +[SCRO2DBrailleString brailleStringsFromBrailleData:v9];
    strings = v12->_strings;
    v12->_strings = (NSArray *)v15;

    v12->_unint64_t focusedIndex = [v9 focusedIndex];
    v17 = objc_opt_new();
    v18 = objc_opt_new();
    id v30 = v10;
    if ([(NSArray *)v12->_strings count])
    {
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v31 = 0;
      do
      {
        v21 = [(NSArray *)v12->_strings objectAtIndex:v19];
        v22 = [v21 brailleLinesForWidth:v12->_width indent:2 focused:v19 == v12->_focusedIndex wordWrap:v5];
        [v17 addObjectsFromArray:v22];
        v23 = [NSNumber numberWithUnsignedInteger:v20];
        [v18 addObject:v23];

        uint64_t v24 = [v22 count];
        if (v19 == v12->_focusedIndex) {
          uint64_t v31 = [v22 count];
        }
        v20 += v24;

        ++v19;
      }
      while (v19 < [(NSArray *)v12->_strings count]);
    }
    else
    {
      uint64_t v31 = 0;
    }
    objc_storeStrong((id *)&v12->_brailleLines, v17);
    objc_storeStrong((id *)&v12->_beginLines, v18);
    unint64_t focusedIndex = v12->_focusedIndex;
    if (focusedIndex >= 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v27 = 0;
      id v10 = v30;
    }
    else
    {
      id v10 = v30;
      if (focusedIndex >= [(NSArray *)v12->_beginLines count])
      {
        uint64_t v27 = 0;
      }
      else
      {
        v26 = [(NSArray *)v12->_beginLines objectAtIndex:v12->_focusedIndex];
        uint64_t v27 = [v26 unsignedIntegerValue];
      }
    }
    if (([v9 alignAtTop] & 1) == 0) {
      uint64_t v27 = v27 + v31 - v12->_height;
    }
    v12->_firstDisplayedLine = v27;
    v28 = v12;
  }
  return v12;
}

- (void)drawOnCanvas:(id)a3
{
  id v15 = a3;
  BOOL v5 = [MEMORY[0x263EFF8F8] data];
  [v15 setImageData:v5];

  v6 = objc_opt_new();
  if (self->_height >= 1)
  {
    int64_t firstDisplayedLine = self->_firstDisplayedLine;
    do
    {
      if (firstDisplayedLine < 0 || firstDisplayedLine >= [(NSArray *)self->_brailleLines count])
      {
        v8 = [&stru_26CCE0B50 stringByPaddingToLength:self->_width withString:@"⠀" startingAtIndex:0];
      }
      else
      {
        v8 = [(NSArray *)self->_brailleLines objectAtIndex:firstDisplayedLine];
        if ([v8 length] != self->_width)
        {
          v14 = [MEMORY[0x263F08690] currentHandler];
          v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
          v12 = [NSNumber numberWithInteger:self->_width];
          [v14 handleFailureInMethod:a2, self, @"SCRO2DBrailleReadingContent.m", 104, @"Each element of _brailleLine (%@, length %@) must be of length _width (%@)", v8, v13, v12 object file lineNumber description];
        }
      }
      [v6 appendString:v8];

      ++firstDisplayedLine;
    }
    while (firstDisplayedLine < self->_height + self->_firstDisplayedLine);
  }
  size_t v9 = [v6 length];
  id v10 = malloc_type_malloc(v9, 0x100004077774924uLL);
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
      v10[i] = [v6 characterAtIndex:i];
  }
  [v15 setBrailleText:v10 length:v9];
  free(v10);
}

- (BOOL)canPanLeft
{
  return self->_firstDisplayedLine > 0;
}

- (void)panLeft
{
  if ([(SCRO2DBrailleReadingContent *)self canPanLeft]) {
    self->_firstDisplayedLine -= self->_height;
  }
}

- (BOOL)canPanRight
{
  unint64_t v2 = self->_height + self->_firstDisplayedLine;
  return v2 < [(NSArray *)self->_brailleLines count];
}

- (void)panRight
{
  if ([(SCRO2DBrailleReadingContent *)self canPanRight]) {
    self->_firstDisplayedLine += self->_height;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginLines, 0);
  objc_storeStrong((id *)&self->_brailleLines, 0);
  objc_storeStrong((id *)&self->_strings, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end