@interface TRIGloballyAvailableNamespaces
- (BOOL)setNamespaces:(id)a3;
- (TRIGloballyAvailableNamespaces)initWithKVStore:(id)a3;
- (id)namespaces;
@end

@implementation TRIGloballyAvailableNamespaces

- (TRIGloballyAvailableNamespaces)initWithKVStore:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIGloballyAvailableNamespaces.m", 21, @"Invalid parameter not satisfying: %@", @"kvStore" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIGloballyAvailableNamespaces;
  v7 = [(TRIGloballyAvailableNamespaces *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_kvStore, a3);
  }

  return v8;
}

- (BOOL)setNamespaces:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [a3 allObjects];
  id v10 = 0;
  id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:0 error:&v10];
  id v7 = v10;

  if (v6)
  {
    [(TRIKVStore *)self->_kvStore setBlob:v6 forKey:@"globally_available_namespaces" usingTransaction:0];
  }
  else
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Couldn't generate data for globally available namespace with error:%@", buf, 0xCu);
    }
  }
  return v6 != 0;
}

- (id)namespaces
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(TRIKVStore *)self->_kvStore blobForKey:@"globally_available_namespaces" usingTransaction:0];
  if ([v2 length])
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    v4 = (void *)MEMORY[0x1E016E7F0]();
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    id v15 = 0;
    v8 = [v3 unarchivedObjectOfClasses:v7 fromData:v2 error:&v15];
    id v9 = v15;

    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    }
    else
    {
      uint64_t v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v9;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to unarchive globally available namespaces with error: %@", buf, 0xCu);
      }

      uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v12 = (void *)v10;
  }
  else
  {
    objc_super v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_INFO, "No globally available namespaces found.", buf, 2u);
    }

    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end