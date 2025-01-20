@interface WFHandleIntentAction
- (BOOL)allowsContinueInAppWhenRunningRemotely;
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (BOOL)inputPassthrough;
- (BOOL)intentDescriptorIsSyncedFromOtherDevices;
- (BOOL)intentIsHandledBySiri:(id)a3;
- (BOOL)isHandledBySiri;
- (BOOL)isProgressIndeterminate;
- (BOOL)isWorkflowInDatabase;
- (BOOL)opensInApp;
- (BOOL)parameterCombinationForIntentSupportsBackgroundExecution:(id)a3;
- (BOOL)prefersActionAttribution;
- (BOOL)requiresRemoteExecution;
- (BOOL)requiresShowsWhenRun;
- (BOOL)runInProcess;
- (BOOL)shouldDonateIntent:(id)a3;
- (BOOL)shouldForceHandleInSiri:(id)a3;
- (BOOL)shouldOpenAppThroughSiriForIntent:(id)a3 intentResponse:(id)a4;
- (BOOL)showsWhenRun;
- (BOOL)skipSiriExecution;
- (BOOL)skipsProcessingHiddenParameters;
- (INCExtensionConnection)connection;
- (INIntent)runningIntent;
- (INIntentDescription)intentDescription;
- (INIntentDescriptor)intentDescriptor;
- (INStringLocalizer)stringLocalizer;
- (NSArray)slots;
- (NSString)associatedAppBundleIdentifier;
- (NSString)overrideLocalizedName;
- (WFHandleIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFHandleIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6;
- (WFIntentExecutor)executor;
- (id)appBundleIdentifier;
- (id)appDescriptor;
- (id)appResource;
- (id)confirmationAlertForInteraction:(id)a3 completionHandler:(id)a4;
- (id)contentDestinationWithError:(id *)a3;
- (id)createResourceManager;
- (id)defaultLocalizationContext;
- (id)disabledOnPlatforms;
- (id)displayableAppDescriptor;
- (id)errorAttributedToApp:(id)a3;
- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4;
- (id)errorFromHandleResponse:(id)a3 intent:(id)a4;
- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5;
- (id)errorThatLaunchesApp:(id)a3;
- (id)executorWithIntent:(id)a3 groupIdentifier:(id)a4;
- (id)externalMetricsActionIdentifier;
- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6;
- (id)generatedIntentWithInput:(id)a3 processedParameters:(id)a4 error:(id *)a5;
- (id)localizedNameWithContext:(id)a3;
- (id)parameterForSlot:(id)a3;
- (id)rootCauseErrorFromError:(id)a3;
- (id)showsWhenRunIfApplicable;
- (id)titleForINShortcut:(id)a3;
- (id)unknownErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 userInfo:(id)a5;
- (int64_t)intentCategory;
- (unint64_t)allowsInteractiveSlotResolution;
- (void)accessBundleContentWithBlock:(id)a3;
- (void)actuallyStartExecutingIntent:(id)a3;
- (void)appInstalledResource:(id)a3 didUpdateAppDescriptor:(id)a4;
- (void)cancel;
- (void)finishRunningByContinuingInApp;
- (void)finishRunningWithError:(id)a3;
- (void)generatePopulatedIntentFromInput:(id)a3 processedParameters:(id)a4 completion:(id)a5;
- (void)generatePopulatedIntentWithIdentifier:(id)a3 fromInput:(id)a4 processedParameters:(id)a5 completion:(id)a6;
- (void)generateShortcutRepresentation:(id)a3;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
- (void)getErrorFromExtensionError:(id)a3 completionHandler:(id)a4;
- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4;
- (void)handleExecutionCompletionWithInteraction:(id)a3 error:(id)a4;
- (void)handleExecutorError:(id)a3;
- (void)handleResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5;
- (void)initializeParameters;
- (void)intentExecutor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4;
- (void)intentExecutor:(id)a3 showConfirmationForInteraction:(id)a4 confirmationRequired:(BOOL)a5 authenticationRequired:(BOOL)a6 completionHandler:(id)a7;
- (void)intentExecutor:(id)a3 showConfirmationForSlot:(id)a4 item:(id)a5 intent:(id)a6 completion:(id)a7;
- (void)launchAppInBackground:(BOOL)a3;
- (void)localizedConfirmationPromptForAttribute:(id)a3 intent:(id)a4 completion:(id)a5;
- (void)localizedDisambiguationPromptForAttribute:(id)a3 intent:(id)a4 disambiguationItems:(id)a5 completion:(id)a6;
- (void)populateIntent:(id)a3 withInput:(id)a4 processedParameters:(id)a5 completionHandler:(id)a6;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setAppResource:(id)a3;
- (void)setExecutor:(id)a3;
- (void)setIntentDescriptor:(id)a3;
- (void)setOverrideLocalizedName:(id)a3;
- (void)showAskForValueAndRetryForSlot:(id)a3 onIntent:(id)a4;
- (void)showConfirmationAndRetryForSlot:(id)a3 item:(id)a4 onIntent:(id)a5 completionHandler:(id)a6;
- (void)showDisambiguationAndRetryForSlot:(id)a3 items:(id)a4 onIntent:(id)a5;
- (void)showInteractionIfNeeded:(id)a3 inUserInterface:(id)a4 requiringConfirmation:(BOOL)a5 requiringAuthentication:(BOOL)a6 executionStage:(int64_t)a7 completionHandler:(id)a8;
- (void)startExecutingIntent:(id)a3;
- (void)updateAppDescriptorInDatabaseWithSelectedApp:(id)a3;
- (void)updateAppDescriptorWithSelectedApp:(id)a3;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFHandleIntentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_overrideLocalizedName, 0);
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_runningIntent, 0);
  objc_storeStrong((id *)&self->_appResource, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
}

- (WFIntentExecutor)executor
{
  return self->_executor;
}

- (void)setOverrideLocalizedName:(id)a3
{
}

- (NSString)overrideLocalizedName
{
  return self->_overrideLocalizedName;
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (INIntent)runningIntent
{
  return self->_runningIntent;
}

- (void)setAppResource:(id)a3
{
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"Connection"];

  v6 = [v5 appProxy];
  [v6 launchAppInBackground:0 completionHandler:&__block_literal_global_5159];

  BOOL v7 = v5 != 0;
  return v7;
}

- (void)intentExecutor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
}

- (void)intentExecutor:(id)a3 showConfirmationForSlot:(id)a4 item:(id)a5 intent:(id)a6 completion:(id)a7
{
}

- (void)intentExecutor:(id)a3 showConfirmationForInteraction:(id)a4 confirmationRequired:(BOOL)a5 authenticationRequired:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = [(WFAction *)self userInterface];
  [(WFHandleIntentAction *)self showInteractionIfNeeded:v12 inUserInterface:v13 requiringConfirmation:v8 requiringAuthentication:v7 executionStage:0 completionHandler:v11];
}

- (id)rootCauseErrorFromError:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v6)
  {
    id v7 = [(WFHandleIntentAction *)self rootCauseErrorFromError:v6];
  }
  else
  {
    id v7 = v4;
  }
  BOOL v8 = v7;

  return v8;
}

