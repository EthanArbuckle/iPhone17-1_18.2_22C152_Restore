@interface NRDeviceMiniStore
+ (BOOL)supportsSecureCoding;
- (NRDeviceMiniStore)initWithCoder:(id)a3;
- (NRDeviceMiniStore)initWithStore:(id)a3;
- (id)fullStore;
- (id)objectForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDeviceMiniStore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  store = self->_store;
  if (store) {
    [a3 encodeObject:store forKey:@"miniStoreValuesKey"];
  }
}

- (NRDeviceMiniStore)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NRDeviceMiniStore;
  v6 = [(NRDeviceMiniStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (NRDeviceMiniStore)initWithCoder:(id)a3
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NRDeviceMiniStore;
  id v5 = [(NRDeviceMiniStore *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
    v8 = [v6 setWithArray:v7];
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"miniStoreValuesKey"];

    if (v9)
    {
      objc_storeStrong((id *)&v5->_store, v9);
    }
    else
    {
      v10 = nr_framework_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        v12 = nr_framework_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "No store found, will not return a deviceStore", v14, 2u);
        }
      }
      id v5 = 0;
    }
  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_store)
  {
    id v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "No store found in ministore", (uint8_t *)&v13, 2u);
      }
    }
  }
  v8 = [(NSDictionary *)self->_store objectForKey:v4];
  if (!v8)
  {
    objc_super v9 = nr_framework_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      BOOL v11 = nr_framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_1A356E000, v11, OS_LOG_TYPE_DEFAULT, "No value found in ministore for key %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  return v8;
}

- (id)fullStore
{
  if (!self->_store)
  {
    v3 = nr_framework_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = nr_framework_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_1A356E000, v5, OS_LOG_TYPE_ERROR, "No store found in ministore", v8, 2u);
      }
    }
  }
  store = self->_store;

  return store;
}

- (void).cxx_destruct
{
}

@end