@interface SKUIExplicitRestrictionAlertController
- (SKUIExplicitRestrictionAlertController)initWithClientContext:(id)a3;
- (SKUIExplicitRestrictionAlertController)initWithClientContext:(id)a3 presentingViewController:(id)a4;
- (void)presentExplicitRestrictionAlertIfNeededOfType:(int64_t)a3 completionBlock:(id)a4;
@end

@implementation SKUIExplicitRestrictionAlertController

- (SKUIExplicitRestrictionAlertController)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIExplicitRestrictionAlertController initWithClientContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIExplicitRestrictionAlertController;
  v6 = [(SKUIExplicitRestrictionAlertController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (SKUIExplicitRestrictionAlertController)initWithClientContext:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIExplicitRestrictionAlertController initWithClientContext:presentingViewController:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIExplicitRestrictionAlertController;
  objc_super v9 = [(SKUIExplicitRestrictionAlertController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (void)presentExplicitRestrictionAlertIfNeededOfType:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FA82B0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke;
  v9[3] = &unk_1E64277F0;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 shouldDisplayExplicitRestrictionAlertOfType:a3 completionBlock:v9];
}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke(void *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if ([MEMORY[0x1E4FA82B0] isActiveAccountAllowedToUpdateRestrictions])
    {
      id v6 = (void *)MEMORY[0x1E4FA82B0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_4;
      v13[3] = &unk_1E64277F0;
      id v7 = (void *)a1[5];
      uint64_t v8 = a1[4];
      uint64_t v15 = a1[6];
      v13[4] = v8;
      id v14 = v7;
      [v6 isRestrictionsPasscodeSet:v13];
      objc_super v9 = v14;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_2;
      block[3] = &unk_1E6427780;
      objc_super v12 = (void *)a1[5];
      uint64_t v11 = a1[6];
      block[4] = a1[4];
      uint64_t v18 = v11;
      id v17 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_super v9 = v17;
    }
  }
  else
  {
    uint64_t v10 = a1[5];
    if (v10) {
      (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, 0);
    }
  }
}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_2(void *a1)
{
  v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    v3 = [v2 localizedStringForKey:@"EXPLICIT_CONTENT_DISABLED_ALERT_MESSAGE" inTable:@"ExplicitByDefault"];
    v4 = *(void **)(a1[4] + 8);
    if (v4) {
      [v4 localizedStringForKey:@"OK_BUTTON" inTable:@"ExplicitByDefault"];
    }
    else {
    id v7 = +[SKUIClientContext localizedStringForKey:@"OK_BUTTON" inBundles:0 inTable:@"ExplicitByDefault"];
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v3 = [v5 localizedStringForKey:@"EXPLICIT_CONTENT_DISABLED_ALERT_MESSAGE" value:&stru_1F1C879E8 table:@"ExplicitByDefault"];

    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"OK_BUTTON" value:&stru_1F1C879E8 table:@"ExplicitByDefault"];
  }
  uint64_t v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v3 preferredStyle:1];
  objc_super v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v7 style:0 handler:0];
  [v8 addAction:v9];
  [v8 setPreferredAction:v9];
  id v10 = *(id *)(a1[4] + 16);
  if (v10
    || (objc_super v12 = *(void **)(a1[4] + 8)) != 0
    && ([v12 _applicationController],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 rootViewController],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v10))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_3;
    v15[3] = &unk_1E6427758;
    uint64_t v11 = (void *)a1[5];
    uint64_t v17 = a1[6];
    id v16 = v11;
    [v10 presentViewController:v8 animated:1 completion:v15];
  }
  else
  {
    uint64_t v14 = a1[5];
    if (v14) {
      (*(void (**)(uint64_t, void, void))(v14 + 16))(v14, 0, 0);
    }
  }
}

