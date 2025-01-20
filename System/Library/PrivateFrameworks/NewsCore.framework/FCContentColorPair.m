@interface FCContentColorPair
+ (id)colorPairWithDictionary:(id)a3;
- (FCColor)darkColor;
- (FCColor)lightColor;
- (FCContentColorPair)initWithLightColor:(id)a3 darkColor:(id)a4;
@end

@implementation FCContentColorPair

+ (id)colorPairWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = FCAppConfigurationStringValue(v3, @"light", 0);
  v5 = FCAppConfigurationStringValue(v3, @"dark", 0);

  v6 = +[FCColor nullableColorWithHexString:v4];
  uint64_t v7 = +[FCColor nullableColorWithHexString:v5];
  v8 = (void *)v7;
  v9 = 0;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    v9 = [[FCContentColorPair alloc] initWithLightColor:v6 darkColor:v7];
  }

  return v9;
}

- (FCContentColorPair)initWithLightColor:(id)a3 darkColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCContentColorPair;
  v8 = [(FCContentColorPair *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    lightColor = v8->_lightColor;
    v8->_lightColor = (FCColor *)v9;

    uint64_t v11 = [v7 copy];
    darkColor = v8->_darkColor;
    v8->_darkColor = (FCColor *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_lightColor, 0);
}

- (FCColor)lightColor
{
  return self->_lightColor;
}

- (FCColor)darkColor
{
  return self->_darkColor;
}

@end