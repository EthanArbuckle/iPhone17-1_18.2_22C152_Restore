@interface CPXIDSForwardingProxy
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCPXIDSproxy:(id)a3;
- (CPXIDSForwardingProxy)initWithServerPort:(unsigned __int16)a3 targetingPort:(unsigned __int16)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)serverPort;
- (unsigned)targetPort;
@end

@implementation CPXIDSForwardingProxy

- (unint64_t)hash
{
  uint64_t v3 = [(CPXIDSForwardingProxy *)self serverPort];
  return [(CPXIDSForwardingProxy *)self targetPort] | (unint64_t)(v3 << 16);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPXIDSForwardingProxy *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(CPXIDSForwardingProxy *)self isEqualToCPXIDSproxy:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToCPXIDSproxy:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CPXIDSForwardingProxy *)self serverPort];
  if (v5 == [v4 serverPort])
  {
    unsigned int v6 = [(CPXIDSForwardingProxy *)self targetPort];
    BOOL v7 = v6 == [v4 targetPort];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CPXIDSForwardingProxy)initWithServerPort:(unsigned __int16)a3 targetingPort:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CPXIDSForwardingProxy;
  result = [(CPXIDSForwardingProxy *)&v7 init];
  if (result)
  {
    result->_serverPort = a3;
    result->_targetPort = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CPXIDSForwardingProxy alloc];
  uint64_t v5 = [(CPXIDSForwardingProxy *)self serverPort];
  uint64_t v6 = [(CPXIDSForwardingProxy *)self targetPort];

  return [(CPXIDSForwardingProxy *)v4 initWithServerPort:v5 targetingPort:v6];
}

- (unsigned)serverPort
{
  return self->_serverPort;
}

- (unsigned)targetPort
{
  return self->_targetPort;
}

@end