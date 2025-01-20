@interface SBSUserNotificationAssetDefinition
+ (NSString)_definitionType;
+ (id)_definitionFromSerializedDefinition:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)build;
@end

@implementation SBSUserNotificationAssetDefinition

+ (id)_definitionFromSerializedDefinition:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"SBSCFUNAssetDefinitionType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  v5 = off_1E566AF78;
  v6 = +[SBSUserNotificationImageAssetDefinition _definitionType];
  char v7 = [v4 isEqualToString:v6];

  if (v7) {
    goto LABEL_5;
  }
  v5 = off_1E566AF88;
  v8 = +[SBSUserNotificationSystemImageDefinition _definitionType];
  char v9 = [v4 isEqualToString:v8];

  if ((v9 & 1) != 0
    || (v5 = off_1E566AF68,
        +[SBSUserNotificationCAPackageDefinition _definitionType](SBSUserNotificationCAPackageDefinition, "_definitionType"), v10 = objc_claimAutoreleasedReturnValue(), int v11 = [v4 isEqualToString:v10], v10, v11))
  {
LABEL_5:
    v12 = (void *)[objc_alloc(*v5) _initWithDictionary:v3];
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

+ (NSString)_definitionType
{
  return 0;
}

- (id)_initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSCFUserNotificationAssetDefinition.m", 42, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(SBSUserNotificationAssetDefinition *)self init];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)build
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = [(id)objc_opt_class() _definitionType];
  v4 = [v2 dictionaryWithObject:v3 forKey:@"SBSCFUNAssetDefinitionType"];

  return v4;
}

@end