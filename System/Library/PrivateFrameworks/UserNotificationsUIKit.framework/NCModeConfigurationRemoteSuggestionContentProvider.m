@interface NCModeConfigurationRemoteSuggestionContentProvider
+ (id)_localizedSummaryStringForSuggestionType:(unint64_t)a3 configurationType:(unint64_t)a4 scope:(unint64_t)a5 semanticType:(int64_t)a6 modeName:(id)a7 bundleDisplayName:(id)a8 preferredSenderSummary:(id)a9 localizedStringForKeyBlock:(id)a10;
- (NCModeConfigurationRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7 suggestionType:(unint64_t)a8 scope:(unint64_t)a9 modeConfiguration:(id)a10;
- (id)auxiliaryOptionActions;
- (void)auxiliaryOptionActions;
- (void)handleAcceptAction:(id)a3;
- (void)handleRejectAction:(id)a3;
@end

@implementation NCModeConfigurationRemoteSuggestionContentProvider

- (NCModeConfigurationRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7 suggestionType:(unint64_t)a8 scope:(unint64_t)a9 modeConfiguration:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  v35.receiver = self;
  v35.super_class = (Class)NCModeConfigurationRemoteSuggestionContentProvider;
  v19 = [(NCRemoteSuggestionContentProvider *)&v35 initWithNotificationRequest:v16 bundleDisplayName:v17 managementDelegate:a5 suggestionDelegate:a6 uuid:a7];
  v20 = v19;
  if (v19)
  {
    v19->_suggestionType = a8;
    objc_storeStrong((id *)&v19->_modeConfiguration, a10);
    v20->_scope = a9;
    v21 = [(DNDModeConfiguration *)v20->_modeConfiguration configuration];
    v22 = v21;
    unint64_t v34 = a8;
    if (a9) {
      uint64_t v23 = [v21 senderConfigurationType];
    }
    else {
      uint64_t v23 = [v21 applicationConfigurationType];
    }
    uint64_t v33 = v23;

    v24 = [v18 mode];
    v25 = [v24 name];

    v26 = [v18 mode];
    uint64_t v27 = [v26 semanticType];

    v28 = [v16 content];
    v29 = [v28 communicationContext];
    v30 = [v29 preferredSenderSummary];

    v31 = [(id)objc_opt_class() _localizedSummaryStringForSuggestionType:v34 configurationType:v33 scope:a9 semanticType:v27 modeName:v25 bundleDisplayName:v17 preferredSenderSummary:v30 localizedStringForKeyBlock:&__block_literal_global_23];
    [(NCNotificationManagementSuggestionContentProvider *)v20 setAuxiliaryOptionsSummaryText:v31];
  }
  return v20;
}

id __182__NCModeConfigurationRemoteSuggestionContentProvider_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_uuid_suggestionType_scope_modeConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = NCUserNotificationsUIKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:v2 value:&stru_1F2F516F8 table:0];

  return v4;
}

- (id)auxiliaryOptionActions
{
  v32[2] = *MEMORY[0x1E4F143B8];
  unint64_t suggestionType = self->_suggestionType;
  if (suggestionType == 1)
  {
    uint64_t v8 = [&stru_1F2F516F8 stringByAppendingString:@"_REMOVE"];
LABEL_6:
    v9 = (__CFString *)v8;
    goto LABEL_15;
  }
  if (!suggestionType)
  {
    BOOL v4 = self->_scope == 0;
    v5 = [(DNDModeConfiguration *)self->_modeConfiguration configuration];
    v6 = v5;
    if (v4) {
      uint64_t v7 = [v5 applicationConfigurationType];
    }
    else {
      uint64_t v7 = [v5 senderConfigurationType];
    }
    uint64_t v10 = v7;

    switch(v10)
    {
      case 2:
        v11 = (void *)*MEMORY[0x1E4FB3780];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_FAULT)) {
          [(NCModeConfigurationRemoteSuggestionContentProvider *)v11 auxiliaryOptionActions];
        }
        break;
      case 1:
        uint64_t v8 = [&stru_1F2F516F8 stringByAppendingString:@"_SILENCE"];
        goto LABEL_6;
      case 0:
        uint64_t v8 = [&stru_1F2F516F8 stringByAppendingString:@"_ALLOW"];
        goto LABEL_6;
    }
  }
  v9 = &stru_1F2F516F8;
