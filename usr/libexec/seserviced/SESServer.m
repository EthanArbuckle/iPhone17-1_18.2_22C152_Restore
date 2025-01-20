@interface SESServer
+ (id)server;
+ (id)serverWithMachServiceName:(id)a3 storagePath:(id)a4;
- (BOOL)_deleteLoadedKey:(id)a3 instanceAID:(id)a4 loadedKey:(id)a5 error:(id *)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)instanceRepresentations;
- (OS_dispatch_queue)messageQueue;
- (SESDatabase)database;
- (id)_aclForFidoAttestingKey;
- (id)_applyConfidentialMailboxContents:(id *)a3 secureElement:(id)a4 instanceAID:(id)a5 keyIdentifier:(id)a6;
- (id)_applyPrivateMailboxContents:(id *)a3 secureElement:(id)a4 instanceAID:(id)a5 keyIdentifier:(id)a6;
- (id)_createEndPointCA:(id)a3 database:(id)a4 clientName:(id)a5 identifier:(id)a6 subjectIdentifier:(id)a7 forEndPointType:(int64_t)a8 error:(id *)a9;
- (id)_createKey:(id)a3 acl:(id)a4 error:(id *)a5;
- (id)_createSynchronizableKey:(id)a3 extractedACLs:(id)a4 error:(id *)a5;
- (id)_ensureCAExistsAndValid:(id)a3 clientName:(id)a4 secureElement:(id)a5 database:(id)a6 forEndPointType:(int64_t)a7 error:(id *)a8;
- (id)_extractedACLForFidoKey;
- (id)_getBAACertificatesForKey:(id)a3 key:(id)a4 subjectIdentifier:(id)a5 nonce:(id)a6 OIDs:(id)a7 validityInterval:(id)a8 error:(id *)a9;
- (id)_getEndPointAndValidateAccess:(id)a3 identifier:(id)a4 clientInfo:(id)a5 outEndPointEntity:(id *)a6 outEndPoint:(id *)a7;
- (id)_renewEndPointCAIfExpired:(id)a3 secureElement:(id)a4 forEndPointType:(int64_t)a5;
- (id)getEncryptedCarOEMProprietaryData:(id)a3 withEndpointEntity:(id)a4 withSecureElement:(id)a5;
- (id)getKeyHandle:(id)a3 key:(id)a4 error:(id *)a5;
- (id)getOccupiedLegacyKeySlots:(id *)a3;
- (id)getUsableKeySlot:(id)a3;
- (id)getUsableLegacyKeySlot:(id)a3 outError:(id *)a4;
- (id)initializeRAMRepresentation:(id)a3;
- (id)revokeRemoteTerminationRequestEndPoints:(id)a3 sesDatabase:(id)a4 identifier:(id)a5 taskID:(id)a6 clientInfo:(id)a7 outError:(id *)a8;
- (os_state_data_s)_dumpState;
- (unint64_t)_existsDuplicateInDatabase:(id)a3 airInstanceEntity:(id)a4 withIdentifier:(id)a5 orReaderIdentifier:(id)a6 outError:(id *)a7;
- (void)addEndpointId:(id)a3 withUuid:(id)a4 reply:(id)a5;
- (void)addInvitationWithId:(id)a3 data:(id)a4 reply:(id)a5;
- (void)authorizeEndPointWithProxy:(id)a3 version:(unsigned __int8)a4 identifier:(id)a5 externalCA:(id)a6 instanceCA:(id)a7 endpointCertificate:(id)a8 encryptionKeyAttestation:(id)a9 bindingAttestation:(id)a10 bindingAttestationToken:(id)a11 confidentialDataOffset:(unsigned __int16)a12 confidentialDataLength:(unsigned __int16)a13 metaData:(id)a14 authorizationID:(id)a15 reply:(id)a16;
- (void)carKeyDowngradeVersionSetting:(id)a3 brand:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)checkKeyValidity:(id)a3 completion:(id)a4;
- (void)checkMultipleFidoKeyPresence:(id)a3 usingProxy:(id)a4 callback:(id)a5;
- (void)cleanupAppletsWithNoEndpoints:(id)a3 reply:(id)a4;
- (void)configureEndpointWithProxy:(id)a3 identifier:(id)a4 privateData:(id)a5 confidentialData:(id)a6 contactlessVolatileVisibility:(id)a7 contactlessPersistentVisibility:(id)a8 wiredVolatileVisibility:(id)a9 wiredPersistentVisibility:(id)a10 keySlot:(id)a11 nfcExpressOnlyInLPM:(id)a12 reply:(id)a13;
- (void)convertEndpointWithProxy:(id)a3 keyIdentifier:(id)a4 notBeforeDate:(id)a5 reply:(id)a6;
- (void)createAlishaEndpointWithProxy:(id)a3 identifier:(id)a4 authorityIdentifier:(id)a5 subjectIdentifier:(id)a6 configuration:(id)a7 readerIdentifier:(id)a8 readerPublicKey:(id)a9 readerInformation:(id)a10 startDate:(id)a11 endDate:(id)a12 keyIdentifier:(id)a13 authorizedKeys:(id)a14 confidentialMailBoxSize:(id)a15 privateMailBoxSize:(id)a16 reply:(id)a17;
- (void)createCertificateForKeyData:(id)a3 withKeyData:(id)a4 subjectIdentifier:(id)a5 authorityIdentifier:(id)a6 laExternalizedContext:(id)a7 nonce:(id)a8 OIDs:(id)a9 reply:(id)a10;
- (void)createEncryptionKeyEndPointWithProxy:(id)a3 identifier:(id)a4 reply:(id)a5;
- (void)createEndPointAuthorizationID:(id)a3 userAuth:(id)a4 reply:(id)a5;
- (void)createEndPointCA:(id)a3 subjectIdentifier:(id)a4 reply:(id)a5;
- (void)createFiDOKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingProxy:(id)a6 callback:(id)a7;
- (void)createHydraEndpointWithProxy:(id)a3 serverParams:(id)a4 reply:(id)a5;
- (void)createLocalEndpointWithProxy:(id)a3 readerIdentifier:(id)a4 readerPublicKey:(id)a5 reply:(id)a6;
- (void)createLyonEndpointWithProxy:(id)a3 readerGroupIdentifier:(id)a4 readerPublicKey:(id)a5 homeUUID:(id)a6 privateMailboxSize:(id)a7 reply:(id)a8;
- (void)createLyonHydraEndpointWithProxy:(id)a3 serverParams:(id)a4 reply:(id)a5;
- (void)createPTAttestation:(id)a3 keyData:(id)a4 subjectIdentifier:(id)a5 nonce:(id)a6 OIDs:(id)a7 reply:(id)a8;
- (void)createPrivacyKeyForGroupIdentifier:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)createSEABAASCertificate:(id)a3 subjectIdentifier:(id)a4 nonce:(id)a5 OIDs:(id)a6 validityInterval:(id)a7 reply:(id)a8;
- (void)createSEKey:(id)a3 extractedACLs:(id)a4 reply:(id)a5;
- (void)createSELegacyKey:(id)a3 subjectIdentifier:(id)a4 metaData:(id)a5 localValidationList:(id)a6 reply:(id)a7;
- (void)databaseService:(id)a3 reply:(id)a4;
- (void)databaseServiceWithProxy:(id)a3 isReconcileRequired:(BOOL)a4 reason:(id)a5 reply:(id)a6;
- (void)decryptPayload:(id)a3 withGroupIdentifier:(id)a4 completion:(id)a5;
- (void)decryptWithSEKey:(id)a3 cipherText:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 sharedInfo:(id)a8 authenticationData:(id)a9 authenticationTag:(id)a10 reply:(id)a11;
- (void)deleteEndPointAuthorizationID:(id)a3 reply:(id)a4;
- (void)deleteEndPointCA:(id)a3 reply:(id)a4;
- (void)deleteEndPointWithProxy:(id)a3 identifier:(id)a4 mustBeTerminated:(BOOL)a5 reply:(id)a6;
- (void)deleteEndPointWithPublicKey:(id)a3 reply:(id)a4;
- (void)deleteEndPointWithPublicKeyIdentifier:(id)a3 reply:(id)a4;
- (void)deleteEndpointIdWithUuid:(id)a3 reply:(id)a4;
- (void)deleteFiDOKeyFor:(id)a3 usingProxy:(id)a4 callback:(id)a5;
- (void)deleteInvitationWithId:(id)a3 reply:(id)a4;
- (void)deletePrivacyKey:(id)a3 completion:(id)a4;
- (void)deleteSEKey:(id)a3 keyData:(id)a4 reply:(id)a5;
- (void)deleteSELegacyKey:(id)a3 keySlot:(id)a4 reply:(id)a5;
- (void)designateKey:(id)a3 designation:(id)a4 handoffToken:(id)a5 completion:(id)a6;
- (void)encryptPayload:(id)a3 encryptionScheme:(id)a4 recipientPublicKey:(id)a5 completion:(id)a6;
- (void)encryptWithSEKey:(id)a3 plainText:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 sharedInfo:(id)a8 authenticationData:(id)a9 reply:(id)a10;
- (void)endPointAction:(id)a3 clientInfo:(id)a4 reason:(id)a5 reply:(id)a6;
- (void)endPointAction:(id)a3 proxy:(id)a4 clientInfo:(id)a5 reason:(id)a6 reply:(id)a7;
- (void)endPointDBAction:(id)a3 clientInfo:(id)a4 reason:(id)a5 reply:(id)a6;
- (void)endPointServiceAvailable:(id)a3 reply:(id)a4;
- (void)endPointServiceAvailableWithProxy:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)getCAGeneralStatisticsInfo:(id)a3;
- (void)getCASDCertificate:(id)a3 reply:(id)a4;
- (void)getEndpointBindingAttestationRequestWithProxy:(id)a3 authorityIdentifier:(id)a4 reply:(id)a5;
- (void)getEndpointIdWithUuid:(id)a3 reply:(id)a4;
- (void)getInvitationWithId:(id)a3 reply:(id)a4;
- (void)getInvitations:(id)a3;
- (void)getPrivateDataWithProxy:(id)a3 identifier:(id)a4 privateDataOffset:(unsigned __int16)a5 privateDataLength:(unsigned __int16)a6 reply:(id)a7;
- (void)getSELegacyKeyOccupiedSlots:(id)a3 reply:(id)a4;
- (void)getSESKeySupportedFeatures:(id)a3;
- (void)getSupportedLyonVersionsWithReply:(id)a3;
- (void)handleMFDNotification:(id)a3;
- (void)isCarKeySupported:(id)a3 brand:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)keyOperation:(id)a3 handoffToken:(id)a4 keyData:(id)a5 reason:(id)a6 reply:(id)a7;
- (void)keyOperation:(id)a3 keyData:(id)a4 reason:(id)a5 reply:(id)a6;
- (void)keyServiceAvailable:(id)a3 handoffToken:(id)a4 reason:(id)a5 reply:(id)a6;
- (void)keyServiceAvailable:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)legacyKeyServiceAvailable:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)listEndPointAuthorizations:(id)a3;
- (void)listEndPointCAs:(id)a3;
- (void)listEndPointContainers:(id)a3 reply:(id)a4;
- (void)listEndPointsWithProxy:(id)a3 reply:(id)a4;
- (void)notifyEndpointTracked:(id)a3 reply:(id)a4;
- (void)notifyPassAdded:(id)a3 reply:(id)a4;
- (void)onFirstUnlock;
- (void)preAuthorizeEndpointWithProxy:(id)a3 keyIdentifier:(id)a4 bindingAttestation:(id)a5 reply:(id)a6;
- (void)preWarm:(id)a3 reply:(id)a4;
- (void)preWarmWithReply:(id)a3;
- (void)privacyDecryptDataWithEndPoint:(id)a3 data:(id)a4 ephemeralPublicKey:(id)a5 reply:(id)a6;
- (void)privacyDecryptDataWithKeyPair:(id)a3 secretKey:(id)a4 data:(id)a5 ephemeralPublicKey:(id)a6 reply:(id)a7;
- (void)privacyEncryptDataWithEndPoint:(id)a3 data:(id)a4 reply:(id)a5;
- (void)privacyEncryptDataWithManufacturer:(id)a3 environment:(id)a4 region:(id)a5 data:(id)a6 reply:(id)a7;
- (void)privacyKeysForGroupIdentifier:(id)a3 keyIdentifier:(id)a4 completion:(id)a5;
- (void)remoteTerminationRequestWithProxy:(id)a3 remoteTerminationRequest:(id)a4 publicKeyIdentifier:(id)a5 taskID:(id)a6 reply:(id)a7;
- (void)removeDesignation:(int64_t)a3 completion:(id)a4;
- (void)revokeEndPointWithIdentifier:(id)a3 nonce:(id)a4 metaData:(id)a5 reply:(id)a6;
- (void)rewrapWithSEKey:(id)a3 cipherText:(id)a4 publicKey:(id)a5 decryptAlgorithm:(id)a6 decryptSharedInfo:(id)a7 encryptAlgorithm:(id)a8 encryptSharedInfo:(id)a9 certificate:(id)a10 laExternalizedContext:(id)a11 decryptAuthenticationData:(id)a12 decryptAuthenticationTag:(id)a13 encryptAuthenticationData:(id)a14 reply:(id)a15;
- (void)secureElementService:(id)a3 reply:(id)a4;
- (void)sendDeviceIntentWithConfidence:(id)a3 keyIdentifier:(id)a4 reply:(id)a5;
- (void)setConfidentialDataEndPointWithIdentifier:(id)a3 senderEphemeralPublicKey:(id)a4 encryptedData:(id)a5 offset:(unsigned __int16)a6 reply:(id)a7;
- (void)setDesignation:(id)a3 designation:(int64_t)a4 handoffToken:(id)a5 completion:(id)a6;
- (void)setInstanceRepresentations:(id)a3;
- (void)setPrivateDataWithProxy:(id)a3 identifier:(id)a4 privateData:(id)a5 privateDataOffset:(unsigned __int16)a6 reply:(id)a7;
- (void)setSESServerDelegate:(id)a3;
- (void)sharedSecretWithSEKey:(id)a3 keyData:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8;
- (void)signMultipleWithFidoKeysFor:(id)a3 challenges:(id)a4 forEndpointIdentifiers:(id)a5 externalizedAuth:(id)a6 usingProxy:(id)a7 callback:(id)a8;
- (void)signPrecomputedDigest:(id)a3 keyData:(id)a4 digest:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8;
- (void)signPrecomputedWithSELegacyKey:(id)a3 keySlot:(id)a4 metaData:(id)a5 authorization:(id)a6 authorizationType:(id)a7 reply:(id)a8;
- (void)signWithSEKey:(id)a3 keyData:(id)a4 data:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8;
- (void)signWithSELegacyKey:(id)a3 keySlot:(id)a4 challenge:(id)a5 metaData:(id)a6 authorization:(id)a7 reply:(id)a8;
- (void)signatureISO18013WithEndPointIdentifier:(id)a3 toBeSigned:(id)a4 reply:(id)a5;
- (void)signatureWithEndPointIdentifier:(id)a3 metaDataHash:(id)a4 authorization:(id)a5 reply:(id)a6;
- (void)start;
- (void)triggerHeadUnitPairing:(id)a3 data:(id)a4 reply:(id)a5;
- (void)updateACLForSEKey:(id)a3 extractedACLs:(id)a4 laExternalizedContext:(id)a5 reply:(id)a6;
- (void)updateEndpoint:(id)a3 reply:(id)a4;
- (void)updateHydraMailboxesWithProxy:(id)a3 identifier:(id)a4 encryptedSEBlob:(id)a5 reply:(id)a6;
- (void)updateLyonCredentialDocumentStatusWithProxy:(id)a3 endpointIdentifier:(id)a4 accessDocumentPresent:(BOOL)a5 accessDocumentSignedTimestamp:(id)a6 revocationDocumentPresent:(BOOL)a7 revocationDocumentSignedTimestamp:(id)a8 reply:(id)a9;
- (void)verifyWithFidoKeyFor:(id)a3 signedChallenge:(id)a4 usingProxy:(id)a5 callback:(id)a6;
@end

@implementation SESServer

- (NSMutableArray)instanceRepresentations
{
  return (NSMutableArray *)objc_getAssociatedObject(self, "instanceRepresentations");
}

- (void)setInstanceRepresentations:(id)a3
{
}

