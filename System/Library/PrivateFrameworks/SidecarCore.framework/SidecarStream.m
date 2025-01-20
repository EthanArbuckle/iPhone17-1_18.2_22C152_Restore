@interface SidecarStream
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
- ($DCF20CAD073027CB89FDEFA7A9A33809)nwClientID;
- (NSString)identifier;
- (RPStreamSession)rapportStream;
- (SidecarSession)session;
- (SidecarStream)initWithCoder:(id)a3;
- (SidecarStream)initWithIdentifier:(id)a3 rapportStream:(id)a4;
- (id)description;
- (id)handler;
- (int64_t)fileDescriptor;
- (int64_t)transport;
- (int64_t)type;
- (unint64_t)flags;
- (unint64_t)status;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)sendOPACK:(id)a3 completion:(id)a4;
- (void)setHandler:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation SidecarStream

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"status", 0);
  if ([v5 containsObject:v4])
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SidecarStream;
    unsigned __int8 v6 = objc_msgSendSuper2(&v8, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_rapportStream, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)*MEMORY[0x263F08160];
  id v9 = a3;
  validateXPCCoder(self, v9, v4);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_activated);
  if (v5)
  {
    unsigned __int8 v6 = (void *)MEMORY[0x263EFF940];
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    [v6 raise:v4, @"cannot encode activated %@", v8 format];
  }
  encodeObject(v9, @"id", self->_identifier);
  encodeObject(v9, @"rp", self->_rapportStream);
}

- (SidecarStream)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SidecarStream;
  unsigned __int8 v5 = [(SidecarStream *)&v14 init];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    validateXPCCoder(v5, v4, (void *)*MEMORY[0x263F08170]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = decodeObject(v4, @"id", v7);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    Class v10 = NSClassFromString(&cfstr_Rpstreamsessio.isa);
    uint64_t v11 = decodeObject(v4, @"rp", (uint64_t)v10);
    rapportStream = v6->_rapportStream;
    v6->_rapportStream = (RPStreamSession *)v11;
  }
  return v6;
}

- (void)sendOPACK:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  if (self->_rapportStream)
  {
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_activated);
    if ((v8 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF498];
      uint64_t v11 = [(SidecarStream *)self description];
      [v9 raise:v10, @"%@ not activated", v11 format];
    }
    id v18 = 0;
    v12 = SidecarOPACKEncode(v6, &v18);
    id v13 = v18;
    if (v13)
    {
      v7[2](v7, v13);
    }
    else
    {
      rapportStream = self->_rapportStream;
      v16 = [(SidecarStream *)self identifier];
      v19 = &unk_26E18EB38;
      v20[0] = v12;
      v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [(RPStreamSession *)rapportStream sendEventID:v16 event:v17 options:0 completion:v7];
    }
  }
  else
  {
    objc_super v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SidecarErrorDomain" code:-102 userInfo:0];
    v7[2](v7, v14);
  }
}

- (void)setHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)[v4 copy];
  id handler = self->_handler;
  self->_id handler = v5;

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__SidecarStream_setHandler___block_invoke;
  v9[3] = &unk_2649C65C0;
  id v10 = v4;
  rapportStream = self->_rapportStream;
  id v8 = v4;
  [(RPStreamSession *)rapportStream setReceivedEventHandler:v9];
}

