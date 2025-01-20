@interface PKPassPaymentContainerView
+ (BOOL)_initialUserIntentRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5 requirePhysicalButton:(BOOL)a6;
+ (BOOL)initialPhysicalButtonRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5;
+ (BOOL)initialUserIntentRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5;
+ (BOOL)shouldAutomaticallyAuthorizeForPass:(id)a3 withContext:(id)a4;
+ (BOOL)userIntentPotentiallyRequiredForPass:(id)a3 fieldDetect:(BOOL)a4;
- (BOOL)_authenticationAllowed;
- (BOOL)_canAuthenticateWithBiometrics;
- (BOOL)_canAuthenticateWithPasscode;
- (BOOL)_canDisplaySecondaryView;
- (BOOL)_hasValueAddedServicePasses;
- (BOOL)_isBackgrounded;
- (BOOL)_isDeactivated;
- (BOOL)_isForegroundActive;
- (BOOL)_isPrimaryViewVisible;
- (BOOL)_isSecondaryViewVisible;
- (BOOL)_isVASInfoViewVisible;
- (BOOL)_recognizingBiometrics;
- (BOOL)_restartPaymentAuthorization;
- (BOOL)_shouldDisplayPrimaryView;
- (BOOL)_shouldDisplaySecondaryView;
- (BOOL)_shouldShowTerminalIsNotRequestingPaymentError;
- (BOOL)_showGlyphForPayState:(int64_t)a3;
- (BOOL)_showPhysicalButtonForPayState:(int64_t)a3;
- (BOOL)isPassAuthorized;
- (BOOL)passOnlySupportsPassiveEntry;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PKPassPaymentContainerView)initWithPass:(id)a3 passView:(id)a4 context:(id)a5 paymentSession:(id)a6 paymentService:(id)a7;
- (double)_topMargin;
- (id)_attributedStringForBottomTextViewFromString:(id)a3;
- (id)_buttonForState:(int64_t)a3;
- (id)_emphasisButtonForState:(int64_t)a3;
- (id)_filledButtonWithTitle:(id)a3 action:(id)a4;
- (id)_groupTileForTiles:(id)a3;
- (id)_passcodeButtonTitle;
- (id)_textOverrideForFatalError;
- (unint64_t)_actionAfterTransaction;
- (void)_activateForPayment;
- (void)_activateForPaymentWithApplications:(id)a3;
- (void)_activatePaymentApplications:(id)a3 forPaymentPass:(id)a4 withCompletion:(id)a5;
- (void)_addPasscodeButtonPressed:(id)a3;
- (void)_addTransitionCompletionHandler:(id)a3;
- (void)_applyLatestContentToViews;
- (void)_applyPayState:(int64_t)a3;
- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4;
- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4 completionHandler:(id)a5;
- (void)_applyPaymentIndefiniteSuccessState;
- (void)_applyPresentationPayState:(int64_t)a3;
- (void)_applyTerminalFailureState;
- (void)_applyTerminalTransactionSubstateWithSuccess:(BOOL)a3 reset:(BOOL)a4;
- (void)_applyTerminalTransactionSubstateWithSuccess:(BOOL)a3 reset:(BOOL)a4 errorOverride:(id)a5;
- (void)_authorizeForTransactionWithAuthenticatorEvaluationResponse:(id)a3 authenticationIdentifier:(unint64_t)a4 completion:(id)a5;
- (void)_beginBarcodeDisplayTimer;
- (void)_beginPaymentAuthorization;
- (void)_beginSessionExchange:(id)a3;
- (void)_beginTerminalResponseTimeout;
- (void)_calculateTerminalStateWithRangingSuspensionReasons:(unint64_t)a3;
- (void)_cancelAuthentication;
- (void)_cancelBarcodeDisplayTimer;
- (void)_cancelHoldingTerminalTransactionSubstateIfNecessary;
- (void)_cancelTerminalResponseTimeout;
- (void)_cancelTransactionAuthentication;
- (void)_clearSessionExchangeTasks;
- (void)_collectAndSubmitBarcodeEventMetadataWithAuthenticationType:(int64_t)a3;
- (void)_commitPendingPayStateAnimated:(BOOL)a3;
- (void)_configureForPaymentWithPaymentPass:(id)a3 context:(id)a4;
- (void)_configureForStyle:(int64_t)a3 context:(id)a4;
- (void)_configureForValueAddedServiceWithPass:(id)a3 context:(id)a4;
- (void)_didAuthorizePaymentApplicationWithAuthenticationIdentifier:(unint64_t)a3;
- (void)_didInvalidate;
- (void)_dismissBarcodeViewControllerIfNecessaryWithCompletion:(id)a3;
- (void)_dismissTransactionAuthenticationPasscodeViewController:(id)a3 withCompletion:(id)a4;
- (void)_emphasizeStateIfPossible:(int64_t)a3 withTextOverride:(id)a4;
- (void)_emphasizeStateIfPossible:(int64_t)a3 withTextOverride:(id)a4 playSystemSound:(BOOL)a5;
- (void)_endContactlessPaymentSession;
- (void)_endPaymentAuthorizationWithWillUpdateState:(BOOL)a3;
- (void)_endSessionExchange;
- (void)_endTransition:(BOOL)a3;
- (void)_executeNextSessionExchangeTask;
- (void)_executePendingGlyphStateCompletionHandlers:(BOOL)a3;
- (void)_executeTransitionCompletionHandlers:(BOOL)a3;
- (void)_fetchBarcodeForPassUniqueIdentifier:(id)a3 shouldReregisterIfNecessary:(BOOL)a4 withCompletion:(id)a5;
- (void)_finishHoldingTerminalTransactionSubstateAfterDelay:(double)a3;
- (void)_handleContactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4;
- (void)_handleReceivedBarcodePaymentTransaction:(id)a3;
- (void)_insertPaymentTransactionForActiveBarcode;
- (void)_openURL:(id)a3;
- (void)_passcodeFallbackButtonPressed:(id)a3;
- (void)_performActivationStateUpdate:(id)a3;
- (void)_performApplicationRedirectForTransaction:(id)a3;
- (void)_performAuthentication;
- (void)_performAuthenticationForTransactionIfNecessary:(id)a3;
- (void)_performPaymentPINCollectionForTransaction:(id)a3;
- (void)_performTransactionSignatureSubmissionForTransaction:(id)a3;
- (void)_performUserConfirmationForTransaction:(id)a3;
- (void)_postDidAuthorizeNotification;
- (void)_postDidDeauthorizeNotification;
- (void)_presentPassWithUniqueIdentifier:(id)a3 additionalPassUniqueIdentifiers:(id)a4;
- (void)_presentPassWithUniqueIdentifier:(id)a3 additionalPassUniqueIdentifiers:(id)a4 payState:(int64_t)a5;
- (void)_processPaymentTransactionForContext:(id)a3 withCompletion:(id)a4;
- (void)_processValueAddedServiceTransactionsForContext:(id)a3 withCompletion:(id)a4;
- (void)_promoteToAuthorizedStateIfPossible;
- (void)_reloadTiles;
- (void)_reportPassPresentedForPayment:(id)a3;
- (void)_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)_resetActiveApplicationForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)_resetCardEmulationWithCompletion:(id)a3;
- (void)_resetToIdleState;
- (void)_resetToIdleStateAfterDelay:(double)a3;
- (void)_resetTransactionAuthenticationIfNecessary;
- (void)_retrieveDecryptedBarcodeWithAuthorization:(id)a3 shouldFetchBarcodeIfNecessary:(BOOL)a4 completion:(id)a5;
- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_setTransactionAuthenticationInProgress:(BOOL)a3;
- (void)_setTransactionAuthenticationUIActive:(BOOL)a3;
- (void)_setUserIntentRequired:(BOOL)a3;
- (void)_setUserIntentStyle:(int64_t)a3;
- (void)_setVASInfoViewHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setValueAddedServicePasses:(id)a3;
- (void)_showEmphasisButtonForStateIfPossible:(int64_t)a3;
- (void)_showInstallAssociatedApplicationInstructionsIfNecessary;
- (void)_showTerminalIsNotRequestingPaymentError;
- (void)_showTerminalIsRequestingPaymentError;
- (void)_submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)_submitSignatureForTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)_submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)_transactionAwardsViewTapped:(id)a3;
- (void)_transitionToState:(int64_t)a3 withTextOverride:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)_transitionViewsFromPayState:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateApplicationsView;
- (void)_updateAuthenticatorState;
- (void)_updateBottomTextView;
- (void)_updateCoachingInstruction;
- (void)_updateContentPrimaryView;
- (void)_updateContentSecondaryView;
- (void)_updateDigitalCarKeyAssertion;
- (void)_updatePhysicalButtonRequirement;
- (void)_updateVASInfoViewSuppressedTransactionIfNecessary;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)coachingStateDidChange;
- (void)compactNavigationContainerControllerReceivedExternalTap:(id)a3;
- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5;
- (void)contactlessInterfaceSession:(id)a3 didReceiveExpressTransactionState:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didSuspendWithToken:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)contactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4;
- (void)contactlessInterfaceSessionDidExitField:(id)a3;
- (void)contactlessInterfaceSessionDidFail:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6;
- (void)contactlessInterfaceSessionDidFailDeferredAuthorization:(id)a3;
- (void)contactlessInterfaceSessionDidFailTransaction:(id)a3 forPaymentApplication:(id)a4 paymentPass:(id)a5;
- (void)contactlessInterfaceSessionDidReceiveActivityTimeout:(id)a3;
- (void)contactlessInterfaceSessionDidReceiveUntrustedTerminal:(id)a3;
- (void)contactlessInterfaceSessionDidResume:(id)a3;
- (void)contactlessInterfaceSessionDidSelectPayment:(id)a3;
- (void)contactlessInterfaceSessionDidStartTransaction:(id)a3 withContext:(id)a4;
- (void)contactlessInterfaceSessionDidTerminate:(id)a3;
- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4;
- (void)contactlessInterfaceSessionDidTimeout:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6;
- (void)contactlessInterfaceSessionHasPendingServerRequest:(id)a3;
- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)dataReleaseViewController:(id)a3 didAuthorizeWithExternalAuthorizationData:(id)a4 dataToRelease:(id)a5;
- (void)dataReleaseViewController:(id)a3 didFinishWithError:(id)a4;
- (void)dataReleaseViewController:(id)a3 didResolveToMerchant:(id)a4;
- (void)dealloc;
- (void)didBecomeHiddenAnimated:(BOOL)a3;
- (void)didBecomeVisibleAnimated:(BOOL)a3;
- (void)dismissPasscodeViewController;
- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)layoutSubviews;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)passTileGroupView:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)passcodeViewController:(id)a3 didGenerateEncryptedPasscode:(id)a4;
- (void)passcodeViewController:(id)a3 requestSessionExchangeTokenWithHandler:(id)a4;
- (void)passcodeViewControllerDidCancel:(id)a3;
- (void)passcodeViewControllerDidEndSessionExchange:(id)a3;
- (void)payStateView:(id)a3 revealingCheckmark:(BOOL)a4;
- (void)payStateViewRevealingFailure:(id)a3;
- (void)paymentApplicationView:(id)a3 didSelectApplication:(id)a4 completion:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)showFullScreenBarcode;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)willBecomeHiddenAnimated:(BOOL)a3;
- (void)willBecomeVisibleAnimated:(BOOL)a3;
@end

@implementation PKPassPaymentContainerView

+ (BOOL)userIntentPotentiallyRequiredForPass:(id)a3 fieldDetect:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [v5 passType] != 1 && !v4;
  if (v6
    || ([v5 paymentPass],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isIdentityPass],
        v7,
        (v8 & 1) != 0))
  {
    char IsAvailable = 0;
  }
  else
  {
    char IsAvailable = PKUserIntentIsAvailable();
  }

  return IsAvailable;
}

+ (BOOL)initialPhysicalButtonRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5
{
  return [a1 _initialUserIntentRequiredAssumptionForPass:a3 context:a4 paymentService:a5 requirePhysicalButton:1];
}

+ (BOOL)initialUserIntentRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5
{
  return [a1 _initialUserIntentRequiredAssumptionForPass:a3 context:a4 paymentService:a5 requirePhysicalButton:0];
}

+ (BOOL)_initialUserIntentRequiredAssumptionForPass:(id)a3 context:(id)a4 paymentService:(id)a5 requirePhysicalButton:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!objc_msgSend(a1, "userIntentPotentiallyRequiredForPass:fieldDetect:", v10, objc_msgSend(v11, "isFieldDetect")))goto LABEL_4; {
  uint64_t v13 = [MEMORY[0x1E4F88108] userIntentStyle];
  }
  if ([MEMORY[0x1E4F88108] isUserIntentAvailableWithStyle:v13]) {
    goto LABEL_4;
  }
  char v14 = [MEMORY[0x1E4F88108] cachedStateForPolicy:0];
  if ((v14 & 1) == 0) {
    goto LABEL_4;
  }
  if (PKPearlIsAvailable())
  {
    if (v13 != 1 && v6) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  BOOL v15 = 0;
  BOOL v17 = (v14 & 4) == 0;
  if (v6) {
    BOOL v17 = v13 == 1;
  }
  if ((v14 & 4) == 0 && v17)
  {
LABEL_14:
    if ((PKRunningInRemoteContext() & 1) != 0
      || ([v11 isFieldDetect] & 1) != 0
      || [v12 hasPaymentDeviceFieldProperties])
    {
      if ([v10 passType] == 1)
      {
        v18 = (void *)RequiredExpressApplicationsForAutomaticAuthorization(v10, v11, v12, 0);
        BOOL v15 = [v18 count] == 0;
      }
      else
      {
        BOOL v15 = 1;
      }
      goto LABEL_5;
    }
LABEL_4:
    BOOL v15 = 0;
  }
LABEL_5:

  return v15;
}

+ (BOOL)shouldAutomaticallyAuthorizeForPass:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 passType] == 1)
  {
    char v7 = 0;
  }
  else if ([v6 isFieldDetect])
  {
    if (PKUIOnlyDemoModeEnabled()) {
      char v7 = 1;
    }
    else {
      char v7 = PKStoreDemoModeEnabled();
    }
  }
  else
  {
    char v8 = [v5 nfcPayload];
    if (([v8 requiresAuthentication] & 1) != 0 && (PKUIOnlyDemoModeEnabled() & 1) == 0) {
      char v7 = PKStoreDemoModeEnabled();
    }
    else {
      char v7 = 1;
    }
  }
  return v7;
}

- (void)_reportPassPresentedForPayment:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 secureElementPass];
  if (v5)
  {
    v50 = v4;
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v49 setObject:*MEMORY[0x1E4F86400] forKey:*MEMORY[0x1E4F86308]];
    id v6 = (id)*MEMORY[0x1E4F86788];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [v5 devicePaymentApplications];
    uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    v52 = v5;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v54;
      id v10 = (void *)*MEMORY[0x1E4F86790];
      while (2)
      {
        for (i = 0; i != (__CFString *)v8; i = (__CFString *)((char *)i + 1))
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if ([v11 supportsExpress])
          {
            id v20 = (id)*MEMORY[0x1E4F86780];

            id v6 = v20;
            goto LABEL_14;
          }
          id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
          uint64_t v13 = [v11 secureElementIdentifier];
          char v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);

          BOOL v15 = PKDeviceClass();
          v16 = [MEMORY[0x1E4F84828] fromDeviceVersion];
          BOOL v17 = [v5 eligibleExpressUpgradeRequestsForDeviceClass:v15 deviceSEIDs:v14 deviceVersion:v16 technologyTest:&__block_literal_global_200];
          uint64_t v18 = [v17 count];

          if (v18)
          {
            id v19 = v10;

            id v6 = v19;
          }

          id v5 = v52;
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    [v49 safelySetObject:v6 forKey:*MEMORY[0x1E4F86778]];
    id v21 = v49;
    id v4 = v50;
    id v22 = v50;
    v23 = v22;
    if (!v22 || !v21) {
      goto LABEL_40;
    }
    uint64_t v24 = [v22 passType];
    v25 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v24 + 1) >= 3) {
      v26 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      v26 = off_1E59DD798[v24 + 1];
    }
    [v21 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v27 = [v23 style];
    if (v27 < 0xD && ((0x13FFu >> v27) & 1) != 0) {
      v28 = off_1E59DD7B0[v27];
    }
    else {
      v28 = (__CFString *)*v25;
    }
    [v21 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    v29 = [v23 nfcPayload];
    v30 = PKAnalyticsReportSwitchToggleResultValue();
    [v21 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v31 = v23;
    if ([v31 passType] == 1)
    {
      v32 = [v31 secureElementPass];
      unint64_t v33 = [v32 cardType];
      if (v33 <= 4) {
        i = (__CFString *)**((id **)&unk_1E59DD818 + v33);
      }
    }
    else
    {
      i = @"other";
    }

    [v21 setObject:i forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    v34 = [v31 secureElementPass];
    if ([v34 isIdentityPass])
    {
      uint64_t v35 = [v34 identityType];
      if ((unint64_t)(v35 - 1) < 3)
      {
        v36 = off_1E59DD840[v35 - 1];
        goto LABEL_35;
      }
    }
    else if ([v34 isAccessPass])
    {
      unint64_t v37 = [v34 accessType];
      if (v37 < 7)
      {
        v36 = off_1E59DD858[v37];
        goto LABEL_35;
      }
    }
    v36 = (__CFString *)*v25;
LABEL_35:

    [v21 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    v38 = [v31 secureElementPass];
    v39 = [v38 devicePaymentApplications];
    [v39 count];

    v40 = PKAnalyticsReportSwitchToggleResultValue();

    [v21 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    v41 = [v31 secureElementPass];
    id v42 = *v25;
    v43 = [v41 organizationName];
    if ([v43 length])
    {
      unint64_t v44 = [v41 cardType];
      if (v44 <= 4 && ((1 << v44) & 0x16) != 0)
      {
        id v45 = v43;

        id v42 = v45;
      }
    }

    [v21 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
LABEL_40:

    v46 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v47 = *MEMORY[0x1E4F87058];
    v57[0] = *MEMORY[0x1E4F87010];
    v57[1] = v47;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    [v46 subjects:v48 sendEvent:v21];

    id v5 = v52;
  }
}

uint64_t __61__PKPassPaymentContainerView__reportPassPresentedForPayment___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F84FC0] supportsExpressForAutomaticSelectionTechnologyType:a2];
}

- (PKPassPaymentContainerView)initWithPass:(id)a3 passView:(id)a4 context:(id)a5 paymentSession:(id)a6 paymentService:(id)a7
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v88 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v91.receiver = self;
  v91.super_class = (Class)PKPassPaymentContainerView;
  v16 = [(PKPassFooterContentView *)&v91 initWithPass:v12 presentationContext:v13];
  BOOL v17 = v16;
  if (v16)
  {
    id v87 = v15;
    objc_storeStrong((id *)&v16->_passView, a4);
    uint64_t v18 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E4F88108]);
    authenticator = v17->_authenticator;
    v17->_authenticator = v18;

    id v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v17->_authenticator;
      *(_DWORD *)buf = 134218496;
      v93 = v17;
      __int16 v94 = 2048;
      id v95 = v14;
      __int16 v96 = 2048;
      v97 = v21;
      _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): initializing with session %p and authenticator %p.", buf, 0x20u);
    }

    [(PKPassPaymentContainerView *)v17 _reportPassPresentedForPayment:v12];
    id v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(v22, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    v85 = v23;
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.passkit.authorization", v23);
    authorizationQueue = v17->_authorizationQueue;
    v17->_authorizationQueue = (OS_dispatch_queue *)v24;

    v17->_userIntentStyle = PKUserIntentIsAvailable();
    v26 = [v12 paymentPass];
    if ([v26 isStoredValuePass])
    {
      uint64_t v27 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v26];
      transitBalanceModel = v17->_transitBalanceModel;
      v17->_transitBalanceModel = (PKTransitBalanceModel *)v27;
    }
    if ([(PKPassFooterContentView *)v17 style] == 3)
    {
      v29 = [[PKLinkedApplication alloc] initWithPass:v26];
      linkedApplication = v17->_linkedApplication;
      v17->_linkedApplication = v29;

      [(PKLinkedApplication *)v17->_linkedApplication addObserver:v17];
      [(PKLinkedApplication *)v17->_linkedApplication reloadApplicationStateIfNecessary];
      id v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      linkedApplicationUpdateCompletionHandlers = v17->_linkedApplicationUpdateCompletionHandlers;
      v17->_linkedApplicationUpdateCompletionHandlers = v31;
    }
    v86 = v14;
    if (v87)
    {
      objc_storeStrong((id *)&v17->_paymentService, a7);
      [(PKPaymentService *)v17->_paymentService setDelegate:v17];
    }
    else
    {
      uint64_t v33 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v17];
      paymentService = v17->_paymentService;
      v17->_paymentService = (PKPaymentService *)v33;
    }
    uint64_t v35 = [v26 devicePrimaryPaymentApplication];
    v36 = [v35 subcredentials];
    uint64_t v37 = [v36 anyObject];

    if (v37)
    {
      v38 = v17->_paymentService;
      v39 = [v35 applicationIdentifier];
      [(PKPassPaymentContainerView *)v17 _calculateTerminalStateWithRangingSuspensionReasons:[(PKPaymentService *)v38 rangingSuspensionReasonForAppletSubcredential:v37 forPaymentApplicationID:v39]];
    }
    v83 = (void *)v37;
    v84 = v35;
    uint64_t v40 = [MEMORY[0x1E4F84898] sharedInstance];
    passLibrary = v17->_passLibrary;
    v17->_passLibrary = (PKPassLibrary *)v40;

    [(PKAuthenticator *)v17->_authenticator setDelegate:v17];
    objc_storeStrong((id *)&v17->_contactlessInterfaceSession, a6);
    [(PKContactlessInterfaceSession *)v17->_contactlessInterfaceSession setDelegate:v17];
    id v42 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v43 = [v42 fixedCoordinateSpace];
    fixedScreenCoordinateSpace = v17->_fixedScreenCoordinateSpace;
    v17->_fixedScreenCoordinateSpace = (UICoordinateSpace *)v43;

    id v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transitionCompletionHandlers = v17->_transitionCompletionHandlers;
    v17->_transitionCompletionHandlers = v45;

    uint64_t v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingGlyphStateCompletionHandlers = v17->_pendingGlyphStateCompletionHandlers;
    v17->_pendingGlyphStateCompletionHandlers = v47;

    v17->_VASInfoViewHidden = 1;
    int v49 = [v13 wasAutomaticallySelected];
    double Current = 0.0;
    if (v49) {
      double Current = CFAbsoluteTimeGetCurrent();
    }
    v17->_lastFieldExitTime = Current;
    if ([v26 hasAssociatedPeerPaymentAccount])
    {
      v51 = [(PKPassLibrary *)v17->_passLibrary peerPaymentPassUniqueID];
      v52 = [v12 uniqueID];
      int v53 = [v51 isEqualToString:v52];

      if (v53)
      {
        uint64_t v54 = [MEMORY[0x1E4F84E00] sharedInstance];
        peerPaymentService = v17->_peerPaymentService;
        v17->_peerPaymentService = (PKPeerPaymentService *)v54;

        id v56 = objc_alloc_init(MEMORY[0x1E4F1B980]);
        v82 = [MEMORY[0x1E4F84D88] requiredContactKeys];
        uint64_t v57 = [objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v56 keysToFetch:v82];
        transactionFooterContactResolver = v17->_transactionFooterContactResolver;
        v17->_transactionFooterContactResolver = (PKContactResolver *)v57;

        uint64_t v59 = [PKPeerPaymentAccountResolutionController alloc];
        v60 = [(PKPeerPaymentService *)v17->_peerPaymentService account];
        v61 = [MEMORY[0x1E4F84E10] sharedService];
        id v62 = objc_alloc_init(MEMORY[0x1E4F848A0]);
        uint64_t v63 = [(PKPeerPaymentAccountResolutionController *)v59 initWithAccount:v60 webService:v61 context:0 delegate:0 passLibraryDataProvider:v62];
        peerPaymentAccountResolutionController = v17->_peerPaymentAccountResolutionController;
        v17->_peerPaymentAccountResolutionController = (PKPeerPaymentAccountResolutionController *)v63;
      }
    }
    [(PKPassPaymentContainerView *)v17 _configureForStyle:[(PKPassFooterContentView *)v17 style] context:v13];
    v65 = [(PKPassPaymentPayStateView *)v17->_payStateView glyph];
    objc_msgSend(v65, "setFadeOnRecognized:", -[PKContactlessInterfaceSession fieldPresent](v17->_contactlessInterfaceSession, "fieldPresent"));
    v66 = NSStringFromSelector(sel_state);
    [v65 addObserver:v17 forKeyPath:v66 options:0 context:&KVOContext];

    v67 = +[PKUIForegroundActiveArbiter sharedInstance];
    v68 = v67;
    p_foregroundActiveState = &v17->_foregroundActiveState;
    if (v67)
    {
      $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)[v67 registerObserver:v17];
      v17->_deactivationReasons = [v68 registerDeactivationObserver:v17];
    }
    else
    {
      $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)257;
    }
    v17->_pendingPayState = 0;
    v17->_currentPayState = 0;
    payStateView = v17->_payStateView;
    if (payStateView && [(PKPassPaymentPayStateView *)payStateView persistentEmulationHint]) {
      [v86 queuePersistentCardEmulation];
    }
    [(PKPassPaymentContainerView *)v17 _commitPendingPayStateAnimated:0];
    if (PKRunningInRemoteContext() && (PKPearlIsAvailable() & 1) == 0)
    {
      v71 = v17->_authenticator;
      dispatch_time_t v72 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__PKPassPaymentContainerView_initWithPass_passView_context_paymentSession_paymentService___block_invoke;
      block[3] = &unk_1E59CA7D0;
      v90 = v71;
      v73 = v71;
      dispatch_after(v72, MEMORY[0x1E4F14428], block);
    }
    int v74 = [v13 wantsForcedPayment];
    if (v74) {
      LOBYTE(v74) = [v13 wasForcedFromButton];
    }
    v17->_presentationWasForcedFromButton = v74;
    v17->_presentationWasForFieldDetect = [v13 isFieldDetect];
    v75 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessionExchangeTaskQueue = v17->_sessionExchangeTaskQueue;
    v17->_sessionExchangeTaskQueue = v75;

    uint64_t v77 = [v13 externalizedAuthenticationContext];
    authorizedExternalizedContext = v17->_authorizedExternalizedContext;
    v17->_authorizedExternalizedContext = (NSData *)v77;

    if (v17->_pendingAutomaticAuthorization
      || !v17->_authorizedExternalizedContext
      || [(PKPassFooterContentView *)v17 style] == 4)
    {
      goto LABEL_31;
    }
    uint64_t v80 = [MEMORY[0x1E4F88108] userIntentStyle];
    if (v80)
    {
      if (v80 != 1)
      {
LABEL_31:

        id v14 = v86;
        id v15 = v87;
        goto LABEL_32;
      }
      char v81 = [MEMORY[0x1E4F88108] isUserIntentAvailableWithStyle:1];
    }
    else
    {
      char v81 = 1;
    }
    v17->_pendingAutomaticAuthorization = v81;
    goto LABEL_31;
  }
  InvalidateSession_0(v14, 0);
LABEL_32:

  return v17;
}

void __90__PKPassPaymentContainerView_initWithPass_passView_context_paymentSession_paymentService___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) fingerPresent];

  JUMPOUT(0x1A6220EC0);
}

- (void)dealloc
{
  v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v3 unregisterObserver:self];
  [v3 unregisterDeactivationObserver:self];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [(PKPaymentService *)self->_paymentService setDelegate:0];
  [(PKAuthenticator *)self->_authenticator invalidate];
  [(PKAuthenticator *)self->_authenticator setDelegate:0];
  authenticator = self->_authenticator;
  self->_authenticator = 0;

  [(PKPassPaymentContainerView *)self _endContactlessPaymentSession];
  payStateView = self->_payStateView;
  if (payStateView)
  {
    uint64_t v7 = [(PKPassPaymentPayStateView *)payStateView glyph];
    uint64_t v8 = NSStringFromSelector(sel_state);
    [v7 removeObserver:self forKeyPath:v8 context:&KVOContext];
  }
  transactionResolutionTimer = self->_transactionResolutionTimer;
  if (transactionResolutionTimer)
  {
    dispatch_source_cancel(transactionResolutionTimer);
    id v10 = self->_transactionResolutionTimer;
    self->_transactionResolutionTimer = 0;
  }
  transactionTerminalResponseTimer = self->_transactionTerminalResponseTimer;
  if (transactionTerminalResponseTimer)
  {
    dispatch_source_cancel(transactionTerminalResponseTimer);
    id v12 = self->_transactionTerminalResponseTimer;
    self->_transactionTerminalResponseTimer = 0;
  }
  [(PKPassPaymentContainerView *)self _executePendingGlyphStateCompletionHandlers:1];
  [(PKPassPaymentContainerView *)self _executeTransitionCompletionHandlers:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseVC);

  if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_dataReleaseVC);
    id v15 = [v14 presentingViewController];
    [v15 dismissViewControllerAnimated:1 completion:0];

    objc_storeWeak((id *)&self->_dataReleaseVC, 0);
  }

  v16.receiver = self;
  v16.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v16 dealloc];
}

- (void)layoutSubviews
{
  v91.receiver = self;
  v91.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v91 layoutSubviews];
  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView) {
    [(LAUIPhysicalButtonView *)physicalButtonView updateFrame];
  }
  int64_t v4 = [(PKPassFooterContentView *)self style];
  id v5 = [(PKPassFooterContentView *)self bottomRule];
  id v6 = [v5 superview];
  if (v6)
  {
    [v5 alpha];
    BOOL v8 = v7 > 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  BOOL v9 = (unint64_t)(v4 - 1) < 3 && v8;
  [(PKPassPaymentContainerView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(PKPassPaymentContainerView *)self _topMargin];
  double v19 = v18 + v13;
  if (v8)
  {
    [v5 frame];
    double v20 = CGRectGetMinY(v92) - v19;
  }
  else
  {
    double v20 = v17 - (v18 + 0.0);
  }
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = v11 + 0.0;
  remainder.origin.double y = v19;
  remainder.size.CGFloat width = v15;
  remainder.size.CGFloat height = v20;
  if (self->_applicationsView)
  {
    v93.origin.CGFloat x = v11 + 0.0;
    v93.origin.double y = v19;
    v93.size.CGFloat width = v15;
    v93.size.CGFloat height = v20;
    CGRectDivide(v93, &slice, &remainder, 85.0, CGRectMinYEdge);
    -[PKPassPaymentApplicationView setFrame:](self->_applicationsView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v85 = v19;
  double v86 = v11 + 0.0;
  [(PKPassValueAddedServiceInfoView *)self->_valueAddedServiceInfoView alpha];
  double v22 = v21;
  BOOL rect = v9;
  double v23 = v20;
  if ([(PKPassPaymentContainerView *)self _shouldDisplayPrimaryView])
  {
    -[UIView sizeThatFits:](self->_displayedPrimaryView, "sizeThatFits:", v15, 1.79769313e308);
    CGFloat v25 = v24;
    displayedPrimaryView = self->_displayedPrimaryView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](displayedPrimaryView, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, v25, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  }
  valueAddedServiceInfoView = self->_valueAddedServiceInfoView;
  if (valueAddedServiceInfoView)
  {
    -[PKPassValueAddedServiceInfoView sizeThatFits:](valueAddedServiceInfoView, "sizeThatFits:", v15, 1.79769313e308);
    CGFloat v29 = v28;
    v30 = self->_valueAddedServiceInfoView;
    PKSizeAlignedInRect();
    -[PKPassValueAddedServiceInfoView setFrame:](v30, "setFrame:");
    if (v22 > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, v29, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    }
  }
  if ([(PKPassPaymentContainerView *)self _shouldDisplaySecondaryView])
  {
    -[UIView sizeThatFits:](self->_displayedSecondaryView, "sizeThatFits:", v15, 1.79769313e308);
    CGFloat v32 = v31;
    displayedSecondaryView = self->_displayedSecondaryView;
    PKSizeAlignedInRect();
    -[UIView setFrame:](displayedSecondaryView, "setFrame:");
    if (v22 <= 0.0) {
      CGRectDivide(remainder, &slice, &remainder, v32, CGRectMinYEdge);
    }
  }
  CGFloat v35 = v19;
  CGFloat v34 = v86;
  CGFloat v36 = v23;
  if ([(PKPassFooterContentView *)self style] == 3)
  {
    double y = remainder.origin.y;
    PKPassFrontFaceContentSize();
    if (y <= v85 + v38 - v39)
    {
      PKPassFrontFaceContentSize();
      double v40 = v85 + v41 - v42;
    }
    else
    {
      double v40 = remainder.origin.y;
    }
    remainder.origin.double y = v40;
  }
  [(PKPassPaymentPayStateView *)self->_payStateView alpha];
  if (v43 <= 0.0)
  {
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    CGRect v88 = remainder;
    v87[2] = __44__PKPassPaymentContainerView_layoutSubviews__block_invoke;
    v87[3] = &unk_1E59CBC90;
    v87[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v87];
  }
  else
  {
    -[PKPassPaymentPayStateView setFrame:](self->_payStateView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    [(PKPassPaymentPayStateView *)self->_payStateView layoutIfNeeded];
  }
  remainder.origin.CGFloat x = v86;
  remainder.origin.double y = v85;
  remainder.size.CGFloat width = v15;
  remainder.size.CGFloat height = v36;
  if (self->_applicationsView)
  {
    v94.origin.CGFloat x = v86;
    v94.origin.double y = v85;
    v94.size.CGFloat width = v15;
    v94.size.CGFloat height = v36;
    CGRectDivide(v94, &slice, &remainder, 85.0, CGRectMinYEdge);
  }
  unint64_t v44 = self->_displayedPrimaryView;
  if (v44)
  {
    [(UIView *)v44 alpha];
    if (v45 > 0.0)
    {
      [(UIView *)self->_displayedPrimaryView frame];
      CGRectDivide(remainder, &slice, &remainder, v46, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    }
  }
  uint64_t v47 = self->_valueAddedServiceInfoView;
  if (v47 && v22 > 0.0)
  {
    [(PKPassValueAddedServiceInfoView *)v47 frame];
    CGRectDivide(remainder, &slice, &remainder, v48, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  }
  int v49 = self->_displayedSecondaryView;
  if (v49)
  {
    [(UIView *)v49 alpha];
    if (v50 > 0.0 && v22 <= 0.0)
    {
      [(UIView *)self->_displayedSecondaryView frame];
      CGRectDivide(remainder, &slice, &remainder, v51, CGRectMinYEdge);
    }
  }
  actionButton = self->_actionButton;
  if (actionButton)
  {
    [(UIButton *)actionButton frame];
    double v54 = v53;
    double v82 = v36;
    if (rect)
    {
      long long v55 = [(PKPassFooterContentView *)self appIconView];
      [v55 frame];
      CGFloat v57 = v56;
      CGFloat v59 = v58;
      CGFloat v81 = v60;
      CGFloat v62 = v61;

      [(PKPassFooterContentView *)self infoButtonFrame];
      CGFloat x = v95.origin.x;
      CGFloat v64 = v95.origin.y;
      CGFloat width = v95.size.width;
      CGFloat height = v95.size.height;
      CGRectGetMinX(v95);
      v96.origin.CGFloat x = v57;
      v96.origin.double y = v59;
      v96.size.CGFloat width = v81;
      v96.size.CGFloat height = v62;
      CGRectGetMaxX(v96);
      v97.origin.CGFloat x = v57;
      v97.origin.double y = v59;
      v97.size.CGFloat width = v81;
      v97.size.CGFloat height = v62;
      CGRectGetMinX(v97);
      v98.origin.CGFloat x = x;
      v98.origin.double y = v64;
      v98.size.CGFloat width = width;
      v98.size.CGFloat height = height;
      CGRectGetMaxX(v98);
      UIRectCenteredYInRect();
      if (v4 != 2 && !PKUIGetMinScreenWidthType()) {
        [(PKPassFooterContentView *)self infoButtonAlpha];
      }
      [(PKPassPaymentPayStateView *)self->_payStateView setLabelStateBottomInset:0.0];
    }
    else
    {
      [(PKPassPaymentPayStateView *)self->_payStateView bounds];
      -[PKPassPaymentContainerView convertRect:fromView:](self, "convertRect:fromView:", self->_payStateView);
      CGFloat MaxY = CGRectGetMaxY(v99);
      [(PKPassPaymentPayStateView *)self->_payStateView setLabelStateBottomInset:MaxY - (MaxY - v54 + -12.0)];
      if (![(PKPassPaymentPayStateView *)self->_payStateView layoutState])
      {
        v67 = [(PKPassPaymentPayStateView *)self->_payStateView label];
        v68 = v67;
        if (v67)
        {
          id v69 = v67;
        }
        else
        {
          id v69 = [(PKPassPaymentPayStateView *)self->_payStateView glyph];
        }
        v70 = v69;

        [v70 bounds];
        -[PKPassPaymentContainerView convertRect:fromView:](self, "convertRect:fromView:", v70);
        CGRectGetMaxY(v100);
      }
    }
    UIRectCenteredXInRect();
    -[UIButton setFrame:](self->_actionButton, "setFrame:");
    CGFloat v35 = v85;
    CGFloat v34 = v86;
    CGFloat v36 = v82;
  }
  else
  {
    [(PKPassPaymentPayStateView *)self->_payStateView setLabelStateBottomInset:0.0];
  }
  bottomTextView = self->_bottomTextView;
  if (bottomTextView)
  {
    [(UITextView *)bottomTextView frame];
    CGFloat v73 = v72;
    CGFloat recta = v74;
    -[UITextView sizeThatFits:](self->_bottomTextView, "sizeThatFits:", v15, 1.79769313e308);
    CGFloat v75 = v15;
    CGFloat v77 = v76;
    CGFloat v79 = v78;
    v101.origin.CGFloat x = v34;
    v101.origin.double y = v35;
    v101.size.CGFloat width = v75;
    v101.size.CGFloat height = v36;
    CGRectGetMaxY(v101);
    v102.origin.CGFloat x = v73;
    v102.origin.double y = recta;
    v102.size.CGFloat width = v77;
    v102.size.CGFloat height = v79;
    CGRectGetHeight(v102);
    UIRectCenteredXInRect();
    -[UITextView setFrame:](self->_bottomTextView, "setFrame:");
  }
}

uint64_t __44__PKPassPaymentContainerView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(*(void *)(a1 + 32) + 496);

  return [v2 layoutIfNeeded];
}

- (double)_topMargin
{
  int64_t v2 = [(PKPassFooterContentView *)self style];
  double v3 = 0.0;
  if ((unint64_t)(v2 - 1) >= 3)
  {
    if (v2 == 4 || !v2) {
      return 10.0;
    }
  }
  else
  {
    unint64_t v4 = PKUIGetMinScreenWidthType();
    if (v4 <= 0xE) {
      return dbl_1A04454A0[v4];
    }
  }
  return v3;
}

- (void)_updateDigitalCarKeyAssertion
{
  double v3 = [(PKPassFooterContentView *)self paymentPass];
  id dckAssertion = self->_dckAssertion;
  if (self->_isVisible)
  {
    if (!dckAssertion)
    {
      id v5 = [v3 paymentApplications];
      id v6 = objc_msgSend(v5, "pk_anyObjectPassingTest:", &__block_literal_global_90);
      double v7 = [v6 subcredentials];
      BOOL v8 = [v7 anyObject];

      if (v8)
      {
        if ([v3 isCarKeyPass])
        {
          BOOL v9 = (void *)PKGetClassNFDigitalCarKeySession();
          double v10 = [v8 identifier];
          uint64_t v21 = 0;
          double v11 = (id *)&v21;
          uint64_t v12 = [v9 requestAssertionForKeyID:v10 options:0 outError:&v21];
LABEL_10:
          double v15 = (void *)v12;
          id v16 = *v11;
          id v17 = self->_dckAssertion;
          self->_id dckAssertion = v15;

          if (!self->_dckAssertion && v16)
          {
            double v18 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)double v19 = 0;
              _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Failed to acquire DCK key assertion", v19, 2u);
            }
          }
          goto LABEL_16;
        }
        if ([v3 isHomeKeyPass])
        {
          double v14 = (void *)PKGetClassNFUnifiedAccessSession();
          double v10 = [v8 identifier];
          uint64_t v20 = 0;
          double v11 = (id *)&v20;
          uint64_t v12 = [v14 requestAssertionForKeyID:v10 options:0 error:&v20];
          goto LABEL_10;
        }
      }
      id v16 = 0;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_7;
  }
  if (dckAssertion)
  {
LABEL_7:
    [dckAssertion performSelector:sel_invalidate];
    id v13 = self->_dckAssertion;
    self->_id dckAssertion = 0;
  }
LABEL_17:
}

unint64_t __59__PKPassPaymentContainerView__updateDigitalCarKeyAssertion__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 supportedRadioTechnologies] >> 1) & 1;
}

- (BOOL)isPassAuthorized
{
  if ([(PKPassFooterContentView *)self style] == 3) {
    return self->_activeBarcodeIdentifier != 0;
  }
  else {
    return [(PKContactlessInterfaceSession *)self->_contactlessInterfaceSession state] == 2;
  }
}

- (void)willBecomeVisibleAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v7 willBecomeVisibleAnimated:a3];
  self->_isVisible = 1;
  self->_lastFieldExitTime = CFAbsoluteTimeGetCurrent();
  [(PKPassPaymentContainerView *)self _updateDigitalCarKeyAssertion];
  if (self->_failureReason)
  {
    [(PKPassPaymentContainerView *)self _applyTerminalFailureState];
    return;
  }
  pendingPresentationContextState = self->_pendingPresentationContextState;
  if (pendingPresentationContextState)
  {
    uint64_t v5 = [(NSNumber *)pendingPresentationContextState integerValue];
    if (v5 == 8)
    {
      [(PKPassPaymentContainerView *)self _setGlyphState:8 animated:0];
      return;
    }
    if (v5) {
      return;
    }
  }
  if (self->_didBecomeHiddenWhileAuthorized)
  {
    id v6 = [(PKPassFooterContentView *)self pass];
    self->_pendingAutomaticAuthorization = +[PKPassPaymentContainerView shouldAutomaticallyAuthorizeForPass:v6 withContext:0];

    self->_didBecomeHiddenWhileAuthorized = 0;
  }
  [(PKPassPaymentContainerView *)self _resetToIdleState];
}

