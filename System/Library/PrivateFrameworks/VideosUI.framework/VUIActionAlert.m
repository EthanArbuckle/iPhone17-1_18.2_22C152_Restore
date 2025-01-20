@interface VUIActionAlert
- (Class)controllerClass;
- (NSDictionary)dialogMetrics;
- (NSMutableArray)actionItems;
- (NSString)descriptionString;
- (NSString)dismissButtonTitle;
- (NSString)title;
- (VUIAction)cancelAction;
- (VUIActionAlert)initWithContextData:(id)a3 appContext:(id)a4 controllerClass:(Class)a5;
- (int64_t)style;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setActionItems:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setControllerClass:(Class)a3;
- (void)setDescriptionString:(id)a3;
- (void)setDialogMetrics:(id)a3;
- (void)setDismissButtonTitle:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIActionAlert

- (VUIActionAlert)initWithContextData:(id)a3 appContext:(id)a4 controllerClass:(Class)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v49 = a4;
  v57.receiver = self;
  v57.super_class = (Class)VUIActionAlert;
  v9 = [(VUIActionAlert *)&v57 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(v8, "vui_stringForKey:", @"title");
    title = v9->_title;
    v9->_title = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v8, "vui_stringForKey:", @"description");
    descriptionString = v9->_descriptionString;
    v9->_descriptionString = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v8, "vui_dictionaryForKey:", @"metrics");
    dialogMetrics = v9->_dialogMetrics;
    v9->_dialogMetrics = (NSDictionary *)v14;

    objc_storeStrong((id *)&v9->_controllerClass, a5);
    v16 = objc_msgSend(v8, "vui_stringForKey:", @"dismissButtonTitle");
    if ([v16 length])
    {
      v17 = v16;
      dismissButtonTitle = v9->_dismissButtonTitle;
      v9->_dismissButtonTitle = v17;
    }
    else
    {
      dismissButtonTitle = +[VUILocalizationManager sharedInstance];
      uint64_t v19 = [dismissButtonTitle localizedStringForKey:@"OK"];
      v20 = v9->_dismissButtonTitle;
      v9->_dismissButtonTitle = (NSString *)v19;
    }
    v21 = objc_msgSend(v8, "vui_stringForKey:", @"style");
    BOOL v22 = ![v21 length] || (objc_msgSend(v21, "isEqualToString:", @"actionSheet") & 1) == 0;
    v9->_style = v22;
    v23 = objc_msgSend(v8, "vui_arrayForKey:", @"actionItems");
    if ([v23 count])
    {
      v44 = v21;
      v45 = v16;
      id v46 = v8;
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      actionItems = v9->_actionItems;
      v9->_actionItems = v24;

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v43 = v23;
      id obj = v23;
      uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v50)
      {
        uint64_t v48 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v54 != v48) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            v28 = objc_msgSend(v27, "vui_stringForKey:", @"title", v43);
            v29 = objc_msgSend(v27, "vui_stringForKey:", @"titleImage");
            v30 = [v29 stringByReplacingOccurrencesOfString:@"symbol://" withString:&stru_1F3E921E0];

            v31 = objc_msgSend(v27, "vui_dictionaryForKey:", @"action");
            v32 = objc_msgSend(v31, "vui_dictionaryForKey:", @"actionDataSource");
            v33 = objc_msgSend(v32, "vui_dictionaryForKey:", @"contextData");
            v34 = objc_msgSend(v33, "vui_dictionaryForKey:", @"metrics");
            v35 = +[VUIAction actionWithDictionary:v32 appContext:v49];
            if (v35)
            {
              v51 = v31;
              v52 = v30;
              if (v30)
              {
                v30 = [MEMORY[0x1E4FB1818] vuiSystemImageNamed:v30 withConfiguration:0 accessibilityDescription:0];
              }
              v36 = v9->_actionItems;
              v37 = v28;
              v38 = [[VUIActionAlertActionItem alloc] initWithTitle:v28 titleImage:v30 action:v35 metrics:v34];
              [(NSMutableArray *)v36 addObject:v38];

              v28 = v37;
              v31 = v51;
              v30 = v52;
            }
          }
          uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v50);
      }

      v16 = v45;
      id v8 = v46;
      v23 = v43;
      v21 = v44;
    }
    v39 = objc_msgSend(v8, "vui_dictionaryForKey:", @"cancelAction", v43);
    if (v39)
    {
      uint64_t v40 = +[VUIAction actionWithDictionary:v39 appContext:v49];
      cancelAction = v9->_cancelAction;
      v9->_cancelAction = (VUIAction *)v40;
    }
  }

  return v9;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v31 = a4;
  v33 = [(objc_class *)self->_controllerClass vui_alertControllerWithTitle:self->_title message:self->_descriptionString preferredStyle:self->_style];
  v6 = [(VUIActionAlert *)self dialogMetrics];
  v29 = self;
  [(VUIActionAlert *)self actionItems];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v12 = [v11 title];
        v13 = [v11 titleImage];
        uint64_t v14 = [v11 metrics];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke;
        v41[3] = &unk_1E6DF8FD8;
        v41[4] = v11;
        id v42 = v6;
        id v43 = v32;
        id v44 = v31;
        v15 = +[VUIAlertAction vui_actionWithTitle:v12 titleImage:v13 style:0 metrics:v14 handler:v41];

        objc_msgSend(v33, "vui_addAction:", v15);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v8);
  }
  v16 = [(VUIActionAlert *)v29 cancelAction];
  v17 = [(VUIActionAlert *)v29 dismissButtonTitle];
  dismissButtonTitle = v29->_dismissButtonTitle;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_2;
  v34[3] = &unk_1E6DF9000;
  id v19 = obj;
  id v35 = v19;
  id v20 = v17;
  id v36 = v20;
  id v21 = v6;
  id v37 = v21;
  id v22 = v16;
  id v38 = v22;
  id v23 = v32;
  id v39 = v23;
  id v24 = v31;
  id v40 = v24;
  v25 = +[VUIAlertAction vui_actionWithTitle:dismissButtonTitle titleImage:0 style:1 handler:v34];
  objc_msgSend(v33, "vui_addAction:isPreferred:", v25, 0);
  v26 = +[VUIApplicationRouter topPresentedViewController];
  objc_msgSend(v33, "vui_presentAlertFromPresentingController:animated:completion:", v26, 1, 0);
  if (v21)
  {
    v27 = +[VUIMetricsController sharedInstance];
    [v27 recordDialog:v21];
  }
  if (v24)
  {
    v28 = [(VUIActionAlert *)v29 cancelAction];

    if (!v28) {
      (*((void (**)(id, uint64_t))v24 + 2))(v24, 1);
    }
  }
}

