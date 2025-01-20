@interface CMStringProperty
- (CMStringProperty)initWithString:(id)a3;
- (id)cssStringForName:(id)a3;
- (id)value;
@end

@implementation CMStringProperty

- (CMStringProperty)initWithString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMStringProperty;
  v6 = [(CMStringProperty *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->wdValue, a3);
  }

  return v7;
}

- (id)cssStringForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 compare:0x26EC08758];
  v6 = NSString;
  if (v5)
  {
    v7 = [NSString stringWithFormat:@"%@:%@;", v4, self->wdValue];
  }
  else
  {
    v8 = [(NSString *)self->wdValue CM_stringByAddingCSSEscapes];
    v7 = [v6 stringWithFormat:@"font-family:\"%@\";", v8];
  }
  return v7;
}

- (id)value
{
  return self->wdValue;
}

- (void).cxx_destruct
{
}

@end