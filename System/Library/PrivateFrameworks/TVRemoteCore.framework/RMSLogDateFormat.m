@interface RMSLogDateFormat
@end

@implementation RMSLogDateFormat

void ___RMSLogDateFormat_block_invoke()
{
  CFLocaleRef v0 = CFLocaleCopyCurrent();
  v1 = CFDateFormatterCreate(0, v0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  _RMSLogDateFormat_dateFormatter = (uint64_t)v1;
  if (!v1) {
    ___RMSLogDateFormat_block_invoke_cold_1();
  }
  CFDateFormatterSetFormat(v1, @"MMMdd H:mm:ss.SSS");

  CFRelease(v0);
}

void ___RMSLogDateFormat_block_invoke_cold_1()
{
}

@end