- (void)handleExecutorError:(id)a3
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(WFHandleIntentAction *)self errorAttributedToApp:a3];
  v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"WFIntentExecutorErrorDomain"];

  if (!v6)
  {
    v10 = [v4 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F626B8]];

    if (!v11)
    {
LABEL_39:
      [(WFHandleIntentAction *)self finishRunningWithError:v4];
      goto LABEL_40;
    }
    id v12 = (void *)MEMORY[0x1E4F223F8];
    id v13 = [(WFHandleIntentAction *)self executor];
    v14 = [v13 intent];
    v15 = objc_msgSend(v14, "_intents_bundleIdForDisplay");
    v16 = [v12 bundleRecordWithBundleIdentifier:v15 allowPlaceholder:0 error:0];

    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v16 localizedName];
        BOOL v18 = [v17 length] != 0;
      }
      else
      {
        BOOL v18 = 0;
        v17 = v16;
        v16 = 0;
      }
    }
    else
    {
      v17 = 0;
      BOOL v18 = 0;
    }

    v28 = NSString;
    v29 = WFLocalizedString(@"Couldn’t Run “%@”");
    v30 = [(WFAction *)self localizedName];
    v31 = objc_msgSend(v28, "stringWithFormat:", v29, v30);

    v32 = NSString;
    if (v18)
    {
      v33 = WFLocalizedString(@"“%1$@” could not open “%2$@” because an unknown error occurred.");
      v34 = [(WFAction *)self localizedName];
      v35 = [v16 localizedName];
      v36 = objc_msgSend(v32, "localizedStringWithFormat:", v33, v34, v35);
    }
    else
    {
      v33 = WFLocalizedString(@"“%@” could not open the app because an unknown error occurred.");
      v34 = [(WFAction *)self localizedName];
      v36 = objc_msgSend(v32, "localizedStringWithFormat:", v33, v34);
    }

    v37 = [(WFHandleIntentAction *)self rootCauseErrorFromError:v4];
    v38 = [v37 domain];
    if ([v38 isEqualToString:*MEMORY[0x1E4F625D0]])
    {
      uint64_t v39 = [v37 code];

      if (v39 != 7)
      {
LABEL_38:
        v61 = (void *)MEMORY[0x1E4F28C58];
        v62 = [v4 domain];
        uint64_t v63 = [v4 code];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        v71[0] = *MEMORY[0x1E4F28588];
        v71[1] = v64;
        v72[0] = v31;
        v72[1] = v36;
        v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
        uint64_t v66 = [v61 errorWithDomain:v62 code:v63 userInfo:v65];

        id v4 = (void *)v66;
        goto LABEL_39;
      }
      v40 = [MEMORY[0x1E4FB46B8] currentDevice];
      v38 = [v40 localizedModel];

      v41 = NSString;
      if (v18)
      {
        uint64_t v69 = WFLocalizedString(@"“%1$@” could not open “%2$@” because the %3$@ is locked.");
        v42 = [(WFAction *)self localizedName];
        uint64_t v43 = [v16 localizedName];
        uint64_t v44 = objc_msgSend(v41, "localizedStringWithFormat:", v69, v42, v43, v38);

        v36 = (void *)v43;
        v45 = (void *)v69;
      }
      else
      {
        v45 = WFLocalizedString(@"“%1$@” could not open the app because the %2$@ is locked.");
        v42 = [(WFAction *)self localizedName];
        uint64_t v44 = objc_msgSend(v41, "stringWithFormat:", v45, v42, v38);
      }

      v36 = (void *)v44;
    }

    goto LABEL_38;
  }
  switch([v4 code])
  {
    case 'd':
      v19 = [v4 userInfo];
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      id v7 = [v19 objectForKey:*MEMORY[0x1E4F28A50]];

      v21 = [v7 domain];
      uint64_t v22 = *MEMORY[0x1E4F300C0];
      if ([v21 isEqualToString:*MEMORY[0x1E4F300C0]])
      {
        uint64_t v23 = [v7 code];

        if (v23 == 3001)
        {
          [(WFHandleIntentAction *)self finishRunningByContinuingInApp];
          goto LABEL_21;
        }
      }
      else
      {
      }
      v46 = [v7 domain];
      if (![v46 isEqualToString:v22])
      {

        goto LABEL_42;
      }
      uint64_t v47 = [v7 code];

      if (v47 != 3006)
      {
LABEL_42:
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __44__WFHandleIntentAction_handleExecutorError___block_invoke;
        v70[3] = &unk_1E6557668;
        v70[4] = self;
        [(WFHandleIntentAction *)self getErrorFromExtensionError:v4 completionHandler:v70];
        goto LABEL_21;
      }
      BOOL v8 = objc_opt_new();
      v48 = NSString;
      v49 = WFLocalizedString(@"Could not run %@");
      v50 = [(WFAction *)self localizedName];
      v51 = objc_msgSend(v48, "localizedStringWithFormat:", v49, v50);
      [v8 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      [v8 setObject:v7 forKeyedSubscript:v20];
      v52 = [(WFHandleIntentAction *)self appDescriptor];
      v53 = [v52 localizedName];
      uint64_t v54 = [v53 length];

      v55 = NSString;
      if (v54)
      {
        v56 = WFLocalizedString(@"The action “%1$@” could not run. Open %2$@ to continue.");
        v57 = [(WFAction *)self localizedName];
        v58 = [(WFHandleIntentAction *)self appDescriptor];
        v59 = [v58 localizedName];
        v60 = objc_msgSend(v55, "localizedStringWithFormat:", v56, v57, v59);
        [v8 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      else
      {
        v56 = WFLocalizedString(@"The action “%@” could not run. Open the app to continue.");
        v57 = [(WFAction *)self localizedName];
        v58 = objc_msgSend(v55, "localizedStringWithFormat:", v56, v57);
        [v8 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }

      v67 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFIntentExecutorErrorDomain" code:100 userInfo:v8];
      v68 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v67];

      [(WFHandleIntentAction *)self finishRunningWithError:v68];
LABEL_20:

LABEL_21:
LABEL_40:

      return;
    case 'e':
      id v7 = [v4 userInfo];
      BOOL v8 = [v7 objectForKey:@"WFIntentExecutorSlotResolutionResultErrorKey"];
      v9 = [v7 objectForKey:@"WFIntentExecutorSlotDescriptionErrorKey"];
      v24 = [v7 objectForKey:@"WFIntentExecutorIntentErrorKey"];
      [(WFHandleIntentAction *)self handleResolutionResult:v8 forSlot:v9 onIntent:v24];
      goto LABEL_19;
    case 'f':
    case 'g':
      id v7 = [v4 userInfo];
      BOOL v8 = [v7 objectForKey:@"WFIntentExecutorIntentErrorKey"];
      v9 = [v7 objectForKey:@"WFIntentExecutorIntentResponseErrorKey"];
      if ([v4 code] == 102) {
        [(WFHandleIntentAction *)self errorFromConfirmResponse:v9 intent:v8];
      }
      else {
      v24 = [(WFHandleIntentAction *)self errorFromHandleResponse:v9 intent:v8];
      }
      if ([v9 _intentResponseCode] == 6)
      {
        uint64_t v27 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v24];

        v24 = (void *)v27;
      }
      [(WFHandleIntentAction *)self finishRunningWithError:v24];
LABEL_19:

      goto LABEL_20;
    case 'h':
      v25 = [v4 userInfo];
      v26 = [v25 objectForKey:@"WFIntentExecutorIntentErrorKey"];

      [(WFHandleIntentAction *)self startExecutingIntent:v26];
      goto LABEL_40;
    default:
      goto LABEL_39;
  }
}

uint64_t __44__WFHandleIntentAction_handleExecutorError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)getErrorFromExtensionError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 userInfo];
  BOOL v8 = [v7 objectForKey:*MEMORY[0x1E4F28A50]];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke;
  aBlock[3] = &unk_1E65572F0;
  aBlock[4] = self;
  id v9 = v8;
  id v24 = v9;
  id v10 = v6;
  id v25 = v10;
  int v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v12 = [v9 code];
  switch(v12)
  {
    case 1300:
    case 1303:
    case 1306:
    case 1311:
    case 1312:
    case 1313:
    case 1316:
    case 1317:
    case 1318:
      goto LABEL_10;
    case 1301:
    case 1302:
      id v13 = @"There was a problem communicating with the app.";
      goto LABEL_8;
    case 1304:
    case 1307:
    case 1314:
      id v13 = @"The operation took too long to complete. Please try again.";
      goto LABEL_8;
    case 1305:
    case 1308:
    case 1309:
      id v13 = @"There was a problem opening the app.";
      goto LABEL_8;
    case 1310:
      id v13 = @"There was a problem opening the app. Please unlock the device and try again.";
      goto LABEL_8;
    case 1315:
      v15 = [(WFHandleIntentAction *)self appDescriptor];
      v14 = [v15 localizedName];

      if ([v14 length])
      {
        v16 = NSString;
        WFLocalizedString(@"This action requires %@ to be installed.");
        v17 = (WFiTunesSessionManager *)objc_claimAutoreleasedReturnValue();
        BOOL v18 = objc_msgSend(v16, "stringWithFormat:", v17, v14);
        v11[2](v11, v18);
      }
      else
      {
        v17 = objc_alloc_init(WFiTunesSessionManager);
        BOOL v18 = [(WFHandleIntentAction *)self appDescriptor];
        v19 = [v18 bundleIdentifier];
        uint64_t v20 = [MEMORY[0x1E4F1CA20] currentLocale];
        v21 = [v20 countryCode];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke_2;
        v22[3] = &unk_1E65586C8;
        v22[4] = v11;
        [(WFiTunesSessionManager *)v17 lookupMediaWithBundleIdentifier:v19 countryCode:v21 completion:v22];
      }
      goto LABEL_9;
    default:
      if ((unint64_t)(v12 - 1399) < 2) {
        goto LABEL_10;
      }
      id v13 = @"There was a problem with the app.";
LABEL_8:
      v14 = WFLocalizedString(v13);
      v11[2](v11, v14);
LABEL_9:

LABEL_10:
      return;
  }
}

void __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = (id)objc_opt_new();
  id v4 = NSString;
  v5 = WFLocalizedString(@"Could not run %@");
  id v6 = [*(id *)(a1 + 32) localizedName];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  [v10 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  [v10 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFIntentExecutorErrorDomain" code:100 userInfo:v10];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void __69__WFHandleIntentAction_getErrorFromExtensionError_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v11 = v4;

  v5 = [v11 name];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = NSString;
    uint64_t v8 = WFLocalizedString(@"This action requires %@ to be installed.");
    id v9 = [v11 name];
    id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
  }
  else
  {
    id v10 = WFLocalizedString(@"This action requires an app to be installed.");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)errorThatLaunchesApp:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = NSString;
    id v5 = a3;
    uint64_t v6 = WFLocalizedString(@"Open %@");
    id v7 = [(WFHandleIntentAction *)self appDescriptor];
    uint64_t v8 = [v7 localizedName];
    id v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8);

    id v10 = [v5 userInfo];
    id v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [(WFHandleIntentAction *)self executor];
    id v13 = [v12 connection];
    [v11 setObject:v13 forKeyedSubscript:@"Connection"];

    [v11 setObject:&unk_1F2316608 forKeyedSubscript:*MEMORY[0x1E4F5ABA0]];
    v14 = WFLocalizedString(@"Cancel");
    v21[0] = v14;
    v21[1] = v9;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28590]];

    [v11 setObject:self forKeyedSubscript:*MEMORY[0x1E4F288B8]];
    v16 = (void *)MEMORY[0x1E4F28C58];
    v17 = [v5 domain];
    uint64_t v18 = [v5 code];

    v19 = [v16 errorWithDomain:v17 code:v18 userInfo:v11];
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)errorAttributedToApp:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 userInfo];
    uint64_t v6 = (void *)[v5 mutableCopy];

    id v7 = [(WFHandleIntentAction *)self appDescriptor];
    uint64_t v8 = [v7 localizedName];
    [v6 setObject:v8 forKeyedSubscript:@"ApplicationName"];

    id v9 = (void *)MEMORY[0x1E4F28C58];
    id v10 = [v4 domain];
    uint64_t v11 = [v4 code];

    uint64_t v12 = [v9 errorWithDomain:v10 code:v11 userInfo:v6];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 _isSuccess])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__5186;
    id v24 = __Block_byref_object_dispose__5187;
    id v25 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __55__WFHandleIntentAction_errorFromHandleResponse_intent___block_invoke;
    v16 = &unk_1E6558270;
    v19 = &v20;
    id v9 = v6;
    id v17 = v9;
    uint64_t v18 = self;
    [(WFHandleIntentAction *)self accessBundleContentWithBlock:&v13];
    uint64_t v10 = v21[5];
    v26[0] = @"WFIntentExecutorIntentErrorKey";
    v26[1] = @"WFIntentExecutorIntentResponseErrorKey";
    v27[0] = v7;
    v27[1] = v9;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 2, v13, v14, v15, v16);
    uint64_t v8 = [(WFHandleIntentAction *)self unknownErrorWithCode:103 localizedDescription:v10 userInfo:v11];

    _Block_object_dispose(&v20, 8);
  }

  return v8;
}

