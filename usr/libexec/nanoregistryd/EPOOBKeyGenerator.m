@interface EPOOBKeyGenerator
- (NSData)key;
- (void)clear;
- (void)setKey:(id)a3;
@end

@implementation EPOOBKeyGenerator

- (void)setKey:(id)a3
{
  v5 = (NSData *)a3;
  key = self->_key;
  if (key != v5 && ([(NSData *)key isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_key, a3);
    v7 = [(EPResource *)self ownerDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = sub_1000A3BC0();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        v11 = sub_1000A3BC0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [(EPResource *)self ownerDelegate];
          v13 = (objc_class *)objc_opt_class();
          v14 = NSStringFromClass(v13);
          uint64_t v15 = [(EPResource *)self ownerDelegate];
          v16 = (void *)v15;
          CFStringRef v17 = @"present";
          *(_DWORD *)v19 = 138412802;
          *(void *)&v19[4] = v14;
          if (!v5) {
            CFStringRef v17 = @"nil";
          }
          *(_WORD *)&v19[12] = 2048;
          *(void *)&v19[14] = v15;
          __int16 v20 = 2112;
          CFStringRef v21 = v17;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling generatorUpdatedKey: on %@[%p] with key %@", v19, 0x20u);
        }
      }
      v18 = [(EPResource *)self ownerDelegate];
      [v18 generatorUpdatedKey:self];
    }
  }
}

- (void)clear
{
  id v2 = [(EPResource *)self ownerDelegate];
  [v2 clear];
}

- (NSData)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end