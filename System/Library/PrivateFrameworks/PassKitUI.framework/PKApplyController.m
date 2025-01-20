@interface PKApplyController
+ (id)localizationBundleForFeatureIdentifier:(unint64_t)a3 account:(id)a4;
+ (id)localizationBundleForFeatureIdentifier:(unint64_t)a3 account:(id)a4 mainBundle:(id)a5;
+ (id)preferredLanguageForFeatureIdentifier:(unint64_t)a3 account:(id)a4;
+ (id)preferredLanguageForFeatureIdentifier:(unint64_t)a3 account:(id)a4 mainBundle:(id)a5;
- (BOOL)didEncounterError;
- (NSString)analyticsExistingAccountType;
- (NSString)preliminaryAssessmentIdentifier;
- (NSString)referenceIdentifier;
- (NSURL)applyServiceURL;
- (PKAccount)account;
- (PKAccountPaymentFundingSource)fundingSource;
- (PKApplyController)initWithApplyConfiguration:(id)a3;
- (PKFamilyMember)familyMember;
- (PKFeatureApplication)featureApplication;
- (PKPayLaterSetupFlowController)payLaterSetupController;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (PKPaymentProvisioningController)provisioningController;
- (PKSetupFlowControllerProtocol)parentFlowController;
- (id)_applyExperiment;
- (id)_applyExperimentDetails;
- (id)_defaultSubject;
- (id)_displayableErrorForError:(id)a3 showDetailedErrorFlow:(BOOL)a4;
- (id)_fieldsViewControllerForPage:(id)a3;
- (id)_formatStringSuffixForItemType:(int64_t)a3;
- (id)_nextQueuedViewController;
- (id)applicationUpdatedAlertControllerWithHandler:(id)a3;
- (id)cancelAlertWithContinueAction:(id)a3;
- (id)loadHeroImageFromApplyExperiment;
- (id)localizationBundle;
- (id)preferredLanguage;
- (int64_t)applicationType;
- (int64_t)associatedIntent;
- (int64_t)channel;
- (int64_t)context;
- (int64_t)updateUserInfoSubType;
- (unint64_t)accessLevel;
- (unint64_t)featureIdentifier;
- (unint64_t)featureProduct;
- (unint64_t)verificationType;
- (void)_acquireAssertion;
- (void)_deviceMetadataFields:(unint64_t)a3 completion:(id)a4;
- (void)_getODIAssessmentForSession:(id)a3 completion:(id)a4;
- (void)_handleApplyResponse:(id)a3 originalFeatureApplication:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_handleCoreIDVPage:(id)a3 totalPageCount:(int64_t)a4 error:(id)a5 completion:(id)a6;
- (void)_handleResponseError:(id)a3 completion:(id)a4;
- (void)_invalidateAssertion;
- (void)_invalidateIDVSession;
- (void)_performApplyWithRequest:(id)a3 completion:(id)a4;
- (void)_performAuthenticationLocationBased:(BOOL)a3 withCompletion:(id)a4;
- (void)_performCoreIDVNextStepWithPage:(id)a3 completion:(id)a4;
- (void)_performCoreIDVShareWithCompletion:(id)a3;
- (void)_performCreateWithCompletion:(id)a3;
- (void)_performWithdrawWithCompletion:(id)a3;
- (void)_prewarmODIAssessmentIfNecessary;
- (void)_queueAcceptedFlowWithPage:(id)a3;
- (void)_queueActionFlowWithPage:(id)a3;
- (void)_queueApplicationTermsFlow;
- (void)_queueApplicationVerificationWithNextStepInfo:(id)a3;
- (void)_queueCannotResumeIDVFlow;
- (void)_queueCompleteFlowWithNextPage:(id)a3;
- (void)_queueConfirmInfoFlowWithPage:(id)a3;
- (void)_queueDeclinedFlowWithPage:(id)a3;
- (void)_queueDocumentSubmissionWithNextStepInfo:(id)a3;
- (void)_queueEmailRequiredErrorViewController;
- (void)_queueExpiredFlowWithPage:(id)a3;
- (void)_queueFieldsFlowWithNextStepInfo:(id)a3;
- (void)_queueGenericErrorViewController;
- (void)_queueGenericErrorViewControllerWithPage:(id)a3;
- (void)_queueInfoFlowWithNextWithPage:(id)a3;
- (void)_queueOfferFlowWithPage:(id)a3;
- (void)_queuePassActivationFlowWithCompletion:(id)a3;
- (void)_queueProgramConsentFlowWithPage:(id)a3;
- (void)_queueStateReasonExplanationFlowWithPage:(id)a3;
- (void)_queueTerminalStateFlowWithPage:(id)a3;
- (void)_reset;
- (void)_sendODISessionFeedbackforInflightSessionIfNecessary;
- (void)_setActionIdentifiersRequiringAuthentication:(id)a3;
- (void)_startCoreIDVSessionWithStepInfo:(id)a3 completion:(id)a4;
- (void)_startPaymentServiceListener;
- (void)_stopPaymentServiceListener;
- (void)_submitAllFieldPages:(id)a3 completion:(id)a4;
- (void)_submitCoreIDVDocumentsPage:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7;
- (void)_submitCoreIDVFieldsPage:(id)a3 completion:(id)a4;
- (void)_submitDocumentPageWithCoreIDVImageUpload:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7;
- (void)_submitDocumentsPage:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7;
- (void)accountUserInvitationsWithCompletion:(id)a3;
- (void)dealloc;
- (void)endApplyFlow;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationsWithCompletion:(id)a3;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)reportAnalyticsDictionaryForPage:(id)a3 pageTag:(id)a4 additionalValues:(id)a5;
- (void)reportAnalyticsDictionaryForPage:(id)a3 subject:(id)a4 pageTag:(id)a5 additionalValues:(id)a6;
- (void)reportAnalyticsDictionaryForPage:(id)a3 subject:(id)a4 pageTag:(id)a5 error:(id)a6 additionalValues:(id)a7;
- (void)reportAnalyticsError:(id)a3 page:(id)a4 pageTag:(id)a5 additionalValues:(id)a6;
- (void)resendVerificationForPage:(id)a3 completion:(id)a4;
- (void)setAccessLevel:(unint64_t)a3;
- (void)setAnalyticsExistingAccountType:(id)a3;
- (void)setApplyServiceURL:(id)a3;
- (void)setAssociatedIntent:(int64_t)a3;
- (void)setFamilyMember:(id)a3;
- (void)setInstallmentConfiguration:(id)a3;
- (void)setParentFlowController:(id)a3;
- (void)setPayLaterSetupController:(id)a3;
- (void)setPreliminaryAssessmentIdentifier:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)submitActionIdentifier:(id)a3 termsIdentifiers:(id)a4 odiAttributesDictionary:(id)a5 completion:(id)a6;
- (void)submitDocumentPage:(id)a3 selectedDocument:(id)a4 frontImage:(id)a5 backImage:(id)a6 completion:(id)a7;
- (void)submitFieldsPage:(id)a3 completion:(id)a4;
- (void)submitVerificationPage:(id)a3 verificationInfo:(id)a4 completion:(id)a5;
- (void)termsAccepted:(BOOL)a3 termsIdentifier:(id)a4 secondaryIdentifier:(id)a5 actionIdentifier:(id)a6 completion:(id)a7;
- (void)termsDataForFeatureWithIdentifier:(id)a3 format:(id)a4 completion:(id)a5;
- (void)termsDataForIdentifier:(id)a3 format:(id)a4 completion:(id)a5;
- (void)termsShownWithIdentifier:(id)a3;
- (void)withdrawApplicationWithCompletion:(id)a3;
@end

@implementation PKApplyController

- (PKApplyController)initWithApplyConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 featureApplication];
  if (v5)
  {

LABEL_4:
    v30.receiver = self;
    v30.super_class = (Class)PKApplyController;
    v6 = [(PKApplyController *)&v30 init];
    if (v6)
    {
      v6->_featureIdentifier = [v4 feature];
      v6->_featureProduct = [v4 featureProduct];
      v6->_applicationType = [v4 applicationType];
      uint64_t v7 = [v4 featureApplication];
      featureApplication = v6->_featureApplication;
      v6->_featureApplication = (PKFeatureApplication *)v7;

      uint64_t v9 = [v4 referenceIdentifier];
      referenceIdentifier = v6->_referenceIdentifier;
      v6->_referenceIdentifier = (NSString *)v9;

      v6->_updateUserInfoSubType = [v4 updateUserInfoSubType];
      v6->_verificationType = [v4 verificationType];
      v6->_context = [v4 context];
      v11 = [v4 setupDelegate];
      objc_storeWeak((id *)&v6->_setupDelegate, v11);

      uint64_t v12 = [v4 provisioningController];
      provisioningController = v6->_provisioningController;
      v6->_provisioningController = (PKPaymentProvisioningController *)v12;

      uint64_t v14 = [v4 account];
      account = v6->_account;
      v6->_account = (PKAccount *)v14;

      uint64_t v16 = [v4 fundingSource];
      fundingSource = v6->_fundingSource;
      v6->_fundingSource = (PKAccountPaymentFundingSource *)v16;

      uint64_t v18 = [(PKPaymentProvisioningController *)v6->_provisioningController webService];
      webService = v6->_webService;
      v6->_webService = (PKPaymentWebService *)v18;

      dispatch_queue_t v20 = dispatch_queue_create("com.apple.applyManager.queue", 0);
      workQueue = v6->_workQueue;
      v6->_workQueue = (OS_dispatch_queue *)v20;

      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      viewControllers = v6->_viewControllers;
      v6->_viewControllers = v22;

      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      pagesToSubmit = v6->_pagesToSubmit;
      v6->_pagesToSubmit = v24;

      unint64_t v26 = [v4 context];
      if (v26 <= 0xA) {
        v6->_channel = qword_1A04444D0[v26];
      }
      [(PKApplyController *)v6 _prewarmODIAssessmentIfNecessary];
    }
    self = v6;
    v27 = self;
    goto LABEL_9;
  }
  if ([v4 feature]) {
    goto LABEL_4;
  }
  v29 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "Error: Cannot create controller with unknown feature or nil featureApplication", buf, 2u);
  }

  v27 = 0;
LABEL_9:

  return v27;
}

- (void)dealloc
{
  [(PKApplyController *)self _reset];
  v3.receiver = self;
  v3.super_class = (Class)PKApplyController;
  [(PKApplyController *)&v3 dealloc];
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (v4)
  {
    v5 = [(PKApplyController *)self _nextQueuedViewController];
    if (v5)
    {
      [(PKApplyController *)self _startPaymentServiceListener];
      v4[2](v4, v5, 0);
    }
    else if (self->_endedApplyFlow)
    {
      [(PKApplyController *)self _stopPaymentServiceListener];
      parentFlowController = self->_parentFlowController;
      if (parentFlowController)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __54__PKApplyController_nextViewControllerWithCompletion___block_invoke;
        v12[3] = &unk_1E59CAC08;
        v12[4] = self;
        v13 = v4;
        [(PKSetupFlowControllerProtocol *)parentFlowController nextViewControllerWithCompletion:v12];
      }
      else
      {
        [(PKApplyController *)self _reset];
        v4[2](v4, 0, 0);
      }
    }
    else
    {
      [(PKApplyController *)self _startPaymentServiceListener];
      uint64_t v7 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F844B8]);
        [(PKApplyController *)self _performApplyWithRequest:v9 completion:v4];
      }
      else
      {
        v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11[0] = 0;
          _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "No application present - creating one", (uint8_t *)v11, 2u);
        }

        [(PKApplyController *)self _performCreateWithCompletion:v4];
      }
    }
  }
}

void __54__PKApplyController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _reset];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 288);
  *(void *)(v8 + 288) = 0;
}

- (void)submitFieldsPage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKFeatureApplication *)self->_featureApplication applicationState];
  if ((unint64_t)(v8 - 5) >= 0xB && (unint64_t)(v8 - 2) > 1)
  {
    if (self->_idVerificationSession)
    {
      [(PKApplyController *)self _submitCoreIDVFieldsPage:v6 completion:v7];
      goto LABEL_5;
    }
    [(NSMutableArray *)self->_pagesToSubmit addObject:v6];
    id v10 = objc_alloc_init(MEMORY[0x1E4F844B8]);
    v11 = [v6 fieldModel];
    uint64_t v12 = *MEMORY[0x1E4F870B8];
    v13 = [v11 submissionValuesForDestination:*MEMORY[0x1E4F870B8]];
    [v10 setOverlayParameters:v13];

    uint64_t v14 = [v11 secureSubmissionValuesForDestination:v12];
    [v10 setSecureOverlayParameters:v14];

    v15 = [(PKFeatureApplication *)self->_featureApplication applicationTermsIdentifier];
    uint64_t v16 = [v6 footerContent];
    v17 = [v16 links];
    if ([v17 count])
    {
      uint64_t v18 = [v15 length];

      if (!v18)
      {
LABEL_14:
        submitApplicationODISession = self->_submitApplicationODISession;
        dispatch_queue_t v20 = [v11 odiAttributes];
        [(PKODIServiceProviderAssessment *)submitApplicationODISession updateAssessment:v20];

        [(PKApplyController *)self _performApplyWithRequest:v10 completion:v7];
        goto LABEL_5;
      }
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v15, 0);
      [v10 setTermsIdentifiers:v16];
    }
    else
    {
    }
    goto LABEL_14;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Cannot submit fields from this state - returning next view controller instead", buf, 2u);
  }

  [(PKApplyController *)self nextViewControllerWithCompletion:v7];
LABEL_5:
}

- (void)_submitAllFieldPages:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v13), "fieldModel", (void)v21);
        v15 = [v14 paymentSetupFields];
        [v8 addObjectsFromArray:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F84C88]) initWithPaymentSetupFields:v8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F844B8]);
  uint64_t v18 = *MEMORY[0x1E4F870B8];
  v19 = [v16 submissionValuesForDestination:*MEMORY[0x1E4F870B8]];
  [v17 setOverlayParameters:v19];

  dispatch_queue_t v20 = [v16 secureSubmissionValuesForDestination:v18];
  [v17 setSecureOverlayParameters:v20];

  [(PKApplyController *)self _performApplyWithRequest:v17 completion:v7];
}

- (void)submitDocumentPage:(id)a3 selectedDocument:(id)a4 frontImage:(id)a5 backImage:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(PKFeatureApplication *)self->_featureApplication applicationState];
  if ((unint64_t)(v17 - 5) < 0xB || (unint64_t)(v17 - 2) <= 1)
  {
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Cannot submit documents from this state - returning next view controller instead", buf, 2u);
    }

    [(PKApplyController *)self nextViewControllerWithCompletion:v16];
  }
  else
  {
    switch(self->_documentUploadType)
    {
      case 0uLL:
        v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Error: Document upload type cannot be none", buf, 2u);
        }

        [(PKApplyController *)self _handleResponseError:0 completion:v16];
        break;
      case 1uLL:
        workQueue = self->_workQueue;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke;
        v38[3] = &unk_1E59D2148;
        id v39 = v14;
        id v40 = v15;
        v41 = self;
        id v42 = v12;
        id v43 = v13;
        id v44 = v16;
        dispatch_async(workQueue, v38);

        long long v21 = v39;
        goto LABEL_14;
      case 2uLL:
        dispatch_queue_t v20 = self->_workQueue;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_5;
        v24[3] = &unk_1E59D2148;
        id v25 = v14;
        id v26 = v15;
        v27 = self;
        id v28 = v12;
        id v29 = v13;
        id v30 = v16;
        dispatch_async(v20, v24);

        long long v21 = v25;
        goto LABEL_14;
      case 3uLL:
        long long v22 = self->_workQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_3;
        block[3] = &unk_1E59D2148;
        id v32 = v14;
        id v33 = v15;
        v34 = self;
        id v35 = v12;
        id v36 = v13;
        id v37 = v16;
        dispatch_async(v22, block);

        long long v21 = v32;
LABEL_14:

        break;
      default:
        break;
    }
  }
}

void __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke(uint64_t a1)
{
  v2 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  objc_super v3 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_2;
  v7[3] = &unk_1E59D2148;
  id v4 = *(void **)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  id v8 = v4;
  id v9 = *(id *)(a1 + 64);
  id v10 = v2;
  id v11 = v3;
  id v12 = *(id *)(a1 + 72);
  id v5 = v3;
  id v6 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitCoreIDVDocumentsPage:*(void *)(a1 + 40) selectedDocument:*(void *)(a1 + 48) frontImageData:*(void *)(a1 + 56) backImageData:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

void __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_3(uint64_t a1)
{
  v2 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  objc_super v3 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_4;
  v7[3] = &unk_1E59D2148;
  id v4 = *(void **)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  id v8 = v4;
  id v9 = *(id *)(a1 + 64);
  id v10 = v2;
  id v11 = v3;
  id v12 = *(id *)(a1 + 72);
  id v5 = v3;
  id v6 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitDocumentsPage:*(void *)(a1 + 40) selectedDocument:*(void *)(a1 + 48) frontImageData:*(void *)(a1 + 56) backImageData:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

void __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_5(uint64_t a1)
{
  v2 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  objc_super v3 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_6;
  v7[3] = &unk_1E59D2148;
  id v4 = *(void **)(a1 + 56);
  v7[4] = *(void *)(a1 + 48);
  id v8 = v4;
  id v9 = *(id *)(a1 + 64);
  id v10 = v2;
  id v11 = v3;
  id v12 = *(id *)(a1 + 72);
  id v5 = v3;
  id v6 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __89__PKApplyController_submitDocumentPage_selectedDocument_frontImage_backImage_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitDocumentPageWithCoreIDVImageUpload:*(void *)(a1 + 40) selectedDocument:*(void *)(a1 + 48) frontImageData:*(void *)(a1 + 56) backImageData:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)submitVerificationPage:(id)a3 verificationInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PKFeatureApplication *)self->_featureApplication applicationState];
  if ((unint64_t)(v11 - 5) < 0xB || (unint64_t)(v11 - 2) <= 1)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Cannot submit verification from this state - returning next view controller instead", buf, 2u);
    }

    [(PKApplyController *)self nextViewControllerWithCompletion:v10];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F84518]);
    *(void *)buf = 0;
    id v33 = buf;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__31;
    id v36 = __Block_byref_object_dispose__31;
    id v37 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__31;
    v30[4] = __Block_byref_object_dispose__31;
    id v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__31;
    v28[4] = __Block_byref_object_dispose__31;
    id v29 = objc_alloc_init(MEMORY[0x1E4F84500]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke;
    v27[3] = &unk_1E59CDD98;
    v27[4] = self;
    v27[5] = v28;
    [v13 addOperation:v27];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_3;
    v20[3] = &unk_1E59D67A8;
    long long v24 = v28;
    id v21 = v9;
    id v22 = v8;
    long long v23 = self;
    id v25 = buf;
    id v26 = v30;
    [v13 addOperation:v20];
    id v14 = [MEMORY[0x1E4F1CA98] null];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_7;
    v16[3] = &unk_1E59D67D0;
    id v17 = v10;
    uint64_t v18 = buf;
    v19 = v30;
    id v15 = (id)[v13 evaluateWithInput:v14 completion:v16];

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);

    _Block_object_dispose(buf, 8);
  }
}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 208))
  {
    uint64_t v10 = *(void *)(v9 + 176);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_2;
    v11[3] = &unk_1E59D6708;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v7;
    id v12 = v6;
    [(id)v9 _getODIAssessmentForSession:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOdiAssessment:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setVerificationInfo:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setVerificationType:", objc_msgSend(*(id *)(a1 + 40), "verificationType"));
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v9 = [*(id *)(*(void *)(a1 + 48) + 264) applicationIdentifier];
  [v8 setApplicationIdentifier:v9];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFeatureIdentifier:*(void *)(*(void *)(a1 + 48) + 216)];
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v11 = [*(id *)(*(void *)(a1 + 48) + 264) applicationBaseURL];
  [v10 setBaseURL:v11];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setChannel:*(void *)(*(void *)(a1 + 48) + 240)];
  ++*(void *)(*(void *)(a1 + 48) + 160);
  id v12 = (void *)[*(id *)(*(void *)(a1 + 48) + 264) copy];
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void **)(v13 + 48);
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_4;
  v19[3] = &unk_1E59D6780;
  v19[4] = v13;
  id v20 = v12;
  long long v23 = *(_OWORD *)(a1 + 64);
  id v21 = v6;
  id v22 = v7;
  id v16 = v6;
  id v17 = v7;
  id v18 = v12;
  [v14 submitVerificationRequest:v15 completion:v19];
}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_5;
  block[3] = &unk_1E59D6758;
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v7;
  id v15 = v6;
  uint64_t v18 = *(void *)(a1 + 72);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v11;
  long long v17 = v11;
  id v16 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendODISessionFeedbackforInflightSessionIfNecessary];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_6;
  v9[3] = &unk_1E59D6730;
  uint64_t v6 = *(void *)(a1 + 88);
  v9[4] = v2;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 72);
  id v7 = (id)v8;
  long long v11 = v8;
  id v10 = *(id *)(a1 + 64);
  [v2 _handleApplyResponse:v3 originalFeatureApplication:v4 error:v5 completion:v9];
}

