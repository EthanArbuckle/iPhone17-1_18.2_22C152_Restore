@interface PKPaymentProvisioningController
+ (id)watchWebServiceForIssuerProvisioning;
- (BOOL)_credentialIsValidForSetupConfiguration:(id)a3;
- (BOOL)_featureApplicationInValidStateToPresent:(id)a3;
- (BOOL)_hasSetupConfiguration;
- (BOOL)_isExtensionSupported:(id)a3 usingUnsupportedProvisioningExtensions:(id)a4;
- (BOOL)_isProvisioningPaymentAccount;
- (BOOL)_isValidLocation:(id)a3;
- (BOOL)allowProductsInUnsupportedRegion;
- (BOOL)fetchProductsFromStaticDataSource;
- (BOOL)hasCreditPaymentPass;
- (BOOL)hasDebitPaymentPass;
- (BOOL)hasExternalizedAuth;
- (BOOL)hasPayLaterPass;
- (BOOL)hasPaymentPass;
- (BOOL)isAMPEnrollmentAvailable;
- (BOOL)isExpressModeSetupOptional;
- (BOOL)isPasscodeUpgradeRequired;
- (BOOL)isProvisioningForAltAccount;
- (BOOL)isWatchSupportedForProduct:(id)a3;
- (BOOL)preventsFeatureApplications;
- (BOOL)provisioningUserInterfaceIsVisible;
- (BOOL)setState:(int64_t)a3 forCredential:(id)a4;
- (BOOL)suppressDefaultCardholderNameField;
- (CIDVUIProofingFlowManager)identityProofingManager;
- (CLLocation)cachedLocation;
- (NSArray)allCredentials;
- (NSArray)allowedCardTypes;
- (NSArray)allowedPaymentNetworks;
- (NSArray)associatedCredentials;
- (NSArray)moreInfoItems;
- (NSArray)pendingCarKeyCredentials;
- (NSArray)provisioningExtensionCredentials;
- (NSArray)purchaseCredentials;
- (NSExtension)provisioningExtension;
- (NSOrderedSet)provisionedPasses;
- (NSSet)allowedFeatureIdentifiers;
- (NSSet)allowedProductIdentifiers;
- (NSSet)automaticExpressModes;
- (NSSet)requiredTransitNetworkIdentifiers;
- (NSString)localizedProgressDescription;
- (NSString)productIdentifier;
- (NSString)referrerIdentifier;
- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator;
- (PKPaymentDataProvider)paymentDataProvider;
- (PKPaymentEligibilityResponse)eligibilityResponse;
- (PKPaymentOffersController)paymentOffersController;
- (PKPaymentPass)provisionedPass;
- (PKPaymentProvisioningController)initWithWebService:(id)a3;
- (PKPaymentProvisioningController)initWithWebService:(id)a3 localPaymentService:(id)a4;
- (PKPaymentProvisioningController)initWithWebService:(id)a3 paymentSetupRequest:(id)a4;
- (PKPaymentProvisioningControllerCredentialQueue)credentialProvisioningQueue;
- (PKPaymentProvisioningResponse)provisioningResponse;
- (PKPaymentRequirementsResponse)requirementsResponse;
- (PKPaymentSetupProductModel)paymentSetupProductModel;
- (PKPaymentWebService)webService;
- (PKProvisioningSEStorageSnapshot)storageSnapshot;
- (id)_accountsForFeatureIdentifier:(unint64_t)a3;
- (id)_displayableErrorOverrideForUnderlyingError:(id)a3;
- (id)_doesDisplayableErrorConstitutePreflightFailure:(id)a3;
- (id)_effectiveSessionIdentifier;
- (id)_eligibleMarketNames:(id)a3;
- (id)_fetchOrCreateProductsForIdentifier:(unint64_t)a3;
- (id)_filterPaymentSetupProducts:(id)a3;
- (id)_filteredPaymentSetupProductSections:(id)a3;
- (id)_localizedProgressDescriptionForEnablingCard;
- (id)_mockBrowseBanksResponse;
- (id)_paymentPassWithPaymentMethodType:(unint64_t)a3;
- (id)_supportedFeatureIdentifierStrings;
- (id)_supportedFeatureIdentifierStringsForAccountProvisioning;
- (id)associatedCredentialsForDefaultBehaviour;
- (id)associatedCredentialsForProductIdentifier:(id)a3;
- (id)displayableErrorForError:(id)a3;
- (id)displayableErrorForProvisioningError:(id)a3;
- (id)identityProofingManagerCompletionHandler;
- (id)localCredentials;
- (id)pendingProvisioningForCredential:(id)a3;
- (id)provisioningTracker;
- (id)retrieveExternalizedAuth;
- (int64_t)_defaultResetState;
- (int64_t)availableSecureElementPassSpaces;
- (int64_t)state;
- (unint64_t)isCurrentUserUnder13;
- (unint64_t)preflightRequirements;
- (void)_addAssociatedCredential:(id)a3;
- (void)_addOrUpdateProvisonedPassData:(id)a3;
- (void)_applyIdentityConfiguration:(unint64_t)a3 activeConfigurations:(id)a4 completion:(id)a5;
- (void)_associateCredential:(id)a3 withCompletionHandler:(id)a4;
- (void)_associateCredentials:(id)a3 withCompletionHandler:(id)a4;
- (void)_beginReportingIfNecessary;
- (void)_browsableBanksWithRequest:(id)a3 completion:(id)a4;
- (void)_deletePaymentPass:(id)a3;
- (void)_downloadRemoteAssetsForPaymentPass:(id)a3 paymentCredential:(id)a4 completion:(id)a5;
- (void)_endRequiringUpgradedPasscodeIfNecessary;
- (void)_endSessionIfNecessary;
- (void)_handleProvisioningError:(id)a3 forRequest:(id)a4 pass:(id)a5;
- (void)_identityConfigurationWithCompletion:(id)a3;
- (void)_informDelegatesOfAccountsUpdated;
- (void)_informDelegatesOfPaymentPassUpdateOnCredential:(id)a3;
- (void)_loadMoreInfoItemForMarket:(id)a3 eligibleMarkets:(id)a4 completionHandler:(id)a5;
- (void)_metadataUpdatedOnCredentials;
- (void)_noteProvisioningDidBegin;
- (void)_noteProvisioningDidEnd;
- (void)_passAlreadyProvisioned;
- (void)_preflightRequirementsUpdated:(unint64_t)a3 displayableError:(id)a4;
- (void)_queryEligibilityForCredential:(id)a3 completion:(id)a4;
- (void)_queryRequirementsForCredential:(id)a3 completion:(id)a4;
- (void)_registerDevice:(id)a3;
- (void)_reloadSetupProducts;
- (void)_requestProvisioning:(id)a3 withCompletionHandler:(id)a4;
- (void)_requestRequirements:(id)a3 withCompletionHandler:(id)a4;
- (void)_retrievePendingCarKeys:(id)a3;
- (void)_setLocalizedProgressDescription:(id)a3;
- (void)_setState:(int64_t)a3 notify:(BOOL)a4;
- (void)_setupAccountCredentialForProvisioning:(id)a3 completion:(id)a4;
- (void)_setupAccounts;
- (void)_setupFeatureApplications:(id)a3;
- (void)_startLocationSearchWithTimeout:(double)a3 completion:(id)a4;
- (void)_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3;
- (void)_updateAllAssoicatedCredentialsMetadataWithCompletion:(id)a3;
- (void)_updateCredentialWithPaymentPass:(id)a3 completion:(id)a4;
- (void)_updateCredentialWithPaymentPassAssets:(id)a3 completion:(id)a4;
- (void)_updateLocalizedProgressAndInvalidateTimer;
- (void)_updatePaymentSetupProductModelExtensionsWithCompletion:(id)a3;
- (void)_updatePaymentSetupProductModelWithAvailability:(unint64_t)a3 activeConfigurations:(id)a4;
- (void)_updatePreflightRequirement:(unint64_t)a3 displayableError:(id)a4;
- (void)acceptTerms;
- (void)accountAdded:(id)a3;
- (void)addDelegate:(id)a3;
- (void)associateCredentials:(id)a3 withCompletionHandler:(id)a4;
- (void)cachedPaymentSetupProductModelWithCompletion:(id)a3;
- (void)cleanupTransferredCredentialFromSourceDevice:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)declineTerms;
- (void)deleteCredential:(id)a3 completionHandler:(id)a4;
- (void)didReceivePendingProvisioningUpdate:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)finishOptionalExpressModeSetupForPass:(id)a3 withProvisioningTracker:(id)a4 completion:(id)a5;
- (void)handleOptionalExpressModeSetupDidFinishForPass:(id)a3 withExpressModes:(id)a4 provisioningTracker:(id)a5 completion:(id)a6;
- (void)ingestSecureElementPassForCredential:(id)a3 completion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)noteProvisioningUserInterfaceDidAppear;
- (void)noteProvisioningUserInterfaceDidDisappear;
- (void)passcodeUpgradeCompleted:(BOOL)a3;
- (void)paymentWebService:(id)a3 didCompleteTSMConnectionForTaskID:(unint64_t)a4;
- (void)paymentWebService:(id)a3 didQueueTSMConnectionForTaskID:(unint64_t)a4;
- (void)performDeviceCheckInIfNeeded:(id)a3;
- (void)preflightPasscodeUpgradeWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)preflightWithRequirements:(unint64_t)a3 completionRequirements:(unint64_t)a4 completion:(id)a5;
- (void)preflightWithRequirements:(unint64_t)a3 update:(id)a4;
- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4;
- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4;
- (void)provisionHomeKeyCredential:(id)a3 completionHandler:(id)a4;
- (void)provisioningExtensionProductsWithCompletionHandler:(id)a3;
- (void)registerDevice:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeProvisionedPasses;
- (void)requestEligibility:(id)a3 withCompletionHandler:(id)a4;
- (void)requestExternalizedAuthForWatchWithVisibleViewController:(id)a3 completion:(id)a4;
- (void)requestProvisioning:(id)a3 withCompletion:(id)a4;
- (void)requestProvisioning:(id)a3 withCompletionHandler:(id)a4;
- (void)requestProvisioningMethodMetadataForProduct:(id)a3 completionHandler:(id)a4;
- (void)requestPurchasesForProduct:(id)a3 completionHandler:(id)a4;
- (void)requestRequirements:(id)a3 withCompletionHandler:(id)a4;
- (void)reset;
- (void)resetForNewProvisioning;
- (void)resetForNewProvisioningForce:(BOOL)a3;
- (void)resolveAmbiguousRequirementsWithProductIdentifier:(id)a3;
- (void)resolveLocalEligibilityRequirementsForAppleBalanceCredential:(id)a3 withCompletion:(id)a4;
- (void)resolveProvisioningForCredential:(id)a3;
- (void)resolveRequirementsForIssuerProvisioningExtensionCredential:(id)a3;
- (void)resolveRequirementsForShareableCredential:(id)a3;
- (void)resolveRequirementsUsingProduct:(id)a3;
- (void)resolveRequirementsUsingProvisioningMethodMetadata:(id)a3;
- (void)retrieveAccountCredentials:(id)a3;
- (void)retrieveAllAvailableCredentials:(id)a3;
- (void)retrieveRemoteCredentials:(id)a3;
- (void)setAllowProductsInUnsupportedRegion:(BOOL)a3;
- (void)setAllowedCardTypes:(id)a3;
- (void)setAllowedFeatureIdentifiers:(id)a3;
- (void)setAllowedPaymentNetworks:(id)a3;
- (void)setAllowedProductIdentifiers:(id)a3;
- (void)setCloudStoreCoordinator:(id)a3;
- (void)setFetchProductsFromStaticDataSource:(BOOL)a3;
- (void)setIdentityProofingManager:(id)a3;
- (void)setIdentityProofingManagerCompletionHandler:(id)a3;
- (void)setIsProvisioningForAltAccount:(BOOL)a3;
- (void)setPaymentDataProvider:(id)a3;
- (void)setPaymentOffersController:(id)a3;
- (void)setPreventsFeatureApplications:(BOOL)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setRequiredTransitNetworkIdentifiers:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setupAccountCredentialForProvisioning:(id)a3 completion:(id)a4;
- (void)setupProductForProvisioning:(id)a3 includePurchases:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)storeExternalizedAuth:(id)a3;
- (void)triggerWatchProvisioningForAppleBalanceCredential:(id)a3;
- (void)updatePaymentSetupProductModelWithCompletionHandler:(id)a3;
- (void)updateRemoteCredentials:(id)a3 withCompletionHandler:(id)a4;
- (void)updateStateAfterProvisioning:(id)a3 credential:(id)a4 passes:(id)a5 moreInfoItems:(id)a6;
- (void)validatePreconditions:(id)a3;
- (void)validatePreconditionsAndRegister:(id)a3;
- (void)verifyPassIsSupportedForExpressInLocalMarket:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentProvisioningController

- (PKPaymentProvisioningController)initWithWebService:(id)a3
{
  id v4 = a3;
  v5 = [[PKPaymentService alloc] initWithDelegate:self];
  v6 = [(PKPaymentProvisioningController *)self initWithWebService:v4 localPaymentService:v5];

  return v6;
}

- (PKPaymentProvisioningController)initWithWebService:(id)a3 localPaymentService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v51.receiver = self;
    v51.super_class = (Class)PKPaymentProvisioningController;
    v9 = [(PKPaymentProvisioningController *)&v51 init];
    v10 = v9;
    if (v9)
    {
      v9->_delegatesLock._os_unfair_lock_opaque = 0;
      if (PKPaymentSetupUseXPCProxyTargetDevice())
      {
        v11 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupUseXPCProxyTargetDevice() enabled. PKPaymentProvisioningController is using a wrapped web service for provisioning.", buf, 2u);
        }

        v12 = +[PKPaymentWebServiceProxyTargetDeviceDebugHelper webServiceWithProxiedTargetDevice:v7];
        webService = v10->_webService;
        v10->_webService = v12;

        v10->_proxyTargetDeviceWebServiceInUse = 1;
      }
      else
      {
        objc_storeStrong((id *)&v10->_webService, a3);
      }
      [(PKPaymentWebService *)v10->_webService addDelegate:v10];
      [(PKWebService *)v10->_webService resetWebServiceSessionMarker];
      v15 = [(PKPaymentWebService *)v10->_webService targetDevice];
      v16 = [v15 deviceName];
      int v17 = [v16 isEqualToString:@"Apple Watch"];

      if (v17 && (PKRunningInPassd() & 1) == 0)
      {
        v20 = [PKProvisioningUtility alloc];
        v21 = v10->_webService;
        v19 = +[PKPaymentWebService sharedService];
        uint64_t v22 = [(PKProvisioningUtility *)v20 initWithDestinationWebService:v21 managingWebService:v19];
        utility = v10->_utility;
        v10->_utility = (PKProvisioningUtility *)v22;
      }
      else
      {
        v18 = [[PKProvisioningUtility alloc] initWithDestinationWebService:v10->_webService managingWebService:v10->_webService];
        v19 = v10->_utility;
        v10->_utility = v18;
      }

      [(PKProvisioningUtility *)v10->_utility setDataProvider:v10];
      [(PKPaymentProvisioningController *)v10 _setState:[(PKPaymentProvisioningController *)v10 _defaultResetState] notify:0];
      v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      tasks = v10->_tasks;
      v10->_tasks = v24;

      v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      associatedCredentials = v10->_associatedCredentials;
      v10->_associatedCredentials = v26;

      v28 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      provisionedPasses = v10->_provisionedPasses;
      v10->_provisionedPasses = v28;

      v30 = objc_alloc_init(PKPaymentProvisioningControllerCredentialQueue);
      credentialProvisioningQueue = v10->_credentialProvisioningQueue;
      v10->_credentialProvisioningQueue = v30;

      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      delegates = v10->_delegates;
      v10->_delegates = (NSHashTable *)v32;

      v34 = objc_alloc_init(PKPaymentSetupProductModel);
      paymentSetupProductModel = v10->_paymentSetupProductModel;
      v10->_paymentSetupProductModel = v34;

      objc_storeStrong((id *)&v10->_paymentService, a4);
      [(PKPaymentService *)v10->_paymentService setDelegate:v10];
      dispatch_queue_t v36 = dispatch_queue_create("com.apple.passkit.updateRecentsAndKeychainWithContactInformation", 0);
      updateQueue = v10->_updateQueue;
      v10->_updateQueue = (OS_dispatch_queue *)v36;

      v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      analyticsFeaturesToReport = v10->_analyticsFeaturesToReport;
      v10->_analyticsFeaturesToReport = v38;

      v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      preflighUpdateHandlers = v10->_preflighUpdateHandlers;
      v10->_preflighUpdateHandlers = v40;

      uint64_t v42 = +[PKAccountService sharedInstance];
      accountService = v10->_accountService;
      v10->_accountService = (PKAccountService *)v42;

      v44 = [[PKPaymentCloudStoreZoneCreationManager alloc] initWithWebService:v10->_webService];
      zoneCreationManager = v10->_zoneCreationManager;
      v10->_zoneCreationManager = v44;

      [(PKAccountService *)v10->_accountService registerObserver:v10];
      v46 = objc_alloc_init(PKSecureElementProvisioningState);
      provisioningState = v10->_provisioningState;
      v10->_provisioningState = v46;

      v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      pendingProvisionings = v10->_pendingProvisionings;
      v10->_pendingProvisionings = v48;

      [(PKPaymentProvisioningController *)v10 _beginReportingIfNecessary];
    }
  }
  else
  {
    v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: No webservice for provisioning controller returning nil", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (PKPaymentProvisioningController)initWithWebService:(id)a3 paymentSetupRequest:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PKPaymentProvisioningController *)self initWithWebService:a3];
  id v8 = v7;
  if (v7)
  {
    provisioningState = v7->_provisioningState;
    v10 = [v6 configuration];
    v11 = [v10 referrerIdentifier];
    [(PKSecureElementProvisioningState *)provisioningState setReferrerIdentifier:v11];

    v12 = [v6 paymentSetupFeatures];
    if (v12)
    {
      id v33 = v6;
      objc_storeStrong((id *)&v8->_paymentSetupFeatures, v12);
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v14 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      requiredTransitNetworkIdentifiers = v8->_requiredTransitNetworkIdentifiers;
      v8->_requiredTransitNetworkIdentifiers = v14;

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v32 = v12;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v22 = objc_msgSend(v21, "type", v32);
            if (v22 == 3)
            {
              v23 = v8->_requiredTransitNetworkIdentifiers;
              v24 = [v21 identifiers];
              uint64_t v25 = [(NSSet *)v23 setByAddingObjectsFromSet:v24];
              v26 = v8->_requiredTransitNetworkIdentifiers;
              v8->_requiredTransitNetworkIdentifiers = (NSSet *)v25;
            }
            if (v22 == 2) {
              uint64_t v27 = 4;
            }
            else {
              uint64_t v27 = 2 * (v22 == 1);
            }
            if (v27)
            {
              v28 = PKFeatureIdentifierToString(v27);
              [v13 addObject:v28];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v18);
      }

      uint64_t v29 = [v13 copy];
      allowedFeatureIdentifiers = v8->_allowedFeatureIdentifiers;
      v8->_allowedFeatureIdentifiers = (NSSet *)v29;

      v12 = v32;
      id v6 = v33;
    }
  }
  return v8;
}

- (BOOL)isWatchSupportedForProduct:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_paymentSetupFeatures;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v8 identifiers];
        v10 = (void *)MEMORY[0x1E4F1CAD0];
        v11 = [v4 supportedTransitNetworkIdentifiers];
        v12 = [v10 setWithArray:v11];
        int v13 = [v9 intersectsSet:v12];

        if (v13 && ([v8 supportedDevices] & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (void)dealloc
{
  if (self->_provisioningUserInterfaceIsVisible) {
    [(PKPaymentProvisioningController *)self noteProvisioningUserInterfaceDidDisappear];
  }
  [(NSTimer *)self->_descriptionTimer invalidate];
  [(PKPaymentWebService *)self->_webService removeDelegate:self];
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  if (self->_proxyTargetDeviceWebServiceInUse)
  {
    [(PKWebService *)self->_webService invalidate];
    webService = self->_webService;
    self->_webService = 0;
  }
  locationTimer = self->_locationTimer;
  if (locationTimer) {
    dispatch_source_cancel(locationTimer);
  }
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  [(PKPaymentProvisioningController *)self _endSessionIfNecessary];
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningController;
  [(PKPaymentProvisioningController *)&v5 dealloc];
}

- (void)_endSessionIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_featuresDidBeginReporting;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = +[PKAnalyticsReporter subjectToReportDashboardAnalyticsForFeature:](PKAnalyticsReporter, "subjectToReportDashboardAnalyticsForFeature:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "integerValue", (void)v8));
        if (v7) {
          +[PKAnalyticsReporter endSubjectReporting:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_beginReportingIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_featuresDidBeginReporting];
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v6 = v5;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = self;
  id v7 = self->_analyticsFeaturesToReport;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = PKFeatureIdentifierFromString(*(void **)(*((void *)&v19 + 1) + 8 * i));
        uint64_t v13 = +[PKAnalyticsReporter subjectToReportDashboardAnalyticsForFeature:v12];
        if (v13)
        {
          v14 = +[PKAnalyticsReporter reporterForSubject:v13];

          if (!v14)
          {
            v15 = [NSNumber numberWithUnsignedInteger:v12];
            [v6 addObject:v15];

            +[PKAnalyticsReporter beginSubjectReporting:v13];
          }
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [v6 copy];
  featuresDidBeginReporting = v18->_featuresDidBeginReporting;
  v18->_featuresDidBeginReporting = (NSSet *)v16;
}

- (int64_t)_defaultResetState
{
  return 0;
}

- (void)reset
{
  [(PKPaymentProvisioningController *)self resetForNewProvisioning];
  credentialProvisioningQueue = self->_credentialProvisioningQueue;
  [(PKPaymentProvisioningControllerCredentialQueue *)credentialProvisioningQueue setCredentialsToProvision:0];
}

- (void)resetForNewProvisioning
{
}

- (void)resetForNewProvisioningForce:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t state = self->_state;
  if (state != [(PKPaymentProvisioningController *)self _defaultResetState] || v3)
  {
    unint64_t v7 = [(PKPaymentProvisioningController *)self _defaultResetState];
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = PKPaymentProvisioningControllerStateToString(self->_state);
      uint64_t v10 = PKPaymentProvisioningControllerStateToString(v7);
      int v18 = 138412546;
      long long v19 = v9;
      __int16 v20 = 2112;
      long long v21 = v10;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Provisioning Controller Reset (from: %@ to: %@)", (uint8_t *)&v18, 0x16u);
    }
    [(PKPaymentProvisioningController *)self _setState:v7 notify:1];
    long long v11 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
    uint64_t v12 = objc_alloc_init(PKSecureElementProvisioningState);
    provisioningState = self->_provisioningState;
    self->_provisioningState = v12;

    [(PKSecureElementProvisioningState *)self->_provisioningState setReferrerIdentifier:v11];
    [(NSMutableOrderedSet *)self->_provisionedPasses removeAllObjects];
    moreInfoItems = self->_moreInfoItems;
    self->_moreInfoItems = 0;

    currentCredential = self->_currentCredential;
    self->_currentCredential = 0;

    currentAddPaymentPassRequestConfiguration = self->_currentAddPaymentPassRequestConfiguration;
    self->_currentAddPaymentPassRequestConfiguration = 0;

    automaticExpressModes = self->_automaticExpressModes;
    self->_automaticExpressModes = 0;

    self->_AMPEnrollmentAvailable = 0;
    [(PKWebService *)self->_webService resetWebServiceSessionMarker];
  }
}

- (void)_setState:(int64_t)a3 notify:(BOOL)a4
{
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    if (a4)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"PKPaymentProvisioningControllerStateDidChangeNotification" object:self];
    }
  }
}

- (void)validatePreconditions:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebService *)self->_webService targetDevice];

  if (v5)
  {
    PKTimeProfileBegin(0, @"validate");
    uint64_t v6 = [(PKPaymentWebService *)self->_webService targetDevice];
    webService = self->_webService;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke;
    v10[3] = &unk_1E56D84A0;
    v10[4] = self;
    id v11 = v4;
    [v6 paymentWebService:webService validateAddPreconditionsWithCompletion:v10];
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "No target device for preconditions, bailing out", buf, 2u);
    }

    if (v4)
    {
      uint64_t v9 = [(PKPaymentProvisioningController *)self displayableErrorForError:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
}

void __57__PKPaymentProvisioningController_validatePreconditions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_2;
  v9[3] = &unk_1E56D8BD0;
  char v13 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_2(uint64_t a1)
{
  v2 = @"YES";
  if (!*(unsigned char *)(a1 + 56)) {
    v2 = @"NO";
  }
  BOOL v3 = [NSString stringWithFormat:@"PKPaymentProvisioningController: Validate Preconditions result was %@ error %@", v2, *(void *)(a1 + 32)];
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  id v5 = PKTimeProfileEnd(v4, @"validate", v3);

  if (*(unsigned char *)(a1 + 56))
  {
    PKTimeProfileBegin(0, @"configure");
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(v6 + 344);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_3;
    v10[3] = &unk_1E56D9528;
    v10[4] = v6;
    id v11 = *(id *)(a1 + 48);
    +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:v7 completion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      if (*(void *)(a1 + 32))
      {
        (*(void (**)(void, void))(v8 + 16))(*(void *)(a1 + 48), 0);
      }
      else
      {
        uint64_t v9 = PKDisplayableErrorForCommonType(0, 0);
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
      }
    }
  }
}

void __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  id v5 = PKTimeProfileEnd(v4, @"configure", @"PKPaymentProvisioningController: Configure Web Service");

  if ([*(id *)(*(void *)(a1 + 32) + 344) registrationSetupSupportedInRegion])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_4;
    v9[3] = &unk_1E56D8B08;
    uint64_t v6 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v6 performDeviceCheckInIfNeeded:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) displayableErrorForError:v3];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

uint64_t __57__PKPaymentProvisioningController_validatePreconditions___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)registerDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKPaymentProvisioningController_registerDevice___block_invoke;
  v6[3] = &unk_1E56D8B08;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentProvisioningController *)self _registerDevice:v6];
}

uint64_t __50__PKPaymentProvisioningController_registerDevice___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerDevice:(id)a3
{
  id v4 = a3;
  PKTimeProfileBegin(0, @"register");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke;
  aBlock[3] = &unk_1E56D8978;
  id v5 = v4;
  aBlock[4] = self;
  id v17 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  if ([(PKPaymentWebService *)self->_webService _needsRegistrationShouldCheckSecureElementOwnership:1])
  {
    id v7 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (objc_opt_respondsToSelector())
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_2;
      v14[3] = &unk_1E56E9660;
      uint64_t v8 = &v15;
      id v15 = v6;
      [v7 performDeviceRegistrationReturningContextForReason:@"ProvisoningController" brokerURL:0 completion:v14];
    }
    else if (objc_opt_respondsToSelector())
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_4;
      v12[3] = &unk_1E56DC9D8;
      uint64_t v8 = &v13;
      id v13 = v6;
      [v7 performDeviceRegistrationForReason:@"ProvisoningController" brokerURL:0 completion:v12];
    }
    else
    {
      uint64_t v9 = +[PKDeviceRegistrationService sharedInstance];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_6;
      v10[3] = &unk_1E56E9660;
      uint64_t v8 = &v11;
      id v11 = v6;
      [v9 performDeviceRegistrationReturningContextForReason:@"ProvisoningController" brokerURL:0 actionType:1 completion:v10];
    }
  }
  else
  {
    (*((void (**)(void *, uint64_t, void, void))v6 + 2))(v6, 16, 0, 0);
  }
}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
  id v9 = PKTimeProfileEnd(v8, @"register", @"PKPaymentProvisioningController: Register");

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    if ((a2 & 0x10) == 0 || v7)
    {
      id v11 = [*(id *)(a1 + 32) displayableErrorForError:v7];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 344), "updateContextAndNotifyIfNeeded:");
        uint64_t v10 = *(void *)(a1 + 40);
      }
      (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, 1, 0);
    }
  }
}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_3;
  v11[3] = &unk_1E56D8950;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = a2;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __51__PKPaymentProvisioningController__registerDevice___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_5;
  block[3] = &unk_1E56D8590;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__PKPaymentProvisioningController__registerDevice___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

void __51__PKPaymentProvisioningController__registerDevice___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PKPaymentProvisioningController__registerDevice___block_invoke_7;
  v11[3] = &unk_1E56D8950;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = a2;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __51__PKPaymentProvisioningController__registerDevice___block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (void)validatePreconditionsAndRegister:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke;
  v6[3] = &unk_1E56D8928;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentProvisioningController *)self validatePreconditions:v6];
}

void __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke_2;
    v8[3] = &unk_1E56D8B08;
    id v6 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v6 registerDevice:v8];
  }
}

uint64_t __68__PKPaymentProvisioningController_validatePreconditionsAndRegister___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)preflightWithCompletion:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(PKPaymentProvisioningController *)self _hasSetupConfiguration];
  if (v4) {
    uint64_t v5 = 493;
  }
  else {
    uint64_t v5 = 495;
  }
  if (v4) {
    uint64_t v6 = 493;
  }
  else {
    uint64_t v6 = 263;
  }
  [(PKPaymentProvisioningController *)self preflightWithRequirements:v5 completionRequirements:v6 completion:v7];
}

- (void)preflightWithRequirements:(unint64_t)a3 completionRequirements:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentProvisioningController_preflightWithRequirements_completionRequirements_completion___block_invoke;
  v10[3] = &unk_1E56E9930;
  id v12 = v15;
  unint64_t v13 = a3;
  void v10[4] = self;
  unint64_t v14 = a4;
  id v9 = v8;
  id v11 = v9;
  [(PKPaymentProvisioningController *)self preflightWithRequirements:a3 update:v10];

  _Block_object_dispose(v15, 8);
}

