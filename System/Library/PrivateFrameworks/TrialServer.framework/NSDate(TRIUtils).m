@interface NSDate(TRIUtils)
+ (BOOL)triIsDate:()TRIUtils equalToDate:withinInterval:;
+ (uint64_t)triIsDate:()TRIUtils equalToDate:;
@end

@implementation NSDate(TRIUtils)

+ (BOOL)triIsDate:()TRIUtils equalToDate:withinInterval:
{
  unint64_t v7 = a4;
  unint64_t v8 = a5;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    BOOL v10 = 0;
    if (v7 && v8)
    {
      [(id)v7 timeIntervalSinceReferenceDate];
      double v12 = v11;
      [v9 timeIntervalSinceReferenceDate];
      BOOL v10 = vabdd_f64(v12, v13) <= a1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

+ (uint64_t)triIsDate:()TRIUtils equalToDate:
{
  return objc_msgSend(MEMORY[0x1E4F1C9C8], "triIsDate:equalToDate:withinInterval:", 0.1);
}

@end