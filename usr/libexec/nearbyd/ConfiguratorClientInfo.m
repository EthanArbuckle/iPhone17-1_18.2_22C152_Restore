@interface ConfiguratorClientInfo
- (BOOL)acwgRangingLimitExceeded;
- (BOOL)carKeyRangingLimitExceeded;
- (BOOL)prewarmSecureElementChannel;
- (BOOL)prewarmUWB;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)passiveAccessIntent;
- (void)consumeInfoForAggregation:(id)a3;
- (void)setAcwgRangingLimitExceeded:(BOOL)a3;
- (void)setCarKeyRangingLimitExceeded:(BOOL)a3;
- (void)setPassiveAccessIntent:(unsigned int)a3;
- (void)setPrewarmSecureElementChannel:(BOOL)a3;
- (void)setPrewarmUWB:(BOOL)a3;
@end

@implementation ConfiguratorClientInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ConfiguratorClientInfo allocWithZone:a3] init];
  [(ConfiguratorClientInfo *)v4 setPrewarmUWB:self->_prewarmUWB];
  [(ConfiguratorClientInfo *)v4 setPrewarmSecureElementChannel:self->_prewarmSecureElementChannel];
  [(ConfiguratorClientInfo *)v4 setCarKeyRangingLimitExceeded:self->_carKeyRangingLimitExceeded];
  [(ConfiguratorClientInfo *)v4 setAcwgRangingLimitExceeded:self->_acwgRangingLimitExceeded];
  [(ConfiguratorClientInfo *)v4 setPassiveAccessIntent:self->_passiveAccessIntent];
  return v4;
}

- (void)consumeInfoForAggregation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v11 = v4;
  if (self->_prewarmUWB)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    unsigned __int8 v6 = [v4 prewarmUWB];
    v5 = v11;
  }
  self->_prewarmUWB = v6;
  if (self->_prewarmSecureElementChannel)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = [v5 prewarmSecureElementChannel];
    v5 = v11;
  }
  self->_prewarmSecureElementChannel = v7;
  if (self->_carKeyRangingLimitExceeded)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v8 = [v5 carKeyRangingLimitExceeded];
    v5 = v11;
  }
  self->_carKeyRangingLimitExceeded = v8;
  if (self->_acwgRangingLimitExceeded)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    unsigned __int8 v9 = [v5 acwgRangingLimitExceeded];
    v5 = v11;
  }
  self->_acwgRangingLimitExceeded = v9;
  unsigned int passiveAccessIntent = self->_passiveAccessIntent;
  self->_unsigned int passiveAccessIntent = [v5 passiveAccessIntent] | passiveAccessIntent;
}

- (id)description
{
  BOOL prewarmUWB = self->_prewarmUWB;
  BOOL prewarmSecureElementChannel = self->_prewarmSecureElementChannel;
  BOOL carKeyRangingLimitExceeded = self->_carKeyRangingLimitExceeded;
  BOOL acwgRangingLimitExceeded = self->_acwgRangingLimitExceeded;
  unsigned __int8 v6 = +[NIInternalUtils NISystemPassiveAccessIntentToString:self->_passiveAccessIntent];
  unsigned __int8 v7 = +[NSString stringWithFormat:@"[prewarm [UWB: %d, SE channel: %d], limits exceeded [CarKey: %d, ACWG: %d], passive access intent: %@]", prewarmUWB, prewarmSecureElementChannel, carKeyRangingLimitExceeded, acwgRangingLimitExceeded, v6];

  return v7;
}

- (BOOL)prewarmUWB
{
  return self->_prewarmUWB;
}

- (void)setPrewarmUWB:(BOOL)a3
{
  self->_BOOL prewarmUWB = a3;
}

- (BOOL)prewarmSecureElementChannel
{
  return self->_prewarmSecureElementChannel;
}

- (void)setPrewarmSecureElementChannel:(BOOL)a3
{
  self->_BOOL prewarmSecureElementChannel = a3;
}

- (BOOL)carKeyRangingLimitExceeded
{
  return self->_carKeyRangingLimitExceeded;
}

- (void)setCarKeyRangingLimitExceeded:(BOOL)a3
{
  self->_BOOL carKeyRangingLimitExceeded = a3;
}

- (BOOL)acwgRangingLimitExceeded
{
  return self->_acwgRangingLimitExceeded;
}

- (void)setAcwgRangingLimitExceeded:(BOOL)a3
{
  self->_BOOL acwgRangingLimitExceeded = a3;
}

- (unsigned)passiveAccessIntent
{
  return self->_passiveAccessIntent;
}

- (void)setPassiveAccessIntent:(unsigned int)a3
{
  self->_unsigned int passiveAccessIntent = a3;
}

@end