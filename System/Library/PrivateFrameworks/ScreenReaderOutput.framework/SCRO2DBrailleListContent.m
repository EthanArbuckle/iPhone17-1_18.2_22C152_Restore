@interface SCRO2DBrailleListContent
- (BOOL)canPanLeft;
- (BOOL)canPanRight;
- (SCRO2DBrailleListContent)initWithBrailleData:(id)a3 canvas:(id)a4 wordWrap:(BOOL)a5;
- (void)drawOnCanvas:(id)a3;
@end

@implementation SCRO2DBrailleListContent

- (SCRO2DBrailleListContent)initWithBrailleData:(id)a3 canvas:(id)a4 wordWrap:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SCRO2DBrailleListContent;
  v11 = [(SCRO2DBrailleListContent *)&v26 init];
  v12 = v11;
  if (v11)
  {
    v11->_itemPreviewMode = 1;
    objc_storeStrong((id *)&v11->_data, a3);
    v13 = [v10 descriptor];
    v12->_width = [v13 numberOfCellsInRowAvailable];

    v14 = [v10 descriptor];
    v12->_height = [v14 numberOfTextLinesAvailable];

    uint64_t v15 = +[SCRO2DBrailleString brailleStringsFromBrailleData:v9];
    strings = v12->_strings;
    v12->_strings = (NSArray *)v15;

    v12->_uint64_t focusedIndex = [v9 focusedIndex];
    v17 = (NSArray *)objc_opt_new();
    if ([(NSArray *)v12->_strings count])
    {
      unint64_t v18 = 0;
      do
      {
        v19 = [(NSArray *)v12->_strings objectAtIndex:v18];
        v20 = [v19 brailleLinesForWidth:v12->_width - 1 indent:0 focused:v18 == v12->_focusedIndex wordWrap:v5];
        [(NSArray *)v17 addObject:v20];

        ++v18;
      }
      while (v18 < [(NSArray *)v12->_strings count]);
    }
    brailleLineLists = v12->_brailleLineLists;
    v12->_brailleLineLists = v17;

    char v22 = [v9 alignAtTop];
    uint64_t focusedIndex = v12->_focusedIndex;
    if ((v22 & 1) == 0) {
      uint64_t focusedIndex = focusedIndex - v12->_height + 1;
    }
    v12->_firstDisplayedLine = focusedIndex;
    v24 = v12;
  }

  return v12;
}

- (void)drawOnCanvas:(id)a3
{
  id v17 = a3;
  v4 = [MEMORY[0x263EFF8F8] data];
  [v17 setImageData:v4];

  BOOL v5 = objc_opt_new();
  if (self->_height >= 1)
  {
    int64_t firstDisplayedLine = self->_firstDisplayedLine;
    do
    {
      if (firstDisplayedLine < 0
        || firstDisplayedLine >= [(NSArray *)self->_strings count]
        || ([(NSArray *)self->_brailleLineLists objectAtIndex:firstDisplayedLine],
            v7 = objc_claimAutoreleasedReturnValue(),
            uint64_t v8 = [v7 count],
            v7,
            !v8))
      {
        v13 = [&stru_26CCE0B50 stringByPaddingToLength:self->_width withString:@"⠀" startingAtIndex:0];
      }
      else
      {
        int64_t focusedIndex = self->_focusedIndex;
        id v10 = [(NSArray *)self->_brailleLineLists objectAtIndex:firstDisplayedLine];
        v11 = [v10 objectAtIndex:0];
        if (firstDisplayedLine == focusedIndex) {
          v12 = @"⣿";
        }
        else {
          v12 = @"⠀";
        }
        v13 = [(__CFString *)v12 stringByAppendingString:v11];
      }
      [v5 appendString:v13];

      ++firstDisplayedLine;
    }
    while (firstDisplayedLine < self->_height + self->_firstDisplayedLine);
  }
  size_t v14 = [v5 length];
  uint64_t v15 = malloc_type_malloc(v14, 0x100004077774924uLL);
  if (v14)
  {
    for (uint64_t i = 0; i != v14; ++i)
      v15[i] = [v5 characterAtIndex:i];
  }
  [v17 setBrailleText:v15 length:v14];
  free(v15);
}

- (BOOL)canPanLeft
{
  return 0;
}

- (BOOL)canPanRight
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleLineLists, 0);
  objc_storeStrong((id *)&self->_strings, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end