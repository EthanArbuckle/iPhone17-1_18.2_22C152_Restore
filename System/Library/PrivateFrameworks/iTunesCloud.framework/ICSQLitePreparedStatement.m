@interface ICSQLitePreparedStatement
- (ICSQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4;
- (NSString)SQL;
- (const)connectionPointer;
@end

@implementation ICSQLitePreparedStatement

- (void).cxx_destruct
{
}

- (NSString)SQL
{
  return self->_SQL;
}

- (const)connectionPointer
{
  return self->_connectionPointer;
}

- (ICSQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSQLitePreparedStatement;
  v7 = [(ICSQLitePreparedStatement *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_connectionPointer = a3;
    uint64_t v9 = [v6 copy];
    SQL = v8->_SQL;
    v8->_SQL = (NSString *)v9;
  }
  return v8;
}

@end