- (id)initializeRAMRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v5);

  v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "initializeRAMRepresentation", buf, 2u);
  }

  v7 = [(SESServer *)self instanceRepresentations];

  if (v7)
  {
    v8 = 0;
    goto LABEL_51;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C38;
  block[3] = &unk_10040B880;
  block[4] = self;
  if (qword_10045CC60 != -1) {
    dispatch_once(&qword_10045CC60, block);
  }
  id v70 = 0;
  v9 = +[SESKeyDesignationStorageCoordinator getAndReturnError:&v70];
  id v10 = v70;
  v11 = v10;
  if (!v9 || v10)
  {
    v8 = SESEnsureError();
  }
  else
  {
    v49 = self;
    v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [&off_10042D970 count]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v52 = [&off_10042D970 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (!v52) {
      goto LABEL_46;
    }
    uint64_t v51 = *(void *)v67;
    v50 = v12;
    id v54 = v4;
LABEL_11:
    uint64_t v13 = 0;
LABEL_12:
    if (*(void *)v67 != v51) {
      objc_enumerationMutation(&off_10042D970);
    }
    v14 = *(void **)(*((void *)&v66 + 1) + 8 * v13);
    v58 = [[InstanceRepresentation alloc] initWithAID:v14];
    v56 = v14;
    v15 = [v14 hexStringAsData];
    id v65 = 0;
    v16 = sub_100031E58(v4, v15, &v65);
    id v17 = v65;

    if (!v17)
    {
      uint64_t v53 = v13;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id obj = v16;
      p_cache = &OBJC_METACLASS___FirstUnlockHandler.cache;
      id v60 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
      if (!v60) {
        goto LABEL_44;
      }
      uint64_t v59 = *(void *)v62;
      while (1)
      {
        for (i = 0; i != v60; i = (char *)i + 1)
        {
          if (*(void *)v62 != v59) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          v21 = [p_cache + 133 withKeyData:v20 state:2];
          v22 = v21;
          if (v21)
          {
            if ([v21 number] < 2)
            {
              uint64_t v23 = 4;
              goto LABEL_23;
            }
            if ([v22 number] >= 2 && objc_msgSend(v22, "number") <= 0xF)
            {
              uint64_t v23 = 6;
LABEL_23:
              [v22 setState:v23];
            }
            unsigned int v24 = [v22 number];
            v25 = [(InstanceRepresentation *)v58 keys];
            id v26 = [v25 count];

            if ((unint64_t)v26 <= v24)
            {
              v42 = [v56 hexStringAsData];
              v28 = sub_100034168(v4, v42, [v22 number]);

              v43 = SESDefaultLogObject();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                unsigned int v44 = [v22 number];
                v45 = [v20 asHexString];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v73 = v44;
                *(_WORD *)&v73[4] = 2112;
                *(void *)&v73[6] = v45;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Out of range keySlot number %u from blob %@", buf, 0x12u);
              }
              v41 = SESDefaultLogObject();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v73 = v28;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Cleaned up with error: %@", buf, 0xCu);
              }
            }
            else
            {
              v27 = [v22 keyIdentifier];
              v28 = [v9 findKeyWithKeyIdentifier:v27];

              if (v28)
              {
                [v22 setDesignation:[v28 designation]];
                id v29 = [v28 slotNumber];
                if (v29 != (id)[v22 number])
                {
                  v30 = SESDefaultLogObject();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                  {
                    unsigned int v31 = [v28 designation];
                    *(_DWORD *)buf = 138412546;
                    *(void *)v73 = v22;
                    *(_WORD *)&v73[8] = 1024;
                    *(_DWORD *)&v73[10] = v31;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "Inconsistent state on SE %@ in designation slot %d", buf, 0x12u);
                  }

                  v32 = [v56 hexStringAsData];
                  uint64_t v55 = [v22 number];
                  v33 = [v22 keyIdentifier];
                  v34 = [v28 assetACL];
                  v35 = [v28 assetACLAttestation];
                  v37 = sub_100056FD0(v4, v36);
                  if ((unint64_t)[v37 type] <= 3) {
                    uint64_t v38 = 1;
                  }
                  else {
                    uint64_t v38 = 2;
                  }
                  id v39 = [v22 designation];
                  uint64_t v40 = v38;
                  id v4 = v54;
                  [v9 designateKeyWithAid:v32 slotNumber:v55 keyIdentifier:v33 assetACL:v34 assetACLAttestation:v35 operationApprovalVersion:v40 designation:v39];

                  p_cache = (void **)(&OBJC_METACLASS___FirstUnlockHandler + 16);
                }
              }
              v41 = [(InstanceRepresentation *)v58 keys];
              -[NSObject setObject:atIndexedSubscript:](v41, "setObject:atIndexedSubscript:", v22, [v22 number]);
            }
          }
        }
        id v60 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (!v60)
        {
LABEL_44:

          v12 = v50;
          [v50 addObject:v58];

          uint64_t v13 = v53 + 1;
          if ((id)(v53 + 1) == v52)
          {
            id v52 = [&off_10042D970 countByEnumeratingWithState:&v66 objects:v75 count:16];
            if (!v52)
            {
LABEL_46:
              [v9 commit];
              [(SESServer *)v49 setInstanceRepresentations:v12];
              v46 = [(SESServer *)v49 messageQueue];
              os_state_add_handler();

              v8 = 0;
              goto LABEL_49;
            }
            goto LABEL_11;
          }
          goto LABEL_12;
        }
      }
    }
    v47 = SESDefaultLogObject();
    v8 = SESCreateAndLogError();

LABEL_49:
    v11 = 0;
  }

LABEL_51:

  return v8;
}

- (void)handleMFDNotification:(id)a3
{
  id v4 = [(SESServer *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D68;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(v4, block);
}

- (os_state_data_s)_dumpState
{
  v3 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(SESServer *)self instanceRepresentations];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 keys];
        v12 = [v11 filterMap:&stru_10040B8E8];

        uint64_t v13 = [v10 AID];
        [v4 setObject:v12 forKeyedSubscript:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = (os_state_data_s *)sub_1000190DC((uint64_t)"seskeyxpc.state", (uint64_t)v4);
  return v14;
}

- (void)keyServiceAvailable:(id)a3 reason:(id)a4 reply:(id)a5
{
}

- (void)keyServiceAvailable:(id)a3 handoffToken:(id)a4 reason:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240448;
    BOOL v27 = v10 != 0;
    __int16 v28 = 1026;
    BOOL v29 = v11 != 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "KeyServiceAvailable proxy %{public}d token %{public}d", buf, 0xEu);
  }

  v15 = +[NSXPCConnection currentConnection];
  long long v16 = sub_10003929C((uint64_t)SESClientInfo, v15);

  if (sub_1000394C4((uint64_t)v16))
  {
    long long v17 = [(SESServer *)self messageQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000061E0;
    block[3] = &unk_10040B960;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    unsigned int v24 = self;
    id v25 = v13;
    dispatch_async(v17, block);

    long long v18 = v21;
  }
  else
  {
    long long v18 = SESDefaultLogObject();
    long long v19 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v19);
  }
}

- (void)legacyKeyServiceAvailable:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v23 = v8 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "legacyKeyServiceAvailable proxy %{public}d", buf, 8u);
  }

  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

  if (sub_1000394D4((uint64_t)v13))
  {
    v14 = [(SESServer *)self messageQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006678;
    v17[3] = &unk_10040B988;
    id v18 = v8;
    id v19 = v9;
    v20 = self;
    id v21 = v10;
    dispatch_async(v14, v17);

    v15 = v18;
  }
  else
  {
    v15 = SESDefaultLogObject();
    long long v16 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

- (void)keyOperation:(id)a3 keyData:(id)a4 reason:(id)a5 reply:(id)a6
{
}

- (void)keyOperation:(id)a3 handoffToken:(id)a4 keyData:(id)a5 reason:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v23 = 0;
  long long v16 = +[PTClassicKey withData:a5 error:&v23];
  id v17 = v23;
  id v18 = v17;
  if (v16) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006A70;
    v20[3] = &unk_10040B9B0;
    id v22 = v15;
    v20[4] = self;
    id v21 = v16;
    [(SESServer *)self keyServiceAvailable:v12 handoffToken:v13 reason:v14 reply:v20];
  }
  else
  {
    (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v17);
  }
}

- (id)getUsableKeySlot:(id)a3
{
  id v4 = a3;
  v5 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SESServer *)self instanceRepresentations];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006E3C;
  v22[3] = &unk_10040B9D8;
  id v7 = v4;
  id v23 = v7;
  id v8 = [v6 find:v22];

  if (v8)
  {
    id v9 = [v8 keys];
    id v10 = [v9 find:&stru_10040BA18];

    if (v10)
    {
      id v11 = SESDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v12 = [v10 number];
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Returning empty keySlot %u", buf, 8u);
      }

      id v13 = v10;
      id v14 = v13;
    }
    else
    {
      id v15 = [v8 keys];
      long long v16 = [v15 filter:&stru_10040BA38];

      if (v16)
      {
        id v17 = [v16 randomElement];
        id v18 = SESDefaultLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v19 = [v17 number];
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Returning occupied keySlot %u", buf, 8u);
        }

        id v13 = v17;
      }
      else
      {
        v20 = SESDefaultLogObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Went through all slots, NONE OF THEM are free or occupied?!", buf, 2u);
        }

        id v13 = 0;
      }

      id v14 = v13;
    }
  }
  else
  {
    id v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't find AID %@", buf, 0xCu);
    }
    id v14 = 0;
  }

  return v14;
}

- (id)getUsableLegacyKeySlot:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(SESServer *)self instanceRepresentations];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007150;
  v18[3] = &unk_10040B9D8;
  id v9 = v6;
  id v19 = v9;
  id v10 = [v8 find:v18];

  if (v10)
  {
    id v11 = [v10 keys];
    id v12 = [v11 find:&stru_10040BA58];

    if (v12)
    {
      id v13 = SESDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v14 = [v12 number];
        *(_DWORD *)buf = 67109120;
        unsigned int v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Returning empty keySlot %u", buf, 8u);
      }

      id v12 = v12;
      id v15 = v12;
    }
    else
    {
      if (a4)
      {
        long long v16 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v15 = 0;
    }
    goto LABEL_11;
  }
  if (a4)
  {
    SESDefaultLogObject();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (id)getOccupiedLegacyKeySlots:(id *)a3
{
  v5 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SESServer *)self instanceRepresentations];
  id v7 = [v6 find:&stru_10040BA98];

  if (v7)
  {
    id v8 = [v7 keys];
    id v9 = [v8 filterMap:&stru_10040BAD8];
LABEL_5:

    goto LABEL_6;
  }
  if (a3)
  {
    id v8 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (id)getKeyHandle:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(SESServer *)self instanceRepresentations];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100007B70;
  v61[3] = &unk_10040B9D8;
  long long v62 = @"A000000704C0000000000002";
  id v12 = [v11 find:v61];

  if (v12)
  {
    id v13 = [@"A000000704C0000000000002" hexStringAsData];
    unsigned int v14 = sub_100033DBC(v8, v13);

    id v15 = SESDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v16 = [v9 isExportedData];
      id v17 = [v9 keyIdentifier];
      id v18 = [v17 asHexString];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)long long v64 = v14;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v16;
      *(_WORD *)id v65 = 2112;
      *(void *)&v65[2] = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "PTCVersion %d isExportedData %d keyIdentifier %@", buf, 0x18u);
    }
    id v19 = [v12 keys];
    if (v14 < 2)
    {
      v20 = v59;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      unsigned int v21 = sub_100007C18;
    }
    else
    {
      v20 = v60;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      unsigned int v21 = sub_100007BB4;
    }
    v20[2] = v21;
    v20[3] = &unk_10040BB00;
    id v24 = v9;
    v20[4] = v24;
    id v22 = [v19 find:v20];

    if (v22)
    {
      id v25 = SESDefaultLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)long long v64 = v24;
        *(_WORD *)&v64[8] = 2112;
        *(void *)id v65 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Found already-loaded %@ in %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
    uint64_t v27 = [(SESServer *)self getUsableKeySlot:@"A000000704C0000000000002"];
    if (v27)
    {
      id v22 = (void *)v27;
      __int16 v28 = SESDefaultLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        unsigned int v29 = [v24 keyNumber];
        unsigned int v30 = [v22 number];
        unsigned int v31 = [v24 isExportedData];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)long long v64 = v29;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v30;
        *(_WORD *)id v65 = 1024;
        *(_DWORD *)&v65[2] = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Loading key with number 0x%x in slot %u (exported %d)", buf, 0x14u);
      }

      if (![v24 isExportedData])
      {
        unsigned int v44 = [@"A000000704C0000000000002" hexStringAsData];
        v45 = sub_100037B64(v8, v44, v24, [v22 number]);

        if (!v45) {
          goto LABEL_38;
        }
        v46 = [@"A000000704C0000000000002" hexStringAsData];
        id v47 = sub_100034168(v8, v46, [v22 number]);

        [v22 resetToEmpty];
        if (a5) {
          *a5 = v45;
        }

LABEL_47:
        id v23 = 0;
        goto LABEL_15;
      }
      v32 = +[SEKeySyncManager singleton];
      v33 = [v24 keyData];
      id v58 = 0;
      v34 = [v32 haveAvailableTLKForEncryptedData:v33 secureElement:v8 error:&v58];
      id v35 = v58;

      if (![v34 BOOLValue] || v35)
      {
        if (!a5)
        {
LABEL_46:

          goto LABEL_47;
        }
        v48 = SESDefaultLogObject();
        v49 = SESCreateAndLogError();
      }
      else
      {
        uint64_t v55 = v34;
        v36 = [@"A000000704C0000000000002" hexStringAsData];
        unsigned int v37 = sub_100033DBC(v8, v36);

        if (v37 <= 3
          && (([@"A000000704C0000000000002" hexStringAsData],
               uint64_t v38 = objc_claimAutoreleasedReturnValue(),
               id v57 = 0,
               int v39 = sub_100038F1C(v8, v38, (uint64_t)[v22 number], &v57),
               id v35 = v57,
               v38,
               !v39)
           || v35))
        {
          id v52 = [@"A000000704C0000000000002" hexStringAsData];
          id v53 = sub_100034168(v8, v52, [v22 number]);

          [v22 resetToEmpty];
          if (!a5)
          {
            v34 = v55;
            goto LABEL_46;
          }
          v48 = SESDefaultLogObject();
          v49 = SESCreateAndLogError();
          v34 = v55;
        }
        else
        {
          id v54 = v32;
          uint64_t v40 = [@"A000000704C0000000000002" hexStringAsData];
          unsigned int v41 = [v22 number];
          v42 = [v24 keyData];
          id v56 = 0;
          BOOL v43 = sub_100038048(v8, v40, v41, v42, &v56);
          id v35 = v56;

          if (v43 && !v35)
          {

LABEL_38:
            [v22 didLoadKey:v24];
LABEL_14:
            id v23 = +[LoadedKeySlot withKeySlot:v22 key:v24];
            goto LABEL_15;
          }
          v50 = [@"A000000704C0000000000002" hexStringAsData];
          id v51 = sub_100034168(v8, v50, [v22 number]);

          [v22 resetToEmpty];
          v34 = v55;
          if (!a5)
          {
            v32 = v54;
            goto LABEL_46;
          }
          v48 = SESDefaultLogObject();
          v49 = SESCreateAndLogError();
          v32 = v54;
        }
      }
      *a5 = v49;

      goto LABEL_46;
    }
    if (a5)
    {
      id v22 = SESDefaultLogObject();
      goto LABEL_8;
    }
  }
  else if (a5)
  {
    id v22 = SESDefaultLogObject();
LABEL_8:
    SESCreateAndLogError();
    id v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  id v23 = 0;
LABEL_16:

  return v23;
}

- (void)createSELegacyKey:(id)a3 subjectIdentifier:(id)a4 metaData:(id)a5 localValidationList:(id)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  id v17 = SESDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createSELegacyKey:subjectIdentifier:metaData:localValidationList:reply:]");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100007DE8;
  v23[3] = &unk_10040BB28;
  id v26 = v14;
  id v27 = v15;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  [(SESServer *)self legacyKeyServiceAvailable:v16 reason:v18 reply:v23];
}

- (void)deleteSELegacyKey:(id)a3 keySlot:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) deleteSELegacyKey:keySlot:reply:]");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000081EC;
  v15[3] = &unk_10040B9B0;
  id v17 = self;
  id v18 = v9;
  id v16 = v8;
  id v13 = v8;
  id v14 = v9;
  [(SESServer *)self legacyKeyServiceAvailable:v10 reason:v12 reply:v15];
}

- (void)signWithSELegacyKey:(id)a3 keySlot:(id)a4 challenge:(id)a5 metaData:(id)a6 authorization:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a3;
  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signWithSELegacyKey:keySlot:challenge:metaData:authorization:reply:]");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000086A8;
  v27[3] = &unk_10040BB28;
  id v31 = v17;
  id v32 = v18;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v18;
  [(SESServer *)self legacyKeyServiceAvailable:v19 reason:v21 reply:v27];
}

- (void)signPrecomputedWithSELegacyKey:(id)a3 keySlot:(id)a4 metaData:(id)a5 authorization:(id)a6 authorizationType:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a3;
  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signPrecomputedWithSELegacyKey:keySlot:metaData:authorization:authorizationType:reply:]");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100008950;
  v27[3] = &unk_10040BB28;
  id v31 = v17;
  id v32 = v18;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v18;
  [(SESServer *)self legacyKeyServiceAvailable:v19 reason:v21 reply:v27];
}

- (void)getSELegacyKeyOccupiedSlots:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) getSELegacyKeyOccupiedSlots:reply:]");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008B74;
  v11[3] = &unk_10040BB70;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(SESServer *)self legacyKeyServiceAvailable:v7 reason:v9 reply:v11];
}

- (void)createSEKey:(id)a3 extractedACLs:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createSEKey:extractedACLs:reply:]");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008D18;
  v14[3] = &unk_10040B9B0;
  id v16 = self;
  id v17 = v9;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [(SESServer *)self keyServiceAvailable:v10 reason:v11 reply:v14];
}

