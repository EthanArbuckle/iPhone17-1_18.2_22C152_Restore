@interface PKSecureElement
+ (BOOL)hardwareSupportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
+ (BOOL)hardwareSupportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 outError:(id *)a4;
+ (BOOL)hardwareSupportsExpressMode:(id)a3;
+ (BOOL)isInFailForward;
+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 byHardware:(BOOL *)a4;
+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 byHardware:(BOOL *)a4 outError:(id *)a5;
+ (BOOL)supportsExpressMode:(id)a3;
+ (BOOL)supportsExpressMode:(id)a3 byHardware:(BOOL *)a4;
+ (id)primarySecureElementIdentifier;
+ (id)secureElementIdentifiers;
+ (id)sharedSecureElement;
+ (id)signChallenge:(id)a3 signatureEntanglementMode:(unint64_t)a4 session:(id)a5 signatureInfo:(id *)a6 error:(id *)a7;
+ (void)accessSecureElementManagerSessionWithSessionExchangeToken:(id)a3 callbackQueue:(id)a4 handler:(id)a5;
+ (void)accessSecureElementManagerSessionWithSessionExchangeToken:(id)a3 handler:(id)a4;
- (BOOL)hasRegistrationInformation;
- (BOOL)isDeletingAllApplets;
- (BOOL)isInRestrictedMode;
- (BOOL)isOwnable;
- (BOOL)isProductionSigned;
- (BOOL)queueConnectionToServerForAppletIdentifiers:(id)a3;
- (BOOL)queueConnectionToServerWithPushTopic:(id)a3;
- (BOOL)setOwnerUserUUID:(id)a3 keybagUUID:(id)a4;
- (BOOL)setRegistrationInformation:(id)a3 primaryRegionTopic:(id)a4;
- (BOOL)supportsExpressModeForExpressPassType:(int64_t)a3;
- (NSArray)secureElementIdentifiers;
- (NSNumber)primaryJSBLSequenceCounter;
- (NSString)primaryRegionTopic;
- (NSString)primarySecureElementIdentifier;
- (PKSecureElement)init;
- (id)_allAppletsWithSession:(id)a3;
- (id)_appletsForAIDs:(id)a3 withSession:(id)a4;
- (id)secureElementSessionPostlude;
- (id)secureElementSessionPrelude;
- (unint64_t)ownershipStateForCurrentUser;
- (unint64_t)ownershipStateForUserUUID:(id)a3;
- (unint64_t)supportedTechnologies;
- (void)SEPPairingInfoWithCompletion:(id)a3;
- (void)_credentialsForAIDs:(id)a3 session:(id)a4 completion:(id)a5;
- (void)_executeSecureElementAsyncSessionHandlersWithSession:(id)a3 completion:(id)a4;
- (void)_executeSecureElementSessionHandlersWithPriority:(BOOL)a3 session:(id)a4;
- (void)_registerPairingChangeHandler;
- (void)_startSecureElementManagerSessionWithType:(int64_t)a3 handler:(id)a4;
- (void)_updateHardwareManagerListener;
- (void)accessAsyncSecureElementManagerSessionWithHandler:(id)a3;
- (void)accessPrioritySecureElementManagerSessionWithHandler:(id)a3;
- (void)accessSecureElementManagerSessionWithHandler:(id)a3;
- (void)allAppletsAndCredentialsWithCompletion:(id)a3;
- (void)allAppletsWithCompletion:(id)a3;
- (void)appletCredentialsForAIDs:(id)a3 completion:(id)a4;
- (void)appletWithIdentifier:(id)a3 completion:(id)a4;
- (void)areAnyAppletsSuspendedWithCompletionHandler:(id)a3;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)checkMultipleFidoKeyPresenceForFIDOProfiles:(id)a3 completion:(id)a4;
- (void)connectToServerWithPushTopic:(id)a3 completion:(id)a4;
- (void)connectToServerWithPushTopic:(id)a3 performSECleanup:(BOOL)a4 completion:(id)a5;
- (void)consistencyCheckDeviceCredentialsWithCompletion:(id)a3;
- (void)contactlessPaymentPassesAvailableDidChange;
- (void)createAliroHomeKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 homeIdentifier:(id)a5 withCompletion:(id)a6;
- (void)createAliroHydraKeyWithServerParameters:(id)a3 withCompletion:(id)a4;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)dealloc;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4;
- (void)generateTransactionKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 withCompletion:(id)a5;
- (void)hasLongTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 completion:(id)a4;
- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3;
- (void)initializeSecureElementQueuingServerConnection:(BOOL)a3 withCompletion:(id)a4;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)longTermPrivacyKeysForCredentialGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 completion:(id)a5;
- (void)markAllAppletsForDeletionWithExternalAuthorization:(id)a3 completion:(id)a4;
- (void)markAllAppletsForDeletionWithExternalAuthorization:(id)a3 obliterate:(BOOL)a4 completion:(id)a5;
- (void)markAppletWithIdentifierForDeletion:(id)a3 completion:(id)a4;
- (void)markAppletsWithIdentifiersForDeletion:(id)a3 completion:(id)a4;
- (void)pairingStateWithCompletion:(id)a3;
- (void)peerPaymentEnrollmentDataWithAlternateDSID:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)remoteAdminCleanupProgress:(double)a3;
- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4;
- (void)setSecureElementSessionPostlude:(id)a3;
- (void)setSecureElementSessionPrelude:(id)a3;
- (void)signChallenge:(id)a3 forPaymentApplication:(id)a4 withCompletion:(id)a5;
- (void)signChallenge:(id)a3 signatureEntanglementMode:(unint64_t)a4 completion:(id)a5;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)signatureForAuthToken:(id)a3 completion:(id)a4;
- (void)signedPlatformDataWithCompletion:(id)a3;
- (void)stateInformationWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)verifySignedChallenge:(id)a3 forRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7;
@end

@implementation PKSecureElement

+ (BOOL)isInFailForward
{
  if (qword_1EB402DA8 != -1) {
    dispatch_once(&qword_1EB402DA8, &__block_literal_global_350);
  }
  return _MergedGlobals_223;
}

- (PKSecureElement)init
{
  v25.receiver = self;
  v25.super_class = (Class)PKSecureElement;
  v2 = [(PKSecureElement *)&v25 init];
  if (v2)
  {
    if (PKSecureElementIsAvailable())
    {
      uint64_t v3 = [PKGetClassNFSecureElement() embeddedSecureElement];
      secureElement = v2->_secureElement;
      v2->_secureElement = (NFSecureElement *)v3;

      if (!v2->_secureElement)
      {
        v5 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "+[NFSecureElement embeddedSecureElement] returned nil.", v24, 2u);
        }
      }
    }
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessionAccessHandlers = v2->_sessionAccessHandlers;
    v2->_sessionAccessHandlers = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    prioritySessionAccessHandlers = v2->_prioritySessionAccessHandlers;
    v2->_prioritySessionAccessHandlers = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    asyncSessionAccessHandlers = v2->_asyncSessionAccessHandlers;
    v2->_asyncSessionAccessHandlers = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passkit.secureelement.session", v12);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v13;

    v2->_deletingAllAppletsPropertyLock._os_unfair_lock_opaque = 0;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passkit.secureelement.deletingallapplets.timer", v15);
    deletingAllAppletsTimerQueue = v2->_deletingAllAppletsTimerQueue;
    v2->_deletingAllAppletsTimerQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passkit.secureelement.reply", v18);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v21;

    v2->_observersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSArray)secureElementIdentifiers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PKSecureElement *)self primarySecureElementIdentifier];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSString)primarySecureElementIdentifier
{
  uint64_t v2 = [PKGetClassNFSecureElement() embeddedSecureElementSerialNumber];
  if (![v2 length]
    || (NFSecureElementSerialNumberToString(), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (PKSecureElementIsAvailable())
    {
      v4 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "+[NFSecureElement embeddedSecureElementSerialNumber] not available. Please file a radar.", v6, 2u);
      }
    }
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

+ (id)primarySecureElementIdentifier
{
  if (qword_1EB402DB8 != -1) {
    dispatch_once(&qword_1EB402DB8, &__block_literal_global_358);
  }
  uint64_t v2 = (void *)qword_1EB402DB0;
  return v2;
}

void __34__PKSecureElement_isInFailForward__block_invoke()
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  _MergedGlobals_223 = PKSimulateFailForward();
  if ((_MergedGlobals_223 & 1) == 0)
  {
    if (PKSecureElementIsAvailable())
    {
      v0 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    }
    else
    {
      v0 = 0;
    }
    id v22 = 0;
    v1 = [v0 secureElementsWithError:&v22];
    id v2 = v22;
    if (v2)
    {
      uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = [v2 description];
        *(_DWORD *)buf = 138543362;
        v24 = v4;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKSecureElement in fail forward: accessing secure elements failed with error: %{public}@", buf, 0xCu);
      }
      _MergedGlobals_223 = 1;
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v5 = v1;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v19 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "info", (void)v18);
            v11 = v10;
            if (v10)
            {
              int v12 = [v10 OSMode] == 2 ? 0 : objc_msgSend(v11, "restrictedMode") ^ 1;
              int v13 = [v11 jcopTooOld];
              int v14 = v13;
              if ((v12 & 1) != 0 || v13)
              {
                v15 = PKLogFacilityTypeGetObject(6uLL);
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  dispatch_queue_t v16 = @"NO";
                  if (v12) {
                    v17 = @"YES";
                  }
                  else {
                    v17 = @"NO";
                  }
                  if (v14) {
                    dispatch_queue_t v16 = @"YES";
                  }
                  *(_DWORD *)buf = 138543618;
                  v24 = v17;
                  __int16 v25 = 2114;
                  v26 = v16;
                  _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKSecureElement in fail forward: SENotAvailable: %{public}@, jcopTooOld: %{public}@", buf, 0x16u);
                }

                _MergedGlobals_223 = 1;
                goto LABEL_31;
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v27 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_31:
    }
  }
}

+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 byHardware:(BOOL *)a4 outError:(id *)a5
{
  BOOL result = [a1 hardwareSupportsExpressForAutomaticSelectionTechnologyType:a3 outError:a5];
  if (a4) {
    *a4 = result;
  }
  if (a3 == 3) {
    return 1;
  }
  return result;
}

+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 byHardware:(BOOL *)a4
{
  return [a1 supportsExpressForAutomaticSelectionTechnologyType:a3 byHardware:a4 outError:0];
}

+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return [a1 supportsExpressForAutomaticSelectionTechnologyType:a3 byHardware:0];
}

