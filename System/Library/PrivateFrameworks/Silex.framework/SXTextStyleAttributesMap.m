@interface SXTextStyleAttributesMap
- (NSMutableArray)attributes;
- (NSString)string;
- (SXTextStyleAttributesMap)attributesMapWithAttributesForRange:(_NSRange)a3;
- (SXTextStyleAttributesMap)initWithString:(id)a3;
- (id)attributedString;
- (id)description;
- (void)addAttributes:(id)a3;
@end

@implementation SXTextStyleAttributesMap

- (SXTextStyleAttributesMap)initWithString:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXTextStyleAttributesMap;
  v6 = [(SXTextStyleAttributesMap *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_string, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    attributes = v7->_attributes;
    v7->_attributes = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTextStyleAttributesMap *)self attributes];
  [v5 addObject:v4];
}

- (id)attributedString
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089B8]);
  id v4 = [(SXTextStyleAttributesMap *)self string];
  id v5 = (void *)[v3 initWithString:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(SXTextStyleAttributesMap *)self attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 attributes];
        uint64_t v13 = [v11 range];
        objc_msgSend(v5, "addAttributes:range:", v12, v13, v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (SXTextStyleAttributesMap)attributesMapWithAttributesForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v25 = *MEMORY[0x263EF8340];
  v6 = [SXTextStyleAttributesMap alloc];
  uint64_t v7 = [(SXTextStyleAttributesMap *)self string];
  uint64_t v8 = [(SXTextStyleAttributesMap *)v6 initWithString:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(SXTextStyleAttributesMap *)self attributes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    NSUInteger v13 = location + length;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v15 range] <= location)
        {
          uint64_t v16 = [v15 range];
          if (v16 + v17 >= v13)
          {
            long long v18 = (void *)[v15 copy];
            [(SXTextStyleAttributesMap *)v8 addAttributes:v18];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  id v5 = [(SXTextStyleAttributesMap *)self attributes];
  v6 = [v3 stringWithFormat:@"<%@: %p; string: %@;", v4, self, v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(SXTextStyleAttributesMap *)self attributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        [v6 appendString:v12];

        [v6 appendString:@"\n"];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [v6 appendString:@">"];
  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end