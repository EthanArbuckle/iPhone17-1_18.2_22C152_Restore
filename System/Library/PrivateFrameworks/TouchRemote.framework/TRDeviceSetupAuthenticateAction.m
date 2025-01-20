@interface TRDeviceSetupAuthenticateAction
+ (id)actionForCancelledRequestWithOriginalAction:(id)a3;
+ (id)actionForFailedAttemptWithOriginalAction:(id)a3 requestMessage:(id)a4 failureMessage:(id)a5;
+ (id)actionForFinishedRequestWithOriginalAction:(id)a3 accountID:(id)a4 accountPassword:(id)a5 accountTypesWithSharedCredentials:(id)a6;
+ (id)actionForInitialAttemptWithAccountType:(unint64_t)a3 requestMessage:(id)a4;
- (NSArray)accountTypesWithSharedCredentials;
- (NSString)accountID;
- (NSString)accountPassword;
- (NSString)failureMessage;
- (NSString)requestMessage;
- (TRDeviceSetupAuthenticateAction)init;
- (id)_initWithAccountType:(unint64_t)a3 accountID:(id)a4 accountPassword:(id)a5 accountTypesWithSharedCredentials:(id)a6 attemptCount:(unint64_t)a7 requestMessage:(id)a8 failureMessage:(id)a9;
- (unint64_t)accountType;
- (unint64_t)attemptCount;
@end

@implementation TRDeviceSetupAuthenticateAction

- (TRDeviceSetupAuthenticateAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupAuthenticateAction;
  return (TRDeviceSetupAuthenticateAction *)[(TRDeviceSetupAction *)&v3 _initWithActionType:@"auth" parameters:0];
}

- (id)_initWithAccountType:(unint64_t)a3 accountID:(id)a4 accountPassword:(id)a5 accountTypesWithSharedCredentials:(id)a6 attemptCount:(unint64_t)a7 requestMessage:(id)a8 failureMessage:(id)a9
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v20 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v21 = v20;
  if (a3 - 1 > 3) {
    v22 = &stru_26C5827A8;
  }
  else {
    v22 = off_2642210D8[a3 - 1];
  }
  [v20 setObject:v22 forKeyedSubscript:@"at"];
  if (v15)
  {
    v23 = (void *)[v15 copy];
    [v21 setObject:v23 forKeyedSubscript:@"ai"];
  }
  if (v16)
  {
    v24 = (void *)[v16 copy];
    [v21 setObject:v24 forKeyedSubscript:@"ap"];
  }
  if ([v17 count])
  {
    unint64_t v39 = a7;
    v40 = self;
    id v41 = v15;
    id v25 = v17;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v25, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v44;
LABEL_11:
      uint64_t v31 = 0;
      while (2)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(v27);
        }
        switch([*(id *)(*((void *)&v43 + 1) + 8 * v31) unsignedIntegerValue])
        {
          case 0:
            goto LABEL_21;
          case 1:
            v32 = @"it";
            goto LABEL_20;
          case 2:
            v32 = @"ic";
            goto LABEL_20;
          case 3:
            v32 = @"hs";
            goto LABEL_20;
          case 4:
            v32 = @"gc";
            goto LABEL_20;
          default:
            v32 = 0;
LABEL_20:
            [v26 addObject:v32];
LABEL_21:
            if (v29 != ++v31) {
              continue;
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
            if (!v29) {
              goto LABEL_23;
            }
            goto LABEL_11;
        }
      }
    }
LABEL_23:

    v33 = (void *)[v26 copy];
    [v21 setObject:v33 forKeyedSubscript:@"sa"];

    id v15 = v41;
    self = v40;
    a7 = v39;
  }
  if (a7)
  {
    v34 = [NSNumber numberWithUnsignedInteger:a7];
    [v21 setObject:v34 forKeyedSubscript:@"a"];
  }
  if (v18)
  {
    v35 = (void *)[v18 copy];
    [v21 setObject:v35 forKeyedSubscript:@"rm"];
  }
  if (v19)
  {
    v36 = (void *)[v19 copy];
    [v21 setObject:v36 forKeyedSubscript:@"fm"];
  }
  v42.receiver = self;
  v42.super_class = (Class)TRDeviceSetupAuthenticateAction;
  id v37 = [(TRDeviceSetupAction *)&v42 _initWithActionType:@"auth" parameters:v21];

  return v37;
}

+ (id)actionForInitialAttemptWithAccountType:(unint64_t)a3 requestMessage:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) _initWithAccountType:a3 accountID:0 accountPassword:0 accountTypesWithSharedCredentials:0 attemptCount:0 requestMessage:v6 failureMessage:0];

  return v7;
}

+ (id)actionForFailedAttemptWithOriginalAction:(id)a3 requestMessage:(id)a4 failureMessage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  uint64_t v12 = [v10 accountType];
  v13 = [v10 accountID];
  v14 = [v10 accountPassword];
  uint64_t v15 = [v10 attemptCount];

  id v16 = (void *)[v11 _initWithAccountType:v12 accountID:v13 accountPassword:v14 accountTypesWithSharedCredentials:0 attemptCount:v15 + 1 requestMessage:v9 failureMessage:v8];
  return v16;
}

+ (id)actionForFinishedRequestWithOriginalAction:(id)a3 accountID:(id)a4 accountPassword:(id)a5 accountTypesWithSharedCredentials:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc((Class)a1);
  uint64_t v15 = [v13 accountType];
  uint64_t v16 = [v13 attemptCount];

  id v17 = (void *)[v14 _initWithAccountType:v15 accountID:v12 accountPassword:v11 accountTypesWithSharedCredentials:v10 attemptCount:v16 requestMessage:0 failureMessage:0];
  return v17;
}

+ (id)actionForCancelledRequestWithOriginalAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = [v4 accountType];
  uint64_t v7 = [v4 attemptCount];

  id v8 = (void *)[v5 _initWithAccountType:v6 accountID:0 accountPassword:0 accountTypesWithSharedCredentials:0 attemptCount:v7 requestMessage:0 failureMessage:0];
  return v8;
}

- (unint64_t)accountType
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"at"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  unint64_t v6 = _TRSetupAccountTypeFromProtocolString(v5);
  return v6;
}

- (NSString)accountID
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"ai"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSString)accountPassword
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"ap"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSArray)accountTypesWithSharedCredentials
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"sa"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = v5;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = _TRSetupAccountTypeFromProtocolString(*(void **)(*((void *)&v16 + 1) + 8 * i));
        if (v13)
        {
          id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v13, (void)v16);
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (unint64_t)attemptCount
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"a"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (NSString)requestMessage
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"rm"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSString)failureMessage
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"fm"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

@end