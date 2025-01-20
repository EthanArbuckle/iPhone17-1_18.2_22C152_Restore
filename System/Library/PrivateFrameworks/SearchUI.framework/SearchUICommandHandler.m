@interface SearchUICommandHandler
+ (BOOL)hasCustomViewControllerForRowModel:(id)a3 environment:(id)a4;
+ (BOOL)hasValidCommandForResult:(id)a3 feedbackListener:(id)a4;
+ (BOOL)hasValidHandlerForCommand:(id)a3 rowModel:(id)a4 environment:(id)a5;
+ (BOOL)hasValidHandlerForRowModel:(id)a3 environment:(id)a4;
+ (BOOL)isDestructiveButtonItem:(id)a3;
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
+ (id)handlerForButton:(id)a3 rowModel:(id)a4 environment:(id)a5;
+ (id)handlerForButton:(id)a3 rowModel:(id)a4 sectionModel:(id)a5 environment:(id)a6;
+ (id)handlerForCommand:(id)a3 environment:(id)a4;
+ (id)handlerForCommand:(id)a3 rowModel:(id)a4 button:(id)a5 environment:(id)a6;
+ (id)handlerForCommand:(id)a3 rowModel:(id)a4 button:(id)a5 sectionModel:(id)a6 environment:(id)a7;
+ (id)handlerForRowModel:(id)a3 environment:(id)a4;
+ (id)lastCopyCommandForRowModel:(id)a3;
+ (id)previewHandlerForRowModel:(id)a3 environment:(id)a4;
+ (id)revealHandlerForRowModel:(id)a3 environment:(id)a4;
+ (id)swipeActionsForRowModel:(id)a3 isLeading:(BOOL)a4 environment:(id)a5;
+ (id)tapCommandForRowModel:(id)a3 environment:(id)a4;
- (BOOL)prefersContextMenu;
- (BOOL)prefersModalPresentation;
- (BOOL)shouldDeselectAfterExecution;
- (BOOL)supportsCopy;
- (BOOL)supportsShare;
- (BOOL)useSourceViewAsPreviewForDragging;
- (NSItemProvider)itemProvider;
- (NSString)defaultSymbolName;
- (NSString)defaultTitle;
- (SFButtonItem)buttonItem;
- (SFCommand)command;
- (SFPunchout)destinationPunchout;
- (SearchUICommandEnvironment)environment;
- (SearchUICommandHandler)initWithCommand:(id)a3 rowModel:(id)a4 button:(id)a5 environment:(id)a6;
- (SearchUICommandHandler)initWithCommand:(id)a3 rowModel:(id)a4 button:(id)a5 sectionModel:(id)a6 environment:(id)a7;
- (SearchUIRowModel)rowModel;
- (SearchUISectionModel)sectionModel;
- (UIMenu)contextMenu;
- (UIViewController)viewController;
- (id)actionProvider;
- (id)additionalActionMenuItems;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)menuForRowModel:(id)a3 buttonItem:(id)a4 commandEnvironment:(id)a5;
- (id)menuForRowModel:(id)a3 buttonItem:(id)a4 commandEnvironment:(id)a5 doesFallbackToCardSectionButtonItems:(BOOL)a6;
- (id)presentingViewControllerForEnvironment:(id)a3;
- (id)sendFeedbackWithTriggerEvent:(unint64_t)a3 destination:(unint64_t)a4 punchout:(id)a5;
- (unint64_t)destination;
- (void)didPreview;
- (void)executeWithTriggerEvent:(unint64_t)a3;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)requestAuthIfNecessaryAndPresentViewController:(id)a3 animated:(BOOL)a4;
- (void)setButtonItem:(id)a3;
- (void)setCommand:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setRowModel:(id)a3;
- (void)setViewController:(id)a3;
- (void)showViewController:(id)a3;
- (void)wasPerformedWithTriggerEvent:(unint64_t)a3;
- (void)wasPerformedWithTriggerEvent:(unint64_t)a3 punchout:(id)a4;
- (void)wasPerformedWithTriggerEvent:(unint64_t)a3 punchout:(id)a4 destination:(unint64_t)a5;
@end

@implementation SearchUICommandHandler

+ (BOOL)hasValidHandlerForCommand:(id)a3 rowModel:(id)a4 environment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 _searchUICommandHandlerClass];
  if (!v10 || v10 == objc_opt_class())
  {
    v12 = [v9 commandDelegate];
    if ([v12 canPerformCommand:v7])
    {
      BOOL v11 = 1;
    }
    else
    {
      v13 = [v8 cardSection];
      v14 = [v13 commands];
      BOOL v11 = v14 != 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

+ (BOOL)hasValidHandlerForRowModel:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 tapCommandForRowModel:v7 environment:v6];
  LOBYTE(a1) = [a1 hasValidHandlerForCommand:v8 rowModel:v7 environment:v6];

  return (char)a1;
}

