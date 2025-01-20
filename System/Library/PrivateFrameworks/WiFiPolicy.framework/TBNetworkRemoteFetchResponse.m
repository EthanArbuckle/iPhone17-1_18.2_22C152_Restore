@interface TBNetworkRemoteFetchResponse
+ (id)responseWithNetworkSearchResults:(id)a3;
- (GEOWiFiQualityNetworkSearchResult)networkSearchResult;
- (TBNetworkRemoteFetchResponse)initWithNetworkSearchResults:(id)a3;
- (void)setNetworkSearchResult:(id)a3;
@end

@implementation TBNetworkRemoteFetchResponse

+ (id)responseWithNetworkSearchResults:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithNetworkSearchResults:v4];

  return v5;
}

- (TBNetworkRemoteFetchResponse)initWithNetworkSearchResults:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  if ((unint64_t)[v4 count] >= 2) {
    NSLog(&cfstr_SGeowifiqualit.isa, "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]", [v4 count]);
  }
  v6 = [v5 matches];
  v7 = [v6 objectAtIndexedSubscript:0];

  v8 = [v5 matches];
  unint64_t v9 = [v8 count];

  if (v9 >= 2) {
    NSLog(&cfstr_SGeowifiessmat.isa, "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]", [v4 count]);
  }
  NSLog(&cfstr_SResultCountLu.isa, "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]", [v4 count]);
  if ([v7 status] != 1)
  {
    NSLog(&cfstr_SMatchStatusIs.isa, "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]");
    v14 = [TBError alloc];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20 = @"No results returned from remote source";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v15 = [(TBError *)v14 initWithType:154 userInfo:v11];
LABEL_10:
    v13 = (void *)v15;
    v12 = 0;
    goto LABEL_11;
  }
  v10 = [v7 ess];

  if (!v10)
  {
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"nil ess from response";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v15 = +[TBError responseErrorWithUserInfo:v11];
    goto LABEL_10;
  }
  v11 = [v7 ess];
  v23[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v13 = 0;
LABEL_11:

  v18.receiver = self;
  v18.super_class = (Class)TBNetworkRemoteFetchResponse;
  v16 = [(TBRemoteFetchResponse *)&v18 initWithResults:v12 tiles:0 error:v13];

  return v16;
}

- (GEOWiFiQualityNetworkSearchResult)networkSearchResult
{
  return self->_networkSearchResult;
}

- (void)setNetworkSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end