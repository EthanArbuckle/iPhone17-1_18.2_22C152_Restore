@interface _ML3DatabaseConnectionPoolDiagnostic
- (NSArray)readerAvailableConnections;
- (NSArray)readerBusyConnections;
- (NSArray)writerAvailableConnections;
- (NSArray)writerBusyConnections;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation _ML3DatabaseConnectionPoolDiagnostic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writerBusyConnections, 0);
  objc_storeStrong((id *)&self->_writerAvailableConnections, 0);
  objc_storeStrong((id *)&self->_readerBusyConnections, 0);

  objc_storeStrong((id *)&self->_readerAvailableConnections, 0);
}

- (NSArray)writerBusyConnections
{
  return self->_writerBusyConnections;
}

- (NSArray)writerAvailableConnections
{
  return self->_writerAvailableConnections;
}

- (NSArray)readerBusyConnections
{
  return self->_readerBusyConnections;
}

- (NSArray)readerAvailableConnections
{
  return self->_readerAvailableConnections;
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  v5 = objc_alloc_init(a4);
  uint64_t v6 = [(NSArray *)self->_readerAvailableConnections copy];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSArray *)self->_readerBusyConnections copy];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSArray *)self->_writerAvailableConnections copy];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSArray *)self->_writerBusyConnections copy];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(_ML3DatabaseConnectionPoolDiagnostic *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(_ML3DatabaseConnectionPoolDiagnostic *)self _copyWithZone:a3 usingConcreteClass:v5];
}

@end