+ (BOOL)hasCustomViewControllerForRowModel:(id)a3 environment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 commandDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v6 commandDelegate];
    id v9 = [v5 identifyingResult];
    char v10 = [v8 hasCustomViewControllerForResult:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)hasValidCommandForResult:(id)a3 feedbackListener:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setFeedbackDelegate:v6];
  id v8 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = objc_msgSend(v8, "buildRowModelsFromResult:", v5, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (+[SearchUICommandHandler hasValidHandlerForRowModel:*(void *)(*((void *)&v14 + 1) + 8 * i) environment:v7])
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

+ (id)tapCommandForRowModel:(id)a3 environment:(id)a4
{
  v21[18] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 cardSection];
  id v8 = [v7 command];

  if (!v8)
  {
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    v21[7] = objc_opt_class();
    v21[8] = objc_opt_class();
    v21[9] = objc_opt_class();
    v21[10] = objc_opt_class();
    v21[11] = objc_opt_class();
    v21[12] = objc_opt_class();
    v21[13] = objc_opt_class();
    v21[14] = objc_opt_class();
    v21[15] = objc_opt_class();
    v21[16] = objc_opt_class();
    v21[17] = objc_opt_class();
    [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:18];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "fallbackCommandForRowModel:environment:", v5, v6, (void)v16);
          if (v14)
          {
            id v8 = (void *)v14;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v8 = 0;
LABEL_12:
  }
  return v8;
}

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  return 0;
}

+ (id)handlerForRowModel:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 tapCommandForRowModel:v7 environment:v6];
  id v9 = [a1 handlerForCommand:v8 rowModel:v7 button:0 environment:v6];

  return v9;
}

+ (id)previewHandlerForRowModel:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cardSection];
  id v9 = [v8 previewCommand];

  if (!v9)
  {
    id v9 = [a1 tapCommandForRowModel:v6 environment:v7];
  }
  uint64_t v10 = [a1 handlerForCommand:v9 rowModel:v6 button:0 environment:v7];

  return v10;
}

+ (id)revealHandlerForRowModel:(id)a3 environment:(id)a4
{
  id v28 = a1;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  id v30 = v5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = [v5 cardSection];
  id v7 = [v6 previewButtonItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    unint64_t v11 = 0x1E4F99000uLL;
    unint64_t v12 = 0x1E4F9A000uLL;
LABEL_3:
    uint64_t v13 = 0;
    uint64_t v31 = v9;
    while (1)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(id *)(*((void *)&v32 + 1) + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v15 = [v14 command];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v15 punchout];
          uint64_t v16 = v10;
          unint64_t v17 = v11;
          long long v18 = v7;
          v20 = unint64_t v19 = v12;
          v21 = [v20 preferredOpenableURL];
          char v22 = [v21 isFileURL];

          unint64_t v12 = v19;
          id v7 = v18;
          unint64_t v11 = v17;
          uint64_t v10 = v16;
          uint64_t v9 = v31;
          if (v22)
          {

            v24 = v29;
            v23 = v30;
            v25 = v28;
            if (v15) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
        }
      }
      if (v9 == ++v13)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v24 = v29;
  v23 = v30;
  v25 = v28;
LABEL_14:
  long long v15 = objc_msgSend(v25, "tapCommandForRowModel:environment:", v23, v24, v28);
LABEL_15:
  v26 = objc_msgSend(v25, "handlerForCommand:rowModel:button:environment:", v15, v23, 0, v24, v28);

  return v26;
}

+ (id)handlerForButton:(id)a3 rowModel:(id)a4 environment:(id)a5
{
  return (id)[a1 handlerForButton:a3 rowModel:a4 sectionModel:0 environment:a5];
}

+ (id)handlerForButton:(id)a3 rowModel:(id)a4 sectionModel:(id)a5 environment:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v10 command];
    long long v15 = [v10 previewButtonItems];
    BOOL v16 = [v15 count] != 0;

    if (v14) {
      goto LABEL_10;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = objc_opt_new();
    }
    else {
      id v14 = 0;
    }
    BOOL v16 = 0;
    if (v14) {
      goto LABEL_10;
    }
  }
  if (!v16)
  {
    unint64_t v17 = 0;
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v17 = [a1 handlerForCommand:v14 rowModel:v11 button:v10 sectionModel:v12 environment:v13];
LABEL_11:

  return v17;
}

+ (id)handlerForCommand:(id)a3 environment:(id)a4
{
  return (id)[a1 handlerForCommand:a3 rowModel:0 button:0 environment:a4];
}

+ (id)handlerForCommand:(id)a3 rowModel:(id)a4 button:(id)a5 environment:(id)a6
{
  return (id)[a1 handlerForCommand:a3 rowModel:a4 button:a5 sectionModel:0 environment:a6];
}

