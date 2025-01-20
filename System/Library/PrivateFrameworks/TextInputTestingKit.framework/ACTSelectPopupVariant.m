@interface ACTSelectPopupVariant
- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4;
- (NSString)intendedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSelectPopupVariant

- (void).cxx_destruct
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"select popup: %@ ", self->_intendedKey];
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ACTSelectPopupVariant *)self intendedKey];
  [(ACTSelectPopupVariant *)self timestamp];
  id v8 = (id)objc_msgSend(v9, "_performVariantKey:timestamp:typingLog:", v7, v6);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTSelectPopupVariant *)self intendedKey];
  [(ACTSelectPopupVariant *)self timestamp];
  id v8 = [v3 stringWithFormat:@"<%@: intended=%@, t=%.2f>", v5, v6, v7];

  return v8;
}

- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTSelectPopupVariant;
  uint64_t v7 = [(ACTSelectPopupVariant *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    intendedKey = v7->_intendedKey;
    v7->_intendedKey = (NSString *)v8;

    v7->_timestamp = a4;
  }

  return v7;
}

@end