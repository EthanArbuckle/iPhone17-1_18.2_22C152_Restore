@interface OADParagraph
- (BOOL)hasBulletCharacterProperties;
- (BOOL)isEmpty;
- (BOOL)isSimilarToParagraph:(id)a3;
- (OADParagraph)init;
- (id)addDateTimeFieldWithFormat:(int)a3;
- (id)addFooterField;
- (id)addGenericTextFieldWithGuid:(id)a3 type:(id)a4;
- (id)addRegularTextRun;
- (id)addSlideNumberField;
- (id)addTextLineBreak;
- (id)bulletCharacterProperties;
- (id)description;
- (id)findFirstTextRunOfClass:(Class)a3;
- (id)paragraphEndCharacterProperties;
- (id)plainText;
- (id)properties;
- (id)textRunAtIndex:(unint64_t)a3;
- (unint64_t)characterCount;
- (unint64_t)lineBreakCount;
- (unint64_t)textRunCount;
- (void)applyProperties:(id)a3;
- (void)changeParentParagraphPropertiesPreservingEffectiveValues:(id)a3;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)removeAllTextRuns;
- (void)removeUnnecessaryOverrides;
- (void)setParagraphEndCharacterProperties:(id)a3;
- (void)setParentTextListStyle:(id)a3;
@end

@implementation OADParagraph

- (OADParagraph)init
{
  v10.receiver = self;
  v10.super_class = (Class)OADParagraph;
  v2 = [(OADParagraph *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADParagraphProperties);
    mProperties = v2->mProperties;
    v2->mProperties = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mTextRuns = v2->mTextRuns;
    v2->mTextRuns = v5;

    v7 = objc_alloc_init(OADCharacterProperties);
    mParagraphEndCharacterProperties = v2->mParagraphEndCharacterProperties;
    v2->mParagraphEndCharacterProperties = v7;

    [(OADProperties *)v2->mParagraphEndCharacterProperties setParent:v2->mProperties];
  }
  return v2;
}

- (id)properties
{
  return self->mProperties;
}

- (unint64_t)textRunCount
{
  return [(NSMutableArray *)self->mTextRuns count];
}

- (id)addRegularTextRun
{
  v3 = objc_alloc_init(OADRegularTextRun);
  v4 = [(OADTextRun *)v3 properties];
  [v4 setParent:self->mProperties];

  [(NSMutableArray *)self->mTextRuns addObject:v3];
  return v3;
}

- (id)textRunAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mTextRuns objectAtIndex:a3];
}

- (id)paragraphEndCharacterProperties
{
  return self->mParagraphEndCharacterProperties;
}

- (id)addFooterField
{
  v3 = objc_alloc_init(OADFooterField);
  v4 = [(OADTextRun *)v3 properties];
  [v4 setParent:self->mProperties];

  [(NSMutableArray *)self->mTextRuns addObject:v3];
  return v3;
}

- (id)addSlideNumberField
{
  v3 = objc_alloc_init(PDSlideNumberField);
  v4 = [(OADTextRun *)v3 properties];
  [v4 setParent:self->mProperties];

  [(NSMutableArray *)self->mTextRuns addObject:v3];
  return v3;
}

- (id)findFirstTextRunOfClass:(Class)a3
{
  unsigned int v4 = 0;
  while ([(NSMutableArray *)self->mTextRuns count] > (unint64_t)v4)
  {
    uint64_t v5 = v4;
    v6 = [(NSMutableArray *)self->mTextRuns objectAtIndex:v4];
    char isKindOfClass = objc_opt_isKindOfClass();

    unsigned int v4 = v5 + 1;
    if (isKindOfClass)
    {
      v8 = [(NSMutableArray *)self->mTextRuns objectAtIndex:v5];
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  return v8;
}

- (void)setParentTextListStyle:(id)a3
{
  id v6 = a3;
  mProperties = self->mProperties;
  uint64_t v5 = objc_msgSend(v6, "propertiesForListLevel:", -[OADParagraphProperties level](mProperties, "level"));
  [(OADProperties *)mProperties setParent:v5];
}

- (void)removeUnnecessaryOverrides
{
  [(OADCharacterProperties *)self->mParagraphEndCharacterProperties removeUnnecessaryOverrides];
  unint64_t v3 = [(OADParagraph *)self textRunCount];
  if (v3)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(OADParagraph *)self textRunAtIndex:i];
      [v6 removeUnnecessaryOverrides];
    }
  }
  mProperties = self->mProperties;
  [(OADParagraphProperties *)mProperties removeUnnecessaryOverrides];
}

