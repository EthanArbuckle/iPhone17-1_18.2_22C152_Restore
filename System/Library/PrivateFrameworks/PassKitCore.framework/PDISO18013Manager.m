@interface PDISO18013Manager
- (PDISO18013Manager)initWithSecureElement:(id)a3 userNotificationManager:(id)a4;
- (void)_elementsChanged:(id)a3 forPass:(id)a4;
- (void)_getAllCredentialIdsWithCompletion:(id)a3;
- (void)_isoCredentialIdentifierForSubCredentialId:(id)a3 cardType:(int64_t)a4 store:(id)a5 completion:(id)a6;
- (void)_performOperationOnCredentials:(id)a3 operation:(id)a4 completion:(id)a5;
- (void)_updateCredentialsForCredentialIds:(id)a3 toState:(unint64_t)a4 completion:(id)a5;
- (void)_updateISO18013Blob:(id)a3 metadata:(id)a4 subcredential:(id)a5 paymentPass:(id)a6 store:(id)a7 priorSubcredentialIdentifiers:(id)a8 cardType:(int64_t)a9 completion:(id)a10;
- (void)accessCredentialStoreWithHandler:(id)a3;
- (void)activateCredentialsForCredentialIds:(id)a3 completion:(id)a4;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)allCredentialsWithCompletion:(id)a3;
- (void)createISOBiometricBindingWithCompletion:(id)a3;
- (void)createISOCredentialIdentifierForIdentityPartitionWithCompletion:(id)a3;
- (void)deleteCredentialsForCredentialIds:(id)a3 completion:(id)a4;
- (void)deleteSubCredentialIdentifiers:(id)a3 cardType:(int64_t)a4;
- (void)generateAccountKeyAuthorizationForSubcredentialID:(id)a3 cardType:(int64_t)a4 accountKeyIdentifier:(id)a5 completion:(id)a6;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionKeyForCardType:(int64_t)a3 subCredentialId:(id)a4 completion:(id)a5;
- (void)generateKeySigningKeyForCardType:(int64_t)a3 subCredentialId:(id)a4 completion:(id)a5;
- (void)generatePresentmentKeyForCardType:(int64_t)a3 numberOfKeys:(int64_t)a4 subCredentialId:(id)a5 completion:(id)a6;
- (void)handlePaymentPassUpdateFrom:(id)a3 priorPaymentApplications:(id)a4 completion:(id)a5;
- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)needsPresentmentKeyRefreshForPass:(id)a3 numberOfKeys:(int64_t)a4 subCredentialId:(id)a5 completion:(id)a6;
- (void)passWillBeRemoved:(id)a3;
- (void)suspendCredentialsForCredentialIds:(id)a3 completion:(id)a4;
@end

@implementation PDISO18013Manager

- (PDISO18013Manager)initWithSecureElement:(id)a3 userNotificationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDISO18013Manager;
  v9 = [(PDISO18013Manager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_secureElement, a3);
    objc_storeStrong((id *)&v10->_userNotificationManager, a4);
  }

  return v10;
}

