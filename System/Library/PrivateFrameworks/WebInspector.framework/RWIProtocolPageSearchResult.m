@interface RWIProtocolPageSearchResult
- (NSString)frameId;
- (NSString)requestId;
- (NSString)url;
- (RWIProtocolPageSearchResult)initWithUrl:(id)a3 frameId:(id)a4 matchesCount:(double)a5;
- (double)matchesCount;
- (void)setFrameId:(id)a3;
- (void)setMatchesCount:(double)a3;
- (void)setRequestId:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolPageSearchResult

- (RWIProtocolPageSearchResult)initWithUrl:(id)a3 frameId:(id)a4 matchesCount:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RWIProtocolPageSearchResult;
  v10 = [(RWIProtocolJSONObject *)&v13 init];
  if (v10)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"frameId" format];
    }
    [(RWIProtocolPageSearchResult *)v10 setUrl:v8];
    [(RWIProtocolPageSearchResult *)v10 setFrameId:v9];
    [(RWIProtocolPageSearchResult *)v10 setMatchesCount:a5];
    v11 = v10;
  }

  return v10;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageSearchResult;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setFrameId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"frameId"];
}

- (NSString)frameId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageSearchResult;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"frameId"];
  return (NSString *)v2;
}

- (void)setMatchesCount:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"matchesCount" forKey:a3];
}

- (double)matchesCount
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"matchesCount"];
  return result;
}

- (void)setRequestId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageSearchResult;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"requestId"];
}

- (NSString)requestId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageSearchResult;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"requestId"];
  return (NSString *)v2;
}

@end