void __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_6(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  --*(void *)(a1[4] + 160);
  uint64_t v7 = *(void *)(a1[7] + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[8] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __72__PKApplyController_submitVerificationPage_verificationInfo_completion___block_invoke_7(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)resendVerificationForPage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(PKFeatureApplication *)self->_featureApplication applicationState];
    if ((unint64_t)(v8 - 5) < 0xB || (unint64_t)(v8 - 2) <= 1)
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Cannot resend verification from this state - returning next view controller instead", buf, 2u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F844F8]);
      objc_msgSend(v10, "setVerificationType:", objc_msgSend(v6, "verificationType"));
      id v11 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
      [v10 setApplicationIdentifier:v11];

      id v12 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
      [v10 setBaseURL:v12];

      webService = self->_webService;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__PKApplyController_resendVerificationForPage_completion___block_invoke;
      v14[3] = &unk_1E59D67F8;
      v14[4] = self;
      id v15 = v7;
      [(PKPaymentWebService *)webService resendVerificationRequest:v10 completion:v14];
    }
  }
}

void __58__PKApplyController_resendVerificationForPage_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKApplyController_resendVerificationForPage_completion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PKApplyController_resendVerificationForPage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v2 = [*(id *)(a1 + 40) _displayableErrorForError:v2 showDetailedErrorFlow:1];
  }
  id v3 = (id)v2;
  (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2 == 0);
}

- (void)termsShownWithIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    shownTermsIdentifiers = self->_shownTermsIdentifiers;
    if (!shownTermsIdentifiers)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v7 = self->_shownTermsIdentifiers;
      self->_shownTermsIdentifiers = v6;

      shownTermsIdentifiers = self->_shownTermsIdentifiers;
    }
    if ([(NSMutableSet *)shownTermsIdentifiers containsObject:v4])
    {
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v4;
        id v9 = "Already sent shownTerms for :%@";
        uint64_t v10 = v8;
        uint32_t v11 = 12;
LABEL_9:
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      [(NSMutableSet *)self->_shownTermsIdentifiers addObject:v4];
      uint64_t v8 = objc_alloc_init(MEMORY[0x1E4F844E0]);
      id v12 = [(PKFeatureApplication *)self->_featureApplication applicationOfferDetails];
      id v13 = [v12 offerTermsIdentifier];
      char v14 = [v4 isEqualToString:v13];

      if (v14)
      {
        id v15 = @"offer";
      }
      else
      {
        id v16 = [(PKFeatureApplication *)self->_featureApplication declineDetails];
        long long v17 = [v16 declinedTermsIdentifier];
        char v18 = [v4 isEqualToString:v17];

        if (v18)
        {
          id v15 = @"decline";
        }
        else
        {
          v19 = [(PKFeatureApplication *)self->_featureApplication applicationTermsIdentifier];
          int v20 = [v4 isEqualToString:v19];

          if (v20) {
            id v15 = @"application";
          }
          else {
            id v15 = 0;
          }
        }
      }
      [v8 setTermsType:v15];
      [v8 setTermsIdentifier:v4];
      id v21 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
      [v8 setApplicationIdentifier:v21];

      id v22 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
      [v8 setBaseURL:v22];

      long long v23 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
      [v8 setReferrerIdentifier:v23];

      webService = self->_webService;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __46__PKApplyController_termsShownWithIdentifier___block_invoke;
      v25[3] = &unk_1E59D6820;
      v25[4] = self;
      id v26 = v4;
      [(PKPaymentWebService *)webService shownTermsWithRequest:v8 completion:v25];
    }
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Error: No terms identifier";
      uint64_t v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_9;
    }
  }
}

void __46__PKApplyController_termsShownWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__PKApplyController_termsShownWithIdentifier___block_invoke_2;
    v4[3] = &unk_1E59CA870;
    id v3 = *(void **)(a1 + 40);
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __46__PKApplyController_termsShownWithIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (void)termsAccepted:(BOOL)a3 termsIdentifier:(id)a4 secondaryIdentifier:(id)a5 actionIdentifier:(id)a6 completion:(id)a7
{
  BOOL v10 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    unint64_t v16 = [(PKFeatureApplication *)self->_featureApplication applicationState];
    if (v16 > 0x10 || ((1 << v16) & 0x1FD2C) == 0)
    {
      processedTermsIdentifiers = self->_processedTermsIdentifiers;
      if (!processedTermsIdentifiers)
      {
        int v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v21 = self->_processedTermsIdentifiers;
        self->_processedTermsIdentifiers = v20;

        processedTermsIdentifiers = self->_processedTermsIdentifiers;
      }
      if ([(NSMutableSet *)processedTermsIdentifiers containsObject:v12])
      {
        id v22 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Terms identifier: %@ has already been handled - querying next steps instead", (uint8_t *)&buf, 0xCu);
        }

        id v23 = objc_alloc_init(MEMORY[0x1E4F844B8]);
        [(PKApplyController *)self _performApplyWithRequest:v23 completion:v15];
      }
      else
      {
        PKLogFacilityTypeGetObject();
        long long v24 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, self);
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v26 = v25;
          if (os_signpost_enabled(v24))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_19F450000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "request:applyTerms", "", (uint8_t *)&buf, 2u);
          }
        }

        id v27 = objc_alloc_init(MEMORY[0x1E4F844F0]);
        [v27 setTermsAccepted:v10];
        if ([(PKFeatureApplication *)self->_featureApplication applicationState] == 7)
        {
          [v27 setPathTermsIdentifier:v12];
          if (v13) {
            [v27 setPathIdentifier:v13];
          }
        }
        else
        {
          id v28 = [(PKFeatureApplication *)self->_featureApplication applicationOfferDetails];
          uint64_t v29 = [v28 offerTermsIdentifier];
          int v30 = [v12 isEqualToString:v29];

          if (v30)
          {
            [v27 setOfferTermsIdentifier:v12];
          }
          else
          {
            id v31 = [(PKFeatureApplication *)self->_featureApplication applicationTermsIdentifier];
            int v32 = [v12 isEqualToString:v31];

            if (v32)
            {
              [v27 setApplicationTermsIdentifier:v12];
            }
            else
            {
              id v33 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_19F450000, v33, OS_LOG_TYPE_DEFAULT, "Error: unknown terms identifier", (uint8_t *)&buf, 2u);
              }
            }
          }
        }
        [v27 setInstallmentConfiguration:self->_installmentConfiguration];
        uint64_t v34 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
        [v27 setApplicationIdentifier:v34];

        id v35 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
        [v27 setBaseURL:v35];

        id v36 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
        [v27 setReferrerIdentifier:v36];

        id v37 = [(PKApplyController *)self _applyExperimentDetails];
        [v27 setExperimentDetails:v37];

        id v38 = objc_alloc_init(MEMORY[0x1E4F84518]);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v63 = 0x3032000000;
        v64 = __Block_byref_object_copy__31;
        v65 = __Block_byref_object_dispose__31;
        id v66 = 0;
        objc_initWeak(&location, self);
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x3032000000;
        v59[3] = __Block_byref_object_copy__31;
        v59[4] = __Block_byref_object_dispose__31;
        id v60 = 0;
        if (v14) {
          BOOL v39 = [(NSSet *)self->_actionIdentifiersRequiringAuthentication containsObject:v14];
        }
        else {
          BOOL v39 = 0;
        }
        if (([(PKFeatureApplication *)self->_featureApplication supportsAuthentication] & v39) == 1)
        {
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke;
          v54[3] = &unk_1E59D6898;
          v54[4] = self;
          objc_copyWeak(&v58, &location);
          p_long long buf = &buf;
          id v55 = v27;
          v57 = v59;
          [v38 addOperation:v54];

          objc_destroyWeak(&v58);
        }
        if (v10)
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_66;
          v52[3] = &unk_1E59CE708;
          v52[4] = self;
          id v53 = v27;
          [v38 addOperation:v52];
        }
        if (self->_requiresODIAssessment)
        {
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_69;
          v50[3] = &unk_1E59CE708;
          v50[4] = self;
          id v51 = v27;
          [v38 addOperation:v50];
        }
        ++self->_runningApplicationUpdates;
        id v40 = [MEMORY[0x1E4F1CA98] null];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_71;
        v43[3] = &unk_1E59D6988;
        v43[4] = self;
        v47 = &buf;
        id v46 = v15;
        id v41 = v27;
        id v44 = v41;
        objc_copyWeak(&v49, &location);
        id v45 = v12;
        v48 = v59;
        id v42 = (id)[v38 evaluateWithInput:v40 completion:v43];

        objc_destroyWeak(&v49);
        _Block_object_dispose(v59, 8);

        objc_destroyWeak(&location);
        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      char v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Cannot accept terms from this state - returning next view controller instead", (uint8_t *)&buf, 2u);
      }

      [(PKApplyController *)self nextViewControllerWithCompletion:v15];
    }
  }
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E59D6870;
  objc_copyWeak(&v23, (id *)(a1 + 64));
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v14 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v18 = v12;
  uint64_t v21 = v13;
  id v15 = v14;
  uint64_t v16 = *(void *)(a1 + 56);
  id v19 = v15;
  uint64_t v22 = v16;
  [v10 _performAuthenticationLocationBased:1 withCompletion:v17];

  objc_destroyWeak(&v23);
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E59D6848;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  id v16 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  uint64_t v17 = *(void *)(a1 + 56);
  id v14 = v5;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v18 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v19);
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Apply authentication failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F870B0] code:1 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    goto LABEL_6;
  }
  id v9 = [WeakRetained[33] authenticationSignaturePayload];
  if ([v9 length])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F844D8]);
    [v10 setSignaturePayload:v9];
    id v11 = [*(id *)(a1 + 48) externalizedContext];
    [v10 setAuthenticationCrediential:v11];

    [*(id *)(a1 + 56) setAuthenticationContext:v10];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

LABEL_10:
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  PKLogFacilityTypeGetObject();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyTerms:getDeviceMetadata", "", buf, 2u);
    }
  }

  id v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_67;
  v15[3] = &unk_1E59D68C0;
  v15[4] = v11;
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v7;
  id v16 = v12;
  id v13 = v6;
  id v14 = v7;
  [v11 _deviceMetadataFields:251 completion:v15];
}

uint64_t __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_67(uint64_t a1, void *a2)
{
  PKLogFacilityTypeGetObject();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(const void **)(a1 + 32);
  id v6 = a2;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyTerms:getDeviceMetadata", "", v10, 2u);
    }
  }

  [*(id *)(a1 + 40) setDeviceMetadata:v6];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_69(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  PKLogFacilityTypeGetObject();
  os_signpost_id_t v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyTerms:getAssessment", "", buf, 2u);
    }
  }

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[24];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_70;
  v16[3] = &unk_1E59D68E8;
  void v16[4] = v11;
  id v13 = *(id *)(a1 + 40);
  id v18 = v6;
  id v19 = v7;
  id v17 = v13;
  id v14 = v6;
  id v15 = v7;
  [v11 _getODIAssessmentForSession:v12 completion:v16];
}

uint64_t __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_70(uint64_t a1, void *a2)
{
  PKLogFacilityTypeGetObject();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(const void **)(a1 + 32);
  id v6 = a2;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyTerms:getAssessment", "", v10, 2u);
    }
  }

  [*(id *)(a1 + 40) setOdiAssessment:v6];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_71(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 isCanceled];
  os_signpost_id_t v9 = *(id **)(a1 + 32);
  if (v8)
  {
    [v9 _handleResponseError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) completion:*(void *)(a1 + 56)];
    --*(void *)(*(void *)(a1 + 32) + 160);
    PKLogFacilityTypeGetObject();
    os_signpost_id_t v10 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19F450000, v10, OS_SIGNPOST_INTERVAL_END, v12, "request:applyTerms", "", buf, 2u);
      }
    }
  }
  else
  {
    id v13 = (void *)[v9[33] copy];
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(*(void *)(a1 + 32) + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_72;
    v19[3] = &unk_1E59D6960;
    objc_copyWeak(&v25, (id *)(a1 + 80));
    id v23 = *(id *)(a1 + 56);
    os_signpost_id_t v10 = v13;
    uint64_t v16 = *(void *)(a1 + 32);
    id v20 = v10;
    uint64_t v21 = v16;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 72);
    id v22 = v17;
    uint64_t v24 = v18;
    [v15 submitTermsRequest:v14 completion:v19];

    objc_destroyWeak(&v25);
  }
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2_73;
  v12[3] = &unk_1E59D6938;
  objc_copyWeak(&v20, (id *)(a1 + 72));
  id v18 = *(id *)(a1 + 56);
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v15 = v6;
  id v7 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 40);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 64);
  id v17 = v8;
  uint64_t v19 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(&v20);
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_2_73(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _sendODISessionFeedbackforInflightSessionIfNecessary];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3_74;
    v11[3] = &unk_1E59D6910;
    int8x16_t v10 = *(int8x16_t *)(a1 + 48);
    id v6 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    id v13 = v3;
    id v14 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 72);
    [v3 _handleApplyResponse:v4 originalFeatureApplication:v5 error:v6 completion:v11];
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v7)
    {
      [v7 invalidate];
      uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __99__PKApplyController_termsAccepted_termsIdentifier_secondaryIdentifier_actionIdentifier_completion___block_invoke_3_74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  --*(void *)(*(void *)(a1 + 32) + 160);
  if (v5 && !(v6 | *(void *)(a1 + 40))) {
    [*(id *)(*(void *)(a1 + 48) + 72) addObject:*(void *)(a1 + 56)];
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v7);
  }
  PKLogFacilityTypeGetObject();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)int8x16_t v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v9, OS_SIGNPOST_INTERVAL_END, v11, "request:applyTerms", "", v12, 2u);
    }
  }
}

- (void)withdrawApplicationWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKFeatureApplication *)self->_featureApplication applicationState];
  if (v5 - 5 >= 0xC)
  {
    if (v5 <= 4)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __55__PKApplyController_withdrawApplicationWithCompletion___block_invoke;
      v8[3] = &unk_1E59CD370;
      v8[4] = self;
      id v9 = v4;
      [(PKApplyController *)self _performWithdrawWithCompletion:v8];
    }
  }
  else
  {
    unint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error: Cannot withdraw from this state. Already terminal", v7, 2u);
    }

    [(PKApplyController *)self _reset];
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __55__PKApplyController_withdrawApplicationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _handleResponseError:a2 completion:v4];
  }
  else
  {
    [v3 _reset];
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      unint64_t v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  return result;
}

- (id)applicationUpdatedAlertControllerWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKApplyController *)self preferredLanguage];
  unint64_t v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = PKLocalizedApplyFeatureString();
  uint64_t v8 = PKLocalizedApplyFeatureString();
  id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  os_signpost_id_t v10 = (void *)MEMORY[0x1E4FB1410];
  os_signpost_id_t v11 = PKLocalizedApplyFeatureString();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PKApplyController_applicationUpdatedAlertControllerWithHandler___block_invoke;
  v15[3] = &unk_1E59CB150;
  id v16 = v4;
  id v12 = v4;
  id v13 = [v10 actionWithTitle:v11 style:0 handler:v15];
  [v9 addAction:v13];

  return v9;
}

uint64_t __66__PKApplyController_applicationUpdatedAlertControllerWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)endApplyFlow
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Apply flow ended", v4, 2u);
  }

  self->_endedApplyFlow = 1;
  [(PKApplyController *)self _invalidateAssertion];
  [(PKApplyController *)self _stopPaymentServiceListener];
}

- (void)_startPaymentServiceListener
{
  if (!self->_paymentService)
  {
    id v3 = (PKPaymentService *)[objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:self];
    paymentService = self->_paymentService;
    self->_paymentService = v3;
  }
}

- (void)_stopPaymentServiceListener
{
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  paymentService = self->_paymentService;
  self->_paymentService = 0;
}

- (void)_reset
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Reseting apply controller", v16, 2u);
  }

  [(PKApplyController *)self _invalidateIDVSession];
  [(PKApplyController *)self _invalidateAssertion];
  idVerificationSession = self->_idVerificationSession;
  self->_idVerificationSession = 0;

  previousContextIdentifier = self->_previousContextIdentifier;
  self->_previousContextIdentifier = 0;

  actionIdentifiersRequiringAuthentication = self->_actionIdentifiersRequiringAuthentication;
  self->_requiredMetadataFields = 0;
  self->_actionIdentifiersRequiringAuthentication = 0;

  coreIDVNextStepToken = self->_coreIDVNextStepToken;
  self->_coreIDVNextStepToken = 0;

  featureApplication = self->_featureApplication;
  self->_featureApplication = 0;

  encryptionCertificates = self->_encryptionCertificates;
  self->_encryptionCertificates = 0;

  self->_endedApplyFlow = 0;
  account = self->_account;
  self->_account = 0;

  self->_didEncounterError = 0;
  [(NSMutableSet *)self->_processedTermsIdentifiers removeAllObjects];
  [(NSMutableSet *)self->_shownTermsIdentifiers removeAllObjects];
  [(NSMutableArray *)self->_viewControllers removeAllObjects];
  [(NSMutableArray *)self->_pagesToSubmit removeAllObjects];
  self->_viewControllerIndex = 0;
  self->_documentUploadType = 0;
  installmentConfiguration = self->_installmentConfiguration;
  self->_installmentConfiguration = 0;

  inflightODISession = self->_inflightODISession;
  self->_inflightODISession = 0;

  createApplicationODISession = self->_createApplicationODISession;
  self->_createApplicationODISession = 0;

  submitApplicationODISession = self->_submitApplicationODISession;
  self->_submitApplicationODISession = 0;

  applyTermsODISession = self->_applyTermsODISession;
  self->_applyTermsODISession = 0;
}