+ (BOOL)hardwareSupportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 outError:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  uint64_t v8 = v7;
  if (v7)
  {
    switch(a3)
    {
      case 1:
        uint64_t v21 = 0;
        v9 = (id *)&v21;
        v10 = &v21;
        uint64_t v11 = 4;
        break;
      case 2:
        uint64_t v20 = 0;
        v9 = (id *)&v20;
        v10 = &v20;
        uint64_t v11 = 2;
        break;
      case 3:
        uint64_t v19 = 0;
        v9 = (id *)&v19;
        v10 = &v19;
        uint64_t v11 = 8;
        break;
      case 4:
      case 5:
        uint64_t v18 = 0;
        v9 = (id *)&v18;
        v10 = &v18;
        uint64_t v11 = 32;
        break;
      case 6:
        uint64_t v17 = 0;
        v9 = (id *)&v17;
        v10 = &v17;
        uint64_t v11 = 512;
        break;
      case 7:
        uint64_t v16 = 0;
        v9 = (id *)&v16;
        v10 = &v16;
        uint64_t v11 = 1024;
        break;
      default:
        goto LABEL_4;
    }
    char v12 = objc_msgSend(v7, "areFeaturesSupported:outError:", v11, v10, v16, v17, v18, v19, v20, v21);
    id v13 = *v9;
    if (v13)
    {
      int v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        id v23 = a1;
        __int16 v24 = 2048;
        int64_t v25 = a3;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): failed to check if feature %lu was supported, error: %@", buf, 0x20u);
      }

      if (a4)
      {
        id v13 = v13;
        *a4 = v13;
      }
    }
  }
  else
  {
LABEL_4:
    char v12 = 0;
    id v13 = 0;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_registeredForHardwareUpdates) {
    SharedHardwareManagerEventListenerRemove(self);
  }
  uint64_t v3 = (void *)[(NSMutableArray *)self->_sessionAccessHandlers copy];
  [(NSMutableArray *)self->_sessionAccessHandlers removeAllObjects];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * i) + 16))();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  v9 = (void *)[(NSMutableArray *)self->_prioritySessionAccessHandlers copy];
  [(NSMutableArray *)self->_prioritySessionAccessHandlers removeAllObjects];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * j) + 16))();
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }

  v15 = (void *)[(NSMutableArray *)self->_asyncSessionAccessHandlers copy];
  [(NSMutableArray *)self->_asyncSessionAccessHandlers removeAllObjects];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * k) + 16))();
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  v21.receiver = self;
  v21.super_class = (Class)PKSecureElement;
  [(PKSecureElement *)&v21 dealloc];
}

+ (id)sharedSecureElement
{
  if (qword_1EB402DA0 != -1) {
    dispatch_once(&qword_1EB402DA0, &__block_literal_global_230);
  }
  id v2 = (void *)qword_1EB402D98;
  return v2;
}

void __38__PKSecureElement_sharedSecureElement__block_invoke()
{
  v0 = objc_alloc_init(PKSecureElement);
  v1 = (void *)qword_1EB402D98;
  qword_1EB402D98 = (uint64_t)v0;
}

+ (void)accessSecureElementManagerSessionWithSessionExchangeToken:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() accessSecureElementManagerSessionWithSessionExchangeToken:v6 callbackQueue:0 handler:v5];
}

+ (void)accessSecureElementManagerSessionWithSessionExchangeToken:(id)a3 callbackQueue:(id)a4 handler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v7)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke;
      aBlock[3] = &unk_1E56E3A20;
      id v22 = v9;
      uint64_t v11 = _Block_copy(aBlock);
      if (PKSecureElementIsAvailable())
      {
        uint64_t v12 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
      }
      else
      {
        uint64_t v12 = 0;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_235;
      v18[3] = &unk_1E56E3A48;
      id v19 = v8;
      id v20 = v11;
      id v13 = v11;
      int v14 = [v12 startSecureElementManagerSession:v18];
      PKGetClassNFSession();
      if (objc_opt_isKindOfClass())
      {
        if ([v14 isActive]) {
          goto LABEL_16;
        }
        uint64_t v15 = [v14 activateWithToken:v7];
        if (!v15) {
          goto LABEL_16;
        }
        id v16 = v15;
        uint64_t v17 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v24 = v16;
          _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Failed to activate session with exchange token %@", buf, 0xCu);
        }
      }
      else
      {
        id v16 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Session handle is not an NFSession object", buf, 2u);
        }
      }

      [v14 endSession];
LABEL_16:

      goto LABEL_17;
    }
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
LABEL_17:
}

void __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = v5;
  if (v5)
  {
    BOOL v4 = [v5 state] == 2;
    uint64_t v3 = v5;
    if (!v4)
    {
      [v5 endSessionWithCompletion:&__block_literal_global_233];
      uint64_t v3 = v5;
    }
  }
}

void __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_2()
{
  v0 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190E10000, v0, OS_LOG_TYPE_DEFAULT, "PKSecureElement: ended secure element manager session.", v1, 2u);
  }
}

void __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_235(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement: startSecureElementManagerSession finished, error: %@", buf, 0xCu);
  }

  if (v6)
  {

    id v5 = 0;
  }
  id v8 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_236;
    v9[3] = &unk_1E56D83D8;
    id v11 = *(id *)(a1 + 40);
    id v10 = v5;
    dispatch_async(v8, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)accessSecureElementManagerSessionWithHandler:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKSecureElement_accessSecureElementManagerSessionWithHandler___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

void __64__PKSecureElement_accessSecureElementManagerSessionWithHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  [v1 _startSecureElementManagerSessionWithType:0 handler:v2];
}

- (void)accessPrioritySecureElementManagerSessionWithHandler:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKSecureElement_accessPrioritySecureElementManagerSessionWithHandler___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

void __72__PKSecureElement_accessPrioritySecureElementManagerSessionWithHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  [v1 _startSecureElementManagerSessionWithType:1 handler:v2];
}

- (void)accessAsyncSecureElementManagerSessionWithHandler:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKSecureElement_accessAsyncSecureElementManagerSessionWithHandler___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

void __69__PKSecureElement_accessAsyncSecureElementManagerSessionWithHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  [v1 _startSecureElementManagerSessionWithType:2 handler:v2];
}

- (void)_startSecureElementManagerSessionWithType:(int64_t)a3 handler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (!v6) {
    goto LABEL_26;
  }
  if (a3 == 2)
  {
    p_startingAsyncSession = &self->_startingAsyncSession;
    asyncSessionAccessHandlers = self->_asyncSessionAccessHandlers;
  }
  else if (a3 == 1)
  {
    p_startingAsyncSession = &self->_startingPrioritySession;
    asyncSessionAccessHandlers = self->_prioritySessionAccessHandlers;
  }
  else
  {
    if (a3)
    {
      p_startingAsyncSession = 0;
      goto LABEL_10;
    }
    p_startingAsyncSession = &self->_startingSession;
    asyncSessionAccessHandlers = self->_sessionAccessHandlers;
  }
  id v10 = _Block_copy(v6);
  [(NSMutableArray *)asyncSessionAccessHandlers addObject:v10];

LABEL_10:
  if (*p_startingAsyncSession)
  {
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      long long v31 = self;
      __int16 v32 = 2048;
      int64_t v33 = a3;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): session of type %ld is already starting - coalescing.", buf, 0x16u);
    }
  }
  else
  {
    int64_t sessionCounter = self->_sessionCounter;
    self->_int64_t sessionCounter = sessionCounter + 1;
    id v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      long long v31 = self;
      __int16 v32 = 2048;
      int64_t v33 = sessionCounter;
      __int16 v34 = 2048;
      int64_t v35 = a3;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu): starting session with type %ld.", buf, 0x20u);
    }

    BOOL *p_startingAsyncSession = 1;
    secureElementSessionPrelude = (void (**)(void))self->_secureElementSessionPrelude;
    if (secureElementSessionPrelude) {
      secureElementSessionPrelude[2]();
    }
    uint64_t v15 = (void *)[self->_secureElementSessionPostlude copy];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke;
    aBlock[3] = &unk_1E56E3A70;
    char v29 = sessionCounter;
    void aBlock[4] = self;
    id v28 = v15;
    id v11 = v15;
    id v16 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_240;
    v23[3] = &unk_1E56E3AC0;
    id v24 = v16;
    int64_t v25 = a3;
    char v26 = sessionCounter;
    v23[4] = self;
    id v17 = v16;
    uint64_t v18 = _Block_copy(v23);
    kdebug_trace();
    if (PKSecureElementIsAvailable()
      && ([PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI],
          (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v20 = v19;
      if (a3 == 1) {
        id v21 = (id)[v19 startSecureElementManagerSessionWithPriority:v18];
      }
      else {
        id v22 = (id)[v19 startSecureElementManagerSession:v18];
      }
    }
    else
    {
      (*((void (**)(void *, void, void))v18 + 2))(v18, 0, 0);
    }
  }
LABEL_26:
}

void __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 134218496;
      uint64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      id v19 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu:session/%p): ending session.", buf, 0x20u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_238;
    v10[3] = &unk_1E56D8630;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = v7;
    v10[4] = v8;
    char v13 = *(unsigned char *)(a1 + 48);
    id v11 = v3;
    [v11 endSessionWithCompletion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(void))(v9 + 16))();
      kdebug_trace();
    }
  }
}

uint64_t __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_238(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218496;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu:session/%p): ended session.", (uint8_t *)&v8, 0x20u);
  }

  return kdebug_trace();
}

void __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_240(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_2;
  v12[3] = &unk_1E56E3A98;
  v12[4] = v7;
  id v13 = v6;
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  id v14 = v5;
  char v17 = *(unsigned char *)(a1 + 56);
  id v15 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = (unsigned char *)(v2 + *(void *)(a1 + 32) + 73);
  }
  if (!*v3) {
    __break(1u);
  }
  *id v3 = 0;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
LABEL_6:
    uint64_t v5 = [v4 code];
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 == 12)
    {
      if (v7)
      {
        uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        uint64_t v25 = v9;
        __int16 v26 = 2048;
        uint64_t v27 = v8;
        __int16 v28 = 2112;
        char v29 = v10;
        id v11 = "PKSecureElement (%p:%lu): failed to start session: %@. SE sessions can only be started from Wallet while i"
              "t is active. It is preferred to start an SE session from passd.";
LABEL_11:
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v11, buf, 0x20u);
      }
    }
    else if (v7)
    {
      uint64_t v12 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      char v29 = v14;
      id v11 = "PKSecureElement (%p:%lu): failed to start session: %@.";
      goto LABEL_11;
    }
    id v15 = 0;
    goto LABEL_13;
  }
  id v18 = *(id *)(a1 + 48);
  if (!v18)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    goto LABEL_6;
  }
  id v15 = v18;
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(unsigned __int8 *)(a1 + 72);
    *(_DWORD *)buf = 134218496;
    uint64_t v25 = v19;
    __int16 v26 = 2048;
    uint64_t v27 = v20;
    __int16 v28 = 2048;
    char v29 = v15;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu:session/%p): started session.", buf, 0x20u);
  }
LABEL_13:

  uint64_t v16 = *(void *)(a1 + 64);
  char v17 = *(void **)(a1 + 32);
  if (v16 == 2)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_241;
    v21[3] = &unk_1E56D83D8;
    id v23 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 48);
    [v17 _executeSecureElementAsyncSessionHandlersWithSession:v15 completion:v21];
  }
  else
  {
    [*(id *)(a1 + 32) _executeSecureElementSessionHandlersWithPriority:v16 == 1 session:v15];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_241(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_executeSecureElementSessionHandlersWithPriority:(BOOL)a3 session:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4) {
    uint64_t v7 = 88;
  }
  else {
    uint64_t v7 = 80;
  }
  uint64_t v8 = (void *)[*(id *)((char *)&self->super.isa + v7) copy];
  [*(id *)((char *)&self->super.isa + v7) removeAllObjects];
  uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    id v23 = self;
    __int16 v24 = 2048;
    id v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = [v8 count];
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): starting to execute %lu session handlers.", buf, 0x20u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          id v23 = self;
          __int16 v24 = 2048;
          id v25 = v6;
          __int16 v26 = 2048;
          uint64_t v27 = v13 + i;
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): executing session handler %lu.", buf, 0x20u);
        }

        (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      v13 += i;
    }
    while (v12);
  }
}

