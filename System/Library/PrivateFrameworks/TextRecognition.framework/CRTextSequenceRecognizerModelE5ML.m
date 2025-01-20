@interface CRTextSequenceRecognizerModelE5ML
- (BOOL)preheatWithError:(id *)a3;
- (CRTextSequenceRecognizerModelE5ML)initWithConfiguration:(id)a3 error:(id *)a4;
- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7;
- (id)predictFromInputs:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation CRTextSequenceRecognizerModelE5ML

- (CRTextSequenceRecognizerModelE5ML)initWithConfiguration:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRTextSequenceRecognizerModelE5ML;

  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CRTextSequenceRecognizerModelE5ML;
  [(CRTextSequenceRecognizerModelEspresso *)&v2 dealloc];
}

- (BOOL)preheatWithError:(id *)a3
{
  return 0;
}

- (id)predictFromInputs:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7
{
  return 0;
}

@end