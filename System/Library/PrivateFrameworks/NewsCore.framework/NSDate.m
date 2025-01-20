@interface NSDate
@end

@implementation NSDate

uint64_t __58__NSDate_FCAdditions___fr_sharedYearAndMonthDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB5D1A10;
  qword_1EB5D1A10 = v0;

  v2 = (void *)qword_1EB5D1A10;
  return [v2 setDateFormat:@"yyyy-MM"];
}

@end