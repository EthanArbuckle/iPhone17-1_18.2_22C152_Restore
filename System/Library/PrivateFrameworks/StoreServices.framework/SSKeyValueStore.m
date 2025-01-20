@interface SSKeyValueStore
+ (BOOL)isLocalReadable;
- (BOOL)isLocalReadable;
- (BOOL)isLocalWritable;
- (SSKeyValueStore)init;
- (id)accountDictionaries;
- (id)copyAccounts;
- (id)iTunesValueForKey:(id)a3 usedDomain:(id *)a4;
- (void)_loadDatabaseIfNecessary;
- (void)dealloc;
- (void)getValueForDomain:(id)a3 key:(id)a4 usingBlock:(id)a5;
- (void)getValuesForDomain:(id)a3 keys:(const void *)a4 count:(unint64_t)a5 usingBlock:(id)a6;
- (void)modifyUsingTransactionBlock:(id)a3;
- (void)readUsingSessionBlock:(id)a3;
- (void)removeAccountFromDomain:(id)a3;
- (void)removeAllValuesForDomain:(id)a3;
- (void)removeAllValuesForDomain:(id)a3 completionBlock:(id)a4;
- (void)removeAllValuesWithCompletionBlock:(id)a3;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5 completionBlock:(id)a6;
- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4;
- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4 completionBlock:(id)a5;
@end

@implementation SSKeyValueStore

- (SSKeyValueStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSKeyValueStore;
  v2 = [(SSKeyValueStore *)&v4 init];
  if (v2)
  {
    if (SSIsDaemon())
    {
      *(_WORD *)&v2->_useLocalRead = 257;
    }
    else
    {
      v2->_connection = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
      v2->_useLocalRead = [(id)objc_opt_class() isLocalReadable];
    }
  }
  return v2;
}

+ (BOOL)isLocalReadable
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.Preferences"))return 0; {
  id v3 = +[SSKeyValueStoreSchema databasePath];
  }
  return SSFileIsLocalReadable(v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSKeyValueStore;
  [(SSKeyValueStore *)&v3 dealloc];
}

- (void)getValueForDomain:(id)a3 key:(id)a4 usingBlock:(id)a5
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalRead)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3052000000;
    v19 = __Block_byref_object_copy__49;
    v20 = __Block_byref_object_dispose__49;
    uint64_t v21 = 0;
    database = self->_database;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke;
    v15[3] = &unk_1E5BAC970;
    v15[5] = a4;
    v15[6] = &v16;
    v15[4] = a3;
    [(SSKeyValueStoreDatabase *)database readUsingSessionBlock:v15];
    if (a5) {
      (*((void (**)(id, uint64_t))a5 + 2))(a5, v17[5]);
    }
    id v10 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    if (v11)
    {
      v12 = v11;
      void *v11 = [a4 copy];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke_2;
      v14[3] = &unk_1E5BAC998;
      v14[4] = a5;
      v14[5] = v12;
      [(SSKeyValueStore *)self getValuesForDomain:a3 keys:v12 count:1 usingBlock:v14];
    }
    else
    {
      v13 = (void (*)(id, void))*((void *)a5 + 2);
      v13(a5, 0);
    }
  }
}

uint64_t __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 copyValueForDomain:a1[4] key:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

void __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *a2);
  }

  objc_super v4 = *(void **)(a1 + 40);
  free(v4);
}