- (id)addTextLineBreak
{
  unint64_t v3 = objc_alloc_init(OADTextLineBreak);
  unint64_t v4 = [(OADTextRun *)v3 properties];
  [v4 setParent:self->mProperties];

  [(NSMutableArray *)self->mTextRuns addObject:v3];
  return v3;
}

- (BOOL)isEmpty
{
  unint64_t v3 = [(OADParagraph *)self textRunCount];
  if (v3)
  {
    unint64_t v4 = v3;
    BOOL v5 = 0;
    for (i = 0; i != v4; BOOL v5 = i >= v4)
    {
      v7 = [(OADParagraph *)self textRunAtIndex:i];
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

- (unint64_t)characterCount
{
  unint64_t v3 = [(OADParagraph *)self textRunCount];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  unint64_t v5 = 0;
  for (uint64_t i = 0; i != v4; ++i)
  {
    v7 = [(OADParagraph *)self textRunAtIndex:i];
    v5 += [v7 characterCount];
  }
  return v5;
}

- (void)removeAllTextRuns
{
}

- (unint64_t)lineBreakCount
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->mTextRuns;
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
        objc_opt_class();
        v3 += objc_opt_isKindOfClass() & 1;
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)addGenericTextFieldWithGuid:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [[OADGenericTextField alloc] initWithGuid:v6 type:v7];
  long long v9 = [(OADTextRun *)v8 properties];
  [v9 setParent:self->mProperties];

  [(NSMutableArray *)self->mTextRuns addObject:v8];
  return v8;
}

- (id)addDateTimeFieldWithFormat:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_alloc_init(OADDateTimeField);
  id v6 = [(OADTextRun *)v5 properties];
  [v6 setParent:self->mProperties];

  [(OADDateTimeField *)v5 setFormat:v3];
  [(NSMutableArray *)self->mTextRuns addObject:v5];
  return v5;
}

- (void)setParagraphEndCharacterProperties:(id)a3
{
}

- (BOOL)hasBulletCharacterProperties
{
  if ([(OADParagraph *)self isEmpty]) {
    return 0;
  }
  uint64_t v4 = [(OADParagraph *)self textRunAtIndex:0];
  uint64_t v5 = [v4 properties];
  BOOL v3 = v5 != 0;

  return v3;
}

- (id)bulletCharacterProperties
{
  v2 = [(OADParagraph *)self textRunAtIndex:0];
  BOOL v3 = [v2 properties];

  return v3;
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v5 = a3;
  uint64_t v4 = objc_msgSend(v5, "propertiesForListLevel:", -[OADParagraphProperties level](self->mProperties, "level"));
  [(OADParagraph *)self changeParentParagraphPropertiesPreservingEffectiveValues:v4];
}

- (void)changeParentParagraphPropertiesPreservingEffectiveValues:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(OADProperties *)self->mProperties changeParentPreservingEffectiveValues:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->mTextRuns;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "properties", (void)v10);
        [v9 changeParentPreservingEffectiveValues:self->mProperties];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(OADProperties *)self->mParagraphEndCharacterProperties changeParentPreservingEffectiveValues:self->mProperties];
}

- (void)applyProperties:(id)a3
{
  id v6 = a3;
  id v4 = [(OADParagraph *)self properties];
  id v5 = objc_msgSend(v6, "propertiesForListLevel:", (int)objc_msgSend(v4, "level"));
  [v4 overrideWithProperties:v5];
}

- (BOOL)isSimilarToParagraph:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(OADParagraph *)self textRunCount];
  if ([v4 textRunCount] == v5)
  {
    if (v5)
    {
      BOOL v6 = 0;
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = [(OADParagraph *)self textRunAtIndex:v7];
        long long v9 = [v4 textRunAtIndex:v7];
        uint64_t v10 = objc_opt_class();
        if (v10 != objc_opt_class()) {
          break;
        }
        char v11 = [v8 isSimilarToTextRun:v9];

        if (v11)
        {
          BOOL v6 = ++v7 >= v5;
          if (v5 != v7) {
            continue;
          }
        }
        goto LABEL_11;
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
LABEL_11:

  return v6;
}

- (id)plainText
{
  BOOL v3 = objc_opt_new();
  unint64_t v4 = [(OADParagraph *)self textRunCount];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      BOOL v6 = [(OADParagraph *)self textRunAtIndex:i];
      if (([v6 isEmpty] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 appendString:@"\n"];
        }
      }
      else
      {
        uint64_t v7 = [v6 text];
        [v3 appendString:v7];
      }
    }
  }
  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADParagraph;
  v2 = [(OADParagraph *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParagraphEndCharacterProperties, 0);
  objc_storeStrong((id *)&self->mTextRuns, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end