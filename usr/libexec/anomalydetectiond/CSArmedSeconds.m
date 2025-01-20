@interface CSArmedSeconds
- (BOOL)isArmed;
- (CSArmedSeconds)init;
- (int)armedSeconds;
- (void)setArmedSeconds:(int)a3;
- (void)setIsArmed:(BOOL)a3;
@end

@implementation CSArmedSeconds

- (CSArmedSeconds)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSArmedSeconds;
  result = [(CSArmedSeconds *)&v3 init];
  if (result)
  {
    result->_armedSeconds = 0;
    result->_isArmed = 0;
  }
  return result;
}

- (int)armedSeconds
{
  return self->_armedSeconds;
}

- (void)setArmedSeconds:(int)a3
{
  self->_armedSeconds = a3;
}

- (BOOL)isArmed
{
  return self->_isArmed;
}

- (void)setIsArmed:(BOOL)a3
{
  self->_isArmed = a3;
}

@end