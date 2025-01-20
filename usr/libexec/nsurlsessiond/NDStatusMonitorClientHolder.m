@interface NDStatusMonitorClientHolder
- (BOOL)isEqual:(id)a3;
- (NDStatusMonitorClient)client;
- (NDStatusMonitorClientHolder)initWithClient:(id)a3 identifier:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)setClient:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
@end

@implementation NDStatusMonitorClientHolder

- (void).cxx_destruct
{
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setClient:(id)a3
{
}

- (NDStatusMonitorClient)client
{
  return self->_client;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_client == (NDStatusMonitorClient *)v4[1]
    && self->_identifier == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return self->_identifier ^ (unint64_t)self->_client;
}

- (NDStatusMonitorClientHolder)initWithClient:(id)a3 identifier:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NDStatusMonitorClientHolder;
  v8 = [(NDStatusMonitorClientHolder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_client, a3);
    v9->_identifier = a4;
  }

  return v9;
}

@end