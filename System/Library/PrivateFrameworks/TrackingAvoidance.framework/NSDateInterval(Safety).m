@interface NSDateInterval(Safety)
+ (id)createIntervalSafelyWithStartDate:()Safety endDate:;
@end

@implementation NSDateInterval(Safety)

+ (id)createIntervalSafelyWithStartDate:()Safety endDate:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v5 compare:v6];
    id v10 = objc_alloc(MEMORY[0x263F08798]);
    if (v9 == 1) {
      uint64_t v11 = [v10 initWithStartDate:v5 duration:0.0];
    }
    else {
      uint64_t v11 = [v10 initWithStartDate:v5 endDate:v7];
    }
    v8 = (void *)v11;
  }

  return v8;
}

@end