- (void)getValuesForDomain:(id)a3 keys:(const void *)a4 count:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalRead)
  {
    if (a5)
    {
      v11 = (id *)malloc_type_calloc(a5, 8uLL, 0x80040B8603338uLL);
      if (v11)
      {
        database = self->_database;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke;
        v38[3] = &unk_1E5BAC9C0;
        v38[4] = a3;
        v38[5] = a5;
        v38[6] = v11;
        v38[7] = a4;
        [(SSKeyValueStoreDatabase *)database readUsingSessionBlock:v38];
        uint64_t v13 = 0;
        do
          id v14 = v11[v13++];
        while (a5 != v13);
        char v15 = 0;
        if (!a6) {
          goto LABEL_28;
        }
LABEL_27:
        (*((void (**)(id, id *))a6 + 2))(a6, v11);
LABEL_28:
        if ((v15 & 1) == 0) {
          free(v11);
        }
        return;
      }
    }
    else
    {
      v11 = 0;
    }
    char v15 = 1;
    if (!a6) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v16 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig];
    }
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    if (os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v19 = v18;
    }
    else {
      int v19 = v18 & 2;
    }
    if (v19)
    {
      int v39 = 136446210;
      v40 = "-[SSKeyValueStore getValuesForDomain:keys:count:usingBlock:]";
      LODWORD(v36) = 12;
      uint64_t v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v39, v36);
        free(v21);
        SSFileLog(v16, @"%@", v23, v24, v25, v26, v27, v28, v22);
      }
    }
  }
  xpc_object_t v29 = SSXPCCreateMessageDictionary(92);
  SSXPCDictionarySetCFObject(v29, "1", (__CFString *)a3);
  xpc_object_t v30 = xpc_array_create(0, 0);
  if (a5)
  {
    v31 = a4;
    unint64_t v32 = a5;
    do
    {
      v33 = (__CFString *)*v31++;
      SSXPCArraySetCFObject(v30, 0xFFFFFFFFFFFFFFFFLL, v33);
      --v32;
    }
    while (v32);
  }
  xpc_dictionary_set_value(v29, "2", v30);
  xpc_release(v30);
  v34 = self;
  connection = self->_connection;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke_11;
  v37[3] = &unk_1E5BAC9E8;
  v37[6] = a5;
  v37[7] = a4;
  v37[4] = self;
  v37[5] = a6;
  [(SSXPCConnection *)connection sendMessage:v29 withReply:v37];
  xpc_release(v29);
}

uint64_t __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke(uint64_t result, void *a2)
{
  if (*(void *)(result + 40))
  {
    uint64_t v3 = (void *)result;
    unint64_t v4 = 0;
    do
    {
      uint64_t result = [a2 copyValueForDomain:v3[4] key:*(void *)(v3[7] + 8 * v4)];
      *(void *)(v3[6] + 8 * v4++) = result;
    }
    while (v4 < v3[5]);
  }
  return result;
}

void __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke_11(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  if (!v3) {
    goto LABEL_12;
  }
  if (!a1[6])
  {
LABEL_11:
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    goto LABEL_12;
  }
  v5 = malloc_type_calloc(a1[6], 8uLL, 0x80040B8603338uLL);
  if (!v5)
  {
    uint64_t v3 = a1[5];
    goto LABEL_11;
  }
  v6 = v5;
  objc_opt_class();
  CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a2, "0");
  if (a1[6])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(__CFArray *)v7 objectForKey:*(void *)(a1[7] + 8 * v8)];
      if (v9) {
        uint64_t v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:0];
      }
      v6[v8++] = v9;
    }
    while (v8 < a1[6]);
  }

  (*(void (**)(void))(a1[5] + 16))();
  free(v6);
LABEL_12:
  id v10 = (void *)a1[4];
}

- (void)removeAllValuesForDomain:(id)a3
{
}

