void _WorkoutKitConnectWithBlock(void *a1, void *a2)
{
  void (**v3)(id, void *, void *);
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  void v15[4];
  id v16;
  id location;

  v3 = a1;
  v4 = a2;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.WorkoutKitXPCService"];
  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270D9DA98];
  [v5 setRemoteObjectInterface:v6];

  [v5 activate];
  objc_initWeak(&location, v5);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = ___WorkoutKitConnectWithBlock_block_invoke;
  v15[3] = &unk_26558A7B8;
  objc_copyWeak(&v16, &location);
  [v5 setInterruptionHandler:v15];
  v9 = MEMORY[0x263EF8330];
  v10 = 3221225472;
  v11 = ___WorkoutKitConnectWithBlock_block_invoke_2;
  v12 = &unk_26558A7E0;
  v7 = v4;
  v13 = v7;
  objc_copyWeak(&v14, &location);
  [v5 setInvalidationHandler:&v9];
  v8 = objc_msgSend(v5, "remoteObjectProxy", v9, v10, v11, v12);
  v3[2](v3, v8, v5);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void sub_2619E61B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x270EDBE38]();
}