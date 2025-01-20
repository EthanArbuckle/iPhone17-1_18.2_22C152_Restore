@interface ICParagraphInfoSortInfo
- (ICTrackedParagraph)trackedParagraph;
- (NSAttributedString)attributedString;
- (_NSRange)characterRange;
- (void)setAttributedString:(id)a3;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setTrackedParagraph:(id)a3;
@end

@implementation ICParagraphInfoSortInfo

- (ICTrackedParagraph)trackedParagraph
{
  return self->_trackedParagraph;
}

- (void)setTrackedParagraph:(id)a3
{
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
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
  objc_storeStrong((id *)&self->_attributedString, 0);

  objc_storeStrong((id *)&self->_trackedParagraph, 0);
}

@end