void __95__PKPaymentProvisioningController_preflightWithRequirements_completionRequirements_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v7 = a1[4];
    id v10 = v5;
    if (*(void *)(v7 + 336) == 1
      || (uint64_t v8 = objc_msgSend(*(id *)(v7 + 344), "paymentSetupSupportedInRegion", v5), v6 = v10, v8 == 2))
    {
      id v9 = a1 + 7;
      if (v6) {
        goto LABEL_8;
      }
    }
    else
    {
      id v9 = a1 + 8;
      if (v10)
      {
LABEL_8:
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
        (*(void (**)(void))(a1[5] + 16))();
        uint64_t v6 = v10;
        goto LABEL_9;
      }
    }
    if ((*v9 & a2) != *v9) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)preflightWithRequirements:(unint64_t)a3 update:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke;
  v10[3] = &unk_1E56D8950;
  id v12 = v6;
  unint64_t v13 = a3;
  void v10[4] = self;
  id v11 = v7;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if ((v2 & ~*(void *)(v3 + 368)) != 0)
    {
      uint64_t v7 = *(void **)(a1 + 48);
      if (v7)
      {
        id v8 = *(void **)(v3 + 216);
        id v9 = (void *)[v7 copy];
        id v10 = _Block_copy(v9);
        [v8 addObject:v10];

        uint64_t v3 = *(void *)(a1 + 32);
      }
      if (*(unsigned char *)(v3 + 224))
      {
        id v11 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController already preflighting", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_208;
        aBlock[3] = &unk_1E56E9958;
        uint64_t v12 = *(void *)(a1 + 56);
        aBlock[4] = v3;
        void aBlock[5] = v12;
        unint64_t v13 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
        *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
        PKTimeProfileBegin(0, @"preflight");
        unint64_t v14 = objc_alloc_init(PKAsyncUnaryOperationComposer);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v60 = 0x2020000000;
        char v61 = 0;
        v56[0] = 0;
        v56[1] = v56;
        v56[2] = 0x2020000000;
        char v57 = 0;
        if (v13[2](v13, 256))
        {
          if (PKLocationServicesEnabled())
          {
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2;
            v53[3] = &unk_1E56E9980;
            uint64_t v15 = *(void **)(a1 + 32);
            id v16 = *(id *)(a1 + 40);
            uint64_t v17 = *(void *)(a1 + 32);
            id v54 = v16;
            uint64_t v55 = v17;
            [v15 _startLocationSearchWithTimeout:v53 completion:3.0];
          }
          [*(id *)(a1 + 32) _updatePreflightRequirement:256 displayableError:0];
        }
        if (v13[2](v13, 1))
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3;
          v48[3] = &unk_1E56E3958;
          id v18 = *(id *)(a1 + 40);
          uint64_t v19 = *(void *)(a1 + 32);
          id v49 = v18;
          uint64_t v50 = v19;
          p_long long buf = &buf;
          v52 = v56;
          [(PKAsyncUnaryOperationComposer *)v14 addOperation:v48];
        }
        else
        {
          BOOL v20 = [*(id *)(*(void *)(a1 + 32) + 344) paymentSetupSupportedInRegion] == 1;
          *(unsigned char *)(*((void *)&buf + 1) + 24) = v20;
        }
        if (v13[2](v13, 4))
        {
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6;
          v45[3] = &unk_1E56E1DD0;
          id v21 = *(id *)(a1 + 40);
          uint64_t v22 = *(void *)(a1 + 32);
          id v46 = v21;
          uint64_t v47 = v22;
          [(PKAsyncUnaryOperationComposer *)v14 addOperation:v45];
        }
        if (v13[2](v13, 2))
        {
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8;
          v40[3] = &unk_1E56E9A90;
          id v23 = *(id *)(a1 + 40);
          uint64_t v24 = *(void *)(a1 + 32);
          id v41 = v23;
          uint64_t v42 = v24;
          uint64_t v25 = *(void *)(a1 + 56);
          v43 = &buf;
          uint64_t v44 = v25;
          [(PKAsyncUnaryOperationComposer *)v14 addOperation:v40];
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_227;
        v35[3] = &unk_1E56E9B80;
        id v36 = *(id *)(a1 + 40);
        v26 = v13;
        uint64_t v37 = *(void *)(a1 + 32);
        v38 = v26;
        uint64_t v39 = &buf;
        [(PKAsyncUnaryOperationComposer *)v14 addOperation:v35];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_10;
        v34[3] = &unk_1E56E9BA8;
        v34[4] = *(void *)(a1 + 32);
        v34[5] = v56;
        v34[6] = &buf;
        [(PKAsyncUnaryOperationComposer *)v14 addOperation:v34];
        uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_11;
        v31[3] = &unk_1E56E9BD0;
        id v28 = *(id *)(a1 + 40);
        uint64_t v29 = *(void *)(a1 + 32);
        id v32 = v28;
        uint64_t v33 = v29;
        id v30 = [(PKAsyncUnaryOperationComposer *)v14 evaluateWithInput:v27 completion:v31];

        _Block_object_dispose(v56, 8);
        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v2;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController has already been preflighted with requirements result: %lu", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v5 = *(void *)(a1 + 48);
      if (v5) {
LABEL_6:
      }
        (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(*(void *)(a1 + 32) + 368), 0);
    }
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController cannot preflight with no requirements", (uint8_t *)&buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      goto LABEL_6;
    }
  }
}

BOOL __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_208(uint64_t a1, uint64_t a2)
{
  return (a2 & ~*(void *)(a1 + 40)) == 0 && (a2 & ~*(void *)(*(void *)(a1 + 32) + 368)) != 0;
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2(uint64_t a1, void *a2)
{
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__39;
  v42[4] = __Block_byref_object_dispose__39;
  id v43 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  id v11 = *(void **)(a1 + 40);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_215;
  v36[3] = &unk_1E56E99A8;
  v38 = v44;
  uint64_t v39 = v42;
  uint64_t v12 = v10;
  uint64_t v37 = v12;
  [v11 validatePreconditions:v36];
  PKTimeProfileBegin(0, @"under_13");
  dispatch_group_enter(v12);
  unint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 344) targetDevice];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_221;
  v32[3] = &unk_1E56E99F0;
  id v34 = &__block_literal_global_120;
  long long v35 = v40;
  unint64_t v14 = v12;
  uint64_t v33 = v14;
  [v13 familyMembersWithCompletion:v32];
  uint64_t v15 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v15 + 296))
  {
    dispatch_group_enter(v14);
    id v16 = *(void **)(*(void *)(a1 + 40) + 8);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4;
    v28[3] = &unk_1E56E99F0;
    id v30 = &__block_literal_global_120;
    v31 = v41;
    uint64_t v29 = v14;
    [v16 familyMembersWithCompletion:v28];

    uint64_t v15 = *(void *)(a1 + 40);
  }
  uint64_t v17 = *(NSObject **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5;
  v20[3] = &unk_1E56E9A18;
  id v23 = v40;
  uint64_t v24 = v41;
  long long v25 = *(_OWORD *)(a1 + 48);
  v26 = v42;
  uint64_t v27 = v44;
  id v21 = v8;
  id v22 = v9;
  v20[4] = v15;
  id v18 = v8;
  id v19 = v9;
  dispatch_group_notify(v14, v17, v20);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_215(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2_216(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = 1;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isMe", (void)v10))
      {
        if ([v8 isChildAccount]) {
          break;
        }
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v6 = 2;
  }

  return v6;
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_221(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
  id v2 = a1[4];
  dispatch_group_leave(v2);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
  id v2 = a1[4];
  dispatch_group_leave(v2);
}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  id v3 = PKTimeProfileEnd(v2, @"under_13", @"PKPaymentProvisioningController: iCloud Family Check");

  *(void *)(*(void *)(a1 + 32) + 232) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 296)) {
    uint64_t v5 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  *(void *)(v4 + 336) = *(void *)(*(void *)(v5 + 8) + 24);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 344) paymentSetupSupportedInRegion] == 1;
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    [*(id *)(a1 + 32) _updatePreflightRequirement:1 displayableError:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v7();
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7;
  v13[3] = &unk_1E56E9A40;
  id v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v6;
  id v17 = v7;
  id v11 = v6;
  id v12 = v7;
  [v8 registerDevice:v13];
}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 40) _updatePreflightRequirement:4 displayableError:a3];
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 40);
  if (v8[42] == 1 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) _updatePreflightRequirement:2 displayableError:0];
    v7[2](v7, v6, 0);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9;
    v11[3] = &unk_1E56E9A68;
    id v9 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v13 = v10;
    uint64_t v15 = v7;
    id v14 = v6;
    [v8 cachedPaymentSetupProductModelWithCompletion:v11];
  }
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (*(unsigned char *)(a1 + 64) & 2) != 0)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2112;
      id v10 = v3;
      id v6 = v8;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%@ was not able to load cached products skipping preflight update. Non critical error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) _updatePreflightRequirement:2 displayableError:v3];
  }
  (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), 0, v4);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_227(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = dispatch_group_create();
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__39;
  v46[4] = __Block_byref_object_dispose__39;
  id v47 = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    dispatch_group_enter(v10);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2_228;
    v41[3] = &unk_1E56E9B08;
    uint64_t v11 = *(void **)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    char v45 = v46;
    uint64_t v13 = *(void *)(a1 + 40);
    id v42 = v12;
    uint64_t v43 = v13;
    uint64_t v44 = v10;
    [v11 retrieveAllAvailableCredentials:v41];
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) != 0
    || (*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v14 = *(void **)(a1 + 40);
    if (v14[42] == 1)
    {
      [v14 _updatePreflightRequirement:10 displayableError:0];
    }
    else
    {
      dispatch_group_enter(v10);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5_233;
      v36[3] = &unk_1E56E9B30;
      uint64_t v15 = *(void **)(a1 + 40);
      id v16 = *(id *)(a1 + 32);
      v40 = v46;
      uint64_t v17 = *(void *)(a1 + 40);
      id v37 = v16;
      uint64_t v38 = v17;
      uint64_t v39 = v10;
      [v15 updatePaymentSetupProductModelWithCompletionHandler:v36];
    }
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v18 = *(void **)(a1 + 40);
    if (v18[42] == 1 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [v18 _updatePreflightRequirement:64 displayableError:0];
    }
    else
    {
      dispatch_group_enter(v10);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6_234;
      v32[3] = &unk_1E56D8AB8;
      id v19 = *(void **)(a1 + 40);
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      id v33 = v20;
      uint64_t v34 = v21;
      long long v35 = v10;
      [v19 _updatePaymentSetupProductModelExtensionsWithCompletion:v32];
    }
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    if (PKDisableDynamicSEAllocation())
    {
      [*(id *)(a1 + 40) _updatePreflightRequirement:128 displayableError:0];
    }
    else
    {
      PKTimeProfileBegin(0, @"secure_element_snapshot");
      dispatch_group_enter(v10);
      id v22 = [*(id *)(*(void *)(a1 + 40) + 344) targetDevice];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7_238;
      v30[3] = &unk_1E56E9B58;
      v30[4] = *(void *)(a1 + 40);
      v31 = v10;
      [v22 currentSecureElementSnapshot:v30];
    }
  }
  id v23 = *(NSObject **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9_241;
  v26[3] = &unk_1E56DF8B0;
  id v28 = v9;
  uint64_t v29 = v46;
  id v27 = v8;
  id v24 = v8;
  id v25 = v9;
  dispatch_group_notify(v10, v23, v26);

  _Block_object_dispose(v46, 8);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_2_228(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 40) _doesDisplayableErrorConstitutePreflightFailure:a3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  [*(id *)(*(void *)(a1 + 40) + 40) removeAllObjects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_229;
  void v15[3] = &unk_1E56E9AE0;
  id v10 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v16 = v11;
  uint64_t v17 = v12;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v13 = (id)v14;
  long long v18 = v14;
  [v10 _associateCredentials:v6 withCompletionHandler:v15];
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_3_229(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4_230;
  v7[3] = &unk_1E56E9AB8;
  id v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v10 = v6;
  [v2 _updateAllAssoicatedCredentialsMetadataWithCompletion:v7];
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_4_230(uint64_t a1)
{
  [*(id *)(a1 + 40) _updatePreflightRequirement:32 displayableError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_5_233(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "_doesDisplayableErrorConstitutePreflightFailure:");
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  [*(id *)(a1 + 40) _updatePreflightRequirement:10 displayableError:v2];
  long long v6 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v6);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_6_234(uint64_t a1)
{
  [*(id *)(a1 + 40) _updatePreflightRequirement:64 displayableError:0];
  uint64_t v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_7_238(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8_239;
  block[3] = &unk_1E56D8AB8;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_8_239(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 392), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _updatePreflightRequirement:128 displayableError:0];
  uint64_t v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

uint64_t __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_9_241(void *a1)
{
  return (*(uint64_t (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40) != 0);
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v10 = (void (*)(void *))a4[2];
    id v8 = a4;
    id v22 = a3;
    v10(v8);
    goto LABEL_23;
  }
  long long v6 = *(void **)(*(void *)(a1 + 32) + 40);
  id v7 = a4;
  id v8 = a3;
  if (![v6 count])
  {
    id v11 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
    uint64_t v12 = [v11 deviceRegion];

    if (*(unsigned char *)(*(void *)(a1 + 32) + 301)
      && ((id v13 = v12, v13 == @"PR")
       || (long long v14 = v13) != 0
       && (int v15 = [(__CFString *)v13 isEqualToString:@"PR"], v14, v15)))
    {
      int v16 = PKIsPhone() ^ 1;
    }
    else
    {
      LOBYTE(v16) = 1;
    }
    if (*(void *)(*(void *)(a1 + 32) + 336) == 1)
    {
      uint64_t v17 = 5;
    }
    else
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        LOBYTE(v16) = 1;
      }
      if ((v16 & 1) == 0)
      {
        long long v18 = PKCurrentMobileCarrierRegion();
        id v19 = [*(id *)(*(void *)(a1 + 32) + 424) filteredPaymentSetupProductModel:*(void *)(*(void *)(a1 + 32) + 344) mobileCarrierRegion:v18 deviceRegion:v12 cardOnFiles:0];
        uint64_t v20 = [v19 count];
        uint64_t v21 = 0;
        if (!v20)
        {
          uint64_t v21 = PKDisplayableErrorForCommonType(4, 0);
        }
        id v23 = (id)v21;

        goto LABEL_21;
      }
      uint64_t v17 = 4;
    }
    PKDisplayableErrorForCommonType(v17, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    id v9 = v23;
    goto LABEL_22;
  }
  id v9 = 0;
LABEL_22:
  id v22 = v9;
  [*(id *)(a1 + 32) _updatePreflightRequirement:1 displayableError:v9];
  ((void (*)(void *, void *, void))v7[2])(v7, v8, 0);

LABEL_23:
}

void __68__PKPaymentProvisioningController_preflightWithRequirements_update___block_invoke_11(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 40) + 216) removeAllObjects];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  id v3 = PKTimeProfileEnd(v2, @"preflight", @"PKPaymentProvisioningController: Preflight Total");

  *(unsigned char *)(*(void *)(a1 + 40) + 224) = 0;
}

- (void)_updatePreflightRequirement:(unint64_t)a3 displayableError:(id)a4
{
  id v6 = a4;
  id v7 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = (void *)[(NSMutableArray *)self->_preflighUpdateHandlers copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaymentProvisioningController__updatePreflightRequirement_displayableError___block_invoke;
  v11[3] = &unk_1E56E9BF8;
  id v12 = v6;
  id v13 = self;
  id v14 = v8;
  unint64_t v15 = a3;
  id v9 = v8;
  id v10 = v6;
  dispatch_async(v7, v11);
}

uint64_t __80__PKPaymentProvisioningController__updatePreflightRequirement_displayableError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v16 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Error: PKPaymentProvisioningController Preflight encountered: %@", buf, 0xCu);
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 368) |= *(void *)(a1 + 56);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_preflightRequirementsUpdated:displayableError:", *(void *)(*(void *)(a1 + 40) + 368), *(void *)(a1 + 32), (void)v10);
}

- (id)_doesDisplayableErrorConstitutePreflightFailure:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 userInfo];
    uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v6 && [v6 code] == -1009) {
      id v7 = v4;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)performDeviceCheckInIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v6 = objc_opt_respondsToSelector();
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Requesting device check in", buf, 2u);
    }

    PKTimeProfileBegin(0, @"check_in");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke;
    v9[3] = &unk_1E56D8B08;
    id v10 = v4;
    [v5 performDeviceCheckInWithCompletion:v9];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Target Device does not support check in", buf, 2u);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

void __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  char v6 = @"NO";
  if (a2) {
    char v6 = @"YES";
  }
  id v7 = [NSString stringWithFormat:@"PKPaymentProvisioningController: Device check in success: %@ error: %@", v6, v5];
  id v8 = PKTimeProfileEnd(0, @"check_in", v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke_2;
  block[3] = &unk_1E56D8478;
  id v9 = *(id *)(a1 + 32);
  char v14 = a2;
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PKPaymentProvisioningController_performDeviceCheckInIfNeeded___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)retrieveRemoteCredentials:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKPaymentRemoteCredentialsRequest);
  if (PKShowFakeRemoteCredentials())
  {
    char v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Delivering fake cards on file as requested by toggle", buf, 2u);
    }

    id v7 = +[PKPaymentCredential fakeRemoteCredentials];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke;
    v26[3] = &unk_1E56E9C20;
    id v27 = v5;
    id v8 = objc_msgSend(v7, "pk_objectsPassingTest:", v26);

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2;
    block[3] = &unk_1E56D83D8;
    id v9 = v4;
    id v24 = v8;
    id v25 = v9;
    id v10 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);

    long long v11 = v27;
  }
  else
  {
    *(void *)long long buf = 0;
    uint64_t v20 = buf;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    webService = self->_webService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_3;
    v16[3] = &unk_1E56E9CE8;
    v16[4] = self;
    uint64_t v17 = (PKPaymentRemoteCredentialsRequest *)v4;
    long long v18 = buf;
    uint64_t v13 = [(PKPaymentWebService *)webService remotePaymentCredentialsForRequest:v5 completion:v16];
    *((void *)v20 + 3) = v13;
    tasks = self->_tasks;
    unint64_t v15 = [NSNumber numberWithUnsignedInteger:v13];
    [(NSMutableSet *)tasks addObject:v15];

    _Block_object_dispose(buf, 8);
    long long v11 = v17;
  }
}

BOOL __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) credentialType])
  {
    uint64_t v4 = [*(id *)(a1 + 32) credentialType];
    BOOL v5 = v4 == [v3 credentialType];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, uint64_t, void, id))(v1 + 16))(v1, 1, 0, v2);
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_4;
  v13[3] = &unk_1E56E9CC0;
  uint64_t v19 = a2;
  uint64_t v9 = a1[4];
  id v10 = (void *)a1[5];
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v7;
  id v17 = v10;
  uint64_t v18 = a1[6];
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_4(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v27 = a1;
  if (!v2)
  {
    uint64_t v1 = [*(id *)(a1 + 32) domain];
    if ([v1 isEqualToString:*MEMORY[0x1E4F289A0]])
    {

      uint64_t v3 = v27;
LABEL_9:
      char v6 = [*(id *)(v3 + 40) displayableErrorForError:*(void *)(v3 + 32)];
      uint64_t v7 = v27;
      uint64_t v8 = *(void *)(v27 + 56);
      if (v8) {
        (*(void (**)(uint64_t, void, void *, void))(v8 + 16))(v8, 0, v6, 0);
      }

      goto LABEL_22;
    }
    a1 = v27;
  }
  uint64_t v4 = [*(id *)(a1 + 32) domain];
  if ([v4 isEqualToString:@"PKWebServiceErrorDomain"])
  {
    uint64_t v3 = v27;
    uint64_t v5 = [*(id *)(v27 + 32) code];

    if (!v2) {
    if (v5 == 1)
    }
      goto LABEL_9;
  }
  else
  {

    uint64_t v3 = v27;
    if (!v2) {
  }
    }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  id v25 = [*(id *)(*(void *)(v3 + 40) + 344) targetDevice];
  v26 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v10 = [*(id *)(*(void *)(v3 + 40) + 344) context];
  id v11 = [v10 configuration];
  id v12 = [v11 credentialTypesRequiringMetadata];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v13 = [*(id *)(v27 + 48) credentials];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * v16);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_5;
        v31[3] = &unk_1E56E9C70;
        void v31[4] = v17;
        id v18 = v12;
        id v36 = v41;
        uint64_t v19 = *(void *)(v27 + 40);
        id v32 = v18;
        uint64_t v33 = v19;
        id v34 = v25;
        id v35 = v9;
        [(PKAsyncUnaryOperationComposer *)v26 addOperation:v31];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v14);
  }

  uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_267;
  v28[3] = &unk_1E56E9C98;
  id v21 = v9;
  id v29 = v21;
  id v30 = *(id *)(v27 + 56);
  id v22 = [(PKAsyncUnaryOperationComposer *)v26 evaluateWithInput:v20 completion:v28];

  _Block_object_dispose(v41, 8);
  uint64_t v7 = v27;
LABEL_22:
  id v23 = *(void **)(*(void *)(v7 + 40) + 24);
  id v24 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(v7 + 64) + 8) + 24)];
  [v23 removeObject:v24];
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = objc_msgSend(NSString, "pk_stringWithInteger:", objc_msgSend(*(id *)(a1 + 32), "credentialType"));
  objc_msgSend(*(id *)(a1 + 32), "setRequiresMetadata:", objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8));
  [*(id *)(a1 + 32) setRank:(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))++];
  uint64_t v9 = [*(id *)(a1 + 32) credentialType];
  if (*(unsigned char *)(*(void *)(a1 + 48) + 296))
  {
    uint64_t v10 = v9;
    if ([*(id *)(a1 + 32) cardType] != 2
      && [*(id *)(a1 + 32) cardType] != 3
      && (unint64_t)(v10 - 127) >= 2
      && v10 != 135)
    {
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = *(__CFString **)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        id v32 = v22;
        id v23 = "Provisioning for alt account, remote credential was not supported type: %@";
LABEL_25:
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
  }
  id v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 48) + 296)) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    id v32 = v12;
    __int16 v33 = 2112;
    uint64_t v34 = v13;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Provisioning for alt account %@, remote credential supported: %@", buf, 0x16u);
  }

  if (!PKShouldDisplayRemoteCredentialWithStatus(*(void **)(a1 + 32))) {
    goto LABEL_27;
  }
  uint64_t v14 = [*(id *)(a1 + 32) fidoProfile];

  if (!v14)
  {
    [*(id *)(a1 + 64) addObject:*(void *)(a1 + 32)];
LABEL_27:
    v7[2](v7, v6, 0);
    goto LABEL_28;
  }
  if ([*(id *)(a1 + 32) credentialType] == 130
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 56) areUnifiedAccessPassesSupported] & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = *(__CFString **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      id v32 = v25;
      id v23 = "Credential is Unified Access yet Target device doesn't support unified access. Credential: %@";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = *(__CFString **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      id v32 = v24;
      id v23 = "Remote credential requires FIDO key check, but target device doesn't support that. Credential: %@";
      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v15 = [*(id *)(a1 + 32) fidoProfile];
  uint64_t v16 = *(void **)(a1 + 56);
  uint64_t v17 = [v15 relyingPartyIdentifier];
  id v18 = [v15 accountHash];
  uint64_t v19 = [v15 keyHash];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_265;
  v26[3] = &unk_1E56E9C48;
  id v20 = *(id *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 32);
  id v27 = v20;
  uint64_t v28 = v21;
  id v30 = v7;
  id v29 = v6;
  [v16 checkFidoKeyPresenceForRelyingParty:v17 relyingPartyAccountHash:v18 fidoKeyHash:v19 completion:v26];

LABEL_28:
}

uint64_t __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_265(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_267(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2_268;
  v2[3] = &unk_1E56D8A18;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __61__PKPaymentProvisioningController_retrieveRemoteCredentials___block_invoke_2_268(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Credentials retrieved: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, uint64_t, void, void *))(v4 + 16))(v4, 1, 0, v5);
  }
}

- (id)_supportedFeatureIdentifierStrings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[PKWalletVisibility isWalletRestricted];
  supportedFeatureIdentifierStrings = self->_supportedFeatureIdentifierStrings;
  if (v3)
  {
    self->_supportedFeatureIdentifierStrings = 0;

    uint64_t v5 = 0;
    goto LABEL_17;
  }
  if (![(NSSet *)supportedFeatureIdentifierStrings count])
  {
    int v6 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v6 supportedFeatureIdentifiersWithPaymentWebService:self->_webService];
      uint64_t v8 = (NSSet *)[v7 mutableCopy];

      uint64_t v9 = PKLogFacilityTypeGetObject(0xDuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        uint64_t v15 = v8;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Target device supports features: %@", (uint8_t *)&v14, 0xCu);
      }

      if (!v8 || !self->_allowedFeatureIdentifiers) {
        goto LABEL_15;
      }
      -[NSSet intersectSet:](v8, "intersectSet:");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
        int v14 = 138412546;
        uint64_t v15 = allowedFeatureIdentifiers;
        __int16 v16 = 2112;
        uint64_t v17 = v8;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Allowed features: %@ resulted in filtered features to show: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      uint64_t v9 = PKLogFacilityTypeGetObject(0xDuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Target device does not implement supportedFeatureIdentifiersWithPaymentWebService:", (uint8_t *)&v14, 2u);
      }
      uint64_t v8 = 0;
    }

LABEL_15:
    id v11 = self->_supportedFeatureIdentifierStrings;
    self->_supportedFeatureIdentifierStrings = v8;
    id v12 = v8;

    [(NSMutableSet *)self->_analyticsFeaturesToReport removeAllObjects];
    [(NSMutableSet *)self->_analyticsFeaturesToReport unionSet:self->_supportedFeatureIdentifierStrings];

    [(PKPaymentProvisioningController *)self _beginReportingIfNecessary];
  }
  uint64_t v5 = self->_supportedFeatureIdentifierStrings;
LABEL_17:
  return v5;
}

- (id)_supportedFeatureIdentifierStringsForAccountProvisioning
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[PKWalletVisibility isWalletRestricted];
  supportedFeatureIdentifierStringsForAccountProvisioning = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
  if (v3)
  {
    self->_supportedFeatureIdentifierStringsForAccountProvisioning = 0;

    uint64_t v5 = 0;
  }
  else
  {
    if (![(NSSet *)supportedFeatureIdentifierStringsForAccountProvisioning count])
    {
      int v6 = [(PKPaymentWebService *)self->_webService targetDevice];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [v6 supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:self->_webService];
        uint64_t v8 = (NSSet *)[v7 mutableCopy];

        uint64_t v9 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          __int16 v16 = v8;
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Target device supports account provisioning features: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        uint64_t v10 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Target device does not implement supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService: Falling back to more restrictive _supportedFeatureIdentifierStrings.", (uint8_t *)&v15, 2u);
        }

        uint64_t v9 = [(PKPaymentProvisioningController *)self _supportedFeatureIdentifierStrings];
        uint64_t v8 = [v9 mutableCopy];
      }

      if (v8 && self->_allowedFeatureIdentifiers)
      {
        -[NSSet intersectSet:](v8, "intersectSet:");
        id v11 = PKLogFacilityTypeGetObject(0xDuLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
          int v15 = 138412546;
          __int16 v16 = allowedFeatureIdentifiers;
          __int16 v17 = 2112;
          uint64_t v18 = v8;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Allowed features: %@ resulted in filtered features to show: %@", (uint8_t *)&v15, 0x16u);
        }
      }
      uint64_t v13 = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
      self->_supportedFeatureIdentifierStringsForAccountProvisioning = v8;
    }
    uint64_t v5 = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
  }
  return v5;
}

- (void)setAllowedFeatureIdentifiers:(id)a3
{
  uint64_t v7 = (NSSet *)a3;
  if (self->_allowedFeatureIdentifiers != v7)
  {
    objc_storeStrong((id *)&self->_allowedFeatureIdentifiers, a3);
    supportedFeatureIdentifierStrings = self->_supportedFeatureIdentifierStrings;
    self->_supportedFeatureIdentifierStrings = 0;

    supportedFeatureIdentifierStringsForAccountProvisioning = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
    self->_supportedFeatureIdentifierStringsForAccountProvisioning = 0;

    [(NSMutableSet *)self->_analyticsFeaturesToReport removeAllObjects];
    [(NSMutableSet *)self->_analyticsFeaturesToReport unionSet:v7];
    [(PKPaymentProvisioningController *)self _beginReportingIfNecessary];
  }
}

- (void)retrieveAccountCredentials:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke;
    v8[3] = &unk_1E56D87E8;
    void v8[4] = self;
    id v9 = v4;
    [v5 updatedAccountsForProvisioningWithCompletion:v8];
  }
  else
  {
    int v6 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Target device does not implement updatedAccountsForProvisioningWithCompletion", v7, 2u);
    }

    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke_2;
  block[3] = &unk_1E56D89F0;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKPaymentProvisioningController_retrieveAccountCredentials___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _supportedFeatureIdentifierStringsForAccountProvisioning];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v18 = a1;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        unint64_t v10 = [v9 feature];
        id v11 = PKFeatureIdentifierToString(v10);
        if ([v2 containsObject:v11])
        {
          id v12 = 0;
          if (v10 <= 5)
          {
            if (((1 << v10) & 0x36) != 0) {
              goto LABEL_9;
            }
            if (v10 == 3)
            {
              int v14 = [v9 payLaterDetails];
              if (![v14 hasProvisionedPass])
              {

                goto LABEL_20;
              }
              char v15 = [*(id *)(v18 + 32) hasPayLaterPass];

              if (v15) {
LABEL_20:
              }
                id v12 = 0;
              else {
LABEL_9:
              }
                id v12 = [[PKAccountCredential alloc] initWithAccount:v9];
            }
          }
          [v3 safelyAddObject:v12];
          goto LABEL_13;
        }
        PKLogFacilityTypeGetObject(0xDuLL);
        id v12 = (PKAccountCredential *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v9 accountIdentifier];
          *(_DWORD *)long long buf = 138543362;
          id v24 = v13;
          _os_log_impl(&dword_190E10000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Account :%{public}@ not supported by device", buf, 0xCu);
        }
LABEL_13:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }

  uint64_t v17 = *(void *)(v18 + 48);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v3);
  }
}

- (id)_fetchOrCreateProductsForIdentifier:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[PKPaymentSetupProductModel productsForFeatureIdentifier:](self->_paymentSetupProductModel, "productsForFeatureIdentifier:");
  uint64_t v6 = [v5 count];
  if (a3 == 4 || v6)
  {
    unint64_t v10 = v5;
  }
  else
  {
    uint64_t v7 = [[PKPaymentSetupProduct alloc] initWithFeatureIdentifier:a3];
    uint64_t v8 = [(PKPaymentProvisioningController *)self _accountsForFeatureIdentifier:a3];
    [(PKPaymentSetupProduct *)v7 setAccounts:v8];
    v12[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    unint64_t v10 = [(PKPaymentProvisioningController *)self _filterPaymentSetupProducts:v9];

    if ([v10 count]) {
      [(PKPaymentSetupProductModel *)self->_paymentSetupProductModel updatePaymentSetupProducts:v10];
    }
  }
  return v10;
}

