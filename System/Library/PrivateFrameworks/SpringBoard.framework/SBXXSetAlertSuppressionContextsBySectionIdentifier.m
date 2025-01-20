@interface SBXXSetAlertSuppressionContextsBySectionIdentifier
@end

@implementation SBXXSetAlertSuppressionContextsBySectionIdentifier

void ___SBXXSetAlertSuppressionContextsBySectionIdentifier_block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v2;
  _SBSetAlertSuppressionContextArraysBySectionIdentifierDictionary(v1, v3);
}

@end