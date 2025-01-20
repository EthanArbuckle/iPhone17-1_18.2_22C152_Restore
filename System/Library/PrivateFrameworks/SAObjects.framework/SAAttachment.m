@interface SAAttachment
+ (id)attachment;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAttachment

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Attachment";
}

+ (id)attachment
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end