- (void)_setupFeatureApplications:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v26 = self;
  id obj = [(PKPaymentProvisioningController *)self _supportedFeatureIdentifierStrings];
  uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v45;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v4;
        uint64_t v5 = PKFeatureIdentifierFromString(*(void **)(*((void *)&v44 + 1) + 8 * v4));
        uint64_t v6 = [(PKPaymentProvisioningController *)v26 _fetchOrCreateProductsForIdentifier:v5];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v29 = v6;
        uint64_t v32 = [v6 countByEnumeratingWithState:&v40 objects:v53 count:16];
        if (v32)
        {
          uint64_t v31 = *(void *)v41;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v41 != v31) {
                objc_enumerationMutation(v29);
              }
              __int16 v33 = *(void **)(*((void *)&v40 + 1) + 8 * v7);
              uint64_t v34 = v7;
              id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v8 = v30;
              uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v52 count:16];
              if (v9)
              {
                uint64_t v10 = v9;
                uint64_t v11 = *(void *)v37;
                do
                {
                  for (uint64_t i = 0; i != v10; ++i)
                  {
                    if (*(void *)v37 != v11) {
                      objc_enumerationMutation(v8);
                    }
                    uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                    if (v5 != [v13 feature])
                    {
                      char v15 = PKLogFacilityTypeGetObject(0xDuLL);
                      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                      {
                        long long v20 = [v13 applicationIdentifier];
                        *(_DWORD *)long long buf = 138543362;
                        id v49 = v20;
                        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Application :%{public}@ not supported by device", buf, 0xCu);
                      }
                      goto LABEL_26;
                    }
                    unint64_t v14 = [v13 applicationState];
                    char v15 = PKLogFacilityTypeGetObject(0xDuLL);
                    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
                    if (v14 > 0x10 || ((0x101F0u >> v14) & 1) == 0)
                    {
                      if (v16)
                      {
                        uint64_t v18 = [v13 applicationIdentifier];
                        long long v19 = PKFeatureApplicationStateToString([v13 applicationState]);
                        *(_DWORD *)long long buf = 138543618;
                        id v49 = v18;
                        __int16 v50 = 2114;
                        objc_super v51 = v19;
                        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Application: %{public}@ in state: %{public}@ not being offered", buf, 0x16u);
                      }
LABEL_26:

                      continue;
                    }
                    if (v16)
                    {
                      long long v21 = [v13 applicationIdentifier];
                      long long v22 = PKFeatureApplicationStateToString([v13 applicationState]);
                      *(_DWORD *)long long buf = 138543618;
                      id v49 = v21;
                      __int16 v50 = 2114;
                      objc_super v51 = v22;
                      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Application: %{public}@ in state: %{public}@ is being offered", buf, 0x16u);
                    }
                    [v35 addObject:v13];
                  }
                  uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v52 count:16];
                }
                while (v10);
              }

              id v23 = (void *)[v35 copy];
              [v33 setFeatureApplications:v23];

              uint64_t v7 = v34 + 1;
            }
            while (v34 + 1 != v32);
            uint64_t v32 = [v29 countByEnumeratingWithState:&v40 objects:v53 count:16];
          }
          while (v32);
        }

        uint64_t v4 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v27);
  }
}

- (void)_setupAccounts
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(PKPaymentProvisioningController *)self _supportedFeatureIdentifierStrings];
  uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v33;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v3;
        uint64_t v4 = PKFeatureIdentifierFromString(*(void **)(*((void *)&v32 + 1) + 8 * v3));
        uint64_t v5 = [(PKPaymentProvisioningController *)self _fetchOrCreateProductsForIdentifier:v4];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v22 = v5;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v23 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v29 != v23) {
                objc_enumerationMutation(v22);
              }
              uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v10 = [(PKPaymentProvisioningController *)self _accountsForFeatureIdentifier:v4];
              BOOL preventsFeatureApplications = self->_preventsFeatureApplications;
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
              LOBYTE(v13) = preventsFeatureApplications;
              if (v12)
              {
                uint64_t v14 = v12;
                uint64_t v15 = *(void *)v25;
                do
                {
                  for (uint64_t j = 0; j != v14; ++j)
                  {
                    if (*(void *)v25 != v15) {
                      objc_enumerationMutation(v10);
                    }
                    if (!((v4 != 2) | v13 & 1))
                    {
                      uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                      if ([v17 accessLevel] == 1) {
                        int v13 = [v17 isCoOwner] ^ 1;
                      }
                      else {
                        LOBYTE(v13) = 0;
                      }
                    }
                  }
                  uint64_t v14 = [v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
                }
                while (v14);
              }
              [v9 setPreventsFeatureApplication:v13 & 1];
            }
            uint64_t v7 = [v22 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v20);
  }
}

- (id)_accountsForFeatureIdentifier:(unint64_t)a3
{
  accounts = self->_accounts;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentProvisioningController__accountsForFeatureIdentifier___block_invoke;
  v6[3] = &__block_descriptor_40_e26_B32__0__PKAccount_8Q16_B24l;
  void v6[4] = a3;
  uint64_t v4 = [(NSArray *)accounts pk_objectsPassingTest:v6];
  return v4;
}

uint64_t __65__PKPaymentProvisioningController__accountsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 feature] == *(void *)(a1 + 32))
  {
    unint64_t v4 = [v3 state];
    if (v4 <= 5) {
      uint64_t v5 = (0xFu >> v4) & 1;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_featureApplicationInValidStateToPresent:(id)a3
{
  unint64_t v3 = [a3 applicationState];
  return (v3 < 0x11) & (0x101F0u >> v3);
}

- (void)_updatePaymentSetupProductModelWithAvailability:(unint64_t)a3 activeConfigurations:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(PKPaymentSetupProductModel *)self->_paymentSetupProductModel setupProductsOfType:10];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * i) setProvisioningStatus:0];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v9);
  }
  if (a3 == 1)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v37 = v6;
    id obj = v6;
    uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (!v41) {
      goto LABEL_48;
    }
    uint64_t v39 = *(void *)v51;
    int v13 = @"country";
    long long v40 = v7;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v14;
        uint64_t v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v16 = v7;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v59 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v47;
          id v44 = v16;
          do
          {
            uint64_t v20 = 0;
            uint64_t v45 = v18;
            do
            {
              if (*(void *)v47 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
              id v22 = objc_msgSend(v21, "clientInfo", v37);
              if ([v15 target] == 1)
              {
                uint64_t v23 = [v15 country];
                long long v24 = [v22 objectForKey:v13];
                id v25 = v23;
                id v26 = v24;
                long long v27 = v26;
                if (v25 == v26)
                {
                }
                else
                {
                  if (!v25 || !v26)
                  {

LABEL_36:
LABEL_41:
                    uint64_t v18 = v45;
                    goto LABEL_44;
                  }
                  uint64_t v28 = [v25 caseInsensitiveCompare:v26];

                  if (v28) {
                    goto LABEL_36;
                  }
                }
                long long v29 = v13;
                long long v30 = [v15 state];
                long long v31 = [v22 objectForKey:@"administrativeArea"];
                id v32 = v30;
                id v33 = v31;
                if (v32 == v33)
                {

                  int v13 = v29;
                  id v16 = v44;
                  uint64_t v18 = v45;
                }
                else
                {
                  long long v34 = v33;
                  if (!v32 || !v33)
                  {

                    int v13 = v29;
                    id v16 = v44;
                    goto LABEL_41;
                  }
                  uint64_t v43 = [v32 caseInsensitiveCompare:v33];

                  int v13 = v29;
                  id v16 = v44;
                  uint64_t v18 = v45;
                  if (v43) {
                    goto LABEL_44;
                  }
                }
                unint64_t v35 = [v15 status];
                if (v35 > 0xC) {
                  uint64_t v36 = 0;
                }
                else {
                  uint64_t v36 = qword_191674CC8[v35];
                }
                [v21 setProvisioningStatus:v36];
              }
LABEL_44:

              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v59 count:16];
          }
          while (v18);
        }

        uint64_t v14 = v42 + 1;
        uint64_t v7 = v40;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (!v41)
      {
LABEL_48:

        id v6 = v37;
        goto LABEL_49;
      }
    }
  }
  if (a3 == 2)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Proofing unavailable, removing identity products.", buf, 2u);
    }

    [(PKPaymentSetupProductModel *)self->_paymentSetupProductModel removePaymentSetupProducts:v7];
  }
LABEL_49:
}

- (void)retrieveAllAvailableCredentials:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__39;
  void v41[4] = __Block_byref_object_dispose__39;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__39;
  v37[4] = __Block_byref_object_dispose__39;
  id v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2810000000;
  v35[3] = "";
  int v36 = 0;
  uint64_t v5 = dispatch_group_create();
  id v6 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    dispatch_group_enter(v5);
    uint64_t v8 = [(PKPaymentWebService *)self->_webService targetDevice];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke;
    v33[3] = &unk_1E56DFFD8;
    v33[4] = self;
    long long v34 = v5;
    [v8 retrievePendingProvisioningsWithType:0 completion:v33];
  }
  dispatch_group_enter(v5);
  PKTimeProfileBegin(0, @"acccount_creds");
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_2;
  v29[3] = &unk_1E56E9D30;
  long long v31 = v35;
  id v32 = v41;
  uint64_t v9 = v5;
  long long v30 = v9;
  [(PKPaymentProvisioningController *)self retrieveAccountCredentials:v29];
  allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
  uint64_t v11 = PKFeatureIdentifierToString(2);
  if (![(NSSet *)allowedFeatureIdentifiers containsObject:v11])
  {

    goto LABEL_8;
  }
  NSUInteger v12 = [(NSSet *)self->_allowedFeatureIdentifiers count];

  if (v12 > 1)
  {
LABEL_8:
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, @"remote_creds");
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_3;
    v23[3] = &unk_1E56E9D58;
    id v25 = v35;
    id v26 = v39;
    long long v27 = v37;
    uint64_t v28 = v41;
    long long v24 = v9;
    [(PKPaymentProvisioningController *)self retrieveRemoteCredentials:v23];
  }
  unint64_t v13 = [(PKPaymentWebService *)self->_webService paymentSetupSupportedInRegion];
  if (_os_feature_enabled_impl() && PKSafariCredentialProvisioningConsented() == 1 && v13 == 1)
  {
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, @"safari_creds");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_4;
    v19[3] = &unk_1E56E9D80;
    uint64_t v21 = v35;
    id v22 = v41;
    uint64_t v20 = v9;
    +[PKSafariCredentialsUtilities retrieveSafariCredentials:v19];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_5;
  v14[3] = &unk_1E56E9DA8;
  id v15 = v4;
  id v16 = v39;
  uint64_t v17 = v37;
  uint64_t v18 = v41;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v14);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

LABEL_14:
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 mutableCopy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 288);
    *(void *)(v4 + 288) = v3;
  }
  id v6 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v6);
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1[5] + 8) + 32);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  id v6 = PKTimeProfileEnd(v5, @"acccount_creds", @"PKPaymentProvisioningController: Account credentials");

  char v7 = a1[4];
  dispatch_group_leave(v7);
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  uint64_t v8 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  id v9 = a4;
  os_unfair_lock_lock(v8);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v14 = v7;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v9];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  NSUInteger v12 = PKLogFacilityTypeGetObject(6uLL);
  id v13 = PKTimeProfileEnd(v12, @"remote_creds", @"PKPaymentProvisioningController: Remote credentials");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (os_unfair_lock_s *)(*(void *)(a1[5] + 8) + 32);
  id v6 = a4;
  os_unfair_lock_lock(v5);
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  id v8 = PKTimeProfileEnd(v7, @"safari_creds", @"PKPaymentProvisioningController: Safari credentials");

  id v9 = a1[4];
  dispatch_group_leave(v9);
}

void __67__PKPaymentProvisioningController_retrieveAllAvailableCredentials___block_invoke_5(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v4 = (id)[*(id *)(*(void *)(a1[7] + 8) + 40) copy];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3, v4);
}

- (void)_updateAllAssoicatedCredentialsMetadataWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  if (PKShowFakeRemoteCredentials())
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Skipping card on file metadata request because using fake credentials", buf, 2u);
    }

    goto LABEL_25;
  }
  if (![(NSMutableArray *)self->_associatedCredentials count])
  {
LABEL_25:
    if (v4) {
      v4[2](v4);
    }
    goto LABEL_27;
  }
  uint64_t v23 = v4;
  id v6 = MEMORY[0x1E4F14428];
  group = dispatch_group_create();
  id v7 = [(PKPaymentWebService *)self->_webService context];
  id v8 = [v7 configuration];
  id v9 = [v8 credentialTypesRequiringMetadata];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "integerValue", v23);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v15 = self->_associatedCredentials;
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v31 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = [*(id *)(*((void *)&v30 + 1) + 8 * j) remoteCredential];
              uint64_t v21 = v20;
              if (v20 && [v20 credentialType] == v14)
              {

                dispatch_group_enter(group);
                id v15 = objc_alloc_init(PKPaymentRemoteCredentialsRequest);
                [(NSMutableArray *)v15 setIncludeMetadata:1];
                [(NSMutableArray *)v15 setExcludeDeviceInfo:1];
                [(NSMutableArray *)v15 setCredentialType:v14];
                [(NSMutableArray *)v15 setTimeoutOverride:10.0];
                v28[0] = MEMORY[0x1E4F143A8];
                v28[1] = 3221225472;
                v28[2] = __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke;
                v28[3] = &unk_1E56E9DD0;
                long long v29 = group;
                [(PKPaymentProvisioningController *)self updateRemoteCredentials:v15 withCompletionHandler:v28];

                goto LABEL_22;
              }
            }
            uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
LABEL_22:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v4 = v23;
  long long v27 = v23;
  id v22 = (void *)MEMORY[0x1E4F14428];
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

LABEL_27:
}

void __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __89__PKPaymentProvisioningController__updateAllAssoicatedCredentialsMetadataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateRemoteCredentials:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PKTimeProfileBegin(0, @"update_creds");
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  webService = self->_webService;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke;
  uint64_t v17 = &unk_1E56E9E48;
  id v9 = v6;
  id v18 = v9;
  uint64_t v19 = self;
  id v10 = v7;
  id v20 = v10;
  uint64_t v21 = &v22;
  uint64_t v11 = [(PKPaymentWebService *)webService remotePaymentCredentialsUpdateForRequest:v9 completion:&v14];
  v23[3] = v11;
  tasks = self->_tasks;
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11, v14, v15, v16, v17);
  [(NSMutableSet *)tasks addObject:v13];

  _Block_object_dispose(&v22, 8);
}

void __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E56E9E20;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 48);
  id v15 = v9;
  uint64_t v16 = v10;
  uint64_t v21 = a2;
  id v17 = v8;
  id v18 = v7;
  id v19 = v11;
  uint64_t v20 = *(void *)(a1 + 56);
  id v12 = v7;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) credentialType];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = [*(id *)(v1 + 32) productIdentifier];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v51 = v1;
  id v4 = *(id *)(*(void *)(v1 + 40) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v74 objects:v81 count:16];
  id v56 = v3;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v75;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v75 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v74 + 1) + 8 * v8) remoteCredential];
        uint64_t v1 = (uint64_t)v9;
        if (v9)
        {
          uint64_t v10 = [v9 credentialType];
          BOOL v11 = v10 == v2 || v10 == 0;
          int v12 = v11;
          if (v12 != 1 || v53 == 0)
          {
            if (!v12) {
              goto LABEL_20;
            }
LABEL_19:
            [v3 addObject:v1];
            goto LABEL_20;
          }
          uint64_t v14 = [(id)v1 productIdentifier];
          char v15 = [v14 isEqualToString:v53];

          id v3 = v56;
          if (v15) {
            goto LABEL_19;
          }
        }
LABEL_20:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v74 objects:v81 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }

  uint64_t v17 = v51;
  uint64_t v18 = *(void *)(v51 + 80);
  if (!v18)
  {
    uint64_t v1 = [*(id *)(v51 + 48) domain];
    if ([(id)v1 isEqualToString:*MEMORY[0x1E4F289A0]])
    {

LABEL_33:
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v21 = v3;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v71 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = [*(id *)(*((void *)&v70 + 1) + 8 * i) remoteCredential];
            [v26 setRequiresMetadata:0];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v70 objects:v80 count:16];
        }
        while (v23);
      }

      long long v27 = [*(id *)(v51 + 40) displayableErrorForError:*(void *)(v51 + 48)];
      (*(void (**)(void))(*(void *)(v51 + 64) + 16))();
      id v3 = v56;
      goto LABEL_68;
    }
  }
  id v19 = [*(id *)(v51 + 48) domain];
  if ([v19 isEqualToString:@"PKWebServiceErrorDomain"])
  {
    uint64_t v20 = [*(id *)(v51 + 48) code];

    if (!v18) {
    BOOL v11 = v20 == 1;
    }
    id v3 = v56;
    if (v11) {
      goto LABEL_33;
    }
  }
  else
  {

    if (!v18) {
  }
    }
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v55 = [*(id *)(*(void *)(v51 + 40) + 40) count];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [*(id *)(v51 + 56) credentials];
  uint64_t v54 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v67;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v67 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = v28;
        long long v29 = *(void **)(*((void *)&v66 + 1) + 8 * v28);
        long long v30 = objc_msgSend(v29, "PKURLForKey:", @"passURL", v48);
        long long v31 = [v29 PKStringForKey:@"identifier"];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v32 = v3;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v63;
          long long v57 = v29;
LABEL_50:
          uint64_t v36 = 0;
          while (1)
          {
            if (*(void *)v63 != v35) {
              objc_enumerationMutation(v32);
            }
            long long v37 = *(void **)(*((void *)&v62 + 1) + 8 * v36);
            id v38 = [v37 passURL];
            if ([v30 isEqual:v38]) {
              break;
            }
            uint64_t v39 = [v37 identifier];
            char v40 = [v31 isEqual:v39];

            if (v40) {
              goto LABEL_59;
            }
            if (v34 == ++v36)
            {
              uint64_t v34 = [v32 countByEnumeratingWithState:&v62 objects:v78 count:16];
              id v3 = v56;
              long long v29 = v57;
              uint64_t v17 = v51;
              if (v34) {
                goto LABEL_50;
              }
              goto LABEL_57;
            }
          }

LABEL_59:
          long long v29 = v57;
          [v37 updateWithDictionary:v57];
          uint64_t v41 = v37;

          id v3 = v56;
          uint64_t v17 = v51;
          if (!v41) {
            goto LABEL_62;
          }
          if (PKShouldDisplayRemoteCredentialWithStatus(v41))
          {
            [v32 removeObjectIdenticalTo:v41];
            [v48 addObject:v41];
          }
        }
        else
        {
LABEL_57:

LABEL_62:
          uint64_t v41 = [[PKPaymentRemoteCredential alloc] initWithDictionary:v29];
          if (PKShouldDisplayRemoteCredentialWithStatus(v41)) {
            [v49 addObject:v41];
          }
          [(PKPaymentRemoteCredential *)v41 setRequiresMetadata:0];
          [(PKPaymentRemoteCredential *)v41 setRank:v55++];
        }
        -[PKPaymentRemoteCredential setRequiresMetadata:](v41, "setRequiresMetadata:", [*(id *)(v17 + 32) includeMetadata] ^ 1);

        uint64_t v28 = v58 + 1;
      }
      while (v58 + 1 != v54);
      uint64_t v54 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v54);
  }

  [*(id *)(*(void *)(v17 + 40) + 40) removeObjectsInArray:v3];
  id v42 = *(void **)(v17 + 40);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_3;
  v59[3] = &unk_1E56E9DF8;
  v59[4] = v42;
  id v43 = *(id *)(v17 + 64);
  id v60 = v48;
  id v61 = v43;
  id v44 = v48;
  uint64_t v45 = v42;
  long long v27 = v49;
  [v45 _associateCredentials:v49 withCompletionHandler:v59];

LABEL_68:
  long long v46 = *(void **)(*(void *)(v17 + 40) + 24);
  long long v47 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(v17 + 72) + 8) + 24)];
  [v46 removeObject:v47];
}

void __81__PKPaymentProvisioningController_updateRemoteCredentials_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  [*(id *)(a1 + 32) _metadataUpdatedOnCredentials];
  uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
  id v9 = PKTimeProfileEnd(v8, @"update_creds", @"PKPaymentProvisioningController: Remote Credentials Update");

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    if (!v7 && a2)
    {
      [*(id *)(a1 + 40) addObjectsFromArray:v12];
      uint64_t v10 = *(void *)(a1 + 48);
    }
    BOOL v11 = (void *)[*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, uint64_t, id, void *))(v10 + 16))(v10, a2, v7, v11);
  }
}

- (void)associateCredentials:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentProvisioningController_associateCredentials_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E56E9E70;
  id v9 = v6;
  id v7 = v6;
  [(PKPaymentProvisioningController *)self _associateCredentials:a3 withCompletionHandler:v8];
}

uint64_t __78__PKPaymentProvisioningController_associateCredentials_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)_associateCredentials:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  PKTimeProfileBegin(0, @"associate_creds");
  if (!PKPreferenceBOOLforKey(@"PKHideMyCardsOnFileKey"))
  {
    id v7 = MEMORY[0x1E4F14428];
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    *(void *)long long buf = 0;
    uint64_t v45 = buf;
    uint64_t v46 = 0x3032000000;
    long long v47 = __Block_byref_object_copy__39;
    id v48 = __Block_byref_object_dispose__39;
    id v49 = 0;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v8 = [(PKPaymentProvisioningController *)self _hasSetupConfiguration];
    uint64_t v25 = [(NSMutableArray *)self->_associatedCredentials pk_arrayBySafelyApplyingBlock:&__block_literal_global_318];
    id v9 = dispatch_group_create();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v21;
    uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v55 count:16];
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v11 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (!v8
          || [(PKPaymentProvisioningController *)self _credentialIsValidForSetupConfiguration:*(void *)(*((void *)&v40 + 1) + 8 * i)])
        {
          uint64_t v14 = objc_msgSend(v13, "remoteCredential", v21);
          char v15 = [v14 serialNumber];
          if (v15)
          {

            goto LABEL_15;
          }
          uint64_t v16 = [v13 localPassCredential];
          char v15 = [v16 serialNumber];

          if (v15)
          {
LABEL_15:
            if ([v25 containsObject:v15])
            {
              uint64_t v17 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v51 = 138412546;
                uint64_t v52 = v13;
                __int16 v53 = 2112;
                uint64_t v54 = v15;
                _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: Skipping association of credential because one with a matching serial number is already associated. Skipped: %@, Serial: %@", v51, 0x16u);
              }
              goto LABEL_19;
            }
          }
          dispatch_group_enter(v9);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_319;
          v32[3] = &unk_1E56E9F08;
          uint64_t v18 = MEMORY[0x1E4F14428];
          id v19 = MEMORY[0x1E4F14428];
          uint64_t v33 = v18;
          id v34 = v23;
          uint64_t v35 = v13;
          uint64_t v36 = self;
          id v38 = v50;
          uint64_t v39 = buf;
          long long v37 = v9;
          [(PKPaymentProvisioningController *)self _associateCredential:v13 withCompletionHandler:v32];

          uint64_t v17 = v33;
LABEL_19:

          continue;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v55 count:16];
      if (!v10)
      {
LABEL_22:

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_4;
        block[3] = &unk_1E56E9F30;
        void block[4] = self;
        id v27 = v23;
        id v29 = v22;
        id v28 = obj;
        long long v30 = v50;
        long long v31 = buf;
        id v20 = v23;
        dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v50, 8);

        goto LABEL_23;
      }
    }
  }
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Hiding cards on file", buf, 2u);
  }

  (*((void (**)(id, uint64_t, void, void))v22 + 2))(v22, 1, 0, 0);
LABEL_23:
}

id __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 remoteCredential];
  id v4 = [v3 serialNumber];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [v2 localPassCredential];
    id v6 = [v7 serialNumber];
  }
  return v6;
}

void __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_319(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E56E9EE0;
  char v16 = a2;
  id v6 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 80);
  id v13 = v5;
  id v7 = (id)v9;
  long long v14 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 48), "_updateCredentialWithPaymentPass:completion:", MEMORY[0x1E4F143A8], 3221225472, __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_3, &unk_1E56E9EB8, *(void *)(a1 + 48), *(void *)(a1 + 40));
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  else
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
    id v5 = *(void **)(v2 + 40);
    id v3 = (id *)(v2 + 40);
    id v4 = v5;
    if (!v5) {
      id v4 = *(void **)(a1 + 56);
    }
    objc_storeStrong(v3, v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCredentialWithPaymentPassAssets:*(void *)(a1 + 40) completion:0];
}

void __79__PKPaymentProvisioningController__associateCredentials_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  id v3 = PKTimeProfileEnd(v2, @"associate_creds", @"PKPaymentProvisioningController: Associate credentials");

  if (*(void *)(a1 + 56))
  {
    [*(id *)(a1 + 48) count];
    id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
}

- (BOOL)_hasSetupConfiguration
{
  if ([(NSArray *)self->_allowedPaymentNetworks count]
    || [(NSSet *)self->_allowedFeatureIdentifiers count]
    || [(NSSet *)self->_allowedProductIdentifiers count]
    || [(NSSet *)self->_requiredTransitNetworkIdentifiers count]
    || (NSUInteger v3 = [(NSArray *)self->_allowedCardTypes count]) != 0)
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_credentialIsValidForSetupConfiguration:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_allowedPaymentNetworks count])
  {
    id v5 = PKPaymentNetworkNameForPaymentCredentialType([v4 credentialType]);
    BOOL v6 = [(NSArray *)self->_allowedPaymentNetworks containsObject:v5];

    if (!v6) {
      goto LABEL_12;
    }
  }
  if ([(NSSet *)self->_allowedFeatureIdentifiers count])
  {
    if (![v4 isAccountCredential]) {
      goto LABEL_12;
    }
    id v7 = [v4 accountCredential];
    id v8 = [v7 account];
    long long v9 = PKFeatureIdentifierToString([v8 feature]);

    LODWORD(v8) = [(NSSet *)self->_allowedFeatureIdentifiers containsObject:v9];
    if (!v8) {
      goto LABEL_12;
    }
  }
  if ([(NSSet *)self->_allowedProductIdentifiers count]
    && [v4 isRemoteCredential]
    && ([v4 remoteCredential],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 productIdentifier],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        LODWORD(v10) = [(NSSet *)self->_allowedProductIdentifiers containsObject:v11],
        v11,
        !v10))
  {
LABEL_12:
    LOBYTE(v14) = 0;
  }
  else if (![(NSArray *)self->_allowedCardTypes count] {
         || (allowedCardTypes = self->_allowedCardTypes,
  }
             objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "cardType")),
             id v13 = objc_claimAutoreleasedReturnValue(),
             BOOL v14 = [(NSArray *)allowedCardTypes containsObject:v13],
             v13,
             v14))
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)_associateCredential:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (v7)
  {
    if ((PKShowFakeRemoteCredentials() & 1) != 0
      || ([v6 isAccountCredential] & 1) != 0
      || ([v6 isPeerPaymentCredential] & 1) != 0
      || ([v6 isShareableCredential] & 1) != 0
      || ([v6 isLocalAppletSubcredentialPassCredential] & 1) != 0
      || ([v6 isHomeKeyCredential] & 1) != 0
      || [v6 isRemoteCredential]
      && ([v6 remoteCredential],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 status],
          v8,
          v9 != 2))
    {
      v7[2](v7, 1, 0);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke;
      v10[3] = &unk_1E56E53B0;
      void v10[4] = self;
      id v11 = v6;
      long long v12 = v7;
      [(PKPaymentProvisioningController *)self _queryRequirementsForCredential:v11 completion:v10];
    }
  }
}

void __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E56D84A0;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    [v7 _queryEligibilityForCredential:v11 completion:v10];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: failed to associate credential %@, returning error: %@ from requirements", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __78__PKPaymentProvisioningController__associateCredential_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: failed to associate credential %@, returning error: %@ from eligibility", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCredentialWithPaymentPass:(id)a3 completion:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isRemoteCredential])
  {
    uint64_t v8 = [v6 remoteCredential];
    __int16 v9 = [v8 passURL];
    id v10 = [v8 paymentPass];
    goto LABEL_18;
  }
  if (![v6 isAccountCredential])
  {
    if ([v6 isLocalPassCredential])
    {
      uint64_t v8 = [v6 localPassCredential];
      uint64_t v16 = [v8 paymentPass];
    }
    else
    {
      if (![v6 isLocalAppletSubcredentialPassCredential]) {
        goto LABEL_23;
      }
      uint64_t v8 = [v6 localAppletSubcredentialPassCredential];
      uint64_t v16 = [v8 paymentPass];
    }
    id v10 = (void *)v16;
    __int16 v9 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = [v6 accountCredential];
  uint64_t v11 = [v8 account];
  id v12 = [v8 passDetailsResponse];
  uint64_t v13 = [v11 type];
  if (v13 == 2)
  {
    uint64_t v17 = [v12 passURL];
    if (!v17)
    {
      id v22 = [v11 payLaterDetails];
      __int16 v9 = [v22 associatedPassURL];

      uint64_t v14 = 0;
      goto LABEL_15;
    }
    id v15 = v17;
    uint64_t v14 = v15;
  }
  else
  {
    if (v13 != 1)
    {
      __int16 v9 = 0;
      goto LABEL_17;
    }
    uint64_t v14 = [v11 creditDetails];
    id v15 = [v14 associatedPassURL];
  }
  __int16 v9 = v15;
LABEL_15:

LABEL_17:
  id v10 = [v8 paymentPass];

LABEL_18:
  if (!v10)
  {
    if (v9)
    {
      objc_initWeak(location, self);
      webService = self->_webService;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke;
      v23[3] = &unk_1E56E9F80;
      objc_copyWeak(&v26, location);
      id v24 = v6;
      id v25 = v7;
      [(PKPaymentWebService *)webService passAtURL:v9 completion:v23];

      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
LABEL_31:
      id v10 = 0;
      goto LABEL_32;
    }
LABEL_23:
    id v19 = [v6 remoteCredential];
    id v20 = v19;
    if (!v19 || [v19 status] != 2)
    {
      id v21 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Error: Unable to locate pass or a pass URL when attempting to update credential: %@", (uint8_t *)location, 0xCu);
      }
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }

    __int16 v9 = 0;
    goto LABEL_31;
  }
  if (v7) {
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
LABEL_32:
}