void __55__WFHandleIntentAction_errorFromHandleResponse_intent___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) stringLocalizer];
  uint64_t v3 = [v2 _renderedResponseWithLocalizer:v6 requiresSiriCompatibility:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"WFIntentExecutorIntentErrorKey";
  v12[1] = @"WFIntentExecutorIntentResponseErrorKey";
  v13[0] = a4;
  v13[1] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v10 = [(WFHandleIntentAction *)self unknownErrorWithCode:102 localizedDescription:0 userInfo:v9];

  return v10;
}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WFHandleIntentAction *)self parameterForSlot:v9];
  if (v11 && [v8 resolutionResultCode] == 1)
  {
    uint64_t v12 = [v10 _codableDescription];
    uint64_t v13 = objc_msgSend(v9, "wf_slotName");
    v31 = [v12 attributeByName:v13];

    uint64_t v14 = objc_msgSend(v31, "unsupportedReasonWithIndex:", objc_msgSend(v8, "unsupportedReason"));
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__5186;
    v41 = __Block_byref_object_dispose__5187;
    id v42 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__WFHandleIntentAction_errorFromResolutionResult_forSlot_onIntent___block_invoke;
    v32[3] = &unk_1E654DC10;
    v36 = &v37;
    id v15 = v14;
    id v33 = v15;
    id v34 = v10;
    v35 = self;
    [(WFHandleIntentAction *)self accessBundleContentWithBlock:v32];
    v16 = NSString;
    id v17 = WFLocalizedString(@"Invalid %@");
    uint64_t v18 = [v11 localizedLabel];
    v19 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v18, 0);

    uint64_t v20 = (void *)v38[5];
    if (v20)
    {
      id v21 = v20;
    }
    else
    {
      uint64_t v23 = NSString;
      id v24 = WFLocalizedString(@"The value provided for %1$@ in %2$@ was invalid.");
      id v25 = [v11 localizedLabel];
      v26 = [(WFAction *)self localizedName];
      objc_msgSend(v23, "localizedStringWithFormat:", v24, v25, v26, 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28588];
    v43[0] = *MEMORY[0x1E4F28568];
    v43[1] = v28;
    v44[0] = v21;
    v44[1] = v19;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
    uint64_t v22 = [v27 errorWithDomain:@"WFIntentExecutorErrorDomain" code:101 userInfo:v29];

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

void __67__WFHandleIntentAction_errorFromResolutionResult_forSlot_onIntent___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) stringLocalizer];
  uint64_t v4 = [v2 localizedDialogWithIntent:v3 tokens:MEMORY[0x1E4F1CC08] localizer:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)showConfirmationAndRetryForSlot:(id)a3 item:(id)a4 onIntent:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
  id v15 = [v12 _codableDescription];
  v16 = objc_msgSend(v10, "wf_slotName");
  id v17 = [v15 attributeByName:v16];

  uint64_t v18 = [v17 metadata];
  v19 = objc_msgSend(v10, "wf_slotName");
  uint64_t v20 = [(WFAction *)self parameterStateForKey:v19];
  objc_msgSend(v18, "wf_updateWithParameterState:", v20);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke;
  void v27[3] = &unk_1E654DBE8;
  v27[4] = self;
  id v28 = v17;
  id v29 = v12;
  id v30 = v14;
  id v32 = v10;
  id v33 = v13;
  id v31 = v11;
  id v21 = v10;
  id v22 = v13;
  id v23 = v11;
  id v24 = v14;
  id v25 = v12;
  id v26 = v17;
  objc_msgSend(v23, "wf_transformValueForCodableAttribute:completionHandler:", v26, v27);
}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_2;
  v5[3] = &unk_1E654DBC0;
  v5[4] = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 80);
  id v9 = *(id *)(a1 + 72);
  [v2 localizedConfirmationPromptForAttribute:v3 intent:v4 completion:v5];
}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [a1[4] finishRunningWithError:a3];
  }
  else
  {
    id v6 = a1[6];
    id v7 = [a1[4] stringLocalizer];
    id v8 = [v6 localizedDisplayNameWithLocalizer:v7];
    [a1[5] setTitle:v8];

    [a1[5] setMessage:v5];
    id v9 = [a1[6] metadata];
    objc_msgSend(v9, "wf_updateWithParameterValue:", a1[7]);

    id v10 = a1[5];
    id v11 = (void *)MEMORY[0x1E4F5AA08];
    id v12 = WFLocalizedString(@"No");
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_3;
    v26[3] = &unk_1E6558678;
    id v27 = a1[9];
    id v13 = [v11 buttonWithTitle:v12 subtitle:0 selected:0 style:0 handler:v26];
    [v10 addButton:v13];

    id v14 = a1[5];
    id v15 = (void *)MEMORY[0x1E4F5AA08];
    v16 = WFLocalizedString(@"Yes");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_4;
    v22[3] = &unk_1E6557D28;
    id v23 = a1[8];
    id v24 = a1[7];
    id v25 = a1[9];
    id v17 = [v15 buttonWithTitle:v16 subtitle:0 selected:0 style:0 handler:v22];
    [v14 addButton:v17];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_5;
    void v21[3] = &unk_1E6558B28;
    id v18 = a1[5];
    v21[4] = a1[4];
    v19 = [MEMORY[0x1E4F5A770] cancelButtonWithHandler:v21];
    [v18 addButton:v19];

    uint64_t v20 = [a1[4] userInterface];
    [v20 presentAlert:a1[5]];
  }
}

uint64_t __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_4(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(*(id *)(a1 + 32), "wf_multipleValues"))
  {
    v4[0] = *(void *)(a1 + 40);
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    id v2 = *(id *)(a1 + 40);
  }
  uint64_t v3 = v2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __88__WFHandleIntentAction_showConfirmationAndRetryForSlot_item_onIntent_completionHandler___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  [v1 finishRunningWithError:v2];
}

- (void)localizedConfirmationPromptForAttribute:(id)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 promptDialogWithType:5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__WFHandleIntentAction_localizedConfirmationPromptForAttribute_intent_completion___block_invoke;
  v14[3] = &unk_1E65586A0;
  id v15 = v10;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  [(WFHandleIntentAction *)self accessBundleContentWithBlock:v14];
}

void __82__WFHandleIntentAction_localizedConfirmationPromptForAttribute_intent_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = [*(id *)(a1 + 48) stringLocalizer];
  uint64_t v4 = [v1 localizedDialogWithIntent:v2 tokens:0 localizer:v5];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

- (void)showDisambiguationAndRetryForSlot:(id)a3 items:(id)a4 onIntent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:1];
  id v12 = [v10 _codableDescription];
  id v13 = objc_msgSend(v8, "wf_slotName");
  id v14 = [v12 attributeByName:v13];

  id v15 = [v14 metadata];
  id v16 = objc_msgSend(v8, "wf_slotName");
  id v17 = [(WFAction *)self parameterStateForKey:v16];
  objc_msgSend(v15, "wf_updateWithParameterState:", v17);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke;
  v23[3] = &unk_1E654DB98;
  v23[4] = self;
  id v24 = v14;
  id v25 = v10;
  id v26 = v11;
  id v27 = v9;
  id v28 = v8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v22 = v14;
  objc_msgSend(v19, "wf_transformValueForCodableAttribute:completionHandler:", v22, v23);
}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_2;
  v7[3] = &unk_1E654DB70;
  v7[4] = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 48);
  [v4 localizedDisambiguationPromptForAttribute:v5 intent:v6 disambiguationItems:a2 completion:v7];
}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    [a1[4] finishRunningWithError:a3];
  }
  else
  {
    if ([v5 length])
    {
      [a1[5] setTitle:v6];
    }
    else
    {
      id v7 = [a1[4] localizedDefaultDisambiguationPrompt];
      [a1[5] setTitle:v7];
    }
    id v28 = v6;
    id v8 = [a1[4] stringLocalizer];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = a1[6];
    uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v30 = *(void *)v38;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
          id v13 = [a1[7] metadata];
          objc_msgSend(v13, "wf_updateWithParameterValue:", v12);

          id v14 = [a1[7] metadata];
          id v15 = objc_msgSend(v12, "_intents_readableTitleWithLocalizer:metadata:", v8, v14);

          id v16 = [a1[7] metadata];
          id v17 = objc_msgSend(v12, "_intents_readableSubtitleWithLocalizer:metadata:", v8, v16);

          id v18 = objc_msgSend(v12, "_intents_displayImageWithLocalizer:", v8);
          id v19 = a1[5];
          id v20 = (void *)MEMORY[0x1E4F5AA08];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_3;
          v32[3] = &unk_1E6558910;
          id v33 = a1[8];
          id v34 = v12;
          id v21 = a1[9];
          id v22 = a1[4];
          id v35 = v21;
          id v36 = v22;
          id v23 = objc_msgSend(v18, "wf_image");
          id v24 = [v20 buttonWithTitle:v15 subtitle:v17 selected:0 stickySelection:0 style:0 handler:v32 image:v23];
          [v19 addButton:v24];

          ++v11;
        }
        while (v10 != v11);
        uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v10);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_4;
    v31[3] = &unk_1E6558B28;
    id v25 = a1[5];
    v31[4] = a1[4];
    id v26 = [MEMORY[0x1E4F5A770] cancelButtonWithHandler:v31];
    [v25 addButton:v26];

    id v27 = [a1[4] userInterface];
    [v27 presentAlert:a1[5]];

    uint64_t v6 = v28;
  }
}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_3(id *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1[4], "wf_multipleValues"))
  {
    v6[0] = a1[5];
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v2 = a1[5];
  }
  uint64_t v3 = v2;
  uint64_t v4 = (void *)[a1[6] copy];
  id v5 = objc_msgSend(a1[4], "wf_slotName");
  [v4 setValue:v3 forKey:v5];

  [a1[7] startExecutingIntent:v4];
}