- (id)_createSynchronizableKey:(id)a3 extractedACLs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = SESDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_createSynchronizableKey", buf, 2u);
  }

  id v11 = +[SEKeySyncManager singleton];
  id v12 = [v11 ptcViewName];
  id v13 = [v11 getAvailableTLKForViewName:v12 secureElement:v8];

  if (v13)
  {
    *(void *)buf = 0;
    unsigned int v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = sub_100009360;
    id v47 = sub_100009370;
    id v48 = 0;
    id obj = 0;
    id v14 = [(SESServer *)self _createKey:v8 acl:v9 error:&obj];
    objc_storeStrong(&v48, obj);
    if (v14 && !*((void *)v44 + 5))
    {
      unsigned int v41 = 0;
      if (!ACMContextCreate((uint64_t *)&v41))
      {
        id v17 = v41;
        if (v41)
        {
          uint64_t v35 = 0;
          v36 = &v35;
          uint64_t v37 = 0x3032000000;
          uint64_t v38 = sub_100009360;
          int v39 = sub_100009370;
          id v40 = 0;
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100009378;
          v29[3] = &unk_10040BB98;
          v33 = &v35;
          id v28 = v8;
          id v30 = v28;
          id v18 = v14;
          id v31 = v18;
          id v32 = v13;
          v34 = buf;
          ACMContextGetExternalForm(v17, (uint64_t)v29);
          ACMContextDelete(v41, 1);
          unsigned int v41 = 0;
          id v19 = (void *)v36[5];
          if (v19 && !*((void *)v44 + 5))
          {
            id v15 = v19;
          }
          else
          {
            id v20 = SESDefaultLogObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v21 = [v18 slot];
              unsigned int v22 = [v21 number];
              uint64_t v23 = *((void *)v44 + 5);
              *(_DWORD *)v49 = 67109378;
              unsigned int v50 = v22;
              __int16 v51 = 2112;
              uint64_t v52 = v23;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to export key, deleting it from slot %d (%@)", v49, 0x12u);
            }
            id v24 = [@"A000000704C0000000000002" hexStringAsData];
            [(SESServer *)self _deleteLoadedKey:v28 instanceAID:v24 loadedKey:v18 error:0];

            if (a5)
            {
              id v25 = SESDefaultLogObject();
              SESCreateAndLogError();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v15 = 0;
          }

          _Block_object_dispose(&v35, 8);
          goto LABEL_25;
        }
      }
      if (a5)
      {
        id v26 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5)
    {
      SESEnsureError();
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }
    id v15 = 0;
    goto LABEL_25;
  }
  if (a5)
  {
    id v16 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = 0;
LABEL_26:

  return v15;
}

- (void)deleteSEKey:(id)a3 keyData:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) deleteSEKey:keyData:reply:]");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000958C;
  v14[3] = &unk_10040BBC0;
  void v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [(SESServer *)self keyOperation:v10 keyData:v9 reason:v12 reply:v14];
}

- (void)signWithSEKey:(id)a3 keyData:(id)a4 data:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v15 && v16 && v17 && v18)
  {
    id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signWithSEKey:keyData:data:algorithm:laExternalizedContext:reply:]");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100009844;
    v23[3] = &unk_10040BBE8;
    id v27 = v19;
    id v24 = v18;
    id v25 = v16;
    id v26 = v17;
    [(SESServer *)self keyOperation:v14 keyData:v15 reason:v20 reply:v23];
  }
  else
  {
    id v21 = SESDefaultLogObject();
    unsigned int v22 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v22);
  }
}

- (void)signPrecomputedDigest:(id)a3 keyData:(id)a4 digest:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v15 && v16 && v17 && v18)
  {
    id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signPrecomputedDigest:keyData:digest:algorithm:laExternalizedContext:reply:]");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100009BD4;
    v23[3] = &unk_10040BBE8;
    id v27 = v19;
    id v24 = v18;
    id v25 = v16;
    id v26 = v17;
    [(SESServer *)self keyOperation:v14 keyData:v15 reason:v20 reply:v23];
  }
  else
  {
    id v21 = SESDefaultLogObject();
    unsigned int v22 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v22);
  }
}

- (void)sharedSecretWithSEKey:(id)a3 keyData:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  if (v15 && v16 && v17 && v18)
  {
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) sharedSecretWithSEKey:keyData:publicKey:algorithm:laExternalizedContext:reply:]");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009FA4;
    v24[3] = &unk_10040BBE8;
    id v28 = v19;
    id v25 = v18;
    id v26 = v16;
    id v27 = v17;
    [(SESServer *)self keyOperation:v14 keyData:v15 reason:v21 reply:v24];

    unsigned int v22 = v28;
  }
  else
  {
    unsigned int v22 = SESDefaultLogObject();
    uint64_t v23 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v23);
  }
}

- (void)encryptWithSEKey:(id)a3 plainText:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 sharedInfo:(id)a8 authenticationData:(id)a9 reply:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = SESDefaultLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  if (v16 && v17 && v19 && v20)
  {
    id v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) encryptWithSEKey:plainText:publicKey:algorithm:laExternalizedContext:sharedInfo:authenticationData:reply:]");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000A3CC;
    v28[3] = &unk_10040BC10;
    id v35 = v23;
    id v29 = v20;
    id v30 = v17;
    id v31 = v18;
    id v32 = v21;
    id v33 = v19;
    id v34 = v22;
    [(SESServer *)self keyOperation:0 keyData:v16 reason:v25 reply:v28];

    id v26 = v35;
  }
  else
  {
    id v26 = SESDefaultLogObject();
    id v27 = SESCreateAndLogError();
    (*((void (**)(id, void, void, void *))v23 + 2))(v23, 0, 0, v27);
  }
}

- (void)decryptWithSEKey:(id)a3 cipherText:(id)a4 publicKey:(id)a5 algorithm:(id)a6 laExternalizedContext:(id)a7 sharedInfo:(id)a8 authenticationData:(id)a9 authenticationTag:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = SESDefaultLogObject();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v16 && v17 && v19 && v20)
  {
    id v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) decryptWithSEKey:cipherText:publicKey:algorithm:laExternalizedContext:sharedInfo:authenticationData:authenticationTag:reply:]");
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10000A88C;
    v38[3] = &unk_10040BC38;
    id v46 = v24;
    id v39 = v20;
    id v40 = v17;
    id v41 = v18;
    id v42 = v21;
    id v43 = v19;
    id v44 = v22;
    id v45 = v23;
    [(SESServer *)self keyOperation:0 keyData:v16 reason:v26 reply:v38];

    id v27 = v46;
  }
  else
  {
    id v27 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v37 = v19;
    id v28 = v20;
    id v29 = v17;
    id v30 = v16;
    id v31 = v23;
    id v32 = v22;
    id v33 = v21;
    id v35 = v34 = v18;
    (*((void (**)(id, void, void *))v24 + 2))(v24, 0, v35);

    id v18 = v34;
    id v21 = v33;
    id v22 = v32;
    id v23 = v31;
    id v16 = v30;
    id v17 = v29;
    id v20 = v28;
    id v19 = v37;
  }
}

- (void)rewrapWithSEKey:(id)a3 cipherText:(id)a4 publicKey:(id)a5 decryptAlgorithm:(id)a6 decryptSharedInfo:(id)a7 encryptAlgorithm:(id)a8 encryptSharedInfo:(id)a9 certificate:(id)a10 laExternalizedContext:(id)a11 decryptAuthenticationData:(id)a12 decryptAuthenticationTag:(id)a13 encryptAuthenticationData:(id)a14 reply:(id)a15
{
  id v49 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v48 = a7;
  id v23 = a8;
  id v47 = a9;
  id v24 = a10;
  id v25 = a11;
  id v45 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = SESDefaultLogObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "", buf, 2u);
  }
  id v46 = v27;

  id v43 = v25;
  id v44 = v22;
  id v42 = v20;
  if (v49 && (id v30 = v20) != 0 && v21 && v22 && v23 && v24 && v25)
  {
    id v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) rewrapWithSEKey:cipherText:publicKey:decryptAlgorithm:decryptSharedInfo:encryptAlgorithm:encryptSharedInfo:certificate:laExternalizedContext:decryptAuthenticationData:decryptAuthenticationTag:encryptAuthenticationData:reply:]");
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10000ADE8;
    v50[3] = &unk_10040BC60;
    id v31 = v28;
    id v62 = v28;
    id v51 = v25;
    id v52 = v30;
    id v53 = v21;
    id v32 = v22;
    id v33 = v24;
    id v34 = v48;
    id v54 = v48;
    id v55 = v45;
    id v56 = v26;
    id v57 = v32;
    id v35 = v45;
    v36 = v47;
    id v58 = v47;
    id v37 = v46;
    id v59 = v46;
    id v60 = v23;
    id v61 = v33;
    [(SESServer *)self keyOperation:0 keyData:v49 reason:v41 reply:v50];

    uint64_t v38 = v62;
  }
  else
  {
    uint64_t v38 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v39 = v33 = v24;
    id v31 = v28;
    (*((void (**)(id, void, void, void *))v28 + 2))(v28, 0, 0, v39);

    v36 = v47;
    id v34 = v48;
    id v35 = v45;
    id v37 = v46;
  }
}

- (void)createPTAttestation:(id)a3 keyData:(id)a4 subjectIdentifier:(id)a5 nonce:(id)a6 OIDs:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void, void *))a8;
  id v20 = +[NSXPCConnection currentConnection];
  id v21 = sub_10003929C((uint64_t)SESClientInfo, v20);

  if ((sub_1000394E4((uint64_t)v21) & 1) == 0)
  {
    id v24 = SESDefaultLogObject();
LABEL_9:
    id v25 = SESCreateAndLogError();
    v19[2](v19, 0, v25);

    goto LABEL_10;
  }
  id v22 = SESDefaultLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (!v15 || !v16)
  {
    id v24 = SESDefaultLogObject();
    goto LABEL_9;
  }
  id v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createPTAttestation:keyData:subjectIdentifier:nonce:OIDs:reply:]");
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000B27C;
  v26[3] = &unk_10040BBE8;
  id v30 = v19;
  id v27 = v18;
  id v28 = v16;
  id v29 = v17;
  [(SESServer *)self keyOperation:v14 keyData:v15 reason:v23 reply:v26];

LABEL_10:
}

- (void)getCASDCertificate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_1000394E4((uint64_t)v9))
  {
    id v10 = SESDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", buf, 2u);
    }

    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) getCASDCertificate:reply:]");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000B7C8;
    v14[3] = &unk_10040BC88;
    id v15 = v7;
    [(SESServer *)self keyServiceAvailable:v6 reason:v11 reply:v14];
  }
  else
  {
    id v12 = SESDefaultLogObject();
    id v13 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (void)createSEABAASCertificate:(id)a3 subjectIdentifier:(id)a4 nonce:(id)a5 OIDs:(id)a6 validityInterval:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v14)
  {
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createSEABAASCertificate:subjectIdentifier:nonce:OIDs:validityInterval:reply:]");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000BAF8;
    v24[3] = &unk_10040BCB0;
    id v29 = v19;
    void v24[4] = self;
    id v25 = v15;
    id v26 = v16;
    id v27 = v17;
    id v28 = v18;
    [(SESServer *)self keyOperation:0 keyData:v14 reason:v21 reply:v24];

    id v22 = v29;
  }
  else
  {
    id v22 = SESDefaultLogObject();
    id v23 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v23);
  }
}

- (id)_getBAACertificatesForKey:(id)a3 key:(id)a4 subjectIdentifier:(id)a5 nonce:(id)a6 OIDs:(id)a7 validityInterval:(id)a8 error:(id *)a9
{
  id v44 = a3;
  id v15 = a4;
  id v45 = a5;
  id v46 = a6;
  id v16 = a7;
  id v42 = a8;
  id v17 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v17);

  id v18 = SESDefaultLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v15 slot];
    unsigned int v20 = [v19 number];
    id v21 = [v15 key];
    *(_DWORD *)buf = 67109376;
    unsigned int v54 = v20;
    __int16 v55 = 1024;
    unsigned int v56 = [v21 keyNumber];
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Attest with slot %u key 0x%x", buf, 0xEu);
  }
  id v22 = +[NSMutableData data];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v23 = v16;
  id v24 = [v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([v28 isEqualToString:@"1.2.840.113635.100.6.65.16"])
        {
          uint64_t v29 = 16;
        }
        else if ([v28 isEqualToString:@"1.2.840.113635.100.6.65.17"])
        {
          uint64_t v29 = 17;
        }
        else
        {
          if (![v28 isEqualToString:@"1.2.840.113635.100.6.65.19"]) {
            continue;
          }
          uint64_t v29 = 19;
        }
        [v22 appendU8:v29];
      }
      id v25 = [v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v25);
  }

  id v30 = [@"A000000704C0000000000002" hexStringAsData];
  id v47 = 0;
  id v31 = v45;
  id v32 = v46;
  id v33 = sub_100036B38(v44, v30, v15, v45, v22, v46, &v47);
  id v34 = v47;

  id v43 = v15;
  if (!v33 || v34)
  {
    if (a9)
    {
      SESEnsureError();
      id v40 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v40 = 0;
    }
    id v39 = v42;
  }
  else
  {
    id v35 = +[SEABAAManager sharedManager];
    id v37 = sub_100056FD0(v44, v36);
    uint64_t v38 = [v37 casdCertificate];
    id v39 = v42;
    id v40 = [v35 PerformSEABAAWithAttestation:v33 casdCertificate:v38 nonce:v46 OIDs:v23 validityInterval:v42 error:a9];

    id v31 = v45;
    id v32 = v46;
  }

  return v40;
}

- (void)getSESKeySupportedFeatures:(id)a3
{
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) getSESKeySupportedFeatures:]");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C094;
  v8[3] = &unk_10040BC88;
  id v9 = v4;
  id v7 = v4;
  [(SESServer *)self keyServiceAvailable:0 reason:v6 reply:v8];
}

- (void)createCertificateForKeyData:(id)a3 withKeyData:(id)a4 subjectIdentifier:(id)a5 authorityIdentifier:(id)a6 laExternalizedContext:(id)a7 nonce:(id)a8 OIDs:(id)a9 reply:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = (void (**)(id, void, id))a10;
  id v24 = SESDefaultLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v16 && v17 && v18 && v19 && v20)
  {
    id v33 = self;
    id v34 = v21;
    id v45 = 0;
    id v25 = +[PTClassicKey withData:v16 error:&v45];
    id v26 = v45;
    id v27 = v26;
    if (!v25 || v26)
    {
      v23[2](v23, 0, v26);
    }
    else
    {
      id v44 = 0;
      id v28 = +[PTClassicKey withData:v17 error:&v44];
      id v29 = v44;
      id v27 = v29;
      if (!v28 || v29)
      {
        v23[2](v23, 0, v29);
        id v30 = v28;
        id v21 = v34;
      }
      else
      {
        id v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createCertificateForKeyData:withKeyData:subjectIdentifier:authorityIdentifier:laExternalizedContext:nonce:OIDs:reply:]");
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10000C544;
        v35[3] = &unk_10040BCD8;
        id v43 = v23;
        v35[4] = v33;
        id v36 = v25;
        id v37 = v28;
        id v38 = v22;
        id v39 = v20;
        id v40 = v18;
        id v41 = v19;
        id v31 = v28;
        id v21 = v34;
        id v42 = v34;
        [(SESServer *)v33 keyServiceAvailable:0 reason:v32 reply:v35];

        id v30 = v31;
      }
    }
  }
  else
  {
    id v27 = SESDefaultLogObject();
    id v25 = SESCreateAndLogError();
    v23[2](v23, 0, v25);
  }
}

- (void)updateACLForSEKey:(id)a3 extractedACLs:(id)a4 laExternalizedContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) updateACLForSEKey:extractedACLs:laExternalizedContext:reply:]");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000CA90;
    v17[3] = &unk_10040BD00;
    id v20 = v13;
    id v18 = v12;
    id v19 = v11;
    [(SESServer *)self keyOperation:0 keyData:v10 reason:v14 reply:v17];
  }
  else
  {
    id v15 = SESDefaultLogObject();
    id v16 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
  }
}

- (void)checkKeyValidity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) checkKeyValidity:completion:]");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000CEC0;
  v11[3] = &unk_10040BD28;
  id v13 = &v14;
  id v10 = v8;
  id v12 = v10;
  [(SESServer *)self keyOperation:0 keyData:v6 reason:v9 reply:v11];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v7[2](v7, *((unsigned __int8 *)v15 + 24));

  _Block_object_dispose(&v14, 8);
}

- (void)designateKey:(id)a3 designation:(id)a4 handoffToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412546;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "designateKey %@ %@", (uint8_t *)&v16, 0x16u);
  }

  id v15 = [v11 integerValue];
  if (v10) {
    [(SESServer *)self setDesignation:v10 designation:v15 handoffToken:v12 completion:v13];
  }
  else {
    [(SESServer *)self removeDesignation:v15 completion:v13];
  }
}

- (void)setDesignation:(id)a3 designation:(int64_t)a4 handoffToken:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D0CC;
  v11[3] = &unk_10040BD50;
  id v12 = a6;
  int64_t v13 = a4;
  id v10 = v12;
  [(SESServer *)self keyOperation:0 handoffToken:a5 keyData:a3 reason:@"designateKey" reply:v11];
}

- (void)removeDesignation:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (!a3)
  {
    dispatch_semaphore_t v8 = SESDefaultLogObject();
    id v10 = SESCreateAndLogError();
    v6[2](v6, v10);
LABEL_6:

    goto LABEL_7;
  }
  id v7 = +[NSXPCConnection currentConnection];
  dispatch_semaphore_t v8 = sub_10003929C((uint64_t)SESClientInfo, v7);

  if ((sub_1000394C4((uint64_t)v8) & 1) == 0)
  {
    id v10 = SESDefaultLogObject();
    id v11 = SESCreateAndLogError();
    v6[2](v6, v11);

    goto LABEL_6;
  }
  id v9 = [(SESServer *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D608;
  block[3] = &unk_10040BD78;
  int64_t v13 = v6;
  int64_t v14 = a3;
  void block[4] = self;
  dispatch_async(v9, block);

LABEL_7:
}

- (void)createFiDOKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingProxy:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = SESDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  __int16 v18 = +[SEFidoKeyManager singleton];
  id v19 = +[NSXPCConnection currentConnection];
  id v20 = sub_10003929C((uint64_t)SESClientInfo, v19);

  if ((sub_1000394F4((uint64_t)v20) & 1) != 0 && v12 && v13 && v14)
  {
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) createFiDOKeyForRelyingParty:relyingPartyAccountHash:challenge:usingProxy:callback:]");
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000DB2C;
    v25[3] = &unk_10040BDA0;
    id v26 = v18;
    id v31 = v16;
    id v27 = self;
    id v28 = v12;
    id v29 = v13;
    id v30 = v14;
    [(SESServer *)self keyServiceAvailable:v15 reason:v21 reply:v25];

    id v22 = v26;
  }
  else
  {
    id v23 = +[SEFidoEvents callerError];
    [v18 reportCAEvent:v23];

    id v22 = SESDefaultLogObject();
    id v24 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v24);
  }
}

