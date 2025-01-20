@interface NPKey
- (NPKey)initWithData:(id)a3;
- (NSData)info;
- (NSPNetworkAgent)agentForKey;
- (NSUUID)uuid;
- (id)data;
- (int)error;
- (unsigned)flags;
- (unsigned)session_counter;
- (void)setError:(int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInfo:(id)a3;
- (void)setSession_counter:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation NPKey

- (NPKey)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPKey;
  v5 = [(NPKey *)&v10 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __22__NPKey_initWithData___block_invoke;
    v8[3] = &unk_1E5A3BB00;
    v9 = v5;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v8);
  }
  return v5;
}

uint64_t __22__NPKey_initWithData___block_invoke(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  if (a2 == 1 && a3 == 4)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = *a4;
    return 1;
  }
  if (a2 == 2 && a3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:a3];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;
LABEL_10:

    return 1;
  }
  if (a2 == 3 && a3 == 16)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a4];
    uint64_t v9 = *(void *)(a1 + 32);
    v7 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;
    goto LABEL_10;
  }
  if (a2 == 4 && a3 == 4)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = *a4;
  }
  else if (a2 == 5 && a3 == 4)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = *a4;
  }
  return 1;
}

- (id)data
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  -[NSMutableData appendType:length:value:](v3, 1, 4u, (uint64_t)&self->_session_counter);
  id v4 = [(NPKey *)self info];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(NPKey *)self info];
    unsigned __int16 v7 = [v6 length];
    id v8 = [(NPKey *)self info];
    -[NSMutableData appendType:length:value:](v3, 2, v7, [v8 bytes]);
  }
  v11[0] = 0;
  v11[1] = 0;
  uint64_t v9 = [(NPKey *)self uuid];
  [v9 getUUIDBytes:v11];

  -[NSMutableData appendType:length:value:](v3, 3, 0x10u, (uint64_t)v11);
  -[NSMutableData appendType:length:value:](v3, 4, 4u, (uint64_t)&self->_error);
  -[NSMutableData appendType:length:value:](v3, 5, 4u, (uint64_t)&self->_flags);
  return v3;
}

- (NSPNetworkAgent)agentForKey
{
  id v3 = objc_alloc_init(NSPKeyNetworkAgent);
  id v4 = [(NPKey *)self uuid];
  [(NSPNetworkAgent *)v3 setAgentUUID:v4];

  return (NSPNetworkAgent *)v3;
}

- (unsigned)session_counter
{
  return self->_session_counter;
}

- (void)setSession_counter:(unsigned int)a3
{
  self->_session_counter = a3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSData)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end