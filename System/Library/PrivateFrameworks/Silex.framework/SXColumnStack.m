@interface SXColumnStack
- (NSArray)columnStack;
- (SXColumnStack)initWithNumberOfColumns:(unint64_t)a3;
- (id)allComponentsAfterComponent:(id)a3;
- (id)allComponentsBeforeComponent:(id)a3;
- (id)componentsAfterComponent:(id)a3;
- (id)componentsBeforeComponent:(id)a3;
- (id)description;
- (unint64_t)rangeInBounds:(_NSRange)a3;
- (void)addComponentBlueprint:(id)a3;
@end

@implementation SXColumnStack

- (SXColumnStack)initWithNumberOfColumns:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SXColumnStack;
  v4 = [(SXColumnStack *)&v9 init];
  if (v4)
  {
    for (i = [MEMORY[0x263EFF980] array];
    {
      v6 = [MEMORY[0x263EFF980] array];
      [(NSArray *)i addObject:v6];
    }
    columnStack = v4->_columnStack;
    v4->_columnStack = i;
  }
  return v4;
}

- (void)addComponentBlueprint:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [v10 columnRange];
  if (v4 < v4 + v5)
  {
    unint64_t v6 = v4;
    uint64_t v7 = v5;
    do
    {
      v8 = [(SXColumnStack *)self columnStack];
      objc_super v9 = [v8 objectAtIndex:v6];

      [v9 addObject:v10];
      ++v6;
      --v7;
    }
    while (v7);
  }
}

- (id)allComponentsBeforeComponent:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 columnRange];
  uint64_t v7 = v6;
  v8 = [MEMORY[0x263EFF9B0] orderedSet];
  uint64_t v9 = v5 + v7;
  if (v5 < v5 + v7)
  {
    do
    {
      id v10 = [(SXColumnStack *)self columnStack];
      v11 = [v10 objectAtIndex:v5];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
LABEL_4:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          if (*(id *)(*((void *)&v18 + 1) + 8 * v16) == v4) {
            break;
          }
          objc_msgSend(v8, "addObject:");
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v14) {
              goto LABEL_4;
            }
            break;
          }
        }
      }

      ++v5;
    }
    while (v5 != v9);
  }

  return v8;
}

- (id)componentsBeforeComponent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 columnRange];
  uint64_t v7 = v6;
  v8 = [MEMORY[0x263EFF9B0] orderedSet];
  if (v5 < v5 + v7)
  {
    do
    {
      uint64_t v9 = [(SXColumnStack *)self columnStack];
      id v10 = [v9 objectAtIndex:v5];

      uint64_t v11 = [v10 indexOfObjectIdenticalTo:v4];
      if (v11)
      {
        id v12 = [v10 objectAtIndex:v11 - 1];
        [v8 addObject:v12];
      }
      ++v5;
      --v7;
    }
    while (v7);
  }

  return v8;
}

- (id)allComponentsAfterComponent:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 columnRange];
  uint64_t v7 = v6;
  v8 = [MEMORY[0x263EFF9B0] orderedSet];
  uint64_t v9 = v5 + v7;
  if (v5 < v5 + v7)
  {
    do
    {
      id v10 = [(SXColumnStack *)self columnStack];
      uint64_t v11 = [v10 objectAtIndex:v5];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        BOOL v15 = 0;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v12);
            }
            id v18 = *(id *)(*((void *)&v20 + 1) + 8 * i);
            if (v15)
            {
              [v8 addObject:v18];
              BOOL v15 = 1;
            }
            else
            {
              BOOL v15 = v18 == v4;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }

      ++v5;
    }
    while (v5 != v9);
  }

  return v8;
}

- (id)componentsAfterComponent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 columnRange];
  uint64_t v7 = v6;
  v8 = [MEMORY[0x263EFF9B0] orderedSet];
  if (v5 < v5 + v7)
  {
    do
    {
      uint64_t v9 = [(SXColumnStack *)self columnStack];
      id v10 = [v9 objectAtIndex:v5];

      unint64_t v11 = [v10 indexOfObjectIdenticalTo:v4];
      if (v11 < [v10 count] - 1)
      {
        id v12 = [v10 objectAtIndex:v11 + 1];
        [v8 addObject:v12];
      }
      ++v5;
      --v7;
    }
    while (v7);
  }

  return v8;
}

- (unint64_t)rangeInBounds:(_NSRange)a3
{
  NSUInteger v3 = a3.location + a3.length;
  id v4 = [(SXColumnStack *)self columnStack];
  unint64_t v5 = v3 <= [v4 count];

  return v5;
}

- (id)description
{
  v2 = [(SXColumnStack *)self columnStack];
  NSUInteger v3 = [v2 description];

  return v3;
}

- (NSArray)columnStack
{
  return self->_columnStack;
}

- (void).cxx_destruct
{
}

@end