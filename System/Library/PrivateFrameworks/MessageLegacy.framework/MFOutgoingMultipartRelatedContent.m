@interface MFOutgoingMultipartRelatedContent
- (NSString)htmlBody;
- (id)copy;
- (void)dealloc;
- (void)setHtmlBody:(id)a3;
@end

@implementation MFOutgoingMultipartRelatedContent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMultipartRelatedContent;
  [(MFOutgoingRichtextMessageContent *)&v3 dealloc];
}

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

@end