+ (id)handlerForCommand:(id)a3 rowModel:(id)a4 button:(id)a5 sectionModel:(id)a6 environment:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = [v11 _searchUICommandHandlerClass];
  if (!v16
    || (unint64_t v17 = (objc_class *)v16,
        [v12 commandDelegate],
        long long v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 canPerformCommand:v11],
        v18,
        v19))
  {
    unint64_t v17 = (objc_class *)objc_opt_class();
  }
  v20 = SearchUITapLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = v11;
    __int16 v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_1E45B5000, v20, OS_LOG_TYPE_DEFAULT, "Command handler for %@ resolved to: %@", (uint8_t *)&v23, 0x16u);
  }

  v21 = (void *)[[v17 alloc] initWithCommand:v11 rowModel:v15 button:v14 sectionModel:v13 environment:v12];
  return v21;
}

+ (BOOL)isDestructiveButtonItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if ([v6 isDestructive])
  {
    char isKindOfClass = 1;
  }
  else
  {
    uint64_t v8 = [v6 command];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend(v6, "previewButtonItems", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 += [a1 isDestructiveButtonItem:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  id v15 = [v6 previewButtonItems];
  if ([v15 count])
  {
    uint64_t v16 = [v6 previewButtonItems];
    BOOL v17 = v12 == [v16 count];
  }
  else
  {
    BOOL v17 = 0;
  }

  return (isKindOfClass | v17) & 1;
}

- (SearchUICommandHandler)initWithCommand:(id)a3 rowModel:(id)a4 button:(id)a5 environment:(id)a6
{
  return [(SearchUICommandHandler *)self initWithCommand:a3 rowModel:a4 button:a5 sectionModel:0 environment:a6];
}

- (SearchUICommandHandler)initWithCommand:(id)a3 rowModel:(id)a4 button:(id)a5 sectionModel:(id)a6 environment:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SearchUICommandHandler;
  BOOL v17 = [(SearchUICommandHandler *)&v23 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_command, a3);
    objc_storeStrong((id *)&v18->_rowModel, a4);
    objc_storeStrong((id *)&v18->_buttonItem, a5);
    objc_storeStrong((id *)&v18->_sectionModel, a6);
    uint64_t v19 = [v16 copy];
    environment = v18->_environment;
    v18->_environment = (SearchUICommandEnvironment *)v19;
  }
  return v18;
}

- (void)executeWithTriggerEvent:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = SearchUITapLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = self;
    _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Performing command handler: %@", (uint8_t *)&v12, 0xCu);
  }

  unint64_t v6 = [(SearchUICommandHandler *)self destination];
  id v7 = [(SearchUICommandHandler *)self destinationPunchout];
  uint64_t v8 = [(SearchUICommandHandler *)self sendFeedbackWithTriggerEvent:a3 destination:v6 punchout:v7];

  uint64_t v9 = [(SearchUICommandHandler *)self environment];
  uint64_t v10 = [v9 feedbackDelegate];
  if (!v8
    || (objc_opt_respondsToSelector() & 1) == 0
    || [v10 shouldHandleCardSectionEngagement:v8])
  {
    uint64_t v11 = [(SearchUICommandHandler *)self command];
    [(SearchUICommandHandler *)self performCommand:v11 triggerEvent:a3 environment:v9];
  }
}

- (id)sendFeedbackWithTriggerEvent:(unint64_t)a3 destination:(unint64_t)a4 punchout:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(SearchUICommandHandler *)self environment];
  uint64_t v9 = [v8 feedbackDelegate];
  uint64_t v10 = [(SearchUICommandHandler *)self rowModel];
  uint64_t v11 = [v10 identifyingResult];
  int v12 = [v10 cardSection];
  id v13 = [(SearchUICommandHandler *)self command];
  uint64_t v14 = [v10 queryId];
  if (!v14) {
    uint64_t v14 = [v8 queryId];
  }
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v11 triggerEvent:a3 destination:a4];
    [v9 didEngageResult:v15];
  }
  if (!v12)
  {
    id v16 = 0;
    if (!v13) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F99F30]) initWithCardSection:v12 destination:v7 triggerEvent:a3 actionCardType:1];
  [v16 setQueryId:v14];
  if (objc_opt_respondsToSelector()) {
    [v9 didEngageCardSection:v16];
  }
  if (v13)
  {
LABEL_12:
    if (objc_opt_respondsToSelector())
    {
      id v21 = v7;
      BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F99FB8]) initWithCommand:v13 cardSection:v12];
      [v17 setQueryId:v14];
      [v17 setResult:v11];
      [v17 setTriggerEvent:a3];
      long long v18 = [(SearchUICommandHandler *)self buttonItem];
      [v17 setButton:v18];

      uint64_t v19 = [v8 section];
      [v17 setResultSection:v19];

      [v9 didPerformCommand:v17];
      id v7 = v21;
    }
  }
LABEL_14:

  return v16;
}

