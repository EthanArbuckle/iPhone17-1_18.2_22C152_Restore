@interface NSError(WFUnsupportedOnPlatform)
+ (id)wf_unsupportedActionErrorWithType:()WFUnsupportedOnPlatform platformIdiom:;
+ (id)wf_unsupportedParameterErrorWithParameterName:()WFUnsupportedOnPlatform errorType:platformIdiom:;
- (id)wf_localizedErrorStringWithActionName:()WFUnsupportedOnPlatform;
- (uint64_t)wf_isUnsupportedOnPlatformError;
@end

@implementation NSError(WFUnsupportedOnPlatform)

- (id)wf_localizedErrorStringWithActionName:()WFUnsupportedOnPlatform
{
  id v4 = a3;
  if (!objc_msgSend(a1, "wf_isUnsupportedOnPlatformError"))
  {
    v16 = 0;
    goto LABEL_36;
  }
  v5 = [a1 userInfo];
  v6 = [v5 objectForKey:@"WFUnsupportedOnPlatformIdiom"];
  uint64_t v7 = [v6 integerValue];

  v8 = [a1 userInfo];
  v9 = [v8 objectForKey:@"WFUnsupportedOnPlatformErrorType"];

  v10 = WFDisplayNameForDeviceIdiom(v7, v9);
  if (![a1 code])
  {
    if ([v4 length])
    {
      if (!v10)
      {
        v26 = NSString;
        v27 = WFLocalizedString(@"The action “%@” is not supported on this device.");
        uint64_t v28 = objc_msgSend(v26, "stringWithFormat:", v27, v4);
LABEL_34:
        v16 = (void *)v28;

        goto LABEL_35;
      }
      int v17 = [v9 isEqualToString:@"NotAvailableOnSpecifiedPlatform"];
      v18 = NSString;
      if (v17) {
        v19 = @"The action “%@” is not supported on %@.";
      }
      else {
        v19 = @"The action “%@” can only run on %@.";
      }
      v27 = WFLocalizedString(v19);
      objc_msgSend(v18, "localizedStringWithFormat:", v27, v4, v10);
    }
    else
    {
      if (!v10)
      {
        v16 = WFLocalizedString(@"This action is not supported on this device.");
        goto LABEL_35;
      }
      int v23 = [v9 isEqualToString:@"NotAvailableOnSpecifiedPlatform"];
      v24 = NSString;
      if (v23) {
        v25 = @"This action is not supported on %@.";
      }
      else {
        v25 = @"This action can only run on %@.";
      }
      v27 = WFLocalizedString(v25);
      objc_msgSend(v24, "localizedStringWithFormat:", v27, v10, v31);
    uint64_t v28 = };
    goto LABEL_34;
  }
  v11 = [a1 userInfo];
  v12 = [v11 objectForKey:@"WFUnsupportedOnPlatformParameterName"];

  if (v10)
  {
    int v13 = [v9 isEqualToString:@"NotAvailableOnSpecifiedPlatform"];
    v14 = NSString;
    if (v13)
    {
      if (v12)
      {
        v15 = @"The parameter “%@” cannot be edited on %@.";
LABEL_16:
        v21 = WFLocalizedString(v15);
        objc_msgSend(v14, "localizedStringWithFormat:", v21, v12, v10);
        uint64_t v22 = LABEL_27:;
        goto LABEL_28;
      }
      v29 = @"This parameter cannot be edited on %@.";
    }
    else
    {
      if (v12)
      {
        v15 = @"The parameter “%@” can only be edited on %@.";
        goto LABEL_16;
      }
      v29 = @"This parameter can only be edited on %@.";
    }
    v21 = WFLocalizedString(v29);
    objc_msgSend(v14, "localizedStringWithFormat:", v21, v10, v31);
    goto LABEL_27;
  }
  if (v12)
  {
    v20 = NSString;
    v21 = WFLocalizedString(@"The parameter “%@” cannot be edited on this device.");
    uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", v21, v12);
LABEL_28:
    v16 = (void *)v22;

    goto LABEL_29;
  }
  v16 = WFLocalizedString(@"This parameter cannot be edited on this device.");
LABEL_29:

LABEL_35:
LABEL_36:

  return v16;
}

- (uint64_t)wf_isUnsupportedOnPlatformError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"WFUnsupportedOnPlatformErrorDomain"];

  return v2;
}

+ (id)wf_unsupportedParameterErrorWithParameterName:()WFUnsupportedOnPlatform errorType:platformIdiom:
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"NSError+WFUnsupportedOnPlatform.m", 58, @"Invalid parameter not satisfying: %@", @"errorType" object file lineNumber description];
  }
  v11 = (void *)MEMORY[0x1E4F28C58];
  v18[0] = v9;
  v17[0] = @"WFUnsupportedOnPlatformParameterName";
  v17[1] = @"WFUnsupportedOnPlatformIdiom";
  v12 = [NSNumber numberWithInteger:a5];
  v17[2] = @"WFUnsupportedOnPlatformErrorType";
  v18[1] = v12;
  v18[2] = v10;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v14 = [v11 errorWithDomain:@"WFUnsupportedOnPlatformErrorDomain" code:1 userInfo:v13];

  return v14;
}

+ (id)wf_unsupportedActionErrorWithType:()WFUnsupportedOnPlatform platformIdiom:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSError+WFUnsupportedOnPlatform.m", 50, @"Invalid parameter not satisfying: %@", @"errorType" object file lineNumber description];
  }
  v8 = (void *)MEMORY[0x1E4F28C58];
  v14[0] = @"WFUnsupportedOnPlatformIdiom";
  id v9 = [NSNumber numberWithInteger:a4];
  v14[1] = @"WFUnsupportedOnPlatformErrorType";
  v15[0] = v9;
  v15[1] = v7;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = [v8 errorWithDomain:@"WFUnsupportedOnPlatformErrorDomain" code:0 userInfo:v10];

  return v11;
}

@end