void __28__SidecarStream_setHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SidecarCoreLogSubsystem(OS_LOG_TYPE_DEBUG);
  uint64_t v11 = v10;
  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_22D954000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: %@, %@", buf, 0x20u);
  }

  v12 = [v8 objectForKeyedSubscript:&unk_26E18EB38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = 0;
    id v13 = SidecarOPACKDecode(v12, &v21);
    id v14 = v21;
    if (v14)
    {
      v15 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      if (v15)
      {
        log = v15;
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        v15 = log;
        if (v16)
        {
          v17 = [v14 domain];
          uint64_t v18 = [v14 code];
          v19 = [v14 localizedDescription];
          *(_DWORD *)buf = 138543875;
          id v23 = v17;
          __int16 v24 = 2048;
          uint64_t v25 = v18;
          __int16 v26 = 2113;
          id v27 = v19;
          _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          v15 = log;
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)handler
{
  v2 = (void *)MEMORY[0x230F8F310](self->_handler, a2);

  return v2;
}

- (void)invalidate
{
  [(RPStreamSession *)self->_rapportStream invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  if (WeakRetained)
  {
    id v4 = self->_identifier;
    unsigned __int8 v5 = SidecarQueue();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__SidecarStream_invalidate__block_invoke;
    v6[3] = &unk_2649C6598;
    v6[4] = WeakRetained;
    v6[5] = v4;
    dispatch_async(v5, v6);
  }
}

void __27__SidecarStream_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56);
  SidecarRelayProxyAsync(0, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 relaySession:v2 closeStream:*(void *)(a1 + 40)];
}

- (void)activateWithCompletion:(id)a3
{
  id v5 = a3;
  if (atomic_exchange((atomic_uchar *volatile)&self->_activated, 1u))
  {
    id v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF498];
    id v8 = [(SidecarStream *)self description];
    [v6 raise:v7, @"%@ already activated", v8 format];
  }
  rapportStream = self->_rapportStream;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SidecarStream_activateWithCompletion___block_invoke;
  v11[3] = &unk_2649C6570;
  id v12 = v5;
  SEL v13 = a2;
  v11[4] = self;
  id v10 = v5;
  [(RPStreamSession *)rapportStream activateWithCompletion:v11];
}

void __40__SidecarStream_activateWithCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = (const char *)a1[6];
  id v5 = a2;
  SidecarCoreLogObjCAPIError(v3, v4, v5);
  (*(void (**)(void))(a1[5] + 16))();
}

- ($DCF20CAD073027CB89FDEFA7A9A33809)nwClientID
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v2 = [(RPStreamSession *)self->_rapportStream nwClientID];
  [v2 getUUIDBytes:&v5];

  uint64_t v3 = v5;
  uint64_t v4 = v6;
  result.var8 = v4;
  result.var9 = BYTE1(v4);
  result.var10 = BYTE2(v4);
  result.var11 = BYTE3(v4);
  result.var12 = BYTE4(v4);
  result.var13 = BYTE5(v4);
  result.var14 = BYTE6(v4);
  result.var15 = HIBYTE(v4);
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  result.var6 = BYTE6(v3);
  result.var7 = HIBYTE(v3);
  return result;
}

- (unint64_t)flags
{
  return [(RPStreamSession *)self->_rapportStream streamFlags] & 2;
}

- (int64_t)type
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = [(RPStreamSession *)self->_rapportStream streamType];
  uint64_t v3 = (v2 - 1);
  if (v3 < 3) {
    return v3 + 1;
  }
  int v5 = v2;
  uint64_t v6 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  uint64_t v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = "?";
    if (!v5) {
      id v8 = "Invalid";
    }
    int v9 = 136446466;
    id v10 = v8;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_22D954000, v7, OS_LOG_TYPE_ERROR, "unexpected RPStreamType: %{public}s (%d)", (uint8_t *)&v9, 0x12u);
  }

  return 0;
}

- (int64_t)transport
{
  int v2 = [(SidecarStream *)self session];
  uint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 transport];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setStatus:(unint64_t)a3
{
  if ([(SidecarStream *)self status] != a3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[2] = __27__SidecarStream_setStatus___block_invoke;
    v6[3] = &unk_2649C6548;
    v6[4] = self;
    v6[5] = a3;
    int v5 = self;
    [(SidecarStream *)v5 willChangeValueForKey:@"status", v6[0], 3221225472];
    __27__SidecarStream_setStatus___block_invoke((uint64_t)v6);
    [(SidecarStream *)v5 didChangeValueForKey:@"status"];
  }
}

uint64_t __27__SidecarStream_setStatus___block_invoke(uint64_t result)
{
  return result;
}

- (unint64_t)status
{
  return atomic_load(&self->_status);
}

- (SidecarSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (SidecarSession *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)fileDescriptor
{
  rapportStream = self->_rapportStream;
  if (rapportStream) {
    return (int)[(RPStreamSession *)rapportStream streamSocket];
  }
  else {
    return -1;
  }
}

- (RPStreamSession)rapportStream
{
  return self->_rapportStream;
}

- (id)description
{
  uint64_t v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@<%@>", v5, self->_identifier];

  return v6;
}

- (void)dealloc
{
  [(SidecarStream *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SidecarStream;
  [(SidecarStream *)&v3 dealloc];
}

- (SidecarStream)initWithIdentifier:(id)a3 rapportStream:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v14 = NSString;
    v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v14 stringWithFormat:@"-[%@] called with without supplying an identifier", v15];

    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  id v10 = v9;
  v18.receiver = self;
  v18.super_class = (Class)SidecarStream;
  __int16 v11 = [(SidecarStream *)&v18 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_rapportStream, a4);
  }

  return v12;
}

@end