- (id)_extractedACLForFidoKey
{
  return +[NSData dataWithBytes:&unk_100375FF8 length:41];
}

- (id)_aclForFidoAttestingKey
{
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleAfterFirstUnlock, 0, 0);
  SecAccessControlSetConstraints();

  return v2;
}

- (id)_createKey:(id)a3 acl:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(SESServer *)self getUsableKeySlot:@"A000000704C0000000000002"];
  if (v11)
  {
    id v12 = SESDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = [v11 number];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Creating key in slot %u", buf, 8u);
    }

    id v13 = [@"A000000704C0000000000002" hexStringAsData];
    id v30 = 0;
    id v14 = sub_100033680(v8, v13, (uint64_t)[v11 number], v9, &v30);
    id v15 = v30;

    if (!v14 || v15)
    {
      [v11 resetToEmpty];
      id v22 = [@"A000000704C0000000000002" hexStringAsData];
      id v23 = sub_100034168(v8, v22, [v11 number]);

      if (a5)
      {
        SESEnsureError();
        __int16 v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v18 = 0;
      }
    }
    else
    {
      id v29 = 0;
      id v16 = +[PTClassicKey withData:v14 error:&v29];
      id v17 = v29;
      id v15 = v17;
      if (!v16 || v17)
      {
        id v24 = SESDefaultLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          unsigned int v25 = [v11 number];
          *(_DWORD *)buf = 67109120;
          LODWORD(v32) = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to create key object, resetting and deleting slot %d", buf, 8u);
        }

        [v11 resetToEmpty];
        id v26 = [@"A000000704C0000000000002" hexStringAsData];
        id v27 = sub_100034168(v8, v26, [v11 number]);

        if (a5)
        {
          SESEnsureError();
          __int16 v18 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __int16 v18 = 0;
        }
      }
      else
      {
        [v11 didLoadKey:v16];
        __int16 v18 = +[LoadedKeySlot withKeySlot:v11 key:v16];
        id v19 = SESDefaultLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          unsigned int v20 = [v11 number];
          *(_DWORD *)buf = 138412546;
          id v32 = v16;
          __int16 v33 = 1024;
          unsigned int v34 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Created key %@ in slot %u", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    if (a5)
    {
      id v21 = SESDefaultLogObject();
      SESCreateAndLogError();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    __int16 v18 = 0;
  }

  return v18;
}

- (BOOL)_deleteLoadedKey:(id)a3 instanceAID:(id)a4 loadedKey:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v13);

  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v10 key];
    id v16 = [v10 slot];
    int v24 = 138412546;
    unsigned int v25 = v15;
    __int16 v26 = 1024;
    unsigned int v27 = [v16 number];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Deleting key %@ in slot %d", (uint8_t *)&v24, 0x12u);
  }
  id v17 = [v10 slot];
  __int16 v18 = sub_100034168(v12, v11, [v17 number]);

  id v19 = [v10 slot];
  [v19 resetToEmpty];

  unsigned int v20 = +[SESKeyDesignationStorageCoordinator getAndReturnError:0];
  id v21 = [v10 key];
  id v22 = [v21 keyIdentifier];
  [v20 removeDesignationWithKeyIdentifier:v22];

  if (a6) {
    *a6 = v18;
  }

  return v18 == 0;
}

- (void)checkMultipleFidoKeyPresence:(id)a3 usingProxy:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v12 = +[SEFidoKeyManager singleton];
  id v13 = +[NSXPCConnection currentConnection];
  id v14 = sub_10003929C((uint64_t)SESClientInfo, v13);

  if ((sub_1000394F4((uint64_t)v14) & 1) != 0 && v8)
  {
    id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) checkMultipleFidoKeyPresence:usingProxy:callback:]");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000EE6C;
    v19[3] = &unk_10040BDC8;
    id v20 = v12;
    id v22 = v10;
    id v21 = v8;
    [(SESServer *)self keyServiceAvailable:v9 reason:v15 reply:v19];

    id v16 = v20;
  }
  else
  {
    id v17 = +[SEFidoEvents callerError];
    [v12 reportCAEvent:v17];

    id v16 = SESDefaultLogObject();
    __int16 v18 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }
}

- (void)signMultipleWithFidoKeysFor:(id)a3 challenges:(id)a4 forEndpointIdentifiers:(id)a5 externalizedAuth:(id)a6 usingProxy:(id)a7 callback:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v21 = +[SEFidoKeyManager singleton];
  id v22 = +[NSXPCConnection currentConnection];
  id v23 = sub_10003929C((uint64_t)SESClientInfo, v22);

  if ((sub_1000394F4((uint64_t)v23) & 1) != 0
    && v14
    && v15
    && v17
    && (id v24 = [v14 count], v24 == objc_msgSend(v15, "count"))
    && (!v16 || (id v25 = [v15 count], v25 == objc_msgSend(v16, "count"))))
  {
    __int16 v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:externalizedAuth:usingProxy:callback:]");
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000F518;
    v30[3] = &unk_10040BDF0;
    id v31 = v21;
    id v37 = v19;
    id v32 = v14;
    id v33 = v15;
    unsigned int v34 = self;
    id v35 = v16;
    id v36 = v17;
    [(SESServer *)self keyServiceAvailable:v18 reason:v26 reply:v30];

    unsigned int v27 = v31;
  }
  else
  {
    id v28 = +[SEFidoEvents callerError];
    [v21 reportCAEvent:v28];

    unsigned int v27 = SESDefaultLogObject();
    id v29 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v29);
  }
}

- (void)verifyWithFidoKeyFor:(id)a3 signedChallenge:(id)a4 usingProxy:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v15 = +[SEFidoKeyManager singleton];
  id v16 = +[NSXPCConnection currentConnection];
  id v17 = sub_10003929C((uint64_t)SESClientInfo, v16);

  if ((sub_1000394F4((uint64_t)v17) & 1) != 0 && v10 && v11)
  {
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:]");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000FDF8;
    v22[3] = &unk_10040BE18;
    id v23 = v15;
    id v26 = v13;
    id v24 = v10;
    id v25 = v11;
    [(SESServer *)self keyServiceAvailable:v12 reason:v18 reply:v22];

    id v19 = v23;
  }
  else
  {
    id v20 = +[SEFidoEvents callerError];
    [v15 reportCAEvent:v20];

    id v19 = SESDefaultLogObject();
    id v21 = SESCreateAndLogError();
    (*((void (**)(id, _UNKNOWN **, void *))v13 + 2))(v13, &off_10042DD20, v21);
  }
}

- (void)deleteFiDOKeyFor:(id)a3 usingProxy:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

  if ((sub_1000394F4((uint64_t)v13) & 1) != 0 && v8)
  {
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEKeyXPC) deleteFiDOKeyFor:usingProxy:callback:]");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000103F8;
    v17[3] = &unk_10040BB70;
    id v19 = v10;
    id v18 = v8;
    [(SESServer *)self keyServiceAvailable:v9 reason:v14 reply:v17];

    id v15 = v19;
  }
  else
  {
    id v15 = SESDefaultLogObject();
    id v16 = SESCreateAndLogError();
    (*((void (**)(id, void *))v10 + 2))(v10, v16);
  }
}

- (void)createPrivacyKeyForGroupIdentifier:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if ((sub_100039504((uint64_t)v10) & 1) != 0 && v13)
  {
    +[SESPrivacyKeyImplementation createPrivacyKeyWithGroupIdentifier:v13 options:v7 completion:v8];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    v8[2](v8, 0, v12);
  }
}

- (void)privacyKeysForGroupIdentifier:(id)a3 keyIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if ((sub_100039504((uint64_t)v10) & 1) != 0 && v13)
  {
    +[SESPrivacyKeyImplementation getPrivacyKeyWithGroupIdentifier:v13 keyIdentifier:v7 completion:v8];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    v8[2](v8, 0, v12);
  }
}

- (void)deletePrivacyKey:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v5 = (void (**)(id, void *))a4;
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = sub_10003929C((uint64_t)SESClientInfo, v6);

  if ((sub_100039504((uint64_t)v7) & 1) != 0 && v10)
  {
    +[SESPrivacyKeyImplementation deletePrivacyKey:v10 completion:v5];
  }
  else
  {
    id v8 = SESDefaultLogObject();
    id v9 = SESCreateAndLogError();
    v5[2](v5, v9);
  }
}

- (void)decryptPayload:(id)a3 withGroupIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if ((sub_100039504((uint64_t)v10) & 1) != 0 && v13 && v7)
  {
    +[SESPrivacyKeyImplementation decryptPayload:groupIdentifier:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "decryptPayload:groupIdentifier:completion:");
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    v8[2](v8, 0, v12);
  }
}

- (void)encryptPayload:(id)a3 encryptionScheme:(id)a4 recipientPublicKey:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

  if ((sub_100039504((uint64_t)v13) & 1) != 0 && v16 && v9 && v10)
  {
    +[SESPrivacyKeyImplementation encryptPayload:scheme:recipientPublicKey:completion:](_TtC10seserviced27SESPrivacyKeyImplementation, "encryptPayload:scheme:recipientPublicKey:completion:");
  }
  else
  {
    id v14 = SESDefaultLogObject();
    id v15 = SESCreateAndLogError();
    v11[2](v11, 0, v15);
  }
}

- (void)endPointServiceAvailableWithProxy:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  if (v8)
  {
    id v12 = sub_1000535D8((uint64_t)SEProxyAdapter, v8);
  }
  else
  {
    id v12 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001BA34;
  v14[3] = &unk_10040B938;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  sub_10005812C((uint64_t)SecureElementManager, v12, 0, v9, v14);
}

- (void)endPointServiceAvailable:(id)a3 reply:(id)a4
{
}

- (void)databaseService:(id)a3 reply:(id)a4
{
}

- (void)databaseServiceWithProxy:(id)a3 isReconcileRequired:(BOOL)a4 reason:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(SESServer *)self messageQueue];
  if (a4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BE7C;
    v17[3] = &unk_10040B910;
    id v14 = &v20;
    void v17[4] = self;
    id v20 = v12;
    id v18 = v10;
    id v19 = v11;
    id v15 = v12;
    dispatch_async(v13, v17);

    id v13 = v18;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BDB0;
    block[3] = &unk_10040BE80;
    id v14 = &v22;
    void block[4] = self;
    id v22 = v12;
    id v16 = v12;
    dispatch_async(v13, block);
  }
}

- (void)secureElementService:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C118;
  v10[3] = &unk_10040B938;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  sub_100058540((uint64_t)SecureElementManager, v7, v10);
}

- (void)endPointAction:(id)a3 clientInfo:(id)a4 reason:(id)a5 reply:(id)a6
{
}

- (void)endPointAction:(id)a3 proxy:(id)a4 clientInfo:(id)a5 reason:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (sub_100039494((uint64_t)v14) & 1) != 0 || (sub_1000394B4((uint64_t)v14))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001C47C;
    v19[3] = &unk_10040C588;
    id v22 = v16;
    void v19[4] = self;
    id v20 = v12;
    id v21 = v14;
    [(SESServer *)self endPointServiceAvailableWithProxy:v13 reason:v15 reply:v19];
  }
  else
  {
    id v17 = SESDefaultLogObject();
    id v18 = SESCreateAndLogError();
    (*((void (**)(id, void, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, 0, v18);
  }
}

- (void)endPointDBAction:(id)a3 clientInfo:(id)a4 reason:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (sub_100039494((uint64_t)v11) & 1) != 0 || (sub_1000394B4((uint64_t)v11))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001C6F4;
    v16[3] = &unk_10040C5B0;
    id v19 = v13;
    v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v12 reply:v16];
  }
  else
  {
    id v14 = SESDefaultLogObject();
    id v15 = SESCreateAndLogError();
    (*((void (**)(id, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, v15);
  }
}

- (id)_getEndPointAndValidateAccess:(id)a3 identifier:(id)a4 clientInfo:(id)a5 outEndPointEntity:(id *)a6 outEndPoint:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v15);

  id v32 = 0;
  id v16 = sub_1000404C0((uint64_t)v12, &v32);
  id v17 = v32;
  if (v17)
  {
    id v18 = v17;
    id v19 = v18;
  }
  else
  {
    v28[1] = _NSConcreteStackBlock;
    v28[2] = (id)3221225472;
    v28[3] = sub_10001CA14;
    void v28[4] = &unk_10040C5D8;
    id v20 = v12;
    id v29 = v20;
    id v30 = v13;
    id v21 = v14;
    id v31 = v21;
    id v22 = Find();
    if (v22)
    {
      v28[0] = 0;
      sub_100040964((uint64_t)v20, v22, v28);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = v28[0];
      id v18 = v24;
      if (v24 || !v23)
      {
        id v18 = v24;
        id v19 = v18;
      }
      else
      {
        id v23 = v23;
        *a7 = v23;
        id v19 = 0;
        *a6 = v22;
      }
    }
    else
    {
      SESDefaultLogObject();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v27 = sub_100039480(v21, v25);
      id v19 = SESCreateAndLogError();

      id v18 = 0;
    }
  }

  return v19;
}

- (void)preWarm:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if (sub_100039494((uint64_t)v10) & 1) != 0 || (sub_1000394B4((uint64_t)v10))
  {
    id v11 = [(SESServer *)self messageQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001CD7C;
    v14[3] = &unk_10040C648;
    void v14[4] = self;
    id v17 = v7;
    id v15 = v6;
    id v16 = v10;
    +[SESProximityChip cacheProximityChipData:v11 completion:v14];
  }
  else
  {
    id v12 = SESDefaultLogObject();
    id v13 = SESCreateAndLogError();
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

- (void)preWarmWithReply:(id)a3
{
}

- (void)listEndPointCAs:(id)a3
{
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "", buf, 2u);
  }

  id v6 = +[NSXPCConnection currentConnection];
  id v7 = sub_10003929C((uint64_t)SESClientInfo, v6);

  if (sub_1000394A4((uint64_t)v7) & 1) != 0 || (sub_1000394B4((uint64_t)v7))
  {
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointCAs:]");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001D320;
    v11[3] = &unk_10040C6C0;
    id v13 = v4;
    id v12 = v7;
    [(SESServer *)self databaseService:v8 reply:v11];

    id v9 = v13;
  }
  else
  {
    id v9 = SESDefaultLogObject();
    id v10 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

- (id)_createEndPointCA:(id)a3 database:(id)a4 clientName:(id)a5 identifier:(id)a6 subjectIdentifier:(id)a7 forEndPointType:(int64_t)a8 error:(id *)a9
{
  id v43 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v19);

  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "identifier %@ subjectIdentifier %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v72 = sub_10001DC34;
  v73 = sub_10001DC44;
  id v74 = 0;
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x3032000000;
  long long v66 = sub_10001DC34;
  long long v67 = sub_10001DC44;
  id v68 = 0;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = sub_10001DC34;
  id v61 = sub_10001DC44;
  id obj = 0;
  id v21 = sub_100046478((uint64_t)v15, v17, v16, &obj);
  objc_storeStrong(&v74, obj);
  id v62 = v21;
  id v22 = *(void **)(*(void *)&buf[8] + 40);
  if (v22)
  {
    if (a9)
    {
      id v23 = 0;
      *a9 = v22;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v58[5])
  {
    if (a9) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if ((unint64_t)[v18 length] >= 0x1F)
  {
    if (a9)
    {
LABEL_11:
      id v24 = SESDefaultLogObject();
      SESCreateAndLogError();
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_12:
    id v23 = 0;
    goto LABEL_13;
  }
  uint64_t v26 = *(void *)&buf[8];
  id v55 = *(id *)(*(void *)&buf[8] + 40);
  unsigned int v27 = sub_100046C00(v43, a8, &v55);
  objc_storeStrong((id *)(v26 + 40), v55);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    id v42 = v27;
    id v29 = [(SESServer *)self database];
    uint64_t v30 = *(void *)&buf[8];
    id v54 = *(id *)(*(void *)&buf[8] + 40);
    id v28 = sub_10005D7F8((uint64_t)v29, v42, &v54);
    objc_storeStrong((id *)(v30 + 40), v54);
    unsigned int v27 = v42;

    if (*(void *)(*(void *)&buf[8] + 40) || !v28)
    {
      if (!a9)
      {
        id v23 = 0;
        goto LABEL_37;
      }
      id v38 = SESDefaultLogObject();
      SESCreateAndLogError();
      unsigned int v27 = v42;
      id v23 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10001DC4C;
      v44[3] = &unk_10040C6E8;
      long long v50 = &v57;
      id v45 = v17;
      id v31 = v28;
      id v46 = v31;
      id v47 = v16;
      long long v51 = buf;
      id v52 = &v63;
      id v40 = v43;
      id v48 = v40;
      id v39 = v18;
      id v49 = v39;
      int64_t v53 = a8;
      sub_10001A33C((uint64_t)v15, v44);
      unsigned int v27 = v42;
      if (*(void *)(*(void *)&buf[8] + 40) && v64[5])
      {
        id v32 = SESDefaultLogObject();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "CA creation failed and requires cleanup ...", v69, 2u);
        }

        id v33 = [v31 identifier];
        unsigned int v34 = [v33 hexStringAsData];
        id v41 = sub_1000493BC(v40, v34, v39);

        if (v41)
        {
          id v35 = SESDefaultLogObject();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long v69 = 138412290;
            id v70 = v41;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to clean up EPCA : %@", v69, 0xCu);
          }
        }
        id v36 = (void *)v64[5];
        v64[5] = 0;

        id v37 = (void *)v58[5];
        v58[5] = 0;
      }
      if (a9) {
        *a9 = *(id *)(*(void *)&buf[8] + 40);
      }
      id v23 = (id)v58[5];

      id v38 = v45;
    }

LABEL_37:
    goto LABEL_38;
  }
  if (a9)
  {
    id v28 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v23 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  id v23 = 0;
LABEL_38:

LABEL_13:
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(buf, 8);

  return v23;
}

