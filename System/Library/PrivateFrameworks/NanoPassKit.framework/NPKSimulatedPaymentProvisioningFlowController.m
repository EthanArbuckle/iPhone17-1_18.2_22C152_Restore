@interface NPKSimulatedPaymentProvisioningFlowController
+ (id)_broadwayCredential;
+ (id)_easyProvisioningCredentials;
+ (id)_passWithDescription:(id)a3 credentialType:(int64_t)a4;
- (void)_performEligibility:(id)a3;
- (void)_performProvision:(id)a3;
- (void)_performTerms:(id)a3;
- (void)_requestRequirements:(id)a3;
- (void)_startProvisioningForCredential:(id)a3 requestContext:(id)a4;
- (void)acknowledgeWelcome:(id)a3;
- (void)chooseFlowForPickerItem:(id)a3 requestContext:(id)a4;
- (void)handleManualEntryFields:(id)a3 credential:(id)a4 requestContext:(id)a5;
- (void)startProvisioningFlow:(id)a3;
@end

@implementation NPKSimulatedPaymentProvisioningFlowController

+ (id)_passWithDescription:(id)a3 credentialType:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v27 = a3;
  v5 = PKPassKitBundle();
  v28 = [v5 pathForResource:*MEMORY[0x263F5C838] ofType:@"json"];

  v6 = (void *)MEMORY[0x263F08900];
  v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v28];
  v8 = [v6 JSONObjectWithData:v7 options:1 error:0];

  [v8 setObject:v27 forKey:*MEMORY[0x263F5C618]];
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v9 UUIDString];
  [v8 setObject:v10 forKey:*MEMORY[0x263F5C628]];

  v11 = [NSNumber numberWithInteger:a4];
  v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5C620]];
  v13 = [v12 firstObject];

  [v13 setObject:v11 forKey:*MEMORY[0x263F5C6A8]];
  v14 = (void *)[objc_alloc(MEMORY[0x263F5C278]) initWithDictionary:v8 bundle:0];
  v15 = PKPaymentNetworkNameForPaymentCredentialType();
  v16 = [NSString stringWithFormat:@"SimulatorCard_%@", v15];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v17 = (void *)getUIImageClass_softClass;
  uint64_t v32 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getUIImageClass_block_invoke;
    v34 = &unk_2644D30F8;
    v35 = &v29;
    __getUIImageClass_block_invoke((uint64_t)buf);
    v17 = (void *)v30[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v29, 8);
  v19 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NanoPassKitUI.framework"];
  v20 = [v18 imageNamed:v16 inBundle:v19];

  id v21 = objc_alloc_init(MEMORY[0x263F5BF88]);
  if (v20)
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263F5BED8]), "initWithCGImage:scale:orientation:", objc_msgSend(v20, "CGImage"), 1, 1.0);
    [v21 setCardBackgroundCombinedImage:v22];
  }
  v23 = pk_Payment_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    v25 = pk_Payment_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Got background image %@ for %@", buf, 0x16u);
    }
  }
  [v14 setImageSet:v21 forImageSetType:4];

  return v14;
}

+ (id)_broadwayCredential
{
  return 0;
}

+ (id)_easyProvisioningCredentials
{
  v25[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = *MEMORY[0x263F5C700];
  v25[0] = *MEMORY[0x263F5C718];
  v25[1] = v4;
  uint64_t v5 = *MEMORY[0x263F5C6F0];
  v25[2] = *MEMORY[0x263F5C6E0];
  v25[3] = v5;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = PKPaymentCredentialTypeForPaymentNetworkName();
        id v13 = objc_alloc(MEMORY[0x263F5C060]);
        v14 = objc_msgSend(v13, "initWithIdentifier:status:credentialType:passURL:", v11, 1, v12, 0, (void)v20);
        v15 = [a1 _passWithDescription:v11 credentialType:v12];
        [v14 setPaymentPass:v15];

        v16 = [v14 paymentPass];
        v17 = [v16 primaryAccountNumberSuffix];
        [v14 setSanitizedPrimaryAccountNumber:v17];

        [v3 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  id v18 = [a1 _broadwayCredential];
  if (v18) {
    [v3 insertObject:v18 atIndex:0];
  }

  return v3;
}

- (void)startProvisioningFlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[NPKPaymentProvisioningFlowStepContext alloc] initWithRequestContext:v4];
  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:110 withContext:v5];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__NPKSimulatedPaymentProvisioningFlowController_startProvisioningFlow___block_invoke;
  v8[3] = &unk_2644D2E08;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_after(v6, MEMORY[0x263EF83A0], v8);
}

void __71__NPKSimulatedPaymentProvisioningFlowController_startProvisioningFlow___block_invoke(uint64_t a1)
{
  v3 = [[NPKPaymentProvisioningFlowControllerWelcomeStepContext alloc] initWithRequestContext:*(void *)(a1 + 32)];
  v2 = [MEMORY[0x263F5C020] defaultImages];
  [(NPKPaymentProvisioningFlowControllerWelcomeStepContext *)v3 setHeroImages:v2];

  [*(id *)(a1 + 40) _performTransitionToStep:120 withContext:v3];
}

