@interface NSDateFormatter(StocksUI)
+ (uint64_t)su_localizedYearFormat;
@end

@implementation NSDateFormatter(StocksUI)

+ (uint64_t)su_localizedYearFormat
{
  return MEMORY[0x270F0CD30](*MEMORY[0x263F25540]);
}

@end