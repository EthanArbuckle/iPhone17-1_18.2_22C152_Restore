@interface ML3VirtualTable
- (BOOL)registerWithConnection:(id)a3;
- (BOOL)unregister;
- (ML3DatabaseConnection)connection;
- (ML3DatabaseTable)databaseTable;
- (ML3VirtualTable)initWithDatabaseTable:(id)a3;
- (ML3VirtualTableDelegate)delegate;
- (NSString)name;
- (id).cxx_construct;
- (shared_ptr<ML3VirtualTableDataSource>)dataSource;
- (void)dealloc;
- (void)setDataSource:(shared_ptr<ML3VirtualTableDataSource>)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ML3VirtualTable

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_dataSource.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_databaseTable, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_module, 0);

  objc_storeStrong((id *)&self->_virtualTableName, 0);
}

- (ML3DatabaseConnection)connection
{
  return self->_connection;
}

- (ML3DatabaseTable)databaseTable
{
  return self->_databaseTable;
}

- (void)setDelegate:(id)a3
{
}

- (ML3VirtualTableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ML3VirtualTableDelegate *)WeakRetained;
}

- (void)setDataSource:(shared_ptr<ML3VirtualTableDataSource>)a3
{
  v4 = *(ML3VirtualTableDataSource **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_dataSource.__cntrl_;
  self->_dataSource.__ptr_ = v4;
  self->_dataSource.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<ML3VirtualTableDataSource>)dataSource
{
  cntrl = self->_dataSource.__cntrl_;
  *v2 = self->_dataSource.__ptr_;
  v2[1] = (ML3VirtualTableDataSource *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ML3VirtualTableDataSource *)self;
  return result;
}

- (BOOL)unregister
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection)
  {
    v4 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", self->_virtualTableName];
    id v12 = 0;
    LOBYTE(connection) = [(ML3DatabaseConnection *)connection executeUpdate:v4 withParameters:0 error:&v12];
    id v5 = v12;

    if ((connection & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v5;
        _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Could not unregister virtual table. %{public}@", buf, 0xCu);
      }
    }
    v7 = self->_connection;
    v8 = [(ML3DatabaseModule *)self->_module name];
    [(ML3DatabaseConnection *)v7 removeModuleNamed:v8];

    module = self->_module;
    self->_module = 0;

    v10 = self->_connection;
    self->_connection = 0;
  }
  return (char)connection;
}

- (BOOL)registerWithConnection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_connection = &self->_connection;
  if (self->_connection) {
    [(ML3VirtualTable *)self unregister];
  }
  objc_storeStrong((id *)&self->_connection, a3);
  v7 = [NSString stringWithFormat:@"%@_module_%u", self->_virtualTableName, arc4random()];
  v8 = [[ML3DatabaseModule alloc] initWithName:v7 moduleMethods:&__virtualTableSQLiteModule];
  module = self->_module;
  self->_module = v8;

  [(ML3DatabaseModule *)self->_module setContext:self];
  if ([(ML3DatabaseConnection *)self->_connection registerModule:self->_module])
  {
    v10 = [NSString stringWithFormat:@"CREATE VIRTUAL TABLE TEMP.%@ USING %@", self->_virtualTableName, v7];
    v11 = *p_connection;
    id v20 = 0;
    BOOL v12 = [(ML3DatabaseConnection *)v11 executeUpdate:v10 withParameters:0 error:&v20];
    id v13 = v20;
    if (v12)
    {
      BOOL v14 = 1;
    }
    else
    {
      v17 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *p_connection;
        *(_DWORD *)buf = 134218242;
        v22 = (ML3DatabaseModule *)v18;
        __int16 v23 = 2114;
        id v24 = v13;
        _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "Failed to create virtual table on connection %p. %{public}@", buf, 0x16u);
      }

      BOOL v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_module;
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Failed to register virtual table on connection. Could not register module %{public}@.", buf, 0xCu);
    }

    id v13 = 0;
    BOOL v14 = 0;
    v10 = self->_module;
    self->_module = 0;
  }

  return v14;
}

- (NSString)name
{
  return self->_virtualTableName;
}

- (void)dealloc
{
  [(ML3VirtualTable *)self unregister];
  v3.receiver = self;
  v3.super_class = (Class)ML3VirtualTable;
  [(ML3VirtualTable *)&v3 dealloc];
}

- (ML3VirtualTable)initWithDatabaseTable:(id)a3
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ML3VirtualTable;
  v7 = [(ML3VirtualTable *)&v14 init];
  if (v7)
  {
    if (!v6)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v7, @"ML3VirtualTable.mm", 72, @"Invalid parameter not satisfying: %@", @"databaseTable != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_databaseTable, a3);
    v8 = NSString;
    v9 = [(ML3DatabaseTable *)v7->_databaseTable name];
    uint64_t v10 = [v8 stringWithFormat:@"virtual_%@", v9];
    virtualTableName = v7->_virtualTableName;
    v7->_virtualTableName = (NSString *)v10;
  }
  return v7;
}

@end