- (void)removeAllValuesForDomain:(id)a3 completionBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalWrite)
  {
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = &v26;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    database = self->_database;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke;
    v25[3] = &unk_1E5BACA10;
    v25[4] = a3;
    v25[5] = &v26;
    [(SSKeyValueStoreDatabase *)database modifyUsingTransactionBlock:v25];
    if (a4) {
      (*((void (**)(id, void))a4 + 2))(a4, *(unsigned __int8 *)(*((void *)&v26 + 1) + 24));
    }
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      id v8 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v8) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      if (os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_FAULT)) {
        int v11 = v10;
      }
      else {
        int v11 = v10 & 2;
      }
      if (v11)
      {
        LODWORD(v26) = 136446210;
        *(void *)((char *)&v26 + 4) = "-[SSKeyValueStore removeAllValuesForDomain:completionBlock:]";
        LODWORD(v23) = 12;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v26, v23);
          free(v13);
          SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, v14);
        }
      }
    }
    xpc_object_t v21 = SSXPCCreateMessageDictionary(94);
    SSXPCDictionarySetCFObject(v21, "1", (__CFString *)a3);
    connection = self->_connection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke_19;
    v24[3] = &unk_1E5BA77D0;
    v24[4] = a4;
    [(SSXPCConnection *)connection sendMessage:v21 withReply:v24];
    xpc_release(v21);
  }
}

uint64_t __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(+[SSSQLiteEntity queryWithDatabase:predicate:](SSKeyValueStoreValueEntity, "queryWithDatabase:predicate:", objc_msgSend(a2, "database"), +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", @"domain", *(void *)(a1 + 32))), "deleteAllEntities");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke_19(uint64_t result, void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
      xpc_dictionary_get_BOOL(a2, "0");
    }
    unint64_t v4 = *(uint64_t (**)(void))(*(void *)(v3 + 32) + 16);
    return v4();
  }
  return result;
}

- (void)removeAllValuesWithCompletionBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalWrite)
  {
    *(void *)&long long v24 = 0;
    *((void *)&v24 + 1) = &v24;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    database = self->_database;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke;
    v23[3] = &unk_1E5BACA38;
    v23[4] = &v24;
    [(SSKeyValueStoreDatabase *)database modifyUsingTransactionBlock:v23];
    if (a3) {
      (*((void (**)(id, void))a3 + 2))(a3, *(unsigned __int8 *)(*((void *)&v24 + 1) + 24));
    }
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v9 = v8;
      }
      else {
        int v9 = v8 & 2;
      }
      if (v9)
      {
        LODWORD(v24) = 136446210;
        *(void *)((char *)&v24 + 4) = "-[SSKeyValueStore removeAllValuesWithCompletionBlock:]";
        LODWORD(v21) = 12;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          int v11 = (void *)v10;
          uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v24, v21);
          free(v11);
          SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    xpc_object_t v19 = SSXPCCreateMessageDictionary(95);
    connection = self->_connection;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke_23;
    v22[3] = &unk_1E5BA77D0;
    v22[4] = a3;
    [(SSXPCConnection *)connection sendMessage:v19 withReply:v22];
    xpc_release(v19);
  }
}

uint64_t __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend(a2, "database"), "executeSQL:", @"DELETE FROM kvs_value;");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke_23(uint64_t result, void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
      xpc_dictionary_get_BOOL(a2, "0");
    }
    unint64_t v4 = *(uint64_t (**)(void))(*(void *)(v3 + 32) + 16);
    return v4();
  }
  return result;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5 completionBlock:(id)a6
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalWrite)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    database = self->_database;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__SSKeyValueStore_setValue_forDomain_key_completionBlock___block_invoke;
    v14[3] = &unk_1E5BACA60;
    v14[4] = a3;
    v14[5] = a4;
    void v14[6] = a5;
    v14[7] = &v15;
    [(SSKeyValueStoreDatabase *)database modifyUsingTransactionBlock:v14];
    if (a6) {
      (*((void (**)(id, void))a6 + 2))(a6, *((unsigned __int8 *)v16 + 24));
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    if (!a3) {
      a3 = (id)[MEMORY[0x1E4F1CA98] null];
    }
    id v13 = (id)objc_msgSend(v12, "initWithObjectsAndKeys:", a3, a5, 0);
    [(SSKeyValueStore *)self setValuesWithDictionary:v13 forDomain:a4 completionBlock:a6];
  }
}

uint64_t __58__SSKeyValueStore_setValue_forDomain_key_completionBlock___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [a2 setValue:a1[4] forDomain:a1[5] key:a1[6]];
  return *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
}

- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4
{
}

- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4 completionBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalWrite)
  {
    *(void *)&long long v30 = 0;
    *((void *)&v30 + 1) = &v30;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    database = self->_database;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke;
    v29[3] = &unk_1E5BACAB0;
    v29[5] = a4;
    v29[6] = &v30;
    v29[4] = a3;
    [(SSKeyValueStoreDatabase *)database modifyUsingTransactionBlock:v29];
    if (a5) {
      (*((void (**)(id, void))a5 + 2))(a5, *(unsigned __int8 *)(*((void *)&v30 + 1) + 24));
    }
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      id v10 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v13 = v12;
      }
      else {
        int v13 = v12 & 2;
      }
      if (v13)
      {
        LODWORD(v30) = 136446210;
        *(void *)((char *)&v30 + 4) = "-[SSKeyValueStore setValuesWithDictionary:forDomain:completionBlock:]";
        LODWORD(v26) = 12;
        uint64_t v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v30, v26);
          free(v15);
          SSFileLog(v10, @"%@", v17, v18, v19, v20, v21, v22, v16);
        }
      }
    }
    xpc_object_t v23 = SSXPCCreateMessageDictionary(93);
    SSXPCDictionarySetCFObject(v23, "1", (__CFString *)a4);
    xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_26;
    v28[3] = &unk_1E5BACAD8;
    v28[4] = v24;
    [a3 enumerateKeysAndObjectsUsingBlock:v28];
    xpc_dictionary_set_value(v23, "2", v24);
    xpc_release(v24);
    connection = self->_connection;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2_27;
    v27[3] = &unk_1E5BA77D0;
    v27[4] = a5;
    [(SSXPCConnection *)connection sendMessage:v23 withReply:v27];
    xpc_release(v23);
  }
}

uint64_t __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2;
  v7[3] = &unk_1E5BACA88;
  v7[4] = v4;
  v7[5] = a2;
  long long v8 = *(_OWORD *)(a1 + 40);
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = a1[4];
  id v6 = (void *)a1[5];
  if (v7 == a3) {
    a3 = 0;
  }
  uint64_t result = [v6 setValue:a3 forDomain:a1[6] key:a2];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24) ^ 1;
  return result;
}

void __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_26(uint64_t a1, void *a2, __CFString *a3)
{
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:0];
    if (!v6) {
      return;
    }
    a3 = (__CFString *)v6;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  long long v8 = (const char *)[a2 UTF8String];
  SSXPCDictionarySetCFObject(v7, v8, a3);
}

uint64_t __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2_27(uint64_t result, void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590]) {
      xpc_dictionary_get_BOOL(a2, "0");
    }
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v3 + 32) + 16);
    return v4();
  }
  return result;
}

- (id)accountDictionaries
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SSKeyValueStore_accountDictionaries__block_invoke;
  v6[3] = &unk_1E5BACB00;
  v6[4] = v3;
  [(SSKeyValueStoreDatabase *)database readUsingSessionBlock:v6];
  return v3;
}

void __38__SSKeyValueStore_accountDictionaries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 copyAccountDictionaryForDomain:@"com.apple.itunesstored"];
  if (v4)
  {
    v5 = (void *)v4;
    [*(id *)(a1 + 32) addObject:v4];
  }
  uint64_t v6 = (void *)[a2 copyAccountDictionaryForDomain:@"com.apple.mobile.iTunes.store"];
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 setObject:SSAccountSourceStringForSource(1) forKey:@"AccountSource"];
    [*(id *)(a1 + 32) addObject:v7];
  }
  uint64_t v8 = [a2 copyValueForDomain:@"com.apple.mobile.iTunes.store" key:@"KnownAccounts"];
  if (v8)
  {
    id v9 = (id)v8;
    [*(id *)(a1 + 32) addObjectsFromArray:v8];
  }
}