- (void)didBecomeVisibleAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v7 didBecomeVisibleAnimated:a3];
  pendingPresentationContextState = self->_pendingPresentationContextState;
  if (pendingPresentationContextState)
  {
    uint64_t v5 = [(NSNumber *)pendingPresentationContextState integerValue];
    id v6 = self->_pendingPresentationContextState;
    self->_pendingPresentationContextState = 0;

    if (v5) {
      [(PKPassPaymentContainerView *)self _applyPresentationPayState:v5];
    }
  }
  self->_presentationWasForcedFromButton = 0;
}

- (void)willBecomeHiddenAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v4 willBecomeHiddenAnimated:a3];
  self->_didBecomeHiddenWhileAuthorized = self->_currentPayState == 5;
  self->_isVisible = 0;
  [(PKPassPaymentContainerView *)self _updateDigitalCarKeyAssertion];
  [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:1];
  [(PKPassPaymentContainerView *)self dismissPasscodeViewController];
}

- (void)didBecomeHiddenAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v4 didBecomeHiddenAnimated:a3];
  [(PKPassPaymentContainerView *)self _cancelHoldingTerminalTransactionSubstateIfNecessary];
  [(PKPassPaymentContainerView *)self _applyPayState:0];
  [(PKPassPaymentContainerView *)self _endContactlessPaymentSession];
  self->_didBecomeHiddenWhileAuthorized = 0;
  self->_presentationWasForFieldDetect = 0;
}

- (void)coachingStateDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v3 coachingStateDidChange];
  [(PKPassPaymentContainerView *)self _updateCoachingInstruction];
}

- (void)showFullScreenBarcode
{
  if (self->_activeBarcodeIdentifier && self->_activeBarcodeCredential)
  {
    p_barcodeViewController = &self->_barcodeViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_barcodeViewController);
    if (!WeakRetained)
    {
      if (![(PKPassPaymentContainerView *)self _authenticationAllowed]) {
        return;
      }
      uint64_t v5 = [PKPaymentBarcodeViewController alloc];
      id v6 = [(PKPassFooterContentView *)self paymentPass];
      id obj = [(PKPaymentBarcodeViewController *)v5 initWithPass:v6];

      [(PKPaymentBarcodeViewController *)obj setBarcodeData:self->_activeBarcodeCredential];
      objc_super v7 = [(UIView *)self pkui_viewControllerFromResponderChain];
      [v7 presentViewController:obj animated:1 completion:0];

      objc_storeWeak((id *)p_barcodeViewController, obj);
      id WeakRetained = obj;
    }
  }
}

- (void)_didInvalidate
{
  [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:0];
  [(PKPassPaymentContainerView *)self _endContactlessPaymentSession];
  authenticator = self->_authenticator;
  if (authenticator)
  {
    [(PKAuthenticator *)authenticator invalidate];
    [(PKAuthenticator *)self->_authenticator setDelegate:0];
    objc_super v4 = self->_authenticator;
    self->_authenticator = 0;
  }
  id dckAssertion = self->_dckAssertion;
  if (dckAssertion)
  {
    [dckAssertion performSelector:sel_invalidate];
    id v6 = self->_dckAssertion;
    self->_id dckAssertion = 0;
  }
  payStateView = self->_payStateView;
  if (payStateView)
  {
    [(PKPassPaymentPayStateView *)payStateView setDelegate:0];
    BOOL v8 = [(PKPassPaymentPayStateView *)self->_payStateView glyph];
    BOOL v9 = NSStringFromSelector(sel_state);
    [v8 removeObserver:self forKeyPath:v9 context:&KVOContext];

    [(PKPassPaymentPayStateView *)self->_payStateView removeFromSuperview];
    double v10 = self->_payStateView;
    self->_payStateView = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PKPassPaymentContainerView;
  [(PKPassFooterContentView *)&v11 _didInvalidate];
}

- (void)paymentApplicationView:(id)a3 didSelectApplication:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void))a5;
  objc_super v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Did select payment application button", (uint8_t *)buf, 2u);
  }

  if ([(PKPassPaymentContainerView *)self _recognizingBiometrics]
    || self->_authenticating && ([(PKAuthenticator *)self->_authenticator fingerPresent] & 1) != 0)
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    uint64_t v12 = [(PKPassFooterContentView *)self paymentPass];
    [(PKPassPaymentContainerView *)self _resetActiveApplicationForPaymentPass:v12 withCompletion:0];
    objc_initWeak(buf, self);
    paymentService = self->_paymentService;
    double v14 = [v12 uniqueID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke;
    v15[3] = &unk_1E59DCCF8;
    id v16 = v9;
    objc_copyWeak(&v18, buf);
    id v17 = v10;
    [(PKPaymentService *)paymentService setDefaultPaymentApplication:v16 forPassUniqueIdentifier:v14 completion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

void __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = a2;
    objc_super v7 = [v5 description];
    id v8 = [v6 description];

    *(_DWORD *)buf = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    double v15 = v8;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Set new default payment application %@ for pass %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke_107;
  v9[3] = &unk_1E59CB128;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v11);
}

void __85__PKPassPaymentContainerView_paymentApplicationView_didSelectApplication_completion___block_invoke_107(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _activateForPayment];
    objc_super v3 = v6;
    if (v6[744])
    {
      [v6 _restartPaymentAuthorization];
LABEL_8:
      objc_super v3 = v6;
      goto LABEL_9;
    }
    uint64_t v4 = 21;
    if (!v6[776]) {
      uint64_t v4 = 22;
    }
    if (*(void *)&v6[OBJC_IVAR___PKPassPaymentContainerView__passView[v4]] == 5)
    {
      [v6 _beginPaymentAuthorization];
      goto LABEL_8;
    }
  }
LABEL_9:
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    objc_super v3 = v6;
  }
}

- (BOOL)_recognizingBiometrics
{
  return self->_authenticationEvaluationState == 2;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = a3;
  int64_t authenticationEvaluationState = self->_authenticationEvaluationState;
  self->_int64_t authenticationEvaluationState = var0;
  uint64_t v9 = 21;
  if (!self->_transitioning) {
    uint64_t v9 = 22;
  }
  unint64_t v10 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                            + OBJC_IVAR___PKPassPaymentContainerView__passView[v9]);
  if ([(PKPassPaymentContainerView *)self _authenticationAllowed] && self->_authenticating)
  {
    BOOL v11 = v10 > 6 || ((1 << v10) & 0x4E) == 0;
    if (!v11 && !self->_transactionSubstate)
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__PKPassPaymentContainerView_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke;
      aBlock[3] = &unk_1E59DCD20;
      objc_copyWeak(v30, &location);
      v30[1] = (id)v10;
      uint64_t v12 = _Block_copy(aBlock);
      id v13 = (void (**)(void, void, void, void, void))v12;
      uint64_t v14 = 0;
      uint64_t v15 = 2;
      switch(var0)
      {
        case 0:
          if (var1 == 1)
          {
            if (PKPearlIsAvailable())
            {
              double v23 = PKLocalizedPearlString(&cfstr_GenericPearlFa.isa);
              uint64_t v24 = 1;
              uint64_t v25 = 3;
              goto LABEL_40;
            }
            uint64_t v16 = PKLocalizedPaymentString(&cfstr_PaymentTryAgai.isa);
            goto LABEL_39;
          }
          if (var1 == 3)
          {
            uint64_t v16 = PKLocalizedPearlString(&cfstr_GenericPearlUn.isa);
LABEL_39:
            double v23 = (void *)v16;
            uint64_t v25 = 0;
            uint64_t v24 = 1;
            goto LABEL_40;
          }
          unsigned int IsAvailable = PKPearlIsAvailable();
          double v23 = 0;
          uint64_t v25 = 0;
          if ((unint64_t)(authenticationEvaluationState - 1) < 2) {
            uint64_t v24 = IsAvailable;
          }
          else {
            uint64_t v24 = 0;
          }
LABEL_40:
          if (!PKPearlIsAvailable()
            || (int64_t v27 = [(PKPassFooterContentView *)self coachingState], v28 = 3, v27 != 3) && v10 != 3)
          {
            uint64_t v28 = 1;
          }
          ((void (**)(void, uint64_t, uint64_t, uint64_t, void *))v13)[2](v13, v28, v25, v24, v23);

LABEL_45:
          [(PKPassPaymentContainerView *)self _updateCoachingInstruction];

          objc_destroyWeak(v30);
          objc_destroyWeak(&location);
          break;
        case 1:
          int v21 = PKPearlIsAvailable();
          int64_t v22 = [(PKPassFooterContentView *)self coachingState];
          if (v21) {
            uint64_t v19 = 4;
          }
          else {
            uint64_t v19 = 0;
          }
          if (v22 == 3) {
            uint64_t v20 = 3;
          }
          else {
            uint64_t v20 = 1;
          }
          goto LABEL_22;
        case 2:
          if ((PKPearlIsAvailable() & 1) == 0) {
            kdebug_trace();
          }
          int v17 = PKPearlIsAvailable();
          int64_t v18 = [(PKPassFooterContentView *)self coachingState];
          if (v17) {
            uint64_t v19 = 5;
          }
          else {
            uint64_t v19 = 1;
          }
          if (v18 == 3) {
            uint64_t v20 = 3;
          }
          else {
            uint64_t v20 = 1;
          }
LABEL_22:
          v13[2](v13, v20, v19, 0, 0);
          goto LABEL_45;
        case 3:
          goto LABEL_32;
        case 4:
          uint64_t v14 = 0;
          uint64_t v15 = 3;
          goto LABEL_32;
        case 5:
          if (v10 == 6) {
            goto LABEL_45;
          }
          uint64_t v14 = 8;
          uint64_t v15 = 6;
LABEL_32:
          (*((void (**)(void *, uint64_t, uint64_t, void, void))v12 + 2))(v12, v15, v14, 0, 0);
          goto LABEL_45;
        default:
          goto LABEL_45;
      }
    }
  }
}

void __84__PKPassPaymentContainerView_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40) != a2) {
      [WeakRetained _applyPayState:a2];
    }
    if (a4) {
      [v10 _emphasizeStateIfPossible:a2 withTextOverride:v11 playSystemSound:PKPearlIsAvailable() ^ 1];
    }
    [v10 _setGlyphState:a3 animated:1 withCompletionHandler:0];
  }
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  self->_presentingPasscode = 1;
  ++PresentationTrackingCounter;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke;
  aBlock[3] = &unk_1E59CF408;
  void aBlock[4] = self;
  id v9 = v8;
  id v19 = v9;
  unint64_t v10 = (void (**)(void *, void))_Block_copy(aBlock);
  id v11 = [(UIView *)self pkui_viewControllerFromResponderChain];
  if (!v11
    || ((currentPayState = self->_currentPayState, BOOL v13 = currentPayState > 6,
                                                   uint64_t v14 = (1 << currentPayState) & 0x4E,
                                                   !v13)
      ? (BOOL v15 = v14 == 0)
      : (BOOL v15 = 1),
        v15
     || ([v7 setModalPresentationStyle:6],
         [v7 setModalTransitionStyle:0],
         self->_requiresPasscodeDismissal)))
  {
    v10[2](v10, 0);
  }
  else
  {
    objc_storeWeak((id *)&self->_passcodeVC, v7);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_3;
    v16[3] = &unk_1E59CAA98;
    int v17 = v10;
    [v11 presentViewController:v7 animated:1 completion:v16];
  }
}

void __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 840) = 0;
  objc_super v3 = *(unsigned char **)(a1 + 32);
  if (v3[841])
  {
    uint64_t v4 = 0;
    v3[841] = 0;
    if (!a2) {
      goto LABEL_7;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_2;
    block[3] = &unk_1E59CA7D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (a2)
  {
    uint64_t v4 = 1;
    [v3 _setGlyphState:8 animated:1];
    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
  PKUIEndTrackingPresentation();
}

uint64_t __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissPasscodeViewController];
}

uint64_t __84__PKPassPaymentContainerView_presentPasscodeViewController_completionHandler_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissPasscodeViewController
{
  if (self->_presentingPasscode)
  {
    self->_requiresPasscodeDismissal = 1;
  }
  else
  {
    self->_requiresPasscodeDismissal = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
    objc_storeWeak((id *)&self->_passcodeVC, 0);
    objc_super v3 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v4 = [WeakRetained presentingViewController];
      char v5 = [WeakRetained isBeingDismissed];
      if (v4 && (v5 & 1) == 0) {
        objc_msgSend(v4, "dismissViewControllerAnimated:completion:", -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1, 0);
      }

      objc_super v3 = WeakRetained;
    }
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) paymentPass];
  int64_t v2 = [v10 uniqueID];
  objc_super v3 = *(void **)(a1 + 40);
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    [*(id *)(*(void *)(a1 + 32) + 920) setTransitProperties:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateContentPrimaryView];
    id v9 = *(void **)(a1 + 32);
    [v9 _updateContentSecondaryView];
    return;
  }
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    char v8 = [v4 isEqualToString:v5];

    if ((v8 & 1) == 0) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 1)
  {
    id v10 = [(PKPassFooterContentView *)self paymentPass];
    id v11 = [v10 uniqueID];
    id v12 = v8;
    BOOL v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      if (!v12 || !v11)
      {

        goto LABEL_10;
      }
      char v14 = [v11 isEqualToString:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_10;
      }
    }
    BOOL v15 = [(PKPassPaymentContainerView *)self _groupTileForTiles:v9];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__PKPassPaymentContainerView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    v17[3] = &unk_1E59CA870;
    v17[4] = self;
    id v18 = v15;
    id v16 = v15;
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
LABEL_10:
}

uint64_t __81__PKPassPaymentContainerView_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 608), *(id *)(a1 + 40));
  int64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateContentPrimaryView];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) paymentPass];
  int64_t v2 = [v10 uniqueID];
  objc_super v3 = *(void **)(a1 + 40);
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

    goto LABEL_10;
  }
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {

LABEL_12:
    goto LABEL_13;
  }
  int v8 = [v4 isEqualToString:v5];

  if (!v8) {
    goto LABEL_12;
  }
LABEL_10:
  int v9 = [v10 isStoredValuePass];

  if (v9)
  {
    [*(id *)(*(void *)(a1 + 32) + 920) setDynamicBalances:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateContentPrimaryView];
    [*(id *)(a1 + 32) _updateContentSecondaryView];
  }
LABEL_13:
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__PKPassPaymentContainerView_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) paymentPass];
  objc_super v3 = [v2 uniqueID];
  int v4 = PKEqualObjects();

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 920) updateWithDynamicCommutePlans:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateContentPrimaryView];
    id v5 = *(void **)(a1 + 32);
    [v5 _updateContentSecondaryView];
  }
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v7 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKPassPaymentContainerView_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  block[3] = &unk_1E59CC648;
  void block[4] = self;
  id v10 = v7;
  unint64_t v11 = a5;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__PKPassPaymentContainerView_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) paymentPass];
  int64_t v2 = [v13 devicePrimaryPaymentApplication];
  objc_super v3 = [v2 subcredentials];
  int v4 = [v3 anyObject];
  id v5 = [v4 identifier];
  id v6 = [*(id *)(a1 + 40) identifier];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    [*(id *)(a1 + 32) _calculateTerminalStateWithRangingSuspensionReasons:*(void *)(a1 + 48)];
    id v12 = *(void **)(a1 + 32);
    if (v12[133]) {
      [v12 _applyTerminalFailureState];
    }
    else {
      [v12 _resetToIdleState];
    }
    goto LABEL_13;
  }
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {

    goto LABEL_13;
  }
  char v11 = [v7 isEqualToString:v8];

  if (v11) {
    goto LABEL_10;
  }
LABEL_13:
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPassPaymentContainerView_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PKPassPaymentContainerView_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) style] == 3)
  {
    int64_t v2 = [*(id *)(a1 + 32) paymentPass];
    int v3 = [v2 hasDeviceTransactionSourceIdentifier:*(void *)(a1 + 40)];

    if (v3)
    {
      int v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 48);
      [v4 _handleReceivedBarcodePaymentTransaction:v5];
    }
  }
}

- (void)contactlessInterfaceSessionHasPendingServerRequest:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPassPaymentContainerView_contactlessInterfaceSessionHasPendingServerRequest___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__PKPassPaymentContainerView_contactlessInterfaceSessionHasPendingServerRequest___block_invoke(uint64_t a1)
{
  int64_t v2 = *(unsigned char **)(a1 + 32);
  uint64_t v3 = 21;
  if (!v2[776]) {
    uint64_t v3 = 22;
  }
  if (!*(void *)&v2[OBJC_IVAR___PKPassPaymentContainerView__passView[v3]]
    && ([v2 _recognizingBiometrics] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 passFooterContentViewRequestsSessionSuppression:*(void *)(a1 + 32)];
  }
}

- (void)contactlessInterfaceSessionDidTimeout:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__PKPassPaymentContainerView_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

unsigned char *__127__PKPassPaymentContainerView_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"did timeout" isErrorState:0];
  result = *(unsigned char **)(a1 + 32);
  uint64_t v3 = 21;
  if (!result[776]) {
    uint64_t v3 = 22;
  }
  if (*(void *)&result[OBJC_IVAR___PKPassPaymentContainerView__passView[v3]] == 5)
  {
    return (unsigned char *)[result _resetToIdleState];
  }
  return result;
}

- (void)contactlessInterfaceSessionDidStartTransaction:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPassPaymentContainerView_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __89__PKPassPaymentContainerView_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1080), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"did start" isErrorState:0];
  int64_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  uint64_t v4 = 21;
  if (!v3[776]) {
    uint64_t v4 = 22;
  }
  uint64_t v5 = *(void *)&v3[OBJC_IVAR___PKPassPaymentContainerView__passView[v4]];
  uint64_t v6 = [v3 style];
  id v7 = *(void **)(a1 + 32);
  if (v6 == 4)
  {
    id v8 = (void *)v7[134];
    v7[134] = 0;

    if (v5 != 7)
    {
      id v9 = *(void **)(a1 + 32);
      PKLocalizedIdentityString(&cfstr_PresentmentFoo_7.isa);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v9 _applyPayState:7 withTextOverride:v10];
    }
  }
  else
  {
    [v7 _applyPaymentIndefiniteSuccessState];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPassPaymentContainerView_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__PKPassPaymentContainerView_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)a1[4] + 1120) = 1;
  [*((id *)a1[4] + 62) updateDebugLabel:@"received request" isErrorState:0];
  int64_t v2 = PKISO18013DataReleaseRequestFromSTSRequest(a1[5], a1[6]);
  [v2 setExternalizedAuthenticationContext:*((void *)a1[4] + 96)];
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)v3[96];
  v3[96] = 0;

  uint64_t v5 = [v2 authenticationACL];
  if (v5)
  {
    uint64_t v6 = (const void *)SecAccessControlCreateFromData();
    BOOL v7 = v6 != 0;
    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Could not create access control ref from provided data with error %@", buf, 0xCu);
  }

  if (!v7)
  {
    id v10 = 0;
    goto LABEL_12;
  }
LABEL_8:
  char v9 = [MEMORY[0x1E4F88108] currentStateForAccessControl:v6];
  CFRelease(v6);
  if ((v9 & 1) == 0
    || (v9 & 6) == 0
    || (v9 & 9) == 9
    || ([MEMORY[0x1E4F74230] sharedConnection],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 effectiveBoolValueForSetting:*MEMORY[0x1E4F74018]],
        v13,
        v14 == 1))
  {
    id v10 = [[PKDataReleaseViewController alloc] initWithRequest:v2 delegate:a1[4]];
    if (v10)
    {
      [a1[4] _applyPayState:11];
      objc_storeWeak((id *)a1[4] + 131, v10);
      id v11 = objc_msgSend(a1[4], "pkui_viewControllerFromResponderChain");
      [v11 presentViewController:v10 animated:1 completion:&__block_literal_global_143_0];

      goto LABEL_17;
    }
  }
  else
  {
    *((void *)a1[4] + 132) = 4;
    if (PKPearlIsAvailable()) {
      BOOL v15 = @"PRESENTMENT_BIOMETRICS_FACEID_DISABLED";
    }
    else {
      BOOL v15 = @"PRESENTMENT_BIOMETRICS_TOUCHID_DISABLED";
    }
    PKLocalizedIdentityString(&v15->isa);
    id v10 = (PKDataReleaseViewController *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "No controller to present", buf, 2u);
  }

  [a1[4] _cancelTerminalResponseTimeout];
  [a1[4] _endPaymentAuthorizationWithWillUpdateState:1];
  [a1[4] _endContactlessPaymentSession];
  if (!v10)
  {
    id v10 = [a1[4] _textOverrideForFatalError];
  }
  [a1[4] _applyPayState:9 withTextOverride:v10];
LABEL_17:
}

void __96__PKPassPaymentContainerView_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke_141()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Presented data release confirmation controller", v1, 2u);
  }
}

- (void)contactlessInterfaceSessionDidReceiveActivityTimeout:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) paymentPass];
  int v3 = [v2 isTransitPass];

  if (v3)
  {
    [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
    [*(id *)(a1 + 32) _applyTerminalTransactionSubstateWithSuccess:1 reset:0];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 496);
    [v4 updateDebugLabel:@"activity timemout" isErrorState:0];
  }
}

- (void)contactlessInterfaceSessionDidReceiveUntrustedTerminal:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__PKPassPaymentContainerView_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  int64_t v2 = [*(id *)(a1 + 32) paymentPass];
  int v3 = [v2 isIdentityPass];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v4, "pkui_resetSharedRootAuthenticationContext");

    [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = PKLocalizedIdentityString(&cfstr_PresentmentUnt.isa);
    [v5 _applyTerminalTransactionSubstateWithSuccess:0 reset:0 errorOverride:v6];

    [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"untrusted reader" isErrorState:0];
    BOOL v7 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v8 = *MEMORY[0x1E4F87010];
    v15[0] = *MEMORY[0x1E4F87058];
    v15[1] = v8;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v10 = *MEMORY[0x1E4F862F8];
    v13[0] = *MEMORY[0x1E4F86308];
    v13[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F86300];
    v14[0] = *MEMORY[0x1E4F86450];
    v14[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v7 subjects:v9 sendEvent:v12];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "updateDebugLabel:isErrorState:", @"did finish", objc_msgSend(*(id *)(a1 + 40), "success") ^ 1);
  int64_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  objc_initWeak(&location, *(id *)(a1 + 32));
  int v3 = *(void **)(a1 + 40);
  if (v3) {
    char v4 = [v3 success];
  }
  else {
    char v4 = 0;
  }
  id v5 = [*(id *)(a1 + 32) paymentPass];
  id v6 = [*(id *)(a1 + 40) transitHistory];
  char v28 = v4;
  int64_t v27 = (void *)[*(id *)(a1 + 32) style];
  v26 = objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  if ([v5 isTransitPass] && !PKExpressEducationHasDismissedMessage())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    id v8 = [v5 uniqueID];
    int v9 = [v7 isExpressModeEnabledForPassUniqueIdentifier:v8];

    if (v9)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Pre-arm transaction on express enabled transit pass", buf, 2u);
      }

      PKIncrementPreArmTransactionOnExpressPassCount();
      if ((unint64_t)PKGetPreArmTransactionOnExpressPassCount() >= *MEMORY[0x1E4F87470]) {
        PKExpressEducationSetHasDismissedMessage();
      }
    }
  }
  if ([v5 hasAssociatedPeerPaymentAccount]) {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85F00], 0);
  }
  if (v6)
  {
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 480);
    id v12 = [*(id *)(a1 + 40) date];
    id v13 = [*(id *)(a1 + 40) paymentApplication];
    int v14 = [*(id *)(a1 + 40) paymentPass];
    BOOL v15 = [v14 uniqueID];
    id v16 = [*(id *)(a1 + 40) expressState];
    [v11 processTransitTransactionEventWithHistory:v6 transactionDate:v12 forPaymentApplication:v13 withPassUniqueIdentifier:v15 expressTransactionState:v16];
  }
  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v17 = *(void **)(a1 + 40);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_157;
  v29[3] = &unk_1E59DCD98;
  v29[4] = v18;
  id v30 = v17;
  objc_copyWeak(v33, &location);
  id v19 = v6;
  id v31 = v19;
  char v34 = v28;
  id v20 = v26;
  id v32 = v20;
  v33[1] = v27;
  [v18 _processPaymentTransactionForContext:v30 withCompletion:v29];
  int v21 = *(void **)(*(void *)(a1 + 32) + 480);
  int64_t v22 = [*(id *)(a1 + 40) paymentPass];
  double v23 = [v22 uniqueID];
  uint64_t v24 = [*(id *)(a1 + 40) paymentApplication];
  uint64_t v25 = [v24 applicationIdentifier];
  [v21 recordPaymentApplicationUsageForPassUniqueIdentifier:v23 paymentApplicationIdentifier:v25];

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_157(uint64_t a1, char a2)
{
  char v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2;
  v8[3] = &unk_1E59DCD70;
  objc_copyWeak(v13, (id *)(a1 + 64));
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 80);
  char v15 = a2;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  v13[1] = *(id *)(a1 + 72);
  [v4 _processValueAddedServiceTransactionsForContext:v5 withCompletion:v8];

  objc_destroyWeak(v13);
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3;
  aBlock[3] = &unk_1E59DCD48;
  objc_copyWeak(&v34, (id *)(a1 + 64));
  id v31 = *(id *)(a1 + 32);
  id v32 = *(id *)(a1 + 40);
  char v35 = *(unsigned char *)(a1 + 80);
  char v36 = a2;
  char v37 = *(unsigned char *)(a1 + 81);
  id v33 = *(id *)(a1 + 48);
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = (void (**)(void, void))v6;
  uint64_t v8 = *(void *)(a1 + 56);
  if (*(unsigned char *)(v8 + 1120)) {
    goto LABEL_2;
  }
  unint64_t v11 = *(void *)(a1 + 72);
  if (v11 >= 2)
  {
    if (v11 == 4)
    {
LABEL_2:
      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 1048));
      id v10 = WeakRetained;
      if (WeakRetained)
      {
        [WeakRetained dataReleaseCompletedWithError:0];
        objc_storeWeak((id *)(*(void *)(a1 + 56) + 1048), 0);
      }
      v7[2](v7, 0);
      goto LABEL_5;
    }
    if (v11 != 3)
    {
      (*((void (**)(void *, uint64_t))v6 + 2))(v6, 1);
      goto LABEL_6;
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F85098]);
    id v13 = (void *)[v12 initWithIdentifier:*MEMORY[0x1E4F87EE0] bundleIdentifier:*MEMORY[0x1E4F87D30] context:*MEMORY[0x1E4F87ED8]];
    [v13 donateSignalWithCompletion:&__block_literal_global_161];
  }
  char v14 = [*(id *)(a1 + 32) valueAddedServiceTransactions];
  id v10 = v14;
  if (!a2)
  {
    if (!*(unsigned char *)(a1 + 80))
    {
      int v21 = [v14 firstObject];
      if ([v21 terminalMode] == 2)
      {
        int v22 = [*(id *)(a1 + 56) _shouldShowTerminalIsNotRequestingPaymentError];

        if (v22)
        {
          [*(id *)(a1 + 56) _showTerminalIsNotRequestingPaymentError];
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    double v23 = [*(id *)(a1 + 32) expressState];
    id v16 = v23;
    if (v23 && ([v23 isExpress] & 1) == 0) {
      [*(id *)(*(void *)(a1 + 56) + 480) handleStandaloneTransaction:v16];
    }
    else {
      v7[2](v7, 1);
    }
    goto LABEL_35;
  }
  if (*(void *)(*(void *)(a1 + 56) + 664) && [v5 count])
  {
    uint64_t v15 = *(void *)(a1 + 56);
    if (*(unsigned char *)(v15 + 866))
    {
      id v16 = 0;
    }
    else
    {
      id v16 = [*(id *)(v15 + 664) pass];
      if (v16 && [v5 containsObject:v16])
      {
        [*(id *)(*(void *)(a1 + 56) + 664) setStyle:1];
        v7[2](v7, 1);
LABEL_35:

        goto LABEL_5;
      }
    }
    uint64_t v17 = [v10 firstObject];
    uint64_t v18 = [v17 terminalMode];

    uint64_t v19 = *(void *)(a1 + 56);
    if (*(void *)(v19 + 664) && v18 == 3)
    {
      *(unsigned char *)(v19 + 867) = 1;
      id v20 = *(void **)(*(void *)(a1 + 56) + 664);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_162;
      v26[3] = &unk_1E59D0E40;
      objc_copyWeak(&v29, (id *)(a1 + 64));
      id v27 = v5;
      char v28 = v7;
      [v20 setStyle:1 animated:0 completion:v26];

      objc_destroyWeak(&v29);
    }
    else
    {
      uint64_t v24 = [v5 firstObject];
      uint64_t v25 = [v24 uniqueID];
      [(id)v19 _presentPassWithUniqueIdentifier:v25 additionalPassUniqueIdentifiers:0 payState:8];

      v7[2](v7, 0);
    }
    goto LABEL_35;
  }
LABEL_24:
  v7[2](v7, a2);
LABEL_5:

LABEL_6:
  objc_destroyWeak(&v34);
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    if (a2)
    {
      id v5 = [*(id *)(a1 + 32) transaction];

      id v6 = [*(id *)(a1 + 32) valueAddedServiceTransactions];

      if (*(void *)(a1 + 40)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v6 == 0;
      }
      char v8 = !v7;
      if (v5 || (v8 & 1) != 0)
      {
        if (v5 || !v6 || *(unsigned char *)(a1 + 65))
        {
          if (*(unsigned char *)(a1 + 66)) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = *(unsigned char *)(a1 + 65) != 0;
          }
          [v11 _applyTerminalTransactionSubstateWithSuccess:v9 reset:1];
        }
      }
      else
      {
        [v11 _applyTerminalTransactionSubstateWithSuccess:*(unsigned __int8 *)(a1 + 64) reset:0];
        [v11 _finishHoldingTerminalTransactionSubstateAfterDelay:1.0];
      }
    }
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:*MEMORY[0x1E4F87148] object:*(void *)(a1 + 48)];

    id WeakRetained = v11;
  }
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "TPSDiscoverabilitySignal - Failed to donate discoverability signal - contactless transaction: %@";
      id v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "TPSDiscoverabilitySignal - Successfully donated discoverability signal - contactless transaction";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_162(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 83);
    id v6 = [a1[4] firstObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2_163;
    v7[3] = &unk_1E59CB0D8;
    objc_copyWeak(&v9, v2);
    id v8 = a1[5];
    [v5 setPass:v6 animated:0 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_2_163(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 867) = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3_164;
    v4[3] = &unk_1E59CA9F8;
    id v5 = *(id *)(a1 + 32);
    [v3 _setVASInfoViewHidden:0 animated:1 completion:v4];
  }
}

uint64_t __90__PKPassPaymentContainerView_contactlessInterfaceSession_didFinishTransactionWithContext___block_invoke_3_164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  [a1[4] _cancelTerminalResponseTimeout];
  objc_msgSend(*((id *)a1[4] + 62), "setPersistentEmulationHint:", objc_msgSend(a1[5], "persistentCardEmulationQueued"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = a1[6];
  uint64_t v30 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v30)
  {
    uint64_t v4 = *(void *)v34;
    id v5 = v32;
    id v28 = v3;
    id v29 = a1;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v8 = [v7 paymentApplication];
        id v9 = [v7 transitHistory];
        if (v9
          && ([v7 transaction], uint64_t v10 = objc_claimAutoreleasedReturnValue(),
                                               v10,
                                               !v10))
        {
          id v12 = (void *)*((void *)a1[4] + 60);
          id v13 = [v7 date];
          char v14 = [v7 paymentPass];
          [v14 uniqueID];
          v16 = uint64_t v15 = v5;
          uint64_t v17 = [v7 expressState];
          [v12 processTransitTransactionEventWithHistory:v9 transactionDate:v13 forPaymentApplication:v8 withPassUniqueIdentifier:v16 expressTransactionState:v17];

          id v5 = v15;
          a1 = v29;

          uint64_t v18 = (void *)*((void *)v29[4] + 60);
          uint64_t v4 = v27;
          uint64_t v19 = [v7 paymentPass];
          id v20 = [v19 uniqueID];
          int v21 = [v8 applicationIdentifier];
          int v22 = v18;
          id v3 = v28;
          [v22 recordPaymentApplicationUsageForPassUniqueIdentifier:v20 paymentApplicationIdentifier:v21];
        }
        else
        {
          id v11 = a1[4];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v32[0] = __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke_2;
          v32[1] = &unk_1E59CAEA8;
          v32[2] = v11;
          v32[3] = v7;
          [v11 _processPaymentTransactionForContext:v7 withCompletion:v31];
        }
      }
      uint64_t v30 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v30);
  }

  double v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v24 = *MEMORY[0x1E4F879B8];
  id v25 = a1[4];
  uint64_t v37 = *MEMORY[0x1E4F879C0];
  uint64_t v38 = MEMORY[0x1E4F1CC28];
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  [v23 postNotificationName:v24 object:v25 userInfo:v26];
}

uint64_t __100__PKPassPaymentContainerView_contactlessInterfaceSession_didEndPersistentCardEmulationWithContexts___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processValueAddedServiceTransactionsForContext:*(void *)(a1 + 40) withCompletion:0];
}

- (void)contactlessInterfaceSessionDidFailDeferredAuthorization:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"did fail deferred authorization" isErrorState:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 _applyTerminalTransactionSubstateWithSuccess:0 reset:1];
}

