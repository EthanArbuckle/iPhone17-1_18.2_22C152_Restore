@interface _RWIDriverInterfaceInfo
- (BOOL)isActive;
- (NSSet)sessionIdentifiers;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (_RWIDriverInterfaceInfo)initWithConfiguration:(id)a3 connection:(id)a4;
- (_RWIRelayClientConnection)connection;
- (id)dictionaryRepresentation;
- (void)updateDriverState:(id)a3;
@end

@implementation _RWIDriverInterfaceInfo

- (_RWIDriverInterfaceInfo)initWithConfiguration:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_RWIDriverInterfaceInfo;
  v8 = [(_RWIDriverInterfaceInfo *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (RWIDriverConfiguration *)v9;

    objc_storeStrong((id *)&v8->_connection, a4);
    uint64_t v11 = +[RWIDriverState inactive];
    state = v8->_state;
    v8->_state = (RWIDriverState *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)identifier
{
  return [(RWIDriverConfiguration *)self->_configuration driverIdentifier];
}

- (NSString)name
{
  return [(RWIDriverConfiguration *)self->_configuration driverName];
}

- (NSString)version
{
  return [(RWIDriverConfiguration *)self->_configuration driverVersion];
}

- (BOOL)isActive
{
  return [(RWIDriverState *)self->_state isActive];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(RWIDriverConfiguration *)self->_configuration encodeToPayload:v3];
  [(RWIDriverState *)self->_state encodeToPayload:v3];
  return v3;
}

- (void)updateDriverState:(id)a3
{
  v5 = (RWIDriverState *)a3;
  state = self->_state;
  p_state = &self->_state;
  if (state != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_state, a3);
    v5 = v8;
  }
}

- (_RWIRelayClientConnection)connection
{
  return self->_connection;
}

- (NSSet)sessionIdentifiers
{
  return self->_sessionIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end