- (void)_performWithdrawWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F844B0]);
  unint64_t v6 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
  [v5 setBaseURL:v6];

  id v7 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
  [v5 setApplicationIdentifier:v7];

  uint64_t v8 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
  [v5 setReferrerIdentifier:v8];

  ++self->_runningApplicationUpdates;
  paymentService = self->_paymentService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PKApplyController__performWithdrawWithCompletion___block_invoke;
  v11[3] = &unk_1E59CD370;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(PKPaymentService *)paymentService submitDeleteRequest:v5 completion:v11];
}

void __52__PKApplyController__performWithdrawWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKApplyController__performWithdrawWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CA938;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__52__PKApplyController__performWithdrawWithCompletion___block_invoke_2(void *result)
{
  --*(void *)(result[4] + 160);
  uint64_t v1 = result[6];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void))(v1 + 16))(result[6], result[5]);
  }
  return result;
}

- (void)_deviceMetadataFields:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    webService = self->_webService;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PKApplyController__deviceMetadataFields_completion___block_invoke;
    v9[3] = &unk_1E59D58D0;
    id v10 = v6;
    [v7 paymentWebService:webService deviceMetadataWithFields:a3 completion:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __54__PKApplyController__deviceMetadataFields_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PKApplyController__deviceMetadataFields_completion___block_invoke_2;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __54__PKApplyController__deviceMetadataFields_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_performCreateWithCompletion:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PKLogFacilityTypeGetObject();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "request:applyCreate", "", buf, 2u);
    }
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F844C0]);
  applyServiceURL = self->_applyServiceURL;
  if (applyServiceURL)
  {
    id v10 = applyServiceURL;
  }
  else
  {
    os_signpost_id_t v11 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    id v12 = [v11 context];
    id v13 = [v12 primaryRegion];
    id v14 = [v13 applyServiceURL];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      PKApplyServiceOverrideURL();
      id v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    id v10 = v16;

    if (!v10)
    {
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "No apply URL found in the primary region. Evaluating other regions for a possible apply URL.", buf, 2u);
      }

      id v18 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
      uint64_t v19 = [v18 context];
      id v20 = [v19 regions];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v21 = v20;
      id v10 = (NSURL *)[v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v10)
      {
        uint64_t v22 = *(void *)v48;
        while (2)
        {
          for (i = 0; i != v10; i = (NSURL *)((char *)i + 1))
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(v21);
            }
            uint64_t v24 = [v21 objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * i)];
            id v25 = [v24 applyServiceURL];

            if (v25)
            {
              id v10 = [v24 applyServiceURL];

              goto LABEL_22;
            }
          }
          id v10 = (NSURL *)[v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
  }
  [v8 setApplyServiceURL:v10];
  [v8 setFeatureIdentifier:self->_featureIdentifier];
  os_signpost_id_t v26 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
  [v8 setReferrerIdentifier:v26];

  id v27 = [(PKApplyController *)self _applyExperimentDetails];
  [v8 setExperimentDetails:v27];

  [v8 setInstallmentConfiguration:self->_installmentConfiguration];
  [v8 setApplicationType:self->_applicationType];
  [v8 setUpdateUserInfoSubType:self->_updateUserInfoSubType];
  [v8 setVerificationType:self->_verificationType];
  id v28 = [(PKAccount *)self->_account accountIdentifier];
  [v8 setAccountIdentifier:v28];

  [v8 setReferenceIdentifier:self->_referenceIdentifier];
  [v8 setChannel:self->_channel];
  id v29 = objc_alloc(MEMORY[0x1E4F84718]);
  int v30 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v31 = (void *)[v29 initWithAccountUserAltDSID:v30 accessLevel:self->_accessLevel];

  [v8 setInvitationDetails:v31];
  int v32 = [(PKAccountPaymentFundingSource *)self->_fundingSource identifier];
  [v8 setFundingSourceIdentifier:v32];

  [v8 setPreliminaryAssessmentIdentifier:self->_preliminaryAssessmentIdentifier];
  [v8 setFeatureProduct:self->_featureProduct];
  [v8 setAssociatedIntent:self->_associatedIntent];
  id v33 = (void *)[(PKFeatureApplication *)self->_featureApplication copy];
  ++self->_runningApplicationUpdates;
  id v34 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke;
  v45[3] = &unk_1E59CE708;
  v45[4] = self;
  id v35 = v8;
  id v46 = v35;
  [v34 addOperation:v45];
  id v36 = [MEMORY[0x1E4F1CA98] null];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_95;
  v41[3] = &unk_1E59D69D8;
  v41[4] = self;
  id v42 = v35;
  id v43 = v33;
  id v44 = v4;
  id v37 = v4;
  id v38 = v33;
  id v39 = v35;
  id v40 = (id)[v34 evaluateWithInput:v36 completion:v41];
}

void __50__PKApplyController__performCreateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  PKLogFacilityTypeGetObject();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyCreate:getAssessment", "", buf, 2u);
    }
  }

  os_signpost_id_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[23];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_94;
  v16[3] = &unk_1E59D68E8;
  void v16[4] = v11;
  id v13 = *(id *)(a1 + 40);
  id v18 = v6;
  id v19 = v7;
  id v17 = v13;
  id v14 = v6;
  id v15 = v7;
  [v11 _getODIAssessmentForSession:v12 completion:v16];
}

uint64_t __50__PKApplyController__performCreateWithCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  PKLogFacilityTypeGetObject();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(const void **)(a1 + 32);
  id v6 = a2;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyCreate:getAssessment", "", v10, 2u);
    }
  }

  [*(id *)(a1 + 40) setOdiAssessment:v6];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_95(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_2;
  v5[3] = &unk_1E59D69B0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 createWithRequest:v3 completion:v5];
}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CF3E0;
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v7;
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendODISessionFeedbackforInflightSessionIfNecessary];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKApplyController__performCreateWithCompletion___block_invoke_4;
  v6[3] = &unk_1E59CAC08;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 64);
  [v2 _handleApplyResponse:v3 originalFeatureApplication:v4 error:v5 completion:v6];
}

void __50__PKApplyController__performCreateWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  --*(void *)(*(void *)(a1 + 32) + 160);
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  PKLogFacilityTypeGetObject();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_END, v10, "request:applyCreate", "", v11, 2u);
    }
  }
}

- (void)_performApplyWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PKLogFacilityTypeGetObject();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyRequest", "", buf, 2u);
    }
  }

  [v6 setCertificates:self->_encryptionCertificates];
  id v11 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
  [v6 setBaseURL:v11];

  [v6 setFeatureIdentifier:self->_featureIdentifier];
  id v12 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
  [v6 setApplicationIdentifier:v12];

  id v13 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
  [v6 setReferrerIdentifier:v13];

  id v14 = [(PKApplyController *)self _applyExperimentDetails];
  [v6 setExperimentDetails:v14];

  [v6 setCoreIDVNextStepToken:self->_coreIDVNextStepToken];
  [v6 setPreviousContextIdentifier:self->_previousContextIdentifier];
  [v6 setInstallmentConfiguration:self->_installmentConfiguration];
  [v6 setPreliminaryAssessmentIdentifier:self->_preliminaryAssessmentIdentifier];
  [v6 setApplicationType:self->_applicationType];
  [v6 setUpdateUserInfoSubType:self->_updateUserInfoSubType];
  [v6 setChannel:self->_channel];
  id v15 = objc_alloc(MEMORY[0x1E4F84718]);
  id v16 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v17 = (void *)[v15 initWithAccountUserAltDSID:v16 accessLevel:self->_accessLevel];

  [v6 setInvitationDetails:v17];
  id v18 = [(PKAccount *)self->_account accountIdentifier];
  [v6 setAccountIdentifier:v18];

  [v6 setFeatureProduct:self->_featureProduct];
  id v19 = objc_alloc_init(MEMORY[0x1E4F84518]);
  *(void *)long long buf = 0;
  id v45 = buf;
  uint64_t v46 = 0x3032000000;
  long long v47 = __Block_byref_object_copy__31;
  long long v48 = __Block_byref_object_dispose__31;
  id v49 = 0;
  objc_initWeak(&location, self);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__31;
  v41[4] = __Block_byref_object_dispose__31;
  id v42 = 0;
  id v20 = [v6 actionIdentifier];
  if (v20) {
    BOOL v21 = [(NSSet *)self->_actionIdentifiersRequiringAuthentication containsObject:v20];
  }
  else {
    BOOL v21 = 0;
  }
  if (([(PKFeatureApplication *)self->_featureApplication supportsAuthentication] & v21) == 1)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke;
    v36[3] = &unk_1E59D6898;
    v36[4] = self;
    objc_copyWeak(&v40, &location);
    id v38 = buf;
    id v37 = v6;
    id v39 = v41;
    [v19 addOperation:v36];

    objc_destroyWeak(&v40);
  }
  if (self->_requiredMetadataFields)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_96;
    v34[3] = &unk_1E59CE708;
    v34[4] = self;
    id v35 = v6;
    [v19 addOperation:v34];
  }
  if (self->_requiresODIAssessment)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4;
    v32[3] = &unk_1E59CE708;
    v32[4] = self;
    id v33 = v6;
    [v19 addOperation:v32];
  }
  uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_100;
  v26[3] = &unk_1E59D6AA0;
  v26[4] = self;
  id v23 = v6;
  id v27 = v23;
  objc_copyWeak(&v31, &location);
  id v24 = v7;
  id v28 = v24;
  id v29 = v41;
  int v30 = buf;
  id v25 = (id)[v19 evaluateWithInput:v22 completion:v26];

  objc_destroyWeak(&v31);
  _Block_object_dispose(v41, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E59D6870;
  objc_copyWeak(&v23, (id *)(a1 + 64));
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v14 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v18 = v12;
  uint64_t v21 = v13;
  id v15 = v14;
  uint64_t v16 = *(void *)(a1 + 56);
  id v19 = v15;
  uint64_t v22 = v16;
  [v10 _performAuthenticationLocationBased:1 withCompletion:v17];

  objc_destroyWeak(&v23);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3;
  v11[3] = &unk_1E59D6848;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  id v16 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  uint64_t v17 = *(void *)(a1 + 56);
  id v14 = v5;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v18 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v19);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Apply authentication failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F870B0] code:1 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    goto LABEL_6;
  }
  id v9 = [WeakRetained[33] authenticationSignaturePayload];
  if ([v9 length])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F844D8]);
    [v10 setSignaturePayload:v9];
    id v11 = [*(id *)(a1 + 48) externalizedContext];
    [v10 setAuthenticationCrediential:v11];

    [*(id *)(a1 + 56) setAuthenticationContext:v10];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

LABEL_10:
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_96(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_97;
  v13[3] = &unk_1E59D6A00;
  id v10 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v7;
  id v14 = v10;
  id v11 = v6;
  id v12 = v7;
  [v8 _deviceMetadataFields:v9 completion:v13];
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_97(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_98;
  v5[3] = &unk_1E59CE9B0;
  id v6 = a1[4];
  id v7 = v3;
  id v9 = a1[6];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_98(uint64_t a1)
{
  [*(id *)(a1 + 32) setDeviceMetadata:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  PKLogFacilityTypeGetObject();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:applyRequest:getAssessment", "", buf, 2u);
    }
  }

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[22];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_99;
  v16[3] = &unk_1E59D68E8;
  void v16[4] = v11;
  id v13 = *(id *)(a1 + 40);
  id v18 = v6;
  id v19 = v7;
  id v17 = v13;
  id v14 = v6;
  id v15 = v7;
  [v11 _getODIAssessmentForSession:v12 completion:v16];
}

uint64_t __57__PKApplyController__performApplyWithRequest_completion___block_invoke_99(uint64_t a1, void *a2)
{
  PKLogFacilityTypeGetObject();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(const void **)(a1 + 32);
  id v6 = a2;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v4, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v4, OS_SIGNPOST_INTERVAL_END, v8, "request:applyRequest:getAssessment", "", v10, 2u);
    }
  }

  [*(id *)(a1 + 40) setOdiAssessment:v6];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_100(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 isCanceled];
  os_signpost_id_t v9 = *(id **)(a1 + 32);
  if (v8)
  {
    [v9 _handleResponseError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) completion:*(void *)(a1 + 48)];
    PKLogFacilityTypeGetObject();
    os_signpost_id_t v10 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)id v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_19F450000, v10, OS_SIGNPOST_INTERVAL_END, v12, "request:applyRequest", "", v17, 2u);
      }
    }
  }
  else
  {
    id v13 = (void *)[v9[33] copy];
    ++*(void *)(*(void *)(a1 + 32) + 160);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(*(void *)(a1 + 32) + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_101;
    v18[3] = &unk_1E59D6A78;
    objc_copyWeak(&v23, (id *)(a1 + 72));
    id v21 = *(id *)(a1 + 48);
    os_signpost_id_t v10 = v13;
    uint64_t v22 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 32);
    id v19 = v10;
    uint64_t v20 = v16;
    [v15 submitApplyRequest:v14 completion:v18];

    objc_destroyWeak(&v23);
  }
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_2_101(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_102;
  block[3] = &unk_1E59D6A50;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v16 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_3_102(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
    {
      id v4 = (void *)*((void *)WeakRetained + 13);
      *((void *)WeakRetained + 13) = 0;
    }
    [v3 _sendODISessionFeedbackforInflightSessionIfNecessary];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4_103;
    v10[3] = &unk_1E59D6A28;
    v10[4] = v3;
    id v8 = *(id *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    id v11 = v8;
    uint64_t v12 = v9;
    v10[5] = *(void *)(a1 + 56);
    [v3 _handleApplyResponse:v7 originalFeatureApplication:v5 error:v6 completion:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __57__PKApplyController__performApplyWithRequest_completion___block_invoke_4_103(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  --*(void *)(*(void *)(a1 + 32) + 160);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v8)
  {
    [v8 invalidate];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  PKLogFacilityTypeGetObject();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 40));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v11, OS_SIGNPOST_INTERVAL_END, v13, "request:applyRequest", "", v14, 2u);
    }
  }
}

- (void)_performAuthenticationLocationBased:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    if (v4) {
      uint64_t v6 = 1025;
    }
    else {
      uint64_t v6 = 2;
    }
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__31;
    uint64_t v17 = __Block_byref_object_dispose__31;
    id v18 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    v20[0] = @"Apply Authentication";
    v19[0] = &unk_1EF2B9420;
    v19[1] = &unk_1EF2B9438;
    uint64_t v7 = PKLocalizedString(&cfstr_Wallet_0.isa);
    v19[2] = &unk_1EF2B9450;
    v20[1] = v7;
    v20[2] = MEMORY[0x1E4F1CC38];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

    uint64_t v9 = (void *)v14[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKApplyController__performAuthenticationLocationBased_withCompletion___block_invoke;
    v10[3] = &unk_1E59D6AC8;
    id v11 = v5;
    os_signpost_id_t v12 = &v13;
    [v9 evaluatePolicy:v6 options:v8 reply:v10];

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __72__PKApplyController__performAuthenticationLocationBased_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (!a2 || a3) {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

- (void)termsDataForIdentifier:(id)a3 format:(id)a4 completion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    uint64_t v9 = (objc_class *)MEMORY[0x1E4F844E8];
    id v10 = a4;
    id v11 = a3;
    id v12 = objc_alloc_init(v9);
    [v12 setTermsDataFormat:v10];

    [v12 setTermsIdentifier:v11];
    uint64_t v13 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
    [v12 setApplicationIdentifier:v13];

    [v12 setFeatureIdentifier:self->_featureIdentifier];
    id v14 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
    [v12 setBaseURL:v14];

    uint64_t v15 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
    [v12 setReferrerIdentifier:v15];

    webService = self->_webService;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke;
    v17[3] = &unk_1E59D6AF0;
    void v17[4] = self;
    id v18 = v8;
    [(PKPaymentWebService *)webService termsDataWithRequest:v12 completion:v17];
  }
}

void __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke_2;
  v10[3] = &unk_1E59CE9B0;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __62__PKApplyController_termsDataForIdentifier_format_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v3 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v6 = [v2 termsData];
    id v5 = [*(id *)(a1 + 32) termsDataFileName];
    (*(void (**)(uint64_t, id, void *, void))(v4 + 16))(v4, v6, v5, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_displayableErrorForError:showDetailedErrorFlow:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)termsDataForFeatureWithIdentifier:(id)a3 format:(id)a4 completion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F844D0];
    id v10 = a4;
    id v11 = a3;
    id v12 = objc_alloc_init(v9);
    [v12 setTermsDataFormat:v10];

    [v12 setTermsIdentifier:v11];
    [v12 setFeatureIdentifier:self->_featureIdentifier];
    uint64_t v13 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
    [v12 setReferrerIdentifier:v13];

    webService = self->_webService;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke;
    v15[3] = &unk_1E59D6AF0;
    void v15[4] = self;
    id v16 = v8;
    [(PKPaymentWebService *)webService featureTermsDataWithRequest:v12 completion:v15];
  }
}

void __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke_2;
  v10[3] = &unk_1E59CE9B0;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __73__PKApplyController_termsDataForFeatureWithIdentifier_format_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v3 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v6 = [v2 termsData];
    id v5 = [*(id *)(a1 + 32) termsDataFileName];
    (*(void (**)(uint64_t, id, void *, void))(v4 + 16))(v4, v6, v5, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_displayableErrorForError:showDetailedErrorFlow:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)submitActionIdentifier:(id)a3 termsIdentifiers:(id)a4 odiAttributesDictionary:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [(PKFeatureApplication *)self->_featureApplication applicationState];
  if (v14 > 0xF || ((1 << v14) & 0xFF6C) == 0)
  {
    if ([v12 count])
    {
      uint64_t v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v12;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Adding ODI submit application attributes %@", (uint8_t *)&v20, 0xCu);
      }

      id v18 = objc_alloc_init(MEMORY[0x1E4F5C980]);
      [v18 setAttributes:v12];
      [(PKODIServiceProviderAssessment *)self->_submitApplicationODISession updateAssessment:v18];
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F844B8]);
    [v19 setActionIdentifier:v10];
    [v19 setTermsIdentifiers:v11];
    [(PKApplyController *)self _performApplyWithRequest:v19 completion:v13];
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Cannot accept terms from this state - returning next view controller instead", (uint8_t *)&v20, 2u);
    }

    [(PKApplyController *)self nextViewControllerWithCompletion:v13];
  }
}

