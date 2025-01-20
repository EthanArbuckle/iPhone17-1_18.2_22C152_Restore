@interface SAUINanoImageResource
+ (id)nanoImageResource;
- (BOOL)backgroundNeeded;
- (NSString)imageDownloadType;
- (NSString)placeholderImage;
- (SAUIDecoratedText)monogram;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundNeeded:(BOOL)a3;
- (void)setImageDownloadType:(id)a3;
- (void)setMonogram:(id)a3;
- (void)setPlaceholderImage:(id)a3;
@end

@implementation SAUINanoImageResource

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"NanoImageResource";
}

+ (id)nanoImageResource
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)backgroundNeeded
{
  return AceObjectBoolForProperty(self, @"backgroundNeeded");
}

- (void)setBackgroundNeeded:(BOOL)a3
{
}

- (NSString)imageDownloadType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imageDownloadType"];
}

- (void)setImageDownloadType:(id)a3
{
}

- (SAUIDecoratedText)monogram
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"monogram");
}

- (void)setMonogram:(id)a3
{
}

- (NSString)placeholderImage
{
  return (NSString *)[(AceObject *)self propertyForKey:@"placeholderImage"];
}

- (void)setPlaceholderImage:(id)a3
{
}

@end