- (void)acknowledgeWelcome:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [[NPKPaymentProvisioningFlowControllerChooseFlowStepContext alloc] initWithRequestContext:v4];

  dispatch_time_t v6 = +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:@"manualEntryProvisioning" title:@"Manual Entry Provisioning" products:0];
  id v7 = +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:@"easyProvisioning" title:@"Easy Provisioning" products:0];
  uint64_t v8 = PKLocalizedPaymentString(&cfstr_CardTypePaymen.isa);
  id v9 = +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:v8 productType:&unk_26D0438C8];

  v10 = [v9 items];
  [v10 addObject:v6];

  uint64_t v11 = [v9 items];
  [v11 addObject:v7];

  v13[0] = v9;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(NPKPaymentProvisioningFlowControllerChooseFlowStepContext *)v5 setSections:v12];

  [(NPKPaymentProvisioningFlowController *)self _performTransitionToStep:130 withContext:v5];
}

- (void)chooseFlowForPickerItem:(id)a3 requestContext:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 identifier];
  int v8 = [v7 isEqualToString:@"manualEntryProvisioning"];

  if (v8)
  {
    [(NPKPaymentProvisioningFlowController *)self _transitionToManualEntry:v6];
  }
  else
  {
    id v9 = [v12 identifier];
    int v10 = [v9 isEqualToString:@"easyProvisioning"];

    if (v10)
    {
      uint64_t v11 = [(id)objc_opt_class() _easyProvisioningCredentials];
      [(NPKPaymentProvisioningFlowController *)self _transitionBasedOnCredentials:v11 product:0 requestContext:v6];
    }
  }
}

- (void)handleManualEntryFields:(id)a3 credential:(id)a4 requestContext:(id)a5
{
  id v9 = a5;
  id v7 = a3;
  int v8 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
  [v8 updateWithPaymentSetupFields:v7];

  [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v9];
}

- (void)_startProvisioningForCredential:(id)a3 requestContext:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  [v7 resetForNewProvisioning];

  [(NPKPaymentProvisioningFlowController *)self setCurrentCredential:v6];
  id v8 = objc_alloc(MEMORY[0x263F5C0C8]);
  id v9 = (void *)[v8 initWithPaymentSetupFields:MEMORY[0x263EFFA68]];
  [(NPKPaymentProvisioningFlowController *)self setFieldsModel:v9];

  [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v10];
}

- (void)_requestRequirements:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  [v5 resetForNewProvisioning];

  id v6 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  [v6 setState:1];

  id v7 = [(NPKPaymentProvisioningFlowController *)self currentCredential];
  int v8 = [v7 isAccountCredential];

  if (v8)
  {
    [(NPKPaymentProvisioningFlowController *)self setTermsAcceptedOutOfBand:1];
    [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v4];
  }
  else
  {
    id v9 = [(NPKPaymentProvisioningFlowController *)self currentCredential];
    int v10 = [v9 isRemoteCredential];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F5C0C0] paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C790]];
      v17[0] = v11;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263F5C0C0] paymentSetupFieldWithIdentifier:*MEMORY[0x263F5C780]];
      id v13 = objc_msgSend(MEMORY[0x263F5C0C0], "paymentSetupFieldWithIdentifier:", *MEMORY[0x263F5C790], v11);
      v16[1] = v13;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    }
    v14 = [(NPKPaymentProvisioningFlowController *)self fieldsModel];
    [v14 updateWithPaymentSetupFields:v12];

    v15 = [(NPKPaymentProvisioningFlowController *)self currentCredential];
    [(NPKPaymentProvisioningFlowController *)self _transitionToSecondaryManualEntryWithFields:v12 credential:v15 requestContext:v4];

    id v4 = (id)v12;
  }
}

- (void)_performEligibility:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: performing eligibility", v9, 2u);
    }
  }
  int v8 = [(NPKPaymentProvisioningFlowController *)self provisioningController];
  [v8 setState:3];

  [(NPKPaymentProvisioningFlowController *)self _performNextActionForProvisioningState:v4];
}

- (void)_performTerms:(id)a3
{
  id v4 = NSURL;
  id v5 = a3;
  id v6 = [v4 URLWithString:@"https://nc-pod1-smp-device-asset.apple.com:443/broker/v1/assets/en_e1604103d8354ea3a69d9d9af961b042_v8"];
  [(NPKPaymentProvisioningFlowController *)self _transitionBasedOnTermsForReason:0 URL:v6 requestContext:v5];
}

- (void)_performProvision:(id)a3
{
  id v4 = a3;
  [(NPKPaymentProvisioningFlowController *)self _transitionToProvisioningProgressWithRequestContext:v4];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NPKSimulatedPaymentProvisioningFlowController__performProvision___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

uint64_t __67__NPKSimulatedPaymentProvisioningFlowController__performProvision___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) provisioningController];
  [v2 setState:5];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _performNextActionForProvisioningState:v4];
}

@end