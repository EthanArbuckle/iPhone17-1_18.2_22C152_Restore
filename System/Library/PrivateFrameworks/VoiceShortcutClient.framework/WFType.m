@interface WFType
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToClass:(Class)a3;
- (BOOL)conformsToString:(id)a3;
- (BOOL)conformsToType:(id)a3;
- (BOOL)conformsToTypes:(id)a3;
- (BOOL)conformsToUTType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClass:(Class)a3;
- (BOOL)isEqualToType:(id)a3;
- (BOOL)isEqualToUTType:(id)a3;
- (NSString)string;
- (id)description;
- (unint64_t)hash;
@end

@implementation WFType

- (unint64_t)hash
{
  v2 = [(WFType *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFType;
  v4 = [(WFType *)&v8 description];
  v5 = [(WFType *)self string];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)string
{
  result = (NSString *)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[WFType string] must be overridden"];
  __break(1u);
  return result;
}

- (BOOL)isEqualToClass:(Class)a3
{
  return 0;
}

- (BOOL)isEqualToUTType:(id)a3
{
  return 0;
}

- (BOOL)isEqualToType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(WFType *)self string];
    v6 = [v4 string];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self || -[WFType isEqualToType:](self, "isEqualToType:");
}

- (BOOL)conformsToClass:(Class)a3
{
  return 0;
}

- (BOOL)conformsToUTType:(id)a3
{
  return 0;
}

- (BOOL)conformsToString:(id)a3
{
  return 0;
}

- (BOOL)conformsToTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[WFType conformsToType:](self, "conformsToType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)conformsToType:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end