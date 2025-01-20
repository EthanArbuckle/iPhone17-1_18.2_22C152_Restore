@interface PGFeatureTransformerToUnitNorm
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)name;
- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5;
- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4;
@end

@implementation PGFeatureTransformerToUnitNorm

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    v13 = @"message";
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a5;
    v10 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v7 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureTransformerToUnitNorm" code:a4 userInfo:v10];

    *a3 = v11;
  }
  return 1;
}

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LODWORD(v7) = 2.0;
  v8 = [v6 vectorByElementwiseRaisingToExponent:v7];
  [v8 sum];
  if (sqrtf(v9) == 0.0)
  {
    [(PGFeatureTransformerToUnitNorm *)self _generateError:a4 withCode:0 andMessage:@"Divide by 0 is not valid operation."];
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(v6, "vectorByDividingByScalar:");
  }

  return v10;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    BOOL v7 = +[PGFeatureTransformerHelper validParameters:v5 ofTypes:v6];

    if (v7)
    {
      v8 = [v5 objectAtIndexedSubscript:0];
      float v9 = [v5 objectAtIndexedSubscript:1];
      a4 = -[PGFeatureSliceTransformer initFromIndex:toIndex:]([PGFeatureTransformerToUnitNorm alloc], "initFromIndex:toIndex:", [v8 integerValue], objc_msgSend(v9, "integerValue"));
    }
    else if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14 = @"Failed to instantiate PGFeatureTransformerToUnitNorm: incorrect parameters.";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = [v10 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureTransformerToUnitNorm" code:1 userInfo:v11];

      a4 = 0;
    }
  }
  else
  {
    a4 = objc_alloc_init(PGFeatureTransformerToUnitNorm);
  }

  return a4;
}

+ (id)name
{
  return @"ToUnitNorm";
}

@end