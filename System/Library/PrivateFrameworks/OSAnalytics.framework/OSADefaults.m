@interface OSADefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (id)dictionaryRepresentation;
+ (id)objectForKey:(id)a3;
+ (void)removeObjectForKey:(id)a3;
+ (void)sendOperation:(unint64_t)a3 forKey:(id)a4 withBlock:(id)a5;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation OSADefaults

+ (BOOL)BOOLForKey:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__OSADefaults_BOOLForKey___block_invoke;
  v6[3] = &unk_1E5D1F988;
  v6[4] = &v7;
  +[OSADefaults sendOperation:0 forKey:v3 withBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __26__OSADefaults_BOOLForKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  BOOL result = xpc_dictionary_get_BOOL(xdict, "defaults_value");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__OSADefaults_setBool_forKey___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v5 = a3;
  +[OSADefaults sendOperation:1 forKey:a4 withBlock:v4];
}

void __30__OSADefaults_setBool_forKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__OSADefaults_objectForKey___block_invoke;
  v6[3] = &unk_1E5D1F988;
  v6[4] = &v7;
  +[OSADefaults sendOperation:2 forKey:v3 withBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __28__OSADefaults_objectForKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  id v3 = xpc_dictionary_get_value(xdict, "defaults_value");
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = xpc2ns(v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v7;
  }
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = ns2xpc(v5);
    v8 = v7;
    if (v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __32__OSADefaults_setObject_forKey___block_invoke;
      v9[3] = &unk_1E5D1F9D0;
      id v10 = v7;
      +[OSADefaults sendOperation:3 forKey:v6 withBlock:v9];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      +[OSADefaults setObject:forKey:]((uint64_t)v5);
    }
  }
  else
  {
    +[OSADefaults sendOperation:3 forKey:v6 withBlock:&__block_literal_global_1];
  }
}

void __32__OSADefaults_setObject_forKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

+ (void)removeObjectForKey:(id)a3
{
}

+ (id)dictionaryRepresentation
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__OSADefaults_dictionaryRepresentation__block_invoke;
  v4[3] = &unk_1E5D1F988;
  void v4[4] = &v5;
  +[OSADefaults sendOperation:4 forKey:0 withBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__OSADefaults_dictionaryRepresentation__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  id v3 = xpc_dictionary_get_value(xdict, "defaults_value");
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = xpc2ns(v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v7;
  }
}

+ (void)sendOperation:(unint64_t)a3 forKey:(id)a4 withBlock:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, xpc_object_t))a5;
  OSAnalyticsHelperServiceConnection();
  uint64_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "operation", 7uLL);
    xpc_dictionary_set_uint64(empty, "defaults_operation", a3);
    if (v7) {
      xpc_dictionary_set_string(empty, "defaults_key", (const char *)[v7 UTF8String]);
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v8[2](v8, empty);
    }
    else
    {
      xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(v9, empty);
      id v12 = v11;
      if (v11)
      {
        uint64_t v13 = MEMORY[0x1AD0D88F0](v11);
        if (v13 == MEMORY[0x1E4F145A8])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            +[OSADefaults sendOperation:forKey:withBlock:](v12);
          }
        }
        else if (v13 == MEMORY[0x1E4F14590])
        {
          v8[2](v8, v12);
        }
      }
    }
  }
}

+ (void)setObject:(uint64_t)a1 forKey:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to convert %@ to an XPC object", (uint8_t *)&v1, 0xCu);
}

+ (void)sendOperation:(void *)a1 forKey:withBlock:.cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E4F14530]);
  int v2 = 136315138;
  uint64_t v3 = string;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "osanalyticshelper replied with an XPC error: %s", (uint8_t *)&v2, 0xCu);
}

@end