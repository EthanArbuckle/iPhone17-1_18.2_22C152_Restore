@interface SCRCMathArrayExpression
- (BOOL)hasSimpleArrayOfChildren;
- (NSArray)mathMLAttributes;
- (NSString)mathMLTag;
- (SCRCMathArrayExpression)initWithDictionary:(id)a3;
- (id)childSpeakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 parentTreePosition:(id)a5 childIndex:(unint64_t *)a6;
- (id)children;
- (id)description;
- (id)localizablePrefixForChildAtIndex:(unint64_t)a3;
- (id)localizableSuffixForChildAtIndex:(unint64_t)a3;
- (id)mathMLString;
- (id)prefixForChildAtIndex:(unint64_t)a3;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)suffixForChildAtIndex:(unint64_t)a3;
@end

@implementation SCRCMathArrayExpression

- (SCRCMathArrayExpression)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SCRCMathArrayExpression;
  v5 = [(SCRCMathExpression *)&v21 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMChildren"];
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
          v14 = v13;
          if (v13)
          {
            [v13 setParent:v5];
            [(NSArray *)v7 addObject:v14];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    children = v5->_children;
    v5->_children = v7;
  }
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SCRCMathArrayExpression;
  v3 = [(SCRCMathArrayExpression *)&v7 description];
  id v4 = [(SCRCMathArrayExpression *)self children];
  v5 = [v3 stringByAppendingFormat:@" - children %@", v4];

  return v5;
}

- (id)children
{
  v2 = (void *)[(NSArray *)self->_children copy];
  return v2;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v7 = [MEMORY[0x263F089B8] scrcString];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(SCRCMathArrayExpression *)self children];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((v12 & 1) == 0)
        {
          if (v4) {
            [MEMORY[0x263F086A0] scrcPauseString];
          }
          else {
          v15 = [MEMORY[0x263F086A0] scrcSpaceString];
          }
          [v7 appendAttributedString:v15];
        }
        v16 = [v14 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];
        [v7 appendAttributedString:v16];

        char v12 = 0;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      char v12 = 0;
    }
    while (v10);
  }

  return v7;
}

- (id)childSpeakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 parentTreePosition:(id)a5 childIndex:(unint64_t *)a6
{
  unint64_t v9 = *a6;
  id v10 = a5;
  uint64_t v11 = [(SCRCMathArrayExpression *)self children];
  char v12 = [v11 objectAtIndex:v9];

  v13 = [v10 indexPathByAddingIndex:v9];

  v14 = [(SCRCMathArrayExpression *)self prefixForChildAtIndex:v9];
  v15 = [(SCRCMathArrayExpression *)self suffixForChildAtIndex:v9];
  v16 = [v12 speakableSegmentsWithSpeakingStyle:a3 upToDepth:a4 treePosition:v13 prefix:v14 suffix:v15];

  return v16;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8 = a5;
  if (a4)
  {
    unint64_t v9 = a4 - 1;
    if (a4 == 1)
    {
      v19.receiver = self;
      v19.super_class = (Class)SCRCMathArrayExpression;
      a4 = [(SCRCMathExpression *)&v19 speakableSegmentsWithSpeakingStyle:a3 upToDepth:1 treePosition:v8];
    }
    else
    {
      a4 = [MEMORY[0x263EFF980] array];
      id v10 = [(SCRCMathArrayExpression *)self children];
      unint64_t v11 = [v10 count];

      for (unint64_t i = 0; i < v11; ++i)
      {
        char v12 = [(SCRCMathArrayExpression *)self childSpeakableSegmentsWithSpeakingStyle:a3 upToDepth:v9 parentTreePosition:v8 childIndex:&i];
        [(id)a4 addObjectsFromArray:v12];
      }
      uint64_t v13 = [(id)a4 count];
      if (v13 - 1 >= 0)
      {
        uint64_t v14 = v13;
        do
        {
          v15 = [(id)a4 objectAtIndex:--v14];
          uint64_t v16 = [v15 length];

          if (!v16) {
            [(id)a4 removeObjectAtIndex:v14];
          }
        }
        while (v14 > 0);
      }
    }
  }

  return (id)a4;
}

- (id)mathMLString
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(SCRCMathArrayExpression *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) mathMLString];
        [v3 appendString:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v10 = [(SCRCMathArrayExpression *)self mathMLTag];
  unint64_t v11 = [(SCRCMathArrayExpression *)self mathMLAttributes];
  char v12 = [v3 stringWrappedInMathMLTag:v10 withAttributes:v11];

  return v12;
}

- (BOOL)hasSimpleArrayOfChildren
{
  return 1;
}

- (NSString)mathMLTag
{
  return 0;
}

- (NSArray)mathMLAttributes
{
  return 0;
}

- (id)localizablePrefixForChildAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)localizableSuffixForChildAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)prefixForChildAtIndex:(unint64_t)a3
{
  BOOL v4 = [(SCRCMathArrayExpression *)self localizablePrefixForChildAtIndex:a3];
  uint64_t v5 = [(SCRCMathExpression *)self localizedAttributedStringForKey:v4];

  return v5;
}

- (id)suffixForChildAtIndex:(unint64_t)a3
{
  BOOL v4 = [(SCRCMathArrayExpression *)self localizableSuffixForChildAtIndex:a3];
  uint64_t v5 = [(SCRCMathExpression *)self localizedAttributedStringForKey:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end