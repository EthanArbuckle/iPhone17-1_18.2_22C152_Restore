@interface VSSAMLRequestFactory
+ (id)attributeQueryWithAttributeNames:(id)a3 channelID:(id)a4 authNResponse:(id)a5 error:(id *)a6;
+ (id)authNRequestWithResponse:(id)a3 forced:(BOOL)a4 error:(id *)a5;
+ (id)logoutRequestWithError:(id *)a3;
@end

@implementation VSSAMLRequestFactory

+ (id)authNRequestWithResponse:(id)a3 forced:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = VSSharedSAMLParserController();
  v9 = (void *)[v8 newAuthNRequest:@"com.apple.VideoSubscriberAccount.SAML" error:a5];

  if (v7 && v9)
  {
    [v9 setSubjectFromResponse:v7];
    [v9 setForceAuthN:v6];
  }

  return v9;
}

+ (id)attributeQueryWithAttributeNames:(id)a3 channelID:(id)a4 authNResponse:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = VSSharedSAMLParserController();
  v13 = (void *)[v12 newAttributeQuery:v10 error:a6];

  if (v13)
  {
    [v13 setSubjectFromResponse:v11];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v13, "addAttribute:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
  return v13;
}

+ (id)logoutRequestWithError:(id *)a3
{
  v4 = VSSharedSAMLParserController();
  v5 = (void *)[v4 newLogoutRequest:a3];

  return v5;
}

@end