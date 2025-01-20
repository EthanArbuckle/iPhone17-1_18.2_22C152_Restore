@interface WLDPushParsing
+ (id)accountIdentifierForNotification:(id)a3;
+ (int64_t)actionTypeForNotification:(id)a3;
@end

@implementation WLDPushParsing

+ (int64_t)actionTypeForNotification:(id)a3
{
  v3 = objc_msgSend(a3, "wlk_numberForKey:", @"1");
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = (unint64_t)[v3 unsignedIntegerValue] - 21;
    if (v5 < 0x11 && ((0x1F401u >> v5) & 1) != 0)
    {
      int64_t v10 = qword_100042048[v5];
      goto LABEL_10;
    }
    v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v4;
      v7 = "WLDPushParsing - Unknown action type: %@";
      v8 = v6;
      uint32_t v9 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
    }
  }
  else
  {
    v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v7 = "WLDPushParsing - No value found for action type in payload";
      v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_8;
    }
  }

  int64_t v10 = -1;
LABEL_10:

  return v10;
}

+ (id)accountIdentifierForNotification:(id)a3
{
  return objc_msgSend(a3, "wlk_numberForKey:", @"0");
}

@end