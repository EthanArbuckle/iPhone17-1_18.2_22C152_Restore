@interface PGTimeUtility
+ (id)dateIntervalWithStartDate:(id)a3 endDate:(id)a4;
@end

@implementation PGTimeUtility

+ (id)dateIntervalWithStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 compare:v6];
  if (v7 == 1) {
    v8 = v5;
  }
  else {
    v8 = v6;
  }
  if (v7 != 1) {
    id v6 = v5;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v8];

  return v9;
}

@end