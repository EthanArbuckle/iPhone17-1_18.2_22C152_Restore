@interface SiriCoreConnectionType
- (BOOL)canUseWiFiDirectly;
- (BOOL)isEdge;
- (BOOL)isWWAN;
- (SiriCoreConnectionType)initWithTechnology:(int64_t)a3;
- (id)description;
- (int64_t)diagnosticConnectionType;
- (int64_t)technology;
- (unint64_t)aggregatorConnectionType;
@end

@implementation SiriCoreConnectionType

- (unint64_t)aggregatorConnectionType
{
  int64_t technology = self->_technology;
  if ((unint64_t)(technology - 2000) < 0xF) {
    return 2;
  }
  switch(technology)
  {
    case 3000:
    case 3006:
      unint64_t result = 3;
      break;
    case 3001:
      unint64_t result = 4;
      break;
    case 3002:
      unint64_t result = 5;
      break;
    case 3003:
      unint64_t result = 6;
      break;
    case 3004:
      unint64_t result = 7;
      break;
    case 3005:
      unint64_t result = 8;
      break;
    default:
      unint64_t result = technology == 1000;
      break;
  }
  return result;
}

- (int64_t)diagnosticConnectionType
{
  if ([(SiriCoreConnectionType *)self isWWAN]) {
    return 2;
  }
  else {
    return [(SiriCoreConnectionType *)self technology] == 1000;
  }
}

- (BOOL)canUseWiFiDirectly
{
  int64_t technology = self->_technology;
  return (unint64_t)(technology - 2000) >= 0xF && technology != 3005 && technology != 3002;
}

- (BOOL)isEdge
{
  int64_t technology = self->_technology;
  BOOL result = 0;
  if ((unint64_t)(technology - 2000) >= 0xF
    && ((unint64_t)(technology - 3000) > 6 || ((1 << (technology + 72)) & 0x65) == 0)
    && technology != 1000
    && technology != 0)
  {
    return 1;
  }
  return result;
}

- (BOOL)isWWAN
{
  int64_t technology = self->_technology;
  BOOL result = 0;
  if ((unint64_t)(technology - 3000) >= 7 && technology != 1000 && technology != 0) {
    return 1;
  }
  return result;
}

- (int64_t)technology
{
  return self->_technology;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  v5 = SiriCoreConnectionTechnologyGetDescription(self->_technology);
  v6 = (void *)[v3 initWithFormat:@"<%p %@: technology=%@>", self, v4, v5];

  return v6;
}

- (SiriCoreConnectionType)initWithTechnology:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriCoreConnectionType;
  BOOL result = [(SiriCoreConnectionType *)&v5 init];
  if (result) {
    result->_int64_t technology = a3;
  }
  return result;
}

@end