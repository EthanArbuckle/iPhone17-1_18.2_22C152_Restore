@interface SESClient
+ (id)sharedClient;
- (id)connectToService;
- (id)remoteObjectProxyWithError:(id *)a1;
- (id)synchronousRemoteObjectProxyWithError:(id *)a1;
- (void)connectionResetHandler;
- (void)setServiceName:(uint64_t)a1;
@end

@implementation SESClient

+ (id)sharedClient
{
  self;
  if (sharedClient_pred != -1) {
    dispatch_once(&sharedClient_pred, &__block_literal_global_3);
  }
  v0 = (void *)sharedClient_sharedClient;
  return v0;
}

void __25__SESClient_sharedClient__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedClient_sharedClient;
  sharedClient_sharedClient = v0;

  uint64_t v2 = sharedClient_sharedClient;
  -[SESClient setServiceName:](v2, @"com.apple.seserviced");
}

- (void)setServiceName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)connectionResetHandler
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = (void *)obj[2];
    obj[2] = 0;

    objc_sync_exit(obj);
  }
}

- (id)connectToService
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!v1[2])
    {
      id v2 = objc_alloc(MEMORY[0x263F08D68]);
      id v3 = v1[1];
      uint64_t v4 = [v2 initWithMachServiceName:v3 options:4096];
      id v5 = v1[2];
      v1[2] = (id)v4;

      if (!v1[2])
      {
        v142 = SESDefaultLogObject();
        v140 = SESCreateAndLogError();

        goto LABEL_6;
      }
      objc_initWeak(location, v1);
      id v6 = v1[2];
      v145[0] = MEMORY[0x263EF8330];
      v145[1] = 3221225472;
      v145[2] = __29__SESClient_connectToService__block_invoke;
      v145[3] = &unk_264219820;
      objc_copyWeak(&v146, location);
      [v6 setInterruptionHandler:v145];

      id v7 = v1[2];
      v143[0] = MEMORY[0x263EF8330];
      v143[1] = 3221225472;
      v143[2] = __29__SESClient_connectToService__block_invoke_471;
      v143[3] = &unk_264219820;
      objc_copyWeak(&v144, location);
      [v7 setInvalidationHandler:v143];

      v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C577048];
      v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12);

      v13 = (void *)MEMORY[0x263EFFA08];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v16);

      v17 = (void *)MEMORY[0x263EFFA08];
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v20);

      v21 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      [v8 setClasses:v21 forSelector:sel_preWarmWithReply_ argumentIndex:0 ofReply:1];

      v22 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      [v8 setClasses:v22 forSelector:sel_preWarm_reply_ argumentIndex:0 ofReply:1];

      v23 = (void *)MEMORY[0x263EFFA08];
      uint64_t v24 = objc_opt_class();
      v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
      [v8 setClasses:v25 forSelector:sel_listEndPointCAs_ argumentIndex:0 ofReply:1];

      v26 = (void *)MEMORY[0x263EFFA08];
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = objc_opt_class();
      uint64_t v31 = objc_opt_class();
      v32 = objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, v31, objc_opt_class(), 0);
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v32);

      v33 = (void *)MEMORY[0x263EFFA08];
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      v39 = objc_msgSend(v33, "setWithObjects:", v34, v35, v36, v37, v38, objc_opt_class(), 0);
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v39);

      v40 = (void *)MEMORY[0x263EFFA08];
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      uint64_t v43 = objc_opt_class();
      uint64_t v44 = objc_opt_class();
      uint64_t v45 = objc_opt_class();
      v46 = objc_msgSend(v40, "setWithObjects:", v41, v42, v43, v44, v45, objc_opt_class(), 0);
      objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v46);

      v47 = (void *)MEMORY[0x263EFFA08];
      uint64_t v48 = objc_opt_class();
      uint64_t v49 = objc_opt_class();
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = objc_opt_class();
      uint64_t v52 = objc_opt_class();
      v53 = objc_msgSend(v47, "setWithObjects:", v48, v49, v50, v51, v52, objc_opt_class(), 0);
      [v8 setClasses:v53 forSelector:sel_createLocalEndpointWithProxy_readerIdentifier_readerPublicKey_reply_ argumentIndex:0 ofReply:1];

      v54 = (void *)MEMORY[0x263EFFA08];
      uint64_t v55 = objc_opt_class();
      uint64_t v56 = objc_opt_class();
      uint64_t v57 = objc_opt_class();
      uint64_t v58 = objc_opt_class();
      uint64_t v59 = objc_opt_class();
      uint64_t v60 = objc_opt_class();
      v61 = objc_msgSend(v54, "setWithObjects:", v55, v56, v57, v58, v59, v60, objc_opt_class(), 0);
      [v8 setClasses:v61 forSelector:sel_createLyonEndpointWithProxy_readerGroupIdentifier_readerPublicKey_homeUUID_privateMailboxSize_reply_ argumentIndex:0 ofReply:1];

      v62 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C56E8E8];
      [v8 setInterface:v62 forSelector:sel_createAlishaEndpointWithProxy_identifier_authorityIdentifier_subjectIdentifier_configuration_readerIdentifier_readerPublicKey_readerInformation_startDate_endDate_keyIdentifier_authorizedKeys_confidentialMailBoxSize_privateMailBoxSize_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createHydraEndpointWithProxy_serverParams_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createLyonHydraEndpointWithProxy_serverParams_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createEncryptionKeyEndPointWithProxy_identifier_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_updateHydraMailboxesWithProxy_identifier_encryptedSEBlob_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createLocalEndpointWithProxy_readerIdentifier_readerPublicKey_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createLyonEndpointWithProxy_readerGroupIdentifier_readerPublicKey_homeUUID_privateMailboxSize_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_updateLyonCredentialDocumentStatusWithProxy_endpointIdentifier_accessDocumentPresent_accessDocumentSignedTimestamp_revocationDocumentPresent_revocationDocumentSignedTimestamp_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_configureEndpointWithProxy_identifier_privateData_confidentialData_contactlessVolatileVisibility_contactlessPersistentVisibility_wiredVolatileVisibility_wiredPersistentVisibility_keySlot_nfcExpressOnlyInLPM_reply_ argumentIndex:0 ofReply:0];
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      [v8 setInterface:v62 forSelector:sel_cleanupAppletsWithNoEndpoints_reply_ argumentIndex:0 ofReply:0];
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      [v8 setInterface:v62 forSelector:sel_remoteTerminationRequestWithProxy_remoteTerminationRequest_publicKeyIdentifier_taskID_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_deleteEndPointWithProxy_identifier_mustBeTerminated_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_setPrivateDataWithProxy_identifier_privateData_privateDataOffset_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_getPrivateDataWithProxy_identifier_privateDataOffset_privateDataLength_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_signWithSEKey_keyData_data_algorithm_laExternalizedContext_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_signPrecomputedDigest_keyData_digest_algorithm_laExternalizedContext_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_sharedSecretWithSEKey_keyData_publicKey_algorithm_laExternalizedContext_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createPTAttestation_keyData_subjectIdentifier_nonce_OIDs_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_createSEKey_extractedACLs_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_deleteSEKey_keyData_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_listEndPointContainers_reply_ argumentIndex:0 ofReply:0];
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      [v8 setInterface:v62 forSelector:sel_createSELegacyKey_subjectIdentifier_metaData_localValidationList_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_deleteSELegacyKey_keySlot_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_signWithSELegacyKey_keySlot_challenge_metaData_authorization_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_signPrecomputedWithSELegacyKey_keySlot_metaData_authorization_authorizationType_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_getSELegacyKeyOccupiedSlots_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_convertEndpointWithProxy_keyIdentifier_notBeforeDate_reply_ argumentIndex:0 ofReply:0];
      objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v62);
      [v8 setInterface:v62 forSelector:sel_preAuthorizeEndpointWithProxy_keyIdentifier_bindingAttestation_reply_ argumentIndex:0 ofReply:0];
      [v8 setInterface:v62 forSelector:sel_authorizeEndPointWithProxy_version_identifier_externalCA_instanceCA_endpointCertificate_encryptionKeyAttestation_bindingAttestation_bindingAttestationToken_confidentialDataOffset_confidentialDataLength_metaData_authorizationID_reply_ argumentIndex:0 ofReply:0];
      v63 = (void *)MEMORY[0x263EFFA08];
      uint64_t v64 = objc_opt_class();
      uint64_t v65 = objc_opt_class();
      uint64_t v66 = objc_opt_class();
      uint64_t v67 = objc_opt_class();
      uint64_t v68 = objc_opt_class();
      v69 = objc_msgSend(v63, "setWithObjects:", v64, v65, v66, v67, v68, objc_opt_class(), 0);
      [v8 setClasses:v69 forSelector:sel_listEndPointsWithProxy_reply_ argumentIndex:0 ofReply:1];

      v70 = (void *)MEMORY[0x263EFFA08];
      uint64_t v71 = objc_opt_class();
      uint64_t v72 = objc_opt_class();
      v73 = objc_msgSend(v70, "setWithObjects:", v71, v72, objc_opt_class(), 0);
      [v8 setClasses:v73 forSelector:sel_createEndPointAuthorizationID_userAuth_reply_ argumentIndex:0 ofReply:1];

      v74 = (void *)MEMORY[0x263EFFA08];
      uint64_t v75 = objc_opt_class();
      v76 = objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
      [v8 setClasses:v76 forSelector:sel_authorizeEndPointWithProxy_version_identifier_externalCA_instanceCA_endpointCertificate_encryptionKeyAttestation_bindingAttestation_bindingAttestationToken_confidentialDataOffset_confidentialDataLength_metaData_authorizationID_reply_ argumentIndex:0 ofReply:1];

      v77 = (void *)MEMORY[0x263EFFA08];
      uint64_t v78 = objc_opt_class();
      v79 = objc_msgSend(v77, "setWithObjects:", v78, objc_opt_class(), 0);
      [v8 setClasses:v79 forSelector:sel_signatureWithEndPointIdentifier_metaDataHash_authorization_reply_ argumentIndex:0 ofReply:1];

      v80 = (void *)MEMORY[0x263EFFA08];
      uint64_t v81 = objc_opt_class();
      v82 = objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
      [v8 setClasses:v82 forSelector:sel_signatureISO18013WithEndPointIdentifier_toBeSigned_reply_ argumentIndex:0 ofReply:1];

      v83 = (void *)MEMORY[0x263EFFA08];
      uint64_t v84 = objc_opt_class();
      v85 = objc_msgSend(v83, "setWithObjects:", v84, objc_opt_class(), 0);
      [v8 setClasses:v85 forSelector:sel_getEndpointBindingAttestationRequestWithProxy_authorityIdentifier_reply_ argumentIndex:0 ofReply:1];

      v86 = (void *)MEMORY[0x263EFFA08];
      uint64_t v87 = objc_opt_class();
      uint64_t v88 = objc_opt_class();
      uint64_t v89 = objc_opt_class();
      v90 = objc_msgSend(v86, "setWithObjects:", v87, v88, v89, objc_opt_class(), 0);
      [v8 setClasses:v90 forSelector:sel_listEndPointAuthorizations_ argumentIndex:0 ofReply:1];

      v91 = (void *)MEMORY[0x263EFFA08];
      uint64_t v92 = objc_opt_class();
      uint64_t v93 = objc_opt_class();
      v94 = objc_msgSend(v91, "setWithObjects:", v92, v93, objc_opt_class(), 0);
      [v8 setClasses:v94 forSelector:sel_listEndPointContainers_reply_ argumentIndex:0 ofReply:1];

      v95 = (void *)MEMORY[0x263EFFA08];
      uint64_t v96 = objc_opt_class();
      uint64_t v97 = objc_opt_class();
      v98 = objc_msgSend(v95, "setWithObjects:", v96, v97, objc_opt_class(), 0);
      [v8 setClasses:v98 forSelector:sel_createFiDOKeyForRelyingParty_relyingPartyAccountHash_challenge_usingProxy_callback_ argumentIndex:0 ofReply:0];

      v99 = (void *)MEMORY[0x263EFFA08];
      uint64_t v100 = objc_opt_class();
      uint64_t v101 = objc_opt_class();
      v102 = objc_msgSend(v99, "setWithObjects:", v100, v101, objc_opt_class(), 0);
      [v8 setClasses:v102 forSelector:sel_deleteFiDOKeyFor_usingProxy_callback_ argumentIndex:0 ofReply:0];

      v103 = (void *)MEMORY[0x263EFFA08];
      uint64_t v104 = objc_opt_class();
      uint64_t v105 = objc_opt_class();
      uint64_t v106 = objc_opt_class();
      v107 = objc_msgSend(v103, "setWithObjects:", v104, v105, v106, objc_opt_class(), 0);
      [v8 setClasses:v107 forSelector:sel_checkMultipleFidoKeyPresence_usingProxy_callback_ argumentIndex:0 ofReply:0];

      v108 = (void *)MEMORY[0x263EFFA08];
      uint64_t v109 = objc_opt_class();
      uint64_t v110 = objc_opt_class();
      uint64_t v111 = objc_opt_class();
      v112 = objc_msgSend(v108, "setWithObjects:", v109, v110, v111, objc_opt_class(), 0);
      [v8 setClasses:v112 forSelector:sel_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_externalizedAuth_usingProxy_callback_ argumentIndex:0 ofReply:0];

      v113 = (void *)MEMORY[0x263EFFA08];
      uint64_t v114 = objc_opt_class();
      uint64_t v115 = objc_opt_class();
      v116 = objc_msgSend(v113, "setWithObjects:", v114, v115, objc_opt_class(), 0);
      [v8 setClasses:v116 forSelector:sel_verifyWithFidoKeyFor_signedChallenge_usingProxy_callback_ argumentIndex:0 ofReply:0];

      v117 = (void *)MEMORY[0x263EFFA08];
      uint64_t v118 = objc_opt_class();
      uint64_t v119 = objc_opt_class();
      v120 = objc_msgSend(v117, "setWithObjects:", v118, v119, objc_opt_class(), 0);
      [v8 setClasses:v120 forSelector:sel_createFiDOKeyForRelyingParty_relyingPartyAccountHash_challenge_usingProxy_callback_ argumentIndex:0 ofReply:1];

      v121 = (void *)MEMORY[0x263EFFA08];
      uint64_t v122 = objc_opt_class();
      uint64_t v123 = objc_opt_class();
      v124 = objc_msgSend(v121, "setWithObjects:", v122, v123, objc_opt_class(), 0);
      [v8 setClasses:v124 forSelector:sel_checkMultipleFidoKeyPresence_usingProxy_callback_ argumentIndex:0 ofReply:1];

      v125 = (void *)MEMORY[0x263EFFA08];
      uint64_t v126 = objc_opt_class();
      uint64_t v127 = objc_opt_class();
      uint64_t v128 = objc_opt_class();
      uint64_t v129 = objc_opt_class();
      v130 = objc_msgSend(v125, "setWithObjects:", v126, v127, v128, v129, objc_opt_class(), 0);
      [v8 setClasses:v130 forSelector:sel_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_externalizedAuth_usingProxy_callback_ argumentIndex:0 ofReply:1];

      v131 = (void *)MEMORY[0x263EFFA08];
      uint64_t v132 = objc_opt_class();
      v133 = objc_msgSend(v131, "setWithObjects:", v132, objc_opt_class(), 0);
      [v8 setClasses:v133 forSelector:sel_createPrivacyKeyForGroupIdentifier_withOptions_completion_ argumentIndex:0 ofReply:1];

      v134 = (void *)MEMORY[0x263EFFA08];
      uint64_t v135 = objc_opt_class();
      uint64_t v136 = objc_opt_class();
      v137 = objc_msgSend(v134, "setWithObjects:", v135, v136, objc_opt_class(), 0);
      [v8 setClasses:v137 forSelector:sel_privacyKeysForGroupIdentifier_keyIdentifier_completion_ argumentIndex:0 ofReply:1];

      [v8 setClass:objc_opt_class() forSelector:sel_deletePrivacyKey_completion_ argumentIndex:0 ofReply:0];
      id v138 = v1[2];
      [v138 setRemoteObjectInterface:v8];

      id v139 = v1[2];
      [v139 resume];

      objc_destroyWeak(&v144);
      objc_destroyWeak(&v146);
      objc_destroyWeak(location);
    }
    v140 = 0;
