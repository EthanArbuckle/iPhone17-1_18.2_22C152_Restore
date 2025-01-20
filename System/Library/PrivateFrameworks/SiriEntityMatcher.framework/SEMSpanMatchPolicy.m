@interface SEMSpanMatchPolicy
- (BOOL)allowAliasMatch;
- (BOOL)allowApproxMatch;
- (BOOL)allowPartialMatch;
- (BOOL)enableRankingWithPriors;
- (BOOL)prioritizeExactMatch;
- (BOOL)useTopFive;
- (SEMSpanMatchPolicy)init;
- (SEMSpanMatchPolicy)initWithOptions:(unsigned int)a3;
- (SEMSpanMatchPolicy)initWithOptions:(unsigned int)a3 absoluteThreshold:(float)a4 matchScoreWeight:(float)a5;
- (float)absoluteThreshold;
- (float)globalRelativeThreshold;
- (float)matchScoreWeight;
- (float)priorScoreWeight;
- (float)regionalRelativeThreshold;
- (id)description;
@end

@implementation SEMSpanMatchPolicy

- (SEMSpanMatchPolicy)initWithOptions:(unsigned int)a3
{
  LODWORD(v5) = 1061997773;
  LODWORD(v4) = -1.0;
  return (SEMSpanMatchPolicy *)objc_msgSend_initWithOptions_absoluteThreshold_matchScoreWeight_(self, a2, *(uint64_t *)&a3, v3, v4, v5);
}

- (SEMSpanMatchPolicy)initWithOptions:(unsigned int)a3 absoluteThreshold:(float)a4 matchScoreWeight:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SEMSpanMatchPolicy;
  result = [(SEMSpanMatchPolicy *)&v9 init];
  if (result)
  {
    result->_options = a3;
    result->_absoluteThreshold = a4;
    result->_matchScoreWeight = a5;
  }
  return result;
}

- (SEMSpanMatchPolicy)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMSpanMatchPolicy;
  uint64_t v3 = [(SEMSpanMatchPolicy *)&v8 description];
  v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @"%X", v5, self->_options);

  return v6;
}

- (BOOL)enableRankingWithPriors
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)useTopFive
{
  return 1;
}

- (float)matchScoreWeight
{
  return self->_matchScoreWeight;
}

- (float)priorScoreWeight
{
  return 0.2;
}

- (float)regionalRelativeThreshold
{
  return 0.25;
}

- (float)globalRelativeThreshold
{
  return 0.33;
}

- (float)absoluteThreshold
{
  return self->_absoluteThreshold;
}

- (BOOL)allowPartialMatch
{
  return self->_options & 1;
}

- (BOOL)allowApproxMatch
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)prioritizeExactMatch
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)allowAliasMatch
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

@end