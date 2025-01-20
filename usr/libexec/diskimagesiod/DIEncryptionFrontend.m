@interface DIEncryptionFrontend
+ (BOOL)hasGUIaccess;
+ (BOOL)supportsSecureCoding;
+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5;
- (BOOL)GUIAskForPassphraseWithError:(id *)a3;
- (BOOL)allowStoringInKeychain;
- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4;
- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4;
- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4;
- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5;
- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (DIBaseParams)diParams;
- (DIEncryptionFrontend)initWithCoder:(id)a3;
- (DIEncryptionFrontend)initWithParams:(id)a3;
- (NSString)CLIPassphrasePrompt;
- (NSString)CLIVerifyPassphrasePrompt;
- (NSString)GUIPassphraseLabel;
- (NSString)GUIPassphrasePrompt;
- (NSString)GUIVerifyPassphraseLabel;
- (NSUUID)encryptionUUID;
- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4;
- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowStoringInKeychain:(BOOL)a3;
@end

@implementation DIEncryptionFrontend

- (DIEncryptionFrontend)initWithParams:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIEncryptionFrontend;
  v6 = [(DIEncryptionFrontend *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diParams, a3);
    if ([(DIEncryptionFrontend *)v7 validateDeserializationWithError:0])
    {
      uint64_t v8 = [v5 encryptionUUID];
      encryptionUUID = v7->_encryptionUUID;
      v7->_encryptionUUID = (NSUUID *)v8;
    }
  }

  return v7;
}

- (unint64_t)flags
{
  v2 = [(DIEncryptionFrontend *)self diParams];
  unint64_t v3 = (unint64_t)[v2 readPassphraseFlags];

  int v4 = isatty(0);
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 8;
  }
  unint64_t v6 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  if (v4) {
    unint64_t v6 = v3;
  }
  if ((v3 & 8) != 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  if (+[DIEncryptionFrontend hasGUIaccess]) {
    return v7;
  }
  else {
    return v7 & 0xFFFFFFFFFFFFFFFBLL;
  }
}

- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4
{
  uint64_t v5 = +[NSData dataWithContentsOfFile:a3];
  if (!v5)
  {
    uint64_t v5 = +[DIError nilWithPOSIXCode:*__error() description:@"Failed to read from certificate file " error:a4];
  }

  return v5;
}

- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeRef v11 = 0;
  v12[0] = kSecClass;
  v12[1] = kSecAttrPublicKeyHash;
  v13[0] = kSecClassCertificate;
  v13[1] = v5;
  v12[2] = kSecReturnData;
  v13[2] = &__kCFBooleanTrue;
  unint64_t v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  CFDictionaryRef v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  uint64_t v8 = SecItemCopyMatching(v7, &v11);
  if (v8)
  {
    v9 = +[DIError nilWithOSStatus:v8 verboseInfo:@"Failed to find keychain item using hashed key" error:a4];
  }
  else
  {
    v9 = (void *)v11;
  }

  return v9;
}

- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  int v7 = *__error();
  if (sub_1000D29A0())
  {
    uint64_t v8 = sub_1000D2920();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v30 = 66;
    __int16 v31 = 2080;
    v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
    LODWORD(v28) = 18;
    v27 = buf;
    v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    v10 = sub_1000D2920();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v30 = 66;
      __int16 v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Asking for passphrase using readpassphrase", buf, 0x12u);
    }
  }
  *__error() = v7;
  id v11 = [(DIEncryptionFrontend *)self CLIPassphrasePrompt];
  v12 = (const char *)[v11 UTF8String];
  if (v5) {
    int v13 = 32;
  }
  else {
    int v13 = 2;
  }
  v14 = readpassphrase(v12, __s1, 0x102uLL, v13);

  if (v14)
  {
    if (!v5)
    {
      v15 = [(DIEncryptionFrontend *)self CLIVerifyPassphrasePrompt];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        id v17 = [(DIEncryptionFrontend *)self CLIVerifyPassphrasePrompt];
        v18 = readpassphrase((const char *)[v17 UTF8String], (char *)buf, 0x102uLL, 2);

        if (!v18) {
          return +[DIError failWithPOSIXCode:25 verboseInfo:@"Failed to read passphrase" error:a4];
        }
        if (strncmp(__s1, (const char *)buf, 0x101uLL)) {
          return +[DIError failWithPOSIXCode:80 verboseInfo:@"Passphrases doesn't match" error:a4];
        }
      }
    }
    v20 = [(DIEncryptionFrontend *)self diParams];
    unsigned __int8 v21 = [v20 setPassphrase:__s1 error:a4];
  }
  else
  {
    if (v5) {
      return +[DIError failWithPOSIXCode:25 verboseInfo:@"Failed to read passphrase from stdin" error:a4];
    }
    int v22 = *__error();
    if (sub_1000D29A0())
    {
      v23 = sub_1000D2920();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v30 = 66;
      __int16 v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      v24 = (char *)_os_log_send_and_compose_impl();

      if (v24)
      {
        fprintf(__stderrp, "%s\n", v24);
        free(v24);
      }
    }
    else
    {
      v25 = sub_1000D2920();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v30 = 66;
        __int16 v31 = 2080;
        v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Failed to read passphrase from TTY", buf, 0x12u);
      }
    }
    *__error() = v22;
    return 1;
  }
  return v21;
}

- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4
{
  *a3 = 1;
  return 1;
}

+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(DIEncryptionFrontend *)self diParams];
  v10 = [v9 inputURL];
  id v11 = [v10 path];
  v12 = [v11 lastPathComponent];

  id v13 = v8;
  v14 = (const char *)[v13 UTF8String];
  if (v14 && *v14)
  {
    id v28 = [objc_alloc((Class)NSData) initWithBytes:v14 length:strlen(v14)];
    v37[0] = kSecClassGenericPassword;
    v36[0] = kSecClass;
    v36[1] = kSecAttrAccount;
    v15 = [(DIEncryptionFrontend *)self encryptionUUID];
    BOOL v16 = [v15 UUIDString];
    v37[1] = v16;
    v37[2] = @"disk image password";
    v36[2] = kSecAttrDescription;
    v36[3] = kSecAttrLabel;
    v37[3] = v12;
    v37[4] = v12;
    v36[4] = kSecAttrService;
    v36[5] = kSecAttrSynchronizable;
    v36[6] = kSecValueData;
    v37[5] = &__kCFBooleanTrue;
    v37[6] = v28;
    id v17 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:7];
    v18 = +[NSMutableDictionary dictionaryWithDictionary:v17];

    char v29 = 0;
    if (a4) {
      goto LABEL_28;
    }
    if (![(DIEncryptionFrontend *)self checkWithHasIcloudKeychain:&v29 error:a5])
    {
LABEL_14:
      BOOL v19 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (!v29)
    {
LABEL_28:
      if (!+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:v18 isStoring:1 error:a5])goto LABEL_14; {
    }
      }
    int v20 = *__error();
    if (sub_1000D29A0())
    {
      unsigned __int8 v21 = sub_1000D2920();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      int v22 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v31 = 80;
      v33 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
      __int16 v32 = 2080;
      if (!v29) {
        int v22 = "system";
      }
      __int16 v34 = 2080;
      v35 = v22;
      v23 = (char *)_os_log_send_and_compose_impl();

      if (v23)
      {
        fprintf(__stderrp, "%s\n", v23);
        free(v23);
      }
    }
    else
    {
      v24 = sub_1000D2920();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (v29) {
          v25 = "iCloud";
        }
        else {
          v25 = "system";
        }
        *(_DWORD *)buf = 68158210;
        int v31 = 80;
        __int16 v32 = 2080;
        v33 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
        __int16 v34 = 2080;
        v35 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%.*s: Storing passphrase in the %s keychain", buf, 0x1Cu);
      }
    }
    *__error() = v20;
    uint64_t v26 = SecItemAdd((CFDictionaryRef)v18, 0);
    if (v26) {
      BOOL v19 = +[DIError failWithOSStatus:v26 description:@"Failed to store the passphrase in the keychain" error:a5];
    }
    else {
      BOOL v19 = 1;
    }
    goto LABEL_24;
  }
  BOOL v19 = +[DIError failWithEnumValue:154 verboseInfo:@"Cannot store an empty passphrase" error:a5];
