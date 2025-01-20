@interface TSWPNSAttributedStringAttachmentConversionDelegate
- (TSWPNSAttributedStringAttachmentConversionDelegate)init;
- (TSWPNSAttributedStringAttachmentConversionDelegate)initWithConvertHyperlinks:(BOOL)a3 convertGraphicalAttachments:(BOOL)a4;
- (id)attachmentStringForDrawableAttachment:(id)a3;
- (id)urlForHyperlinkField:(id)a3;
@end

@implementation TSWPNSAttributedStringAttachmentConversionDelegate

- (TSWPNSAttributedStringAttachmentConversionDelegate)initWithConvertHyperlinks:(BOOL)a3 convertGraphicalAttachments:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPNSAttributedStringAttachmentConversionDelegate;
  result = [(TSWPNSAttributedStringAttachmentConversionDelegate *)&v7 init];
  if (result)
  {
    result->mConvertHyperlinks = a3;
    result->mConvertAttachments = a4;
  }
  return result;
}

- (TSWPNSAttributedStringAttachmentConversionDelegate)init
{
  return [(TSWPNSAttributedStringAttachmentConversionDelegate *)self initWithConvertHyperlinks:1 convertGraphicalAttachments:1];
}

- (id)attachmentStringForDrawableAttachment:(id)a3
{
  return 0;
}

- (id)urlForHyperlinkField:(id)a3
{
  if (!self->mConvertHyperlinks) {
    return 0;
  }
  v4 = (void *)[a3 canonicalRepresentationURL];
  if ([a3 scheme] > 2) {
    return v4;
  }

  return (id)[a3 url];
}

@end