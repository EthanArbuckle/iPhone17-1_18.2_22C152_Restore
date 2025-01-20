@interface TRINamespaceDescriptorProvider
+ (id)_descriptorFromDynamicNamespaceRecord:(id)a3;
+ (id)providerWithNamespaceDatabase:(id)a3 defaultDescriptorDirectoryPath:(id)a4;
- (TRINamespaceDescriptorProvider)initWithNamespaceDatabase:(id)a3 defaultDescriptorDirectoryPath:(id)a4;
- (id)_dynamicDescriptorsForContainer:(int)a3 teamId:(id)a4;
- (id)descriptorWithNamespaceName:(id)a3;
- (void)enumerateDefaultDescriptorsWithBlock:(id)a3;
@end

@implementation TRINamespaceDescriptorProvider

+ (id)providerWithNamespaceDatabase:(id)a3 defaultDescriptorDirectoryPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithNamespaceDatabase:v7 defaultDescriptorDirectoryPath:v6];

  return v8;
}

- (TRINamespaceDescriptorProvider)initWithNamespaceDatabase:(id)a3 defaultDescriptorDirectoryPath:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRINamespaceDescriptorProvider.m", 34, @"Invalid parameter not satisfying: %@", @"namespaceDatabase" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRINamespaceDescriptorProvider.m", 35, @"Invalid parameter not satisfying: %@", @"descriptorDirectory" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRINamespaceDescriptorProvider;
  v11 = [(TRINamespaceDescriptorProvider *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_namespaceDatabase, a3);
    objc_storeStrong((id *)&v12->_descriptorDirectory, a4);
  }

  return v12;
}

- (id)descriptorWithNamespaceName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB01A0] loadWithNamespaceName:v4 fromDirectory:self->_descriptorDirectory];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(TRINamespaceDatabase *)self->_namespaceDatabase dynamicNamespaceRecordWithNamespaceName:v4];
    if (v8)
    {
      id v7 = +[TRINamespaceDescriptorProvider _descriptorFromDynamicNamespaceRecord:v8];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (void)enumerateDefaultDescriptorsWithBlock:(id)a3
{
}

- (id)_dynamicDescriptorsForContainer:(int)a3 teamId:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  namespaceDatabase = self->_namespaceDatabase;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__TRINamespaceDescriptorProvider__dynamicDescriptorsForContainer_teamId___block_invoke;
  v13[3] = &unk_1E6BB8CF0;
  id v14 = v7;
  id v9 = v7;
  LODWORD(v4) = [(TRINamespaceDatabase *)namespaceDatabase enumerateDynamicNamespaceRecordsForContainer:v4 teamId:v6 block:v13];

  if (v4) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void __73__TRINamespaceDescriptorProvider__dynamicDescriptorsForContainer_teamId___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 appContainer];
  uint64_t v4 = [v3 fetchStatus];

  if (v4 != 2)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = +[TRINamespaceDescriptorProvider _descriptorFromDynamicNamespaceRecord:v7];
    [v5 addObject:v6];
  }
}

+ (id)_descriptorFromDynamicNamespaceRecord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = [v3 defaultsFileURL];
  [v4 setFactorsURL:v5];

  id v6 = [v3 appContainer];
  [v4 setAppContainer:v6];

  objc_msgSend(v4, "setCloudKitContainerId:", objc_msgSend(v3, "cloudKitContainer"));
  id v7 = objc_alloc(MEMORY[0x1E4FB01A0]);
  id v8 = [v3 name];
  uint64_t v9 = [v3 compatibilityVersion];

  v10 = (void *)[v7 initWithNamespaceName:v8 downloadNCV:v9 optionalParams:v4];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptorDirectory, 0);
  objc_storeStrong((id *)&self->_namespaceDatabase, 0);
}

@end