void __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke_2;
  block[3] = &unk_1E56E9F58;
  objc_copyWeak(v11, a1 + 6);
  v11[1] = a2;
  id v8 = v5;
  id v9 = a1[4];
  id v10 = a1[5];
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __79__PKPaymentProvisioningController__updateCredentialWithPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  NSUInteger v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 64) == 1 && *(void *)(a1 + 32))
  {
    id v10 = WeakRetained;
    int v4 = [*(id *)(a1 + 40) isRemoteCredential];
    id v5 = *(void **)(a1 + 40);
    if (v4)
    {
      id v6 = [v5 remoteCredential];
    }
    else
    {
      int v7 = [v5 isAccountCredential];
      NSUInteger v3 = v10;
      if (!v7) {
        goto LABEL_9;
      }
      id v6 = [*(id *)(a1 + 40) accountCredential];
    }
    id v8 = v6;
    [v6 setPaymentPass:*(void *)(a1 + 32)];

    NSUInteger v3 = v10;
  }
LABEL_9:
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    uint64_t v11 = v3;
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 32));
    NSUInteger v3 = v11;
  }
}

- (void)_updateCredentialWithPaymentPassAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if ([v6 isRemoteCredential])
  {
    id v8 = [v6 remoteCredential];
  }
  else if ([v6 isAccountCredential])
  {
    id v8 = [v6 accountCredential];
  }
  else if ([v6 isLocalPassCredential])
  {
    id v8 = [v6 localPassCredential];
  }
  else
  {
    if (![v6 isLocalAppletSubcredentialPassCredential]) {
      goto LABEL_13;
    }
    id v8 = [v6 localAppletSubcredentialPassCredential];
  }
  uint64_t v9 = v8;
  id v10 = [v8 paymentPass];

  if (v10)
  {
    uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
    id v12 = [v11 secureElementIdentifiers];
    int v13 = [v10 remoteAssetsDownloadedForSEIDs:v12];

    if (v13)
    {
      if (v7) {
        v7[2](v7);
      }
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke;
      v14[3] = &unk_1E56D8360;
      id v15 = v7;
      [(PKPaymentProvisioningController *)self _downloadRemoteAssetsForPaymentPass:v10 paymentCredential:v6 completion:v14];
    }
    goto LABEL_17;
  }
LABEL_13:
  if (v7) {
    v7[2](v7);
  }
LABEL_17:
}

void __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PKPaymentProvisioningController__updateCredentialWithPaymentPassAssets_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_downloadRemoteAssetsForPaymentPass:(id)a3 paymentCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v12 = [v11 secureElementIdentifiers];

  int v13 = +[PKDownloadRemoteAssetConfiguration configurationWithSEIDs:v12];
  [v13 setIgnoreRequiredAssetDownloadFailures:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__PKPaymentProvisioningController__downloadRemoteAssetsForPaymentPass_paymentCredential_completion___block_invoke;
  v16[3] = &unk_1E56E9FA8;
  objc_copyWeak(&v19, &location);
  id v14 = v9;
  id v17 = v14;
  id v15 = v10;
  id v18 = v15;
  [v8 downloadRemoteAssetsWithConfiguration:v13 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __100__PKPaymentProvisioningController__downloadRemoteAssetsForPaymentPass_paymentCredential_completion___block_invoke(uint64_t a1, int a2, void *a3, float a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109634;
    v12[1] = a2;
    __int16 v13 = 2048;
    double v14 = a4;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Download of remote assets called completion handler with finished=%i progress=%f error=%@", (uint8_t *)v12, 0x1Cu);
  }

  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _informDelegatesOfPaymentPassUpdateOnCredential:*(void *)(a1 + 32)];
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

- (void)_informDelegatesOfPaymentPassUpdateOnCredential:(id)a3
{
  id v4 = a3;
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  id v6 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_delegatesLock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKPaymentProvisioningController__informDelegatesOfPaymentPassUpdateOnCredential___block_invoke;
  v9[3] = &unk_1E56D8A90;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __83__PKPaymentProvisioningController__informDelegatesOfPaymentPassUpdateOnCredential___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "paymentPassUpdatedOnCredential:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_metadataUpdatedOnCredentials
{
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  uint64_t v4 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_delegatesLock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPaymentProvisioningController__metadataUpdatedOnCredentials__block_invoke;
  block[3] = &unk_1E56D8AE0;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__PKPaymentProvisioningController__metadataUpdatedOnCredentials__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "metadataUpdatedOnCredentials", (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_preflightRequirementsUpdated:(unint64_t)a3 displayableError:(id)a4
{
  id v6 = a4;
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  long long v8 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_delegatesLock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPaymentProvisioningController__preflightRequirementsUpdated_displayableError___block_invoke;
  block[3] = &unk_1E56DF798;
  id v13 = v6;
  unint64_t v14 = a3;
  id v12 = v8;
  id v9 = v6;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__PKPaymentProvisioningController__preflightRequirementsUpdated_displayableError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "preflightRequirementsUpdated:displayableError:", *(void *)(a1 + 48), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_informDelegatesOfAccountsUpdated
{
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  uint64_t v4 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_delegatesLock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PKPaymentProvisioningController__informDelegatesOfAccountsUpdated__block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  long long v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __68__PKPaymentProvisioningController__informDelegatesOfAccountsUpdated__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "provisioningControllerUpdatedAccounts:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)cachedPaymentSetupProductModelWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = MEMORY[0x1E4F14428];
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__39;
  v52[4] = __Block_byref_object_dispose__39;
  id v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__39;
  void v50[4] = __Block_byref_object_dispose__39;
  id v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__39;
  void v48[4] = __Block_byref_object_dispose__39;
  id v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__39;
  v46[4] = __Block_byref_object_dispose__39;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  void v44[3] = __Block_byref_object_copy__39;
  v44[4] = __Block_byref_object_dispose__39;
  id v45 = 0;
  uint64_t v6 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v7 = [v6 deviceRegion];
  long long v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  PKTimeProfileBegin(0, @"cached_products");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56E9FD0;
  long long v43 = v44;
  long long v9 = v8;
  long long v42 = v9;
  long long v10 = _Block_copy(aBlock);
  long long v11 = objc_alloc_init(PKPaymentAvailableProductsRequest);
  [(PKWebServiceRequest *)v11 setCachePolicyOverride:3];
  if (self->_isProvisioningForAltAccount) {
    [(PKPaymentAvailableProductsRequest *)v11 setContext:1];
  }
  if (objc_opt_respondsToSelector())
  {
    [v6 productsWithRequest:v11 completion:v10];
  }
  else
  {
    webService = self->_webService;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_2;
    void v39[3] = &unk_1E56E9FF8;
    id v40 = v10;
    [(PKPaymentWebService *)webService availableProductsWithRequest:v11 completion:v39];
  }
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, @"cached_features");
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_3;
    v36[3] = &unk_1E56DD778;
    id v38 = v50;
    long long v37 = v9;
    [v6 cachedFeatureApplicationsForProvisioningWithCompletion:v36];
  }
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, @"cached_accounts");
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_4;
    v33[3] = &unk_1E56DD778;
    uint64_t v35 = v48;
    id v34 = v9;
    [v6 accountsWithCompletion:v33];
  }
  uint64_t v13 = [(PKPaymentWebService *)self->_webService context];
  unint64_t v14 = [v13 configuration];
  char v15 = [v14 browseProvisioningBankAppsEnabledForRegion:v7];

  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled() && ((v15 & 1) != 0 || PKForceBrowseBankPartners()))
  {
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, @"cached_browse_banks");
    id v16 = [[PKPaymentBrowseableBankAppsRequest alloc] initWithRegion:v7];
    [(PKWebServiceRequest *)v16 setCachePolicyOverride:3];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_5;
    v30[3] = &unk_1E56EA020;
    id v32 = v46;
    long long v31 = v9;
    [(PKPaymentProvisioningController *)self _browsableBanksWithRequest:v16 completion:v30];
  }
  dispatch_group_enter(v9);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_6;
  v28[3] = &unk_1E56EA048;
  void v28[4] = self;
  uint64_t v17 = v9;
  id v29 = v17;
  [(PKPaymentProvisioningController *)self _retrievePendingCarKeys:v28];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_7;
  v20[3] = &unk_1E56EA098;
  id v22 = v50;
  id v23 = v48;
  id v24 = v46;
  id v25 = v44;
  v20[4] = self;
  id v21 = v4;
  char v27 = v15;
  id v26 = v52;
  id v18 = v4;
  id v19 = (void *)MEMORY[0x1E4F14428];
  dispatch_group_notify(v17, MEMORY[0x1E4F14428], v20);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v52, 8);
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  id v5 = PKTimeProfileEnd(v4, @"cached_products", @"PKPaymentProvisioningController: Cached Products");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  id v5 = PKTimeProfileEnd(v4, @"cached_features", @"PKPaymentProvisioningController: Cached Feature Applications");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  id v5 = PKTimeProfileEnd(v4, @"cached_accounts", @"PKPaymentProvisioningController: Cached Accounts");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_5(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v7 = obj;
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  id v6 = PKTimeProfileEnd(v5, @"cached_browse_banks", @"PKPaymentProvisioningController: Cached Browse Banks");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_7(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    [*(id *)(a1 + 32) _setupFeatureApplications:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(unsigned char *)(*(void *)(a1 + 32) + 241) = 1;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    [*(id *)(a1 + 32) _setupAccounts];
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = (void *)v2[53];
    id v4 = objc_msgSend(v2, "_filterPaymentSetupProducts:");
    [v3 updatePaymentSetupProducts:v4];
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v5)
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 424);
    id v7 = [v5 JSONObject];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_8;
    v23[3] = &unk_1E56EA070;
    uint64_t v24 = *(void *)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_9;
    v22[3] = &unk_1E56EA070;
    v22[4] = v24;
    [v6 updateWithPaymentSetupProductsResponse:v7 productsFilter:v23 sectionsFilter:v22];
  }
  else
  {
    long long v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Not updating _paymentSetupProductModel since the available products are nil _availableProductsResponse", v21, 2u);
    }
  }
  long long v9 = *(void **)(a1 + 32);
  if (v9[35])
  {
    long long v10 = (void *)v9[53];
    v25[0] = v9[35];
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v12 = [v9 _filterPaymentSetupProducts:v11];
    [v10 updatePaymentSetupProducts:v12];

    [*(id *)(*(void *)(a1 + 32) + 424) addCarKeyCategory];
  }
  if (*(void *)(a1 + 40))
  {
    if (PKPaymentSetupMergeProductsPartnersAPIEnabled()
      || !*(unsigned char *)(a1 + 88)
      || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 424) allSections];
      if ([v13 count])
      {
        unint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 424) allSetupProducts];
        uint64_t v15 = [v14 count];

        if (v15)
        {
LABEL_27:
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          return;
        }
      }
      else
      {
      }
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v21 = 0;
        uint64_t v17 = "Products required but not found in the cache";
LABEL_24:
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, v17, v21, 2u);
      }
    }
    else
    {
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v21 = 0;
        uint64_t v17 = "Browse banks required but not found in the cache";
        goto LABEL_24;
      }
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      uint64_t v18 = PKDisplayableErrorForCommonType(0, 0);
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    goto LABEL_27;
  }
}

uint64_t __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _filterPaymentSetupProducts:a2];
}

uint64_t __80__PKPaymentProvisioningController_cachedPaymentSetupProductModelWithCompletion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _filteredPaymentSetupProductSections:a2];
}

- (void)updatePaymentSetupProductModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = MEMORY[0x1E4F14428];
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  char v73 = 1;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__39;
  v70[4] = __Block_byref_object_dispose__39;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__39;
  v68[4] = __Block_byref_object_dispose__39;
  id v69 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__39;
  v66[4] = __Block_byref_object_dispose__39;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__39;
  v64[4] = __Block_byref_object_dispose__39;
  id v65 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__39;
  v61[4] = __Block_byref_object_dispose__39;
  id v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__39;
  v59[4] = __Block_byref_object_dispose__39;
  id v60 = 0;
  id v6 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v7 = [v6 deviceRegion];
  long long v8 = dispatch_group_create();
  PKTimeProfileBegin(0, @"products");
  dispatch_group_enter(v8);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E56EA0C0;
  uint64_t v56 = v72;
  long long v57 = v70;
  void aBlock[4] = self;
  uint64_t v58 = v59;
  long long v9 = v8;
  uint64_t v55 = v9;
  long long v10 = _Block_copy(aBlock);
  long long v11 = [(PKPaymentWebService *)self->_webService supportedRegionFeatureOfType:14 didFailOSVersionRequirements:0];
  id v12 = v11;
  if (self->_fetchProductsFromStaticDataSource && v11)
  {
    char v53 = 0;
    uint64_t v13 = [v11 createProductsRequestWithIsFetchBlocked:&v53];
    unint64_t v14 = v13;
    if (v53 || !v13)
    {
      (*((void (**)(void *, void, void))v10 + 2))(v10, 0, 0);
      goto LABEL_13;
    }
    [(PKWebServiceRequest *)v13 addDiagnosticReason:@"Provisioning"];
    webService = self->_webService;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_2;
    v51[3] = &unk_1E56E9FF8;
    id v52 = v10;
    [(PKPaymentWebService *)webService availableCommonProductsWithRequest:v14 completion:v51];
    id v16 = v52;
  }
  else
  {
    unint64_t v14 = objc_alloc_init(PKPaymentAvailableProductsRequest);
    [(PKWebServiceRequest *)v14 addDiagnosticReason:@"Provisioning"];
    if (self->_isProvisioningForAltAccount) {
      [(PKPaymentAvailableProductsRequest *)v14 setContext:1];
    }
    if (objc_opt_respondsToSelector())
    {
      [v6 productsWithRequest:v14 completion:v10];
      goto LABEL_13;
    }
    uint64_t v17 = self->_webService;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_3;
    v49[3] = &unk_1E56E9FF8;
    id v50 = v10;
    [(PKPaymentWebService *)v17 availableProductsWithRequest:v14 completion:v49];
    id v16 = v50;
  }

LABEL_13:
  if (objc_opt_respondsToSelector())
  {
    if (self->_preflightedApplications)
    {
      [v6 featureApplicationsForProvisioningWithCompletion:0];
    }
    else
    {
      dispatch_group_enter(v9);
      PKTimeProfileBegin(0, @"features");
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_4;
      v46[3] = &unk_1E56DD778;
      id v48 = v68;
      id v47 = v9;
      [v6 featureApplicationsForProvisioningWithCompletion:v46];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    if (self->_preflightedAccounts)
    {
      [v6 updatedAccountsForProvisioningWithCompletion:0];
    }
    else
    {
      dispatch_group_enter(v9);
      PKTimeProfileBegin(0, @"accounts");
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_5;
      v43[3] = &unk_1E56EA0E8;
      id v45 = v66;
      id v44 = v9;
      [v6 updatedAccountsForProvisioningWithCompletion:v43];
    }
  }
  if (_os_feature_enabled_impl())
  {
    dispatch_group_enter(v9);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_6;
    void v39[3] = &unk_1E56EA110;
    long long v41 = v63;
    long long v42 = v61;
    id v40 = v9;
    [(PKPaymentProvisioningController *)self _identityConfigurationWithCompletion:v39];
  }
  uint64_t v18 = [(PKPaymentWebService *)self->_webService context];
  uint64_t v19 = [v18 configuration];
  char v20 = [v19 browseProvisioningBankAppsEnabledForRegion:v7];

  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled() && ((v20 & 1) != 0 || PKForceBrowseBankPartners()))
  {
    dispatch_group_enter(v9);
    PKTimeProfileBegin(0, @"browse_banks");
    id v21 = [[PKPaymentBrowseableBankAppsRequest alloc] initWithRegion:v7];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_7;
    v34[3] = &unk_1E56EA138;
    uint64_t v36 = v72;
    long long v37 = v64;
    id v38 = v70;
    uint64_t v35 = v9;
    [(PKPaymentProvisioningController *)self _browsableBanksWithRequest:v21 completion:v34];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_8;
  v24[3] = &unk_1E56EA188;
  id v26 = v68;
  char v27 = v66;
  id v28 = v64;
  id v29 = v59;
  long long v30 = v63;
  long long v31 = v61;
  v24[4] = self;
  id v25 = v4;
  id v32 = v72;
  uint64_t v33 = v70;
  id v22 = v4;
  id v23 = (void *)MEMORY[0x1E4F14428];
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v24);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *(unsigned char *)(v7 + 24) == 0;
  }
  char v9 = !v8;
  *(unsigned char *)(v7 + 24) = v9;
  if (!v5)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = v18;
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v11 = *(void **)(v10 + 40);
  if (v11)
  {
    id v12 = v11;
LABEL_11:
    uint64_t v13 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v12;
    goto LABEL_13;
  }
  uint64_t v14 = [*(id *)(a1 + 32) displayableErrorForError:v5];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
LABEL_13:

  id v16 = PKLogFacilityTypeGetObject(6uLL);
  id v17 = PKTimeProfileEnd(v16, @"products", @"PKPaymentProvisioningController: Products");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  id v5 = PKTimeProfileEnd(v4, @"features", @"PKPaymentProvisioningController: Feature Applications");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "arrayByAddingObjectsFromArray:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = PKLogFacilityTypeGetObject(6uLL);
  id v7 = PKTimeProfileEnd(v6, @"accounts", @"PKPaymentProvisioningController: Accounts");

  BOOL v8 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v8);
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_6(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_7(uint64_t a1, char a2, id obj, void *a4)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v9 = obj;
  id v10 = a4;
  id v17 = v10;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v11 + 40);
  id v12 = (id *)(v11 + 40);
  uint64_t v13 = v14;
  if (v14) {
    id v10 = v13;
  }
  objc_storeStrong(v12, v10);
  uint64_t v15 = PKLogFacilityTypeGetObject(6uLL);
  id v16 = PKTimeProfileEnd(v15, @"browse_banks", @"PKPaymentProvisioningController: Browse Banks");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    [*(id *)(a1 + 32) _setupFeatureApplications:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(unsigned char *)(*(void *)(a1 + 32) + 241) = 1;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 248) count]) {
    [*(id *)(a1 + 32) _setupAccounts];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = (void *)v2[53];
    uint64_t v4 = objc_msgSend(v2, "_filterPaymentSetupProducts:");
    [v3 updatePaymentSetupProducts:v4];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_9;
  aBlock[3] = &unk_1E56EA160;
  objc_copyWeak(&v19, &location);
  id v5 = _Block_copy(aBlock);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v6)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 424);
    char v8 = [v6 JSONObject];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_10;
    v16[3] = &unk_1E56EA160;
    objc_copyWeak(&v17, &location);
    [v7 updateWithPaymentSetupProductsResponse:v8 productsFilter:v16 sectionsFilter:v5];

    objc_destroyWeak(&v17);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Adding manual entry section because _availableProductsResponse is nil", v15, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 424) addManualEntrySection:v5];
  }
  if (_os_feature_enabled_impl()) {
    [*(id *)(a1 + 32) _updatePaymentSetupProductModelWithAvailability:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) activeConfigurations:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }
  id v10 = *(void **)(a1 + 32);
  if (v10[35])
  {
    uint64_t v11 = (void *)v10[53];
    v21[0] = v10[35];
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v13 = [v10 _filterPaymentSetupProducts:v12];
    [v11 updatePaymentSetupProducts:v13];

    [*(id *)(*(void *)(a1 + 32) + 424) addCarKeyCategory];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void, void))(v14 + 16))(v14, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40));
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

id __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _filteredPaymentSetupProductSections:v3];

  return v5;
}

id __87__PKPaymentProvisioningController_updatePaymentSetupProductModelWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _filterPaymentSetupProducts:v3];

  return v5;
}

- (void)_identityConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = MEMORY[0x1E4F14428];
  id v6 = MEMORY[0x1E4F14428];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__39;
  long long v37 = __Block_byref_object_dispose__39;
  dispatch_source_t v38 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
  uint64_t v7 = v34[5];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  PKTimeProfileBegin(0, @"identity");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56EA1B0;
  id v9 = v5;
  char v27 = v5;
  id v29 = &v33;
  long long v30 = v31;
  id v10 = v4;
  id v28 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v34[5];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2;
  handler[3] = &unk_1E56D8360;
  id v13 = v11;
  id v25 = v13;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)v34[5]);
  if (!self->_identityProofingManager)
  {
    uint64_t v14 = (CIDVUIProofingFlowManager *)[objc_alloc((Class)getCIDVUIProofingFlowManagerClass[0]()) initWithDelegate:self];
    identityProofingManager = self->_identityProofingManager;
    self->_identityProofingManager = v14;
  }
  id v16 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Requesting proofingFlowAvailabilityWithCompletionHandler", buf, 2u);
  }

  id v17 = self->_identityProofingManager;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_407;
  v20[3] = &unk_1E56E4CA8;
  id v18 = v5;
  id v21 = v5;
  id v19 = v13;
  id v22 = v19;
  [(CIDVUIProofingFlowManager *)v17 proofingFlowAvailability:v20];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
}

void __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v5 = *(NSObject **)(*(void *)(a1[6] + 8) + 40);
  if (v5)
  {
    dispatch_source_cancel(v5);
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  uint64_t v8 = *(void *)(a1[7] + 8);
  if (!*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 1;
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    id v10 = PKTimeProfileEnd(v9, @"identity", @"PKPaymentProvisioningController: Identity");

    uint64_t v11 = a1[5];
    if (v11) {
      (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v12);
    }
  }
}

uint64_t __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Timeout occured for proofingFlowAvailabilityWithCompletionHandler", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_407(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2_408;
  v12[3] = &unk_1E56EA1D8;
  id v13 = v8;
  id v9 = *(NSObject **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = a2;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, v12);
}

uint64_t __72__PKPaymentProvisioningController__identityConfigurationWithCompletion___block_invoke_2_408(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Proofing availability could not complete with error %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_applyIdentityConfiguration:(unint64_t)a3 activeConfigurations:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __95__PKPaymentProvisioningController__applyIdentityConfiguration_activeConfigurations_completion___block_invoke;
  v12[3] = &unk_1E56D8A40;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __95__PKPaymentProvisioningController__applyIdentityConfiguration_activeConfigurations_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _updatePaymentSetupProductModelWithAvailability:*(void *)(a1 + 56) activeConfigurations:*(void *)(a1 + 40)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
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
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "provisioningControllerUpdatedProducts:", *(void *)(a1 + 32), (void)v10);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)_updatePaymentSetupProductModelExtensionsWithCompletion:(id)a3
{
  id v4 = a3;
  PKTimeProfileBegin(0, @"provisioning_extensions");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__PKPaymentProvisioningController__updatePaymentSetupProductModelExtensionsWithCompletion___block_invoke;
  v6[3] = &unk_1E56D8810;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentProvisioningController *)self provisioningExtensionProductsWithCompletionHandler:v6];
}

void __91__PKPaymentProvisioningController__updatePaymentSetupProductModelExtensionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) _filterPaymentSetupProducts:a2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "updatePaymentSetupProducts:");
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  id v4 = PKTimeProfileEnd(v3, @"provisioning_extensions", @"PKPaymentProvisioningController: Provisioning Extensions");

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)_browsableBanksWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *, void))a4;
  if (PKMockBrowseBankPartners())
  {
    id v8 = [(PKPaymentProvisioningController *)self _mockBrowseBanksResponse];
    uint64_t v9 = v8;
    if (v7)
    {
      long long v10 = [v8 browseableBankApps];
      v7[2](v7, 1, v10, 0);
    }
  }
  else
  {
    webService = self->_webService;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke;
    v12[3] = &unk_1E56EA228;
    void v12[4] = self;
    long long v13 = v7;
    [(PKPaymentWebService *)webService browseableBankAppsWithRequest:v6 completion:v12];
  }
}

void __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke_2;
  block[3] = &unk_1E56EA200;
  uint64_t v18 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(void **)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v7;
  id v17 = v10;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__PKPaymentProvisioningController__browsableBanksWithRequest_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void *)(a1 + 64) == 1 && *(void *)(a1 + 32) == 0;
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "displayableErrorForError:");
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    id v7 = v4;
    id v6 = [*(id *)(a1 + 48) browseableBankApps];
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v5 + 16))(v5, v3, v6, v7);

    id v4 = v7;
  }
}

- (void)_retrievePendingCarKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKPaymentProvisioningController__retrievePendingCarKeys___block_invoke;
    v6[3] = &unk_1E56D8810;
    void v6[4] = self;
    id v7 = v4;
    [v5 retrievePendingProvisioningsWithType:@"CarKey" completion:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __59__PKPaymentProvisioningController__retrievePendingCarKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v28 = a1;
    id v4 = objc_alloc_init(PKPaymentSetupProduct);
    uint64_t v5 = objc_alloc_init(PKPaymentSetupProductConfiguration);
    [(PKPaymentSetupProductConfiguration *)v5 setType:11];
    [(PKPaymentSetupProductConfiguration *)v5 setProductIdentifier:@"carKey"];
    [(PKPaymentSetupProductConfiguration *)v5 setState:1];
    char v27 = v5;
    [(PKPaymentSetupProduct *)v4 setConfiguration:v5];
    id v6 = PKLocalizedPaymentString(&cfstr_PaymentSetupCa.isa, 0);
    [(PKPaymentSetupProduct *)v4 setDisplayName:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v29 = v3;
    id obj = v3;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v13 = [v12 configuration];
          [v13 setReferralSource:5];
          id v14 = [v12 createdAt];
          uint64_t v15 = PKMediumDateString(v14);

          uint64_t v16 = [v13 vehicleName];
          id v17 = (void *)v16;
          if (v16) {
            uint64_t v18 = (void *)v16;
          }
          else {
            uint64_t v18 = v15;
          }
          [v13 setLocalizedDescription:v18];

          id v19 = [PKCarKeyTerminalPairingCredential alloc];
          char v20 = [(PKPaymentSetupProduct *)v4 productIdentifier];
          id v21 = [(PKCarKeyTerminalPairingCredential *)v19 initWithConfiguration:v13 productIdentifier:v20];

          [v7 addObject:v21];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v9);
    }

    uint64_t v22 = *(void *)(v28 + 32);
    id v23 = *(void **)(v22 + 384);
    *(void *)(v22 + 384) = v7;
    id v24 = v7;

    (*(void (**)(void))(*(void *)(v28 + 40) + 16))();
    id v3 = v29;
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = *(void **)(v25 + 384);
    *(void *)(v25 + 384) = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)localCredentials
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(v3, "pk_safelyAddObjectsFromArray:", self->_pendingCarKeyCredentials);
  return v3;
}

- (BOOL)_isExtensionSupported:(id)a3 usingUnsupportedProvisioningExtensions:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = [v5 identifier];
    uint64_t v8 = [v6 PKDictionaryForKey:v7];

    if (v8)
    {
      uint64_t v9 = [v5 version];
      uint64_t v10 = [v8 PKArrayContaining:objc_opt_class() forKey:0];
      if (([v10 containsObject:v9] & 1) != 0
        || [v10 containsObject:0])
      {
        id v11 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412546;
          uint64_t v15 = v7;
          __int16 v16 = 2112;
          id v17 = v9;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Extension: %@ with version: %@ is unsupported", (uint8_t *)&v14, 0x16u);
        }

        BOOL v12 = 0;
      }
      else
      {
        BOOL v12 = 1;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)provisioningExtensionProductsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E56D8A18;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x192FDC630]();
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:@"com.apple.PassKit.issuer-provisioning" forKeyedSubscript:*MEMORY[0x1E4F282B0]];
  id v3 = [NSString stringWithFormat:@"ENTITLEMENT:%@", @"com.apple.developer.payment-pass-provisioning"];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
  id v5 = [v4 appleAccountInformation];
  int v6 = [v5 isManagedAppleAccount];

  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"ENTITLEMENT:%@", @"com.apple.developer.contactless-payment-pass-provisioning.maids"];
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
  }
  uint64_t v8 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v2 error:0];
  id v24 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
  uint64_t v10 = [v9 deviceName];
  char v11 = [v10 isEqualToString:@"Apple Watch"];

  BOOL v12 = [*(id *)(*(void *)(a1 + 32) + 344) context];
  long long v13 = [v12 configuration];
  int v14 = [v13 unsupportedProvisioningExtensions];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) _isExtensionSupported:v20 usingUnsupportedProvisioningExtensions:v14])
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2;
          v27[3] = &unk_1E56EA2A0;
          v27[4] = v20;
          char v28 = v11;
          [(PKAsyncUnaryOperationComposer *)v24 addOperation:v27];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }

  id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2_435;
  v25[3] = &unk_1E56EA2E8;
  id v26 = *(id *)(a1 + 40);
  id v22 = [(PKAsyncUnaryOperationComposer *)v24 evaluateWithInput:v21 completion:v25];
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E56EA278;
  id v11 = v7;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v11;
  uint64_t v21 = v12;
  char v24 = *(unsigned char *)(a1 + 40);
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  id v15 = +[PKIssuerProvisioningExtensionConsumerCoordinator beginWithExtension:v10 completion:v19];
  uint64_t v16 = v15;
  if (v15)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_433;
    v17[3] = &unk_1E56D8AE0;
    id v18 = v15;
    [v11 addCancelAction:v17];
  }
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || ([v7 isCanceled] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) != 0)
  {
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) identifier];
      id v11 = (void *)v10;
      uint64_t v12 = @"YES";
      if (!*(unsigned char *)(a1 + 64)) {
        uint64_t v12 = @"NO";
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      char v27 = v12;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Did not create product for extension with identifier: %@ extension executation cancelled isRemote: %@", buf, 0x16u);
    }
    [v6 invalidate];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v25 = (uint64_t)v14;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Querying status for extension with identifier: %@", buf, 0xCu);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_430;
    v18[3] = &unk_1E56EA250;
    id v15 = v6;
    char v23 = *(unsigned char *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void **)(a1 + 48);
    id v19 = v15;
    uint64_t v20 = v16;
    id v21 = v17;
    id v22 = *(id *)(a1 + 56);
    [v15 statusWithCompletion:v18];
  }
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_430(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  if (!*(unsigned char *)(a1 + 64))
  {
    if ([v3 passEntriesAvailable]) {
      goto LABEL_5;
    }
    if (!*(unsigned char *)(a1 + 64)) {
      goto LABEL_13;
    }
  }
  if (![v3 remotePassEntriesAvailable])
  {
LABEL_13:
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      uint64_t v13 = [v3 description];
      id v14 = (void *)v13;
      int v15 = *(unsigned __int8 *)(a1 + 64);
      int v17 = 138412802;
      id v18 = v12;
      if (v15) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Did not create product for extension with identifier: %@ status: [%@] isRemote: %@", (uint8_t *)&v17, 0x20u);
    }
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v4 = +[PKPaymentSetupProduct productForIssuerProvisioningExtension:*(void *)(a1 + 40) withStatus:v3];
  if (!v4) {
    goto LABEL_13;
  }
  id v5 = v4;
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 displayName];
    uint64_t v8 = [v5 productIdentifier];
    id v9 = (void *)v8;
    int v10 = *(unsigned __int8 *)(a1 + 64);
    int v17 = 138412802;
    id v18 = v7;
    if (v10) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Created product for extension named: %@ identifier: %@ isRemote: %@", (uint8_t *)&v17, 0x20u);
  }
  [*(id *)(a1 + 48) addObject:v5];
