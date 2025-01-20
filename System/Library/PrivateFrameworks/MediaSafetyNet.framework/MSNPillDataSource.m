@interface MSNPillDataSource
- (MSNPillDataSource)initWithConnection:(id)a3 identifiers:(id)a4;
- (NSSet)identifiers;
- (NSXPCConnection)connection;
- (void)setConnection:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation MSNPillDataSource

- (MSNPillDataSource)initWithConnection:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSNPillDataSource;
  v8 = [(MSNPillDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_identifiers, a4);
  }

  return v9;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end