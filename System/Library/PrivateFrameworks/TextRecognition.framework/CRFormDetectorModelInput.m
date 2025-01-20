@interface CRFormDetectorModelInput
- (CRFormDetectorModelInput)initWithMLMultiArray:(id)a3;
- (MLMultiArray)array;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setArray:(id)a3;
@end

@implementation CRFormDetectorModelInput

- (CRFormDetectorModelInput)initWithMLMultiArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRFormDetectorModelInput;
  v6 = [(CRFormDetectorModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_array, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"img_input";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"img_input"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:self->_array];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end