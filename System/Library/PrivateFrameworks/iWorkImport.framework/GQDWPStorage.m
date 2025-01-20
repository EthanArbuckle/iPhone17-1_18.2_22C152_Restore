@interface GQDWPStorage
- (__CFArray)attachments;
- (id)stylesheet;
- (void)dealloc;
@end

@implementation GQDWPStorage

- (void)dealloc
{
  mBody = self->mBody;
  if (mBody) {
    CFRelease(mBody);
  }
  mAttachments = self->mAttachments;
  if (mAttachments) {
    CFRelease(mAttachments);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDWPStorage;
  [(GQDWPStorage *)&v5 dealloc];
}

- (id)stylesheet
{
  return self->mStylesheet;
}

- (__CFArray)attachments
{
  return self->mAttachments;
}

@end