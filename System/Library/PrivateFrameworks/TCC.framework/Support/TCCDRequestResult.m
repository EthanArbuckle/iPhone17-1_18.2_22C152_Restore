@interface TCCDRequestResult
+ (void)populateReplyMessageToDeny:(id)a3 withError:(id)a4;
- (NSError)error;
- (NSString)servicePolicyActionDescription;
- (NSString)servicePolicyActionKeyName;
- (TCCDRequestResult)init;
- (id)description;
- (id)descriptionWithRespectToService:(id)a3;
- (int)doUpdateOfSubjectVerifierData;
- (int)lastReminderTime;
- (int)replyNoCacheAuthorization;
- (int)v1AuthorizationUpgrade;
- (int64_t)databaseAction;
- (int64_t)promptType;
- (int64_t)servicePolicyAction;
- (unint64_t)authorizationReason;
- (unint64_t)authorizationValue;
- (unint64_t)authorizationVersion;
- (unint64_t)previousAuthorization;
- (unint64_t)v1AuthorizationReason;
- (unint64_t)v1AuthorizationValue;
- (unsigned)databaseFlags;
- (void)denyAuthorizationWithErrorCode:(int64_t)a3 format:(id)a4;
- (void)populateReplyMessage:(id)a3;
- (void)setAuthorizationReason:(unint64_t)a3;
- (void)setAuthorizationValue:(unint64_t)a3;
- (void)setAuthorizationVersion:(unint64_t)a3;
- (void)setDatabaseAction:(int64_t)a3;
- (void)setDatabaseFlags:(unsigned int)a3;
- (void)setDoUpdateOfSubjectVerifierData:(int)a3;
- (void)setError:(id)a3;
- (void)setLastReminderTime:(int)a3;
- (void)setPreviousAuthorization:(unint64_t)a3;
- (void)setPromptType:(int64_t)a3;
- (void)setReplyNoCacheAuthorization:(int)a3;
- (void)setServicePolicyAction:(int64_t)a3;
- (void)setServicePolicyActionDescription:(id)a3;
- (void)setServicePolicyActionKeyName:(id)a3;
- (void)setV1AuthorizationReason:(unint64_t)a3;
- (void)setV1AuthorizationUpgrade:(int)a3;
- (void)setV1AuthorizationValue:(unint64_t)a3;
@end

