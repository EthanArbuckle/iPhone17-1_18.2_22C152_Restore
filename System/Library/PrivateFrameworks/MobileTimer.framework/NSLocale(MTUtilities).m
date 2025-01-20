@interface NSLocale(MTUtilities)
- (BOOL)mtIsIn24HourTime;
@end

@implementation NSLocale(MTUtilities)

- (BOOL)mtIsIn24HourTime
{
  v1 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:a1];
  BOOL v2 = [v1 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL
    || [v1 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end