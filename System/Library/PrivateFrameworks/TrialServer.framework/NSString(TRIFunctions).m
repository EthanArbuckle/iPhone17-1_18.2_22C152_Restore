@interface NSString(TRIFunctions)
- (id)tri_assignmentProbabilityWithSeed:()TRIFunctions;
@end

@implementation NSString(TRIFunctions)

- (id)tri_assignmentProbabilityWithSeed:()TRIFunctions
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"%@-%@", a1, v5];
  v7 = (const char *)[v6 UTF8String];

  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"TRIExpressionCategories.m", 27, @"Invalid parameter not satisfying: %@", @"charString" object file lineNumber description];
  }
  id v8 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  uint64_t v9 = [v8 mutableBytes];
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v16);
  }
  v10 = (int8x16_t *)v9;
  CC_LONG v11 = strlen(v7);
  CC_SHA256(v7, v11, (unsigned __int8 *)v10);
  int8x16_t v12 = veorq_s8(*v10, v10[1]);
  v13 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(*(unint64_t *)&veor_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) % 0x3E8)/ 10.0);

  return v13;
}

@end