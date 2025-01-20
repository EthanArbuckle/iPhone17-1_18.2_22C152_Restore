@interface _UIBarAppearanceData
+ (id)decodeFromCoder:(id)a3 prefix:(id)a4;
- (BOOL)checkEqualTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)markReadOnly;
- (id)replicate;
- (id)writableInstance;
- (int64_t)hashInto:(int64_t)a3;
- (unint64_t)hash;
- (void)assertMutable:(SEL)a3;
@end

@implementation _UIBarAppearanceData

- (id)markReadOnly
{
  *((unsigned char *)self + 8) = 1;
  return self;
}

- (id)writableInstance
{
  if (self->_immutable)
  {
    v2 = [(_UIBarAppearanceData *)self replicate];
  }
  else
  {
    v2 = self;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIBarAppearanceData *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(_UIBarAppearanceData *)v4 isMemberOfClass:objc_opt_class()]
      && [(_UIBarAppearanceData *)self checkEqualTo:v5];

  return v6;
}

- (BOOL)checkEqualTo:(id)a3
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_immutable)
  {
    return self;
  }
  else
  {
    [(_UIBarAppearanceData *)self replicate];
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)replicate
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)assertMutable:(SEL)a3
{
  if (self->_immutable)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    NSStringFromSelector(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 raise:v5, @"Attempt to mutate immutable instance %@ (selector %@)", self, v6 format];
  }
}

- (unint64_t)hash
{
  return [(_UIBarAppearanceData *)self hashInto:0];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIBarAppearanceData;
  v3 = [(_UIBarAppearanceData *)&v7 description];
  v4 = (void *)[v3 mutableCopy];

  if (self->_immutable) {
    uint64_t v5 = @" ro";
  }
  else {
    uint64_t v5 = @" rw";
  }
  [v4 appendString:v5];
  [(_UIBarAppearanceData *)self describeInto:v4];
  return v4;
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  return 0;
}

- (int64_t)hashInto:(int64_t)a3
{
  return a3;
}

@end