uint64_t __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_3(uint64_t a1)
{
  [MEMORY[0x1E4FA82B0] didDisplayExplicitRestrictionAlertOfType:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_4(void *a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_5;
  v5[3] = &unk_1E64277C8;
  v3 = (void *)a1[5];
  uint64_t v2 = a1[6];
  char v8 = a2;
  uint64_t v4 = a1[4];
  uint64_t v7 = v2;
  v5[4] = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_5(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 0:
      uint64_t v2 = @"ON_LAUNCH_ALERT_TITLE";
      v3 = @"ON_LAUNCH_ALERT_MESSAGE";
      break;
    case 1:
      uint64_t v2 = @"ON_CONTAINER_LOAD_ALERT_TITLE";
      v3 = @"ON_CONTAINER_LOAD_ALERT_MESSAGE";
      break;
    case 2:
      BOOL v4 = *(unsigned char *)(a1 + 56) == 0;
      if (*(unsigned char *)(a1 + 56)) {
        v3 = @"ON_PLAY_PASSCODE_SET_ALERT_MESSAGE";
      }
      else {
        v3 = @"ON_PLAY_ALERT_MESSAGE";
      }
      id v5 = @"ON_PLAY_PASSCODE_SET_ALERT_TITLE";
      id v6 = @"ON_PLAY_ALERT_TITLE";
      goto LABEL_21;
    case 3:
      BOOL v4 = *(unsigned char *)(a1 + 56) == 0;
      if (*(unsigned char *)(a1 + 56)) {
        v3 = @"ON_PURCHASE_PASSCODE_SET_ALERT_MESSAGE";
      }
      else {
        v3 = @"ON_PURCHASE_ALERT_MESSAGE";
      }
      id v5 = @"ON_PURCHASE_PASSCODE_SET_ALERT_TITLE";
      id v6 = @"ON_PURCHASE_ALERT_TITLE";
      goto LABEL_21;
    case 4:
      BOOL v4 = *(unsigned char *)(a1 + 56) == 0;
      if (*(unsigned char *)(a1 + 56)) {
        v3 = @"ON_ADD_TO_LIBRARY_PASSCODE_SET_ALERT_MESSAGE";
      }
      else {
        v3 = @"ON_ADD_TO_LIBRARY_ALERT_MESSAGE";
      }
      id v5 = @"ON_ADD_TO_LIBRARY_PASSCODE_SET_ALERT_TITLE";
      id v6 = @"ON_ADD_TO_LIBRARY_ALERT_TITLE";
      goto LABEL_21;
    case 5:
      BOOL v4 = *(unsigned char *)(a1 + 56) == 0;
      if (*(unsigned char *)(a1 + 56)) {
        v3 = @"ON_OPEN_PASSCODE_SET_ALERT_MESSAGE";
      }
      else {
        v3 = @"ON_OPEN_ALERT_MESSAGE";
      }
      id v5 = @"ON_OPEN_PASSCODE_SET_ALERT_TITLE";
      id v6 = @"ON_OPEN_ALERT_TITLE";
LABEL_21:
      if (v4) {
        uint64_t v2 = v6;
      }
      else {
        uint64_t v2 = v5;
      }
      break;
    default:
      v3 = 0;
      uint64_t v2 = 0;
      break;
  }
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v7 = @"RESTRICTIONS_BUTTON";
  }
  else {
    uint64_t v7 = @"ALLOW_EXPLICIT_BUTTON";
  }
  char v8 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v8)
  {
    objc_super v9 = [v8 localizedStringForKey:v2 inTable:@"ExplicitByDefault"];
    id v10 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v10) {
      [v10 localizedStringForKey:v3 inTable:@"ExplicitByDefault"];
    }
    else {
    v13 = +[SKUIClientContext localizedStringForKey:v3 inBundles:0 inTable:@"ExplicitByDefault"];
    }
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v18) {
      [v18 localizedStringForKey:v7 inTable:@"ExplicitByDefault"];
    }
    else {
    uint64_t v15 = +[SKUIClientContext localizedStringForKey:v7 inBundles:0 inTable:@"ExplicitByDefault"];
    }
    v19 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v19) {
      [v19 localizedStringForKey:@"NOT_NOW_BUTTON" inTable:@"ExplicitByDefault"];
    }
    else {
    uint64_t v17 = +[SKUIClientContext localizedStringForKey:@"NOT_NOW_BUTTON" inBundles:0 inTable:@"ExplicitByDefault"];
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v9 = [v11 localizedStringForKey:v2 value:&stru_1F1C879E8 table:@"ExplicitByDefault"];

    objc_super v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:v3 value:&stru_1F1C879E8 table:@"ExplicitByDefault"];

    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:v7 value:&stru_1F1C879E8 table:@"ExplicitByDefault"];

    id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"NOT_NOW_BUTTON" value:&stru_1F1C879E8 table:@"ExplicitByDefault"];
  }
  v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v13 preferredStyle:1];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_6;
  v31[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  char v32 = *(unsigned char *)(a1 + 56);
  v21 = [MEMORY[0x1E4FB1410] actionWithTitle:v15 style:0 handler:v31];
  [v20 addAction:v21];
  v22 = [MEMORY[0x1E4FB1410] actionWithTitle:v17 style:0 handler:0];
  [v20 addAction:v22];
  [v20 setPreferredAction:v22];
  id v23 = *(id *)(*(void *)(a1 + 32) + 16);
  if (v23
    || (v25 = *(void **)(*(void *)(a1 + 32) + 8)) != 0
    && ([v25 _applicationController],
        v26 = objc_claimAutoreleasedReturnValue(),
        [v26 rootViewController],
        id v23 = (id)objc_claimAutoreleasedReturnValue(),
        v26,
        v23))
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_7;
    v28[3] = &unk_1E6427758;
    v24 = *(void **)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    id v29 = v24;
    [v23 presentViewController:v20 animated:1 completion:v28];
  }
  else
  {
    uint64_t v27 = *(void *)(a1 + 40);
    if (v27) {
      (*(void (**)(uint64_t, void, void))(v27 + 16))(v27, 0, 0);
    }
  }
}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v1 = SKUIMobileCoreServicesFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Lsapplicationw.isa, v1), "defaultWorkspace");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=RESTRICTIONS"];
    [v4 openSensitiveURL:v2 withOptions:0];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4FA82B0];
    [v3 setAllowExplicitContent];
  }
}

uint64_t __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_7(uint64_t a1)
{
  [MEMORY[0x1E4FA82B0] didDisplayExplicitRestrictionAlertOfType:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIExplicitRestrictionAlertController initWithClientContext:]";
}

- (void)initWithClientContext:presentingViewController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIExplicitRestrictionAlertController initWithClientContext:presentingViewController:]";
}

@end