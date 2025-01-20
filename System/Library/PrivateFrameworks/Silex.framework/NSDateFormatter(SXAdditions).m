@interface NSDateFormatter(SXAdditions)
+ (id)dateFormatterWithFormat:()SXAdditions;
@end

@implementation NSDateFormatter(SXAdditions)

+ (id)dateFormatterWithFormat:()SXAdditions
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08B88] currentThread];
  v5 = [v4 threadDictionary];
  v6 = [v5 objectForKey:@"SilexDateFormatters"];

  if (!v6)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = [MEMORY[0x263F08B88] currentThread];
    v8 = [v7 threadDictionary];
    [v8 setObject:v6 forKey:@"SilexDateFormatters"];
  }
  id v9 = [v6 objectForKey:v3];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    [v9 setDateFormat:v3];
    [v6 setObject:v9 forKey:v3];
  }

  return v9;
}

@end