- (void)handlePaymentPassUpdateFrom:(id)a3 priorPaymentApplications:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v62 = a5;
  v65 = self;
  v10 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
  v66 = v8;
  id v64 = [v8 cardType];
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v106 objects:v115 count:16];
  v68 = v10;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v107;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v107 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        v17 = [v16 secureElementIdentifier];
        if ([v10 containsObject:v17])
        {
          v18 = (char *)[v16 paymentType] - 1002;

          if ((unint64_t)v18 > 3) {
            continue;
          }
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          v17 = [v16 subcredentials];
          id v19 = [v17 countByEnumeratingWithState:&v102 objects:v114 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v103;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v103 != v21) {
                  objc_enumerationMutation(v17);
                }
                v23 = [*(id *)(*((void *)&v102 + 1) + 8 * (void)j) identifier];
                [v11 addObject:v23];
              }
              id v20 = [v17 countByEnumeratingWithState:&v102 objects:v114 count:16];
            }
            while (v20);
            v10 = v68;
          }
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v106 objects:v115 count:16];
    }
    while (v13);
  }

  id v24 = objc_alloc_init((Class)NSMutableSet);
  id v25 = objc_alloc_init((Class)NSMutableSet);
  v26 = v10;
  id v27 = v25;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v75 = [v66 paymentApplicationsForSecureElementIdentifiers:v26];
  id v28 = [v75 countByEnumeratingWithState:&v98 objects:v113 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v99;
    uint64_t v69 = *(void *)v99;
    do
    {
      v31 = 0;
      id v72 = v29;
      do
      {
        if (*(void *)v99 != v30) {
          objc_enumerationMutation(v75);
        }
        v32 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v31);
        if ((char *)[v32 paymentType] - 1002 <= (char *)3)
        {
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v33 = [v32 subcredentials];
          id v34 = [v33 countByEnumeratingWithState:&v94 objects:v112 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v95;
            do
            {
              for (k = 0; k != v35; k = (char *)k + 1)
              {
                if (*(void *)v95 != v36) {
                  objc_enumerationMutation(v33);
                }
                v38 = *(void **)(*((void *)&v94 + 1) + 8 * (void)k);
                v39 = [v38 identifier];
                [v24 addObject:v39];

                [v27 addObject:v38];
              }
              id v35 = [v33 countByEnumeratingWithState:&v94 objects:v112 count:16];
            }
            while (v35);
          }

          uint64_t v30 = v69;
          id v29 = v72;
        }
        v31 = (char *)v31 + 1;
      }
      while (v31 != v29);
      id v29 = [v75 countByEnumeratingWithState:&v98 objects:v113 count:16];
    }
    while (v29);
  }

  v40 = [v66 iso18013BlobsForSecureElementIdentifiers:v68];
  v70 = [v66 iso18013BlobsMetdataForSecureElementIdentifiers:v68];
  id v41 = objc_alloc_init((Class)NSMutableDictionary);
  id v76 = objc_alloc_init((Class)NSMutableDictionary);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v42 = v40;
  id v43 = [v42 countByEnumeratingWithState:&v90 objects:v111 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v91;
    do
    {
      for (m = 0; m != v44; m = (char *)m + 1)
      {
        if (*(void *)v91 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v90 + 1) + 8 * (void)m);
        v48 = [v42 objectForKey:v47];
        v49 = [v47 identifier];
        [v41 setObject:v48 forKey:v49];
      }
      id v44 = [v42 countByEnumeratingWithState:&v90 objects:v111 count:16];
    }
    while (v44);
  }
  v73 = v41;

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v50 = v70;
  id v51 = [v50 countByEnumeratingWithState:&v86 objects:v110 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v87;
    do
    {
      for (n = 0; n != v52; n = (char *)n + 1)
      {
        if (*(void *)v87 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = *(void **)(*((void *)&v86 + 1) + 8 * (void)n);
        v56 = [v50 objectForKey:v55];
        v57 = [v55 identifier];
        [v76 setObject:v56 forKey:v57];
      }
      id v52 = [v50 countByEnumeratingWithState:&v86 objects:v110 count:16];
    }
    while (v52);
  }

  id v61 = [v11 mutableCopy];
  [v61 minusSet:v24];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1001B821C;
  v77[3] = &unk_10073CF68;
  id v78 = v27;
  id v79 = v73;
  id v80 = v76;
  v81 = v65;
  id v82 = v66;
  id v83 = v11;
  id v84 = v62;
  id v85 = v64;
  id v71 = v62;
  id v63 = v11;
  id v67 = v66;
  id v58 = v76;
  id v59 = v73;
  id v60 = v27;
  [(PDISO18013Manager *)v65 accessCredentialStoreWithHandler:v77];
  [(PDISO18013Manager *)v65 deleteSubCredentialIdentifiers:v61 cardType:v64];
}

- (void)deleteSubCredentialIdentifiers:(id)a3 cardType:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v8 = [v6 allObjects];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B8A24;
    v12[3] = &unk_10073CFB8;
    v12[4] = self;
    int64_t v14 = a4;
    id v13 = v7;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001B8B44;
    v10[3] = &unk_10073CFE0;
    v10[4] = self;
    id v11 = v13;
    id v9 = v13;
    [(PDISO18013Manager *)self _performOperationOnCredentials:v8 operation:v12 completion:v10];
  }
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  id v20 = self;
  uint64_t v5 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = v4;
  id v19 = (void *)v5;
  id v7 = [v4 paymentApplicationsForSecureElementIdentifiers:v5];
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ((char *)[v12 paymentType] - 1002 <= (char *)3)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v13 = [v12 subcredentials];
          id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v23;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) identifier];
                [v6 addObject:v18];
              }
              id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v15);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  -[PDISO18013Manager deleteSubCredentialIdentifiers:cardType:](v20, "deleteSubCredentialIdentifiers:cardType:", v6, [v21 cardType]);
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B8E38;
  v10[3] = &unk_10073D030;
  id v11 = a3;
  id v12 = self;
  id v13 = a5;
  int64_t v14 = a4;
  id v8 = v13;
  id v9 = v11;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v10];
}

