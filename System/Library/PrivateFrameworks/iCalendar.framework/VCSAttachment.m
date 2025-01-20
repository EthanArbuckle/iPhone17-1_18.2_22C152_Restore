@interface VCSAttachment
- (VCSAttachment)initWithURL:(id)a3;
@end

@implementation VCSAttachment

- (VCSAttachment)initWithURL:(id)a3
{
  return [(VCSPropertyValue *)self initWithValue:a3 type:6];
}

@end