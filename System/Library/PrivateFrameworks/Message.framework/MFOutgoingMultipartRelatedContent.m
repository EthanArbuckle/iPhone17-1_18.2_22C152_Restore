@interface MFOutgoingMultipartRelatedContent
- (NSString)htmlBody;
- (id)copy;
- (void)setHtmlBody:(id)a3;
@end

@implementation MFOutgoingMultipartRelatedContent

- (id)copy
{
  v5.receiver = self;
  v5.super_class = (Class)MFOutgoingMultipartRelatedContent;
  id v3 = [(MFOutgoingRichtextMessageContent *)&v5 copy];
  [v3 setHtmlBody:self->_htmlBody];
  return v3;
}

- (NSString)htmlBody
{
  return self->_htmlBody;
}

- (void)setHtmlBody:(id)a3
{
}

- (void).cxx_destruct
{
}

@end