@interface TBTileRemoteFetchResponse
+ (id)responseWithTileItems:(id)a3;
- (TBTileRemoteFetchResponse)initWithTileItems:(id)a3;
@end

@implementation TBTileRemoteFetchResponse

+ (id)responseWithTileItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTileItems:v4];

  return v5;
}

- (TBTileRemoteFetchResponse)initWithTileItems:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = 0;
  }
  else
  {
    v7 = [TBError alloc];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"No results returned from remote source";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v6 = [(TBError *)v7 initWithType:154 userInfo:v8];
  }
  v11.receiver = self;
  v11.super_class = (Class)TBTileRemoteFetchResponse;
  v9 = [(TBRemoteFetchResponse *)&v11 initWithResults:0 tiles:v5 error:v6];

  return v9;
}

@end