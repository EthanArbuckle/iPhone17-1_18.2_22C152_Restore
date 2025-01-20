@interface NSDateFormatter
@end

@implementation NSDateFormatter

void __76__NSDateFormatter_RemoteManagementModel__rmmodel_sharedRFC3339DateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)rmmodel_sharedRFC3339DateFormatter_rfcFormatter;
  rmmodel_sharedRFC3339DateFormatter_rfcFormatter = v0;

  v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter setLocale:v2];

  [(id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  id v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [(id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter setTimeZone:v3];
}

@end