- (void)createEndPointCA:(id)a3 subjectIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

  if sub_100039494((uint64_t)v13) && (sub_1000394A4((uint64_t)v13))
  {
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createEndPointCA:subjectIdentifier:reply:]");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001E2F4;
    v17[3] = &unk_10040C620;
    id v21 = v10;
    void v17[4] = self;
    id v18 = v13;
    id v19 = v8;
    id v20 = v9;
    [(SESServer *)self endPointServiceAvailable:v14 reply:v17];

    id v15 = v21;
  }
  else
  {
    id v15 = SESDefaultLogObject();
    id v16 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

- (void)deleteEndPointCA:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if (sub_100039494((uint64_t)v10) && (sub_1000394A4((uint64_t)v10) & 1) != 0
    || (sub_1000394B4((uint64_t)v10) & 1) != 0)
  {
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndPointCA:reply:]");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001E66C;
    v14[3] = &unk_10040C760;
    id v17 = v7;
    id v15 = v6;
    id v16 = v10;
    [(SESServer *)self endPointServiceAvailable:v11 reply:v14];

    id v12 = v17;
  }
  else
  {
    id v12 = SESDefaultLogObject();
    id v13 = SESCreateAndLogError();
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

- (void)listEndPointsWithProxy:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_100039494((uint64_t)v9) & 1) != 0 || (sub_1000394B4((uint64_t)v9))
  {
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointsWithProxy:reply:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001EC94;
    v13[3] = &unk_10040C6C0;
    id v15 = v7;
    id v14 = v9;
    [(SESServer *)self databaseServiceWithProxy:v6 isReconcileRequired:1 reason:v10 reply:v13];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)cleanupAppletsWithNoEndpoints:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_100039494((uint64_t)v9) & 1) != 0 || (sub_1000394B4((uint64_t)v9))
  {
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) cleanupAppletsWithNoEndpoints:reply:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001F118;
    v13[3] = &unk_10040C538;
    id v14 = v7;
    [(SESServer *)self endPointServiceAvailableWithProxy:v6 reason:v10 reply:v13];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (id)_renewEndPointCAIfExpired:(id)a3 secureElement:(id)a4 forEndPointType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(SESServer *)self database];
  id v40 = 0;
  unsigned int v12 = sub_100046978((uint64_t)v11, v8, &v40);
  id v13 = v40;

  if (v13 || v12)
  {
    id v17 = v13;
    id v18 = v17;
    goto LABEL_21;
  }
  id v14 = [(SESServer *)self database];
  id v39 = 0;
  id v15 = sub_10004663C((uint64_t)v14, v8, &v39);
  id v16 = v39;

  if (!v16)
  {
    id v19 = SESDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      id v45 = v20;
      __int16 v46 = 1024;
      int v47 = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Renewing expired SEEndPointCA %@ with type %d", buf, 0x12u);
    }
    id v21 = +[SEABAAManager sharedManager];
    id v37 = v15;
    id v22 = [v15 secureElementAttestation];
    id v24 = sub_100056FD0(v9, v23);
    id v25 = [v24 casdCertificate];
    id v38 = 0;
    uint64_t v26 = [v21 PerformSEABAAWithAttestation:v22 casdCertificate:v25 nonce:0 OIDs:0 validityInterval:0 error:&v38];
    id v17 = v38;

    if (v17)
    {
      id v18 = v17;
      unsigned int v27 = (void *)v26;
LABEL_10:
      id v15 = v37;
LABEL_19:

      goto LABEL_20;
    }
    if (a5 == 5 || a5 == 2)
    {
      unsigned int v27 = (void *)v26;
      uint64_t v30 = sub_100014F14(v26);
      v41[0] = v30;
      id v31 = sub_100014F20(v26);
      v41[1] = v31;
      id v32 = +[NSArray arrayWithObjects:v41 count:2];
      id v15 = v37;
      [v37 setCertificates:v32];
    }
    else
    {
      unsigned int v27 = (void *)v26;
      if (a5 != 1)
      {
        id v35 = SESDefaultLogObject();
        SESCreateAndLogError();
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      id v15 = v37;
      id v28 = [v37 certificates];
      id v29 = [v28 count];

      if (v29 == (id)1)
      {
        uint64_t v30 = sub_100014F20((uint64_t)v27);
        id v43 = v30;
        id v31 = +[NSArray arrayWithObjects:&v43 count:1];
        [v37 setCertificates:v31];
LABEL_18:

        id v33 = [(SESServer *)self database];
        sub_100046714(v33, v8, v15);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      uint64_t v30 = [v37 certificates];
      id v31 = [v30 objectAtIndexedSubscript:0];
      v42[0] = v31;
      id v32 = sub_100014F20((uint64_t)v27);
      v42[1] = v32;
      id v36 = +[NSArray arrayWithObjects:v42 count:2];
      [v37 setCertificates:v36];
    }
    goto LABEL_18;
  }
  id v17 = v16;
  id v18 = v17;
LABEL_20:

LABEL_21:

  return v18;
}

- (void)createAlishaEndpointWithProxy:(id)a3 identifier:(id)a4 authorityIdentifier:(id)a5 subjectIdentifier:(id)a6 configuration:(id)a7 readerIdentifier:(id)a8 readerPublicKey:(id)a9 readerInformation:(id)a10 startDate:(id)a11 endDate:(id)a12 keyIdentifier:(id)a13 authorizedKeys:(id)a14 confidentialMailBoxSize:(id)a15 privateMailBoxSize:(id)a16 reply:(id)a17
{
  id v40 = a3;
  id v22 = a4;
  id v49 = a5;
  id v48 = a6;
  id v47 = a7;
  id v23 = a8;
  id v24 = v22;
  id v46 = a9;
  id v25 = a10;
  id v26 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  unsigned int v27 = (void (**)(id, void, id))a17;
  id v28 = SESDefaultLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v68 = v22;
    __int16 v69 = 2112;
    id v70 = v49;
    __int16 v71 = 2112;
    id v72 = v48;
    __int16 v73 = 2112;
    id v74 = v23;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "identifier %@ __authorityIdentifier %@ subjectIdentifier %@ readerIdentifier %@", buf, 0x2Au);
  }

  id v29 = +[NSXPCConnection currentConnection];
  uint64_t v30 = sub_10003929C((uint64_t)SESClientInfo, v29);

  if ((!sub_100039494((uint64_t)v30) || (sub_1000394A4((uint64_t)v30) & 1) == 0)
    && (sub_1000394B4((uint64_t)v30) & 1) == 0)
  {
    id v31 = SESDefaultLogObject();
LABEL_11:
    SESCreateAndLogError();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v27[2](v27, 0, v32);
    goto LABEL_17;
  }
  if ([v23 length] != (id)8)
  {
    id v31 = SESDefaultLogObject();
    [v23 length];
    goto LABEL_11;
  }
  id v31 = [v25 componentsSeparatedByString:@"."];
  id v37 = v26;
  if ((unint64_t)[v31 count] > 2)
  {
    id v32 = [v31 objectAtIndexedSubscript:2];
    if ([v32 length] == (id)3)
    {
      unsigned int v34 = [v32 substringWithRange:2, 1];
      id v36 = [v32 substringToIndex:2];

      id v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createAlishaEndpointWithProxy:identifier:authorityIdentifier:subjectIdentifier:configuration:readerIdentifier:readerPublicKey:readerInformation:startDate:endDate:keyIdentifier:authorizedKeys:confidentialMailBoxSize:privateMailBoxSize:reply:]");
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10001FDCC;
      v50[3] = &unk_10040C800;
      long long v66 = v27;
      void v50[4] = self;
      id v51 = v24;
      id v52 = v23;
      id v53 = v49;
      id v54 = v30;
      id v55 = v34;
      id v32 = v36;
      id v56 = v32;
      id v57 = v48;
      id v58 = v47;
      id v59 = v46;
      id v60 = v37;
      id v61 = v45;
      id v62 = v44;
      id v63 = v43;
      id v64 = v42;
      id v65 = v41;
      id v33 = v34;
      [(SESServer *)self endPointServiceAvailableWithProxy:v40 reason:v39 reply:v50];

      id v35 = v66;
    }
    else
    {
      SESDefaultLogObject();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      id v35 = SESCreateAndLogError();
      v27[2](v27, 0, v35);
    }
  }
  else
  {
    SESDefaultLogObject();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    v27[2](v27, 0, v33);
  }

  id v26 = v37;
LABEL_17:
}

- (void)createHydraEndpointWithProxy:(id)a3 serverParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = +[NSXPCConnection currentConnection];
  unsigned int v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if (sub_100039494((uint64_t)v12) && (sub_1000394A4((uint64_t)v12) & 1) != 0
    || (sub_1000394B4((uint64_t)v12) & 1) != 0)
  {
    id v48 = self;
    long long v50 = v8;
    id v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v70 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    id v14 = [v9 objectForKeyedSubscript:@"readerIdentifier"];
    id v15 = [v14 hexStringAsData];

    id v16 = [v9 objectForKeyedSubscript:@"readerCAPublicKey"];
    id v17 = [v16 hexStringAsData];

    id v18 = [v9 objectForKeyedSubscript:@"readerCAMaxDepth"];
    id v19 = [v9 objectForKeyedSubscript:@"mailboxInfo"];
    id v20 = [v19 objectForKeyedSubscript:@"confMailboxSize"];
    unsigned int v46 = [v20 unsignedIntValue];

    id v21 = [v19 objectForKeyedSubscript:@"confMailboxOffset"];
    unsigned int v45 = [v21 unsignedIntValue];

    id v22 = [v19 objectForKeyedSubscript:@"confMailboxLength"];
    unsigned int v44 = [v22 unsignedIntValue];

    id v23 = [v19 objectForKeyedSubscript:@"privMailboxSize"];
    unsigned int v43 = [v23 unsignedIntValue];

    id v24 = [v19 objectForKeyedSubscript:@"privMailboxOffset"];
    unsigned int v25 = [v24 unsignedIntValue];

    id v26 = [v19 objectForKeyedSubscript:@"privMailboxLength"];
    unsigned int v27 = [v26 unsignedIntValue];

    if (!v15 || !v17)
    {
      id v31 = SESDefaultLogObject();
      id v32 = [v9 allKeys];
      id v33 = SESCreateAndLogError();
      v10[2](v10, 0, v33);

LABEL_23:
      id v8 = v50;
      goto LABEL_24;
    }
    if (!v18) {
      id v18 = &off_10042DD38;
    }
    if ([v15 length] == (id)8)
    {
      if ([v17 length] == (id)64)
      {
        id v28 = +[NSMutableData dataWithCapacity:65];
        [v28 appendU8:4];
        [v28 appendData:v17];

        id v17 = v28;
      }
      else if ([v17 length] != (id)65)
      {
        id v31 = SESDefaultLogObject();
        [v17 length];
        goto LABEL_22;
      }
      if (![v18 unsignedIntValue]
        || [v18 unsignedIntValue] == 1)
      {
        +[NSData randomData:4];
        v34 = unsigned int v41 = v25;
        id v31 = [v34 asHexString];

        [v15 asHexString];
        v35 = unsigned int v40 = v27;
        id v38 = +[NSString stringWithFormat:@"HY-%@-%@", v35, v31];

        id v36 = [v15 asHexString];
        id v42 = +[NSString stringWithFormat:@"HYCA-%@-%@", v36, v31];

        id v37 = +[SEEndPointConfiguration hydraDefaults];
        id v39 = [(SESServer *)v48 messageQueue];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1000216F4;
        v51[3] = &unk_10040C878;
        v51[4] = v48;
        id v52 = v50;
        id v62 = v10;
        id v53 = v42;
        id v54 = v12;
        id v55 = v38;
        id v56 = v37;
        id v57 = v15;
        id v17 = v17;
        id v58 = v17;
        id v59 = @"20000101000000Z";
        id v60 = @"99991231235959Z";
        unsigned int v63 = v46;
        unsigned int v64 = v43;
        id v18 = v18;
        id v61 = v18;
        unsigned int v65 = v40;
        unsigned int v66 = v41;
        unsigned int v67 = v44;
        unsigned int v68 = v45;
        id v49 = v37;
        id v47 = v38;
        id v32 = v42;
        +[SESProximityChip cacheProximityChipData:v39 completion:v51];

        goto LABEL_23;
      }
      id v31 = SESDefaultLogObject();
      [v18 unsignedIntValue];
    }
    else
    {
      id v31 = SESDefaultLogObject();
      [v15 length];
    }
LABEL_22:
    SESCreateAndLogError();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v32);
    goto LABEL_23;
  }
  id v29 = SESDefaultLogObject();
  uint64_t v30 = SESCreateAndLogError();
  v10[2](v10, 0, v30);

LABEL_24:
}

- (void)createLocalEndpointWithProxy:(id)a3 readerIdentifier:(id)a4 readerPublicKey:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = +[NSXPCConnection currentConnection];
  id v15 = sub_10003929C((uint64_t)SESClientInfo, v14);

  if ((!sub_100039494((uint64_t)v15) || (sub_1000394A4((uint64_t)v15) & 1) == 0)
    && (sub_1000394B4((uint64_t)v15) & 1) == 0)
  {
    id v23 = SESDefaultLogObject();
LABEL_8:
    id v24 = SESCreateAndLogError();
    v13[2](v13, 0, v24);

    goto LABEL_9;
  }
  if ([v11 length] != (id)8)
  {
    id v23 = SESDefaultLogObject();
    [v11 length];
    goto LABEL_8;
  }
  id v16 = +[NSData randomData:4];
  id v17 = [v16 asHexString];
  id v18 = +[NSString stringWithFormat:@"HOME-%@", v17];

  id v19 = +[SEEndPointConfiguration homeDefaults];
  id v20 = [(SESServer *)self messageQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000227F8;
  v25[3] = &unk_10040C8F0;
  void v25[4] = self;
  id v26 = v10;
  id v35 = v13;
  unsigned int v27 = @"HOME";
  id v28 = v15;
  id v29 = v18;
  id v30 = v19;
  id v31 = v11;
  id v32 = v12;
  id v33 = @"20000101000000Z";
  unsigned int v34 = @"99991231235959Z";
  id v21 = v19;
  id v22 = v18;
  +[SESProximityChip cacheProximityChipData:v20 completion:v25];

LABEL_9:
}

- (void)createLyonEndpointWithProxy:(id)a3 readerGroupIdentifier:(id)a4 readerPublicKey:(id)a5 homeUUID:(id)a6 privateMailboxSize:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void, void *))a8;
  id v20 = +[NSXPCConnection currentConnection];
  id v21 = sub_10003929C((uint64_t)SESClientInfo, v20);

  if ((!sub_100039494((uint64_t)v21) || (sub_1000394A4((uint64_t)v21) & 1) == 0)
    && (sub_1000394B4((uint64_t)v21) & 1) == 0)
  {
    id v31 = SESDefaultLogObject();
LABEL_8:
    id v32 = SESCreateAndLogError();
    v19[2](v19, 0, v32);

    goto LABEL_9;
  }
  if ([v15 length] != (id)16)
  {
    id v31 = SESDefaultLogObject();
    [v15 length];
    goto LABEL_8;
  }
  id v22 = +[NSData randomData:4];
  [v22 asHexString];
  id v33 = v18;
  id v23 = v17;
  v25 = id v24 = v16;
  +[NSString stringWithFormat:@"LYON-%@", v25];
  id v26 = v34 = v14;

  unsigned int v27 = +[SEEndPointConfiguration lyonHomeDefaults];
  id v28 = [(SESServer *)self messageQueue];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100023638;
  v35[3] = &unk_10040C988;
  v35[4] = self;
  id v36 = v34;
  id v47 = v19;
  id v37 = @"LYON";
  id v38 = v21;
  id v39 = v26;
  id v40 = v27;
  id v41 = v15;
  id v42 = v24;
  unsigned int v43 = @"20000101000000Z";
  unsigned int v44 = @"99991231235959Z";
  id v45 = v33;
  id v46 = v23;
  id v29 = v27;
  id v30 = v26;
  id v16 = v24;
  id v17 = v23;
  id v18 = v33;
  +[SESProximityChip cacheProximityChipData:v28 completion:v35];

  id v14 = v34;
LABEL_9:
}

- (void)createLyonHydraEndpointWithProxy:(id)a3 serverParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if (sub_100039494((uint64_t)v12) && (sub_1000394A4((uint64_t)v12) & 1) != 0
    || (sub_1000394B4((uint64_t)v12) & 1) != 0)
  {
    id v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    id v14 = [v9 objectForKeyedSubscript:@"readerGroupIdentifier"];
    id v15 = [v14 hexStringAsData];

    id v16 = [v9 objectForKeyedSubscript:@"readerGroupPublicKey"];
    id v17 = [v16 hexStringAsData];

    id v18 = [v9 objectForKeyedSubscript:@"readerCAMaxDepth"];
    id v19 = [v9 objectForKeyedSubscript:@"privMailboxSize"];
    unsigned int v38 = [v19 unsignedIntValue];

    id v20 = [v9 objectForKeyedSubscript:@"privMailboxOffset"];
    unsigned int v36 = [v20 unsignedIntValue];

    id v21 = [v9 objectForKeyedSubscript:@"privMailboxLength"];
    unsigned int v22 = [v21 unsignedIntValue];

    id v40 = v8;
    if (v15 && v17 && v18)
    {
      if ([v15 length] != (id)16)
      {
        id v26 = SESDefaultLogObject();
        [v15 length];
LABEL_21:
        unsigned int v27 = SESCreateAndLogError();
        v10[2](v10, 0, v27);
        goto LABEL_22;
      }
      if ([v17 length] == (id)64)
      {
        id v23 = +[NSMutableData dataWithCapacity:65];
        [v23 appendU8:4];
        [v23 appendData:v17];

        id v17 = v23;
      }
      else if ([v17 length] != (id)65)
      {
        id v26 = SESDefaultLogObject();
        [v17 length];
        goto LABEL_21;
      }
      if ([v18 unsignedIntValue] >= 2)
      {
        id v26 = SESDefaultLogObject();
        [v18 unsignedIntValue];
        goto LABEL_21;
      }
      id v29 = +[NSData randomData:4];
      id v26 = [v29 asHexString];

      [v15 subdataWithRange:0, 8];
      id v30 = v35 = v22;
      unsigned int v27 = [v30 asHexString];

      id v33 = +[NSString stringWithFormat:@"LY-%@-%@", v27, v26];
      id v32 = +[NSString stringWithFormat:@"LYCA-%@-%@", v27, v26];
      id v31 = +[SEEndPointConfiguration lyonHydraDefaults];
      unsigned int v34 = [(SESServer *)self messageQueue];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      void v41[2] = sub_100024BB4;
      v41[3] = &unk_10040CA20;
      v41[4] = self;
      id v42 = v40;
      id v52 = v10;
      id v43 = v32;
      id v44 = v12;
      id v45 = v33;
      id v46 = v31;
      id v47 = v15;
      id v17 = v17;
      id v48 = v17;
      id v49 = @"20000101000000Z";
      long long v50 = @"99991231235959Z";
      unsigned int v53 = v38;
      id v51 = v18;
      unsigned int v54 = v35;
      unsigned int v55 = v36;
      id v39 = v31;
      id v37 = v33;
      id v28 = v32;
      +[SESProximityChip cacheProximityChipData:v34 completion:v41];
    }
    else
    {
      id v26 = SESDefaultLogObject();
      unsigned int v27 = [v9 allKeys];
      SESCreateAndLogError();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v28);
    }

