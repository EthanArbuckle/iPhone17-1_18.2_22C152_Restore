@interface NSUserActivity(UISceneActivationConditions)
- (id)targetContentIdentifier;
- (void)setTargetContentIdentifier:()UISceneActivationConditions;
@end

@implementation NSUserActivity(UISceneActivationConditions)

- (void)setTargetContentIdentifier:()UISceneActivationConditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 _internalUserActivity];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [a1 _internalUserActivity];
    [v7 setTargetContentIdentifier:v4];
  }
  else
  {
    id v11 = 0;
    v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
    id v9 = v11;
    if (v9)
    {
      v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneActivationConditions", &setTargetContentIdentifier____s_category)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v9;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "could not encode targetContentIdentifier to NSUserActivity: %@", buf, 0xCu);
      }
    }
    else
    {
      [a1 _setPayload:v8 object:0 identifier:@"com.apple.UIKit.activationConditions.targetContentIdentifierPayload" dirty:0];
    }
  }
}

- (id)targetContentIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _internalUserActivity];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [a1 _internalUserActivity];
    v5 = [v4 targetContentIdentifier];
  }
  else
  {
    id v4 = [a1 _payloadForIdentifier:@"com.apple.UIKit.activationConditions.targetContentIdentifierPayload"];
    if (v4)
    {
      char v6 = (void *)MEMORY[0x1E4F28DC0];
      v7 = self;
      id v11 = 0;
      v5 = [v6 unarchivedObjectOfClass:v7 fromData:v4 error:&v11];
      id v8 = v11;

      if (v8)
      {
        id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneActivationConditions", &targetContentIdentifier___s_category)+ 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v8;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "could not decode targetContentIdentifier from NSUserActivity: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end