LABEL_15:
  objc_initWeak(&location, self);
  v12 = [@"NOTIFICATION_REMOTE_MANAGEMENT_SUGGESTION_DONT" stringByAppendingString:v9];
  v13 = (void *)MEMORY[0x1E4FB13F0];
  v14 = NCUserNotificationsUIKitFrameworkBundle();
  v15 = [v14 localizedStringForKey:v12 value:&stru_1F2F516F8 table:0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v29[3] = &unk_1E6A91930;
  objc_copyWeak(&v30, &location);
  id v16 = [v13 actionWithTitle:v15 image:0 identifier:@"notification-management-remote-configure-suggestion-reject" handler:v29];

  id v17 = [@"NOTIFICATION_REMOTE_MANAGEMENT_SUGGESTION" stringByAppendingString:v9];
  id v18 = (void *)MEMORY[0x1E4FB13F0];
  v19 = NCUserNotificationsUIKitFrameworkBundle();
  v20 = [v19 localizedStringForKey:v17 value:&stru_1F2F516F8 table:0];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  uint64_t v27 = &unk_1E6A91930;
  objc_copyWeak(&v28, &location);
  v21 = [v18 actionWithTitle:v20 image:0 identifier:@"notification-management-remote-configure-suggestion-accept" handler:&v24];

  v32[0] = v16;
  v32[1] = v21;
  v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 2, v24, v25, v26, v27);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);

  return v22;
}

void __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [v3 sender];

  [WeakRetained handleRejectAction:v4];
}

void __76__NCModeConfigurationRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = [v3 sender];

  [WeakRetained handleAcceptAction:v4];
}

- (void)handleRejectAction:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F4AD40], "sharedInstance", a3);
  v5 = [(NCRemoteSuggestionContentProvider *)self uuid];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  [v4 logSuggestionEvent:1 suggestionType:5 suggestionIdentifier:v5 timestamp:v6];

  id v8 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  uint64_t v7 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v8 notificationManagementContentProvider:self requestsRemoveSuggestionForRequest:v7];
}

- (void)handleAcceptAction:(id)a3
{
  id v20 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  BOOL v4 = (void *)[(DNDModeConfiguration *)self->_modeConfiguration mutableCopy];
  v5 = [v4 configuration];
  v6 = (void *)[v5 mutableCopy];

  if (self->_suggestionType)
  {
    uint64_t v7 = 2;
  }
  else
  {
    if (self->_scope) {
      uint64_t v8 = [v6 senderConfigurationType];
    }
    else {
      uint64_t v8 = [v6 applicationConfigurationType];
    }
    uint64_t v7 = v8 != 0;
  }
  unint64_t scope = self->_scope;
  if (scope == 2)
  {
    v12 = [(NCNotificationManagementContentProvider *)self notificationRequest];
    v13 = [v12 content];
    v14 = [v13 communicationContext];
    v15 = [v14 sender];
    uint64_t v10 = [v15 cnContactIdentifier];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F5F5C0]) initWithContactIdentifier:v10];
    if (v7 == 2) {
      [v6 removeExceptionForContact:v11];
    }
    else {
      [v6 setExceptionForContact:v11];
    }
  }
  else
  {
    if (scope) {
      goto LABEL_16;
    }
    uint64_t v10 = [(NCNotificationManagementContentProvider *)self notificationRequest];
    v11 = [v10 sectionIdentifier];
    if (v7 == 2) {
      [v6 removeExceptionForApplication:v11];
    }
    else {
      [v6 setExceptionForApplication:v11];
    }
  }

LABEL_16:
  [v4 setConfiguration:v6];
  [v20 notificationManagementContentProvider:self setModeConfiguration:v4];
  id v16 = [MEMORY[0x1E4F4AD40] sharedInstance];
  id v17 = [(NCRemoteSuggestionContentProvider *)self uuid];
  id v18 = [MEMORY[0x1E4F1C9C8] now];
  [v16 logSuggestionEvent:2 suggestionType:5 suggestionIdentifier:v17 timestamp:v18];

  v19 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v20 notificationManagementContentProvider:self requestsRemoveSuggestionForRequest:v19];
}

- (void).cxx_destruct
{
}

