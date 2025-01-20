@interface PDCarKeySharingManagementService
- (PDCarKeySharingManagementService)init;
- (PDCarKeySharingManagementService)initWithWebServiceCoordinator:(id)a3 cardFileManager:(id)a4 cloudStoreDelegate:(id)a5 delegate:(id)a6;
- (void)acceptStatefulSharingMessage:(id)a3 transportIdentifier:(id)a4 activationCode:(id)a5 completion:(id)a6;
- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)didCreateAndStoreShare:(id)a3 forCredentialShare:(id)a4 pass:(id)a5 transportIdentifier:(id)a6;
- (void)handleIncomingMessage:(id)a3 transportIdentifier:(id)a4 share:(id)a5 completion:(id)a6;
- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4;
- (void)rejectInvitation:(id)a3 completion:(id)a4;
- (void)retryActivationCodeForShare:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
@end

@implementation PDCarKeySharingManagementService

- (PDCarKeySharingManagementService)init
{
  return 0;
}

- (PDCarKeySharingManagementService)initWithWebServiceCoordinator:(id)a3 cardFileManager:(id)a4 cloudStoreDelegate:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PDCarKeySharingManagementService;
  v15 = [(PDCarKeySharingManagementService *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v16->_cardFileManager, a4);
    objc_storeStrong((id *)&v16->_delegate, a6);
    v17 = (PKDAManager *)objc_alloc_init((Class)PKDAManager);
    daManager = v16->_daManager;
    v16->_daManager = v17;

    objc_storeStrong((id *)&v16->_cloudStoreDelegate, a5);
  }

  return v16;
}

- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [v13 share];
  v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v10 uniqueID];
    *(_DWORD *)buf = 138412290;
    v40 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Creating share for %@", buf, 0xCu);
  }
  id v17 = [v14 copy];
  v18 = [v17 credentialShares];
  id v19 = [v18 count];

  if (!v19)
  {
    objc_super v20 = sub_10029AD24((uint64_t)self);
    [v17 setCredentialShares:v20];
  }
  v21 = [v10 devicePrimaryPaymentApplication];
  v22 = [v21 subcredentials];
  v23 = [v22 anyObject];

  v24 = [v23 identifier];
  [v17 setSubcredentialIdentifier:v24];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10029AEE0;
  v33[3] = &unk_100744608;
  id v25 = v12;
  id v38 = v25;
  id v26 = v17;
  id v34 = v26;
  id v27 = v10;
  id v35 = v27;
  v36 = self;
  id v28 = v23;
  id v37 = v28;
  v29 = objc_retainBlock(v33);
  id v30 = [v13 requestSource];

  if ((unint64_t)v30 >= 2)
  {
    if (v30 == (id)2)
    {
      daManager = self->_daManager;
      v32 = [v14 identifier];
      [(PKDAManager *)daManager createSilentInviteForSharingSessionIdentifier:v32 completion:v29];
    }
  }
  else
  {
    [(PKDAManager *)self->_daManager createInviteForShare:v26 forCredential:v28 authorization:v11 completion:v29];
  }
}

- (void)didCreateAndStoreShare:(id)a3 forCredentialShare:(id)a4 pass:(id)a5 transportIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = [v12 devicePrimaryPaymentApplication];
    v15 = [v14 subcredentials];
    v16 = [v15 anyObject];

    daManager = self->_daManager;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10029BA04;
    v18[3] = &unk_10073CFE0;
    id v19 = v10;
    id v20 = v13;
    [(PKDAManager *)daManager setTransportChannelIdentifier:v20 forCredential:v16 forCredentialShare:v11 completion:v18];
  }
  else
  {
    v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
    }
  }
}

- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 devicePrimaryPaymentApplication];
  id v14 = [v13 subcredentials];
  v15 = [v14 anyObject];

  BOOL v16 = (unint64_t)[v15 carKeyServerVersion] > 1;
  id v17 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v15 identifier];
    CFStringRef v19 = @"No";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    if (v7) {
      CFStringRef v19 = @"Yes";
    }
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    v53 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SharingManagementService: [Revoke] revoking shares on %@ with shouldCascade: %@, shares: %@", buf, 0x20u);
  }
  id v20 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v53 = sub_100020A7C;
  v54 = sub_100021030;
  id v55 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_100020A7C;
  v50[4] = sub_100021030;
  v21 = v10;
  v51 = v21;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_100020A7C;
  v48[4] = sub_100021030;
  id v49 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10029C060;
  v44[3] = &unk_100738C58;
  v44[4] = self;
  v46 = v50;
  id v22 = v15;
  id v45 = v22;
  v47 = buf;
  [v20 addOperation:v44];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10029C534;
  v38[3] = &unk_100744680;
  BOOL v42 = v16;
  v38[4] = self;
  v40 = v50;
  id v23 = v22;
  BOOL v43 = v7;
  id v39 = v23;
  v41 = v48;
  [v20 addOperation:v38];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10029CB00;
  v33[3] = &unk_1007446A8;
  void v33[4] = self;
  id v35 = v50;
  id v24 = v23;
  BOOL v37 = v16;
  id v34 = v24;
  v36 = v48;
  [v20 addOperation:v33];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10029D148;
  v32[3] = &unk_10072E610;
  v32[4] = self;
  v32[5] = v48;
  [v20 addOperation:v32];
  id v25 = +[NSNull null];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10029D410;
  v28[3] = &unk_1007319E8;
  id v30 = v50;
  id v26 = v12;
  id v29 = v26;
  v31 = buf;
  id v27 = [v20 evaluateWithInput:v25 completion:v28];

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(buf, 8);
}

- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4
{
}