- (void)_handleResponseError:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (v6)
  {
    self->_didEncounterError = 1;
    id v9 = v6;
    id v7 = [(PKApplyController *)self _displayableErrorForError:a3 showDetailedErrorFlow:1];
    if (v7)
    {
      v9[2]();
    }
    else
    {
      id v8 = [(PKApplyController *)self _nextQueuedViewController];
      ((void (*)(void (**)(void), void *, void))v9[2])(v9, v8, 0);
    }
    id v6 = v9;
  }
}

- (void)_handleApplyResponse:(id)a3 originalFeatureApplication:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a6;
  unint64_t v14 = [v11 applicationState];
  if ([(PKFeatureApplication *)self->_featureApplication applicationState] == v14)
  {
    uint64_t v15 = [(PKFeatureApplication *)self->_featureApplication applicationStateReason];
    if (v15 == [v11 applicationStateReason])
    {
      if (v12)
      {
        [(PKApplyController *)self _handleResponseError:v12 completion:v13];
        goto LABEL_8;
      }
      if (v10)
      {
        self->_didEncounterError = 0;
        uint64_t v17 = [v10 featureApplication];
        featureApplication = self->_featureApplication;
        self->_featureApplication = v17;

        self->_requiredMetadataFields = [v10 requiredDeviceMetadataFields];
        self->_requiresODIAssessment = [v10 requiresODIAssessment];
        id v19 = [v10 actionIdentifiersRequiringAuthentication];
        actionIdentifiersRequiringAuthentication = self->_actionIdentifiersRequiringAuthentication;
        self->_actionIdentifiersRequiringAuthentication = v19;

        id v21 = [v10 account];

        if (v21)
        {
          uint64_t v22 = [v10 account];
          account = self->_account;
          self->_account = v22;
        }
        id v24 = [v10 nextStepInfo];
        id v25 = v24;
        if (v24)
        {
          os_signpost_id_t v26 = [v24 pages];
          id v27 = [v26 firstObject];

          id v28 = [v25 encryptionCertificates];
          if ([v28 count]) {
            objc_storeStrong((id *)&self->_encryptionCertificates, v28);
          }

          if (v27) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        id v25 = 0;
      }
      id v27 = objc_alloc_init(MEMORY[0x1E4F846A8]);
LABEL_19:
      if ([(PKFeatureApplication *)self->_featureApplication applicationStateReason] == 4)
      {
        [(PKApplyController *)self _queueStateReasonExplanationFlowWithPage:v27];
LABEL_25:
        int v30 = [(PKApplyController *)self _nextQueuedViewController];
        v13[2](v13, v30, 0);

LABEL_26:
        goto LABEL_8;
      }
      if ([(NSMutableArray *)self->_viewControllers count])
      {
        unint64_t viewControllerIndex = self->_viewControllerIndex;
        if (viewControllerIndex == [(NSMutableArray *)self->_viewControllers count])
        {
          [(NSMutableArray *)self->_viewControllers removeAllObjects];
          self->_unint64_t viewControllerIndex = 0;
        }
      }
      if ([(NSMutableArray *)self->_viewControllers count]) {
        goto LABEL_25;
      }
      switch([(PKFeatureApplication *)self->_featureApplication applicationState])
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 16:
          if (v25)
          {
            switch([v25 contextType])
            {
              case 0:
                [(PKApplyController *)self _queueFieldsFlowWithNextStepInfo:v25];
                goto LABEL_25;
              case 1:
                [(PKApplyController *)self _startCoreIDVSessionWithStepInfo:v25 completion:v13];
                goto LABEL_26;
              case 2:
                [(PKApplyController *)self _queueDocumentSubmissionWithNextStepInfo:v25];
                goto LABEL_25;
              case 3:
                [(PKApplyController *)self _queueApplicationTermsFlow];
                goto LABEL_25;
              case 4:
                [(PKApplyController *)self _queueActionFlowWithPage:v27];
                goto LABEL_25;
              case 5:
                [(PKApplyController *)self _queueInfoFlowWithNextWithPage:v27];
                goto LABEL_25;
              case 6:
                id v34 = (id)[(NSMutableArray *)self->_pagesToSubmit copy];
                [(NSMutableArray *)self->_pagesToSubmit removeAllObjects];
                id v43 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 134217984;
                  uint64_t v63 = [v34 count];
                  _os_log_impl(&dword_19F450000, v43, OS_LOG_TYPE_DEFAULT, "Submitting all %ld combined pages.", buf, 0xCu);
                }

                [(PKApplyController *)self _submitAllFieldPages:v34 completion:v13];
                goto LABEL_117;
              case 7:
                if ([(PKFeatureApplication *)self->_featureApplication applicationType] == 2
                  && ([v27 isEmptyPage] & 1) == 0)
                {
                  [(PKApplyController *)self _queueCompleteFlowWithNextPage:v27];
                  goto LABEL_25;
                }
                int v32 = PKLogFacilityTypeGetObject();
                if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_37;
                }
                *(_WORD *)long long buf = 0;
                id v33 = "Error: Application Open but next step complete/info - invalid state";
                break;
              case 8:
                if ([(PKFeatureApplication *)self->_featureApplication applicationType] != 2) {
                  goto LABEL_26;
                }
                [(PKApplyController *)self _startPaymentServiceListener];
                id v44 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
                paymentService = self->_paymentService;
                v59[0] = MEMORY[0x1E4F143A8];
                v59[1] = 3221225472;
                v59[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke;
                v59[3] = &unk_1E59D6B18;
                v59[4] = self;
                id v60 = v44;
                v61 = v13;
                id v34 = v44;
                [(PKPaymentService *)paymentService featureApplicationWithReferenceIdentifier:v34 completion:v59];
                [(PKApplyController *)self endApplyFlow];

                goto LABEL_117;
              case 9:
                [(PKApplyController *)self _queueApplicationVerificationWithNextStepInfo:v25];
                goto LABEL_25;
              case 10:
                [(PKApplyController *)self _queueConfirmInfoFlowWithPage:v27];
                goto LABEL_25;
              default:
                goto LABEL_26;
            }
          }
          else
          {
            int v32 = PKLogFacilityTypeGetObject();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_37;
            }
            *(_WORD *)long long buf = 0;
            id v33 = "Error: Response is missing information to continue for state";
          }
          goto LABEL_36;
        case 5:
          [(PKApplyController *)self _queueStateReasonExplanationFlowWithPage:v27];
          id v34 = [(PKApplyController *)self _nextQueuedViewController];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
          id v36 = WeakRetained;
          if (self->_installmentConfiguration && WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
          {
            id v37 = self->_featureApplication;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2;
            v56[3] = &unk_1E59CAD68;
            id v58 = v13;
            id v57 = v34;
            [v36 viewController:v57 canProceedWithInstallment:0 featureApplication:v37 completion:v56];
          }
          else
          {
            v13[2](v13, v34, 0);
          }
          goto LABEL_116;
        case 6:
          switch([(PKFeatureApplication *)self->_featureApplication feature])
          {
            case 0:
            case 4:
            case 5:
              if ([v25 contextType] != 7) {
                goto LABEL_26;
              }
              if (![v27 isEmptyPage])
              {
                [(PKApplyController *)self _queueCompleteFlowWithNextPage:v27];
                goto LABEL_57;
              }
              id v38 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_56;
              }
              *(_WORD *)long long buf = 0;
              id v39 = "Server did not deliver page and it is approved: terminal state reached, not queueing another view controller";
              goto LABEL_55;
            case 1:
              goto LABEL_38;
            case 2:
              long long v48 = [(PKFeatureApplication *)self->_featureApplication applicationOfferDetails];

              if (v48)
              {
                [(PKApplyController *)self _queueOfferFlowWithPage:v27];
                goto LABEL_25;
              }
              int v32 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_37;
              }
              *(_WORD *)long long buf = 0;
              id v33 = "Error: No offer object on feature application but application approved. Not able to procced";
              break;
            case 3:
              [(PKApplyController *)self endApplyFlow];
              [(PKApplyController *)self nextViewControllerWithCompletion:v13];
              goto LABEL_26;
            default:
              goto LABEL_26;
          }
          goto LABEL_36;
        case 7:
          uint64_t v40 = [v25 contextType];
          if ([v27 isEmptyPage] && v40 == 7)
          {
            id v38 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              id v39 = "Server did not deliver page in decline follow up flow which means it's terminal, not queueing anothe"
                    "r view controller";
LABEL_55:
              _os_log_impl(&dword_19F450000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
            }
LABEL_56:

LABEL_57:
            [(PKApplyController *)self endApplyFlow];
            goto LABEL_25;
          }
          if ([(PKFeatureApplication *)self->_featureApplication applicationType] == 2) {
            goto LABEL_70;
          }
          id v41 = [(PKFeatureApplication *)self->_featureApplication declineDetails];
          if (v41 || [(PKFeatureApplication *)self->_featureApplication feature] == 3)
          {
          }
          else if ([(PKFeatureApplication *)self->_featureApplication feature] != 5)
          {
            int v32 = PKLogFacilityTypeGetObject();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_37;
            }
            *(_WORD *)long long buf = 0;
            id v33 = "Error: No decline object on feature application but application declined. Not able to proceed";
LABEL_36:
            _os_log_impl(&dword_19F450000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
LABEL_37:

LABEL_38:
            [(PKApplyController *)self _queueGenericErrorViewController];
            goto LABEL_25;
          }
LABEL_70:
          id v34 = [v27 identifier];
          if ([v34 length])
          {
            if (v40 == 3)
            {
              id v49 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_19F450000, v49, OS_LOG_TYPE_DEFAULT, "Declined with terms, queue terms consent screen", buf, 2u);
              }

              [(PKApplyController *)self _queueProgramConsentFlowWithPage:v27];
LABEL_110:
              id v36 = [(PKApplyController *)self _nextQueuedViewController];
              id v50 = objc_loadWeakRetained((id *)&self->_setupDelegate);
              id v51 = v50;
              if (self->_installmentConfiguration && v50 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                v52 = self->_featureApplication;
                v53[0] = MEMORY[0x1E4F143A8];
                v53[1] = 3221225472;
                v53[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_128;
                v53[3] = &unk_1E59CAD68;
                id v55 = v13;
                id v54 = v36;
                [v51 viewController:v54 canProceedWithInstallment:0 featureApplication:v52 completion:v53];
              }
              else
              {
                v13[2](v13, v36, 0);
              }

LABEL_116:
LABEL_117:

              goto LABEL_26;
            }
            if (v40 == 4)
            {
              id v42 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_19F450000, v42, OS_LOG_TYPE_DEFAULT, "Declined with action, queue action screen", buf, 2u);
              }

              [(PKApplyController *)self _queueActionFlowWithPage:v27];
              goto LABEL_110;
            }
            uint64_t v46 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              long long v47 = "Declined with context identifier but no qualifying context type, queue regular decline screen";
              goto LABEL_108;
            }
          }
          else
          {
            uint64_t v46 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              long long v47 = "No context identifier, queue regular decline screen";
LABEL_108:
              _os_log_impl(&dword_19F450000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 2u);
            }
          }

          [(PKApplyController *)self _queueDeclinedFlowWithPage:v27];
          goto LABEL_110;
        case 8:
          if ([(PKFeatureApplication *)self->_featureApplication applicationType] != 2
            || ([v27 isEmptyPage] & 1) == 0)
          {
            [(PKApplyController *)self _queueAcceptedFlowWithPage:v27];
          }
          goto LABEL_25;
        case 9:
          if (self->_account)
          {
            [(PKApplyController *)self endApplyFlow];
            if ([(PKFeatureApplication *)self->_featureApplication feature] == 5) {
              v13[2](v13, 0, 0);
            }
            else {
              [(PKApplyController *)self _queuePassActivationFlowWithCompletion:v13];
            }
            goto LABEL_26;
          }
          int v32 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_37;
          }
          *(_WORD *)long long buf = 0;
          id v33 = "Error: Application state is booked but no account present";
          goto LABEL_36;
        case 10:
        case 11:
          if (v14 > 0x10 || ((1 << v14) & 0x1005E) == 0) {
            goto LABEL_33;
          }
          goto LABEL_57;
        case 12:
          [(PKApplyController *)self _queueExpiredFlowWithPage:v27];
          goto LABEL_25;
        case 13:
        case 14:
        case 15:
          unint64_t v31 = [(PKFeatureApplication *)self->_featureApplication applicationType];
          if (v31 > 6 || v31 == 2 && ([v27 isEmptyPage] & 1) != 0) {
            goto LABEL_25;
          }
LABEL_33:
          [(PKApplyController *)self _queueTerminalStateFlowWithPage:v27];
          goto LABEL_25;
        default:
          goto LABEL_26;
      }
    }
  }
  id v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Feature application updated during last request. Ignoring response and fetching an update", buf, 2u);
  }

  [(PKApplyController *)self nextViewControllerWithCompletion:v13];
LABEL_8:
}

void __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3 && ([v3 applicationState], PKFeatureApplicationStateIsValidToPresent()))
  {
    uint64_t v4 = [PKApplyControllerConfiguration alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    id v6 = [(PKApplyControllerConfiguration *)v4 initWithSetupDelegate:WeakRetained context:*(void *)(a1[4] + 272) provisioningController:*(void *)(a1[4] + 280)];

    [(PKApplyControllerConfiguration *)v6 setFeatureApplication:v10];
  }
  else
  {
    id v7 = [PKApplyControllerConfiguration alloc];
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 16));
    id v6 = [(PKApplyControllerConfiguration *)v7 initWithSetupDelegate:v8 context:*(void *)(a1[4] + 272) provisioningController:*(void *)(a1[4] + 280)];

    [(PKApplyControllerConfiguration *)v6 setApplicationType:3];
    [(PKApplyControllerConfiguration *)v6 setFeature:*(void *)(a1[4] + 216)];
    [(PKApplyControllerConfiguration *)v6 setReferenceIdentifier:a1[5]];
  }
  id v9 = [[PKApplyController alloc] initWithApplyConfiguration:v6];

  [(PKApplyController *)v9 setParentFlowController:a1[4]];
  [(PKApplyController *)v9 setAnalyticsExistingAccountType:*(void *)(a1[4] + 336)];
  [(PKApplyController *)v9 nextViewControllerWithCompletion:a1[6]];
}

void __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_3;
  v2[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_128(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2_129;
  v2[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __86__PKApplyController__handleApplyResponse_originalFeatureApplication_error_completion___block_invoke_2_129(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)reportAnalyticsDictionaryForPage:(id)a3 pageTag:(id)a4 additionalValues:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKApplyController *)self _defaultSubject];
  [(PKApplyController *)self reportAnalyticsDictionaryForPage:v10 subject:v11 pageTag:v9 error:0 additionalValues:v8];
}

- (void)reportAnalyticsError:(id)a3 page:(id)a4 pageTag:(id)a5 additionalValues:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PKApplyController *)self _defaultSubject];
  [(PKApplyController *)self reportAnalyticsDictionaryForPage:v12 subject:v14 pageTag:v11 error:v13 additionalValues:v10];
}

- (void)reportAnalyticsDictionaryForPage:(id)a3 subject:(id)a4 pageTag:(id)a5 additionalValues:(id)a6
{
}

- (void)reportAnalyticsDictionaryForPage:(id)a3 subject:(id)a4 pageTag:(id)a5 error:(id)a6 additionalValues:(id)a7
{
  id v28 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    id v12 = [(PKApplyController *)self _defaultSubject];
  }
  if (v13 && v12)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = PKFeatureIdentifierToString();
    [v16 setObject:v17 forKey:*MEMORY[0x1E4F864C8]];

    id v18 = PKFeatureApplicationTypeToString();
    [v16 setObject:v18 forKey:*MEMORY[0x1E4F85F50]];

    [v16 setObject:v13 forKey:*MEMORY[0x1E4F86730]];
    id v19 = [v28 identifier];

    if (v19)
    {
      int v20 = [v28 identifier];
      [v16 setObject:v20 forKey:*MEMORY[0x1E4F85F90]];
    }
    analyticsExistingAccountType = self->_analyticsExistingAccountType;
    if (analyticsExistingAccountType) {
      [v16 setObject:analyticsExistingAccountType forKey:*MEMORY[0x1E4F86310]];
    }
    if ([v15 count]) {
      [v16 addEntriesFromDictionary:v15];
    }
    if (v14)
    {
      uint64_t v22 = [v14 userInfo];
      id v23 = [v22 objectForKey:*MEMORY[0x1E4F28A50]];

      id v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", objc_msgSend(v23, "code"));
      id v25 = objc_msgSend(MEMORY[0x1E4F843E0], "analyticsErrorTextForError:", objc_msgSend(v23, "code"));
      [v16 setObject:v24 forKey:*MEMORY[0x1E4F862E0]];
      [v16 setObject:v25 forKey:*MEMORY[0x1E4F862E8]];
    }
    os_signpost_id_t v26 = (void *)MEMORY[0x1E4F843E0];
    id v27 = (void *)[v16 copy];
    [v26 subject:v12 sendEvent:v27];
  }
}

- (id)_defaultSubject
{
  return (id)[MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForFeature:self->_featureIdentifier];
}

- (void)accountUserInvitationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    paymentService = self->_paymentService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PKApplyController_accountUserInvitationsWithCompletion___block_invoke;
    v7[3] = &unk_1E59D6B40;
    id v8 = v4;
    [(PKPaymentService *)paymentService featureApplicationsForAccountUserInvitationWithCompletion:v7];
  }
}

uint64_t __58__PKApplyController_accountUserInvitationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)featureApplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    paymentService = self->_paymentService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__PKApplyController_featureApplicationsWithCompletion___block_invoke;
    v7[3] = &unk_1E59D6B40;
    id v8 = v4;
    [(PKPaymentService *)paymentService featureApplicationsForProvisioningWithCompletion:v7];
  }
}

