@interface RAPBatchSubmissionStatusResult
- (NSArray)inReviewSubmissionIdentifiers;
- (NSArray)rapInfos;
- (NSArray)reviewedSubmissionIdentifiers;
- (RAPBatchSubmissionStatusResult)initWithRAPInfos:(id)a3;
- (void)_setupResultWithRAPInfos:(id)a3;
- (void)setInReviewSubmissionIdentifiers:(id)a3;
- (void)setRapInfos:(id)a3;
- (void)setReviewedSubmissionIdentifiers:(id)a3;
@end

@implementation RAPBatchSubmissionStatusResult

- (RAPBatchSubmissionStatusResult)initWithRAPInfos:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPBatchSubmissionStatusResult;
  v6 = [(RAPBatchSubmissionStatusResult *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rapInfos, a3);
    [(RAPBatchSubmissionStatusResult *)v7 _setupResultWithRAPInfos:v5];
  }

  return v7;
}

- (void)_setupResultWithRAPInfos:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v13 = [v12 isReviewed:v20];
        v14 = [v12 rapId];
        if (v13) {
          v15 = v5;
        }
        else {
          v15 = v6;
        }
        [v15 addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v16 = (NSArray *)[v5 copy];
  reviewedSubmissionIdentifiers = self->_reviewedSubmissionIdentifiers;
  self->_reviewedSubmissionIdentifiers = v16;

  v18 = (NSArray *)[v6 copy];
  inReviewSubmissionIdentifiers = self->_inReviewSubmissionIdentifiers;
  self->_inReviewSubmissionIdentifiers = v18;
}

- (NSArray)reviewedSubmissionIdentifiers
{
  return self->_reviewedSubmissionIdentifiers;
}

- (void)setReviewedSubmissionIdentifiers:(id)a3
{
}

- (NSArray)inReviewSubmissionIdentifiers
{
  return self->_inReviewSubmissionIdentifiers;
}

- (void)setInReviewSubmissionIdentifiers:(id)a3
{
}

- (NSArray)rapInfos
{
  return self->_rapInfos;
}

- (void)setRapInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapInfos, 0);
  objc_storeStrong((id *)&self->_inReviewSubmissionIdentifiers, 0);

  objc_storeStrong((id *)&self->_reviewedSubmissionIdentifiers, 0);
}

@end