@interface SXTextLayouter
- (CGRect)typographicBounds;
- (CGSize)boundingSize;
- (NSArray)paragraphRanges;
- (NSSet)exclusionPaths;
- (SXTextLayouter)init;
- (SXTextLayouter)initWithTextSource:(id)a3 andDocumentRoot:(id)a4;
- (SXTextSource)textSource;
- (SXTextTangierContainerInfo)textInfo;
- (SXTextTangierDocumentRoot)documentRoot;
- (TSDLayoutController)layoutController;
- (_NSRange)validAnchorRangeForRange:(_NSRange)a3;
- (double)baselineForLastLine;
- (double)calculateHeightForWidth:(double)a3;
- (double)verticalLocationOfCharacterAtIndex:(unint64_t)a3;
- (id)exclusionPathIndexes;
- (id)firstColumn;
- (id)textLayout;
- (id)wpLayout;
- (id)wpStorage;
- (void)addExclusionPath:(id)a3;
- (void)assignExclusionPaths;
- (void)createTextInfoIfNeeded;
- (void)invalidate;
- (void)removeAllExclusionPaths;
- (void)reset;
- (void)setDocumentRoot:(id)a3;
- (void)setExclusionPaths:(id)a3;
- (void)setLayoutController:(id)a3;
- (void)setTextInfo:(id)a3;
- (void)setTextSource:(id)a3;
@end

@implementation SXTextLayouter

- (SXTextLayouter)init
{
  return [(SXTextLayouter *)self initWithTextSource:0 andDocumentRoot:0];
}

- (SXTextLayouter)initWithTextSource:(id)a3 andDocumentRoot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXTextLayouter;
  v9 = [(SXTextLayouter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textSource, a3);
    uint64_t v11 = [MEMORY[0x263EFFA08] set];
    exclusionPaths = v10->_exclusionPaths;
    v10->_exclusionPaths = (NSSet *)v11;

    objc_storeStrong((id *)&v10->_documentRoot, a4);
    +[SXTextTangierApplicationDelegate setup];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F7C6C8]) initWithCanvas:0];
    layoutController = v10->_layoutController;
    v10->_layoutController = (TSDLayoutController *)v13;
  }
  return v10;
}

- (double)calculateHeightForWidth:(double)a3
{
  [(SXTextLayouter *)self createTextInfoIfNeeded];
  [(SXTextLayouter *)self assignExclusionPaths];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F7C6B0]), "initWithSize:", a3, 10000000.0);
  v6 = [(SXTextLayouter *)self textInfo];
  [v6 setGeometry:v5];

  id v7 = [(SXTextLayouter *)self layoutController];
  id v8 = [(SXTextLayouter *)self textInfo];
  v9 = [v7 validatedLayoutForInfo:v8];

  v10 = [v9 children];
  uint64_t v11 = [v10 firstObject];

  v12 = [v11 geometry];
  [v12 size];
  double v14 = v13;

  return v14;
}

- (void)reset
{
  self->_textInfo = 0;
  MEMORY[0x270F9A758]();
}