uint64_t __55__PKApplyController_featureApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_prewarmODIAssessmentIfNecessary
{
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier == 5)
  {
    if (self->_applyTermsODISession) {
      return;
    }
    id v4 = objc_alloc(MEMORY[0x1E4F84820]);
    uint64_t v5 = *MEMORY[0x1E4F5CB98];
    id v6 = PKPassKitCoreBundle();
    id v7 = (PKODIServiceProviderAssessment *)[v4 initWithServiceProviderIdentifier:v5 locationBundle:v6];
    applyTermsODISession = self->_applyTermsODISession;
    self->_applyTermsODISession = v7;

    [(PKODIServiceProviderAssessment *)self->_applyTermsODISession startAssessment];
    id v9 = [MEMORY[0x1E4F843F0] sharedInstance];
    id v10 = [v9 appleAccountInformation];

    id v11 = [MEMORY[0x1E4F843F0] sharedInstance];
    id v12 = [v11 appleAccountInformation];
    id v13 = [v12 aaDSID];

    id v14 = [v10 firstName];
    id v15 = [v10 lastName];
    id v16 = [v10 primaryEmailAddress];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = v17;
    if (v13) {
      [v17 setObject:v13 forKey:*MEMORY[0x1E4F5CAA0]];
    }
    if (v14) {
      [v18 setObject:v14 forKey:*MEMORY[0x1E4F5CA98]];
    }
    if (v15) {
      [v18 setObject:v15 forKey:*MEMORY[0x1E4F5CAB8]];
    }
    if (v16) {
      [v18 setObject:v16 forKey:*MEMORY[0x1E4F5CA88]];
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F5C980]);
    [v19 setAttributes:v18];
    [(PKODIServiceProviderAssessment *)self->_applyTermsODISession updateAssessment:v19];

    unint64_t featureIdentifier = self->_featureIdentifier;
  }
  if (featureIdentifier == 3)
  {
    PKPassKitCoreBundle();
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!self->_createApplicationODISession)
    {
      int v20 = [(PKAccount *)self->_account payLaterDetails];
      id v21 = [v20 odiAttributes];

      id v22 = objc_alloc(MEMORY[0x1E4F84820]);
      id v23 = (PKODIServiceProviderAssessment *)[v22 initWithServiceProviderIdentifier:*MEMORY[0x1E4F5CAC8] locationBundle:v29];
      createApplicationODISession = self->_createApplicationODISession;
      self->_createApplicationODISession = v23;

      [(PKODIServiceProviderAssessment *)self->_createApplicationODISession startAssessment];
      [(PKODIServiceProviderAssessment *)self->_createApplicationODISession updateAssessment:v21];
    }
    if (!self->_submitApplicationODISession)
    {
      id v25 = (id)*MEMORY[0x1E4F5CAD0];
      if (self->_applicationType == 4)
      {
        id v26 = (id)*MEMORY[0x1E4F5CB70];

        id v25 = v26;
      }
      id v27 = (PKODIServiceProviderAssessment *)[objc_alloc(MEMORY[0x1E4F84820]) initWithServiceProviderIdentifier:v25 locationBundle:v29];
      submitApplicationODISession = self->_submitApplicationODISession;
      self->_submitApplicationODISession = v27;

      [(PKODIServiceProviderAssessment *)self->_submitApplicationODISession startAssessment];
    }
  }
}

- (void)_getODIAssessmentForSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke;
    block[3] = &unk_1E59CA938;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(workQueue, block);
  }
}

void __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (v2)
  {
    id v3 = a1[5];
    uint64_t v4 = *((void *)v3 + 25);
    if (v4)
    {
      uint64_t v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v4;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "There is already an ODISession inflight. This is an error %@", buf, 0xCu);
      }

      id v2 = a1[4];
      id v3 = a1[5];
    }
    objc_storeStrong((id *)v3 + 25, v2);
    objc_initWeak((id *)buf, a1[5]);
    [a1[4] computeAssessment];
    id v6 = a1[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_139;
    v7[3] = &unk_1E59D6B90;
    objc_copyWeak(&v10, (id *)buf);
    id v8 = a1[4];
    id v9 = a1[6];
    [v6 waitForAssessmentWithContinueBlock:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2;
    block[3] = &unk_1E59CAD18;
    id v12 = 0;
    id v13 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) serviceIdentifier];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "The ODI assessment for %@ is not defined.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_139(id *a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2_140;
  block[3] = &unk_1E59D6B68;
  objc_copyWeak(&v12, a1 + 6);
  id v9 = a1[4];
  id v6 = a1[5];
  id v10 = v5;
  id v11 = v6;
  char v13 = a3;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __60__PKApplyController__getODIAssessmentForSession_completion___block_invoke_2_140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (!v3) {
      goto LABEL_6;
    }
    id v4 = WeakRetained;
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  }
  else
  {
    id v4 = 0;
    [*(id *)(a1 + 32) provideSessionFeedback:1];
  }
  id WeakRetained = v4;
LABEL_6:
}

- (void)_sendODISessionFeedbackforInflightSessionIfNecessary
{
  inflightODISession = self->_inflightODISession;
  if (inflightODISession)
  {
    if (self->_endedApplyFlow)
    {
      uint64_t v4 = 1;
    }
    else
    {
      int v5 = [(PKODIServiceProviderAssessment *)inflightODISession currentAssessmentDidTimeout];
      inflightODISession = self->_inflightODISession;
      if (v5) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 0;
      }
    }
    [(PKODIServiceProviderAssessment *)inflightODISession provideSessionFeedback:v4];
    id v6 = self->_inflightODISession;
    self->_inflightODISession = 0;
  }
}

- (void)_setActionIdentifiersRequiringAuthentication:(id)a3
{
}

- (void)_startCoreIDVSessionWithStepInfo:(id)a3 completion:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_documentUploadType = 1;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v40 = a4;
  id v8 = objc_alloc_init(v7);
  uint64_t v9 = [(PKPaymentWebService *)self->_webService webServiceSessionMarker];
  if (v9) {
    [v8 setObject:v9 forKey:*MEMORY[0x1E4F5C200]];
  }
  id v42 = (void *)v9;
  id v10 = [(PKPaymentWebService *)self->_webService _appleAccountInformation];
  uint64_t v11 = [v10 authorizationHeader];

  if (v11) {
    [v8 setObject:v11 forKey:*MEMORY[0x1E4F5C208]];
  }
  uint64_t v12 = [(PKPaymentProvisioningController *)self->_provisioningController referrerIdentifier];
  if (v12) {
    [v8 setObject:v12 forKey:*MEMORY[0x1E4F87240]];
  }
  uint64_t v13 = [v6 conversationIdentifier];
  if (v13) {
    [v8 setObject:v13 forKey:*MEMORY[0x1E4F87238]];
  }
  id v14 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v37 = v14;
  if (!v14) {
    id v14 = (void *)MEMORY[0x1E4F84FC0];
  }
  [v14 secureElementIdentifiers];
  id v36 = v39 = (void *)v12;
  uint64_t v15 = [v36 componentsJoinedByString:@","];
  if (v15) {
    [v8 setObject:v15 forKey:*MEMORY[0x1E4F87248]];
  }
  id v35 = (void *)v15;
  id v41 = (void *)v11;
  uint64_t v16 = [v6 coreIDVServiceProviderName];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [(PKFeatureApplication *)self->_featureApplication coreIDVServiceProviderName];
  }
  id v19 = v18;
  id v38 = (void *)v13;

  id v43 = v6;
  int v20 = [v6 coreIDVTier];
  id v21 = PKCurrentRegion();
  id v22 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
  id v23 = [v22 URLByAppendingPathComponent:@"v1"];

  id v24 = [v23 URLByAppendingPathComponent:@"applications"];

  id v25 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
  id v26 = [v24 URLByAppendingPathComponent:v25];

  id v27 = [v26 absoluteString];
  id v28 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413314;
    id v45 = (DIVerificationSession *)v8;
    __int16 v46 = 2112;
    long long v47 = v27;
    __int16 v48 = 2112;
    id v49 = v19;
    __int16 v50 = 2112;
    id v51 = v20;
    __int16 v52 = 2112;
    uint64_t v53 = v21;
    _os_log_impl(&dword_19F450000, v28, OS_LOG_TYPE_DEFAULT, "Creating DIVerificationSession withHeaders:%@ serviceURL:%@ name:%@ tier:%@ region: %@", buf, 0x34u);
  }

  id v29 = objc_alloc(MEMORY[0x1E4F5C1F8]);
  int v30 = (void *)[v8 copy];
  unint64_t v31 = (void *)[v29 initWithName:v19 tier:v20 serviceUrl:v27 httpHeaders:v30];

  [v31 setRegionCode:v21];
  int v32 = (DIVerificationSession *)[objc_alloc(MEMORY[0x1E4F5C1F0]) initWithContext:v31];
  idVerificationSession = self->_idVerificationSession;
  self->_idVerificationSession = v32;

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = self->_idVerificationSession;
    *(_DWORD *)long long buf = 138412290;
    id v45 = v34;
    _os_log_impl(&dword_19F450000, v28, OS_LOG_TYPE_DEFAULT, "Created DIVerificationSession: %@", buf, 0xCu);
  }

  [(PKApplyController *)self _performCoreIDVNextStepWithPage:0 completion:v40];
}

- (void)_submitCoreIDVFieldsPage:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend(v6, "fieldModel", 0);
  id v10 = [v9 paymentSetupFields];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) attribute];
        if (v15) {
          [v8 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F5C1E0]);
    objc_msgSend(v16, "setPage:", objc_msgSend(v6, "pageNumber"));
    [v16 setAttributes:v8];
  }
  else
  {
    id v16 = 0;
  }
  [(PKApplyController *)self _performCoreIDVNextStepWithPage:v16 completion:v7];
}

- (void)_submitCoreIDVDocumentsPage:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v14)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F5C170]);
    [v18 setCurrentValue:v14];
    [v18 setFormat:2];
    [v17 addObject:v18];
  }
  if (v15)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F5C170]);
    [v19 setCurrentValue:v15];
    [v19 setFormat:2];
    [v17 addObject:v19];
  }
  long long v20 = [v13 documentAttribute];
  [v20 setDocType:1];
  id v21 = (void *)[v17 copy];
  [v20 setCurrentValue:v21];

  if (v20)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F5C1E0]);
    objc_msgSend(v22, "setPage:", objc_msgSend(v12, "pageNumber"));
    v24[0] = v20;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v22 setAttributes:v23];
  }
  else
  {
    id v22 = 0;
  }
  [(PKApplyController *)self _performCoreIDVNextStepWithPage:v22 completion:v16];
}

- (void)_performCoreIDVNextStepWithPage:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_idVerificationSession)
  {
    uint64_t v9 = mach_absolute_time();
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 description];
      *(_DWORD *)long long buf = 138412290;
      long long v20 = v11;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Calling performVerificationWithAttributes page: %@", buf, 0xCu);
    }
    idVerificationSession = self->_idVerificationSession;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_156;
    v14[3] = &unk_1E59D6BB8;
    uint64_t v16 = v9;
    v14[4] = self;
    id v15 = v8;
    [(DIVerificationSession *)idVerificationSession performVerificationWithAttributes:v6 completion:v14];
    id v13 = v15;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke;
    block[3] = &unk_1E59CAA98;
    id v18 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v13 = v18;
  }
}

uint64_t __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error: No coreIDV session", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_156(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  mach_absolute_time();
  PKSecondsFromMachTimeInterval();
  uint64_t v10 = v9;
  uint64_t v11 = *MEMORY[0x1E4F85CF0];
  id v36 = @"duration";
  id v12 = objc_msgSend(NSNumber, "numberWithDouble:");
  v37[0] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  MEMORY[0x1A6220EC0](v11, v13);

  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v7 description];
    *(_DWORD *)long long buf = 134219010;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    unint64_t v31 = v15;
    __int16 v32 = 2048;
    uint64_t v33 = a3;
    __int16 v34 = 2048;
    uint64_t v35 = [v7 page];
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Callback from performVerificationWithAttributes timetaken(seconds): %f error: %@ attributes: %@ totalPageCount: %lu page: %lu", buf, 0x34u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_161;
  block[3] = &unk_1E59D2468;
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(a1 + 40);
  id v21 = v8;
  uint64_t v22 = v16;
  id v23 = v7;
  id v24 = v17;
  uint64_t v25 = a3;
  id v18 = v7;
  id v19 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PKApplyController__performCoreIDVNextStepWithPage_completion___block_invoke_161(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error: performVerification failed", buf, 2u);
    }

    return [*(id *)(a1 + 40) _handleResponseError:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    return objc_msgSend(v4, "_handleCoreIDVPage:totalPageCount:error:completion:");
  }
  else
  {
    int v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "No attributes performing coreIDV share", v6, 2u);
    }

    return [*(id *)(a1 + 40) _performCoreIDVShareWithCompletion:*(void *)(a1 + 56)];
  }
}

- (void)_handleCoreIDVPage:(id)a3 totalPageCount:(int64_t)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Preparing attributes for display", buf, 2u);
  }

  id v13 = [v9 attributes];
  uint64_t v14 = [v13 count];
  if (v14)
  {
    uint64_t v15 = v14;
    id v49 = self;
    id v50 = v11;
    id v51 = v10;
    __int16 v52 = v9;
    uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    __int16 v48 = v13;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v75 count:16];
    id v55 = v16;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v68 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v16 addObject:v22];
          }
          else
          {
            id v23 = [MEMORY[0x1E4F84C50] paymentSetupFieldWithDIAttribute:v22];
            id v24 = [v23 identifier];
            uint64_t v25 = v24;
            if (v23 && [v24 length])
            {
              [v53 addObject:v23];
            }
            else
            {
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v74 = v22;
                _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Could not generate field with malformed attribute: %@", buf, 0xCu);
              }
            }
            uint64_t v16 = v55;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v67 objects:v75 count:16];
      }
      while (v19);
    }

    if ([v16 count])
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      obuint64_t j = v16;
      uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v57)
      {
        uint64_t v56 = *(void *)v64;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v64 != v56) {
              objc_enumerationMutation(obj);
            }
            uint64_t v58 = v27;
            __int16 v28 = *(void **)(*((void *)&v63 + 1) + 8 * v27);
            char v29 = objc_msgSend(v28, "acceptableDocTypes", v48);
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            __int16 v30 = [v28 acceptableDocs];
            uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v60;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v60 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v35 = [*(id *)(*((void *)&v59 + 1) + 8 * j) countryCode];
                  if ((v29 & 2) != 0)
                  {
                    id v36 = objc_alloc_init(MEMORY[0x1E4F846A0]);
                    [v36 setCountryCode:v35];
                    [v36 setDocumentType:1];
                    [v36 setDocumentAttribute:v28];
                    [v26 addObject:v36];
                  }
                  if ((v29 & 4) != 0)
                  {
                    id v37 = objc_alloc_init(MEMORY[0x1E4F846A0]);
                    [v37 setCountryCode:v35];
                    [v37 setDocumentType:2];
                    [v37 setDocumentAttribute:v28];
                    [v26 addObject:v37];
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v59 objects:v71 count:16];
              }
              while (v32);
            }

            uint64_t v27 = v58 + 1;
          }
          while (v58 + 1 != v57);
          uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v57);
      }

      id v38 = objc_alloc_init(MEMORY[0x1E4F84480]);
      id v9 = v52;
      objc_msgSend(v38, "setPageNumber:", objc_msgSend(v52, "page"));
      [v38 setAcceptableDocuments:v26];
      id v39 = [PKApplyDocumentSubmissionController alloc];
      id v40 = v49;
      id WeakRetained = objc_loadWeakRetained((id *)&v49->_setupDelegate);
      id v42 = [(PKApplyDocumentSubmissionController *)v39 initWithController:v49 setupDelegate:WeakRetained documentPage:v38];

      id v43 = [(PKApplyDocumentSubmissionController *)v42 nextViewController];
      [(NSMutableArray *)v49->_viewControllers addObject:v43];

      id v13 = v48;
      id v44 = v53;
      uint64_t v16 = v55;
    }
    else
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F84498]);
      id v9 = v52;
      objc_msgSend(v26, "setPageNumber:", objc_msgSend(v52, "page"));
      id v45 = [v52 title];
      [v26 setTitle:v45];

      __int16 v46 = [v52 subTitle];
      [v26 setSubtitle:v46];

      id v44 = v53;
      id v38 = (id)[objc_alloc(MEMORY[0x1E4F84C88]) initWithPaymentSetupFields:v53];
      [v26 setFieldModel:v38];
      id v40 = v49;
      id v42 = [(PKApplyController *)v49 _fieldsViewControllerForPage:v26];
      [(NSMutableArray *)v49->_viewControllers addObject:v42];
    }

    long long v47 = [(PKApplyController *)v40 _nextQueuedViewController];
    id v11 = v50;
    (*((void (**)(id, void *, void))v50 + 2))(v50, v47, 0);

    id v10 = v51;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Error: no attributes to display", buf, 2u);
    }

    [(PKApplyController *)self _handleResponseError:v10 completion:v11];
  }
}

- (void)_performCoreIDVShareWithCompletion:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (self->_idVerificationSession)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = PKRequestIDHeaderValue();
    if ([v7 length])
    {
      uint64_t v19 = @"x-request-id";
      v20[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v6 setObject:v8 forKey:*MEMORY[0x1E4F5C210]];
    }
    uint64_t v9 = mach_absolute_time();
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Calling shareVerificationResultWithOptions withOptions: %@", buf, 0xCu);
    }

    idVerificationSession = self->_idVerificationSession;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_172;
    v12[3] = &unk_1E59D6BE0;
    uint64_t v14 = v9;
    void v12[4] = self;
    id v13 = v5;
    [(DIVerificationSession *)idVerificationSession shareVerificationResultWithOptions:v6 completion:v12];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke;
    block[3] = &unk_1E59CAA98;
    id v16 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = v16;
  }
}

uint64_t __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error: No coreIDV session", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  mach_absolute_time();
  PKSecondsFromMachTimeInterval();
  uint64_t v8 = v7;
  uint64_t v9 = *MEMORY[0x1E4F85CE8];
  uint64_t v27 = @"duration";
  id v10 = objc_msgSend(NSNumber, "numberWithDouble:");
  v28[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  MEMORY[0x1A6220EC0](v9, v11);

  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Callback from shareVerificationResultWithOptions timeTaken(seconds): %f withResultingIdentifier: %@ error: %@", buf, 0x20u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_173;
  v16[3] = &unk_1E59CB728;
  id v17 = v5;
  id v18 = v6;
  id v13 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v13;
  id v14 = v6;
  id v15 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __56__PKApplyController__performCoreIDVShareWithCompletion___block_invoke_173(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) UUIDString];
  if ([v2 length] && !*(void *)(a1 + 40))
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Requesting next steps from the server", v8, 2u);
    }

    [*(id *)(a1 + 48) _invalidateIDVSession];
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = 0;

    objc_storeStrong((id *)(*(void *)(a1 + 48) + 104), v2);
    id v7 = objc_alloc_init(MEMORY[0x1E4F844B8]);
    [*(id *)(a1 + 48) _performApplyWithRequest:v7 completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error: No valid nextStepToken found", buf, 2u);
    }

    [*(id *)(a1 + 48) _handleResponseError:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
}

- (void)_submitDocumentsPage:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = (objc_class *)MEMORY[0x1E4F844C8];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_alloc_init(v12);
  id v17 = [(PKFeatureApplication *)self->_featureApplication applicationIdentifier];
  [v16 setApplicationIdentifier:v17];

  [v16 setFeatureIdentifier:self->_featureIdentifier];
  id v18 = [(PKFeatureApplication *)self->_featureApplication applicationBaseURL];
  [v16 setBaseURL:v18];

  [v16 setFrontImageData:v14];
  [v16 setBackImageData:v13];

  uint64_t v19 = [v15 countryCode];
  [v16 setDocumentCountryCode:v19];

  uint64_t v20 = [v15 documentType];
  [v16 setDocumentType:v20];
  [v16 setCertificates:self->_encryptionCertificates];
  [v16 setChannel:self->_channel];
  ++self->_runningApplicationUpdates;
  id v21 = (void *)[(PKFeatureApplication *)self->_featureApplication copy];
  webService = self->_webService;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke;
  v25[3] = &unk_1E59D69B0;
  v25[4] = self;
  id v26 = v21;
  id v27 = v11;
  id v23 = v11;
  id v24 = v21;
  [(PKPaymentWebService *)webService submitDocumentsWithRequest:v16 completion:v25];
}

