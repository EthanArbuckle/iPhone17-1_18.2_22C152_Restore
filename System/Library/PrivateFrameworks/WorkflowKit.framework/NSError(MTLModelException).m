@interface NSError(MTLModelException)
+ (id)mtl_modelErrorWithException:()MTLModelException;
@end

@implementation NSError(MTLModelException)

+ (id)mtl_modelErrorWithException:()MTLModelException
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSError+MTLModelException.m", 25, @"Invalid parameter not satisfying: %@", @"exception != nil" object file lineNumber description];
  }
  v12[0] = *MEMORY[0x1E4F28568];
  v6 = [v5 description];
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E4F28588];
  v7 = [v5 reason];
  v12[2] = @"MTLModelThrownException";
  v13[1] = v7;
  v13[2] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLModelErrorDomain" code:1 userInfo:v8];

  return v9;
}

@end