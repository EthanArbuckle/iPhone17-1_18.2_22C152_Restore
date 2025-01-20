@interface WFOpenUserActivityAction
+ (id)userActivityActionWithShortcut:(id)a3 launchOrigin:(id)a4 error:(id *)a5;
+ (void)createActionWithIntent:(id)a3 completionHandler:(id)a4;
+ (void)createActionWithUserActivity:(id)a3 appBundleIdentifier:(id)a4 launchOrigin:(id)a5 completionHandler:(id)a6;
- (BOOL)appResourceRequiresAppInstall;
- (INUserActivityDescriptor)descriptor;
- (NSData)activityData;
- (NSData)activityImageData;
- (NSString)activitySubtitle;
- (NSString)associatedAppBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)launchOrigin;
- (NSUserActivity)userActivity;
- (WFOpenUserActivityAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)appDescriptor;
- (id)contentDestinationWithError:(id *)a3;
- (id)disabledPlatformsForUserActivityWithType:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)metricsIdentifier;
- (id)name;
- (id)serializedParameters;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)generateShortcutRepresentation:(id)a3;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setLaunchOrigin:(id)a3;
- (void)updateAppDescriptorInDatabaseWithSelectedApp:(id)a3;
- (void)updateAppDescriptorWithSelectedApp:(id)a3;
@end

@implementation WFOpenUserActivityAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySubtitle, 0);
  objc_storeStrong((id *)&self->_activityImageData, 0);
  objc_storeStrong((id *)&self->_activityData, 0);
  objc_storeStrong((id *)&self->_launchOrigin, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)activitySubtitle
{
  return self->_activitySubtitle;
}

- (NSData)activityImageData
{
  return self->_activityImageData;
}

- (NSData)activityData
{
  return self->_activityData;
}

- (void)setLaunchOrigin:(id)a3
{
}

- (NSString)launchOrigin
{
  return self->_launchOrigin;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (INUserActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%@” to share %@ with “%@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%@” to run actions from “%@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [(WFOpenUserActivityAction *)self appDescriptor];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F5A788] locationWithAppDescriptor:v4];
  }
  else
  {
    v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315394;
      id v9 = "-[WFOpenUserActivityAction contentDestinationWithError:]";
      __int16 v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Could not get appDescriptor for user activity action: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

- (id)disabledPlatformsForUserActivityWithType:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = (__CFString *)v5;
    if (v7 == @"com.apple.Safari.UserActivity.Bookmarks") {
      goto LABEL_20;
    }
    int v8 = v7;
    char v9 = [(__CFString *)v7 isEqualToString:@"com.apple.Safari.UserActivity.Bookmarks"];

    if (v9) {
      goto LABEL_20;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"WFOpenUserActivityAction.m", 247, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  __int16 v10 = (void *)*MEMORY[0x1E4F28AC0];
  id v11 = v6;
  id v12 = v10;
  if (v12 == v11)
  {

LABEL_20:
    v30[0] = @"Watch";
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    goto LABEL_21;
  }
  v13 = v12;
  if (v11 && v12)
  {
    char v14 = [v11 isEqualToString:v12];

    if (v14) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v15 = (__CFString *)v11;
  if (v15 == @"com.apple.Safari.UserActivity.ReadingList") {
    goto LABEL_20;
  }
  if (v6)
  {
    v16 = v15;
    char v17 = [(__CFString *)v15 isEqualToString:@"com.apple.Safari.UserActivity.ReadingList"];

    if (v17) {
      goto LABEL_20;
    }
    v18 = v16;
    if (v18 == @"com.apple.calendar.continuity.event_selection") {
      goto LABEL_20;
    }
    v19 = v18;
    char v20 = [(__CFString *)v18 isEqualToString:@"com.apple.calendar.continuity.event_selection"];

    if (v20) {
      goto LABEL_20;
    }
    v21 = v19;
    if (v21 == @"com.apple.calendar.continuity.date_selection") {
      goto LABEL_20;
    }
    v22 = v21;
    char v23 = [(__CFString *)v21 isEqualToString:@"com.apple.calendar.continuity.date_selection"];

    if (v23) {
      goto LABEL_20;
    }
    v24 = v22;
    if (v24 == @"com.apple.mobileslideshow.album") {
      goto LABEL_20;
    }
    v25 = v24;
    int v26 = [(__CFString *)v24 isEqualToString:@"com.apple.mobileslideshow.album"];

    if (v26) {
      goto LABEL_20;
    }
  }
  v27 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:

  return v27;
}

- (id)metricsIdentifier
{
  v3 = NSString;
  v4 = [(WFAction *)self identifier];
  id v5 = [(WFOpenUserActivityAction *)self userActivity];
  v6 = [v5 _teamIdentifier];
  id v7 = [(WFOpenUserActivityAction *)self userActivity];
  int v8 = [v7 activityType];
  char v9 = [v3 stringWithFormat:@"%@.%@.%@", v4, v6, v8];

  return v9;
}

- (BOOL)appResourceRequiresAppInstall
{
  return 1;
}

- (void)updateAppDescriptorInDatabaseWithSelectedApp:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self workflow];
  id v15 = [v5 actions];

  uint64_t v6 = [v15 indexOfObject:self];
  id v7 = [(WFOpenUserActivityAction *)self descriptor];
  int v8 = [v7 descriptorWithAppDescriptor:v4];

  char v9 = +[WFDatabaseProxy defaultDatabase];
  __int16 v10 = [(WFAction *)self UUID];
  id v11 = [NSNumber numberWithInteger:v6];
  id v12 = [(WFAction *)self identifier];
  v13 = [(WFAction *)self workflow];
  char v14 = [v13 workflowID];
  [v9 updateAppDescriptor:v8 atKey:@"UserActivityDescriptor" actionUUID:v10 actionIndex:v11 actionIdentifier:v12 workflowID:v14 error:0];
}

