@interface RTPlaceTypeClassifierModelMultiClassOutput
- (NSDictionary)classProbability;
- (NSSet)featureNames;
- (RTPlaceTypeClassifierModelMultiClassOutput)initWithTarget:(int64_t)a3 classProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)target;
- (void)setClassProbability:(id)a3;
- (void)setTarget:(int64_t)a3;
@end

@implementation RTPlaceTypeClassifierModelMultiClassOutput

- (RTPlaceTypeClassifierModelMultiClassOutput)initWithTarget:(int64_t)a3 classProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTPlaceTypeClassifierModelMultiClassOutput;
  v8 = [(RTPlaceTypeClassifierModelMultiClassOutput *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_target = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3452B80];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"target"])
  {
    v5 = [MEMORY[0x1E4F1E950] featureValueWithInt64:-[RTPlaceTypeClassifierModelMultiClassOutput target](self, "target")];
  }
  else if ([v4 isEqualToString:@"classProbability"])
  {
    v6 = (void *)MEMORY[0x1E4F1E950];
    id v7 = [(RTPlaceTypeClassifierModelMultiClassOutput *)self classProbability];
    v5 = [v6 featureValueWithDictionary:v7 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end