+ (id)_localizedSummaryStringForSuggestionType:(unint64_t)a3 configurationType:(unint64_t)a4 scope:(unint64_t)a5 semanticType:(int64_t)a6 modeName:(id)a7 bundleDisplayName:(id)a8 preferredSenderSummary:(id)a9 localizedStringForKeyBlock:(id)a10
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = (void (**)(id, void *))a10;
  if (a3 == 1)
  {
    id v20 = (void *)*MEMORY[0x1E4FB3780];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_FAULT)) {
      +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:].cold.4(v20, a4, a5);
    }
    goto LABEL_9;
  }
  if (a3)
  {
LABEL_9:
    v21 = @"NOTIFICATION_REMOTE_MANAGEMENT_MODE_CONFIGURATION_SUGGESTION";
    goto LABEL_10;
  }
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      v19 = @"_SILENCE";
      goto LABEL_46;
    }
    if (!a4)
    {
      v19 = @"_ALLOW";
LABEL_46:
      v21 = [@"NOTIFICATION_REMOTE_MANAGEMENT_MODE_CONFIGURATION_SUGGESTION" stringByAppendingString:v19];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_super v35 = (void *)*MEMORY[0x1E4FB3780];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_FAULT)) {
    +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:](v35, a5);
  }
  v21 = 0;
LABEL_10:
  switch(a5)
  {
    case 0uLL:
      uint64_t v24 = [(__CFString *)v21 stringByAppendingString:@"_APP"];

      uint64_t v25 = (__CFString *)v16;
LABEL_19:
      uint64_t v23 = v25;
      v21 = (__CFString *)v24;
      goto LABEL_20;
    case 2uLL:
      uint64_t v24 = [(__CFString *)v21 stringByAppendingString:@"_CONTACT"];

      uint64_t v25 = (__CFString *)v17;
      goto LABEL_19;
    case 1uLL:
      v22 = (void *)*MEMORY[0x1E4FB3780];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_FAULT)) {
        +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:](v22, a4);
      }

      v21 = 0;
      break;
  }
  uint64_t v23 = &stru_1F2F516F8;
LABEL_20:
  int v26 = 0;
  uint64_t v27 = @"_DO_NOT_DISTURB";
  switch(a6)
  {
    case 0:
      break;
    case 1:
      int v26 = 0;
      uint64_t v27 = @"_SLEEP";
      break;
    case 2:
      int v26 = 0;
      uint64_t v27 = @"_DRIVING";
      break;
    case 3:
      int v26 = 0;
      uint64_t v27 = @"_FITNESS";
      break;
    case 4:
      int v26 = 0;
      uint64_t v27 = @"_WORK";
      break;
    case 5:
      int v26 = 0;
      uint64_t v27 = @"_PERSONAL";
      break;
    case 6:
      int v26 = 0;
      uint64_t v27 = @"_READING";
      break;
    case 7:
      int v26 = 0;
      uint64_t v27 = @"_GAMING";
      break;
    case 8:
      int v26 = 0;
      uint64_t v27 = @"_MINDFULNESS";
      break;
    default:
      int v26 = 1;
      uint64_t v27 = @"_CUSTOM";
      break;
  }
  id v28 = [(__CFString *)v21 stringByAppendingString:v27];

  if (v28)
  {
    v29 = v18[2](v18, v28);
    if (v26)
    {
      id v30 = (id *)&v38;
      [NSString localizedStringWithValidatedFormat:v29, @"%@%@", &v38, v23, v15, v37, 0 validFormatSpecifiers error];
    }
    else
    {
      id v30 = (id *)&v37;
      [NSString localizedStringWithValidatedFormat:v29, @"%@", &v37, v23, v36, 0, v38 validFormatSpecifiers error];
    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v32 = *v30;

    if (v32)
    {
      uint64_t v33 = (void *)*MEMORY[0x1E4FB3780];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_FAULT)) {
        +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:]((uint64_t)v28, v33, v32);
      }
    }
  }
  else
  {
    v31 = &stru_1F2F516F8;
  }

  return v31;
}

- (void)auxiliaryOptionActions
{
  v5 = OUTLINED_FUNCTION_2_0(a1);
  v6 = [v2 numberWithUnsignedInteger:2];
  uint64_t v7 = [*(id *)(v3 + 3792) numberWithUnsignedInteger:*a2];
  OUTLINED_FUNCTION_0_4();
  _os_log_fault_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_FAULT, "Received unexpected notification management suggestion for mode configuration with configuration type %@ for scope %@", v8, 0x16u);
}

@end