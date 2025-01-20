@interface SAMPGeniusSummonFailed
+ (id)geniusSummonFailed;
+ (id)geniusSummonFailedWithErrorCode:(int64_t)a3;
+ (id)geniusSummonFailedWithReason:(id)a3;
- (BOOL)requiresResponse;
- (NSString)reason;
- (SAMPGeniusSummonFailed)initWithErrorCode:(int64_t)a3;
- (SAMPGeniusSummonFailed)initWithReason:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setReason:(id)a3;
@end

@implementation SAMPGeniusSummonFailed

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GeniusSummonFailed";
}

+ (id)geniusSummonFailed
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)geniusSummonFailedWithErrorCode:(int64_t)a3
{
  v3 = [[SAMPGeniusSummonFailed alloc] initWithErrorCode:a3];
  return v3;
}

+ (id)geniusSummonFailedWithReason:(id)a3
{
  id v3 = a3;
  v4 = [[SAMPGeniusSummonFailed alloc] initWithReason:v3];

  return v4;
}

- (SAMPGeniusSummonFailed)initWithErrorCode:(int64_t)a3
{
  v4 = [(AceObject *)self init];
  v5 = v4;
  if (v4) {
    [(SAMPGeniusSummonFailed *)v4 setErrorCode:a3];
  }
  return v5;
}

- (SAMPGeniusSummonFailed)initWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAMPGeniusSummonFailed *)v5 setReason:v4];
  }

  return v6;
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, @"errorCode");
}

- (void)setErrorCode:(int64_t)a3
{
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end