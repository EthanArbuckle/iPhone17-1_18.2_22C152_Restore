@interface ICParagraphInfo
- (ICTTParagraphStyle)paragraphStyle;
- (NSMutableArray)children;
- (_NSRange)characterRange;
- (_NSRange)rangeIncludingChildren;
- (unint64_t)blockQuoteLevel;
- (unint64_t)indent;
- (unsigned)style;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setChildren:(id)a3;
- (void)setParagraphStyle:(id)a3;
- (void)setRangeIncludingChildren:(_NSRange)a3;
@end

@implementation ICParagraphInfo

- (unsigned)style
{
  v2 = [(ICParagraphInfo *)self paragraphStyle];
  unsigned int v3 = [v2 style];

  return v3;
}

- (unint64_t)indent
{
  v2 = [(ICParagraphInfo *)self paragraphStyle];
  unint64_t v3 = [v2 indent];

  return v3;
}

- (ICTTParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (void)setParagraphStyle:(id)a3
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

- (_NSRange)rangeIncludingChildren
{
  NSUInteger length = self->_rangeIncludingChildren.length;
  NSUInteger location = self->_rangeIncludingChildren.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeIncludingChildren:(_NSRange)a3
{
  self->_rangeIncludingChildren = a3;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (unint64_t)blockQuoteLevel
{
  return self->_blockQuoteLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_paragraphStyle, 0);
}

@end