void __73__WFHandleIntentAction_showDisambiguationAndRetryForSlot_items_onIntent___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  [v1 finishRunningWithError:v2];
}

- (void)localizedDisambiguationPromptForAttribute:(id)a3 intent:(id)a4 disambiguationItems:(id)a5 completion:(id)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v13 promptDialogWithType:2];
  id v15 = [v13 promptDialogWithType:4];

  id v32 = @"count";
  id v16 = NSNumber;
  uint64_t v17 = [v12 count];

  id v18 = [v16 numberWithUnsignedInteger:v17];
  v33[0] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __104__WFHandleIntentAction_localizedDisambiguationPromptForAttribute_intent_disambiguationItems_completion___block_invoke;
  v25[3] = &unk_1E6552B60;
  id v26 = v14;
  id v27 = v10;
  id v28 = v19;
  id v29 = self;
  id v30 = v15;
  id v31 = v11;
  id v20 = v11;
  id v21 = v15;
  id v22 = v19;
  id v23 = v10;
  id v24 = v14;
  [(WFHandleIntentAction *)self accessBundleContentWithBlock:v25];
}

void __104__WFHandleIntentAction_localizedDisambiguationPromptForAttribute_intent_disambiguationItems_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) stringLocalizer];
  id v13 = [v2 localizedDialogWithIntent:v3 tokens:v4 localizer:v5];

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(a1 + 64);
  uint64_t v9 = [*(id *)(a1 + 56) stringLocalizer];
  id v10 = [v8 localizedDialogWithIntent:v6 tokens:v7 localizer:v9];

  if ([v13 length] && objc_msgSend(v10, "length"))
  {
    id v11 = [NSString stringWithFormat:@"%@ %@", v13, v10];
LABEL_8:
    id v12 = v11;
    goto LABEL_9;
  }
  if ([v13 length])
  {
    id v11 = v13;
    goto LABEL_8;
  }
  if ([v10 length])
  {
    id v11 = v10;
    goto LABEL_8;
  }
  id v12 = 0;
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)showAskForValueAndRetryForSlot:(id)a3 onIntent:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(WFHandleIntentAction *)self parameterForSlot:v7];
  id v10 = v7;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v10 codableAttribute];
      id v12 = [v11 promptDialogs];
      uint64_t v4 = (void *)[v12 count];

      id v13 = v10;
      if (!v4) {
        goto LABEL_10;
      }
      id v14 = [v10 codableAttribute];
      id v15 = [v14 promptDialogWithType:0];

      id v16 = [v15 localizedDialogWithIntent:v8 tokens:0];
      if ([v16 length]) {
        [v9 setLocalizedPrompt:v16];
      }

      id v13 = v10;
    }
    else
    {
      id v13 = 0;
      id v15 = v10;
    }
  }
  else
  {
    id v15 = 0;
    id v13 = 0;
  }

LABEL_10:
  uint64_t v17 = [(WFAction *)self runningDelegate];
  char v18 = [v17 action:self canProvideInputForParameter:v9];

  if (v18)
  {
    if (v9)
    {
      id v31 = v8;
      id v19 = [(WFAction *)self processedParameters];
      id v20 = (void *)[v19 mutableCopy];

      id v21 = [v9 key];
      [v20 setObject:0 forKeyedSubscript:v21];

      [(WFAction *)self setProcessedParameters:v20];
      id v22 = [v9 key];
      id v23 = [(WFAction *)self parameterStateForKey:v22];

      id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObject:v9];
      if (v23)
      {
        uint64_t v4 = [v9 key];
        id v36 = v4;
        long long v37 = v23;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      }
      else
      {
        id v25 = (void *)MEMORY[0x1E4F1CC08];
      }
      id v29 = [(WFAction *)self input];
      id v30 = dispatch_get_global_queue(0, 0);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke;
      v32[3] = &unk_1E654DB48;
      void v32[4] = self;
      id v33 = v31;
      id v34 = v10;
      id v35 = v9;
      [(WFAction *)self askForValuesOfParameters:v24 withDefaultStates:v25 prompts:MEMORY[0x1E4F1CC08] input:v29 workQueue:v30 completionHandler:v32];

      if (v23)
      {
      }
      id v8 = v31;
    }
    else
    {
      id v27 = getWFIntentExecutionLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        id v28 = objc_msgSend(v10, "wf_slotName");
        *(_DWORD *)buf = 136315650;
        long long v39 = "-[WFHandleIntentAction showAskForValueAndRetryForSlot:onIntent:]";
        __int16 v40 = 2114;
        v41 = v28;
        __int16 v42 = 2114;
        id v43 = v10;
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s No parameter found for slot description (slotName: %{public}@): %{public}@. Opening in app to continue.", buf, 0x20u);
      }
      [(WFHandleIntentAction *)self finishRunningByContinuingInApp];
    }
  }
  else
  {
    id v26 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [(WFHandleIntentAction *)self finishRunningWithError:v26];
  }
}

void __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    [a1[4] finishRunningWithError:a4];
  }
  else
  {
    uint64_t v9 = [a1[5] _codableDescription];
    id v10 = objc_msgSend(a1[6], "wf_slotName");
    id v11 = [v9 attributeByName:v10];

    id v12 = [a1[7] key];
    id v13 = [v7 objectForKeyedSubscript:v12];

    id v14 = a1[4];
    id v15 = a1[7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke_2;
    v16[3] = &unk_1E654DB20;
    v16[4] = v14;
    id v17 = a1[5];
    id v18 = a1[6];
    [v14 resolveSlot:v11 withProcessedValue:v13 parameter:v15 input:v8 completion:v16];
  }
}

void __64__WFHandleIntentAction_showAskForValueAndRetryForSlot_onIntent___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    [a1[4] finishRunningWithError:a3];
  }
  else
  {
    id v5 = (void *)[a1[5] copy];
    uint64_t v6 = objc_msgSend(a1[6], "wf_slotName");
    [v5 setValue:v7 forKey:v6];

    [a1[4] startExecutingIntent:v5];
  }
}

- (void)handleResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(WFHandleIntentAction *)self allowsInteractiveSlotResolution];
  if (v11 == 2)
  {
    id v12 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    goto LABEL_5;
  }
  if (v11)
  {
    uint64_t v13 = [v8 resolutionResultCode];
    if (v13 == 4)
    {
      [(WFHandleIntentAction *)self showAskForValueAndRetryForSlot:v9 onIntent:v10];
      goto LABEL_7;
    }
    if (v13 == 2)
    {
      id v12 = [v8 disambiguationItems];
      [(WFHandleIntentAction *)self showDisambiguationAndRetryForSlot:v9 items:v12 onIntent:v10];
      goto LABEL_6;
    }
    id v12 = [(WFHandleIntentAction *)self errorFromResolutionResult:v8 forSlot:v9 onIntent:v10];
    if (!v12)
    {
      id v15 = @"WFIntentExecutorIntentErrorKey";
      v16[0] = v10;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v12 = [(WFHandleIntentAction *)self unknownErrorWithCode:101 localizedDescription:0 userInfo:v14];
    }
LABEL_5:
    [(WFHandleIntentAction *)self finishRunningWithError:v12];
LABEL_6:

    goto LABEL_7;
  }
  [(WFHandleIntentAction *)self finishRunningByContinuingInApp];
LABEL_7:
}

- (id)unknownErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 userInfo:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = NSString;
  unint64_t v11 = WFLocalizedString(@"Could Not Run %@");
  id v12 = [(WFAction *)self localizedName];
  uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, 0);

  if (!v8)
  {
    WFLocalizedString(@"An unknown error occurred.");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = (void *)[v9 mutableCopy];
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_opt_new();
  }
  id v17 = v16;

  uint64_t v18 = *MEMORY[0x1E4F28568];
  v22[0] = *MEMORY[0x1E4F28588];
  v22[1] = v18;
  v23[0] = v13;
  v23[1] = v8;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v17 addEntriesFromDictionary:v19];

  id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFIntentExecutorErrorDomain" code:a3 userInfo:v17];

  return v20;
}

- (id)confirmationAlertForInteraction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 intent];
  id v9 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
  id v10 = [v6 intentResponse];

  if (v10)
  {
    unint64_t v11 = [v6 intentResponse];
    id v12 = [(WFHandleIntentAction *)self stringLocalizer];
    uint64_t v13 = [v11 _renderedResponseWithLocalizer:v12 requiresSiriCompatibility:0];
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (![v13 length])
  {
    uint64_t v14 = [v8 _subtitle];

    uint64_t v13 = (void *)v14;
  }
  id v15 = [v8 _title];
  [v9 setTitle:v15];

  [v9 setMessage:v13];
  id v16 = (void *)MEMORY[0x1E4F5A770];
  id v17 = [v8 _localizedVerb];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke;
  v29[3] = &unk_1E6558678;
  id v18 = v7;
  id v30 = v18;
  id v19 = [v16 buttonWithTitle:v17 style:0 handler:v29];
  [v9 addButton:v19];

  id v20 = (void *)MEMORY[0x1E4F5A770];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke_2;
  id v27 = &unk_1E6558678;
  id v28 = v18;
  id v21 = v18;
  id v22 = [v20 cancelButtonWithHandler:&v24];
  objc_msgSend(v9, "addButton:", v22, v24, v25, v26, v27);

  return v9;
}