LABEL_25:

  return v19;
}

- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4
{
  if (![(DIEncryptionFrontend *)self allowStoringInKeychain]) {
    return 1;
  }
  int v6 = *__error();
  if (sub_1000D29A0())
  {
    *(void *)error = 0;
    int v7 = sub_1000D2920();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&uint8_t buf[4] = 64;
    __int16 v21 = 2080;
    int v22 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
    id v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    v9 = sub_1000D2920();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&uint8_t buf[4] = 64;
      __int16 v21 = 2080;
      int v22 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Asking user permission to store the passphrase in the keychain", buf, 0x12u);
    }
  }
  *__error() = v6;
  error[0] = 0;
  v18[0] = kCFUserNotificationAlertHeaderKey;
  v18[1] = kCFUserNotificationDefaultButtonTitleKey;
  v19[0] = @"Remember password in my keychain?";
  v19[1] = @"Yes";
  v18[2] = kCFUserNotificationOtherButtonTitleKey;
  v18[3] = kCFUserNotificationAlternateButtonTitleKey;
  v19[2] = @"No";
  v19[3] = @"Cancel";
  CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  id v11 = CFUserNotificationCreate(0, 0.0, 3uLL, error, v10);
  v12 = v11;
  if (!v11)
  {
    v15 = +[NSString stringWithFormat:@"CFUserNotificationCreate failed, error code %d", error[0]];
    BOOL v14 = +[DIError failWithEnumValue:154 verboseInfo:v15 error:a4];

    return v14;
  }
  *(void *)buf = 0;
  if (!CFUserNotificationReceiveResponse(v11, 0.0, (CFOptionFlags *)buf))
  {
    if (*(void *)buf != 2)
    {
      if (*(void *)buf)
      {
        unsigned __int8 v13 = +[DIError failWithPOSIXCode:89 description:@"The operation was cancelled by the user" error:a4];
        goto LABEL_11;
      }
      *a3 = 1;
    }

    return 1;
  }
  unsigned __int8 v13 = +[DIError failWithEnumValue:154 verboseInfo:@"CFUserNotificationReceiveResponse failed" error:a4];
LABEL_11:
  BOOL v14 = v13;

  return v14;
}

