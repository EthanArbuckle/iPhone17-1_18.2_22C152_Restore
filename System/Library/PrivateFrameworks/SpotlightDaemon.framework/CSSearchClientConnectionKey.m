@interface CSSearchClientConnectionKey
+ (id)keyWithConnection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CSSearchClientConnectionKey)initWithConnection:(id)a3;
- (OS_xpc_object)connection;
- (unint64_t)hash;
@end

@implementation CSSearchClientConnectionKey

- (unint64_t)hash
{
  return xpc_hash(self->_connection);
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CSSearchClientConnectionKey *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CSSearchClientConnectionKey *)v4 connection];
      connection = self->_connection;
      if (v5 == connection)
      {
        BOOL v8 = 1;
      }
      else
      {
        v7 = [(CSSearchClientConnectionKey *)v4 connection];
        BOOL v8 = xpc_equal(connection, v7);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

+ (id)keyWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [[CSSearchClientConnectionKey alloc] initWithConnection:v3];

  return v4;
}

- (CSSearchClientConnectionKey)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchClientConnectionKey;
  v6 = [(CSSearchClientConnectionKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

@end