- (unint64_t)destination
{
  return 2;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v27 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 commandDelegate];
  if ([v9 canPerformCommand:v27])
  {
    [v9 performCommand:v27];
    goto LABEL_15;
  }
  uint64_t v10 = [(SearchUICommandHandler *)self viewController];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    [(SearchUICommandHandler *)self prepareViewController:v10 forTriggerEvent:a4];
    int v12 = [v8 feedbackDelegate];
    id v13 = [v8 cardViewDelegate];
    if (![(SearchUICommandHandler *)self prefersModalPresentation])
    {
      v26 = v13;
      uint64_t v14 = [v8 presentingViewController];
      id v15 = [v14 navigationController];

      id v16 = [v15 topViewController];
      BOOL v17 = [v16 navigationItem];
      long long v18 = [v17 rightBarButtonItem];
      uint64_t v19 = [v11 navigationItem];
      [v19 setRightBarButtonItem:v18];

      if (!v15)
      {
        long long v20 = [[SearchUINavigationController alloc] initWithRootViewController:v11];
        [(SearchUINavigationController *)v20 setFeedbackDelegate:v12];
        id v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:v20 action:sel_close];
        id v22 = [v11 navigationItem];
        [v22 setRightBarButtonItem:v21];

        objc_super v23 = v20;
        uint64_t v24 = [(SearchUINavigationController *)v23 view];

        [v24 setAccessibilityIdentifier:@"SearchUIResultSheet"];
        uint64_t v11 = v23;
      }
      id v13 = v26;
    }
    if (objc_opt_respondsToSelector())
    {
      __int16 v25 = v12;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        [(SearchUICommandHandler *)self requestAuthIfNecessaryAndPresentViewController:v11 animated:1];
        goto LABEL_14;
      }
      __int16 v25 = v13;
    }
    [v25 presentViewController:v11];
LABEL_14:
  }
LABEL_15:
}

- (UIViewController)viewController
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  viewController = self->_viewController;
  if (!viewController)
  {
    id v4 = [(SearchUICommandHandler *)self environment];
    id v5 = [v4 commandDelegate];

    unint64_t v6 = [(SearchUICommandHandler *)self command];
    id v7 = [(SearchUICommandHandler *)self environment];
    id v8 = [(SearchUICommandHandler *)self createViewControllerForCommand:v6 environment:v7];
    uint64_t v9 = self->_viewController;
    self->_viewController = v8;

    if (self->_viewController)
    {
      uint64_t v10 = SearchUITapLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = self->_viewController;
        int v16 = 138412546;
        BOOL v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = self;
        _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "View controller (%@) created for command handler: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_8:

        viewController = self->_viewController;
        goto LABEL_9;
      }
      uint64_t v10 = [(SearchUICommandHandler *)self rowModel];
      int v12 = [v10 identifyingResult];
      id v13 = [v5 customViewControllerForResult:v12];
      uint64_t v14 = self->_viewController;
      self->_viewController = v13;
    }
    goto LABEL_8;
  }
LABEL_9:
  return viewController;
}

- (BOOL)prefersContextMenu
{
  return 0;
}

- (UIMenu)contextMenu
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (NSItemProvider)itemProvider
{
  v3 = objc_opt_class();
  id v4 = [(SearchUICommandHandler *)self rowModel];
  id v5 = [v3 lastCopyCommandForRowModel:v4];
  unint64_t v6 = [v5 copyableItem];
  id v7 = +[SearchUIItemProviderUtilities itemProviderForItem:v6];

  return (NSItemProvider *)v7;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  return 0;
}

- (BOOL)shouldDeselectAfterExecution
{
  if ([(SearchUICommandHandler *)self prefersModalPresentation])
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v4 = [(SearchUICommandHandler *)self command];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)wasPerformedWithTriggerEvent:(unint64_t)a3
{
}

- (void)wasPerformedWithTriggerEvent:(unint64_t)a3 punchout:(id)a4
{
}

- (void)wasPerformedWithTriggerEvent:(unint64_t)a3 punchout:(id)a4 destination:(unint64_t)a5
{
  id v5 = [(SearchUICommandHandler *)self sendFeedbackWithTriggerEvent:a3 destination:a5 punchout:a4];
}

- (id)menuForRowModel:(id)a3 buttonItem:(id)a4 commandEnvironment:(id)a5
{
  return [(SearchUICommandHandler *)self menuForRowModel:a3 buttonItem:a4 commandEnvironment:a5 doesFallbackToCardSectionButtonItems:1];
}

+ (id)lastCopyCommandForRowModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v15 = a3;
  v3 = [v15 cardSection];
  id v4 = [v3 previewButtonItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 command];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v13 = [v10 command];

            id v7 = (void *)v13;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)menuForRowModel:(id)a3 buttonItem:(id)a4 commandEnvironment:(id)a5 doesFallbackToCardSectionButtonItems:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v138 = a5;
  v139 = v9;
  uint64_t v11 = [v9 cardSection];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = 0;
LABEL_5:
    if (v6)
    {
      int v12 = [v11 previewButtonItems];
    }
    goto LABEL_7;
  }
  int v12 = [v10 previewButtonItems];
  if (!v12) {
    goto LABEL_5;
  }
