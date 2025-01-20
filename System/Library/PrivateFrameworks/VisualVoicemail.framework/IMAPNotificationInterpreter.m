@interface IMAPNotificationInterpreter
+ (id)interpretedDictionaryForNotificationUserInfo:(__CFDictionary *)a3;
@end

@implementation IMAPNotificationInterpreter

+ (id)interpretedDictionaryForNotificationUserInfo:(__CFDictionary *)a3
{
  v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IMAPNotificationInterpreter: received a notification dictionary: %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = CFDictionaryGetValue(a3, kCTIndicatorsVoiceMailURL);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 absoluteString];
  }
  else
  {
    id v6 = v5;
  }
  v7 = v6;
  v8 = (void *)VMCopyDictionaryForNotificationString();

  return v8;
}

@end