- (void)createTextInfoIfNeeded
{
  if (!self->_textInfo)
  {
    id v3 = objc_alloc(MEMORY[0x263F7C6B0]);
    id v19 = (id)objc_msgSend(v3, "initWithPosition:size:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    v4 = [SXTextTangierContainerInfo alloc];
    v5 = [(SXTextLayouter *)self documentRoot];
    v6 = [v5 context];
    id v7 = [(SXTextLayouter *)self documentRoot];
    id v8 = [v7 stylesheet];
    v9 = [(SXTextLayouter *)self textSource];
    v10 = [v9 string];
    uint64_t v11 = [(SXTextLayouter *)self textSource];
    v12 = [v11 locale];
    double v13 = [(SXTextTangierContainerInfo *)v4 initWithContext:v6 geometry:v19 stylesheet:v8 string:v10 locale:v12];
    textInfo = self->_textInfo;
    self->_textInfo = v13;

    v15 = [(SXTextLayouter *)self textSource];
    objc_super v16 = [(SXTextTangierContainerInfo *)self->_textInfo storage];
    [v15 applyStylingOnTextTangierStorage:v16];

    v17 = [(SXTextLayouter *)self textSource];
    v18 = [(SXTextTangierContainerInfo *)self->_textInfo storage];
    [v17 applyAdditionsOnTextTangierStorage:v18];
  }
}

- (void)invalidate
{
  [(SXTextLayouter *)self assignExclusionPaths];
  id v3 = [(SXTextLayouter *)self textLayout];
  [v3 invalidate];
}

- (void)assignExclusionPaths
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [(SXTextLayouter *)self exclusionPaths];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        int v11 = -[SXTextExclusionPath type](v10);
        v12 = v3;
        if (v11 != 1)
        {
          int v13 = -[SXTextExclusionPath type](v10);
          v12 = v4;
          if (v13 != 2) {
            continue;
          }
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  double v14 = [(SXTextLayouter *)self textInfo];
  v15 = [v14 rangedExclusionPaths];
  char v16 = [v15 isEqual:v4];

  if ((v16 & 1) == 0)
  {
    v17 = [(SXTextLayouter *)self textInfo];
    [v17 setRangedExclusionPaths:v4];
  }
  v18 = [(SXTextLayouter *)self textInfo];
  id v19 = [v18 fixedExclusionPaths];
  char v20 = [v19 isEqual:v3];

  if ((v20 & 1) == 0)
  {
    v21 = [(SXTextLayouter *)self textInfo];
    [v21 setFixedExclusionPaths:v3];
  }
}

- (void)addExclusionPath:(id)a3
{
  id v4 = (double *)a3;
  if (v4)
  {
    v28 = v4;
    if (-[SXTextExclusionPath type]((uint64_t)v4) == 2)
    {
      v5 = [(SXTextLayouter *)self textSource];
      uint64_t v6 = -[SXTextExclusionPath range]((uint64_t)v28);
      uint64_t v8 = objc_msgSend(v5, "rangeForRange:", v6, v7);
      uint64_t v10 = v9;

      [(SXTextExclusionPath *)(uint64_t)v28 setRange:v10];
    }
    uint64_t v11 = -[SXTextLayouter validAnchorRangeForRange:](self, "validAnchorRangeForRange:", -[SXTextExclusionPath range]((uint64_t)v28), 1);
    [(SXTextExclusionPath *)(uint64_t)v28 setRange:v12];
    int v13 = [(SXTextLayouter *)self wpStorage];
    uint64_t v14 = [v13 paragraphStartAtCharIndex:-[SXTextExclusionPath range]((uint64_t)v28)];

    if (v14)
    {
      unint64_t v15 = -[SXTextExclusionPath range]((uint64_t)v28);
      if (-[SXTangierTextRenderCollectorItem selectable]((BOOL)v28) && v15 >= v14 - 1 && v15 - (v14 - 1) <= 1)
      {
        char v16 = [(SXTextLayouter *)self wpStorage];
        uint64_t v17 = [v16 paragraphIndexAtCharIndex:-[SXTextExclusionPath range]((uint64_t)v28) - 1];

        if (v17)
        {
          v18 = [(SXTextLayouter *)self wpStorage];
          id v19 = [v18 paragraphStyleAtParIndex:v17 - 1 effectiveRange:0];

          [v19 floatValueForProperty:88];
          double v21 = v20;
          double v22 = -[SXTextExclusionPath exclusionRect]((uint64_t)v28);
          -[SXTextExclusionPath setExclusionRect:](v28, v22, v24, v25, v23 + v21);
        }
      }
    }
    v26 = [(NSSet *)self->_exclusionPaths setByAddingObject:v28];
    exclusionPaths = self->_exclusionPaths;
    self->_exclusionPaths = v26;

    id v4 = v28;
  }
}

- (_NSRange)validAnchorRangeForRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  if ((uint64_t)a3.location <= 10) {
    NSUInteger v5 = 10;
  }
  else {
    NSUInteger v5 = a3.location;
  }
  if (a3.location >= 0xA) {
    NSUInteger v6 = 10;
  }
  else {
    NSUInteger v6 = a3.location;
  }
  uint64_t v7 = [(SXTextLayouter *)self textSource];
  uint64_t v8 = [v7 string];
  uint64_t v9 = objc_msgSend(v8, "substringWithRange:", v5 - 10, v6);

  v43 = v9;
  uint64_t v10 = [v9 rangeOfString:@"\n"];
  uint64_t v11 = [(SXTextLayouter *)self textSource];
  uint64_t v12 = [v11 string];
  unint64_t v13 = [v12 length] - 1;

  if (location + 10 >= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = location + 10;
  }
  unint64_t v15 = v14 - location;
  char v16 = [(SXTextLayouter *)self textSource];
  uint64_t v17 = [v16 string];
  v18 = objc_msgSend(v17, "substringWithRange:", location + 1, v15);

  uint64_t v19 = [v18 rangeOfString:@"\n"];
  uint64_t v20 = v5 + v10 - 9;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v21 = v10 - location;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v21 = -1;
  }
  BOOL v22 = v19 - location < v21 || v21 == -1;
  NSUInteger v23 = location + 1 + v19;
  if (!v22) {
    NSUInteger v23 = v20;
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v20 = v23;
  }
  if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger location = v20;
  }
  while (1)
  {
    double v24 = [(SXTextLayouter *)self textSource];
    double v25 = [v24 string];
    unint64_t v26 = [v25 length];

    if (location >= v26) {
      break;
    }
    uint64_t v27 = [(SXTextLayouter *)self textSource];
    v28 = [v27 string];
    v29 = objc_msgSend(v28, "substringWithRange:", location, 1);
    v30 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v31 = [v29 rangeOfCharacterFromSet:v30];

    ++location;
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      --location;
      break;
    }
  }
  unint64_t v32 = location + 1;
  v33 = [(SXTextLayouter *)self exclusionPathIndexes];
  if ([v33 containsIndex:v32])
  {
    while (1)
    {
      v34 = [(SXTextLayouter *)self textSource];
      v35 = [v34 string];
      if (v32 >= [v35 length] - 1) {
        break;
      }
      int v36 = [v33 containsIndex:v32];

      if (!v36) {
        goto LABEL_31;
      }
      ++v32;
    }
  }