- (void)updateAppDescriptorWithSelectedApp:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOpenUserActivityAction *)self descriptor];
  uint64_t v6 = [v5 descriptorWithAppDescriptor:v4];
  [(WFOpenUserActivityAction *)self setDescriptor:v6];

  v7.receiver = self;
  v7.super_class = (Class)WFOpenUserActivityAction;
  [(WFAction *)&v7 updateAppDescriptorWithSelectedApp:v4];
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
  id v5 = a3;
  id v6 = [v5 serializedRepresentation];

  [(WFAction *)self setSupplementalParameterValue:v6 forKey:@"UserActivityDescriptor"];
}

- (id)appDescriptor
{
  v2 = [(WFOpenUserActivityAction *)self descriptor];
  v3 = [v2 appDescriptor];

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = [(WFOpenUserActivityAction *)self activityData];
  if ([v4 length]
    && ([(WFOpenUserActivityAction *)self descriptor],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v4];
    [v6 _setExecutionContext:7];
    objc_super v7 = [(WFAction *)self userInterface];
    if ([v7 isRunningWithSiriUI])
    {
      int v8 = [(WFAction *)self userInterface];
      unint64_t v9 = [v8 executionContext];

      if (v9 <= 9 && ((1 << v9) & 0x206) != 0)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke;
        v15[3] = &unk_1E654EB38;
        v15[4] = self;
        [v6 _createUserActivityDataWithOptions:0 completionHandler:v15];
      }
    }
    else
    {
    }
    id v10 = objc_alloc(MEMORY[0x1E4F5A798]);
    id v11 = [(WFOpenUserActivityAction *)self descriptor];
    id v12 = [v11 bundleIdentifier];
    v13 = (void *)[v10 initWithBundleIdentifier:v12 options:0 URL:0 userActivity:v6];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_217;
    v14[3] = &unk_1E654FAB8;
    v14[4] = self;
    [v13 performWithCompletionHandler:v14];
  }
  else
  {
    [(WFAction *)self finishRunningWithError:0];
  }
}

void __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB4948]);
    objc_super v7 = [*(id *)(a1 + 32) descriptor];
    uint64_t v8 = [v7 bundleIdentifier];
    unint64_t v9 = (void *)[v6 initWithUserActivityData:v5 andBundleIdentifier:v8];

    id v10 = [*(id *)(a1 + 32) userInterface];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_2;
    v13[3] = &unk_1E6550838;
    v13[4] = *(void *)(a1 + 32);
    LOBYTE(v8) = [v10 performSiriRequest:v9 completionHandler:v13];

    if ((v8 & 1) == 0)
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      [v11 finishRunningWithError:v12];
    }
  }
}