@implementation TCCDRequestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicePolicyActionKeyName, 0);
  objc_storeStrong((id *)&self->_servicePolicyActionDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setAuthorizationValue:(unint64_t)a3
{
  self->_authorizationValue = a3;
}

- (void)setAuthorizationReason:(unint64_t)a3
{
  self->_authorizationReason = a3;
}

- (void)setReplyNoCacheAuthorization:(int)a3
{
  self->_replyNoCacheAuthorization = a3;
}

- (void)setPromptType:(int64_t)a3
{
  self->_promptType = a3;
}

- (void)setDatabaseAction:(int64_t)a3
{
  self->_databaseAction = a3;
}

- (void)populateReplyMessage:(id)a3
{
  xpc_object_t xdict = a3;
  BOOL v4 = (id)[(TCCDRequestResult *)self authorizationValue] == (id)1;
  v5 = xdict;
  if (v4)
  {
    v6 = "preflight_unknown";
LABEL_9:
    BOOL v7 = 1;
LABEL_10:
    xpc_dictionary_set_BOOL(v5, v6, v7);
    goto LABEL_11;
  }
  if ([(TCCDRequestResult *)self authorizationValue])
  {
    v6 = "result";
LABEL_8:
    v5 = xdict;
    goto LABEL_9;
  }
  if ((id)[(TCCDRequestResult *)self authorizationReason] == (id)7)
  {
    v6 = "restricted";
    goto LABEL_8;
  }
  if ((id)[(TCCDRequestResult *)self authorizationReason] != (id)8
    || (id)[(TCCDRequestResult *)self servicePolicyAction] != (id)1)
  {
    v6 = "result";
    v5 = xdict;
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v14 = [(TCCDRequestResult *)self servicePolicyActionDescription];
  xpc_dictionary_set_string(xdict, "abort", (const char *)[v14 UTF8String]);

  id v15 = [(TCCDRequestResult *)self servicePolicyActionKeyName];
  xpc_dictionary_set_string(xdict, "problem_key", (const char *)[v15 UTF8String]);

LABEL_11:
  if ([(TCCDRequestResult *)self replyNoCacheAuthorization]) {
    xpc_dictionary_set_BOOL(xdict, "do_not_cache", 1);
  }
  xpc_dictionary_set_uint64(xdict, "auth_value", [(TCCDRequestResult *)self authorizationValue]);
  xpc_dictionary_set_uint64(xdict, "auth_reason", [(TCCDRequestResult *)self authorizationReason]);
  xpc_dictionary_set_uint64(xdict, "auth_version", [(TCCDRequestResult *)self authorizationVersion]);
  xpc_dictionary_set_uint64(xdict, "prompt_type", [(TCCDRequestResult *)self promptType]);
  if (([(TCCDRequestResult *)self databaseFlags] & 0x10) != 0) {
    xpc_dictionary_set_BOOL(xdict, "has_prompted_for_allow", ([(TCCDRequestResult *)self databaseFlags] & 0x10) != 0);
  }
  v8 = [(TCCDRequestResult *)self error];

  if (v8)
  {
    v9 = [(TCCDRequestResult *)self error];
    id v10 = [v9 localizedDescription];
    xpc_dictionary_set_string(xdict, "auth_error_string", (const char *)[v10 UTF8String]);

    v11 = [(TCCDRequestResult *)self error];
    xpc_dictionary_set_uint64(xdict, "auth_error_code", (uint64_t)[v11 code]);

    if ((id)[(TCCDRequestResult *)self authorizationReason] == (id)8
      && (id)[(TCCDRequestResult *)self servicePolicyAction] == (id)1)
    {
      id v12 = [(TCCDRequestResult *)self servicePolicyActionDescription];
      xpc_dictionary_set_string(xdict, "auth_abort_description", (const char *)[v12 UTF8String]);

      id v13 = [(TCCDRequestResult *)self servicePolicyActionKeyName];
      xpc_dictionary_set_string(xdict, "auth_abort_key", (const char *)[v13 UTF8String]);
    }
  }
}

- (int64_t)promptType
{
  return self->_promptType;
}

- (unint64_t)authorizationValue
{
  return self->_authorizationValue;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)databaseAction
{
  return self->_databaseAction;
}

- (unint64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (unint64_t)authorizationReason
{
  return self->_authorizationReason;
}

- (int)replyNoCacheAuthorization
{
  return self->_replyNoCacheAuthorization;
}

- (TCCDRequestResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)TCCDRequestResult;
  v2 = [(TCCDRequestResult *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TCCDRequestResult *)v2 setAuthorizationVersion:1];
  }
  return v3;
}

- (void)setAuthorizationVersion:(unint64_t)a3
{
  self->_authorizationVersion = a3;
}

- (id)descriptionWithRespectToService:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v5, "appendString:", @"ReqResult(");
  if (v4
    && (objc_msgSend(v4, "authorizationRightStateForValue:reason:", -[TCCDRequestResult authorizationValue](self, "authorizationValue"), -[TCCDRequestResult authorizationReason](self, "authorizationReason")), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v7 = v6;
    v8 = [v6 description];
    [v5 appendFormat:@"Auth Right: %@", v8];
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", @"Auth Value: 0x%llx", -[TCCDRequestResult authorizationValue](self, "authorizationValue"));
  }
  [v5 appendString:@", "];
  objc_msgSend(v5, "appendFormat:", @"promptType: %lu,", -[TCCDRequestResult promptType](self, "promptType"));
  v9 = [(TCCDRequestResult *)self error];

  if (v9)
  {
    id v10 = [(TCCDRequestResult *)self error];
    v11 = [v10 localizedDescription];
    [v5 appendFormat:@"error: %@, ", v11];
  }
  [v5 appendString:@"DB Action:"];
  if ([(TCCDRequestResult *)self databaseAction])
  {
    if ((id)[(TCCDRequestResult *)self databaseAction] == (id)1)
    {
      CFStringRef v12 = @"Update";
    }
    else
    {
      if ((id)[(TCCDRequestResult *)self databaseAction] != (id)2) {
        goto LABEL_14;
      }
      CFStringRef v12 = @"Retry";
    }
  }
  else
  {
    CFStringRef v12 = @"None";
  }
  [v5 appendString:v12];
LABEL_14:
  if ([(TCCDRequestResult *)self doUpdateOfSubjectVerifierData]) {
    [v5 appendString:@", UpdateVerifierData"];
  }
  [v5 appendString:@""]);
  id v13 = [v5 copy];

  return v13;
}

