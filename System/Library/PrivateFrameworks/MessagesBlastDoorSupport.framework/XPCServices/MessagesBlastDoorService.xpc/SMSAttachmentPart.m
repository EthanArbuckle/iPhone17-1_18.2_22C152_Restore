@interface SMSAttachmentPart
- (NSString)contentLocation;
- (SMSAttachmentPart)initWithContentLocation:(id)a3;
@end

@implementation SMSAttachmentPart

- (SMSAttachmentPart)initWithContentLocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMSAttachmentPart;
  v5 = [(SMSAttachmentPart *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = v6;
  }
  return v5;
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (void).cxx_destruct
{
}

@end