uint64_t __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_217(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __55__WFOpenUserActivityAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 error];
    [v4 finishRunningWithError:v5];

    id v6 = v3;
  }
  else
  {

    objc_super v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315394;
      id v11 = "-[WFOpenUserActivityAction runAsynchronouslyWithInput:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = (id)objc_opt_class();
      id v8 = v13;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);
    }
    unint64_t v9 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [v9 finishRunningWithError:v6];
  }
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOpenUserActivityAction *)self userActivity];
  id v6 = [v5 title];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFOpenUserActivityAction;
    id v8 = [(WFAction *)&v11 localizedNameWithContext:v4];
  }
  unint64_t v9 = v8;

  return v9;
}

- (id)name
{
  return 0;
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__WFOpenUserActivityAction_generateStandaloneShortcutRepresentation___block_invoke;
  v6[3] = &unk_1E654EB10;
  id v7 = v4;
  id v5 = v4;
  [(WFOpenUserActivityAction *)self generateShortcutRepresentation:v6];
}

void __69__WFOpenUserActivityAction_generateStandaloneShortcutRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[WFStandaloneShortcutRepresentation alloc] initWithINShortcut:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateShortcutRepresentation:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(WFOpenUserActivityAction *)self activityImageData];
  if ([v5 length])
  {
    id v6 = (void *)MEMORY[0x1E4F304C0];
    id v7 = [(WFOpenUserActivityAction *)self activityImageData];
    id v14 = [v6 imageWithImageData:v7];
  }
  else
  {
    id v14 = 0;
  }

  id v8 = objc_alloc(MEMORY[0x1E4F30738]);
  unint64_t v9 = [(WFOpenUserActivityAction *)self activityData];
  int v10 = [(WFOpenUserActivityAction *)self activitySubtitle];
  objc_super v11 = [(WFOpenUserActivityAction *)self descriptor];
  __int16 v12 = [v11 bundleIdentifier];
  id v13 = (void *)[v8 initWithActivityData:v9 activityImage:v14 activitySubtitle:v10 activityBundleIdentifier:v12];
  v4[2](v4, v13, 0);
}

- (NSString)associatedAppBundleIdentifier
{
  v2 = [(WFOpenUserActivityAction *)self descriptor];
  id v3 = [v2 bundleIdentifier];
  id v4 = INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();

  return (NSString *)v4;
}

- (id)serializedParameters
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v14.receiver = self;
  v14.super_class = (Class)WFOpenUserActivityAction;
  id v4 = [(WFAction *)&v14 serializedParameters];
  id v5 = (void *)[v3 initWithDictionary:v4];

  id v6 = [(WFOpenUserActivityAction *)self activityData];
  [v5 setValue:v6 forKey:@"UserActivityData"];

  id v7 = [(WFOpenUserActivityAction *)self activityImageData];
  [v5 setValue:v7 forKey:@"UserActivityImageData"];

  id v8 = [(WFOpenUserActivityAction *)self activitySubtitle];
  [v5 setValue:v8 forKey:@"UserActivitySubtitle"];

  unint64_t v9 = [(WFOpenUserActivityAction *)self bundleIdentifier];
  [v5 setValue:v9 forKey:@"AppBundleIdentifier"];

  int v10 = [(WFOpenUserActivityAction *)self launchOrigin];
  [v5 setValue:v10 forKey:@"LaunchOrigin"];

  objc_super v11 = [(WFOpenUserActivityAction *)self descriptor];
  __int16 v12 = [v11 serializedRepresentation];
  [v5 setValue:v12 forKey:@"UserActivityDescriptor"];

  return v5;
}

