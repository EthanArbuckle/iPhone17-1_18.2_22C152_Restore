@interface E5RunnerLastForwardLogits
- (E5RunnerLastForwardLogits)initWithLogits:(Logits)a3;
- (id).cxx_construct;
- (int64_t)numLogitsPerToken;
- (int64_t)numTokens;
- (int64_t)stridePerLogit;
- (int64_t)stridePerToken;
- (uint64_t)logitData;
@end

@implementation E5RunnerLastForwardLogits

- (E5RunnerLastForwardLogits)initWithLogits:(Logits)a3
{
  unint64_t numTokens = a3.numTokens;
  v10.receiver = self;
  v10.super_class = (Class)E5RunnerLastForwardLogits;
  result = [(E5RunnerLastForwardLogits *)&v10 init];
  if (result)
  {
    Logits v8 = *(Logits *)numTokens;
    long long v9 = *(_OWORD *)(numTokens + 16);
    *(_OWORD *)&result[1]._logits.m_size.m_size = *(_OWORD *)(numTokens + 32);
    *(_OWORD *)&result[1].super.isa = v9;
    result->_logits = v8;
  }
  return result;
}

- (int64_t)numTokens
{
  return self->_logits.numTokens;
}

- (uint64_t)logitData
{
  return *(void *)(a1 + 16);
}

- (int64_t)stridePerLogit
{
  return self[1]._logits.numTokens;
}

- (int64_t)stridePerToken
{
  return self[1]._logits.m_size.m_size;
}

- (int64_t)numLogitsPerToken
{
  return (int64_t)self[2].super.isa;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end