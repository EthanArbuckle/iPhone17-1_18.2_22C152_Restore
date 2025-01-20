@interface ICAppearanceInfo
+ (id)appearanceInfoWithType:(unint64_t)a3;
+ (void)enumerateAppearanceTypesUsingBlock:(id)a3;
- (BOOL)isDark;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation ICAppearanceInfo

+ (id)appearanceInfoWithType:(unint64_t)a3
{
  v4 = objc_alloc_init(ICAppearanceInfo);
  [(ICAppearanceInfo *)v4 setType:a3];
  return v4;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isDark
{
  return [(ICAppearanceInfo *)self type] == 1;
}

- (id)description
{
  if ([(ICAppearanceInfo *)self type]) {
    v2 = @"ICAppearanceTypeDark";
  }
  else {
    v2 = @"ICAppearanceTypeDefault";
  }
  return v2;
}

+ (void)enumerateAppearanceTypesUsingBlock:(id)a3
{
  uint64_t v4 = 0;
  char v7 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v4, &v7);
    char v5 = v7;
    if (v7) {
      break;
    }
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    uint64_t v4 = [(ICAppearanceInfo *)self type];
    unint64_t result = ICHashWithHashKeys(v4, v5, v6, v7, v8, v9, v10, v11, 0);
  }
  self->_hash = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();

  if (v5)
  {
    unint64_t v6 = [(ICAppearanceInfo *)self type];
    BOOL v7 = v6 == [v5 type];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end