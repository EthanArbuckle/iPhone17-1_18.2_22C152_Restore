@interface UASharedPasteboardItemInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)types;
- (UASharedPasteboardItemInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTypes:(id)a3;
@end

@implementation UASharedPasteboardItemInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardItemInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UASharedPasteboardItemInfo *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"UASharedPasteboardItemInfoTypesKey"];
    [(UASharedPasteboardItemInfo *)v5 setTypes:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardItemInfo *)self types];
  [v4 encodeObject:v5 forKey:@"UASharedPasteboardItemInfoTypesKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(UASharedPasteboardItemInfo *)self types];
    uint64_t v7 = [v5 types];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(UASharedPasteboardItemInfo);
  v6 = [(UASharedPasteboardItemInfo *)self types];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(UASharedPasteboardItemInfo *)v5 setTypes:v7];

  return v5;
}

- (id)description
{
  v2 = [(UASharedPasteboardItemInfo *)self types];
  v3 = [v2 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_4];

  id v5 = [v4 description];

  return v5;
}

uint64_t __41__UASharedPasteboardItemInfo_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 offset];
  uint64_t v7 = [v5 offset];
  uint64_t v8 = [v4 index];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v5 index];

    if (v10)
    {
      uint64_t v11 = [v4 index];

      uint64_t v12 = [v5 index];

      v6 = (void *)v11;
      uint64_t v7 = (void *)v12;
    }
  }
  uint64_t v13 = [v6 compare:v7];

  return v13;
}

- (NSDictionary)types
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end