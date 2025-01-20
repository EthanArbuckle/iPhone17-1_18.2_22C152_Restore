@interface FCNetworkActivity
+ (FCNetworkActivity)activityWithLabel:(unsigned int)a3;
- (FCNetworkActivity)initWithLabel:(unsigned int)a3;
- (NSUUID)token;
- (unsigned)domain;
- (unsigned)label;
- (void)attachActivityToTask:(id)a3;
- (void)completeActivityWithSuccess:(BOOL)a3;
- (void)setDomain:(unsigned int)a3;
- (void)setLabel:(unsigned int)a3;
- (void)setParentActivity:(id)a3;
- (void)startActivity;
@end

@implementation FCNetworkActivity

+ (FCNetworkActivity)activityWithLabel:(unsigned int)a3
{
  v3 = [[FCNetworkActivity alloc] initWithLabel:*(void *)&a3];
  return v3;
}

- (FCNetworkActivity)initWithLabel:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FCNetworkActivity;
  v4 = [(FCNetworkActivity *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_domain = 54;
    v4->_label = a3;
    uint64_t v6 = nw_activity_create();
    activity = v5->_activity;
    v5->_activity = (OS_nw_activity *)v6;
  }
  return v5;
}

- (void)startActivity
{
}

- (void)completeActivityWithSuccess:(BOOL)a3
{
  activity = self->_activity;
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  MEMORY[0x1F40F2878](activity, v4);
}

- (void)setParentActivity:(id)a3
{
}

- (void)attachActivityToTask:(id)a3
{
}

- (NSUUID)token
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = 0;
  nw_activity_get_token();
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4];
  return (NSUUID *)v2;
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

- (void).cxx_destruct
{
}

@end