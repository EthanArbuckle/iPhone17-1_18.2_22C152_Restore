@interface NSCalendar(MTUtilities)
+ (uint64_t)_optionsForBackwards:()MTUtilities;
+ (uint64_t)mtGregorianCalendar;
- (id)_mtNextDateAfterDate:()MTUtilities matchingComponents:backwards:;
- (id)_mtNextDateAfterDate:()MTUtilities matchingUnit:value:backwards:;
- (id)_nextDateHelperAfterDate:()MTUtilities nextDateBlock:;
- (uint64_t)mtDateRequiresSingularTimeString:()MTUtilities;
- (uint64_t)mtNextDateAfterDate:()MTUtilities matchingComponents:;
- (uint64_t)mtNextDateAfterDate:()MTUtilities matchingUnit:value:;
- (uint64_t)mtPreviousDateBeforeDate:()MTUtilities matchingComponents:;
- (uint64_t)mtPreviousDateBeforeDate:()MTUtilities matchingUnit:value:;
@end

@implementation NSCalendar(MTUtilities)

+ (uint64_t)mtGregorianCalendar
{
  return [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
}

- (uint64_t)mtNextDateAfterDate:()MTUtilities matchingComponents:
{
  return [a1 _mtNextDateAfterDate:a3 matchingComponents:a4 backwards:0];
}

- (uint64_t)mtPreviousDateBeforeDate:()MTUtilities matchingComponents:
{
  return [a1 _mtNextDateAfterDate:a3 matchingComponents:a4 backwards:1];
}

- (id)_mtNextDateAfterDate:()MTUtilities matchingComponents:backwards:
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() _optionsForBackwards:a5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__NSCalendar_MTUtilities___mtNextDateAfterDate_matchingComponents_backwards___block_invoke;
  v14[3] = &unk_1E5916DA8;
  v14[4] = a1;
  id v15 = v8;
  uint64_t v16 = v10;
  id v11 = v8;
  v12 = [a1 _nextDateHelperAfterDate:v9 nextDateBlock:v14];

  return v12;
}

- (uint64_t)mtNextDateAfterDate:()MTUtilities matchingUnit:value:
{
  return [a1 _mtNextDateAfterDate:a3 matchingUnit:a4 value:a5 backwards:0];
}

- (uint64_t)mtPreviousDateBeforeDate:()MTUtilities matchingUnit:value:
{
  return [a1 _mtNextDateAfterDate:a3 matchingUnit:a4 value:a5 backwards:1];
}

- (id)_mtNextDateAfterDate:()MTUtilities matchingUnit:value:backwards:
{
  id v10 = a3;
  uint64_t v11 = [(id)objc_opt_class() _optionsForBackwards:a6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__NSCalendar_MTUtilities___mtNextDateAfterDate_matchingUnit_value_backwards___block_invoke;
  v14[3] = &unk_1E5916DD0;
  v14[4] = a1;
  void v14[5] = a4;
  v14[6] = a5;
  v14[7] = v11;
  v12 = [a1 _nextDateHelperAfterDate:v10 nextDateBlock:v14];

  return v12;
}

- (id)_nextDateHelperAfterDate:()MTUtilities nextDateBlock:
{
  id v6 = a3;
  v7 = a4;
  id v8 = [a1 timeZone];
  [v8 daylightSavingTimeOffsetForDate:v6];
  double v10 = v9;

  if (v10 > 0.0)
  {
    uint64_t v11 = [v6 dateByAddingTimeInterval:-v10];
    v12 = [a1 timeZone];
    [v12 daylightSavingTimeOffsetForDate:v11];
    double v14 = v13;

    if (v10 > v14)
    {
      id v15 = v7[2](v7, v11);
      if ([v15 mtIsAfterDate:v6])
      {

        goto LABEL_8;
      }
    }
  }
  id v15 = v7[2](v7, v6);
LABEL_8:

  return v15;
}

+ (uint64_t)_optionsForBackwards:()MTUtilities
{
  if (a3) {
    return 516;
  }
  else {
    return 512;
  }
}

- (uint64_t)mtDateRequiresSingularTimeString:()MTUtilities
{
  uint64_t result = [a1 component:32 fromDate:a3];
  if (result != 1)
  {
    if (result == 13)
    {
      v5 = [a1 locale];
      uint64_t v6 = [v5 mtIsIn24HourTime];

      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end