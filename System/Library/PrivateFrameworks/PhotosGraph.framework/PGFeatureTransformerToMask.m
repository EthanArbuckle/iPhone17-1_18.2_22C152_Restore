@interface PGFeatureTransformerToMask
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)name;
- (PGFeatureTransformerToMask)initWithMaskingFloatValue:(float)a3;
- (PGFeatureTransformerToMask)initWithMaskingFloatValue:(float)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5;
- (float)maskingValue;
- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4;
@end

@implementation PGFeatureTransformerToMask

- (float)maskingValue
{
  return self->_maskingValue;
}

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 count];
  v6 = (void *)MEMORY[0x1E4F71ED0];
  *(float *)&double v7 = self->_maskingValue;
  return (id)[v6 vectorRepeatingFloat:v5 count:v7];
}

- (PGFeatureTransformerToMask)initWithMaskingFloatValue:(float)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGFeatureTransformerToMask;
  result = [(PGFeatureSliceTransformer *)&v7 initFromIndex:a4 toIndex:a5];
  if (result) {
    result->_maskingValue = a3;
  }
  return result;
}

- (PGFeatureTransformerToMask)initWithMaskingFloatValue:(float)a3
{
  return -[PGFeatureTransformerToMask initWithMaskingFloatValue:fromIndex:toIndex:](self, "initWithMaskingFloatValue:fromIndex:toIndex:", 0, 0x7FFFFFFFLL);
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  if (+[PGFeatureTransformerHelper validParameters:v5 ofTypes:v6])
  {

    goto LABEL_4;
  }
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  BOOL v8 = +[PGFeatureTransformerHelper validParameters:v5 ofTypes:v7];

  if (v8)
  {
LABEL_4:
    v9 = [v5 objectAtIndexedSubscript:0];
    if ([v5 count] == 3)
    {
      v10 = [v5 objectAtIndexedSubscript:1];
      v11 = [v5 objectAtIndexedSubscript:2];
      v12 = [PGFeatureTransformerToMask alloc];
      [v9 floatValue];
      int v14 = v13;
      uint64_t v15 = [v10 integerValue];
      uint64_t v16 = [v11 integerValue];
      LODWORD(v17) = v14;
      v18 = [(PGFeatureTransformerToMask *)v12 initWithMaskingFloatValue:v15 fromIndex:v16 toIndex:v17];
    }
    else
    {
      v19 = [PGFeatureTransformerToMask alloc];
      [v9 floatValue];
      v18 = -[PGFeatureTransformerToMask initWithMaskingFloatValue:](v19, "initWithMaskingFloatValue:");
    }
    goto LABEL_9;
  }
  if (a4)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23 = @"Failed to instantiate PGFeatureTransformerToMask: incorrect parameters.";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v20 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureTransformerToMask" code:0 userInfo:v9];
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v18 = 0;
LABEL_10:

  return v18;
}

+ (id)name
{
  return @"ToMask";
}

@end