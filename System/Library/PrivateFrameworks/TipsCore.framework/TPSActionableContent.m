@interface TPSActionableContent
+ (BOOL)supportsSecureCoding;
- (NSArray)actions;
- (TPSActionableContent)initWithCoder:(id)a3;
- (TPSActionableContent)initWithDictionary:(id)a3 metadata:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
@end

@implementation TPSActionableContent

- (TPSActionableContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TPSActionableContent;
  v7 = [(TPSContent *)&v26 initWithDictionary:v6 metadata:a4];
  if (v7)
  {
    v8 = [v6 TPSSafeArrayForKey:@"actions"];
    uint64_t v9 = [v8 count];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
            v17 = [TPSURLAction alloc];
            v18 = -[TPSURLAction initWithDictionary:](v17, "initWithDictionary:", v16, (void)v22);
            if (v18) {
              [v10 addObject:v18];
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      uint64_t v19 = [v10 copy];
      actions = v7->_actions;
      v7->_actions = (NSArray *)v19;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSActionableContent;
  id v4 = a3;
  [(TPSContent *)&v6 encodeWithCoder:v4];
  v5 = [(TPSActionableContent *)self actions];
  [v4 encodeObject:v5 forKey:@"actions"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSActionableContent;
  id v4 = [(TPSContent *)&v7 copyWithZone:a3];
  v5 = [(TPSActionableContent *)self actions];
  [v4 setActions:v5];

  return v4;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (TPSActionableContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSActionableContent;
  v5 = [(TPSContent *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)TPSActionableContent;
  id v4 = [(TPSContent *)&v10 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  objc_super v6 = [(TPSActionableContent *)self actions];

  if (v6)
  {
    uint64_t v7 = [(TPSActionableContent *)self actions];
    v8 = [v7 debugDescription];
    [v5 appendFormat:@"\n %@ = %@", @"actions", v8];
  }
  return v5;
}

@end