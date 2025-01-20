@interface MFOutgoingMessageContent
- (MFMutableMessageHeaders)headers;
- (MFOutgoingLibraryMessageContent)libraryContent;
- (MFOutgoingMultipartRelatedContent)multipartContent;
- (MFOutgoingRichtextMessageContent)richtextContent;
- (NSArray)placeholders;
- (id)copy;
- (void)setHeaders:(id)a3;
- (void)setPlaceholders:(id)a3;
@end

@implementation MFOutgoingMessageContent

- (id)copy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [v3 setHeaders:self->_headers];
  [v3 setPlaceholders:self->_placeholders];
  return v3;
}

- (MFOutgoingLibraryMessageContent)libraryContent
{
  return 0;
}

- (MFOutgoingRichtextMessageContent)richtextContent
{
  return 0;
}

- (MFOutgoingMultipartRelatedContent)multipartContent
{
  return 0;
}

- (MFMutableMessageHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSArray)placeholders
{
  return self->_placeholders;
}

- (void)setPlaceholders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end