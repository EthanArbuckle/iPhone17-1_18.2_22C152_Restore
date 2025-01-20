@interface CSArmedClients
- (CSArmedClients)init;
- (int)enableMode;
- (int)kappaArmedSeconds;
- (int)martyArmedSecondsLocal;
- (int)martyArmedSecondsRemote;
- (void)setEnableMode:(int)a3;
- (void)setKappaArmedSeconds:(int)a3;
- (void)setMartyArmedSecondsLocal:(int)a3;
- (void)setMartyArmedSecondsRemote:(int)a3;
@end

@implementation CSArmedClients

- (CSArmedClients)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSArmedClients;
  result = [(CSArmedClients *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_kappaArmedSeconds = xmmword_1003386B0;
  }
  return result;
}

- (int)kappaArmedSeconds
{
  return self->_kappaArmedSeconds;
}

- (void)setKappaArmedSeconds:(int)a3
{
  self->_kappaArmedSeconds = a3;
}

- (int)martyArmedSecondsLocal
{
  return self->_martyArmedSecondsLocal;
}

- (void)setMartyArmedSecondsLocal:(int)a3
{
  self->_martyArmedSecondsLocal = a3;
}

- (int)martyArmedSecondsRemote
{
  return self->_martyArmedSecondsRemote;
}

- (void)setMartyArmedSecondsRemote:(int)a3
{
  self->_martyArmedSecondsRemote = a3;
}

- (int)enableMode
{
  return self->_enableMode;
}

- (void)setEnableMode:(int)a3
{
  self->_enableMode = a3;
}

@end