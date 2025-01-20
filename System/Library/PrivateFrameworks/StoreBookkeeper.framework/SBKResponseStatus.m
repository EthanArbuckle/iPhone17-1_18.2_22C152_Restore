@interface SBKResponseStatus
+ (id)responseStatusForStatusCodeNumber:(id)a3;
- (BOOL)isAuthenticationError;
- (BOOL)isError;
- (BOOL)isGenericError;
- (BOOL)isPuntedError;
- (BOOL)isRecoverable;
- (BOOL)isSuccess;
- (BOOL)isUnsupportedClient;
- (BOOL)isValidationError;
- (BOOL)shouldFileRadar;
- (NSError)requestError;
- (NSString)consoleDescription;
- (SBKResponseStatus)initWithStatus:(int64_t)a3 isRecoverable:(BOOL)a4 isError:(BOOL)a5 consoleDescription:(id)a6 shouldFileRadar:(BOOL)a7;
- (int64_t)statusCode;
@end

@implementation SBKResponseStatus

- (void).cxx_destruct
{
}

- (BOOL)isPuntedError
{
  return self->_isPuntedError;
}

- (BOOL)shouldFileRadar
{
  return self->_shouldFileRadar;
}

- (BOOL)isError
{
  return self->_isError;
}

- (BOOL)isRecoverable
{
  return self->_isRecoverable;
}

- (NSString)consoleDescription
{
  return self->_consoleDescription;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (BOOL)isGenericError
{
  int64_t statusCode = self->_statusCode;
  return statusCode == -3 || statusCode == 1199;
}

- (BOOL)isValidationError
{
  return self->_statusCode == -2;
}

- (BOOL)isAuthenticationError
{
  return self->_statusCode == -4;
}

- (BOOL)isUnsupportedClient
{
  return self->_statusCode == 1101;
}

- (NSError)requestError
{
  if ([(SBKResponseStatus *)self isSuccess])
  {
    v3 = 0;
  }
  else
  {
    v4 = NSString;
    consoleDescription = self->_consoleDescription;
    uint64_t v6 = [NSNumber numberWithInteger:self->_statusCode];
    v7 = (void *)v6;
    if (self->_shouldFileRadar) {
      v8 = @" Please enable logging and file a bug.";
    }
    else {
      v8 = &stru_26DF10968;
    }
    v9 = [v4 stringWithFormat:@"%@ (status = %@)%@", consoleDescription, v6, v8];

    v10 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x263F08320], 0);
    v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SBKBookkeeperRequestErrorDomain" code:self->_statusCode userInfo:v10];
  }
  return (NSError *)v3;
}

- (BOOL)isSuccess
{
  return self->_statusCode == 0;
}

- (SBKResponseStatus)initWithStatus:(int64_t)a3 isRecoverable:(BOOL)a4 isError:(BOOL)a5 consoleDescription:(id)a6 shouldFileRadar:(BOOL)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBKResponseStatus;
  v14 = [(SBKResponseStatus *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_int64_t statusCode = a3;
    v14->_isRecoverable = a4;
    v14->_isError = a5;
    objc_storeStrong((id *)&v14->_consoleDescription, a6);
    v15->_shouldFileRadar = a7;
  }

  return v15;
}

+ (id)responseStatusForStatusCodeNumber:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (responseStatusForStatusCodeNumber__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      uint64_t v5 = [v4 integerValue];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&responseStatusForStatusCodeNumber__onceToken, &__block_literal_global_2242);
    if (v4) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = -1;
LABEL_6:
  uint64_t v6 = (void *)responseStatusForStatusCodeNumber____statusInfo;
  v7 = [NSNumber numberWithInteger:v5];
  v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    v8 = [(id)responseStatusForStatusCodeNumber____statusInfo objectForKey:&unk_26DF16B90];
  }

  return v8;
}

void __55__SBKResponseStatus_responseStatusForStatusCodeNumber___block_invoke()
{
  v15[12] = *MEMORY[0x263EF8340];
  v14[0] = &unk_26DF16BA8;
  id v13 = [[SBKResponseStatus alloc] initWithStatus:0 isRecoverable:1 isError:0 consoleDescription:@"Success" shouldFileRadar:0];
  v15[0] = v13;
  v14[1] = &unk_26DF16BC0;
  v12 = [[SBKResponseStatus alloc] initWithStatus:-1 isRecoverable:0 isError:1 consoleDescription:@"Unknown server initialization error" shouldFileRadar:1];
  v15[1] = v12;
  v14[2] = &unk_26DF16BD8;
  v0 = [[SBKResponseStatus alloc] initWithStatus:-2 isRecoverable:0 isError:1 consoleDescription:@"The request format was invalid, or referenced an invalid domain" shouldFileRadar:1];
  v15[2] = v0;
  v14[3] = &unk_26DF16BF0;
  v1 = [[SBKResponseStatus alloc] initWithStatus:-3 isRecoverable:0 isError:1 consoleDescription:@"An unspecified server-side error (type 1) was encountered" shouldFileRadar:1];
  v15[3] = v1;
  v14[4] = &unk_26DF16C08;
  v2 = [[SBKResponseStatus alloc] initWithStatus:-4 isRecoverable:0 isError:1 consoleDescription:@"The request requires an authenticated weak-token" shouldFileRadar:0];
  v15[4] = v2;
  v14[5] = &unk_26DF16C20;
  id v3 = [[SBKResponseStatus alloc] initWithStatus:1197 isRecoverable:0 isError:1 consoleDescription:@"The request deniend (punted - server too busy)" shouldFileRadar:0];
  v15[5] = v3;
  v14[6] = &unk_26DF16C38;
  v4 = [[SBKResponseStatus alloc] initWithStatus:1195 isRecoverable:0 isError:1 consoleDescription:@"The request denied (too many recent request)" shouldFileRadar:0];
  v15[6] = v4;
  v14[7] = &unk_26DF16B90;
  uint64_t v5 = [[SBKResponseStatus alloc] initWithStatus:-9999 isRecoverable:0 isError:1 consoleDescription:@"Unknown status" shouldFileRadar:1];
  v15[7] = v5;
  v14[8] = &unk_26DF16C50;
  uint64_t v6 = [[SBKResponseStatus alloc] initWithStatus:1199 isRecoverable:0 isError:1 consoleDescription:@"An unspecified server-side error (type 2) was encountered" shouldFileRadar:1];
  v15[8] = v6;
  v14[9] = &unk_26DF16C68;
  v7 = [[SBKResponseStatus alloc] initWithStatus:1101 isRecoverable:0 isError:1 consoleDescription:@"The client's user agent is not supported" shouldFileRadar:1];
  v15[9] = v7;
  v14[10] = &unk_26DF16C80;
  v8 = [[SBKResponseStatus alloc] initWithStatus:1198 isRecoverable:0 isError:1 consoleDescription:@"The putAll had a version mismatch" shouldFileRadar:0];
  v15[10] = v8;
  v14[11] = &unk_26DF16C98;
  v9 = [[SBKResponseStatus alloc] initWithStatus:1196 isRecoverable:0 isError:1 consoleDescription:@"The domain specified in the request is locked" shouldFileRadar:1];
  v15[11] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:12];
  v11 = (void *)responseStatusForStatusCodeNumber____statusInfo;
  responseStatusForStatusCodeNumber____statusInfo = v10;
}

@end