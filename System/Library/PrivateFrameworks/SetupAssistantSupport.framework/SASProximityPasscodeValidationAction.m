@interface SASProximityPasscodeValidationAction
+ (id)actionFromDictionary:(id)a3;
+ (unint64_t)actionID;
- (BOOL)hasResponse;
- (BOOL)passcodeValid;
- (NSString)passcode;
- (id)requestPayload;
- (id)responsePayload;
- (void)setPasscode:(id)a3;
- (void)setPasscodeValid:(BOOL)a3;
- (void)setResponseFromData:(id)a3;
@end

@implementation SASProximityPasscodeValidationAction

+ (unint64_t)actionID
{
  return 7;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SASProximityPasscodeValidationAction);
  v5 = [v3 objectForKeyedSubscript:@"passcode"];

  [(SASProximityPasscodeValidationAction *)v4 setPasscode:v5];
  return v4;
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)requestPayload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"passcode";
  v2 = [(SASProximityPasscodeValidationAction *)self passcode];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)responsePayload
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  v4 = [(SASProximityPasscodeValidationAction *)self passcode];
  uint64_t v5 = [v3 unlockDeviceWithPasscode:v4 outError:0];

  v16 = @"success";
  v6 = [NSNumber numberWithBool:v5];
  v17[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  id v13 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = +[SASLogging facility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1DCC71000, v11, OS_LOG_TYPE_DEFAULT, "Failed to archive response: %@", buf, 0xCu);
    }
  }
  return v8;
}

- (void)setResponseFromData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v5, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  id v14 = 0;
  id v10 = [v4 unarchivedObjectOfClasses:v9 fromData:v6 error:&v14];

  id v11 = v14;
  if (!v10)
  {
    v12 = +[SASLogging facility];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_1DCC71000, v12, OS_LOG_TYPE_DEFAULT, "Failed to unarchive data: %@", buf, 0xCu);
    }
  }
  id v13 = [v10 objectForKeyedSubscript:@"success"];
  -[SASProximityPasscodeValidationAction setPasscodeValid:](self, "setPasscodeValid:", [v13 BOOLValue]);
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasscode:(id)a3
{
}

- (BOOL)passcodeValid
{
  return self->_passcodeValid;
}

- (void)setPasscodeValid:(BOOL)a3
{
  self->_passcodeValid = a3;
}

- (void).cxx_destruct
{
}

@end