- (WFOpenUserActivityAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v67 = a3;
  id v8 = a4;
  unint64_t v9 = (void *)[a5 mutableCopy];
  int v10 = objc_msgSend(v9, "wf_popObjectForKey:", @"UserActivityData");
  uint64_t v11 = objc_opt_class();
  __int16 v12 = WFEnforceClass(v10, v11);

  id v13 = objc_msgSend(v9, "wf_popObjectForKey:", @"UserActivityImageData");
  uint64_t v14 = objc_opt_class();
  id v15 = WFEnforceClass(v13, v14);

  v16 = objc_msgSend(v9, "wf_popObjectForKey:", @"UserActivitySubtitle");
  uint64_t v17 = objc_opt_class();
  v18 = WFEnforceClass(v16, v17);

  v19 = objc_msgSend(v9, "wf_popObjectForKey:", @"AppBundleIdentifier");
  uint64_t v20 = objc_opt_class();
  v21 = WFEnforceClass(v19, v20);

  v22 = objc_msgSend(v9, "wf_popObjectForKey:", @"LaunchOrigin");
  uint64_t v23 = objc_opt_class();
  v64 = WFEnforceClass(v22, v23);

  v24 = objc_msgSend(v9, "wf_popObjectForKey:", @"UserActivityDescriptor");
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = WFEnforceClass(v24, v25);

  v63 = (void *)v26;
  if (!v12)
  {
    v28 = 0;
    v65 = 0;
    goto LABEL_13;
  }
  uint64_t v27 = [objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v12];
  v28 = (void *)v27;
  if (v27 && v26)
  {
    v62 = v15;
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F30820]) initWithSerializedRepresentation:v26];
    v30 = [MEMORY[0x1E4F302D0] sharedResolver];
    v65 = [v30 resolvedUserActivityMatchingDescriptor:v29];
    goto LABEL_11;
  }
  v65 = 0;
  if (v27 && !v26 && v21)
  {
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v21 allowPlaceholder:1 error:0];
    if (!v29)
    {
      v65 = 0;
      goto LABEL_12;
    }
    v62 = v15;
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithApplicationRecord:v29];
    id v66 = objc_alloc(MEMORY[0x1E4F30820]);
    v61 = [v28 activityType];
    v60 = [v30 localizedName];
    v59 = [v30 bundleIdentifier];
    v58 = [v30 extensionBundleIdentifier];
    v57 = [v30 counterpartIdentifiers];
    v56 = [v30 teamIdentifier];
    v31 = [v30 supportedIntents];
    [v30 bundleURL];
    v32 = v55 = v18;
    v65 = (void *)[v66 initWithUserActivityType:v61 localizedName:v60 bundleIdentifier:v59 extensionBundleIdentifier:v58 counterpartIdentifiers:v57 teamIdentifier:v56 supportedIntents:v31 bundleURL:v32];

    v18 = v55;
LABEL_11:

    id v15 = v62;
LABEL_12:
  }
LABEL_13:
  v33 = [v28 activityType];

  if (v33)
  {
    v34 = [v28 activityType];
    [(WFOpenUserActivityAction *)self disabledPlatformsForUserActivityWithType:v34];
    v35 = v12;
    v36 = self;
    v37 = v21;
    v38 = v18;
    v40 = v39 = v15;

    uint64_t v41 = WFInjectDisabledPlatformsInActionDefinition(v40, v8);

    id v15 = v39;
    v18 = v38;
    v21 = v37;
    self = v36;
    __int16 v12 = v35;
    id v8 = (id)v41;
  }
  v68.receiver = self;
  v68.super_class = (Class)WFOpenUserActivityAction;
  v42 = [(WFAction *)&v68 initWithIdentifier:v67 definition:v8 serializedParameters:v9];
  if (v42)
  {
    uint64_t v43 = [v12 copy];
    activityData = v42->_activityData;
    v42->_activityData = (NSData *)v43;

    objc_storeStrong((id *)&v42->_userActivity, v28);
    uint64_t v45 = [v15 copy];
    activityImageData = v42->_activityImageData;
    v42->_activityImageData = (NSData *)v45;

    uint64_t v47 = [v18 copy];
    activitySubtitle = v42->_activitySubtitle;
    v42->_activitySubtitle = (NSString *)v47;

    uint64_t v49 = [v21 copy];
    bundleIdentifier = v42->_bundleIdentifier;
    v42->_bundleIdentifier = (NSString *)v49;

    objc_storeStrong((id *)&v42->_descriptor, v65);
    uint64_t v51 = [v64 copy];
    launchOrigin = v42->_launchOrigin;
    v42->_launchOrigin = (NSString *)v51;

    v53 = v42;
  }

  return v42;
}

