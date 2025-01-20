@interface _UITextPlaceholderAttachment
- (NSDictionary)typingAttributesBeforeInsertion;
- (_NSRange)attachmentRange;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (void)setAttachmentRange:(_NSRange)a3;
- (void)setTypingAttributesBeforeInsertion:(id)a3;
@end

@implementation _UITextPlaceholderAttachment

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (_NSRange)attachmentRange
{
  p_attachmentRange = &self->_attachmentRange;
  NSUInteger location = self->_attachmentRange.location;
  NSUInteger length = p_attachmentRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAttachmentRange:(_NSRange)a3
{
  self->_attachmentRange = a3;
}

- (NSDictionary)typingAttributesBeforeInsertion
{
  return self->_typingAttributesBeforeInsertion;
}

- (void)setTypingAttributesBeforeInsertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end