- (void)accessCredentialStoreWithHandler:(id)a3
{
  if (a3)
  {
    p_lockStorage = &self->_lockStorage;
    uint64_t v5 = (void (**)(id, DCCredentialStore *, void *))a3;
    os_unfair_lock_lock(p_lockStorage);
    isoStorage = self->_isoStorage;
    ++self->_storageUseCounter;
    if (!isoStorage)
    {
      id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      [v7 addObject:PKISO18013CredentialStoragePartitionIdentity];
      [v7 addObject:PKISO18013CredentialStoragePartitionUnifiedAccess];
      id v8 = objc_alloc((Class)DCCredentialStore);
      id v9 = [v7 copy];
      uint64_t v10 = (DCCredentialStore *)[v8 initWithPartitions:v9];
      id v11 = self->_isoStorage;
      self->_isoStorage = v10;
    }
    os_unfair_lock_unlock(p_lockStorage);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001B946C;
    v13[3] = &unk_10072E1E8;
    v13[4] = self;
    id v12 = objc_retainBlock(v13);
    v5[2](v5, self->_isoStorage, v12);
  }
}

- (void)_isoCredentialIdentifierForSubCredentialId:(id)a3 cardType:(int64_t)a4 store:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  if (a4 == 4)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ISO credential identifier %@ found for identity subCredentialId %@", buf, 0x16u);
    }

    v11[2](v11, v9);
  }
  else
  {
    id v13 = objc_msgSend(v9, "pk_decodeHexadecimal");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001B96E0;
    v15[3] = &unk_10073D0A8;
    id v16 = v9;
    id v19 = v11;
    id v17 = v10;
    id v18 = v13;
    id v14 = v13;
    [v17 credentialIdentifierForPublicKeyIdentifier:v14 completion:v15];
  }
}

- (void)createISOCredentialIdentifierForIdentityPartitionWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B9C08;
  v5[3] = &unk_10073D0F8;
  id v6 = a3;
  id v4 = v6;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v5];
}

- (void)createISOBiometricBindingWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)DCBiometricStore);
  id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_10002097C;
  v28[4] = sub_100020FB0;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10002097C;
  v26[4] = sub_100020FB0;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10002097C;
  v24[4] = sub_100020FB0;
  id v25 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001BA148;
  v20[3] = &unk_100736BF8;
  id v6 = v4;
  id v21 = v6;
  __int16 v22 = v24;
  id v23 = v28;
  [v5 addOperation:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001BA2FC;
  v16[3] = &unk_100736BF8;
  id v7 = v6;
  id v17 = v7;
  id v18 = v24;
  id v19 = v26;
  [v5 addOperation:v16];
  id v8 = +[NSNull null];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BA4C8;
  v11[3] = &unk_10073D148;
  id v13 = v24;
  id v9 = v3;
  id v12 = v9;
  id v14 = v28;
  id v15 = v26;
  id v10 = [v5 evaluateWithInput:v8 completion:v11];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v28, 8);
}

