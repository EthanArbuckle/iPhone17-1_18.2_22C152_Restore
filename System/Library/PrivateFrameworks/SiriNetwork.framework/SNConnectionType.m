@interface SNConnectionType
- (BOOL)canUseWiFiDirectly;
- (BOOL)isEdge;
- (BOOL)isWWAN;
- (SNConnectionType)initWithTechnology:(int64_t)a3;
- (SNConnectionTypeInternal)underlyingConnectionType;
- (id)description;
- (id)technologyDescription;
- (int64_t)diagnosticConnectionType;
- (int64_t)technology;
- (unint64_t)aggregatorConnectionType;
- (void)setUnderlyingConnectionType:(id)a3;
@end

@implementation SNConnectionType

- (SNConnectionType)initWithTechnology:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SNConnectionType;
  v4 = [(SNConnectionType *)&v8 init];
  if (v4)
  {
    v5 = [[SNConnectionTypeInternal alloc] init:a3];
    underlyingConnectionType = v4->_underlyingConnectionType;
    v4->_underlyingConnectionType = v5;
  }
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  v5 = [(SNConnectionTypeInternal *)self->_underlyingConnectionType connectionTypeStringRawValue];
  v6 = (void *)[v3 initWithFormat:@"<%p %@: technology=%@>", self, v4, v5];

  return v6;
}

- (int64_t)technology
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType connectionTypeRawValue];
}

- (id)technologyDescription
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType connectionTypeStringRawValue];
}

- (BOOL)isWWAN
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType isWWAN];
}

- (BOOL)isEdge
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType isEdge];
}

- (BOOL)canUseWiFiDirectly
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType canUseWiFiDirectly];
}

- (int64_t)diagnosticConnectionType
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType diagnosticConnectionType];
}

- (unint64_t)aggregatorConnectionType
{
  return [(SNConnectionTypeInternal *)self->_underlyingConnectionType aggregatorConnectionType];
}

- (SNConnectionTypeInternal)underlyingConnectionType
{
  return self->_underlyingConnectionType;
}

- (void)setUnderlyingConnectionType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end