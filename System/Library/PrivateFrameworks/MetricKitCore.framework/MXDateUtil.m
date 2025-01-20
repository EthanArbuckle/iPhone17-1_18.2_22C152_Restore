@interface MXDateUtil
- (id)stringFromDate:(id)a3;
@end

@implementation MXDateUtil

- (id)stringFromDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];
  [v5 setDateFormat:@"yyyy-MM-dd"];
  v7 = [v5 stringFromDate:v4];

  return v7;
}

@end