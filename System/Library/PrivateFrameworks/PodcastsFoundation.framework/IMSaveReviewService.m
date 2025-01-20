@interface IMSaveReviewService
- (IMSaveReviewService)initWithEndpointURL:(id)a3 bodyData:(id)a4;
- (NSData)bodyData;
- (NSURL)endpointURL;
- (id)generatedEndpointURLForBaseURL:(id)a3;
- (id)urlRequest;
- (void)performDataRequestWithCompletion:(id)a3;
- (void)setBodyData:(id)a3;
- (void)setEndpointURL:(id)a3;
@end

@implementation IMSaveReviewService

- (IMSaveReviewService)initWithEndpointURL:(id)a3 bodyData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSaveReviewService;
  v8 = [(IMBaseStoreService *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(IMSaveReviewService *)v8 setBodyData:v7];
    v10 = [(IMSaveReviewService *)v9 generatedEndpointURLForBaseURL:v6];
    [(IMSaveReviewService *)v9 setEndpointURL:v10];

    [(IMBaseStoreService *)v9 setPersonalizeRequests:1];
  }

  return v9;
}

- (id)generatedEndpointURLForBaseURL:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  v4 = [MEMORY[0x1E4F290C8] queryItemWithName:@"type" value:@"Podcast"];
  v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"version" value:@"2"];
  v9[0] = v5;
  v9[1] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v3 setQueryItems:v6];

  id v7 = [v3 URL];

  return v7;
}

- (void)performDataRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(IMSaveReviewService *)self urlRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__IMSaveReviewService_performDataRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E5E61310;
  id v8 = v4;
  id v6 = v4;
  [(IMBaseStoreService *)self performDataRequest:v5 callback:v7];
}

uint64_t __56__IMSaveReviewService_performDataRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a5);
  }
  return result;
}

- (id)urlRequest
{
  v3 = (void *)MEMORY[0x1E4F28E88];
  id v4 = [(IMSaveReviewService *)self endpointURL];
  v5 = [v3 requestWithURL:v4];

  [v5 setHTTPMethod:@"POST"];
  id v6 = [(IMSaveReviewService *)self bodyData];
  [v5 setHTTPBody:v6];

  return v5;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
}

@end