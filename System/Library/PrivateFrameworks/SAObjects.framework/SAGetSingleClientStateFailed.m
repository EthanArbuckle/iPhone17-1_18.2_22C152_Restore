@interface SAGetSingleClientStateFailed
+ (id)getSingleClientStateFailed;
+ (id)getSingleClientStateFailedWithErrorCode:(int64_t)a3;
+ (id)getSingleClientStateFailedWithReason:(id)a3;
- (BOOL)requiresResponse;
- (NSString)reason;
- (SAAceClientState)attemptedClientState;
- (SAGetSingleClientStateFailed)initWithErrorCode:(int64_t)a3;
- (SAGetSingleClientStateFailed)initWithReason:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)errorCode;
- (void)setAttemptedClientState:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setReason:(id)a3;
@end

@implementation SAGetSingleClientStateFailed

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetSingleClientStateFailed";
}

+ (id)getSingleClientStateFailed
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)getSingleClientStateFailedWithErrorCode:(int64_t)a3
{
  v3 = [[SAGetSingleClientStateFailed alloc] initWithErrorCode:a3];
  return v3;
}

+ (id)getSingleClientStateFailedWithReason:(id)a3
{
  id v3 = a3;
  v4 = [[SAGetSingleClientStateFailed alloc] initWithReason:v3];

  return v4;
}

- (SAGetSingleClientStateFailed)initWithErrorCode:(int64_t)a3
{
  v4 = [(AceObject *)self init];
  v5 = v4;
  if (v4) {
    [(SAGetSingleClientStateFailed *)v4 setErrorCode:a3];
  }
  return v5;
}

- (SAGetSingleClientStateFailed)initWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAGetSingleClientStateFailed *)v5 setReason:v4];
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

- (SAAceClientState)attemptedClientState
{
  return (SAAceClientState *)AceObjectAceObjectForProperty(self, @"attemptedClientState");
}

- (void)setAttemptedClientState:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end