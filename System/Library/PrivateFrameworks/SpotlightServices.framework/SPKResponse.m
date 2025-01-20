@interface SPKResponse
- (BOOL)corespotlightFinished;
- (BOOL)didReceiveLaterThanRenderTimeout;
- (BOOL)isRewrite;
- (BOOL)metadataFinished;
- (BOOL)noChangeInResultsSinceLastResponse;
- (BOOL)parsecFinished;
- (BOOL)queryResponseComplete;
- (BOOL)suggestionsAreBlended;
- (BOOL)topHitIsIn;
- (NSArray)added;
- (NSArray)changed;
- (NSArray)localSuggestionResults;
- (NSArray)removed;
- (NSArray)sections;
- (NSArray)serverSuggestionResults;
- (NSDictionary)groupedResults;
- (NSError)error;
- (NSString)correctedQuery;
- (NSString)fbq;
- (NSString)userQueryString;
- (PRSRankingConfiguration)rankingConfiguration;
- (SPKResponse)initWithQueryID:(unint64_t)a3 error:(id)a4;
- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5;
- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5 groupedResults:(id)a6;
- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5 groupedResults:(id)a6 error:(id)a7;
- (SPKResponse)initWithQueryID:(unint64_t)a3 sections:(id)a4;
- (id)description;
- (int)kind;
- (unint64_t)queryId;
- (void)setCorespotlightFinished:(BOOL)a3;
- (void)setCorrectedQuery:(id)a3;
- (void)setDidReceiveLaterThanRenderTimeout:(BOOL)a3;
- (void)setFbq:(id)a3;
- (void)setIsRewrite:(BOOL)a3;
- (void)setLocalSuggestionResults:(id)a3;
- (void)setMetadataFinished:(BOOL)a3;
- (void)setNoChangeInResultsSinceLastResponse:(BOOL)a3;
- (void)setParsecFinished:(BOOL)a3;
- (void)setQueryResponseComplete:(BOOL)a3;
- (void)setRankingConfiguration:(id)a3;
- (void)setServerSuggestionResults:(id)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
- (void)setTopHitIsIn:(BOOL)a3;
- (void)setUserQueryString:(id)a3;
@end

@implementation SPKResponse

- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5 groupedResults:(id)a6 error:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v38.receiver = self;
  v38.super_class = (Class)SPKResponse;
  v15 = [(SPKResponse *)&v38 init];
  v16 = v15;
  if (v15)
  {
    v15->_queryId = a3;
    uint64_t v17 = [v13 copy];
    groupedResults = v16->_groupedResults;
    v16->_groupedResults = (NSDictionary *)v17;

    v16->_kind = a4;
    objc_storeStrong((id *)&v16->_error, a7);
    uint64_t v19 = objc_opt_new();
    rankingConfiguration = v16->_rankingConfiguration;
    v16->_rankingConfiguration = (PRSRankingConfiguration *)v19;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      id v33 = v14;
      v24 = 0;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (!v24) {
            v24 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
          }
          v28 = [v27 mutableDeepCopy];
          [(NSArray *)v24 addObject:v28];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v23);

      id v14 = v33;
      if (v24)
      {
        uint64_t v29 = [(NSArray *)v24 copy];
        sections = v16->_sections;
        v16->_sections = (NSArray *)v29;

LABEL_15:
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v31 = [v21 copy];
    v24 = v16->_sections;
    v16->_sections = (NSArray *)v31;
    goto LABEL_15;
  }
