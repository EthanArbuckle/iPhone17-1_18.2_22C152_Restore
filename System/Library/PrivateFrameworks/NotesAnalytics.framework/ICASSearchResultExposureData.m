@interface ICASSearchResultExposureData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSearchResultExposureData)initWithTopHitCountForLongestSearchString:(id)a3 hasNonTopHitResultsForLongestSearchString:(id)a4 attachmentHitCountForLongestSearchString:(id)a5 searchBufferArray:(id)a6;
- (NSArray)searchBufferArray;
- (NSNumber)attachmentHitCountForLongestSearchString;
- (NSNumber)hasNonTopHitResultsForLongestSearchString;
- (NSNumber)topHitCountForLongestSearchString;
- (id)toDict;
@end

@implementation ICASSearchResultExposureData

- (ICASSearchResultExposureData)initWithTopHitCountForLongestSearchString:(id)a3 hasNonTopHitResultsForLongestSearchString:(id)a4 attachmentHitCountForLongestSearchString:(id)a5 searchBufferArray:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASSearchResultExposureData;
  v15 = [(ICASSearchResultExposureData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topHitCountForLongestSearchString, a3);
    objc_storeStrong((id *)&v16->_hasNonTopHitResultsForLongestSearchString, a4);
    objc_storeStrong((id *)&v16->_attachmentHitCountForLongestSearchString, a5);
    objc_storeStrong((id *)&v16->_searchBufferArray, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchResultExposureData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"topHitCountForLongestSearchString";
  v3 = [(ICASSearchResultExposureData *)self topHitCountForLongestSearchString];
  if (v3)
  {
    uint64_t v4 = [(ICASSearchResultExposureData *)self topHitCountForLongestSearchString];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"hasNonTopHitResultsForLongestSearchString";
  v6 = [(ICASSearchResultExposureData *)self hasNonTopHitResultsForLongestSearchString];
  if (v6)
  {
    uint64_t v7 = [(ICASSearchResultExposureData *)self hasNonTopHitResultsForLongestSearchString];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"attachmentHitCountForLongestSearchString";
  v9 = [(ICASSearchResultExposureData *)self attachmentHitCountForLongestSearchString];
  if (v9)
  {
    uint64_t v10 = [(ICASSearchResultExposureData *)self attachmentHitCountForLongestSearchString];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"searchBufferArray";
  id v12 = [(ICASSearchResultExposureData *)self searchBufferArray];
  if (v12)
  {
    uint64_t v13 = [(ICASSearchResultExposureData *)self searchBufferArray];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSNumber)topHitCountForLongestSearchString
{
  return self->_topHitCountForLongestSearchString;
}

- (NSNumber)hasNonTopHitResultsForLongestSearchString
{
  return self->_hasNonTopHitResultsForLongestSearchString;
}

- (NSNumber)attachmentHitCountForLongestSearchString
{
  return self->_attachmentHitCountForLongestSearchString;
}

- (NSArray)searchBufferArray
{
  return self->_searchBufferArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBufferArray, 0);
  objc_storeStrong((id *)&self->_attachmentHitCountForLongestSearchString, 0);
  objc_storeStrong((id *)&self->_hasNonTopHitResultsForLongestSearchString, 0);
  objc_storeStrong((id *)&self->_topHitCountForLongestSearchString, 0);
}

@end