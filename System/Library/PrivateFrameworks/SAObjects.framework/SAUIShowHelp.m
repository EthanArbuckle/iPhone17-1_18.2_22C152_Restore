@interface SAUIShowHelp
+ (id)showHelp;
- (BOOL)requiresResponse;
- (NSString)speakableText;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSpeakableText:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAUIShowHelp

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ShowHelp";
}

+ (id)showHelp
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)speakableText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableText"];
}

- (void)setSpeakableText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end