@interface SBRingerButtonParameters
- (NSString)description;
- (SBRingerButtonParameters)init;
- (double)longPressTime;
- (double)longPressTimeWhenSuppressed;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)setLongPressTime:(uint64_t)result;
- (uint64_t)setLongPressTimeWhenSuppressed:(uint64_t)result;
- (uint64_t)setViewObstructionEligibility:(uint64_t)result;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBRingerButtonParameters

- (SBRingerButtonParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBRingerButtonParameters;
  result = [(SBRingerButtonParameters *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_longPressTime = xmmword_1D8FD1620;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(SBRingerButtonParameters);
  *((void *)result + 1) = *(void *)&self->_longPressTime;
  *((void *)result + 2) = *(void *)&self->_longPressTimeWhenSuppressed;
  return result;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBRingerButtonParameters_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __57__SBRingerButtonParameters_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendFloat:@"longPressTime" withName:*(double *)(*(void *)(a1 + 40) + 8)];
  return (id)[*(id *)(a1 + 32) appendFloat:@"longPressTimeWhenSuppressed" withName:*(double *)(*(void *)(a1 + 40) + 16)];
}

- (double)longPressTime
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setLongPressTime:(uint64_t)result
{
  if (result) {
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (double)longPressTimeWhenSuppressed
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setLongPressTimeWhenSuppressed:(uint64_t)result
{
  if (result) {
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setViewObstructionEligibility:(uint64_t)result
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

@end