void __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_2;
  block[3] = &unk_1E59CF3E0;
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v7;
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_3;
  v5[3] = &unk_1E59CAC08;
  void v5[4] = v1;
  id v6 = *(id *)(a1 + 64);
  [v1 _handleApplyResponse:v2 originalFeatureApplication:v3 error:v4 completion:v5];
}

uint64_t __99__PKApplyController__submitDocumentsPage_selectedDocument_frontImageData_backImageData_completion___block_invoke_3(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 160);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_submitDocumentPageWithCoreIDVImageUpload:(id)a3 selectedDocument:(id)a4 frontImageData:(id)a5 backImageData:(id)a6 completion:(id)a7
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v26 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  __int16 v25 = v13;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F5C1E8]) initWithData:v13 assetType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F5C1E8]) initWithData:v14 assetType:1];
  v51[0] = v16;
  v51[1] = v17;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  id v18 = [v12 imageCaptureEncryptionCertificates];
  uint64_t v19 = [v12 imageCaptureEncryptionVersion];
  uint64_t v20 = (void *)v19;
  if (!v18)
  {
    id v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Error: coreIDV docment CK update requires certifiates.", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v19)
  {
    id v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Error: coreIDV docment CK update requires encryptionVersion.", buf, 2u);
    }
LABEL_9:

    [(PKApplyController *)self _handleResponseError:0 completion:v15];
    goto LABEL_10;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F84518]);
  *(void *)long long buf = 0;
  __int16 v46 = buf;
  uint64_t v47 = 0x3032000000;
  __int16 v48 = __Block_byref_object_copy__31;
  id v49 = __Block_byref_object_dispose__31;
  id v50 = objc_alloc_init(MEMORY[0x1E4F844C8]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke;
  v38[3] = &unk_1E59D6C58;
  id v39 = v18;
  id v40 = v20;
  id v44 = buf;
  id v41 = v27;
  id v42 = self;
  id v43 = v26;
  [v21 addOperation:v38];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  void v37[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_183;
  v37[3] = &unk_1E59CDD98;
  v37[4] = self;
  v37[5] = buf;
  [v21 addOperation:v37];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__31;
  v35[4] = __Block_byref_object_dispose__31;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__31;
  v33[4] = __Block_byref_object_dispose__31;
  id v34 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3_185;
  v32[3] = &unk_1E59CC878;
  v32[4] = self;
  void v32[5] = buf;
  v32[6] = v35;
  v32[7] = v33;
  [v21 addOperation:v32];
  uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_7;
  v28[3] = &unk_1E59D67D0;
  id v29 = v15;
  __int16 v30 = v35;
  uint64_t v31 = v33;
  id v23 = (id)[v21 evaluateWithInput:v22 completion:v28];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(buf, 8);
LABEL_10:
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5C1A0]) initWithCertificateChain:a1[4] recipient:@"ivs" encryptionVersion:a1[5]];
  id v9 = objc_alloc_init(MEMORY[0x1E4F5C198]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2;
  v15[3] = &unk_1E59D6C30;
  id v10 = (void *)a1[8];
  uint64_t v12 = a1[6];
  uint64_t v11 = a1[7];
  uint64_t v19 = a1[9];
  void v15[4] = v11;
  id v17 = v6;
  id v18 = v7;
  id v16 = v10;
  id v13 = v6;
  id v14 = v7;
  [v9 uploadDocData:v12 uploadSettings:v8 completion:v15];
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3;
  block[3] = &unk_1E59D6C08;
  id v12 = v6;
  id v13 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v14 = v7;
  id v15 = v8;
  id v17 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error: coreIDV CK document uploaded failed %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (!*(void *)(a1 + 40))
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Error: coreIDV CK document uploaded has no data", (uint8_t *)&v12, 2u);
    }
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v6 = [*(id *)(*(void *)(a1 + 48) + 264) applicationIdentifier];
  [v5 setApplicationIdentifier:v6];

  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setFeatureIdentifier:*(void *)(*(void *)(a1 + 48) + 216)];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v8 = [*(id *)(*(void *)(a1 + 48) + 264) applicationBaseURL];
  [v7 setBaseURL:v8];

  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setUploadedDocumentData:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setCertificates:*(void *)(*(void *)(a1 + 48) + 56)];
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v10 = [*(id *)(a1 + 56) countryCode];
  [v9 setDocumentCountryCode:v10];

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setDocumentType:", objc_msgSend(*(id *)(a1 + 56), "documentType"));
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setChannel:*(void *)(*(void *)(a1 + 48) + 240)];
  return (*(uint64_t (**)(void, void, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 64), *(void *)(a1 + 32) != 0);
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_183(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 208))
  {
    uint64_t v10 = *(void *)(v9 + 176);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2_184;
    v11[3] = &unk_1E59D6708;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v7;
    id v12 = v6;
    [(id)v9 _getODIAssessmentForSession:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_2_184(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOdiAssessment:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_3_185(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  ++*(void *)(*(void *)(a1 + 32) + 160);
  id v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 264) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 8);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_4;
  v15[3] = &unk_1E59D6780;
  void v15[4] = v9;
  id v16 = v8;
  long long v19 = *(_OWORD *)(a1 + 48);
  id v17 = v6;
  id v18 = v7;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  [v10 submitDocumentsWithRequest:v11 completion:v15];
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_5;
  block[3] = &unk_1E59D6758;
  id v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v7;
  id v15 = v6;
  uint64_t v18 = *(void *)(a1 + 72);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v11;
  long long v17 = v11;
  id v16 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendODISessionFeedbackforInflightSessionIfNecessary];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_6;
  v9[3] = &unk_1E59D6730;
  uint64_t v6 = *(void *)(a1 + 88);
  void v9[4] = v2;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 72);
  id v7 = (id)v8;
  long long v11 = v8;
  id v10 = *(id *)(a1 + 64);
  [v2 _handleApplyResponse:v3 originalFeatureApplication:v4 error:v5 completion:v9];
}

void __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_6(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  --*(void *)(a1[4] + 160);
  uint64_t v7 = *(void *)(a1[7] + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[8] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __120__PKApplyController__submitDocumentPageWithCoreIDVImageUpload_selectedDocument_frontImageData_backImageData_completion___block_invoke_7(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)_queueDocumentSubmissionWithNextStepInfo:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Preparing documention submission.", buf, 2u);
  }

  id v6 = [v4 pages];
  uint64_t v7 = [v6 firstObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v8 = v7) != 0)
  {
    uint64_t v9 = v8;
    int v10 = [v8 requiresCoreIDVImageCaptureUpload];
    unint64_t v11 = 2;
    if (!v10) {
      unint64_t v11 = 3;
    }
    self->_documentUploadType = v11;
    id v12 = [PKApplyDocumentSubmissionController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    id v14 = [(PKApplyDocumentSubmissionController *)v12 initWithController:self setupDelegate:WeakRetained documentPage:v9];

    id v15 = [(PKApplyDocumentSubmissionController *)v14 nextViewController];
    [(NSMutableArray *)self->_viewControllers addObject:v15];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Error: No document submission page defined.", v16, 2u);
    }

    [(PKApplyController *)self _queueGenericErrorViewController];
  }
}

- (void)_invalidateIDVSession
{
}

- (void)_queueInfoFlowWithNextWithPage:(id)a3
{
  id v4 = a3;
  id v5 = [PKApplyExplanationViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  uint64_t v7 = [(PKApplyExplanationViewController *)v5 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v4];

  [(NSMutableArray *)self->_viewControllers addObject:v7];
}

- (void)_queueCompleteFlowWithNextPage:(id)a3
{
  id v4 = a3;
  id v5 = [PKApplyExplanationViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  uint64_t v7 = [(PKApplyExplanationViewController *)v5 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v4];

  [(PKExplanationViewController *)v7 setShowDoneButton:0];
  [(PKExplanationViewController *)v7 setShowCancelButton:0];
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __52__PKApplyController__queueCompleteFlowWithNextPage___block_invoke;
  unint64_t v11 = &unk_1E59CCC50;
  objc_copyWeak(&v12, &location);
  [(PKApplyExplanationViewController *)v7 setContinueAction:&v8];
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v7, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

BOOL __52__PKApplyController__queueCompleteFlowWithNextPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained endApplyFlow];
  }

  return v2 != 0;
}

- (void)_queueFieldsFlowWithNextStepInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [a3 pages];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          unint64_t v11 = [(PKApplyController *)self _fieldsViewControllerForPage:v10];
          [(NSMutableArray *)self->_viewControllers addObject:v11];
        }
        else
        {
          unint64_t v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v12 = 0;
            _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected type of page found", v12, 2u);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)_fieldsViewControllerForPage:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_applicationType == 4 && self->_updateUserInfoSubType == 4)
  {
    uint64_t v5 = [PKApplyAddBeneficiaryViewController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    uint64_t v7 = [(PKApplyAddBeneficiaryViewController *)v5 initWithController:self setupDelegate:WeakRetained pageContent:v4];

    goto LABEL_23;
  }
  unint64_t featureIdentifier = self->_featureIdentifier;
  uint64_t v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  id v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v11 = [v4 fieldModel];
  id v12 = [v11 paymentSetupFields];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v13)
  {

LABEL_21:
    id v26 = [PKApplyFieldsViewController alloc];
    id v24 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    uint64_t v25 = [(PKApplyFieldsViewController *)v26 initWithController:self setupDelegate:v24 applyPage:v4];
    goto LABEL_22;
  }
  uint64_t v14 = v13;
  __int16 v28 = self;
  id v29 = v4;
  char v15 = 0;
  uint64_t v16 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v31 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      long long v19 = objc_msgSend(v18, "dateFieldObject", v28, v29);
      uint64_t v20 = [v18 pickerFieldObject];
      id v21 = v20;
      if (v19) {
        BOOL v22 = featureIdentifier == 2;
      }
      else {
        BOOL v22 = 0;
      }
      if (v22)
      {
        [v19 setCalendar:v10];
        [v19 setLocale:v9];
      }
      else if (v20)
      {
        v15 |= [v20 pickerType] != 0;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v14);

  self = v28;
  id v4 = v29;
  if ((v15 & 1) == 0) {
    goto LABEL_21;
  }
  id v23 = [PKApplyFieldsCollectionViewController alloc];
  id v24 = objc_loadWeakRetained((id *)&v28->_setupDelegate);
  uint64_t v25 = [(PKApplyCollectionViewController *)v23 initWithController:v28 setupDelegate:v24 context:v28->_context applyPage:v29];
LABEL_22:
  uint64_t v7 = (PKApplyAddBeneficiaryViewController *)v25;

LABEL_23:

  return v7;
}

- (void)_queueOfferFlowWithPage:(id)a3
{
  id v48 = a3;
  id v4 = [(PKApplyController *)self preferredLanguage];
  uint64_t v5 = [(PKFeatureApplication *)self->_featureApplication applicationOfferDetails];
  installmentConfiguration = self->_installmentConfiguration;
  uint64_t v7 = [v5 creditLimit];
  int v8 = [(PKFeatureApplication *)self->_featureApplication hasSufficientOTBForInstallmentConfiguration:self->_installmentConfiguration];
  uint64_t v9 = [v5 detailsInfo];
  id v10 = [v5 aprForPurchase];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v11 setNumberStyle:3];
    if ((objc_msgSend(v10, "pk_isIntegralNumber") & 1) == 0) {
      [v11 setMinimumFractionDigits:2];
    }
    id v12 = [v11 stringFromNumber:v10];

    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    id v12 = @"-";
    if (v9)
    {
LABEL_5:
      id v13 = objc_alloc_init(MEMORY[0x1E4F846A8]);

      uint64_t v14 = [v9 title];
      [v13 setTitle:v14];

      char v15 = [v9 body];
      [v13 setBody:v15];

      uint64_t v16 = [v9 primaryActionTitle];
      [v13 setPrimaryActionTitle:v16];

      long long v17 = [v9 primaryActionIdentifier];
      [v13 setPrimaryActionIdentifier:v17];

      uint64_t v18 = [v9 secondaryActionTitle];
      [v13 setSecondaryActionTitle:v18];

      long long v19 = [v9 secondaryActionIdentifier];
      [v13 setSecondaryActionIdentifier:v19];

      [v13 setLayout:0];
      uint64_t v20 = [v9 heroImageURL];
      [v13 setHeroImageURL:v20];
      id v48 = v13;
LABEL_6:

      goto LABEL_33;
    }
  }
  id v21 = [v48 title];

  if (!v21)
  {
    if (installmentConfiguration)
    {
      if (v8) {
        BOOL v22 = @"INSTALLMENT_APPLY_OFFER_APPROVED";
      }
      else {
        BOOL v22 = @"INSTALLMENT_APPLY_OFFER_APPROVED_INSUFFICIENT_TITLE";
      }
      uint64_t v23 = PKLocalizedBeekmanStringWithLocalization(&v22->isa, v4);
    }
    else
    {
      uint64_t v23 = PKLocalizedApplyFeatureString();
    }
    id v24 = (void *)v23;
    [v48 setTitle:v23];
  }
  uint64_t v25 = [v48 subtitle];
  if (!v25)
  {
    [(PKApplyController *)self context];
    if (PKPaymentSetupContextIsMerchantApp())
    {
      if (installmentConfiguration) {
        goto LABEL_22;
      }
      uint64_t v25 = PKLocalizedApplyFeatureString();
      [v48 setSubtitle:v25];
    }
    else
    {
      uint64_t v25 = 0;
    }
  }

LABEL_22:
  id v26 = [v48 primaryActionTitle];

  if (!v26)
  {
    id v27 = PKLocalizedApplyFeatureString();
    [v48 setPrimaryActionTitle:v27];
  }
  __int16 v28 = [v48 secondaryActionTitle];

  if (!v28)
  {
    if (installmentConfiguration) {
      int v29 = v8;
    }
    else {
      int v29 = 1;
    }
    if (v29 == 1) {
      PKLocalizedApplyFeatureString();
    }
    else {
    long long v30 = PKLocalizedBeekmanStringWithLocalization(&cfstr_InstallmentApp_1.isa, v4);
    }
    [v48 setSecondaryActionTitle:v30];
  }
  long long v31 = [v48 body];

  if (!v31)
  {
    if (installmentConfiguration)
    {
      uint64_t v47 = v7;
      id v36 = [(PKPaymentInstallmentConfiguration *)self->_installmentConfiguration installmentItems];
      id v37 = [v36 firstObject];
      uint64_t v38 = [v37 installmentItemType];

      if (v8)
      {
        id v39 = [(PKApplyController *)self _formatStringSuffixForItemType:v38];
        uint64_t v20 = [@"INSTALLMENT_APPLY_OFFER_APPROVED_SUBTITLE" stringByAppendingString:v39];

        __int16 v46 = [v5 currencyCode];
        id v40 = PKCurrencyAmountCreate(v47, v46);
        id v41 = [v40 formattedStringValue];
        PKLocalizedBeekmanStringWithLocalization((NSString *)v20, v4, &stru_1EF1B5770.isa, v12, v41);
      }
      else
      {
        int v42 = [(PKPaymentInstallmentConfiguration *)self->_installmentConfiguration isInStorePurchase];
        id v43 = [(PKApplyController *)self _formatStringSuffixForItemType:v38];
        if (v42) {
          id v44 = @"INSTALLMENT_APPLY_OFFER_APPROVED_INSUFFICIENT_CREDIT_IN_STORE_SUBTITLE";
        }
        else {
          id v44 = @"INSTALLMENT_APPLY_OFFER_APPROVED_INSUFFICIENT_CREDIT_SUBTITLE";
        }
        uint64_t v20 = [(__CFString *)v44 stringByAppendingString:v43];

        __int16 v46 = [v5 currencyCode];
        id v40 = PKCurrencyAmountCreate(v47, v46);
        id v41 = [v40 formattedStringValue];
        PKLocalizedBeekmanStringWithLocalization((NSString *)v20, v4, &stru_1EF1B5770.isa, v41, v12);
      id v45 = };
      [v48 setBody:v45];

      uint64_t v7 = v47;
    }
    else
    {
      uint64_t v20 = PKLocalizedApplyFeatureString();
      [v48 setBody:v20];
    }
    goto LABEL_6;
  }
LABEL_33:
  long long v32 = [PKApplyOfferViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v34 = [(PKApplyOfferViewController *)v32 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v48];

  uint64_t v35 = [(PKApplyController *)self loadHeroImageFromApplyExperiment];
  if (v35) {
    [(PKApplyOfferViewController *)v34 setHeroImage:v35];
  }
  [(NSMutableArray *)self->_viewControllers addObject:v34];
}

- (id)_formatStringSuffixForItemType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"_GENERIC";
  }
  else {
    return off_1E59D6CE8[a3];
  }
}

- (void)_queueApplicationVerificationWithNextStepInfo:(id)a3
{
  id v4 = [a3 pages];
  uint64_t v5 = [v4 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v6 verificationType];
      switch(v8)
      {
        case 0:
          char v15 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v16 = 0;
            _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Error: Verification page has unknown verification type.", v16, 2u);
          }

          [(PKApplyController *)self _queueGenericErrorViewController];
          goto LABEL_17;
        case 2:
          id v13 = [PKApplyVerificationTrialDepositViewController alloc];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
          uint64_t v11 = [(PKApplyVerificationTrialDepositViewController *)v13 initWithController:self setupDelegate:WeakRetained verificationPage:v7];
          break;
        case 1:
          uint64_t v9 = [PKApplyVerificationSMSOTPViewController alloc];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
          uint64_t v11 = [(PKApplyVerificationSMSOTPViewController *)v9 initWithController:self setupDelegate:WeakRetained context:self->_context verificationPage:v7];
          break;
        default:
          uint64_t v14 = 0;
          goto LABEL_16;
      }
      uint64_t v14 = (void *)v11;

LABEL_16:
      [(NSMutableArray *)self->_viewControllers addObject:v14];

LABEL_17:
      goto LABEL_18;
    }
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Error: No verification page defined.", buf, 2u);
  }

  [(PKApplyController *)self _queueGenericErrorViewController];
LABEL_18:
}