uint64_t __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__WFHandleIntentAction_confirmationAlertForInteraction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)showInteractionIfNeeded:(id)a3 inUserInterface:(id)a4 requiringConfirmation:(BOOL)a5 requiringAuthentication:(BOOL)a6 executionStage:(int64_t)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = (void (**)(id, uint64_t, void))a8;
  int v17 = VCIsDeviceLocked();
  if (objc_opt_respondsToSelector()) {
    int v18 = [v15 requestedFromAnotherDevice];
  }
  else {
    int v18 = 0;
  }
  if (![(WFHandleIntentAction *)self showsWhenRun] && (!v10 || (v17 & 1) == 0))
  {
LABEL_14:
    v16[2](v16, 1, 0);
    goto LABEL_28;
  }
  if (a7 == 1)
  {
    if (!v18)
    {
      if (objc_opt_respondsToSelector())
      {
        id v26 = [v14 intentResponse];
        id v27 = [(WFHandleIntentAction *)self stringLocalizer];
        id v28 = [v26 _renderedResponseWithLocalizer:v27 requiresSiriCompatibility:0];

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_4;
        v32[3] = &unk_1E654E910;
        void v32[4] = self;
        id v33 = v16;
        [v15 showHandleInteraction:v14 prompt:v28 completionHandler:v32];

        goto LABEL_28;
      }
      if ([(WFHandleIntentAction *)self showsWhenRun])
      {
        id v29 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
        [(WFHandleIntentAction *)self finishRunningWithError:v29];

        goto LABEL_28;
      }
    }
    goto LABEL_14;
  }
  if (!a7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke;
    aBlock[3] = &unk_1E654DAD0;
    aBlock[4] = self;
    id v31 = _Block_copy(aBlock);
    id v19 = [v14 intentResponse];
    id v20 = [(WFHandleIntentAction *)self stringLocalizer];
    uint64_t v30 = [v19 _renderedResponseWithLocalizer:v20 requiresSiriCompatibility:0];

    id v21 = v15;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v22 = v11 && [(WFHandleIntentAction *)self showsWhenRun];
      uint64_t v25 = (void *)v30;
      id v23 = v31;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_2;
      v37[3] = &unk_1E654DAF8;
      id v38 = v31;
      long long v39 = v16;
      [v21 showConfirmInteraction:v14 requireAuthentication:v10 requireConfirmation:v22 completionHandler:v37];
    }
    else
    {

      if ((v11 | v17))
      {
        id v23 = v31;
        if (v18 & 1 | ((objc_opt_respondsToSelector() & 1) == 0))
        {
          uint64_t v24 = [(WFHandleIntentAction *)self confirmationAlertForInteraction:v14 completionHandler:v16];
          [v21 presentAlert:v24];
          uint64_t v25 = (void *)v30;
        }
        else
        {
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_3;
          v34[3] = &unk_1E654DAF8;
          id v35 = v31;
          id v36 = v16;
          uint64_t v25 = (void *)v30;
          [v21 showConfirmInteraction:v14 prompt:v30 requireAuthentication:v10 completionHandler:v34];

          uint64_t v24 = v35;
        }
      }
      else
      {
        v16[2](v16, 1, 0);
        uint64_t v25 = (void *)v30;
        id v23 = v31;
      }
    }
  }
LABEL_28:
}

void __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  switch(a2)
  {
    case 0:
      id v6 = [MEMORY[0x1E4F28C58] userCancelledError];
      v9[2](v9, 0, v6);

      goto LABEL_6;
    case 1:
      v5[2](v5, 1, 0);
      goto LABEL_6;
    case 2:
      [*(id *)(a1 + 32) finishRunningByContinuingInApp];
      goto LABEL_6;
    case 3:
      id v7 = *(void **)(a1 + 32);
      id v8 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      [v7 finishRunningWithError:v8];

LABEL_6:
      id v5 = v9;
      break;
    default:
      break;
  }
}

uint64_t __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

uint64_t __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

uint64_t __143__WFHandleIntentAction_showInteractionIfNeeded_inUserInterface_requiringConfirmation_requiringAuthentication_executionStage_completionHandler___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) finishRunningByContinuingInApp];
  }
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

- (BOOL)allowsContinueInAppWhenRunningRemotely
{
  return 0;
}

- (BOOL)requiresRemoteExecution
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)WFHandleIntentAction;
  if ([(WFAction *)&v12 requiresRemoteExecution])
  {
    uint64_t v3 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[WFHandleIntentAction requiresRemoteExecution]";
      __int16 v15 = 2114;
      id v16 = self;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition requires remote execution, returning YES for requiresRemoteExecution", buf, 0x16u);
    }
    LOBYTE(v4) = 1;
    goto LABEL_15;
  }
  id v5 = [(WFAction *)self resourceManager];
  id v6 = [v5 resourceObjectsOfClass:objc_opt_class()];
  uint64_t v3 = [v6 anyObject];

  if (!v3)
  {
    id v7 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[WFHandleIntentAction requiresRemoteExecution]";
      __int16 v15 = 2114;
      id v16 = self;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s App availability resource was not found for action: %{public}@", buf, 0x16u);
    }

    goto LABEL_11;
  }
  if (![v3 intentIsEligibleForRemoteExecution])
  {
LABEL_11:
    int v4 = 0;
    goto LABEL_12;
  }
  int v4 = [v3 intentIsLocallyAvailable] ^ 1;
LABEL_12:
  id v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v3 intentIsEligibleForRemoteExecution];
    int v10 = [v3 intentIsLocallyAvailable];
    *(_DWORD *)buf = 136316418;
    id v14 = "-[WFHandleIntentAction requiresRemoteExecution]";
    __int16 v15 = 2114;
    id v16 = self;
    __int16 v17 = 1024;
    int v18 = v4;
    __int16 v19 = 1024;
    BOOL v20 = v3 != 0;
    __int16 v21 = 1024;
    int v22 = v9;
    __int16 v23 = 1024;
    int v24 = v10;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ requires remote execution: %i (intentAvailableResource exists: %i, intentIsEligibleForRemoteExecution: %i, intentIsLocallyAvailable: %i", buf, 0x2Eu);
  }

LABEL_15:
  return v4;
}

- (id)contentDestinationWithError:(id *)a3
{
  int v4 = [(WFHandleIntentAction *)self appDescriptor];

  if (v4
    && ([(WFHandleIntentAction *)self appDescriptor],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 bundleIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = VCIsShortcutsAppBundleIdentifier(),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    int v9 = (void *)MEMORY[0x1E4F5A788];
    int v10 = [(WFHandleIntentAction *)self appDescriptor];
    id v8 = [v9 locationWithAppDescriptor:v10];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)appInstalledResource:(id)a3 didUpdateAppDescriptor:(id)a4
{
}

- (BOOL)intentDescriptorIsSyncedFromOtherDevices
{
  return 0;
}

- (id)appResource
{
  uint64_t v3 = [(WFHandleIntentAction *)self intentDescriptor];

  if (v3)
  {
    appResource = self->_appResource;
    if (!appResource)
    {
      id v5 = [WFAppInstalledResource alloc];
      id v6 = [(WFHandleIntentAction *)self intentDescriptor];
      char v7 = [(WFAppInstalledResource *)v5 initWithIntentDescriptor:v6 isSyncedFromOtherDevice:[(WFHandleIntentAction *)self intentDescriptorIsSyncedFromOtherDevices]];
      id v8 = self->_appResource;
      self->_appResource = v7;

      [(WFAppInstalledResource *)self->_appResource setDelegate:self];
      appResource = self->_appResource;
    }
    int v9 = appResource;
  }
  else
  {
    int v9 = 0;
  }
  return v9;
}

- (void)updateAppDescriptorInDatabaseWithSelectedApp:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self workflow];
  id v15 = [v5 actions];

  uint64_t v6 = [v15 indexOfObject:self];
  char v7 = [(WFHandleIntentAction *)self intentDescriptor];
  id v8 = [v7 descriptorWithAppDescriptor:v4];

  int v9 = +[WFDatabaseProxy defaultDatabase];
  int v10 = [(WFAction *)self UUID];
  BOOL v11 = [NSNumber numberWithInteger:v6];
  objc_super v12 = [(WFAction *)self identifier];
  uint64_t v13 = [(WFAction *)self workflow];
  id v14 = [v13 workflowID];
  [v9 updateAppDescriptor:v8 atKey:@"IntentAppDefinition" actionUUID:v10 actionIndex:v11 actionIdentifier:v12 workflowID:v14 error:0];
}

- (void)updateAppDescriptorWithSelectedApp:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHandleIntentAction *)self intentDescriptor];
  uint64_t v6 = [v5 descriptorWithAppDescriptor:v4];
  [(WFHandleIntentAction *)self setIntentDescriptor:v6];

  v7.receiver = self;
  v7.super_class = (Class)WFHandleIntentAction;
  [(WFAction *)&v7 updateAppDescriptorWithSelectedApp:v4];
}

- (void)setIntentDescriptor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_intentDescriptor, a3);
  id v5 = [(WFAction *)self parameterForKey:@"IntentAppDefinition"];
  if (v5)
  {
    uint64_t v6 = [(WFVariableSubstitutableParameterState *)[WFIntentDescriptorParameterState alloc] initWithValue:v7];
    [(WFAction *)self setParameterState:v6 forKey:@"IntentAppDefinition"];
  }
  else
  {
    uint64_t v6 = [v7 serializedRepresentation];
    [(WFAction *)self setSupplementalParameterValue:v6 forKey:@"IntentAppDefinition"];
  }
}

- (INIntentDescriptor)intentDescriptor
{
  return self->_intentDescriptor;
}

- (id)appDescriptor
{
  id v2 = [(WFHandleIntentAction *)self intentDescriptor];
  uint64_t v3 = [v2 appDescriptor];
  id v4 = [v3 selfIfNotShortcutsApp];

  return v4;
}