- (void)contactlessInterfaceSessionDidFailTransaction:(id)a3 forPaymentApplication:(id)a4 paymentPass:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke;
  v8[3] = &unk_1E59CA870;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __110__PKPassPaymentContainerView_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"did fail transaction" isErrorState:1];
  uint64_t v3 = [*(id *)(a1 + 32) style];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 == 4 || *(unsigned char *)(v4 + 1120))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 1048));
    if (WeakRetained
      && ([WeakRetained presentingViewController],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKDataReleaseErrorDomain" code:3 userInfo:0];
      [WeakRetained dataReleaseCompletedWithError:v6];

      objc_storeWeak((id *)(*(void *)(a1 + 32) + 1048), 0);
    }
    else
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = PKLocalizedIdentityString(&cfstr_PresentmentTra.isa);
      [v7 _applyPayState:9 withTextOverride:v8];

      [*(id *)(a1 + 32) _resetToIdleStateAfterDelay:2.0];
    }
  }
  else
  {
    id v9 = [(id)v4 pass];
    id WeakRetained = [v9 uniqueID];

    uint64_t v10 = [*(id *)(a1 + 40) uniqueID];
    int v11 = [WeakRetained isEqualToString:v10];

    if (v11) {
      [*(id *)(a1 + 32) _applyTerminalTransactionSubstateWithSuccess:0 reset:1];
    }
  }
}

- (id)_textOverrideForFatalError
{
  id v2 = [(PKPassFooterContentView *)self paymentPass];
  uint64_t v3 = [v2 cardType];

  if (v3 == 4) {
    PKLocalizedIdentityString(&cfstr_PresentmentTra.isa);
  }
  else {
  uint64_t v4 = PKLocalizedPaymentString(&cfstr_PaymentErrorTr.isa);
  }

  return v4;
}

- (void)contactlessInterfaceSessionDidFail:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __124__PKPassPaymentContainerView_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke;
  v9[3] = &unk_1E59CA870;
  void v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __124__PKPassPaymentContainerView_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "pkui_resetSharedRootAuthenticationContext");

  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"did fail transaction" isErrorState:1];
  uint64_t v3 = [*(id *)(a1 + 32) pass];
  id v8 = [v3 uniqueID];

  uint64_t v4 = [*(id *)(a1 + 40) uniqueID];
  int v5 = [v8 isEqualToString:v4];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 _textOverrideForFatalError];
    [v6 _applyPayState:9 withTextOverride:v7];
  }
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3
{
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__PKPassPaymentContainerView_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke;
  v4[3] = &unk_1E59CB460;
  void v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __84__PKPassPaymentContainerView_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke(uint64_t a1)
{
  uint64_t v2 = 1;
  *(void *)(*(void *)(a1 + 32) + 1064) = 1;
  [*(id *)(*(void *)(a1 + 32) + 496) updateDebugLabel:@"session did terminate" isErrorState:1];
  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  [*(id *)(a1 + 32) _endPaymentAuthorizationWithWillUpdateState:1];
  [*(id *)(a1 + 32) _endContactlessPaymentSession];
  *(void *)(*(void *)(a1 + 32) + 1056) = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == 2)
  {
    uint64_t v4 = @"PRESENTMENT_NO_BLUETOOTH";
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    if (PKUseWLAN()) {
      uint64_t v4 = @"PRESENTMENT_NO_WLAN_OR_BLUETOOTH";
    }
    else {
      uint64_t v4 = @"PRESENTMENT_NO_WIFI_OR_BLUETOOTH";
    }
    uint64_t v2 = 2;
LABEL_8:
    uint64_t v5 = PKLocalizedIdentityString(&v4->isa);
    *(void *)(*(void *)(a1 + 32) + 1056) = v2;
    if (v5) {
      goto LABEL_10;
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) _textOverrideForFatalError];
LABEL_10:
  id v6 = (id)v5;
  [*(id *)(a1 + 32) _applyPayState:9 withTextOverride:v5];
}

- (void)contactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__PKPassPaymentContainerView_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v2 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(a1 + 32) + 872);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    double v5 = v2;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Last field exit was %g seconds ago.", (uint8_t *)&v4, 0xCu);
  }

  if (v2 >= 1.25) {
    [*(id *)(a1 + 32) _handleContactlessInterfaceSessionDidEnterField:*(void *)(a1 + 40) withProperties:*(void *)(a1 + 48)];
  }
}

- (void)_handleContactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  id v8 = [(PKPassFooterContentView *)self pass];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke;
  aBlock[3] = &unk_1E59DCDC0;
  id v9 = v8;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  objc_copyWeak(&v29, location);
  id v11 = _Block_copy(aBlock);
  char v12 = [v10 technology];
  id v13 = (void *)[v10 valueAddedServiceMode];
  char v14 = (void *)[v10 terminalType];
  if ([v10 secondaryPropertiesRequired])
  {
    if (([v10 secondaryPropertiesAcquired] & ((v12 & 8) != 0)) == 0) {
      goto LABEL_7;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_7;
  }
  uint64_t v15 = [v10 merchantIdentifiers];

  if (v15 || v14 == (void *)3)
  {
    passLibrardouble y = self->_passLibrary;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_4;
    v20[3] = &unk_1E59DCE10;
    id v21 = v10;
    int v22 = self;
    v25[1] = v14;
    id v23 = v9;
    id v24 = v11;
    v25[2] = v13;
    objc_copyWeak(v25, location);
    [(PKPassLibrary *)passLibrary getMetadataForFieldWithProperties:v21 withHandler:v20];
    objc_destroyWeak(v25);

    goto LABEL_9;
  }
LABEL_7:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_6;
  block[3] = &unk_1E59CB128;
  objc_copyWeak(&v19, location);
  id v18 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
LABEL_9:

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke(uint64_t a1, void *a2)
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    __break(1u);
  }
  id v4 = v3;
  if ([*(id *)(a1 + 32) style] != 8)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:*MEMORY[0x1E4F863D0] forKeyedSubscript:*MEMORY[0x1E4F86308]];
    [v5 setObject:*MEMORY[0x1E4F86798] forKeyedSubscript:*MEMORY[0x1E4F86730]];
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    id v8 = v6;
    id v9 = v8;
    if (!v7 || !v8)
    {
LABEL_29:

      id v32 = *(void **)(a1 + 40);
      id v33 = v7;
      unint64_t v34 = [v32 terminalType];
      if (v34 <= 5)
      {
        long long v35 = (void *)MEMORY[0x1E4F86B20];
        if (((1 << v34) & 0x2D) == 0)
        {
          uint64_t v36 = *MEMORY[0x1E4F86B20];
          if (v34 != 1) {
            [v33 setObject:@"identity" forKeyedSubscript:*MEMORY[0x1E4F86B20]];
          }
          [v33 setObject:@"payment" forKeyedSubscript:v36];
        }
        [v33 setObject:*MEMORY[0x1E4F86708] forKeyedSubscript:*v35];
      }

      uint64_t v37 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v38 = *MEMORY[0x1E4F87058];
      v44[0] = *MEMORY[0x1E4F87010];
      v44[1] = v38;
      double v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      [v37 subjects:v39 sendEvent:v33];

      goto LABEL_36;
    }
    uint64_t v10 = [v8 passType];
    id v11 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v10 + 1) >= 3) {
      char v12 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      char v12 = off_1E59DD798[v10 + 1];
    }
    [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v13 = [v9 style];
    if (v13 < 0xD && ((0x13FFu >> v13) & 1) != 0) {
      char v14 = off_1E59DD7B0[v13];
    }
    else {
      char v14 = (__CFString *)*v11;
    }
    [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    uint64_t v15 = [v9 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v17 = v9;
    if ([v17 passType] == 1)
    {
      id v18 = [v17 secureElementPass];
      unint64_t v19 = [v18 cardType];
      if (v19 <= 4) {
        id v16 = (__CFString *)**((id **)&unk_1E59DD818 + v19);
      }
    }
    else
    {
      id v16 = @"other";
    }

    [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    id v20 = [v17 secureElementPass];
    if ([v20 isIdentityPass])
    {
      uint64_t v21 = [v20 identityType];
      if ((unint64_t)(v21 - 1) < 3)
      {
        int v22 = off_1E59DD840[v21 - 1];
        goto LABEL_24;
      }
    }
    else if ([v20 isAccessPass])
    {
      unint64_t v23 = [v20 accessType];
      if (v23 < 7)
      {
        int v22 = off_1E59DD858[v23];
        goto LABEL_24;
      }
    }
    int v22 = (__CFString *)*v11;
LABEL_24:

    [v7 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    id v24 = [v17 secureElementPass];
    id v25 = [v24 devicePaymentApplications];
    [v25 count];

    v26 = PKAnalyticsReportSwitchToggleResultValue();

    [v7 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    id v27 = [v17 secureElementPass];
    id v28 = *v11;
    id v29 = [v27 organizationName];
    if ([v29 length])
    {
      unint64_t v30 = [v27 cardType];
      if (v30 <= 4 && ((1 << v30) & 0x16) != 0)
      {
        id v31 = v29;

        id v28 = v31;
      }
    }

    [v7 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
    goto LABEL_29;
  }
LABEL_36:
  uint64_t v40 = [*((id *)v4 + 62) glyph];
  [v40 setFadeOnRecognized:1];

  double v41 = *((void *)v4 + 65);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2;
  v42[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v43, (id *)(a1 + 48));
  dispatch_async(v41, v42);
  objc_destroyWeak(&v43);
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_3;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v4, v1);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v4);
  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained[63] state];
    double v2 = v8;
    uint64_t v4 = 21;
    if (!*((unsigned char *)v8 + 776)) {
      uint64_t v4 = 22;
    }
    if (v3 != 2)
    {
      unint64_t v5 = *(unint64_t *)((char *)v8 + OBJC_IVAR___PKPassPaymentContainerView__passView[v4]);
      char v6 = [v8 _recognizingBiometrics];
      double v2 = v8;
      if ((v6 & 1) == 0 && v5 <= 6 && ((1 << v5) & 0x4E) != 0)
      {
        [v8 _applyPayState:v5];
        double v2 = v8;
      }
    }
  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && ![v3 shouldIgnoreField])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_192;
    v11[3] = &unk_1E59DCDE8;
    v11[4] = *(void *)(a1 + 40);
    id v7 = v4;
    id v8 = *(void **)(a1 + 72);
    id v12 = v7;
    v16[1] = v8;
    id v13 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void **)(a1 + 80);
    id v15 = v9;
    v16[2] = v10;
    id v14 = *(id *)(a1 + 32);
    objc_copyWeak(v16, (id *)(a1 + 64));
    dispatch_async(MEMORY[0x1E4F14428], v11);
    objc_destroyWeak(v16);
  }
  else
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring entered field: %@", buf, 0xCu);
    }
  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_192(uint64_t a1)
{
  v55[2] = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  id v3 = [*(id *)(a1 + 40) associatedPassIdentifiers];
  uint64_t v4 = v3;
  if (*(void *)(a1 + 80) == 3)
  {
    unint64_t v5 = [v3 firstObject];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 648) passWithUniqueID:v5];
    if (([v6 isEqualToPassIncludingMetadata:*(void *)(a1 + 48)] & 1) != 0
      || ((v7 = *(void *)(*(void *)(a1 + 32) + 728), BOOL v8 = v7 > 6, v9 = (1 << v7) & 0x4E, !v8)
        ? (BOOL v10 = v9 == 0)
        : (BOOL v10 = 1),
          v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)))
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_36:

      goto LABEL_37;
    }
    if ([v6 style] == 8)
    {
LABEL_61:
      [*(id *)(a1 + 32) _presentPassWithUniqueIdentifier:v5 additionalPassUniqueIdentifiers:0];
      goto LABEL_36;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:*MEMORY[0x1E4F863D0] forKeyedSubscript:*MEMORY[0x1E4F86308]];
    [v11 setObject:*MEMORY[0x1E4F86798] forKeyedSubscript:*MEMORY[0x1E4F86730]];
    id v12 = v11;
    id v13 = v6;
    id v14 = v13;
    if (!v13 || !v12)
    {
LABEL_60:

      int v49 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v50 = *MEMORY[0x1E4F87058];
      v55[0] = *MEMORY[0x1E4F87010];
      v55[1] = v50;
      CGFloat v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
      [v49 subjects:v51 sendEvent:v12];

      goto LABEL_61;
    }
    uint64_t v15 = [v13 passType];
    if ((unint64_t)(v15 + 1) >= 3) {
      id v16 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      id v16 = off_1E59DD798[v15 + 1];
    }
    [v12 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v30 = [v14 style];
    if (v30 < 0xD && ((0x13FFu >> v30) & 1) != 0) {
      id v31 = off_1E59DD7B0[v30];
    }
    else {
      id v31 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    [v12 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    id v32 = [v14 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v34 = v14;
    if ([v34 passType] == 1)
    {
      long long v35 = [v34 secureElementPass];
      unint64_t v36 = [v35 cardType];
      if (v36 <= 4) {
        id v33 = (__CFString *)**((id **)&unk_1E59DD818 + v36);
      }
    }
    else
    {
      id v33 = @"other";
    }

    [v12 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    uint64_t v37 = [v34 secureElementPass];
    if ([v37 isIdentityPass])
    {
      uint64_t v38 = [v37 identityType];
      if ((unint64_t)(v38 - 1) < 3)
      {
        double v39 = off_1E59DD840[v38 - 1];
        goto LABEL_55;
      }
    }
    else if ([v37 isAccessPass])
    {
      unint64_t v40 = [v37 accessType];
      if (v40 < 7)
      {
        double v39 = off_1E59DD858[v40];
        goto LABEL_55;
      }
    }
    double v39 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
LABEL_55:

    [v12 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    double v41 = [v34 secureElementPass];
    double v42 = [v41 devicePaymentApplications];
    [v42 count];
    v52 = v14;

    id v43 = PKAnalyticsReportSwitchToggleResultValue();

    [v12 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    unint64_t v44 = [v34 secureElementPass];
    id v45 = (id)*MEMORY[0x1E4F86D78];
    CGFloat v46 = [v44 organizationName];
    if ([v46 length])
    {
      unint64_t v47 = [v44 cardType];
      if (v47 <= 4 && ((1 << v47) & 0x16) != 0)
      {
        id v48 = v46;

        id v45 = v48;
        id v14 = v52;
      }
    }

    [v12 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
    goto LABEL_60;
  }
  uint64_t v17 = *(void *)(a1 + 88);
  if (v17 != 4 && v17 != 2) {
    goto LABEL_31;
  }
  if (![v3 count])
  {
    uint64_t v17 = *(void *)(a1 + 88);
LABEL_31:
    if (v17 == 3 && [v4 count])
    {
      id v29 = *(void **)(*(void *)(a1 + 32) + 648);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2_194;
      v53[3] = &unk_1E59CB088;
      objc_copyWeak(&v54, (id *)(a1 + 72));
      [v29 getPassesWithUniqueIdentifiers:v4 handler:v53];
      objc_destroyWeak(&v54);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    goto LABEL_37;
  }
  uint64_t v19 = [v4 firstObject];
  id v20 = [*(id *)(*(void *)(a1 + 32) + 648) passWithUniqueID:v19];
  if ([*(id *)(a1 + 48) hasValidNFCPayload]
    && [*(id *)(a1 + 48) isValid])
  {
    uint64_t v21 = [*(id *)(a1 + 48) passTypeIdentifier];
    int v22 = [v21 dataUsingEncoding:4];
    unint64_t v23 = [v22 SHA256Hash];

    id v24 = [*(id *)(a1 + 56) merchantIdentifiers];
    LODWORD(v22) = [v24 containsObject:v23];

    if (v22)
    {
      uint64_t v25 = [*(id *)(a1 + 48) uniqueID];

      id v26 = *(id *)(a1 + 48);
      id v20 = v26;
      uint64_t v19 = (void *)v25;
    }
  }
  if (([v20 isEqualToPassIncludingMetadata:*(void *)(a1 + 48)] & 1) != 0
    || ([v20 hasStoredValue] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v27 = *(void **)(a1 + 32);
    id v28 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    [v27 _presentPassWithUniqueIdentifier:v19 additionalPassUniqueIdentifiers:v28];
  }
LABEL_37:
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_2_194(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_3_195;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_3_195(uint64_t a1)
{
  double v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v5 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_4_196;
    v11[3] = &unk_1E59CCBB0;
    id v6 = v4;
    id v12 = v6;
    [v5 enumerateObjectsUsingBlock:v11];
    [WeakRetained _setValueAddedServicePasses:v6];
    id v7 = (void *)WeakRetained[83];
    BOOL v8 = [v6 firstObject];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_5;
    v9[3] = &unk_1E59CB100;
    objc_copyWeak(&v10, v2);
    [v7 setPass:v8 animated:0 completion:v9];

    objc_destroyWeak(&v10);
  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_4_196(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasValidNFCPayload]
    && [v3 isValid]
    && ([v3 hasStoredValue] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = WeakRetained;
    if ([WeakRetained _hasValueAddedServicePasses]) {
      [v2 _setVASInfoViewHidden:0 animated:1 completion:0];
    }
    id WeakRetained = v2;
    if (v2[864])
    {
      [v2 _beginPaymentAuthorization];
      id WeakRetained = v2;
    }
  }
}

void __93__PKPassPaymentContainerView__handleContactlessInterfaceSessionDidEnterField_withProperties___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)contactlessInterfaceSessionDidExitField:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPassPaymentContainerView_contactlessInterfaceSessionDidExitField___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PKPassPaymentContainerView_contactlessInterfaceSessionDidExitField___block_invoke(uint64_t a1)
{
  id v33[2] = *MEMORY[0x1E4F143B8];
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 872) = CFAbsoluteTimeGetCurrent();
  double v2 = [*(id *)(a1 + 32) pass];
  if ([v2 style] != 8)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v3 setObject:*MEMORY[0x1E4F863D8] forKeyedSubscript:*MEMORY[0x1E4F86308]];
    [v3 setObject:*MEMORY[0x1E4F86798] forKeyedSubscript:*MEMORY[0x1E4F86730]];
    id v4 = v3;
    id v5 = v2;
    id v6 = v5;
    if (!v5 || !v4)
    {
LABEL_28:

      id v29 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v30 = *MEMORY[0x1E4F87058];
      v33[0] = *MEMORY[0x1E4F87010];
      v33[1] = v30;
      id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [v29 subjects:v31 sendEvent:v4];

      goto LABEL_29;
    }
    uint64_t v7 = [v5 passType];
    BOOL v8 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v7 + 1) >= 3) {
      uint64_t v9 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      uint64_t v9 = off_1E59DD798[v7 + 1];
    }
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v10 = [v6 style];
    if (v10 < 0xD && ((0x13FFu >> v10) & 1) != 0) {
      id v11 = off_1E59DD7B0[v10];
    }
    else {
      id v11 = (__CFString *)*v8;
    }
    [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    id v12 = [v6 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v14 = v6;
    if ([v14 passType] == 1)
    {
      uint64_t v15 = [v14 secureElementPass];
      unint64_t v16 = [v15 cardType];
      if (v16 <= 4) {
        id v13 = (__CFString *)**((id **)&unk_1E59DD818 + v16);
      }
    }
    else
    {
      id v13 = @"other";
    }

    [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    uint64_t v17 = [v14 secureElementPass];
    if ([v17 isIdentityPass])
    {
      uint64_t v18 = [v17 identityType];
      if ((unint64_t)(v18 - 1) < 3)
      {
        uint64_t v19 = off_1E59DD840[v18 - 1];
        goto LABEL_23;
      }
    }
    else if ([v17 isAccessPass])
    {
      unint64_t v20 = [v17 accessType];
      if (v20 < 7)
      {
        uint64_t v19 = off_1E59DD858[v20];
        goto LABEL_23;
      }
    }
    uint64_t v19 = (__CFString *)*v8;
LABEL_23:

    [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    uint64_t v21 = [v14 secureElementPass];
    int v22 = [v21 devicePaymentApplications];
    [v22 count];

    unint64_t v23 = PKAnalyticsReportSwitchToggleResultValue();

    [v4 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    id v24 = [v14 secureElementPass];
    id v25 = *v8;
    id v26 = [v24 organizationName];
    if ([v26 length])
    {
      unint64_t v27 = [v24 cardType];
      if (v27 <= 4 && ((1 << v27) & 0x16) != 0)
      {
        id v28 = v26;

        id v25 = v28;
      }
    }

    [v4 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
    goto LABEL_28;
  }
LABEL_29:
  id v32 = [*(id *)(*(void *)(a1 + 32) + 496) glyph];
  [v32 setFadeOnRecognized:0];

  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  [*(id *)(a1 + 32) _promoteToAuthorizedStateIfPossible];
}

- (void)contactlessInterfaceSessionDidSelectPayment:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PKPassPaymentContainerView_contactlessInterfaceSessionDidSelectPayment___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __74__PKPassPaymentContainerView_contactlessInterfaceSessionDidSelectPayment___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) style] == 2)
  {
    double v2 = *(void **)(a1 + 32);
    return [v2 _showTerminalIsRequestingPaymentError];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 40) state];
    if (result == 2)
    {
      id v4 = *(void **)(a1 + 32);
      return [v4 _beginTerminalResponseTimeout];
    }
  }
  return result;
}

- (void)contactlessInterfaceSession:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPassPaymentContainerView_contactlessInterfaceSession_didTransitionFromState_toState___block_invoke;
  block[3] = &unk_1E59CBCB8;
  void block[4] = self;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PKPassPaymentContainerView_contactlessInterfaceSession_didTransitionFromState_toState___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 40) == 2) {
    uint64_t result = [*(id *)(result + 32) _postDidAuthorizeNotification];
  }
  if (*(void *)(v1 + 48) == 2)
  {
    double v2 = *(void **)(v1 + 32);
    return [v2 _postDidDeauthorizeNotification];
  }
  return result;
}

- (void)contactlessInterfaceSession:(id)a3 didReceiveExpressTransactionState:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PKPassPaymentContainerView_contactlessInterfaceSession_didReceiveExpressTransactionState___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __92__PKPassPaymentContainerView_contactlessInterfaceSession_didReceiveExpressTransactionState___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 496) persistentEmulationHint])
  {
    [*(id *)(*(void *)(a1 + 32) + 496) setPersistentEmulationHint:0];
    id v2 = *(id *)(*(void *)(a1 + 32) + 504);
    id v3 = v2;
    if (v2)
    {
      id v4 = *(NSObject **)(*(void *)(a1 + 32) + 520);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__PKPassPaymentContainerView_contactlessInterfaceSession_didReceiveExpressTransactionState___block_invoke_2;
      block[3] = &unk_1E59CA7D0;
      id v11 = v2;
      dispatch_async(v4, block);
    }
  }
  [*(id *)(a1 + 32) _cancelTerminalResponseTimeout];
  [*(id *)(a1 + 32) _cancelAuthentication];
  uint64_t v5 = [*(id *)(a1 + 40) status];
  uint64_t result = [*(id *)(a1 + 40) isProcessing];
  if (result)
  {
    if ((unint64_t)(v5 - 1) < 3)
    {
      BOOL v7 = v5 == 1;
      uint64_t result = *(void *)(a1 + 32);
      uint64_t v8 = 0;
      return [(id)result _applyTerminalTransactionSubstateWithSuccess:v7 reset:v8];
    }
    if (!v5)
    {
      if ([*(id *)(a1 + 32) _shouldDisplayPrimaryView]) {
        [*(id *)(a1 + 32) _updateContentPrimaryView];
      }
      if ([*(id *)(a1 + 32) _shouldDisplaySecondaryView]) {
        [*(id *)(a1 + 32) _updateContentSecondaryView];
      }
      return [*(id *)(a1 + 32) _applyPaymentIndefiniteSuccessState];
    }
  }
  else
  {
    int v9 = [*(id *)(a1 + 40) isIgnorable];
    uint64_t result = *(void *)(a1 + 32);
    if (v9) {
      return [(id)result _resetToIdleState];
    }
    if (!*(unsigned char *)(result + 816))
    {
      BOOL v7 = v5 == 1;
      uint64_t v8 = 1;
      return [(id)result _applyTerminalTransactionSubstateWithSuccess:v7 reset:v8];
    }
    if (!*(void *)(result + 824)) {
      return [(id)result _finishHoldingTerminalTransactionSubstateAfterDelay:1.0];
    }
  }
  return result;
}

uint64_t __92__PKPassPaymentContainerView_contactlessInterfaceSession_didReceiveExpressTransactionState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetPersistentCardEmulation];
}

- (void)contactlessInterfaceSessionDidResume:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Contactless interface session did resume", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPassPaymentContainerView_contactlessInterfaceSessionDidResume___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__PKPassPaymentContainerView_contactlessInterfaceSessionDidResume___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 512) = 0;
  return [*(id *)(a1 + 32) _executeNextSessionExchangeTask];
}

- (void)contactlessInterfaceSession:(id)a3 didSuspendWithToken:(id)a4
{
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Contactless interface session did suspend", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKPassPaymentContainerView_contactlessInterfaceSession_didSuspendWithToken___block_invoke;
  v8[3] = &unk_1E59CA870;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __78__PKPassPaymentContainerView_contactlessInterfaceSession_didSuspendWithToken___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 512) = 1;
  if ([*(id *)(*(void *)(a1 + 32) + 1096) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 1096);
    *(void *)(v2 + 1096) = 0;
  }
}

- (void)payStateView:(id)a3 revealingCheckmark:(BOOL)a4
{
  id v11 = a3;
  uint64_t v5 = 21;
  if (!self->_transitioning) {
    uint64_t v5 = 22;
  }
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v5]);
  BOOL v7 = [(PKPassPaymentContainerView *)self _isForegroundActive];
  if (v6 == 8 && v7)
  {
    kdebug_trace();
    id v9 = [(PKPassFooterContentView *)self delegate];
    [v9 passFooterContentViewDidTransact:self success:1];

    if ([v11 accessPass]) {
      SystemSoundID v10 = 1163;
    }
    else {
      SystemSoundID v10 = 1394;
    }
    AudioServicesPlaySystemSound(v10);
  }
}

- (void)payStateViewRevealingFailure:(id)a3
{
  id v4 = [(PKPassFooterContentView *)self delegate];
  [v4 passFooterContentViewDidTransact:self success:0];
}

- (void)_beginPaymentAuthorization
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(PKPassPaymentContainerView *)self _updateAuthenticatorState];
  payStateView = self->_payStateView;
  uint64_t v4 = [(PKPassPaymentContainerView *)self _canAuthenticateWithBiometrics] ^ 1;
  BOOL v5 = self->_transitioning || self->_currentPayState != 0;
  [(PKPassPaymentPayStateView *)payStateView setBiometricsUnavailableHint:v4 animated:v5];
  if ([(PKPassPaymentContainerView *)self _authenticationAllowed])
  {
    uint64_t v6 = 21;
    if (!self->_transitioning) {
      uint64_t v6 = 22;
    }
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v6]);
    BOOL pendingAutomaticAuthorization = self->_pendingAutomaticAuthorization;
    self->_BOOL pendingAutomaticAuthorization = 0;
    if (self->_requireExpress || pendingAutomaticAuthorization)
    {
      id v9 = [(PKPassPaymentPayStateView *)self->_payStateView glyph];
      [v9 setFadeOnRecognized:1];
      if (self->_authorizedExternalizedContext)
      {
        if (v7 != 6) {
          [(PKPassPaymentContainerView *)self _applyPayState:6 withTextOverride:0 animated:0 completionHandler:0];
        }
        [(PKPassPaymentContainerView *)self _performAuthentication];
      }
      else
      {
        [(PKPassPaymentContainerView *)self _cancelAuthentication];
        if (v7 != 4) {
          [(PKPassPaymentContainerView *)self _applyPayState:4];
        }
        if (pendingAutomaticAuthorization)
        {
          uint64_t v13 = [(PKAuthenticator *)self->_authenticator authenticationIdentifier];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __56__PKPassPaymentContainerView__beginPaymentAuthorization__block_invoke;
          v18[3] = &unk_1E59DCE38;
          v18[4] = self;
          v18[5] = v13;
          [(PKPassPaymentContainerView *)self _authorizeForTransactionWithAuthenticatorEvaluationResponse:0 authenticationIdentifier:v13 completion:v18];
        }
        else
        {
          uint64_t v15 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v20 = self;
            _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): Skipping authorization.", buf, 0xCu);
          }

          [(PKPassPaymentContainerView *)self _promoteToAuthorizedStateIfPossible];
        }
      }

      return;
    }
    if ([(PKPassFooterContentView *)self style] == 4)
    {
      if ([(PKContactlessInterfaceSession *)self->_contactlessInterfaceSession isWaitingOnConfirmationForHandoff])
      {
        SystemSoundID v10 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_7.isa);
        id v11 = self;
        uint64_t v12 = 7;
      }
      else
      {
        if (v7 == 4)
        {
LABEL_36:
          [(PKPassPaymentContainerView *)self _activateForPayment];
          return;
        }
        SystemSoundID v10 = PKLocalizedIdentityString(&cfstr_PresentmentNfc.isa);
        id v11 = self;
        uint64_t v12 = 4;
      }
      [(PKPassPaymentContainerView *)v11 _applyPayState:v12 withTextOverride:v10];

      goto LABEL_36;
    }
    if ([(PKPassPaymentContainerView *)self _canAuthenticateWithBiometrics]
      || (PKUIOnlyDemoModeEnabled() & 1) != 0
      || PKStoreDemoModeEnabled())
    {
      if (self->_userIntentRequired) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
      if (v14 != v7) {
        -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:");
      }
      [(PKPassPaymentContainerView *)self _performAuthentication];
    }
    else if ([(PKPassPaymentContainerView *)self _canAuthenticateWithPasscode])
    {
      if (self->_userIntentRequired) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 3;
      }
      if (v16 != v7) {
        -[PKPassPaymentContainerView _applyPayState:](self, "_applyPayState:");
      }
      [(PKPassPaymentContainerView *)self _performAuthentication];
      if (self->_presentationWasForcedFromButton)
      {
        authenticator = self->_authenticator;
        [(PKAuthenticator *)authenticator fallbackToSystemPasscodeUI];
      }
    }
    else if (v7 != 10)
    {
      [(PKPassPaymentContainerView *)self _applyPayState:10];
    }
  }
  else
  {
    [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:0];
  }
}

void __56__PKPassPaymentContainerView__beginPaymentAuthorization__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): Automatically authorized card.", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) _didAuthorizePaymentApplicationWithAuthenticationIdentifier:*(void *)(a1 + 40)];
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%p): Failed to automatically authorize card, falling back to authentication.", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) _beginPaymentAuthorization];
  }
}

- (void)_endPaymentAuthorizationWithWillUpdateState:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPassPaymentContainerView *)self _resetCardEmulationWithCompletion:0];
  if (v3)
  {
    [(PKPassPaymentContainerView *)self _cancelAuthentication];
  }
  else if (self->_authenticating)
  {
    [(PKAuthenticator *)self->_authenticator cancelEvaluation];
  }
  [(PKPassPaymentContainerView *)self _resetTransactionAuthenticationIfNecessary];
  [(PKPassPaymentContainerView *)self _dismissBarcodeViewControllerIfNecessaryWithCompletion:0];
  [(PKPassPaymentContainerView *)self _cancelBarcodeDisplayTimer];
  if (![(PKPassFooterContentView *)self isInvalidated])
  {
    [(PKPassPaymentContainerView *)self _updateBottomTextView];
  }
}

- (BOOL)_restartPaymentAuthorization
{
  uint64_t v3 = 21;
  if (!self->_transitioning) {
    uint64_t v3 = 22;
  }
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  [(PKPassPaymentContainerView *)self _resetCardEmulationWithCompletion:0];
  if (!self->_authenticating) {
    return v4 == 5;
  }
  [(PKPassPaymentContainerView *)self _updateAuthenticatorState];
  if ([(PKPassPaymentContainerView *)self _authenticationAllowed]
    && ([(PKPassPaymentContainerView *)self _canAuthenticateWithBiometrics]
     || [(PKPassPaymentContainerView *)self _canAuthenticateWithPasscode]))
  {
    [(PKAuthenticator *)self->_authenticator restartEvaluation];
    return v4 == 5;
  }
  [(PKAuthenticator *)self->_authenticator cancelEvaluation];
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    return 1;
  }
  else {
    return (v4 < 7) & (0x4Eu >> v4);
  }
}

- (void)_beginBarcodeDisplayTimer
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  barcodeDisplayTimer = self->_barcodeDisplayTimer;
  self->_barcodeDisplayTimer = v3;

  id v5 = self->_barcodeDisplayTimer;
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  BOOL v7 = self->_barcodeDisplayTimer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PKPassPaymentContainerView__beginBarcodeDisplayTimer__block_invoke;
  v8[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_barcodeDisplayTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__PKPassPaymentContainerView__beginBarcodeDisplayTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _cancelBarcodeDisplayTimer];
    id WeakRetained = v3;
    uint64_t v2 = 21;
    if (!v3[776]) {
      uint64_t v2 = 22;
    }
    if (*(void *)&v3[OBJC_IVAR___PKPassPaymentContainerView__passView[v2]] == 5)
    {
      [v3 _endPaymentAuthorizationWithWillUpdateState:1];
      [v3 _resetToIdleState];
      id WeakRetained = v3;
    }
  }
}

- (void)_cancelBarcodeDisplayTimer
{
  barcodeDisplayTimer = self->_barcodeDisplayTimer;
  if (barcodeDisplayTimer)
  {
    dispatch_source_cancel(barcodeDisplayTimer);
    unint64_t v4 = self->_barcodeDisplayTimer;
    self->_barcodeDisplayTimer = 0;
  }
}

- (void)_performAuthentication
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (!self->_authenticating)
  {
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || PKStoreDemoModeEnabled())
    {
      uint64_t v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView: skipping authentication due to demo mode.", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      self->_authenticating = 1;
      unint64_t v4 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v5 = *MEMORY[0x1E4F87058];
      v36[0] = *MEMORY[0x1E4F87010];
      v36[1] = v5;
      dispatch_time_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      uint64_t v34 = *MEMORY[0x1E4F86308];
      uint64_t v35 = *MEMORY[0x1E4F86470];
      BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      [v4 subjects:v6 sendEvent:v7];

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v3 = [(PKPassFooterContentView *)self pass];
      uint64_t v9 = [v3 passType];
      if (v9 == 1) {
        int v10 = v3;
      }
      else {
        int v10 = 0;
      }
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      if (v9 != 1) {
        uint64_t v12 = [(id)objc_opt_class() userIntentPotentiallyRequiredForPass:v3 fieldDetect:self->_presentationWasForFieldDetect] ^ 1;
      }
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:v12];
      [v13 setInitialAuthenticatorState:self->_authenticatorState];
      [v13 setAssumeUserIntentAvailable:!self->_userIntentRequired];
      if (self->_authorizedExternalizedContext)
      {
        objc_msgSend(v13, "setExternalizedContext:");
        [v13 setAssumeBiometricOrPasscodeAvailable:1];
        authorizedExternalizedContext = self->_authorizedExternalizedContext;
        self->_authorizedExternalizedContext = 0;
      }
      if (v11 && [v11 isAccessPass])
      {
        uint64_t v15 = PKLocalizedPaymentString(&cfstr_InAppPaymentPa.isa);
        [v13 setPasscodeTitle:v15];
      }
      objc_initWeak(buf, self);
      authenticator = self->_authenticator;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      id v30[2] = __52__PKPassPaymentContainerView__performAuthentication__block_invoke;
      v30[3] = &unk_1E59DCE88;
      objc_copyWeak(v32, buf);
      v32[1] = *(id *)&Current;
      uint64_t v17 = v11;
      id v31 = v17;
      [(PKAuthenticator *)authenticator evaluateRequest:v13 withCompletion:v30];
      if (self->_userIntentStyle == -1)
      {
        uint64_t v18 = [(UIView *)self pkui_viewControllerFromResponderChain];
        if (v18)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __52__PKPassPaymentContainerView__performAuthentication__block_invoke_212;
          aBlock[3] = &unk_1E59CB010;
          objc_copyWeak(&v29, buf);
          id v28 = v17;
          uint64_t v19 = _Block_copy(aBlock);
          uint64_t v22 = MEMORY[0x1E4F143A8];
          uint64_t v23 = 3221225472;
          id v24 = __52__PKPassPaymentContainerView__performAuthentication__block_invoke_2;
          id v25 = &unk_1E59DA350;
          objc_copyWeak(&v26, buf);
          unint64_t v20 = _Block_copy(&v22);
          AccesibilityIntentUnavailable = PKAlertCreateAccesibilityIntentUnavailable(v19, v20);
          objc_msgSend(v18, "presentViewController:animated:completion:", AccesibilityIntentUnavailable, 1, 0, v22, v23, v24, v25);

          objc_destroyWeak(&v26);
          objc_destroyWeak(&v29);
        }
      }
      objc_destroyWeak(v32);
      objc_destroyWeak(buf);
    }
  }
}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke(uint64_t a1, void *a2)
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    *((unsigned char *)WeakRetained + 744) = 0;
    int IsAvailable = PKUserIntentIsAvailable();
    uint64_t v7 = 3;
    if (!IsAvailable) {
      uint64_t v7 = 0;
    }
    *((void *)WeakRetained + 95) = v7;
    switch([v3 result])
    {
      case 0:
        uint64_t v8 = (void *)[*((id *)WeakRetained + 61) authenticationIdentifier];
        uint64_t v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Authentication Succeeded", buf, 2u);
        }

        int v10 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v11 = *MEMORY[0x1E4F87058];
        v50[0] = *MEMORY[0x1E4F87010];
        v50[1] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
        uint64_t v48 = *MEMORY[0x1E4F86308];
        uint64_t v49 = *MEMORY[0x1E4F86360];
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        [v10 subjects:v12 sendEvent:v13];

        uint64_t v14 = [*((id *)WeakRetained + 62) glyph];
        if (([v14 fadeOnRecognized] & 1) == 0) {
          [v14 setFadeOnRecognized:Current - *(double *)(a1 + 48) < 0.1];
        }
        if ([WeakRetained _authenticationAllowed]
          && [v3 biometricMatch])
        {
          [MEMORY[0x1E4F88120] invokeSuccessFeedback];
        }
        if ([WeakRetained style] == 3) {
          [WeakRetained _applyPayState:4 withTextOverride:0 animated:0 completionHandler:0];
        }
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        id v32[2] = __52__PKPassPaymentContainerView__performAuthentication__block_invoke_209;
        v32[3] = &unk_1E59DCE60;
        objc_copyWeak(v34, (id *)(a1 + 40));
        v34[1] = v8;
        id v33 = *(id *)(a1 + 32);
        [WeakRetained _authorizeForTransactionWithAuthenticatorEvaluationResponse:v3 authenticationIdentifier:v8 completion:v32];

        objc_destroyWeak(v34);
        break;
      case 1:
        uint64_t v15 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v16 = *MEMORY[0x1E4F87058];
        v47[0] = *MEMORY[0x1E4F87010];
        v47[1] = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
        uint64_t v45 = *MEMORY[0x1E4F86308];
        uint64_t v46 = *MEMORY[0x1E4F86340];
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        [v15 subjects:v17 sendEvent:v18];

        [WeakRetained _resetToIdleState];
        break;
      case 2:
        uint64_t v19 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v20 = *MEMORY[0x1E4F87058];
        v44[0] = *MEMORY[0x1E4F87010];
        v44[1] = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
        uint64_t v42 = *MEMORY[0x1E4F86308];
        uint64_t v43 = *MEMORY[0x1E4F86338];
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        [v19 subjects:v21 sendEvent:v22];

        [WeakRetained _applyPayState:0];
        break;
      case 3:
      case 6:
      case 7:
        [WeakRetained _applyPayState:0];
        break;
      case 4:
        id v28 = [MEMORY[0x1E4F28F80] processInfo];
        id v29 = [v28 processName];
        int v30 = [v28 processIdentifier];
        id v31 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v39 = v29;
          __int16 v40 = 2048;
          uint64_t v41 = v30;
          _os_log_impl(&dword_19F450000, v31, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
        }

        [WeakRetained _applyPayState:0];
        break;
      case 5:
        uint64_t v23 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v24 = *MEMORY[0x1E4F87058];
        v37[0] = *MEMORY[0x1E4F87010];
        v37[1] = v24;
        id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
        uint64_t v35 = *MEMORY[0x1E4F86308];
        uint64_t v36 = *MEMORY[0x1E4F86348];
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [v23 subjects:v25 sendEvent:v26];

        [*(id *)(a1 + 32) isAccessPass];
        unint64_t v27 = PKLocalizedSEPAuthorizationErrorString();
        [WeakRetained _applyPayState:9 withTextOverride:v27];
        [WeakRetained _resetToIdleStateAfterDelay:4.0];

        break;
      default:
        break;
    }
  }
}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke_209(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_time_t v6 = WeakRetained;
  if (WeakRetained && [WeakRetained[61] authenticationIdentifier] == *(void *)(a1 + 48))
  {
    uint64_t v7 = [v6[62] glyph];
    objc_msgSend(v7, "setFadeOnRecognized:", objc_msgSend(v6[63], "fieldPresent"));

    if (a2)
    {
      [v6 _didAuthorizePaymentApplicationWithAuthenticationIdentifier:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v8 = (uint64_t)v9;
      if (!v9)
      {
        [*(id *)(a1 + 32) isAccessPass];
        uint64_t v8 = PKLocalizedSEPAuthorizationErrorString();
      }
      id v9 = (id)v8;
      [v6 _applyPayState:9 withTextOverride:v8];
      [v6 _resetToIdleStateAfterDelay:4.0];
    }
  }
}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke_212(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[744])
  {
    id v4 = WeakRetained;
    [*(id *)(a1 + 32) isAccessPass];
    id v3 = PKLocalizedSEPAuthorizationErrorString();
    [v4 _applyPayState:9 withTextOverride:v3];

    id WeakRetained = v4;
  }
}