- (void)_queueApplicationTermsFlow
{
  uint64_t v3 = [PKApplyTermsAndConditionsViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  int64_t context = self->_context;
  id v6 = [(PKFeatureApplication *)self->_featureApplication applicationTermsIdentifier];
  uint64_t v7 = [(PKApplyTermsAndConditionsViewController *)v3 initWithController:self setupDelegate:WeakRetained context:context termsIdentifier:v6];

  [(NSMutableArray *)self->_viewControllers addObject:v7];
}

- (void)_queueStateReasonExplanationFlowWithPage:(id)a3
{
  id v59 = a3;
  id v4 = [(PKApplyController *)self preferredLanguage];
  switch([(PKFeatureApplication *)self->_featureApplication applicationStateReason])
  {
    case 3:
      uint64_t v5 = [v59 title];

      if (!v5)
      {
        id v6 = PKLocalizedApplyFeatureString();
        [v59 setTitle:v6];
      }
      uint64_t v7 = [v59 subtitle];

      if (!v7)
      {
        uint64_t v8 = PKLocalizedApplyFeatureString();
        [v59 setSubtitle:v8];
      }
      uint64_t v9 = [v59 primaryActionTitle];

      if (!v9) {
        goto LABEL_49;
      }
      goto LABEL_56;
    case 4:
      id v10 = [v59 title];

      if (!v10)
      {
        uint64_t v11 = PKLocalizedApplyFeatureString();
        [v59 setTitle:v11];
      }
      id v12 = [v59 subtitle];

      if (!v12)
      {
        id v13 = PKLocalizedApplyFeatureString();
        [v59 setSubtitle:v13];
      }
      uint64_t v14 = [v59 primaryActionTitle];

      if (v14) {
        goto LABEL_20;
      }
      goto LABEL_19;
    case 5:
      char v15 = [v59 title];

      if (!v15)
      {
        uint64_t v16 = PKLocalizedApplyFeatureString();
        [v59 setTitle:v16];
      }
      long long v17 = [v59 subtitle];

      if (!v17)
      {
        uint64_t v18 = PKLocalizedApplyFeatureString();
        [v59 setSubtitle:v18];
      }
      long long v19 = [v59 primaryActionTitle];

      if (!v19)
      {
LABEL_19:
        uint64_t v20 = PKLocalizedApplyFeatureString();
        [v59 setPrimaryActionTitle:v20];
      }
LABEL_20:
      id v21 = [v59 learnMore];
      BOOL v22 = [v21 buttonTitle];

      if (!v22)
      {
        uint64_t v23 = PKLocalizedApplyFeatureString();
        [v21 setButtonTitle:v23];
      }
      id v24 = [v21 title];

      if (!v24)
      {
        uint64_t v25 = PKLocalizedApplyFeatureString();
        [v21 setTitle:v25];
      }
      id v26 = [v21 body];

      if (!v26) {
        goto LABEL_37;
      }
      goto LABEL_55;
    case 6:
      id v27 = [v59 title];

      if (!v27)
      {
        __int16 v28 = PKLocalizedApplyFeatureString();
        [v59 setTitle:v28];
      }
      int v29 = [v59 subtitle];

      if (!v29)
      {
        long long v30 = PKLocalizedApplyFeatureString();
        [v59 setSubtitle:v30];
      }
      long long v31 = [v59 primaryActionTitle];

      if (!v31)
      {
        long long v32 = PKLocalizedApplyFeatureString();
        [v59 setPrimaryActionTitle:v32];
      }
      id v21 = [v59 learnMore];
      long long v33 = [v21 buttonTitle];

      if (!v33)
      {
        id v34 = PKLocalizedApplyFeatureString();
        [v21 setButtonTitle:v34];
      }
      uint64_t v35 = [v21 title];

      if (!v35)
      {
        id v36 = PKLocalizedApplyFeatureString();
        [v21 setTitle:v36];
      }
      id v37 = [v21 body];

      if (!v37)
      {
LABEL_37:
        uint64_t v38 = PKLocalizedApplyFeatureString();
        [v21 setBody:v38];
      }
      goto LABEL_55;
    case 8:
      uint64_t v47 = [v59 title];

      if (!v47)
      {
        id v48 = PKLocalizedApplyFeatureString();
        [v59 setTitle:v48];
      }
      id v49 = [v59 subtitle];

      if (!v49)
      {
        id v50 = PKLocalizedApplyFeatureString();
        [v59 setSubtitle:v50];
      }
      id v51 = [v59 primaryActionTitle];

      if (!v51) {
        goto LABEL_49;
      }
      goto LABEL_56;
    case 9:
      uint64_t v53 = [v59 title];

      if (!v53)
      {
        uint64_t v54 = PKLocalizedMadisonString(&cfstr_InvitationSent.isa);
        [v59 setTitle:v54];
      }
      id v55 = [v59 primaryActionTitle];

      if (v55) {
        goto LABEL_56;
      }
      uint64_t v52 = PKLocalizedMadisonString(&cfstr_InvitationSent_0.isa);
      goto LABEL_54;
    default:
      id v39 = [v59 title];

      if (!v39)
      {
        id v40 = PKLocalizedApplyFeatureString();
        [v59 setTitle:v40];
      }
      id v41 = [v59 subtitle];

      if (!v41)
      {
        int v42 = [MEMORY[0x1E4F843F0] sharedInstance];
        id v43 = [v42 appleAccountInformation];
        id v44 = [v43 primaryEmailAddress];

        id v45 = PKLocalizedApplyFeatureString();
        objc_msgSend(v59, "setSubtitle:", v45, v44);
      }
      __int16 v46 = [v59 primaryActionTitle];

      if (v46) {
        goto LABEL_56;
      }
LABEL_49:
      uint64_t v52 = PKLocalizedApplyFeatureString();
LABEL_54:
      id v21 = (void *)v52;
      [v59 setPrimaryActionTitle:v52];
LABEL_55:

LABEL_56:
      uint64_t v56 = [PKApplyStateExplanationViewController alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
      uint64_t v58 = [(PKApplyExplanationViewController *)v56 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v59];

      [(NSMutableArray *)self->_viewControllers addObject:v58];

      return;
  }
}

- (void)_queueProgramConsentFlowWithPage:(id)a3
{
  id v17 = a3;
  id v4 = [(PKApplyController *)self preferredLanguage];
  uint64_t v5 = [v17 subtitle];

  if (!v5)
  {
    id v6 = PKLocalizedApplyFeatureString();
    [v17 setSubtitle:v6];
  }
  uint64_t v7 = [v17 primaryActionTitle];

  if (!v7)
  {
    uint64_t v8 = PKLocalizedApplyFeatureString();
    [v17 setPrimaryActionTitle:v8];
  }
  uint64_t v9 = [v17 secondaryActionTitle];

  if (!v9)
  {
    id v10 = PKLocalizedApplyFeatureString();
    [v17 setSecondaryActionTitle:v10];
  }
  id v11 = [v17 learnMore];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F846B0]);
    [v17 setLearnMore:v11];
  }
  id v12 = [v11 buttonTitle];

  if (!v12)
  {
    id v13 = PKLocalizedApplyFeatureString();
    [v11 setButtonTitle:v13];
  }
  uint64_t v14 = [PKApplyProgramConsentViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  uint64_t v16 = [(PKApplyProgramConsentViewController *)v14 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v17];

  [(NSMutableArray *)self->_viewControllers addObject:v16];
}

- (void)_queueDeclinedFlowWithPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKApplyController *)self preferredLanguage];
  BOOL v6 = self->_installmentConfiguration != 0;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  id v37 = __48__PKApplyController__queueDeclinedFlowWithPage___block_invoke;
  uint64_t v38 = &unk_1E59CDC58;
  id v7 = v4;
  id v39 = v7;
  BOOL v42 = v6;
  id v8 = v5;
  id v40 = v8;
  id v41 = self;
  uint64_t v9 = (void (**)(void))_Block_copy(&v35);
  uint64_t v10 = [(PKFeatureApplication *)self->_featureApplication applicationStateReason];
  switch(v10)
  {
    case 16:
      v9[2](v9);
      if ([(PKFeatureApplication *)self->_featureApplication feature] == 3)
      {
        payLaterSetupController = self->_payLaterSetupController;
        if (payLaterSetupController)
        {
          if ([(PKPayLaterSetupFlowController *)payLaterSetupController controllerContext] == 2)
          {
            uint64_t v25 = [v7 altPrimaryActionTitle];

            if (v25)
            {
              uint64_t v26 = [v7 altPrimaryActionTitle];
LABEL_27:
              id v17 = (void *)v26;
              [v7 setPrimaryActionTitle:v26];
LABEL_28:
            }
          }
        }
      }
      break;
    case 7:
      id v27 = [v7 title];

      if (!v27)
      {
        __int16 v28 = PKLocalizedApplyFeatureString();
        [v7 setTitle:v28];
      }
      int v29 = [v7 subtitle];

      if (!v29)
      {
        long long v30 = PKLocalizedApplyFeatureString();
        [v7 setSubtitle:v30];
      }
      long long v31 = [v7 primaryActionTitle];

      if (!v31)
      {
        uint64_t v26 = PKLocalizedApplyFeatureString();
        goto LABEL_27;
      }
      break;
    case 6:
      id v11 = [v7 title];

      if (!v11)
      {
        id v12 = PKLocalizedApplyFeatureString();
        [v7 setTitle:v12];
      }
      id v13 = [v7 subtitle];

      if (!v13)
      {
        uint64_t v14 = PKLocalizedApplyFeatureString();
        [v7 setSubtitle:v14];
      }
      char v15 = [v7 primaryActionTitle];

      if (!v15)
      {
        uint64_t v16 = PKLocalizedApplyFeatureString();
        [v7 setPrimaryActionTitle:v16];
      }
      id v17 = [v7 learnMore];
      uint64_t v18 = [v17 buttonTitle];

      if (!v18)
      {
        long long v19 = PKLocalizedApplyFeatureString();
        [v17 setButtonTitle:v19];
      }
      uint64_t v20 = [v17 title];

      if (!v20)
      {
        id v21 = PKLocalizedApplyFeatureString();
        [v17 setTitle:v21];
      }
      BOOL v22 = [v17 body];

      if (!v22)
      {
        uint64_t v23 = PKLocalizedApplyFeatureString();
        [v17 setBody:v23];
      }
      goto LABEL_28;
    default:
      v9[2](v9);
      break;
  }
  long long v32 = [PKApplyDeclinedViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v34 = [(PKApplyExplanationViewController *)v32 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v7];

  [(NSMutableArray *)self->_viewControllers addObject:v34];
}

void __48__PKApplyController__queueDeclinedFlowWithPage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];

  if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = PKLocalizedBeekmanStringWithLocalization(&cfstr_InstallmentApp_5.isa, *(NSString **)(a1 + 40));
      [v3 setTitle:v4];

      uint64_t v5 = *(void **)(a1 + 32);
      BOOL v6 = PKLocalizedBeekmanStringWithLocalization(&cfstr_InstallmentApp_6.isa, *(NSString **)(a1 + 40));
      [v5 setDisclosureTitle:v6];
    }
    else
    {
      BOOL v6 = PKLocalizedApplyFeatureString();
      [v3 setTitle:v6];
    }
  }
  id v7 = [*(id *)(a1 + 32) subtitle];

  if (!v7)
  {
    int v8 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v9 = [MEMORY[0x1E4F843F0] sharedInstance];
    uint64_t v10 = [v9 appleAccountInformation];
    id v11 = [v10 primaryEmailAddress];

    if (v8)
    {
      int v12 = [*(id *)(*(void *)(a1 + 48) + 296) isInStorePurchase];
      id v13 = *(void **)(a1 + 32);
      if (v12) {
        uint64_t v14 = @"INSTALLMENT_APPLY_DECLINED_MESSAGE_IN_STORE";
      }
      else {
        uint64_t v14 = @"INSTALLMENT_APPLY_DECLINED_MESSAGE";
      }
      char v15 = PKLocalizedBeekmanStringWithLocalization(&v14->isa, *(NSString **)(a1 + 40), &stru_1EF1B4C70.isa, v11);
      uint64_t v16 = v13;
    }
    else
    {
      long long v19 = v11;
      char v15 = PKLocalizedApplyFeatureString();
      uint64_t v16 = *(void **)(a1 + 32);
    }
    objc_msgSend(v16, "setSubtitle:", v15, v19);
  }
  id v17 = [*(id *)(a1 + 32) primaryActionTitle];

  if (!v17)
  {
    uint64_t v18 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 56)) {
      PKLocalizedBeekmanStringWithLocalization(&cfstr_InstallmentApp_9.isa, *(NSString **)(a1 + 40));
    }
    else {
      PKLocalizedApplyFeatureString();
    }
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    [v18 setPrimaryActionTitle:v20];
  }
}

- (void)_queuePassActivationFlowWithCompletion:(id)a3
{
  id v11 = (void (**)(id, void *, void))a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F841C8]) initWithAccount:self->_account];
  uint64_t v5 = [PKAccountFlowController alloc];
  provisioningController = self->_provisioningController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  int v8 = [(PKAccountFlowController *)v5 initWithAccountCredential:v4 provisioningController:provisioningController setupDelegate:WeakRetained context:self->_context operations:63];

  [(PKAccountFlowController *)v8 setParentFlowController:self];
  uint64_t v9 = [(PKAccountFlowController *)v8 firstAccountViewController];
  [(NSMutableArray *)self->_viewControllers addObject:v9];
  if (v11)
  {
    uint64_t v10 = [(PKApplyController *)self _nextQueuedViewController];
    v11[2](v11, v10, 0);
  }
}

- (void)_queueEmailRequiredErrorViewController
{
  uint64_t v3 = [(PKApplyController *)self preferredLanguage];
  id v4 = objc_alloc_init(MEMORY[0x1E4F846A8]);
  uint64_t v5 = PKLocalizedApplyFeatureString();
  [v4 setTitle:v5];

  BOOL v6 = PKLocalizedApplyFeatureString();
  [v4 setSubtitle:v6];

  id v7 = PKLocalizedApplyFeatureString();
  [v4 setPrimaryActionTitle:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F846B0]);
  uint64_t v9 = PKLocalizedApplyFeatureString();
  [v8 setButtonTitle:v9];

  [v4 setLearnMore:v8];
  uint64_t v10 = [PKApplyExplanationViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  int v12 = [(PKApplyExplanationViewController *)v10 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v4];

  [(PKExplanationViewController *)v12 setShowCancelButton:1];
  [(PKApplyExplanationViewController *)v12 setContinueAction:&__block_literal_global_118];
  [(PKApplyExplanationViewController *)v12 setLearnMoreAction:&__block_literal_global_406];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  char v15 = __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke_3;
  uint64_t v16 = &unk_1E59D6CA0;
  objc_copyWeak(&v17, &location);
  [(PKApplyExplanationViewController *)v12 setDoneAction:&v13];
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v12, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

uint64_t __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=APPLE_ACCOUNT_CONTACT"];
  uint64_t v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v1 openSensitiveURL:v0 withOptions:0];

  return 0;
}

uint64_t __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://support.apple.com/HT201356"];
  uint64_t v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v1 openSensitiveURL:v0 withOptions:0];

  return 0;
}

BOOL __59__PKApplyController__queueEmailRequiredErrorViewController__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained endApplyFlow];
  }

  return v2 != 0;
}

- (void)_queueCannotResumeIDVFlow
{
  id v11 = [(PKApplyController *)self preferredLanguage];
  id v3 = objc_alloc_init(MEMORY[0x1E4F846A8]);
  id v4 = PKLocalizedApplyFeatureString();
  [v3 setTitle:v4];

  uint64_t v5 = PKLocalizedApplyFeatureString();
  [v3 setSubtitle:v5];

  BOOL v6 = PKLocalizedApplyFeatureString();
  [v3 setPrimaryActionTitle:v6];

  id v7 = PKLocalizedApplyFeatureString();
  [v3 setSecondaryActionTitle:v7];

  id v8 = [PKApplyCannotResumeIDVViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  uint64_t v10 = [(PKApplyExplanationViewController *)v8 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v3];

  [(NSMutableArray *)self->_viewControllers addObject:v10];
}

- (void)_queueAcceptedFlowWithPage:(id)a3
{
  id v12 = a3;
  id v4 = [(PKApplyController *)self preferredLanguage];
  uint64_t v5 = [v12 title];

  if (!v5)
  {
    BOOL v6 = PKLocalizedApplyFeatureString();
    [v12 setTitle:v6];
  }
  id v7 = [v12 subtitle];

  if (!v7)
  {
    id v8 = PKLocalizedApplyFeatureString();
    [v12 setSubtitle:v8];
  }
  uint64_t v9 = [PKApplyAcceptedViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v11 = [(PKApplyExplanationViewController *)v9 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v12];

  [(NSMutableArray *)self->_viewControllers addObject:v11];
}

- (void)_queueActionFlowWithPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 title];
  if (v5
    && (BOOL v6 = (void *)v5,
        [v4 primaryActionTitle],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [PKApplyActionExplanationViewController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    uint64_t v10 = [(PKApplyExplanationViewController *)v8 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v4];

    [(NSMutableArray *)self->_viewControllers addObject:v10];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Error: Cannot generate action view controller with no title or button", v12, 2u);
    }

    [(PKApplyController *)self _queueGenericErrorViewControllerWithPage:v4];
  }
}

- (void)_queueConfirmInfoFlowWithPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PKApplyConfirmInfoViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v7 = [(PKApplyConfirmInfoViewController *)v5 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v4];

  [(NSMutableArray *)self->_viewControllers addObject:v7];
}

- (void)_queueExpiredFlowWithPage:(id)a3
{
  id v11 = a3;
  id v4 = [(PKApplyController *)self preferredLanguage];
  uint64_t v5 = [v11 title];

  if (!v5)
  {
    BOOL v6 = PKLocalizedApplyFeatureString();
    [v11 setTitle:v6];
  }
  id v7 = [v11 subtitle];

  if (!v7)
  {
    id v8 = PKLocalizedApplyFeatureString();
    [v11 setSubtitle:v8];
  }
  uint64_t v9 = [v11 primaryActionTitle];

  if (!v9)
  {
    uint64_t v10 = PKLocalizedApplyFeatureString();
    [v11 setPrimaryActionTitle:v10];
  }
  [(PKApplyController *)self _queueGenericErrorViewControllerWithPage:v11];
}

- (void)_queueTerminalStateFlowWithPage:(id)a3
{
  id v11 = a3;
  id v4 = [(PKApplyController *)self preferredLanguage];
  uint64_t v5 = [v11 title];

  if (!v5)
  {
    BOOL v6 = PKLocalizedApplyFeatureString();
    [v11 setTitle:v6];
  }
  id v7 = [v11 subtitle];

  if (!v7)
  {
    id v8 = PKLocalizedApplyFeatureString();
    [v11 setSubtitle:v8];
  }
  uint64_t v9 = [v11 primaryActionTitle];

  if (!v9)
  {
    uint64_t v10 = PKLocalizedApplyFeatureString();
    [v11 setPrimaryActionTitle:v10];
  }
  [(PKApplyController *)self _queueGenericErrorViewControllerWithPage:v11];
}

- (void)_queueGenericErrorViewController
{
  id v7 = [(PKApplyController *)self preferredLanguage];
  id v3 = objc_alloc_init(MEMORY[0x1E4F846A8]);
  id v4 = PKLocalizedApplyFeatureString();
  [v3 setTitle:v4];

  uint64_t v5 = PKLocalizedApplyFeatureString();
  [v3 setSubtitle:v5];

  BOOL v6 = PKLocalizedApplyFeatureString();
  [v3 setPrimaryActionTitle:v6];

  [(PKApplyController *)self _queueGenericErrorViewControllerWithPage:v3];
}

- (void)_queueGenericErrorViewControllerWithPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PKApplyGenericErrorViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v7 = [(PKApplyExplanationViewController *)v5 initWithController:self setupDelegate:WeakRetained context:self->_context applyPage:v4];

  [(NSMutableArray *)self->_viewControllers addObject:v7];
}

