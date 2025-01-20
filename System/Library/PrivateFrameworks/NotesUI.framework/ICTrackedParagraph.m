@interface ICTrackedParagraph
- (ICTTParagraphStyle)paragraph;
- (_NSRange)characterRange;
- (id)description;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setParagraph:(id)a3;
@end

@implementation ICTrackedParagraph

- (id)description
{
  v3 = NSString;
  v4 = [(ICTrackedParagraph *)self paragraph];
  v9.location = [(ICTrackedParagraph *)self characterRange];
  v5 = NSStringFromRange(v9);
  v6 = [v3 stringWithFormat:@"<ICTrackedParagraph %p %@ %@>", self, v4, v5];

  return v6;
}

- (ICTTParagraphStyle)paragraph
{
  return self->_paragraph;
}

- (void)setParagraph:(id)a3
{
}

- (_NSRange)characterRange
{
  NSUInteger length = self->_characterRange.length;
  NSUInteger location = self->_characterRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (void).cxx_destruct
{
}

@end