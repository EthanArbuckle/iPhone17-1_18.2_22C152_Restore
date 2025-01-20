@interface MFIMAPDateStringForDate
@end

@implementation MFIMAPDateStringForDate

uint64_t ___MFIMAPDateStringForDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MFIMAPDateStringForDate_formatter;
  _MFIMAPDateStringForDate_formatter = (uint64_t)v0;

  v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale");
  [(id)_MFIMAPDateStringForDate_formatter setLocale:v2];

  v3 = (void *)_MFIMAPDateStringForDate_formatter;
  return [v3 setDateFormat:@"\"dd-MMM-yyyy HH:mm:ss ZZ\""];
}

@end