- (id)copyAccounts
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  database = self->_database;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SSKeyValueStore_copyAccounts__block_invoke;
  v6[3] = &unk_1E5BACB28;
  v6[4] = v3;
  void v6[5] = self;
  [(SSKeyValueStoreDatabase *)database readUsingSessionBlock:v6];
  return v3;
}

void __31__SSKeyValueStore_copyAccounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [a2 copyAccountDictionaryForDomain:@"com.apple.itunesstored"];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    [v5 addObject:v6];
  }
  uint64_t v8 = (void *)[a2 copyAccountDictionaryForDomain:@"com.apple.mobile.iTunes.store"];
  if (v8)
  {
    id v9 = v8;
    [v8 setObject:SSAccountSourceStringForSource(1) forKey:@"AccountSource"];
    [v5 addObject:v9];
  }
  v47 = a2;
  uint64_t v10 = [a2 copyValueForDomain:@"com.apple.mobile.iTunes.store" key:@"KnownAccounts"];
  if (v10)
  {
    int v11 = (void *)v10;
    [v5 addObjectsFromArray:v10];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v17 = objc_alloc_init(SSAccount);
        [(SSAccount *)v17 setLockdownDictionary:v16];
        uint64_t v18 = [(SSAccount *)v17 uniqueIdentifier];
        uint64_t v19 = [(SSAccount *)v17 accountName];
        if (v18) {
          BOOL v20 = v19 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20)
        {
          uint64_t v21 = v19;
          if (([*(id *)(a1 + 32) containsObject:v17] & 1) == 0)
          {
            [*(id *)(a1 + 32) addObject:v17];
            [v4 addObject:v21];
          }
        }
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v13);
  }
  uint64_t v46 = [v47 iTunesValueForKey:@"DSPersonID" usedDomain:0];
  uint64_t v45 = [v47 iTunesValueForKey:@"ActiveLockerAccountID" usedDomain:0];
  uint64_t v22 = [*(id *)(a1 + 32) count];
  if (v22 >= 1)
  {
    for (unint64_t j = v22 + 1; j > 1; --j)
    {
      xpc_object_t v24 = (void *)[*(id *)(a1 + 32) objectAtIndex:j - 2];
      uint64_t v25 = (void *)[v24 uniqueIdentifier];
      uint64_t v26 = [v25 isEqual:v46];
      uint64_t v27 = [v25 isEqual:v45];
      uint64_t v28 = [v24 accountName];
      if (v28 && [v4 countForObject:v28] >= 2)
      {
        int v29 = 0;
        if ([v24 accountScope]) {
          goto LABEL_26;
        }
      }
      else
      {
        int v29 = 1;
      }
      [v24 setActive:v26];
      [v24 setActiveLockerAccount:v27];
LABEL_26:
      if (((v26 | v27 | v29) & 1) == 0)
      {
        id v30 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v30) {
          id v30 = +[SSLogConfig sharedConfig];
        }
        int v31 = [v30 shouldLog];
        if ([v30 shouldLogToDisk]) {
          int v32 = v31 | 2;
        }
        else {
          int v32 = v31;
        }
        if (!os_log_type_enabled((os_log_t)[v30 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v32 &= 2u;
        }
        if (v32)
        {
          uint64_t v33 = objc_opt_class();
          int v52 = 138412802;
          uint64_t v53 = v33;
          __int16 v54 = 2112;
          v55 = v25;
          __int16 v56 = 2112;
          uint64_t v57 = v28;
          LODWORD(v44) = 32;
          v43 = &v52;
          uint64_t v34 = _os_log_send_and_compose_impl();
          if (v34)
          {
            v35 = (void *)v34;
            uint64_t v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v52, v44);
            free(v35);
            SSFileLog(v30, @"%@", v37, v38, v39, v40, v41, v42, v36);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", j - 2, v43);
      }
    }
  }
}

- (BOOL)isLocalReadable
{
  return self->_useLocalRead;
}

- (BOOL)isLocalWritable
{
  return self->_useLocalWrite;
}

- (id)iTunesValueForKey:(id)a3 usedDomain:(id *)a4
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__49;
  xpc_object_t v23 = __Block_byref_object_dispose__49;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__49;
  uint64_t v17 = __Block_byref_object_dispose__49;
  uint64_t v18 = 0;
  database = self->_database;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SSKeyValueStore_iTunesValueForKey_usedDomain___block_invoke;
  v12[3] = &unk_1E5BACB50;
  v12[4] = a3;
  v12[5] = &v19;
  v12[6] = &v13;
  [(SSKeyValueStoreDatabase *)database readUsingSessionBlock:v12];
  uint64_t v8 = v14;
  if (a4 && v20[5]) {
    *a4 = (id)v14[5];
  }
  id v9 = (id)v8[5];
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

id __48__SSKeyValueStore_iTunesValueForKey_usedDomain___block_invoke(void *a1, void *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = (id)[a2 iTunesValueForKey:a1[4] usedDomain:*(void *)(a1[6] + 8) + 40];
  id v3 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return v3;
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  database = self->_database;
  [(SSKeyValueStoreDatabase *)database modifyUsingTransactionBlock:a3];
}

- (void)readUsingSessionBlock:(id)a3
{
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  database = self->_database;
  [(SSKeyValueStoreDatabase *)database readUsingSessionBlock:a3];
}

- (void)removeAccountFromDomain:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(SSKeyValueStore *)self _loadDatabaseIfNecessary];
  if (self->_useLocalWrite)
  {
    database = self->_database;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __43__SSKeyValueStore_removeAccountFromDomain___block_invoke;
    v21[3] = &unk_1E5BACB78;
    v21[4] = a3;
    [(SSKeyValueStoreDatabase *)database modifyAsyncUsingTransactionBlock:v21];
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      id v6 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v6) {
        id v6 = +[SSLogConfig sharedConfig];
      }
      int v7 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v8 = v7 | 2;
      }
      else {
        int v8 = v7;
      }
      if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v9 = v8;
      }
      else {
        int v9 = v8 & 2;
      }
      if (v9)
      {
        int v22 = 136446210;
        xpc_object_t v23 = "-[SSKeyValueStore removeAccountFromDomain:]";
        LODWORD(v20) = 12;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          int v11 = (void *)v10;
          uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v20);
          free(v11);
          SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    xpc_object_t v19 = SSXPCCreateMessageDictionary(193);
    SSXPCDictionarySetCFObject(v19, "1", (__CFString *)a3);
    [(SSXPCConnection *)self->_connection sendMessage:v19];
    xpc_release(v19);
  }
}

