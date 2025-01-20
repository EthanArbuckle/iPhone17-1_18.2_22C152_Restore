@interface PXBackgroundSystemSchedulerWrapper
+ (BOOL)signalTaskStartedWithError:(id *)a3;
+ (BOOL)signalTaskStoppedWithError:(id *)a3;
+ (NSDictionary)taskParameters;
@end

@implementation PXBackgroundSystemSchedulerWrapper

+ (NSDictionary)taskParameters
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];

  uint64_t v4 = *MEMORY[0x1E4F4F460];
  v9[0] = *MEMORY[0x1E4F4F450];
  v9[1] = v4;
  v10[0] = &unk_1F02D9430;
  v10[1] = @"com.apple.photos:memoryCreation";
  v9[2] = *MEMORY[0x1E4F4F458];
  v8 = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v6;
}

+ (BOOL)signalTaskStoppedWithError:(id *)a3
{
  uint64_t v4 = [a1 taskParameters];
  v5 = [MEMORY[0x1E4F4F440] sharedScheduler];
  LOBYTE(a3) = [v5 taskStoppedWithParameters:v4 error:a3];

  return (char)a3;
}

+ (BOOL)signalTaskStartedWithError:(id *)a3
{
  uint64_t v4 = [a1 taskParameters];
  v5 = [MEMORY[0x1E4F4F440] sharedScheduler];
  LOBYTE(a3) = [v5 taskStartedWithParameters:v4 error:a3];

  return (char)a3;
}

@end