void __52__PKPassPaymentContainerView__performAuthentication__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _openURL:v5];
  }
}

- (void)_cancelAuthentication
{
  if (self->_authenticating)
  {
    self->_authenticating = 0;
    [(PKAuthenticator *)self->_authenticator cancelEvaluationWithOptions:1];
  }
}

- (void)_endContactlessPaymentSession
{
  if (self->_contactlessInterfaceSession)
  {
    objc_msgSend(MEMORY[0x1E4F845F8], "attachDefaultBehaviorToSession:");
    InvalidateSession_0(self->_contactlessInterfaceSession, self->_authorizationQueue);
    contactlessInterfaceSession = self->_contactlessInterfaceSession;
    self->_contactlessInterfaceSession = 0;

    self->_contactlessInterfaceSessionSuspended = 0;
    if ([(PKPassFooterContentView *)self style] == 4 || self->_didReceiveISO18013Signal)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseVC);
      if (WeakRetained)
      {
        id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKDataReleaseErrorDomain" code:4 userInfo:0];
        [WeakRetained dataReleaseCompletedWithError:v5];

        objc_storeWeak((id *)&self->_dataReleaseVC, 0);
      }
    }
    [(PKPassPaymentContainerView *)self _clearSessionExchangeTasks];
  }
  self->_didReceiveISO18013Signal = 0;
}

- (void)_activateForPayment
{
  if ([(PKPassFooterContentView *)self style] != 2)
  {
    [(PKPassPaymentContainerView *)self _activateForPaymentWithApplications:0];
  }
}

- (void)_activateForPaymentWithApplications:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PKPassFooterContentView *)self style] != 2 && [(PKPassFooterContentView *)self style] != 3)
  {
    id v5 = [(PKPassFooterContentView *)self paymentPass];
    dispatch_time_t v6 = [v5 uniqueID];
    if (![v4 count])
    {
      switch([v5 contactlessActivationGroupingType])
      {
        case 0:

          id v4 = (id)MEMORY[0x1E4F1CBF0];
          break;
        case 1:
          uint64_t v7 = [v5 devicePrimaryContactlessPaymentApplication];
          uint64_t v8 = (void *)v7;
          if (v7)
          {
            v18[0] = v7;
            uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

            id v4 = (id)v9;
          }
          else
          {

            id v4 = (id)MEMORY[0x1E4F1CBF0];
          }

          break;
        case 2:
          uint64_t v10 = [(PKPaymentService *)self->_paymentService defaultPaymentApplicationForPassUniqueIdentifier:v6];
          uint64_t v11 = (void *)v10;
          if (v10)
          {
            uint64_t v17 = v10;
            uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
            goto LABEL_13;
          }
          uint64_t v14 = [v5 devicePrimaryContactlessPaymentApplication];
          if (v14)
          {
            uint64_t v15 = (void *)v14;
            uint64_t v16 = v14;
            uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];

            id v4 = v15;
          }
          else
          {

            id v4 = 0;
            uint64_t v13 = MEMORY[0x1E4F1CBF0];
          }
          goto LABEL_14;
        case 3:
          uint64_t v11 = [v5 deviceContactlessPaymentApplications];
          uint64_t v12 = objc_msgSend(v11, "pk_arrayCopy");
LABEL_13:
          uint64_t v13 = v12;
LABEL_14:

          id v4 = (id)v13;
          break;
        default:
          break;
      }
    }
    [(PKPassPaymentContainerView *)self _activatePaymentApplications:v4 forPaymentPass:v5 withCompletion:0];
  }
}

- (void)_passcodeFallbackButtonPressed:(id)a3
{
}

- (void)_addPasscodeButtonPressed:(id)a3
{
  if (PKPearlIsAvailable()) {
    id v4 = @"prefs:root=Pearl";
  }
  else {
    id v4 = @"prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE";
  }
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  [(PKPassPaymentContainerView *)self _openURL:v5];
}

- (void)_calculateTerminalStateWithRangingSuspensionReasons:(unint64_t)a3
{
  id v4 = [(PKPassFooterContentView *)self paymentPass];
  id v5 = [v4 devicePrimaryPaymentApplication];
  dispatch_time_t v6 = [v5 subcredentials];
  id v11 = [v6 anyObject];

  unint64_t v7 = PKRangingSuspensionDisplayableReasonForRangingSuspensionReason();
  if ([v11 supportedRadioTechnologies] == 2)
  {
    uint64_t v8 = v11;
    if (v7 > 4) {
      goto LABEL_6;
    }
    int64_t v9 = qword_1A0445518[v7];
    int64_t v10 = qword_1A0445540[v7];
  }
  else
  {
    int64_t v9 = 0;
    int64_t v10 = 0;
    uint64_t v8 = v11;
  }
  self->_failureReason = v9;
  self->_failureAction = v10;
LABEL_6:
}

- (void)_applyTerminalFailureState
{
  switch(self->_failureReason)
  {
    case 2:
      id v3 = [(PKPassFooterContentView *)self paymentPass];
      id v4 = [v3 devicePrimaryPaymentApplication];
      id v5 = [v4 subcredentials];
      dispatch_time_t v6 = [v5 anyObject];

      if (v6
        && ([v6 entitlement],
            unint64_t v7 = objc_claimAutoreleasedReturnValue(),
            unint64_t v8 = [v7 carKeyEntitlementType],
            v7,
            v8 <= 6))
      {
        PKLocalizedCredentialString(&off_1E59DD890[v8]->isa);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = 0;
      }

      uint64_t v10 = (uint64_t)v11;
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 3:
      int64_t v9 = @"UWB_UPDATED_FAILED_CHECKMARK_OVERRIDE";
      goto LABEL_8;
    case 4:
      int64_t v9 = @"TURN_OFF_AIRPLANE_MODE";
      goto LABEL_8;
    case 5:
      int64_t v9 = @"BLUETOOTH_DISABLED_TITLE";
LABEL_8:
      uint64_t v10 = PKLocalizedCredentialString(&v9->isa);
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_10;
    default:
LABEL_9:
      uint64_t v10 = [(PKPassPaymentContainerView *)self _textOverrideForFatalError];
LABEL_10:
      id v12 = (id)v10;
      [(PKPassPaymentContainerView *)self _applyPayState:9 withTextOverride:v10];

      return;
  }
}

- (void)_resetToIdleState
{
  uint64_t v3 = 21;
  if (!self->_transitioning) {
    uint64_t v3 = 22;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  [(PKPassPaymentPayStateView *)self->_payStateView updateDebugLabel:0 isErrorState:0];
  if ([(PKPassPaymentContainerView *)self _isBackgrounded]
    || !self->_isVisible
    || self->_waitingForPasses)
  {
    if (v4)
    {
      [(PKPassPaymentContainerView *)self _applyPayState:0];
    }
  }
  else
  {
    [(PKPassPaymentContainerView *)self _beginPaymentAuthorization];
  }
}

- (void)_resetToIdleStateAfterDelay:(double)a3
{
  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PKPassPaymentContainerView__resetToIdleStateAfterDelay___block_invoke;
  v5[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__PKPassPaymentContainerView__resetToIdleStateAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resetToIdleState];
    id WeakRetained = v2;
  }
}

- (void)_promoteToAuthorizedStateIfPossible
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)[(PKAuthenticator *)self->_authenticator authenticationIdentifier];
  authorizationQueue = self->_authorizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPassPaymentContainerView__promoteToAuthorizedStateIfPossible__block_invoke;
  block[3] = &unk_1E59CF720;
  objc_copyWeak(v6, &location);
  v6[1] = v3;
  dispatch_async(authorizationQueue, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __65__PKPassPaymentContainerView__promoteToAuthorizedStateIfPossible__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__PKPassPaymentContainerView__promoteToAuthorizedStateIfPossible__block_invoke_2;
    v4[3] = &unk_1E59CF720;
    objc_copyWeak(v5, v2);
    v5[1] = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(v5);
  }
}

void __65__PKPassPaymentContainerView__promoteToAuthorizedStateIfPossible__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    uint64_t v4 = [WeakRetained[61] authenticationIdentifier];
    uint64_t v3 = v11;
    if (v4 == *(void *)(a1 + 40))
    {
      uint64_t v5 = [v11[63] state];
      uint64_t v3 = v11;
      uint64_t v6 = 21;
      if (!*((unsigned char *)v11 + 776)) {
        uint64_t v6 = 22;
      }
      uint64_t v7 = *(uint64_t *)((char *)v11 + OBJC_IVAR___PKPassPaymentContainerView__passView[v6]);
      if (v5 == 2
        || (char v8 = PKUIOnlyDemoModeEnabled(), v3 = v11, (v8 & 1) != 0)
        || (char v9 = PKStoreDemoModeEnabled(), v3 = v11, (v9 & 1) != 0)
        || v11[116]
        || *((unsigned char *)v11 + 880))
      {
        if ((unint64_t)(v7 - 1) < 4 || v7 == 6)
        {
          [v3 _applyPayState:5];
          uint64_t v3 = v11;
        }
      }
    }
  }
}

- (void)_didAuthorizePaymentApplicationWithAuthenticationIdentifier:(unint64_t)a3
{
  if ([(PKPassPaymentContainerView *)self _authenticationAllowed]
    && [(PKAuthenticator *)self->_authenticator authenticationIdentifier] == a3)
  {
    if ([(PKContactlessInterfaceSession *)self->_contactlessInterfaceSession fieldPresent])
    {
      dispatch_time_t v5 = dispatch_time(0, 500000000);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __90__PKPassPaymentContainerView__didAuthorizePaymentApplicationWithAuthenticationIdentifier___block_invoke;
      v7[3] = &unk_1E59CB460;
      void v7[4] = self;
      void v7[5] = a3;
      dispatch_after(v5, MEMORY[0x1E4F14428], v7);
    }
    else
    {
      [(PKPassPaymentContainerView *)self _promoteToAuthorizedStateIfPossible];
    }
    uint64_t v6 = [(PKPassFooterContentView *)self delegate];
    [v6 passFooterContentViewDidAuthenticate:self];
  }
}

uint64_t __90__PKPassPaymentContainerView__didAuthorizePaymentApplicationWithAuthenticationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 488) authenticationIdentifier];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t result = [*(id *)(a1 + 32) _authenticationAllowed];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 _promoteToAuthorizedStateIfPossible];
    }
  }
  return result;
}

- (void)_updateCoachingInstruction
{
  uint64_t v3 = 21;
  if (!self->_transitioning) {
    uint64_t v3 = 22;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
  int64_t v5 = [(PKPassFooterContentView *)self coachingState];
  if ([(PKPassPaymentContainerView *)self _authenticationAllowed]
    && self->_authenticating
    && v4 == 1
    && !self->_transactionSubstate
    && v5 == 3)
  {
    [(PKPassPaymentContainerView *)self _applyPayState:3];
  }
}

- (void)_openURL:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  [v5 setSensitive:1];
  uint64_t v9 = *MEMORY[0x1E4F62688];
  v10[0] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 setFrontBoardOptions:v6];

  if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
  {
    uint64_t v7 = [(PKPassPaymentContainerView *)self window];
    char v8 = v7;
    if (v7) {
      PKPostOpenApplicationNotification(v7, v4, v5);
    }
  }
  else
  {
    PKOpenApplication(v4, v5);
  }
}

- (void)_transactionAwardsViewTapped:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87010];
  v21[0] = *MEMORY[0x1E4F87058];
  v21[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v7 = *MEMORY[0x1E4F86120];
  v19[0] = *MEMORY[0x1E4F86308];
  v19[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86D50];
  v20[0] = *MEMORY[0x1E4F86380];
  v20[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v4 subjects:v6 sendEvent:v9];

  uint64_t v10 = [(PKPaymentTransaction *)self->_transactionForDisplayedBarcode awards];
  id v11 = [v10 firstObject];

  if (v11)
  {
    id v12 = [(PKPassFooterContentView *)self paymentPass];
    paymentService = self->_paymentService;
    uint64_t v14 = [v12 uniqueID];
    uint64_t v15 = [(PKPaymentService *)paymentService transactionsAppLaunchTokenForPassWithUniqueIdentifier:v14];

    uint64_t v16 = [v11 identifier];
    if (v16)
    {
      uint64_t v17 = [NSString stringWithFormat:@"/offers/%@", v16];
    }
    else
    {
      uint64_t v17 = @"/offers";
    }
    uint64_t v18 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:self->_transactionForDisplayedBarcode excludeTransactionIdentifier:0 pass:v12 pathSuffix:v17 appLaunchToken:v15];
    if (v18) {
      [(PKPassPaymentContainerView *)self _openURL:v18];
    }
  }
}

- (void)_postDidAuthorizeNotification
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F87138];
  id v4 = [(UIView *)self pkui_viewControllerFromResponderChain];
  [v5 postNotificationName:v3 object:v4];
}

- (void)_postDidDeauthorizeNotification
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F87140];
  id v4 = [(UIView *)self pkui_viewControllerFromResponderChain];
  [v5 postNotificationName:v3 object:v4];
}

- (void)_activatePaymentApplications:(id)a3 forPaymentPass:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_contactlessInterfaceSession;
  authorizationQueue = self->_authorizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke;
  block[3] = &unk_1E59CF3E0;
  uint64_t v18 = v11;
  id v19 = v8;
  id v20 = v9;
  uint64_t v21 = self;
  id v22 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  uint64_t v16 = v11;
  dispatch_async(authorizationQueue, block);
}

void __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) activatePaymentApplications:*(void *)(a1 + 40) forPaymentPass:*(void *)(a1 + 48)];
  char v3 = v2;
  if (v2 && [*(id *)(a1 + 56) style] == 4) {
    [*(id *)(a1 + 32) authorizeAndStartCardEmulationWithCredential:0 deferAuthorization:0 requiresConfirmationForHandoff:0 startHandoffIfPending:1];
  }
  id v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke_2;
    v5[3] = &unk_1E59CAF20;
    id v6 = v4;
    char v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __89__PKPassPaymentContainerView__activatePaymentApplications_forPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_authorizeForTransactionWithAuthenticatorEvaluationResponse:(id)a3 authenticationIdentifier:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PKPassPaymentContainerView *)self _authenticationAllowed]
    && [(PKAuthenticator *)self->_authenticator authenticationIdentifier] == a4)
  {
    id v10 = [v8 credential];
    id v11 = dispatch_group_create();
    uint64_t v39 = 0;
    __int16 v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    v37[0] = 0;
    v37[1] = v37;
    void v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__53;
    v37[4] = __Block_byref_object_dispose__53;
    id v38 = 0;
    objc_initWeak(&location, self);
    if (PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled())
    {
      *((unsigned char *)v40 + 24) = 1;
    }
    else if ([(PKPassFooterContentView *)self style] == 3)
    {
      dispatch_group_enter(v11);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      void v31[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke;
      v31[3] = &unk_1E59DCEB0;
      objc_copyWeak(v35, &location);
      v35[1] = (id)a4;
      id v32 = v11;
      id v33 = &v39;
      uint64_t v34 = v37;
      [(PKPassPaymentContainerView *)self _retrieveDecryptedBarcodeWithAuthorization:v10 shouldFetchBarcodeIfNecessary:1 completion:v31];

      objc_destroyWeak(v35);
    }
    else
    {
      id v13 = self->_contactlessInterfaceSession;
      id v14 = (void *)[(NSMutableArray *)self->_valueAddedPasses copy];
      authorizationQueue = self->_authorizationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E59DCED8;
      unint64_t v27 = v13;
      id v28 = v14;
      id v29 = v10;
      int v30 = &v39;
      id v16 = v14;
      uint64_t v17 = v13;
      dispatch_group_async(v11, authorizationQueue, block);
    }
    if ([(PKPassPaymentContainerView *)self _shouldDisplayPrimaryView]) {
      [(PKPassPaymentContainerView *)self _updateContentPrimaryView];
    }
    if ([(PKPassPaymentContainerView *)self _shouldDisplaySecondaryView]) {
      [(PKPassPaymentContainerView *)self _updateContentSecondaryView];
    }
    uint64_t v12 = 21;
    if (!self->_transitioning) {
      uint64_t v12 = 22;
    }
    if (*(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___PKPassPaymentContainerView__passView[v12])
       - 1 <= 2
      && !self->_transactionSubstate)
    {
      dispatch_group_enter(v11);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_263;
      v24[3] = &unk_1E59CB6D8;
      id v25 = v11;
      [(PKPassPaymentContainerView *)self _setGlyphState:8 animated:1 withCompletionHandler:v24];
    }
    if (v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2_264;
      v18[3] = &unk_1E59DCF00;
      id v20 = v9;
      uint64_t v21 = &v39;
      id v22 = v37;
      objc_copyWeak(&v23, &location);
      id v19 = v8;
      dispatch_group_notify(v11, MEMORY[0x1E4F14428], v18);

      objc_destroyWeak(&v23);
    }
    objc_destroyWeak(&location);
    _Block_object_dispose(v37, 8);

    _Block_object_dispose(&v39, 8);
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v11 = *MEMORY[0x1E4F87058];
  v39[0] = *MEMORY[0x1E4F87010];
  v39[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v13 = *MEMORY[0x1E4F86308];
  v38[0] = *MEMORY[0x1E4F86368];
  uint64_t v14 = *MEMORY[0x1E4F860F8];
  v37[0] = v13;
  v37[1] = v14;
  id v15 = PKAnalyticsReportBarcodeCredentialRetrivalStatusFromError();
  v38[1] = v15;
  void v37[2] = *MEMORY[0x1E4F86668];
  int v16 = PKNetworkConnectivityAvailable();
  uint64_t v17 = @"true";
  if (!v16) {
    uint64_t v17 = @"false";
  }
  v38[2] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  [v10 subjects:v12 sendEvent:v18];

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (![WeakRetained _authenticationAllowed]
    || [WeakRetained[61] authenticationIdentifier] != *(void *)(a1 + 64))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_14:

    goto LABEL_15;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9 == 0;
  id v20 = PKLogFacilityTypeGetObject();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v9;
      _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Transaction Authorization Error: failed to retrieve barcode with error, %@", buf, 0xCu);
    }

    id v22 = [v9 userInfo];
    id v23 = [v22 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v23)
    {
      id v24 = v23;

      id v9 = v24;
    }
    id v25 = [v9 domain];
    if ([v25 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      if ([v9 code] == -1001)
      {

LABEL_22:
        id v26 = @"PAYMENT_ERROR_BARCODE_PAYMENT_NETWORK_ERROR";
        goto LABEL_23;
      }
      uint64_t v27 = [v9 code];

      if (v27 == -1009) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    id v26 = @"PAYMENT_ERROR_BARCODE_PAYMENT_AUTHORIZATION_ERROR";
LABEL_23:
    uint64_t v28 = PKLocalizedAquamanString(&v26->isa);
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
    int v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_14;
  }
  if (v21)
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v7;
    _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Transaction Authorization succeeded: retrieved barcode identifier, %@", buf, 0xCu);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_261;
  v31[3] = &unk_1E59CB8B0;
  void v31[4] = WeakRetained;
  id v32 = v7;
  id v33 = v8;
  id v34 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v31);

LABEL_15:
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_261(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 928), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 936), *(id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 984);
  *(void *)(v2 + 984) = 0;

  id v4 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v4);
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) activateValueAddedServicePasses:*(void *)(a1 + 40)] & 1) == 0)
  {
    char v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v4 = "Transaction Authorization Error: failed to activate VAS passes...";
      id v5 = (uint8_t *)&v7;
LABEL_10:
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
LABEL_11:

    char v2 = 0;
    goto LABEL_12;
  }
  if (([*(id *)(a1 + 32) authorizeAndStartCardEmulationWithCredential:*(void *)(a1 + 48)] & 1) == 0)
  {
    char v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = 0;
      id v4 = "Transaction Authorization Error: failed to start card emulation...";
      id v5 = (uint8_t *)&v6;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) persistentCardEmulationQueued]) {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E18], 0);
  }
  char v2 = 1;
LABEL_12:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_263(uint64_t a1)
{
}

void __126__PKPassPaymentContainerView__authorizeForTransactionWithAuthenticatorEvaluationResponse_authenticationIdentifier_completion___block_invoke_2_264(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v7 = WeakRetained;
    uint64_t v4 = [WeakRetained style];
    char v3 = v7;
    if (v4 == 3)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id v5 = [v7 delegate];
        [v5 passFooterContentView:v7 didAuthorizeAndRetrieveDecryptedBarcode:v7[117]];

        [v7 _beginBarcodeDisplayTimer];
        [v7 _postDidAuthorizeNotification];
        [v7 _showInstallAssociatedApplicationInstructionsIfNecessary];
        if ([*(id *)(a1 + 32) biometricMatch])
        {
          if (PKPearlIsAvailable()) {
            uint64_t v6 = 3;
          }
          else {
            uint64_t v6 = 2;
          }
        }
        else
        {
          uint64_t v6 = 1;
        }
        [v7 _collectAndSubmitBarcodeEventMetadataWithAuthenticationType:v6];
        [v7 _insertPaymentTransactionForActiveBarcode];
        char v3 = v7;
      }
    }
  }
}

- (void)_resetActiveApplicationForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_contactlessInterfaceSession;
  authorizationQueue = self->_authorizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke;
  block[3] = &unk_1E59CE110;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = v8;
  dispatch_async(authorizationQueue, block);
}

void __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopCardEmulation];
  char v2 = [*(id *)(a1 + 32) activatePaymentApplications:0 forPaymentPass:*(void *)(a1 + 40)];
  char v3 = *(void **)(a1 + 48);
  if (v3)
  {
    char v4 = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke_2;
    v5[3] = &unk_1E59CAF20;
    id v6 = v3;
    char v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __83__PKPassPaymentContainerView__resetActiveApplicationForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_resetCardEmulationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKPassFooterContentView *)self style] == 3)
  {
    activeBarcodeIdentifier = self->_activeBarcodeIdentifier;
    self->_activeBarcodeIdentifier = 0;

    activeBarcodeCredential = self->_activeBarcodeCredential;
    self->_activeBarcodeCredential = 0;

    [(PKAssertion *)self->_userNotificationSupressionAssertion invalidate];
    userNotificationSupressionAssertion = self->_userNotificationSupressionAssertion;
    self->_userNotificationSupressionAssertion = 0;
  }
  id v8 = [(PKPassFooterContentView *)self delegate];
  [v8 passFooterContentViewDidInvalidateAuthorization:self];

  id v9 = self->_contactlessInterfaceSession;
  authorizationQueue = self->_authorizationQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke;
  v13[3] = &unk_1E59CAD18;
  uint64_t v14 = v9;
  id v15 = v4;
  id v11 = v4;
  uint64_t v12 = v9;
  dispatch_async(authorizationQueue, v13);
}

void __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) stopCardEmulation];
  char v3 = *(void **)(a1 + 40);
  if (v3)
  {
    char v4 = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke_2;
    v5[3] = &unk_1E59CAF20;
    id v6 = v3;
    char v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __64__PKPassPaymentContainerView__resetCardEmulationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_beginSessionExchange:(id)a3
{
  if (a3)
  {
    sessionExchangeTaskQueue = self->_sessionExchangeTaskQueue;
    id v5 = _Block_copy(a3);
    [(NSMutableArray *)sessionExchangeTaskQueue addObject:v5];

    [(PKPassPaymentContainerView *)self _executeNextSessionExchangeTask];
  }
}

- (void)_endSessionExchange
{
  self->_sessionExchangeActive = 0;
  [(PKPassPaymentContainerView *)self _executeNextSessionExchangeTask];
}

- (void)_executeNextSessionExchangeTask
{
  if (!self->_contactlessInterfaceSessionSuspended
    && !self->_sessionExchangeActive
    && [(NSMutableArray *)self->_sessionExchangeTaskQueue count])
  {
    char v3 = [(NSMutableArray *)self->_sessionExchangeTaskQueue firstObject];
    [(NSMutableArray *)self->_sessionExchangeTaskQueue removeObjectAtIndex:0];
    if (self->_contactlessInterfaceSession && ![(PKPassFooterContentView *)self isInvalidated])
    {
      self->_sessionExchangeActive = 1;
      sessionExchangeToken = self->_sessionExchangeToken;
      if (sessionExchangeToken)
      {
        ((void (**)(void, NSData *, void))v3)[2](v3, sessionExchangeToken, 0);
      }
      else
      {
        objc_initWeak(&location, self);
        contactlessInterfaceSession = self->_contactlessInterfaceSession;
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke;
        v7[3] = &unk_1E59DCF28;
        objc_copyWeak(&v9, &location);
        id v8 = v3;
        [(PKContactlessInterfaceSession *)contactlessInterfaceSession createSessionHandoffTokenWithCompletion:v7];

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      char v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
      ((void (**)(void, void, void *))v3)[2](v3, 0, v4);
    }
  }
}

void __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke_2;
  v10[3] = &unk_1E59D00B8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v11 = v5;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __61__PKPassPaymentContainerView__executeNextSessionExchangeTask__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 137, *(id *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [WeakRetained _executeNextSessionExchangeTask];
}

- (void)_clearSessionExchangeTasks
{
  sessionExchangeToken = self->_sessionExchangeToken;
  self->_sessionExchangeToken = 0;

  self->_sessionExchangeActive = 0;
  id v4 = (id)[(NSMutableArray *)self->_sessionExchangeTaskQueue copy];
  [(NSMutableArray *)self->_sessionExchangeTaskQueue removeAllObjects];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_268];
}

void __56__PKPassPaymentContainerView__clearSessionExchangeTasks__block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  char v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F87538];
  id v5 = a2;
  id v6 = [v3 errorWithDomain:v4 code:-1 userInfo:0];
  ((void (**)(void, void, id))a2)[2](v5, 0, v6);
}

- (id)_groupTileForTiles:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 metadata];
    if ([v5 isGroupType]) {
      objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_272);
    }
    else {
    id v6 = [MEMORY[0x1E4F848D8] _createDefaultDashboardGroupTileWithChildTiles:v3];
    }
  }
  else
  {
    id v6 = objc_msgSend(v3, "pk_firstObjectPassingTest:", &__block_literal_global_272);
  }

  return v6;
}

BOOL __49__PKPassPaymentContainerView__groupTileForTiles___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 prearmTiles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_reloadTiles
{
  objc_initWeak(&location, self);
  paymentService = self->_paymentService;
  uint64_t v4 = [(PKPassFooterContentView *)self paymentPass];
  id v5 = [v4 uniqueID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __42__PKPassPaymentContainerView__reloadTiles__block_invoke;
  v6[3] = &unk_1E59CF060;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [(PKPaymentService *)paymentService tilesForPassWithUniqueIdentifier:v5 context:1 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__PKPassPaymentContainerView__reloadTiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained _groupTileForTiles:v3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__PKPassPaymentContainerView__reloadTiles__block_invoke_2;
    v8[3] = &unk_1E59CA870;
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    id v7 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __42__PKPassPaymentContainerView__reloadTiles__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 608), *(id *)(a1 + 40));
  char v2 = *(void **)(a1 + 32);

  return [v2 _updateContentPrimaryView];
}

- (void)_applyLatestContentToViews
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (self->_VASInfoViewWillShow
    || self->_VASInfoViewSuppressedTransactionUpdate
    || self->_valueAddedServiceInfoView
    && !self->_VASInfoViewHidden
    && [(PKPassPaymentContainerView *)self _shouldDisplayPrimaryView])
  {
    self->_VASInfoViewSuppressedTransactionUpdate = 1;
  }
  id v3 = (void *)(self->_contentUpdateCounter + 1);
  self->_contentUpdateCounter = (unint64_t)v3;
  objc_initWeak(&location, self);
  uint64_t v4 = dispatch_group_create();
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%{public}p - %{public}ld): fetching content...", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  unint64_t v47 = __Block_byref_object_copy__53;
  uint64_t v48 = __Block_byref_object_dispose__53;
  id v49 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__53;
  v43[4] = __Block_byref_object_dispose__53;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__53;
  v41[4] = __Block_byref_object_dispose__53;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  void v39[3] = __Block_byref_object_copy__53;
  v39[4] = __Block_byref_object_dispose__53;
  id v40 = 0;
  id v6 = [(PKPassFooterContentView *)self paymentPass];
  id v7 = [v6 uniqueID];
  id v8 = (void *)&unk_1A0442000;
  if ([v6 isStoredValuePass])
  {
    id v9 = [v6 devicePrimaryPaymentApplication];
    dispatch_group_enter(v4);
    paymentService = self->_paymentService;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    id v34[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke;
    v34[3] = &unk_1E59D17F0;
    id v38 = v43;
    id v11 = v9;
    id v35 = v11;
    id v36 = v6;
    id v12 = v4;
    uint64_t v37 = v12;
    [(PKPaymentService *)paymentService transitStateWithPassUniqueIdentifier:v7 paymentApplication:v11 completion:v34];
    dispatch_group_enter(v12);
    id v13 = self->_paymentService;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_3;
    v31[3] = &unk_1E59D1818;
    id v33 = v41;
    id v14 = v12;
    id v32 = v14;
    [(PKPaymentService *)v13 balancesForPaymentPassWithUniqueIdentifier:v7 completion:v31];
    dispatch_group_enter(v14);
    id v15 = self->_paymentService;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_5;
    v28[3] = &unk_1E59CC5A8;
    int v30 = v39;
    uint64_t v29 = v14;
    [(PKPaymentService *)v15 plansForPaymentPassWithUniqueIdentifier:v7 completion:v28];

    id v8 = &unk_1A0442000;
  }
  dispatch_group_enter(v4);
  id v16 = self->_paymentService;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = v8[313];
  uint64_t v17 = v22;
  id v23 = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_6;
  id v24 = &unk_1E59DC990;
  id v26 = buf;
  objc_copyWeak(&v27, &location);
  uint64_t v18 = v4;
  id v25 = v18;
  [(PKPaymentService *)v16 tilesForPassWithUniqueIdentifier:v7 context:1 completion:&v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = v17;
  void v19[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_7;
  v19[3] = &unk_1E59DCF98;
  objc_copyWeak(v20, &location);
  v20[1] = v3;
  v19[4] = v43;
  v19[5] = v41;
  v19[6] = v39;
  v19[7] = buf;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], v19);
  objc_destroyWeak(v20);

  objc_destroyWeak(&v27);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_2;
  block[3] = &unk_1E59DCF70;
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v11 = v4;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_2(void *a1)
{
  char v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = [v2 transitPassPropertiesWithPaymentApplication:a1[5] pass:a1[6]];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = a1[7];

  dispatch_group_leave(v6);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_4;
  block[3] = &unk_1E59D21C0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  char v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained _groupTileForTiles:v4];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v9 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v9);
}

