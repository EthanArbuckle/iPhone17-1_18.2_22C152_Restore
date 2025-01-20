@interface POConstantCoreUtil
+ (__CFString)algorithmForString:(id)a3;
+ (id)stringForEncryptionAlgorithm:(id)a3;
+ (id)stringForKeyType:(int64_t)a3;
+ (id)stringForLoginPolicy:(unint64_t)a3;
+ (id)stringForLoginPolicyState:(unint64_t)a3;
+ (id)stringForLoginResult:(unint64_t)a3;
+ (id)stringForLoginType:(unint64_t)a3;
+ (id)stringForSEPBiometricPolicy:(unint64_t)a3;
+ (id)stringForSigningAlgorithm:(id)a3;
+ (id)stringForUserAuthorizationMode:(int64_t)a3;
+ (id)stringForUserState:(int64_t)a3;
+ (int64_t)userAuthorizationModeWithString:(id)a3;
@end

@implementation POConstantCoreUtil

+ (id)stringForSEPBiometricPolicy:(unint64_t)a3
{
  if (!a3)
  {
    v5 = @"None";
    goto LABEL_19;
  }
  BOOL v4 = (a3 & 1) == 0;
  if (a3)
  {
    v7 = [&stru_2707C1488 stringByAppendingString:@"TouchIDOrWatchCurrentSet"];
    v5 = v7;
    if ((a3 & 2) != 0)
    {
      v6 = [(__CFString *)v7 stringByAppendingString:@","];

      goto LABEL_11;
    }
LABEL_7:
    if ((a3 & 4) == 0) {
      goto LABEL_15;
    }
    if ((a3 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v5 = &stru_2707C1488;
  v6 = &stru_2707C1488;
  if ((a3 & 2) == 0) {
    goto LABEL_7;
  }
LABEL_11:
  v5 = [(__CFString *)v6 stringByAppendingString:@"TouchIDOrWatchAny"];

  if ((a3 & 4) == 0)
  {
    BOOL v4 = 0;
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = [(__CFString *)v5 stringByAppendingString:@","];

  v5 = (__CFString *)v8;
LABEL_14:
  uint64_t v9 = [(__CFString *)v5 stringByAppendingString:@"ReuseDuringUnlock"];

  BOOL v4 = 0;
  v5 = (__CFString *)v9;
LABEL_15:
  if ((a3 & 8) != 0)
  {
    if (!v4)
    {
      uint64_t v10 = [(__CFString *)v5 stringByAppendingString:@","];

      v5 = (__CFString *)v10;
    }
    uint64_t v11 = [(__CFString *)v5 stringByAppendingString:@"PasswordFallback"];

    v5 = (__CFString *)v11;
  }
LABEL_19:
  v12 = NSString;
  v13 = [NSNumber numberWithUnsignedInteger:a3];
  v14 = [v12 stringWithFormat:@"%@ (%@)", v5, v13];

  return v14;
}

+ (id)stringForLoginType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v3 = @"POLoginTypeNone";
      break;
    case 1uLL:
      v3 = @"POLoginTypePassword";
      break;
    case 2uLL:
      v3 = @"POLoginTypeUserSecureEnclaveKey";
      break;
    case 3uLL:
      v3 = @"POLoginTypeSmartCard";
      break;
    default:
      BOOL v4 = @"POLoginTypePlatformSSOToken";
      if (a3 != 101) {
        BOOL v4 = 0;
      }
      if (a3 == 100) {
        v3 = @"POLoginTypeRefresh";
      }
      else {
        v3 = v4;
      }
      break;
  }
  v5 = NSString;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v7 = [v5 stringWithFormat:@"%@ (%@)", v3, v6];

  return v7;
}

+ (id)stringForUserState:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    v3 = 0;
  }
  else {
    v3 = off_265463D20[a3];
  }
  BOOL v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

+ (id)stringForLoginResult:(unint64_t)a3
{
  if (a3 > 6) {
    v3 = 0;
  }
  else {
    v3 = off_265463D58[a3];
  }
  BOOL v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

+ (id)stringForKeyType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13) {
    return 0;
  }
  else {
    return off_265463D90[a3 - 1];
  }
}

+ (__CFString)algorithmForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ECIESEncryptionStandardX963SHA512AESGCM"])
  {
    BOOL v4 = (__CFString **)MEMORY[0x263F17330];
LABEL_5:
    v5 = *v4;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"ECIESEncryptionStandardX963SHA384AESGCM"])
  {
    BOOL v4 = (__CFString **)MEMORY[0x263F17328];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"ECIESEncryptionStandardX963SHA256AESGCM"]) {
    v5 = (__CFString *)*MEMORY[0x263F17320];
  }
  else {
    v5 = 0;
  }
LABEL_9:

  return v5;
}

