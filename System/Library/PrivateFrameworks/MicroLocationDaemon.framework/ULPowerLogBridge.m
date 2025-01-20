@interface ULPowerLogBridge
+ (BOOL)ULPowerLogEnabled;
+ (void)ULPowerLogTimeInsensitive:(id)a3 event:(id)a4;
@end

@implementation ULPowerLogBridge

+ (void)ULPowerLogTimeInsensitive:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (+[ULPowerLogBridge ULPowerLogEnabled])
  {
    objc_msgSend(NSString, "stringWithCString:encoding:", objc_msgSend(v5, "UTF8String"), 4);
    PLLogRegisteredEvent();
  }
}

+ (BOOL)ULPowerLogEnabled
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULPowerLogEnabled"];
  id v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = [MEMORY[0x263EFFA88] BOOLValue];
  }
  BOOL v7 = v6;

  return v7;
}

@end