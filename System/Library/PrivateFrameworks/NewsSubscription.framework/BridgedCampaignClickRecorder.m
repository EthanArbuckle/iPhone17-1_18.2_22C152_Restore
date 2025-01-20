@interface BridgedCampaignClickRecorder
- (id)campaignClickErrorWithDescription:(id)a3;
- (id)recordCampaignClickWithReportUrl:(id)a3 campaignUrl:(id)a4;
@end

@implementation BridgedCampaignClickRecorder

- (id)recordCampaignClickWithReportUrl:(id)a3 campaignUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke;
  v13[3] = &unk_1E640F1F0;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = (void *)[v8 initWithResolver:v13];

  return v11;
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F4DE68]);
    id v9 = [MEMORY[0x1E4F7E218] sharedAccount];
    id v10 = [v9 activeiTunesAccount];
    [v8 setAccount:v10];

    [v8 setUrlKnownToBeTrusted:1];
    v11 = [v8 requestWithMethod:4 URL:v7 parameters:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_3;
    v15[3] = &unk_1E640F1C8;
    id v18 = v6;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v13;
    id v19 = v5;
    id v14 = v6;
    [v11 addFinishBlock:v15];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_2;
    v20[3] = &unk_1E640F150;
    v20[4] = *(void *)(a1 + 40);
    id v21 = v6;
    id v8 = v6;
    __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_2((uint64_t)v20);
  }
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) campaignClickErrorWithDescription:@"Malformed campaign click reporting url"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_4;
    v20[3] = &unk_1E640F178;
    id v22 = *(id *)(a1 + 48);
    id v21 = v6;
    __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_4((uint64_t)v20);

    id v7 = v22;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    id v7 = (void *)[v8 mutableCopy];

    [v7 removeCharactersInString:@"?=&+"];
    id v9 = [*(id *)(a1 + 32) stringByAddingPercentEncodingWithAllowedCharacters:v7];
    if (v9)
    {
      id v10 = [NSString stringWithFormat:@"url=%@", v9];
      v11 = [v10 dataUsingEncoding:4];
      [v5 setHTTPBody:v11];

      id v12 = [MEMORY[0x1E4F4DE88] defaultSession];
      uint64_t v13 = [v12 dataTaskPromiseWithRequest:v5];

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_6;
      v15[3] = &unk_1E640F1A0;
      id v16 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 56);
      [v13 addFinishBlock:v15];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_5;
      v18[3] = &unk_1E640F150;
      id v14 = *(void **)(a1 + 48);
      v18[4] = *(void *)(a1 + 40);
      id v19 = v14;
      __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_5((uint64_t)v18);
    }
  }
}

uint64_t __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) campaignClickErrorWithDescription:@"Encoding failure to encode campaign url"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_7;
    v5[3] = &unk_1E640F178;
    id v7 = *(id *)(a1 + 32);
    id v6 = v4;
    __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_7((uint64_t)v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __77__BridgedCampaignClickRecorder_recordCampaignClickWithReportUrl_campaignUrl___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)campaignClickErrorWithDescription:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = BridgedCampaignClickErrorCode;
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v3 errorWithDomain:@"com.apple.news.campaignclick" code:v4 userInfo:v7];

  return v8;
}

@end