@interface SADialogInflectWordResponse
+ (id)inflectWordResponse;
- (BOOL)requiresResponse;
- (NSString)print;
- (NSString)speak;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPrint:(id)a3;
- (void)setSpeak:(id)a3;
@end

@implementation SADialogInflectWordResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.dialog";
}

- (id)encodedClassName
{
  return @"InflectWordResponse";
}

+ (id)inflectWordResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)print
{
  return (NSString *)[(AceObject *)self propertyForKey:@"print"];
}

- (void)setPrint:(id)a3
{
}

- (NSString)speak
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speak"];
}

- (void)setSpeak:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end