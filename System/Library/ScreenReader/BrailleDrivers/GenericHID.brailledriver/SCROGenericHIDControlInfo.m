@interface SCROGenericHIDControlInfo
- (id)description;
- (int64_t)controlType;
- (unsigned)collectionUsage;
- (unsigned)cookie;
- (unsigned)finalRank;
- (unsigned)instanceNumber;
- (unsigned)usage;
- (unsigned)usagePage;
- (void)setCollectionUsage:(unsigned int)a3;
- (void)setControlType:(int64_t)a3;
- (void)setCookie:(unsigned int)a3;
- (void)setFinalRank:(unsigned int)a3;
- (void)setInstanceNumber:(unsigned int)a3;
- (void)setUsage:(unsigned int)a3;
- (void)setUsagePage:(unsigned int)a3;
@end

@implementation SCROGenericHIDControlInfo

- (id)description
{
  return +[NSString stringWithFormat:@"usage: %ld, usagePage: %ld, collection:%ld, instance:%ld, controlType:%ld, rank:%ld", [(SCROGenericHIDControlInfo *)self usage], [(SCROGenericHIDControlInfo *)self usagePage], [(SCROGenericHIDControlInfo *)self collectionUsage], [(SCROGenericHIDControlInfo *)self instanceNumber], [(SCROGenericHIDControlInfo *)self controlType], [(SCROGenericHIDControlInfo *)self finalRank]];
}

- (unsigned)collectionUsage
{
  return self->_collectionUsage;
}

- (void)setCollectionUsage:(unsigned int)a3
{
  self->_collectionUsage = a3;
}

- (unsigned)instanceNumber
{
  return self->_instanceNumber;
}

- (void)setInstanceNumber:(unsigned int)a3
{
  self->_instanceNumber = a3;
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned int)a3
{
  self->_usage = a3;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned int)a3
{
  self->_usagePage = a3;
}

- (unsigned)cookie
{
  return self->_cookie;
}

- (void)setCookie:(unsigned int)a3
{
  self->_cookie = a3;
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (void)setControlType:(int64_t)a3
{
  self->_controlType = a3;
}

- (unsigned)finalRank
{
  return self->_finalRank;
}

- (void)setFinalRank:(unsigned int)a3
{
  self->_finalRank = a3;
}

@end