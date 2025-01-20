@interface SSSoftwareLibraryItem
- (BOOL)isBeta;
- (BOOL)isLaunchProhibited;
- (BOOL)isPlaceholder;
- (BOOL)isProfileValidated;
- (BOOL)setETag:(id)a3 forAssetType:(id)a4 error:(id *)a5;
- (SSSoftwareLibraryItem)initWithXPCEncoding:(id)a3;
- (id)ETagForAssetType:(id)a3;
- (id)_initWithITunesMetadata:(id)a3;
- (id)copyXPCEncoding;
- (id)valueForProperty:(id)a3;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)setBeta:(BOOL)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setProfileValidated:(BOOL)a3;
@end

@implementation SSSoftwareLibraryItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareLibraryItem;
  [(SSSoftwareLibraryItem *)&v3 dealloc];
}

- (id)ETagForAssetType:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_etags objectForKey:a3];
  return v3;
}

- (BOOL)setETag:(id)a3 forAssetType:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v12 = v11;
    }
    else {
      int v12 = v11 & 2;
    }
    if (v12)
    {
      LODWORD(v39) = 136446210;
      *(void *)((char *)&v39 + 4) = "-[SSSoftwareLibraryItem setETag:forAssetType:error:]";
      LODWORD(v33) = 12;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v39, v33);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = &v39;
  uint64_t v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__46;
  v42 = __Block_byref_object_dispose__46;
  uint64_t v43 = 0;
  xpc_object_t v22 = SSXPCCreateMessageDictionary(90);
  v23 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v24 = a3;
  if (!a3) {
    id v24 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  -[__CFString setObject:forKey:](v23, "setObject:forKey:", v24, [NSString stringWithFormat:@"%@$$%@$$%@", @"com.apple.iTunesStore.downloadInfo", @"etags", a4]);
  SSXPCDictionarySetCFObject(v22, "1", (__CFString *)[(NSMutableDictionary *)self->_propertyValues objectForKey:@"bundle-id"]);
  SSXPCDictionarySetCFObject(v22, "2", v23);

  v25 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v26 = dispatch_semaphore_create(0);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __52__SSSoftwareLibraryItem_setETag_forAssetType_error___block_invoke;
  v34[3] = &unk_1E5BAC750;
  v34[6] = &v35;
  v34[4] = v26;
  v34[5] = &v39;
  [(SSXPCConnection *)v25 sendMessage:v22 withReply:v34];
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v26);

  xpc_release(v22);
  if (*((unsigned char *)v36 + 24))
  {
    etags = self->_etags;
    if (a3)
    {
      if (!etags)
      {
        etags = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        self->_etags = etags;
      }
      [(NSMutableDictionary *)etags setObject:a3 forKey:a4];
    }
    else
    {
      [(NSMutableDictionary *)etags removeObjectForKey:a4];
    }
  }
  id v28 = *(id *)(*((void *)&v39 + 1) + 40);
  v29 = v36;
  int v30 = *((unsigned __int8 *)v36 + 24);
  if (a5 && !*((unsigned char *)v36 + 24))
  {
    *a5 = *(id *)(*((void *)&v39 + 1) + 40);
    int v30 = *((unsigned __int8 *)v29 + 24);
  }
  BOOL v31 = v30 != 0;
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v35, 8);
  return v31;
}

intptr_t __52__SSSoftwareLibraryItem_setETag_forAssetType_error___block_invoke(void *a1, void *a2)
{
  if (a2 == (void *)MEMORY[0x1E4F14528] || a2 == (void *)MEMORY[0x1E4F14520])
  {
    uint64_t v4 = 121;
LABEL_10:
    id v6 = (id)SSError(@"SSErrorDomain", v4, 0, 0);
    goto LABEL_11;
  }
  if (!a2 || MEMORY[0x1A62689E0](a2) != MEMORY[0x1E4F14590])
  {
    uint64_t v4 = 111;
    goto LABEL_10;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = xpc_dictionary_get_BOOL(a2, "1");
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
LABEL_11:
  *(void *)(*(void *)(a1[5] + 8) + 40) = v6;
  v7 = a1[4];
  return dispatch_semaphore_signal(v7);
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_propertyValues objectForKey:a3];
  return v3;
}

- (id)_initWithITunesMetadata:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SSSoftwareLibraryItem;
  uint64_t v4 = [(SSSoftwareLibraryItem *)&v14 init];
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {

    p_isa[4] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = (void *)[a3 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 objectForKey:@"etags"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        p_isa[2] = (id)[v7 mutableCopy];
      }
      uint64_t v8 = [v6 objectForKey:@"referrerApp"];
      if (v8) {
        [p_isa[4] setObject:v8 forKey:@"referrerApp"];
      }
      uint64_t v9 = [v6 objectForKey:@"referrerURL"];
      if (v9) {
        [p_isa[4] setObject:v9 forKey:@"referrerURL"];
      }
    }
    for (uint64_t i = 0; i != 6; ++i)
    {
      int v11 = off_1E5BAC770[i];
      uint64_t v12 = [a3 objectForKey:v11];
      if (v12) {
        [p_isa[4] setObject:v12 forKey:v11];
      }
    }
  }
  return p_isa;
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  propertyValues = self->_propertyValues;
  if (a3)
  {
    if (!propertyValues)
    {
      propertyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_propertyValues = propertyValues;
    }
    [(NSMutableDictionary *)propertyValues setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)propertyValues removeObjectForKey:a4];
  }
}

- (SSSoftwareLibraryItem)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSSoftwareLibraryItem;
    v5 = [(SSSoftwareLibraryItem *)&v9 init];
    if (v5)
    {
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      v5->_etags = (NSMutableDictionary *)[(__CFArray *)v7 mutableCopy];

      v5->_beta = xpc_dictionary_get_BOOL(a3, "4");
      v5->_launchProhibited = xpc_dictionary_get_BOOL(a3, "5");
      v5->_placeholder = xpc_dictionary_get_BOOL(a3, "3");
      v5->_profileValidated = xpc_dictionary_get_BOOL(a3, "1");
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      v5->_propertyValues = (NSMutableDictionary *)[(__CFArray *)v8 mutableCopy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "4", self->_beta);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_etags);
  xpc_dictionary_set_BOOL(v3, "5", self->_launchProhibited);
  xpc_dictionary_set_BOOL(v3, "3", self->_placeholder);
  xpc_dictionary_set_BOOL(v3, "1", self->_profileValidated);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_propertyValues);
  return v3;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

@end