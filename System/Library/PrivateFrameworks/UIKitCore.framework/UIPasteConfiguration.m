@interface UIPasteConfiguration
+ (BOOL)supportsSecureCoding;
+ (UIPasteConfiguration)pasteConfigurationWithAcceptableTypes:(id)a3;
+ (id)_pasteConfigurationForAcceptingClasses:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)acceptableTypeIdentifiers;
- (UIPasteConfiguration)init;
- (UIPasteConfiguration)initWithAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers;
- (UIPasteConfiguration)initWithCoder:(id)a3;
- (UIPasteConfiguration)initWithTypeIdentifiersForAcceptingClass:(id)aClass;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers;
- (void)addTypeIdentifiersForAcceptingClass:(id)aClass;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers;
@end

@implementation UIPasteConfiguration

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSMutableOrderedSet *)self->_acceptableTypes copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (UIPasteConfiguration)initWithAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers
{
  v4 = acceptableTypeIdentifiers;
  uint64_t v5 = [(UIPasteConfiguration *)self init];
  v6 = v5;
  if (v5) {
    [(NSMutableOrderedSet *)v5->_acceptableTypes addObjectsFromArray:v4];
  }

  return v6;
}

- (UIPasteConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIPasteConfiguration;
  v2 = [(UIPasteConfiguration *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    acceptableTypes = v2->_acceptableTypes;
    v2->_acceptableTypes = v3;
  }
  return v2;
}

+ (id)_pasteConfigurationForAcceptingClasses:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(UIPasteConfiguration);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UIPasteConfiguration addTypeIdentifiersForAcceptingClass:](v4, "addTypeIdentifiersForAcceptingClass:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)addAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers
{
}

- (UIPasteConfiguration)initWithTypeIdentifiersForAcceptingClass:(id)aClass
{
  v4 = [(UIPasteConfiguration *)self init];
  id v5 = v4;
  if (v4) {
    [(UIPasteConfiguration *)v4 addTypeIdentifiersForAcceptingClass:aClass];
  }
  return v5;
}

- (void)addTypeIdentifiersForAcceptingClass:(id)aClass
{
  acceptableTypes = self->_acceptableTypes;
  id v4 = [aClass readableTypeIdentifiersForItemProvider];
  [(NSMutableOrderedSet *)acceptableTypes addObjectsFromArray:v4];
}

+ (UIPasteConfiguration)pasteConfigurationWithAcceptableTypes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithAcceptableTypes:v4];

  return (UIPasteConfiguration *)v5;
}

- (void)setAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = acceptableTypeIdentifiers;
  uint64_t v6 = (NSMutableOrderedSet *)[[v4 alloc] initWithArray:v5];

  acceptableTypes = self->_acceptableTypes;
  self->_acceptableTypes = v6;
}

- (NSArray)acceptableTypeIdentifiers
{
  v2 = [(NSMutableOrderedSet *)self->_acceptableTypes array];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    acceptableTypes = self->_acceptableTypes;
    uint64_t v6 = v4[1];

    return [(NSMutableOrderedSet *)acceptableTypes isEqualToOrderedSet:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPasteConfiguration;
    BOOL v8 = [(UIPasteConfiguration *)&v9 isEqual:v4];

    return v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIPasteConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPasteConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"at"];
    uint64_t v10 = [v9 mutableCopy];
    acceptableTypes = v5->_acceptableTypes;
    v5->_acceptableTypes = (NSMutableOrderedSet *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  acceptableTypes = self->_acceptableTypes;
  if (acceptableTypes)
  {
    id v4 = a3;
    id v5 = (id)[(NSMutableOrderedSet *)acceptableTypes copy];
    [v4 encodeObject:v5 forKey:@"at"];
  }
}

@end