@interface CXHandoffContext
+ (id)providerIdentifierForHandoffActivityUserInfo:(id)a3;
- (NSDictionary)handoffActivityUserInfo;
- (id)initWithHandoffActivityUserInfo:(id)a3;
@end

@implementation CXHandoffContext

- (id)initWithHandoffActivityUserInfo:(id)a3
{
  uint64_t v4 = TUCallUserActivityProviderIdentifierKey;
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    self = [(CXHandoffContext *)self initWithDictionaryRepresentation:v5];
    v7 = v5;
  }
  else
  {
    v7 = [v5 objectForKeyedSubscript:@"TUCallUserActivityCTInfoKey"];

    v8 = [v7 objectForKeyedSubscript:@"kCTCallDirection"];
    uint64_t v9 = [v7 objectForKeyedSubscript:@"kCTCallPhoneNumber"];
    v10 = (void *)v9;
    if (v8
      && v9
      && (+[NSUUID UUID],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 UUIDString],
          v12 = objc_claimAutoreleasedReturnValue(),
          self = [(CXHandoffContext *)self initWithHandoffIdentifier:v12],
          v12,
          v11,
          self))
    {
      -[CXHandoffContext setOutgoing:](self, "setOutgoing:", [v8 isEqualToString:@"kCTCallDirectionOutgoing"]);
      id v13 = [objc_alloc((Class)CXHandle) initWithType:2 value:v10];
      [(CXHandoffContext *)self setRemoteHandle:v13];

      [(CXHandoffContext *)self setContext:v7];
    }
    else
    {

      self = 0;
    }
  }
  return self;
}

- (NSDictionary)handoffActivityUserInfo
{
  v3 = [(CXHandoffContext *)self dictionaryRepresentation];
  id v4 = [v3 mutableCopy];

  id v5 = [(CXHandoffContext *)self context];
  id v6 = [v5 mutableCopy];

  if ([(CXHandoffContext *)self isOutgoing]) {
    CFStringRef v7 = @"kCTCallDirectionOutgoing";
  }
  else {
    CFStringRef v7 = @"kCTCallDirectionIncoming";
  }
  [v6 setObject:v7 forKeyedSubscript:@"kCTCallDirection"];
  v8 = [(CXHandoffContext *)self remoteHandle];
  uint64_t v9 = [v8 value];
  [v6 setObject:v9 forKeyedSubscript:@"kCTCallPhoneNumber"];

  id v10 = [v6 copy];
  [v4 setObject:v10 forKeyedSubscript:@"TUCallUserActivityCTInfoKey"];

  [v4 setObject:&off_100523A40 forKeyedSubscript:@"TUCallUserActivityServiceKey"];
  id v11 = [v4 copy];

  return (NSDictionary *)v11;
}

+ (id)providerIdentifierForHandoffActivityUserInfo:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:TUCallUserActivityProviderIdentifierKey];
  id v4 = v3;
  if (!v3) {
    v3 = @"com.apple.coretelephony";
  }
  id v5 = v3;

  return v5;
}

@end