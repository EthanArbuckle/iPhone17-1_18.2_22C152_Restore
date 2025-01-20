@interface NSError(VVError)
+ (id)errorWithDomain:()VVError code:localizedDescription:;
+ (id)errorWithStreamDomain:()VVError code:localizedDescription:;
- (BOOL)isConnectivityError;
- (BOOL)isEqualToError:()VVError;
- (BOOL)isExpiredPasswordError;
- (BOOL)isInvalidSubscriberError;
- (BOOL)isNewPasswordError;
- (BOOL)isPasswordMismatchError;
- (BOOL)isSecurityError;
- (BOOL)isServerError;
- (BOOL)isStreamDomain:()VVError error:;
- (uint64_t)shouldPresentErrorForTaskType:()VVError;
@end

@implementation NSError(VVError)

+ (id)errorWithDomain:()VVError code:localizedDescription:
{
  id v7 = a3;
  if (a5)
  {
    v8 = (objc_class *)NSDictionary;
    id v9 = a5;
    id v10 = [v8 alloc];
    a5 = objc_msgSend(v10, "initWithObjectsAndKeys:", v9, *MEMORY[0x263F08320], 0);
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a4 userInfo:a5];

  return v11;
}

+ (id)errorWithStreamDomain:()VVError code:localizedDescription:
{
  if (a3 == 1)
  {
    v8 = (id *)MEMORY[0x263F08438];
LABEL_9:
    id v9 = (__CFString *)*v8;
    goto LABEL_10;
  }
  if (*MEMORY[0x263EFFE90] == a3)
  {
    v8 = (id *)MEMORY[0x263F084C0];
    goto LABEL_9;
  }
  if (*MEMORY[0x263EFC728] == a3)
  {
    v8 = (id *)MEMORY[0x263F08350];
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    v8 = (id *)MEMORY[0x263F08410];
    goto LABEL_9;
  }
  if (*MEMORY[0x263EFC730] == a3)
  {
    id v9 = @"NetDB";
  }
  else
  {
    v12 = @"*Unknown*";
    if (a3 == -1) {
      v12 = @"VVErrorDomain";
    }
    if (*MEMORY[0x263EFC738] == a3) {
      id v9 = @"SystemConfiguration";
    }
    else {
      id v9 = v12;
    }
  }
LABEL_10:
  id v10 = [a1 errorWithDomain:v9 code:a4 localizedDescription:a5];

  return v10;
}

- (BOOL)isEqualToError:()VVError
{
  id v4 = a3;
  v5 = [a1 domain];
  v6 = [v4 domain];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [a1 code];
    BOOL v8 = v7 == [v4 code];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isStreamDomain:()VVError error:
{
  if (a3 == 1)
  {
    v6 = (id *)MEMORY[0x263F08438];
  }
  else if (*MEMORY[0x263EFFE90] == a3)
  {
    v6 = (id *)MEMORY[0x263F084C0];
  }
  else if (*MEMORY[0x263EFC728] == a3)
  {
    v6 = (id *)MEMORY[0x263F08350];
  }
  else
  {
    if (a3 != 2)
    {
      if (*MEMORY[0x263EFC730] == a3)
      {
        uint64_t v7 = @"NetDB";
      }
      else
      {
        v11 = @"*Unknown*";
        if (a3 == -1) {
          v11 = @"VVErrorDomain";
        }
        if (*MEMORY[0x263EFC738] == a3) {
          uint64_t v7 = @"SystemConfiguration";
        }
        else {
          uint64_t v7 = v11;
        }
      }
      goto LABEL_10;
    }
    v6 = (id *)MEMORY[0x263F08410];
  }
  uint64_t v7 = (__CFString *)*v6;
  if (!v7) {
    return 0;
  }
LABEL_10:
  BOOL v8 = [a1 domain];
  if ([(__CFString *)v7 isEqualToString:v8]) {
    BOOL v9 = [a1 code] == a4;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isPasswordMismatchError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"VVErrorDomain"];

  return v3 && (unint64_t)([a1 code] - 1006) > 0xFFFFFFFFFFFFFFFCLL;
}

- (BOOL)isExpiredPasswordError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"VVErrorDomain"]) {
    BOOL v3 = [a1 code] == 1005;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isNewPasswordError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"VVErrorDomain"];

  return v3 && ([a1 code] & 0xFFFFFFFFFFFFFFF8) == 0x400;
}

- (BOOL)isInvalidSubscriberError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"VVErrorDomain"];

  return v3 && [a1 code] == 1006;
}

- (BOOL)isConnectivityError
{
  v2 = [a1 domain];
  int v3 = (void *)_IsStreamErrorDomain___StreamDomains;
  if (!_IsStreamErrorDomain___StreamDomains)
  {
    id v4 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v5 = objc_msgSend(v4, "initWithObjects:", @"*Unknown*", @"SystemConfiguration", @"NetDB", *MEMORY[0x263F08410], *MEMORY[0x263F08350], *MEMORY[0x263F084C0], *MEMORY[0x263F08438], 0);
    v6 = (void *)_IsStreamErrorDomain___StreamDomains;
    _IsStreamErrorDomain___StreamDomains = v5;

    int v3 = (void *)_IsStreamErrorDomain___StreamDomains;
  }
  if ([v3 containsObject:v2]) {
    goto LABEL_4;
  }
  if (![v2 isEqualToString:@"VVErrorDomain"])
  {
    BOOL v7 = 0;
    goto LABEL_9;
  }
  if ([a1 code] == 1011) {
LABEL_4:
  }
    BOOL v7 = 1;
  else {
    BOOL v7 = [a1 code] == 1023;
  }
LABEL_9:

  return v7;
}

- (BOOL)isServerError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"VVErrorDomain"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [a1 code];
  return v4 == 1020 || (unint64_t)(v4 - 1017) < 2;
}

- (BOOL)isSecurityError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F084C0]]) {
    BOOL v3 = [a1 code] == -9829;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)shouldPresentErrorForTaskType:()VVError
{
  uint64_t v3 = 0;
  if (a3 > 7) {
    return v3;
  }
  if (((1 << a3) & 0xCC) != 0)
  {
    if (([a1 isConnectivityError] & 1) == 0)
    {
      uint64_t v5 = [a1 domain];
      if ([v5 isEqualToString:@"VVErrorDomain"]) {
        uint64_t v3 = [a1 isPasswordMismatchError] ^ 1;
      }
      else {
        uint64_t v3 = 0;
      }
LABEL_17:

      return v3;
    }
    return 1;
  }
  if (((1 << a3) & 0x12) == 0)
  {
    if (a3 == 5)
    {
      uint64_t v5 = [a1 domain];
      if ([v5 isEqualToString:@"VVErrorDomain"]) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = [a1 isConnectivityError];
      }
      goto LABEL_17;
    }
    return v3;
  }
  if ([a1 isServerError]) {
    return 1;
  }
  return [a1 isSecurityError];
}

@end