- (id)displayableAppDescriptor
{
  uint64_t v3 = [(WFAction *)self displayableAppDefinition];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithSerializedRepresentation:v3];
  }
  else
  {
    id v5 = [(WFHandleIntentAction *)self intentDescriptor];
    uint64_t v6 = [v5 _displayableAppDescriptor];
    id v4 = [v6 selfIfNotShortcutsApp];
  }
  return v4;
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFHandleIntentAction.m", 668, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__WFHandleIntentAction_getOutputFromIntentResponse_completionHandler___block_invoke;
  v11[3] = &unk_1E654DAA8;
  v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend(v7, "wf_getOutputValueWithCompletionHandler:", v11);
}

void __70__WFHandleIntentAction_getOutputFromIntentResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = [*(id *)(a1 + 32) executor];
    id v9 = [v8 intent];
    int v10 = [v9 extensionBundleId];
    BOOL v11 = +[WFBundledIntentHandlerProvider localIntentHandlerLaunchID];
    int v12 = [v10 isEqualToString:v11];

    id v13 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v15 = v13;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if ((isKindOfClass & 1) != 0 && v12)
    {
      uint64_t v17 = *MEMORY[0x1E4FB4B78];
      int v18 = [v16 codableDescription];
      [v18 setMainBundleIdentifier:v17];
    }
    __int16 v19 = objc_opt_new();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v16;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v20 = v5;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = objc_msgSend(v13, "wf_contentItemForValue:", *(void *)(*((void *)&v28 + 1) + 8 * v24));
            if (v25) {
              [v19 addItem:v25];
            }

            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v22);
      }

      id v16 = v27;
    }
    else
    {
      id v26 = objc_msgSend(v13, "wf_contentItemForValue:", v5);
      if (v26) {
        [v19 addItem:v26];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)launchAppInBackground:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__WFHandleIntentAction_launchAppInBackground___block_invoke;
  v3[3] = &unk_1E6556F78;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __46__WFHandleIntentAction_launchAppInBackground___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executor];
  uint64_t v3 = [v2 connection];
  BOOL v4 = [v3 appProxy];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __46__WFHandleIntentAction_launchAppInBackground___block_invoke_2;
  v6[3] = &unk_1E654FAB8;
  v6[4] = *(void *)(a1 + 32);
  [v4 launchAppInBackground:v5 completionHandler:v6];
}

uint64_t __46__WFHandleIntentAction_launchAppInBackground___block_invoke_2(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishRunningWithError:0];
  }
  else {
    return objc_msgSend(v2, "handleExecutorError:");
  }
}

- (void)finishRunningByContinuingInApp
{
  v31[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(WFHandleIntentAction *)self executor];
  uint64_t v5 = [v4 connection];
  id v6 = [v5 intent];

  id v7 = [(WFHandleIntentAction *)self executor];
  id v8 = [v7 connection];
  id v9 = [v8 _transaction];
  int v10 = [v9 state];
  BOOL v11 = [v10 intentResponse];

  int v12 = [(WFAction *)self userInterface];
  if ([v12 isRunningWithSiriUI])
  {
    id v13 = [(WFHandleIntentAction *)self executor];

    if (!v13)
    {
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"WFHandleIntentAction.m" lineNumber:598 description:@"executor should not be nil"];
    }
    if ([(WFHandleIntentAction *)self shouldOpenAppThroughSiriForIntent:v6 intentResponse:v11])
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v6 response:v11];
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB4910]) initWithInteraction:v14];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke;
      v29[3] = &unk_1E6550838;
      void v29[4] = self;
      if (([v12 performSiriRequest:v15 completionHandler:v29] & 1) == 0)
      {
        id v16 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
        [(WFHandleIntentAction *)self finishRunningWithError:v16];
      }
      goto LABEL_17;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v12 requestedFromAnotherDevice]
    && ![(WFHandleIntentAction *)self allowsContinueInAppWhenRunningRemotely])
  {
    id v14 = WFLocalizedString(@"Sorry, you can’t do that here. Try it on your iPhone instead.");
    id v20 = (void *)MEMORY[0x1E4F28C58];
    v30[0] = *MEMORY[0x1E4F28588];
    uint64_t v21 = NSString;
    uint64_t v22 = WFLocalizedString(@"Could Not Run “%@”");
    uint64_t v23 = [(WFAction *)self localizedName];
    uint64_t v24 = objc_msgSend(v21, "localizedStringWithFormat:", v22, v23);
    v30[1] = *MEMORY[0x1E4F28568];
    v31[0] = v24;
    v31[1] = v14;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    id v26 = [v20 errorWithDomain:@"WFHandleIntentActionErrorDomain" code:0 userInfo:v25];

    [(WFHandleIntentAction *)self finishRunningWithError:v26];
LABEL_17:

    goto LABEL_18;
  }
  if (![MEMORY[0x1E4F70BE8] shouldLaunchAppInBackgroundWithIntent:v6 intentResponse:v11])
  {
    uint64_t v17 = [MEMORY[0x1E4F302B0] appInfoWithIntent:v6];
    id v14 = [v17 actionsRestrictedWhileLocked];

    int v18 = [v6 _className];
    int v19 = [v14 containsObject:v18];

    if (v19)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke_286;
      v28[3] = &unk_1E654FAB8;
      v28[4] = self;
      [(WFAction *)self requestUnlock:v28];
    }
    else
    {
      [(WFHandleIntentAction *)self launchAppInBackground:0];
    }
    goto LABEL_17;
  }
  [(WFHandleIntentAction *)self launchAppInBackground:1];
LABEL_18:
}

void __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 error];
    [v4 finishRunningWithError:v5];

    id v6 = v3;
  }
  else
  {

    id v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315394;
      BOOL v11 = "-[WFHandleIntentAction finishRunningByContinuingInApp]_block_invoke";
      __int16 v12 = 2112;
      id v13 = (id)objc_opt_class();
      id v8 = v13;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [v9 finishRunningWithError:v6];
  }
}

uint64_t __54__WFHandleIntentAction_finishRunningByContinuingInApp__block_invoke_286(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 launchAppInBackground:0];
  }
  else {
    return objc_msgSend(v2, "finishRunningWithError:");
  }
}

- (BOOL)shouldOpenAppThroughSiriForIntent:(id)a3 intentResponse:(id)a4
{
  return 1;
}

- (void)populateIntent:(id)a3 withInput:(id)a4 processedParameters:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[a3 copy];
  if (!v10) {
    id v10 = (id)objc_opt_new();
  }
  uint64_t v14 = [(WFHandleIntentAction *)self slots];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke;
  v22[3] = &unk_1E654DA80;
  void v22[4] = self;
  id v23 = v11;
  id v24 = v13;
  id v25 = v10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_3;
  v19[3] = &unk_1E6557EA8;
  id v20 = v24;
  id v21 = v12;
  id v15 = v24;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v22, v19);
}

void __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) parameterForSlot:v6];
  id v9 = *(void **)(a1 + 40);
  id v10 = [v8 key];
  id v11 = [v9 objectForKey:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8 && !v11)
    {
      id v16 = [*(id *)(a1 + 32) inputParameter];
      if (v8 != v16)
      {

LABEL_12:
        v7[2](v7, 0);
        goto LABEL_13;
      }
      char v19 = [*(id *)(a1 + 32) populatesInputFromInputParameter];

      if ((v19 & 1) == 0) {
        goto LABEL_12;
      }
    }
    id v20 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_2;
    v22[3] = &unk_1E6555C08;
    uint64_t v21 = *(void *)(a1 + 56);
    id v23 = *(id *)(a1 + 48);
    id v24 = v6;
    id v25 = v7;
    [v20 resolveSlot:v24 withProcessedValue:v11 parameter:v8 input:v21 completion:v22];

    goto LABEL_13;
  }
  id v12 = [*(id *)(a1 + 48) _parametersForcedToNeedsValue];
  id v13 = (void *)[v12 mutableCopy];
  uint64_t v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_opt_new();
  }
  id v17 = v15;

  id v18 = objc_msgSend(v6, "wf_slotName");
  [v17 addObject:v18];

  [*(id *)(a1 + 48) _setParametersForcedToNeedsValue:v17];
  v7[2](v7, 0);

LABEL_13:
}

void __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = getWFGeneralLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[WFHandleIntentAction populateIntent:withInput:processedParameters:completionHandler:]_block_invoke_3";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s WFHandleIntentAction failed to populate intent with error %{public}@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

void __87__WFHandleIntentAction_populateIntent_withInput_processedParameters_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    uint64_t v5 = (void *)a1[4];
    id v6 = (void *)a1[5];
    id v7 = a2;
    id v8 = objc_msgSend(v6, "wf_slotName");
    [v5 setValue:v7 forKey:v8];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)executorWithIntent:(id)a3 groupIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[WFIntentExecutor alloc] initWithIntent:v7 donateInteraction:[(WFHandleIntentAction *)self shouldDonateIntent:v7] groupIdentifier:v6];

  [(WFIntentExecutor *)v8 setDelegate:self];
  return v8;
}

- (BOOL)shouldForceHandleInSiri:(id)a3
{
  id v3 = a3;
  if ([v3 _idiom] == 4)
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    id v6 = [v5 arrayForKey:@"IntentsHandledBySiriOverride"];
    id v7 = [v3 _className];
    char v4 = [v6 containsObject:v7];
  }
  return v4;
}

- (BOOL)intentIsHandledBySiri:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(WFHandleIntentAction *)self skipSiriExecution];
  BOOL v5 = [(WFHandleIntentAction *)self runInProcess];
  uint64_t v6 = [v8 _type];
  BOOL v7 = [(WFHandleIntentAction *)self shouldForceHandleInSiri:v8];

  LOBYTE(v8) = 0;
  int v9 = v6 == 2 || v7;
  if (v9 == 1 && !v5)
  {
    id v10 = [(WFAction *)self userInterface];
    LODWORD(v8) = [v10 isRunningWithSiriUI] & !v4;
  }
  return (char)v8;
}

