@interface CRReplica
+ (id)unserialisedIdentifier;
@end

@implementation CRReplica

+ (id)unserialisedIdentifier
{
  if (unserialisedIdentifier_predicate != -1) {
    dispatch_once(&unserialisedIdentifier_predicate, &__block_literal_global_49);
  }
  v2 = (void *)unserialisedIdentifier_TTUnserialisedReplicaID;

  return v2;
}

uint64_t __35__CRReplica_unserialisedIdentifier__block_invoke()
{
  unserialisedIdentifier_TTUnserialisedReplicaID = [MEMORY[0x1E4F29128] UUID];

  return MEMORY[0x1F41817F8]();
}

@end