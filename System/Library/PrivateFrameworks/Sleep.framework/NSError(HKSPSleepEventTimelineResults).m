@interface NSError(HKSPSleepEventTimelineResults)
+ (id)hksp_validationErrorWithReason:()HKSPSleepEventTimelineResults;
@end

@implementation NSError(HKSPSleepEventTimelineResults)

+ (id)hksp_validationErrorWithReason:()HKSPSleepEventTimelineResults
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  v10[0] = @"HKSPSleepScheduleValidationErrorReason";
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  v11[0] = v5;
  v10[1] = @"HKSPSleepScheduleValidationErrorReasonDescription";
  if ((unint64_t)(a3 - 1) > 2) {
    v6 = @"None";
  }
  else {
    v6 = off_1E5D34178[a3 - 1];
  }
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [v4 errorWithDomain:@"com.apple.sleep" code:3 userInfo:v7];

  return v8;
}

@end