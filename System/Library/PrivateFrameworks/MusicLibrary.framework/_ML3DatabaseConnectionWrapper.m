@interface _ML3DatabaseConnectionWrapper
- (ML3DatabaseConnection)connection;
- (NSThread)borrowingThread;
- (NSThread)owningThread;
- (_ML3DatabaseConnectionWrapper)initWithConnection:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)useCount;
- (void)setBorrowingThread:(id)a3;
- (void)setConnection:(id)a3;
- (void)setOwningThread:(id)a3;
- (void)setUseCount:(unint64_t)a3;
@end

@implementation _ML3DatabaseConnectionWrapper

- (unint64_t)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unint64_t)a3
{
  self->_useCount = a3;
}

- (NSThread)owningThread
{
  return self->_owningThread;
}

- (ML3DatabaseConnection)connection
{
  return self->_connection;
}

- (void)setOwningThread:(id)a3
{
}

- (_ML3DatabaseConnectionWrapper)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ML3DatabaseConnectionWrapper;
  v6 = [(_ML3DatabaseConnectionWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    owningThread = v7->_owningThread;
    v7->_owningThread = 0;

    v7->_useCount = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowingThread, 0);
  objc_storeStrong((id *)&self->_owningThread, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setBorrowingThread:(id)a3
{
}

- (NSThread)borrowingThread
{
  return self->_borrowingThread;
}

- (void)setConnection:(id)a3
{
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t useCount = self->_useCount;
  owningThread = self->_owningThread;
  v8 = [(ML3DatabaseConnection *)self->_connection debugDescription];
  v9 = [v3 stringWithFormat:@"<%@ %p use = %lld, thread = %@, conn = %p>", v5, self, useCount, owningThread, v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p use = %lld, thread = %@, conn = %p>", v5, self, self->_useCount, self->_owningThread, self->_connection];

  return v6;
}

@end