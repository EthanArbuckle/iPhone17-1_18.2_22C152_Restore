@interface PKPassCachedWeatherInformation
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (PKPassCachedWeatherInformation)initWithWeatherInformation:(id)a3;
- (PKPassWeatherInformation)weatherInformation;
- (void)discardContentIfPossible;
- (void)endContentAccess;
@end

@implementation PKPassCachedWeatherInformation

- (PKPassCachedWeatherInformation)initWithWeatherInformation:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassCachedWeatherInformation;
    v6 = [(PKPassCachedWeatherInformation *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_weatherInformation, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  BOOL v2 = self->_weatherInformation != 0;
  self->_contentBeingAcccessed = v2;
  return v2;
}

- (void)discardContentIfPossible
{
  weatherInformation = self->_weatherInformation;
  self->_weatherInformation = 0;
}

- (void)endContentAccess
{
  self->_contentBeingAcccessed = 0;
}

- (BOOL)isContentDiscarded
{
  return self->_weatherInformation == 0;
}

- (PKPassWeatherInformation)weatherInformation
{
  return self->_weatherInformation;
}

- (void).cxx_destruct
{
}

@end