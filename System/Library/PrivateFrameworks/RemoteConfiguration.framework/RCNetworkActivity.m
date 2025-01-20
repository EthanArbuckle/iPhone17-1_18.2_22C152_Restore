@interface RCNetworkActivity
+ (RCNetworkActivity)activityWithDomain:(unsigned int)a3 label:(unsigned int)a4 parentToken:(id)a5;
- (NSUUID)parentToken;
- (RCNetworkActivity)initWithDomain:(unsigned int)a3 label:(unsigned int)a4 parentToken:(id)a5;
- (RCUnfairLock)accessLock;
- (unsigned)domain;
- (unsigned)label;
- (void)attachActivityToTask:(id)a3;
- (void)completeActivityWithSuccess:(BOOL)a3;
- (void)setAccessLock:(id)a3;
- (void)setDomain:(unsigned int)a3;
- (void)setLabel:(unsigned int)a3;
- (void)setParentToken:(id)a3;
- (void)startActivity;
@end

@implementation RCNetworkActivity

+ (RCNetworkActivity)activityWithDomain:(unsigned int)a3 label:(unsigned int)a4 parentToken:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  v8 = [[RCNetworkActivity alloc] initWithDomain:v6 label:v5 parentToken:v7];

  return v8;
}

- (RCNetworkActivity)initWithDomain:(unsigned int)a3 label:(unsigned int)a4 parentToken:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RCNetworkActivity;
  v10 = [(RCNetworkActivity *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_domain = a3;
    v10->_label = a4;
    objc_storeStrong((id *)&v10->_parentToken, a5);
    uint64_t v12 = nw_activity_create();
    activity = v11->_activity;
    v11->_activity = (OS_nw_activity *)v12;

    if (v9)
    {
      v17[0] = 0;
      v17[1] = 0;
      [v9 getUUIDBytes:v17];
      v14 = (void *)nw_activity_create_from_token();
      nw_activity_set_parent_activity();
    }
  }

  return v11;
}

- (void)startActivity
{
  v3 = [(RCNetworkActivity *)self accessLock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__RCNetworkActivity_startActivity__block_invoke;
  v4[3] = &unk_1E5B76100;
  v4[4] = self;
  [v3 performWithLockSync:v4];
}

uint64_t __34__RCNetworkActivity_startActivity__block_invoke(uint64_t a1)
{
  return MEMORY[0x1F40F2870](*(void *)(*(void *)(a1 + 32) + 8));
}

- (void)completeActivityWithSuccess:(BOOL)a3
{
  uint64_t v5 = [(RCNetworkActivity *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__RCNetworkActivity_completeActivityWithSuccess___block_invoke;
  v6[3] = &unk_1E5B76CD8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performWithLockSync:v6];
}

uint64_t __49__RCNetworkActivity_completeActivityWithSuccess___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 3;
  }
  return MEMORY[0x1F40F2878](*(void *)(*(void *)(a1 + 32) + 8), v1);
}

- (void)attachActivityToTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCNetworkActivity *)self accessLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RCNetworkActivity_attachActivityToTask___block_invoke;
  v7[3] = &unk_1E5B75F80;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performWithLockSync:v7];
}

uint64_t __42__RCNetworkActivity_attachActivityToTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_nw_activity:", *(void *)(*(void *)(a1 + 40) + 8));
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setDomain:(unsigned int)a3
{
  self->_domain = a3;
}

- (unsigned)label
{
  return self->_label;
}

- (void)setLabel:(unsigned int)a3
{
  self->_label = a3;
}

- (NSUUID)parentToken
{
  return self->_parentToken;
}

- (void)setParentToken:(id)a3
{
}

- (RCUnfairLock)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_parentToken, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end