LABEL_18:

  (*(void (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48));
}

uint64_t __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_433(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_2_435(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 sortUsingComparator:&__block_literal_global_439];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_3_436(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 displayName];
  id v6 = [v4 displayName];

  if (v5 == v6)
  {
    uint64_t v7 = 0;
  }
  else if (v5)
  {
    if (v6) {
      uint64_t v7 = [v5 localizedStandardCompare:v6];
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __86__PKPaymentProvisioningController_provisioningExtensionProductsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_mockBrowseBanksResponse
{
  id v2 = [@"{\"availablePartners\":[{\"displayName\":\"Boon.\",\"searchTerms\":[\"Boon\"],\"associatedStoreIdentifiers\":[1042647367],\"appLaunchURLScheme\":\"boon\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"UniCredit\",\"searchTerms\":[\"UniCredit\",\"monhey\"],\"associatedStoreIdentifiers\":[1119177197],\"appLaunchURLScheme\":\"mhyuc\",\"appLaunchURLPath\":\"appleWalletList\",\"cameraCaptureSupport\":[\"credit\",\"debit\",\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Allianz\",\"searchTerms\":[\"Allianz\",\"Allianz Prime\"],\"associatedStoreIdentifiers\":[1282314742],\"appLaunchURLScheme\":\"allianz\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"ICCREA\",\"searchTerms\":[\"Banca Credito Cooperativo\",\"ICCREA\",\"Istituto Centrale delle Casse Rurali ed Artigiane\"],\"associatedStoreIdentifiers\":[],\"appLaunchURLScheme\":\"\",\"appLaunchURLPath\":\"\",\"cameraCaptureSupport\":[\"credit\",\"debit\",\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Widiba\",\"searchTerms\":[\"Monte dei Paschi di Siena\",\"Widiba\"],\"associatedStoreIdentifiers\":[915429623],\"appLaunchURLScheme\":\"widiba\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[\"debit\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"TIM\",\"searchTerms\":[\"Banca Sella\",\"Hype\",\"TIM\",\"‘TIM Personal’\"],\"associatedStoreIdentifiers\":[1156051372],\"appLaunchURLScheme\":\"timpersonal\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"Vamsi\",\"searchTerms\":[\"ok\"],\"associatedStoreIdentifiers\":[123],\"appLaunchURLScheme\":\"launch\",\"appLaunchURLPath\":\"here\",\"cameraCaptureSupport\":[\"credit\",\"debit\"],\"inAppProvisioningSupport\":[\"prepaid\"]},{\"displayName\":\"Banca Mediolanum\",\"searchTerms\":[\"Mediolanum\",\"Mediolanum Wallet’\",\"‘Banca Mediolanum’\"],\"associatedStoreIdentifiers\":[412610547],\"appLaunchURLScheme\":\"mediolanumwallet\",\"appLaunchURLPath\":\"applewalletlist\",\"cameraCaptureSupport\":[\"debit\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Hype\",\"searchTerms\":[\"Banca Sella\",\"Hype\"],\"associatedStoreIdentifiers\":[943405905],\"appLaunchURLScheme\":\"hype\",\"appLaunchURLPath\":\"appleWalletList\",\"cameraCaptureSupport\":[\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"N26\",\"searchTerms\":[\"N26\"],\"associatedStoreIdentifiers\":[956857223],\"appLaunchURLScheme\":\"number26\",\"appLaunchURLPath\":\"applepay/list\",\"cameraCaptureSupport\":[\"credit\",\"debit\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Nexi\",\"searchTerms\":[\"Banca Mediolanum\",\"Banco di Desio\",\"Banco di Spoleto\",\"Carige\",\"CartaSi\",\"Casse Rurali Trentine\",\"Credit Agricole\",\"Nexi\",\"Nexi Pay\",\"Sparkasse\"],\"associatedStoreIdentifiers\":[518695175],\"appLaunchURLScheme\":\"cartasiapp\",\"appLaunchURLPath\":\"appleWalletList\",\"cameraCaptureSupport\":[\"credit\",\"debit\",\"prepaid\"],\"inAppProvisioningSupport\":[]},{\"displayName\":\"Bunq\",\"searchTerms\":[\"Bunq\"],\"associatedStoreIdentifiers\":[1021178150],\"appLaunchURLScheme\":\"bunq\",\"appLaunchURLPath\":\"x-bunq-app/apple-pay-wallet\",\"cameraCaptureSupport\":[\"debit\"],\"inAppProvisioningSupport\":[]}]}" dataUsingEncoding:4];
  id v3 = +[PKWebServiceResponse responseWithData:v2];

  return v3;
}

- (id)pendingProvisioningForCredential:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_pendingProvisionings;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "representsCredential:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)requestProvisioningMethodMetadataForProduct:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = [v6 provisioningMethodTypes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke;
  void v15[3] = &unk_1E56EA338;
  id v16 = v6;
  dispatch_group_t v17 = v8;
  id v18 = self;
  int v10 = v8;
  id v11 = v6;
  [v9 enumerateObjectsUsingBlock:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_4;
  v13[3] = &unk_1E56D8360;
  id v14 = v7;
  id v12 = v7;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v13);
}

void __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"inApp"] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) provisioningMethodMetadataForType:v3];

    if (!v4)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v5 = [PKPaymentProvisioningMethodMetadataRequest alloc];
      id v6 = [*(id *)(a1 + 32) configuration];
      id v7 = [v6 productIdentifier];
      dispatch_group_t v8 = [(PKPaymentProvisioningMethodMetadataRequest *)v5 initWithProductIdentifier:v7 provisioningMethod:v3];

      id v9 = *(void **)(*(void *)(a1 + 48) + 344);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_2;
      v10[3] = &unk_1E56EA310;
      id v11 = *(id *)(a1 + 32);
      id v12 = v3;
      id v13 = *(id *)(a1 + 40);
      [v9 provisioningMethodWithRequest:v8 completion:v10];
    }
  }
}

void __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a2 != 1 || a4)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_3;
    v8[3] = &unk_1E56DB988;
    id v9 = *(id *)(a1 + 32);
    id v10 = v7;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) provisioningMethodMetadata];
  [v2 setProvisioningMethodMetadata:v3 forType:*(void *)(a1 + 48)];

  id v4 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v4);
}

uint64_t __97__PKPaymentProvisioningController_requestProvisioningMethodMetadataForProduct_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestPurchasesForProduct:(id)a3 completionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  long long v33 = v6;
  uint64_t v28 = [v6 provisioningMethodMetadataForType:@"digitalIssuance"];
  uint64_t v34 = [v28 digitalIssuanceMetadata];
  id v7 = [(PKPaymentWebService *)self->_webService context];
  long long v29 = [v7 regions];

  if (v34 && [v29 count])
  {
    *(void *)id v49 = 0;
    id v50 = v49;
    uint64_t v51 = 0x2810000000;
    id v52 = "";
    int v53 = 0;
    dispatch_group_t v8 = dispatch_group_create();
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v29;
    uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v9)
    {
      uint64_t v31 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v12 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v57 = v11;
            _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purchases in region %@", buf, 0xCu);
          }

          id v13 = [PKPaymentServiceProviderPurchasesRequest alloc];
          id v14 = [v33 configuration];
          int v15 = [v14 productIdentifier];
          id v16 = [v34 action];
          dispatch_group_t v17 = [v34 serviceProviderCountryCode];
          id v18 = [(PKPaymentServiceProviderPurchasesRequest *)v13 initWithPurchaseState:0 serviceProviderIdentifier:0 productIdentifier:v15 actionIdentifier:v16 serviceProviderCountryCode:v17];

          if (self->_isProvisioningForAltAccount)
          {
            __int16 v19 = [(PKPaymentWebService *)self->_webService targetDevice];
            uint64_t v20 = [v19 trustedDeviceEnrollmentInfoForWebService:self->_webService];

            __int16 v21 = [v20 deviceSerialNumber];
            [(PKPaymentServiceProviderPurchasesRequest *)v18 setTargetDeviceSerialNumber:v21];
          }
          dispatch_group_enter(v8);
          webService = self->_webService;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_450;
          void v39[3] = &unk_1E56EA360;
          id v44 = v49;
          id v40 = v32;
          id v41 = v33;
          uint64_t v42 = v11;
          long long v43 = v8;
          [(PKPaymentWebService *)webService serviceProviderPurchasesWithRequest:v18 inRegion:v11 completion:v39];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v9);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_453;
    block[3] = &unk_1E56EA388;
    id v36 = v32;
    id v23 = v32;
    objc_copyWeak(&v38, (id *)buf);
    id v37 = v27;
    id v24 = v27;
    dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);

    _Block_object_dispose(v49, 8);
  }
  else
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v49 = 0;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Error: Could not fetch product purchases", v49, 2u);
    }

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke;
    v54[3] = &unk_1E56D8360;
    id v55 = v27;
    id v26 = v27;
    dispatch_async(MEMORY[0x1E4F14428], v54);
  }
}

uint64_t __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_450(void *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_group_t v8 = (void *)a1[6];
      *(_DWORD *)long long buf = 138412546;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error querying region %@ for purchases: %@", buf, 0x16u);
    }
  }
  else
  {
    id v26 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[8] + 8) + 32));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      uint64_t v28 = *(void *)v37;
      long long v29 = a1;
      do
      {
        uint64_t v12 = 0;
        uint64_t v30 = v10;
        do
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
          if ((objc_msgSend(v13, "state", v26) & 0xFFFFFFFFFFFFFFFDLL) == 1)
          {
            id v14 = [v13 identifier];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v15 = (id)a1[4];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v33;
              while (2)
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v33 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = [*(id *)(*((void *)&v32 + 1) + 8 * i) purchase];
                  __int16 v21 = [v20 identifier];
                  char v22 = [v21 isEqualToString:v14];

                  if (v22)
                  {

                    PKLogFacilityTypeGetObject(6uLL);
                    id v24 = (PKPaymentPurchasedProductCredential *)objc_claimAutoreleasedReturnValue();
                    a1 = v29;
                    if (os_log_type_enabled(&v24->super.super, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v25 = (void *)v29[6];
                      *(_DWORD *)long long buf = 138412546;
                      id v41 = v14;
                      __int16 v42 = 2112;
                      id v43 = v25;
                      _os_log_impl(&dword_190E10000, &v24->super.super, OS_LOG_TYPE_DEFAULT, "Dropped purchase: %@ from region: %@ as this is already present in purcahses from other regions", buf, 0x16u);
                    }
                    goto LABEL_22;
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }

            a1 = v29;
            id v23 = (void *)v29[4];
            id v24 = [[PKPaymentPurchasedProductCredential alloc] initWithPaymentSetupProduct:v29[5] purchase:v13];
            [v23 addObject:v24];
LABEL_22:
            uint64_t v11 = v28;
            uint64_t v10 = v30;
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v10);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[8] + 8) + 32));
    id v6 = v26;
    id v5 = v27;
  }
  dispatch_group_leave((dispatch_group_t)a1[7]);
}

void __80__PKPaymentProvisioningController_requestPurchasesForProduct_completionHandler___block_invoke_453(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(a1 + 32) copy];
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v2 count];
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Final (pending/refunded) purchases count: %d", (uint8_t *)v7, 8u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 47, v2);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v2, 0);
  }
}

- (void)setupProductForProvisioning:(id)a3 includePurchases:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  char v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__39;
  v64[4] = __Block_byref_object_dispose__39;
  id v65 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  uint64_t v12 = &unk_191661000;
  if (v8)
  {
    id v13 = [v8 configuration];
    uint64_t v14 = [v13 type];
    if (v14 == 6)
    {
      uint64_t v16 = [v8 provisioningExtension];
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = __Block_byref_object_copy__39;
      v58[4] = __Block_byref_object_dispose__39;
      id v59 = 0;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2;
      v52[3] = &unk_1E56EA428;
      v52[4] = self;
      id v17 = v16;
      id v53 = v17;
      id v55 = v58;
      uint64_t v56 = v66;
      id v54 = v8;
      uint64_t v57 = v64;
      [(PKAsyncUnaryOperationComposer *)v11 addOperation:v52];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_7;
      v46[3] = &unk_1E56EA428;
      id v49 = v58;
      void v46[4] = self;
      id v18 = v17;
      id v47 = v18;
      id v48 = v10;
      id v50 = v66;
      uint64_t v51 = v64;
      [(PKAsyncUnaryOperationComposer *)v11 addOperation:v46];

      _Block_object_dispose(v58, 8);
      uint64_t v12 = (void *)&unk_191661000;
    }
    else
    {
      if (v14 == 10)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_470;
        v33[3] = &unk_1E56EA3B0;
        long long v36 = v66;
        id v34 = v10;
        long long v35 = self;
        [(PKAsyncUnaryOperationComposer *)v11 addOperation:v33];
        id v15 = v34;
      }
      else if (v14 == 11)
      {
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke;
        v60[3] = &unk_1E56EA3B0;
        long long v63 = v66;
        id v61 = v10;
        id v62 = self;
        [(PKAsyncUnaryOperationComposer *)v11 addOperation:v60];
        id v15 = v61;
      }
      else
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_466;
        v43[3] = &unk_1E56E0F90;
        void v43[4] = self;
        id v19 = v8;
        id v44 = v19;
        long long v45 = v66;
        [(PKAsyncUnaryOperationComposer *)v11 addOperation:v43];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5_468;
        v37[3] = &unk_1E56EA450;
        id v41 = v66;
        BOOL v42 = a4;
        id v38 = v19;
        long long v39 = self;
        id v40 = v10;
        [(PKAsyncUnaryOperationComposer *)v11 addOperation:v37];

        id v15 = v44;
      }
    }
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_471;
    v29[3] = &unk_1E56EA3B0;
    long long v32 = v66;
    id v30 = v10;
    uint64_t v31 = self;
    [(PKAsyncUnaryOperationComposer *)v11 addOperation:v29];
    id v13 = v30;
  }

  uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = v12[259];
  v24[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_472;
  v24[3] = &unk_1E56EA478;
  id v21 = v9;
  id v26 = v21;
  id v27 = v66;
  uint64_t v28 = v64;
  id v22 = v10;
  id v25 = v22;
  id v23 = [(PKAsyncUnaryOperationComposer *)v11 evaluateWithInput:v20 completion:v24];

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[5] + 384);
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v5, "pk_safelyAddObjectsFromArray:", v6);
  v7[2](v7, v8, 0);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 400), *(id *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 408);
  *(void *)(v8 + 408) = 0;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E56EA400;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v20 = v7;
  void v17[4] = v10;
  id v18 = v6;
  long long v21 = *(_OWORD *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 72);
  id v19 = v12;
  uint64_t v22 = v13;
  id v14 = v6;
  id v15 = v7;
  id v16 = +[PKIssuerProvisioningExtensionConsumerCoordinator beginWithExtension:v11 completion:v17];
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
    id v9 = [v8 deviceName];
    char v10 = [v9 isEqualToString:@"Apple Watch"];

    if (v10)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5;
      v24[3] = &unk_1E56EA3D8;
      id v25 = v6;
      long long v19 = *(_OWORD *)(a1 + 56);
      id v11 = (id)v19;
      long long v27 = v19;
      id v26 = *(id *)(a1 + 40);
      [v25 remotePassEntriesWithCompletion:v24];

      id v12 = v25;
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4;
      v28[3] = &unk_1E56EA3D8;
      id v29 = v6;
      long long v20 = *(_OWORD *)(a1 + 56);
      id v18 = (id)v20;
      long long v31 = v20;
      id v30 = *(id *)(a1 + 40);
      [v29 passEntriesWithCompletion:v28];

      id v12 = v29;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    uint64_t v13 = [*(id *)(a1 + 48) displayName];
    PKLocalizedPaymentString(&cfstr_ProvisioningEx_1.isa, &stru_1EE0F6808.isa, v13);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v14 = PKLocalizedPaymentString(&cfstr_ProvisioningEx_2.isa, 0);
    uint64_t v15 = PKDisplayableErrorCustomWithType(-1, v14, v12, 0, 0);
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_6;
    block[3] = &unk_1E56D83D8;
    id v23 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_7(void *a1, uint64_t a2, void *a3, void *a4)
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(*(void *)(a1[7] + 8) + 40) count];
  if (!v8)
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    uint64_t v33 = PKDisplayableErrorForCommonType(7, 0);
    uint64_t v34 = *(void *)(a1[9] + 8);
    long long v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_465;
    v40[3] = &unk_1E56D83D8;
    id v41 = v6;
    id v42 = v7;
    id v32 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v40);

    id v31 = v42;
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  long long v36 = v6;
  long long v37 = v7;
  v55[0] = *(void *)(a1[4] + 344);
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  id v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  long long v39 = a1;
  long long v48 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  id v11 = *(id *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (!v12) {
    goto LABEL_22;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v49 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      id v17 = [v16 paymentPassEntry];
      id v18 = v17;
      if (v17)
      {
        long long v19 = [v17 addRequestConfiguration];
        long long v20 = v19;
        if (v19)
        {
          long long v21 = [v19 _filterWebServices:v10 primaryAccountIdentifierRequired:1];
          id v22 = v21;
          if (v21 && [v21 count])
          {
            id v23 = [[PKPaymentIssuerProvisioningExtensionCredential alloc] initWithExtension:v39[5] entry:v18];
            [v38 addObject:v23];
            [(id)v39[6] addObject:v23];
          }
          else
          {
            PKLogFacilityTypeGetObject(6uLL);
            id v23 = (PKPaymentIssuerProvisioningExtensionCredential *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = [v16 identifier];
              *(_DWORD *)long long buf = 138412290;
              id v53 = v24;
              _os_log_impl(&dword_190E10000, &v23->super.super, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: filtering pass entry %@ due to configuration parameters.", buf, 0xCu);
            }
          }
          goto LABEL_18;
        }
        id v22 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v16 identifier];
          *(_DWORD *)long long buf = 138412290;
          id v53 = v23;
          _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: filtering pass entry %@ due to missing configuration.", buf, 0xCu);
LABEL_18:
        }
      }
      else
      {
        long long v20 = PKLogFacilityTypeGetObject(6uLL);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        id v22 = [v16 identifier];
        *(_DWORD *)long long buf = 138412290;
        id v53 = (PKPaymentIssuerProvisioningExtensionCredential *)v22;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController: filtering pass entry %@ due to type.", buf, 0xCu);
      }

LABEL_20:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
  }
  while (v13);
LABEL_22:

  id v25 = v38;
  *(unsigned char *)(*(void *)(v39[8] + 8) + 24) = [v38 count] != 0;
  if (!*(unsigned char *)(*(void *)(v39[8] + 8) + 24))
  {

    uint64_t v26 = PKDisplayableErrorForCommonType(7, 0);
    uint64_t v27 = *(void *)(v39[9] + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    id v25 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_464;
  block[3] = &unk_1E56DF5B8;
  id v29 = (void *)v39[5];
  void block[4] = v39[4];
  id v44 = v29;
  id v45 = v25;
  id v46 = v36;
  id v47 = v37;
  id v30 = v36;
  id v31 = v37;
  id v32 = v25;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_26:
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_464(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 400) == *(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 48) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 408);
    *(void *)(v3 + 408) = v2;
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v5();
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_465(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_466(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4_467;
  v13[3] = &unk_1E56DF8B0;
  uint64_t v10 = a1[6];
  id v15 = v7;
  uint64_t v16 = v10;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 requestProvisioningMethodMetadataForProduct:v9 completionHandler:v13];
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_4_467(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], 0);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_5_468(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = PKPaymentSetupMergeProductsPartnersAPIEnabled();
  uint64_t v9 = *(void **)(a1 + 32);
  if (v8) {
    LODWORD(v10) = [v9 supportsProvisioningMethodForType:2];
  }
  else {
    unint64_t v10 = ((unint64_t)[v9 supportedProvisioningMethods] >> 1) & 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || !*(unsigned char *)(a1 + 64) || ([*(id *)(a1 + 32) suppressPendingPurchases] & 1) != 0)
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_6_469;
    v14[3] = &unk_1E56E8C88;
    id v15 = *(id *)(a1 + 48);
    id v17 = v7;
    id v16 = v6;
    [v12 requestPurchasesForProduct:v13 completionHandler:v14];
  }
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_6_469(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  [*(id *)(a1 + 32) addObjectsFromArray:v6];
  if (v5)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error getting purchases for product:%@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_470(void *a1, uint64_t a2, void *a3, void *a4)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v5 = (void *)a1[4];
  uint64_t v6 = (void *)a1[5];
  id v7 = a4;
  id v11 = a3;
  uint64_t v8 = [v6 associatedCredentialsForDefaultBehaviour];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
  }
  [v5 addObjectsFromArray:v10];

  v7[2](v7, v11, 0);
}

void __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_2_471(void *a1, uint64_t a2, void *a3, void *a4)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v5 = (void *)a1[4];
  uint64_t v6 = (void *)a1[5];
  id v7 = a4;
  id v11 = a3;
  uint64_t v8 = [v6 associatedCredentialsForDefaultBehaviour];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
  }
  [v5 addObjectsFromArray:v10];

  v7[2](v7, v11, 0);
}

uint64_t __102__PKPaymentProvisioningController_setupProductForProvisioning_includePurchases_withCompletionHandler___block_invoke_3_472(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 40), a1[4]);
}

- (void)setupAccountCredentialForProvisioning:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v9 = [(PKPaymentWebService *)self->_webService context];
    uint64_t v10 = [v9 primaryRegion];

    id v11 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 accountServiceURL];
      uint64_t v13 = [v10 accountServicePushTopic];
      *(_DWORD *)long long buf = 138412546;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "setupAccountCredentialForProvisioning accountServiceURL %@ accountServicePushTopic %@", buf, 0x16u);
    }
    uint64_t v14 = [v10 accountServiceURL];
    if (v14
      && (id v15 = (void *)v14,
          [v10 accountServicePushTopic],
          id v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      [(PKPaymentProvisioningController *)self _setupAccountCredentialForProvisioning:v6 completion:v8];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v22 = v10;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "!!!! Missing account service URL or push topic, updating accounts before setting up account credential. Region: %@", buf, 0xCu);
      }

      id v17 = [(PKPaymentWebService *)self->_webService targetDevice];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__PKPaymentProvisioningController_setupAccountCredentialForProvisioning_completion___block_invoke;
      v18[3] = &unk_1E56EA4A0;
      void v18[4] = self;
      id v19 = v6;
      long long v20 = v8;
      [v17 updatedAccountsForProvisioningWithCompletion:v18];
    }
    goto LABEL_12;
  }
  if (v7)
  {
    uint64_t v10 = [(PKPaymentProvisioningController *)self displayableErrorForError:0];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
LABEL_12:
  }
}

void __84__PKPaymentProvisioningController_setupAccountCredentialForProvisioning_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Finished updating accounts %@ %@, continuing with setting up account credential.", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) _setupAccountCredentialForProvisioning:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_setupAccountCredentialForProvisioning:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  int v8 = [v6 account];
  id v9 = [v8 accountIdentifier];
  __int16 v10 = PKFeatureIdentifierToString([v8 feature]);
  id v11 = [(PKPaymentProvisioningController *)self _supportedFeatureIdentifierStringsForAccountProvisioning];
  if ([v11 containsObject:v10])
  {
    id v29 = v10;
    uint64_t v12 = [v6 passDetailsResponse];
    uint64_t v13 = v12;
    if (v12 && [v12 status] != -1)
    {
      if ([v13 status] != 1
        || ([v13 provisioningIdentifier],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            uint64_t v15 = [v14 length],
            v14,
            v15))
      {
        id v16 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v41 = v9;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Account credential for account: %@ has already already setup for provisioning", buf, 0xCu);
        }

        __int16 v10 = v29;
        if (v7) {
          v7[2](v7, 1, 0);
        }
        goto LABEL_25;
      }
      id v18 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Error: Pass details response cached but missing provisioning identifier", buf, 2u);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke;
    aBlock[3] = &unk_1E56EA518;
    id v19 = v7;
    id v39 = v19;
    void aBlock[4] = self;
    id v20 = v6;
    id v38 = v20;
    long long v21 = _Block_copy(aBlock);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_475;
    v30[3] = &unk_1E56EA590;
    uint64_t v28 = v9;
    id v31 = v9;
    id v32 = v8;
    id v22 = v20;
    id v33 = v22;
    uint64_t v34 = self;
    long long v35 = v19;
    id v23 = v21;
    id v36 = v23;
    id v24 = (void (**)(void *, void))_Block_copy(v30);
    uint64_t v25 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v26 = [v22 sharingInstanceIdentifier];

      if (v26) {
        uint64_t v27 = 111;
      }
      else {
        uint64_t v27 = 255;
      }
      [v25 paymentWebService:self->_webService deviceMetadataWithFields:v27 completion:v24];
    }
    else
    {
      v24[2](v24, 0);
    }

    id v9 = v28;
    __int16 v10 = v29;
LABEL_25:

    goto LABEL_26;
  }
  id v17 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v41 = v9;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Account credential for account: %@ is not supported by target device supported features", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v13 = [(PKPaymentProvisioningController *)self displayableErrorForError:0];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v13);
    goto LABEL_25;
  }
LABEL_26:
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 status] == 4)
  {
    uint64_t v4 = [v3 passURL];
    if (v4)
    {
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Downloading the account shell pass again after getting pass details: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1[4]);
      id v6 = (void *)*((void *)a1[4] + 43);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_473;
      v9[3] = &unk_1E56EA4F0;
      objc_copyWeak(&v13, (id *)buf);
      id v10 = a1[5];
      id v11 = v4;
      id v12 = a1[6];
      BOOL v14 = v3 != 0;
      [v6 passAtURL:v11 completion:v9];

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v8 = (void (**)(id, BOOL, void))a1[6];
      if (v8) {
        v8[2](v8, v3 != 0, 0);
      }
    }
  }
  else
  {
    id v7 = (void (**)(id, BOOL, void))a1[6];
    if (v7) {
      v7[2](v7, v3 != 0, 0);
    }
  }
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_473(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2;
  block[3] = &unk_1E56EA4C8;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v12[1] = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 64);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && *(void *)(a1 + 72) == 1 && (uint64_t v3 = *(void *)(a1 + 32)) != 0)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Updating the account credential payment pass %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) setPaymentPass:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "A nil payment pass was defined after getting the pass at url %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 80), 0);
  }
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_475(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(PKAccountWebServicePassDetailsRequest);
  [(PKAccountWebServicePassDetailsRequest *)v4 setAccountIdentifier:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 40) accountBaseURL];
  [(PKAccountWebServicePassDetailsRequest *)v4 setBaseURL:v5];

  [(PKAccountWebServicePassDetailsRequest *)v4 setDeviceMetadata:v3];
  uint64_t v6 = [*(id *)(a1 + 48) sharingInstanceIdentifier];
  [(PKAccountWebServicePassDetailsRequest *)v4 setSharingInstanceIdentifier:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 56) + 344);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2_477;
  v8[3] = &unk_1E56EA568;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  [v7 accountPassDetailsRequest:v4 completion:v8];
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_2_477(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_3;
  v9[3] = &unk_1E56EA540;
  id v10 = v5;
  id v11 = a1[4];
  id v12 = v6;
  id v13 = a1[5];
  id v14 = a1[6];
  id v15 = a1[7];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __85__PKPaymentProvisioningController__setupAccountCredentialForProvisioning_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setPassDetailsResponse:");
  }
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2
    && (PKAccountDisplayableError(v2, [*(id *)(a1 + 56) feature], 0, 0),
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5)
    {
      id v6 = v4;
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, *(void *)(a1 + 32) != 0);
      uint64_t v4 = v6;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    uint64_t v4 = 0;
  }
}

- (id)_filteredPaymentSetupProductSections:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isProvisioningForAltAccount)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = v5;
    id obj = v5;
    uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v22 = v7;
          id v9 = [v7 categories];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                id v15 = objc_msgSend(v14, "identifier", v17);
                if (([v15 isEqualToString:@"creditDebit"] & 1) == 0
                  && ([v15 isEqualToString:@"appExtensions"] & 1) == 0)
                {
                  [v8 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }

          if ([v8 count])
          {
            [v22 setCategories:v8];
            [v19 addObject:v22];
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }

    uint64_t v5 = v17;
  }
  else
  {
    id v19 = v4;
  }

  return v19;
}

- (id)_filterPaymentSetupProducts:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_targetDeviceSupportsTypeF)
  {
    uint64_t v5 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (objc_opt_respondsToSelector())
    {
      int v6 = [v5 felicaSecureElementIsAvailable];
      unint64_t v7 = 1;
      if (!v6) {
        unint64_t v7 = 2;
      }
    }
    else
    {
      unint64_t v7 = 2;
    }
    self->_unint64_t targetDeviceSupportsTypeF = v7;
  }
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = [(PKPaymentProvisioningController *)self _supportedFeatureIdentifierStrings];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    uint64_t v49 = *(void *)v53;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
        id v13 = [v12 configuration];
        uint64_t v14 = [v13 state];

        if (self->_allowedPaymentNetworks)
        {
          id v15 = [v12 paymentOptions];
          id v16 = [v15 firstObject];

          uint64_t v17 = PKPaymentNetworkNameForPaymentCredentialType([v16 cardType]);
          if ([(NSArray *)self->_allowedPaymentNetworks containsObject:v17]) {
            goto LABEL_17;
          }
          id v18 = [v12 configuration];
          if ([v18 featureIdentifier] == 2)
          {

            uint64_t v10 = v49;
LABEL_17:

            goto LABEL_18;
          }
          id v39 = [v12 configuration];
          uint64_t v40 = [v39 type];

          uint64_t v10 = v49;
          if (v40 != 5) {
            goto LABEL_25;
          }
        }
