@interface SXTextStyleAttributes
+ (id)attributesWithRange:(_NSRange)a3;
- (NSDictionary)attributes;
- (NSMutableDictionary)mutableAttributes;
- (SXTextStyleAttributes)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAttribute:(id)a3 value:(id)a4;
@end

@implementation SXTextStyleAttributes

+ (id)attributesWithRange:(_NSRange)a3
{
  v3 = -[SXTextStyleAttributes initWithRange:]([SXTextStyleAttributes alloc], "initWithRange:", a3.location, a3.length);
  return v3;
}

- (SXTextStyleAttributes)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)SXTextStyleAttributes;
  v5 = [(SXTextStyleAttributes *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_range.NSUInteger location = location;
    v5->_range.NSUInteger length = length;
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    mutableAttributes = v6->_mutableAttributes;
    v6->_mutableAttributes = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (void)addAttribute:(id)a3 value:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(SXTextStyleAttributes *)self mutableAttributes];
    [v8 setObject:v6 forKey:v7];
  }
}

- (NSDictionary)attributes
{
  v2 = [(SXTextStyleAttributes *)self mutableAttributes];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[2] = [(SXTextStyleAttributes *)self range];
  v5[3] = v6;
  id v7 = [(SXTextStyleAttributes *)self mutableAttributes];
  uint64_t v8 = [v7 copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v4 = objc_opt_class();
  v25.NSUInteger location = [(SXTextStyleAttributes *)self range];
  v5 = NSStringFromRange(v25);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p; range: %@", v4, self, v5];

  [v6 appendString:@" attributes(%d)"];
  id v7 = [(SXTextStyleAttributes *)self mutableAttributes];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v6 appendString:@": \n"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [(SXTextStyleAttributes *)self mutableAttributes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v15 = [(SXTextStyleAttributes *)self mutableAttributes];
          v16 = [v15 objectForKey:v14];
          [v6 appendFormat:@"key: %@ value: %@\n", v14, v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  [v6 appendString:@">"];
  return v6;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSMutableDictionary)mutableAttributes
{
  return self->_mutableAttributes;
}

- (void).cxx_destruct
{
}

@end