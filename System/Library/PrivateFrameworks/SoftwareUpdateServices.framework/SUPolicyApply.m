@interface SUPolicyApply
- (BOOL)checkAvailableSpace;
- (SUInstallOptions)installOptions;
- (SUPolicyApply)initWithInstallOptions:(id)a3;
- (int)cacheDeleteUrgency;
@end

@implementation SUPolicyApply

- (SUPolicyApply)initWithInstallOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUPolicyApply;
  v6 = [(SUPolicyApply *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_installOptions, a3);
  }

  return v7;
}

- (BOOL)checkAvailableSpace
{
  return 1;
}

- (int)cacheDeleteUrgency
{
  return 4;
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (void).cxx_destruct
{
}

@end