LABEL_18:
        if ([(NSSet *)self->_requiredTransitNetworkIdentifiers count])
        {
          id v19 = [v12 supportedTransitNetworkIdentifiers];
          uint64_t v20 = v19;
          if (!v19 || ![v19 count])
          {

LABEL_25:
            long long v23 = [v12 configuration];
LABEL_26:
            int v24 = 0;
            goto LABEL_27;
          }
          requiredTransitNetworkIdentifiers = self->_requiredTransitNetworkIdentifiers;
          id v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
          LODWORD(requiredTransitNetworkIdentifiers) = [(NSSet *)requiredTransitNetworkIdentifiers intersectsSet:v22];

          if (!requiredTransitNetworkIdentifiers) {
            goto LABEL_25;
          }
        }
        if (([v12 allSupportedProtocols] & 4) != 0)
        {
          unint64_t targetDeviceSupportsTypeF = self->_targetDeviceSupportsTypeF;
          long long v23 = [v12 configuration];
          if (targetDeviceSupportsTypeF != 1) {
            goto LABEL_26;
          }
        }
        else
        {
          long long v23 = [v12 configuration];
        }
        if ([v23 type] == 7)
        {
          uint64_t v26 = [v23 featureIdentifier];
          long long v27 = PKFeatureIdentifierToString(v26);
          int v28 = [v48 containsObject:v27];

          if (!v28) {
            goto LABEL_26;
          }
          int v29 = PKDeviceSupportsApplicationForFeatureIdentifier(v26);
          if (v26 == 3 && v29)
          {
            long long v30 = [v12 accounts];
            id v31 = [v30 firstObject];

            id v32 = [v31 payLaterDetails];
            int v33 = [v32 hasProvisionedPass];

            BOOL v34 = [(PKPaymentProvisioningController *)self hasPayLaterPass];
            int v35 = [v31 hidePayLaterSetupInWallet];
            if (v31) {
              int v36 = v33;
            }
            else {
              int v36 = 1;
            }
            uint64_t v10 = v49;
            int v37 = v36 | v34 | v35;
            if ((unint64_t)(v14 - 3) < 2) {
              char v38 = (v31 == 0) & ~v34;
            }
            else {
              char v38 = 0;
            }

            if (v37 == 1 && (v38 & 1) == 0) {
              goto LABEL_26;
            }
          }
          else if (!v29)
          {
            goto LABEL_26;
          }
        }
        allowedProductIdentifiers = self->_allowedProductIdentifiers;
        if (allowedProductIdentifiers)
        {
          uint64_t v42 = [v12 productIdentifier];
          BOOL v43 = [(NSSet *)allowedProductIdentifiers containsObject:v42];

          if (!v43) {
            goto LABEL_26;
          }
        }
        if ([v12 minimumSupportedAge] >= 13 && self->_isCurrentUserUnder13 == 1)
        {
LABEL_54:
          [v12 setMeetsAgeRequirements:0];
          goto LABEL_55;
        }
        int v24 = 1;
LABEL_27:
        [v12 setMeetsAgeRequirements:1];
        if (v24
          && self->_isProvisioningForAltAccount
          && [v12 minimumTargetUserSupportedAge] >= 13
          && self->_isTargetUserUnder13 == 1)
        {
          goto LABEL_54;
        }
        if (v24)
        {
          [v50 addObject:v12];
          goto LABEL_58;
        }
LABEL_55:
        id v44 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [v12 displayName];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v57 = v45;
          _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Product %@ is not supported by target device", buf, 0xCu);
        }
LABEL_58:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v46 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      uint64_t v9 = v46;
    }
    while (v46);
  }

  return v50;
}

- (void)_queryRequirementsForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [v6 state];
  uint64_t v9 = [v8 requirementsResponse];

  if (v9)
  {
    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
  else
  {
    uint64_t v10 = [[PKPaymentRequirementsRequest alloc] initWithPaymentCredential:v6];
    uint64_t v11 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];

    if (v11)
    {
      uint64_t v12 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
      [(PKPaymentRequirementsRequest *)v10 setReferrerIdentifier:v12];
    }
    id v13 = [v6 state];
    uint64_t v14 = [v13 sid];

    utility = self->_utility;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke;
    v16[3] = &unk_1E56EA5B8;
    id v17 = v6;
    id v18 = self;
    id v19 = v7;
    [(PKProvisioningUtility *)utility requestRequirements:v10 sid:v14 completion:v16];
  }
}

void __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke_2;
  block[3] = &unk_1E56D8C20;
  id v13 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v6;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PKPaymentProvisioningController__queryRequirementsForCredential_completion___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32)
    || [*(id *)(a1 + 40) isRemoteCredential]
    && ([*(id *)(a1 + 40) remoteCredential],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 status],
        v2,
        v3 == 2)
    && [*(id *)(a1 + 32) status] != 1)
  {
    uint64_t v5 = [*(id *)(a1 + 48) displayableErrorForError:*(void *)(a1 + 56)];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) state];
    [v4 setRequirementsResponse:*(void *)(a1 + 32)];

    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_queryEligibilityForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [v6 state];
  uint64_t v9 = [v8 eligibilityResponse];

  if (v9)
  {
    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
  else
  {
    id v10 = [[PKPaymentEligibilityRequest alloc] initWithPaymentCredential:v6];
    id v11 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];

    if (v11)
    {
      uint64_t v12 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
      [(PKPaymentEligibilityRequest *)v10 setReferrerIdentifier:v12];
    }
    id v13 = [v6 state];
    id v14 = [v13 sid];

    utility = self->_utility;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke;
    v17[3] = &unk_1E56EA5E0;
    id v18 = v6;
    id v19 = v14;
    uint64_t v20 = self;
    uint64_t v21 = v7;
    id v16 = v14;
    [(PKProvisioningUtility *)utility requestEligibility:v10 sid:v16 completion:v17];
  }
}

void __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke_2;
  v10[3] = &unk_1E56D8BF8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v14 = v6;
  id v7 = *(void **)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 48);
  id v16 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __77__PKPaymentProvisioningController__queryEligibilityForCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isSafariCredential]
    && [*(id *)(a1 + 40) supersededBy])
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      int v11 = 138412290;
      uint64_t v12 = v3;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Excluding Safari credential since the same card is already being offered as a previous card", (uint8_t *)&v11, 0xCu);
    }

    char v4 = 0;
  }
  else
  {
    char v4 = 1;
  }
  id v5 = *(void **)(a1 + 40);
  if (v5
    && !*(void *)(a1 + 56)
    && ([v5 eligibilityStatus] == 1 ? (char v6 = v4) : (char v6 = 0),
        [*(id *)(a1 + 32) state],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 setEligibilityResponse:*(void *)(a1 + 40)],
        v7,
        (v6 & 1) != 0))
  {
    id v8 = 0;
    uint64_t v9 = 1;
  }
  else if (*(void *)(a1 + 56))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 64), "displayableErrorForError:");
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v8 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v9, v8);
  }
}

- (void)requestRequirements:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  unint64_t state = self->_state;
  if (state)
  {
    if (v7)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = PKPaymentProvisioningControllerStateToString(state);
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error: Requirements requested but state is: %@", (uint8_t *)&v12, 0xCu);
      }
      v8[2](v8, 0, 0);
    }
  }
  else
  {
    [(PKPaymentProvisioningController *)self _requestRequirements:v6 withCompletionHandler:v7];
  }
}

- (void)_requestRequirements:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  [(PKPaymentProvisioningController *)self _setLocalizedProgressDescription:0];
  id v8 = [v6 paymentCredential];
  currentCredential = self->_currentCredential;
  self->_currentCredential = v8;

  uint64_t v10 = [(PKPaymentCredential *)self->_currentCredential state];
  int v11 = [v10 requirementsResponse];

  if (v11 && [v11 status] == 1)
  {
    [(PKSecureElementProvisioningState *)self->_provisioningState setRequirementsResponse:v11];
    [(PKPaymentProvisioningController *)self _setState:1 notify:1];
    if (v7) {
      v7[2](v7, v11, 0);
    }
  }
  else
  {
    int v12 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];

    if (v12)
    {
      uint64_t v13 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
      [v6 setReferrerIdentifier:v13];
    }
    uint64_t v14 = [(PKPaymentProvisioningController *)self _effectiveSessionIdentifier];
    utility = self->_utility;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E56EA608;
    void v16[4] = self;
    id v17 = v7;
    [(PKProvisioningUtility *)utility requestRequirements:v6 sid:v14 completion:v16];
  }
}

void __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E56DEB98;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __78__PKPaymentProvisioningController__requestRequirements_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "setRequirementsResponse:");
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 168);
    uint64_t v3 = [*(id *)(a1 + 32) nonce];
    [v2 setNonce:v3];

    if ([*(id *)(a1 + 32) status] == 1) {
      [*(id *)(a1 + 40) _setState:1 notify:1];
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)resolveAmbiguousRequirementsWithProductIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_state)
    {
      id v9 = v4;
      id v5 = [(PKSecureElementProvisioningState *)self->_provisioningState requirementsResponse];
      uint64_t v6 = [v5 status];

      id v4 = v9;
      if (v6 == 2)
      {
        [(PKPaymentProvisioningController *)self _setState:1 notify:0];
        provisioningState = self->_provisioningState;
        id v8 = (void *)[v9 copy];
        [(PKSecureElementProvisioningState *)provisioningState setProductIdentifier:v8];

        id v4 = v9;
      }
    }
  }
}

- (void)resolveRequirementsUsingProduct:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_state)
  {
    id v6 = v4;
    [(PKPaymentProvisioningController *)self _setState:1 notify:0];
    id v5 = [[PKPaymentRequirementsResponse alloc] initWithProduct:v6];
    [(PKSecureElementProvisioningState *)self->_provisioningState setRequirementsResponse:v5];

    id v4 = v6;
  }
}

- (void)resolveRequirementsUsingProvisioningMethodMetadata:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_state)
  {
    id v6 = v4;
    [(PKPaymentProvisioningController *)self _setState:1 notify:0];
    id v5 = [[PKPaymentRequirementsResponse alloc] initWithProvisioningMethodMetadata:v6];
    [(PKSecureElementProvisioningState *)self->_provisioningState setRequirementsResponse:v5];

    id v4 = v6;
  }
}

- (void)resolveRequirementsForShareableCredential:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentCredential = self->_currentCredential;
    int v10 = 138412290;
    int v11 = currentCredential;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "resolivng requirements for credential %@", (uint8_t *)&v10, 0xCu);
  }

  if (!self->_state)
  {
    [(PKPaymentProvisioningController *)self _setState:1 notify:0];
    objc_storeStrong((id *)&self->_currentCredential, a3);
    id v8 = +[PKPaymentRequirementsResponse emptyRequirementsResponse];
    [(PKSecureElementProvisioningState *)self->_provisioningState setRequirementsResponse:v8];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v10 = 67109120;
    LODWORD(v11) = state;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "state is %d", (uint8_t *)&v10, 8u);
  }
}

- (void)resolveRequirementsForIssuerProvisioningExtensionCredential:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentCredential = self->_currentCredential;
    int v10 = 138412290;
    int v11 = currentCredential;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "resolivng requirements for credential %@", (uint8_t *)&v10, 0xCu);
  }

  if (!self->_state)
  {
    [(PKPaymentProvisioningController *)self _setState:1 notify:0];
    objc_storeStrong((id *)&self->_currentCredential, a3);
    id v8 = +[PKPaymentRequirementsResponse emptyRequirementsResponse];
    [(PKSecureElementProvisioningState *)self->_provisioningState setRequirementsResponse:v8];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v10 = 67109120;
    LODWORD(v11) = state;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "state is %d", (uint8_t *)&v10, 8u);
  }
}

- (BOOL)setState:(int64_t)a3 forCredential:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    currentCredential = self->_currentCredential;
    int v16 = 67109378;
    *(_DWORD *)id v17 = a3;
    *(_WORD *)&void v17[4] = 2112;
    *(void *)&v17[6] = currentCredential;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to set provisioning controller state to %d for credential %@", (uint8_t *)&v16, 0x12u);
  }

  switch(a3)
  {
    case 0:
      int v9 = 1;
      break;
    case 1:
      BOOL v10 = self->_state == 0;
      goto LABEL_12;
    case 2:
      BOOL v10 = self->_state == 1;
      goto LABEL_12;
    case 3:
      unint64_t state = self->_state;
      goto LABEL_10;
    case 4:
      unint64_t state = self->_state & 0xFFFFFFFFFFFFFFFELL;
LABEL_10:
      BOOL v10 = state == 2;
      goto LABEL_12;
    case 5:
      BOOL v10 = self->_state == 4;
LABEL_12:
      int v9 = v10;
      break;
    default:
      int v9 = 0;
      break;
  }
  if (([v6 isHomeKeyCredential] & 1) != 0
    || ([v6 isAppleBalanceCredential] | v9) == 1)
  {
    [(PKPaymentProvisioningController *)self _setState:a3 notify:0];
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"failed";
    int64_t v14 = self->_state;
    if (v12) {
      uint64_t v13 = @"succeeded";
    }
    int v16 = 138412546;
    *(void *)id v17 = v13;
    *(_WORD *)&v17[8] = 1024;
    *(_DWORD *)&v17[10] = v14;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Setting provisioning controller state %@, state is %d", (uint8_t *)&v16, 0x12u);
  }

  return v12;
}

- (void)resolveLocalEligibilityRequirementsForAppleBalanceCredential:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 isAppleBalanceCredential];
  if (([v6 isRemoteCredential] & 1) != 0
    || (v8 & 1) != 0
    || [v6 isLocalPassCredential])
  {
    int v9 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__39;
    void v20[4] = __Block_byref_object_dispose__39;
    id v21 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke;
    v19[3] = &unk_1E56EA630;
    void v19[4] = v20;
    [(PKAsyncUnaryOperationComposer *)v9 addOperation:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_502;
    v18[3] = &unk_1E56E0F18;
    void v18[4] = self;
    void v18[5] = v20;
    [(PKAsyncUnaryOperationComposer *)v9 addOperation:v18];
    objc_initWeak(&location, self);
    BOOL v10 = [MEMORY[0x1E4F1CA98] null];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_510;
    v12[3] = &unk_1E56EA720;
    id v15 = v20;
    objc_copyWeak(&v16, &location);
    id v13 = v6;
    id v14 = v7;
    id v11 = [(PKAsyncUnaryOperationComposer *)v9 evaluateWithInput:v10 completion:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    _Block_object_dispose(v20, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  if ((objc_msgSend(v8, "ams_isActiveAccountCombined") & 1) == 0)
  {
    int v9 = objc_msgSend(v8, "ams_activeiTunesAccount");

    if (v9)
    {
      BOOL v10 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Apple Account provisioning failed: iCloud and iTunes account do not match", v16, 2u);
      }

      id v11 = PKLocalizedLynxString(&cfstr_EligibilityErr.isa, 0);
      BOOL v12 = PKLocalizedLynxString(&cfstr_EligibilityErr_0.isa, 0);
      uint64_t v13 = PKDisplayableErrorCustomWithType(-1, v11, v12, 0, 0);
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  v7[2](v7, v6, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0);
}

void __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_502(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F4EF40] sharedInstance];
  int v9 = [v8 primaryAuthKitAccount];
  BOOL v10 = [v8 appleIDCountryCodeForAccount:v9];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
  BOOL v12 = [v11 deviceRegion];

  if (([v12 isEqualToString:v10] & 1) == 0)
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Apple Account provisioning failed: account region %@ and device region %@ do not match", (uint8_t *)&v19, 0x16u);
    }

    uint64_t v14 = PKLocalizedLynxString(&cfstr_EligibilityErr_1.isa, 0);
    id v15 = PKLocalizedLynxString(&cfstr_EligibilityErr_2.isa, 0);
    uint64_t v16 = PKDisplayableErrorCustomWithType(-1, v14, v15, 0, 0);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  v7[2](v7, v6, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0);
}

void __111__PKPaymentProvisioningController_resolveLocalEligibilityRequirementsForAppleBalanceCredential_withCompletion___block_invoke_510(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    char v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
      [v8 _setState:1 notify:0];
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (void)requestEligibility:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  int64_t state = self->_state;
  if (state == 1) {
    goto LABEL_5;
  }
  if (!state)
  {
    uint64_t v9 = [v6 paymentCredential];
    if (v9)
    {

      goto LABEL_5;
    }
    uint64_t v22 = [v6 issuerIdentifier];
    if (v22)
    {
      uint64_t v23 = (void *)v22;
      int v24 = [v6 encryptedCardData];

      if (v24)
      {
LABEL_5:
        id v10 = [v6 paymentCredential];
        id v11 = [v10 state];
        BOOL v12 = [v11 eligibilityResponse];

        if (v12 && [v12 eligibilityStatus] == 1)
        {
          [(PKSecureElementProvisioningState *)self->_provisioningState setEligibilityResponse:v12];
          [(PKPaymentProvisioningController *)self _setState:2 notify:1];
          if (v7) {
            v7[2](v7, v12, 0);
          }
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v39 = 0;
        uint64_t v40 = &v39;
        uint64_t v41 = 0x2020000000;
        uint64_t v42 = 0;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke;
        v38[3] = &unk_1E56DEFE8;
        v38[4] = &v39;
        uint64_t v13 = PKBeginBackgroundTask(@"com.apple.passbook.cardChecking", v38);
        v40[3] = v13;
        uint64_t v14 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];

        if (v14)
        {
          id v15 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
          [v6 setReferrerIdentifier:v15];
        }
        uint64_t v16 = [v6 addPaymentPassRequestConfiguration];
        currentAddPaymentPassRequestConfiguration = self->_currentAddPaymentPassRequestConfiguration;
        self->_currentAddPaymentPassRequestConfiguration = v16;

        if ([(PKPaymentProvisioningController *)self _isProvisioningPaymentAccount])
        {
          uint64_t v18 = PKLocalizedAquamanString(&cfstr_ProgressContac.isa, 0);
        }
        else
        {
          int v19 = [v6 paymentCredential];
          uint64_t v20 = [v19 credentialType];

          if (v20 == 135)
          {
            __int16 v21 = 0;
            goto LABEL_21;
          }
          uint64_t v18 = PKCoreLocalizedString(&cfstr_ProgressContac_0.isa, 0);
        }
        __int16 v21 = (void *)v18;
LABEL_21:
        [(PKPaymentProvisioningController *)self _setLocalizedProgressDescription:v21];
        if ([(PKSecureElementProvisioningState *)self->_provisioningState hasNonce]
          && [v6 requiresNonce])
        {
          long long v25 = [(PKSecureElementProvisioningState *)self->_provisioningState useNonce];
          [v6 setNonce:v25];
        }
        uint64_t v26 = [v6 paymentCredential];
        long long v27 = [v26 state];
        int v28 = [v27 sid];
        int v29 = v28;
        if (v28)
        {
          long long v30 = v28;
        }
        else
        {
          uint64_t v31 = [(PKSecureElementProvisioningState *)self->_provisioningState sid];
          id v32 = (void *)v31;
          int v33 = &stru_1EE0F5368;
          if (v31) {
            int v33 = (__CFString *)v31;
          }
          long long v30 = v33;
        }
        utility = self->_utility;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_2;
        v35[3] = &unk_1E56EA680;
        void v35[4] = self;
        int v36 = v7;
        int v37 = &v39;
        [(PKProvisioningUtility *)utility requestEligibility:v6 sid:v30 completion:v35];

        _Block_object_dispose(&v39, 8);
        goto LABEL_30;
      }
    }
  }
  if (v7) {
    v7[2](v7, 0, 0);
  }
LABEL_31:
}

void __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    PKEndBackgroundTask(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E56EA658;
  uint64_t v7 = a1[4];
  char v8 = (void *)a1[5];
  id v14 = v5;
  uint64_t v15 = v7;
  id v16 = v6;
  id v9 = v8;
  uint64_t v10 = a1[6];
  id v17 = v9;
  uint64_t v18 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PKPaymentProvisioningController_requestEligibility_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 168);
    id v4 = [v2 nonce];
    [v3 setNonce:v4];

    if (!*(void *)(a1 + 48))
    {
      [*(id *)(*(void *)(a1 + 40) + 168) setEligibilityResponse:*(void *)(a1 + 32)];
      uint64_t v7 = [*(id *)(a1 + 32) eligibilityStatus];
      if (v7 == 3)
      {
        [*(id *)(a1 + 40) _passAlreadyProvisioned];
      }
      else if (v7 == 1)
      {
        [*(id *)(a1 + 40) _setState:2 notify:1];
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    if (*(void *)(a1 + 48)) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = *(void *)(a1 + 32);
    }
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8)
  {
    PKEndBackgroundTask(v8);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (void)acceptTerms
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state == 3)
  {
    self->_unint64_t state = 4;
  }
  else
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = PKPaymentProvisioningControllerStateToString(state);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Terms accept requested but found incorrect state: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)declineTerms
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state == 3)
  {
    self->_unint64_t state = 1;
    [(PKSecureElementProvisioningState *)self->_provisioningState setEligibilityResponse:0];
    id v4 = [(PKSecureElementProvisioningState *)self->_provisioningState useNonce];
  }
  else
  {
    int v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = PKPaymentProvisioningControllerStateToString(state);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Terms decline requested but found incorrect state: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)resolveProvisioningForCredential:(id)a3
{
  if (!self->_state)
  {
    associatedCredentials = self->_associatedCredentials;
    id v5 = a3;
    [(NSMutableArray *)associatedCredentials removeObject:v5];
    [(PKPaymentProvisioningControllerCredentialQueue *)self->_credentialProvisioningQueue removeCredential:v5];

    currentCredential = self->_currentCredential;
    self->_currentCredential = 0;

    [(PKPaymentProvisioningController *)self _setState:5 notify:1];
  }
}

- (void)requestExternalizedAuthForWatchWithVisibleViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Requesting and storing externalized auth", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKPaymentProvisioningController_requestExternalizedAuthForWatchWithVisibleViewController_completion___block_invoke;
  aBlock[3] = &unk_1E56D8388;
  id v9 = v7;
  id v13 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    [v11 requestAndStoreExternalizedAuthWithVisibleViewController:v6 completion:v10];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v11 requestAndStoreExternalizedAuthWithCompletion:v10];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Target device doesn't support generating an externalized auth. Let the user proceed anyways because it might succeed", buf, 2u);
    }

    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __103__PKPaymentProvisioningController_requestExternalizedAuthForWatchWithVisibleViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Requested externalized auth returned %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      uint64_t v6 = [v3 code];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v6 == 4)
      {
        (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v3);
      }
      else
      {
        uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
        id v9 = PKLocalizedPaymentString(&cfstr_WatchOnWristRe.isa, 0, *MEMORY[0x1E4F28568]);
        v14[0] = v9;
        v13[1] = *MEMORY[0x1E4F285A0];
        uint64_t v10 = PKLocalizedPaymentString(&cfstr_WatchOnWristRe_0.isa, 0);
        v14[1] = v10;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
        id v12 = [v8 errorWithDomain:@"PKDisplayableError" code:60000 userInfo:v11];
        (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v12);
      }
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
    }
  }
}

- (void)storeExternalizedAuth:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_externalizedAuth, a3);
    id v5 = v6;
  }
}

- (BOOL)hasExternalizedAuth
{
  return [(NSData *)self->_externalizedAuth length] != 0;
}

- (id)retrieveExternalizedAuth
{
  return self->_externalizedAuth;
}

- (void)requestProvisioning:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKPaymentProvisioningController_requestProvisioning_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E56EA6A8;
  id v9 = v6;
  id v7 = v6;
  [(PKPaymentProvisioningController *)self requestProvisioning:a3 withCompletion:v8];
}

uint64_t __77__PKPaymentProvisioningController_requestProvisioning_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)requestProvisioning:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_state == 4)
  {
    id v9 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__39;
    void v19[4] = __Block_byref_object_dispose__39;
    id v20 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke;
    v17[3] = &unk_1E56EA6F8;
    objc_copyWeak(&v18, &location);
    void v17[4] = v19;
    [(PKAsyncUnaryOperationComposer *)v9 addOperation:v17];
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_3;
    v12[3] = &unk_1E56EA720;
    objc_copyWeak(&v16, &location);
    id v13 = v6;
    id v14 = v8;
    uint64_t v15 = v19;
    id v11 = [(PKAsyncUnaryOperationComposer *)v9 evaluateWithInput:v10 completion:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    _Block_object_dispose(v19, 8);

    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

void __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained[8];
  if ([v9 credentialType] == 135
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v9 isFromBackgroundProvisioning] & 1) == 0)
  {
    uint64_t v10 = +[PKAccountService sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_2;
    v11[3] = &unk_1E56EA6D0;
    uint64_t v14 = *(void *)(a1 + 32);
    id v13 = v7;
    id v12 = v6;
    [v10 backgroundProvisionInProgressForFeature:4 withCompletion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = PKLocalizedLynxString(&cfstr_ErrorBackgroun.isa, 0);
    id v4 = PKLocalizedLynxString(&cfstr_ErrorBackgroun_0.isa, 0);
    uint64_t v5 = PKDisplayableErrorCustomWithType(-1, v3, v4, 0, 0);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

void __70__PKPaymentProvisioningController_requestProvisioning_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if ([a4 isCanceled])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _requestProvisioning:*(void *)(a1 + 32) withCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (void)_noteProvisioningDidBegin
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(a1 + 32) + 136);
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 136);
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Received Note provisioning did begin (%li)", (uint8_t *)&buf, 0xCu);
  }

  if (*(void *)(*(void *)(a1 + 32) + 136) == 1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Note provisioning did begin to target device", (uint8_t *)&buf, 2u);
    }

    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 _localizedProgressDescriptionForEnablingCard];
    [v4 _setLocalizedProgressDescription:v5];

    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
    [v6 noteProvisioningDidBegin];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke_543;
    v8[3] = &unk_1E56DEFE8;
    void v8[4] = &buf;
    uint64_t v7 = PKBeginBackgroundTask(@"com.apple.passbook.cardProvisioning", v8);
    *(void *)(*((void *)&buf + 1) + 24) = v7;
    *(void *)(*(void *)(a1 + 32) + 128) = v7;
    _Block_object_dispose(&buf, 8);
  }
}

void __60__PKPaymentProvisioningController__noteProvisioningDidBegin__block_invoke_543(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    PKEndBackgroundTask(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)_noteProvisioningDidEnd
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKPaymentProvisioningController__noteProvisioningDidEnd__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PKPaymentProvisioningController__noteProvisioningDidEnd__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  --*(void *)(*(void *)(a1 + 32) + 136);
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 136);
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Received Note provisioning did end (%li)", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v4)
  {
    if (v4 < 0)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = v4;
        _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Unbalance Note provisioning did begin/end current count:%li. Setting back to 0", (uint8_t *)&v7, 0xCu);
      }

      *(void *)(*(void *)(a1 + 32) + 136) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Note provisioning did end to target device", (uint8_t *)&v7, 2u);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 128);
    if (v5)
    {
      PKEndBackgroundTask(v5);
      *(void *)(*(void *)(a1 + 32) + 128) = 0;
    }
    else
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Unexpected invalid background task identifier", (uint8_t *)&v7, 2u);
      }
    }
    [*(id *)(a1 + 32) _setLocalizedProgressDescription:0];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
    [v6 noteProvisioningDidEnd];
  }
}

- (id)_localizedProgressDescriptionForEnablingCard
{
  if ([(PKPaymentProvisioningController *)self _isProvisioningPaymentAccount]
    || [(PKPaymentCredential *)self->_currentCredential credentialType] == 135)
  {
    uint64_t v3 = [(PKPaymentCredential *)self->_currentCredential longDescription];
    uint64_t v4 = (void *)v3;
    if (v3) {
      PKLocalizedAquamanString(&cfstr_ProgressSettin.isa, &stru_1EE0F6808.isa, v3);
    }
    else {
    uint64_t v5 = PKLocalizedAquamanString(&cfstr_ProgressSettin_0.isa, 0);
    }
  }
  else
  {
    uint64_t v5 = PKCoreLocalizedString(&cfstr_ProgressEnabli.isa, 0);
  }
  return v5;
}

- (void)ingestSecureElementPassForCredential:(id)a3 completion:(id)a4
{
  uint64_t v6 = (PKPaymentCredential *)a3;
  id v7 = a4;
  currentCredential = self->_currentCredential;
  self->_currentCredential = v6;
  uint64_t v9 = v6;

  uint64_t v10 = [(PKPaymentProvisioningController *)self _effectiveSessionIdentifier];
  uint64_t v11 = [(PKPaymentProvisioningController *)self provisioningTracker];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke;
  void v15[3] = &unk_1E56EA798;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v18 = v7;
  id v12 = v11;
  id v13 = v10;
  id v14 = v7;
  [(PKPaymentProvisioningController *)self _updateCredentialWithPaymentPass:v9 completion:v15];
}

void __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [[PKPaymentProvisioningPassData alloc] initWithSecureElementPass:v3];
    [*(id *)(a1 + 32) _addOrUpdateProvisonedPassData:v4];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v5 + 16);
    uint64_t v8 = *(void *)(v5 + 312);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_2;
    v12[3] = &unk_1E56EA770;
    void v12[4] = v5;
    id v15 = *(id *)(a1 + 56);
    id v13 = v4;
    id v14 = *(id *)(a1 + 48);
    uint64_t v9 = v4;
    [v7 ingestProvisioningPassData:v9 cloudStoreCoordinatorDelegate:v8 moreInfoURLs:0 ingestionProperties:0 sid:v6 completion:v12];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = PKDisplayableErrorForCommonType(1, 0);
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