void __56__PKPassPaymentContainerView__applyLatestContentToViews__block_invoke_7(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[79];
    if (v4 == *(id *)(a1 + 72))
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 134349312;
        uint64_t v7 = v3;
        __int16 v8 = 2050;
        id v9 = v4;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPassPaymentContainerView (%{public}p - %{public}ld): finished fetching balances.", (uint8_t *)&v6, 0x16u);
      }

      [v3[115] setTransitProperties:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      [v3[115] setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      [v3[115] updateWithDynamicCommutePlans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      objc_storeStrong(v3 + 76, *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      [v3 _updateContentPrimaryView];
      [v3 _updateContentSecondaryView];
    }
  }
}

- (void)_updateContentPrimaryView
{
  v114[2] = *MEMORY[0x1E4F143B8];
  p_displayedPrimaryView = &self->_displayedPrimaryView;
  id v4 = self->_displayedPrimaryView;
  if ([(PKTransitBalanceModel *)self->_transitBalanceModel hasBalanceContent])
  {
    id v5 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableBalances];
    uint64_t v6 = [v5 count];
    unint64_t v7 = v6;
    if (v6 == 1)
    {
      p_singleValueCellPrimardouble y = (id *)&self->_singleValueCellPrimary;
      singleValueCellPrimardouble y = self->_singleValueCellPrimary;
      if (!singleValueCellPrimary)
      {
        uint64_t v10 = &off_1E59C2848;
LABEL_31:
        id v59 = objc_alloc(*v10);
        uint64_t v60 = objc_msgSend(v59, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        id v61 = *p_singleValueCellPrimary;
        *p_singleValueCellPrimardouble y = (id)v60;

        [*p_singleValueCellPrimary setAlpha:0.0];
        [(PKPassPaymentContainerView *)self addSubview:*p_singleValueCellPrimary];
        singleValueCellPrimardouble y = (PKPaymentDashboardCellActionHandleable *)*p_singleValueCellPrimary;
        BOOL v31 = 1;
        goto LABEL_32;
      }
    }
    else
    {
      if (!v6)
      {
        CGFloat v57 = 0;
        BOOL v31 = 0;
        goto LABEL_33;
      }
      p_singleValueCellPrimardouble y = (id *)&self->_dualValueCellPrimary;
      singleValueCellPrimardouble y = self->_dualValueCellPrimary;
      if (!singleValueCellPrimary)
      {
        uint64_t v10 = off_1E59C3608;
        goto LABEL_31;
      }
    }
    BOOL v31 = 0;
LABEL_32:
    CGFloat v57 = singleValueCellPrimary;
LABEL_33:
    objc_storeStrong((id *)p_displayedPrimaryView, v57);
    CGFloat v62 = [(PKPaymentDashboardCellActionHandleable *)v57 layer];
    uint64_t v63 = [v62 presentationLayer];
    CGFloat v64 = v63;
    if (!v63) {
      uint64_t v63 = v62;
    }
    [v63 opacity];
    float v66 = v65;

    BOOL v68 = v66 > 0.0 && self->_isVisible;
    unint64_t v69 = v7 - 1;
    if (v7 == 1)
    {
      BOOL v110 = v31;
      v70 = [v5 objectAtIndexedSubscript:0];
      v71 = v57;
      [(PKPaymentDashboardCellActionHandleable *)v71 beginUpdates];
      [(PKPaymentDashboardCellActionHandleable *)v71 setEnableDisclosure:0];
      double v72 = [(PKPassFooterContentView *)self paymentPass];
      [(PKPaymentDashboardCellActionHandleable *)v71 setPass:v72];

      CGFloat v73 = [(PKPaymentDashboardCellActionHandleable *)v70 localizedTitle];
      if (v73)
      {
        [(PKPaymentDashboardCellActionHandleable *)v71 setTitle:v73];
      }
      else
      {
        PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
        CGFloat v77 = v76 = p_displayedPrimaryView;
        [(PKPaymentDashboardCellActionHandleable *)v71 setTitle:v77];

        p_displayedPrimaryView = v76;
      }

      double v78 = [(PKPaymentDashboardCellActionHandleable *)v70 formattedValue];
      [(PKPaymentDashboardCellActionHandleable *)v71 setDetail:v78];

      [(PKPaymentDashboardCellActionHandleable *)v71 setSubDetail:0];
      CGFloat v79 = v71;
      BOOL v80 = v68;
    }
    else
    {
      if (v7 == 2)
      {
        BOOL v110 = v31;
        v108 = p_displayedPrimaryView;
        v70 = v57;
        [(PKPaymentDashboardCellActionHandleable *)v70 beginUpdates];
        v71 = [v5 objectAtIndexedSubscript:0];
        double v74 = [(PKPaymentDashboardCellActionHandleable *)v71 localizedTitle];
        if (v74)
        {
          [(PKPaymentDashboardCellActionHandleable *)v70 setLeftTitle:v74];
        }
        else
        {
          CGFloat v81 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
          [(PKPaymentDashboardCellActionHandleable *)v70 setLeftTitle:v81];
        }
        BOOL v82 = v68;

        v83 = [(PKPaymentDashboardCellActionHandleable *)v71 formattedValue];
        [(PKPaymentDashboardCellActionHandleable *)v70 setLeftDetail:v83];

        [(PKPaymentDashboardCellActionHandleable *)v70 setLeftSubDetail:0];
        v84 = [v5 objectAtIndexedSubscript:1];
        double v85 = [v84 localizedTitle];
        if (v85)
        {
          [(PKPaymentDashboardCellActionHandleable *)v70 setRightTitle:v85];
        }
        else
        {
          double v86 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
          [(PKPaymentDashboardCellActionHandleable *)v70 setRightTitle:v86];
        }
        id v87 = [v84 formattedValue];
        [(PKPaymentDashboardCellActionHandleable *)v70 setRightDetail:v87];

        [(PKPaymentDashboardCellActionHandleable *)v70 setRightSubDetail:0];
        CGRect v88 = [(PKPassFooterContentView *)self paymentPass];
        [(PKPaymentDashboardCellActionHandleable *)v70 setPass:v88];

        [(PKPaymentDashboardCellActionHandleable *)v70 setEnableDisclosure:0];
        [(PKPaymentDashboardCellActionHandleable *)v70 endUpdates:v82];

        p_displayedPrimaryView = v108;
        goto LABEL_68;
      }
      if (v7 < 3)
      {
LABEL_69:
        [(PKPassPaymentContainerView *)self setNeedsLayout];

        goto LABEL_70;
      }
      BOOL v106 = v68;
      BOOL v110 = v31;
      v70 = v57;
      [(PKPaymentDashboardCellActionHandleable *)v70 beginUpdates];
      v71 = [v5 objectAtIndexedSubscript:0];
      CGFloat v75 = [(PKPaymentDashboardCellActionHandleable *)v71 localizedTitle];
      if (v75)
      {
        [(PKPaymentDashboardCellActionHandleable *)v70 setLeftTitle:v75];
      }
      else
      {
        CGRect v94 = PKLocalizedPaymentString(&cfstr_PropertySummar.isa);
        [(PKPaymentDashboardCellActionHandleable *)v70 setLeftTitle:v94];
      }
      CGRect v95 = [(PKPaymentDashboardCellActionHandleable *)v71 formattedValue];
      [(PKPaymentDashboardCellActionHandleable *)v70 setLeftDetail:v95];

      [(PKPaymentDashboardCellActionHandleable *)v70 setLeftSubDetail:0];
      CGRect v96 = PKLocalizedPaymentString(&cfstr_PropertySummar_0.isa);
      [(PKPaymentDashboardCellActionHandleable *)v70 setRightTitle:v96];

      CGRect v97 = PKLocalizedPaymentString(&cfstr_PropertySummar_1.isa, &cfstr_Lu.isa, v69);
      [(PKPaymentDashboardCellActionHandleable *)v70 setRightDetail:v97];

      [(PKPaymentDashboardCellActionHandleable *)v70 setRightSubDetail:0];
      CGRect v98 = [(PKPassFooterContentView *)self paymentPass];
      [(PKPaymentDashboardCellActionHandleable *)v70 setPass:v98];

      [(PKPaymentDashboardCellActionHandleable *)v70 setEnableDisclosure:0];
      CGFloat v79 = v70;
      BOOL v80 = v106;
    }
    [(PKPaymentDashboardCellActionHandleable *)v79 endUpdates:v80];
LABEL_68:

    BOOL v31 = v110;
    goto LABEL_69;
  }
  uint64_t v11 = [(PKPaymentTransaction *)self->_transactionForDisplayedBarcode awards];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    transactionAwardsView = self->_transactionAwardsView;
    BOOL v14 = transactionAwardsView == 0;
    if (!transactionAwardsView)
    {
      id v15 = [PKPaymentTransactionView alloc];
      id v16 = -[PKPaymentTransactionView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v17 = self->_transactionAwardsView;
      self->_transactionAwardsView = v16;

      [(PKPaymentTransactionView *)self->_transactionAwardsView setAlpha:0.0];
      [(UIView *)self->_transactionAwardsView pkui_setMaskType:3];
      uint64_t v18 = self->_transactionAwardsView;
      id v19 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
      [(PKPaymentTransactionView *)v18 setBackgroundColor:v19];

      [(PKPassPaymentContainerView *)self addSubview:self->_transactionAwardsView];
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__transactionAwardsViewTapped_];
      [(PKPaymentTransactionView *)self->_transactionAwardsView addGestureRecognizer:v20];

      transactionAwardsView = self->_transactionAwardsView;
    }
    objc_storeStrong((id *)p_displayedPrimaryView, transactionAwardsView);
    uint64_t v21 = [(PKPaymentTransaction *)self->_transactionForDisplayedBarcode awards];
    uint64_t v22 = [v21 firstObject];

    id v23 = self->_transactionAwardsView;
    id v24 = [v22 formattedStringValue];
    [(PKPaymentTransactionView *)v23 setPrimaryString:v24];

    id v25 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v26 = [v22 claimExpiryDate];
    id v27 = [v22 redeemExpiryDate];
    v104 = (void *)v26;
    if (v26)
    {
      uint64_t v28 = [v25 earlierDate:v26];
      LODWORD(v26) = v28 == v25;
    }
    v105 = v4;
    v107 = p_displayedPrimaryView;
    BOOL v109 = v14;
    if (v27)
    {
      uint64_t v29 = [v25 earlierDate:v27];
      BOOL v30 = v29 == v25;
    }
    else
    {
      BOOL v30 = 0;
    }
    if (v26 | v30) {
      id v38 = @"REDEEM_TRANSACTION_AWARD";
    }
    else {
      id v38 = @"VIEW_TRANSACTION_AWARD";
    }
    uint64_t v39 = self->_transactionAwardsView;
    id v40 = v38;
    uint64_t v41 = [(PKPassFooterContentView *)self paymentPass];
    id v42 = [v41 organizationName];
    uint64_t v43 = PKLocalizedAquamanString(v40, &stru_1EF1B4C70.isa, v42);

    [(PKPaymentTransactionView *)v39 setSecondaryString:v43];
    id v44 = [v22 subtype];
    uint64_t v45 = [v44 length];

    if (v45)
    {
      uint64_t v46 = [(PKPassFooterContentView *)self paymentPass];
      unint64_t v47 = [v46 rawIcon];

      id v48 = objc_alloc(MEMORY[0x1E4F84780]);
      id v49 = v47;
      uint64_t v50 = [v49 imageRef];
      [v49 scale];
      CGFloat v51 = objc_msgSend(v48, "initWithCGImage:scale:orientation:", v50, 1);
      v52 = [MEMORY[0x1E4FB1818] imageWithPKImage:v51];
    }
    else
    {
      v52 = PKUIImageNamed(@"AppleOffer");
    }
    p_displayedPrimaryView = v107;
    [(PKPaymentTransactionView *)self->_transactionAwardsView setPrimaryImage:v52];
    [(PKPassPaymentContainerView *)self setNeedsLayout];
    double v53 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v54 = *MEMORY[0x1E4F87010];
    v114[0] = *MEMORY[0x1E4F87058];
    v114[1] = v54;
    long long v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
    uint64_t v112 = *MEMORY[0x1E4F86308];
    uint64_t v113 = *MEMORY[0x1E4F86490];
    double v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    [v53 subjects:v55 sendEvent:v56];

    id v4 = v105;
    BOOL v31 = v109;
  }
  else if (self->_groupTile)
  {
    tileGroupView = self->_tileGroupView;
    BOOL v31 = tileGroupView == 0;
    if (!tileGroupView)
    {
      id v33 = objc_alloc_init(PKPassTileGroupView);
      id v34 = self->_tileGroupView;
      self->_tileGroupView = v33;

      [(PKPassTileGroupView *)self->_tileGroupView setAlpha:0.0];
      [(PKPassTileGroupView *)self->_tileGroupView setDelegate:self];
      [(PKPassPaymentContainerView *)self addSubview:self->_tileGroupView];
      tileGroupView = self->_tileGroupView;
    }
    objc_storeStrong((id *)p_displayedPrimaryView, tileGroupView);
    id v35 = [(UIView *)*p_displayedPrimaryView layer];
    id v36 = [v35 presentationLayer];
    uint64_t v37 = v36;
    if (!v36) {
      id v36 = v35;
    }
    [v36 opacity];
    float v90 = v89;

    BOOL v92 = v90 > 0.0 && self->_isVisible;
    CGRect v93 = self->_tileGroupView;
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __55__PKPassPaymentContainerView__updateContentPrimaryView__block_invoke;
    v111[3] = &unk_1E59CA7D0;
    v111[4] = self;
    [(PKPassTileGroupView *)v93 performBatchUpdates:v111 animated:v92];
    [(PKPassPaymentContainerView *)self setNeedsLayout];
  }
  else
  {
    double v58 = *p_displayedPrimaryView;
    *p_displayedPrimaryView = 0;

    BOOL v31 = 0;
  }
LABEL_70:
  CGRect v99 = *p_displayedPrimaryView;
  if (v4 != *p_displayedPrimaryView)
  {
    if (v4)
    {
      CGRect v100 = [(UIView *)v4 layer];
      objc_msgSend(v100, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

      CGRect v99 = *p_displayedPrimaryView;
    }
    BOOL v101 = !v31;
    if (v4) {
      BOOL v101 = 0;
    }
    if (!v101 && v99)
    {
      double v102 = (double)[(PKPassPaymentContainerView *)self _isPrimaryViewVisible];
      v103 = [(UIView *)*p_displayedPrimaryView layer];
      objc_msgSend(v103, "pkui_animateToOpacity:withCompletion:", 0, v102);
    }
  }
}

void __55__PKPassPaymentContainerView__updateContentPrimaryView__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _canDisplaySecondaryView])
  {
    if ([*(id *)(a1 + 32) _shouldDisplaySecondaryView]) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[75];
  id v5 = [v3 paymentPass];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 592);
  uint64_t v8 = *(void *)(v6 + 608);
  v9[0] = 1;
  uint64_t v10 = v2;
  uint64_t v11 = 0;
  [v4 setPass:v5 passView:v7 groupTile:v8 context:v9 animated:0];
}

- (void)_updateContentSecondaryView
{
  p_displayedSecondaryView = &self->_displayedSecondaryView;
  id v4 = self->_displayedSecondaryView;
  if ([(PKTransitBalanceModel *)self->_transitBalanceModel hasCommutePlanContent])
  {
    singleValueCellSecondardouble y = self->_singleValueCellSecondary;
    BOOL v32 = singleValueCellSecondary == 0;
    if (!singleValueCellSecondary)
    {
      uint64_t v6 = [PKAdjustableSingleCellView alloc];
      uint64_t v7 = -[PKAdjustableSingleCellView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v8 = self->_singleValueCellSecondary;
      self->_singleValueCellSecondardouble y = v7;

      [(PKPaymentDashboardCellActionHandleable *)self->_singleValueCellSecondary setAlpha:0.0];
      [(PKPassPaymentContainerView *)self addSubview:self->_singleValueCellSecondary];
      singleValueCellSecondardouble y = self->_singleValueCellSecondary;
    }
    objc_storeStrong((id *)p_displayedSecondaryView, singleValueCellSecondary);
    id v9 = [(UIView *)*p_displayedSecondaryView layer];
    uint64_t v10 = [v9 presentationLayer];
    uint64_t v11 = v10;
    if (!v10) {
      uint64_t v10 = v9;
    }
    [v10 opacity];
    float v15 = v14;

    BOOL v17 = v15 > 0.0 && self->_isVisible;
    uint64_t v18 = [(PKPassFooterContentView *)self paymentPass];
    id v19 = self->_singleValueCellSecondary;
    [(PKPaymentDashboardCellActionHandleable *)v19 beginUpdates];
    [(PKPaymentDashboardCellActionHandleable *)v19 setPass:v18];
    [(PKPaymentDashboardCellActionHandleable *)v19 setEnableDisclosure:0];
    transitBalanceModel = self->_transitBalanceModel;
    char v36 = 0;
    id v34 = 0;
    id v35 = 0;
    id v33 = &stru_1EF1B5B50;
    [(PKTransitBalanceModel *)transitBalanceModel getDisplayableCommutePlanDetailsForTitle:&v35 value:&v34 subtitle:&v33 isExpired:&v36];
    id v21 = v35;
    id v22 = v34;
    id v23 = v33;
    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    PKCommutePlanFormatTitleFromLabelAndValue();
    id v24 = v21;

    id v25 = v22;
    [(PKPaymentDashboardCellActionHandleable *)v19 setTitle:v24];
    [(PKPaymentDashboardCellActionHandleable *)v19 setDetail:v25];
    [(PKPaymentDashboardCellActionHandleable *)v19 setSubDetail:v23];
    if (v36) {
      [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else {
    uint64_t v26 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [(PKPaymentDashboardCellActionHandleable *)v19 setSubDetailColor:v26];

    [(PKPaymentDashboardCellActionHandleable *)v19 endUpdates:v17];
    [(PKPassPaymentContainerView *)self layoutIfNeeded];
    [(PKPassPaymentContainerView *)self setNeedsLayout];

    BOOL v13 = v32;
  }
  else
  {
    uint64_t v12 = *p_displayedSecondaryView;
    *p_displayedSecondaryView = 0;

    BOOL v13 = 0;
  }
  id v27 = *p_displayedSecondaryView;
  if (v4 != *p_displayedSecondaryView)
  {
    if (v4)
    {
      uint64_t v28 = [(UIView *)v4 layer];
      objc_msgSend(v28, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

      id v27 = *p_displayedSecondaryView;
    }
    BOOL v29 = !v13;
    if (v4) {
      BOOL v29 = 0;
    }
    if (!v29 && v27)
    {
      double v30 = (double)[(PKPassPaymentContainerView *)self _isSecondaryViewVisible];
      BOOL v31 = [(UIView *)*p_displayedSecondaryView layer];
      objc_msgSend(v31, "pkui_animateToOpacity:withCompletion:", 0, v30);
    }
  }
}

- (void)_updateApplicationsView
{
  if (self->_applicationsView)
  {
    uint64_t v3 = 21;
    if (!self->_transitioning) {
      uint64_t v3 = 22;
    }
    uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v3]);
    id v5 = [(PKPassPaymentPayStateView *)self->_payStateView glyph];
    unint64_t v6 = [v5 state];

    if (v4 != 1 || v6 > 8) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = (0x5Du >> v6) & 1;
    }
    applicationsView = self->_applicationsView;
    [(PKPassPaymentApplicationView *)applicationsView setUserInteractionEnabled:v8];
  }
}

- (void)_performActivationStateUpdate:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (v4)
  {
    BOOL v13 = v4;
    BOOL v5 = [(PKPassPaymentContainerView *)self _isDeactivated];
    BOOL v6 = [(PKPassPaymentContainerView *)self _isBackgrounded];
    BOOL v7 = [(PKPassPaymentContainerView *)self _authenticationAllowed];
    v13[2]();
    BOOL v8 = [(PKPassPaymentContainerView *)self _isDeactivated];
    BOOL v9 = [(PKPassPaymentContainerView *)self _isBackgrounded];
    BOOL v10 = [(PKPassPaymentContainerView *)self _authenticationAllowed];
    if (v7 && !v10) {
      [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:v6 ^ v9 | v5 ^ v8];
    }
    if (v6 && !v9) {
      [(PKPassPaymentContainerView *)self _applyLatestContentToViews];
    }
    uint64_t v4 = v13;
    if (v6 ^ v9 | v5 ^ v8)
    {
      if (v5 && !v8)
      {
        uint64_t v11 = [(PKPassFooterContentView *)self pass];
        BOOL v12 = +[PKPassPaymentContainerView shouldAutomaticallyAuthorizeForPass:v11 withContext:0];

        if (v12) {
          self->_BOOL pendingAutomaticAuthorization = 1;
        }
      }
      [(PKPassPaymentContainerView *)self _resetToIdleState];
      uint64_t v4 = v13;
    }
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
  v4[3] = &unk_1E59CD7D8;
  void v4[4] = self;
  $96EE1C12479E9B303E9C2794B92A11A2 v5 = a4;
  [(PKPassPaymentContainerView *)self _performActivationStateUpdate:v4];
}

uint64_t __85__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 856) = *(_WORD *)(result + 40);
  return result;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke;
  v4[3] = &unk_1E59CD800;
  void v4[4] = self;
  unsigned int v5 = a4;
  [(PKPassPaymentContainerView *)self _performActivationStateUpdate:v4];
}

uint64_t __83__PKPassPaymentContainerView_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 860) = *(_DWORD *)(result + 40);
  return result;
}

- (BOOL)_isDeactivated
{
  return !self->_foregroundActiveState.foregroundActive
      || +[PKUIForegroundActiveArbiter isDeactivedForReasons:self->_deactivationReasons];
}

- (BOOL)_isBackgrounded
{
  return !self->_foregroundActiveState.foreground
      || +[PKUIForegroundActiveArbiter isBackgroundedForReasons:self->_deactivationReasons];
}

- (BOOL)_isForegroundActive
{
  if ([(PKPassPaymentContainerView *)self _isDeactivated]) {
    return 0;
  }
  else {
    return ![(PKPassPaymentContainerView *)self _isBackgrounded];
  }
}

- (void)_configureForStyle:(int64_t)a3 context:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(PKPassFooterContentView *)self pass];
  if (PKUserIntentIsAvailable())
  {
    BOOL v7 = (LAUIPhysicalButtonView *)[objc_alloc(MEMORY[0x1E4F72FE0]) initWithStyle:0];
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v7;

    [(LAUIPhysicalButtonView *)self->_physicalButtonView setAlpha:0.0];
    [(PKPassPaymentContainerView *)self addSubview:self->_physicalButtonView];
    [(PKPassPaymentContainerView *)self _setUserIntentRequired:+[PKPassPaymentContainerView initialUserIntentRequiredAssumptionForPass:v6 context:v10 paymentService:self->_paymentService]];
  }
  if ((unint64_t)a3 <= 4)
  {
    if (a3 == 2)
    {
      [(PKPassPaymentContainerView *)self _configureForValueAddedServiceWithPass:v6 context:v10];
    }
    else
    {
      BOOL v9 = [(PKPassFooterContentView *)self paymentPass];
      [(PKPassPaymentContainerView *)self _configureForPaymentWithPaymentPass:v9 context:v10];
    }
  }
}

- (void)_configureForPaymentWithPaymentPass:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PKPassFooterContentView *)self style];
  BOOL v9 = [[PKPassPaymentPayStateView alloc] initWithStyle:v8];
  payStateView = self->_payStateView;
  self->_payStateView = v9;

  uint64_t v11 = [v6 isAccessPass];
  [(PKPassPaymentPayStateView *)self->_payStateView setAccessPass:v11];
  BOOL v12 = self->_payStateView;
  if (v11) {
    BOOL v13 = [v6 accessType] == 3;
  }
  else {
    BOOL v13 = 0;
  }
  [(PKPassPaymentPayStateView *)v12 setHomeKeyPass:v13];
  [(PKPassPaymentPayStateView *)self->_payStateView setDelegate:self];
  [(PKPassPaymentPayStateView *)self->_payStateView setAlpha:0.0];
  -[PKPassPaymentPayStateView setPersistentEmulationHint:](self->_payStateView, "setPersistentEmulationHint:", [v7 wantsPersistentCardEmulation]);
  [(PKPassPaymentContainerView *)self addSubview:self->_payStateView];
  [(PKPassPaymentContainerView *)self _applyLatestContentToViews];
  if ([v6 contactlessActivationGroupingType] == 2
    && [v6 hasContactlessDevicePaymentApplicationsAvailable])
  {
    float v14 = [[PKPassPaymentApplicationView alloc] initWithPass:v6];
    applicationsView = self->_applicationsView;
    self->_applicationsView = v14;

    [(PKPassPaymentApplicationView *)self->_applicationsView setDelegate:self];
    [(PKPassPaymentApplicationView *)self->_applicationsView setAlpha:0.0];
    [(PKPassPaymentContainerView *)self addSubview:self->_applicationsView];
  }
  if (v8 == 3)
  {
    objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v16 = (UITextView *)objc_claimAutoreleasedReturnValue();
    bottomTextView = self->_bottomTextView;
    self->_bottomTextView = v16;

    uint64_t v18 = self->_bottomTextView;
    id v19 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB2798]);
    [(UITextView *)v18 setFont:v19];

    id v20 = self->_bottomTextView;
    id v21 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UITextView *)v20 setTextColor:v21];

    [(UITextView *)self->_bottomTextView setEditable:0];
    [(UITextView *)self->_bottomTextView setSelectable:1];
    [(UITextView *)self->_bottomTextView setScrollingEnabled:0];
    [(UITextView *)self->_bottomTextView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)self->_bottomTextView setAlpha:0.0];
    [(UITextView *)self->_bottomTextView setDelegate:self];
    [(PKPassPaymentContainerView *)self addSubview:self->_bottomTextView];
  }
  id v22 = [(PKPassFooterContentView *)self bottomRule];
  [v22 setAlpha:0.0];

  [(PKPassFooterContentView *)self setInfoButtonAlpha:0.0];
  if ((unint64_t)([(PKPassFooterContentView *)self style] - 1) >= 3)
  {
    id v23 = [(PKPassFooterContentView *)self bottomRule];
    [(PKPassPaymentContainerView *)self addSubview:v23];

    id v24 = [[PKPassValueAddedServiceInfoView alloc] initWithStyle:0];
    valueAddedServiceInfoView = self->_valueAddedServiceInfoView;
    self->_valueAddedServiceInfoView = v24;

    [(PKPassValueAddedServiceInfoView *)self->_valueAddedServiceInfoView setAlpha:0.0];
    [(PKPassPaymentContainerView *)self addSubview:self->_valueAddedServiceInfoView];
  }
  uint64_t v26 = [(PKPassFooterContentView *)self paymentPass];
  id v27 = (void *)RequiredExpressApplicationsForAutomaticAuthorization(v26, v7, self->_paymentService, self->_contactlessInterfaceSession);

  if ([v27 count]) {
    self->_requireExpress = 1;
  }
  if (self->_valueAddedServiceInfoView)
  {
    self->_waitingForPasses = 1;
    objc_initWeak(&location, self);
    uint64_t v28 = [v7 additionalPassUniqueIdentifiers];

    passLibrardouble y = self->_passLibrary;
    if (v28)
    {
      double v30 = [v7 additionalPassUniqueIdentifiers];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      id v34[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke;
      v34[3] = &unk_1E59CB088;
      BOOL v31 = &v35;
      objc_copyWeak(&v35, &location);
      [(PKPassLibrary *)passLibrary getPassesWithUniqueIdentifiers:v30 handler:v34];
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      id v32[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_5;
      v32[3] = &unk_1E59CB088;
      BOOL v31 = &v33;
      objc_copyWeak(&v33, &location);
      [(PKPassLibrary *)passLibrary enabledValueAddedServicePassesWithCompletion:v32];
    }
    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
  if (v8 != 4) {
    [(PKPassPaymentContainerView *)self _activateForPaymentWithApplications:v27];
  }
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_320_0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_3;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

uint64_t __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasValidNFCPayload] && objc_msgSend(v2, "isValid")) {
    uint64_t v3 = [v2 hasStoredValue] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setValueAddedServicePasses:*(void *)(a1 + 32)];
    unsigned int v5 = (void *)v4[83];
    id v6 = [*(id *)(a1 + 32) firstObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_4;
    v7[3] = &unk_1E59CB100;
    objc_copyWeak(&v8, v2);
    [v5 setPass:v6 animated:0 completion:v7];

    objc_destroyWeak(&v8);
  }
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[865] = 0;
    id v2 = WeakRetained;
    if ([WeakRetained _hasValueAddedServicePasses]) {
      [v2 _setVASInfoViewHidden:0 animated:1 completion:0];
    }
    id WeakRetained = v2;
    if (v2[864])
    {
      [v2 _beginPaymentAuthorization];
      id WeakRetained = v2;
    }
  }
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_6;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __74__PKPassPaymentContainerView__configureForPaymentWithPaymentPass_context___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setValueAddedServicePasses:*(void *)(a1 + 32)];
    id WeakRetained = v3;
    v3[865] = 0;
    if (v3[864])
    {
      [v3 _resetToIdleState];
      id WeakRetained = v3;
    }
  }
}

- (void)_configureForValueAddedServiceWithPass:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKPassPaymentPayStateView alloc] initWithStyle:[(PKPassFooterContentView *)self style]];
  payStateView = self->_payStateView;
  self->_payStateView = v8;

  [(PKPassPaymentPayStateView *)self->_payStateView setDelegate:self];
  [(PKPassPaymentPayStateView *)self->_payStateView setAlpha:0.0];
  [(PKPassPaymentContainerView *)self addSubview:self->_payStateView];
  [(PKPassPaymentContainerView *)self _applyLatestContentToViews];
  id v10 = [(PKPassFooterContentView *)self appIconView];
  [v10 setAlpha:1.0];

  [(PKPassFooterContentView *)self setInfoButtonAlpha:1.0];
  uint64_t v11 = [(PKPassFooterContentView *)self bottomRule];
  [v11 setAlpha:1.0];

  BOOL v12 = [(PKPassFooterContentView *)self bottomRule];
  [(PKPassPaymentContainerView *)self addSubview:v12];

  id v16 = [v6 userInfo];
  BOOL v13 = [v16 objectForKey:@"PKPassPaymentContainerViewPresentationPayStateKey"];
  pendingPresentationContextState = self->_pendingPresentationContextState;
  self->_pendingPresentationContextState = v13;

  float v15 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  [(PKPassPaymentContainerView *)self _setValueAddedServicePasses:v15];

  LOBYTE(v15) = +[PKPassPaymentContainerView shouldAutomaticallyAuthorizeForPass:v7 withContext:v6];
  self->_BOOL pendingAutomaticAuthorization = (char)v15;
}

- (void)_applyPresentationPayState:(int64_t)a3
{
  if (a3 == 8) {
    [(PKPassPaymentContainerView *)self _applyTerminalTransactionSubstateWithSuccess:1 reset:1];
  }
  else {
    -[PKPassPaymentContainerView _applyPayState:withTextOverride:animated:completionHandler:](self, "_applyPayState:withTextOverride:animated:completionHandler:");
  }
}

- (void)_applyPaymentIndefiniteSuccessState
{
  if (!self->_transactionSubstate)
  {
    self->_transactionSubstate = 1;
    uint64_t v2 = 21;
    if (!self->_transitioning) {
      uint64_t v2 = 22;
    }
    if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v2]) != (Class)7) {
      [(PKPassPaymentContainerView *)self _applyPayState:7 withTextOverride:0 completionHandler:0];
    }
  }
}

- (void)_applyTerminalTransactionSubstateWithSuccess:(BOOL)a3 reset:(BOOL)a4
{
}

- (void)_applyTerminalTransactionSubstateWithSuccess:(BOOL)a3 reset:(BOOL)a4 errorOverride:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  self->_lastTransactionTime = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = 2;
  if (!v6) {
    uint64_t v9 = 3;
  }
  int64_t transactionSubstate = self->_transactionSubstate;
  BOOL v11 = transactionSubstate == 2;
  if (transactionSubstate == 2)
  {
    int v12 = 1;
  }
  else
  {
    int64_t transactionSubstate = v9;
    int v12 = v6;
  }
  if (v11 && !v6)
  {
    BOOL v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = 3;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "View overriding desired transaction state: %ld -> success.", buf, 0xCu);
    }

    int v12 = 1;
    int64_t transactionSubstate = 2;
  }
  BOOL holdingTerminalSubstate = self->_holdingTerminalSubstate;
  self->_BOOL holdingTerminalSubstate = !a4;
  self->_int64_t transactionSubstate = transactionSubstate;
  if (!self->_holdingTerminalSubstate)
  {
    transactionResolutionTimer = self->_transactionResolutionTimer;
    if (transactionResolutionTimer)
    {
      dispatch_source_cancel(transactionResolutionTimer);
      id v16 = self->_transactionResolutionTimer;
      self->_transactionResolutionTimer = 0;
    }
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v27, (id *)buf);
  BOOL v17 = _Block_copy(aBlock);
  uint64_t v18 = v17;
  uint64_t v19 = 21;
  if (!self->_transitioning) {
    uint64_t v19 = 22;
  }
  if (v12) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = 9;
  }
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v19]) == (Class)v20)
  {
    if (holdingTerminalSubstate && !self->_holdingTerminalSubstate && !self->_transitioning) {
      (*((void (**)(void *))v17 + 2))(v17);
    }
  }
  else
  {
    if (v12)
    {
      id v21 = 0;
    }
    else if ([v8 length])
    {
      id v21 = v8;
    }
    else
    {
      id v22 = [(PKPassFooterContentView *)self paymentPass];
      if ([v22 isAccessPass]) {
        id v23 = @"PAYMENT_TRY_AGAIN";
      }
      else {
        id v23 = @"PAYMENT_ERROR_TRANSACTION_ERROR";
      }
      PKLocalizedPaymentString(&v23->isa);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke_2;
    v24[3] = &unk_1E59CA9F8;
    id v25 = v18;
    [(PKPassPaymentContainerView *)self _applyPayState:v20 withTextOverride:v21 completionHandler:v24];
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[816])
  {
    *((void *)WeakRetained + 101) = 0;
    [WeakRetained _setVASInfoViewHidden:1 animated:1 completion:0];
    uint64_t v3 = [v2 _actionAfterTransaction];
    if (v3 != 1)
    {
      if (v3 != 2)
      {
        uint64_t v4 = 0;
        goto LABEL_8;
      }
      v2[881] = 1;
    }
    [v2 _resetToIdleStateAfterDelay:2.0];
    uint64_t v4 = 1;
LABEL_8:
    unsigned int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F879B8];
    uint64_t v9 = *MEMORY[0x1E4F879C0];
    id v7 = [NSNumber numberWithBool:v4];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 postNotificationName:v6 object:v2 userInfo:v8];
  }
}

uint64_t __95__PKPassPaymentContainerView__applyTerminalTransactionSubstateWithSuccess_reset_errorOverride___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_finishHoldingTerminalTransactionSubstateAfterDelay:(double)a3
{
  transactionResolutionTimer = self->_transactionResolutionTimer;
  if (transactionResolutionTimer)
  {
    dispatch_source_cancel(transactionResolutionTimer);
    uint64_t v6 = self->_transactionResolutionTimer;
    self->_transactionResolutionTimer = 0;
  }
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  id v8 = self->_transactionResolutionTimer;
  self->_transactionResolutionTimer = v7;

  uint64_t v9 = self->_transactionResolutionTimer;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  BOOL v11 = self->_transactionResolutionTimer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKPassPaymentContainerView__finishHoldingTerminalTransactionSubstateAfterDelay___block_invoke;
  v12[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume((dispatch_object_t)self->_transactionResolutionTimer);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __82__PKPassPaymentContainerView__finishHoldingTerminalTransactionSubstateAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[103];
    unsigned int v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      uint64_t v4 = v5[103];
      v5[103] = 0;

      uint64_t v2 = v5;
    }
    if (*((unsigned char *)v2 + 816))
    {
      [v2 _applyTerminalTransactionSubstateWithSuccess:v2[101] == 2 reset:1];
      uint64_t v2 = v5;
    }
  }
}

- (void)_cancelHoldingTerminalTransactionSubstateIfNecessary
{
  if (self->_holdingTerminalSubstate)
  {
    self->_BOOL holdingTerminalSubstate = 0;
    self->_int64_t transactionSubstate = 0;
    transactionResolutionTimer = self->_transactionResolutionTimer;
    if (transactionResolutionTimer)
    {
      dispatch_source_cancel(transactionResolutionTimer);
      uint64_t v4 = self->_transactionResolutionTimer;
      self->_transactionResolutionTimer = 0;
    }
    else
    {
      contextForCurrentTransaction = self->_contextForCurrentTransaction;
      if (contextForCurrentTransaction)
      {
        uint64_t v6 = contextForCurrentTransaction;
        id v7 = self->_contextForCurrentTransaction;
        self->_contextForCurrentTransaction = 0;

        id v8 = [(PKContactlessInterfaceTransactionContext *)v6 paymentPass];
        uint64_t v9 = [(PKContactlessInterfaceTransactionContext *)v6 paymentApplication];
        if (v9 && [v8 isTransitPass])
        {
          dispatch_time_t v10 = [(PKContactlessInterfaceSession *)self->_contactlessInterfaceSession transitAppletStateForPaymentApplication:v9];
          [(PKContactlessInterfaceSession *)self->_contactlessInterfaceSession resetExpressState];
          BOOL v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)float v15 = 0;
            _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Handling early cancel of felica session during transaction...", v15, 2u);
          }

          paymentService = self->_paymentService;
          id v13 = [MEMORY[0x1E4F1C9C8] date];
          float v14 = [v8 uniqueID];
          [(PKPaymentService *)paymentService processTransitTransactionEventWithHistory:v10 transactionDate:v13 forPaymentApplication:v9 withPassUniqueIdentifier:v14 expressTransactionState:0];
        }
      }
    }
  }
}

- (void)_beginTerminalResponseTimeout
{
  [(PKPassPaymentContainerView *)self _cancelTerminalResponseTimeout];
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  transactionTerminalResponseTimer = self->_transactionTerminalResponseTimer;
  self->_transactionTerminalResponseTimer = v3;

  unsigned int v5 = self->_transactionTerminalResponseTimer;
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  id v7 = self->_transactionTerminalResponseTimer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PKPassPaymentContainerView__beginTerminalResponseTimeout__block_invoke;
  v8[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_transactionTerminalResponseTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__PKPassPaymentContainerView__beginTerminalResponseTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    [WeakRetained _cancelTerminalResponseTimeout];
    uint64_t v2 = objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
    if (v2)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v4 = PKLocalizedPaymentString(&cfstr_TerminalRespon.isa);
      unsigned int v5 = PKLocalizedPaymentString(&cfstr_TerminalRespon_0.isa);
      dispatch_time_t v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

      id v7 = (void *)MEMORY[0x1E4FB1410];
      id v8 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      id v9 = [v7 actionWithTitle:v8 style:0 handler:0];
      [v6 addAction:v9];

      AudioServicesPlaySystemSound(0x573u);
      [v2 presentViewController:v6 animated:1 completion:0];
    }
    id WeakRetained = v10;
  }
}

- (void)_cancelTerminalResponseTimeout
{
  transactionTerminalResponseTimer = self->_transactionTerminalResponseTimer;
  if (transactionTerminalResponseTimer)
  {
    dispatch_source_cancel(transactionTerminalResponseTimer);
    uint64_t v4 = self->_transactionTerminalResponseTimer;
    self->_transactionTerminalResponseTimer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &KVOContext)
  {
    [(PKPassPaymentContainerView *)self _updateApplicationsView];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)PKPassPaymentContainerView;
    -[PKPassPaymentContainerView observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_applyPayState:(int64_t)a3
{
}

- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4
{
}

- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4 completionHandler:(id)a5
{
}

- (void)_applyPayState:(int64_t)a3 withTextOverride:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v12 = a4;
  uint64_t v10 = (void (**)(id, void))a6;
  if (a3 != 5) {
    [(PKPassPaymentContainerView *)self _cancelTerminalResponseTimeout];
  }
  uint64_t v11 = 21;
  if (!self->_transitioning) {
    uint64_t v11 = 22;
  }
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v11]) == (Class)a3)
  {
    if (a3) {
      [(PKPassPaymentContainerView *)self _emphasizeStateIfPossible:a3 withTextOverride:v12];
    }
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    [(PKPassPaymentContainerView *)self _transitionToState:a3 withTextOverride:v12 animated:v7 completionHandler:v10];
  }
}

- (void)_showEmphasisButtonForStateIfPossible:(int64_t)a3
{
  p_actionButton = &self->_actionButton;
  if (!self->_actionButton)
  {
    unsigned int v5 = [(PKPassPaymentContainerView *)self _emphasisButtonForState:a3];
    if (v5)
    {
      uint64_t v10 = v5;
      objc_storeStrong((id *)p_actionButton, v5);
      [(PKPassPaymentContainerView *)self addSubview:*p_actionButton];
      double v6 = 0.0;
      if (!PKUIGetMinScreenWidthType()
        && ([(PKPassPaymentContainerView *)self _shouldDisplayPrimaryView]
         || [(PKPassPaymentContainerView *)self _shouldDisplaySecondaryView]
         || [(PKPassPaymentContainerView *)self _isVASInfoViewVisible]))
      {
        [(PKPassFooterContentView *)self _setRequestPileSuppression:1];
        double v6 = 0.5;
      }
      BOOL v7 = [(UIButton *)*p_actionButton layer];
      objc_super v8 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      [v8 setBeginTime:v6];
      objc_msgSend(v8, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", 0.0, 1.0, 1.0);
      id v9 = (id)objc_msgSend(v7, "pkui_addAdditiveAnimation:", v8);

      unsigned int v5 = v10;
    }
  }
}

- (void)_emphasizeStateIfPossible:(int64_t)a3 withTextOverride:(id)a4
{
}

- (void)_emphasizeStateIfPossible:(int64_t)a3 withTextOverride:(id)a4 playSystemSound:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a4;
  if (v5)
  {
    AudioServicesPlaySystemSound(0x573u);
    [(PKPassPaymentContainerView *)self _showEmphasisButtonForStateIfPossible:a3];
LABEL_6:
    [(PKPassPaymentPayStateView *)self->_payStateView emphasizeStateIfPossible:a3 withOverrideText:v11];
    goto LABEL_7;
  }
  [(PKPassPaymentContainerView *)self _showEmphasisButtonForStateIfPossible:a3];
  if ((PKPearlIsAvailable() & 1) == 0) {
    goto LABEL_6;
  }
  if ([(PKPassPaymentPayStateView *)self->_payStateView state] == a3) {
    [(PKPassPaymentPayStateView *)self->_payStateView setState:a3 animated:1 withOverrideText:v11 preserveGlyphState:1 completionHandler:0];
  }
LABEL_7:
  if (self->_currentPayState == 3)
  {
    objc_super v8 = [(UIButton *)self->_actionButton layer];
    id v9 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_shakeAnimation");
    id v10 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v9);
  }
}