- (void)_executeSecureElementAsyncSessionHandlersWithSession:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v19 = a4;
  id v6 = (void *)[(NSMutableArray *)self->_asyncSessionAccessHandlers copy];
  [(NSMutableArray *)self->_asyncSessionAccessHandlers removeAllObjects];
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    __int16 v34 = self;
    __int16 v35 = 2048;
    id v36 = v21;
    __int16 v37 = 2048;
    uint64_t v38 = [v6 count];
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): starting to execute %lu async session handlers.", buf, 0x20u);
  }

  uint64_t v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke;
        v24[3] = &unk_1E56E3AE8;
        v24[4] = self;
        id v15 = v21;
        uint64_t v26 = v14;
        uint64_t v27 = v11 + v13;
        id v25 = v15;
        [(PKAsyncUnaryOperationComposer *)v8 addOperation:v24];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      v11 += v13;
    }
    while (v10);
  }

  uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_2;
  v22[3] = &unk_1E56E3B10;
  id v23 = v19;
  id v17 = v19;
  id v18 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v16 completion:v22];
}

void __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[7];
    *(_DWORD *)buf = 134218496;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): executing async session handler %lu.", buf, 0x20u);
  }

  uint64_t v14 = a1 + 5;
  uint64_t v12 = a1[5];
  uint64_t v13 = v14[1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_243;
  v18[3] = &unk_1E56D83D8;
  id v19 = v6;
  id v20 = v7;
  id v15 = *(void (**)(uint64_t, uint64_t, void *))(v13 + 16);
  id v16 = v6;
  id v17 = v7;
  v15(v13, v12, v18);
}

uint64_t __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_243(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)contactlessPaymentPassesAvailableDidChange
{
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Contactless Payment passes available did change", v4, 2u);
  }

  os_unfair_lock_lock(&self->_observersLock);
  [(PKSecureElement *)self _updateHardwareManagerListener];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)_updateHardwareManagerListener
{
  NSUInteger v3 = [(NSHashTable *)self->_observers count];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PKSecureElement__updateHardwareManagerListener__block_invoke;
  v5[3] = &unk_1E56DE608;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(sessionQueue, v5);
}

void __49__PKSecureElement__updateHardwareManagerListener__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void *)(a1 + 40) && PDContactlessPaymentPassesAvailable() && PKSecureElementIsAvailable() != 0;
  NSUInteger v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 116);
    LODWORD(v8) = 67109376;
    HIDWORD(v8) = v4;
    LOWORD(v9) = 1024;
    *(_DWORD *)((char *)&v9 + 2) = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Updating hardware listener from %d to %d", (uint8_t *)&v8, 0xEu);
  }

  uint64_t v5 = *(unsigned char **)(a1 + 32);
  if (((v2 ^ (v5[116] == 0)) & 1) == 0)
  {
    if (v2)
    {
      id v6 = v5;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      uint64_t v10 = __SharedHardwareManagerEventListenerAdd_block_invoke;
      uint64_t v11 = &unk_1E56E4000;
      id v12 = v6;
      id v7 = v6;
      _SharedHardwareManagerEventListenerAccess(1, &v8);
    }
    else
    {
      SharedHardwareManagerEventListenerRemove(v5);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 116) = v2;
  }
}

- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  BOOL v4 = a4;
  replyQueue = self->_replyQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __57__PKSecureElement_secureElement_didChangeRestrictedMode___block_invoke;
  v6[3] = &unk_1E56D8B80;
  v6[4] = self;
  BOOL v7 = a4;
  dispatch_async(replyQueue, v6);
  if (v4) {
    AnalyticsSendEvent();
  }
}

void __57__PKSecureElement_secureElement_didChangeRestrictedMode___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 104) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  if (*(unsigned char *)(a1 + 40))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v8 secureElementDidEnterRestrictedMode:*(void *)(a1 + 32)];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v2;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "secureElementDidLeaveRestrictedMode:", *(void *)(a1 + 32), (void)v15);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v11);
    }
  }
}

- (void)remoteAdminCleanupProgress:(double)a3
{
  replyQueue = self->_replyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PKSecureElement_remoteAdminCleanupProgress___block_invoke;
  v4[3] = &unk_1E56DE608;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(replyQueue, v4);
}

void __46__PKSecureElement_remoteAdminCleanupProgress___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 104) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 secureElement:*(void *)(a1 + 32) deletionOfAppletsDidUpdateToProgress:*(double *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  if (*(double *)(a1 + 40) >= 1.0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Successfully deleted all applets, unregistering applet event listeners", buf, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    uint64_t v10 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
    [v10 unregisterEventListener:*(void *)(a1 + 32)];

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(NSObject **)(v11 + 16);
    if (v12)
    {
      dispatch_source_cancel(v12);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 16);
      *(void *)(v13 + 16) = 0;

      uint64_t v11 = *(void *)(a1 + 32);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 32));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v3;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v21 + 1) + 8 * v19);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v20, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(void *)(a1 + 32), 1, (void)v21);
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v17);
    }
  }
}

- (void)initializeSecureElementQueuingServerConnection:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (PKSecureElementIsAvailable())
  {
    uint64_t v7 = self->_replyQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke;
    v9[3] = &unk_1E56E3B38;
    BOOL v12 = a3;
    uint64_t v10 = v7;
    id v11 = v6;
    uint64_t v8 = v7;
    [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v9];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

void __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v13 = 0;
    id v14 = 0;
    LOBYTE(v6) = 0;
    goto LABEL_16;
  }
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  id v27 = 0;
  int v6 = [v3 deleteAllApplets:v5 error:&v27];
  id v7 = v27;
  uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Secure Element pairing succeeded.";
    id v11 = v8;
    uint32_t v12 = 2;
  }
  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    id v29 = v7;
    uint64_t v10 = "Failed initializing the Secure Element pairing. Error: %@";
    id v11 = v8;
    uint32_t v12 = 12;
  }
  _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_9:

  id v25 = 0;
  id v26 = 0;
  id v24 = v7;
  int v15 = [v4 getCryptogram:&v26 challengeResponse:&v25 error:&v24];
  id v14 = v26;
  id v13 = v25;
  id v16 = v24;

  if (!v15 || !v13 || !v14)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v16;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Could not fetch cryptogam and challenge. Error: %@", buf, 0xCu);
    }
  }
LABEL_16:
  uint64_t v17 = *(void **)(a1 + 40);
  if (v17)
  {
    uint64_t v18 = *(NSObject **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke_255;
    v19[3] = &unk_1E56D8630;
    id v22 = v17;
    char v23 = v6;
    id v20 = v14;
    id v21 = v13;
    dispatch_async(v18, v19);
  }
}

uint64_t __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke;
  v6[3] = &unk_1E56DE048;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKSecureElement *)self pairingStateWithCompletion:v6];
}

void __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 3)
  {
    if (a2 == 2)
    {
      int v5 = 1;
    }
    else
    {
      if (!a2) {
        goto LABEL_4;
      }
      int v5 = 0;
    }
    if (![*(id *)(a1 + 32) isOwnable]
      || ((unint64_t v6 = [*(id *)(a1 + 32) ownershipStateForCurrentUser], v6 <= 4)
        ? (BOOL v7 = ((1 << v6) & 0x16) == 0)
        : (BOOL v7 = 1),
          !v7))
    {
      if (v5)
      {
        uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Initializing Secure Element...", buf, 2u);
        }

        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_256;
        v14[3] = &unk_1E56D8D00;
        BOOL v9 = *(void **)(a1 + 32);
        id v15 = *(id *)(a1 + 40);
        [v9 initializeSecureElementQueuingServerConnection:1 withCompletion:v14];
        uint64_t v10 = v15;
        goto LABEL_21;
      }
LABEL_20:
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_2;
      v12[3] = &unk_1E56D8D00;
      id v11 = *(void **)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      [v11 SEPPairingInfoWithCompletion:v12];
      uint64_t v10 = v13;
LABEL_21:

      return;
    }
    if (!v5) {
      goto LABEL_20;
    }
  }
LABEL_4:
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
}

uint64_t __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_256(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)SEPPairingInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (PKSecureElementIsAvailable())
  {
    int v5 = self->_replyQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke;
    v9[3] = &unk_1E56E3B60;
    uint64_t v10 = v5;
    id v11 = v4;
    unint64_t v6 = v5;
    [(PKSecureElement *)self accessPrioritySecureElementManagerSessionWithHandler:v9];
  }
  else
  {
    BOOL v7 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "Secure element not available", v8, 2u);
    }

    if (v4) {
      (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
    }
  }
}

void __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v18 = 0;
    id v19 = 0;
    int v5 = [v3 getCryptogram:&v19 challengeResponse:&v18];
    id v6 = v19;
    id v7 = v18;
    uint64_t v8 = v7;
    if (v5 && v7 && v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      BOOL v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: Could not fetch cryptogam and challenge.", buf, 2u);
      }
    }
  }
  else
  {
    id v6 = 0;
    uint64_t v8 = 0;
    LOBYTE(v5) = 0;
  }
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke_259;
    v12[3] = &unk_1E56D8630;
    id v15 = v10;
    char v16 = v5;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(v11, v12);
  }
}

uint64_t __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)pairingStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (PKSecureElementIsAvailable())
    {
      int v5 = self->_replyQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__PKSecureElement_pairingStateWithCompletion___block_invoke;
      v7[3] = &unk_1E56E3B60;
      uint64_t v8 = v5;
      id v9 = v4;
      id v6 = v5;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v7];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __46__PKSecureElement_pairingStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v10 = 0;
    int v3 = [a2 validateSEPairings:&v10];
    uint64_t v4 = 3;
    if (v3 != 24) {
      uint64_t v4 = v3 == 0;
    }
    if (v3 == 27) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PKSecureElement_pairingStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E56DC4C0;
  id v6 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = v5;
  dispatch_async(v6, block);
}

uint64_t __46__PKSecureElement_pairingStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)hasRegistrationInformation
{
  BOOL v2 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  int v3 = [v2 registrationInfo];
  uint64_t v4 = [v3 allKeys];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)setRegistrationInformation:(id)a3 primaryRegionTopic:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  char v8 = [v7 setRegistrationInfo:v5 primaryRegionTopic:v6];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to set Secure Element Registration Info: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8;
}

- (id)_allAppletsWithSession:(id)a3
{
  if (a3)
  {
    int v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = [v3 array];
    id v6 = [v4 allApplets];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__PKSecureElement__allAppletsWithSession___block_invoke;
    v10[3] = &unk_1E56E3B88;
    id v7 = v5;
    id v11 = v7;
    [v6 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    id v7 = 0;
  }
  char v8 = (void *)[v7 copy];

  return v8;
}

void __42__PKSecureElement__allAppletsWithSession___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 managedBySP] & 1) == 0)
  {
    int v3 = +[PKSecureElementApplet secureElementAppletWithInternalApplet:v4];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)_appletsForAIDs:(id)a3 withSession:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(v6, "appletWithIdentifier:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          if (v13)
          {
            id v14 = +[PKSecureElementApplet secureElementAppletWithInternalApplet:v13];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = 0;
  }
  id v15 = objc_msgSend(v7, "copy", (void)v17);

  return v15;
}

- (void)allAppletsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_initWeak(&location, self);
      id v5 = self->_replyQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __44__PKSecureElement_allAppletsWithCompletion___block_invoke;
      v7[3] = &unk_1E56E3BB0;
      objc_copyWeak(&v10, &location);
      id v6 = v5;
      id v8 = v6;
      id v9 = v4;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v7];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __44__PKSecureElement_allAppletsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  int v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _allAppletsWithSession:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PKSecureElement_allAppletsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D83D8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v11 = v6;
  id v12 = v8;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __44__PKSecureElement_allAppletsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)allAppletsAndCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void (**)(void, void, void))v4;
    if (PKSecureElementIsAvailable())
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke;
      v6[3] = &unk_1E56E3C00;
      v6[4] = self;
      id v7 = v5;
      [(PKSecureElement *)self accessAsyncSecureElementManagerSessionWithHandler:v6];
    }
    else
    {
      v5[2](v5, 0, 0);
    }
  }
  else
  {
    __break(1u);
  }
}

