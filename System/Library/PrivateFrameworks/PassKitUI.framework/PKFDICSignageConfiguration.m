@interface PKFDICSignageConfiguration
- (BOOL)displayingBankName;
- (PKFDICSignageConfiguration)initWithFeature:(unint64_t)a3 displayingBankName:(BOOL)a4;
- (unint64_t)feature;
@end

@implementation PKFDICSignageConfiguration

- (PKFDICSignageConfiguration)initWithFeature:(unint64_t)a3 displayingBankName:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKFDICSignageConfiguration;
  result = [(PKFDICSignageConfiguration *)&v7 init];
  if (result)
  {
    result->_feature = a3;
    result->_displayingBankName = a4;
  }
  return result;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (BOOL)displayingBankName
{
  return self->_displayingBankName;
}

@end