LABEL_7:
  v144 = objc_opt_new();
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v160 objects:v167 count:16];
  id v122 = v10;
  v124 = v11;
  obuint64_t j = v13;
  if (!v14)
  {
    LOBYTE(v136) = 0;
    LOBYTE(v16) = 0;
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  int v136 = 0;
  int v16 = 0;
  uint64_t v17 = *(void *)v161;
  uint64_t v125 = *(void *)v161;
  do
  {
    uint64_t v18 = 0;
    uint64_t v126 = v15;
    do
    {
      if (*(void *)v161 != v17) {
        objc_enumerationMutation(obj);
      }
      long long v19 = *(void **)(*((void *)&v160 + 1) + 8 * v18);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v19;
        uint64_t v21 = v19;
        uint64_t v22 = v18;
        id v23 = v20;
        uint64_t v24 = [v20 command];
        objc_opt_class();
        v16 |= objc_opt_isKindOfClass();

        __int16 v25 = [v23 command];
        objc_opt_class();
        v136 |= objc_opt_isKindOfClass();

        id v26 = v23;
        uint64_t v18 = v22;
        long long v19 = v21;
        [v144 addObject:v26];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        uint64_t v134 = v18;
        id v27 = v19;
        uint64_t v28 = [v27 applicationBundleIdentifier];
        v142 = [v27 coreSpotlightIdentifier];
        id v29 = (void *)v28;
        id v30 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v28 allowPlaceholder:1 error:0];
        uint64_t v31 = (void *)MEMORY[0x1E4F28B50];
        long long v32 = [v30 URL];
        long long v33 = [v31 bundleWithURL:v32];

        long long v158 = 0u;
        long long v159 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        id v140 = [v30 spotlightActions];
        uint64_t v34 = [v140 countByEnumeratingWithState:&v156 objects:v166 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          v127 = v30;
          id v128 = v19;
          int v131 = v16;
          v36 = 0;
          uint64_t v37 = *(void *)v157;
          do
          {
            uint64_t v38 = 0;
            v39 = v36;
            do
            {
              if (*(void *)v157 != v37) {
                objc_enumerationMutation(v140);
              }
              v40 = *(void **)(*((void *)&v156 + 1) + 8 * v38);
              v41 = objc_opt_new();
              [v41 setApplicationBundleIdentifier:v29];
              [v41 setCoreSpotlightIdentifier:v142];
              v42 = [v40 identifier];
              [v41 setActionIdentifier:v42];

              v43 = objc_opt_new();
              v44 = [v40 symbolImageName];
              [v43 setSymbolName:v44];

              [v43 setIsTemplate:1];
              v36 = objc_opt_new();

              v45 = [v40 unlocalizedTitle];
              v46 = [v33 localizedStringForKey:v45 value:0 table:@"InfoPlist"];
              [v36 setTitle:v46];

              [v36 setImage:v43];
              [v36 setCommand:v41];
              [v144 addObject:v36];

              ++v38;
              v39 = v36;
            }
            while (v35 != v38);
            uint64_t v35 = [v140 countByEnumeratingWithState:&v156 objects:v166 count:16];
          }
          while (v35);

          int v16 = v131;
          uint64_t v17 = v125;
          uint64_t v15 = v126;
          id v30 = v127;
          long long v19 = v128;
        }

        uint64_t v18 = v134;
      }

LABEL_25:
      ++v18;
    }
    while (v18 != v15);
    uint64_t v15 = [obj countByEnumeratingWithState:&v160 objects:v167 count:16];
  }
  while (v15);
