@interface CommonUtil
+ (id)stringForFourCC:(unsigned int)a3;
+ (id)stringForLocationType:(int)a3;
+ (id)userInfoFrom:(id)a3;
+ (void)handleAlertAction:(id)a3;
@end

@implementation CommonUtil

+ (id)stringForFourCC:(unsigned int)a3
{
  __int16 v6 = bswap32(a3) >> 16;
  v5[1] = BYTE2(a3);
  v5[0] = HIBYTE(a3);
  char v7 = 0;
  v3 = +[NSString stringWithCString:v5 encoding:4];

  return v3;
}

+ (id)stringForLocationType:(int)a3
{
  int v4 = a3 - 1;
  if (a3 - 1) < 0xA && ((0x3EFu >> v4)) {
    return *(&off_100059CC0 + v4);
  }
  v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100038004(a3, v5);
  }

  return @"Unknown";
}

+ (void)handleAlertAction:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v8 = [v3 objectForKeyedSubscript:@"url"];
    int v4 = [v3 objectForKeyedSubscript:@"sensitive"];

    unsigned int v5 = [v4 BOOLValue];
    __int16 v6 = +[LSApplicationWorkspace defaultWorkspace];
    char v7 = v6;
    if (v5) {
      [v6 openSensitiveURL:v8 withOptions:0];
    }
    else {
      [v6 openURL:v8 configuration:0 completionHandler:0];
    }
  }
}

+ (id)userInfoFrom:(id)a3
{
  id v3 = xpc_dictionary_get_value(a3, "UserInfo");
  int v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary) {
    unsigned int v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

@end