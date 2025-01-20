@interface ICASSearchSelectionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASGmRankingStrategyType)gmRankingStrategyType;
- (ICASSearchSelectionData)initWithSelectedResultID:(id)a3 selectedResultAccountType:(id)a4 selectedResultType:(id)a5 gmRankingStrategyType:(id)a6 gmRank:(id)a7 searchRankingExperimentSummary:(id)a8 gmRankIOS13:(id)a9 charLengthOfQueryString:(id)a10 isNoteFoundByAttachment:(id)a11 isTopHit:(id)a12;
- (ICASSelectedResultAccountType)selectedResultAccountType;
- (ICASSelectedResultType)selectedResultType;
- (NSArray)searchRankingExperimentSummary;
- (NSNumber)charLengthOfQueryString;
- (NSNumber)gmRank;
- (NSNumber)gmRankIOS13;
- (NSNumber)isNoteFoundByAttachment;
- (NSNumber)isTopHit;
- (NSString)selectedResultID;
- (id)toDict;
@end

@implementation ICASSearchSelectionData

- (ICASSearchSelectionData)initWithSelectedResultID:(id)a3 selectedResultAccountType:(id)a4 selectedResultType:(id)a5 gmRankingStrategyType:(id)a6 gmRank:(id)a7 searchRankingExperimentSummary:(id)a8 gmRankIOS13:(id)a9 charLengthOfQueryString:(id)a10 isNoteFoundByAttachment:(id)a11 isTopHit:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)ICASSearchSelectionData;
  v22 = [(ICASSearchSelectionData *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_selectedResultID, a3);
    objc_storeStrong((id *)&v23->_selectedResultAccountType, obj);
    objc_storeStrong((id *)&v23->_selectedResultType, a5);
    objc_storeStrong((id *)&v23->_gmRankingStrategyType, v26);
    objc_storeStrong((id *)&v23->_gmRank, v27);
    objc_storeStrong((id *)&v23->_searchRankingExperimentSummary, a8);
    objc_storeStrong((id *)&v23->_gmRankIOS13, a9);
    objc_storeStrong((id *)&v23->_charLengthOfQueryString, a10);
    objc_storeStrong((id *)&v23->_isNoteFoundByAttachment, a11);
    objc_storeStrong((id *)&v23->_isTopHit, a12);
  }

  return v23;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchSelectionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v36[10] = *MEMORY[0x1E4F143B8];
  v35[0] = @"selectedResultID";
  id v34 = [(ICASSearchSelectionData *)self selectedResultID];
  if (v34)
  {
    uint64_t v3 = [(ICASSearchSelectionData *)self selectedResultID];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v33 = (void *)v3;
  v36[0] = v3;
  v35[1] = @"selectedResultAccountType";
  id v32 = [(ICASSearchSelectionData *)self selectedResultAccountType];
  if (v32)
  {
    uint64_t v4 = [(ICASSearchSelectionData *)self selectedResultAccountType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v31 = (void *)v4;
  v36[1] = v4;
  v35[2] = @"selectedResultType";
  id v30 = [(ICASSearchSelectionData *)self selectedResultType];
  if (v30)
  {
    uint64_t v5 = [(ICASSearchSelectionData *)self selectedResultType];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v29 = (void *)v5;
  v36[2] = v5;
  v35[3] = @"gmRankingStrategyType";
  v28 = [(ICASSearchSelectionData *)self gmRankingStrategyType];
  if (v28)
  {
    uint64_t v6 = [(ICASSearchSelectionData *)self gmRankingStrategyType];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v27 = (void *)v6;
  v36[3] = v6;
  v35[4] = @"gmRank";
  id v26 = [(ICASSearchSelectionData *)self gmRank];
  if (v26)
  {
    uint64_t v7 = [(ICASSearchSelectionData *)self gmRank];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v25 = (void *)v7;
  v36[4] = v7;
  v35[5] = @"searchRankingExperimentSummary";
  v24 = [(ICASSearchSelectionData *)self searchRankingExperimentSummary];
  if (v24)
  {
    uint64_t v8 = [(ICASSearchSelectionData *)self searchRankingExperimentSummary];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v36[5] = v8;
  v35[6] = @"gmRankIOS13";
  v10 = [(ICASSearchSelectionData *)self gmRankIOS13];
  if (v10)
  {
    uint64_t v11 = [(ICASSearchSelectionData *)self gmRankIOS13];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v36[6] = v11;
  v35[7] = @"charLengthOfQueryString";
  v13 = [(ICASSearchSelectionData *)self charLengthOfQueryString];
  if (v13)
  {
    uint64_t v14 = [(ICASSearchSelectionData *)self charLengthOfQueryString];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v36[7] = v14;
  v35[8] = @"isNoteFoundByAttachment";
  v16 = [(ICASSearchSelectionData *)self isNoteFoundByAttachment];
  if (v16)
  {
    uint64_t v17 = [(ICASSearchSelectionData *)self isNoteFoundByAttachment];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  id v18 = (void *)v17;
  v36[8] = v17;
  v35[9] = @"isTopHit";
  id v19 = [(ICASSearchSelectionData *)self isTopHit];
  if (v19)
  {
    uint64_t v20 = [(ICASSearchSelectionData *)self isTopHit];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  id v21 = (void *)v20;
  v36[9] = v20;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:10];

  return v22;
}

- (NSString)selectedResultID
{
  return self->_selectedResultID;
}

- (ICASSelectedResultAccountType)selectedResultAccountType
{
  return self->_selectedResultAccountType;
}

- (ICASSelectedResultType)selectedResultType
{
  return self->_selectedResultType;
}

- (ICASGmRankingStrategyType)gmRankingStrategyType
{
  return self->_gmRankingStrategyType;
}

- (NSNumber)gmRank
{
  return self->_gmRank;
}

- (NSArray)searchRankingExperimentSummary
{
  return self->_searchRankingExperimentSummary;
}

- (NSNumber)gmRankIOS13
{
  return self->_gmRankIOS13;
}

- (NSNumber)charLengthOfQueryString
{
  return self->_charLengthOfQueryString;
}

- (NSNumber)isNoteFoundByAttachment
{
  return self->_isNoteFoundByAttachment;
}

- (NSNumber)isTopHit
{
  return self->_isTopHit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isTopHit, 0);
  objc_storeStrong((id *)&self->_isNoteFoundByAttachment, 0);
  objc_storeStrong((id *)&self->_charLengthOfQueryString, 0);
  objc_storeStrong((id *)&self->_gmRankIOS13, 0);
  objc_storeStrong((id *)&self->_searchRankingExperimentSummary, 0);
  objc_storeStrong((id *)&self->_gmRank, 0);
  objc_storeStrong((id *)&self->_gmRankingStrategyType, 0);
  objc_storeStrong((id *)&self->_selectedResultType, 0);
  objc_storeStrong((id *)&self->_selectedResultAccountType, 0);
  objc_storeStrong((id *)&self->_selectedResultID, 0);
}

@end