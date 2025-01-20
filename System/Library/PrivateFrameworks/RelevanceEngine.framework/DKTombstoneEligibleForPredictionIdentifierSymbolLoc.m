@interface DKTombstoneEligibleForPredictionIdentifierSymbolLoc
@end

@implementation DKTombstoneEligibleForPredictionIdentifierSymbolLoc

void *__get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreDuetLibrary();
  result = dlsym(v2, "_DKTombstoneEligibleForPredictionIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

@end