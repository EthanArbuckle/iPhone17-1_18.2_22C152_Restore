@interface _MFNewcastleAuthenticator
- (BOOL)justSentPlainTextPassword;
- (BOOL)supportsInitialClientResponse;
- (BOOL)useATOKEN2Authentication;
- (CastleIMAPAccount)castleAccount;
- (_MFNewcastleAuthenticator)initWithAuthenticationScheme:(id)a3 account:(id)a4 connection:(id)a5;
- (id)responseForServerData:(id)a3;
- (id)responseForServerDataATOKEN2:(id)a3;
- (id)responseForServerDataATOKEN:(id)a3;
- (id)saslName;
- (void)setCastleAccount:(id)a3;
@end

@implementation _MFNewcastleAuthenticator

- (_MFNewcastleAuthenticator)initWithAuthenticationScheme:(id)a3 account:(id)a4 connection:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_MFNewcastleAuthenticator;
  v11 = [(ECSASLAuthenticator *)&v18 initWithAuthenticationScheme:v8 account:v9 connection:v10];
  if (!v11) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    v14 = [v9 mailAccountIfAvailable];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      castleAccount = v11->_castleAccount;
      v11->_castleAccount = v14;
      goto LABEL_4;
    }
    v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "#Warning couldn't find our CastleAccount for our sending account: %@", buf, 0xCu);
    }

LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v12 = (CastleIMAPAccount *)v9;
  castleAccount = v11->_castleAccount;
  v11->_castleAccount = v12;
LABEL_4:

LABEL_8:
  v15 = v11;
LABEL_13:

  return v15;
}

- (id)saslName
{
  if ([(_MFNewcastleAuthenticator *)self useATOKEN2Authentication]) {
    v2 = @"ATOKEN2";
  }
  else {
    v2 = @"ATOKEN";
  }
  return v2;
}

- (BOOL)supportsInitialClientResponse
{
  return 1;
}

- (id)responseForServerData:(id)a3
{
  id v4 = a3;
  if ([(_MFNewcastleAuthenticator *)self useATOKEN2Authentication]) {
    [(_MFNewcastleAuthenticator *)self responseForServerDataATOKEN2:v4];
  }
  else {
  v5 = [(_MFNewcastleAuthenticator *)self responseForServerDataATOKEN:v4];
  }

  return v5;
}

- (id)responseForServerDataATOKEN:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "-[NewcastleAuthentication responseForServerDataATOKEN]", buf, 2u);
  }

  if ([(ECSASLAuthenticator *)self authenticationState] == 4) {
    goto LABEL_6;
  }
  if (self->_sentResponse)
  {
    [(ECSASLAuthenticator *)self setAuthenticationState:3];
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v7 = [(_MFNewcastleAuthenticator *)self castleAccount];
  id v8 = [v7 personID];
  uint64_t v21 = [v8 dataUsingEncoding:4];

  id v9 = [(_MFNewcastleAuthenticator *)self castleAccount];
  id v10 = [v9 authToken];
  v11 = [v10 dataUsingEncoding:4];

  if (v11 && v21)
  {
    v12 = [(_MFNewcastleAuthenticator *)self castleAccount];
    v13 = [v12 anisetteDataWithError:0];

    if (v13)
    {
      v14 = [v13 machineID];
      v15 = [v14 dataUsingEncoding:4];

      v16 = [v13 oneTimePassword];
      v17 = [v16 dataUsingEncoding:4];
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    if ([v15 length] && objc_msgSend(v17, "length"))
    {
      objc_super v18 = [(_MFNewcastleAuthenticator *)self castleAccount];
      v19 = [v18 clientInfo];
      id v20 = [v19 dataUsingEncoding:4];

      if ([v20 length])
      {
        v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v21, "length")+ objc_msgSend(v11, "length")+ objc_msgSend(v15, "length")+ objc_msgSend(v17, "length")+ objc_msgSend(v20, "length")+ 5);
        char v22 = 0;
        [v5 appendBytes:&v22 length:1];
        [v5 appendData:v21];
        [v5 appendBytes:&v22 length:1];
        [v5 appendData:v11];
        [v5 appendBytes:&v22 length:1];
        [v5 appendData:v15];
        [v5 appendBytes:&v22 length:1];
        [v5 appendData:v17];
        [v5 appendBytes:&v22 length:1];
        [v5 appendData:v20];
        self->_sentResponse = 1;
      }
      else
      {
        [(ECSASLAuthenticator *)self setMissingPasswordError];
        v5 = 0;
      }
    }
    else
    {
      [(ECSASLAuthenticator *)self setMissingPasswordError];
      v5 = 0;
    }
  }
  else
  {
    [(ECSASLAuthenticator *)self setMissingPasswordError];
    v5 = 0;
  }

LABEL_7:
  return v5;
}

- (id)responseForServerDataATOKEN2:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "-[NewcastleAuthentication responseForServerDataATOKEN2]", buf, 2u);
  }

  if ([(ECSASLAuthenticator *)self authenticationState] == 4) {
    goto LABEL_6;
  }
  if (self->_sentResponse)
  {
    [(ECSASLAuthenticator *)self setAuthenticationState:3];
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v7 = [(_MFNewcastleAuthenticator *)self castleAccount];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F60E18] promise];
    id v9 = [(_MFNewcastleAuthenticator *)self castleAccount];
    id v10 = [v8 completionHandlerAdapter];
    [v9 appleID2AuthWithCompletion:v10];

    v11 = [v8 future];
    id v14 = 0;
    v5 = [v11 result:&v14];
    id v12 = v14;

    if (v5)
    {
      self->_sentResponse = 1;
    }
    else
    {
      v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_MFNewcastleAuthenticator responseForServerDataATOKEN2:]((uint64_t)v12, v13);
      }
    }
  }
  else
  {
    id v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Account type not CastleIMAPAccount", v15, 2u);
    }
    v5 = 0;
  }

LABEL_7:
  return v5;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

- (BOOL)useATOKEN2Authentication
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F60D58] currentDevice];
  if ([v3 isInternal])
  {
    id v4 = [MEMORY[0x1E4F60D58] currentDevice];
    char v2 = [v4 isVirtualMachine];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (CastleIMAPAccount)castleAccount
{
  return self->_castleAccount;
}

- (void)setCastleAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)responseForServerDataATOKEN2:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Error getting auth details - %@", (uint8_t *)&v2, 0xCu);
}

@end