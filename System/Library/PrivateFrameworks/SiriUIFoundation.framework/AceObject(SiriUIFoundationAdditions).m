@interface AceObject(SiriUIFoundationAdditions)
- (uint64_t)sruif_aceCommandType;
- (uint64_t)sruif_insertionContext;
- (uint64_t)sruif_isUserUtterance;
- (uint64_t)sruif_isUtterance;
- (uint64_t)sruif_usefulUserResultType;
- (uint64_t)sruif_waitsForConfirmation;
@end

@implementation AceObject(SiriUIFoundationAdditions)

- (uint64_t)sruif_aceCommandType
{
  return 0;
}

- (uint64_t)sruif_isUtterance
{
  return 0;
}

- (uint64_t)sruif_isUserUtterance
{
  return 0;
}

- (uint64_t)sruif_waitsForConfirmation
{
  return 0;
}

- (uint64_t)sruif_insertionContext
{
  return 0;
}

- (uint64_t)sruif_usefulUserResultType
{
  return 0;
}

@end