- (void)_transitionToState:(int64_t)a3 withTextOverride:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = v11;
  uint64_t v13 = 21;
  if (!self->_transitioning) {
    uint64_t v13 = 22;
  }
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v13]);
  if (v14 == a3)
  {
    if (self->_transitioning || self->_waitingForGlyphView)
    {
      [(PKPassPaymentContainerView *)self _addTransitionCompletionHandler:v11];
    }
    else if (v11)
    {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
  else
  {
    [(PKPassPaymentContainerView *)self _executeTransitionCompletionHandlers:1];
    self->_pendingPayState = a3;
    self->_pendingPayStateAnimated = v7;
    float v15 = (NSString *)[v10 copy];
    pendingPayStateTextOverride = self->_pendingPayStateTextOverride;
    self->_pendingPayStateTextOverride = v15;

    self->_pendingPayStateGlyphStateQueued = 0;
    [(PKPassPaymentContainerView *)self _addTransitionCompletionHandler:v12];
    BOOL v17 = 0;
    if (a3 == 2) {
      BOOL v17 = !self->_requireExpress;
    }
    [(PKPassPaymentContainerView *)self _setUserIntentRequired:v17];
    if (a3 == 8 || !self->_transitioning) {
      [(PKPassPaymentContainerView *)self _commitPendingPayStateAnimated:v7];
    }
    if ((unint64_t)(a3 - 10) > 0xFFFFFFFFFFFFFFFCLL)
    {
      if (self->_pendingAutomaticAuthorization) {
        self->_BOOL pendingAutomaticAuthorization = 0;
      }
    }
    else
    {
      [(PKPassPaymentContainerView *)self _cancelHoldingTerminalTransactionSubstateIfNecessary];
    }
    if (a3 != 12 && a3
      || ([(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:1], a3))
    {
      if (!v14)
      {
        uint64_t v18 = [(UIView *)self pkui_viewControllerFromResponderChain];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v18 setTableModalPresentationEnabled:0 animated:1];
        }
        unint64_t v19 = [(PKPassFooterContentView *)self style] - 1;
        uint64_t v20 = PKUIGetMinScreenWidthType();
        if (v20) {
          BOOL v21 = (unint64_t)PKUIGetMinScreenType() < 4;
        }
        else {
          BOOL v21 = 1;
        }
        uint64_t v26 = [(PKPassFooterContentView *)self pass];
        uint64_t v27 = [v26 style];

        int v28 = v27 == 7 && v21;
        if (!v20) {
          int v28 = 1;
        }
        if (v19 <= 2 && v28) {
          [(PKPassFooterContentView *)self _setRequestPileSuppression:1];
        }
      }
    }
    else
    {
      if ([(PKPassPaymentPayStateView *)self->_payStateView persistentEmulationHint]
        && ![(PKPassPaymentContainerView *)self _authenticationAllowed])
      {
        [(PKPassPaymentPayStateView *)self->_payStateView setPersistentEmulationHint:0];
        id v22 = self->_contactlessInterfaceSession;
        id v23 = v22;
        if (v22)
        {
          authorizationQueue = self->_authorizationQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __93__PKPassPaymentContainerView__transitionToState_withTextOverride_animated_completionHandler___block_invoke;
          block[3] = &unk_1E59CA7D0;
          uint64_t v30 = v22;
          dispatch_async(authorizationQueue, block);
        }
      }
      if (v14)
      {
        id v25 = [(UIView *)self pkui_viewControllerFromResponderChain];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v25 setTableModalPresentationEnabled:1 animated:1];
        }
      }
    }
  }
}

uint64_t __93__PKPassPaymentContainerView__transitionToState_withTextOverride_animated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetPersistentCardEmulation];
}

- (void)_commitPendingPayStateAnimated:(BOOL)a3
{
  int64_t currentPayState = self->_currentPayState;
  self->_int64_t currentPayState = self->_pendingPayState;
  self->_glyphStateDirtdouble y = !self->_pendingPayStateGlyphStateQueued;
  BOOL v6 = a3 || self->_pendingPayStateAnimated;
  [(PKPassPaymentContainerView *)self _transitionViewsFromPayState:currentPayState animated:v6];
  if (self->_pendingPayStateGlyphStateQueued)
  {
    self->_pendingPayStateGlyphStateQueued = 0;
    BOOL v7 = (void *)[(NSMutableArray *)self->_pendingGlyphStateCompletionHandlers copy];
    [(NSMutableArray *)self->_pendingGlyphStateCompletionHandlers removeAllObjects];
    int64_t pendingPayStateGlyphState = self->_pendingPayStateGlyphState;
    BOOL pendingPayStateGlyphStateAnimated = self->_pendingPayStateGlyphStateAnimated;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PKPassPaymentContainerView__commitPendingPayStateAnimated___block_invoke;
    v11[3] = &unk_1E59CB6D8;
    id v12 = v7;
    id v10 = v7;
    [(PKPassPaymentContainerView *)self _setGlyphState:pendingPayStateGlyphState animated:pendingPayStateGlyphStateAnimated withCompletionHandler:v11];
  }
}

void __61__PKPassPaymentContainerView__commitPendingPayStateAnimated___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_transitionViewsFromPayState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(location, self);
  self->_transitioning = 1;
  self->_waitingForGlyphView = 1;
  int64_t currentPayState = (char *)self->_currentPayState;
  uint64_t v7 = [(NSString *)self->_pendingPayStateTextOverride copy];
  pendingPayStateTextOverride = self->_pendingPayStateTextOverride;
  self->_pendingPayStateTextOverride = 0;

  long long v9 = [(PKPassFooterContentView *)self style];
  BOOL v10 = [(PKPassPaymentContainerView *)self _showPhysicalButtonForPayState:currentPayState];
  BOOL v11 = [(PKPassPaymentContainerView *)self _isVASInfoViewVisible];
  BOOL v12 = [(PKPassPaymentContainerView *)self _showGlyphForPayState:currentPayState];
  BOOL v13 = [(PKPassPaymentContainerView *)self _isPrimaryViewVisible];
  uint64_t v43 = (void *)v7;
  BOOL v14 = [(PKPassPaymentContainerView *)self _isSecondaryViewVisible];
  if (self->_applicationsView) {
    BOOL v15 = currentPayState == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = !v15 && !v10;
  if ((unint64_t)(currentPayState - 7) > 1)
  {
    BOOL v39 = 0;
  }
  else
  {
    [(PKPassPaymentPayStateView *)self->_payStateView alpha];
    BOOL v39 = v17 != 0.0;
  }
  BOOL v41 = v13;
  BOOL v42 = v11;
  BOOL v40 = v14;
  if (v9 == (char *)2)
  {
    if (!v10)
    {
      char v37 = PKRunningInRemoteContext();
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  char v18 = (unint64_t)(v9 - 4) < 0xFFFFFFFFFFFFFFFDLL || v10;
  if ((v18 & 1) != 0 || !PKRunningInRemoteContext())
  {
LABEL_25:
    char v37 = 0;
    goto LABEL_26;
  }
  if (PKUIGetMinScreenWidthType()) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = currentPayState == 0;
  }
  char v20 = v19;
  char v37 = v20;
LABEL_26:
  unint64_t v21 = self->_payStateTransitionCounter + 1;
  self->_payStateTransitionCounter = v21;
  id v22 = (void *)v21;
  id v38 = (void *)v21;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  char v82 = 0;
  id v23 = self->_actionButton;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke;
  aBlock[3] = &unk_1E59DD008;
  objc_copyWeak(v77, location);
  double v76 = v81;
  id v24 = v23;
  double v74 = v24;
  v77[1] = currentPayState;
  v77[2] = v9;
  BOOL v78 = v10;
  BOOL v79 = v12;
  BOOL v80 = v4;
  id v25 = v43;
  id v75 = v25;
  v77[3] = v22;
  BOOL v44 = v4;
  uint64_t v26 = _Block_copy(aBlock);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_3;
  v59[3] = &unk_1E59DD030;
  objc_copyWeak(v64, location);
  BOOL v65 = v10;
  BOOL v66 = v39;
  v64[1] = currentPayState;
  id v36 = v25;
  id v60 = v36;
  BOOL v67 = v12;
  BOOL v68 = v16;
  BOOL v69 = v41;
  BOOL v70 = v40;
  BOOL v71 = v42;
  uint64_t v27 = v24;
  char v72 = v37;
  id v35 = v27;
  id v61 = v27;
  CGFloat v62 = self;
  id v28 = v26;
  id v63 = v28;
  uint64_t v29 = _Block_copy(v59);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_4;
  void v50[3] = &unk_1E59DD058;
  objc_copyWeak(v51, location);
  v51[1] = v9;
  v51[2] = currentPayState;
  char v52 = v37;
  BOOL v53 = v42;
  BOOL v54 = v10;
  BOOL v55 = v12;
  BOOL v56 = v41;
  BOOL v57 = v40;
  BOOL v58 = v16;
  uint64_t v30 = _Block_copy(v50);
  if (v44) {
    double v31 = 0.2;
  }
  else {
    double v31 = 0.0;
  }
  BOOL v32 = (void *)MEMORY[0x1E4FB1EB0];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_5;
  v45[3] = &unk_1E59DD0A8;
  objc_copyWeak(v48, location);
  v48[1] = v38;
  id v33 = v28;
  id v46 = v33;
  v48[2] = *(id *)&v31;
  id v34 = v30;
  id v47 = v34;
  BOOL v49 = v44;
  [v32 animateWithDuration:4 delay:v29 options:v45 animations:v31 completion:0.0];

  objc_destroyWeak(v48);
  objc_destroyWeak(v51);

  objc_destroyWeak(v64);
  objc_destroyWeak(v77);

  _Block_object_dispose(v81, 8);
  objc_destroyWeak(location);
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_34;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    goto LABEL_34;
  }
  *(unsigned char *)(v5 + 24) = 1;
  long long v6 = WeakRetained + 84;
  if (WeakRetained[84] == *(id *)(a1 + 32))
  {
    uint64_t v7 = [WeakRetained _buttonForState:*(void *)(a1 + 64)];
    id v8 = v7;
    if (v7) {
      [v7 setAlpha:0.0];
    }
    if (*v6 != v8)
    {
      [*v6 removeFromSuperview];
      [v4 addSubview:v8];
      objc_storeStrong(v4 + 84, v8);
    }
  }
  [v4 setNeedsLayout];
  [v4 layoutIfNeeded];
  [v4 _updateApplicationsView];
  if (*(unsigned char *)(a1 + 88))
  {
    if ([v4[62] persistentEmulationHint])
    {
      long long v9 = @"PAYMENT_SERVICE_MODE_PUSH_BUTTON_TWO_LINE";
    }
    else if ([v4[62] accessPass])
    {
      long long v9 = @"GENERIC_PUSH_BUTTON_TWO_LINE";
    }
    else if (*(void *)(a1 + 72) == 2)
    {
      long long v9 = @"NFC_PASS_PUSH_BUTTON_TWO_LINE";
    }
    else
    {
      long long v9 = @"PAYMENT_PUSH_BUTTON_TWO_LINE";
    }
    BOOL v10 = PKLocalizedPearlString(&v9->isa);
    [v4[70] setInstruction:v10];
  }
  id v11 = v4[62];
  if (*((unsigned char *)v4 + 744)) {
    uint64_t v12 = [v4 _recognizingBiometrics];
  }
  else {
    uint64_t v12 = 0;
  }
  [v11 setRecognizingHint:v12];
  BOOL v13 = [v4[62] layer];
  BOOL v14 = [v13 presentationLayer];

  if (v14)
  {
    if ([v14 isHidden])
    {

      goto LABEL_26;
    }
    [v14 opacity];
    float v16 = v15;

    if (v16 <= 0.0)
    {
LABEL_26:
      unsigned int v17 = *(unsigned __int8 *)(a1 + 89);
      if (*(unsigned char *)(a1 + 89)) {
        unsigned int v17 = (unint64_t)(*(void *)(a1 + 64) - 7) < 3;
      }
      goto LABEL_28;
    }
  }
  unsigned int v17 = 1;
LABEL_28:
  id v18 = v4[62];
  uint64_t v19 = *(void *)(a1 + 64);
  if (*(unsigned char *)(a1 + 90)) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = *(void *)(a1 + 40);
  BOOL v22 = *((unsigned char *)v4 + 800) == 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_2;
  v23[3] = &unk_1E59DCFE0;
  objc_copyWeak(v24, v2);
  v24[1] = *(id *)(a1 + 80);
  char v25 = *(unsigned char *)(a1 + 89);
  [v18 setState:v19 animated:v20 withOverrideText:v21 preserveGlyphState:v22 completionHandler:v23];
  if (!*(unsigned char *)(a1 + 89)) {
    *((unsigned char *)v4 + 803) = 0;
  }
  objc_destroyWeak(v24);
LABEL_34:
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40) == *((void *)WeakRetained + 86))
    {
      if (*(unsigned char *)(a1 + 48))
      {
        WeakRetained[803] = 0;
        if (!WeakRetained[776])
        {
          uint64_t v3 = WeakRetained;
          [WeakRetained _executeTransitionCompletionHandlers:0];
          id WeakRetained = v3;
        }
      }
    }
  }
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    if (!*(unsigned char *)(a1 + 80))
    {
      [WeakRetained[70] setAlpha:0.0];
      [v8[70] setAnimating:0];
    }
    if (!*(unsigned char *)(a1 + 81)
      && [v8[62] labelWillChangeForState:*(void *)(a1 + 72) withOverrideText:*(void *)(a1 + 32)])
    {
      [v8[62] setLabelAlpha:0.0];
    }
    if (!*(unsigned char *)(a1 + 82)) {
      [v8[62] setAlpha:0.0];
    }
    if (!*(unsigned char *)(a1 + 83)) {
      [v8[82] setAlpha:0.0];
    }
    if (!*(unsigned char *)(a1 + 84)) {
      [v8[77] setAlpha:0.0];
    }
    if (!*(unsigned char *)(a1 + 85)) {
      [v8[78] setAlpha:0.0];
    }
    if (*(unsigned char *)(a1 + 86) || ([v8[83] alpha], v3 <= 0.0))
    {
      int v4 = 0;
    }
    else
    {
      [v8[83] setAlpha:0.0];
      int v4 = 1;
    }
    [*(id *)(a1 + 40) setAlpha:0.0];
    if (*(unsigned char *)(a1 + 87) || ([*(id *)(a1 + 48) infoButtonAlpha], v5 <= 0.0))
    {
      id WeakRetained = v8;
      if (!*(unsigned char *)(a1 + 81))
      {
        if (!v4) {
          goto LABEL_28;
        }
        goto LABEL_26;
      }
    }
    else
    {
      long long v6 = [v8 appIconView];
      [v6 setAlpha:0.0];

      [v8 setInfoButtonAlpha:0.0];
      uint64_t v7 = [v8 bottomRule];
      [v7 setAlpha:0.0];

      if (!*(unsigned char *)(a1 + 81))
      {
LABEL_26:
        [v8 setNeedsLayout];
        [v8 layoutIfNeeded];
        goto LABEL_27;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_27:
    id WeakRetained = v8;
  }
LABEL_28:
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v10 = WeakRetained;
    id v3 = WeakRetained[84];
    if ((unint64_t)(*(void *)(a1 + 40) - 1) > 2)
    {
      if (v3)
      {
        [v3 setAlpha:1.0];
        if (*(void *)(a1 + 48) != 3)
        {
          int v4 = [v10 bottomRule];
          [v4 setAlpha:1.0];
        }
      }
    }
    else if (v3)
    {
      [v3 setAlpha:1.0];
    }
    if (*(unsigned char *)(a1 + 56) && ([v10 infoButtonAlpha], v5 <= 0.0))
    {
      uint64_t v7 = [v10 appIconView];
      [v7 setAlpha:1.0];

      [v10 infoButtonAlpha];
      id v8 = [v10 bottomRule];
      [v8 setAlpha:1.0];

      int v6 = 1;
    }
    else
    {
      int v6 = 0;
    }
    if (*(unsigned char *)(a1 + 57))
    {
      [v10[83] alpha];
      if (v9 <= 0.0)
      {
        [v10[83] setAlpha:1.0];
        int v6 = 1;
      }
    }
    if (*(unsigned char *)(a1 + 58))
    {
      [v10[70] setAlpha:1.0];
      [v10[70] setAnimating:1];
    }
    [v10[62] setLabelAlpha:1.0];
    if (*(unsigned char *)(a1 + 59)) {
      [v10[62] setAlpha:1.0];
    }
    if (*(unsigned char *)(a1 + 60)) {
      [v10[77] setAlpha:1.0];
    }
    id WeakRetained = v10;
    if (*(unsigned char *)(a1 + 61))
    {
      [v10[78] setAlpha:1.0];
      id WeakRetained = v10;
    }
    if (*(unsigned char *)(a1 + 62))
    {
      [v10[82] setAlpha:1.0];
      id WeakRetained = v10;
    }
    if (v6)
    {
      [v10 setNeedsLayout];
      [v10 layoutIfNeeded];
      id WeakRetained = v10;
    }
  }
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_6;
  v2[3] = &unk_1E59DD080;
  objc_copyWeak(v5, (id *)(a1 + 48));
  v5[1] = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 32);
  id v5[2] = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 72);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(v5);
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 56) == *((void *)WeakRetained + 86))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    double v5 = (void *)MEMORY[0x1E4FB1EB0];
    double v6 = *(double *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_7;
    v8[3] = &unk_1E59DCFE0;
    objc_copyWeak(v9, v2);
    v9[1] = *(id *)(a1 + 56);
    char v10 = *(unsigned char *)(a1 + 72);
    [v5 animateWithDuration:4 delay:v7 options:v8 animations:v6 completion:0.0];
    objc_destroyWeak(v9);
  }
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_7(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_8;
  block[3] = &unk_1E59D9850;
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v3);
}

void __68__PKPassPaymentContainerView__transitionViewsFromPayState_animated___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(void *)(a1 + 40) == WeakRetained[86])
  {
    id v3 = WeakRetained;
    [WeakRetained _endTransition:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)_endTransition:(BOOL)a3
{
  self->_transitioning = 0;
  if (self->_currentPayState == self->_pendingPayState)
  {
    if (!self->_waitingForGlyphView) {
      [(PKPassPaymentContainerView *)self _executeTransitionCompletionHandlers:0];
    }
  }
  else
  {
    [(PKPassPaymentContainerView *)self _commitPendingPayStateAnimated:a3];
  }
}

- (void)_addTransitionCompletionHandler:(id)a3
{
  if (a3)
  {
    transitionCompletionHandlers = self->_transitionCompletionHandlers;
    id v5 = (id)[a3 copy];
    char v4 = _Block_copy(v5);
    [(NSMutableArray *)transitionCompletionHandlers addObject:v4];
  }
}

- (void)_executeTransitionCompletionHandlers:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_transitionCompletionHandlers count])
  {
    char v4 = (void *)[(NSMutableArray *)self->_transitionCompletionHandlers copy];
    [(NSMutableArray *)self->_transitionCompletionHandlers removeAllObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v11 = a5;
  if (self->_currentPayState == self->_pendingPayState || !self->_transitioning)
  {
    self->_glyphStateDirtdouble y = 0;
    uint64_t v8 = [(PKPassPaymentPayStateView *)self->_payStateView glyph];
    [v8 setState:a3 animated:v5 completionHandler:v11];
LABEL_12:

    goto LABEL_13;
  }
  if (self->_pendingPayStateGlyphStateQueued && self->_pendingPayStateGlyphState == a3)
  {
    self->_pendingPayStateGlyphStateQueued = 1;
    self->_int64_t pendingPayStateGlyphState = a3;
    if (!self->_pendingPayStateGlyphStateAnimated) {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    [(PKPassPaymentContainerView *)self _executePendingGlyphStateCompletionHandlers:1];
    self->_pendingPayStateGlyphStateQueued = 1;
    self->_int64_t pendingPayStateGlyphState = a3;
  }
  self->_BOOL pendingPayStateGlyphStateAnimated = v5;
  if (v11)
  {
    pendingGlyphStateCompletionHandlers = self->_pendingGlyphStateCompletionHandlers;
    uint64_t v8 = (void *)[v11 copy];
    long long v10 = _Block_copy(v8);
    [(NSMutableArray *)pendingGlyphStateCompletionHandlers addObject:v10];

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_executePendingGlyphStateCompletionHandlers:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingGlyphStateCompletionHandlers count])
  {
    char v4 = (void *)[(NSMutableArray *)self->_pendingGlyphStateCompletionHandlers copy];
    [(NSMutableArray *)self->_pendingGlyphStateCompletionHandlers removeAllObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_updateAuthenticatorState
{
  self->_authenticatorState = [MEMORY[0x1E4F88108] currentStateForPolicy:0];
  uint64_t v3 = [MEMORY[0x1E4F88108] userIntentStyle];

  [(PKPassPaymentContainerView *)self _setUserIntentStyle:v3];
}

- (BOOL)_canAuthenticateWithBiometrics
{
  return self->_authenticatorState & ((self->_authenticatorState & 6) != 0);
}

- (BOOL)_canAuthenticateWithPasscode
{
  return (~LODWORD(self->_authenticatorState) & 9) == 0;
}

- (void)_setUserIntentRequired:(BOOL)a3
{
  if (self->_userIntentRequired != a3)
  {
    self->_userIntentRequired = a3;
    [(PKPassPaymentContainerView *)self _updatePhysicalButtonRequirement];
  }
}

- (void)_setUserIntentStyle:(int64_t)a3
{
  if (self->_userIntentStyle != a3)
  {
    self->_userIntentStyle = a3;
    -[PKPassPaymentPayStateView setUserIntentStyle:](self->_payStateView, "setUserIntentStyle:");
    [(PKPassPaymentContainerView *)self _updatePhysicalButtonRequirement];
  }
}

- (void)_updatePhysicalButtonRequirement
{
  BOOL v2 = self->_userIntentStyle == 1 && self->_userIntentRequired;
  [(PKPassFooterContentView *)self _setPhysicalButtonRequired:v2];
}

- (id)_buttonForState:(int64_t)a3
{
  if (PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled())
  {
    id v5 = 0;
    goto LABEL_40;
  }
  unint64_t v6 = [(PKPassFooterContentView *)self style] - 1;
  uint64_t v7 = [(PKPassFooterContentView *)self bottomRule];
  uint64_t v8 = v7;
  if (v6 > 2)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = [v7 superview];
    if (v9)
    {
      [v8 alpha];
      BOOL v11 = v10 > 0.0;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  objc_initWeak(&location, self);
  switch(a3)
  {
    case 10:
      float v16 = (void *)MEMORY[0x1E4FB13F0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __46__PKPassPaymentContainerView__buttonForState___block_invoke_2;
      v28[3] = &unk_1E59CBEE0;
      long long v13 = &v29;
      objc_copyWeak(&v29, &location);
      BOOL v14 = [v16 actionWithHandler:v28];
      uint64_t v15 = PKLocalizedPaymentString(&cfstr_GenericNoPassc.isa);
      goto LABEL_15;
    case 9:
      unsigned int v17 = 0;
      BOOL v14 = 0;
      id v18 = 0;
      switch(self->_failureAction)
      {
        case 0:
          goto LABEL_39;
        case 1:
          BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
          uint64_t v19 = PKLocalizedIdentityString(&cfstr_PresentmentTur.isa);
          goto LABEL_31;
        case 2:
          BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root="];
          if (self->_failureReason == 4) {
            PKLocalizedCredentialString(&cfstr_TurnOffAirplan_0.isa);
          }
          else {
          uint64_t v19 = PKLocalizedIdentityString(&cfstr_PresentmentGoT.isa);
          }
          goto LABEL_31;
        case 3:
          int64_t failureReason = self->_failureReason;
          if (failureReason == 3)
          {
            BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT208733"];
            uint64_t v19 = PKLocalizedCredentialString(&cfstr_LearnMoreButto.isa);
          }
          else
          {
            if (failureReason != 2)
            {
              unsigned int v17 = 0;
              BOOL v14 = 0;
LABEL_32:
              BOOL v22 = (void *)MEMORY[0x1E4FB13F0];
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __46__PKPassPaymentContainerView__buttonForState___block_invoke_3;
              id v25[3] = &unk_1E59CE6B8;
              objc_copyWeak(&v27, &location);
              id v23 = v14;
              id v26 = v23;
              BOOL v14 = [v22 actionWithHandler:v25];

              objc_destroyWeak(&v27);
              goto LABEL_33;
            }
            BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT212274"];
            uint64_t v19 = PKLocalizedCredentialString(&cfstr_LearnMoreButto.isa);
          }
LABEL_31:
          unsigned int v17 = (void *)v19;
          goto LABEL_32;
        case 4:
          unsigned int v17 = PKLocalizedIdentityString(&cfstr_PresentmentTur_0.isa);
          if (PKPearlIsAvailable()) {
            uint64_t v21 = @"prefs:root=Pearl";
          }
          else {
            uint64_t v21 = @"prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE";
          }
          BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
          goto LABEL_32;
        default:
          goto LABEL_32;
      }
    case 3:
      long long v12 = (void *)MEMORY[0x1E4FB13F0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      id v30[2] = __46__PKPassPaymentContainerView__buttonForState___block_invoke;
      v30[3] = &unk_1E59CBEE0;
      long long v13 = &v31;
      objc_copyWeak(&v31, &location);
      BOOL v14 = [v12 actionWithHandler:v30];
      uint64_t v15 = [(PKPassPaymentContainerView *)self _passcodeButtonTitle];
LABEL_15:
      unsigned int v17 = (void *)v15;
      objc_destroyWeak(v13);
LABEL_33:
      id v18 = 0;
      if (v14 && v17)
      {
        if (v11) {
          [(PKPassFooterContentView *)self _buttonWithTitle:v17 action:v14];
        }
        else {
        id v18 = [(PKPassPaymentContainerView *)self _filledButtonWithTitle:v17 action:v14];
        }
      }
      goto LABEL_39;
  }
  unsigned int v17 = 0;
  BOOL v14 = 0;
  id v18 = 0;
LABEL_39:
  [v18 setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
  id v5 = v18;

  objc_destroyWeak(&location);
LABEL_40:

  return v5;
}

void __46__PKPassPaymentContainerView__buttonForState___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v4 = [v3 sender];

  [WeakRetained _passcodeFallbackButtonPressed:v4];
}

void __46__PKPassPaymentContainerView__buttonForState___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v4 = [v3 sender];

  [WeakRetained _addPasscodeButtonPressed:v4];
}

void __46__PKPassPaymentContainerView__buttonForState___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _openURL:*(void *)(a1 + 32)];
}

- (id)_emphasisButtonForState:(int64_t)a3
{
  if (a3 == 1)
  {
    char v4 = [(PKPassPaymentContainerView *)self _passcodeButtonTitle];
    int64_t v5 = [(PKPassFooterContentView *)self style];
    unint64_t v6 = [(PKPassFooterContentView *)self bottomRule];
    objc_initWeak(&location, self);
    uint64_t v7 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    unsigned int v17 = __54__PKPassPaymentContainerView__emphasisButtonForState___block_invoke;
    id v18 = &unk_1E59CBEE0;
    objc_copyWeak(&v19, &location);
    uint64_t v8 = [v7 actionWithHandler:&v15];
    if ((unint64_t)(v5 - 1) <= 2
      && (objc_msgSend(v6, "superview", v15, v16, v17, v18), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
      && ([v6 alpha], double v11 = v10, v9, v11 > 0.0))
    {
      uint64_t v12 = [(PKPassFooterContentView *)self _buttonWithTitle:v4 action:v8];
    }
    else
    {
      uint64_t v12 = -[PKPassPaymentContainerView _filledButtonWithTitle:action:](self, "_filledButtonWithTitle:action:", v4, v8, v15, v16, v17, v18);
    }
    long long v13 = (void *)v12;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    char v4 = 0;
    long long v13 = 0;
  }

  return v13;
}

void __54__PKPassPaymentContainerView__emphasisButtonForState___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v4 = [v3 sender];

  [WeakRetained _passcodeFallbackButtonPressed:v4];
}

- (id)_passcodeButtonTitle
{
  [(PKPassFooterContentView *)self style];
  id v3 = [(PKPassFooterContentView *)self paymentPass];
  int v4 = [v3 isAccessPass];

  if (v4) {
    int64_t v5 = @"GENERIC_PASSCODE";
  }
  else {
    int64_t v5 = @"PAYMENT_PASSCODE";
  }
  unint64_t v6 = PKLocalizedPaymentString(&v5->isa);

  return v6;
}

- (id)_filledButtonWithTitle:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  PKFloatRoundToPixel();
  double v8 = v7;
  uint64_t v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], (NSString *)*MEMORY[0x1E4FB2798]);
  [v9 lineHeight];
  PKFloatRoundToPixel();
  uint64_t v14 = v10;
  long long v15 = xmmword_1A040E960;
  int64x2_t v16 = vdupq_n_s64(2uLL);
  double v11 = [[PKContinuousButton alloc] initWithConfiguration:&v14];
  -[PKContinuousButton setContentEdgeInsets:](v11, "setContentEdgeInsets:", v8, 25.0, 16.0 - v8, 25.0);
  uint64_t v12 = [(PKContinuousButton *)v11 titleLabel];
  [v12 setFont:v9];
  [v12 setMinimumScaleFactor:0.5];
  [v12 setTextAlignment:1];
  [v12 setLineBreakMode:4];
  [(PKContinuousButton *)v11 setTitle:v6 forState:0];

  -[PKContinuousButton _setTouchInsets:](v11, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  [(PKContinuousButton *)v11 setExclusiveTouch:1];
  [(PKContinuousButton *)v11 sizeToFit];
  [(PKContinuousButton *)v11 addAction:v5 forControlEvents:64];

  return v11;
}

- (unint64_t)_actionAfterTransaction
{
  BOOL v2 = self;
  int64_t v3 = [(PKPassFooterContentView *)self style];
  int v4 = PKRunningInRemoteContext();
  id v5 = [(PKPassFooterContentView *)v2 delegate];
  LODWORD(v2) = [v5 isPassFooterContentViewInGroup:v2];

  unint64_t v6 = 2;
  if (v2) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 0;
  }
  if (v4) {
    unint64_t v6 = v7;
  }
  if (v3 == 2) {
    return v6;
  }
  else {
    return v7;
  }
}

- (BOOL)_shouldDisplayPrimaryView
{
  int64_t v3 = [(PKPassFooterContentView *)self style];
  if ((unint64_t)(v3 - 1) < 3)
  {
    if (v3 != 3) {
      return 0;
    }
    int v4 = [(PKPaymentTransaction *)self->_transactionForDisplayedBarcode awards];
    BOOL v5 = [v4 count] == 0;
    goto LABEL_8;
  }
  int v4 = [(PKPassFooterContentView *)self paymentPass];
  if (![v4 isStoredValuePass]
    || ([(PKTransitBalanceModel *)self->_transitBalanceModel hasBalanceContent] & 1) == 0)
  {
    BOOL v5 = self->_groupTile == 0;
LABEL_8:
    BOOL v6 = !v5;
    goto LABEL_11;
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)_canDisplaySecondaryView
{
  if ((unint64_t)([(PKPassFooterContentView *)self style] - 1) < 3) {
    return 0;
  }
  [(PKPassValueAddedServiceInfoView *)self->_valueAddedServiceInfoView alpha];
  return v4 <= 0.0;
}

- (BOOL)_shouldDisplaySecondaryView
{
  BOOL v3 = [(PKPassPaymentContainerView *)self _canDisplaySecondaryView];
  if (v3)
  {
    double v4 = [(PKPassFooterContentView *)self paymentPass];
    if ([v4 isTransitPass])
    {
      char v5 = [(PKTransitBalanceModel *)self->_transitBalanceModel hasCommutePlanContent];

      if (v5)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    else
    {
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_showPhysicalButtonForPayState:(int64_t)a3
{
  return a3 == 2 && self->_userIntentStyle == 1;
}

- (BOOL)_showGlyphForPayState:(int64_t)a3
{
  BOOL result = 0;
  switch(a3)
  {
    case 1:
      BOOL result = PKSystemApertureIsAvailable() ^ 1;
      break;
    case 2:
      BOOL result = self->_userIntentStyle != 1;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
      BOOL result = 1;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_isVASInfoViewVisible
{
  if (self->_valueAddedServiceInfoView && !self->_VASInfoViewHidden) {
    return ![(PKPassPaymentContainerView *)self _showPhysicalButtonForPayState:self->_currentPayState];
  }
  else {
    return 0;
  }
}

- (BOOL)_isPrimaryViewVisible
{
  if (self->_currentPayState)
  {
    BOOL v3 = [(PKPassPaymentContainerView *)self _shouldDisplayPrimaryView];
    if (v3) {
      LOBYTE(v3) = ![(PKPassPaymentContainerView *)self _showPhysicalButtonForPayState:self->_currentPayState];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isSecondaryViewVisible
{
  if (!self->_currentPayState)
  {
LABEL_4:
    LOBYTE(v3) = 0;
    return v3;
  }
  BOOL v3 = [(PKPassPaymentContainerView *)self _shouldDisplaySecondaryView];
  if (v3)
  {
    if (![(PKPassPaymentContainerView *)self _showPhysicalButtonForPayState:self->_currentPayState])
    {
      LOBYTE(v3) = ![(PKPassPaymentContainerView *)self _isVASInfoViewVisible];
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (BOOL)_authenticationAllowed
{
  if ([(PKPassFooterContentView *)self isInvalidated] || !self->_isVisible) {
    goto LABEL_5;
  }
  BOOL v3 = [(PKPassPaymentContainerView *)self _isForegroundActive];
  if (v3)
  {
    if (self->_failureReason)
    {
LABEL_5:
      LOBYTE(v3) = 0;
      return v3;
    }
    LOBYTE(v3) = ![(PKPassPaymentContainerView *)self passOnlySupportsPassiveEntry];
  }
  return v3;
}

- (BOOL)passOnlySupportsPassiveEntry
{
  BOOL v2 = [(PKPassFooterContentView *)self paymentPass];
  BOOL v3 = [v2 supportedRadioTechnologies] == 2;

  return v3;
}

- (void)_presentPassWithUniqueIdentifier:(id)a3 additionalPassUniqueIdentifiers:(id)a4
{
}

- (void)_presentPassWithUniqueIdentifier:(id)a3 additionalPassUniqueIdentifiers:(id)a4 payState:(int64_t)a5
{
  id v11 = a3;
  unint64_t v7 = [(UIView *)self pkui_viewControllerFromResponderChain];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = [NSNumber numberWithInteger:a5];
    [v8 setObject:v9 forKey:@"PKPassPaymentContainerViewPresentationPayStateKey"];

    uint64_t v10 = +[PKPassPresentationContext contextWithWasAutomaticallySelected:1 additionalPassUniqueIdentifiers:0 userInfo:v8];
    [v10 setFieldDetect:1];
    [v7 presentPassWithUniqueID:v11 context:v10 animated:1 completionHandler:0];
  }
}

- (BOOL)_shouldShowTerminalIsNotRequestingPaymentError
{
  if ([(PKPassFooterContentView *)self style] || self->_currentPayState != 5) {
    return 0;
  }
  else {
    return ![(PKPassPaymentContainerView *)self _hasValueAddedServicePasses];
  }
}

- (void)_showTerminalIsNotRequestingPaymentError
{
  int64_t currentPayState = self->_currentPayState;
  double v4 = PKLocalizedString(&cfstr_VasPassErrorTe.isa);
  [(PKPassPaymentContainerView *)self _emphasizeStateIfPossible:currentPayState withTextOverride:v4 playSystemSound:1];

  uint64_t v5 = [(PKAuthenticator *)self->_authenticator authenticationIdentifier];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPassPaymentContainerView__showTerminalIsNotRequestingPaymentError__block_invoke;
  v7[3] = &unk_1E59CB460;
  void v7[4] = self;
  void v7[5] = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
}

void __70__PKPassPaymentContainerView__showTerminalIsNotRequestingPaymentError__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 488) authenticationIdentifier] == *(void *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 728) == 5)
    {
      BOOL v3 = *(void **)(v2 + 496);
      PKLocalizedPaymentString(&cfstr_GenericInstruc.isa);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [v3 setState:5 animated:1 withOverrideText:v4 preserveGlyphState:0 completionHandler:0];
    }
  }
}

- (void)_showTerminalIsRequestingPaymentError
{
  int64_t currentPayState = self->_currentPayState;
  id v4 = PKLocalizedString(&cfstr_VasPassErrorTe_0.isa);
  [(PKPassPaymentContainerView *)self _emphasizeStateIfPossible:currentPayState withTextOverride:v4 playSystemSound:1];

  uint64_t v5 = [(PKAuthenticator *)self->_authenticator authenticationIdentifier];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKPassPaymentContainerView__showTerminalIsRequestingPaymentError__block_invoke;
  v7[3] = &unk_1E59CB460;
  void v7[4] = self;
  void v7[5] = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
}

uint64_t __67__PKPassPaymentContainerView__showTerminalIsRequestingPaymentError__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 488) authenticationIdentifier];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 728) == 5)
    {
      id v4 = *(void **)(v3 + 496);
      return [v4 setState:5 animated:1 withOverrideText:0 preserveGlyphState:0 completionHandler:0];
    }
  }
  return result;
}

- (void)_setVASInfoViewHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  if (self->_VASInfoViewHidden == v6)
  {
    [(PKPassPaymentContainerView *)self _updateVASInfoViewSuppressedTransactionIfNecessary];
    goto LABEL_5;
  }
  self->_VASInfoViewHidden = v6;
  [(PKPassPaymentContainerView *)self _updateVASInfoViewSuppressedTransactionIfNecessary];
  if (!self->_valueAddedServiceInfoView
    || (double v9 = (double)[(PKPassPaymentContainerView *)self _isVASInfoViewVisible],
        [(PKPassValueAddedServiceInfoView *)self->_valueAddedServiceInfoView alpha],
        v10 == v9))
  {
LABEL_5:
    if (v8) {
      v8[2](v8, 1);
    }
    goto LABEL_7;
  }
  if (v5) {
    [(PKPassPaymentContainerView *)self layoutIfNeeded];
  }
  [(PKPassPaymentContainerView *)self setNeedsLayout];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke;
  aBlock[3] = &unk_1E59CB460;
  void aBlock[4] = self;
  *(double *)&void aBlock[5] = v9;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v12 = v11;
  if (v5)
  {
    long long v13 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke_2;
    v14[3] = &unk_1E59CAA98;
    long long v15 = v11;
    [v13 animateWithDuration:4 delay:v14 options:v8 animations:0.2 completion:0.0];
  }
  else
  {
    v11[2](v11);
    if (v8) {
      v8[2](v8, 1);
    }
  }

LABEL_7:
}

uint64_t __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 664) setAlpha:*(double *)(a1 + 40)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 616), "setAlpha:", (double)objc_msgSend(*(id *)(a1 + 32), "_isPrimaryViewVisible"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "setAlpha:", (double)objc_msgSend(*(id *)(a1 + 32), "_isSecondaryViewVisible"));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __72__PKPassPaymentContainerView__setVASInfoViewHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateVASInfoViewSuppressedTransactionIfNecessary
{
  if (self->_VASInfoViewHidden && self->_VASInfoViewSuppressedTransactionUpdate)
  {
    self->_VASInfoViewSuppressedTransactionUpdate = 0;
    [(PKPassPaymentContainerView *)self _applyLatestContentToViews];
  }
}

