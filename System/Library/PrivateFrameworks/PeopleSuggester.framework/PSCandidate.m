@interface PSCandidate
@end

@implementation PSCandidate

void __29___PSCandidate_selfCandidate__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  v1 = [[_PSCandidate alloc] initWithDomainId:@"self" derivedIntentId:@"self" bundleId:@"self" recipientsId:0];
  uint64_t v2 = [(_PSCandidate *)v1 candidateForDeduping];
  v3 = (void *)selfCandidate__pasExprOnceResult;
  selfCandidate__pasExprOnceResult = v2;
}

@end