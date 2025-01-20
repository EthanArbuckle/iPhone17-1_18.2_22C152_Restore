@interface ICQOfferUpdateController
- (ICQOfferUpdateController)initWithSession:(id)a3;
- (void)performOfferUpdateWithContext:(id)a3 completion:(id)a4;
@end

@implementation ICQOfferUpdateController

- (ICQOfferUpdateController)initWithSession:(id)a3
{
  id v5 = a3;
  v6 = [(ICQOfferUpdateController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sharedURLSession, a3);
  }

  return v7;
}

- (void)performOfferUpdateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 offerId];
    v9 = [v5 buttonId];
    int v10 = [v5 isZeroAction];
    v11 = [v5 account];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)v49 = v10;
    *(_WORD *)&v49[4] = 2112;
    *(void *)&v49[6] = v11;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "performOfferUpdateWithContext:%@ - %@ zeroAction:%d account:%@", buf, 0x26u);
  }
  v12 = [v5 account];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    ICQCreateError(0);
    v16 = (ICQRequestProvider *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v16);
  }
  else
  {
    v14 = [ICQRequestProvider alloc];
    v15 = [v5 account];
    v16 = [(ICQRequestProvider *)v14 initWithAccount:v15];

    v17 = [(ICQRequestProvider *)v16 urlForUpdateOfferWithContext:v5];
    if (!v17) {
      goto LABEL_22;
    }
    v18 = [MEMORY[0x1E4F28E88] requestWithURL:v17 cachePolicy:1 timeoutInterval:30.0];
    v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v20 = [v5 offerId];
    BOOL v21 = [(ICQRequestProvider *)v16 willUseNewKey:@"quotaUpdateOfferURL" offerID:v20 notificationID:0];

    if (v21)
    {
      v22 = [v5 buttonId];

      if (v22)
      {
        v23 = [v5 buttonId];
        [v19 setObject:v23 forKeyedSubscript:@"buttonId"];
      }
    }
    else
    {
      v24 = [v5 account];
      v25 = objc_msgSend(v24, "aa_personID");

      if (v25)
      {
        v26 = [v5 account];
        v27 = objc_msgSend(v26, "aa_personID");
        [v19 setObject:v27 forKeyedSubscript:@"dsid"];
      }
      v28 = [v5 buttonId];

      if (v28)
      {
        v29 = [v5 buttonId];
        [v19 setObject:v29 forKeyedSubscript:@"btnId"];
      }
      v30 = [v5 offerId];

      if (v30)
      {
        v31 = [v5 offerId];
        [v19 setObject:v31 forKeyedSubscript:@"offerId"];
      }
      if ([v5 isZeroAction]) {
        [v19 setObject:@"true" forKeyedSubscript:@"directAction"];
      }
    }
    [(ICQRequestProvider *)v16 addCommonHeadersToRequest:v18];
    if (!+[ICQRequestProvider attemptSetRequest:v18 toPostWithJSONDict:v19])
    {

      v18 = 0;
    }
    v32 = [v5 offerId];
    v33 = [(ICQRequestProvider *)v16 httpMethodForKey:@"quotaUpdateOfferURL" offerID:v32 notificationID:0];
    [v18 setHTTPMethod:v33];

    if (v18)
    {
      v34 = [v18 HTTPBody];
      if (v34)
      {
        id v35 = [NSString alloc];
        v36 = [v18 HTTPBody];
        v37 = (__CFString *)[v35 initWithData:v36 encoding:4];
      }
      else
      {
        v37 = &stru_1F2DCE430;
      }

      v39 = _ICQGetLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [v18 allHTTPHeaderFields];
        v41 = [v18 HTTPBody];
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        *(void *)v49 = v41;
        *(_WORD *)&v49[8] = 2112;
        *(void *)&v49[10] = v37;
        _os_log_impl(&dword_1D5851000, v39, OS_LOG_TYPE_DEFAULT, "update offer request: %@ headers: %@ body: %@ body (as string): %@", buf, 0x2Au);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)v49 = __Block_byref_object_copy__4;
      *(void *)&v49[8] = __Block_byref_object_dispose__4;
      *(void *)&v49[16] = self;
      v42 = *(void **)(*(void *)&v49[16] + 8);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __69__ICQOfferUpdateController_performOfferUpdateWithContext_completion___block_invoke;
      v45[3] = &unk_1E6A52730;
      v46 = v6;
      v47 = buf;
      v43 = [v42 dataTaskWithRequest:v18 completionHandler:v45];
      [v43 resume];

      _Block_object_dispose(buf, 8);
    }
    else
    {
LABEL_22:
      v38 = _ICQGetLogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v17;
        _os_log_impl(&dword_1D5851000, v38, OS_LOG_TYPE_DEFAULT, "update offer - failed to create request to URL %@", buf, 0xCu);
      }

      v18 = ICQCreateError(0);
      v6[2](v6, 0, v18);
    }
  }
}

void __69__ICQOfferUpdateController_performOfferUpdateWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  ICQLogDataTaskComplete(@"updateOffer", a2, a3, v7);
  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7 == 0, v7);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void).cxx_destruct
{
}

@end