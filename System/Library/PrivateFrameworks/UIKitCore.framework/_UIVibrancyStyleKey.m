@interface _UIVibrancyStyleKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKey:(id)a3;
- (_UIVibrancyStyleKey)initWithRecipe:(id)a3 vibrancyStyle:(int64_t)a4 category:(id)a5;
- (unint64_t)hash;
@end

@implementation _UIVibrancyStyleKey

- (_UIVibrancyStyleKey)initWithRecipe:(id)a3 vibrancyStyle:(int64_t)a4 category:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIVibrancyStyleKey;
  v9 = [(_UIVibrancyStyleKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_materialRecipe, a3);
    v10->_vibrancyStyle = a4;
  }

  return v10;
}

- (unint64_t)hash
{
  return self->_vibrancyStyle ^ (int64_t)self->_materialRecipe;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIVibrancyStyleKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_UIVibrancyStyleKey *)self isEqualToKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  v4 = a3;
  BOOL v5 = v4 && self->_materialRecipe == (NSString *)v4[1] && self->_vibrancyStyle == v4[2];

  return v5;
}

@end