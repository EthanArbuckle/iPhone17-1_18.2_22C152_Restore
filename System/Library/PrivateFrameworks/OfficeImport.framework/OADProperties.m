@interface OADProperties
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMerged;
- (BOOL)isMergedPropertyForSelector:(SEL)a3;
- (BOOL)isMergedWithParent;
- (OADProperties)init;
- (OADProperties)initWithDefaults;
- (id)description;
- (id)overrideForSelector:(SEL)a3;
- (id)overrideForSelector:(SEL)a3 mustExist:(BOOL)a4;
- (id)parent;
- (id)possiblyInexistentOverrideForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)changeParentPreservingEffectiveValues:(id)a3;
- (void)flatten;
- (void)setMerged:(BOOL)a3;
- (void)setMergedWithParent:(BOOL)a3;
- (void)setParent:(id)a3;
@end

@implementation OADProperties

- (OADProperties)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)OADProperties;
  result = [(OADProperties *)&v3 init];
  if (result) {
    *((unsigned char *)result + 16) |= 3u;
  }
  return result;
}

- (OADProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADProperties;
  v2 = [(OADProperties *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    *((unsigned char *)v2 + 16) |= 3u;
    v4 = [(id)objc_opt_class() defaultProperties];
    [(OADProperties *)v3 setParent:v4];
  }
  return v3;
}

- (void)setParent:(id)a3
{
  v7 = (OADProperties *)a3;
  v5 = [(OADProperties *)v7 parent];
  if (v5)
  {
    do
    {
      uint64_t v6 = [v5 parent];

      v5 = (void *)v6;
    }
    while (v6);
  }
  if (v7 != self) {
    objc_storeStrong((id *)&self->mParent, a3);
  }
}

- (id)parent
{
  return self->mParent;
}

- (id)overrideForSelector:(SEL)a3
{
  return [(OADProperties *)self overrideForSelector:a3 mustExist:1];
}

- (BOOL)isMerged
{
  return *((unsigned char *)self + 16) & 1;
}

- (BOOL)isMergedWithParent
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setMerged:(BOOL)a3
{
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFE | a3;
}

- (void)setMergedWithParent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v3;
}

- (BOOL)isMergedPropertyForSelector:(SEL)a3
{
  mParent = self->mParent;
  if (!mParent || (*((unsigned char *)self + 16) & 2) == 0 || (*((unsigned char *)mParent + 16) & 1) == 0) {
    return 0;
  }
  v7 = (uint64_t (*)(OADProperties *, SEL))-[OADProperties methodForSelector:](mParent, "methodForSelector:");
  v8 = self->mParent;
  return v7(v8, a3);
}

+ (id)defaultProperties
{
  return 0;
}

- (unint64_t)hash
{
  return [(OADProperties *)self->mParent hash] ^ *((unsigned char *)self + 16) & 1 ^ ((unint64_t)*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (id)overrideForSelector:(SEL)a3 mustExist:(BOOL)a4
{
  uint64_t v6 = self;
  while (1)
  {
    char v7 = *((unsigned char *)v6 + 16);
    *((unsigned char *)v6 + 16) = v7 & 0xFD;
    char v8 = ((uint64_t (*)(OADProperties *, SEL))[(OADProperties *)v6 methodForSelector:a3])(v6, a3);
    *((unsigned char *)v6 + 16) = *((unsigned char *)v6 + 16) & 0xFD | v7 & 2;
    if (v8) {
      break;
    }
    mParent = v6->mParent;
    if (!mParent && a4) {
      break;
    }
    v10 = mParent;

    uint64_t v6 = v10;
    if (!mParent)
    {
      uint64_t v6 = 0;
      break;
    }
  }
  return v6;
}

- (id)possiblyInexistentOverrideForSelector:(SEL)a3
{
  return [(OADProperties *)self overrideForSelector:a3 mustExist:0];
}

- (void)changeParentPreservingEffectiveValues:(id)a3
{
  id v5 = a3;
  [(OADProperties *)self setMergedWithParent:0];
  [(OADProperties *)self fixPropertiesForChangingParentPreservingEffectiveValues:v5];
  id v4 = [(OADProperties *)self parent];

  if (v4 != v5) {
    [(OADProperties *)self setParent:v5];
  }
}

- (void)flatten
{
  [(OADProperties *)self setMergedWithParent:1];
  [(OADProperties *)self setMerged:1];
  mParent = self->mParent;
  [(OADProperties *)mParent flatten];
}

- (BOOL)isAnythingOverridden
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    char v7 = [v6 parent];
    char v8 = (v7 == 0) ^ (self->mParent != 0);

    if (v8)
    {
      v9 = [v6 parent];
      if (!v9
        || ([v6 parent],
            v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 isEqual:self->mParent],
            v10,
            v9,
            (v11 & 1) != 0))
      {
        if ([v6 isMerged] != ((*((unsigned char *)self + 16) & 1) == 0)) {
          [v6 isMergedWithParent];
        }
      }
    }
  }
  return isKindOfClass & 1;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADProperties;
  v2 = [(OADProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end