@interface CRLWPFootnoteMarkAttachment
- (BOOL)shouldStyleBeExtended;
- (id)stringEquivalent;
- (unsigned)elementKind;
@end

@implementation CRLWPFootnoteMarkAttachment

- (id)stringEquivalent
{
  return &stru_101538650;
}

- (unsigned)elementKind
{
  return 128;
}

- (BOOL)shouldStyleBeExtended
{
  return 0;
}

@end