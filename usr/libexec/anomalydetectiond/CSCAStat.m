@interface CSCAStat
- (CSCAStat)init;
- (char)userAge;
- (signed)mcc1;
- (signed)mcc2;
- (signed)mnc1;
- (signed)mnc2;
- (unsigned)armedSec;
- (unsigned)armedSecMartyBicycle;
- (unsigned)armedSecMartyLocal;
- (unsigned)armedSecMartyRemote;
- (unsigned)sex;
- (void)setArmedSec:(unsigned __int16)a3;
- (void)setArmedSecMartyBicycle:(unsigned __int16)a3;
- (void)setArmedSecMartyLocal:(unsigned __int16)a3;
- (void)setArmedSecMartyRemote:(unsigned __int16)a3;
- (void)setMcc1:(signed __int16)a3;
- (void)setMcc2:(signed __int16)a3;
- (void)setMnc1:(signed __int16)a3;
- (void)setMnc2:(signed __int16)a3;
- (void)setSex:(unsigned __int8)a3;
- (void)setUserAge:(char)a3;
@end

@implementation CSCAStat

- (CSCAStat)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSCAStat;
  result = [(CSCAStat *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_userAge = 255;
    *(_OWORD *)&result->_mcc1 = xmmword_1003386A0;
  }
  return result;
}

- (char)userAge
{
  return self->_userAge;
}

- (void)setUserAge:(char)a3
{
  self->_userAge = a3;
}

- (unsigned)sex
{
  return self->_sex;
}

- (void)setSex:(unsigned __int8)a3
{
  self->_sex = a3;
}

- (signed)mcc1
{
  return self->_mcc1;
}

- (void)setMcc1:(signed __int16)a3
{
  self->_mcc1 = a3;
}

- (signed)mnc1
{
  return self->_mnc1;
}

- (void)setMnc1:(signed __int16)a3
{
  self->_mnc1 = a3;
}

- (signed)mcc2
{
  return self->_mcc2;
}

- (void)setMcc2:(signed __int16)a3
{
  self->_mcc2 = a3;
}

- (signed)mnc2
{
  return self->_mnc2;
}

- (void)setMnc2:(signed __int16)a3
{
  self->_mnc2 = a3;
}

- (unsigned)armedSec
{
  return self->_armedSec;
}

- (void)setArmedSec:(unsigned __int16)a3
{
  self->_armedSec = a3;
}

- (unsigned)armedSecMartyBicycle
{
  return self->_armedSecMartyBicycle;
}

- (void)setArmedSecMartyBicycle:(unsigned __int16)a3
{
  self->_armedSecMartyBicycle = a3;
}

- (unsigned)armedSecMartyLocal
{
  return self->_armedSecMartyLocal;
}

- (void)setArmedSecMartyLocal:(unsigned __int16)a3
{
  self->_armedSecMartyLocal = a3;
}

- (unsigned)armedSecMartyRemote
{
  return self->_armedSecMartyRemote;
}

- (void)setArmedSecMartyRemote:(unsigned __int16)a3
{
  self->_armedSecMartyRemote = a3;
}

@end