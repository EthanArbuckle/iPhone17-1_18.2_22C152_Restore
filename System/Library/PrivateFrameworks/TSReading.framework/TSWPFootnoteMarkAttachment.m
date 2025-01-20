@interface TSWPFootnoteMarkAttachment
- (BOOL)shouldStyleBeExtended;
- (id)copyWithContext:(id)a3;
- (id)stringEquivalent;
- (int)elementKind;
@end

@implementation TSWPFootnoteMarkAttachment

- (id)stringEquivalent
{
  return 0;
}

- (int)elementKind
{
  return 128;
}

- (id)copyWithContext:(id)a3
{
  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPFootnoteMarkAttachment zone](self, "zone"));

  return (id)[v4 initWithContext:a3];
}

- (BOOL)shouldStyleBeExtended
{
  return 0;
}

@end