- (BOOL)GUIAskForPassphraseWithError:(id *)a3
{
  SInt32 error = 0;
  BOOL v5 = [(DIEncryptionFrontend *)self GUIPassphraseLabel];
  int v6 = +[NSMutableArray arrayWithObject:v5];

  int v7 = [(DIEncryptionFrontend *)self GUIVerifyPassphraseLabel];
  CFOptionFlags v8 = 65539;

  if (v7)
  {
    v9 = [(DIEncryptionFrontend *)self GUIVerifyPassphraseLabel];
    [v6 addObject:v9];

    CFOptionFlags v8 = 196611;
  }
  v28[0] = kCFUserNotificationAlertHeaderKey;
  CFDictionaryRef v10 = [(DIEncryptionFrontend *)self GUIPassphrasePrompt];
  v29[0] = v10;
  v29[1] = @"OK";
  v28[1] = kCFUserNotificationDefaultButtonTitleKey;
  v28[2] = kCFUserNotificationAlternateButtonTitleKey;
  v28[3] = kCFUserNotificationTextFieldTitlesKey;
  v29[2] = @"Cancel";
  v29[3] = v6;
  id v11 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
  CFDictionaryRef v12 = +[NSMutableDictionary dictionaryWithDictionary:v11];

  unsigned __int8 v13 = CFUserNotificationCreate(0, 0.0, v8, &error, v12);
  BOOL v14 = v13;
  if (!v13)
  {
    BOOL v16 = +[NSString stringWithFormat:@"CFUserNotificationCreate failed, error code %d", error];
    BOOL v15 = +[DIError failWithEnumValue:154 verboseInfo:v16 error:a3];

    goto LABEL_24;
  }
  CFOptionFlags responseFlags = 0;
  if (!CFUserNotificationReceiveResponse(v13, 0.0, &responseFlags))
  {
    char v25 = BYTE1(responseFlags) & 1;
    if ((responseFlags & 3) != 0)
    {
      id v17 = 0;
      unsigned __int8 v18 = +[DIError failWithPOSIXCode:89 description:@"The operation was cancelled by the user" error:a3];
    }
    else
    {
      CFUserNotificationGetResponseValue(v14, kCFUserNotificationTextFieldValuesKey, 0);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        BOOL v19 = CFUserNotificationGetResponseValue(v14, kCFUserNotificationTextFieldValuesKey, 1);
        if (![v17 isEqualToString:v19])
        {
          BOOL v15 = +[DIError failWithPOSIXCode:80 description:@"Passwords don’t match" error:a3];

          goto LABEL_23;
        }
      }
      int v20 = [(DIEncryptionFrontend *)self diParams];
      id v17 = v17;
      unsigned __int8 v21 = [v20 setPassphrase:[v17 UTF8String] error:a3];

      if ((v21 & 1) == 0
        || ![(DIEncryptionFrontend *)self askPermissionWithRememberPassword:&v25 error:a3])
      {
        BOOL v15 = 0;
        goto LABEL_23;
      }
      unsigned int v22 = [(DIEncryptionFrontend *)self allowStoringInKeychain];
      if (v25) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = 0;
      }
      if (v23 != 1)
      {
        BOOL v15 = 1;
        goto LABEL_23;
      }
      unsigned __int8 v18 = [(DIEncryptionFrontend *)self storeInKeychainWithPassphrase:v17 forceSystemKeychain:0 error:a3];
    }
    BOOL v15 = v18;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v15 = +[DIError failWithEnumValue:154 verboseInfo:@"CFUserNotificationReceiveResponse failed" error:a3];
LABEL_24:

  return v15;
}

+ (BOOL)hasGUIaccess
{
  return 1;
}

- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 validateDeserializationWithError:a4];
  if (v7)
  {
    CFOptionFlags v8 = [v6 diParams];
    v9 = [v8 diskImageParamsXPC];
    CFDictionaryRef v10 = [(DIEncryptionFrontend *)self diParams];
    [v10 setDiskImageParamsXPC:v9];

    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", [v6 allowStoringInKeychain]);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIEncryptionFrontend)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diParams"];
  id v6 = [(DIEncryptionFrontend *)self initWithParams:v5];
  if (v6) {
    v6->_allowStoringInKeychain = [v4 decodeBoolForKey:@"allowStoringInKeychain"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(DIEncryptionFrontend *)self diParams];
  [v5 encodeObject:v4 forKey:@"diParams"];

  [v5 encodeBool:-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain") forKey:@"allowStoringInKeychain"];
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  id v4 = [(DIEncryptionFrontend *)self diParams];
  LOBYTE(a3) = [v4 validateDeserializationWithError:a3];

  return (char)a3;
}

- (NSString)GUIPassphrasePrompt
{
  return self->_GUIPassphrasePrompt;
}

- (NSString)GUIPassphraseLabel
{
  return self->_GUIPassphraseLabel;
}

- (NSString)GUIVerifyPassphraseLabel
{
  return self->_GUIVerifyPassphraseLabel;
}

- (NSString)CLIPassphrasePrompt
{
  return self->_CLIPassphrasePrompt;
}

- (NSString)CLIVerifyPassphrasePrompt
{
  return self->_CLIVerifyPassphrasePrompt;
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (NSUUID)encryptionUUID
{
  return self->_encryptionUUID;
}

- (BOOL)allowStoringInKeychain
{
  return self->_allowStoringInKeychain;
}

- (void)setAllowStoringInKeychain:(BOOL)a3
{
  self->_allowStoringInKeychain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionUUID, 0);
  objc_storeStrong((id *)&self->_diParams, 0);
  objc_storeStrong((id *)&self->_CLIVerifyPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_CLIPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_GUIVerifyPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphraseLabel, 0);

  objc_storeStrong((id *)&self->_GUIPassphrasePrompt, 0);
}

@end