- (id)_nextQueuedViewController
{
  unint64_t viewControllerIndex = self->_viewControllerIndex;
  if (viewControllerIndex >= [(NSMutableArray *)self->_viewControllers count])
  {
    uint64_t v5 = 0;
  }
  else
  {
    viewControllers = self->_viewControllers;
    ++self->_viewControllerIndex;
    uint64_t v5 = -[NSMutableArray objectAtIndex:](viewControllers, "objectAtIndex:");
    if (v5)
    {
      if (objc_opt_respondsToSelector())
      {
        BOOL v6 = [v5 currentPage];
        id v7 = [v6 identifier];
        previousContextIdentifier = self->_previousContextIdentifier;
        self->_previousContextIdentifier = v7;
      }
      else
      {
        BOOL v6 = self->_previousContextIdentifier;
        self->_previousContextIdentifier = 0;
      }
    }
  }

  return v5;
}

- (void)_acquireAssertion
{
  if (self->_notificationSupressionAssertion)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Notification suppression assertion already acquired", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring notification suppression assertion", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    uint64_t v5 = (void *)MEMORY[0x1E4F84508];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__PKApplyController__acquireAssertion__block_invoke;
    v6[3] = &unk_1E59D6CC8;
    objc_copyWeak(&v7, buf);
    [v5 acquireAssertionOfType:4 withReason:@"User Application Process" completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

void __38__PKApplyController__acquireAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v7)
    {
      if (v11)
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Acquired notification suppression assertion", buf, 2u);
      }

      objc_storeStrong(WeakRetained + 19, a2);
      [WeakRetained[19] setInvalidateWhenBackgrounded:1];
      id v12 = WeakRetained[19];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __38__PKApplyController__acquireAssertion__block_invoke_458;
      v13[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v14, v8);
      [v12 setInvalidationHandler:v13];
      objc_destroyWeak(&v14);
    }
  }
}

void __38__PKApplyController__acquireAssertion__block_invoke_458(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Executing notification suppression assertion invalidation handler", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (void *)*((void *)WeakRetained + 19);
    *((void *)WeakRetained + 19) = 0;
  }
}

- (void)_invalidateAssertion
{
  if (self->_notificationSupressionAssertion)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating notification suppression assertion", v4, 2u);
    }

    [(PKAssertion *)self->_notificationSupressionAssertion invalidate];
  }
}

- (id)cancelAlertWithContinueAction:(id)a3
{
  id v4 = a3;
  if ([(PKApplyController *)self featureIdentifier] == 5)
  {
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  id v6 = [(PKApplyController *)self preferredLanguage];
  unint64_t v7 = [(PKApplyController *)self applicationType];
  if (v7 < 2)
  {
LABEL_6:
    id v8 = PKLocalizedApplyFeatureString();
    uint64_t v9 = PKDeviceSpecificLocalizedStringKeyForKey(@"CANCEL_APPLY_ALERT_MESSAGE", 0);
    uint64_t v10 = PKLocalizedApplyFeatureString();

    uint64_t v11 = PKLocalizedApplyFeatureString();
    goto LABEL_8;
  }
  if (v7 != 2)
  {
    if (v7 != 3)
    {
      id v12 = 0;
      uint64_t v10 = 0;
      id v8 = 0;
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  id v8 = PKLocalizedMadisonString(&cfstr_CancelInvitati.isa);
  uint64_t v10 = PKLocalizedMadisonString(&cfstr_CancelInvitati_0.isa);
  uint64_t v11 = PKLocalizedMadisonString(&cfstr_CancelInvitati_1.isa);
LABEL_8:
  id v12 = (void *)v11;
  if (!v8)
  {
LABEL_11:
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v10 preferredStyle:1];
  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = PKLocalizedApplyFeatureString();
  char v15 = [v13 actionWithTitle:v14 style:1 handler:0];

  [v5 addAction:v15];
  [v5 setPreferredAction:v15];
  id v16 = (void *)MEMORY[0x1E4FB1410];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__PKApplyController_cancelAlertWithContinueAction___block_invoke;
  void v19[3] = &unk_1E59CB150;
  id v20 = v4;
  uint64_t v17 = [v16 actionWithTitle:v12 style:0 handler:v19];
  [v5 addAction:v17];

LABEL_12:
LABEL_13:

  return v5;
}

uint64_t __51__PKApplyController_cancelAlertWithContinueAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_displayableErrorForError:(id)a3 showDetailedErrorFlow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(PKApplyController *)self preferredLanguage];
  id v8 = [v6 domain];
  if (![v8 isEqualToString:*MEMORY[0x1E4F289A0]])
  {

    goto LABEL_7;
  }
  if ([v6 code] != -1009)
  {
    uint64_t v9 = [v6 code];

    if (v9 == -1001) {
      goto LABEL_6;
    }
LABEL_7:
    id v12 = [v6 domain];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F88098]];

    if (v13 && (unint64_t)[v6 code] <= 5)
    {
      uint64_t v14 = [v6 localizedFailureReason];

      if (v14)
      {
        uint64_t v10 = [v6 localizedFailureReason];
        uint64_t v11 = [v6 localizedRecoverySuggestion];
        goto LABEL_11;
      }
      char v15 = 0;
    }
    else
    {
      char v15 = 0;
      uint64_t v14 = 0;
    }
    uint64_t v10 = 0;
    goto LABEL_14;
  }

LABEL_6:
  uint64_t v10 = PKLocalizedApplyFeatureString();
  uint64_t v11 = PKLocalizedApplyFeatureString();
LABEL_11:
  uint64_t v14 = v11;
  char v15 = 1;
LABEL_14:
  id v16 = [v6 domain];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F5C158]];

  if ((v15 & 1) == 0 && v17 && [v6 code] == 40201 && v4)
  {
    [(PKApplyController *)self _queueCannotResumeIDVFlow];
LABEL_19:
    uint64_t v18 = 0;
    goto LABEL_60;
  }
  if ((v15 & 1) == 0)
  {
    if ((v17 & 1) == 0)
    {
      id v20 = [v6 domain];
      int v21 = [v20 isEqualToString:*MEMORY[0x1E4F87C30]];

      if (!v21) {
        goto LABEL_57;
      }
      BOOL v22 = [v6 localizedFailureReason];

      if (v22)
      {
        uint64_t v23 = [v6 localizedFailureReason];

        uint64_t v24 = [v6 localizedRecoverySuggestion];
        goto LABEL_55;
      }
    }
    uint64_t v19 = [v6 code];
    if (v19 > 60068)
    {
      switch(v19)
      {
        case 60069:
        case 60070:
        case 60071:
          goto LABEL_54;
        case 60072:
        case 60073:
        case 60074:
          goto LABEL_57;
        case 60075:
          uint64_t v23 = PKLocalizedMadisonString(&cfstr_UnableToInvite.isa);

          uint64_t v26 = @"UNABLE_TO_INVITE_ACCOUNT_USER_ERROR_MESSAGE";
          goto LABEL_48;
        case 60076:
          uint64_t v23 = PKLocalizedMadisonString(&cfstr_AccountUserLim.isa);

          id v27 = [(PKAccount *)self->_account accountUserInvitationAllowedFeatureDescriptor];
          uint64_t v28 = [v27 maximumAccountUsers];

          PKLocalizedString(&cfstr_AccountUserLim_0.isa, &cfstr_Lu.isa, v28);
          goto LABEL_46;
        case 60077:
          uint64_t v23 = PKLocalizedMadisonString(&cfstr_AccountUserLim.isa);

          int v29 = [(PKAccount *)self->_account accountUserInvitationAllowedFeatureDescriptor];
          uint64_t v30 = [v29 maximumAccountUsers];

          PKLocalizedString(&cfstr_AccountInvitat.isa, &cfstr_Lu.isa, v30);
          uint64_t v24 = LABEL_46:;
          goto LABEL_55;
        case 60078:
          uint64_t v23 = PKLocalizedMadisonString(&cfstr_AccountMergeIn.isa);

          uint64_t v26 = @"ACCOUNT_MERGE_INITIATED_ERROR_MESSAGE";
LABEL_48:
          uint64_t v24 = PKLocalizedMadisonString(&v26->isa);
          goto LABEL_55;
        default:
          if (v19 == 60089)
          {
            uint64_t v23 = PKLocalizedApplyFeatureString();
            goto LABEL_56;
          }
          if (v19 != 60093) {
            goto LABEL_57;
          }
          break;
      }
      goto LABEL_54;
    }
    if (v19 > 40455)
    {
      switch(v19)
      {
        case 60001:
        case 60002:
        case 60012:
        case 60013:
        case 60028:
        case 60039:
        case 60040:
        case 60041:
        case 60042:
        case 60043:
        case 60044:
        case 60045:
        case 60046:
        case 60047:
        case 60048:
        case 60049:
        case 60050:
        case 60051:
        case 60052:
        case 60053:
        case 60056:
          goto LABEL_54;
        case 60003:
        case 60004:
        case 60005:
        case 60006:
        case 60007:
        case 60008:
        case 60009:
        case 60010:
        case 60011:
        case 60015:
        case 60016:
        case 60017:
        case 60018:
        case 60019:
        case 60020:
        case 60021:
        case 60022:
        case 60023:
        case 60024:
        case 60025:
        case 60026:
        case 60027:
        case 60029:
        case 60030:
        case 60031:
        case 60032:
        case 60033:
        case 60034:
        case 60035:
        case 60036:
        case 60037:
        case 60038:
        case 60054:
        case 60055:
        case 60058:
        case 60059:
          goto LABEL_57;
        case 60014:
          if (!v4) {
            goto LABEL_57;
          }
          id v31 = objc_alloc_init(MEMORY[0x1E4F846A8]);
          long long v32 = PKLocalizedApplyFeatureString();
          [v31 setTitle:v32];

          long long v33 = PKLocalizedApplyFeatureString();
          [v31 setSubtitle:v33];

          id v34 = PKLocalizedPaymentString(&cfstr_Continue.isa);
          [v31 setPrimaryActionTitle:v34];

          [(PKApplyController *)self _queueGenericErrorViewControllerWithPage:v31];
          goto LABEL_19;
        case 60057:
          uint64_t v23 = PKLocalizedApplyFeatureString();

          int IsBridge = PKPaymentSetupContextIsBridge();
          uint64_t v10 = PKDeviceSpecificLocalizedStringKeyForKey(@"OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE", IsBridge);
          uint64_t v36 = PKLocalizedApplyFeatureString();

          uint64_t v14 = v36;
          goto LABEL_56;
        case 60060:
          if (!v4) {
            goto LABEL_57;
          }
          [(PKApplyController *)self _queueGenericErrorViewController];
          goto LABEL_19;
        default:
          if (v19 == 40456)
          {
            uint64_t v23 = PKLocalizedPaymentString(&cfstr_InvalidVerific.isa);

            uint64_t v25 = @"INVALID_VERIFICATION_CODE_MESSAGE";
          }
          else
          {
            if (v19 != 40457) {
              goto LABEL_57;
            }
            uint64_t v23 = PKLocalizedPaymentString(&cfstr_ExpiredVerific.isa);

            uint64_t v25 = @"EXPIRED_VERIFICATION_CODE_MESSAGE";
          }
          uint64_t v24 = PKLocalizedPaymentString(&v25->isa);
          break;
      }
LABEL_55:
      uint64_t v10 = v14;
      uint64_t v14 = v24;
LABEL_56:

      uint64_t v10 = v23;
      goto LABEL_57;
    }
    if (v19 == 40319)
    {
      if (v4)
      {
        [(PKApplyController *)self _queueEmailRequiredErrorViewController];
        goto LABEL_19;
      }
    }
    else if (v19 == 40423 || v19 == 40454)
    {
LABEL_54:
      uint64_t v23 = PKLocalizedApplyFeatureString();

      uint64_t v24 = PKLocalizedApplyFeatureString();
      goto LABEL_55;
    }
  }
LABEL_57:
  if (!(v10 | v14))
  {
    uint64_t v10 = PKLocalizedApplyFeatureString();
    uint64_t v14 = PKLocalizedApplyFeatureString();
  }
  uint64_t v18 = PKDisplayableErrorCustom();
LABEL_60:

  return v18;
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PKApplyController_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __47__PKApplyController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) applicationIdentifier];
  if ([*(id *)(*(void *)(a1 + 40) + 264) feature] != 5)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(void *)(v3 + 160))
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(v3 + 264) lastUpdated];
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 160);
        int v13 = 138412802;
        uint64_t v14 = v2;
        __int16 v15 = 2112;
        id v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Application: %@ update recivied but ignored with timestamp: %@ because of running updates: %lu", (uint8_t *)&v13, 0x20u);
      }
LABEL_16:

      goto LABEL_17;
    }
    id v7 = [*(id *)(v3 + 264) applicationIdentifier];
    if ([v7 isEqualToString:v2])
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 264) applicationState];
      if (v8 != [*(id *)(a1 + 32) applicationState])
      {

LABEL_13:
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 264), *(id *)(a1 + 32));
        uint64_t v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [*(id *)(*(void *)(a1 + 40) + 264) lastUpdated];
          int v13 = 138412546;
          uint64_t v14 = v2;
          __int16 v15 = 2112;
          id v16 = v12;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Application: %@ updated with timestamp: %@ - sending notification", (uint8_t *)&v13, 0x16u);
        }
        id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v4 postNotificationName:@"PKApplyControllerUpdatedNotification" object:0];
        goto LABEL_16;
      }
      uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 264) applicationStateReason];
      uint64_t v10 = [*(id *)(a1 + 32) applicationStateReason];

      if (v9 != v10) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v2;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Application: %@ update received but current application is identical", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_17:
}

+ (id)preferredLanguageForFeatureIdentifier:(unint64_t)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = PKPassKitBundle();
  uint64_t v8 = [a1 preferredLanguageForFeatureIdentifier:a3 account:v6 mainBundle:v7];

  return v8;
}

+ (id)preferredLanguageForFeatureIdentifier:(unint64_t)a3 account:(id)a4 mainBundle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 != 3
    || ([v7 payLaterDetails],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 perferredLanguageWithMainBundle:v8],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    uint64_t v11 = [MEMORY[0x1E4F84D50] sharedService];
    id v12 = [v11 context];

    uint64_t v10 = [v12 applyServicePreferredLanguageForFeatureIdentifier:a3 mainLanguageBundle:v8];
  }

  return v10;
}

- (id)preferredLanguage
{
  uint64_t v3 = objc_opt_class();
  unint64_t featureIdentifier = self->_featureIdentifier;
  account = self->_account;

  return (id)[v3 preferredLanguageForFeatureIdentifier:featureIdentifier account:account];
}

+ (id)localizationBundleForFeatureIdentifier:(unint64_t)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = PKPassKitBundle();
  id v8 = [a1 localizationBundleForFeatureIdentifier:a3 account:v6 mainBundle:v7];

  return v8;
}

+ (id)localizationBundleForFeatureIdentifier:(unint64_t)a3 account:(id)a4 mainBundle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 != 3
    || ([v7 payLaterDetails],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 localizationBundleWithMainBundle:v8],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    uint64_t v11 = [MEMORY[0x1E4F84D50] sharedService];
    id v12 = [v11 context];

    uint64_t v10 = [v12 applyServiceLocalizationBundleForFeatureIdentifier:a3 mainLanguageBundle:v8];
  }

  return v10;
}

- (id)localizationBundle
{
  uint64_t v3 = objc_opt_class();
  unint64_t featureIdentifier = self->_featureIdentifier;
  account = self->_account;

  return (id)[v3 localizationBundleForFeatureIdentifier:featureIdentifier account:account];
}

- (id)_applyExperiment
{
  applyExperiment = self->_applyExperiment;
  if (!applyExperiment)
  {
    unint64_t featureIdentifier = self->_featureIdentifier;
    if (!featureIdentifier) {
      unint64_t featureIdentifier = [(PKFeatureApplication *)self->_featureApplication feature];
    }
    if ([(PKApplyController *)self applicationType]) {
      BOOL v5 = [(PKApplyController *)self applicationType] != 1;
    }
    else {
      BOOL v5 = 0;
    }
    if (featureIdentifier == 2 && !v5)
    {
      id v6 = (PKAppleCardApplyExperiment *)objc_alloc_init(MEMORY[0x1E4F84400]);
      id v7 = self->_applyExperiment;
      self->_applyExperiment = v6;
    }
    applyExperiment = self->_applyExperiment;
  }
  id v8 = applyExperiment;

  return v8;
}

- (id)_applyExperimentDetails
{
  uint64_t v2 = [(PKApplyController *)self _applyExperiment];
  uint64_t v3 = [v2 experimentDetails];

  return v3;
}

- (id)loadHeroImageFromApplyExperiment
{
  uint64_t v3 = [(PKApplyController *)self _applyExperiment];
  id v4 = v3;
  if (self->_installmentConfiguration) {
    [v3 heroInstallmentImagePath];
  }
  else {
  BOOL v5 = [v3 heroImagePath];
  }
  if (v5)
  {
    id v6 = [MEMORY[0x1E4FB1818] imageWithContentsOfFile:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (int64_t)channel
{
  return self->_channel;
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (PKFeatureApplication)featureApplication
{
  return self->_featureApplication;
}

- (int64_t)context
{
  return self->_context;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_accessLevel = a3;
}

- (PKAccount)account
{
  return self->_account;
}

- (NSString)analyticsExistingAccountType
{
  return self->_analyticsExistingAccountType;
}

- (void)setAnalyticsExistingAccountType:(id)a3
{
}

- (NSString)preliminaryAssessmentIdentifier
{
  return self->_preliminaryAssessmentIdentifier;
}

- (void)setPreliminaryAssessmentIdentifier:(id)a3
{
}

- (PKPayLaterSetupFlowController)payLaterSetupController
{
  return self->_payLaterSetupController;
}

- (void)setPayLaterSetupController:(id)a3
{
}

- (int64_t)associatedIntent
{
  return self->_associatedIntent;
}

- (void)setAssociatedIntent:(int64_t)a3
{
  self->_associatedIntent = a3;
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (BOOL)didEncounterError
{
  return self->_didEncounterError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_payLaterSetupController, 0);
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsExistingAccountType, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_featureApplication, 0);
  objc_storeStrong((id *)&self->_inflightODISession, 0);
  objc_storeStrong((id *)&self->_applyTermsODISession, 0);
  objc_storeStrong((id *)&self->_createApplicationODISession, 0);
  objc_storeStrong((id *)&self->_submitApplicationODISession, 0);
  objc_storeStrong((id *)&self->_applyExperiment, 0);
  objc_storeStrong((id *)&self->_notificationSupressionAssertion, 0);
  objc_storeStrong((id *)&self->_idVerificationSession, 0);
  objc_storeStrong((id *)&self->_actionIdentifiersRequiringAuthentication, 0);
  objc_storeStrong((id *)&self->_previousContextIdentifier, 0);
  objc_storeStrong((id *)&self->_coreIDVNextStepToken, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_processedTermsIdentifiers, 0);
  objc_storeStrong((id *)&self->_shownTermsIdentifiers, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_pagesToSubmit, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);

  objc_storeStrong((id *)&self->_webService, 0);
}

@end