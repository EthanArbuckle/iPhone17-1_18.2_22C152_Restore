@interface OADTextBody
- (BOOL)isEmpty;
- (BOOL)isSimilarToTextBody:(id)a3;
- (BOOL)propagateActualTextStyleToTextListStyle;
- (OADTextBody)init;
- (id)addParagraph;
- (id)description;
- (id)findFirstTextRunOfClass:(Class)a3;
- (id)firstParagraphEffects;
- (id)overrideTextListStyle;
- (id)paragraphAtIndex:(unint64_t)a3;
- (id)plainText;
- (id)properties;
- (id)textListStyle;
- (unint64_t)newLineCount;
- (unint64_t)nonEmptyParagraphCount;
- (unint64_t)paragraphCount;
- (void)addParagraphsFromTextBody:(id)a3;
- (void)applyTextListStyle:(id)a3;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3 ownTextListStyle:(BOOL)a4;
- (void)flattenProperties;
- (void)removeAllParagraphs;
- (void)removeLastParagraphIfEmpty;
- (void)removeLeadingNewlines;
- (void)removeTrailingNewlines;
- (void)removeUnnecessaryOverrides;
- (void)setParentTextListStyle:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation OADTextBody

- (OADTextBody)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADTextBody;
  v2 = [(OADTextBody *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADTextBodyProperties);
    mProperties = v2->mProperties;
    v2->mProperties = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mParagraphs = v2->mParagraphs;
    v2->mParagraphs = v5;
  }
  return v2;
}

- (id)addParagraph
{
  v3 = objc_alloc_init(OADParagraph);
  [(NSMutableArray *)self->mParagraphs addObject:v3];
  return v3;
}

- (id)properties
{
  return self->mProperties;
}

- (id)findFirstTextRunOfClass:(Class)a3
{
  unsigned int v5 = 0;
  while ([(NSMutableArray *)self->mParagraphs count] > (unint64_t)v5)
  {
    v6 = [(NSMutableArray *)self->mParagraphs objectAtIndex:v5];
    v7 = [v6 findFirstTextRunOfClass:a3];

    ++v5;
    if (v7) {
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  return v7;
}

- (void)setParentTextListStyle:(id)a3
{
  id v4 = a3;
  mTextListStyle = self->mTextListStyle;
  id v8 = v4;
  if (!mTextListStyle)
  {
    v6 = objc_alloc_init(OADTextListStyle);
    v7 = self->mTextListStyle;
    self->mTextListStyle = v6;

    [(NSMutableArray *)self->mParagraphs makeObjectsPerformSelector:sel_setParentTextListStyle_ withObject:self->mTextListStyle];
    mTextListStyle = self->mTextListStyle;
    id v4 = v8;
  }
  [(OADTextListStyle *)mTextListStyle setParentTextListStyle:v4];
}

- (void)removeUnnecessaryOverrides
{
  uint64_t v3 = [(NSMutableArray *)self->mParagraphs count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(NSMutableArray *)self->mParagraphs objectAtIndex:i];
      [v6 removeUnnecessaryOverrides];
    }
  }
  [(OADTextListStyle *)self->mTextListStyle removeUnnecessaryOverrides];
  mProperties = self->mProperties;
  [(OADTextBodyProperties *)mProperties removeUnnecessaryOverrides];
}

- (id)textListStyle
{
  return self->mTextListStyle;
}

- (id)overrideTextListStyle
{
  mTextListStyle = self->mTextListStyle;
  if (!mTextListStyle)
  {
    uint64_t v4 = objc_alloc_init(OADTextListStyle);
    unsigned int v5 = self->mTextListStyle;
    self->mTextListStyle = v4;

    [(NSMutableArray *)self->mParagraphs makeObjectsPerformSelector:sel_setParentTextListStyle_ withObject:self->mTextListStyle];
    mTextListStyle = self->mTextListStyle;
  }
  return mTextListStyle;
}

- (unint64_t)paragraphCount
{
  return [(NSMutableArray *)self->mParagraphs count];
}

- (id)paragraphAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mParagraphs objectAtIndex:a3];
}