void __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_2(uint64_t a1, void *a2, char a3, char a4)
{
  id v7 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_3;
  v9[3] = &unk_1E56EA748;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  char v14 = a3;
  char v15 = a4;
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __83__PKPaymentProvisioningController_ingestSecureElementPassForCredential_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 297) = *(unsigned char *)(a1 + 72);
  *(unsigned char *)(*(void *)(a1 + 32) + 298) = *(unsigned char *)(a1 + 73);
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_requestProvisioning:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentProvisioningController *)self provisioningTracker];
  uint64_t v26 = [(PKPaymentProvisioningController *)self _effectiveSessionIdentifier];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E56D8AE0;
  void aBlock[4] = self;
  long long v25 = _Block_copy(aBlock);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_3;
  v34[3] = &unk_1E56EA7C0;
  void v34[4] = self;
  id v9 = v7;
  id v36 = v9;
  id v10 = v8;
  id v35 = v10;
  id v11 = _Block_copy(v34);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_4;
  v30[3] = &unk_1E56EA7E8;
  void v30[4] = self;
  id v12 = v6;
  id v31 = v12;
  id v13 = v9;
  id v33 = v13;
  id v14 = v10;
  id v32 = v14;
  char v15 = _Block_copy(v30);
  id v16 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];

  if (v16)
  {
    id v17 = [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
    [v12 setReferrerIdentifier:v17];
  }
  id v18 = [(PKSecureElementProvisioningState *)self->_provisioningState useNonce];
  [v12 setNonce:v18];

  utility = self->_utility;
  externalizedAuth = self->_externalizedAuth;
  cloudStoreCoordinator = self->_cloudStoreCoordinator;
  BOOL v22 = [(PKPaymentCredential *)self->_currentCredential isAppleBalanceCredential];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_575;
  v27[3] = &unk_1E56EA810;
  id v28 = v15;
  id v29 = v11;
  id v23 = v11;
  id v24 = v15;
  [(PKProvisioningUtility *)utility requestProvisioning:v12 externalizedAuth:externalizedAuth cloudStoreCoordinatorDelegate:cloudStoreCoordinator onStartPassDownload:v25 sid:v26 requireZoneCreationSuccess:v22 completion:v27];
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E56D8AE0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setState:5 notify:1];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 344) targetDevice];
  id v3 = [v2 deviceName];

  if ([v3 isEqualToString:@"iPhone"])
  {
    uint64_t v4 = @"PROGRESS_DOWNLOADING_CARD_IPHONE";
  }
  else if ([v3 isEqualToString:@"Apple Watch"])
  {
    uint64_t v4 = @"PROGRESS_DOWNLOADING_CARD_WATCH";
  }
  else if ([v3 isEqualToString:@"iPad"])
  {
    uint64_t v4 = @"PROGRESS_DOWNLOADING_CARD_IPAD";
  }
  else
  {
    uint64_t v4 = @"PROGRESS_DOWNLOADING_CARD_GENERIC";
  }
  PKCoreLocalizedString(&v4->isa, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _setLocalizedProgressDescription:v5];
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 168);
  id v5 = [v3 provisioningResponse];
  [v4 setProvisioningResponse:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 64))
  {
    objc_msgSend(*(id *)(v6 + 40), "removeObject:");
    [*(id *)(*(void *)(a1 + 32) + 416) removeCredential:*(void *)(*(void *)(a1 + 32) + 64)];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
  }
  id v9 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = 0;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = objc_msgSend(v3, "provisionedPasses", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(a1 + 32) _addOrUpdateProvisonedPassData:*(void *)(*((void *)&v22 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [v3 moreInfoItems];
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 432);
  *(void *)(v16 + 432) = v15;

  *(unsigned char *)(*(void *)(a1 + 32) + 297) = [v3 expressModeSetupOptional];
  *(unsigned char *)(*(void *)(a1 + 32) + 298) = [v3 ampEnrollmentAvailable];
  if (*(void *)(a1 + 48))
  {
    id v18 = [v3 provisionedPasses];
    int v19 = [v18 firstObject];
    id v20 = [v19 secureElementPass];
    __int16 v21 = [v20 paymentPass];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = *(void **)(*(void *)(a1 + 32) + 168);
  id v9 = a4;
  id v10 = [a2 nonce];
  [v8 setNonce:v10];

  [*(id *)(a1 + 32) _handleProvisioningError:v7 forRequest:*(void *)(a1 + 40) pass:v9];
  uint64_t v11 = [v7 domain];
  LODWORD(v10) = [v11 isEqualToString:@"PKPaymentWebServiceErrorDomain"];

  if (v10 && [v7 code] == 40400)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Removing eligibility as next step token is invalid", v16, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 168) setEligibilityResponse:0];
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = 1;
  }
  [v13 _setState:v14 notify:1];
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, void, void, id))(v15 + 16))(v15, 0, *(void *)(a1 + 48), v7);
  }
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_575(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2_576;
  v9[3] = &unk_1E56E5A18;
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __78__PKPaymentProvisioningController__requestProvisioning_withCompletionHandler___block_invoke_2_576(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) provisionedPasses];
    id v3 = [v2 firstObject];
    id v7 = [v3 secureElementPass];

    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) provisioningResponse];
    (*(void (**)(uint64_t, void *, void, id))(v4 + 16))(v4, v5, *(void *)(a1 + 32), v7);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

- (void)_deletePaymentPass:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentDeprovisionRequest alloc] initWithPaymentPass:v4];

  [(PKPaymentWebService *)self->_webService deprovisionForRequest:v5 completion:0];
}

- (void)verifyPassIsSupportedForExpressInLocalMarket:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = [v6 paymentPass];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke;
  aBlock[3] = &unk_1E56EA838;
  objc_copyWeak(&v31, &location);
  id v8 = v7;
  id v30 = v8;
  id v9 = _Block_copy(aBlock);
  if (PKLocationServicesEnabled())
  {
    id v10 = [(PKPaymentWebService *)self->_webService context];
    id v11 = [v10 configuration];
    id v12 = [v11 marketsURL];

    if (v12)
    {
      id v13 = [(PKPaymentWebService *)self->_webService targetDevice];
      uint64_t v14 = [v13 deviceClass];
      uint64_t v15 = [v13 deviceVersion];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_581;
      v24[3] = &unk_1E56EA8D8;
      objc_copyWeak(&v28, &location);
      id v27 = v9;
      id v16 = v13;
      id v25 = v16;
      id v26 = v23;
      +[PKPaymentMarketsConfiguration paymentMarketsConfigurationWithURL:v12 forDeviceClass:v14 version:v15 completion:v24];

      objc_destroyWeak(&v28);
    }
    else
    {
      id v20 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = objc_opt_class();
        *(_DWORD *)long long buf = 138412290;
        BOOL v34 = v21;
        id v22 = v21;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "%@: No markets URL", buf, 0xCu);
      }
      (*((void (**)(void *, void, void))v9 + 2))(v9, 0, 0);
    }
  }
  else
  {
    id v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_opt_class();
      *(_DWORD *)long long buf = 138412290;
      BOOL v34 = v18;
      id v19 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "%@: Location services disabled or not authorized", buf, 0xCu);
    }
    (*((void (**)(void *, void, void))v9 + 2))(v9, 0, 0);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*((id *)WeakRetained + 22) stopUpdatingLocation];
  id v6 = *((void *)WeakRetained + 23);
  if (v6)
  {
    dispatch_source_cancel(v6);
    id v7 = (void *)*((void *)WeakRetained + 23);
    *((void *)WeakRetained + 23) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);
  }
}

void __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_581(id *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2112;
        id v20 = v6;
        id v10 = v18;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%@: Failed to get market data: %@", buf, 0x16u);
      }
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_582;
      aBlock[3] = &unk_1E56EA8B0;
      objc_copyWeak(&v16, a1 + 7);
      id v15 = a1[6];
      id v12 = a1[4];
      id v13 = a1[5];
      id v14 = v5;
      uint64_t v8 = _Block_copy(aBlock);
      [WeakRetained _startLocationSearchWithTimeout:v8 completion:10.0];

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_582(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_19;
  }
  if (!v3)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = (id)objc_opt_class();
      id v8 = v26;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%@: Unable to get location", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) upgradeRequestForPass:*(void *)(a1 + 40)];
    uint64_t v6 = [v5 paymentApplicationIdentifiers];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v5 = [*(id *)(a1 + 40) devicePrimaryPaymentApplication];
    uint64_t v6 = objc_msgSend(v9, "initWithObjects:", v5, 0);
  }
  id v10 = (void *)v6;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_585;
  v22[3] = &unk_1E56EA860;
  id v11 = *(void **)(a1 + 48);
  id v23 = *(id *)(a1 + 40);
  id v12 = v10;
  id v24 = v12;
  id v13 = [v11 marketsForLocation:v3 passingTest:v22];
  if ([v13 count])
  {
    id v14 = +[PKPaymentMarketsConfiguration closestMarketFromSet:v13 forLocation:v3];
    if (v14)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_587;
      v20[3] = &unk_1E56EA888;
      id v21 = *(id *)(a1 + 56);
      [WeakRetained _loadMoreInfoItemForMarket:v14 eligibleMarkets:v13 completionHandler:v20];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      id v17 = *(void **)(a1 + 40);
      id v18 = v16;
      __int16 v19 = [v17 uniqueID];
      *(_DWORD *)long long buf = 138412546;
      id v26 = v16;
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "%@: no express capable credential type found for the current location on pass: %@.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

LABEL_19:
}

uint64_t __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_585(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 expressCredentialTypes];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "devicePaymentApplications", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      id v10 = *(void **)(a1 + 40);
      id v11 = [v9 applicationIdentifier];
      if ([v10 containsObject:v11]) {
        break;
      }
      char v12 = [v9 supportsExpress];

      if (v12) {
        goto LABEL_9;
      }
LABEL_10:
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

LABEL_9:
    id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "paymentNetworkIdentifier"));
    char v14 = [v3 containsObject:v13];

    if (v14)
    {
      uint64_t v15 = 1;
      goto LABEL_14;
    }
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v15 = 0;
LABEL_14:

  return v15;
}

uint64_t __91__PKPaymentProvisioningController_verifyPassIsSupportedForExpressInLocalMarket_completion___block_invoke_587(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provisionHomeKeyCredential:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v7;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Provisioning HomeKey credential %@", buf, 0xCu);
  }

  if (self->_state == 4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke;
    aBlock[3] = &unk_1E56D8388;
    id v23 = v8;
    id v10 = _Block_copy(aBlock);
    objc_storeStrong((id *)&self->_currentCredential, a3);
    id v11 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (objc_opt_respondsToSelector())
    {
      char v12 = [v7 serialNumber];
      id v24 = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_3;
      v18[3] = &unk_1E56EA900;
      void v18[4] = self;
      id v19 = v7;
      id v20 = v11;
      id v21 = v10;
      [v20 provisionHomeKeyPassForSerialNumbers:v13 completionHandler:v18];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Target device does not response to provisionHomeKeyPassForSerialNumbers:completionHandler:", buf, 2u);
      }

      long long v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
      (*((void (**)(void *, void *))v10 + 2))(v10, v17);
    }
    id v16 = v23;
    goto LABEL_12;
  }
  if (v8)
  {
    char v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    id v26 = @"Error: provisioning controller in incorrect state:";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v16 = [v14 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v15];

    (*((void (**)(id, void *))v8 + 2))(v8, v16);
LABEL_12:
  }
}

void __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __80__PKPaymentProvisioningController_provisionHomeKeyCredential_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v31 = [v5 count];
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Provisioning HomeKey credential returned provisionedPasses: %lu error: %@", buf, 0x16u);
  }

  if (!v6)
  {
    [*(id *)(a1 + 32) _setState:5 notify:1];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 416) removeCredential:*(void *)(a1 + 40)];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v8);
          }
          if (!v11) {
            id v11 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          }
          char v14 = [PKPaymentProvisioningPassData alloc];
          uint64_t v15 = -[PKPaymentProvisioningPassData initWithSecureElementPass:](v14, "initWithSecureElementPass:", v11, (void)v24);
          [*(id *)(a1 + 32) _addOrUpdateProvisonedPassData:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);

      if (v11)
      {
        id v16 = [*(id *)(a1 + 48) deviceName];
        char v17 = [v16 isEqualToString:@"Apple Watch"];

        long long v18 = [v11 localizedDescription];
        id v19 = PKPaymentSetupMoreInfoItemDictionaryForHomeExpress(v18, v17);

        id v20 = [[PKPaymentSetupMoreInfoItem alloc] initWithMoreInfoDictionary:v19];
        id v28 = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        uint64_t v22 = *(void *)(a1 + 32);
        id v23 = *(void **)(v22 + 432);
        *(void *)(v22 + 432) = v21;

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v11 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_190E10000, v11, OS_LOG_TYPE_ERROR, "Provisioned HomeKey with no error, but no provisioned pass not found!", buf, 2u);
    }
    goto LABEL_18;
  }
LABEL_19:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_startLocationSearchWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke;
  v10[3] = &unk_1E56D8A40;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  double v13 = a3;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = v2[23];
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 184);
    *(void *)(v4 + 184) = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v6 = (const void *)v2[24];
  if (v6)
  {
    id v7 = (void (**)(void *, void))_Block_copy(v6);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 192);
    *(void *)(v8 + 192) = 0;

    v7[2](v7, 0);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v10 = (void *)v2[22];
  if (!v10)
  {
    if (!v2[25])
    {
      id v11 = (void *)MEMORY[0x1E4F1E5E8];
      id v12 = PKPassKitCoreBundle();
      uint64_t v13 = [v11 newAssertionForBundle:v12 withReason:@"Passbook is displaying provisioning flow"];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(v14 + 200);
      *(void *)(v14 + 200) = v13;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F1E600]);
    char v17 = PKPassKitCoreBundle();
    long long v18 = [v17 bundlePath];
    uint64_t v19 = [v16 initWithEffectiveBundlePath:v18 delegate:*(void *)(a1 + 32) onQueue:*(void *)(a1 + 40)];
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(v20 + 176);
    *(void *)(v20 + 176) = v19;

    [*(id *)(*(void *)(a1 + 32) + 176) setDesiredAccuracy:*MEMORY[0x1E4F1E748]];
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 176);
  }
  uint64_t v22 = [v10 location];
  id v23 = v22;
  if (!v22) {
    id v23 = *(void **)(*(void *)(a1 + 32) + 504);
  }
  id v24 = v23;

  if ([*(id *)(a1 + 32) _isValidLocation:v24])
  {
    long long v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v47 = (id)objc_opt_class();
      __int16 v48 = 2112;
      id v49 = v24;
      id v26 = v47;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "%@: current location:%@ is valid will use it.", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (*(double *)(a1 + 56) > 0.0)
    {
      long long v27 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = objc_opt_class();
        uint64_t v29 = *(void **)(a1 + 56);
        *(_DWORD *)long long buf = 138412546;
        id v47 = v28;
        __int16 v48 = 2048;
        id v49 = v29;
        id v30 = v28;
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "%@: Start Location search with time out:%fsec", buf, 0x16u);
      }
      dispatch_source_t v31 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 40));
      uint64_t v32 = *(void *)(a1 + 32);
      id v33 = *(void **)(v32 + 184);
      *(void *)(v32 + 184) = v31;

      uint64_t v34 = *(NSObject **)(*(void *)(a1 + 32) + 184);
      dispatch_time_t v35 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      dispatch_source_set_timer(v34, v35, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      id v36 = *(NSObject **)(*(void *)(a1 + 32) + 184);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_601;
      handler[3] = &unk_1E56DD818;
      objc_copyWeak(&v45, (id *)buf);
      dispatch_source_set_event_handler(v36, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 184));
      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v37 = a1 + 32;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_602;
    aBlock[3] = &unk_1E56EA928;
    objc_copyWeak(&v43, (id *)buf);
    id v42 = *(id *)(a1 + 48);
    char v38 = _Block_copy(aBlock);
    uint64_t v39 = _Block_copy(v38);
    uint64_t v40 = *(void **)(*(void *)v37 + 192);
    *(void *)(*(void *)v37 + 192) = v39;

    [*(id *)(*(void *)v37 + 176) startUpdatingLocation];
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_601(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v3 = v8;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "%@: Location search timed out", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v4 = (const void *)WeakRetained[24];
    if (v4)
    {
      id v5 = (void (**)(void *, void))_Block_copy(v4);
      id v6 = (void *)WeakRetained[24];
      WeakRetained[24] = 0;

      v5[2](v5, 0);
    }
  }
}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_602(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_2;
  block[3] = &unk_1E56E2C70;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __78__PKPaymentProvisioningController__startLocationSearchWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    [WeakRetained[22] stopUpdatingLocation];
    id v4 = v9[22];
    v9[22] = 0;

    id v5 = v9[25];
    v9[25] = 0;

    id v3 = v9;
    id v6 = v9[23];
    if (v6)
    {
      dispatch_source_cancel(v6);
      id v7 = v9[23];
      v9[23] = 0;

      id v3 = v9;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(a1 + 32));
      id v3 = v9;
    }
  }
}

- (BOOL)_isValidLocation:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 horizontalAccuracy];
  if (v5 >= *MEMORY[0x1E4F1E748])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v6 = [v3 timestamp];
    [v4 timeIntervalSinceDate:v6];
    BOOL v8 = v7 < 300.0;
  }
  return v8;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v23 = (id)objc_opt_class();
    __int16 v24 = 2112;
    id v25 = v7;
    id v9 = v23;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@: received locations:%@", buf, 0x16u);
  }
  if (self->_locationCompletion)
  {
    objc_initWeak((id *)buf, self);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if ([(PKPaymentProvisioningController *)self _isValidLocation:v14])
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __70__PKPaymentProvisioningController_locationManager_didUpdateLocations___block_invoke;
            void v15[3] = &unk_1E56D9150;
            objc_copyWeak(&v16, (id *)buf);
            void v15[4] = v14;
            dispatch_async(MEMORY[0x1E4F14428], v15);
            objc_destroyWeak(&v16);
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_destroyWeak((id *)buf);
  }
}

void __70__PKPaymentProvisioningController_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[24];
    if (v4)
    {
      id v6 = v3;
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
      double v5 = (void *)v6[24];
      v6[24] = 0;

      id v3 = v6;
    }
  }
}

- (id)_eligibleMarketNames:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "analyticsReportingNameValue", (void)v13);
        if ([v10 length]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 componentsJoinedByString:@", "];

  return v11;
}

- (void)_loadMoreInfoItemForMarket:(id)a3 eligibleMarkets:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 notificationAssetIdentifier];
  id v10 = +[PKMobileAssetManager sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __96__PKPaymentProvisioningController__loadMoreInfoItemForMarket_eligibleMarkets_completionHandler___block_invoke;
  v13[3] = &unk_1E56EA950;
  id v14 = v7;
  id v15 = v8;
  void v13[4] = self;
  id v11 = v7;
  id v12 = v8;
  [v10 fetchMarketNotificationAssetsForIdentifier:v9 isDiscretionary:0 completionHandler:v13];
}

void __96__PKPaymentProvisioningController__loadMoreInfoItemForMarket_eligibleMarkets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 344);
  id v4 = a2;
  id v5 = [v3 targetDevice];
  uint64_t v6 = [v5 deviceName];
  int v7 = [v6 isEqualToString:@"Apple Watch"];

  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [PKPaymentSetupMoreInfoItem alloc];
  PKPaymentSetupMoreInfoItemDictionaryForExpressUpgradeMarket(v4, v7, [*(id *)(a1 + 40) expressUpgradeHideDisableAction] == 1, 0, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [(PKPaymentSetupMoreInfoItem *)v9 initWithMoreInfoDictionary:v11];
  (*(void (**)(uint64_t, PKPaymentSetupMoreInfoItem *))(v8 + 16))(v8, v10);
}

- (void)removeProvisionedPasses
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_provisionedPasses;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v14 + 1) + 8 * v7) secureElementPass];
        id v9 = [v8 paymentPass];

        if (v9)
        {
          id v10 = [(PKPaymentWebService *)self->_webService targetDevice];
          webService = self->_webService;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          id v12[2] = __58__PKPaymentProvisioningController_removeProvisionedPasses__block_invoke;
          v12[3] = &unk_1E56DD150;
          id v13 = v9;
          [v10 paymentWebService:webService removePass:v13 withCompletionHandler:v12];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [(NSMutableOrderedSet *)self->_provisionedPasses removeAllObjects];
}

void __58__PKPaymentProvisioningController_removeProvisionedPasses__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error removing provisioned pass. pass=%@, error=%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_passAlreadyProvisioned
{
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController _passAlreadyProvisioned. Calling download all payment passes.", v5, 2u);
  }

  uint64_t v4 = [(PKPaymentWebService *)self->_webService targetDevice];
  [v4 downloadAllPaymentPassesForPaymentWebService:self->_webService];
}

- (void)_handleProvisioningError:(id)a3 forRequest:(id)a4 pass:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 eligibilityResponse];
  __int16 v10 = [v9 applicationIdentifier];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v7 applicationIdentifier];
  }
  id v13 = v12;

  long long v14 = [v7 subCredentialIdentifier];
  long long v15 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKPaymentProvisioningController handling provisioning error for aid: %@ subcredentialId: %@", (uint8_t *)&v18, 0x16u);
  }

  long long v16 = [(PKPaymentWebService *)self->_webService targetDevice];
  long long v17 = v16;
  if (v14)
  {
    if (objc_opt_respondsToSelector()) {
      [v17 deleteKeyMaterialForSubCredentialId:v14];
    }
  }
  else if (v13)
  {
    [v16 paymentWebService:self->_webService deleteApplicationWithAID:v13];
  }
  if (v8) {
    [(PKPaymentProvisioningController *)self _deletePaymentPass:v8];
  }
}

- (void)_setLocalizedProgressDescription:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  localizedProgressDescription = self->_localizedProgressDescription;
  self->_localizedProgressDescription = v4;
  uint64_t v6 = v4;

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v7 postNotificationName:@"PKPaymentProvisioningControllerLocalizedProgressDescriptionDidChangeNotification" object:self];
}

- (BOOL)provisioningUserInterfaceIsVisible
{
  return self->_provisioningUserInterfaceIsVisible;
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  if (!self->_provisioningUserInterfaceIsVisible)
  {
    self->_provisioningUserInterfaceIsVisible = 1;
    id v2 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v2 noteProvisioningUserInterfaceDidAppear];
  }
}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  if (self->_provisioningUserInterfaceIsVisible)
  {
    self->_provisioningUserInterfaceIsVisible = 0;
    id v3 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v3 noteProvisioningUserInterfaceDidDisappear];

    [(PKPaymentProvisioningController *)self _endRequiringUpgradedPasscodeIfNecessary];
  }
}

- (BOOL)_isProvisioningPaymentAccount
{
  if ([(PKPaymentCredential *)self->_currentCredential credentialType] == 123) {
    return 1;
  }
  currentAddPaymentPassRequestConfiguration = self->_currentAddPaymentPassRequestConfiguration;
  return [(PKAddPaymentPassRequestConfiguration *)currentAddPaymentPassRequestConfiguration isPaymentAccount];
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    [(NSHashTable *)self->_delegates addObject:v5];

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (void)removeDelegate:(id)a3
{
  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    [(NSHashTable *)self->_delegates removeObject:v5];

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (id)associatedCredentialsForDefaultBehaviour
{
  associatedCredentials = self->_associatedCredentials;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKPaymentProvisioningController_associatedCredentialsForDefaultBehaviour__block_invoke;
  v5[3] = &unk_1E56DC118;
  v5[4] = self;
  id v3 = [(NSMutableArray *)associatedCredentials pk_objectsPassingTest:v5];
  return v3;
}

uint64_t __75__PKPaymentProvisioningController_associatedCredentialsForDefaultBehaviour__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isLocalPassCredential] & 1) != 0
    || ([v3 isPeerPaymentCredential] & 1) != 0
    || ([v3 isAccountCredential] & 1) != 0
    || ([v3 isShareableCredential] & 1) != 0
    || ([v3 isLocalAppletSubcredentialPassCredential] & 1) != 0)
  {
    uint64_t v4 = 1;
    goto LABEL_7;
  }
  if (![v3 isRemoteCredential])
  {
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [v3 remoteCredential];
  uint64_t v7 = [v6 cardType];
  if (v7 == 2)
  {
    LOBYTE(v9) = 1;
LABEL_15:
    BOOL v10 = 1;
    goto LABEL_16;
  }
  if (v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [v6 credentialType];
  unsigned int v9 = ((unint64_t)(v8 - 103) < 7) & (0x61u >> (v8 - 103));
  BOOL v10 = (unint64_t)(v8 - 129) < 0xFFFFFFFFFFFFFFFELL;
LABEL_16:
  id v11 = *(void **)(*(void *)(a1 + 32) + 424);
  id v12 = [v6 productIdentifier];
  id v13 = [v11 productForProductIdentifier:v12];

  long long v14 = [v13 configuration];
  uint64_t v15 = [v14 type];

  uint64_t v16 = [v6 status];
  unsigned int v17 = v15 != 9 && v10;
  if (v16 == 2) {
    unsigned int v17 = 1;
  }
  if (v9) {
    uint64_t v4 = v16 == 2;
  }
  else {
    uint64_t v4 = v17;
  }

LABEL_7:
  return v4;
}

- (NSArray)allCredentials
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PKPaymentProvisioningController *)self associatedCredentials];
  id v5 = (void *)v4;
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [(PKPaymentProvisioningController *)self purchaseCredentials];
  unsigned int v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  [v3 addObjectsFromArray:v10];

  return (NSArray *)v3;
}

- (id)associatedCredentialsForProductIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentProvisioningController *)self allCredentials];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PKPaymentProvisioningController_associatedCredentialsForProductIdentifier___block_invoke;
  v9[3] = &unk_1E56DC118;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "pk_objectsPassingTest:", v9);

  return v7;
}

uint64_t __77__PKPaymentProvisioningController_associatedCredentialsForProductIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 setupProductIdentifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isPasscodeUpgradeRequired
{
  id v3 = [(PKSecureElementProvisioningState *)self->_provisioningState eligibilityResponse];
  uint64_t v4 = [v3 region];

  if (PKEnforceUpgradedPasscodePolicyForAllRegions())
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    BOOL v5 = [(PKPaymentWebService *)self->_webService isChinaRegionIdentifier:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)preflightPasscodeUpgradeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56EA978;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v11 = v5;
  id v6 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  uint64_t v7 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v9 notePasscodeUpgradeFlowWillBeginWithCompletion:v6];
  }
  else
  {
    v6[2](v6, 1, 0);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      char v8 = [WeakRetained[43] targetDevice];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = [v7[43] targetDevice];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke_2;
        void v15[3] = &unk_1E56EA978;
        objc_copyWeak(&v17, (id *)(a1 + 40));
        id v16 = *(id *)(a1 + 32);
        [v10 enforceUpgradedPasscodePolicyWithCompletion:v15];

        objc_destroyWeak(&v17);
      }
      else if (*(void *)(a1 + 32))
      {
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F28228];
        v19[0] = @"Error: target device does not support enforceUpgradedPasscodePolicyWithCompletion:";
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
        long long v14 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v13];

        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v5);
      }
    }
  }
}

void __74__PKPaymentProvisioningController_preflightPasscodeUpgradeWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v7) {
      [WeakRetained _startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:a2];
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, BOOL, uint64_t))(v6 + 16))(v6, v7 == 0, a2);
    }
  }
}

- (void)passcodeUpgradeCompleted:(BOOL)a3
{
  if (self->_state == 2)
  {
    if (a3)
    {
      self->_unint64_t state = 3;
      goto LABEL_8;
    }
    self->_unint64_t state = 1;
    goto LABEL_7;
  }
  if (!a3) {
LABEL_7:
  }
    [(PKPaymentProvisioningController *)self _endRequiringUpgradedPasscodeIfNecessary];
LABEL_8:
  id v4 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v6 notePasscodeUpgradeFlowDidEnd];
  }
}

- (void)_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v7 startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:v3];
  }
}

- (void)_endRequiringUpgradedPasscodeIfNecessary
{
  BOOL v3 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v5 endRequiringUpgradedPasscodeIfNecessary];
  }
}

- (int64_t)availableSecureElementPassSpaces
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v4 = [v3 paymentWebService:self->_webService passesOfType:1];
    uint64_t v5 = objc_msgSend(v4, "pk_countObjectsPassingTest:", &__block_literal_global_626);
  }
  else
  {
    char v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v7);
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Target device did not respond to passesOfType. Assuming it has no passes", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v5 = 0;
    if (!v3)
    {
LABEL_13:
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v15 = 138412290;
        id v16 = v13;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Target device did not respond to max payment cards. Assuming local maximum.", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v9 = PKMaxPaymentCards();
      if (!v9) {
        goto LABEL_9;
      }
LABEL_16:
      int64_t v11 = v9 - v5;
      goto LABEL_17;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v6 = PKLogFacilityTypeGetObject(6uLL);
    goto LABEL_13;
  }
  uint64_t v9 = [v3 maximumPaymentCards];
  if (v9) {
    goto LABEL_16;
  }
LABEL_9:
  id v10 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error: Unknown maximum SE cards returned. Returning Not Found.", (uint8_t *)&v15, 2u);
  }

  int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:

  return v11;
}

BOOL __67__PKPaymentProvisioningController_availableSecureElementPassSpaces__block_invoke(uint64_t a1, void *a2)
{
  return [a2 passActivationState] != 4;
}

+ (id)watchWebServiceForIssuerProvisioning
{
  if (PKIsPairedWithWatch()
    && (id v2 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]()),
        int v3 = [v2 isIssuerAppProvisioningSupported],
        v2,
        v3))
  {
    id v4 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]());
    uint64_t v5 = [v4 watchPaymentWebService];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)cleanupTransferredCredentialFromSourceDevice:(id)a3 completion:(id)a4
{
  id v5 = a4;
  char v6 = [a3 localPassCredential];
  id v7 = [v6 paymentPass];
  char v8 = [v7 uniqueID];
  uint64_t v9 = (void *)[v8 copy];

  if ([v7 isRemotePass])
  {
    id v10 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]());
    int64_t v11 = [v10 watchPaymentWebService];
    id v12 = [v11 targetDevice];
  }
  else
  {
    int64_t v11 = +[PKPaymentWebService sharedService];
    id v12 = [v11 targetDevice];
  }
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke;
    void v15[3] = &unk_1E56D84A0;
    id v16 = v9;
    id v17 = v5;
    [v12 paymentWebService:v11 removePass:v7 withCompletionHandler:v15];
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_error_impl(&dword_190E10000, v13, OS_LOG_TYPE_ERROR, "Error: Target device does not support pass deletion", v14, 2u);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

void __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke_2;
  v7[3] = &unk_1E56D8BD0;
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __91__PKPaymentProvisioningController_cleanupTransferredCredentialFromSourceDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32))
  {
    id v2 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 40);
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Deleted pass: %@ from source device", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    id v2 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [*(id *)(a1 + 32) description];
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Failed to delete pass from source device with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)triggerWatchProvisioningForAppleBalanceCredential:(id)a3
{
  if ([a3 isAppleBalanceCredential] && PKIsPairedWithWatch())
  {
    id v3 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_2[0]());
    [v3 provisionPassForRemoteCredentialWithType:135 andIdentifier:0 completion:&__block_literal_global_632];
  }
}

