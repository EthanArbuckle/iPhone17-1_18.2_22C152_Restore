@interface MCNearbyKey
+ (unint64_t)maxNearbyKeysCountDefault;
- (MCNearbyKey)initWithCharacter:(unsigned __int16)a3 logLikelihood:(float)a4;
- (float)logLikelihood;
- (unsigned)character;
@end

@implementation MCNearbyKey

- (float)logLikelihood
{
  return self->_logLikelihood;
}

- (unsigned)character
{
  return self->_character;
}

- (MCNearbyKey)initWithCharacter:(unsigned __int16)a3 logLikelihood:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MCNearbyKey;
  result = [(MCNearbyKey *)&v7 init];
  if (result)
  {
    result->_character = a3;
    result->_logLikelihood = a4;
  }
  return result;
}

+ (unint64_t)maxNearbyKeysCountDefault
{
  return 10;
}

@end