- (void)_setValueAddedServicePasses:(id)a3
{
  id v4 = a3;
  BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  valueAddedPasses = self->_valueAddedPasses;
  self->_valueAddedPasses = v5;

  if (v4)
  {
    unint64_t v7 = [(PKPassFooterContentView *)self paymentPass];
    BOOL v8 = v7 != 0;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v9[2] = __58__PKPassPaymentContainerView__setValueAddedServicePasses___block_invoke;
    v9[3] = &unk_1E59DD0D0;
    BOOL v10 = v8;
    void v9[4] = self;
    [v4 enumerateObjectsUsingBlock:v9];
  }
}

void __58__PKPassPaymentContainerView__setValueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(unsigned char *)(a1 + 40) || (char v4 = [v3 hasStoredValue], v5 = v6, (v4 & 1) == 0))
  {
    [*(id *)(*(void *)(a1 + 32) + 904) addObject:v6];
    BOOL v5 = v6;
  }
}

- (BOOL)_hasValueAddedServicePasses
{
  return [(NSMutableArray *)self->_valueAddedPasses count] != 0;
}

- (void)_processPaymentTransactionForContext:(id)a3 withCompletion:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  unint64_t v7 = [v15 transaction];
  if (v7)
  {
    BOOL v8 = [(PKPassFooterContentView *)self paymentPass];
    double v9 = [v8 uniqueID];

    BOOL v10 = [v15 paymentPass];
    id v11 = [v10 uniqueID];

    uint64_t v12 = 0;
    if (v9 && v11)
    {
      if ([v9 isEqualToString:v11])
      {
        [v7 setMerchant:self->_merchantForCurrentTransaction];
        paymentService = self->_paymentService;
        uint64_t v14 = [v15 paymentApplication];
        [(PKPaymentService *)paymentService insertOrUpdatePaymentTransaction:v7 forPassUniqueIdentifier:v9 paymentApplication:v14 completion:0];

        uint64_t v12 = 1;
      }
      else
      {
        uint64_t v12 = 0;
      }
    }

    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v6) {
LABEL_10:
    }
      v6[2](v6, v12);
  }
}

- (void)_insertPaymentTransactionForActiveBarcode
{
  id v10 = [MEMORY[0x1E4F84CF8] paymentTransactionWithSource:1];
  [v10 setOriginatedByDevice:1];
  id v3 = PKTransactionPaymentHashForBarcodeIdentifier();
  [v10 setPaymentHash:v3];

  [v10 addUpdateReasons:0x20000];
  char v4 = [MEMORY[0x1E4F1C9C8] date];
  [v10 setTransactionDate:v4];

  paymentService = self->_paymentService;
  id v6 = [(PKPassFooterContentView *)self paymentPass];
  unint64_t v7 = [v6 uniqueID];
  BOOL v8 = [(PKPassFooterContentView *)self paymentPass];
  double v9 = [v8 devicePrimaryBarcodePaymentApplication];
  [(PKPaymentService *)paymentService insertOrUpdatePaymentTransaction:v10 forPassUniqueIdentifier:v7 paymentApplication:v9 completion:0];
}

- (void)_processValueAddedServiceTransactionsForContext:(id)a3 withCompletion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = (void (**)(id, void, id))a4;
  char v25 = v5;
  id v6 = [v5 valueAddedServicePasses];
  id v23 = [v5 valueAddedServiceTransactions];
  uint64_t v21 = [v5 transaction];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "passTypeIdentifier", v21);
        uint64_t v14 = [v13 dataUsingEncoding:4];
        id v15 = [v14 SHA256Hash];

        int64x2_t v16 = [v7 objectForKey:v15];
        if (!v16)
        {
          int64x2_t v16 = [MEMORY[0x1E4F1CA48] array];
          [v7 setObject:v16 forKey:v15];
        }
        [v16 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v9);
  }

  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  unsigned int v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__PKPassPaymentContainerView__processValueAddedServiceTransactionsForContext_withCompletion___block_invoke;
  v26[3] = &unk_1E59DD0F8;
  id v31 = &v32;
  id v18 = v7;
  id v27 = v18;
  id v19 = v17;
  id v28 = v19;
  id v29 = self;
  id v20 = v21;
  id v30 = v20;
  [v23 enumerateObjectsUsingBlock:v26];
  if (v24) {
    v24[2](v24, *((unsigned __int8 *)v33 + 24), v19);
  }

  _Block_object_dispose(&v32, 8);
}

void __93__PKPassPaymentContainerView__processValueAddedServiceTransactionsForContext_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 didSucceed])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v7 = *(void **)(a1 + 32);
    id v8 = [v6 merchant];
    uint64_t v9 = [v8 identifier];
    uint64_t v10 = [v7 objectForKey:v9];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          int64x2_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v16, (void)v28);
          unsigned int v17 = *(void **)(*(void *)(a1 + 48) + 480);
          id v18 = [v16 uniqueID];
          [v17 insertOrUpdateValueAddedServiceTransaction:v6 forPassUniqueIdentifier:v18 paymentTransaction:*(void *)(a1 + 56) completion:0];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }
  }
  else if ([v6 error] == 3)
  {
    id v19 = *(void **)(a1 + 32);
    id v20 = [v6 merchant];
    uint64_t v21 = [v20 identifier];
    BOOL v22 = [v19 objectForKey:v21];

    [*(id *)(a1 + 48) _setValueAddedServicePasses:v22];
    uint64_t v23 = [v6 terminalMode];
    if (![*(id *)(a1 + 48) style] && (v23 == 4 || v23 == 2))
    {
      id v26 = [v22 firstObject];
      id v27 = [v26 uniqueID];

      [*(id *)(a1 + 48) _presentPassWithUniqueIdentifier:v27 additionalPassUniqueIdentifiers:0 payState:5];
    }
    else
    {
      [*(id *)(a1 + 48) _resetCardEmulationWithCompletion:0];
      *a4 = 1;
    }
  }
  else if ([v6 error] == 1)
  {
    id v24 = [v6 merchantURL];
    uint64_t v25 = [v24 length];

    if (v25) {
      [*(id *)(*(void *)(a1 + 48) + 480) insertOrUpdateValueAddedServiceTransaction:v6 forPassUniqueIdentifier:0 paymentTransaction:0 completion:0];
    }
  }
}

- (void)_retrieveDecryptedBarcodeWithAuthorization:(id)a3 shouldFetchBarcodeIfNecessary:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9 && [(PKPassPaymentContainerView *)self _authenticationAllowed])
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke;
    v10[3] = &unk_1E59DD198;
    objc_copyWeak(&v13, &location);
    id v12 = v9;
    id v11 = v8;
    BOOL v14 = a4;
    [(PKPassPaymentContainerView *)self _beginSessionExchange:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained && ([WeakRetained _authenticationAllowed] & 1) != 0)
  {
    if (v6)
    {
      [v8 _endSessionExchange];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v11 = [v8 paymentPass];
      id v12 = [v11 uniqueID];

      id v13 = (void *)v8[60];
      uint64_t v14 = *(void *)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_2;
      id v16[3] = &unk_1E59DD170;
      objc_copyWeak(&v20, (id *)(a1 + 48));
      id v19 = *(id *)(a1 + 40);
      char v21 = *(unsigned char *)(a1 + 56);
      id v15 = v12;
      id v17 = v15;
      id v18 = *(id *)(a1 + 32);
      [v13 retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:v15 authorization:v14 sessionExchangeToken:v5 withCompletion:v16];

      objc_destroyWeak(&v20);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_3;
  v14[3] = &unk_1E59DD148;
  objc_copyWeak(&v21, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 48);
  id v15 = v7;
  id v16 = v8;
  id v20 = v10;
  id v17 = v9;
  char v22 = *(unsigned char *)(a1 + 64);
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v14);

  objc_destroyWeak(&v21);
}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  char v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_9;
  }
  [WeakRetained _endSessionExchange];
  id v5 = [*(id *)(a1 + 48) domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F870D8]])
  {

LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_10;
  }
  uint64_t v6 = [*(id *)(a1 + 48) code];

  if (v6 != 3 || !*(unsigned char *)(a1 + 88)) {
    goto LABEL_9;
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "No valid barcode found, trying to fetch barcodes", buf, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v9[2] = __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_407;
  v9[3] = &unk_1E59DD120;
  id v11 = *(id *)(a1 + 72);
  objc_copyWeak(&v12, v2);
  id v10 = *(id *)(a1 + 64);
  [v4 _fetchBarcodeForPassUniqueIdentifier:v8 shouldReregisterIfNecessary:1 withCompletion:v9];

  objc_destroyWeak(&v12);
LABEL_10:
}

void __114__PKPassPaymentContainerView__retrieveDecryptedBarcodeWithAuthorization_shouldFetchBarcodeIfNecessary_completion___block_invoke_407(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Fetch barcode completed, fetched %ld, error: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _retrieveDecryptedBarcodeWithAuthorization:*(void *)(a1 + 32) shouldFetchBarcodeIfNecessary:0 completion:*(void *)(a1 + 40)];
  }
}

- (void)_fetchBarcodeForPassUniqueIdentifier:(id)a3 shouldReregisterIfNecessary:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke;
    v10[3] = &unk_1E59DD198;
    objc_copyWeak(&v13, &location);
    id v12 = v9;
    id v11 = v8;
    BOOL v14 = a4;
    [(PKPassPaymentContainerView *)self _beginSessionExchange:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained _endSessionExchange];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v11 = (void *)WeakRetained[60];
      uint64_t v12 = *(void *)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      id v13[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_2;
      v13[3] = &unk_1E59DD210;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      id v15 = *(id *)(a1 + 40);
      char v17 = *(unsigned char *)(a1 + 56);
      id v14 = *(id *)(a1 + 32);
      [v11 fetchBarcodesForPassUniqueIdentifier:v12 sessionExchangeToken:v5 withCompletion:v13];

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    __int16 v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_3;
  block[3] = &unk_1E59DD1E8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  id v7 = v4;
  char v11 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_9;
  }
  [WeakRetained _endSessionExchange];
  id v5 = [*(id *)(a1 + 32) domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F870D8]])
  {

LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  uint64_t v6 = [*(id *)(a1 + 32) code];

  if (v6 != 2 || !*(unsigned char *)(a1 + 64)) {
    goto LABEL_9;
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "No valid certificate when fetching barcode, attempting to re-register auxiliary capability", buf, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v9[2] = __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_409;
  v9[3] = &unk_1E59DD1C0;
  objc_copyWeak(&v12, v2);
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  [v4 _reregisterAuxiliaryCapabilityForPassUniqueIdentifier:v8 withCompletion:v9];

  objc_destroyWeak(&v12);
LABEL_10:
}

void __110__PKPassPaymentContainerView__fetchBarcodeForPassUniqueIdentifier_shouldReregisterIfNecessary_withCompletion___block_invoke_409(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v5 || !WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [WeakRetained _fetchBarcodeForPassUniqueIdentifier:*(void *)(a1 + 32) shouldReregisterIfNecessary:0 withCompletion:*(void *)(a1 + 40)];
  }
}

- (void)_reregisterAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke;
    v8[3] = &unk_1E59DD238;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    id v9 = v6;
    [(PKPassPaymentContainerView *)self _beginSessionExchange:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained _endSessionExchange];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v11 = (void *)WeakRetained[60];
      uint64_t v12 = *(void *)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      id v13[2] = __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_2;
      v13[3] = &unk_1E59CD348;
      objc_copyWeak(&v15, (id *)(a1 + 48));
      id v14 = *(id *)(a1 + 40);
      [v11 registerAuxiliaryCapabilityForPassUniqueIdentifier:v12 sessionExchangeToken:v5 withCompletion:v13];

      objc_destroyWeak(&v15);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Re-register auxiliary capability finished with error: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_410;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __99__PKPassPaymentContainerView__reregisterAuxiliaryCapabilityForPassUniqueIdentifier_withCompletion___block_invoke_410(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _endSessionExchange];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dismissBarcodeViewControllerIfNecessaryWithCompletion:(id)a3
{
  id v6 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barcodeViewController);
  objc_storeWeak((id *)&self->_barcodeViewController, 0);
  [WeakRetained invalidate];
  id v5 = [WeakRetained presentingViewController];
  if (v5 && ([WeakRetained isBeingDismissed] & 1) == 0)
  {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1, v6);
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)_handleReceivedBarcodePaymentTransaction:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = 21;
  if (!self->_transitioning) {
    uint64_t v7 = 22;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v7]);
  if (self->_activeBarcodeIdentifier
    && ([v5 barcodeIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:self->_activeBarcodeIdentifier],
        v9,
        v10)
    && (objc_storeStrong((id *)&self->_transactionForDisplayedBarcode, a3), !self->_transactionAuthenticationInProgress)
    && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 5
    && self->_transactionSubstate <= 1uLL)
  {
    uint64_t v11 = [v6 transactionStatus];
    if (v11)
    {
      if (v11 == 2)
      {
        char v22 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v23 = *MEMORY[0x1E4F87058];
        v37[0] = *MEMORY[0x1E4F87010];
        v37[1] = v23;
        id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
        uint64_t v35 = *MEMORY[0x1E4F86308];
        uint64_t v36 = *MEMORY[0x1E4F86378];
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [v22 subjects:v24 sendEvent:v25];

        [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:1];
        [(PKPassPaymentContainerView *)self _applyTerminalTransactionSubstateWithSuccess:0 reset:1];
        [(PKPassPaymentContainerView *)self _postDidDeauthorizeNotification];
      }
      else if (v11 == 1)
      {
        id v12 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v13 = *MEMORY[0x1E4F87058];
        v40[0] = *MEMORY[0x1E4F87010];
        v40[1] = v13;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
        uint64_t v38 = *MEMORY[0x1E4F86308];
        uint64_t v39 = *MEMORY[0x1E4F86370];
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [v12 subjects:v14 sendEvent:v15];

        [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:1];
        id v16 = [v6 awards];
        if ([v16 count])
        {
          objc_initWeak((id *)location, self);
          char v17 = (void *)MEMORY[0x1E4F84508];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke;
          v26[3] = &unk_1E59D6CC8;
          objc_copyWeak(&v27, (id *)location);
          [v17 acquireAssertionOfType:4 withReason:@"Transaction Awards Display" completion:v26];
          objc_destroyWeak(&v27);
          objc_destroyWeak((id *)location);
        }
        else
        {
          [(PKPassPaymentContainerView *)self _applyTerminalTransactionSubstateWithSuccess:1 reset:1];
        }
        [(PKPassPaymentContainerView *)self _postDidDeauthorizeNotification];
      }
    }
    else
    {
      [(PKPassPaymentContainerView *)self _performAuthenticationForTransactionIfNecessary:v6];
    }
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      activeBarcodeIdentifier = self->_activeBarcodeIdentifier;
      BOOL transactionAuthenticationInProgress = self->_transactionAuthenticationInProgress;
      int64_t transactionSubstate = self->_transactionSubstate;
      *(_DWORD *)id location = 138413058;
      *(void *)&location[4] = activeBarcodeIdentifier;
      __int16 v29 = 2048;
      BOOL v30 = transactionAuthenticationInProgress;
      __int16 v31 = 2048;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      int64_t v34 = transactionSubstate;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Not handling transaction for barcode id: %@, authentication in progress: %ld, terminal state: %ld, transaction substate: %ld", location, 0x2Au);
    }
  }
}

void __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_2;
      v11[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v12, v8);
      [v6 setInvalidationHandler:v11];
      objc_storeStrong(WeakRetained + 118, a2);
      objc_destroyWeak(&v12);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_3;
    v10[3] = &unk_1E59CA7D0;
    void v10[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[118];
    WeakRetained[118] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

uint64_t __71__PKPassPaymentContainerView__handleReceivedBarcodePaymentTransaction___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyTerminalTransactionSubstateWithSuccess:1 reset:0];
  [*(id *)(a1 + 32) _finishHoldingTerminalTransactionSubstateAfterDelay:5.0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateContentPrimaryView];
}

- (void)_performAuthenticationForTransactionIfNecessary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 authenticationContext];
  uint64_t v6 = [v5 requestedAuthenticationMechanisms];
  uint64_t v7 = 21;
  if (!self->_transitioning) {
    uint64_t v7 = 22;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKPassPaymentContainerView__passView[v7]);
  if (![v4 transactionStatus]
    && v6
    && ([v5 complete] & 1) == 0
    && PKTransactionAuthenticationMechanismIsValid()
    && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 5)
  {
    if (v6)
    {
      [(PKPassPaymentContainerView *)self _performPaymentPINCollectionForTransaction:v4];
    }
    else if ((v6 & 4) != 0)
    {
      [(PKPassPaymentContainerView *)self _performUserConfirmationForTransaction:v4];
    }
    else if ((v6 & 8) != 0)
    {
      [(PKPassPaymentContainerView *)self _performApplicationRedirectForTransaction:v4];
    }
    else if ((v6 & 2) != 0)
    {
      [(PKPassPaymentContainerView *)self _performTransactionSignatureSubmissionForTransaction:v4];
    }
    else
    {
      uint64_t v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Unsupported transaction authentication mechanism for UI", (uint8_t *)&v12, 2u);
      }
    }
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      activeBarcodeIdentifier = self->_activeBarcodeIdentifier;
      int v12 = 138413314;
      uint64_t v13 = activeBarcodeIdentifier;
      __int16 v14 = 2048;
      uint64_t v15 = [v4 transactionStatus];
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = [v5 complete];
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Not performing transaction authentication for barcode id %@, transaction status %ld, authentication mechanisms: %ld, authentication complete: %ld, terminal state: %ld", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (void)_performTransactionSignatureSubmissionForTransaction:(id)a3
{
  id v4 = a3;
  [(PKPassPaymentContainerView *)self _setTransactionAuthenticationInProgress:1];
  [(PKPassPaymentContainerView *)self _applyPaymentIndefiniteSuccessState];
  objc_initWeak(&location, self);
  id v5 = [v4 identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __83__PKPassPaymentContainerView__performTransactionSignatureSubmissionForTransaction___block_invoke;
  v6[3] = &unk_1E59DD260;
  objc_copyWeak(&v7, &location);
  [(PKPassPaymentContainerView *)self _submitSignatureForTransactionIdentifier:v5 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __83__PKPassPaymentContainerView__performTransactionSignatureSubmissionForTransaction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setTransactionAuthenticationInProgress:0];
    if (a3)
    {
      [v6 _endPaymentAuthorizationWithWillUpdateState:1];
      [v6 _applyTerminalTransactionSubstateWithSuccess:0 reset:1];
    }
    else
    {
      [v6 _handleReceivedBarcodePaymentTransaction:v7];
    }
  }
}

- (void)_submitSignatureForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = *MEMORY[0x1E4FB2748];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E59CB4B0;
  void aBlock[4] = &v22;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E59CAA98;
  id v10 = v7;
  id v20 = v10;
  uint64_t v11 = [v9 beginBackgroundTaskWithName:@"Submit Transaction Details Signature" expirationHandler:v19];
  v23[3] = v11;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3;
  void v15[3] = &unk_1E59DD328;
  void v15[4] = self;
  id v12 = v8;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  id v14 = v6;
  id v16 = v14;
  [(PKPassPaymentContainerView *)self _beginSessionExchange:v15];

  _Block_object_dispose(&v22, 8);
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F87538];
    uint64_t v6 = *MEMORY[0x1E4F28228];
    v7[0] = @"Submit transaction details signature background task timeout";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = [v2 errorWithDomain:v3 code:-1 userInfo:v4];
    (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v5);
  }
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = !v8;
  if (!v8)
  {
    [*(id *)(a1 + 32) _endSessionExchange];
    if (*(void *)(*(void *)(a1 + 32) + 504))
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v7;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Not submitting transaction details signature due to begin session exchange failure: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v11 = *(void *)(a1 + 56);
      if (v11) {
        (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v7);
      }
      goto LABEL_17;
    }

    id v5 = 0;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Submitting transaction details signature with token: %@", buf, 0xCu);
  }

  id v13 = *(void **)(a1 + 40);
  id v14 = *(void **)(*(void *)(a1 + 32) + 480);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_423;
  v17[3] = &unk_1E59DD300;
  id v15 = v13;
  char v22 = v9;
  uint64_t v16 = *(void *)(a1 + 32);
  id v18 = v15;
  uint64_t v19 = v16;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  [v14 submitTransactionSignatureForTransactionIdentifier:v15 sessionExchangeToken:v5 completion:v17];

LABEL_17:
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_423(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    [v5 transactionStatus];
    char v9 = PKPaymentTransactionStatusToString();
    id v10 = [v5 authenticationContext];
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Submitted transaction details signature for transaction %@, updated transaction status: %@, updated authentication context %@, error: %@", buf, 0x2Au);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_424;
  block[3] = &unk_1E59DD2D8;
  char v20 = *(unsigned char *)(a1 + 64);
  uint64_t v11 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v15 = v6;
  id v18 = v11;
  id v19 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v12 = v5;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_424(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 32) _endSessionExchange];
  }
  uint64_t v2 = [*(id *)(a1 + 40) domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F870D8]])
  {
    uint64_t v3 = [*(id *)(a1 + 40) code];

    if (v3 == 2)
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [v4 paymentPass];
      id v6 = [v5 uniqueID];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2_425;
      v11[3] = &unk_1E59DD2B0;
      id v13 = *(id *)(a1 + 64);
      id v7 = *(id *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 32);
      id v14 = v7;
      void v11[4] = v8;
      id v12 = *(id *)(a1 + 48);
      [v4 _reregisterAuxiliaryCapabilityForPassUniqueIdentifier:v6 withCompletion:v11];

      return;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9)
  {
    id v10 = *(void (**)(void))(v9 + 16);
    v10();
  }
}

void __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_2_425(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3_426;
  block[3] = &unk_1E59DD288;
  id v12 = *(id *)(a1 + 48);
  id v9 = v3;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v13 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__PKPassPaymentContainerView__submitSignatureForTransactionIdentifier_completion___block_invoke_3_426(void *a1)
{
  (*(void (**)(void))(a1[7] + 16))();
  if (a1[4])
  {
    uint64_t result = a1[8];
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    id v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[8];
    return [v4 _submitSignatureForTransactionIdentifier:v5 completion:v6];
  }
  return result;
}

- (void)_performPaymentPINCollectionForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F843E0] archivedSessionTokenForSubject:*MEMORY[0x1E4F87058]];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F843E0] archivedSessionTokenForSubject:*MEMORY[0x1E4F87010]];
  }
  uint64_t v8 = v7;

  id v9 = [PKTransactionAuthenticationPasscodeViewController alloc];
  uint64_t v10 = [(PKPassFooterContentView *)self paymentPass];
  id v11 = [v10 uniqueID];
  id v12 = [v4 identifier];
  id v13 = [(PKTransactionAuthenticationPasscodeViewController *)v9 initWithPassUniqueIdentifier:v11 transactionIdentifier:v12 archivedAnalyticsSessionToken:v8];

  [(PKTransactionAuthenticationPasscodeViewController *)v13 setDelegate:self];
  objc_initWeak(&location, self);
  [(PKPassPaymentContainerView *)self _setTransactionAuthenticationInProgress:1];
  objc_storeWeak((id *)&self->_activeTransactionAuthenticationViewController, v13);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke;
  void v15[3] = &unk_1E59CB010;
  objc_copyWeak(&v17, &location);
  id v14 = v13;
  id v16 = v14;
  [(PKPassPaymentContainerView *)self _dismissBarcodeViewControllerIfNecessaryWithCompletion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke_2;
  v6[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v7, v2);
  [v4 presentViewController:v5 animated:1 completion:v6];

  objc_destroyWeak(&v7);
}

void __73__PKPassPaymentContainerView__performPaymentPINCollectionForTransaction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTransactionAuthenticationUIActive:1];
}

- (void)_performApplicationRedirectForTransaction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke;
  aBlock[3] = &unk_1E59CB010;
  objc_copyWeak(&v16, &location);
  id v5 = v4;
  id v15 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_5;
  v11[3] = &unk_1E59CB128;
  objc_copyWeak(&v13, &location);
  id v7 = v6;
  id v12 = v7;
  uint64_t v8 = (void (**)(void))_Block_copy(v11);
  [(PKPassPaymentContainerView *)self _setTransactionAuthenticationInProgress:1];
  if ([(PKLinkedApplication *)self->_linkedApplication state])
  {
    v8[2](v8);
  }
  else
  {
    linkedApplicationUpdateCompletionHandlers = self->_linkedApplicationUpdateCompletionHandlers;
    uint64_t v10 = _Block_copy(v8);
    [(NSMutableArray *)linkedApplicationUpdateCompletionHandlers addObject:v10];

    [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
    if ([v4[127] state] != 1 || v5 == 0)
    {
      [v4 _setTransactionAuthenticationInProgress:0];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v8 = PKLocalizedAquamanString(&cfstr_Cancel.isa);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_2;
      v36[3] = &unk_1E59CCFF0;
      objc_copyWeak(v37, v2);
      __int16 v25 = [v7 actionWithTitle:v8 style:1 handler:v36];

      id v9 = [v4 paymentPass];
      id v28 = [v9 organizationName];

      int v10 = [v4[127] isInstalled];
      char v11 = v10;
      if (v10)
      {
        __int16 v27 = PKLocalizedAquamanString(&cfstr_TransactionAut.isa, &stru_1EF1B4C70.isa, v28);
        id v12 = [*(id *)(a1 + 32) currencyAmount];
        id v13 = [v12 formattedStringValue];
        id v14 = [*(id *)(a1 + 32) merchant];
        id v15 = [v14 displayName];
        id v26 = PKLocalizedAquamanString(&cfstr_TransactionAut_0.isa, &stru_1EF1B9A70.isa, v13, v15, v28);

        id v16 = PKLocalizedAquamanString(&cfstr_Open.isa);
        id v17 = (id *)MEMORY[0x1E4F86080];
      }
      else
      {
        __int16 v27 = PKLocalizedAquamanString(&cfstr_TransactionAut_1.isa, &stru_1EF1B4C70.isa, v28);
        id v18 = [*(id *)(a1 + 32) merchant];
        id v19 = [v18 displayName];
        id v26 = PKLocalizedAquamanString(&cfstr_TransactionAut_2.isa, &stru_1EF1B5770.isa, v19, v28);

        id v16 = PKLocalizedAquamanString(&cfstr_ViewInAppStore.isa);
        id v17 = (id *)MEMORY[0x1E4F86088];
      }
      id v20 = *v17;
      id v21 = (void *)MEMORY[0x1E4FB1410];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      void v31[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_3;
      v31[3] = &unk_1E59DD350;
      objc_copyWeak(&v34, v2);
      id v22 = v20;
      id v32 = v22;
      char v35 = v11;
      id v33 = *(id *)(a1 + 32);
      __int16 v23 = [v21 actionWithTitle:v16 style:0 handler:v31];
      id v24 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v27 message:v26 preferredStyle:1];
      [v24 addAction:v25];
      [v24 addAction:v23];
      [v24 setPreferredAction:v23];
      objc_storeWeak(v4 + 121, v24);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_4;
      v29[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v30, v2);
      [v5 presentViewController:v24 animated:1 completion:v29];
      objc_destroyWeak(&v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(v37);
    }
  }
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_2(uint64_t a1)
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v3 = *MEMORY[0x1E4F87010];
    v10[0] = *MEMORY[0x1E4F87058];
    v10[1] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    uint64_t v5 = *MEMORY[0x1E4F86120];
    v8[0] = *MEMORY[0x1E4F86308];
    v8[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F86078];
    v9[0] = *MEMORY[0x1E4F86380];
    v9[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v2 subjects:v4 sendEvent:v7];

    [WeakRetained _setTransactionAuthenticationUIActive:0];
    [WeakRetained _cancelTransactionAuthentication];
  }
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_3(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v4 = *MEMORY[0x1E4F87010];
    v21[0] = *MEMORY[0x1E4F87058];
    v21[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    uint64_t v6 = *MEMORY[0x1E4F86380];
    uint64_t v7 = *MEMORY[0x1E4F86120];
    v19[0] = *MEMORY[0x1E4F86308];
    v19[1] = v7;
    uint64_t v8 = *(void *)(a1 + 32);
    v20[0] = v6;
    v20[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v3 subjects:v5 sendEvent:v9];

    if (*(unsigned char *)(a1 + 56))
    {
      int v10 = (void *)WeakRetained[60];
      char v11 = [WeakRetained paymentPass];
      id v12 = [v11 uniqueID];
      id v13 = [v10 transactionsAppLaunchTokenForPassWithUniqueIdentifier:v12];

      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = [WeakRetained paymentPass];
      id v16 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:v14 excludeTransactionIdentifier:0 pass:v15 pathSuffix:@"/authenticate" appLaunchToken:v13];
    }
    else
    {
      id v16 = 0;
    }
    id v17 = (void *)WeakRetained[127];
    id v18 = objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
    [v17 openApplication:v18 withLaunchOptions:0 launchURL:v16];

    [WeakRetained _endPaymentAuthorizationWithWillUpdateState:1];
    [WeakRetained _resetToIdleState];
  }
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTransactionAuthenticationUIActive:1];
}

void __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  id v3[2] = __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_6;
  v3[3] = &unk_1E59CAA98;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _dismissBarcodeViewControllerIfNecessaryWithCompletion:v3];
}

uint64_t __72__PKPassPaymentContainerView__performApplicationRedirectForTransaction___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performUserConfirmationForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIView *)self pkui_viewControllerFromResponderChain];
  if (v5)
  {
    objc_initWeak(location, self);
    uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v7 = PKLocalizedAquamanString(&cfstr_TransactionAut_3.isa);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke;
    v29[3] = &unk_1E59CCFF0;
    objc_copyWeak(&v30, location);
    uint64_t v8 = [v6 actionWithTitle:v7 style:1 handler:v29];

    id v9 = (void *)MEMORY[0x1E4FB1410];
    int v10 = PKLocalizedAquamanString(&cfstr_TransactionAut_4.isa);
    char v11 = (void *)v8;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_2;
    v26[3] = &unk_1E59D25D0;
    objc_copyWeak(&v28, location);
    id v12 = v4;
    id v27 = v12;
    id v13 = [v9 actionWithTitle:v10 style:0 handler:v26];

    uint64_t v14 = [v12 currencyAmount];
    id v15 = [v14 formattedStringValue];
    id v16 = [v12 merchant];
    id v17 = [v16 displayName];
    id v18 = PKLocalizedAquamanString(&cfstr_TransactionAut_5.isa, &stru_1EF1B5770.isa, v15, v17);

    id v19 = (void *)MEMORY[0x1E4FB1418];
    id v20 = PKLocalizedAquamanString(&cfstr_TransactionAut_6.isa);
    id v21 = [v19 alertControllerWithTitle:v20 message:v18 preferredStyle:1];

    [v21 addAction:v11];
    [v21 addAction:v13];
    [v21 setPreferredAction:v13];
    [(PKPassPaymentContainerView *)self _setTransactionAuthenticationInProgress:1];
    objc_storeWeak((id *)&self->_activeTransactionAuthenticationViewController, v21);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_4;
    v23[3] = &unk_1E59CB010;
    objc_copyWeak(&v25, location);
    id v22 = v21;
    id v24 = v22;
    [(PKPassPaymentContainerView *)self _dismissBarcodeViewControllerIfNecessaryWithCompletion:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke(uint64_t a1)
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v3 = *MEMORY[0x1E4F87010];
    v10[0] = *MEMORY[0x1E4F87058];
    v10[1] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    uint64_t v5 = *MEMORY[0x1E4F86120];
    v8[0] = *MEMORY[0x1E4F86308];
    v8[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F86D88];
    v9[0] = *MEMORY[0x1E4F86380];
    v9[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v2 subjects:v4 sendEvent:v7];

    [WeakRetained _setTransactionAuthenticationUIActive:0];
    [WeakRetained _cancelTransactionAuthentication];
  }
}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v7 = *MEMORY[0x1E4F87010];
    v18[0] = *MEMORY[0x1E4F87058];
    v18[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v9 = *MEMORY[0x1E4F86380];
    uint64_t v10 = *MEMORY[0x1E4F86120];
    v16[0] = *MEMORY[0x1E4F86308];
    v16[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F86D90];
    v17[0] = v9;
    v17[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v6 subjects:v8 sendEvent:v12];

    [WeakRetained _setTransactionAuthenticationUIActive:0];
    [WeakRetained _applyPaymentIndefiniteSuccessState];
    id v13 = [*(id *)(a1 + 32) identifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_3;
    v14[3] = &unk_1E59DD260;
    objc_copyWeak(&v15, v4);
    [WeakRetained _submitUserConfirmation:1 forTransactionIdentifier:v13 completion:v14];

    objc_destroyWeak(&v15);
  }
}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setTransactionAuthenticationInProgress:0];
    if (a3)
    {
      [v6 _endPaymentAuthorizationWithWillUpdateState:1];
      [v6 _applyTerminalTransactionSubstateWithSuccess:0 reset:1];
    }
    else
    {
      [v6 _handleReceivedBarcodePaymentTransaction:v7];
    }
  }
}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_5;
  v6[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v7, v2);
  [v4 presentViewController:v5 animated:1 completion:v6];

  objc_destroyWeak(&v7);
}

void __69__PKPassPaymentContainerView__performUserConfirmationForTransaction___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTransactionAuthenticationUIActive:1];
}

- (void)_submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = *MEMORY[0x1E4FB2748];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E59CB4B0;
  void aBlock[4] = &v25;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2;
  v22[3] = &unk_1E59CAA98;
  id v12 = v9;
  id v23 = v12;
  uint64_t v13 = [v11 beginBackgroundTaskWithName:@"Submit User Confirmation" expirationHandler:v22];
  v26[3] = v13;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3;
  v17[3] = &unk_1E59DD418;
  void v17[4] = self;
  id v14 = v10;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  id v16 = v8;
  id v18 = v16;
  BOOL v21 = a3;
  [(PKPassPaymentContainerView *)self _beginSessionExchange:v17];

  _Block_object_dispose(&v25, 8);
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F87538];
    uint64_t v6 = *MEMORY[0x1E4F28228];
    v7[0] = @"Submit user confirmation background task timeout";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    uint64_t v5 = [v2 errorWithDomain:v3 code:-1 userInfo:v4];
    (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v5);
  }
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = !v8;
  if (!v8)
  {
    [*(id *)(a1 + 32) _endSessionExchange];
    if (*(void *)(*(void *)(a1 + 32) + 504))
    {
      uint64_t v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Not submitting user confirmation due to begin session exchange failure: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v11 = *(void *)(a1 + 56);
      if (v11) {
        (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v7);
      }
      goto LABEL_17;
    }

    id v5 = 0;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Submitting user confirmation with token: %@", buf, 0xCu);
  }

  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = *(void **)(*(void *)(a1 + 32) + 480);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_477;
  v17[3] = &unk_1E59DD3F0;
  id v15 = v13;
  char v22 = v9;
  uint64_t v16 = *(void *)(a1 + 32);
  id v18 = v15;
  uint64_t v19 = v16;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  char v23 = *(unsigned char *)(a1 + 64);
  [v14 submitUserConfirmation:1 forTransactionIdentifier:v15 sessionExchangeToken:v5 completion:v17];

LABEL_17:
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_477(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    [v5 transactionStatus];
    char v9 = PKPaymentTransactionStatusToString();
    uint64_t v10 = [v5 authenticationContext];
    *(_DWORD *)buf = 138413058;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Submitted user confirmation YES for transaction %@, updated transaction status: %@, updated authentication context %@, error: %@", buf, 0x2Au);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_478;
  block[3] = &unk_1E59DD3C8;
  char v20 = *(unsigned char *)(a1 + 64);
  uint64_t v11 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v15 = v6;
  id v18 = v11;
  id v19 = *(id *)(a1 + 56);
  char v21 = *(unsigned char *)(a1 + 65);
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v12 = v5;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_478(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 32) _endSessionExchange];
  }
  uint64_t v2 = [*(id *)(a1 + 40) domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F870D8]])
  {
    uint64_t v3 = [*(id *)(a1 + 40) code];

    if (v3 == 2)
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [v4 paymentPass];
      id v6 = [v5 uniqueID];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2_479;
      v11[3] = &unk_1E59DD3A0;
      id v13 = *(id *)(a1 + 64);
      id v7 = *(id *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 32);
      id v14 = v7;
      void v11[4] = v8;
      char v15 = *(unsigned char *)(a1 + 81);
      id v12 = *(id *)(a1 + 48);
      [v4 _reregisterAuxiliaryCapabilityForPassUniqueIdentifier:v6 withCompletion:v11];

      return;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9)
  {
    uint64_t v10 = *(void (**)(void))(v9 + 16);
    v10();
  }
}

