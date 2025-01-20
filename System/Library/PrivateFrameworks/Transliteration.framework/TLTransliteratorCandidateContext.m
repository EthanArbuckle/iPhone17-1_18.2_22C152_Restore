@interface TLTransliteratorCandidateContext
- (NSArray)candidates;
- (TLTransliteratorCandidateContext)initWithCandidates:(id)a3;
- (id)description;
@end

@implementation TLTransliteratorCandidateContext

- (TLTransliteratorCandidateContext)initWithCandidates:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTransliteratorCandidateContext;
  v5 = [(TLTransliteratorCandidateContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    candidates = v5->_candidates;
    v5->_candidates = (NSArray *)v6;
  }
  return v5;
}

- (id)description
{
  v2 = [(TLTransliteratorCandidateContext *)self candidates];
  v3 = [v2 description];

  return v3;
}

- (NSArray)candidates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end