LABEL_29:
  char v47 = v16;

  v48 = objc_opt_new();
  v132 = objc_opt_new();
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v129 = v144;
  uint64_t v49 = [v129 countByEnumeratingWithState:&v152 objects:v165 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v153;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v153 != v51) {
          objc_enumerationMutation(v129);
        }
        uint64_t v53 = *(void *)(*((void *)&v152 + 1) + 8 * i);
        v54 = +[SearchUICommandHandler handlerForButton:rowModel:sectionModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:sectionModel:environment:", v53, v139, 0, v138, v122);
        if (v54)
        {
          if ([(id)objc_opt_class() isDestructiveButtonItem:v53]) {
            v55 = v132;
          }
          else {
            v55 = v48;
          }
          [v55 addObject:v54];
        }
      }
      uint64_t v50 = [v129 countByEnumeratingWithState:&v152 objects:v165 count:16];
    }
    while (v50);
  }

  if ((v47 & 1) == 0 && [(SearchUICommandHandler *)self supportsCopy])
  {
    v56 = objc_opt_new();
    v57 = objc_opt_new();
    [v56 setCommand:v57];
    v58 = [(SearchUICommandHandler *)[SearchUICopyItemHandler alloc] initWithCommand:v57 rowModel:v139 button:v56 environment:v138];
    [(SearchUICopyItemHandler *)v58 setHandlerForCopying:self];
    [v48 addObject:v58];
  }
  v59 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v122);
  [v59 scale];
  double v61 = v60;

  v62 = [MEMORY[0x1E4FAE060] bestAppearanceForSystem];
  unsigned int v143 = [v62 isDark];

  if ((v136 & 1) == 0 && [(SearchUICommandHandler *)self supportsShare])
  {
    v63 = objc_opt_new();
    v64 = objc_opt_new();
    [v63 setCommand:v64];
    v65 = [(SearchUICommandHandler *)[SearchUIShareItemHandler alloc] initWithCommand:v64 rowModel:v139 button:v63 environment:v138];
    [(SearchUIShareItemHandler *)v65 setHandlerForSharing:self];
    [v48 addObject:v65];
  }
  [v48 addObjectsFromArray:v132];
  v135 = objc_opt_new();
  if (([v139 supportsCustomUserReportRequestAfforance] & 1) == 0)
  {
    v66 = [v124 userReportRequest];

    if (v66)
    {
      v67 = [SearchUIRequestUserReportHandler alloc];
      v68 = objc_opt_new();
      v69 = [(SearchUICommandHandler *)self sectionModel];
      v70 = [(SearchUICommandHandler *)self environment];
      v71 = [(SearchUICommandHandler *)v67 initWithCommand:v68 rowModel:v139 button:0 sectionModel:v69 environment:v70];

      v72 = [SearchUISymbolImage alloc];
      v73 = [(SearchUIRequestUserReportHandler *)v71 defaultSymbolName];
      v74 = [(SearchUISymbolImage *)v72 initWithSymbolName:v73];

      v75 = [(SearchUISymbolImage *)v74 loadImageWithScale:v143 isDarkStyle:v61];
      v76 = [v124 userReportRequest];
      v77 = [v76 affordanceText];

      v78 = [(SearchUIRequestUserReportHandler *)v71 contextMenu];
      v79 = (void *)MEMORY[0x1E4FB1970];
      v80 = [v78 children];
      v81 = (void *)[v80 copy];
      v82 = [v79 menuWithTitle:v77 image:v75 identifier:0 options:0 children:v81];

      [v135 addObject:v82];
    }
  }
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v137 = v48;
  uint64_t v145 = [v137 countByEnumeratingWithState:&v148 objects:v164 count:16];
  if (v145)
  {
    id v141 = *(id *)v149;
    do
    {
      for (uint64_t j = 0; j != v145; ++j)
      {
        if (*(id *)v149 != v141) {
          objc_enumerationMutation(v137);
        }
        v84 = *(void **)(*((void *)&v148 + 1) + 8 * j);
        v85 = [v84 buttonItem];
        v86 = [v85 title];
        v87 = v86;
        if (v86)
        {
          id v88 = v86;
        }
        else
        {
          id v88 = [v84 defaultTitle];
        }
        v89 = v88;

        v90 = [v85 image];
        if (v90)
        {
          v91 = [v85 image];
          v92 = +[SearchUIImage imageWithSFImage:v91];
        }
        else
        {
          v91 = [v84 defaultSymbolName];
          if ([v91 length])
          {
            v93 = [SearchUISymbolImage alloc];
            v94 = [v84 defaultSymbolName];
            v92 = [(SearchUISymbolImage *)v93 initWithSymbolName:v94];
          }
          else
          {
            v92 = 0;
          }
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v95 = [v85 useDefaultSymbolFillStyle];
        }
        else {
          int v95 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v95) {
          [(SearchUISymbolImage *)v92 setPreferredFill:0];
        }
        v96 = [(SearchUISymbolImage *)v92 loadImageWithScale:v143 isDarkStyle:v61];
        uint64_t v97 = [v84 command];
        if (v97
          && (v98 = (void *)v97,
              [v84 command],
              v99 = objc_claimAutoreleasedReturnValue(),
              int v100 = [v99 isMemberOfClass:objc_opt_class()],
              v99,
              v98,
              !v100))
        {
          v106 = (void *)MEMORY[0x1E4FB13F0];
          v146[0] = MEMORY[0x1E4F143A8];
          v146[1] = 3221225472;
          v146[2] = __109__SearchUICommandHandler_menuForRowModel_buttonItem_commandEnvironment_doesFallbackToCardSectionButtonItems___block_invoke;
          v146[3] = &unk_1E6E72D80;
          v146[4] = v84;
          id v107 = v85;
          id v147 = v107;
          v108 = [v106 actionWithTitle:v89 image:v96 identifier:0 handler:v146];
          if ([v107 isDestructive]) {
            objc_msgSend(v108, "setAttributes:", objc_msgSend(v108, "attributes") | 2);
          }
          [v135 addObject:v108];
        }
        else
        {
          v101 = [v84 rowModel];
          v102 = [v84 buttonItem];
          v103 = [v84 environment];
          v104 = [v84 menuForRowModel:v101 buttonItem:v102 commandEnvironment:v103];

          if (v104)
          {
            if ([v137 count] == 1)
            {
              BOOL v105 = 1;
            }
            else
            {
              v109 = [v104 children];
              BOOL v105 = [v109 count] == 1;
            }
            if ([v85 isDestructive]) {
              uint64_t v110 = v105 | 2;
            }
            else {
              uint64_t v110 = v105;
            }
            v111 = (void *)MEMORY[0x1E4FB1970];
            v112 = [v104 children];
            v113 = (void *)[v112 copy];
            v114 = [v111 menuWithTitle:v89 image:v96 identifier:0 options:v110 children:v113];

            [v135 addObject:v114];
          }
        }
      }
      uint64_t v145 = [v137 countByEnumeratingWithState:&v148 objects:v164 count:16];
    }
    while (v145);
  }

  v115 = [(SearchUICommandHandler *)self additionalActionMenuItems];
  [v135 addObjectsFromArray:v115];

  if ([v135 count])
  {
    v116 = (void *)MEMORY[0x1E4FB1970];
    v117 = v124;
    v118 = [v124 previewButtonItemsTitle];
    v119 = [v116 menuWithTitle:v118 image:0 identifier:0 options:1 children:v135];

    v120 = v123;
  }
  else
  {
    v119 = 0;
    v120 = v123;
    v117 = v124;
  }

  return v119;
}