void __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    id v19 = v5;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): starting to asynchronously fetch all applets and credentials.", buf, 0x16u);
  }

  if (v5)
  {
    id v9 = [*(id *)(a1 + 32) _allAppletsWithSession:v5];
    id v10 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke_262;
    v12[3] = &unk_1E56E3BD8;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    id v13 = v9;
    id v11 = v9;
    [v10 _credentialsForAIDs:0 session:v5 completion:v12];
  }
  else
  {
    v6[2](v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke_262(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v8 = a2;
  v4(v3);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[4];
  if ([v8 count]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

- (void)appletCredentialsForAIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void (**)(void, void, void))v7;
    uint64_t v9 = [v6 count];
    if (PKSecureElementIsAvailable() && v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke;
      v10[3] = &unk_1E56E3C50;
      void v10[4] = self;
      uint64_t v13 = v9;
      id v12 = v8;
      id v11 = v6;
      [(PKSecureElement *)self accessAsyncSecureElementManagerSessionWithHandler:v10];
    }
    else
    {
      v8[2](v8, 0, 0);
    }
  }
  else
  {
    __break(1u);
  }
}

void __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    id v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): starting to asynchronously fetch applets and credentials for %lu applets.", buf, 0x20u);
  }

  if (v5)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke_266;
    v14[3] = &unk_1E56E3C28;
    id v15 = v6;
    id v16 = *(id *)(a1 + 48);
    [v10 _credentialsForAIDs:v11 session:v5 completion:v14];

    id v12 = v15;
  }
  else
  {
    v6[2](v6);
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v12);
  }
}

void __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v7 = a2;
  v4(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  if ([v7 count]) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v6, 0);
}

- (void)_credentialsForAIDs:(id)a3 session:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_group_create();
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = (void *)&unk_191661000;
  if (v8)
  {
    uint64_t v13 = objc_alloc_init(PKDAManager);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v22 = self;
    obuint64_t j = [(PKSecureElement *)self secureElementIdentifiers];
    uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          dispatch_group_enter(v10);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke;
          v28[3] = &unk_1E56E3C78;
          id v29 = v24;
          id v30 = v11;
          long long v31 = v10;
          [(PKDAManager *)v13 listCredentialsWithSession:v8 seid:v18 completion:v28];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }

    self = v22;
    id v12 = &unk_191661000;
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = v12[259];
  block[2] = __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke_2;
  block[3] = &unk_1E56D83D8;
  id v26 = v11;
  id v27 = v9;
  id v20 = v11;
  id v21 = v9;
  dispatch_group_notify(v10, replyQueue, block);
}

void __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 appletIdentifier];
        id v10 = (void *)v9;
        if (v9) {
          id v11 = (__CFString *)v9;
        }
        else {
          id v11 = @"A000000809434343444B417631";
        }
        id v12 = v11;

        uint64_t v13 = *(void **)(a1 + 32);
        if (!v13 || [v13 containsObject:v12])
        {
          id v14 = [*(id *)(a1 + 40) objectForKey:v12];
          if (!v14)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [*(id *)(a1 + 40) setObject:v14 forKey:v12];
          }
          [v14 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if ([*(id *)(a1 + 32) count]) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)consistencyCheckDeviceCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void (**)(void, void))v4;
    if (PKSecureElementIsAvailable())
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke;
      v6[3] = &unk_1E56E3C00;
      v6[4] = self;
      id v7 = v5;
      [(PKSecureElement *)self accessAsyncSecureElementManagerSessionWithHandler:v6];
    }
    else
    {
      v5[2](v5, 0);
    }
  }
  else
  {
    __break(1u);
  }
}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218240;
    uint64_t v52 = v8;
    __int16 v53 = 2048;
    id v54 = v5;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:session/%p): starting to asynchronously fetch all applets and credentials for consistency check.", buf, 0x16u);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v10 = (void *)&unk_191661000;
  if (v5)
  {
    id v30 = v5;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = [*(id *)(a1 + 32) _allAppletsWithSession:v5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = +[PKSEConsistencyCheckDeviceCredential deviceCredentialWithApplet:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          [v9 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v13);
    }

    long long v17 = objc_alloc_init(PKDAManager);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v18 = [*(id *)(a1 + 32) secureElementIdentifiers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_270;
          v36[3] = &unk_1E56E3CC8;
          uint64_t v37 = v17;
          id v38 = v30;
          uint64_t v39 = v23;
          id v40 = v9;
          [(PKAsyncUnaryOperationComposer *)v31 addOperation:v36];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v20);
    }

    id v5 = v30;
    id v10 = &unk_191661000;
  }
  id v24 = [MEMORY[0x1E4F1CA98] null];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = v10[259];
  v32[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_3;
  v32[3] = &unk_1E56E3CF0;
  uint64_t v25 = *(void *)(a1 + 32);
  id v26 = *(void **)(a1 + 40);
  id v34 = v6;
  v32[4] = v25;
  id v35 = v26;
  id v33 = v9;
  id v27 = v9;
  id v28 = v6;
  id v29 = [(PKAsyncUnaryOperationComposer *)v31 evaluateWithInput:v24 completion:v32];
}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_270(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_2;
  v14[3] = &unk_1E56E3CA0;
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v16 = v6;
  id v17 = v7;
  id v15 = v11;
  id v12 = v6;
  id v13 = v7;
  [v8 listDACredentialsWithSession:v9 seid:v10 completion:v14];
}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = +[PKSEConsistencyCheckDeviceCredential deviceCredentialWithDAKeyInformation:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_4;
  v3[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if ([*(id *)(a1 + 32) count]) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)appletWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (PKMockOsloSecureElementAuth())
    {
      uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement appletWithIdentifier: mocking applet from SE", buf, 2u);
      }

      uint64_t v9 = [PKSecureElementApplet alloc];
      long long v10 = [MEMORY[0x1E4F29128] UUID];
      long long v11 = [v10 UUIDString];
      long long v12 = [MEMORY[0x1E4F29128] UUID];
      long long v13 = [v12 UUIDString];
      uint64_t v14 = [(PKSecureElementApplet *)v9 initWithIdentifier:v11 packageIdentifier:v13 lifecycleState:15 locked:0 containsSubKeys:0];

      v7[2](v7, v14);
    }
    else if (PKSecureElementIsAvailable())
    {
      uint64_t v15 = self->_replyQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__PKSecureElement_appletWithIdentifier_completion___block_invoke;
      v17[3] = &unk_1E56E3EC0;
      id v18 = v6;
      uint64_t v19 = v15;
      uint64_t v20 = v7;
      id v16 = v15;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v17];
    }
    else
    {
      v7[2](v7, 0);
    }
  }
}

void __51__PKSecureElement_appletWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a2 appletWithIdentifier:*(void *)(a1 + 32)];
    if (v3)
    {
      id v4 = +[PKSecureElementApplet secureElementAppletWithInternalApplet:v3];
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v6;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElement appletWithIdentifier: failed to get NFApplet for identifier: %@ from NearField.", buf, 0xCu);
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PKSecureElement_appletWithIdentifier_completion___block_invoke_272;
  v10[3] = &unk_1E56D83D8;
  uint64_t v7 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v11 = v4;
  id v12 = v8;
  id v9 = v4;
  dispatch_async(v7, v10);
}

uint64_t __51__PKSecureElement_appletWithIdentifier_completion___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)areAnyAppletsSuspendedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E56E3B60;
    v6[4] = self;
    id v7 = v4;
    [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v6];
  }
}

void __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [*(id *)(a1 + 32) secureElementIdentifiers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = SESEndPointListContainers();
          id v10 = 0;
          if (v10)
          {
            id v11 = v10;
          }
          else
          {
            char v12 = objc_msgSend(v9, "pk_containsObjectPassingTest:", &__block_literal_global_275);

            if (v12)
            {
              int v13 = 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v4 = [*(id *)(a1 + 32) _allAppletsWithSession:v3];
    int v13 = objc_msgSend(v4, "pk_containsObjectPassingTest:", &__block_literal_global_278);
LABEL_15:

    uint64_t v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = @"N";
      if (v13) {
        id v16 = @"Y";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v16;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKSecureElement areAnyAppletsSuspendedWithCompletionHandler returning %@", buf, 0xCu);
    }

    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v14();
}

uint64_t __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSuspended];
}

uint64_t __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isLocked];
}

- (void)markAllAppletsForDeletionWithExternalAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_completion___block_invoke;
  v8[3] = &unk_1E56D8ED8;
  id v9 = v6;
  id v7 = v6;
  [(PKSecureElement *)self markAllAppletsForDeletionWithExternalAuthorization:a3 obliterate:1 completion:v8];
}

uint64_t __81__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)markAllAppletsForDeletionWithExternalAuthorization:(id)a3 obliterate:(BOOL)a4 completion:(id)a5
{
  id v7 = (void (**)(id, uint64_t))a5;
  if (PKSecureElementIsAvailable())
  {
    if ([(PKSecureElement *)self isDeletingAllApplets])
    {
      if (v7) {
        v7[2](v7, 1);
      }
    }
    else
    {
      id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke;
      v10[3] = &unk_1E56E3D80;
      BOOL v12 = a4;
      void v10[4] = self;
      id v11 = v7;
      id v9 = (id)[v8 startSecureElementManagerSession:v10];
    }
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    id v8 = [v5 allApplets];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2;
    v53[3] = &unk_1E56E3D58;
    v53[4] = &buf;
    [v8 enumerateObjectsUsingBlock:v53];

    if (*(void *)(*((void *)&buf + 1) + 24))
    {
      if (*(unsigned char *)(a1 + 48))
      {
        id v52 = 0;
        int v9 = [v5 deleteAllApplets:1 error:&v52];
        id v10 = v52;
        if (v9)
        {
          id v11 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v54 = 0;
            BOOL v12 = "All Applets marked for delete and server connection queued.";
LABEL_17:
            _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v12, v54, 2u);
            goto LABEL_18;
          }
          goto LABEL_18;
        }
      }
      else
      {
        id v51 = 0;
        [v5 deleteAllAppletsOfType:4 queueConnection:1 error:&v51];
        id v10 = v51;
      }
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v54 = 138412290;
        id v55 = v10;
        long long v18 = "Failed to mark all Applets for deletion. Error: %@";
LABEL_25:
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v18, v54, 0xCu);
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v54 = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "No Applets exist to mark for delete. Ensuring non applet SE data is removed.", v54, 2u);
      }

      if (*(unsigned char *)(a1 + 48))
      {
        id v50 = 0;
        int v17 = [v5 deleteAllApplets:0 error:&v50];
        id v10 = v50;
        if (v17)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v54 = 0;
            BOOL v12 = "All SE data removed.";
            goto LABEL_17;
          }
LABEL_18:
          uint64_t v16 = 1;
