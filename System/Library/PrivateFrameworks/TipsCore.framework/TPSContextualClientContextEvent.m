@interface TPSContextualClientContextEvent
+ (BOOL)supportsSecureCoding;
- (NSArray)conditions;
- (TPSContextualClientContextEvent)initWithCoder:(id)a3;
- (TPSContextualClientContextEvent)initWithDictionary:(id)a3;
- (id)clientContextKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setConditions:(id)a3;
@end

@implementation TPSContextualClientContextEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualClientContextEvent)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSContextualClientContextEvent;
  v5 = [(TPSContextualEvent *)&v23 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 TPSSafeArrayForKey:@"conditions"];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          v14 = [TPSContextualClientContextCondition alloc];
          v15 = -[TPSContextualClientContextCondition initWithDictionary:](v14, "initWithDictionary:", v13, (void)v19);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      uint64_t v16 = [v7 copy];
      conditions = v5->_conditions;
      v5->_conditions = (NSArray *)v16;
    }
  }

  return v5;
}

- (TPSContextualClientContextEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSContextualClientContextEvent;
  v5 = [(TPSContextualEvent *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"conditions"];
    conditions = v5->_conditions;
    v5->_conditions = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualClientContextEvent;
  id v4 = a3;
  [(TPSContextualEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_conditions, @"conditions", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualClientContextEvent;
  id v4 = [(TPSContextualEvent *)&v6 copyWithZone:a3];
  [v4 setConditions:self->_conditions];
  return v4;
}

- (id)clientContextKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_conditions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "key", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 allObjects];

  return v10;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualClientContextEvent;
  id v4 = [(TPSContextualEvent *)&v9 debugDescription];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSContextualClientContextEvent *)self conditions];
  uint64_t v7 = [v6 debugDescription];
  [v5 appendFormat:@"%@ = %@", @"conditions", v7];

  return v5;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end