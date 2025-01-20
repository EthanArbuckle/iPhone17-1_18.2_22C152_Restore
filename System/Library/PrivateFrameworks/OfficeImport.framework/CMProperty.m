@interface CMProperty
- (CMProperty)initWithCssString:(id)a3;
- (id)cachedCssStringForName:(id)a3;
- (id)cssString;
- (id)cssStringForName:(id)a3;
- (int)compareValue:(id)a3;
@end

@implementation CMProperty

- (CMProperty)initWithCssString:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMProperty;
  v6 = [(CMProperty *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->cachedCssString, a3);
    v8 = v7;
  }

  return v7;
}

- (id)cssString
{
  return 0;
}

- (id)cachedCssStringForName:(id)a3
{
  id v4 = a3;
  cachedCssString = self->cachedCssString;
  if (cachedCssString)
  {
    v6 = [NSString stringWithFormat:@"%@%@;", v4, cachedCssString];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cssStringForName:(id)a3
{
  return 0;
}

- (int)compareValue:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end