@interface SBSUserNotificationCAPackageDefinition
+ (id)_definitionType;
+ (id)definitionWithCAPackagePath:(id)a3;
- (NSString)caPackagePath;
- (id)_initWithCAPackagePath:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)build;
@end

@implementation SBSUserNotificationCAPackageDefinition

+ (id)_definitionType
{
  return @"caPackageAsset";
}

+ (id)definitionWithCAPackagePath:(id)a3
{
  id v3 = a3;
  id v4 = [[SBSUserNotificationCAPackageDefinition alloc] _initWithCAPackagePath:v3];

  return v4;
}

- (id)_initWithCAPackagePath:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSCFUserNotificationCAPackageDefinition.m", 31, @"Invalid parameter not satisfying: %@", @"caPackagePath" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBSUserNotificationCAPackageDefinition;
  v7 = [(SBSUserNotificationCAPackageDefinition *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_caPackagePath, a3);
  }

  return v8;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSUserNotificationCAPackageDefinition;
  v5 = [(SBSUserNotificationAssetDefinition *)&v9 _initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 bs_safeStringForKey:@"SBSCFCAPackagePath"];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  return v5;
}

- (id)build
{
  v8.receiver = self;
  v8.super_class = (Class)SBSUserNotificationCAPackageDefinition;
  id v3 = [(SBSUserNotificationAssetDefinition *)&v8 build];
  id v4 = (void *)[v3 mutableCopy];

  caPackagePath = self->_caPackagePath;
  if (caPackagePath) {
    [v4 setObject:caPackagePath forKey:@"SBSCFCAPackagePath"];
  }
  uint64_t v6 = (void *)[v4 copy];

  return v6;
}

- (NSString)caPackagePath
{
  return self->_caPackagePath;
}

- (void).cxx_destruct
{
}

@end