LABEL_27:

          uint64_t v19 = *(void *)(*((void *)&buf + 1) + 24);
          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
          uint64_t v20 = *(void *)(a1 + 32);
          if (v19)
          {
            *(unsigned char *)(v20 + 8) = 1;
            uint64_t v21 = PKLogFacilityTypeGetObject(6uLL);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v54 = 0;
              _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Beginning to delete applets; registering for updates",
                v54,
                2u);
            }

            uint64_t v22 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
            [v22 registerEventListener:*(void *)(a1 + 32)];

            uint64_t v23 = *(void *)(a1 + 32);
            uint64_t v24 = *(NSObject **)(v23 + 16);
            if (v24)
            {
              dispatch_source_cancel(v24);
              uint64_t v25 = *(void *)(a1 + 32);
              id v26 = *(void **)(v25 + 16);
              *(void *)(v25 + 16) = 0;

              uint64_t v23 = *(void *)(a1 + 32);
            }
            uint64_t v27 = *(void *)(*((void *)&buf + 1) + 24);
            dispatch_source_t v28 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v23 + 24));
            uint64_t v29 = *(void *)(a1 + 32);
            id v30 = *(void **)(v29 + 16);
            *(void *)(v29 + 16) = v28;

            double v31 = (double)(unint64_t)(60 * v27 + 30);
            long long v32 = v28;
            id v33 = *(NSObject **)(*(void *)(a1 + 32) + 16);
            dispatch_time_t v34 = dispatch_time(0, (uint64_t)(v31 * 1000000000.0));
            dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
            uint64_t v35 = *(void *)(a1 + 32);
            id v36 = *(NSObject **)(v35 + 16);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_286;
            handler[3] = &unk_1E56D8A90;
            handler[4] = v35;
            long long v48 = v32;
            uint64_t v37 = v32;
            dispatch_source_set_event_handler(v36, handler);
            dispatch_resume(v37);
            os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
          }
          else
          {
            id v38 = *(NSObject **)(v20 + 16);
            if (v38)
            {
              dispatch_source_cancel(v38);
              uint64_t v39 = *(void *)(a1 + 32);
              id v40 = *(void **)(v39 + 16);
              *(void *)(v39 + 16) = 0;

              uint64_t v20 = *(void *)(a1 + 32);
            }
            os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 32));
            uint64_t v41 = *(void *)(a1 + 32);
            long long v42 = *(NSObject **)(v41 + 40);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2_288;
            block[3] = &unk_1E56D8B80;
            void block[4] = v41;
            char v46 = v16;
            dispatch_async(v42, block);
          }
          [v5 endSession];

          _Block_object_dispose(&buf, 8);
          goto LABEL_37;
        }
      }
      else
      {
        id v49 = 0;
        [v5 deleteAllAppletsOfType:4 queueConnection:0 error:&v49];
        id v10 = v49;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v54 = 138412290;
        id v55 = v10;
        long long v18 = "Failed to remove all SE data. Error: %@";
        goto LABEL_25;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  int v13 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Secure Element Session Error: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(NSObject **)(v14 + 40);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_289;
  v44[3] = &unk_1E56D8AE0;
  v44[4] = v14;
  dispatch_async(v15, v44);
  uint64_t v16 = 0;
LABEL_37:
  uint64_t v43 = *(void *)(a1 + 40);
  if (v43) {
    (*(void (**)(uint64_t, uint64_t))(v43 + 16))(v43, v16);
  }
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 managedBySP] & 1) == 0)
  {
    int v3 = [v4 lifecycleState];
    if (([v4 isGPLocked] & 1) != 0 || (v3 - 129) < 2 || v3 == 15) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_286(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Server deletion payment applications timed out.", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  int v3 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  [v3 unregisterEventListener:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  if (v5 == *(void **)(v4 + 16))
  {
    *(void *)(v4 + 16) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_287;
  block[3] = &unk_1E56D8AE0;
  void block[4] = v6;
  dispatch_async(v7, block);
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_287(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(void *)(a1 + 32), 0, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2_288(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (*(unsigned char *)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidUpdateToProgress:", *(void *)(a1 + 32), 1.0, (void)v9);
        }
        if (objc_opt_respondsToSelector()) {
          [v8 secureElement:*(void *)(a1 + 32) deletionOfAppletsDidFinishWithSuccess:*(unsigned __int8 *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_289(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(void *)(a1 + 32), 0, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)markAppletWithIdentifierForDeletion:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PKSecureElement markAppletsWithIdentifiersForDeletion:completion:](self, "markAppletsWithIdentifiersForDeletion:completion:", v9, v7, v10, v11);
}

- (void)markAppletsWithIdentifiersForDeletion:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): deleting applets %@.", buf, 0x16u);
  }

  long long v9 = self->_replyQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke;
  v13[3] = &unk_1E56E3E48;
  id v14 = v6;
  uint64_t v15 = self;
  uint64_t v16 = v9;
  id v17 = v7;
  id v10 = v9;
  id v11 = v7;
  id v12 = v6;
  [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v13];
}

void __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = (void *)a1[2].i64[0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_2;
    v27[3] = &unk_1E56E3DA8;
    id v6 = v3;
    id v28 = v6;
    id v7 = v4;
    uint64_t v29 = v7;
    int8x16_t v22 = a1[2];
    id v8 = (id)v22.i64[0];
    int8x16_t v30 = vextq_s8(v22, v22, 8uLL);
    [v5 enumerateObjectsUsingBlock:v27];
    if (![v7 count])
    {
      LOBYTE(v9) = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v26 = 0;
    int v9 = [v6 deleteApplets:v7 queueServerConnection:1 error:&v26];
    id v10 = v26;
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v9 || v10)
    {
      if (v12)
      {
        uint64_t v19 = a1[2].i64[1];
        *(_DWORD *)long long buf = 134218498;
        uint64_t v32 = v19;
        __int16 v33 = 2112;
        dispatch_time_t v34 = v7;
        __int16 v35 = 2112;
        id v36 = v10;
        id v14 = "PKSecureElement (%p): failed to delete applets %@ - %@.";
        uint64_t v15 = v11;
        uint32_t v16 = 32;
        goto LABEL_13;
      }
    }
    else if (v12)
    {
      uint64_t v13 = a1[2].i64[1];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v32 = v13;
      __int16 v33 = 2112;
      dispatch_time_t v34 = v7;
      id v14 = "PKSecureElement (%p): deleted applets %@.";
      uint64_t v15 = v11;
      uint32_t v16 = 22;
LABEL_13:
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }

    goto LABEL_15;
  }
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = a1[2].i64[0];
    uint64_t v17 = a1[2].i64[1];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    dispatch_time_t v34 = v18;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): no session to delete applets %@.", buf, 0x16u);
  }
  LOBYTE(v9) = 0;
LABEL_16:

  __int16 v20 = (void *)a1[3].i64[1];
  if (v20)
  {
    id v21 = a1[3].i64[0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_292;
    block[3] = &unk_1E56D8680;
    id v24 = v20;
    char v25 = v9;
    dispatch_async(v21, block);
  }
}

void __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) appletWithIdentifier:a2];
  if (v3)
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): cannot find applet %@ to delete.", (uint8_t *)&v7, 0x16u);
    }
  }
}

uint64_t __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)signChallenge:(id)a3 forPaymentApplication:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    int IsAvailable = PKSecureElementIsAvailable();
    if (v8
      && IsAvailable
      && ([v9 applicationIdentifier],
          BOOL v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 length],
          v12,
          v13))
    {
      id v14 = self->_replyQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke;
      v16[3] = &unk_1E56E3E48;
      id v17 = v8;
      id v18 = v9;
      uint64_t v19 = v14;
      id v20 = v10;
      uint64_t v15 = v14;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v16];
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v5 = a2;
    uint64_t v6 = [v4 applicationIdentifier];
    id v27 = 0;
    id v28 = 0;
    int v7 = [v5 signChallenge:v3 forAID:v6 sigInfo:&v28 error:&v27];

    id v8 = v28;
    id v9 = v27;

    if (v8 && v7)
    {
      uint64_t v10 = [v8 certificateVersion];
      uint64_t v11 = [PKSecureElementCertificateSet alloc];
      BOOL v12 = [v8 rsaCert];
      uint64_t v13 = [v8 eccCert];
      id v14 = [(PKSecureElementCertificateSet *)v11 initWithRSACertificate:v12 ECDSACertificate:v13];

      uint64_t v15 = [PKSecureElementSignatureInfo alloc];
      uint32_t v16 = [v8 jsblCounter];
      id v17 = [v8 platformId];
      id v18 = [(PKSecureElementSignatureInfo *)v15 initWithSecureElementCertificateSet:v14 sequenceCounter:v16 platformIdentifier:v17 certificateVersion:v10];
    }
    else
    {
      id v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v9;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Failed to sign challange. Error: %@", buf, 0xCu);
      }
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
    int v7 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke_294;
  block[3] = &unk_1E56D8428;
  uint64_t v19 = *(NSObject **)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  char v25 = v18;
  id v26 = v20;
  id v24 = v7;
  id v21 = v18;
  id v22 = v7;
  dispatch_async(v19, block);
}

uint64_t __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke_294(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)signChallenge:(id)a3 signatureEntanglementMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    int IsAvailable = PKSecureElementIsAvailable();
    if (v8 && IsAvailable)
    {
      uint64_t v11 = self->_replyQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke;
      v13[3] = &unk_1E56E3DD0;
      void v13[4] = self;
      unint64_t v17 = a4;
      id v14 = v8;
      uint64_t v15 = v11;
      id v16 = v9;
      BOOL v12 = v11;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v13];
    }
    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  id v17 = 0;
  int v7 = [v4 signChallenge:v5 signatureEntanglementMode:v6 session:v3 signatureInfo:&v17 error:0];

  id v8 = v17;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke_2;
  v13[3] = &unk_1E56D8428;
  id v9 = *(NSObject **)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v15 = v8;
  id v16 = v10;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)signChallenge:(id)a3 signatureEntanglementMode:(unint64_t)a4 session:(id)a5 signatureInfo:(id *)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v12)
  {
    id v26 = 0;
    goto LABEL_17;
  }
  id v33 = 0;
  id v34 = 0;
  id v14 = [v12 signChallenge:v11 useOSVersion:a4 == 1 signatureInfo:&v34 error:&v33];
  id v15 = (PKSecureElementSignatureInfo *)v34;
  id v16 = (PKSecureElementSignatureInfo *)v33;
  if (v15 && v14)
  {
    uint64_t v32 = v14;
    uint64_t v17 = [(PKSecureElementSignatureInfo *)v15 certificateVersion];
    id v18 = [PKSecureElementCertificateSet alloc];
    uint64_t v19 = [(PKSecureElementSignatureInfo *)v15 rsaCert];
    id v20 = [(PKSecureElementSignatureInfo *)v15 eccCert];
    id v21 = [(PKSecureElementCertificateSet *)v18 initWithRSACertificate:v19 ECDSACertificate:v20];

    id v22 = [PKSecureElementSignatureInfo alloc];
    uint64_t v23 = [(PKSecureElementSignatureInfo *)v15 jsblCounter];
    id v24 = [(PKSecureElementSignatureInfo *)v15 platformId];
    char v25 = [(PKSecureElementSignatureInfo *)v22 initWithSecureElementCertificateSet:v21 sequenceCounter:v23 platformIdentifier:v24 certificateVersion:v17];

    if (a6) {
      *a6 = v25;
    }
    id v14 = v32;
    id v26 = v32;

    id v16 = v15;
    goto LABEL_16;
  }
  id v27 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v38 = v16;
    _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Failed to sign challange. Error: %@", buf, 0xCu);
  }

  if (!a7) {
    goto LABEL_14;
  }
  if (!v16)
  {
    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    id v36 = @"Sign challenge failed";
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v30 = [v28 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v29];
    *a7 = v30;

LABEL_14:
    id v26 = 0;
    goto LABEL_15;
  }
  id v26 = 0;
  *a7 = v16;
LABEL_15:
  char v25 = v15;
LABEL_16:

LABEL_17:
  return v26;
}

