@interface TPSGradient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)stops;
- (TPSGradient)initWithCoder:(id)a3;
- (TPSGradient)initWithColorStrings:(id)a3;
- (TPSGradient)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStops:(id)a3;
@end

@implementation TPSGradient

uint64_t __26__TPSGradient_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 stops];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

id __26__TPSGradient_na_identity__block_invoke()
{
  if (TPSGradientStopsKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSGradientStopsKey_block_invoke_na_once_token_0, &__block_literal_global_24);
  }
  v0 = (void *)TPSGradientStopsKey_block_invoke_na_once_object_0;
  return v0;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSGradient;
  id v4 = a3;
  [(TPSSerializableObject *)&v6 encodeWithCoder:v4];
  v5 = [(TPSGradient *)self stops];
  [v4 encodeObject:v5 forKey:@"stops"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSGradient;
  id v4 = [(TPSSerializableObject *)&v7 copyWithZone:a3];
  v5 = [(TPSGradient *)self stops];
  [v4 setStops:v5];

  return v4;
}

- (NSArray)stops
{
  return self->_stops;
}

- (void)setStops:(id)a3
{
}

- (TPSGradient)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TPSGradient;
  v5 = [(TPSSerializableObject *)&v29 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = [v4 TPSSafeDictionaryForKey:@"attrs"];
  objc_super v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = v4;
  }
  id v9 = v8;

  v10 = [v9 TPSSafeArrayForKey:@"stops"];
  uint64_t v11 = [v10 count];
  if (v11)
  {
    id v24 = v9;
    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [[TPSGradientStop alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v15);
    }

    uint64_t v19 = [v12 copy];
    stops = v5->_stops;
    v5->_stops = (NSArray *)v19;

    id v9 = v24;
  }
  uint64_t v21 = [(NSArray *)v5->_stops count];

  if (!v21) {
    v22 = 0;
  }
  else {
LABEL_15:
  }
    v22 = v5;

  return v22;
}

- (TPSGradient)initWithColorStrings:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSGradient;
  v5 = [(TPSGradient *)&v24 init];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 count];
  if (v6 > 0)
  {
    objc_super v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
          uint64_t v14 = [TPSGradientStop alloc];
          uint64_t v15 = -[TPSGradientStop initWithColorString:](v14, "initWithColorString:", v13, (void)v20);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v7 copy];
    stops = v5->_stops;
    v5->_stops = (NSArray *)v16;
  }
  if (![(NSArray *)v5->_stops count]) {
    v18 = 0;
  }
  else {
LABEL_12:
  }
    v18 = v5;

  return v18;
}

- (TPSGradient)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSGradient;
  v5 = [(TPSSerializableObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"stops"];
    stops = v5->_stops;
    v5->_stops = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __26__TPSGradient_na_identity__block_invoke_2()
{
  uint64_t v0 = __26__TPSGradient_na_identity__block_invoke_3();
  uint64_t v1 = TPSGradientStopsKey_block_invoke_na_once_object_0;
  TPSGradientStopsKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __26__TPSGradient_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_31];
  v2 = [v0 build];

  return v2;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSGradient;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSGradient *)self stops];
  uint64_t v7 = [v6 debugDescription];
  [v5 appendFormat:@"\n  %@ = %@", @"stops", v7];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

@end