+ (id)userActivityActionWithShortcut:(id)a3 launchOrigin:(id)a4 error:(id *)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 activityData];
  if (![v9 length])
  {
    if (a5)
    {
      uint64_t v51 = *MEMORY[0x1E4F28588];
      v52[0] = @"Could not create action because the user activity data was empty";
      __int16 v12 = (void *)MEMORY[0x1E4F1C9E8];
      id v13 = (__CFString **)v52;
      uint64_t v14 = &v51;
LABEL_6:
      id v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:v15];
    }
LABEL_7:
    v16 = 0;
    goto LABEL_15;
  }
  int v10 = [v7 userActivity];
  uint64_t v11 = [v10 title];
  if (![v11 length])
  {
    uint64_t v17 = [v7 userActivity];
    v18 = [v17 interaction];

    if (v18) {
      goto LABEL_9;
    }
    if (a5)
    {
      uint64_t v49 = *MEMORY[0x1E4F28588];
      v50 = @"Could not create action because the user activity title was empty";
      __int16 v12 = (void *)MEMORY[0x1E4F1C9E8];
      id v13 = &v50;
      uint64_t v14 = &v49;
      goto LABEL_6;
    }
    goto LABEL_7;
  }

LABEL_9:
  v19 = objc_opt_new();
  [v19 setValue:v9 forKey:@"UserActivityData"];
  uint64_t v20 = [v7 activityImage];
  v21 = [v20 _imageData];
  [v19 setValue:v21 forKey:@"UserActivityImageData"];

  v22 = [v7 activitySubtitle];
  [v19 setValue:v22 forKey:@"UserActivitySubtitle"];

  uint64_t v23 = [v7 activityBundleIdentifier];
  [v19 setValue:v23 forKey:@"AppBundleIdentifier"];

  [v19 setValue:v8 forKey:@"LaunchOrigin"];
  id v24 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v25 = [v7 activityBundleIdentifier];
  uint64_t v26 = (void *)[v24 initWithBundleIdentifier:v25 allowPlaceholder:1 error:0];

  if (v26)
  {
    uint64_t v47 = v9;
    id v48 = v8;
    id v44 = v7;
    if (v9) {
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v9];
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v45 = v27;
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithApplicationRecord:v26];
    id v43 = objc_alloc(MEMORY[0x1E4F30820]);
    v42 = [v27 activityType];
    v29 = [v28 localizedName];
    v30 = [v28 bundleIdentifier];
    v31 = [v28 extensionBundleIdentifier];
    v32 = [v28 counterpartIdentifiers];
    [v28 teamIdentifier];
    v33 = v46 = v26;
    v34 = [v28 supportedIntents];
    v35 = [v28 bundleURL];
    v36 = (void *)[v43 initWithUserActivityType:v42 localizedName:v29 bundleIdentifier:v30 extensionBundleIdentifier:v31 counterpartIdentifiers:v32 teamIdentifier:v33 supportedIntents:v34 bundleURL:v35];

    uint64_t v26 = v46;
    v37 = [v36 serializedRepresentation];
    [v19 setValue:v37 forKey:@"UserActivityDescriptor"];

    unint64_t v9 = v47;
    id v8 = v48;
    id v7 = v44;
  }
  v38 = +[WFActionRegistry sharedRegistry];
  v39 = [v38 createActionWithIdentifier:@"is.workflow.actions.useractivity.open" serializedParameters:v19];

  uint64_t v40 = objc_opt_class();
  v16 = WFEnforceClass(v39, v40);

LABEL_15:
  return v16;
}

+ (void)createActionWithIntent:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"WFLOpenUserActivityAction.m", 32, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFLOpenUserActivityAction.m", 33, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithIntent:v7];
  uint64_t v11 = [v7 launchId];
  INExtractAppInfoFromSiriLaunchId();
  id v12 = 0;

  [a1 createActionWithUserActivity:v10 appBundleIdentifier:v12 launchOrigin:0 completionHandler:v9];
}

+ (void)createActionWithUserActivity:(id)a3 appBundleIdentifier:(id)a4 launchOrigin:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, id))a6;
  if ([v10 length])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F30738]) initWithUserActivity:v9 bundleIdentifier:v10];
    id v16 = 0;
    uint64_t v14 = +[WFOpenUserActivityAction userActivityActionWithShortcut:v13 launchOrigin:v11 error:&v16];
    id v15 = v16;
    v12[2](v12, v14, v15);
  }
  else
  {
    v12[2](v12, 0, 0);
  }
}

@end