LABEL_6:
    objc_sync_exit(v1);

    goto LABEL_7;
  }
  v140 = 0;
LABEL_7:
  return v140;
}

void __29__SESClient_connectToService__block_invoke(uint64_t a1)
{
  id v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_ERROR, "Connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SESClient connectionResetHandler](WeakRetained);
}

void __29__SESClient_connectToService__block_invoke_471(uint64_t a1)
{
  id v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_ERROR, "Connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SESClient connectionResetHandler](WeakRetained);
}

- (id)remoteObjectProxyWithError:(id *)a1
{
  if (a1)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__3;
    uint64_t v15 = __Block_byref_object_dispose__3;
    -[SESClient connectToService](a1);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (void *)v12[5];
    if (v4)
    {
      id v5 = 0;
      if (a2) {
        *a2 = v4;
      }
    }
    else
    {
      id v6 = a1[2];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __40__SESClient_remoteObjectProxyWithError___block_invoke;
      v10[3] = &unk_2642194D8;
      v10[4] = &v11;
      id v7 = [v6 remoteObjectProxyWithErrorHandler:v10];

      if (v12[5])
      {
        if (a2)
        {
          v8 = SESDefaultLogObject();
          SESCreateAndLogError();
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v5 = 0;
      }
      else
      {
        id v5 = v7;
      }
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __40__SESClient_remoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)synchronousRemoteObjectProxyWithError:(id *)a1
{
  if (a1)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__3;
    uint64_t v15 = __Block_byref_object_dispose__3;
    -[SESClient connectToService](a1);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (void *)v12[5];
    if (v4)
    {
      id v5 = 0;
      if (a2) {
        *a2 = v4;
      }
    }
    else
    {
      id v6 = a1[2];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __51__SESClient_synchronousRemoteObjectProxyWithError___block_invoke;
      v10[3] = &unk_2642194D8;
      v10[4] = &v11;
      id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

      if (v7 && !v12[5])
      {
        id v5 = v7;
      }
      else
      {
        if (a2)
        {
          v8 = SESDefaultLogObject();
          SESCreateAndLogError();
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v5 = 0;
      }
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __51__SESClient_synchronousRemoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end