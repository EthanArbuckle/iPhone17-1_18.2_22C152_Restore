@interface UNCSectionIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)variants;
- (UNCSectionIcon)initWithCoder:(id)a3;
- (id)_bestVariantForFormat:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)addVariant:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVariants:(id)a3;
@end

@implementation UNCSectionIcon

- (void)addVariant:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = a3;
    v6 = [(UNCSectionIcon *)self variants];
    id v8 = [v4 setWithSet:v6];

    v7 = [v8 setByAddingObject:v5];

    [(UNCSectionIcon *)self setVariants:v7];
  }
}

- (id)_bestVariantForFormat:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(UNCSectionIcon *)self variants];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if ([v10 format] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v12 = [(UNCSectionIcon *)self variants];
  id v11 = [v12 anyObject];

LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(UNCSectionIcon *)self variants];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UNCSectionIcon *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      uint64_t v6 = [(UNCSectionIcon *)self variants];
      uint64_t v7 = [(UNCSectionIcon *)v5 variants];

      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(UNCSectionIcon *)self variants];
  [v4 setVariants:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionIcon)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(UNCSectionIcon *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    char v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"variants"];
    [(UNCSectionIcon *)v5 setVariants:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionIcon *)self variants];
  [v4 encodeObject:v5 forKey:@"variants"];
}

- (NSSet)variants
{
  return self->_variants;
}

- (void)setVariants:(id)a3
{
}

- (void).cxx_destruct
{
}

@end