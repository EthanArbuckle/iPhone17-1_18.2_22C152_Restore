@interface PLEnergyBucket
- (id)description;
- (signed)level;
- (void)setLevel:(signed __int16)a3;
@end

@implementation PLEnergyBucket

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"PLEnergyBucket (%d)", -[PLEnergyBucket level](self, "level"));
}

- (signed)level
{
  return self->_level;
}

- (void)setLevel:(signed __int16)a3
{
  self->_level = a3;
}

@end