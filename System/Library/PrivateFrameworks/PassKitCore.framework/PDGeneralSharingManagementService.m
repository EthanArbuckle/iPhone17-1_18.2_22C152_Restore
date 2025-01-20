@interface PDGeneralSharingManagementService
- (PDGeneralSharingManagementService)init;
- (PDGeneralSharingManagementService)initWithWebServiceCoordinator:(id)a3;
- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4;
- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
@end

@implementation PDGeneralSharingManagementService

- (PDGeneralSharingManagementService)init
{
  return 0;
}

- (PDGeneralSharingManagementService)initWithWebServiceCoordinator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDGeneralSharingManagementService;
  v6 = [(PDGeneralSharingManagementService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webServiceCoordinator, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedFidoChallenges = v7->_cachedFidoChallenges;
    v7->_cachedFidoChallenges = v8;
  }
  return v7;
}

- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35 = [v10 share];
  v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v11 uniqueID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Creating share for %@", (uint8_t *)&buf, 0xCu);
  }
  v16 = [v11 devicePrimaryPaymentApplication];
  v34 = [v16 dpanIdentifier];

  if (v34)
  {
    v17 = [v11 longTermPrivacyKeyGroupIdentifier];
    if (v17)
    {
      v18 = objc_alloc_init(PDSharingManagementCreateShareRequest);
      [(PDSharingManagementCreateShareRequest *)v18 setDpanIdentifier:v34];
      v19 = [v35 sharedEntitlements];
      [(PDSharingManagementCreateShareRequest *)v18 setSharedEntitlements:v19];

      v20 = [v35 recipientNickname];
      [(PDSharingManagementCreateShareRequest *)v18 setRecipient:v20];

      v21 = [v11 passTypeIdentifier];
      [(PDSharingManagementRequest *)v18 setRegionIdentifier:v21];

      id v74 = 0;
      v32 = sub_10021E3DC((uint64_t)self, v35, &v74);
      id v33 = v74;
      -[PDSharingManagementCreateShareRequest setVerificationCode:](v18, "setVerificationCode:");
      id v22 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v76 = 0x3032000000;
      v77 = sub_100020A3C;
      v78 = sub_100021010;
      id v79 = 0;
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10021E55C;
      v70[3] = &unk_100738AA0;
      v70[4] = self;
      v23 = v18;
      v71 = v23;
      id v24 = v11;
      id v72 = v24;
      p_long long buf = &buf;
      [v22 addOperation:v70];
      v25 = [v24 fidoProfile];

      if (v25)
      {
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_10021E8C4;
        v65[3] = &unk_100734040;
        v65[4] = self;
        id v66 = v24;
        id v67 = v12;
        v68 = v23;
        v69 = &buf;
        [v22 addOperation:v65];
      }
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x3032000000;
      v63[3] = sub_100020A3C;
      v63[4] = sub_100021010;
      id v64 = 0;
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x3032000000;
      v61[3] = sub_100020A3C;
      v61[4] = sub_100021010;
      id v62 = [v35 copy];
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x3032000000;
      v59[3] = sub_100020A3C;
      v59[4] = sub_100021010;
      id v60 = 0;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10021EE68;
      v53[3] = &unk_1007319C0;
      v53[4] = self;
      v26 = v23;
      v54 = v26;
      v55 = &buf;
      v56 = v63;
      v57 = v59;
      v58 = v61;
      [v22 addOperation:v53];
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = sub_100020A3C;
      v51[4] = sub_100021010;
      id v52 = 0;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10021F1F8;
      v46[3] = &unk_100741140;
      v48 = v51;
      v46[4] = self;
      v49 = v63;
      id v47 = v17;
      v50 = &buf;
      [v22 addOperation:v46];
      v27 = +[NSNull null];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10021F4B0;
      v36[3] = &unk_100741168;
      v42 = &buf;
      v43 = v51;
      id v37 = v24;
      v38 = self;
      v44 = v59;
      id v39 = v35;
      id v28 = v32;
      id v40 = v28;
      id v41 = v13;
      v45 = v61;
      id v29 = [v22 evaluateWithInput:v27 completion:v36];

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v59, 8);

      _Block_object_dispose(v61, 8);
      _Block_object_dispose(v63, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v11 uniqueID];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Pass %@ does not have a LTPK group identifier", (uint8_t *)&buf, 0xCu);
      }
      v80[0] = NSLocalizedDescriptionKey;
      v80[1] = NSLocalizedFailureReasonErrorKey;
      v81[0] = @"Unable to decrypt share voucher";
      v81[1] = @"LTPK not found";
      v26 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
      id v33 = +[NSError errorWithDomain:PKAddSecureElementPassErrorDomain code:0 userInfo:v26];
      (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v33);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v11 uniqueID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Unable to find dpanIdentifier for %@", (uint8_t *)&buf, 0xCu);
    }
    v17 = PKDisplayableErrorForCommonType();
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v17);
  }
}

- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v11 uniqueID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Updating share for %@", (uint8_t *)&buf, 0xCu);
  }
  v16 = [v11 devicePrimaryPaymentApplication];
  v17 = [v16 dpanIdentifier];

  if (v17)
  {
    v18 = objc_alloc_init(PDSharingManagementUpdateShareRequest);
    [(PDSharingManagementCreateShareRequest *)v18 setDpanIdentifier:v17];
    v19 = [v10 sharedEntitlements];
    [(PDSharingManagementCreateShareRequest *)v18 setSharedEntitlements:v19];

    v20 = [v10 identifier];
    [(PDSharingManagementUpdateShareRequest *)v18 setShareIdentifier:v20];

    v21 = [v11 passTypeIdentifier];
    [(PDSharingManagementRequest *)v18 setRegionIdentifier:v21];

    id v22 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v52 = 0x3032000000;
    v53 = sub_100020A3C;
    v54 = sub_100021010;
    id v55 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10021FCF4;
    v45[3] = &unk_100738AA0;
    v45[4] = self;
    v23 = v18;
    v46 = v23;
    id v24 = v11;
    id v47 = v24;
    p_long long buf = &buf;
    [v22 addOperation:v45];
    v25 = [v24 fidoProfile];

    if (v25)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10021FE54;
      v40[3] = &unk_100734040;
      v40[4] = self;
      id v41 = v24;
      id v42 = v12;
      v43 = v23;
      v44 = &buf;
      [v22 addOperation:v40];
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10021FFDC;
    v36[3] = &unk_10072E638;
    void v36[4] = self;
    v26 = v23;
    id v37 = v26;
    v38 = &buf;
    id v39 = v49;
    [v22 addOperation:v36];
    v27 = +[NSNull null];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100220174;
    v30[3] = &unk_1007411E0;
    id v31 = v24;
    v34 = &buf;
    v35 = v49;
    id v33 = v13;
    id v32 = v10;
    id v28 = [v22 evaluateWithInput:v27 completion:v30];

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v11 uniqueID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Unable to find dpanIdentifier for %@", (uint8_t *)&buf, 0xCu);
    }
    PKDisplayableErrorForCommonType();
    v26 = (PDSharingManagementUpdateShareRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, PDSharingManagementUpdateShareRequest *))v13 + 2))(v13, 0, 0, v26);
  }
}

- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 devicePrimaryPaymentApplication];
  v14 = [v13 dpanIdentifier];

  if (v14)
  {
    v15 = objc_msgSend(v10, "pk_indexDictionaryByApplyingBlock:", &stru_100741220);
    v16 = objc_alloc_init(PDSharingManagementBulkRevokeShareRequest);
    [(PDSharingManagementBulkRevokeShareRequest *)v16 setDpanIdentifier:v14];
    v17 = [v15 allKeys];
    [(PDSharingManagementBulkRevokeShareRequest *)v16 setShareIdentifiers:v17];

    [(PDSharingManagementBulkRevokeShareRequest *)v16 setShouldCascade:v7];
    v18 = [v11 passTypeIdentifier];
    [(PDSharingManagementRequest *)v16 setRegionIdentifier:v18];

    uint64_t v19 = objc_opt_class();
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100220550;
    v23[3] = &unk_100741270;
    id v26 = v12;
    id v24 = v15;
    id v25 = v10;
    id v20 = v15;
    sub_10021F124((uint64_t)self, v16, v19, v23);
  }
  else
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v11 uniqueID];
      *(_DWORD *)long long buf = 138412290;
      id v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Unable to find dpanIdentifier for %@", buf, 0xCu);
    }
    PKDisplayableErrorForCommonType();
    v16 = (PDSharingManagementBulkRevokeShareRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, PDSharingManagementBulkRevokeShareRequest *))v12 + 2))(v12, 0, 0, v16);
  }
}

- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 devicePrimaryPaymentApplication];
  v9 = [v8 dpanIdentifier];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100220964;
    v10[3] = &unk_1007412C0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    sub_100220D5C((uint64_t)self, v11, v10);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFidoChallenges, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
}

@end