void __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_2_479(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3_480;
  v8[3] = &unk_1E59DD378;
  id v12 = *(id *)(a1 + 48);
  id v9 = v3;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v13 = v4;
  uint64_t v10 = v5;
  char v14 = *(unsigned char *)(a1 + 64);
  id v11 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __90__PKPassPaymentContainerView__submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_3_480(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (*(void *)(a1 + 32))
  {
    uint64_t result = *(void *)(a1 + 64);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    return [v5 _submitUserConfirmation:v4 forTransactionIdentifier:v6 completion:v7];
  }
  return result;
}

- (void)_setTransactionAuthenticationInProgress:(BOOL)a3
{
  if (((!self->_transactionAuthenticationInProgress ^ a3) & 1) == 0) {
    self->_BOOL transactionAuthenticationInProgress = a3;
  }
}

- (void)_setTransactionAuthenticationUIActive:(BOOL)a3
{
  if (((!self->_transactionAuthenticationUIActive ^ a3) & 1) == 0)
  {
    self->_transactionAuthenticationUIActive = a3;
    barcodeDisplayTimer = self->_barcodeDisplayTimer;
    if (barcodeDisplayTimer)
    {
      if (a3) {
        dispatch_suspend(barcodeDisplayTimer);
      }
      else {
        dispatch_resume(barcodeDisplayTimer);
      }
    }
  }
}

- (void)_resetTransactionAuthenticationIfNecessary
{
  p_activeTransactionAuthenticationViewController = &self->_activeTransactionAuthenticationViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransactionAuthenticationViewController);
  objc_storeWeak((id *)p_activeTransactionAuthenticationViewController, 0);
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained presentingViewController];
    char v5 = [WeakRetained isBeingDismissed];
    if (v4 && (v5 & 1) == 0) {
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", -[PKPassPaymentContainerView _isBackgrounded](self, "_isBackgrounded") ^ 1, 0);
    }
  }
  [(PKPassPaymentContainerView *)self _setTransactionAuthenticationUIActive:0];
  [(PKPassPaymentContainerView *)self _setTransactionAuthenticationInProgress:0];
}

- (void)_cancelTransactionAuthentication
{
  [(PKPassPaymentContainerView *)self _setTransactionAuthenticationInProgress:0];
  [(PKPassPaymentContainerView *)self _endPaymentAuthorizationWithWillUpdateState:1];
  id v3 = PKLocalizedAquamanString(&cfstr_PaymentErrorUs.isa);
  [(PKPassPaymentContainerView *)self _applyPayState:9 withTextOverride:v3];

  [(PKPassPaymentContainerView *)self _resetToIdleStateAfterDelay:4.0];
}

- (void)passcodeViewController:(id)a3 requestSessionExchangeTokenWithHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke;
    v7[3] = &unk_1E59CAD18;
    void v7[4] = self;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke_2;
  v2[3] = &unk_1E59DD440;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _beginSessionExchange:v2];
}

void __92__PKPassPaymentContainerView_passcodeViewController_requestSessionExchangeTokenWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to obtain session exchange token for passcode encryption", v9, 2u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)passcodeViewControllerDidEndSessionExchange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPassPaymentContainerView_passcodeViewControllerDidEndSessionExchange___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__PKPassPaymentContainerView_passcodeViewControllerDidEndSessionExchange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSessionExchange];
}

- (void)passcodeViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke;
  v6[3] = &unk_1E59CC220;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  id v3[2] = __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke_2;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 _dismissTransactionAuthenticationPasscodeViewController:v2 withCompletion:v3];
  objc_destroyWeak(&v4);
}

void __62__PKPassPaymentContainerView_passcodeViewControllerDidCancel___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancelTransactionAuthentication];
    id WeakRetained = v2;
  }
}

- (void)passcodeViewController:(id)a3 didGenerateEncryptedPasscode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke;
  aBlock[3] = &unk_1E59CB010;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v20 = v8;
  id v9 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3;
  v13[3] = &unk_1E59DD4E0;
  id v14 = v7;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  objc_copyWeak(&v18, &location);
  dispatch_async(MEMORY[0x1E4F14428], v13);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2;
    id v5[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, v2);
    [WeakRetained _dismissTransactionAuthenticationPasscodeViewController:v4 withCompletion:v5];
    objc_destroyWeak(&v6);
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setTransactionAuthenticationInProgress:0];
    [v2 _endPaymentAuthorizationWithWillUpdateState:1];
    [v2 _applyTerminalTransactionSubstateWithSuccess:0 reset:1];
    id WeakRetained = v2;
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) transactionIdentifier];
    id v3 = [*(id *)(a1 + 40) passUniqueIdentifier];
    [*(id *)(a1 + 48) _applyPaymentIndefiniteSuccessState];
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4;
    v9[3] = &unk_1E59DD4B8;
    objc_copyWeak(&v14, (id *)(a1 + 64));
    id v6 = v3;
    id v10 = v6;
    id v7 = v2;
    id v11 = v7;
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    [v4 _submitEncryptedPIN:v5 forTransactionIdentifier:v7 completion:v9];

    objc_destroyWeak(&v14);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5;
  block[3] = &unk_1E59DD490;
  objc_copyWeak(&v16, a1 + 8);
  id v10 = v5;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = v6;
  id v15 = a1[7];
  id v14 = a1[6];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 80);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[116];
    id v6 = [*(id *)(a1 + 32) barcodeIdentifier];
    LODWORD(v5) = [v5 isEqual:v6];

    if (v5)
    {
      id v7 = [*(id *)(a1 + 32) authenticationContext];
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        [*(id *)(a1 + 32) transactionStatus];
        id v11 = PKPaymentTransactionStatusToString();
        uint64_t v12 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138413314;
        uint64_t v51 = v10;
        __int16 v52 = 2112;
        uint64_t v53 = v9;
        __int16 v54 = 2112;
        BOOL v55 = v11;
        __int16 v56 = 2112;
        BOOL v57 = v7;
        __int16 v58 = 2112;
        uint64_t v59 = v12;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Submited payment PIN for pass %@, transaction %@, updated transaction status %@, updated authentication context %@, error: %@", buf, 0x34u);
      }
      if (*(void *)(a1 + 56))
      {
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
      else
      {
        id v13 = v4[127];
        unint64_t v14 = [v7 requestedAuthenticationMechanisms];
        if ([v7 authenticationFailure] == 2
          && [*(id *)(a1 + 32) transactionStatus] != 1
          && v14 <= 1
          && [v13 state] == 1)
        {
          id v15 = (void *)MEMORY[0x1E4FB1410];
          id v16 = PKLocalizedAquamanString(&cfstr_Cancel.isa);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          void v47[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_484;
          v47[3] = &unk_1E59D25D0;
          objc_copyWeak(&v49, v2);
          id v48 = *(id *)(a1 + 64);
          id v33 = [v15 actionWithTitle:v16 style:1 handler:v47];

          int v17 = [v13 isInstalled];
          id v18 = [v4 paymentPass];
          if (v17) {
            id v19 = @"OPEN";
          }
          else {
            id v19 = @"VIEW_IN_APP_STORE";
          }
          id v34 = PKLocalizedAquamanString(&v19->isa);
          id v20 = (void *)MEMORY[0x1E4FB1410];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3_486;
          void v40[3] = &unk_1E59DD468;
          objc_copyWeak(&v45, v2);
          char v46 = v17;
          id v41 = *(id *)(a1 + 40);
          id v42 = *(id *)(a1 + 32);
          id v30 = v18;
          id v43 = v30;
          id v44 = v13;
          id v21 = [v20 actionWithTitle:v34 style:0 handler:v40];
          char v22 = [v4 paymentPass];
          uint64_t v23 = [v22 organizationName];

          if (v17)
          {
            __int16 v24 = PKLocalizedAquamanString(&cfstr_TransactionAut.isa, &stru_1EF1B4C70.isa, v23, v30, &v45);
            PKLocalizedAquamanString(&cfstr_TransactionAut_7.isa, &stru_1EF1B4C70.isa, v23);
          }
          else
          {
            __int16 v24 = PKLocalizedAquamanString(&cfstr_TransactionAut_1.isa, &stru_1EF1B4C70.isa, v23, v30, &v45);
            PKLocalizedAquamanString(&cfstr_TransactionAut_8.isa, &stru_1EF1B4C70.isa, v23);
          __int16 v28 = };
          id v29 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v24 message:v28 preferredStyle:1];
          [v29 addAction:v21];
          [v29 addAction:v33];
          [v29 setPreferredAction:v21];
          [*(id *)(a1 + 64) presentViewController:v29 animated:1 completion:0];

          objc_destroyWeak(location);
          objc_destroyWeak(&v49);
        }
        else
        {
          int ShouldAuthenticateForMechanism = PKPaymentTransactionShouldAuthenticateForMechanism();
          __int16 v26 = *(void **)(a1 + 64);
          if (ShouldAuthenticateForMechanism)
          {
            uint64_t v27 = [v7 authenticationFailure];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4_496;
            void v38[3] = &unk_1E59CA9F8;
            id v39 = *(id *)(a1 + 72);
            [v26 resetWithTransactionAuthenticationFailure:v27 completion:v38];
          }
          else
          {
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            id v35[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5_497;
            v35[3] = &unk_1E59CB010;
            objc_copyWeak(&v37, v2);
            id v36 = *(id *)(a1 + 32);
            [v4 _dismissTransactionAuthenticationPasscodeViewController:v26 withCompletion:v35];

            objc_destroyWeak(&v37);
          }
        }
      }
    }
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_484(uint64_t a1, void *a2)
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v7 = *MEMORY[0x1E4F87010];
    v18[0] = *MEMORY[0x1E4F87058];
    v18[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v9 = *MEMORY[0x1E4F86380];
    uint64_t v10 = *MEMORY[0x1E4F86120];
    v16[0] = *MEMORY[0x1E4F86308];
    v16[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F86710];
    v17[0] = v9;
    v17[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v6 subjects:v8 sendEvent:v12];

    uint64_t v13 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2_485;
    v14[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v15, v4);
    [WeakRetained _dismissTransactionAuthenticationPasscodeViewController:v13 withCompletion:v14];
    objc_destroyWeak(&v15);
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_2_485(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancelTransactionAuthentication];
    id WeakRetained = v2;
  }
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_3_486(uint64_t a1)
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v4 = *MEMORY[0x1E4F87010];
    v17[0] = *MEMORY[0x1E4F87058];
    v17[1] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    uint64_t v6 = *MEMORY[0x1E4F86380];
    uint64_t v7 = *MEMORY[0x1E4F86120];
    v15[0] = *MEMORY[0x1E4F86308];
    v15[1] = v7;
    id v8 = (uint64_t *)MEMORY[0x1E4F86720];
    if (*(unsigned char *)(a1 + 72)) {
      id v8 = (uint64_t *)MEMORY[0x1E4F86718];
    }
    uint64_t v9 = *v8;
    v16[0] = v6;
    v16[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v3 subjects:v5 sendEvent:v10];

    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v11 = [WeakRetained[60] transactionsAppLaunchTokenForPassWithUniqueIdentifier:*(void *)(a1 + 32)];
      uint64_t v12 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:*(void *)(a1 + 40) excludeTransactionIdentifier:1 pass:*(void *)(a1 + 48) pathSuffix:@"/resetPaymentCredential" appLaunchToken:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void **)(a1 + 56);
    unint64_t v14 = objc_msgSend(WeakRetained, "pkui_viewControllerFromResponderChain");
    [v13 openApplication:v14 withLaunchOptions:1 launchURL:v12];
  }
}

uint64_t __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_4_496(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __82__PKPassPaymentContainerView_passcodeViewController_didGenerateEncryptedPasscode___block_invoke_5_497(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setTransactionAuthenticationInProgress:0];
    [v3 _handleReceivedBarcodePaymentTransaction:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = *MEMORY[0x1E4FB2748];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E59CB4B0;
  void aBlock[4] = &v27;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v24[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2;
  v24[3] = &unk_1E59CAA98;
  id v13 = v10;
  id v25 = v13;
  uint64_t v14 = [v12 beginBackgroundTaskWithName:@"Submit Encrypted PIN" expirationHandler:v24];
  v28[3] = v14;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3;
  v19[3] = &unk_1E59DD5A8;
  void v19[4] = self;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  id v17 = v8;
  id v20 = v17;
  id v18 = v9;
  id v21 = v18;
  [(PKPassPaymentContainerView *)self _beginSessionExchange:v19];

  _Block_object_dispose(&v27, 8);
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F87538];
    uint64_t v6 = *MEMORY[0x1E4F28228];
    v7[0] = @"Submit encrypted PIN task timeout";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = [v2 errorWithDomain:v3 code:-1 userInfo:v4];
    (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v5);
  }
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = !v8;
  if (v8) {
    goto LABEL_14;
  }
  [a1[4] _endSessionExchange];
  if (!*((void *)a1[4] + 63))
  {

    id v5 = 0;
LABEL_14:
    uint64_t v12 = a1[4];
    id v13 = a1[5];
    uint64_t v14 = (void *)v12[60];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_504;
    id v16[3] = &unk_1E59DD580;
    char v21 = v9;
    void v16[4] = v12;
    id v15 = a1[6];
    id v19 = a1[7];
    id v20 = a1[8];
    id v17 = a1[5];
    id v18 = a1[6];
    [v14 submitEncryptedPIN:v13 forTransactionIdentifier:v15 sessionExchangeToken:v5 completion:v16];

    goto LABEL_15;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Not submitting encrypted PIN due to begin session exchange failure: %@", buf, 0xCu);
  }

  (*((void (**)(void))a1[7] + 2))();
  uint64_t v11 = (void (**)(id, void, void *))a1[8];
  if (v11) {
    v11[2](v11, 0, v7);
  }
LABEL_15:
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_504(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2_505;
  v9[3] = &unk_1E59DD558;
  char v16 = *(unsigned char *)(a1 + 72);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_2_505(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 88)) {
    [*(id *)(a1 + 32) _endSessionExchange];
  }
  id v2 = [*(id *)(a1 + 40) domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F870D8]])
  {
    uint64_t v3 = [*(id *)(a1 + 40) code];

    if (v3 == 2)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = [v4 paymentPass];
      id v6 = [v5 uniqueID];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3_506;
      v11[3] = &unk_1E59DD530;
      id v14 = *(id *)(a1 + 72);
      id v7 = *(id *)(a1 + 80);
      uint64_t v8 = *(void *)(a1 + 32);
      id v15 = v7;
      void v11[4] = v8;
      id v12 = *(id *)(a1 + 48);
      id v13 = *(id *)(a1 + 56);
      [v4 _reregisterAuxiliaryCapabilityForPassUniqueIdentifier:v6 withCompletion:v11];

      return;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  uint64_t v9 = *(void *)(a1 + 80);
  if (v9)
  {
    id v10 = *(void (**)(void))(v9 + 16);
    v10();
  }
}

void __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_3_506(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_4;
  v8[3] = &unk_1E59DD508;
  id v13 = *(id *)(a1 + 56);
  id v9 = v3;
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v14 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __86__PKPassPaymentContainerView__submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[8] + 16))();
  if (a1[4])
  {
    uint64_t result = a1[9];
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    id v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[9];
    return [v4 _submitEncryptedPIN:v5 forTransactionIdentifier:v6 completion:v7];
  }
  return result;
}

- (void)_dismissTransactionAuthenticationPasscodeViewController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  [v6 setDelegate:0];
  uint64_t v8 = [v6 presentingViewController];
  if (v8 && ([v6 isBeingDismissed] & 1) == 0)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(PKPassPaymentContainerView *)self _isBackgrounded] ^ 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __101__PKPassPaymentContainerView__dismissTransactionAuthenticationPasscodeViewController_withCompletion___block_invoke;
    void v10[3] = &unk_1E59CB128;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v8 dismissViewControllerAnimated:v9 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __101__PKPassPaymentContainerView__dismissTransactionAuthenticationPasscodeViewController_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setTransactionAuthenticationUIActive:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)_showInstallAssociatedApplicationInstructionsIfNecessary
{
  if ([(PKPassFooterContentView *)self style] == 3)
  {
    if ([(PKLinkedApplication *)self->_linkedApplication state])
    {
      [(PKPassPaymentContainerView *)self _updateBottomTextView];
    }
    else
    {
      objc_initWeak(&location, self);
      linkedApplicationUpdateCompletionHandlers = self->_linkedApplicationUpdateCompletionHandlers;
      uint64_t v5 = MEMORY[0x1E4F143A8];
      uint64_t v6 = 3221225472;
      uint64_t v7 = __86__PKPassPaymentContainerView__showInstallAssociatedApplicationInstructionsIfNecessary__block_invoke;
      uint64_t v8 = &unk_1E59CA7F8;
      objc_copyWeak(&v9, &location);
      id v4 = _Block_copy(&v5);
      -[NSMutableArray addObject:](linkedApplicationUpdateCompletionHandlers, "addObject:", v4, v5, v6, v7, v8);

      [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __86__PKPassPaymentContainerView__showInstallAssociatedApplicationInstructionsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBottomTextView];
}

- (id)_attributedStringForBottomTextViewFromString:(id)a3
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4FB0848];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setLineBreakMode:0];
  [v6 setAlignment:1];
  v14[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [(UITextView *)self->_bottomTextView font];
  uint64_t v8 = *MEMORY[0x1E4FB0738];
  v15[0] = v7;
  v15[1] = v6;
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v14[1] = v8;
  void v14[2] = v9;
  uint64_t v10 = [(UITextView *)self->_bottomTextView textColor];
  void v15[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v12 = PKAttributedStringByParsingLinksInString();

  return v12;
}

- (void)_updateBottomTextView
{
  if (self->_bottomTextViewAnimating)
  {
    self->_bottomTextViewNeedsUpdate = 1;
    return;
  }
  double v3 = CFAbsoluteTimeGetCurrent() - self->_bottomTextViewDisplayedTimestamp;
  if (v3 < 4.0)
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)((4.0 - v3) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
    return;
  }
  BOOL v5 = [(PKPassFooterContentView *)self style] == 3 && self->_activeBarcodeIdentifier != 0;
  id v6 = [(PKPassFooterContentView *)self paymentPass];
  uint64_t v7 = [v6 organizationName];

  uint64_t v8 = [(UITextView *)self->_bottomTextView attributedText];
  if (v5)
  {
    if (self->_collectingBarcodeEventMetadata)
    {
      PKLocalizedAquamanString(&cfstr_FraudPreventio.isa, &stru_1EF1B4C70.isa, v7);
      uint64_t v9 = LABEL_11:;
      bottomTextView = self->_bottomTextView;
      id v11 = [(PKPassPaymentContainerView *)self _attributedStringForBottomTextViewFromString:v9];
      [(UITextView *)bottomTextView setAttributedText:v11];

      int v12 = 1;
      goto LABEL_15;
    }
    if ([(PKLinkedApplication *)self->_linkedApplication state] == 1
      && ![(PKLinkedApplication *)self->_linkedApplication isInstalled])
    {
      PKLocalizedAquamanString(&cfstr_InstallAssocia.isa, &stru_1EF1B4C70.isa, v7);
      goto LABEL_11;
    }
  }
  int v12 = 0;
LABEL_15:
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_2;
  aBlock[3] = &unk_1E59CC270;
  objc_copyWeak(&v35, &location);
  char v36 = v12;
  id v13 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  id v32[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_4;
  v32[3] = &unk_1E59DD5D0;
  objc_copyWeak(&v33, &location);
  id v14 = _Block_copy(v32);
  [(UITextView *)self->_bottomTextView alpha];
  self->_bottomTextViewAnimating = 1;
  if (((v12 ^ (v15 <= 0.0)) & 1) == 0)
  {
    if (v12)
    {
      [(PKPassPaymentContainerView *)self setNeedsLayout];
      [(PKPassPaymentContainerView *)self layoutIfNeeded];
    }
    id v19 = (void *)MEMORY[0x1E4FB1EB0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_5;
    v29[3] = &unk_1E59CAF20;
    id v30 = v14;
    char v31 = v12;
    [v19 animateWithDuration:4 delay:v29 options:v13 animations:0.2 completion:0.0];
    id v20 = v30;
    goto LABEL_25;
  }
  if (v15 > 0.0 && v12 != 0)
  {
    id v17 = [(UITextView *)self->_bottomTextView attributedText];
    char v18 = PKEqualObjects();

    if ((v18 & 1) == 0)
    {
      char v21 = (void *)MEMORY[0x1E4FB1EB0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_6;
      v27[3] = &unk_1E59CAA98;
      id v22 = v14;
      id v28 = v22;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_7;
      v23[3] = &unk_1E59DD620;
      objc_copyWeak(&v26, &location);
      id v24 = v22;
      id v25 = v13;
      [v21 animateWithDuration:4 delay:v27 options:v23 animations:0.2 completion:0.0];

      objc_destroyWeak(&v26);
      id v20 = v28;
LABEL_25:

      goto LABEL_26;
    }
  }
  self->_bottomTextViewAnimating = 0;
LABEL_26:

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBottomTextView];
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_3;
  v2[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  char v4 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1000) = 0;
    char v4 = WeakRetained;
    if (*(unsigned char *)(a1 + 40))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      id WeakRetained = v4;
      v4[126] = Current;
    }
    if (*((unsigned char *)WeakRetained + 1001))
    {
      *((unsigned char *)WeakRetained + 1001) = 0;
      [v4 _updateBottomTextView];
      id WeakRetained = v4;
    }
  }
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_4(uint64_t a1, double a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    [WeakRetained[124] setAlpha:a2];
    id WeakRetained = v4;
  }
}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_5(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), (double)*(unint64_t *)&a2);
}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_7(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_8;
  block[3] = &unk_1E59DD5F8;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setNeedsLayout];
    [v3 layoutIfNeeded];
    id v4 = (void *)MEMORY[0x1E4FB1EB0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_9;
    id v5[3] = &unk_1E59CAA98;
    id v6 = *(id *)(a1 + 32);
    [v4 animateWithDuration:4 delay:v5 options:*(void *)(a1 + 40) animations:0.2 completion:0.0];
  }
}

uint64_t __51__PKPassPaymentContainerView__updateBottomTextView__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(1.0);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v7 = objc_msgSend(a4, "absoluteString", a3);
  if ([v7 isEqualToString:@"OPEN_ASSOCIATED_APPLICATION_IN_APP_STORE"])
  {
    linkedApplication = self->_linkedApplication;
    uint64_t v9 = [(UIView *)self pkui_viewControllerFromResponderChain];
    [(PKLinkedApplication *)linkedApplication openApplication:v9];
LABEL_5:

    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"OPEN_PAYMENT_INFO_EXTENSION_PRIVACY_TEXT"])
  {
    uint64_t v10 = [PKBarcodePaymentPrivacyViewController alloc];
    id v11 = [(PKPassFooterContentView *)self paymentPass];
    int v12 = [v11 organizationName];
    uint64_t v9 = [(PKBarcodePaymentPrivacyViewController *)v10 initWithIssuerName:v12 displayContext:1 paymentSetupContext:0];

    id v13 = [[PKPortraitNavigationController alloc] initWithRootViewController:v9];
    id v14 = [(UIView *)self pkui_viewControllerFromResponderChain];
    [v14 presentViewController:v13 animated:1 completion:0];

    goto LABEL_5;
  }
LABEL_6:

  return 0;
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPassPaymentContainerView_linkedApplicationDidChangeState___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKPassPaymentContainerView_linkedApplicationDidChangeState___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(a1 + 32) + 1024);
  [v1 removeAllObjects];
  [v1 enumerateObjectsUsingBlock:&__block_literal_global_525];
}

uint64_t __62__PKPassPaymentContainerView_linkedApplicationDidChangeState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_collectAndSubmitBarcodeEventMetadataWithAuthenticationType:(int64_t)a3
{
  id v5 = [(PKPassFooterContentView *)self paymentPass];
  if (v5)
  {
    activeBarcodeIdentifier = self->_activeBarcodeIdentifier;

    if (activeBarcodeIdentifier)
    {
      objc_initWeak(location, self);
      uint64_t v7 = [(PKPassFooterContentView *)self paymentPass];
      uint64_t v8 = [v7 uniqueID];

      uint64_t v9 = [(PKPassFooterContentView *)self paymentPass];
      uint64_t v10 = [v9 deviceAccountIdentifier];

      id v11 = (void *)[(NSString *)self->_activeBarcodeIdentifier copy];
      int v12 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v45 = 0;
      char v46 = &v45;
      uint64_t v47 = 0x2020000000;
      uint64_t v48 = *MEMORY[0x1E4FB2748];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke;
      aBlock[3] = &unk_1E59CB4B0;
      void aBlock[4] = &v45;
      id v13 = _Block_copy(aBlock);
      id v14 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v15 = [v14 beginBackgroundTaskWithName:@"Submit Barcode Payment Event" expirationHandler:v13];
      v46[3] = v15;

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2;
      v36[3] = &unk_1E59DD690;
      id v29 = v12;
      id v37 = v29;
      id v16 = v10;
      id v38 = v16;
      id v17 = v11;
      int64_t v43 = a3;
      id v39 = v17;
      BOOL v40 = self;
      id v18 = v8;
      id v41 = v18;
      id v28 = v13;
      id v42 = v28;
      id v19 = _Block_copy(v36);
      id v20 = [MEMORY[0x1E4F846F0] providerForExtensionPoint:*MEMORY[0x1E4F87220]];
      char v21 = [(PKPassFooterContentView *)self paymentPass];
      id v22 = [v21 associatedApplicationIdentifiers];
      id v23 = [v22 allObjects];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      id v30[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_534;
      v30[3] = &unk_1E59DD708;
      id v24 = v18;
      id v31 = v24;
      id v25 = v19;
      id v34 = v25;
      objc_copyWeak(&v35, location);
      id v26 = v17;
      id v32 = v26;
      id v27 = v16;
      id v33 = v27;
      [v20 extensionsWithContainingApplicationIdentifiers:v23 completion:v30];

      objc_destroyWeak(&v35);
      _Block_object_dispose(&v45, 8);

      objc_destroyWeak(location);
    }
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F84568];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setEventType:1];
  [v5 setTimestamp:*(void *)(a1 + 32)];
  [v5 setEventMetadata:v4];

  [v5 setDeviceAccountIdentifier:*(void *)(a1 + 40)];
  [v5 setBarcodeIdentifier:*(void *)(a1 + 48)];
  [v5 setAuthenticationType:*(void *)(a1 + 80)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3;
  v8[3] = &unk_1E59CB728;
  id v6 = *(void **)(a1 + 64);
  void v8[4] = *(void *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 72);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  id v3[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_4;
  v3[3] = &unk_1E59DD668;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _beginSessionExchange:v3];
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_7;
    block[3] = &unk_1E59CF3E0;
    void block[4] = *(void *)(a1 + 32);
    id v10 = &v13;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v7 + 480);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_5;
    void v17[3] = &unk_1E59CAD18;
    void v17[4] = v7;
    id v10 = &v18;
    uint64_t v11 = *(void *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    [v9 submitBarcodePaymentEvent:v8 forPassUniqueIdentifier:v11 sessionExchangeToken:a2 withCompletion:v17];
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_6;
  v2[3] = &unk_1E59CAD18;
  uint64_t v1 = *(void **)(a1 + 40);
  void v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _endSessionExchange];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_7(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _endSessionExchange];
  if (!*(void *)(*(void *)(a1 + 32) + 504))
  {
    uint64_t v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Failed to acquire session exchange token but still submitting barcode event. Acquire token error: %@", buf, 0xCu);
    }

    id v4 = *(void **)(*(void *)(a1 + 32) + 480);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_530;
    v7[3] = &unk_1E59CAA98;
    id v8 = *(id *)(a1 + 64);
    [v4 submitBarcodePaymentEvent:v5 forPassUniqueIdentifier:v6 withCompletion:v7];
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_530(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_531;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_531(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_534(id *a1, void *a2, void *a3)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v5 count];
  }
  id v8 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v9 = *MEMORY[0x1E4F87058];
  v36[0] = *MEMORY[0x1E4F87010];
  v36[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v11 = *MEMORY[0x1E4F863C0];
  uint64_t v12 = *MEMORY[0x1E4F864B8];
  v34[0] = *MEMORY[0x1E4F86308];
  v34[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F87220];
  v35[0] = v11;
  v35[1] = v13;
  id v34[2] = *MEMORY[0x1E4F866D0];
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
  id v35[2] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
  [v8 subjects:v10 sendEvent:v15];

  id v16 = PKLogFacilityTypeGetObject();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v17)
    {
      id v18 = a1[4];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Matched payment information event extension for pass %@. Collecting payment information.", buf, 0xCu);
    }

    id v19 = [v5 firstObject];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v31 = __Block_byref_object_copy__53;
    id v32 = __Block_byref_object_dispose__53;
    id v33 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_535;
    v22[3] = &unk_1E59DD6E0;
    id v23 = a1[4];
    id v27 = a1[7];
    objc_copyWeak(&v29, a1 + 8);
    id v28 = buf;
    id v20 = v19;
    id v24 = v20;
    id v25 = a1[5];
    id v26 = a1[6];
    [v20 beginExtensionRequestWithOptions:1 completion:v22];

    objc_destroyWeak(&v29);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v17)
    {
      id v21 = a1[4];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Unable to match payment information event extension for pass: %@, error: %@. Submitting barcode event directly.", buf, 0x16u);
    }

    (*((void (**)(void))a1[7] + 2))();
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_535(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 && ([v3 isInvalidated] & 1) == 0)
  {
    id v5 = [v4 extensionContext];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_537;
        block[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v20, (id *)(a1 + 80));
        dispatch_async(MEMORY[0x1E4F14428], block);
        id v8 = (void *)MEMORY[0x1E4F1E5E8];
        uint64_t v9 = [*(id *)(a1 + 40) identifier];
        uint64_t v10 = [v8 newAssertionForBundleIdentifier:v9 withReason:@"Barcode Event Metadata"];
        uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F84560]) initWithBarcodeIdentifier:*(void *)(a1 + 48) deviceAccountIdentifier:*(void *)(a1 + 56)];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_543;
        void v14[3] = &unk_1E59DD6B8;
        uint64_t v17 = *(void *)(a1 + 72);
        id v15 = v4;
        objc_copyWeak(&v18, (id *)(a1 + 80));
        id v16 = *(id *)(a1 + 64);
        [v5 handleInformationRequest:v13 completion:v14];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&v20);
        goto LABEL_7;
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v7;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Failed to begin payment information event extension for pass: %@. Submitting barcode event directly.", buf, 0xCu);
  }

  [v4 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_7:
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_537(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1032] = 1;
    id v2 = WeakRetained;
    [WeakRetained _updateBottomTextView];
    id WeakRetained = v2;
  }
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_2_543(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  [*(id *)(a1 + 32) invalidate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_544;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v3 paymentInformation];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  objc_destroyWeak(&v7);
}

void __90__PKPassPaymentContainerView__collectAndSubmitBarcodeEventMetadataWithAuthenticationType___block_invoke_3_544(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1032] = 0;
    id v2 = WeakRetained;
    [WeakRetained _updateBottomTextView];
    id WeakRetained = v2;
  }
}

- (void)passTileGroupView:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void))a6;
  id v12 = [(PKPassFooterContentView *)self paymentPass];
  if (v12 != v9 || ![(PKPassPaymentContainerView *)self _authenticationAllowed])
  {

    goto LABEL_10;
  }
  int64_t transactionSubstate = self->_transactionSubstate;

  if (transactionSubstate)
  {
LABEL_10:
    v11[2](v11, 0);
    goto LABEL_11;
  }
  id v14 = [v10 state];
  id v15 = (void *)MEMORY[0x1E4F84B58];
  id v16 = [v14 actions];
  uint64_t v17 = [v15 effectiveActionForActions:v16];

  if (v17 && [v17 type] == 4 && !self->_contactlessInterfaceSessionShared)
  {
    self->_contactlessInterfaceSessionShared = 1;
    [(PKPassPaymentContainerView *)self _applyPayState:12];
    objc_initWeak(&location, self);
    id v18 = self->_contactlessInterfaceSession;
    authorizationQueue = self->_authorizationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke;
    block[3] = &unk_1E59CD988;
    uint64_t v22 = v18;
    id v23 = v10;
    id v24 = v11;
    id v20 = v18;
    objc_copyWeak(&v25, &location);
    dispatch_async(authorizationQueue, block);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
  }
  else
  {
    v11[2](v11, 0);
  }

LABEL_11:
}

void __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v36 = 0;
  id v37 = 0;
  [*(id *)(a1 + 32) activatedPaymentApplications];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v33;
LABEL_3:
    uint64_t v2 = 0;
    while (1)
    {
      if (*(void *)v33 != v20)
      {
        uint64_t v3 = v2;
        objc_enumerationMutation(obj);
        uint64_t v2 = v3;
      }
      uint64_t v22 = v2;
      uint64_t v4 = *(void **)(*((void *)&v32 + 1) + 8 * v2);
      id v5 = [v4 applicationIdentifier];
      long long v31 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      id v6 = [v4 subcredentials];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
LABEL_8:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(a1 + 40);
          uint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * v9) identifier];
          +[PKPassTileGroupView extractSupportedVehicleFunction:&v37 action:&v36 forTile:v10 applicationIdentifier:v5 keyIdentifier:v11];

          if (v37)
          {
            if (v36) {
              break;
            }
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
            if (v7) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      BOOL v12 = !v37 || v36 == 0;
      BOOL v13 = v12;

      if (!v13) {
        break;
      }
      uint64_t v2 = v22 + 1;
      if (v22 + 1 == v21)
      {
        uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E59DD730;
  id v26 = *(id *)(a1 + 48);
  objc_copyWeak(&v27, (id *)(a1 + 56));
  id v14 = _Block_copy(aBlock);
  id v15 = v14;
  id v16 = v37;
  if (v37 && (id v17 = v36) != 0)
  {
    id v18 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_4;
    v23[3] = &unk_1E59CA9F8;
    id v24 = v14;
    [v18 sendRKEFunction:v16 action:v17 withAuthorization:0 completion:v23];
  }
  else
  {
    (*((void (**)(void *, void))v14 + 2))(v14, 0);
  }

  objc_destroyWeak(&v27);
}

void __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_3;
  block[3] = &unk_1E59D4FD8;
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
}

void __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[513] = 0;
    uint64_t v3 = WeakRetained;
    [WeakRetained _resetToIdleState];
    id WeakRetained = v3;
  }
}

uint64_t __91__PKPassPaymentContainerView_passTileGroupView_executeSEActionForPass_tile_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dataReleaseViewController:(id)a3 didAuthorizeWithExternalAuthorizationData:(id)a4 dataToRelease:(id)a5
{
}

- (void)dataReleaseViewController:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  char v7 = [a3 presentingViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke;
  v9[3] = &unk_1E59CA870;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  [v7 dismissViewControllerAnimated:1 completion:v9];
}

void __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed data release controller", buf, 2u);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_2;
    id v5[3] = &unk_1E59CB6D8;
    void v5[4] = v3;
    [v3 _resetCardEmulationWithCompletion:v5];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_549;
    block[3] = &unk_1E59CA7D0;
    void block[4] = *(void *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

void __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_549(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F879B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F879C0];
  v7[0] = MEMORY[0x1E4F1CC28];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:v3 object:v4 userInfo:v5];
}

uint64_t __75__PKPassPaymentContainerView_dataReleaseViewController_didFinishWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetToIdleStateAfterDelay:0.3];
}

- (void)dataReleaseViewController:(id)a3 didResolveToMerchant:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __77__PKPassPaymentContainerView_dataReleaseViewController_didResolveToMerchant___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __77__PKPassPaymentContainerView_dataReleaseViewController_didResolveToMerchant___block_invoke(uint64_t a1)
{
}

- (void)compactNavigationContainerControllerReceivedExternalTap:(id)a3
{
  uint64_t v4 = [a3 presentingViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke;
  id v5[3] = &unk_1E59CA7D0;
  void v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed data release controller from external tap", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke_550;
  id v5[3] = &unk_1E59CB6D8;
  void v5[4] = v3;
  return [v3 _resetCardEmulationWithCompletion:v5];
}

uint64_t __86__PKPassPaymentContainerView_compactNavigationContainerControllerReceivedExternalTap___block_invoke_550(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetToIdleStateAfterDelay:0.3];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dckAssertion, 0);
  objc_storeStrong((id *)&self->_sessionExchangeTaskQueue, 0);
  objc_storeStrong((id *)&self->_sessionExchangeToken, 0);
  objc_storeStrong((id *)&self->_contextForCurrentTransaction, 0);
  objc_storeStrong((id *)&self->_merchantForCurrentTransaction, 0);
  objc_destroyWeak((id *)&self->_dataReleaseVC);
  objc_destroyWeak((id *)&self->_barcodeViewController);
  objc_storeStrong((id *)&self->_linkedApplicationUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_bottomTextView, 0);
  objc_storeStrong((id *)&self->_transactionForDisplayedBarcode, 0);
  objc_storeStrong((id *)&self->_transactionAwardsView, 0);
  objc_destroyWeak((id *)&self->_activeTransactionAuthenticationViewController);
  objc_storeStrong((id *)&self->_barcodeDisplayTimer, 0);
  objc_storeStrong((id *)&self->_userNotificationSupressionAssertion, 0);
  objc_storeStrong((id *)&self->_activeBarcodeCredential, 0);
  objc_storeStrong((id *)&self->_activeBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_valueAddedPasses, 0);
  objc_storeStrong((id *)&self->_pendingPresentationContextState, 0);
  objc_destroyWeak((id *)&self->_passcodeVC);
  objc_storeStrong((id *)&self->_transactionTerminalResponseTimer, 0);
  objc_storeStrong((id *)&self->_transactionResolutionTimer, 0);
  objc_storeStrong((id *)&self->_pendingGlyphStateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_authorizedExternalizedContext, 0);
  objc_storeStrong((id *)&self->_pendingPayStateTextOverride, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_valueAddedServiceInfoView, 0);
  objc_storeStrong((id *)&self->_applicationsView, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_ignoringUpdatesFromTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedSecondaryView, 0);
  objc_storeStrong((id *)&self->_displayedPrimaryView, 0);
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_tileGroupView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_dualValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_singleValueCellSecondary, 0);
  objc_storeStrong((id *)&self->_singleValueCellPrimary, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_fixedScreenCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_transactionFooterContactResolver, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_authorizationQueue, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceSession, 0);
  objc_storeStrong((id *)&self->_payStateView, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end