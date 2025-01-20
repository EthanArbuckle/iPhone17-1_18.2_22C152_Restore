@interface SADialogText
- (NSString)speakableTextOverride;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSpeakableTextOverride:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SADialogText

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DialogText";
}

- (NSString)speakableTextOverride
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableTextOverride"];
}

- (void)setSpeakableTextOverride:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end