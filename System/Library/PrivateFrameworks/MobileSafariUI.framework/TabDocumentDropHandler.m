@interface TabDocumentDropHandler
+ (BOOL)canAddTab:(id)a3 toSessionWithDragItems:(id)a4;
+ (BOOL)canHandleSession:(id)a3;
+ (BOOL)canPinAllItemsInSession:(id)a3;
+ (id)commonPinnedStateForDragItems:(id)a3;
+ (id)tabsForDragItems:(id)a3;
+ (unint64_t)proposedOperationForSession:(id)a3 intoWindowWithPrivateBrowsingEnabled:(BOOL)a4;
- (TabDocumentDropHandler)init;
- (TabDocumentDropHandler)initWithAlertPresentationViewController:(id)a3;
- (TabDocumentDropHandler)initWithMaximumNumberOfTabs:(unint64_t)a3 alertPresentationViewController:(id)a4;
- (UIViewController)alertPresentationViewController;
- (unint64_t)_minimumNumberOfNewTabsRequiringConfirmation;
- (unint64_t)maximumNumberOfTabs;
- (void)dropItemsForSession:(id)a3 withInsertionHandler:(id)a4;
- (void)dropItemsForSession:(id)a3 withInsertionHandler:(id)a4 completionHandler:(id)a5;
- (void)promptIfNeededToConfirmNumberOfNavigationIntents:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setAlertPresentationViewController:(id)a3;
@end

@implementation TabDocumentDropHandler

- (TabDocumentDropHandler)initWithAlertPresentationViewController:(id)a3
{
  id v4 = a3;
  v5 = +[Application sharedApplication];
  v6 = -[TabDocumentDropHandler initWithMaximumNumberOfTabs:alertPresentationViewController:](self, "initWithMaximumNumberOfTabs:alertPresentationViewController:", [v5 maximumTabCount], v4);

  return v6;
}

- (TabDocumentDropHandler)initWithMaximumNumberOfTabs:(unint64_t)a3 alertPresentationViewController:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TabDocumentDropHandler;
  v7 = [(TabDocumentDropHandler *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_maximumNumberOfTabs = a3;
    objc_storeWeak((id *)&v7->_alertPresentationViewController, v6);
    v9 = v8;
  }

  return v8;
}

- (TabDocumentDropHandler)init
{
  return [(TabDocumentDropHandler *)self initWithAlertPresentationViewController:0];
}

- (void)dropItemsForSession:(id)a3 withInsertionHandler:(id)a4
{
}

- (void)dropItemsForSession:(id)a3 withInsertionHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  id v26 = a5;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v29 = v7;
  v9 = [v7 items];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v37;
    uint64_t v30 = *(void *)v37;
    v31 = v9;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "safari_localTab");
        if (v16)
        {
          [v8 addObject:v15];
        }
        else
        {
          v17 = objc_msgSend(v15, "_sf_localBookmark");
          if ([v17 isFolder])
          {
            uint64_t v18 = v12;
            v19 = [MEMORY[0x1E4FB60E8] safariBookmarkCollection];
            v20 = [v19 descendantsOfBookmarkFolder:v17];
            uint64_t v21 = [v20 count];

            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v12 = v18;
              do
              {
                [v8 addObject:v15];
                --v22;
              }
              while (v22);
            }
            else
            {
              uint64_t v12 = v18;
            }
            uint64_t v13 = v30;
            v9 = v31;
          }
          else
          {
            [v8 addObject:v15];
            uint64_t v21 = 1;
          }
          v12 += v21;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __85__TabDocumentDropHandler_dropItemsForSession_withInsertionHandler_completionHandler___block_invoke;
  v32[3] = &unk_1E6D7DDD0;
  id v34 = v26;
  id v35 = v27;
  id v33 = v8;
  id v23 = v8;
  id v24 = v27;
  id v25 = v26;
  [(TabDocumentDropHandler *)self promptIfNeededToConfirmNumberOfNavigationIntents:v12 withCompletionHandler:v32];
}

