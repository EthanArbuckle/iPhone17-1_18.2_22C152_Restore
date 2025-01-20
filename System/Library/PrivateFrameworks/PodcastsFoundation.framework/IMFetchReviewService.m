@interface IMFetchReviewService
- (IMFetchReviewService)initWithAdamID:(id)a3;
- (NSString)adamID;
- (id)urlRequest;
- (void)performDataRequestWithCompletion:(id)a3;
- (void)setAdamID:(id)a3;
@end

@implementation IMFetchReviewService

- (IMFetchReviewService)initWithAdamID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMFetchReviewService;
  v5 = [(IMBaseStoreService *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(IMFetchReviewService *)v5 setAdamID:v4];
    [(IMBaseStoreService *)v6 setPersonalizeRequests:1];
  }

  return v6;
}

- (void)performDataRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(IMFetchReviewService *)self urlRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__IMFetchReviewService_performDataRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E5E61310;
  id v8 = v4;
  id v6 = v4;
  [(IMBaseStoreService *)self performDataRequest:v5 callback:v7];
}

uint64_t __57__IMFetchReviewService_performDataRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a5);
  }
  return result;
}

- (id)urlRequest
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v3 = [(IMBaseStoreService *)self bag];
  id v4 = [v3 URLForKey:@"p2-application-user-write-review"];

  if ([v4 isLoaded])
  {
    id v17 = 0;
    v5 = [v4 valueWithError:&v17];
    id v6 = v17;
    if (v5)
    {
LABEL_3:
      v7 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
      id v8 = (void *)MEMORY[0x1E4F290C8];
      v9 = [(IMFetchReviewService *)self adamID];
      v10 = [v8 queryItemWithName:@"id" value:v9];

      v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"version" value:@"2"];
      v18[0] = v11;
      v18[1] = v10;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      [v7 setQueryItems:v12];

      v13 = (void *)MEMORY[0x1E4F290D0];
      v14 = [v7 URL];
      v15 = [v13 requestWithURL:v14];

      goto LABEL_6;
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/writeUserReview"];
    id v6 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  v15 = 0;
LABEL_6:

  return v15;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end