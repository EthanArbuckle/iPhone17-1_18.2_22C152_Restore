@interface BADeveloperDebugClientMessageVersionCheck
+ (BOOL)supportsSecureCoding;
- (BADeveloperDebugClientMessageVersionCheck)init;
@end

@implementation BADeveloperDebugClientMessageVersionCheck

- (BADeveloperDebugClientMessageVersionCheck)init
{
  v3.receiver = self;
  v3.super_class = (Class)BADeveloperDebugClientMessageVersionCheck;
  return [(BADeveloperDebugClientMessage *)&v3 initWithMessageOperation:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end