uint64_t __85__TabDocumentDropHandler_dropItemsForSession_withInsertionHandler_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)promptIfNeededToConfirmNumberOfNavigationIntents:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentationViewController);
  if (WeakRetained
    && [(TabDocumentDropHandler *)self _minimumNumberOfNewTabsRequiringConfirmation] <= a3)
  {
    if (a3 == 1)
    {
      v8 = _WBSLocalizedString();
      v9 = _WBSLocalizedString();
    }
    else
    {
      uint64_t v10 = NSString;
      uint64_t v11 = _WBSLocalizedString();
      v8 = objc_msgSend(v10, "localizedStringWithFormat:", v11, a3);

      uint64_t v12 = NSString;
      uint64_t v13 = _WBSLocalizedString();
      v9 = objc_msgSend(v12, "localizedStringWithFormat:", v13, a3);
    }
    v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v8 preferredStyle:1];
    v15 = (void *)MEMORY[0x1E4FB1410];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E6D7C998;
    id v16 = v6;
    id v24 = v16;
    v17 = [v15 actionWithTitle:v9 style:0 handler:v23];
    uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
    v19 = _WBSLocalizedString();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E6D7C998;
    id v22 = v16;
    v20 = [v18 actionWithTitle:v19 style:1 handler:v21];

    [v14 addAction:v17];
    [v14 addAction:v20];
    [WeakRetained presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)_minimumNumberOfNewTabsRequiringConfirmation
{
  unint64_t maximumNumberOfTabs = self->_maximumNumberOfTabs;
  unint64_t v3 = 50;
  if (maximumNumberOfTabs < 0x32) {
    unint64_t v3 = 20;
  }
  if (maximumNumberOfTabs >= 0xA) {
    return v3;
  }
  else {
    return 2;
  }
}

+ (unint64_t)proposedOperationForSession:(id)a3 intoWindowWithPrivateBrowsingEnabled:(BOOL)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v6 = [v5 items];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__TabDocumentDropHandler_proposedOperationForSession_intoWindowWithPrivateBrowsingEnabled___block_invoke;
  v11[3] = &unk_1E6D7DDF8;
  v11[4] = &v13;
  BOOL v12 = a4;
  int v7 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v11);

  uint64_t v8 = 2;
  if (!v7) {
    uint64_t v8 = 3;
  }
  if (*((unsigned char *)v14 + 24)) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = v8;
  }
  _Block_object_dispose(&v13, 8);

  return v9;
}

BOOL __91__TabDocumentDropHandler_proposedOperationForSession_intoWindowWithPrivateBrowsingEnabled___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = objc_msgSend(a2, "safari_localWBTab");
  id v4 = v3;
  if (v3 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned __int8 *)(a1 + 40) != [v3 isPrivateBrowsing];
  }

  return v4 == 0;
}

+ (BOOL)canHandleSession:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F78598] canCreateNavigationIntentForDropSession:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v4 items];
    int v7 = [a1 tabsForDragItems:v6];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

+ (BOOL)canPinAllItemsInSession:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v3 = objc_msgSend(a3, "localDragSession", 0);
  id v4 = [v3 items];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "safari_localWBTab");
        uint64_t v11 = objc_msgSend(v9, "safari_localBrowserController");
        BOOL v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13 && !objc_msgSend(v9, "safari_localTabIsPinnable"))
        {

          BOOL v14 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

+ (BOOL)canAddTab:(id)a3 toSessionWithDragItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 canSetPinned])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = +[TabDocumentDropHandler commonPinnedStateForDragItems:v6];
    BOOL v7 = 0;
    if (v8)
    {
      int v9 = [v5 isPinned];
      if (v9 == [v8 BOOLValue]) {
        BOOL v7 = 1;
      }
    }
  }
  return v7;
}

+ (id)commonPinnedStateForDragItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "safari_localWBTab");
        unsigned int v11 = [v10 isPinned];
        v6 += v11 ^ 1;
        v7 += v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
    if (v7 >= 1 && v6 == 0)
    {
      BOOL v13 = (void *)MEMORY[0x1E4F1CC38];
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  if (v7) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v6 <= -1;
  }
  if (v14) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = (void *)MEMORY[0x1E4F1CC28];
  }
LABEL_21:

  return v13;
}

+ (id)tabsForDragItems:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_53);
}

uint64_t __43__TabDocumentDropHandler_tabsForDragItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_localTab");
}

- (unint64_t)maximumNumberOfTabs
{
  return self->_maximumNumberOfTabs;
}

- (UIViewController)alertPresentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentationViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setAlertPresentationViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end