void __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) metrics];
  v3 = objc_msgSend(v2, "vui_dictionaryForKey:", @"click");

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
    v5 = v4;
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(v4, "addEntriesFromDictionary:");
    }
    else
    {
      v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_cold_1(v6);
      }
    }
    uint64_t v7 = +[VUIMetricsController sharedInstance];
    [v7 recordClick:v5];
  }
  uint64_t v8 = [*(id *)(a1 + 32) action];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_76;
  v10[3] = &unk_1E6DF3D80;
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  +[VUIApplicationRouter invokeAction:v8 targetResponder:v9 completion:v10];
}

uint64_t __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) firstObject];
  v3 = [v2 metrics];
  v4 = objc_msgSend(v3, "vui_dictionaryForKey:", @"click");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CA60];
    v14[0] = @"targetId";
    v14[1] = @"targetType";
    v15[0] = @"cancel";
    v15[1] = @"button";
    v15[2] = @"cancel";
    v14[2] = @"actionType";
    v14[3] = @"actionDetails";
    v6 = &stru_1F3E921E0;
    if (*(void *)(a1 + 40)) {
      v6 = *(__CFString **)(a1 + 40);
    }
    uint64_t v12 = @"name";
    v13 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v15[3] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    uint64_t v9 = [v5 dictionaryWithDictionary:v8];

    if (*(void *)(a1 + 48)) {
      objc_msgSend(v9, "addEntriesFromDictionary:");
    }
    uint64_t v10 = +[VUIMetricsController sharedInstance];
    [v10 recordClick:v9];
  }
  return [*(id *)(a1 + 56) performWithTargetResponder:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
}

- (NSMutableArray)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
}

- (VUIAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDictionary)dialogMetrics
{
  return self->_dialogMetrics;
}

- (void)setDialogMetrics:(id)a3
{
}

- (Class)controllerClass
{
  return self->_controllerClass;
}

- (void)setControllerClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerClass, 0);
  objc_storeStrong((id *)&self->_dialogMetrics, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionAlert should have dialog metrics if actionItems have click metrics", v1, 2u);
}

@end