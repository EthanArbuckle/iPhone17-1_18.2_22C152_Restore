@interface NTPBDate(FCAdditions)
+ (id)date;
- (BOOL)isLaterThan:()FCAdditions;
- (uint64_t)nsDate;
@end

@implementation NTPBDate(FCAdditions)

+ (id)date
{
  v0 = [MEMORY[0x1E4F1C9C8] date];
  v1 = [v0 pbDate];

  return v1;
}

- (uint64_t)nsDate
{
  return [MEMORY[0x1E4F1C9C8] dateWithPBDate:a1];
}

- (BOOL)isLaterThan:()FCAdditions
{
  id v4 = a3;
  [a1 timeIntervalSince1970];
  double v6 = v5;
  [v4 timeIntervalSince1970];
  double v8 = v7;

  return v6 > v8;
}

@end