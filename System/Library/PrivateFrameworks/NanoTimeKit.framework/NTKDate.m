@interface NTKDate
+ (id)faceDate;
+ (id)faceDateWithTimeIntervalSinceNow:(double)a3;
@end

@implementation NTKDate

+ (id)faceDate
{
  return (id)MEMORY[0x1F40D5DC8](a1, a2);
}

+ (id)faceDateWithTimeIntervalSinceNow:(double)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  v5 = [a1 faceDate];
  v6 = [v4 dateWithTimeInterval:v5 sinceDate:a3];

  return v6;
}

@end