- (BOOL)isHandledBySiri
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v3 = [(WFHandleIntentAction *)self generatedIntentWithInput:0 processedParameters:0 error:&v8];
  id v4 = v8;
  if (v4)
  {
    BOOL v5 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[WFHandleIntentAction isHandledBySiri]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s Unable to generate intent: %{public}@", buf, 0x16u);
    }

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(WFHandleIntentAction *)self intentIsHandledBySiri:v3];
  }

  return v6;
}

- (BOOL)skipSiriExecution
{
  id v2 = [(WFAction *)self definition];
  id v3 = [v2 objectForKey:@"SkipSiriExecution"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)runInProcess
{
  id v2 = [(WFAction *)self definition];
  id v3 = [v2 objectForKey:@"InProcess"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)parameterCombinationForIntentSupportsBackgroundExecution:(id)a3
{
  id v3 = [a3 _currentParameterCombination];
  char v4 = v3;
  if (v3) {
    char v5 = [v3 supportsBackgroundExecution];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)handleExecutionCompletionWithInteraction:(id)a3 error:(id)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = [v6 intentResponse];
    int v9 = INTypedIntentResponseWithIntentResponse();

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke;
    v10[3] = &unk_1E654DA50;
    v10[4] = self;
    id v11 = v7;
    [(WFHandleIntentAction *)self getOutputFromIntentResponse:v9 completionHandler:v10];
  }
  else
  {
    [(WFHandleIntentAction *)self handleExecutorError:a4];
  }
}

void __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) setOutput:v3];
  }
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_2;
  uint64_t v13 = &unk_1E6558938;
  char v4 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v4;
  char v5 = (void (**)(void))_Block_copy(&v10);
  id v6 = objc_msgSend(*(id *)(a1 + 40), "intent", v10, v11, v12, v13, v14);
  BOOL v7 = [v6 launchId];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4FB4BC8]];

  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0, 200000000);
    dispatch_after(v9, MEMORY[0x1E4F14428], v5);
  }
  else
  {
    v5[2](v5);
  }
}

void __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  char v4 = [v2 userInterface];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_3;
  v5[3] = &unk_1E654FAB8;
  v5[4] = *(void *)(a1 + 32);
  [v2 showInteractionIfNeeded:v3 inUserInterface:v4 requiringConfirmation:0 requiringAuthentication:0 executionStage:1 completionHandler:v5];
}

uint64_t __71__WFHandleIntentAction_handleExecutionCompletionWithInteraction_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

- (void)actuallyStartExecutingIntent:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WFHandleIntentAction *)self parameterCombinationForIntentSupportsBackgroundExecution:v4]&& ![(WFHandleIntentAction *)self opensInApp])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke;
    aBlock[3] = &unk_1E65526D8;
    aBlock[4] = self;
    char v8 = _Block_copy(aBlock);
    BOOL v9 = [(WFHandleIntentAction *)self runInProcess];
    uint64_t v10 = [v4 _executionContext];
    BOOL v12 = v10 != 9 && (unint64_t)(v10 - 3) < 0xFFFFFFFFFFFFFFFELL;
    uint64_t v13 = [v4 extensionBundleId];
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
      id v15 = [v14 bundleIdentifier];
      id v16 = [v4 extensionBundleId];
      int v17 = [v15 isEqualToString:v16];
    }
    else
    {
      int v17 = 0;
    }

    if ((v9 | v12 & v17) == 1)
    {
      id v18 = +[WFBundledIntentHandlerProvider localIntentHandlerLaunchID];
      [v4 _setExtensionBundleId:v18];
    }
    if ([(WFHandleIntentAction *)self intentIsHandledBySiri:v4])
    {
      if (([v4 _hasMatchingIntentHandlerIncludingRemoteExecution:1] & 1) == 0)
      {
        long long v31 = [(WFHandleIntentAction *)self executorWithIntent:v4 groupIdentifier:0];
        [(WFHandleIntentAction *)self setExecutor:v31];

        [(WFHandleIntentAction *)self finishRunningByContinuingInApp];
        goto LABEL_23;
      }
      char v19 = [(WFAction *)self userInterface];
      int v20 = [v19 isRunningWithSiriUI];

      if (v20)
      {
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FB48E0]) initWithIntent:v4];
        uint64_t v22 = [(WFAction *)self userInterface];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke_2;
        v32[3] = &unk_1E654E1E8;
        void v32[4] = self;
        id v33 = v8;
        char v23 = [v22 performSiriRequest:v21 completionHandler:v32];

        if (v23) {
          goto LABEL_23;
        }
      }
    }
    id v24 = [(WFHandleIntentAction *)self executor];
    id v25 = [v24 connection];
    uint64_t v26 = [v25 appProtectionPolicy];

    id v27 = [(WFHandleIntentAction *)self executorWithIntent:v4 groupIdentifier:0];
    [(WFHandleIntentAction *)self setExecutor:v27];

    long long v28 = [(WFHandleIntentAction *)self executor];
    long long v29 = [v28 connection];
    [v29 setAppProtectionPolicy:v26];

    long long v30 = [(WFHandleIntentAction *)self executor];
    [v30 startWithCompletionHandler:v8];

LABEL_23:
    goto LABEL_24;
  }
  char v5 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(WFAction *)self localizedName];
    *(_DWORD *)buf = 136315906;
    id v36 = "-[WFHandleIntentAction actuallyStartExecutingIntent:]";
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 1024;
    BOOL v40 = [(WFHandleIntentAction *)self parameterCombinationForIntentSupportsBackgroundExecution:v4];
    __int16 v41 = 1024;
    BOOL v42 = [(WFHandleIntentAction *)self opensInApp];
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ will finish by continuing in app (parameter combination supports background execution: %i, opensInApp: %i", buf, 0x22u);
  }
  BOOL v7 = [(WFHandleIntentAction *)self executorWithIntent:v4 groupIdentifier:0];
  [(WFHandleIntentAction *)self setExecutor:v7];

  [(WFHandleIntentAction *)self finishRunningByContinuingInApp];
LABEL_24:
}

uint64_t __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleExecutionCompletionWithInteraction:a2 error:a3];
}

void __53__WFHandleIntentAction_actuallyStartExecutingIntent___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [v8 interaction];
    char v5 = [v8 error];
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

    id v6 = v8;
  }
  else
  {

    BOOL v7 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [v7 finishRunningWithError:v6];
  }
}

- (void)startExecutingIntent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v20 = "-[WFHandleIntentAction startExecutingIntent:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s WFHandleIntentAction startExecutingIntent", buf, 0xCu);
  }

  [v4 _setExecutionContext:7];
  id v6 = [(WFHandleIntentAction *)self showsWhenRunIfApplicable];
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 BOOLValue];
    BOOL v9 = [v4 _metadata];
    [v9 setShowsWhenRun:v8];
  }
  uint64_t v10 = (INIntent *)[v4 copy];
  runningIntent = self->_runningIntent;
  self->_runningIntent = v10;

  BOOL v12 = [(WFAction *)self userInterface];
  if (![v12 isRunningWithSiriUI]) {
    goto LABEL_8;
  }
  uint64_t v13 = [(WFAction *)self userInterface];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    BOOL v12 = [(WFAction *)self userInterface];
    [v12 configureIntent:v4];
LABEL_8:
  }
  id v15 = [[WFActionWillRunIntentTestingEvent alloc] initWithAction:self intent:v4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__WFHandleIntentAction_startExecutingIntent___block_invoke;
  v17[3] = &unk_1E6555AC8;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [(WFAction *)self handleTestingEvent:v15 completionHandler:v17];
}

uint64_t __45__WFHandleIntentAction_startExecutingIntent___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 actuallyStartExecutingIntent:*(void *)(a1 + 40)];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

- (void)setExecutor:(id)a3
{
  char v5 = (WFIntentExecutor *)a3;
  p_executor = &self->_executor;
  executor = self->_executor;
  if (executor != v5)
  {
    char v14 = v5;
    if (!executor) {
      goto LABEL_6;
    }
    uint64_t v8 = [(WFIntentExecutor *)executor progress];
    uint64_t v9 = [v8 totalUnitCount];
    uint64_t v10 = [(WFIntentExecutor *)*p_executor progress];
    [v10 setCompletedUnitCount:v9];

    if (!v14) {
      goto LABEL_6;
    }
    if (*p_executor)
    {
      uint64_t v11 = [(WFAction *)self progress];
      objc_msgSend(v11, "setTotalUnitCount:", objc_msgSend(v11, "totalUnitCount") + 1);

      objc_storeStrong((id *)&self->_executor, a3);
    }
    else
    {
LABEL_6:
      objc_storeStrong((id *)&self->_executor, a3);
      char v5 = v14;
      if (!v14) {
        goto LABEL_8;
      }
    }
    BOOL v12 = [(WFAction *)self progress];
    uint64_t v13 = [(WFIntentExecutor *)v14 progress];
    [v12 addChild:v13 withPendingUnitCount:1];

    char v5 = v14;
  }
LABEL_8:
}

- (BOOL)shouldDonateIntent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  else {
    return ![(WFHandleIntentAction *)self isWorkflowInDatabase];
  }
}

- (BOOL)isWorkflowInDatabase
{
  id v2 = [(WFAction *)self workflow];
  uint64_t v3 = [v2 reference];
  id v4 = [v3 identifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)accessBundleContentWithBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFHandleIntentAction *)self appDescriptor];
  id v8 = [v5 bundleIdentifier];

  id v6 = [MEMORY[0x1E4F304C8] sharedConnection];
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, 0);
  objc_msgSend(v6, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v7, v4);
}

- (id)parameterForSlot:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFAction *)self parameters];
  id v6 = objc_msgSend(v4, "wf_slotName");

  BOOL v7 = [v5 objectMatchingKey:@"intentSlotName" value:v6];

  return v7;
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __65__WFHandleIntentAction_generateStandaloneShortcutRepresentation___block_invoke;
  v6[3] = &unk_1E654DA28;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WFHandleIntentAction *)self generateShortcutRepresentation:v6];
}