- (void)signatureForAuthToken:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [a3 dataUsingEncoding:4];
  id v8 = [v7 SHA256Hash];

  id v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 hexEncoding];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Auth token data to be signed: %@", buf, 0xCu);
  }
  if (v6)
  {
    id v11 = self->_replyQueue;
    if (PKSecureElementIsAvailable())
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__PKSecureElement_signatureForAuthToken_completion___block_invoke;
      v12[3] = &unk_1E56E3EC0;
      id v13 = v8;
      id v14 = v11;
      id v15 = v6;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v12];
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

void __52__PKSecureElement_signatureForAuthToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v14 = 0;
    id v4 = [a2 signChallenge:v3 certs:0 error:&v14];
    id v5 = v14;
    if (v4)
    {
      id v6 = [v4 hexEncoding];
    }
    else
    {
      int v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to sign authentication token. Error: %@", buf, 0xCu);
      }

      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKSecureElement_signatureForAuthToken_completion___block_invoke_299;
  block[3] = &unk_1E56D83D8;
  id v8 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__PKSecureElement_signatureForAuthToken_completion___block_invoke_299(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)stateInformationWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (PKSecureElementIsAvailable())
    {
      id v4 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __50__PKSecureElement_stateInformationWithCompletion___block_invoke;
      v6[3] = &unk_1E56E3DF8;
      id v7 = v4;
      id v8 = v3;
      id v5 = v4;
      [v5 getSELDInfoForBroker:v6];
    }
    else
    {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

void __50__PKSecureElement_stateInformationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Secure Element Remote Admin Manager Error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)signedPlatformDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_initWeak(&location, self);
      id v5 = self->_replyQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke;
      v7[3] = &unk_1E56E3BB0;
      objc_copyWeak(&v10, &location);
      id v6 = v5;
      int v8 = v6;
      id v9 = v4;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v7];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

void __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained primarySecureElementIdentifier];
  if (v3)
  {
    id v28 = 0;
    id v6 = [v3 getSignedPlatformDataForSeid:v5 error:&v28];
    id v7 = v28;
    if (!v6)
    {
      int v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)long long buf = 136315650;
        id v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
        __int16 v31 = 2112;
        uint64_t v32 = v15;
        __int16 v33 = 2112;
        id v34 = v7;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to retrieve platform data: %@ error: %@", buf, 0x20u);
      }
      id v11 = 0;
      id v10 = 0;
      goto LABEL_26;
    }
    int v8 = PKGetConstantStringNFSignedPlatformData();
    id v9 = PKGetConstantStringNFSignedPlatformSignatureBlob();
    if (v8)
    {
      id v10 = [v6 objectForKey:v8];
      if (v10)
      {
        if (v9) {
          goto LABEL_6;
        }
        goto LABEL_21;
      }
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        id v10 = 0;
        if (v9)
        {
LABEL_6:
          id v11 = [v6 objectForKey:v9];
          if (v11)
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          id v12 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
            *(_DWORD *)long long buf = 136315394;
            id v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
            __int16 v31 = 2112;
            uint64_t v32 = v23;
            id v13 = "%s missing platformDataSignature: %@";
LABEL_23:
            _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

            goto LABEL_24;
          }
          goto LABEL_24;
        }
LABEL_21:
        id v12 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
          *(_DWORD *)long long buf = 136315394;
          id v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
          __int16 v31 = 2112;
          uint64_t v32 = v23;
          id v13 = "%s missing platformDataSignatureKey: %@";
          goto LABEL_23;
        }
LABEL_24:

        id v11 = 0;
        goto LABEL_25;
      }
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)long long buf = 136315394;
      id v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      uint64_t v18 = "%s missing platformData: %@";
    }
    else
    {
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)long long buf = 136315394;
      id v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      uint64_t v18 = "%s missing platformDataKey: %@";
    }
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

    goto LABEL_20;
  }
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)long long buf = 136315394;
    id v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
    __int16 v31 = 2112;
    uint64_t v32 = v14;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to create session: %@ ", buf, 0x16u);
  }
  id v11 = 0;
  id v10 = 0;
LABEL_27:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke_302;
  block[3] = &unk_1E56D8428;
  uint64_t v19 = *(NSObject **)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v26 = v11;
  id v27 = v20;
  id v25 = v10;
  id v21 = v11;
  id v22 = v10;
  dispatch_async(v19, block);
}

uint64_t __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke_302(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)generateTransactionKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke;
  v14[3] = &unk_1E56E3E48;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v14];
}

void __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(PKDAManager);
    id v5 = [*(id *)(a1 + 32) primarySecureElementIdentifier];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_303;
    v10[3] = &unk_1E56E3E98;
    void v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 56);
    [(PKDAManager *)v4 generateTransactionKeyWithSession:v3 seid:v5 readerIdentifier:v6 readerPublicKey:v7 completion:v10];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement GenerateTransactionKeyWithReaderIdentifier failed to get session", buf, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, PKDAManager *))(v9 + 16))(v9, 0, 0, 0, v4);
  }
}

void __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_303(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 homeKeyInformation];
  id v8 = [v6 publicKeyIdentifier];

  uint64_t v9 = [v7 publicKey];
  id v10 = [v7 appletIdentifier];
  id v11 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_2;
  block[3] = &unk_1E56E3E20;
  id v12 = *(id *)(a1 + 40);
  id v21 = v5;
  id v22 = v12;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v5;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v11, block);
}

uint64_t __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)createAliroHomeKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 homeIdentifier:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke;
  v18[3] = &unk_1E56E3E70;
  id v21 = v12;
  id v22 = v13;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v18];
}

void __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(PKDAManager);
    id v5 = [*(id *)(a1 + 32) primarySecureElementIdentifier];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_305;
    v11[3] = &unk_1E56E3E98;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    [(PKDAManager *)v4 createAliroHomeKey:v3 seid:v5 readerIdentifier:v6 readerPublicKey:v7 homeIdentifier:v8 withCompletion:v11];
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement createAliroHomeKeyWithReaderIdentifier failed to get session", buf, 2u);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, PKDAManager *))(v10 + 16))(v10, 0, 0, 0, v4);
  }
}

void __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_305(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 homeKeyInformation];
  uint64_t v8 = [v6 publicKeyIdentifier];

  uint64_t v9 = [v7 publicKey];
  uint64_t v10 = [v7 appletIdentifier];
  id v11 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_2;
  block[3] = &unk_1E56E3E20;
  id v12 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v12;
  void block[4] = v8;
  void block[5] = v9;
  block[6] = v10;
  id v13 = v5;
  dispatch_async(v11, block);
}

uint64_t __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke;
  block[3] = &unk_1E56D89F0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sessionQueue, block);
}

void __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke(void *a1)
{
  uint64_t v2 = objc_alloc_init(PKDAManager);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_2;
  v5[3] = &unk_1E56E3E98;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [(PKDAManager *)v2 generateTransactionKeyWithParameters:v3 withCompletion:v5];
}

void __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 hydraKeyInformation];
  uint64_t v8 = [v6 publicKeyIdentifier];

  id v9 = [v7 certificateChain];
  id v10 = [v7 appletIdentifier];
  id v11 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_3;
  block[3] = &unk_1E56E3E20;
  id v12 = *(id *)(a1 + 40);
  id v21 = v5;
  id v22 = v12;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v5;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v11, block);
}

uint64_t __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)createAliroHydraKeyWithServerParameters:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke;
  v10[3] = &unk_1E56E3EC0;
  id v11 = v6;
  id v12 = v7;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v10];
}

void __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(PKDAManager);
    id v5 = [*(id *)(a1 + 32) primarySecureElementIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_306;
    v10[3] = &unk_1E56E3E98;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v7;
    [(PKDAManager *)v4 createAliroHydraKey:v3 seid:v5 serverParameters:v6 withCompletion:v10];

LABEL_7:
    goto LABEL_8;
  }
  id v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement createAliroHydraKeyWithServerParameters failed to get session", buf, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, PKDAManager *))(v9 + 16))(v9, 0, 0, 0, v4);
    goto LABEL_7;
  }
LABEL_8:
}

void __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 hydraKeyInformation];
  id v8 = [v6 publicKeyIdentifier];

  uint64_t v9 = [v7 certificateChain];
  id v10 = [v7 appletIdentifier];
  id v11 = *(void **)(a1 + 40);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_2;
    block[3] = &unk_1E56E3E20;
    void block[4] = v8;
    void block[5] = v9;
    id v15 = v11;
    block[6] = v10;
    id v14 = v5;
    dispatch_async(v12, block);
  }
}

uint64_t __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (BOOL)queueConnectionToServerWithPushTopic:(id)a3
{
  id v3 = a3;
  id v4 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  char v5 = [v4 queueServerConnection:v3];

  return v5;
}

- (BOOL)queueConnectionToServerForAppletIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  char v5 = [v4 queueServerConnectionForApplets:v3];

  return v5;
}

- (void)connectToServerWithPushTopic:(id)a3 completion:(id)a4
{
}

- (void)connectToServerWithPushTopic:(id)a3 performSECleanup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = v10;
  if (v5) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PerformSECleanup"];
  }
  id v12 = (void *)[v11 copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PKSecureElement_connectToServerWithPushTopic_performSECleanup_completion___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v15 = v7;
  id v13 = v7;
  [v9 connectToServer:v8 initialClientRequestInfo:v12 callback:v14];
}

void __76__PKSecureElement_connectToServerWithPushTopic_performSECleanup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Secure Element Remote Server Connection Error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 0);
  }
}