LABEL_16:

  return v16;
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5 groupedResults:(id)a6
{
  return [(SPKResponse *)self initWithQueryID:a3 kind:*(void *)&a4 sections:a5 groupedResults:a6 error:0];
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 kind:(int)a4 sections:(id)a5
{
  return [(SPKResponse *)self initWithQueryID:a3 kind:*(void *)&a4 sections:a5 groupedResults:0 error:0];
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 sections:(id)a4
{
  return [(SPKResponse *)self initWithQueryID:a3 kind:4 sections:a4 groupedResults:0 error:0];
}

- (SPKResponse)initWithQueryID:(unint64_t)a3 error:(id)a4
{
  return [(SPKResponse *)self initWithQueryID:a3 kind:0 sections:0 groupedResults:0 error:a4];
}

- (id)description
{
  if ([(SPKResponse *)self kind]
    && ([(SPKResponse *)self error], v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    id v13 = [(SPKResponse *)self userQueryString];

    id v14 = NSString;
    unsigned int v15 = [(SPKResponse *)self kind];
    if (!v13)
    {
      if (v15 > 5) {
        uint64_t v17 = @"unknown";
      }
      else {
        uint64_t v17 = off_1E634C150[v15];
      }
      v8 = [(SPKResponse *)self sections];
      v11 = [v14 stringWithFormat:@"<response:%@ sections:%@>", v17, v8];
      goto LABEL_11;
    }
    if (v15 > 5) {
      v16 = @"unknown";
    }
    else {
      v16 = off_1E634C150[v15];
    }
    v8 = [(SPKResponse *)self userQueryString];
    v10 = [(SPKResponse *)self sections];
    [v14 stringWithFormat:@"<response:%@ userQueryString:%@ sections:%@>", v16, v8, v10];
  }
  else
  {
    v4 = NSString;
    unsigned int v5 = [(SPKResponse *)self kind];
    if (v5 > 5) {
      v6 = @"unknown";
    }
    else {
      v6 = off_1E634C150[v5];
    }
    uint64_t v7 = [(SPKResponse *)self userQueryString];
    v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = @"nil";
    }
    v10 = [(SPKResponse *)self error];
    [v4 stringWithFormat:@"<response:%@ userQueryString:%@ error:%@>", v6, v9, v10];
  v11 = };

LABEL_11:
  return v11;
}

- (PRSRankingConfiguration)rankingConfiguration
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRankingConfiguration:(id)a3
{
}

- (int)kind
{
  return self->_kind;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)groupedResults
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)topHitIsIn
{
  return self->_topHitIsIn;
}

- (void)setTopHitIsIn:(BOOL)a3
{
  self->_topHitIsIn = a3;
}

- (BOOL)noChangeInResultsSinceLastResponse
{
  return self->_noChangeInResultsSinceLastResponse;
}

- (void)setNoChangeInResultsSinceLastResponse:(BOOL)a3
{
  self->_noChangeInResultsSinceLastResponse = a3;
}

- (BOOL)parsecFinished
{
  return self->_parsecFinished;
}

- (void)setParsecFinished:(BOOL)a3
{
  self->_parsecFinished = a3;
}

- (BOOL)metadataFinished
{
  return self->_metadataFinished;
}

- (void)setMetadataFinished:(BOOL)a3
{
  self->_metadataFinished = a3;
}

- (BOOL)corespotlightFinished
{
  return self->_corespotlightFinished;
}

- (void)setCorespotlightFinished:(BOOL)a3
{
  self->_corespotlightFinished = a3;
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFbq:(id)a3
{
}

- (BOOL)queryResponseComplete
{
  return self->_queryResponseComplete;
}

- (void)setQueryResponseComplete:(BOOL)a3
{
  self->_queryResponseComplete = a3;
}

- (NSString)userQueryString
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUserQueryString:(id)a3
{
}

- (BOOL)isRewrite
{
  return self->_isRewrite;
}

- (void)setIsRewrite:(BOOL)a3
{
  self->_isRewrite = a3;
}

- (BOOL)didReceiveLaterThanRenderTimeout
{
  return self->_didReceiveLaterThanRenderTimeout;
}

- (void)setDidReceiveLaterThanRenderTimeout:(BOOL)a3
{
  self->_didReceiveLaterThanRenderTimeout = a3;
}

- (NSString)correctedQuery
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCorrectedQuery:(id)a3
{
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (NSArray)serverSuggestionResults
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setServerSuggestionResults:(id)a3
{
}

- (NSArray)localSuggestionResults
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLocalSuggestionResults:(id)a3
{
}

- (NSArray)added
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)changed
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)removed
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_changed, 0);
  objc_storeStrong((id *)&self->_added, 0);
  objc_storeStrong((id *)&self->_localSuggestionResults, 0);
  objc_storeStrong((id *)&self->_serverSuggestionResults, 0);
  objc_storeStrong((id *)&self->_correctedQuery, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_groupedResults, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rankingConfiguration, 0);
}

@end