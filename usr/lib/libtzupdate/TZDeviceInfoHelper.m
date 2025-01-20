@interface TZDeviceInfoHelper
+ (id)icuVersion;
+ (id)zoneinfoVersion;
@end

@implementation TZDeviceInfoHelper

+ (id)icuVersion
{
  UErrorCode v6 = U_ZERO_ERROR;
  uint64_t v2 = MEMORY[0x210511CC0](&v6, a2);
  if (v6 < U_ILLEGAL_ARGUMENT_ERROR)
  {
    if (+[TZDLogging canLogMessageAtLevel:1]) {
      NSLog(&cfstr_STzVersionAsRe.isa, "+[TZDeviceInfoHelper icuVersion]", v2);
    }
    v4 = [NSString stringWithUTF8String:v2];
  }
  else
  {
    if (+[TZDLogging canLogMessageAtLevel:0])
    {
      v3 = u_errorName(v6);
      NSLog(&cfstr_SEncounteredEr.isa, "+[TZDeviceInfoHelper icuVersion]", v3);
    }
    v4 = &stru_26BE135B8;
  }

  return v4;
}

+ (id)zoneinfoVersion
{
  uint64_t v2 = [NSURL fileURLWithPath:@"/var/db/timezone/zoneinfo/+VERSION"];
  uint64_t v5 = 0;
  v3 = +[TZUtilities stringWithContentsOfFileAtURL:v2 error:&v5];
  if (!v3 && +[TZDLogging canLogMessageAtLevel:0]) {
    NSLog(&cfstr_SCannotGetZone.isa, "+[TZDeviceInfoHelper zoneinfoVersion]", 0);
  }

  return v3;
}

@end