@interface PowerModesClient
- (NSSet)interestedModes;
- (NSString)identifer;
- (NSXPCConnection)connection;
- (PowerModesClient)initWithConnection:(id)a3 identifier:(id)a4 interestedModes:(id)a5;
- (void)setIdentifer:(id)a3;
- (void)setInterestedModes:(id)a3;
@end

@implementation PowerModesClient

- (PowerModesClient)initWithConnection:(id)a3 identifier:(id)a4 interestedModes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PowerModesClient;
  v12 = [(PowerModesClient *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_identifer, a4);
    objc_storeStrong((id *)&v13->_interestedModes, a5);
  }

  return v13;
}

- (NSString)identifer
{
  return self->_identifer;
}

- (void)setIdentifer:(id)a3
{
}

- (NSSet)interestedModes
{
  return self->_interestedModes;
}

- (void)setInterestedModes:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_interestedModes, 0);

  objc_storeStrong((id *)&self->_identifer, 0);
}

@end