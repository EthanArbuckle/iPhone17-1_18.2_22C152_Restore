@interface CRLWPTextualAttachment
- (BOOL)shouldArchiveStringEquivalent;
- (NSString)stringEquivalent;
- (id)stringEquivalentWithLayoutParent:(id)a3;
- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5;
@end

@implementation CRLWPTextualAttachment

- (BOOL)shouldArchiveStringEquivalent
{
  return 1;
}

- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5
{
  return &stru_101538650;
}

- (NSString)stringEquivalent
{
  return (NSString *)&stru_101538650;
}

- (id)stringEquivalentWithLayoutParent:(id)a3
{
  v3 = [(CRLWPTextualAttachment *)self stringEquivalent];

  return v3;
}

@end