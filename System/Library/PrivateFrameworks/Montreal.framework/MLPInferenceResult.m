@interface MLPInferenceResult
- (id).cxx_construct;
@end

@implementation MLPInferenceResult

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end