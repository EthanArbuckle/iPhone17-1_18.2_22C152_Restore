@interface REMSecondaryGroceryLocale
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutomatic;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (REMSecondaryGroceryLocale)initWithCoder:(id)a3;
- (REMSecondaryGroceryLocale)initWithLocale:(id)a3 isAutomatic:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSecondaryGroceryLocale

- (REMSecondaryGroceryLocale)initWithLocale:(id)a3 isAutomatic:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMSecondaryGroceryLocale;
  v8 = [(REMSecondaryGroceryLocale *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_isAutomatic = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [(REMSecondaryGroceryLocale *)self locale];
  uint64_t v6 = [v4 locale];
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  id v7 = (void *)v6;
  v8 = [(REMSecondaryGroceryLocale *)self locale];
  v9 = [v4 locale];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
LABEL_6:
    BOOL v12 = [(REMSecondaryGroceryLocale *)self isAutomatic];
    int v11 = v12 ^ [v4 isAutomatic] ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(REMSecondaryGroceryLocale *)self locale];
  uint64_t v6 = objc_msgSend(v4, "initWithLocale:isAutomatic:", v5, -[REMSecondaryGroceryLocale isAutomatic](self, "isAutomatic"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  locale = self->_locale;
  id v5 = a3;
  [v5 encodeObject:locale forKey:@"locale"];
  [v5 encodeBool:self->_isAutomatic forKey:@"isAutomatic"];
}

- (REMSecondaryGroceryLocale)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isAutomatic"];

  id v7 = [(REMSecondaryGroceryLocale *)self initWithLocale:v5 isAutomatic:v6];
  return v7;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (void).cxx_destruct
{
}

@end