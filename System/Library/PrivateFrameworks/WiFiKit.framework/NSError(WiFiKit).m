@interface NSError(WiFiKit)
+ (id)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:isPrivateMACFailureThresholdMet:;
+ (id)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:userInfo:;
+ (id)associationErrorWithReason:()WiFiKit;
+ (id)scanErrorWithCode:()WiFiKit;
+ (id)scanErrorWithReason:()WiFiKit;
+ (uint64_t)associationErrorWithCode:()WiFiKit isPrivateMACFailureThresholdMet:;
+ (uint64_t)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:;
+ (uint64_t)associationErrorWithReason:()WiFiKit userInfo:;
@end

@implementation NSError(WiFiKit)

+ (id)associationErrorWithReason:()WiFiKit
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v5 = WFAssociationErrorCodeToString(a3);
  v10[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 associationErrorWithReason:a3 userInfo:v6];

  return v7;
}

+ (uint64_t)associationErrorWithReason:()WiFiKit userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wifikit.error" code:a3 userInfo:a4];
}

+ (uint64_t)associationErrorWithCode:()WiFiKit isPrivateMACFailureThresholdMet:
{
  return [MEMORY[0x263F087E8] associationErrorWithCode:a3 requiresPassword:0 signalStrength:0 isPrivateMACFailureThresholdMet:a4];
}

+ (uint64_t)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:
{
  return [MEMORY[0x263F087E8] associationErrorWithCode:a3 requiresPassword:a4 signalStrength:a5 userInfo:0];
}

+ (id)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:isPrivateMACFailureThresholdMet:
{
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v11 = [NSNumber numberWithBool:a6];
  [v10 setObject:v11 forKey:@"kWFAssociationPrivateMacFailureThresholdMetKey"];

  v12 = [MEMORY[0x263F087E8] associationErrorWithCode:a3 requiresPassword:a4 signalStrength:a5 userInfo:v10];

  return v12;
}

+ (id)associationErrorWithCode:()WiFiKit requiresPassword:signalStrength:userInfo:
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a6;
  unint64_t v9 = 1;
  if (a3 <= -3914)
  {
    if ((a3 + 3925) >= 2)
    {
      if (a3 == -3947)
      {
        unint64_t v9 = 11;
      }
      else if (a3 != -3941)
      {
LABEL_10:
        unint64_t v9 = 12;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case -3913:
      case -3909:
        unint64_t v9 = 20;
        break;
      case -3912:
        break;
      case -3911:
      case -3910:
      case -3908:
      case -3907:
        goto LABEL_10;
      case -3906:
        BOOL v10 = a5 < -74;
        uint64_t v11 = 12;
        goto LABEL_13;
      case -3905:
        BOOL v10 = a5 < -74;
        uint64_t v11 = 3;
LABEL_13:
        if (v10) {
          unint64_t v9 = 21;
        }
        else {
          unint64_t v9 = v11;
        }
        break;
      default:
        if (a3 != -100) {
          goto LABEL_10;
        }
        unint64_t v9 = 0;
        break;
    }
  }
  v12 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v18 = *MEMORY[0x263F07F80];
  v13 = WFAssociationErrorCodeToString(v9);
  v19[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v15 = [v12 dictionaryWithDictionary:v14];

  if (v8) {
    [v15 addEntriesFromDictionary:v8];
  }
  v16 = [MEMORY[0x263F087E8] associationErrorWithReason:v9 userInfo:v15];

  return v16;
}

+ (id)scanErrorWithCode:()WiFiKit
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 82) {
    uint64_t v3 = 0;
  }
  if (a3 == 37) {
    uint64_t v3 = 37;
  }
  if (a3 == 16) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = [MEMORY[0x263F087E8] scanErrorWithReason:v4];
  return v5;
}

+ (id)scanErrorWithReason:()WiFiKit
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a3 <= 3)
  {
    if (!a3)
    {
      uint64_t v4 = @"Cannot scan while power is off";
      goto LABEL_13;
    }
    if (a3 == 1)
    {
      uint64_t v4 = @"Scan cancelled";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a3)
    {
      case 4:
        uint64_t v4 = @"Device scan channels are empty";
        goto LABEL_13;
      case 16:
        uint64_t v4 = @"Unable to queue scan, device is busy.";
        goto LABEL_13;
      case 37:
        uint64_t v4 = @"Existing scan in progress";
        goto LABEL_13;
    }
  }
  uint64_t v4 = @"Unknown scan error";
LABEL_13:
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v4;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"com.apple.wifikit.error" code:a3 userInfo:v6];

  return v7;
}

@end