uint64_t __109__SearchUICommandHandler_menuForRowModel_buttonItem_commandEnvironment_doesFallbackToCardSectionButtonItems___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) executeWithTriggerEvent:2];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    return [v3 buttonPressed];
  }
  return result;
}

+ (id)swipeActionsForRowModel:(id)a3 isLeading:(BOOL)a4 environment:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v58 = a5;
  v59 = v7;
  uint64_t v8 = [v7 cardSection];
  id v9 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  BOOL v55 = a4;
  if (a4) {
    objc_msgSend(v8, "leadingSwipeButtonItems", v8);
  }
  else {
  id v10 = objc_msgSend(v8, "trailingSwipeButtonItems", v8);
  }
  uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v16 = +[SearchUICommandHandler handlerForButton:v15 rowModel:v7 sectionModel:0 environment:v58];
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v12);
  }

  v56 = objc_opt_new();
  uint64_t v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  double v19 = v18;

  id v20 = [MEMORY[0x1E4FAE060] bestAppearanceForSystem];
  unsigned int v53 = [v20 isDark];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v9;
  uint64_t v21 = v58;
  uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v57)
  {
    uint64_t v54 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v67 != v54) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        uint64_t v24 = [v23 buttonItem];
        __int16 v25 = [v24 title];
        id v26 = v25;
        if (v25)
        {
          id v27 = v25;
        }
        else
        {
          id v27 = [v23 defaultTitle];
        }
        uint64_t v28 = v27;

        id v29 = [v21 feedbackDelegate];
        char v30 = objc_opt_respondsToSelector();

        if (v30)
        {
          uint64_t v31 = [v21 feedbackDelegate];
        }
        else
        {
          uint64_t v31 = 0;
        }
        if ([v24 isDestructive])
        {
          long long v32 = [v24 previewButtonItems];
          BOOL v33 = [v32 count] == 0;
        }
        else
        {
          BOOL v33 = 0;
        }
        uint64_t v34 = (void *)MEMORY[0x1E4FB1688];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke;
        v60[3] = &unk_1E6E72DD0;
        id v35 = v24;
        id v61 = v35;
        BOOL v65 = v55;
        id v36 = v31;
        id v62 = v36;
        id v37 = v59;
        id v63 = v37;
        v64 = v23;
        uint64_t v38 = [v34 contextualActionWithStyle:v33 title:v28 handler:v60];
        if ([v35 isDestructive])
        {
          v39 = [v35 previewButtonItems];

          if (v39)
          {
            v40 = [MEMORY[0x1E4FB1618] systemRedColor];
            [v38 setBackgroundColor:v40];
          }
        }
        v41 = [v35 image];

        if (v41)
        {
          v42 = [v35 image];
          if (v42)
          {
            v43 = [v35 image];
            uint64_t v44 = +[SearchUIImage imageWithSFImage:v43];
          }
          else
          {
            v45 = [SearchUISymbolImage alloc];
            v43 = [v23 defaultSymbolName];
            uint64_t v44 = [(SearchUISymbolImage *)v45 initWithSymbolName:v43];
          }
          v46 = (void *)v44;

          char v47 = [v46 loadImageWithScale:v53 isDarkStyle:v19];
          [v38 setImage:v47];

          uint64_t v21 = v58;
        }
        v48 = [v23 menuForRowModel:v37 buttonItem:v35 commandEnvironment:v21 doesFallbackToCardSectionButtonItems:0];
        [v38 _setMenu:v48];

        [v56 addObject:v38];
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v57);
  }

  uint64_t v49 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v56];

  return v49;
}