LABEL_22:
    id v8 = v40;
    goto LABEL_23;
  }
  id v24 = SESDefaultLogObject();
  unsigned int v25 = SESCreateAndLogError();
  v10[2](v10, 0, v25);

LABEL_23:
}

- (unint64_t)_existsDuplicateInDatabase:(id)a3 airInstanceEntity:(id)a4 withIdentifier:(id)a5 orReaderIdentifier:(id)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v15);

  id v16 = [v12 endPoints];
  unsigned int v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  id v29 = sub_100025C0C;
  id v30 = &unk_10040CA48;
  id v17 = v11;
  id v31 = v17;
  id v18 = v12;
  id v32 = v18;
  id v19 = v13;
  id v33 = v19;
  id v20 = v14;
  id v34 = v20;
  id v21 = Find();
  if (!v21 || !SESInternalVariant()) {
    goto LABEL_8;
  }
  id v22 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
  if (![v22 BOOLForKey:@"debug.allow.duplicate.endpoints"])
  {

LABEL_8:
    unint64_t v24 = v21 != 0;
    goto LABEL_9;
  }
  id v23 = SESDefaultLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Allowing duplicate endPoint because of internal debug pref", v26, 2u);
  }

  unint64_t v24 = 0;
LABEL_9:

  return v24;
}

- (id)_ensureCAExistsAndValid:(id)a3 clientName:(id)a4 secureElement:(id)a5 database:(id)a6 forEndPointType:(int64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v18);

  id v19 = [(SESServer *)self database];
  id v29 = 0;
  id v20 = sub_100046478((uint64_t)v19, v14, v15, &v29);
  id v21 = v29;

  if (v21)
  {
    if (a8)
    {
LABEL_3:
      id v21 = v21;
      id v22 = 0;
      *a8 = v21;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (!v20)
  {
    id v28 = 0;
    id v20 = [(SESServer *)self _createEndPointCA:v16 database:v17 clientName:v15 identifier:v14 subjectIdentifier:v14 forEndPointType:a7 error:&v28];
    id v26 = v28;
    id v21 = v26;
    if (a8) {
      *a8 = v26;
    }
LABEL_14:
    id v25 = v20;
    id v20 = v25;
    goto LABEL_15;
  }
  id v23 = SESDefaultLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    unint64_t v24 = [v20 identifier];
    *(_DWORD *)buf = 138412546;
    id v31 = v15;
    __int16 v32 = 2112;
    id v33 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Client %@ already has a CA %@, using it", buf, 0x16u);
  }
  if ((unint64_t)(a7 - 3) > 1)
  {
    id v21 = [(SESServer *)self _renewEndPointCAIfExpired:v20 secureElement:v16 forEndPointType:a7];
    if (v21)
    {
      if (a8) {
        goto LABEL_3;
      }
LABEL_13:
      id v22 = 0;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v25 = v20;
  id v20 = v25;
  id v21 = 0;
LABEL_15:
  id v22 = v25;
LABEL_16:

  return v22;
}

- (void)configureEndpointWithProxy:(id)a3 identifier:(id)a4 privateData:(id)a5 confidentialData:(id)a6 contactlessVolatileVisibility:(id)a7 contactlessPersistentVisibility:(id)a8 wiredVolatileVisibility:(id)a9 wiredPersistentVisibility:(id)a10 keySlot:(id)a11 nfcExpressOnlyInLPM:(id)a12 reply:(id)a13
{
  id v42 = a4;
  id v40 = a5;
  id v39 = a6;
  id v37 = a7;
  id v36 = a8;
  id v33 = a9;
  id v18 = a10;
  id v31 = a11;
  id v29 = a12;
  id v19 = a13;
  id v35 = a3;
  id v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v42;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v28 = +[NSXPCConnection currentConnection];
  id v21 = sub_10003929C((uint64_t)SESClientInfo, v28);
  id v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) configureEndpointWithProxy:identifier:privateData:confidentialData:contactlessVolatileVisibility:contactlessPersistentVisibility:wiredVolatileVisibility:wiredPersistentVisibility:keySlot:nfcExpressOnlyInLPM:reply:]");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100026284;
  v43[3] = &unk_10040CA70;
  id v44 = v40;
  id v45 = v39;
  id v46 = v36;
  id v47 = v37;
  id v48 = v18;
  id v49 = v33;
  id v50 = v31;
  id v51 = v29;
  id v52 = v19;
  id v30 = v29;
  id v32 = v31;
  id v34 = v33;
  id v23 = v18;
  id v38 = v37;
  id v24 = v36;
  id v25 = v39;
  id v26 = v40;
  id v27 = v19;
  [(SESServer *)self endPointAction:v42 proxy:v35 clientInfo:v21 reason:v22 reply:v43];
}

- (id)getEncryptedCarOEMProprietaryData:(id)a3 withEndpointEntity:(id)a4 withSecureElement:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 carOEMProprietaryData];

  if (v10)
  {
    id v11 = [v7 carOEMProprietaryData];
    goto LABEL_61;
  }
  id v12 = [v8 privacyEncryptionPK];
  if (v12)
  {
    id v13 = [v7 mailboxMapping];

    if (v13)
    {
      id v14 = [v8 instance];
      id v15 = [v14 identifier];
      id v16 = [v15 hexStringAsData];
      id v17 = [v7 publicKeyIdentifier];
      id v64 = 0;
      id v18 = sub_1000496AC(v9, v16, v17, 0, 1, &v64);
      id v19 = v64;

      if (v19 || [v18 length] != (id)1)
      {
        id v24 = SESDefaultLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v34 = [v18 asHexString];
          *(_DWORD *)buf = 138412546;
          *(void *)unsigned int v66 = v34;
          *(_WORD *)&v66[8] = 2112;
          *(void *)&v66[10] = v19;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to retrieve private mailbox first byte %@ error %@", buf, 0x16u);
        }
        goto LABEL_58;
      }
      unsigned int v20 = [v18 u8:0];
      if (v20 == 128) {
        int v21 = 3;
      }
      else {
        int v21 = 0;
      }
      if ((v20 & 0x80u) == 0) {
        int v22 = 1;
      }
      else {
        int v22 = v21;
      }
      id v23 = [v7 mailboxMapping];
      id v24 = +[SESTLV TLVWithTag:32589 fromData:v23];

      if (v22 != 3)
      {
        if (v22 != 1)
        {
          id v41 = SESDefaultLogObject();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)unsigned int v66 = v20;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Unsupported private mailbox version %hhu", buf, 8u);
          }

          goto LABEL_57;
        }
        id v25 = [v24 childWithTag:194];
        id v19 = v25;
        if (!v25)
        {
LABEL_58:
          id v11 = 0;
LABEL_59:

          goto LABEL_60;
        }
        LODWORD(v26) = [v25 valueAsUnsignedShort];
        id v27 = [v24 childWithTag:195];
        id v28 = v27;
        unsigned int v60 = v26;
        if (v27)
        {
          unsigned int v29 = [v27 valueAsUnsignedShort];
          if (v26 > v29)
          {
            id v30 = v28;
            id v31 = SESDefaultLogObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)unsigned int v66 = v60;
              *(_WORD *)&v66[4] = 1024;
              *(_DWORD *)&v66[6] = v29;
              id v32 = "Invalid private mailbox offsets car OEM data %d key attestation %d";
LABEL_54:
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xEu);
              goto LABEL_55;
            }
            goto LABEL_55;
          }
        }
        else
        {
          id v26 = [v7 privateMailBoxSize];
          unsigned int v29 = [v26 unsignedShortValue];

          LOWORD(v26) = v60;
          if (v60 >= v29)
          {
            id v30 = 0;
            id v31 = SESDefaultLogObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)unsigned int v66 = v60;
              *(_WORD *)&v66[4] = 1024;
              *(_DWORD *)&v66[6] = v29;
              id v32 = "Invalid private mailbox car OEM data offset %d mailbox size %d";
              goto LABEL_54;
            }
LABEL_55:

            goto LABEL_56;
          }
        }
        unsigned __int16 v43 = v29 - (_WORD)v26;
LABEL_43:

        int v44 = v43;
        if (!v43)
        {
LABEL_57:
          id v19 = 0;
          goto LABEL_58;
        }
        id v58 = [v8 instance];
        id v45 = [v58 identifier];
        id v46 = [v45 hexStringAsData];
        id v47 = [v7 publicKeyIdentifier];
        id v63 = 0;
        id v62 = sub_1000496AC(v9, v46, v47, v60, v44, &v63);
        unsigned int v54 = v44;
        id v19 = v63;

        if (v19)
        {
          id v48 = v62;
          id v49 = SESDefaultLogObject();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)unsigned int v66 = v19;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to retrieve car OEM proprietary data %@", buf, 0xCu);
          }
        }
        else
        {
          id v48 = v62;
          if ([v62 length] == (id)v54)
          {
            id v19 = encryptPrivacyData();
            id v59 = 0;
            id v49 = 0;
            if (v19)
            {
              id v50 = SESDefaultLogObject();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)unsigned int v66 = v19;
                _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to encrypt private mailbox data %@", buf, 0xCu);
              }
              id v51 = v50;
              id v11 = 0;
            }
            else
            {
              uint64_t v55 = [v12 ses_sha256];
              id v11 = +[SEEndPointPrivacyEncryptResponse responseWithCipherText:v49 ephemeralPublicKeyData:v59 receiverPublicKeyHash:v55];
              id v51 = (void *)v55;
            }

            goto LABEL_68;
          }
          id v49 = SESDefaultLogObject();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            id v53 = [v62 length];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)unsigned int v66 = v54;
            *(_WORD *)&v66[4] = 2048;
            *(void *)&v66[6] = v53;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Incorrect proprietary data length expected %hu read %lu", buf, 0x12u);
          }
          id v19 = 0;
        }
        id v11 = 0;
LABEL_68:

        goto LABEL_59;
      }
      id v19 = [v24 childWithTag:96];
      id v28 = [v19 childWithTag:193];
      uint64_t v35 = [v19 childWithTag:194];
      id v36 = (void *)v35;
      if (v28 && v35)
      {
        id v56 = v19;
        unsigned int v37 = [v28 valueAsUnsignedShort];
        unsigned int v38 = [v36 valueAsUnsignedShort];
        unsigned int v39 = v38;
        if (v37 <= v38)
        {
          unsigned int v60 = v37;
          unsigned __int16 v43 = v38 - v37;

          id v19 = v56;
          goto LABEL_43;
        }
        id v61 = v28;
        id v40 = SESDefaultLogObject();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)unsigned int v66 = v37;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v39;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Invalid private mailbox offsets car OEM data %d key attestation %d", buf, 0xEu);
        }
        id v19 = v56;
      }
      else
      {
        id v61 = v28;
        id v40 = SESDefaultLogObject();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          id v57 = [v7 mailboxMapping];
          id v42 = [v57 asHexString];
          *(_DWORD *)buf = 138412290;
          *(void *)unsigned int v66 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to retrieve private mailbox offsets %@", buf, 0xCu);
        }
      }

LABEL_56:
      goto LABEL_57;
    }
    id v19 = SESDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v33 = "Missing mailbox mapping";
      goto LABEL_26;
    }
  }
  else
  {
    id v19 = SESDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v33 = "Missing server privacy public key";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v33, buf, 2u);
    }
  }
  id v11 = 0;
LABEL_60:

LABEL_61:

  return v11;
}

- (void)updateLyonCredentialDocumentStatusWithProxy:(id)a3 endpointIdentifier:(id)a4 accessDocumentPresent:(BOOL)a5 accessDocumentSignedTimestamp:(id)a6 revocationDocumentPresent:(BOOL)a7 revocationDocumentSignedTimestamp:(id)a8 reply:(id)a9
{
  id v13 = a4;
  id v14 = a9;
  id v15 = a3;
  id v16 = SESDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) updateLyonCredentialDocumentStatusWithProxy:endpointIdentifier:accessDocumentPresent:accessDocumentSignedTimestamp:revocationDocumentPresent:revocationDocumentSignedTimestamp:reply:]");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100026EA4;
  v20[3] = &unk_10040CA98;
  BOOL v23 = a5;
  BOOL v24 = a7;
  id v21 = v13;
  id v22 = v14;
  id v18 = v13;
  id v19 = v14;
  [(SESServer *)self endPointServiceAvailableWithProxy:v15 reason:v17 reply:v20];
}

- (void)revokeEndPointWithIdentifier:(id)a3 nonce:(id)a4 metaData:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v15 = +[NSXPCConnection currentConnection];
  id v16 = sub_10003929C((uint64_t)SESClientInfo, v15);
  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) revokeEndPointWithIdentifier:nonce:metaData:reply:]");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000272EC;
  v21[3] = &unk_10040CAC0;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v13;
  [(SESServer *)self endPointAction:v10 clientInfo:v16 reason:v17 reply:v21];
}

- (void)signatureWithEndPointIdentifier:(id)a3 metaDataHash:(id)a4 authorization:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v15 = +[NSXPCConnection currentConnection];
  id v16 = sub_10003929C((uint64_t)SESClientInfo, v15);
  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) signatureWithEndPointIdentifier:metaDataHash:authorization:reply:]");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100027918;
  v22[3] = &unk_10040CAC0;
  id v23 = v11;
  id v24 = v12;
  id v25 = v10;
  id v26 = v13;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  [(SESServer *)self endPointAction:v18 clientInfo:v16 reason:v17 reply:v22];
}

- (void)signatureISO18013WithEndPointIdentifier:(id)a3 toBeSigned:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);
  id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) signatureISO18013WithEndPointIdentifier:toBeSigned:reply:]");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100027CA8;
  v18[3] = &unk_10040CAE8;
  id v20 = v8;
  id v21 = v10;
  id v19 = v9;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  [(SESServer *)self endPointAction:v15 clientInfo:v13 reason:v14 reply:v18];
}

- (void)setPrivateDataWithProxy:(id)a3 identifier:(id)a4 privateData:(id)a5 privateDataOffset:(unsigned __int16)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a3;
  id v16 = SESDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v17 = +[NSXPCConnection currentConnection];
  id v18 = sub_10003929C((uint64_t)SESClientInfo, v17);

  id v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) setPrivateDataWithProxy:identifier:privateData:privateDataOffset:reply:]");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100028040;
  v22[3] = &unk_10040CB10;
  unsigned __int16 v25 = a6;
  id v23 = v13;
  id v24 = v14;
  id v20 = v13;
  id v21 = v14;
  [(SESServer *)self endPointAction:v12 proxy:v15 clientInfo:v18 reason:v19 reply:v22];
}

- (void)updateEndpoint:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 publicKeyIdentifier];
    id v10 = [v9 asHexString];
    *(_DWORD *)buf = 138412290;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "updateEndpoint %@", buf, 0xCu);
  }
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  id v13 = [v6 publicKeyIdentifier];
  id v14 = [v13 asHexString];
  id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) updateEndpoint:reply:]");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000284A4;
  v18[3] = &unk_10040CB38;
  id v19 = v6;
  id v20 = v7;
  id v16 = v6;
  id v17 = v7;
  [(SESServer *)self endPointDBAction:v14 clientInfo:v12 reason:v15 reply:v18];
}

- (void)getPrivateDataWithProxy:(id)a3 identifier:(id)a4 privateDataOffset:(unsigned __int16)a5 privateDataLength:(unsigned __int16)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a3;
  id v15 = SESDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v16 = +[NSXPCConnection currentConnection];
  id v17 = sub_10003929C((uint64_t)SESClientInfo, v16);

  id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getPrivateDataWithProxy:identifier:privateDataOffset:privateDataLength:reply:]");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100028814;
  v20[3] = &unk_10040CB60;
  id v21 = v13;
  unsigned __int16 v22 = a5;
  unsigned __int16 v23 = a6;
  id v19 = v13;
  [(SESServer *)self endPointAction:v12 proxy:v14 clientInfo:v17 reason:v18 reply:v20];
}

- (void)createEncryptionKeyEndPointWithProxy:(id)a3 identifier:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

  id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createEncryptionKeyEndPointWithProxy:identifier:reply:]");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100028C50;
  v16[3] = &unk_10040CB88;
  id v17 = v9;
  id v15 = v9;
  [(SESServer *)self endPointAction:v8 proxy:v10 clientInfo:v13 reason:v14 reply:v16];
}

