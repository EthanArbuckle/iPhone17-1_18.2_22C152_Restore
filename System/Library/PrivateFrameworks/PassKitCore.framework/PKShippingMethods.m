@interface PKShippingMethods
+ (BOOL)supportsSecureCoding;
+ (PKShippingMethods)shippingMethodsWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToShippingMethods:(id)a3;
- (NSArray)legacyShippingMethods;
- (NSArray)methods;
- (PKShippingMethod)defaultMethod;
- (PKShippingMethods)init;
- (PKShippingMethods)initWithCoder:(id)a3;
- (PKShippingMethods)initWithLegacyShippingMethods:(id)a3;
- (PKShippingMethods)initWithMethods:(id)a3 defaultMethod:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKShippingMethods

+ (PKShippingMethods)shippingMethodsWithProtobuf:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v3, "methods", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[PKShippingMethod shippingMethodWithProtobuf:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v11 = [v3 defaultMethod];
  v12 = +[PKShippingMethod shippingMethodWithProtobuf:v11];

  v13 = [[PKShippingMethods alloc] initWithMethods:v4 defaultMethod:v12];
  return v13;
}

- (id)protobuf
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(PKProtobufShippingMethods);
  v4 = [(PKShippingMethods *)self methods];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(PKShippingMethods *)self methods];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) shippingMethodProtobuf];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [(PKProtobufShippingMethods *)v3 setMethods:v6];
  }
  v13 = [(PKShippingMethods *)self defaultMethod];
  v14 = [v13 shippingMethodProtobuf];
  [(PKProtobufShippingMethods *)v3 setDefaultMethod:v14];

  return v3;
}

- (PKShippingMethods)init
{
  return [(PKShippingMethods *)self initWithMethods:MEMORY[0x1E4F1CBF0] defaultMethod:0];
}

- (PKShippingMethods)initWithLegacyShippingMethods:(id)a3
{
  return [(PKShippingMethods *)self initWithMethods:a3 defaultMethod:0];
}

- (PKShippingMethods)initWithMethods:(id)a3 defaultMethod:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKShippingMethods;
  uint64_t v8 = [(PKShippingMethods *)&v18 init];
  uint64_t v9 = v8;
  if (v8)
  {
    legacyShippingMethods = v8->_legacyShippingMethods;
    v8->_legacyShippingMethods = 0;

    if (v6) {
      [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    }
    else {
    uint64_t v11 = [MEMORY[0x1E4F1CAA0] orderedSet];
    }
    methodsSet = v9->_methodsSet;
    v9->_methodsSet = (NSOrderedSet *)v11;

    if ([(NSOrderedSet *)v9->_methodsSet containsObject:v7])
    {
      uint64_t v13 = [v7 copy];
    }
    else
    {
      if (v7)
      {
        v14 = PKLogFacilityTypeGetObject(7uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v17 = 0;
          _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKShippingMethods: Default shipping method provided, but doesn't exist in set. Defaulting to first item instead.", v17, 2u);
        }
      }
      uint64_t v13 = [(NSOrderedSet *)v9->_methodsSet firstObject];
    }
    defaultMethod = v9->_defaultMethod;
    v9->_defaultMethod = (PKShippingMethod *)v13;
  }
  return v9;
}

- (NSArray)legacyShippingMethods
{
  legacyShippingMethods = self->_legacyShippingMethods;
  if (!legacyShippingMethods)
  {
    NSUInteger v4 = [(NSOrderedSet *)self->_methodsSet indexOfObject:self->_defaultMethod];
    methodsSet = self->_methodsSet;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [(NSOrderedSet *)methodsSet array];
      id v7 = self->_legacyShippingMethods;
      self->_legacyShippingMethods = v6;
    }
    else
    {
      id v7 = (NSArray *)[(NSOrderedSet *)methodsSet mutableCopy];
      uint64_t v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v4];
      [(NSArray *)v7 moveObjectsAtIndexes:v8 toIndex:0];

      uint64_t v9 = [(NSArray *)v7 array];
      uint64_t v10 = self->_legacyShippingMethods;
      self->_legacyShippingMethods = v9;
    }
    legacyShippingMethods = self->_legacyShippingMethods;
  }
  uint64_t v11 = legacyShippingMethods;
  return v11;
}

- (NSArray)methods
{
  return [(NSOrderedSet *)self->_methodsSet array];
}

- (PKShippingMethods)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v7 = [v4 setWithArray:v6];

  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"methods"];
  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"defaultMethod"];

  uint64_t v10 = [(PKShippingMethods *)self initWithMethods:v8 defaultMethod:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKShippingMethods *)self methods];
  [v4 encodeObject:v5 forKey:@"methods"];

  id v6 = [(PKShippingMethods *)self defaultMethod];
  [v4 encodeObject:v6 forKey:@"defaultMethod"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSOrderedSet *)self->_methodsSet copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PKShippingMethod *)self->_defaultMethod copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_methodsSet];
  [v3 safelyAddObject:self->_defaultMethod];
  v7.receiver = self;
  v7.super_class = (Class)PKShippingMethods;
  id v4 = [(PKShippingMethods *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKShippingMethods *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKShippingMethods *)self isEqualToShippingMethods:v5];

  return v6;
}

- (BOOL)isEqualToShippingMethods:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  methodsSet = self->_methodsSet;
  BOOL v6 = (NSOrderedSet *)v4[2];
  if (methodsSet) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSOrderedSet isEqual:](methodsSet, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  if (methodsSet != v6) {
    goto LABEL_8;
  }
LABEL_11:
  defaultMethod = self->_defaultMethod;
  uint64_t v11 = (PKShippingMethod *)v4[3];
  if (defaultMethod && v11) {
    BOOL v8 = -[PKShippingMethod isEqual:](defaultMethod, "isEqual:");
  }
  else {
    BOOL v8 = defaultMethod == v11;
  }
LABEL_9:

  return v8;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"methods: %d, ", -[NSOrderedSet count](self->_methodsSet, "count")];
  id v4 = [(PKShippingMethod *)self->_defaultMethod identifier];
  [v3 appendFormat:@"defaultMethod identifier: %@", v4];

  [v3 appendFormat:@">"];
  unint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (PKShippingMethod)defaultMethod
{
  return self->_defaultMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMethod, 0);
  objc_storeStrong((id *)&self->_methodsSet, 0);
  objc_storeStrong((id *)&self->_legacyShippingMethods, 0);
}

@end