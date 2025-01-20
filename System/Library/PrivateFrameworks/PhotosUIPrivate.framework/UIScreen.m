@interface UIScreen
- (id)pu_hardwareIdentifier;
@end

@implementation UIScreen

- (id)pu_hardwareIdentifier
{
  id v1 = a1;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 displayConfiguration];
    v3 = [v2 hardwareIdentifier];
    v4 = [v2 deviceName];
    v5 = v4;
    if (v3)
    {
      id v6 = v3;
    }
    else if (v4)
    {
      id v6 = v4;
    }
    else
    {
      v7 = PLAirPlayGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v1;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "UIScreen had nil hardware identifier and nil name: %@", buf, 0xCu);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"%p", v1);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v1 = v6;
  }
  return v1;
}

@end