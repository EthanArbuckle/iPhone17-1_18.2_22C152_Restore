@interface NSTextAttachment(UIImage)
+ (id)textAttachmentWithImage:()UIImage;
@end

@implementation NSTextAttachment(UIImage)

+ (id)textAttachmentWithImage:()UIImage
{
  id v3 = a3;
  id v4 = [[_UIImageTextAttachment alloc] _initWithImage:v3];

  return v4;
}

@end