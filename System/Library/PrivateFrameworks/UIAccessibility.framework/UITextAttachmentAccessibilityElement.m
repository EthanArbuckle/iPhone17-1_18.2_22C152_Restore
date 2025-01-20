@interface UITextAttachmentAccessibilityElement
- (NSAdaptiveImageGlyph)glyph;
- (NSTextAttachment)attachment;
- (void)setAttachment:(id)a3;
- (void)setGlyph:(id)a3;
@end

@implementation UITextAttachmentAccessibilityElement

- (NSTextAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (NSAdaptiveImageGlyph)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end