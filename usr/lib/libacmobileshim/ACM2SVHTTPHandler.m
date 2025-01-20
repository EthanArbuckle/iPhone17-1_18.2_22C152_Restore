@interface ACM2SVHTTPHandler
- (BOOL)shouldValidateTGTs;
- (id)convertErrorToACMError:(id)a3;
@end

@implementation ACM2SVHTTPHandler

- (BOOL)shouldValidateTGTs
{
  return 0;
}

- (id)convertErrorToACMError:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACM2SVHTTPHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPHandler.m", 27, 0, "Convert error %@ to user-friedly error.", a3);
  }
  v5 = (void *)[a3 domain];
  if ([v5 isEqualToString:@"ACCAppleConnectErrorDomain"]) {
    return a3;
  }
  uint64_t v7 = [a3 localizedFailureReason];
  id v8 = (id)[a3 localizedDescription];
  if ([v5 isEqualToString:@"HTTPServerErrorDomain"])
  {
    uint64_t v9 = [a3 code];
    if (v9 <= -21653)
    {
      if (v9 <= -21664)
      {
        if (v9 == -21673)
        {
          id v8 = +[ACMBaseLocale localizedString:@"You failed to verify the code too many times. Please send a new code to a different device or try again later."];
          unint64_t v10 = -200260;
          goto LABEL_33;
        }
        if (v9 == -21669)
        {
          id v8 = +[ACMBaseLocale localizedString:@"The verification code you entered is not valid."];
          unint64_t v10 = -200250;
          goto LABEL_33;
        }
        goto LABEL_35;
      }
      if (v9 == -21663)
      {
        id v8 = +[ACMBaseLocale localizedString:@"Sorry, but you have made too many unsuccessful attempts to verify your identity. For security reasons, you will not be able to make changes to your account for the next eight hours without your Recovery Key."];
        int v14 = 100;
        goto LABEL_32;
      }
      if (v9 != -21654)
      {
LABEL_35:
        v16 = self;
        v11 = (objc_super *)&v16;
        goto LABEL_14;
      }
    }
    else
    {
      if (v9 > -20624)
      {
        if (v9 != -20623)
        {
          if (v9 == -20600)
          {
            id v8 = +[ACMBaseLocale localizedString:@"Cannot find this person."];
            unint64_t v10 = -200270;
            goto LABEL_33;
          }
          if (v9 == -20100)
          {
            id v8 = +[ACMBaseLocale localizedString:@"Invalid Session."];
            unint64_t v10 = -200220;
            goto LABEL_33;
          }
          goto LABEL_35;
        }
        v13 = @"Device is not found.";
        goto LABEL_28;
      }
      if (v9 != -21652)
      {
        if (v9 == -21651)
        {
          unint64_t v10 = -200310;
          id v8 = +[ACMBaseLocale localizedString:@"Two-step verification has been disabled for the Apple ID account %@."];
          uint64_t v12 = [[-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](self, "context")) userName];
          if (v12) {
            id v8 = [NSString stringWithFormat:v8, v12];
          }
          goto LABEL_33;
        }
        goto LABEL_35;
      }
    }
    v13 = @"No Device information available.";
LABEL_28:
    id v8 = +[ACMBaseLocale localizedString:v13];
    int v14 = 80;
LABEL_32:
    unint64_t v10 = *(void *)&v14 | 0xFFFFFFFFFFFCF18ALL;
    goto LABEL_33;
  }
  v15.receiver = self;
  v11 = &v15;
LABEL_14:
  v11->super_class = (Class)ACM2SVHTTPHandler;
  id result = [(objc_super *)v11 convertErrorToACMError:a3];
  if (result) {
    return result;
  }
  unint64_t v10 = -200200;
LABEL_33:
  id result = (id)[MEMORY[0x263F087E8] errorWithDomain:@"ACCAppleConnectErrorDomain" code:v10 userInfo:objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x263F08608], v8, *MEMORY[0x263F08320], v7, *MEMORY[0x263F08338], 0, v15.receiver)];
  if (!result) {
    return a3;
  }
  return result;
}

@end