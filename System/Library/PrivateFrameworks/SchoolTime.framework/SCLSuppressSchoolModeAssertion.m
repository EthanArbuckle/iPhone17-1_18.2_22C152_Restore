@interface SCLSuppressSchoolModeAssertion
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)isValid;
- (NSString)explanation;
- (SCLSuppressSchoolModeAssertion)initWithExplanation:(id)a3;
- (id)description;
- (void)acquireWithInvalidationHandler:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)invalidate;
@end

@implementation SCLSuppressSchoolModeAssertion

- (SCLSuppressSchoolModeAssertion)initWithExplanation:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SCLSuppressSchoolModeAssertion;
  v5 = [(SCLSuppressSchoolModeAssertion *)&v23 init];
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    uint64_t v7 = [v4 copy];
    explanation = v6->_explanation;
    v6->_explanation = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:0x26DF07FF8 options:0];
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v11;

    v13 = v6->_connection;
    v14 = SCLSuppressSchoolModeAssertionXPCServerInterface();
    [(NSXPCConnection *)v13 setRemoteObjectInterface:v14];

    objc_initWeak(&location, v6);
    v15 = v6->_connection;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke;
    v20[3] = &unk_2648AC4E0;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v15 setInterruptionHandler:v20];
    v16 = v6->_connection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke_2;
    v18[3] = &unk_2648AC4E0;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v16 setInvalidationHandler:v18];
    [(NSXPCConnection *)v6->_connection resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInterrupted];
}

void __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

- (BOOL)isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (state > 2) {
    v5 = 0;
  }
  else {
    v5 = off_2648AC5C0[state];
  }
  v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [(SCLSuppressSchoolModeAssertion *)self explanation];
  v10 = [v6 stringWithFormat:@"<%@ %p (%@); %@>", v8, self, v9, v5];

  return v10;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state != 2)
  {
    self->_unint64_t state = 2;
    [(NSXPCConnection *)self->_connection invalidate];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)acquireWithInvalidationHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _os_activity_create(&dword_22B7B4000, "Acquire suppression assertion async", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = scl_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = self;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Acquiring suppression assertion %@", buf, 0xCu);
  }

  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke;
  v17[3] = &unk_2648AC508;
  id v8 = v4;
  v17[4] = self;
  id v18 = v8;
  uint64_t v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  v10 = [(SCLSuppressSchoolModeAssertion *)self explanation];
  UUID = self->_UUID;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2;
  v14[3] = &unk_2648AC530;
  v14[4] = self;
  v12 = v5;
  v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [v9 acquireWithExplanation:v10 UUID:UUID completion:v14];

  os_activity_scope_leave(&state);
}

uint64_t __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    *(void *)(v6 + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(a1 + 40), &v8);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 8));
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(a1 + 40), &v8);
    uint64_t v7 = scl_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2_cold_1((void *)(a1 + 32), (uint64_t)v5, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  os_activity_scope_leave(&v8);
}

- (BOOL)acquireWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = _os_activity_create(&dword_22B7B4000, "Acquire suppression assertion sync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = scl_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Acquiring suppression assertion %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  objc_super v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke;
  v15[3] = &unk_2648AC558;
  v15[4] = &buf;
  os_activity_scope_state_s v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v9 = [(SCLSuppressSchoolModeAssertion *)self explanation];
  UUID = self->_UUID;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke_2;
  v14[3] = &unk_2648AC580;
  void v14[5] = &v16;
  v14[6] = &buf;
  v14[4] = self;
  [v8 acquireWithExplanation:v9 UUID:UUID completion:v14];

  if (!*((unsigned char *)v17 + 24))
  {
    uint64_t v11 = scl_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(SCLSuppressSchoolModeAssertion *)(uint64_t)self acquireWithError:v11];
    }
  }
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v12 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v12;
}

void __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke_2(void *a1, int a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
    *(void *)(a1[4] + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  }
}

- (void)connectionInterrupted
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "Suppression connection interrupted - needs reconnect = %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)connectionInvalidated
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Suppression connection invalidated. Further attempts to acquire suppression assertion will fail.", v1, 2u);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_22B7B4000, a2, a3, "Could not acquire assertion - %@ %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)acquireWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_1(&dword_22B7B4000, a2, a3, "Could not acquire assertion - %@ %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end