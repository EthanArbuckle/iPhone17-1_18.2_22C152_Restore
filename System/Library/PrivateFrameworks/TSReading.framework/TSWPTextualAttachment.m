@interface TSWPTextualAttachment
- (BOOL)shouldArchiveStringEquivalent;
- (id)stringEquivalent;
- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5;
@end

@implementation TSWPTextualAttachment

- (BOOL)shouldArchiveStringEquivalent
{
  return 1;
}

- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5
{
  return 0;
}

- (id)stringEquivalent
{
  return 0;
}

@end