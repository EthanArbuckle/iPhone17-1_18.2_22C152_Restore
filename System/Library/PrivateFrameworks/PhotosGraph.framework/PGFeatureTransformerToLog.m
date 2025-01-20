@interface PGFeatureTransformerToLog
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)name;
- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4;
@end

@implementation PGFeatureTransformerToLog

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  return (id)[a3 vectorByElementwiseNaturalLogarithmIfPositive];
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    BOOL v7 = +[PGFeatureTransformerHelper validParameters:v5 ofTypes:v6];

    if (v7)
    {
      v8 = [v5 objectAtIndexedSubscript:0];
      v9 = [v5 objectAtIndexedSubscript:1];
      a4 = -[PGFeatureSliceTransformer initFromIndex:toIndex:]([PGFeatureTransformerToLog alloc], "initFromIndex:toIndex:", [v8 integerValue], objc_msgSend(v9, "integerValue"));
    }
    else if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14 = @"Failed to instantiate PGFeatureTransformerToLog: incorrect parameters.";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = [v10 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureTransformerToLog" code:0 userInfo:v11];

      a4 = 0;
    }
  }
  else
  {
    a4 = objc_alloc_init(PGFeatureTransformerToLog);
  }

  return a4;
}

+ (id)name
{
  return @"ToLog";
}

@end