@interface SBSLockScreenContentAction
- (BOOL)automaticallyInvalidatesOnSecureAppUserDismissal;
- (NSString)identifier;
- (NSString)slot;
- (SBSLockScreenContentAction)initWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 handler:(id)a7;
- (id)configurationObject;
- (unint64_t)secureAppType;
- (unint64_t)type;
- (void)setConfigurationObject:(id)a3;
- (void)setSecureAppType:(unint64_t)a3;
- (void)setSlot:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SBSLockScreenContentAction

- (SBSLockScreenContentAction)initWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 handler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v16 = a4;
  id v17 = objc_alloc_init(v15);
  v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v17 setObject:v18 forSetting:1];

  [v17 setObject:v16 forSetting:2];
  [v17 setObject:v12 forSetting:3];
  LODWORD(v18) = [v16 isEqualToString:@"App"];

  if (v18) {
    uint64_t v19 = SBSSecureAppTypeForIdentifier(v12);
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v19];
  [v17 setObject:v20 forSetting:4];

  if (v13) {
    [v17 setObject:v13 forSetting:5];
  }
  v21 = dispatch_get_global_queue(25, 0);
  v24.receiver = self;
  v24.super_class = (Class)SBSLockScreenContentAction;
  v22 = [(SBSLockScreenContentAction *)&v24 initWithInfo:v17 timeout:v21 forResponseOnQueue:v14 withHandler:0.0];

  return v22;
}

- (unint64_t)type
{
  v2 = [(SBSLockScreenContentAction *)self info];
  v3 = [v2 objectForSetting:1];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (NSString)slot
{
  v2 = [(SBSLockScreenContentAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (NSString *)v3;
}

- (NSString)identifier
{
  v2 = [(SBSLockScreenContentAction *)self info];
  v3 = [v2 objectForSetting:3];

  return (NSString *)v3;
}

- (unint64_t)secureAppType
{
  v2 = [(SBSLockScreenContentAction *)self info];
  v3 = [v2 objectForSetting:4];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (id)configurationObject
{
  v2 = [(SBSLockScreenContentAction *)self info];
  v3 = [v2 objectForSetting:5];

  return v3;
}

- (BOOL)automaticallyInvalidatesOnSecureAppUserDismissal
{
  return [(SBSLockScreenContentAction *)self secureAppType] == 12;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setSlot:(id)a3
{
}

- (void)setSecureAppType:(unint64_t)a3
{
  self->_secureAppType = a3;
}

- (void)setConfigurationObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationObject, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

@end