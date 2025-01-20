@interface TSWPPageNumberAttachment
- (BOOL)changesWithPageNumber;
- (BOOL)shouldArchiveStringEquivalent;
- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5;
- (int)elementKind;
@end

@implementation TSWPPageNumberAttachment

- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPPageNumberAttachment;
  return -[TSWPNumberAttachment stringWithNumber:](&v6, sel_stringWithNumber_, a3, a4, a5);
}

- (int)elementKind
{
  return 32;
}

- (BOOL)shouldArchiveStringEquivalent
{
  return 0;
}

- (BOOL)changesWithPageNumber
{
  return 1;
}

@end