@interface SBSUserNotificationSystemImageDefinition
+ (id)_definitionType;
- (NSString)systemImageName;
- (SBSUserNotificationColorDefinition)tintColor;
- (SBSUserNotificationSystemImageDefinition)initWithSystemImageName:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)_initWithSystemImageName:(id)a3 tintColor:(id)a4;
- (id)build;
@end

@implementation SBSUserNotificationSystemImageDefinition

+ (id)_definitionType
{
  return @"systemImage";
}

- (SBSUserNotificationSystemImageDefinition)initWithSystemImageName:(id)a3
{
  return (SBSUserNotificationSystemImageDefinition *)[(SBSUserNotificationSystemImageDefinition *)self _initWithSystemImageName:a3 tintColor:0];
}

- (id)_initWithSystemImageName:(id)a3 tintColor:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSCFUserNotificationSystemImageDefinition.m", 40, @"Invalid parameter not satisfying: %@", @"systemImageName" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBSUserNotificationSystemImageDefinition;
  v10 = [(SBSUserNotificationSystemImageDefinition *)&v14 init];
  p_isa = (id *)&v10->super.super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_systemImageName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSUserNotificationSystemImageDefinition;
  v5 = [(SBSUserNotificationAssetDefinition *)&v12 _initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 bs_safeStringForKey:@"SBSCFUNSystemImageName"];
    v7 = (void *)v5[1];
    v5[1] = v6;

    id v8 = [v4 bs_safeDictionaryForKey:@"SBSCFUNTintColor"];
    if (v8)
    {
      id v9 = [[SBSUserNotificationColorDefinition alloc] _initWithDictionary:v8];
      v10 = (void *)v5[2];
      v5[2] = v9;
    }
  }

  return v5;
}

- (id)build
{
  v10.receiver = self;
  v10.super_class = (Class)SBSUserNotificationSystemImageDefinition;
  v3 = [(SBSUserNotificationAssetDefinition *)&v10 build];
  id v4 = (void *)[v3 mutableCopy];

  systemImageName = self->_systemImageName;
  if (systemImageName) {
    [v4 setObject:systemImageName forKey:@"SBSCFUNSystemImageName"];
  }
  tintColor = self->_tintColor;
  if (tintColor)
  {
    v7 = [(SBSUserNotificationColorDefinition *)tintColor build];
    [v4 setObject:v7 forKey:@"SBSCFUNTintColor"];
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (SBSUserNotificationColorDefinition)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end