- (void)setConfidentialDataEndPointWithIdentifier:(id)a3 senderEphemeralPublicKey:(id)a4 encryptedData:(id)a5 offset:(unsigned __int16)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a3;
  id v16 = +[NSXPCConnection currentConnection];
  id v17 = sub_10003929C((uint64_t)SESClientInfo, v16);

  id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) setConfidentialDataEndPointWithIdentifier:senderEphemeralPublicKey:encryptedData:offset:reply:]");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100028F10;
  v22[3] = &unk_10040CBB0;
  id v24 = v13;
  id v25 = v14;
  id v23 = v12;
  unsigned __int16 v26 = a6;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  [(SESServer *)self endPointAction:v15 clientInfo:v17 reason:v18 reply:v22];
}

- (void)updateHydraMailboxesWithProxy:(id)a3 identifier:(id)a4 encryptedSEBlob:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v15 = +[NSXPCConnection currentConnection];
  id v16 = sub_10003929C((uint64_t)SESClientInfo, v15);

  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) updateHydraMailboxesWithProxy:identifier:encryptedSEBlob:reply:]");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100029290;
  v21[3] = &unk_10040CAC0;
  id v22 = v11;
  id v23 = self;
  id v24 = v10;
  id v25 = v12;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  [(SESServer *)self endPointAction:v18 proxy:v13 clientInfo:v16 reason:v17 reply:v21];
}

- (id)_applyPrivateMailboxContents:(id *)a3 secureElement:(id)a4 instanceAID:(id)a5 keyIdentifier:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  long long v14 = 0u;
  DERParseSequenceSpecContent();
  id v11 = SESDefaultLogObject();
  id v12 = SESCreateAndLogError();

  return v12;
}

- (id)_applyConfidentialMailboxContents:(id *)a3 secureElement:(id)a4 instanceAID:(id)a5 keyIdentifier:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  long long v14 = 0u;
  long long v15 = 0u;
  DERParseSequenceSpecContent();
  id v11 = SESDefaultLogObject();
  id v12 = SESCreateAndLogError();

  return v12;
}

- (void)createEndPointAuthorizationID:(id)a3 userAuth:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }

  if (v8 && v9)
  {
    id v12 = +[NSXPCConnection currentConnection];
    id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

    long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) createEndPointAuthorizationID:userAuth:reply:]");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100029DFC;
    v16[3] = &unk_10040CC00;
    id v18 = v10;
    id v17 = v9;
    [(SESServer *)self endPointAction:v8 clientInfo:v13 reason:v14 reply:v16];

    long long v15 = v18;
  }
  else
  {
    id v13 = SESDefaultLogObject();
    long long v15 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
  }
}

- (void)listEndPointAuthorizations:(id)a3
{
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointAuthorizations:]");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A354;
  v8[3] = &unk_10040BC88;
  id v9 = v4;
  id v7 = v4;
  [(SESServer *)self secureElementService:v6 reply:v8];
}

- (void)deleteEndPointAuthorizationID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndPointAuthorizationID:reply:]");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A588;
  v12[3] = &unk_10040BB70;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(SESServer *)self secureElementService:v9 reply:v12];
}

- (void)preAuthorizeEndpointWithProxy:(id)a3 keyIdentifier:(id)a4 bindingAttestation:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v26 = v13 != 0;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "preAuthorizeEndpointWithProxy %d keyIdentifier %@", buf, 0x12u);
  }

  long long v15 = +[NSXPCConnection currentConnection];
  id v16 = sub_10003929C((uint64_t)SESClientInfo, v15);

  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) preAuthorizeEndpointWithProxy:keyIdentifier:bindingAttestation:reply:]");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002A830;
  v21[3] = &unk_10040CAE8;
  id v23 = v11;
  id v24 = v12;
  id v22 = v10;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  [(SESServer *)self endPointAction:v19 proxy:v13 clientInfo:v16 reason:v17 reply:v21];
}

- (void)authorizeEndPointWithProxy:(id)a3 version:(unsigned __int8)a4 identifier:(id)a5 externalCA:(id)a6 instanceCA:(id)a7 endpointCertificate:(id)a8 encryptionKeyAttestation:(id)a9 bindingAttestation:(id)a10 bindingAttestationToken:(id)a11 confidentialDataOffset:(unsigned __int16)a12 confidentialDataLength:(unsigned __int16)a13 metaData:(id)a14 authorizationID:(id)a15 reply:(id)a16
{
  id v46 = a5;
  id v42 = a6;
  id v38 = a7;
  id v44 = a8;
  id v35 = a9;
  id v20 = a10;
  id v21 = a11;
  id v34 = a14;
  id v33 = a15;
  id v22 = a16;
  id v23 = a3;
  id v24 = SESDefaultLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v61 = v23 != 0;
    __int16 v62 = 2112;
    id v63 = v46;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "authorizeEndPointWithProxy %d keyIdentifier %@", buf, 0x12u);
  }

  +[NSXPCConnection currentConnection];
  id v25 = v32 = v23;
  BOOL v26 = sub_10003929C((uint64_t)SESClientInfo, v25);

  __int16 v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) authorizeEndPointWithProxy:version:identifier:externalCA:instanceCA:endpointCertificate:encryptionKeyAttestation:bindingAttestation:bindingAttestationToken:confidentialDataOffset:confidentialDataLength:metaData:authorizationID:reply:]");
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10002AC6C;
  v47[3] = &unk_10040CC28;
  id v56 = v22;
  unsigned __int16 v57 = a13;
  unsigned __int16 v58 = a12;
  id v48 = v44;
  id v49 = v20;
  unsigned __int8 v59 = a4;
  id v50 = v21;
  id v51 = v42;
  id v52 = v38;
  id v53 = v35;
  id v54 = v34;
  id v55 = v33;
  id v41 = v33;
  id v37 = v34;
  id v36 = v35;
  id v39 = v38;
  id v43 = v42;
  id v28 = v21;
  id v29 = v20;
  id v30 = v44;
  id v31 = v22;
  [(SESServer *)self endPointAction:v46 proxy:v32 clientInfo:v26 reason:v27 reply:v47];
}

- (void)privacyDecryptDataWithEndPoint:(id)a3 data:(id)a4 ephemeralPublicKey:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  long long v15 = +[NSXPCConnection currentConnection];
  id v16 = sub_10003929C((uint64_t)SESClientInfo, v15);

  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) privacyDecryptDataWithEndPoint:data:ephemeralPublicKey:reply:]");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002B280;
  v21[3] = &unk_10040CC50;
  id v23 = v12;
  id v24 = v13;
  id v22 = v11;
  id v18 = v12;
  id v19 = v11;
  id v20 = v13;
  [(SESServer *)self endPointDBAction:v10 clientInfo:v16 reason:v17 reply:v21];
}

- (void)privacyDecryptDataWithKeyPair:(id)a3 secretKey:(id)a4 data:(id)a5 ephemeralPublicKey:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v28 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void, void *))a7;
  long long v15 = SESDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v16 = +[NSXPCConnection currentConnection];
  id v17 = sub_10003929C((uint64_t)SESClientInfo, v16);

  if (sub_100039494((uint64_t)v17) & 1) != 0 || (sub_1000394B4((uint64_t)v17))
  {
    id v27 = v11;
    id v18 = [v11 mutableCopy];
    id v19 = v12;
    [v18 appendData:v12];
    v30[0] = kSecAttrKeyClass;
    v30[1] = kSecAttrKeyType;
    v31[0] = kSecAttrKeyClassPrivate;
    v31[1] = kSecAttrKeyTypeECSECPrimeRandom;
    v30[2] = kSecAttrKeySizeInBits;
    v31[2] = &off_10042DD80;
    CFDictionaryRef v20 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    *(void *)buf = 0;
    SecKeyRef v21 = SecKeyCreateWithData((CFDataRef)v18, v20, (CFErrorRef *)buf);
    SecKeyRef v22 = v21;
    id v23 = *(void **)buf;
    if (*(void *)buf || !v21)
    {
      SESDefaultLogObject();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = SESCreateAndLogError();
      v14[2](v14, 0, v26);

      id v24 = v28;
    }
    else
    {
      id v24 = v28;
      id v23 = decryptPrivacyData();
      id v25 = 0;
      ((void (**)(id, id, void *))v14)[2](v14, v25, v23);
    }

    id v11 = v27;
    id v12 = v19;
  }
  else
  {
    SESDefaultLogObject();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    CFDictionaryRef v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v20);
    id v24 = v28;
  }
}

- (void)privacyEncryptDataWithEndPoint:(id)a3 data:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v12 = +[NSXPCConnection currentConnection];
  id v13 = sub_10003929C((uint64_t)SESClientInfo, v12);

  id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) privacyEncryptDataWithEndPoint:data:reply:]");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002B9E0;
  v18[3] = &unk_10040CC50;
  id v20 = v9;
  id v21 = v10;
  id v19 = v8;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  [(SESServer *)self endPointDBAction:v16 clientInfo:v13 reason:v14 reply:v18];
}

- (void)privacyEncryptDataWithManufacturer:(id)a3 environment:(id)a4 region:(id)a5 data:(id)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, id))a7;
  id v16 = SESDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);
  }

  id v17 = +[NSXPCConnection currentConnection];
  id v18 = sub_10003929C((uint64_t)SESClientInfo, v17);

  if (sub_100039494((uint64_t)v18) & 1) != 0 || (sub_1000394B4((uint64_t)v18))
  {
    id v19 = objc_opt_new();
    id v29 = 0;
    id v20 = [v19 getEncryptionCertificateFor:v11 environment:v12 region:v13 error:&v29];
    id v21 = v29;
    if (v21)
    {
      SecKeyRef v22 = v21;
      v15[2](v15, 0, v21);
    }
    else
    {
      id v28 = v14;
      id v23 = getCertificatePublicKey();
      if (v23)
      {
        SecKeyRef v22 = encryptPrivacyData();
        id v24 = 0;
        id v27 = 0;
        if (v22)
        {
          v15[2](v15, 0, v22);
        }
        else
        {
          id v26 = [v23 ses_sha256];
          id v25 = +[SEEndPointPrivacyEncryptResponse responseWithCipherText:v27 ephemeralPublicKeyData:v24 receiverPublicKeyHash:v26];
          ((void (**)(id, void *, id))v15)[2](v15, v25, 0);
        }
      }
      else
      {
        SESDefaultLogObject();
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v15[2](v15, 0, v24);
        SecKeyRef v22 = 0;
      }

      id v14 = v28;
    }
  }
  else
  {
    id v19 = SESDefaultLogObject();
    SecKeyRef v22 = SESCreateAndLogError();
    v15[2](v15, 0, v22);
  }
}

- (void)deleteEndPointWithPublicKey:(id)a3 reply:(id)a4
{
  id v4 = (void (**)(id, void *))a4;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "", v7, 2u);
  }

  id v6 = +[NSError errorWithDomain:@"seserviced" code:-1 userInfo:0];
  v4[2](v4, v6);
}

- (void)deleteEndPointWithPublicKeyIdentifier:(id)a3 reply:(id)a4
{
  id v4 = (void (**)(id, void *))a4;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "", v7, 2u);
  }

  id v6 = +[NSError errorWithDomain:@"seserviced" code:-1 userInfo:0];
  v4[2](v4, v6);
}

- (void)deleteEndPointWithProxy:(id)a3 identifier:(id)a4 mustBeTerminated:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = SESDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v10;
    __int16 v27 = 1024;
    BOOL v28 = v12 != 0;
    __int16 v29 = 1024;
    BOOL v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Identifier %@ proxy %d mustBeTerminated %d", buf, 0x18u);
  }

  id v14 = +[NSXPCConnection currentConnection];
  id v15 = sub_10003929C((uint64_t)SESClientInfo, v14);

  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndPointWithProxy:identifier:mustBeTerminated:reply:]");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002C250;
  v20[3] = &unk_10040CC78;
  id v22 = v15;
  id v23 = v11;
  BOOL v24 = v7;
  id v21 = v10;
  id v17 = v15;
  id v18 = v10;
  id v19 = v11;
  [(SESServer *)self endPointAction:v18 proxy:v12 clientInfo:v17 reason:v16 reply:v20];
}

- (void)remoteTerminationRequestWithProxy:(id)a3 remoteTerminationRequest:(id)a4 publicKeyIdentifier:(id)a5 taskID:(id)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  id v17 = +[NSXPCConnection currentConnection];
  id v18 = sub_10003929C((uint64_t)SESClientInfo, v17);

  id v19 = SESDefaultLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v21 = sub_100039480(v18, v20);
    *(_DWORD *)buf = 138413058;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v21;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 1024;
    BOOL v42 = v12 != 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "key %@ client %@ task %@ hasRTR %d", buf, 0x26u);
  }
  id v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) remoteTerminationRequestWithProxy:remoteTerminationRequest:publicKeyIdentifier:taskID:reply:]");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002C948;
  v28[3] = &unk_10040CCA0;
  id v29 = v13;
  id v30 = v12;
  id v31 = self;
  id v32 = v14;
  id v33 = v18;
  id v34 = v15;
  id v23 = v18;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  [(SESServer *)self endPointAction:v26 proxy:v16 clientInfo:v23 reason:v22 reply:v28];
}

- (id)revokeRemoteTerminationRequestEndPoints:(id)a3 sesDatabase:(id)a4 identifier:(id)a5 taskID:(id)a6 clientInfo:(id)a7 outError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v52 = a6;
  id v17 = a7;
  id v18 = [(SESServer *)self messageQueue];
  dispatch_assert_queue_V2(v18);

  id v19 = [v16 asHexString];
  id v54 = 0;
  id v55 = 0;
  id v20 = [(SESServer *)self _getEndPointAndValidateAccess:v15 identifier:v19 clientInfo:v17 outEndPointEntity:&v55 outEndPoint:&v54];

  id v21 = v55;
  id v22 = v54;

  if (!v20 && v22 && v21)
  {
    id v23 = [v22 revocationAttestation];

    if (!v23)
    {
      id v48 = v16;
      id v49 = v15;
      id v51 = [v22 readerInfo];
      id v31 = [v22 bleAddress];
      uint64_t v32 = 3;
      if (!v31) {
        uint64_t v32 = 1;
      }
      uint64_t v47 = v32;

      id v33 = [(SESServer *)self getEncryptedCarOEMProprietaryData:v22 withEndpointEntity:v21 withSecureElement:v14];
      [v22 setCarOEMProprietaryData:v33];

      id v27 = +[NSData randomData:16];
      id v34 = [v21 instance];
      [v34 identifier];
      v36 = id v35 = v14;
      __int16 v37 = [v36 hexStringAsData];
      id v38 = [v22 publicKeyIdentifier];
      id v53 = 0;
      id v50 = v35;
      __int16 v39 = sub_10004C654(v35, v37, v38, v27, 0, &v53);
      id v20 = v53;

      if (v20 || !v39)
      {
        if (a8)
        {
          BOOL v42 = SESDefaultLogObject();
          id v43 = [v22 publicKeyIdentifier];
          id v46 = [v43 asHexString];
          SESCreateAndLogError();
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        sub_10004F8C4((uint64_t)SESDAnalyticsLogger, 2, v51, v47, 3);
        id v29 = 0;
        id v15 = v49;
        id v14 = v50;
        id v16 = v48;
        id v30 = v52;
      }
      else
      {
        [v22 setRevocationAttestation:];
        id v15 = v49;
        id v30 = v52;
        if (v52) {
          [v22 setTerminatedByTaskID:v52];
        }
        sub_100040D9C(v49, v21, v22);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = v50;
        id v16 = v48;
        if (v20)
        {
          id v40 = SESDefaultLogObject();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v20;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to updated db? %@", buf, 0xCu);
          }

          uint64_t v41 = 4;
        }
        else
        {
          uint64_t v41 = 0;
        }
        +[EndpointStore removeWithEndpoint:v22];
        sub_10004F8C4((uint64_t)SESDAnalyticsLogger, 2, v51, v47, v41);
        id v29 = v39;
      }

      id v26 = v51;
      goto LABEL_31;
    }
    if (a8)
    {
      id v24 = SESDefaultLogObject();
      id v25 = [v22 publicKeyIdentifier];
      id v45 = [v25 asHexString];
      SESCreateAndLogError();
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v26 = [v22 readerInfo:v45];
    id v27 = [v22 bleAddress];
    if (v27) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = 1;
    }
    sub_10004F8C4((uint64_t)SESDAnalyticsLogger, 2, v26, v28, 2);
    id v20 = 0;
    id v29 = 0;
  }
  else
  {
    if (!a8)
    {
      id v29 = 0;
      id v30 = v52;
      goto LABEL_32;
    }
    id v26 = SESDefaultLogObject();
    id v27 = [v16 asHexString];
    SESCreateAndLogError();
    id v29 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v30 = v52;
LABEL_31:

LABEL_32:

  return v29;
}