- (void)peerPaymentEnrollmentDataWithAlternateDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (PKSecureElementIsAvailable())
    {
      uint64_t v8 = self->_replyQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke;
      v10[3] = &unk_1E56E3E48;
      id v11 = v6;
      id v12 = self;
      id v13 = v8;
      id v14 = v7;
      uint64_t v9 = v8;
      [(PKSecureElement *)self accessSecureElementManagerSessionWithHandler:v10];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v40[0] = 0;
    int v5 = [v3 validateSEPairings:v40];
    id v6 = v40[0];
    id v7 = 0;
    if (v5)
    {
      if (v5 != 27
        || (v39 = 0, v8 = [v4 deleteAllApplets:0 error:&v39], id v7 = v39, !v8))
      {
        id v24 = *(NSObject **)(a1 + 48);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3_330;
        v28[3] = &unk_1E56D8A18;
        id v7 = v7;
        id v29 = v7;
        id v30 = *(id *)(a1 + 56);
        dispatch_async(v24, v28);

        id v9 = v29;
LABEL_17:

        goto LABEL_18;
      }
    }
    id v9 = objc_alloc_init((Class)PKGetClassNFPeerPaymentEnrollmentRequest());
    id v10 = [*(id *)(a1 + 32) dataUsingEncoding:4];
    id v11 = [v10 SHA256Hash];
    [v9 setAlternateDSID:v11];

    id v38 = 0;
    id v12 = [v4 performPeerPaymentEnrollment:v9 error:&v38];
    id v13 = v38;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2;
    aBlock[3] = &unk_1E56E3EE8;
    id v14 = *(void **)(a1 + 48);
    void aBlock[4] = *(void *)(a1 + 40);
    id v36 = v14;
    id v37 = *(id *)(a1 + 56);
    id v15 = _Block_copy(aBlock);
    if (v13)
    {
      id v16 = [v13 domain];
      id v17 = [NSString stringWithUTF8String:"nfcd"];
      if ([v16 isEqualToString:v17])
      {
        id v25 = v6;
        id v18 = v12;
        uint64_t v19 = [v13 code];

        BOOL v20 = v19 == 16;
        id v12 = v18;
        id v6 = v25;
        if (v20)
        {
          id v21 = PKLogFacilityTypeGetObject(0xBuLL);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "SE Error: Handling NFCD NFResultCommmandError by reaching out to TSM, then retrying enrollment request.", buf, 2u);
          }

          id v22 = *(void **)(a1 + 40);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_328;
          v31[3] = &unk_1E56E3F10;
          v31[4] = v22;
          id v32 = v9;
          id v33 = v15;
          [v22 connectToServerWithPushTopic:0 completion:v31];

          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    (*((void (**)(void *, void *, id))v15 + 2))(v15, v12, v13);
LABEL_16:

    goto LABEL_17;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_331;
  block[3] = &unk_1E56D8360;
  uint64_t v23 = *(NSObject **)(a1 + 48);
  id v27 = *(id *)(a1 + 56);
  dispatch_async(v23, block);
  id v6 = v27;
LABEL_18:
}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v42[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 prePeerPaymentCertificate];
  int v8 = [v7 hexEncoding];

  id v9 = [v5 prePeerPaymentCertificate];
  uint64_t v10 = [v9 SHA256Hash];

  uint64_t v32 = [*(id *)(a1 + 32) secureElementIdentifiers];
  id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v12 = [v5 certificate];
  id v13 = [v12 objectForKey:@"ECDSA"];

  if (v13)
  {
    id v14 = [v13 hexEncoding];
    [v11 setObject:v14 forKeyedSubscript:@"ECDSA"];
  }
  id v30 = (void *)v10;
  id v15 = [v5 certificate];
  id v16 = [v15 objectForKey:@"ECC"];

  if (v16)
  {
    id v17 = [v16 hexEncoding];
    [v11 setObject:v17 forKeyedSubscript:@"ECC"];
  }
  __int16 v31 = v13;
  id v18 = [v5 certificate];
  uint64_t v19 = [v18 objectForKey:@"RSA"];

  if (v19)
  {
    BOOL v20 = [v19 hexEncoding];
    [v11 setObject:v20 forKeyedSubscript:@"RSA"];
  }
  id v21 = v6;
  id v22 = (void *)v32;
  if (!v6 && v5 && v8 && v11 && v32)
  {
    v42[0] = v8;
    v41[0] = @"signedEnrollmentData";
    v41[1] = @"casdCertificate";
    uint64_t v23 = (void *)[v11 copy];
    v41[2] = @"seidList";
    v42[1] = v23;
    v42[2] = v32;
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3;
    block[3] = &unk_1E56D8428;
    id v25 = *(NSObject **)(a1 + 40);
    id v40 = *(id *)(a1 + 48);
    id v38 = v24;
    id v26 = v30;
    id v39 = v30;
    id v27 = v24;
    id v28 = v25;
    id v22 = (void *)v32;
    dispatch_async(v28, block);
  }
  else
  {
    id v29 = *(NSObject **)(a1 + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_4;
    v33[3] = &unk_1E56D89F0;
    id v34 = v5;
    id v35 = v6;
    id v36 = *(id *)(a1 + 48);
    dispatch_async(v29, v33);

    id v27 = v34;
    id v26 = v30;
  }
}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_4(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "SE Error: Failed to get Peer Payment enrollment certificates from NearField with response: %@, error: %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_328(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2_329;
  v3[3] = &unk_1E56E3B60;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 accessSecureElementManagerSessionWithHandler:v3];
}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2_329(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  id v4 = [a2 performPeerPaymentEnrollment:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3_330(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "SE Error: Failed to ensure that the SE is paired to the SEP, hence failing peer payment enrollment request. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_331(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "SE Error: Failed to access the secure element access session, hence failing peer payment enrollment request.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  if (v5 && ![(NSHashTable *)self->_observers containsObject:v5])
  {
    [(NSHashTable *)self->_observers addObject:v5];
    if (objc_opt_respondsToSelector()) {
      [(PKSecureElement *)self _registerPairingChangeHandler];
    }
    if ([(NSHashTable *)self->_observers count] == 1)
    {
      id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 addObserver:self selector:sel_contactlessPaymentPassesAvailableDidChange name:@"PDContactlessPaymentPassesAvailableDidChangeNotification" object:0];
    }
    [(PKSecureElement *)self _updateHardwareManagerListener];
  }
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  if (v4 && [(NSHashTable *)self->_observers containsObject:v4])
  {
    [(NSHashTable *)self->_observers removeObject:v4];
    [(PKSecureElement *)self _updateHardwareManagerListener];
  }
  os_unfair_lock_unlock(&self->_observersLock);
}

- (BOOL)supportsExpressModeForExpressPassType:(int64_t)a3
{
  id v5 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  uint64_t v6 = v5;
  if (!v5 || ![v5 isExpressModeSupported]) {
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }
  if (a3 == 1) {
    unint64_t v7 = ([(PKSecureElement *)self supportedTechnologies] >> 2) & 1;
  }
  else {
LABEL_6:
  }
    LOBYTE(v7) = 0;
LABEL_7:

  return v7;
}

+ (BOOL)hardwareSupportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return [a1 hardwareSupportsExpressForAutomaticSelectionTechnologyType:a3 outError:0];
}

+ (BOOL)supportsExpressMode:(id)a3
{
  return [a1 supportsExpressMode:a3 byHardware:0];
}

+ (BOOL)supportsExpressMode:(id)a3 byHardware:(BOOL *)a4
{
  uint64_t v6 = (__CFString *)a3;
  char v7 = [a1 hardwareSupportsExpressMode:v6];
  if (a4) {
    *a4 = v7;
  }
  if (v7)
  {
    char v8 = 1;
  }
  else if (v6 && @"type_a.generic")
  {
    char v8 = [(__CFString *)v6 isEqual:@"type_a.generic"];
  }
  else
  {
    char v8 = @"type_a.generic" == v6;
  }

  return v8;
}

+ (BOOL)hardwareSupportsExpressMode:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  id v4 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  if (!v4) {
    goto LABEL_15;
  }
  if (!v3 || !@"transit.felica.suica")
  {
    if (@"transit.felica.suica" == v3) {
      goto LABEL_5;
    }
    goto LABEL_7;
  }
  if (([(__CFString *)v3 isEqual:@"transit.felica.suica"] & 1) == 0)
  {
LABEL_7:
    if (v3 && @"type_a.generic")
    {
      if ([(__CFString *)v3 isEqual:@"type_a.generic"])
      {
LABEL_10:
        uint64_t v5 = 8;
        goto LABEL_14;
      }
    }
    else if (@"type_a.generic" == v3)
    {
      goto LABEL_10;
    }
    if ([(__CFString *)v3 hasPrefix:@"access.hid."])
    {
      uint64_t v5 = 2;
      goto LABEL_14;
    }
LABEL_15:
    char v6 = 0;
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v5 = 4;
LABEL_14:
  char v6 = [v4 areFeaturesSupported:v5 outError:0];
LABEL_16:

  return v6;
}

- (unint64_t)ownershipStateForCurrentUser
{
  if (![(PKSecureElement *)self isOwnable]) {
    return 3;
  }
  uint64_t v3 = PKCurrentUserUUID();
  unint64_t v4 = [(PKSecureElement *)self ownershipStateForUserUUID:v3];

  return v4;
}

- (unint64_t)ownershipStateForUserUUID:(id)a3
{
  return 3;
}

- (BOOL)setOwnerUserUUID:(id)a3 keybagUUID:(id)a4
{
  return 1;
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v32 = v12;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement creating FIDO key for relyingParty: %@", buf, 0xCu);
  }

  if (v12 && v13 && v14)
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v18, OS_SIGNPOST_EVENT, v20, "fidoKey:createKey", "", buf, 2u);
      }
    }

    id v21 = [MEMORY[0x1E4F97A08] shared];
    id v30 = 0;
    id v22 = [v21 createFidoKeyForRelyingParty:v12 relyingPartyAccountHash:v13 challenge:v14 usingSession:0 withSessionSEID:0 error:&v30];
    id v23 = v30;

    BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = v23;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to create FIDO key with error: %@", buf, 0xCu);
      }

      (*((void (**)(id, void, void, void, id))v16 + 2))(v16, 0, 0, 0, v23);
    }
    else
    {
      if (v24)
      {
        id v25 = [v22 fidoKeyHash];
        id v26 = [v25 hexEncoding];
        *(_DWORD *)long long buf = 138412290;
        id v32 = v26;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement generated FIDO key for with keyHash: %@", buf, 0xCu);
      }
      id v27 = [v22 fidoPublicKey];
      id v28 = [v22 fidoAttestation];
      id v29 = [v22 fidoKeyHash];
      (*((void (**)(id, void *, void *, void *, void))v16 + 2))(v16, v27, v28, v29, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement creating FIDO key missing required parameters", buf, 2u);
    }

    id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, void, void, id))v16 + 2))(v16, 0, 0, 0, v23);
  }
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t))a6;
  id v14 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v10;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO key for relyingParty: %@", buf, 0xCu);
  }

  if (v10 && v11)
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v15, OS_SIGNPOST_EVENT, v17, "fidoKey:checkForKey", "", buf, 2u);
      }
    }

    id v18 = [MEMORY[0x1E4F97A00] withRelyingParty:v10 relyingPartyAccountHash:v11 fidoKeyHash:v12];
    os_signpost_id_t v19 = [MEMORY[0x1E4F97A08] shared];
    id v24 = 0;
    os_signpost_id_t v20 = [v19 checkFidoKeyPresence:v18 usingSession:0 withSessionSEID:0 error:&v24];
    id v21 = (__CFString *)v24;
    uint64_t v22 = [v20 BOOLValue];

    if (v21)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v21;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement failed to check FIDO key with error %@", buf, 0xCu);
      }

      uint64_t v22 = 0;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = @"No";
      if (v22) {
        id v23 = @"Yes";
      }
      *(_DWORD *)long long buf = 138412290;
      id v26 = v23;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement check FIDO key found key: %@", buf, 0xCu);
    }

    v13[2](v13, v22);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO key missing required parameters", buf, 2u);
    }

    v13[2](v13, 0);
  }
}

- (void)checkMultipleFidoKeyPresenceForFIDOProfiles:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(id, id))a4;
  char v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 description];
    *(_DWORD *)long long buf = 138412290;
    id v27 = v9;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO keys: %@", buf, 0xCu);
  }
  if (v6 && [v6 count])
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v10, OS_SIGNPOST_EVENT, v12, "fidoKey:checkForKey", "", buf, 2u);
      }
    }

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke;
    v24[3] = &unk_1E56E3F38;
    id v14 = v13;
    id v25 = v14;
    [v6 enumerateObjectsUsingBlock:v24];
    id v15 = [MEMORY[0x1E4F97A08] shared];
    id v23 = 0;
    os_signpost_id_t v16 = [v15 checkMultipleFidoKeyPresence:v14 usingSession:0 withSessionSEID:0 error:&v23];
    id v17 = v23;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke_2;
    v20[3] = &unk_1E56E3F60;
    id v19 = v18;
    id v21 = v19;
    id v22 = v6;
    [v16 enumerateObjectsUsingBlock:v20];
    if (v17)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v17;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement failed to check FIDO key with error %@", buf, 0xCu);
      }
    }
    v7[2](v7, v19);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO key missing required parameters", buf, 2u);
    }

    v7[2](v7, (id)MEMORY[0x1E4F1CC08]);
  }
}