- (void)_updateISO18013Blob:(id)a3 metadata:(id)a4 subcredential:(id)a5 paymentPass:(id)a6 store:(id)a7 priorSubcredentialIdentifiers:(id)a8 cardType:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = [v18 identifier];
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = sub_10002097C;
  v84[4] = sub_100020FB0;
  id v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = sub_10002097C;
  v82[4] = sub_100020FB0;
  id v83 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  unsigned __int8 v81 = 0;
  id v43 = v21;
  if ([v19 isIdentityPass])
  {
    unsigned __int8 v24 = [v21 containsObject:v23];
    if (v17) {
      unsigned __int8 v25 = v24;
    }
    else {
      unsigned __int8 v25 = 0;
    }
  }
  else
  {
    unsigned __int8 v25 = 0;
  }
  unsigned __int8 v81 = v25;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = sub_10002097C;
  v78[4] = sub_100020FB0;
  id v79 = 0;
  id v26 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1001BAAEC;
  v73[3] = &unk_10073D198;
  v73[4] = self;
  id v27 = v23;
  id v74 = v27;
  int64_t v77 = a9;
  id v28 = v20;
  id v75 = v28;
  id v76 = v82;
  [v26 addOperation:v73];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1001BAC54;
  v69[3] = &unk_100736BF8;
  id v29 = v28;
  id v70 = v29;
  id v71 = v82;
  id v72 = v78;
  [v26 addOperation:v69];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1001BAD94;
  v62[3] = &unk_10073D210;
  id v30 = v29;
  id v63 = v30;
  id v67 = v82;
  id v31 = v16;
  id v64 = v31;
  id v32 = v18;
  id v65 = v32;
  v68 = v84;
  id v33 = v27;
  id v66 = v33;
  [v26 addOperation:v62];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1001BB184;
  v57[3] = &unk_100738E10;
  id v34 = v30;
  id v58 = v34;
  id v61 = v82;
  id v35 = v32;
  id v59 = v35;
  id v36 = v33;
  id v60 = v36;
  [v26 addOperation:v57];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001BB37C;
  v52[3] = &unk_10073D288;
  id v37 = v34;
  id v53 = v37;
  v54 = v82;
  v55 = v78;
  v56 = v80;
  [v26 addOperation:v52];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1001BB4EC;
  v47[3] = &unk_10073D2B0;
  id v51 = v80;
  id v38 = v17;
  id v48 = v38;
  v49 = self;
  id v39 = v19;
  id v50 = v39;
  [v26 addOperation:v47];
  v40 = +[NSNull null];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1001BB724;
  v44[3] = &unk_10072E660;
  id v41 = v22;
  id v45 = v41;
  v46 = v84;
  id v42 = [v26 evaluateWithInput:v40 completion:v44];

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v82, 8);

  _Block_object_dispose(v84, 8);
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BB804;
  v8[3] = &unk_10073D350;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v8];
}

- (void)generateISOEncryptionKeyForCardType:(int64_t)a3 subCredentialId:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BBD54;
  v9[3] = &unk_10073D030;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = a3;
  id v7 = v12;
  id v8 = v11;
  [(PDISO18013Manager *)v10 accessCredentialStoreWithHandler:v9];
}

- (void)generateKeySigningKeyForCardType:(int64_t)a3 subCredentialId:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BC0B4;
  v9[3] = &unk_10073D030;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = a3;
  id v7 = v12;
  id v8 = v11;
  [(PDISO18013Manager *)v10 accessCredentialStoreWithHandler:v9];
}

- (void)generatePresentmentKeyForCardType:(int64_t)a3 numberOfKeys:(int64_t)a4 subCredentialId:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BC424;
  v11[3] = &unk_10073D418;
  id v12 = self;
  id v13 = a5;
  int64_t v15 = a3;
  int64_t v16 = a4;
  id v14 = a6;
  id v9 = v14;
  id v10 = v13;
  [(PDISO18013Manager *)v12 accessCredentialStoreWithHandler:v11];
}