- (int)doUpdateOfSubjectVerifierData
{
  return self->_doUpdateOfSubjectVerifierData;
}

- (void)setLastReminderTime:(int)a3
{
  self->_lastReminderTime = a3;
}

- (void)setDatabaseFlags:(unsigned int)a3
{
  self->_databaseFlags = a3;
}

+ (void)populateReplyMessageToDeny:(id)a3 withError:(id)a4
{
  id v5 = a4;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, "result", 0);
  xpc_dictionary_set_uint64(xdict, "auth_value", 0);
  xpc_dictionary_set_uint64(xdict, "auth_reason", 1uLL);
  id v6 = [v5 localizedDescription];
  xpc_dictionary_set_string(xdict, "auth_error_string", (const char *)[v6 UTF8String]);

  id v7 = [v5 code];
  xpc_dictionary_set_uint64(xdict, "auth_error_code", (uint64_t)v7);
}

- (void)denyAuthorizationWithErrorCode:(int64_t)a3 format:(id)a4
{
  id v6 = a4;
  [(TCCDRequestResult *)self setAuthorizationValue:0];
  [(TCCDRequestResult *)self setAuthorizationReason:1];
  [(TCCDRequestResult *)self setDatabaseAction:0];
  id v7 = +[TCCDServer newErrorWithCode:a3 format:v6 arguments:&v11];

  [(TCCDRequestResult *)self setError:v7];
  v8 = +[TCCDPlatform currentPlatform];
  v9 = [v8 server];
  id v10 = [v9 logHandle];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100051900(self, v10);
  }
}

- (id)description
{
  return [(TCCDRequestResult *)self descriptionWithRespectToService:0];
}

- (unint64_t)previousAuthorization
{
  return self->_previousAuthorization;
}

- (void)setPreviousAuthorization:(unint64_t)a3
{
  self->_previousAuthorization = a3;
}

- (int)v1AuthorizationUpgrade
{
  return self->_v1AuthorizationUpgrade;
}

- (void)setV1AuthorizationUpgrade:(int)a3
{
  self->_v1AuthorizationUpgrade = a3;
}

- (unint64_t)v1AuthorizationValue
{
  return self->_v1AuthorizationValue;
}

- (void)setV1AuthorizationValue:(unint64_t)a3
{
  self->_v1AuthorizationValue = a3;
}

- (unint64_t)v1AuthorizationReason
{
  return self->_v1AuthorizationReason;
}

- (void)setV1AuthorizationReason:(unint64_t)a3
{
  self->_v1AuthorizationReason = a3;
}

- (void)setError:(id)a3
{
}

- (int64_t)servicePolicyAction
{
  return self->_servicePolicyAction;
}

- (void)setServicePolicyAction:(int64_t)a3
{
  self->_servicePolicyAction = a3;
}

- (NSString)servicePolicyActionDescription
{
  return self->_servicePolicyActionDescription;
}

- (void)setServicePolicyActionDescription:(id)a3
{
}

- (NSString)servicePolicyActionKeyName
{
  return self->_servicePolicyActionKeyName;
}

- (void)setServicePolicyActionKeyName:(id)a3
{
}

- (void)setDoUpdateOfSubjectVerifierData:(int)a3
{
  self->_doUpdateOfSubjectVerifierData = a3;
}

- (unsigned)databaseFlags
{
  return self->_databaseFlags;
}

- (int)lastReminderTime
{
  return self->_lastReminderTime;
}

@end