void __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F97A00];
  id v4 = a2;
  uint64_t v5 = [v4 relyingPartyIdentifier];
  id v6 = [v4 accountHash];
  char v7 = [v4 keyHash];

  char v8 = objc_msgSend(v7, "pk_decodeHexadecimal");
  id v9 = [v3 withRelyingParty:v5 relyingPartyAccountHash:v6 fidoKeyHash:v8];

  [*(id *)(a1 + 32) addObject:v9];
}

void __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v4 setObject:v6 forKey:v7];
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = (void (**)(id, void, id))a9;
  id v22 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v37 = v15;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKSecureElement signing FIDO key for relyingParty: %@", buf, 0xCu);
  }

  if (v15 && v16 && v18 && v20)
  {
    id v34 = v19;
    PKLogFacilityTypeGetObject(0x23uLL);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, self);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v25 = v24;
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v23, OS_SIGNPOST_EVENT, v25, "fidoKey:sign", "", buf, 2u);
      }
    }

    id v32 = v16;
    id v33 = v17;
    id v26 = [MEMORY[0x1E4F97A00] withRelyingParty:v15 relyingPartyAccountHash:v16 fidoKeyHash:v17];
    id v27 = [MEMORY[0x1E4F97A08] shared];
    uint64_t v28 = [MEMORY[0x1E4F1C9B8] dataWithHexEncodedString:v34];
    id v35 = 0;
    id v29 = [v27 signWithFidoKeyFor:v26 challenge:v18 forNFCKeyWithIdentifier:v28 usingSession:0 withSessionSEID:0 externalizedAuth:v20 error:&v35];
    id v30 = v35;

    if (v30)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v37 = v30;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to sign FIDO challenge with error: %@", buf, 0xCu);
      }

      v21[2](v21, 0, v30);
    }
    else
    {
      __int16 v31 = [v29 fidoAssertion];
      ((void (**)(id, void *, id))v21)[2](v21, v31, 0);
    }
    id v16 = v32;
    id v19 = v34;

    id v17 = v33;
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKSecureElement signing FIDO key missing required parameters", buf, 2u);
    }

    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    v21[2](v21, 0, v26);
  }
}

- (void)verifySignedChallenge:(id)a3 forRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, uint64_t))a7;
  id v17 = PKLogFacilityTypeGetObject(0x2CuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v13;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement verifying signed challenge for relyingParty: %@", buf, 0xCu);
  }

  if (v12 && v13 && v14)
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v18, OS_SIGNPOST_EVENT, v20, "issuerBindingData:verify", "", buf, 2u);
      }
    }

    id v21 = [MEMORY[0x1E4F97A00] withRelyingParty:v13 relyingPartyAccountHash:v14 fidoKeyHash:v15];
    id v22 = [MEMORY[0x1E4F97A08] shared];
    id v26 = 0;
    id v23 = [v22 verifyWithFidoKeyFor:v21 signedChallenge:v12 usingSession:0 withSessionSEID:0 error:&v26];
    id v24 = v26;

    if (v24)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v24;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to verify signed challenge with error: %@", buf, 0xCu);
      }

      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = [v23 BOOLValue];
    }
    v16[2](v16, v25);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement verifying signed challenge missing required parameters", buf, 2u);
    }

    v16[2](v16, 0);
  }
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v10[3] = &unk_1E56E0BD0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(PKDAManager *)v8 generateSEEncryptionCertificateForSubCredentialId:v7 completion:v10];
}

void __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_2;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      id v11 = @"N";
      if (v6) {
        id v11 = @"Y";
      }
      *(_DWORD *)long long buf = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement LTPK: Generating key for groupIdentifier: '%@' reuse: '%@'", buf, 0x16u);
    }

    id v12 = objc_alloc_init(PKDAManager);
    id v13 = v12;
    if (v6)
    {
      id v24 = 0;
      id v14 = [(PKDAManager *)v12 privacyKeysForGroupIdentifier:v7 privacyKeyIdentifier:0 outError:&v24];
      id v15 = v24;
      id v16 = [v14 firstObject];

      if (v16)
      {
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        id v17 = [v16 publicKey];
        *(_DWORD *)long long buf = 138412290;
        id v26 = v17;
        id v18 = "PKSecureElement LTPK: Found key %@";
        goto LABEL_21;
      }
    }
    else
    {
      os_signpost_id_t v19 = [(PKDAManager *)v12 privacyKeysForGroupIdentifier:v7 privacyKeyIdentifier:0 outError:0];
      if ((unint64_t)[v19 count] >= 0xA)
      {
        os_signpost_id_t v20 = [v19 lastObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v26 = v20;
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement LTPK: At max keys for groupIdentifier, deleting oldest key: %@", buf, 0xCu);
        }

        [v13 deletePrivacyKey:v20 outError:0];
      }

      id v15 = 0;
    }
    id v21 = v15;
    id v23 = v15;
    id v16 = [v13 createPrivacyKeyForGroupIdentifier:v7 outError:&v23];
    id v15 = v23;

    if (!v16) {
      goto LABEL_23;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:

      if (!v15)
      {
        if (v8)
        {
          id v22 = [v16 publicKey];
          v8[2](v8, v22, 0);
        }
        id v15 = 0;
        goto LABEL_30;
      }
LABEL_23:
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v15;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to get long term privacy key with error: %@", buf, 0xCu);
      }

      if (v8) {
        ((void (**)(id, void *, id))v8)[2](v8, 0, v15);
      }
LABEL_30:

      goto LABEL_31;
    }
    id v17 = [v16 publicKey];
    *(_DWORD *)long long buf = 138412290;
    id v26 = v17;
    id v18 = "PKSecureElement LTPK: Generated key %@";
LABEL_21:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    goto LABEL_22;
  }
  if (v10)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement LTPK: Error: Missing group identifier", buf, 2u);
  }

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  ((void (**)(id, void *, void *))v8)[2](v8, 0, v13);
LABEL_31:
}

- (void)hasLongTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  BOOL v6 = objc_alloc_init(PKDAManager);
  uint64_t v7 = [(PKDAManager *)v6 hasLongTermPrivacyKeyForGroupIdentifier:v5];

  if (v8) {
    v8[2](v8, v7);
  }
}

- (void)longTermPrivacyKeysForCredentialGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(id, void, id))a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = objc_alloc_init(PKDAManager);
  id v14 = 0;
  id v11 = [(PKDAManager *)v10 privacyKeysForGroupIdentifier:v9 privacyKeyIdentifier:v8 outError:&v14];

  id v12 = v14;
  if (v12)
  {
    id v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to get long term privacy keys with error: %@", buf, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0, v12);
    }
  }
  else if (v7)
  {
    ((void (**)(id, void *, id))v7)[2](v7, v11, 0);
  }
}

- (id)secureElementSessionPrelude
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__25;
  BOOL v10 = __Block_byref_object_dispose__25;
  id v11 = 0;
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKSecureElement_secureElementSessionPrelude__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(sessionQueue, v5);
  uint64_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__PKSecureElement_secureElementSessionPrelude__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setSecureElementSessionPrelude:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKSecureElement_setSecureElementSessionPrelude___block_invoke;
  v7[3] = &unk_1E56D8A18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sessionQueue, v7);
}

void __50__PKSecureElement_setSecureElementSessionPrelude___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (id)secureElementSessionPostlude
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__25;
  BOOL v10 = __Block_byref_object_dispose__25;
  id v11 = 0;
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PKSecureElement_secureElementSessionPostlude__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(sessionQueue, v5);
  uint64_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__PKSecureElement_secureElementSessionPostlude__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setSecureElementSessionPostlude:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKSecureElement_setSecureElementSessionPostlude___block_invoke;
  v7[3] = &unk_1E56D8A18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sessionQueue, v7);
}

void __51__PKSecureElement_setSecureElementSessionPostlude___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;
}

- (BOOL)isOwnable
{
  return 0;
}

- (BOOL)isProductionSigned
{
  secureElement = self->_secureElement;
  if (secureElement) {
    return [(NFSecureElement *)secureElement isProductionSigned];
  }
  else {
    return 1;
  }
}

- (BOOL)isInRestrictedMode
{
  uint64_t v2 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 isInRestrictedMode];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isDeletingAllApplets
{
  uint64_t v2 = self;
  p_deletingAllAppletsPropertyLocuint64_t k = &self->_deletingAllAppletsPropertyLock;
  os_unfair_lock_lock(&self->_deletingAllAppletsPropertyLock);
  LOBYTE(v2) = v2->_deletingAllApplets;
  os_unfair_lock_unlock(p_deletingAllAppletsPropertyLock);
  return (char)v2;
}

- (unint64_t)supportedTechnologies
{
  return [(NFSecureElement *)self->_secureElement supportedTechnologies];
}

- (NSString)primaryRegionTopic
{
  uint64_t v2 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  uint64_t v3 = [v2 primaryRegionTopic];

  return (NSString *)v3;
}

- (NSNumber)primaryJSBLSequenceCounter
{
  return (NSNumber *)[(NFSecureElement *)self->_secureElement sequenceCounter];
}

void __49__PKSecureElement_primarySecureElementIdentifier__block_invoke()
{
  uint64_t v2 = objc_alloc_init(PKSecureElement);
  uint64_t v0 = [(PKSecureElement *)v2 primarySecureElementIdentifier];
  v1 = (void *)qword_1EB402DB0;
  qword_1EB402DB0 = v0;
}

+ (id)secureElementIdentifiers
{
  if (qword_1EB402DC8 != -1) {
    dispatch_once(&qword_1EB402DC8, &__block_literal_global_360);
  }
  uint64_t v2 = (void *)qword_1EB402DC0;
  return v2;
}

void __43__PKSecureElement_secureElementIdentifiers__block_invoke()
{
  uint64_t v2 = objc_alloc_init(PKSecureElement);
  uint64_t v0 = [(PKSecureElement *)v2 secureElementIdentifiers];
  v1 = (void *)qword_1EB402DC0;
  qword_1EB402DC0 = v0;
}

- (void)_registerPairingChangeHandler
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_pairingChangeHandler)
  {
    uint64_t v2 = self;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__PKSecureElement__registerPairingChangeHandler__block_invoke;
    v7[3] = &unk_1E56E3FB0;
    objc_copyWeak(&v8, &location);
    uint64_t v3 = (objc_class *)_Block_copy(v7);
    id pairingChangeHandler = v2->_pairingChangeHandler;
    uint64_t v2 = (PKSecureElement *)((char *)v2 + 128);
    v2->super.isa = v3;

    int v5 = SSESetEffacementNotificationHandler(v2->super.isa);
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        int v11 = v5;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error setting the Secure Element Pairing change handler: %d", buf, 8u);
      }
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __48__PKSecureElement__registerPairingChangeHandler__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = WeakRetained[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __48__PKSecureElement__registerPairingChangeHandler__block_invoke_2;
    v6[3] = &unk_1E56E3F88;
    void v6[4] = v4;
    int v7 = a2;
    dispatch_async(v5, v6);
  }
}

void __48__PKSecureElement__registerPairingChangeHandler__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (v3 == 2);
  }
  int v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = off_1E56E4020[v4];
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v19 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Secure Element Pairing did change for reason: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "secureElementPairingDidChangeForReason:", v4, (void)v13);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairingChangeHandler, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_asyncSessionAccessHandlers, 0);
  objc_storeStrong((id *)&self->_prioritySessionAccessHandlers, 0);
  objc_storeStrong((id *)&self->_sessionAccessHandlers, 0);
  objc_storeStrong(&self->_secureElementSessionPostlude, 0);
  objc_storeStrong(&self->_secureElementSessionPrelude, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_deletingAllAppletsTimerQueue, 0);
  objc_storeStrong((id *)&self->_deletingAllAppletsTimer, 0);
}

@end