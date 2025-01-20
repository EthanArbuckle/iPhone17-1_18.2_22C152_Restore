@interface BCBuyButtonConfiguration
- (BCBuyButtonConfiguration)init;
- (BOOL)enabled;
- (CGColor)backgroundColor;
- (NSString)buyString;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBuyString:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation BCBuyButtonConfiguration

- (BCBuyButtonConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCBuyButtonConfiguration;
  v2 = [(BCBuyButtonConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    buyString = v2->_buyString;
    v2->_buyString = (NSString *)&stru_2CE418;

    id v5 = +[UIColor clearColor];
    v3->_backgroundColor = CGColorRetain((CGColorRef)[v5 CGColor]);
  }
  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  self->_backgroundColor = CGColorRetain(a3);
}

- (NSString)buyString
{
  return self->_buyString;
}

- (void)setBuyString:(id)a3
{
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end