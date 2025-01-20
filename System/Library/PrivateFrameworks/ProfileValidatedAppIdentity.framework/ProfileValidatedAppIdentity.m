void PVAppIdentity_GenerateDigestWithCompletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void v23[4];
  id v24;
  id v25;
  id v26;
  void v27[4];
  id v28;
  id v29;
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (!v7)
  {
    v9 = dispatch_get_global_queue(0, 0);
  }
  v10 = (objc_class *)MEMORY[0x263F08D68];
  v11 = v7;
  v12 = a2;
  v13 = a1;
  v14 = (void *)[[v10 alloc] initWithServiceName:@"com.apple.pvappidentityservice"];
  v15 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27087CE00];
  [v14 setRemoteObjectInterface:v15];

  [v14 resume];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke;
  v27[3] = &unk_265480D90;
  v16 = v9;
  v28 = v16;
  v17 = v8;
  v30 = v17;
  v18 = v14;
  v29 = v18;
  v19 = [v18 remoteObjectProxyWithErrorHandler:v27];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_2;
  v23[3] = &unk_265480DB8;
  v25 = v18;
  v26 = v17;
  v24 = v16;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  [v19 generateDigest:v13 ppqAppId:v12 withReply:v23];
}

id _PVAppIdentityLogSystem()
{
  if (_PVAppIdentityLogSystem_onceToken != -1) {
    dispatch_once(&_PVAppIdentityLogSystem_onceToken, &__block_literal_global);
  }
  v0 = (void *)_PVAppIdentityLogSystem_log;

  return v0;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}