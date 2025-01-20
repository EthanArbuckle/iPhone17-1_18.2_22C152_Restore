@interface EDProtection
+ (EDProtection)protectionWithHidden:(BOOL)a3 locked:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProtection:(id)a3;
- (BOOL)isHidden;
- (BOOL)isLocked;
- (EDProtection)init;
- (EDProtection)initWithHidden:(BOOL)a3 locked:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation EDProtection

+ (EDProtection)protectionWithHidden:(BOOL)a3 locked:(BOOL)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHidden:a3 locked:a4];
  return (EDProtection *)v4;
}

- (EDProtection)initWithHidden:(BOOL)a3 locked:(BOOL)a4
{
  result = [(EDProtection *)self init];
  if (result)
  {
    result->mHidden = a3;
    result->mLocked = a4;
  }
  return result;
}

- (EDProtection)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDProtection;
  result = [(EDProtection *)&v3 init];
  if (result) {
    *(_WORD *)&result->mHidden = 256;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL mHidden = self->mHidden;
  BOOL mLocked = self->mLocked;
  return (id)[v4 initWithHidden:mHidden locked:mLocked];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDProtection *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDProtection *)self isEqualToProtection:v5];

  return v6;
}

- (BOOL)isEqualToProtection:(id)a3
{
  return self->mHidden == *((unsigned __int8 *)a3 + 8) && self->mLocked == *((unsigned __int8 *)a3 + 9);
}

- (unint64_t)hash
{
  uint64_t v2 = 256;
  if (!self->mHidden) {
    uint64_t v2 = 512;
  }
  uint64_t v3 = 1;
  if (!self->mLocked) {
    uint64_t v3 = 2;
  }
  return v3 | v2;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (BOOL)isLocked
{
  return self->mLocked;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDProtection;
  uint64_t v2 = [(EDProtection *)&v4 description];
  return v2;
}

@end