@interface CRLatticeResults
- (CRLatticeResults)init;
- (NSArray)results;
- (NSMutableArray)mutableResults;
- (void)addResult:(id)a3;
- (void)setMutableResults:(id)a3;
@end

@implementation CRLatticeResults

- (CRLatticeResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLatticeResults;
  v2 = [(CRLatticeResults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    mutableResults = v2->_mutableResults;
    v2->_mutableResults = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addResult:(id)a3
{
  id v5 = a3;
  mutableResults = self->_mutableResults;
  if (mutableResults) {
    [(NSMutableArray *)mutableResults addObject:v5];
  }
}

- (NSArray)results
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_mutableResults];
}

- (NSMutableArray)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end