- (void)handleIncomingMessage:(id)a3 transportIdentifier:(id)a4 share:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v10;
    v15 = [v12 credentialShares];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10029E24C;
    v27[3] = &unk_100744840;
    id v16 = v11;
    id v28 = v16;
    id v17 = objc_msgSend(v15, "pk_firstObjectPassingTest:", v27);

    v18 = [v17 identifier];
    uint64_t v19 = [v12 subcredentialIdentifier];
    id v20 = (void *)v19;
    if (v18 && v19)
    {
      daManager = self->_daManager;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10029E290;
      v25[3] = &unk_1007378B8;
      id v26 = v13;
      [(PKDAManager *)daManager handleOutstandingMessage:v14 subcredentialIdentifier:v20 credentialShareIdentifier:v18 transportIdentifier:v16 completion:v25];
    }
    else
    {
      id v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v24 = @"Y";
        if (!v12) {
          CFStringRef v24 = @"N";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v30 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Error: Unable to locate credential share identifier or subcredential identifier. Has share: %@", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
  else
  {
    id v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Error: Invalid message type, expected car key message.", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }
}

- (void)acceptStatefulSharingMessage:(id)a3 transportIdentifier:(id)a4 activationCode:(id)a5 completion:(id)a6
{
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v11;
  v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = PKSharingLoggableMailboxAddress();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v92 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SharingManagementService: accepting share on endpoint %@ with activationCode '%@'.\n message:%@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v10;
    v18 = [v17 shareIdentifier];
    id v19 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v92 = sub_100020A7C;
    v93 = sub_100021030;
    id v94 = 0;
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10029EC04;
    v89[3] = &unk_100731CB8;
    v89[4] = self;
    id v20 = v17;
    v90 = v20;
    [v19 addOperation:v89];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10029ED40;
    v85[3] = &unk_100738AA0;
    v85[4] = self;
    v21 = v20;
    v86 = v21;
    id v22 = v14;
    id v87 = v22;
    v88 = buf;
    [v19 addOperation:v85];
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = sub_100020A7C;
    v83[4] = sub_100021030;
    id v84 = 0;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x3032000000;
    v81[3] = sub_100020A7C;
    v81[4] = sub_100021030;
    id v82 = 0;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10029EF58;
    v75[3] = &unk_100744890;
    v75[4] = self;
    id v23 = v18;
    id v76 = v23;
    id v24 = v22;
    id v77 = v24;
    v78 = buf;
    v79 = v81;
    v80 = v83;
    [v19 addOperation:v75];
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = sub_100020A7C;
    v73[4] = sub_100021030;
    id v74 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10029F144;
    v68[3] = &unk_1007448E0;
    v68[4] = self;
    id v25 = v23;
    id v69 = v25;
    id v26 = v24;
    id v70 = v26;
    v71 = v73;
    v72 = buf;
    [v19 addOperation:v68];
    id v34 = v10;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = sub_100020A7C;
    v66[4] = sub_100021030;
    id v67 = 0;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10029F390;
    v65[3] = &unk_100744958;
    v65[6] = v81;
    v65[7] = v83;
    v65[4] = self;
    v65[5] = v73;
    v65[8] = buf;
    v65[9] = v66;
    [v19 addOperation:v65];
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = sub_100020A7C;
    v63[4] = sub_100021030;
    id v64 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = sub_100020A7C;
    v61[4] = sub_100021030;
    id v62 = 0;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10029F8B4;
    v53[3] = &unk_1007449A8;
    v53[4] = self;
    id v27 = v25;
    id v54 = v27;
    id v28 = v26;
    id v55 = v28;
    id v29 = v12;
    id v56 = v29;
    v57 = v66;
    v58 = v63;
    v59 = v61;
    v60 = buf;
    [v19 addOperation:v53];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10029FB7C;
    v48[3] = &unk_10072E638;
    CFStringRef v30 = v21;
    id v49 = v30;
    v50 = self;
    v51 = v61;
    v52 = v63;
    [v19 addOperation:v48];
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = sub_100020A7C;
    v46[4] = sub_100021030;
    id v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1002A01A0;
    v39[3] = &unk_1007449F8;
    BOOL v43 = v61;
    v44 = v63;
    v31 = v30;
    v40 = v31;
    id v41 = v28;
    id v42 = v29;
    id v45 = v46;
    [v19 addOperation:v39];
    v32 = +[NSNull null];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1002A04D8;
    v35[3] = &unk_1007319E8;
    BOOL v37 = buf;
    id v36 = v13;
    id v38 = v46;
    id v33 = [v19 evaluateWithInput:v32 completion:v35];

    id v10 = v34;
    _Block_object_dispose(v46, 8);

    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(v73, 8);

    _Block_object_dispose(v81, 8);
    _Block_object_dispose(v83, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SharingManagementService: Error: Invalid message type, expected car key invitation message.", buf, 2u);
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

- (void)retryActivationCodeForShare:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 subcredentialIdentifier];
  if (v10)
  {
    daManager = self->_daManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002A06D4;
    v13[3] = &unk_1007378B8;
    id v14 = v9;
    [(PKDAManager *)daManager retryActivationCodeForCredentialIdentifier:v10 activationCode:v8 completion:v13];
  }
  else
  {
    id v12 = PDBasicError();
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
}

- (void)rejectInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    daManager = self->_daManager;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002A08C4;
    v11[3] = &unk_100744A20;
    id v12 = v8;
    id v13 = v7;
    v11[4] = self;
    [(PKDAManager *)daManager rejectInvitation:v8 completion:v11];
  }
  else
  {
    id v10 = PDBasicError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_cloudStoreDelegate, 0);
  objc_storeStrong((id *)&self->_daManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
}

@end