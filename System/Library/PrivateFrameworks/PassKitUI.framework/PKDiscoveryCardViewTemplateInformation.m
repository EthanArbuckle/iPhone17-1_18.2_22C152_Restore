@interface PKDiscoveryCardViewTemplateInformation
- (PKDiscoveryCardViewTemplateInformation)initWithCardSize:(int64_t)a3 displayType:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cardSize;
- (int64_t)displayType;
- (void)setCardSize:(int64_t)a3;
- (void)setDisplayType:(int64_t)a3;
- (void)updateCardSize:(int64_t)a3;
@end

@implementation PKDiscoveryCardViewTemplateInformation

- (PKDiscoveryCardViewTemplateInformation)initWithCardSize:(int64_t)a3 displayType:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoveryCardViewTemplateInformation;
  result = [(PKDiscoveryCardViewTemplateInformation *)&v7 init];
  if (result)
  {
    result->_cardSize = a3;
    result->_displayType = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t cardSize = self->_cardSize;
  int64_t displayType = self->_displayType;

  return (id)[v4 initWithCardSize:cardSize displayType:displayType];
}

- (void)updateCardSize:(int64_t)a3
{
  if (self->_cardSize != a3) {
    self->_int64_t cardSize = a3;
  }
}

- (void)setDisplayType:(int64_t)a3
{
  self->_int64_t displayType = a3;
}

- (int64_t)cardSize
{
  return self->_cardSize;
}

- (void)setCardSize:(int64_t)a3
{
  self->_int64_t cardSize = a3;
}

- (int64_t)displayType
{
  return self->_displayType;
}

@end