- (void)getInvitations:(id)a3
{
  id v4 = a3;
  v5 = +[NSXPCConnection currentConnection];
  id v6 = sub_10003929C((uint64_t)SESClientInfo, v5);

  if (sub_100039494((uint64_t)v6))
  {
    BOOL v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getInvitations:]");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002D5A4;
    v10[3] = &unk_10040C6C0;
    id v12 = v4;
    id v11 = v6;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v7 reply:v10];
  }
  else
  {
    id v8 = SESDefaultLogObject();
    id v9 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

- (void)getInvitationWithId:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_100039494((uint64_t)v9))
  {
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getInvitationWithId:reply:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002D8BC;
    v13[3] = &unk_10040CCC8;
    id v16 = v7;
    id v14 = v6;
    id v15 = v9;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v10 reply:v13];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)addInvitationWithId:(id)a3 data:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if (sub_100039494((uint64_t)v12))
  {
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) addInvitationWithId:data:reply:]");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002DBFC;
    v16[3] = &unk_10040C5B0;
    id v20 = v10;
    id v17 = v8;
    id v18 = v9;
    id v19 = v12;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v13 reply:v16];
  }
  else
  {
    id v14 = SESDefaultLogObject();
    id v15 = SESCreateAndLogError();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)deleteInvitationWithId:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_100039494((uint64_t)v9))
  {
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteInvitationWithId:reply:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002DE9C;
    v13[3] = &unk_10040CCC8;
    id v16 = v7;
    id v14 = v6;
    id v15 = v9;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v10 reply:v13];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)getEndpointIdWithUuid:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_100039494((uint64_t)v9))
  {
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getEndpointIdWithUuid:reply:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002E138;
    v13[3] = &unk_10040CCC8;
    id v16 = v7;
    id v14 = v6;
    id v15 = v9;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v10 reply:v13];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)addEndpointId:(id)a3 withUuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if (sub_100039494((uint64_t)v12))
  {
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) addEndpointId:withUuid:reply:]");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002E470;
    v16[3] = &unk_10040C5B0;
    id v20 = v10;
    id v17 = v8;
    id v18 = v9;
    id v19 = v12;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v13 reply:v16];
  }
  else
  {
    id v14 = SESDefaultLogObject();
    id v15 = SESCreateAndLogError();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)deleteEndpointIdWithUuid:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = sub_10003929C((uint64_t)SESClientInfo, v8);

  if (sub_100039494((uint64_t)v9))
  {
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) deleteEndpointIdWithUuid:reply:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002E710;
    v13[3] = &unk_10040CCC8;
    id v16 = v7;
    id v14 = v6;
    id v15 = v9;
    [(SESServer *)self databaseServiceWithProxy:0 isReconcileRequired:0 reason:v10 reply:v13];
  }
  else
  {
    id v11 = SESDefaultLogObject();
    id v12 = SESCreateAndLogError();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)getEndpointBindingAttestationRequestWithProxy:(id)a3 authorityIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if (sub_100039494((uint64_t)v12) & 1) != 0 || (sub_1000394B4((uint64_t)v12))
  {
    id v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v22 = v8 != 0;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "getEndpointBindingAttestationRequestWithProxy %d authorityIdentifier %@", buf, 0x12u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002EA38;
    v16[3] = &unk_10040C588;
    id v20 = v10;
    id v17 = v9;
    id v18 = v12;
    id v19 = self;
    [(SESServer *)self endPointServiceAvailableWithProxy:v8 reason:@"getEndpointBindingAttestationRequestWithProxy" reply:v16];
  }
  else
  {
    id v14 = SESDefaultLogObject();
    id v15 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
  }
}

- (void)listEndPointContainers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if (sub_100039494((uint64_t)v10) & 1) != 0 || (sub_1000394B4((uint64_t)v10))
  {
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) listEndPointContainers:reply:]");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002EEB8;
    v14[3] = &unk_10040C538;
    id v15 = v7;
    [(SESServer *)self endPointServiceAvailableWithProxy:v6 reason:v11 reply:v14];

    id v12 = v15;
  }
  else
  {
    id v12 = SESDefaultLogObject();
    id v13 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (void)isCarKeySupported:(id)a3 brand:(id)a4 uuid:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = SESDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v14 = +[NSXPCConnection currentConnection];
  id v15 = sub_10003929C((uint64_t)SESClientInfo, v14);

  if ((sub_100039494((uint64_t)v15) & 1) == 0 && (sub_1000394B4((uint64_t)v15) & 1) == 0)
  {
    SESDefaultLogObject();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = SESCreateAndLogError();
    v12[2](v12, 0, v21);
    goto LABEL_13;
  }
  id v16 = objc_opt_new();
  id v17 = v16;
  if (v10 && v11)
  {
    id v23 = 0;
    id v18 = [v16 BOOLValueForSetting:5 manufacturer:v9 brand:v10 uuid:v11 error:&v23];
    id v19 = v23;
    id v20 = [v18 BOOLValue];
  }
  else
  {
    id v22 = 0;
    id v20 = [v16 isDCKConfigurationAvailableFor:v9 error:&v22];
    id v19 = v22;
  }

  +[SESAssetManager syncMobileAssetUserInitiated];
  if (!v19)
  {
    id v21 = +[NSNumber numberWithBool:v20];
    ((void (**)(id, void *, void *))v12)[2](v12, v21, 0);
LABEL_13:

    goto LABEL_14;
  }
  v12[2](v12, 0, v19);
LABEL_14:
}

- (void)carKeyDowngradeVersionSetting:(id)a3 brand:(id)a4 uuid:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = SESDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ - %@", buf, 0x16u);
  }

  id v14 = +[NSXPCConnection currentConnection];
  id v15 = sub_10003929C((uint64_t)SESClientInfo, v14);

  if ((sub_100039494((uint64_t)v15) & 1) == 0 && (sub_1000394B4((uint64_t)v15) & 1) == 0)
  {
    SESDefaultLogObject();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = SESCreateAndLogError();
    v12[2](v12, 0, v20);

    goto LABEL_12;
  }
  if (!v9)
  {
    +[SESAssetManager syncMobileAssetUserInitiated];
    id v19 = 0;
    goto LABEL_9;
  }
  id v16 = objc_opt_new();
  id v21 = 0;
  id v17 = [v16 BOOLValueForSetting:1 manufacturer:v9 brand:v10 uuid:v11 error:&v21];
  id v18 = v21;
  id v19 = [v17 BOOLValue];

  +[SESAssetManager syncMobileAssetUserInitiated];
  if (!v18)
  {
LABEL_9:
    id v18 = +[NSNumber numberWithBool:v19];
    ((void (**)(id, id, void *))v12)[2](v12, v18, 0);
    goto LABEL_12;
  }
  v12[2](v12, 0, v18);
LABEL_12:
}

- (void)getCAGeneralStatisticsInfo:(id)a3
{
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "getCAGeneralStatisticsInfo", buf, 2u);
  }

  id v6 = +[NSXPCConnection currentConnection];
  id v7 = sub_10003929C((uint64_t)SESClientInfo, v6);

  if (sub_100039494((uint64_t)v7) & 1) != 0 || (sub_1000394B4((uint64_t)v7))
  {
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) getCAGeneralStatisticsInfo:]");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002F868;
    v11[3] = &unk_10040CCF0;
    id v12 = v4;
    [(SESServer *)self databaseService:v8 reply:v11];

    id v9 = v12;
  }
  else
  {
    id v9 = SESDefaultLogObject();
    id v10 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

- (void)convertEndpointWithProxy:(id)a3 keyIdentifier:(id)a4 notBeforeDate:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v12 asHexString];
    *(_DWORD *)buf = 138412546;
    id v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "convertEndpointWithProxy %@ notBeforeDate %@", buf, 0x16u);
  }
  id v16 = +[NSXPCConnection currentConnection];
  id v17 = sub_10003929C((uint64_t)SESClientInfo, v16);

  if ((sub_100039494((uint64_t)v17) & 1) == 0 && (sub_1000394B4((uint64_t)v17) & 1) == 0)
  {
    id v19 = SESDefaultLogObject();
LABEL_10:
    id v20 = SESCreateAndLogError();
    v13[2](v13, v20);

    goto LABEL_11;
  }
  if ([v12 length] != (id)13 && objc_msgSend(v12, "length") != (id)15)
  {
    id v19 = SESDefaultLogObject();
    [v12 length];
    goto LABEL_10;
  }
  id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SESServer(SEEndPointXPC) convertEndpointWithProxy:keyIdentifier:notBeforeDate:reply:]");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002FC5C;
  v21[3] = &unk_10040CAE8;
  __int16 v24 = v13;
  id v22 = v11;
  id v23 = v12;
  [(SESServer *)self endPointAction:v22 proxy:v10 clientInfo:v17 reason:v18 reply:v21];

  id v19 = v24;
LABEL_11:
}

- (void)triggerHeadUnitPairing:(id)a3 data:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = SESDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", v16, 2u);
  }

  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if ((sub_100039494((uint64_t)v12) & 1) != 0 || (sub_1000394B4((uint64_t)v12)) && v7)
  {
    id v13 = +[AlishaExternal shared];
    [v13 triggerHeadUnitPairingWith:v8 keyIdentifier:v7];

    v9[2](v9, 0);
  }
  else
  {
    id v14 = SESDefaultLogObject();
    id v15 = SESCreateAndLogError();
    ((void (**)(id, void *))v9)[2](v9, v15);
  }
}

- (void)sendDeviceIntentWithConfidence:(id)a3 keyIdentifier:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = SESDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "", buf, 2u);
  }

  id v11 = +[NSXPCConnection currentConnection];
  id v12 = sub_10003929C((uint64_t)SESClientInfo, v11);

  if (sub_100039494((uint64_t)v12) & 1) != 0 || (sub_1000394B4((uint64_t)v12))
  {
    if (v7 && v8)
    {
      if ([v7 unsignedIntValue] < 3)
      {
        id v15 = +[AlishaExternal shared];
        [v15 sendDeviceIntentFor:v8];

        v9[2](v9, 0);
        goto LABEL_13;
      }
      id v13 = SESDefaultLogObject();
      [v7 unsignedIntValue];
    }
    else
    {
      id v13 = SESDefaultLogObject();
    }
  }
  else
  {
    id v13 = SESDefaultLogObject();
  }
  id v14 = SESCreateAndLogError();
  ((void (**)(id, void *))v9)[2](v9, v14);

LABEL_13:
}

- (void)notifyEndpointTracked:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = SESDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 asHexString];
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Tracking completed for key %@", (uint8_t *)&v14, 0xCu);
  }
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if (sub_100039494((uint64_t)v10) & 1) != 0 || (sub_1000394B4((uint64_t)v10))
  {
    id v11 = +[AlishaExternal shared];
    [v11 onTrackingCompleteFor:v5];

    v6[2](v6, 0);
  }
  else
  {
    id v12 = SESDefaultLogObject();
    id v13 = SESCreateAndLogError();
    ((void (**)(id, void *))v6)[2](v6, v13);
  }
}

- (void)notifyPassAdded:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = SESDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 asHexString];
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Pass added for key %@", (uint8_t *)&v14, 0xCu);
  }
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = sub_10003929C((uint64_t)SESClientInfo, v9);

  if (sub_100039494((uint64_t)v10) & 1) != 0 || (sub_1000394B4((uint64_t)v10))
  {
    id v11 = +[_SESSessionManager sessionManager];
    [v11 didCreateKey:v5];

    v6[2](v6, 0);
  }
  else
  {
    id v12 = SESDefaultLogObject();
    id v13 = SESCreateAndLogError();
    ((void (**)(id, void *))v6)[2](v6, v13);
  }
}

- (void)getSupportedLyonVersionsWithReply:(id)a3
{
  id v7 = (void (**)(id, void *, void))a3;
  v3 = +[LyonExternal shared];
  id v4 = [v3 getSupportedLyonVersions];

  if (v4)
  {
    v7[2](v7, v4, 0);
  }
  else
  {
    id v5 = SESDefaultLogObject();
    id v6 = SESCreateAndLogError();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v6);
  }
}

+ (id)server
{
  SecAccessControlRef v2 = sub_100039564([SESServer alloc], @"com.apple.seserviced", @"/private/var/mobile/Library/SecureElementService/");

  return v2;
}

+ (id)serverWithMachServiceName:(id)a3 storagePath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_100039564([SESServer alloc], (uint64_t)v6, v5);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (__CFString *)a4;
  id v6 = [(__CFString *)v5 processIdentifier];
  id v7 = [(__CFString *)v5 valueForEntitlement:@"application-identifier"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v33 = self;
    id v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v43 = v7;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Added connection from %@ (%@)", buf, 0x16u);
    }

    v40[0] = &off_10042DDB0;
    id v9 = +[NSNumber numberWithInt:v6];
    v40[1] = &off_10042DDC8;
    v41[0] = v9;
    v41[1] = v7;
    id v10 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    [(__CFString *)v5 setUserInfo:v10];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100039FD8;
    v37[3] = &unk_10040D0D8;
    int v39 = (int)v6;
    id v11 = v7;
    id v38 = v11;
    [(__CFString *)v5 setInvalidationHandler:v37];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10003A090;
    v34[3] = &unk_10040D0D8;
    int v36 = (int)v6;
    id v35 = v11;
    [(__CFString *)v5 setInterruptionHandler:v34];
    id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SEServerProtocol];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    [v12 setClasses:v16 forSelector:x0 argumentIndex:x1 ofReply:x2];

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    [v12 setClasses:v20 forSelector:v21 argumentIndex:v22 ofReply:v23];

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    id v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    [v12 setClasses:v23 forSelector:"verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:" argumentIndex:0 ofReply:0];

    uint64_t v24 = objc_opt_class();
    id v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(), 0);
    BOOL v26 = 1;
    [v12 setClasses:v25 forSelector:"createPrivacyKeyForGroupIdentifier:withOptions:completion:" argumentIndex:0 ofReply:1];

    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    id v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    [v12 setClasses:v29 forSelector:"privacyKeysForGroupIdentifier:keyIdentifier:completion:" argumentIndex:0 ofReply:1];

    [v12 setClass:objc_opt_class() forSelector:"deletePrivacyKey:completion:" argumentIndex:0 ofReply:0];
    id v30 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SEProxyInterface];
    [v12 setInterface:v30 forSelector:"listEndPointsWithProxy:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"cleanupAppletsWithNoEndpoints:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"remoteTerminationRequestWithProxy:remoteTerminationRequest:publicKeyIdentifier:taskID:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"deleteEndPointWithProxy:identifier:mustBeTerminated:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createAlishaEndpointWithProxy:identifier:authorityIdentifier:subjectIdentifier:configuration:readerIdentifier:readerPublicKey:readerInformation:startDate:endDate:keyIdentifier:authorizedKeys:confidentialMailBoxSize:privateMailBoxSize:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createHydraEndpointWithProxy:serverParams:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createLyonHydraEndpointWithProxy:serverParams:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createEncryptionKeyEndPointWithProxy:identifier:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"updateHydraMailboxesWithProxy:identifier:encryptedSEBlob:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createLocalEndpointWithProxy:readerIdentifier:readerPublicKey:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createLyonEndpointWithProxy:readerGroupIdentifier:readerPublicKey:homeUUID:privateMailboxSize:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"updateLyonCredentialDocumentStatusWithProxy:endpointIdentifier:accessDocumentPresent:accessDocumentSignedTimestamp:revocationDocumentPresent:revocationDocumentSignedTimestamp:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"configureEndpointWithProxy:identifier:privateData:confidentialData:contactlessVolatileVisibility:contactlessPersistentVisibility:wiredVolatileVisibility:wiredPersistentVisibility:keySlot:nfcExpressOnlyInLPM:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"signWithSEKey:keyData:data:algorithm:laExternalizedContext:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"signPrecomputedDigest:keyData:digest:algorithm:laExternalizedContext:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"sharedSecretWithSEKey:keyData:publicKey:algorithm:laExternalizedContext:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createPTAttestation:keyData:subjectIdentifier:nonce:OIDs:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createSEKey:extractedACLs:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"deleteSEKey:keyData:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"listEndPointContainers:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"setPrivateDataWithProxy:identifier:privateData:privateDataOffset:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"getPrivateDataWithProxy:identifier:privateDataOffset:privateDataLength:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"convertEndpointWithProxy:keyIdentifier:notBeforeDate:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"createFiDOKeyForRelyingParty:relyingPartyAccountHash:challenge:usingProxy:callback:" argumentIndex:3 ofReply:0];
    [v12 setInterface:v30 forSelector:"deleteFiDOKeyFor:usingProxy:callback:" argumentIndex:1 ofReply:0];
    [v12 setInterface:v30 forSelector:"checkMultipleFidoKeyPresence:usingProxy:callback:" argumentIndex:1 ofReply:0];
    [v12 setInterface:v30 forSelector:"signMultipleWithFidoKeysFor:challenges:forEndpointIdentifiers:externalizedAuth:usingProxy:callback:" argumentIndex:4 ofReply:0];
    [v12 setInterface:v30 forSelector:"verifyWithFidoKeyFor:signedChallenge:usingProxy:callback:" argumentIndex:2 ofReply:0];
    [v12 setInterface:v30 forSelector:"getEndpointBindingAttestationRequestWithProxy:authorityIdentifier:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"preAuthorizeEndpointWithProxy:keyIdentifier:bindingAttestation:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"authorizeEndPointWithProxy:version:identifier:externalCA:instanceCA:endpointCertificate:encryptionKeyAttestation:bindingAttestation:bindingAttestationToken:confidentialDataOffset:confidentialDataLength:metaData:authorizationID:reply:" argumentIndex:0 ofReply:0];
    [v12 setInterface:v30 forSelector:"signPrecomputedWithSELegacyKey:keySlot:metaData:authorization:authorizationType:reply:" argumentIndex:0 ofReply:0];
    [(__CFString *)v5 setExportedInterface:v12];
    [(__CFString *)v5 setExportedObject:v33];
    [(__CFString *)v5 resume];

    id v31 = v38;
  }
  else
  {
    id v31 = SESDefaultLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v43 = @"application-identifier";
      __int16 v44 = 2112;
      id v45 = v7;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Missing or wrong type entitlement %@ : %@", buf, 0x16u);
    }
    BOOL v26 = 0;
  }

  return v26;
}

- (void)start
{
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting seserviced XPC server ", v4, 2u);
  }

  [(SESServer *)self resume];
}

- (void)onFirstUnlock
{
  v3 = [(SESServer *)self messageQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A2E4;
  block[3] = &unk_10040B880;
  void block[4] = self;
  dispatch_sync(v3, block);

  id v4 = +[DSK queue];
  dispatch_async(v4, &stru_10040D0F8);

  id v5 = [(SESServer *)self messageQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003A874;
  v6[3] = &unk_10040D1F0;
  v6[4] = self;
  +[SESProximityChip cacheProximityChipData:v5 completion:v6];
}

- (void)setSESServerDelegate:(id)a3
{
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (SESDatabase)database
{
  return (SESDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong((id *)&self->_sesServerDelegate, 0);
}

@end