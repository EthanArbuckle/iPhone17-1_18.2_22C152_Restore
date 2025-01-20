@interface TRINamespaceFactorSubscriptionSettings
+ (id)keyForNamespaceSubscription:(id)a3;
+ (id)settingsWithKeyValueStore:(id)a3;
- (BOOL)setSubscriptionWithFactorNames:(id)a3 inNamespaceName:(id)a4 error:(id *)a5;
- (TRIKVStore)keyValueStore;
- (TRINamespaceFactorSubscriptionSettings)initWithKeyValueStore:(id)a3;
- (id)subscribedFactorsForNamespaceName:(id)a3;
- (void)setKeyValueStore:(id)a3;
@end

@implementation TRINamespaceFactorSubscriptionSettings

+ (id)settingsWithKeyValueStore:(id)a3
{
  id v3 = a3;
  v4 = [[TRINamespaceFactorSubscriptionSettings alloc] initWithKeyValueStore:v3];

  return v4;
}

+ (id)keyForNamespaceSubscription:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.triald.namespace.assetSubscription", a3];
}

- (TRINamespaceFactorSubscriptionSettings)initWithKeyValueStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceFactorSubscriptionSettings;
  v6 = [(TRINamespaceFactorSubscriptionSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyValueStore, a3);
  }

  return v7;
}

- (id)subscribedFactorsForNamespaceName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRINamespaceFactorSubscriptionSettings.m", 41, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  v6 = [(TRINamespaceFactorSubscriptionSettings *)self keyValueStore];
  v7 = +[TRINamespaceFactorSubscriptionSettings keyForNamespaceSubscription:v5];
  v8 = [v6 blobForKey:v7 usingTransaction:0];

  if (v8)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F28DC0];
    v10 = (void *)MEMORY[0x1E016E7F0]();
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    id v20 = 0;
    v14 = [v9 unarchivedObjectOfClasses:v13 fromData:v8 error:&v20];
    id v15 = v20;

    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v15;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Unable to unarchive subscription object. Return empty array instead. Error: %{public}@", buf, 0xCu);
      }

      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (BOOL)setSubscriptionWithFactorNames:(id)a3 inNamespaceName:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRINamespaceFactorSubscriptionSettings.m", 61, @"Invalid parameter not satisfying: %@", @"factorNames" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRINamespaceFactorSubscriptionSettings.m", 62, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  v13 = [v12 allObjects];

  id v24 = 0;
  v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:0 error:&v24];
  id v15 = v24;
  id v16 = TRILogCategory_Server();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v13 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138543618;
      id v26 = v18;
      __int16 v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Set subscription [%{public}@] in namespace '%{public}@'", buf, 0x16u);
    }
    v19 = [(TRINamespaceFactorSubscriptionSettings *)self keyValueStore];
    id v20 = +[TRINamespaceFactorSubscriptionSettings keyForNamespaceSubscription:v11];
    [v19 setBlob:v14 forKey:v20 usingTransaction:0];
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v15;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Unable to archive subscription object. Error: %{public}@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v15;
    }
  }

  return v14 != 0;
}

- (TRIKVStore)keyValueStore
{
  return self->_keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end