void __85__PKPaymentProvisioningController_triggerWatchProvisioningForAppleBalanceCredential___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"failed";
    if (a2) {
      int v6 = @"succeeded";
    }
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = a3;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning Apple Balance pass to Watch %@ with error %@", (uint8_t *)&v7, 0x16u);
  }
}

- (PKPaymentRequirementsResponse)requirementsResponse
{
  return [(PKSecureElementProvisioningState *)self->_provisioningState requirementsResponse];
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return [(PKSecureElementProvisioningState *)self->_provisioningState eligibilityResponse];
}

- (PKPaymentProvisioningResponse)provisioningResponse
{
  return [(PKSecureElementProvisioningState *)self->_provisioningState provisioningResponse];
}

- (NSString)productIdentifier
{
  return [(PKSecureElementProvisioningState *)self->_provisioningState productIdentifier];
}

- (NSString)referrerIdentifier
{
  return [(PKSecureElementProvisioningState *)self->_provisioningState referrerIdentifier];
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (void)updateStateAfterProvisioning:(id)a3 credential:(id)a4 passes:(id)a5 moreInfoItems:(id)a6
{
  id v25 = a4;
  id v10 = a6;
  provisioningState = self->_provisioningState;
  id v12 = a5;
  id v13 = a3;
  long long v14 = [v13 requirementsResponse];
  [(PKSecureElementProvisioningState *)provisioningState setRequirementsResponse:v14];

  int v15 = self->_provisioningState;
  id v16 = [v13 eligibilityResponse];
  [(PKSecureElementProvisioningState *)v15 setEligibilityResponse:v16];

  id v17 = self->_provisioningState;
  uint64_t v18 = [v13 provisioningResponse];
  [(PKSecureElementProvisioningState *)v17 setProvisioningResponse:v18];

  uint64_t v19 = self->_provisioningState;
  __int16 v20 = [v13 productIdentifier];
  [(PKSecureElementProvisioningState *)v19 setProductIdentifier:v20];

  uint64_t v21 = self->_provisioningState;
  uint64_t v22 = [v13 referrerIdentifier];

  [(PKSecureElementProvisioningState *)v21 setReferrerIdentifier:v22];
  id v23 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v12];

  provisionedPasses = self->_provisionedPasses;
  self->_provisionedPasses = v23;

  objc_storeStrong((id *)&self->_moreInfoItems, a6);
  if (v25) {
    [(NSMutableArray *)self->_associatedCredentials removeObject:v25];
  }
}

- (id)_effectiveSessionIdentifier
{
  id v3 = [(PKPaymentCredential *)self->_currentCredential state];
  id v4 = [v3 sid];
  id v5 = v4;
  if (v4)
  {
    int v6 = v4;
  }
  else
  {
    uint64_t v7 = [(PKSecureElementProvisioningState *)self->_provisioningState sid];
    uint64_t v8 = (void *)v7;
    __int16 v9 = &stru_1EE0F5368;
    if (v7) {
      __int16 v9 = (__CFString *)v7;
    }
    int v6 = v9;
  }
  return v6;
}

- (void)finishOptionalExpressModeSetupForPass:(id)a3 withProvisioningTracker:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (PKTargetDeviceSupportsExpress(v11))
  {
    objc_initWeak((id *)location, self);
    webService = self->_webService;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke;
    v14[3] = &unk_1E56EA9C0;
    objc_copyWeak(&v18, (id *)location);
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    [v11 paymentWebService:webService handlePotentialExpressPass:v15 withCompletionHandler:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315394;
      *(void *)&id location[4] = "-[PKPaymentProvisioningController finishOptionalExpressModeSetupForPass:withProvisioning"
                                "Tracker:completion:]";
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "%s called for target device (%@) which does not support express. File a radar!", location, 0x16u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_2;
    block[3] = &unk_1E56D8C20;
    id v5 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v7 = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_3;
  v6[3] = &unk_1E56D83D8;
  id v8 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  [v2 handleOptionalExpressModeSetupDidFinishForPass:v3 withExpressModes:v4 provisioningTracker:v5 completion:v6];
}

uint64_t __108__PKPaymentProvisioningController_finishOptionalExpressModeSetupForPass_withProvisioningTracker_completion___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    BOOL v2 = [*(id *)(result + 32) count] != 0;
    uint64_t v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);
    return v3(v1, v2);
  }
  return result;
}

- (void)handleOptionalExpressModeSetupDidFinishForPass:(id)a3 withExpressModes:(id)a4 provisioningTracker:(id)a5 completion:(id)a6
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [a3 serialNumber];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = &stru_1EE0F5368;
  }
  long long v14 = v13;

  if (v9)
  {
    id v15 = [v9 allObjects];
    uint64_t v16 = [v15 componentsJoinedByString:@","];
    id v17 = (void *)v16;
    if (v16) {
      id v18 = (__CFString *)v16;
    }
    else {
      id v18 = &stru_1EE0F5368;
    }
    uint64_t v19 = v18;

    v31[0] = @"automaticExpressModes";
    v31[1] = @"passSerialNumber";
    v32[0] = v19;
    v32[1] = v14;
    __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  }
  else
  {
    uint64_t v29 = @"passSerialNumber";
    id v30 = v14;
    __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  }
  self->_expressModeSetupOptional = 0;
  utility = self->_utility;
  provisioningState = self->_provisioningState;
  id v23 = self;
  __int16 v24 = [(PKSecureElementProvisioningState *)provisioningState provisioningResponse];
  id v25 = [v24 moreInfoURLs];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke;
  v27[3] = &unk_1E56D8810;
  void v27[4] = v23;
  id v28 = v10;
  id v26 = v10;
  [(PKProvisioningUtility *)utility downloadMoreInfoItemsFrom:v25 metadata:v20 sid:&stru_1EE0F5368 completion:v27];
}

void __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke_2;
  block[3] = &unk_1E56D89F0;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __130__PKPaymentProvisioningController_handleOptionalExpressModeSetupDidFinishForPass_withExpressModes_provisioningTracker_completion___block_invoke_2(uint64_t a1)
{
  id v5 = *(id *)(a1 + 32);
  if (v5)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    id v3 = (void *)v5[54];
    v5[54] = v2;

    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
}

- (id)provisioningTracker
{
  uint64_t v2 = [[PKPaymentProvisioningTracker alloc] initWithPaymentProvisioningController:self];
  return v2;
}

- (BOOL)hasPaymentPass
{
  id v3 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaymentWebService *)self->_webService targetDevice];
    int v6 = [v5 paymentWebService:self->_webService passesOfType:1];
  }
  else
  {
    int v6 = 0;
  }
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (BOOL)hasPayLaterPass
{
  if (self->_queriedHasPayLaterPass) {
    return self->_hasPayLaterPass;
  }
  char v4 = [(PKPaymentProvisioningController *)self _accountsForFeatureIdentifier:3];
  id v5 = [v4 firstObject];

  int v6 = [v5 associatedPassUniqueID];
  if (v6)
  {
    BOOL v7 = [(PKPaymentWebService *)self->_webService targetDevice];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(PKPaymentWebService *)self->_webService targetDevice];
      id v10 = [v9 paymentWebService:self->_webService passWithUniqueID:v6];
      uint64_t v11 = [v10 paymentPass];

      BOOL v3 = v11 != 0;
      self->_queriedHasPayLaterPass = 1;
    }
    else
    {
      BOOL v3 = 0;
    }
    self->_hasPayLaterPass = v3;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)hasCreditPaymentPass
{
  uint64_t v2 = [(PKPaymentProvisioningController *)self _paymentPassWithPaymentMethodType:2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasDebitPaymentPass
{
  uint64_t v2 = [(PKPaymentProvisioningController *)self _paymentPassWithPaymentMethodType:1];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_paymentPassWithPaymentMethodType:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKPaymentWebService *)self->_webService targetDevice];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(PKPaymentWebService *)self->_webService targetDevice];
    char v8 = [v7 paymentWebService:self->_webService passesOfType:1];
  }
  else
  {
    char v8 = 0;
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "paymentPass", (void)v22);
        id v17 = [v16 devicePrimaryPaymentApplication];
        uint64_t v18 = [v17 paymentType];

        if (v18 == a3)
        {
          uint64_t v19 = [v15 paymentPass];
          [v9 addObject:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  __int16 v20 = (void *)[v9 copy];
  return v20;
}

- (id)_displayableErrorOverrideForUnderlyingError:(id)a3
{
  id v3 = a3;
  char v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v5)
  {
    char v6 = PKDisplayableErrorForCommonType(2, v3);
    goto LABEL_15;
  }
  BOOL v7 = [v3 domain];
  int v8 = [v7 isEqualToString:@"PKWebServiceErrorDomain"];

  if (!v8)
  {
    uint64_t v11 = [v3 domain];
    int v12 = [v11 isEqualToString:@"PKPaymentWebServiceErrorDomain"];

    if (v12)
    {
      uint64_t v13 = [v3 localizedFailureReason];

      if (v13) {
        goto LABEL_10;
      }
      if (![v3 code])
      {
LABEL_13:
        long long v14 = PKCoreLocalizedString(&cfstr_CouldNotAddCar.isa, 0);
        id v15 = PKCoreLocalizedString(&cfstr_CouldNotAddCar_0.isa, 0);
        goto LABEL_14;
      }
    }
LABEL_12:
    char v6 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = [v3 code];
  if ((unint64_t)(v9 - 2) >= 4 && v9) {
    goto LABEL_12;
  }
  id v10 = [v3 localizedFailureReason];

  if (!v10) {
    goto LABEL_13;
  }
LABEL_10:
  long long v14 = [v3 localizedFailureReason];
  id v15 = [v3 localizedRecoverySuggestion];
LABEL_14:
  uint64_t v16 = v15;
  char v6 = PKDisplayableErrorCustomWithType(-1, v14, v15, v3, 0);

LABEL_15:
  return v6;
}

- (id)displayableErrorForError:(id)a3
{
  id v4 = a3;
  int v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PKDisplayableError"];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    int v8 = [(PKPaymentProvisioningController *)self _displayableErrorOverrideForUnderlyingError:v4];
    if (v8) {
      goto LABEL_6;
    }
    PKDisplayableErrorForCommonType(0, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v8 = v7;
LABEL_6:

  return v8;
}

- (id)displayableErrorForProvisioningError:(id)a3
{
  id v4 = a3;
  int v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"PKDisplayableError"];

  if (v6)
  {
    id v7 = v4;
LABEL_10:
    id v10 = v7;
    goto LABEL_11;
  }
  if (v4)
  {
    int v8 = [v4 domain];
    if ([v8 isEqualToString:@"PKWebServiceErrorDomain"])
    {
      uint64_t v9 = [v4 code];

      if (v9 == 1)
      {
        id v10 = 0;
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  id v10 = [(PKPaymentProvisioningController *)self _displayableErrorOverrideForUnderlyingError:v4];
  if (!v10)
  {
    PKDisplayableErrorForCommonType(1, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PKPaymentProvisioningController_accountAdded___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __48__PKPaymentProvisioningController_accountAdded___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) accountIdentifier];
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Updating setup products because account added: %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) _reloadSetupProducts];
}

- (void)_reloadSetupProducts
{
  supportedFeatureIdentifierStrings = self->_supportedFeatureIdentifierStrings;
  self->_supportedFeatureIdentifierStrings = 0;

  supportedFeatureIdentifierStringsForAccountProvisioning = self->_supportedFeatureIdentifierStringsForAccountProvisioning;
  self->_supportedFeatureIdentifierStringsForAccountProvisioning = 0;

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PKPaymentProvisioningController__reloadSetupProducts__block_invoke;
  v5[3] = &unk_1E56DD150;
  v5[4] = self;
  [(PKPaymentProvisioningController *)self updatePaymentSetupProductModelWithCompletionHandler:v5];
}

uint64_t __55__PKPaymentProvisioningController__reloadSetupProducts__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _informDelegatesOfAccountsUpdated];
  }
  return result;
}

- (void)featureApplicationAdded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 applicationState];
  if ((unint64_t)(v5 - 4) < 5 || v5 == 16)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = __59__PKPaymentProvisioningController_featureApplicationAdded___block_invoke;
    v7[3] = &unk_1E56D8A90;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __59__PKPaymentProvisioningController_featureApplicationAdded___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 424) setupProductsOfType:7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v29;
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      uint64_t v22 = v3;
      do
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        uint64_t v7 = [v6 configuration];
        uint64_t v8 = [v7 featureIdentifier];
        uint64_t v9 = [*(id *)(a1 + 40) feature];

        if (v8 == v9)
        {
          id v10 = [v6 featureApplications];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) applicationIdentifier];
                id v17 = [*(id *)(a1 + 40) applicationIdentifier];
                char v18 = [v16 isEqualToString:v17];

                if (v18)
                {
                  uint64_t v19 = v11;
                  goto LABEL_17;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v19 = (void *)[v11 mutableCopy];
          [v19 addObject:*(void *)(a1 + 40)];
          __int16 v20 = (void *)[v19 copy];
          [v6 setFeatureApplications:v20];

LABEL_17:
          uint64_t v4 = v21;
          uint64_t v3 = v22;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v3);
  }
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PKPaymentProvisioningController_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E56D8A90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __61__PKPaymentProvisioningController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 424) setupProductsOfType:7];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v31;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v5 = 0;
      uint64_t v22 = v3;
      do
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v30 + 1) + 8 * v5);
        id v7 = [v6 configuration];
        uint64_t v8 = [v7 featureIdentifier];
        uint64_t v9 = [*(id *)(a1 + 40) feature];

        if (v8 == v9)
        {
          uint64_t v25 = v5;
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v24 = v6;
          id v11 = [v6 featureApplications];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                id v17 = [v16 applicationIdentifier];
                char v18 = [*(id *)(a1 + 40) applicationIdentifier];
                char v19 = [v17 isEqualToString:v18];

                if ((v19 & 1) == 0) {
                  [v10 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }

          __int16 v20 = (void *)[v10 copy];
          [v24 setFeatureApplications:v20];

          uint64_t v4 = v21;
          uint64_t v3 = v22;
          uint64_t v5 = v25;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v3);
  }
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 applicationState];
  if ((unint64_t)(v5 - 4) < 5 || v5 == 16)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = __61__PKPaymentProvisioningController_featureApplicationChanged___block_invoke;
    v7[3] = &unk_1E56D8A90;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  else
  {
    [(PKPaymentProvisioningController *)self featureApplicationRemoved:v4];
  }
}

void __61__PKPaymentProvisioningController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 424) setupProductsOfType:7];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v31;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v5 = 0;
      uint64_t v22 = v3;
      do
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v30 + 1) + 8 * v5);
        id v7 = [v6 configuration];
        uint64_t v8 = [v7 featureIdentifier];
        uint64_t v9 = [*(id *)(a1 + 40) feature];

        if (v8 == v9)
        {
          uint64_t v25 = v5;
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v24 = v6;
          id v11 = [v6 featureApplications];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                id v17 = [v16 applicationIdentifier];
                char v18 = [*(id *)(a1 + 40) applicationIdentifier];
                int v19 = [v17 isEqualToString:v18];

                if (v19) {
                  uint64_t v16 = *(void **)(a1 + 40);
                }
                [v10 addObject:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }

          __int16 v20 = (void *)[v10 copy];
          [v24 setFeatureApplications:v20];

          uint64_t v4 = v21;
          uint64_t v3 = v22;
          uint64_t v5 = v25;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v3);
  }
}

- (void)didReceivePendingProvisioningUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentProvisioningController_didReceivePendingProvisioningUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__PKPaymentProvisioningController_didReceivePendingProvisioningUpdate___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = [v7 pendingProvisioning];
        uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 288) indexOfObject:v8];
        switch([v7 type])
        {
          case 0:
            id v10 = *(void **)(*(void *)(a1 + 40) + 288);
            goto LABEL_15;
          case 1:
            id v10 = *(void **)(*(void *)(a1 + 40) + 288);
            if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_15:
            }
              [v10 addObject:v8];
            else {
              [v10 setObject:v8 atIndexedSubscript:v9];
            }
            goto LABEL_21;
          case 2:
            if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_21;
            }
            [v8 setStatus:5];
            [*(id *)(*(void *)(a1 + 40) + 288) setObject:v8 atIndexedSubscript:v9];
            uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 40) count];
            if (!v11) {
              goto LABEL_21;
            }
            uint64_t v12 = v11;
            uint64_t v13 = 0;
            break;
          case 3:
            if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_21;
            }
            uint64_t v16 = *(void **)(*(void *)(a1 + 40) + 288);
            uint64_t v17 = v9;
            goto LABEL_20;
          default:
            goto LABEL_21;
        }
        while (1)
        {
          uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 40) objectAtIndexedSubscript:v13];
          int v15 = [v8 representsCredential:v14];

          if (v15) {
            break;
          }
          if (v12 == ++v13) {
            goto LABEL_21;
          }
        }
        uint64_t v16 = *(void **)(*(void *)(a1 + 40) + 40);
        uint64_t v17 = v13;
LABEL_20:
        [v16 removeObjectAtIndex:v17];
LABEL_21:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
  char v18 = [*(id *)(*(void *)(a1 + 40) + 80) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v24, "provisioningControllerUpdatedPendingProvisioning:", *(void *)(a1 + 40), (void)v25);
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v21);
  }
}

- (void)paymentWebService:(id)a3 didQueueTSMConnectionForTaskID:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentProvisioningController_paymentWebService_didQueueTSMConnectionForTaskID___block_invoke;
  block[3] = &unk_1E56DF798;
  id v9 = v6;
  id v10 = self;
  unint64_t v11 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__PKPaymentProvisioningController_paymentWebService_didQueueTSMConnectionForTaskID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 344))
  {
    uint64_t v3 = *(void **)(v1 + 24);
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    LODWORD(v3) = [v3 containsObject:v4];

    if (v3)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 40) target:sel__updateLocalizedProgressAndInvalidateTimer selector:0 userInfo:0 repeats:20.0];
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 32);
      *(void *)(v6 + 32) = v5;

      if ([*(id *)(a1 + 40) _isProvisioningPaymentAccount]) {
        PKLocalizedAquamanString(&cfstr_ProgressConfig.isa, 0);
      }
      else {
        PKCoreLocalizedString(&cfstr_ProgressConfig_0.isa, 0);
      }
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) _setLocalizedProgressDescription:v8];
    }
  }
}

- (void)paymentWebService:(id)a3 didCompleteTSMConnectionForTaskID:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentProvisioningController_paymentWebService_didCompleteTSMConnectionForTaskID___block_invoke;
  block[3] = &unk_1E56DF798;
  id v9 = v6;
  id v10 = self;
  unint64_t v11 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__PKPaymentProvisioningController_paymentWebService_didCompleteTSMConnectionForTaskID___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (a1[4] == *(void *)(v1 + 344))
  {
    uint64_t v3 = *(void **)(v1 + 24);
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1[6]];
    LODWORD(v3) = [v3 containsObject:v4];

    if (v3)
    {
      uint64_t v5 = (void *)a1[5];
      [v5 _updateLocalizedProgressAndInvalidateTimer];
    }
  }
}

- (void)_updateLocalizedProgressAndInvalidateTimer
{
  [(NSTimer *)self->_descriptionTimer invalidate];
  descriptionTimer = self->_descriptionTimer;
  self->_descriptionTimer = 0;

  id v4 = [(PKPaymentProvisioningController *)self _localizedProgressDescriptionForEnablingCard];
  [(PKPaymentProvisioningController *)self _setLocalizedProgressDescription:v4];
}

- (void)_addAssociatedCredential:(id)a3
{
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  identityProofingManagerCompletionHandler = (void (**)(id, id))self->_identityProofingManagerCompletionHandler;
  if (identityProofingManagerCompletionHandler) {
    identityProofingManagerCompletionHandler[2](identityProofingManagerCompletionHandler, a4);
  }
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  id v5 = a4;
  -[PKPaymentProvisioningController _applyIdentityConfiguration:activeConfigurations:completion:](self, "_applyIdentityConfiguration:activeConfigurations:completion:", [v5 count] != 0, v5, &__block_literal_global_664);
}

void __85__PKPaymentProvisioningController_proofingFlowManager_didChangeActiveConfigurations___block_invoke()
{
  v0 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_190E10000, v0, OS_LOG_TYPE_DEFAULT, "Identity Proofing configurations have been updated, model updated", v1, 2u);
  }
}

- (void)deleteCredential:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDeletable])
  {
    id v8 = [(PKPaymentWebService *)self->_webService targetDevice];
    if ([v6 isCarKeyTerminalPairingCredential]
      && [v6 credentialType] == 301
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v9 = [v6 configuration];
      id v10 = +[PKPendingCarKeyProvisioning uniqueIdentifierForCarKeyConfiguration:v9];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke;
      v20[3] = &unk_1E56E3F10;
      void v20[4] = self;
      id v21 = v6;
      id v22 = v7;
      [v8 removePendingProvisioningOfType:@"CarKey" withUniqueIdentifier:v10 completion:v20];
    }
    else
    {
      uint64_t v12 = [v6 remoteCredential];
      id v9 = [v12 paymentPass];

      if (v9)
      {
        uint64_t v13 = [[PKPaymentDeleteRequest alloc] initWithPaymentPass:v9];
        webService = self->_webService;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_669;
        v16[3] = &unk_1E56EA9E8;
        id v17 = v6;
        char v18 = self;
        id v19 = v7;
        [(PKPaymentWebService *)webService deleteForRequest:v13 completion:v16];
      }
      else
      {
        int v15 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v24 = v6;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Attempted to delete pass for credential %@, but missing pass", buf, 0xCu);
        }

        if (!v7)
        {
          id v9 = 0;
          goto LABEL_17;
        }
        uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:0 userInfo:0];
        (*((void (**)(id, PKPaymentDeleteRequest *))v7 + 2))(v7, v13);
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  unint64_t v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Attempted to delete credential %@, but it isn't deletable", buf, 0xCu);
  }

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
LABEL_18:
  }
}

uint64_t __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke(void *a1, int a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void **)(a1[4] + 384);
    v10[0] = a1[5];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v5 = [v3 arrayByExcludingObjectsInArray:v4];
    uint64_t v6 = a1[4];
    id v7 = *(void **)(v6 + 384);
    *(void *)(v6 + 384) = v5;

    if (![*(id *)(a1[4] + 384) count])
    {
      [*(id *)(a1[4] + 424) removeCarKeyCategory];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_2;
      block[3] = &unk_1E56D8AE0;
      void block[4] = a1[4];
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Updating setup products because all pending car keys were removed", v4, 2u);
  }

  return [*(id *)(a1 + 32) _reloadSetupProducts];
}

void __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_669(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Deleted credential %@, return result: %lu error: %@", buf, 0x20u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_670;
  block[3] = &unk_1E56D8BA8;
  id v12 = v5;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v8 = (id)v10.i64[0];
  int8x16_t v13 = vextq_s8(v10, v10, 8uLL);
  id v14 = *(id *)(a1 + 48);
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__PKPaymentProvisioningController_deleteCredential_completionHandler___block_invoke_670(void *a1)
{
  if (!a1[4]) {
    [*(id *)(a1[5] + 40) removeObjectIdenticalTo:a1[6]];
  }
  uint64_t result = a1[7];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_addOrUpdateProvisonedPassData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = [(NSMutableOrderedSet *)self->_provisionedPasses indexOfObject:v4];
    provisionedPasses = self->_provisionedPasses;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableOrderedSet *)provisionedPasses addObject:v7];
    }
    else {
      [(NSMutableOrderedSet *)provisionedPasses replaceObjectAtIndex:v5 withObject:v7];
    }
    id v4 = v7;
  }
}

- (PKPaymentPass)provisionedPass
{
  id v2 = [(NSMutableOrderedSet *)self->_provisionedPasses firstObject];
  uint64_t v3 = [v2 secureElementPass];
  id v4 = [v3 paymentPass];

  return (PKPaymentPass *)v4;
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator
{
  return self->_cloudStoreCoordinator;
}

- (void)setCloudStoreCoordinator:(id)a3
{
}

- (PKPaymentDataProvider)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (void)setPaymentDataProvider:(id)a3
{
}

- (PKPaymentOffersController)paymentOffersController
{
  return self->_paymentOffersController;
}

- (void)setPaymentOffersController:(id)a3
{
}

- (BOOL)isProvisioningForAltAccount
{
  return self->_isProvisioningForAltAccount;
}

- (void)setIsProvisioningForAltAccount:(BOOL)a3
{
  self->_isProvisioningForAltAccount = a3;
}

- (unint64_t)isCurrentUserUnder13
{
  return self->_isCurrentUserUnder13;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSString)localizedProgressDescription
{
  return self->_localizedProgressDescription;
}

- (unint64_t)preflightRequirements
{
  return self->_preflightRequirements;
}

- (NSArray)associatedCredentials
{
  return &self->_associatedCredentials->super;
}

- (NSArray)purchaseCredentials
{
  return self->_purchaseCredentials;
}

- (NSArray)pendingCarKeyCredentials
{
  return self->_pendingCarKeyCredentials;
}

- (PKProvisioningSEStorageSnapshot)storageSnapshot
{
  return self->_storageSnapshot;
}

- (NSExtension)provisioningExtension
{
  return self->_provisioningExtension;
}

- (NSArray)provisioningExtensionCredentials
{
  return self->_provisioningExtensionCredentials;
}

- (PKPaymentProvisioningControllerCredentialQueue)credentialProvisioningQueue
{
  return self->_credentialProvisioningQueue;
}

- (PKPaymentSetupProductModel)paymentSetupProductModel
{
  return self->_paymentSetupProductModel;
}

- (NSOrderedSet)provisionedPasses
{
  return &self->_provisionedPasses->super;
}

- (NSArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (BOOL)isExpressModeSetupOptional
{
  return self->_expressModeSetupOptional;
}

- (NSSet)automaticExpressModes
{
  return self->_automaticExpressModes;
}

- (BOOL)isAMPEnrollmentAvailable
{
  return self->_AMPEnrollmentAvailable;
}

- (NSArray)allowedPaymentNetworks
{
  return self->_allowedPaymentNetworks;
}

- (void)setAllowedPaymentNetworks:(id)a3
{
}

- (NSArray)allowedCardTypes
{
  return self->_allowedCardTypes;
}

- (void)setAllowedCardTypes:(id)a3
{
}

- (NSSet)requiredTransitNetworkIdentifiers
{
  return self->_requiredTransitNetworkIdentifiers;
}

- (void)setRequiredTransitNetworkIdentifiers:(id)a3
{
}

- (NSSet)allowedFeatureIdentifiers
{
  return self->_allowedFeatureIdentifiers;
}

- (NSSet)allowedProductIdentifiers
{
  return self->_allowedProductIdentifiers;
}

- (void)setAllowedProductIdentifiers:(id)a3
{
}

- (BOOL)preventsFeatureApplications
{
  return self->_preventsFeatureApplications;
}

- (void)setPreventsFeatureApplications:(BOOL)a3
{
  self->_BOOL preventsFeatureApplications = a3;
}

- (BOOL)fetchProductsFromStaticDataSource
{
  return self->_fetchProductsFromStaticDataSource;
}

- (void)setFetchProductsFromStaticDataSource:(BOOL)a3
{
  self->_fetchProductsFromStaticDataSource = a3;
}

- (BOOL)allowProductsInUnsupportedRegion
{
  return self->_allowProductsInUnsupportedRegion;
}

- (void)setAllowProductsInUnsupportedRegion:(BOOL)a3
{
  self->_allowProductsInUnsupportedRegion = a3;
}

- (CIDVUIProofingFlowManager)identityProofingManager
{
  return self->_identityProofingManager;
}

- (void)setIdentityProofingManager:(id)a3
{
}

- (id)identityProofingManagerCompletionHandler
{
  return self->_identityProofingManagerCompletionHandler;
}

- (void)setIdentityProofingManagerCompletionHandler:(id)a3
{
}

- (CLLocation)cachedLocation
{
  return self->_cachedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong(&self->_identityProofingManagerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_identityProofingManager, 0);
  objc_storeStrong((id *)&self->_allowedProductIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedFeatureIdentifiers, 0);
  objc_storeStrong((id *)&self->_requiredTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedCardTypes, 0);
  objc_storeStrong((id *)&self->_allowedPaymentNetworks, 0);
  objc_storeStrong((id *)&self->_automaticExpressModes, 0);
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
  objc_storeStrong((id *)&self->_paymentSetupProductModel, 0);
  objc_storeStrong((id *)&self->_credentialProvisioningQueue, 0);
  objc_storeStrong((id *)&self->_provisioningExtensionCredentials, 0);
  objc_storeStrong((id *)&self->_provisioningExtension, 0);
  objc_storeStrong((id *)&self->_storageSnapshot, 0);
  objc_storeStrong((id *)&self->_pendingCarKeyCredentials, 0);
  objc_storeStrong((id *)&self->_purchaseCredentials, 0);
  objc_storeStrong((id *)&self->_localizedProgressDescription, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentOffersController, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingProvisionings, 0);
  objc_storeStrong((id *)&self->_carKeyProduct, 0);
  objc_storeStrong((id *)&self->_paymentSetupFeatures, 0);
  objc_storeStrong((id *)&self->_zoneCreationManager, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_preflighUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong(&self->_locationCompletion, 0);
  objc_storeStrong((id *)&self->_locationTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_provisioningState, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_featuresDidBeginReporting, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_analyticsFeaturesToReport, 0);
  objc_storeStrong((id *)&self->_supportedFeatureIdentifierStringsForAccountProvisioning, 0);
  objc_storeStrong((id *)&self->_supportedFeatureIdentifierStrings, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_currentAddPaymentPassRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_currentCredential, 0);
  objc_storeStrong((id *)&self->_provisionedPasses, 0);
  objc_storeStrong((id *)&self->_associatedCredentials, 0);
  objc_storeStrong((id *)&self->_descriptionTimer, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_utility, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

- (BOOL)suppressDefaultCardholderNameField
{
  uint64_t v3 = [(PKPaymentProvisioningController *)self webService];
  id v4 = [v3 targetDevice];
  uint64_t v5 = [v4 deviceRegion];

  uint64_t v6 = [(PKPaymentProvisioningController *)self webService];
  id v7 = [v6 context];
  id v8 = [v7 configuration];
  char v9 = [v8 suppressCardholderNameFieldForRegion:v5];

  return v9;
}

@end