- (BOOL)isEmpty
{
  uint64_t v3 = [(NSMutableArray *)self->mParagraphs count];
  if (v3)
  {
    unint64_t v4 = v3;
    BOOL v5 = 0;
    for (i = 0; i != v4; BOOL v5 = i >= v4)
    {
      v7 = [(NSMutableArray *)self->mParagraphs objectAtIndex:i];
      char v8 = [v7 isEmpty];

      if ((v8 & 1) == 0) {
        break;
      }
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v5;
}

- (void)setProperties:(id)a3
{
}

- (unint64_t)nonEmptyParagraphCount
{
  if (![(NSMutableArray *)self->mParagraphs count]) {
    return 0;
  }
  uint64_t v3 = 0;
  LODWORD(v4) = 0;
  unsigned int v5 = 1;
  do
  {
    v6 = [(NSMutableArray *)self->mParagraphs objectAtIndex:v3];
    unint64_t v4 = v4 + ([v6 isEmpty] ^ 1);

    uint64_t v3 = v5;
  }
  while ([(NSMutableArray *)self->mParagraphs count] > (unint64_t)v5++);
  return v4;
}

- (void)removeAllParagraphs
{
}

- (unint64_t)newLineCount
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->mParagraphs;
  unint64_t v3 = 0;
  uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "lineBreakCount", (void)v8) + 1;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)firstParagraphEffects
{
  if ([(OADTextBody *)self paragraphCount])
  {
    unint64_t v3 = [(OADTextBody *)self paragraphAtIndex:0];
    uint64_t v4 = [v3 properties];

    if (v4 && [v4 hasEffects])
    {
      uint64_t v5 = [v4 effects];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)applyTextListStyle:(id)a3
{
  id v6 = a3;
  if (!self->mTextListStyle)
  {
    uint64_t v4 = objc_alloc_init(OADTextListStyle);
    mTextListStyle = self->mTextListStyle;
    self->mTextListStyle = v4;

    [(OADTextListStyle *)self->mTextListStyle overrideWithTextStyle:v6];
  }
  [(NSMutableArray *)self->mParagraphs makeObjectsPerformSelector:sel_applyProperties_ withObject:v6];
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3 ownTextListStyle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = (OADTextListStyle *)a3;
  mTextListStyle = self->mTextListStyle;
  if (mTextListStyle)
  {
    self->mTextListStyle = 0;
  }
  if (v4)
  {
    long long v8 = objc_alloc_init(OADTextListStyle);
    long long v9 = self->mTextListStyle;
    self->mTextListStyle = v8;

    [(OADTextListStyle *)self->mTextListStyle setParentTextListStyle:v6];
    if ([(OADTextBody *)self propagateActualTextStyleToTextListStyle]) {
      [(OADTextListStyle *)self->mTextListStyle changeParentTextListStylePreservingEffectiveValues:v6];
    }
    long long v10 = self->mTextListStyle;

    id v6 = v10;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v11 = self->mParagraphs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "changeParentTextListStylePreservingEffectiveValues:", v6, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)removeTrailingNewlines
{
  uint64_t v3 = [(NSMutableArray *)self->mParagraphs count];
  if (v3 - 1 >= 0)
  {
    uint64_t v4 = v3;
    while (1)
    {
      id v5 = [(NSMutableArray *)self->mParagraphs objectAtIndex:--v4];
      if (![v5 isEmpty]) {
        break;
      }
      [(NSMutableArray *)self->mParagraphs removeLastObject];

      if (v4 <= 0) {
        return;
      }
    }
  }
}

- (void)removeLeadingNewlines
{
  for (unint64_t i = self->mParagraphs; [(NSMutableArray *)i count]; unint64_t i = self->mParagraphs)
  {
    id v4 = [(NSMutableArray *)self->mParagraphs objectAtIndex:0];
    if (([v4 isEmpty] & 1) == 0)
    {

      return;
    }
    [(NSMutableArray *)self->mParagraphs removeObjectAtIndex:0];
  }
}

- (void)removeLastParagraphIfEmpty
{
  if ([(NSMutableArray *)self->mParagraphs count])
  {
    id v3 = [(NSMutableArray *)self->mParagraphs lastObject];
    if ([v3 isEmpty]) {
      [(NSMutableArray *)self->mParagraphs removeLastObject];
    }
  }
}

- (void)flattenProperties
{
  [(OADProperties *)self->mProperties flatten];
  uint64_t v3 = [(NSMutableArray *)self->mParagraphs count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(NSMutableArray *)self->mParagraphs objectAtIndex:i];
      v7 = [v6 properties];
      [v7 flatten];
    }
  }
  mTextListStyle = self->mTextListStyle;
  [(OADTextListStyle *)mTextListStyle flatten];
}

- (BOOL)propagateActualTextStyleToTextListStyle
{
  uint64_t v3 = [(OADTextBody *)self textListStyle];
  unint64_t v4 = [(OADTextBody *)self paragraphCount];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(OADTextBody *)self paragraphAtIndex:i];
      v7 = [v6 properties];
      int v8 = [v7 level];

      if (i != v8)
      {

        goto LABEL_10;
      }
      uint64_t v9 = [v6 textRunCount];

      if (v9 != 1) {
        goto LABEL_10;
      }
    }
    for (uint64_t j = 0; j != v4; ++j)
    {
      long long v11 = [(OADTextBody *)self paragraphAtIndex:j];
      uint64_t v12 = [v11 properties];
      uint64_t v13 = [v3 propertiesForListLevel:j];
      [v13 overrideWithProperties:v12];
      uint64_t v14 = [v11 textRunAtIndex:0];
      long long v15 = [v14 properties];
      [v13 overrideWithCharacterProperties:v15];
    }
    BOOL v16 = 1;
  }
  else
  {
LABEL_10:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isSimilarToTextBody:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 paragraphCount];
  if ([v4 paragraphCount] == v5)
  {
    if (v5)
    {
      BOOL v6 = 0;
      for (unint64_t i = 0; i != v5; v6 = i >= v5)
      {
        int v8 = [(OADTextBody *)self paragraphAtIndex:i];
        uint64_t v9 = [v4 paragraphAtIndex:i];
        char v10 = [v8 isSimilarToParagraph:v9];

        if ((v10 & 1) == 0) {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)plainText
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(NSMutableArray *)self->mParagraphs count];
  if (v4)
  {
    char v5 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(NSMutableArray *)self->mParagraphs objectAtIndex:i];
      if (([v7 isEmpty] & 1) == 0)
      {
        if (v5) {
          [v3 appendString:@"\n"];
        }
        int v8 = [v7 plainText];
        [v3 appendString:v8];

        char v5 = 1;
      }
    }
  }
  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTextBody;
  v2 = [(OADTextBody *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextListStyle, 0);
  objc_storeStrong((id *)&self->mParagraphs, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

- (void)addParagraphsFromTextBody:(id)a3
{
}

@end