uint64_t __43__SSKeyValueStore_removeAccountFromDomain___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)_loadDatabaseIfNecessary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_database) {
    return;
  }
  if (self->_useLocalWrite)
  {
    self->_database = objc_alloc_init(SSKeyValueStoreDatabase);
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (!v5) {
      goto LABEL_23;
    }
  }
  else
  {
    if (!self->_useLocalRead) {
      goto LABEL_23;
    }
    self->_database = (SSKeyValueStoreDatabase *)[[SSKeyValueStoreDatabase alloc] initReadOnly];
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (!v7) {
      goto LABEL_23;
    }
  }
  LODWORD(v19) = 138412290;
  *(void *)((char *)&v19 + 4) = objc_opt_class();
  LODWORD(v18) = 12;
  int v8 = (void *)_os_log_send_and_compose_impl();
  if (v8)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v19, v18, v19);
    free(v8);
    SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
  }
LABEL_23:
  BOOL useLocalRead = self->_useLocalRead;
  if (useLocalRead) {
    BOOL useLocalRead = self->_database != 0;
  }
  self->_BOOL useLocalRead = useLocalRead;
  BOOL useLocalWrite = self->_useLocalWrite;
  if (useLocalWrite) {
    BOOL useLocalWrite = self->_database != 0;
  }
  self->_BOOL useLocalWrite = useLocalWrite;
}

@end