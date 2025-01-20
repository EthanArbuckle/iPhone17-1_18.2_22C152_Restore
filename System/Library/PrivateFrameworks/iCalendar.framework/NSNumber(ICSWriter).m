@interface NSNumber(ICSWriter)
- (void)_ICSBoolAppendingToString:()ICSWriter;
- (void)_ICSFBTypeAppendingToString:()ICSWriter;
- (void)_ICSStringWithOptions:()ICSWriter appendingToString:;
- (void)_ICSUTCOffsetAppendingToString:()ICSWriter;
@end

@implementation NSNumber(ICSWriter)

- (void)_ICSBoolAppendingToString:()ICSWriter
{
  id v5 = a3;
  if ([a1 BOOLValue]) {
    v4 = @"TRUE";
  }
  else {
    v4 = @"FALSE";
  }
  [v5 appendString:v4];
}

- (void)_ICSUTCOffsetAppendingToString:()ICSWriter
{
  id v11 = a3;
  int v4 = [a1 intValue];
  if (v4 >= 0) {
    id v5 = @"+";
  }
  else {
    id v5 = @"-";
  }
  [v11 appendString:v5];
  LODWORD(v6) = v4 % 86400 / 3600;
  if ((int)v6 >= 0) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = (v4 % 86400 / -3600);
  }
  unsigned int v7 = v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16);
  LODWORD(v8) = ((__int16)v7 >> 5) + ((unsigned __int16)(v7 & 0x8000) >> 15);
  if ((int)v8 >= 0) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = -(int)v8;
  }
  LODWORD(v9) = v4 % 60;
  if (v4 % 60)
  {
    if ((int)v9 >= 0) {
      uint64_t v9 = v9;
    }
    else {
      uint64_t v9 = -(int)v9;
    }
    objc_msgSend(v11, "appendFormat:", @"%02d%02d%02d", v6, v8, v9);
  }
  else
  {
    objc_msgSend(v11, "appendFormat:", @"%02d%02d", v6, v8, v10);
  }
}

- (void)_ICSFBTypeAppendingToString:()ICSWriter
{
  id v5 = a3;
  unint64_t v4 = [a1 longValue];
  if (v4 <= 4) {
    [v5 appendString:off_1E6C258D8[v4]];
  }
}

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  id v6 = a4;
  id v7 = [a1 stringValue];
  iCalendarAppendStringToStringWithOptions(v7, v6, a3);
}

@end