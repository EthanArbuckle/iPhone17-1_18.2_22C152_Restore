@interface PHACurareShadowEvaluationUtilities
+ (BOOL)generateError:(id *)a3 errorCode:(int)a4 errorDomain:(id)a5 message:(id)a6 underlyingError:(id)a7;
@end

@implementation PHACurareShadowEvaluationUtilities

+ (BOOL)generateError:(id *)a3 errorCode:(int)a4 errorDomain:(id)a5 message:(id)a6 underlyingError:(id)a7
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = a4;
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v21 = v12;
    v22[0] = a6;
    v13 = NSString;
    id v14 = a6;
    id v15 = a5;
    v16 = [v13 stringWithFormat:@"%@", a7, v20, v21, v22[0]];
    v22[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v20 count:2];
    v18 = [v10 errorWithDomain:v15 code:v11 userInfo:v17];

    *a3 = v18;
  }
  return 1;
}

@end