void __65__WFHandleIntentAction_generateStandaloneShortcutRepresentation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 titleForINShortcut:v4];
  id v5 = [[WFStandaloneShortcutRepresentation alloc] initWithINShortcut:v4 title:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)titleForINShortcut:(id)a3
{
  return (id)[a3 _title];
}

- (void)generateShortcutRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke;
  v7[3] = &unk_1E6555C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WFAction *)self processParametersWithoutAskingForValuesWithInput:0 workQueue:v5 completionHandler:v7];
}

void __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke_2;
    v7[3] = &unk_1E654DA00;
    id v5 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v5 generatePopulatedIntentFromInput:a3 processedParameters:a2 completion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __55__WFHandleIntentAction_generateShortcutRepresentation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F30738]) initWithIntent:v5];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
}

- (id)createResourceManager
{
  v5.receiver = self;
  v5.super_class = (Class)WFHandleIntentAction;
  uint64_t v3 = [(WFAction *)&v5 createResourceManager];
  WFConfigureIntentBasedParameterResources(v3, self);
  return v3;
}

- (NSArray)slots
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (INIntentDescription)intentDescription
{
  return 0;
}

- (void)generatePopulatedIntentWithIdentifier:(id)a3 fromInput:(id)a4 processedParameters:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v15 = 0;
  BOOL v12 = (void (**)(id, void, id))a6;
  uint64_t v13 = [(WFHandleIntentAction *)self generatedIntentWithIdentifier:a3 input:v10 processedParameters:v11 error:&v15];
  id v14 = v15;
  if (v13) {
    [(WFHandleIntentAction *)self populateIntent:v13 withInput:v10 processedParameters:v11 completionHandler:v12];
  }
  else {
    v12[2](v12, 0, v14);
  }
}

- (void)generatePopulatedIntentFromInput:(id)a3 processedParameters:(id)a4 completion:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v13 = [v8 UUID];
  BOOL v12 = [v13 UUIDString];
  [(WFHandleIntentAction *)self generatePopulatedIntentWithIdentifier:v12 fromInput:v11 processedParameters:v10 completion:v9];
}

- (NSString)associatedAppBundleIdentifier
{
  id v2 = [(WFHandleIntentAction *)self generatedIntentWithInput:0 processedParameters:0 error:0];
  uint64_t v3 = objc_msgSend(v2, "_intents_bundleIdForDisplay");
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "_intents_launchIdForCurrentPlatform");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)generatedIntentWithInput:(id)a3 processedParameters:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 UUID];
  BOOL v12 = [v11 UUIDString];
  id v13 = [(WFHandleIntentAction *)self generatedIntentWithIdentifier:v12 input:v10 processedParameters:v9 error:a5];

  return v13;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v12)
  {
    id v15 = [v13 key];
    id v16 = [(WFAction *)self parameterStateForKey:v15];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v12;
      id v18 = [(WFAction *)self contentPermissionRequestor];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __82__WFHandleIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
      v20[3] = &unk_1E654D9D8;
      id v22 = v14;
      id v21 = v11;
      [v17 getRecipientsWithPermissionRequestor:v18 completionHandler:v20];
    }
    else
    {
      objc_msgSend(v11, "wf_getProcessedIntentValueForParameterValue:parameter:parameterState:completionHandler:", v12, v13, v16, v14);
    }
  }
  else
  {
    if (objc_msgSend(v11, "wf_multipleValues")) {
      uint64_t v19 = MEMORY[0x1E4F1CBF0];
    }
    else {
      uint64_t v19 = 0;
    }
    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, v19, 0);
  }
}

void __82__WFHandleIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a4;
  uint64_t v8 = a1 + 32;
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(v8 + 8);
  id v9 = a2;
  if ((objc_msgSend(v7, "wf_multipleValues") & 1) == 0)
  {
    uint64_t v10 = [v9 firstObject];

    id v9 = (id)v10;
  }
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v9, v11);
}

- (int64_t)intentCategory
{
  return 0;
}

- (unint64_t)allowsInteractiveSlotResolution
{
  uint64_t v3 = [(WFAction *)self userInterface];
  if (([v3 isRunningWithSiriUI] & 1) == 0)
  {

    return 1;
  }
  id v4 = [(WFAction *)self userInterface];
  unint64_t v5 = [v4 executionContext];

  if (v5 <= 9 && ((1 << v5) & 0x206) != 0) {
    return 1;
  }
  if ([(WFHandleIntentAction *)self isWorkflowInDatabase]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)opensInApp
{
  id v2 = [(WFAction *)self parameterValueForKey:@"OpenInApp" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)showsWhenRun
{
  id v2 = [(WFHandleIntentAction *)self showsWhenRunIfApplicable];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)showsWhenRunIfApplicable
{
  if ([(WFHandleIntentAction *)self requiresShowsWhenRun])
  {
    char v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else
  {
    id v4 = [(WFAction *)self parameterForKey:@"ShowWhenRun"];
    unint64_t v5 = v4;
    if (v4
      && ([v4 isHidden] & 1) == 0
      && ([v5 resourceManager],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 resourcesRequiredForDisplayAvailable],
          v6,
          v7))
    {
      char v3 = [(WFAction *)self parameterValueForKey:@"ShowWhenRun" ofClass:objc_opt_class()];
    }
    else
    {
      char v3 = 0;
    }
  }
  return v3;
}

- (BOOL)requiresShowsWhenRun
{
  return [(WFHandleIntentAction *)self intentCategory] == 4;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFHandleIntentAction;
  id v4 = a3;
  [(WFAction *)&v9 wasAddedToWorkflowByUser:v4];
  int v5 = objc_msgSend(v4, "hiddenFromLibraryAndSync", v9.receiver, v9.super_class);

  if (v5)
  {
    uint64_t v6 = [(WFAction *)self parameterForKey:@"ShowWhenRun"];

    if (v6)
    {
      int v7 = [WFBooleanSubstitutableState alloc];
      uint64_t v8 = [(WFNumberSubstitutableState *)v7 initWithNumber:MEMORY[0x1E4F1CC28]];
      [(WFAction *)self setParameterState:v8 forKey:@"ShowWhenRun"];
    }
  }
}

- (id)externalMetricsActionIdentifier
{
  id v2 = [(WFHandleIntentAction *)self intentDescriptor];
  char v3 = [v2 intentClassName];

  return v3;
}

- (id)appBundleIdentifier
{
  char v3 = [(WFHandleIntentAction *)self intentDescriptor];
  id v4 = [v3 displayableBundleIdentifier];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    int v7 = [(WFHandleIntentAction *)self intentDescriptor];
    id v6 = [v7 bundleIdentifier];
  }
  return v6;
}

- (BOOL)prefersActionAttribution
{
  v6.receiver = self;
  v6.super_class = (Class)WFHandleIntentAction;
  if ([(WFAction *)&v6 prefersActionAttribution])
  {
    char v3 = [(WFAction *)self identifier];
    int v4 = [v3 hasPrefix:@"is.workflow.actions"] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (INCExtensionConnection)connection
{
  id v2 = [(WFHandleIntentAction *)self executor];
  char v3 = [v2 connection];

  return (INCExtensionConnection *)v3;
}

- (void)cancel
{
  char v3 = [(WFHandleIntentAction *)self executor];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)WFHandleIntentAction;
  [(WFAction *)&v4 cancel];
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  [(WFHandleIntentAction *)self setExecutor:0];
  v5.receiver = self;
  v5.super_class = (Class)WFHandleIntentAction;
  [(WFAction *)&v5 finishRunningWithError:v4];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFAction *)self processedParameters];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __51__WFHandleIntentAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_1E654D9B0;
  v6[4] = self;
  [(WFHandleIntentAction *)self generatePopulatedIntentFromInput:v4 processedParameters:v5 completion:v6];
}

uint64_t __51__WFHandleIntentAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 startExecutingIntent:a2];
  }
  else {
    return objc_msgSend(v2, "finishRunningWithError:");
  }
}

- (void)initializeParameters
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)WFHandleIntentAction;
  [(WFAction *)&v13 initializeParameters];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  char v3 = [(WFAction *)self parameters];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
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
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) resourceManager];
        WFConfigureIntentBasedParameterResources(v8, self);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFHandleIntentAction *)self overrideLocalizedName];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHandleIntentAction;
    id v7 = [(WFAction *)&v10 localizedNameWithContext:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)inputPassthrough
{
  id v2 = [(WFAction *)self outputDictionary];
  char v3 = [v2 objectForKeyedSubscript:@"Types"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (id)disabledOnPlatforms
{
  v4.receiver = self;
  v4.super_class = (Class)WFHandleIntentAction;
  id v2 = [(WFAction *)&v4 disabledOnPlatforms];
  return v2;
}

- (id)defaultLocalizationContext
{
  id v3 = objc_alloc(MEMORY[0x1E4FB47E8]);
  objc_super v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  uint64_t v5 = [(WFHandleIntentAction *)self stringLocalizer];
  uint64_t v6 = (void *)[v3 initWithLocale:v4 stringLocalizer:v5];

  return v6;
}

- (WFHandleIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)WFHandleIntentAction;
  long long v11 = [(WFAction *)&v15 initWithIdentifier:a3 definition:a4 serializedParameters:a5];
  if (v11)
  {
    long long v12 = v10;
    if (!v10)
    {
      long long v12 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    }
    objc_storeStrong((id *)&v11->_stringLocalizer, v12);
    if (!v10) {

    }
    objc_super v13 = v11;
  }

  return v11;
}

- (WFHandleIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F30788];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  long long v12 = [v8 localizerForLanguage:0];
  objc_super v13 = [(WFHandleIntentAction *)self initWithIdentifier:v11 definition:v10 serializedParameters:v9 stringLocalizer:v12];

  return v13;
}

@end