+ (int64_t)userAuthorizationModeWithString:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 lowercaseString];
  char v5 = [v4 isEqualToString:@"none"];

  if (v5)
  {
    int64_t v6 = 0;
  }
  else
  {
    v7 = [v3 lowercaseString];
    char v8 = [v7 isEqualToString:@"standard"];

    if (v8)
    {
      int64_t v6 = 1;
    }
    else
    {
      uint64_t v9 = [v3 lowercaseString];
      char v10 = [v9 isEqualToString:@"admin"];

      if (v10)
      {
        int64_t v6 = 2;
      }
      else
      {
        uint64_t v11 = [v3 lowercaseString];
        int v12 = [v11 isEqualToString:@"groups"];

        if (v12) {
          int64_t v6 = 3;
        }
        else {
          int64_t v6 = 0;
        }
      }
    }
  }

  return v6;
}

+ (id)stringForUserAuthorizationMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_265463E30[a3];
  }
}

+ (id)stringForSigningAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:0x2707DBB50])
  {
    BOOL v4 = @"ES256";
  }
  else if ([v3 isEqualToNumber:0x2707DBB68])
  {
    BOOL v4 = @"ES384";
  }
  else if ([v3 isEqualToNumber:0x2707DBB80])
  {
    BOOL v4 = @"Ed25519";
  }
  else if (v3)
  {
    BOOL v4 = @"unknown signing algorithm";
  }
  else
  {
    BOOL v4 = @"none";
  }

  return v4;
}

+ (id)stringForEncryptionAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:0x2707DBB50])
  {
    BOOL v4 = @"ECDHE-A256GCM";
  }
  else if ([v3 isEqualToNumber:0x2707DBB68])
  {
    BOOL v4 = @"HPKE-P256-SHA256-A256GCM";
  }
  else if ([v3 isEqualToNumber:0x2707DBB80])
  {
    BOOL v4 = @"HPKE-P384-SHA384-A256GCM";
  }
  else if ([v3 isEqualToNumber:0x2707DBB98])
  {
    BOOL v4 = @"HPKE-X25519-SHA256-ChaCha20Poly1305";
  }
  else if (v3)
  {
    BOOL v4 = @"unknown encryption algorithm";
  }
  else
  {
    BOOL v4 = @"none";
  }

  return v4;
}

+ (id)stringForLoginPolicy:(unint64_t)a3
{
  if (!a3)
  {
    char v5 = @"None";
    goto LABEL_24;
  }
  BOOL v4 = (a3 & 1) == 0;
  if (a3)
  {
    v7 = [&stru_2707C1488 stringByAppendingString:@"AttemptAuthentication"];
    char v5 = v7;
    if ((a3 & 2) != 0)
    {
      int64_t v6 = [(__CFString *)v7 stringByAppendingString:@","];

      goto LABEL_11;
    }
  }
  else
  {
    char v5 = &stru_2707C1488;
    int64_t v6 = &stru_2707C1488;
    if ((a3 & 2) != 0)
    {
LABEL_11:
      char v5 = [(__CFString *)v6 stringByAppendingString:@"RequireAuthentication"];

      if ((a3 & 4) == 0)
      {
        BOOL v4 = 0;
LABEL_13:
        if ((a3 & 8) == 0) {
          goto LABEL_14;
        }
        goto LABEL_19;
      }
LABEL_17:
      uint64_t v8 = [(__CFString *)v5 stringByAppendingString:@","];

      char v5 = (__CFString *)v8;
      goto LABEL_18;
    }
  }
  if ((a3 & 4) == 0) {
    goto LABEL_13;
  }
  if (a3) {
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v9 = [(__CFString *)v5 stringByAppendingString:@"AllowOfflineGracePeriod"];

  BOOL v4 = 0;
  char v5 = (__CFString *)v9;
  if ((a3 & 8) == 0)
  {
LABEL_14:
    if ((a3 & 0x10) == 0) {
      goto LABEL_24;
    }
    if (v4) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_19:
  if (!v4)
  {
    uint64_t v10 = [(__CFString *)v5 stringByAppendingString:@","];

    char v5 = (__CFString *)v10;
  }
  uint64_t v11 = [(__CFString *)v5 stringByAppendingString:@"AllowAuthenticationGracePeriod"];

  char v5 = (__CFString *)v11;
  if ((a3 & 0x10) != 0)
  {
LABEL_22:
    uint64_t v12 = [(__CFString *)v5 stringByAppendingString:@","];

    char v5 = (__CFString *)v12;
LABEL_23:
    uint64_t v13 = [(__CFString *)v5 stringByAppendingString:@"AllowTouchIDOrWatchForUnlock"];

    char v5 = (__CFString *)v13;
  }
LABEL_24:
  v14 = NSString;
  v15 = [NSNumber numberWithUnsignedInteger:a3];
  v16 = [v14 stringWithFormat:@"%@ (%@)", v5, v15];

  return v16;
}

+ (id)stringForLoginPolicyState:(unint64_t)a3
{
  if (a3 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_265463E50[a3];
  }
  BOOL v4 = NSString;
  char v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  int64_t v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

@end