- (void)needsPresentmentKeyRefreshForPass:(id)a3 numberOfKeys:(int64_t)a4 subCredentialId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 > 1)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001BC814;
    v14[3] = &unk_10073D468;
    id v15 = v11;
    id v16 = v12;
    [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v14];
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "needsPresentmentKeyRefreshForPass not refreshing because numberOfKeys < 2", buf, 2u);
    }

    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (void)_elementsChanged:(id)a3 forPass:(id)a4
{
  id v5 = a3;
  id v31 = a4;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1001BD004;
  v45[3] = &unk_10073D490;
  v45[4] = &v46;
  v45[5] = &v50;
  id v6 = objc_retainBlock(v45);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  id v33 = [obj countByEnumeratingWithState:&v41 objects:v59 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = [obj objectForKey:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v8 = [obj objectForKey:v7];
            id v9 = [v8 countByEnumeratingWithState:&v37 objects:v58 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v38;
              do
              {
                for (j = 0; j != v9; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v10) {
                    objc_enumerationMutation(v8);
                  }
                  id v12 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();
                  id v14 = PKLogFacilityTypeGetObject();
                  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
                  if (isKindOfClass)
                  {
                    if (v15)
                    {
                      *(_DWORD *)buf = 138412546;
                      v55 = v7;
                      __int16 v56 = 2112;
                      v57 = v12;
                      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Element has changed %@ - %@", buf, 0x16u);
                    }

                    uint64_t v16 = PKISO_CategoryFromField();
                    ((void (*)(void *, uint64_t))v6[2])(v6, v16);
                  }
                  else
                  {
                    if (v15)
                    {
                      *(_DWORD *)buf = 138412290;
                      v55 = v12;
                      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Element identifier is not a string: %@", buf, 0xCu);
                    }
                  }
                }
                id v9 = [v8 countByEnumeratingWithState:&v37 objects:v58 count:16];
              }
              while (v9);
            }
          }
          else
          {
            id v8 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v35;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Namespace does not contain an array: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          id v17 = PKLogFacilityTypeGetObject();
          id v35 = v17;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v7;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Namespace is not a string: %@", buf, 0xCu);
          }
        }
      }
      id v33 = [obj countByEnumeratingWithState:&v41 objects:v59 count:16];
    }
    while (v33);
  }

  id v18 = [v31 identityType];
  if (*((unsigned char *)v51 + 24))
  {
    CFStringRef v19 = @"NOTIFICATION_DL_INFO_CHANGE";
    CFStringRef v20 = @"NOTIFICATION_STATE_ID_INFO_CHANGE";
  }
  else
  {
    uint64_t v29 = v47[3];
    switch(v29)
    {
      case 1:
        CFStringRef v19 = @"NOTIFICATION_DL_PERSONAL_INFO_CHANGE";
        CFStringRef v20 = @"NOTIFICATION_STATE_ID_PERSONAL_INFO_CHANGE";
        break;
      case 3:
        if (v18 == (id)2) {
          goto LABEL_37;
        }
        id v21 = @"NOTIFICATION_DL_DRIVING_INFO_CHANGE";
        goto LABEL_35;
      case 2:
        CFStringRef v19 = @"NOTIFICATION_DL_ID_INFO_CHANGE";
        CFStringRef v20 = @"NOTIFICATION_STATE_ID_ID_INFO_CHANGE";
        break;
      default:
        goto LABEL_37;
    }
  }
  if (v18 == (id)2) {
    id v21 = (__CFString *)v20;
  }
  else {
    id v21 = (__CFString *)v19;
  }
LABEL_35:
  id v22 = PKLocalizedIdentityString(&v21->isa);
  if (v22)
  {
    id v23 = [PDISO18013UpdateUserNotification alloc];
    unsigned __int8 v24 = [v31 uniqueID];
    unsigned __int8 v25 = [(PDISO18013UpdateUserNotification *)v23 initWithMessage:v22 forPassUniqueIdentifier:v24];

    id v26 = objc_alloc((Class)NSString);
    id v27 = [v31 uniqueID];
    id v28 = [v26 initWithFormat:@"%@-iso18013", v27];
    [(PDUserNotification *)v25 setNotificationIdentifier:v28];

    [(PDUserNotification *)v25 setReissueBannerOnUpdate:1];
    [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v25];
  }
LABEL_37:

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

- (void)allCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001BD1E4;
    v6[3] = &unk_1007346F0;
    v6[4] = self;
    id v7 = v4;
    [(PDISO18013Manager *)self _getAllCredentialIdsWithCompletion:v6];
  }
}

- (void)deleteCredentialsForCredentialIds:(id)a3 completion:(id)a4
{
}

- (void)activateCredentialsForCredentialIds:(id)a3 completion:(id)a4
{
}

- (void)suspendCredentialsForCredentialIds:(id)a3 completion:(id)a4
{
}

- (void)_updateCredentialsForCredentialIds:(id)a3 toState:(unint64_t)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BDA5C;
  v5[3] = &unk_10073D568;
  void v5[4] = a4;
  [(PDISO18013Manager *)self _performOperationOnCredentials:a3 operation:v5 completion:a5];
}

- (void)_performOperationOnCredentials:(id)a3 operation:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BDD98;
  v11[3] = &unk_10073D5E0;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v11];
}

- (void)_getAllCredentialIdsWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BE2E8;
  v5[3] = &unk_10073D0F8;
  id v6 = a3;
  id v4 = v6;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v5];
}

- (void)generateAccountKeyAuthorizationForSubcredentialID:(id)a3 cardType:(int64_t)a4 accountKeyIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BE5CC;
  v15[3] = &unk_10073D680;
  void v15[4] = self;
  id v16 = v10;
  id v18 = a6;
  int64_t v19 = a4;
  id v17 = v11;
  id v12 = v18;
  id v13 = v11;
  id v14 = v10;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v15];
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BEA4C;
  v8[3] = &unk_10073D468;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(PDISO18013Manager *)self accessCredentialStoreWithHandler:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoStorage, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
}

@end