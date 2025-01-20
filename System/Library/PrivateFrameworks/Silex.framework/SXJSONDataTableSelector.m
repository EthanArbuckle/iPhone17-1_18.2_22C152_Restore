@interface SXJSONDataTableSelector
- (NSString)description;
- (SXJSONDataTableSelector)initWithJSONData:(id)a3 andVersion:(id)a4;
- (SXJSONDataTableSelector)initWithJSONObject:(id)a3 andVersion:(id)a4;
- (id)propertyList;
- (unint64_t)numberOfConditions;
- (unint64_t)selectorBooleanForValue:(id)a3;
- (unint64_t)selectorWeight;
- (unint64_t)weightForSelectorKey:(id)a3;
- (void)commonInit;
- (void)setNumberOfConditions:(unint64_t)a3;
- (void)setSelectorWeight:(unint64_t)a3;
@end

@implementation SXJSONDataTableSelector

- (SXJSONDataTableSelector)initWithJSONData:(id)a3 andVersion:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SXJSONDataTableSelector;
  v4 = [(SXJSONObject *)&v7 initWithJSONData:a3 andVersion:a4];
  v5 = v4;
  if (v4) {
    [(SXJSONDataTableSelector *)v4 commonInit];
  }
  return v5;
}

- (SXJSONDataTableSelector)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SXJSONDataTableSelector;
  v4 = [(SXJSONObject *)&v7 initWithJSONObject:a3 andVersion:a4];
  v5 = v4;
  if (v4) {
    [(SXJSONDataTableSelector *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  self->_numberOfConditions = -1;
  self->_selectorWeight = -1;
}

- (unint64_t)selectorBooleanForValue:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v3 BOOLValue]) {
      unint64_t v4 = 1;
    }
    else {
      unint64_t v4 = 2;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)numberOfConditions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t numberOfConditions = self->_numberOfConditions;
  if (numberOfConditions == -1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v4 = [(SXJSONDataTableSelector *)self propertyList];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t numberOfConditions = 0;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [(id)objc_opt_class() jsonPropertyNameForObjCPropertyName:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          v10 = [(SXJSONObject *)self jsonDictionary];
          v11 = [v10 objectForKey:v9];

          v12 = [MEMORY[0x263EFF9D0] null];

          if (v11) {
            BOOL v13 = v11 == v12;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13) {
            ++numberOfConditions;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t numberOfConditions = 0;
    }

    self->_unint64_t numberOfConditions = numberOfConditions;
  }
  return numberOfConditions;
}

- (unint64_t)weightForSelectorKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"rowIndex"] & 1) != 0
    || ([v3 isEqualToString:@"columnIndex"] & 1) != 0)
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"descriptor"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)selectorWeight
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t result = self->_selectorWeight;
  if (result == -1)
  {
    unint64_t v4 = [(SXJSONDataTableSelector *)self propertyList];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [(SXJSONObject *)self jsonDictionary];
          v12 = [v11 valueForKey:v10];

          if (v12)
          {
            BOOL v13 = [MEMORY[0x263EFF9D0] null];

            if (v12 != v13) {
              v7 += [(SXJSONDataTableSelector *)self weightForSelectorKey:v10];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }
    self->_selectorWeight = v7;

    return self->_selectorWeight;
  }
  return result;
}

- (id)propertyList
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  uint64_t i = [(id)__propertyList objectForKey:v3];
  if (!i)
  {
    uint64_t v5 = objc_opt_class();
    for (uint64_t i = [MEMORY[0x263EFF980] array];
          v5 != objc_opt_class();
          uint64_t v5 = (void *)[v5 superclass])
    {
      unsigned int outCount = 0;
      uint64_t v6 = class_copyPropertyList((Class)v5, &outCount);
      if (outCount)
      {
        for (unint64_t j = 0; j < outCount; ++j)
        {
          uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", property_getName(v6[j]));
          [i addObject:v8];
        }
      }
      free(v6);
    }
    v9 = (void *)[(id)__propertyList mutableCopy];
    if (!v9)
    {
      v9 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v9 setObject:i forKey:v3];
    uint64_t v10 = (void *)__propertyList;
    __propertyList = (uint64_t)v9;
  }
  return i;
}

- (NSString)description
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(SXJSONDataTableSelector *)self propertyList];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    unint64_t v7 = &stru_26D5311C0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [(SXJSONObject *)self jsonDictionary];
        v11 = [v10 valueForKey:v9];

        if (v11)
        {
          v12 = [MEMORY[0x263EFF9D0] null];

          if (v11 != v12)
          {
            BOOL v13 = [NSString stringWithFormat:@"; %@: %@", v9, v11];
            uint64_t v14 = [(__CFString *)v7 stringByAppendingString:v13];

            unint64_t v7 = (__CFString *)v14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = &stru_26D5311C0;
  }
  long long v15 = [NSString stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(__CFString *)v7 length])
  {
    uint64_t v16 = [v15 stringByAppendingString:v7];

    long long v15 = (void *)v16;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"; weight: %d",
  long long v17 = [(SXJSONDataTableSelector *)self selectorWeight]);
  long long v18 = [v15 stringByAppendingString:v17];

  uint64_t v19 = [v18 stringByAppendingString:@">"];

  return (NSString *)v19;
}

- (void)setSelectorWeight:(unint64_t)a3
{
  self->_selectorWeight = a3;
}

- (void)setNumberOfConditions:(unint64_t)a3
{
  self->_unint64_t numberOfConditions = a3;
}

@end