LABEL_31:
  v37 = [(SXTextLayouter *)self textSource];
  v38 = [v37 string];
  unint64_t v39 = [v38 length] - 1;

  if (v32 >= v39) {
    NSUInteger v40 = v39;
  }
  else {
    NSUInteger v40 = v32;
  }

  NSUInteger v41 = v40;
  NSUInteger v42 = 1;
  result.length = v42;
  result.NSUInteger location = v41;
  return result;
}

- (void)removeAllExclusionPaths
{
  id v3 = [MEMORY[0x263EFFA08] set];
  exclusionPaths = self->_exclusionPaths;
  self->_exclusionPaths = v3;
  MEMORY[0x270F9A758](v3, exclusionPaths);
}

- (id)textLayout
{
  id v3 = [(SXTextLayouter *)self layoutController];
  id v4 = [(SXTextLayouter *)self textInfo];
  NSUInteger v5 = [v3 layoutForInfo:v4];

  return v5;
}

- (id)firstColumn
{
  v2 = [(SXTextLayouter *)self wpLayout];
  id v3 = [v2 columns];
  id v4 = [v3 firstObject];

  return v4;
}

- (double)baselineForLastLine
{
  v2 = [(SXTextLayouter *)self textLayout];
  id v3 = [v2 children];
  id v4 = [v3 firstObject];

  [v4 baselineForLastLine];
  double v6 = v5;

  return v6;
}

- (CGRect)typographicBounds
{
  id v3 = [(SXTextLayouter *)self firstColumn];
  id v4 = [(SXTextLayouter *)self textSource];
  double v5 = [v4 string];
  objc_msgSend(v3, "glyphRectForRange:includingLabel:", 0, objc_msgSend(v5, "length"), 1);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGSize)boundingSize
{
  v2 = [(SXTextLayouter *)self wpLayout];
  id v3 = [v2 geometry];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSArray)paragraphRanges
{
  id v3 = [MEMORY[0x263EFF980] array];
  double v4 = [(SXTextLayouter *)self firstColumn];
  double v5 = [v4 storage];
  double v6 = [(SXTextLayouter *)self firstColumn];
  uint64_t v7 = [v6 range];
  unint64_t v9 = objc_msgSend(v5, "paragraphIndexRangeForCharRange:", v7, v8);
  uint64_t v11 = v10;

  if (v9 < v9 + v11)
  {
    do
    {
      double v12 = [(SXTextLayouter *)self firstColumn];
      double v13 = [v12 storage];
      uint64_t v14 = [v13 textRangeForParagraphAtIndex:v9];
      uint64_t v16 = v15;

      double v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v14, v16);
      [v3 addObject:v17];

      ++v9;
      --v11;
    }
    while (v11);
  }
  return (NSArray *)v3;
}

- (double)verticalLocationOfCharacterAtIndex:(unint64_t)a3
{
  double v5 = [(SXTextLayouter *)self textSource];
  double v6 = [v5 string];
  unint64_t v7 = [v6 length];

  if (v7 <= a3) {
    return 0.0;
  }
  uint64_t v8 = [(SXTextLayouter *)self firstColumn];
  [v8 topOfLineAtCharIndex:a3];
  double v10 = v9;

  return v10;
}

- (id)wpStorage
{
  [(SXTextLayouter *)self createTextInfoIfNeeded];
  id v3 = [(SXTextLayouter *)self textInfo];
  double v4 = [v3 storage];

  return v4;
}

- (id)wpLayout
{
  v2 = [(SXTextLayouter *)self textLayout];
  id v3 = [v2 children];
  double v4 = [v3 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)exclusionPathIndexes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089C8] indexSet];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(SXTextLayouter *)self exclusionPaths];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[SXTextExclusionPath range](*(void *)(*((void *)&v12 + 1) + 8 * i));
        objc_msgSend(v3, "addIndexesInRange:", v9, v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (SXTextSource)textSource
{
  return self->_textSource;
}

- (void)setTextSource:(id)a3
{
}

- (NSSet)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void)setExclusionPaths:(id)a3
{
}

- (SXTextTangierDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (TSDLayoutController)layoutController
{
  return self->_layoutController;
}

- (void)setLayoutController:(id)a3
{
}

- (SXTextTangierContainerInfo)textInfo
{
  return self->_textInfo;
}

- (void)setTextInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_documentRoot, 0);
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
}

@end