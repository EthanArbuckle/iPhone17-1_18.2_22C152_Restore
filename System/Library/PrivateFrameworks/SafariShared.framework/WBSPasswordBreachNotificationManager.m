@interface WBSPasswordBreachNotificationManager
+ (BOOL)_highLevelDomain:(id)a3 isIncludedInTopFraudTargets:(id)a4;
+ (id)_bodyForHighLevelDomains:(id)a3 deviceClass:(int)a4 topFraudTargets:(id)a5;
+ (id)_bodyForSavedAccounts:(id)a3 withTopFraudTargets:(id)a4;
+ (unint64_t)_bodyStyleForTopFraudTargetDomains:(id)a3 sensitiveDomains:(id)a4 passwordsCount:(unint64_t)a5;
- (WBSPasswordBreachNotificationManager)init;
- (id)_contentWithSavedAccounts:(id)a3 topFraudTargets:(id)a4;
- (id)_passwordManagerURLForSavedAccount:(id)a3;
- (id)_titleForSavedAccounts:(id)a3;
- (void)addBreachNotificationForSavedAccounts:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation WBSPasswordBreachNotificationManager

- (WBSPasswordBreachNotificationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSPasswordBreachNotificationManager;
  v2 = [(WBSPasswordBreachNotificationManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Safari.PasswordBreachNotifications"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    v5 = (WBSPasswordWarningTopFraudTargetsManager *)objc_alloc_init(MEMORY[0x1E4F97F80]);
    topFraudTargetsManager = v2->_topFraudTargetsManager;
    v2->_topFraudTargetsManager = v5;

    v7 = v2;
  }

  return v2;
}

- (void)addBreachNotificationForSavedAccounts:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    topFraudTargetsManager = self->_topFraudTargetsManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E5C9E780;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(WBSPasswordWarningTopFraudTargetsManager *)topFraudTargetsManager getTopFraudTargetsWithCompletionHandler:v10];
  }
  else
  {
    objc_super v9 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F28798], 22, @"Cannot add a notification for zero passwords.");
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

void __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5C9A780;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _contentWithSavedAccounts:*(void *)(a1 + 40) topFraudTargets:*(void *)(a1 + 48)];
  v2 = [MEMORY[0x1E4F44628] requestWithIdentifier:*MEMORY[0x1E4F98158] content:v4 trigger:0];
  id v3 = [MEMORY[0x1E4F97F88] sharedNotificationManager];
  [v3 schedulePasswordBreachNotificationRequest:v2 completionHandler:*(void *)(a1 + 56)];
}

- (id)_contentWithSavedAccounts:(id)a3 topFraudTargets:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F445B0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  id v10 = [(WBSPasswordBreachNotificationManager *)self _titleForSavedAccounts:v6];
  [v9 setTitle:v10];

  id v11 = +[WBSPasswordBreachNotificationManager _bodyForSavedAccounts:v6 withTopFraudTargets:v8];

  [v9 setBody:v11];
  if ([v6 count] == 1)
  {
    id v12 = [v6 firstObject];
    v13 = [(WBSPasswordBreachNotificationManager *)self _passwordManagerURLForSavedAccount:v12];
  }
  else
  {
    v13 = [MEMORY[0x1E4F97F68] passwordManagerSecurityRecommendationsURL];
  }
  [v9 setDefaultActionURL:v13];

  return v9;
}

- (id)_passwordManagerURLForSavedAccount:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 stableID];

  id v7 = (void *)[v5 initWithData:v6 encoding:4];
  id v8 = (void *)MEMORY[0x1E4F97F68];
  id v12 = @"Security";
  v13[0] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = [v8 passwordManagerURLWithDictionary:v9];

  return v10;
}

- (id)_titleForSavedAccounts:(id)a3
{
  [a3 count];
  id v3 = _WBSLocalizedString();
  return v3;
}

+ (id)_bodyForSavedAccounts:(id)a3 withTopFraudTargets:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_88);
  id v8 = [MEMORY[0x1E4F97E88] currentDevice];
  uint64_t v9 = [v8 deviceClass];

  id v10 = [a1 _bodyForHighLevelDomains:v7 deviceClass:v9 topFraudTargets:v6];

  return v10;
}

uint64_t __82__WBSPasswordBreachNotificationManager__bodyForSavedAccounts_withTopFraudTargets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 highLevelDomain];
}

+ (unint64_t)_bodyStyleForTopFraudTargetDomains:(id)a3 sensitiveDomains:(id)a4 passwordsCount:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [a3 count];
  uint64_t v9 = [v7 count];

  if (a5 == 1 && !v8 && v9 == 1) {
    return 5;
  }
  BOOL v12 = v8 == 1 && v9 == 0;
  unint64_t result = a5 != 1 || !v12;
  if (!v12)
  {
    if (v8 != 2 || v9)
    {
      if (v8 != 3 || v9)
      {
        if ((unint64_t)(v9 + v8) >= 0xA || v8 == 0) {
          return 6;
        }
        else {
          return 4;
        }
      }
      else
      {
        return 3;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

+ (BOOL)_highLevelDomain:(id)a3 isIncludedInTopFraudTargets:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 highPriorityFraudTargets];
  if ([v7 containsObject:v5])
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [v6 fraudTargets];
    if ([v9 containsObject:v5])
    {
      char v8 = 1;
    }
    else
    {
      id v10 = [v6 financialFraudTargets];
      char v8 = [v10 containsObject:v5];
    }
  }

  return v8;
}

+ (id)_bodyForHighLevelDomains:(id)a3 deviceClass:(int)a4 topFraudTargets:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v7;
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
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if ([a1 _highLevelDomain:v16 isIncludedInTopFraudTargets:v8]) {
          v17 = v9;
        }
        else {
          v17 = v10;
        }
        [v17 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  switch(objc_msgSend(a1, "_bodyStyleForTopFraudTargetDomains:sensitiveDomains:passwordsCount:", v9, v10, objc_msgSend(v11, "count")))
  {
    case 0:
      v18 = NSString;
      goto LABEL_18;
    case 1:
      v18 = NSString;
LABEL_18:
      v20 = _WBSLocalizedString();
      v21 = [v9 firstObject];
      v26 = objc_msgSend(v18, "stringWithFormat:", v20, v21);
      goto LABEL_19;
    case 2:
      v19 = NSString;
      v20 = _WBSLocalizedString();
      v21 = [v9 objectAtIndexedSubscript:0];
      v22 = [v9 objectAtIndexedSubscript:1];
      objc_msgSend(v19, "stringWithFormat:", v20, v21, v22);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      v23 = NSString;
      v20 = _WBSLocalizedString();
      v21 = [v9 objectAtIndexedSubscript:0];
      v22 = [v9 objectAtIndexedSubscript:1];
      v24 = [v9 objectAtIndexedSubscript:2];
      objc_msgSend(v23, "stringWithFormat:", v20, v21, v22, v24);
      a1 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
      goto LABEL_20;
    case 4:
      v25 = NSString;
      v20 = _WBSLocalizedString();
      v21 = [v9 objectAtIndexedSubscript:0];
      v26 = objc_msgSend(v25, "localizedStringWithFormat:", v20, v21, objc_msgSend(v9, "count") + objc_msgSend(v10, "count") - 1);
LABEL_19:
      a1 = v26;
LABEL_20:

      break;
    case 5:
    case 6:
      _WBSLocalizedString();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topFraudTargetsManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end