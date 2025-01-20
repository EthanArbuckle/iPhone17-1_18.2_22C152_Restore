@interface REClockKitWrappedContentProvider
- (BOOL)isEqual:(id)a3;
- (CLKTextProvider)clockKitTextProvider;
- (REClockKitWrappedContentProvider)initWithClockKitTextProvider:(id)a3;
- (REClockKitWrappedContentProvider)initWithCoder:(id)a3;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REClockKitWrappedContentProvider

- (REClockKitWrappedContentProvider)initWithClockKitTextProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REClockKitWrappedContentProvider;
  v5 = [(REClockKitWrappedContentProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clockKitTextProvider = v5->_clockKitTextProvider;
    v5->_clockKitTextProvider = (CLKTextProvider *)v6;
  }
  return v5;
}

- (REClockKitWrappedContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REClockKitWrappedContentProvider;
  v5 = [(REClockKitWrappedContentProvider *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    uint64_t v6 = (void *)getCLKTextProviderClass_softClass;
    uint64_t v16 = getCLKTextProviderClass_softClass;
    if (!getCLKTextProviderClass_softClass)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getCLKTextProviderClass_block_invoke;
      v12[3] = &unk_2644BC768;
      v12[4] = &v13;
      __getCLKTextProviderClass_block_invoke((uint64_t)v12);
      uint64_t v6 = (void *)v14[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clockKitTextProvider"];
    clockKitTextProvider = v5->_clockKitTextProvider;
    v5->_clockKitTextProvider = (CLKTextProvider *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    clockKitTextProvider = self->_clockKitTextProvider;
    uint64_t v6 = [v4 clockKitTextProvider];
    if (clockKitTextProvider == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [(CLKTextProvider *)clockKitTextProvider isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(CLKTextProvider *)self->_clockKitTextProvider hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  clockKitTextProvider = self->_clockKitTextProvider;
  return (id)[v4 initWithClockKitTextProvider:clockKitTextProvider];
}

- (id)attributedStringRepresentation
{
  return (id)[(CLKTextProvider *)self->_clockKitTextProvider attributedString];
}

- (id)clockKitTextProviderRepresentation
{
  return self->_clockKitTextProvider;
}

- (CLKTextProvider)clockKitTextProvider
{
  return self->_clockKitTextProvider;
}

- (void).cxx_destruct
{
}

@end