void __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  BOOL v6 = [*(id *)(a1 + 32) previewButtonItems];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = 15;
    }
    if ([*(id *)(a1 + 32) isDestructive] && (id v9 = *(void **)(a1 + 40)) != 0)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke_2;
      v11[3] = &unk_1E6E72DA8;
      uint64_t v10 = *(void *)(a1 + 48);
      v11[4] = *(void *)(a1 + 56);
      uint64_t v13 = v8;
      id v12 = v5;
      [v9 removeRowModel:v10 completion:v11];
    }
    else
    {
      [*(id *)(a1 + 56) executeWithTriggerEvent:v8];
      (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    }
  }
}

uint64_t __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) executeWithTriggerEvent:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)prefersModalPresentation
{
  return 0;
}

- (void)requestAuthIfNecessaryAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[SearchUIUtilities canShowViewController:v6])
  {
    [(SearchUICommandHandler *)self presentViewController:v6 animated:v4];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__SearchUICommandHandler_requestAuthIfNecessaryAndPresentViewController_animated___block_invoke;
    v7[3] = &unk_1E6E727F8;
    v7[4] = self;
    id v8 = v6;
    BOOL v9 = v4;
    +[SearchUIUtilities requestDeviceUnlockWithSuccessHandler:v7];
  }
}

uint64_t __82__SearchUICommandHandler_requestAuthIfNecessaryAndPresentViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SearchUICommandHandler *)self prefersModalPresentation])
  {
    uint64_t v7 = [(SearchUICommandHandler *)self environment];
    id v8 = [v6 popoverPresentationController];
    if (v8)
    {
      BOOL v9 = [v7 sourceView];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        uint64_t v13 = [v7 presentingViewController];
        id v11 = [v13 view];
      }
      [v8 setSourceView:v11];
      [v11 bounds];
      objc_msgSend(v8, "setSourceRect:");
    }
    uint64_t v14 = [(SearchUICommandHandler *)self presentingViewControllerForEnvironment:v7];
    [v14 presentViewController:v6 animated:v4 completion:0];
  }
  else if (v4)
  {
    [(SearchUICommandHandler *)self showViewController:v6];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SearchUICommandHandler_presentViewController_animated___block_invoke;
    v15[3] = &unk_1E6E72620;
    v15[4] = self;
    id v16 = v6;
    [v12 performWithoutAnimation:v15];
  }
}

uint64_t __57__SearchUICommandHandler_presentViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showViewController:*(void *)(a1 + 40)];
}

- (void)showViewController:(id)a3
{
  id v4 = a3;
  id v6 = [(SearchUICommandHandler *)self environment];
  id v5 = [(SearchUICommandHandler *)self presentingViewControllerForEnvironment:v6];
  [v5 showViewController:v4 sender:0];
}

- (id)presentingViewControllerForEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 presentingViewController];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [v3 sourceView];
    id v8 = [v7 window];
    id v6 = [v8 rootViewController];
  }
  return v6;
}

- (id)actionProvider
{
  id v3 = [(SearchUICommandHandler *)self rowModel];
  id v4 = [(SearchUICommandHandler *)self buttonItem];
  id v5 = [(SearchUICommandHandler *)self environment];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__SearchUICommandHandler_actionProvider__block_invoke;
  v11[3] = &unk_1E6E72DF8;
  v11[4] = self;
  id v12 = v3;
  id v13 = v4;
  id v14 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = v3;
  BOOL v9 = _Block_copy(v11);

  return v9;
}

uint64_t __40__SearchUICommandHandler_actionProvider__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) menuForRowModel:*(void *)(a1 + 40) buttonItem:*(void *)(a1 + 48) commandEnvironment:*(void *)(a1 + 56)];
}

- (id)additionalActionMenuItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsCopy
{
  return 0;
}

- (BOOL)supportsShare
{
  return 0;
}

- (void)didPreview
{
  id v3 = [(SearchUICommandHandler *)self viewController];
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 3;
  }

  id v5 = [(SearchUICommandHandler *)self sendFeedbackWithTriggerEvent:5 destination:v4 punchout:0];
}

- (void)setViewController:(id)a3
{
}

- (SFCommand)command
{
  return (SFCommand *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommand:(id)a3
{
}

- (SearchUIRowModel)rowModel
{
  return (SearchUIRowModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRowModel:(id)a3
{
}

- (SearchUISectionModel)sectionModel
{
  return (SearchUISectionModel *)objc_getProperty(self, a2, 40, 1);
}

- (SearchUICommandEnvironment)environment
{
  return (SearchUICommandEnvironment *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnvironment:(id)a3
{
}

- (SFButtonItem)buttonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 56, 1);
}

- (void)setButtonItem:(id)a3
{
}

- (BOOL)useSourceViewAsPreviewForDragging
{
  return self->_useSourceViewAsPreviewForDragging;
}

- (NSString)defaultTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)defaultSymbolName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (SFPunchout)destinationPunchout
{
  return (SFPunchout *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPunchout, 0);
  objc_storeStrong((id *)&self->_defaultSymbolName, 0);
  objc_storeStrong((id *)&self->_defaultTitle, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sectionModel, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end