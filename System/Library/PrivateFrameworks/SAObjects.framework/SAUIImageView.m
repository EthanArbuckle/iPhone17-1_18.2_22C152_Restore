@interface SAUIImageView
+ (id)imageView;
- (NSArray)commands;
- (NSNumber)tintColor;
- (NSString)descriptionText;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setImage:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation SAUIImageView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ImageView";
}

+ (id)imageView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"descriptionText"];
}

- (void)setDescriptionText:(id)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSNumber)tintColor
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"tintColor"];
}

- (void)setTintColor:(id)a3
{
}

@end