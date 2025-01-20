@interface SKUIModalDocumentController
- (BOOL)_popoverController:(id)a3 containsStackItem:(id)a4;
- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4;
- (CGRect)_centerRect:(id)a3 adjust:(BOOL)a4;
- (NSArray)documents;
- (SKUIClientContext)clientContext;
- (SKUIModalDocumentController)init;
- (SKUIModalDocumentDataSource)dataSource;
- (SKUIModalDocumentDelegate)delegate;
- (SKUIModalSourceViewProvider)modalSourceViewProvider;
- (SKUIOverlayContainerViewController)_overlayViewController;
- (UINavigationController)_overlayNavigationController;
- (UINavigationControllerDelegate)navigationControllerDelegate;
- (UIViewController)rootViewController;
- (id)_imageForImageViewElement:(id)a3;
- (id)_modalSourceViewProviderFromStackItems;
- (id)_overlayStackItems;
- (id)_presenterViewController;
- (id)_showOverlayContainerViewController;
- (id)navigationDocumentForDocument:(id)a3;
- (id)navigationDocumentForNavigationController:(id)a3;
- (void)_composeReviewViewControllerDidFinish:(id)a3 finished:(BOOL)a4;
- (void)_dismissOverlayControllerWithStackItem:(id)a3 animated:(BOOL)a4;
- (void)_garbageCollectActivityViewController:(id)a3;
- (void)_overlayControllerBackstopAction:(id)a3;
- (void)_popDocument:(BOOL)a3 completion:(id)a4;
- (void)_popDocumentSkippingUserInterfaceUpdates;
- (void)_popOverlayStackItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_popPopoverStackItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentAlertForDialog:(id)a3;
- (void)_presentOverlayViewControllersFromNavigationController:(id)a3;
- (void)_presetPopoverSheetDocument:(id)a3 viewController:(id)a4 popoverPresentationController:(id)a5;
- (void)_promptForStarRating:(id)a3;
- (void)_pushCharityDocument:(id)a3 options:(id)a4;
- (void)_pushDialogDocument:(id)a3 options:(id)a4;
- (void)_pushFamilySetupDocument:(id)a3 options:(id)a4;
- (void)_pushGiftDocument:(id)a3 options:(id)a4;
- (void)_pushOverlayStackItem:(id)a3;
- (void)_pushPlaylistDocument:(id)a3 options:(id)a4;
- (void)_pushPopoverSheetDocument:(id)a3 viewController:(id)a4 popoverPresentationController:(id)a5 options:(id)a6;
- (void)_pushPopoverStackItem:(id)a3;
- (void)_pushRedeemDocument:(id)a3 options:(id)a4;
- (void)_pushSheetDocument:(id)a3 viewController:(id)a4;
- (void)_pushSheetStackItem:(id)a3;
- (void)_sendDidFinishIfApplicable;
- (void)_unloadDocumentForPopoverController:(id)a3;
- (void)_unloadDocumentForViewController:(id)a3;
- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4;
- (void)composeReviewViewController:(id)a3 didSubmitWithEdit:(BOOL)a4;
- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4;
- (void)composeReviewViewControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)ensureOverlayNavigationControllerStackConsistencyForNavigationController:(id)a3;
- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)init;
- (void)overlayContainerViewController:(id)a3 willPopViewController:(id)a4;
- (void)popAllDocuments;
- (void)popDocument;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setClientContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModalSourceViewProvider:(id)a3;
- (void)setNavigationControllerDelegate:(id)a3;
- (void)setOverlayNavigationController:(id)a3 withTransitionCoordinator:(id)a4;
- (void)setRootViewController:(id)a3;
- (void)unloadDocumentForViewController:(id)a3;
@end

@implementation SKUIModalDocumentController

- (SKUIModalDocumentController)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIModalDocumentController init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIModalDocumentController;
  v3 = [(SKUIModalDocumentController *)&v7 init];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackItems = v3->_stackItems;
    v3->_stackItems = v4;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = self->_composeReviewViewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_giftViewControllers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v12++) setDelegate:0];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v10);
  }

  v13 = [(SKUIOverlayContainerViewController *)self->_overlayViewController backstopControl];
  [v13 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(UIPopoverController *)self->_popoverController setDelegate:0];
  v14.receiver = self;
  v14.super_class = (Class)SKUIModalDocumentController;
  [(SKUIModalDocumentController *)&v14 dealloc];
}

- (NSArray)documents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_stackItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "document", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)navigationDocumentForDocument:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__83;
  uint64_t v16 = __Block_byref_object_dispose__83;
  id v17 = 0;
  stackItems = self->_stackItems;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SKUIModalDocumentController_navigationDocumentForDocument___block_invoke;
  v9[3] = &unk_1E6429640;
  id v6 = v4;
  id v10 = v6;
  long long v11 = &v12;
  [(NSMutableArray *)stackItems enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__SKUIModalDocumentController_navigationDocumentForDocument___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [v11 document];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    uint64_t v8 = [v11 navigationDocumentController];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (id)navigationDocumentForNavigationController:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__83;
  uint64_t v16 = __Block_byref_object_dispose__83;
  id v17 = 0;
  stackItems = self->_stackItems;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SKUIModalDocumentController_navigationDocumentForNavigationController___block_invoke;
  v9[3] = &unk_1E6429640;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(NSMutableArray *)stackItems enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __73__SKUIModalDocumentController_navigationDocumentForNavigationController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id obj = [a2 navigationDocumentController];
  id v6 = [obj navigationController];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }
}

- (void)popAllDocuments
{
  for (uint64_t i = self->_stackItems; [(NSMutableArray *)i count]; uint64_t i = self->_stackItems)
    [(SKUIModalDocumentController *)self _popDocument:0 completion:0];

  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

- (void)popDocument
{
  v3 = [(NSMutableArray *)self->_stackItems lastObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 isAnimated];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__SKUIModalDocumentController_popDocument__block_invoke;
    v6[3] = &unk_1E6422020;
    v6[4] = self;
    [(SKUIModalDocumentController *)self _popDocument:v5 completion:v6];
  }
  else
  {
    [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
  }
}

uint64_t __42__SKUIModalDocumentController_popDocument__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDidFinishIfApplicable];
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKUIModalDocumentController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0
    || ([(SKUIModalDocumentController *)self delegate],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 modalDocumentController:self willPushDocument:v6 options:v7],
        v10,
        v11))
  {
    uint64_t v12 = [v6 templateElement];
    uint64_t v13 = [v12 elementType];
    if (v13 <= 86)
    {
      if (v13 > 38)
      {
        if (v13 == 39)
        {
          [(SKUIModalDocumentController *)self _pushFamilySetupDocument:v6 options:v7];
        }
        else
        {
          if (v13 != 44) {
            goto LABEL_28;
          }
          [(SKUIModalDocumentController *)self _pushGiftDocument:v6 options:v7];
        }
      }
      else if (v13 == 16)
      {
        [(SKUIModalDocumentController *)self _pushCharityDocument:v6 options:v7];
      }
      else
      {
        if (v13 != 31) {
          goto LABEL_28;
        }
        [(SKUIModalDocumentController *)self _pushDialogDocument:v6 options:v7];
      }
    }
    else
    {
      if (v13 > 100)
      {
        switch(v13)
        {
          case 101:
            uint64_t v14 = +[SKUIReportAConcernConfiguration configurationWithTemplateElement:v12];
            uint64_t v16 = [[SKUIReportAConcernViewController alloc] initWithConfiguration:v14];
            reportAConcernViewController = self->_reportAConcernViewController;
            if (reportAConcernViewController) {
              [(SKUIReportAConcernViewController *)reportAConcernViewController dismissAnimated:0];
            }
            long long v18 = self->_reportAConcernViewController;
            self->_reportAConcernViewController = v16;
            long long v15 = v16;

            [(SKUIModalDocumentController *)self _pushSheetDocument:v6 viewController:v15];
            goto LABEL_50;
          case 117:
            uint64_t v14 = [[SKUIDocumentStackItem alloc] initWithDocument:v6 presentationOptions:v7];
            [(SKUIDocumentStackItem *)v14 setUsesNavigationControllerForModalPresentation:0];
            long long v19 = [SKUIShareTemplateActivityViewController alloc];
            long long v20 = [(SKUIModalDocumentController *)self clientContext];
            long long v15 = [(SKUIShareTemplateActivityViewController *)v19 initWithTemplateElement:v12 clientContext:v20];

            [(SKUIDocumentStackItem *)v14 setViewController:v15];
            objc_initWeak(location, v12);
            objc_initWeak(&v41, self);
            objc_initWeak(&from, v15);
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __52__SKUIModalDocumentController_pushDocument_options___block_invoke;
            v36[3] = &unk_1E6429690;
            objc_copyWeak(&v37, location);
            objc_copyWeak(&v38, &from);
            objc_copyWeak(&v39, &v41);
            [(SKUIDocumentStackItem *)v15 setCompletionWithItemsHandler:v36];
            long long v21 = [(SKUIDocumentStackItem *)v14 presentationType];
            LODWORD(v20) = [v21 isEqualToString:0x1F1C92F88];

            if (v20)
            {
              [(SKUIModalDocumentController *)self _pushPopoverStackItem:v14];
            }
            else
            {
              v24 = [MEMORY[0x1E4FB16C8] currentDevice];
              uint64_t v25 = [v24 userInterfaceIdiom];

              if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              {
                v26 = [(SKUIDocumentStackItem *)v15 popoverPresentationController];
                [(SKUIModalDocumentController *)self _pushPopoverSheetDocument:v6 viewController:v15 popoverPresentationController:v26 options:v7];
              }
              else
              {
                [(SKUIModalDocumentController *)self _pushSheetStackItem:v14];
              }
            }
            [(NSMutableArray *)self->_stackItems addObject:v14];
            objc_destroyWeak(&v39);
            objc_destroyWeak(&v38);
            objc_destroyWeak(&v37);
            objc_destroyWeak(&from);
            objc_destroyWeak(&v41);
            objc_destroyWeak(location);
            goto LABEL_50;
          case 153:
            uint64_t v14 = [v12 reviewMetadataURLString];
            if (v14) {
              long long v15 = (SKUIDocumentStackItem *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v14];
            }
            else {
              long long v15 = 0;
            }
            v27 = objc_alloc_init(SKUIComposeReviewViewController);
            [(SKUIComposeReviewViewController *)v27 setDelegate:self];
            [(SKUIComposeReviewViewController *)v27 setTemplateViewElement:v12];
            composeReviewViewControllers = self->_composeReviewViewControllers;
            if (!composeReviewViewControllers)
            {
              v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v30 = self->_composeReviewViewControllers;
              self->_composeReviewViewControllers = v29;

              composeReviewViewControllers = self->_composeReviewViewControllers;
            }
            [(NSMutableArray *)composeReviewViewControllers addObject:v27];
            objc_initWeak(location, self);
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __52__SKUIModalDocumentController_pushDocument_options___block_invoke_3;
            v33[3] = &unk_1E6422098;
            objc_copyWeak(&v35, location);
            v31 = v27;
            v34 = v31;
            [(SKUIComposeReviewViewController *)v31 loadReviewWithURL:v15 completionBlock:v33];
            [(SKUIModalDocumentController *)self _pushSheetDocument:v6 viewController:v31];

            objc_destroyWeak(&v35);
            objc_destroyWeak(location);

            goto LABEL_50;
        }
LABEL_28:
        uint64_t v14 = [(SKUIModalDocumentController *)self clientContext];
        long long v15 = [[SKUIDocumentStackItem alloc] initWithDocument:v6 presentationOptions:v7];
        long long v22 = [(SKUIDocumentStackItem *)v14 modalDocumentViewControllerForDocument:v6 options:v7];
        if (v22)
        {
          if (objc_opt_respondsToSelector()) {
            [v22 setModalDocumentController:self];
          }
          [v22 setClientContext:v14];
          if (objc_opt_respondsToSelector()) {
            -[SKUIDocumentStackItem setUsesNavigationControllerForModalPresentation:](v15, "setUsesNavigationControllerForModalPresentation:", [v22 needsNavigationDocument]);
          }
          v23 = v22;
        }
        else
        {
          v23 = [[SKUIDocumentContainerViewController alloc] initWithDocument:v6 options:v7 clientContext:v14];
          if (!v23)
          {
            NSLog(&cfstr_NoViewControll_0.isa, v6, v12, v7);
LABEL_49:

LABEL_50:
            goto LABEL_51;
          }
        }
        [(SKUIDocumentStackItem *)v15 setViewController:v23];
        v32 = [(SKUIDocumentStackItem *)v15 presentationType];
        if ([v32 isEqualToString:0x1F1C8FF88])
        {
          [(SKUIModalDocumentController *)self _pushOverlayStackItem:v15];
        }
        else if ([v32 isEqualToString:0x1F1C92F88])
        {
          [(SKUIModalDocumentController *)self _pushPopoverStackItem:v15];
        }
        else
        {
          [(SKUIModalDocumentController *)self _pushSheetStackItem:v15];
        }
        [(NSMutableArray *)self->_stackItems addObject:v15];

        goto LABEL_49;
      }
      if (v13 == 87)
      {
        [(SKUIModalDocumentController *)self _pushPlaylistDocument:v6 options:v7];
      }
      else
      {
        if (v13 != 98) {
          goto LABEL_28;
        }
        [(SKUIModalDocumentController *)self _pushRedeemDocument:v6 options:v7];
      }
    }
LABEL_51:
  }
}

void __52__SKUIModalDocumentController_pushDocument_options___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SKUIModalDocumentController_pushDocument_options___block_invoke_2;
  v5[3] = &unk_1E6429668;
  objc_copyWeak(&v7, a1 + 4);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, a1 + 5);
  objc_copyWeak(&v9, a1 + 6);
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __52__SKUIModalDocumentController_pushDocument_options___block_invoke_2(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v2 = SKUIShareSheetActivityTypeForUIActivityType(a1[4]);
    if (v2) {
      id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v2, @"activityType", 0);
    }
    else {
      id v3 = 0;
    }
    [WeakRetained dispatchEventOfType:14 canBubble:1 isCancelable:1 extraInfo:v3 completionBlock:0];
  }
  id v4 = objc_loadWeakRetained(a1 + 6);
  if (v4)
  {
    id v5 = objc_loadWeakRetained(a1 + 7);
    [v5 _garbageCollectActivityViewController:v4];

    [v4 setCompletionWithItemsHandler:0];
  }
}

void __52__SKUIModalDocumentController_pushDocument_options___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _composeReviewViewControllerDidFinish:*(void *)(a1 + 32) finished:0];
  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v11 = self->_stackItems;
  id v12 = (id)[(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [v15 document];

        if (v16 == v8)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v17 = [v12 presentationType];
  char v18 = [v17 isEqualToString:0x1F1C8FF88];

  if (v18)
  {
    long long v19 = [SKUIDocumentContainerViewController alloc];
    long long v20 = [(SKUIModalDocumentController *)self clientContext];
    long long v21 = [(SKUIDocumentContainerViewController *)v19 initWithDocument:v9 options:v10 clientContext:v20];

    if (v21)
    {
      long long v22 = [v12 viewController];
      v23 = [v22 navigationController];
      v24 = v23;
      if (v23)
      {
        uint64_t v25 = [v23 viewControllers];
        v26 = (void *)[v25 mutableCopy];

        objc_msgSend(v26, "replaceObjectAtIndex:withObject:", objc_msgSend(v26, "indexOfObjectIdenticalTo:", v22), v21);
        [v24 setViewControllers:v26 animated:0];
      }
      else
      {
        [(SKUIOverlayContainerViewController *)self->_overlayViewController replaceViewController:v22 withViewController:v21];
      }
      [v12 setViewController:v21];
      [v8 onUnload];
      [v12 _setDocument:v9];
    }
    else
    {
      long long v22 = [v9 templateElement];
      NSLog(&cfstr_NoViewControll_0.isa, v9, v22, v10);
    }
  }
  else
  {
    NSLog(&cfstr_InvalidReplace.isa);
  }
}

- (void)setOverlayNavigationController:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (UINavigationController *)a3;
  id v8 = a4;
  p_overlayNavigationController = &self->_overlayNavigationController;
  if (self->_overlayNavigationController != v7)
  {
    if (v7)
    {
      id v10 = [(SKUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
      [(SKUIModalDocumentController *)self _dismissOverlayControllerWithStackItem:0 animated:0];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            -[UINavigationController pushViewController:animated:](v7, "pushViewController:animated:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), 0, (void)v16);
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
    else
    {
      -[SKUIModalDocumentController _presentOverlayViewControllersFromNavigationController:](self, "_presentOverlayViewControllersFromNavigationController:");
    }
    objc_storeStrong((id *)p_overlayNavigationController, a3);
  }
}

- (void)ensureOverlayNavigationControllerStackConsistencyForNavigationController:(id)a3
{
  id v4 = (UINavigationController *)a3;
  id v5 = v4;
  if (v4 && self->_overlayNavigationController == v4)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__83;
    uint64_t v15 = __Block_byref_object_dispose__83;
    id v16 = [MEMORY[0x1E4F1CA48] array];
    stackItems = self->_stackItems;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __104__SKUIModalDocumentController_ensureOverlayNavigationControllerStackConsistencyForNavigationController___block_invoke;
    v7[3] = &unk_1E64296B8;
    id v8 = v5;
    id v9 = self;
    id v10 = &v11;
    [(NSMutableArray *)stackItems enumerateObjectsUsingBlock:v7];
    objc_storeStrong((id *)&self->_stackItems, (id)v12[5]);

    _Block_object_dispose(&v11, 8);
  }
}

void __104__SKUIModalDocumentController_ensureOverlayNavigationControllerStackConsistencyForNavigationController___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 presentationType];
  [v3 isEqualToString:0x1F1C8FF88];

  id v4 = [*(id *)(a1 + 32) viewControllers];
  id v5 = [v10 viewController];
  if ([v4 containsObject:v5])
  {

LABEL_4:
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
    goto LABEL_6;
  }
  id v6 = [*(id *)(*(void *)(a1 + 40) + 72) viewControllers];
  id v7 = [v10 viewController];
  int v8 = [v6 containsObject:v7];

  if (v8) {
    goto LABEL_4;
  }
  id v9 = [v10 document];
  [v9 onUnload];

LABEL_6:
}

- (SKUIOverlayContainerViewController)_overlayViewController
{
  return self->_overlayViewController;
}

- (UINavigationController)_overlayNavigationController
{
  return self->_overlayNavigationController;
}

- (void)_popDocumentSkippingUserInterfaceUpdates
{
  id v4 = [(NSMutableArray *)self->_stackItems lastObject];
  if (v4)
  {
    id v3 = [v4 document];
    [v3 onUnload];

    [(NSMutableArray *)self->_stackItems removeLastObject];
  }
  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v4 = a3;
  [v4 setDelegate:0];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4
{
  id v6 = a4;
  [(SKUIModalDocumentController *)self _composeReviewViewControllerDidFinish:a3 finished:0];
  [(SKUIModalDocumentController *)self _presentAlertForDialog:v6];
}

- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4
{
}

- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4
{
  id v6 = a3;
  [a4 rating];
  float v8 = v7;
  if (v7 < 0.00000011921) {
    [(SKUIModalDocumentController *)self _promptForStarRating:v6];
  }

  return v8 >= 0.00000011921;
}

- (void)composeReviewViewControllerDidCancel:(id)a3
{
}

- (void)composeReviewViewController:(id)a3 didSubmitWithEdit:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  float v7 = [v6 templateViewElement];

  if (v7)
  {
    float v8 = [v6 templateViewElement];
    uint64_t v11 = @"edited";
    id v9 = [NSNumber numberWithBool:v4];
    v12[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v8 dispatchEventOfType:14 canBubble:1 isCancelable:1 extraInfo:v10 completionBlock:0];
  }
  [(SKUIModalDocumentController *)self _composeReviewViewControllerDidFinish:v6 finished:1];
}

- (void)_composeReviewViewControllerDidFinish:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  [(SKUIModalDocumentController *)self _unloadDocumentForViewController:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SKUIModalDocumentController__composeReviewViewControllerDidFinish_finished___block_invoke;
  v7[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v8 = a4;
  [v6 dismissViewControllerAnimated:1 completion:v7];
  [v6 setDelegate:0];
  [(NSMutableArray *)self->_composeReviewViewControllers removeObjectIdenticalTo:v6];

  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

void __78__SKUIModalDocumentController__composeReviewViewControllerDidFinish_finished___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = [v1 imageNamed:@"toast-review" inBundle:v2];

    id v3 = [SKUIToastViewController alloc];
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"TOAST_REVIEW_FINISHED_PRIMARY" value:&stru_1F1C879E8 table:0];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    float v7 = [v6 localizedStringForKey:@"TOAST_REVIEW_FINISHED_SECONDARY" value:&stru_1F1C879E8 table:0];
    BOOL v8 = [(SKUIToastViewController *)v3 initWithTitle:v5 description:v7 image:v9];

    [(SKUIToastViewController *)v8 present];
  }
}

- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  id v5 = a3;
  [(SKUIModalDocumentController *)self _unloadDocumentForViewController:v5];
  [v5 dismissViewControllerAnimated:1 completion:0];
  [v5 setDelegate:0];
  [(NSMutableArray *)self->_giftViewControllers removeObjectIdenticalTo:v5];

  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

- (void)unloadDocumentForViewController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 setModalDocumentController:0];
  }
  [(SKUIModalDocumentController *)self _unloadDocumentForViewController:v4];
}

- (void)overlayContainerViewController:(id)a3 willPopViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__83;
  long long v17 = __Block_byref_object_dispose__83;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  stackItems = self->_stackItems;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SKUIModalDocumentController_overlayContainerViewController_willPopViewController___block_invoke;
  v10[3] = &unk_1E6429640;
  id v9 = v7;
  id v11 = v9;
  uint64_t v12 = &v13;
  [(NSMutableArray *)stackItems enumerateObjectsUsingBlock:v10];
  objc_storeStrong((id *)&self->_stackItems, (id)v14[5]);

  _Block_object_dispose(&v13, 8);
}

void __84__SKUIModalDocumentController_overlayContainerViewController_willPopViewController___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 viewController];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    id v5 = [v6 document];

    [v5 onUnload];
    id v6 = v5;
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  id v4 = (UIPopoverController *)a3;
  [(SKUIModalDocumentController *)self _unloadDocumentForPopoverController:v4];
  [(UIPopoverController *)v4 setDelegate:0];
  if (self->_popoverController == v4)
  {
    self->_popoverController = 0;
  }
  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__SKUIModalDocumentController_popoverPresentationControllerDidDismissPopover___block_invoke;
  v11[3] = &unk_1E6427028;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    id v9 = [(NSMutableArray *)self->_stackItems objectAtIndex:v7];
    id v10 = [v9 document];
    [v10 onUnload];

    [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v8];
  }
  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

BOOL __78__SKUIModalDocumentController_popoverPresentationControllerDidDismissPopover___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 popoverPresentationController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 presentedViewController];
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 presentingViewController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__SKUIModalDocumentController_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke;
    v9[3] = &unk_1E6421FF8;
    void v9[4] = self;
    id v10 = v7;
    [v8 dismissViewControllerAnimated:0 completion:v9];
  }
}

uint64_t __96__SKUIModalDocumentController_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _garbageCollectActivityViewController:*(void *)(a1 + 40)];
}

- (void)_overlayControllerBackstopAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v5 = [(SKUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        stackItems = self->_stackItems;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke;
        v14[3] = &unk_1E6429700;
        v14[4] = v10;
        id v15 = v4;
        [(NSMutableArray *)stackItems enumerateObjectsUsingBlock:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke_2;
  v13[3] = &unk_1E6426698;
  v13[4] = self;
  [v4 enumerateIndexesUsingBlock:v13];
  if ([v4 count])
  {
    id v12 = -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", [v4 firstIndex]);
    [(NSMutableArray *)self->_stackItems removeObjectsAtIndexes:v4];
  }
  else
  {
    id v12 = 0;
  }
  -[SKUIModalDocumentController _dismissOverlayControllerWithStackItem:animated:](self, "_dismissOverlayControllerWithStackItem:animated:", v12, [v12 isAnimated]);
  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

void __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 viewController];
  BOOL IsDescendent = SKUIViewControllerIsDescendent(v7, *(void **)(a1 + 32));

  if (IsDescendent)
  {
    [*(id *)(a1 + 40) addIndex:a3];
    *a4 = 1;
  }
}

void __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 104) objectAtIndex:a2];
  uint64_t v2 = [v4 document];
  [v2 onDisappear];

  id v3 = [v4 document];
  [v3 onUnload];
}

- (CGRect)_centerRect:(id)a3 adjust:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 bounds];
  float v6 = CGRectGetMidX(v21) + -2.0;
  double v7 = floorf(v6);
  [v5 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  float v16 = CGRectGetMidY(v22) + -2.0;
  double v17 = floorf(v16);
  if (v4) {
    double v18 = v7;
  }
  else {
    double v18 = 1.0;
  }
  if (v4) {
    double v19 = v17;
  }
  else {
    double v19 = 1.0;
  }
  double v20 = v7;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v20;
  return result;
}

- (void)_dismissOverlayControllerWithStackItem:(id)a3 animated:(BOOL)a4
{
  float v6 = self->_overlayViewController;
  double v7 = [(SKUIOverlayContainerViewController *)self->_overlayViewController backstopControl];
  [v7 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  overlayViewController = self->_overlayViewController;
  self->_overlayViewController = 0;

  if (a4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__SKUIModalDocumentController__dismissOverlayControllerWithStackItem_animated___block_invoke;
    v10[3] = &unk_1E6422020;
    CGFloat v11 = v6;
    [(SKUIOverlayContainerViewController *)v11 dismissWithFadeTransitionCompletionBlock:v10];
  }
  else
  {
    CGFloat v9 = [(SKUIOverlayContainerViewController *)v6 view];
    [v9 removeFromSuperview];

    [(SKUIOverlayContainerViewController *)v6 removeFromParentViewController];
  }
}

uint64_t __79__SKUIModalDocumentController__dismissOverlayControllerWithStackItem_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);

  return [v3 removeFromParentViewController];
}

- (void)_garbageCollectActivityViewController:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(UIPopoverController *)self->_popoverController contentViewController];
  BOOL IsDescendent = SKUIViewControllerIsDescendent(v7, v4);

  if (IsDescendent)
  {
    [(UIPopoverController *)self->_popoverController setDelegate:0];
    popoverController = self->_popoverController;
    self->_popoverController = 0;
  }
  [(SKUIModalDocumentController *)self _unloadDocumentForViewController:v7];
  [(SKUIModalDocumentController *)self _sendDidFinishIfApplicable];
}

- (id)_imageForImageViewElement:(id)a3
{
  id v3 = [a3 resourceName];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = SKUIImageWithResourceName(v3);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_overlayStackItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = self->_stackItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "presentationType", (void)v14);
        int v11 = [v10 isEqualToString:0x1F1C8FF88];

        if (v11) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  double v12 = (void *)[v3 copy];

  return v12;
}

- (void)_popDocument:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  uint64_t v6 = [(NSMutableArray *)self->_stackItems lastObject];
  uint64_t v7 = v6;
  if (v6)
  {
    double v8 = [v6 presentationType];
    if ([v8 isEqualToString:0x1F1C8FF88])
    {
      [(SKUIModalDocumentController *)self _popOverlayStackItem:v7 animated:v4 completion:v12];
    }
    else if ([v8 isEqualToString:0x1F1C92F88])
    {
      [(SKUIModalDocumentController *)self _popPopoverStackItem:v7 animated:v4 completion:v12];
    }
    else
    {
      CGFloat v9 = [v7 navigationDocumentController];
      double v10 = [v9 navigationController];

      if (!v10)
      {
        double v10 = [v7 viewController];
      }
      [v10 dismissViewControllerAnimated:v4 completion:v12];
    }
    int v11 = [v7 document];
    [v11 onUnload];

    [(NSMutableArray *)self->_stackItems removeLastObject];
  }
}

- (BOOL)_popoverController:(id)a3 containsStackItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 contentViewController];
  uint64_t v7 = [v5 navigationDocumentController];
  double v8 = [v7 navigationController];

  CGFloat v9 = [v5 viewController];

  BOOL v11 = SKUIViewControllerIsDescendent(v9, v6)
     || ([v9 navigationController],
         double v10 = objc_claimAutoreleasedReturnValue(),
         v10,
         v10 == v6)
     || SKUIViewControllerIsDescendent(v8, v6);

  return v11;
}

- (void)_popOverlayStackItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  CGFloat v9 = [(SKUIOverlayContainerViewController *)self->_overlayViewController viewControllers];
  unint64_t v10 = [v9 count];

  if (v10 < 2) {
    [(SKUIModalDocumentController *)self _dismissOverlayControllerWithStackItem:v11 animated:v6];
  }
  else {
    [(SKUIOverlayContainerViewController *)self->_overlayViewController popViewControllerAnimated:v6 completion:v8];
  }
}

- (void)_popPopoverStackItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [(UIPopoverController *)self->_popoverController setDelegate:0];
  id v8 = [(UIPopoverController *)self->_popoverController contentViewController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SKUIModalDocumentController__popPopoverStackItem_animated_completion___block_invoke;
  v10[3] = &unk_1E6423A78;
  void v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 dismissViewControllerAnimated:v5 completion:v10];
}

void __72__SKUIModalDocumentController__popPopoverStackItem_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0;
  }
}

- (id)_presenterViewController
{
  uint64_t v2 = [(SKUIModalDocumentController *)self rootViewController];
  uint64_t v3 = [v2 presentedViewController];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    while (1)
    {
      BOOL v5 = [v2 presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      id v7 = [v2 presentedViewController];

      BOOL v4 = [v7 presentedViewController];
      uint64_t v2 = v7;
      if (!v4) {
        goto LABEL_7;
      }
    }
  }
  id v7 = v2;
LABEL_7:

  return v7;
}

- (void)_presentOverlayViewControllersFromNavigationController:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  BOOL v4 = [v20 viewControllers];
  BOOL v5 = (void *)[v4 mutableCopy];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = self;
  id v7 = [(SKUIModalDocumentController *)self _overlayStackItems];
  unint64_t v8 = [v5 count] - 1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) viewController];
        uint64_t v15 = [v5 indexOfObjectIdenticalTo:v14];
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v16 = v15;
          [v6 addObject:v14];
          [v5 removeObjectAtIndex:v16];
          if (v8 >= v16) {
            unint64_t v8 = v16;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if (v8 < [v5 count]) {
    objc_msgSend(v5, "removeObjectsInRange:", v8, objc_msgSend(v5, "count") - v8);
  }
  if ([v6 count])
  {
    long long v17 = [(SKUIModalDocumentController *)v19 _showOverlayContainerViewController];
    [v17 showViewControllers:v6];
    [v20 setViewControllers:v5 animated:0];
    double v18 = [v20 view];
    [v18 layoutIfNeeded];
  }
}

- (void)_pushCharityDocument:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v13 = [v5 templateElement];
  id v6 = [v13 campaignIdentifier];
  if (v6)
  {
    id v7 = [[SKUIDonationViewController alloc] initWithCharityIdentifier:v6];
  }
  else
  {
    unint64_t v8 = [v13 charityMetadataURLString];
    if (v8)
    {
      id v9 = [SKUIURL alloc];
      uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
      uint64_t v11 = [(SKUIURL *)v9 initWithURL:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v7 = [[SKUIDonationViewController alloc] initWithURL:v11];
  }
  uint64_t v12 = [(SKUIModalDocumentController *)self clientContext];
  [(SKUIDonationViewController *)v7 setClientContext:v12];

  [(SKUIModalDocumentController *)self _pushSheetDocument:v5 viewController:v7];
}

- (void)_presentAlertForDialog:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    dialogController = self->_dialogController;
    if (!dialogController)
    {
      id v6 = objc_alloc_init(SKUIStoreDialogController);
      id v7 = self->_dialogController;
      self->_dialogController = v6;

      dialogController = self->_dialogController;
    }
    unint64_t v8 = [(SKUIModalDocumentController *)self _presenterViewController];
    [(SKUIStoreDialogController *)dialogController presentDialog:v9 fromViewController:v8];

    id v4 = v9;
  }
}

- (void)_presetPopoverSheetDocument:(id)a3 viewController:(id)a4 popoverPresentationController:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v12 = [[SKUIDocumentStackItem alloc] initWithDocument:v10 presentationOptions:0];

  [(SKUIDocumentStackItem *)v12 setViewController:v9];
  [(SKUIDocumentStackItem *)v12 setPopoverPresentationController:v8];

  [(NSMutableArray *)self->_stackItems addObject:v12];
  uint64_t v11 = [(SKUIModalDocumentController *)self _presenterViewController];
  [v11 presentViewController:v9 animated:1 completion:0];
}

- (void)_promptForStarRating:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  id v4 = [MEMORY[0x1E4F3C2F0] starRatingAlertController];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __52__SKUIModalDocumentController__promptForStarRating___block_invoke;
  id v8 = &unk_1E64285E0;
  objc_copyWeak(&v9, &location);
  [v4 setCompletion:&v5];
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __52__SKUIModalDocumentController__promptForStarRating___block_invoke(uint64_t a1, int a2, float a3)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(float *)&double v4 = a3;
    [WeakRetained setRating:v4];
    [WeakRetained submitReview];
  }
}

- (void)_pushDialogDocument:(id)a3 options:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v37 = a4;
  v40 = v5;
  id v41 = [v5 templateElement];
  uint64_t v6 = [v41 message];
  id v7 = [v6 text];
  id v39 = [v7 string];

  id v8 = [v41 title];
  id v9 = [v8 text];
  id v38 = [v9 string];

  switch([v41 dialogType])
  {
    case 0:
    case 3:
      id v47 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v38 message:v39 preferredStyle:1];
      BOOL v10 = 0;
      goto LABEL_5;
    case 1:
      id v47 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v38 message:v39 preferredStyle:0];
      v36 = [v47 popoverPresentationController];
      [v36 setDelegate:self];
      goto LABEL_6;
    case 2:
      objc_initWeak(&location, self);
      uint64_t v11 = [(SKUIModalDocumentController *)self dataSource];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke;
      v57[3] = &unk_1E6429728;
      objc_copyWeak(&v58, &location);
      id v47 = [v11 modalDocumentController:self alertControllerForDocument:v40 withDismissObserverBlock:v57 options:v37];

      BOOL v10 = v47 != 0;
      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);
LABEL_5:
      v36 = 0;
      if (v10) {
        goto LABEL_42;
      }
LABEL_6:
      if (v47)
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v47);
        [v41 buttons];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v12)
        {
          uint64_t v46 = *(void *)v53;
          do
          {
            uint64_t v48 = v12;
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v53 != v46) {
                objc_enumerationMutation(obj);
              }
              long long v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              uint64_t v15 = objc_msgSend(v14, "buttonViewType", v36);
              uint64_t v16 = 2;
              if (v15 != 11) {
                uint64_t v16 = 0;
              }
              BOOL v17 = v15 != 10 && v15 != 11;
              if (v15 == 10) {
                uint64_t v18 = 1;
              }
              else {
                uint64_t v18 = v16;
              }
              uint64_t v19 = [v14 buttonImage];
              if (v19)
              {
                id v20 = [(SKUIModalDocumentController *)self _imageForImageViewElement:v19];
              }
              else
              {
                id v20 = 0;
              }
              long long v21 = (void *)MEMORY[0x1E4FB1410];
              long long v22 = [v14 buttonText];
              long long v23 = [v22 string];
              v49[0] = MEMORY[0x1E4F143A8];
              v49[1] = 3221225472;
              v49[2] = __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke_2;
              v49[3] = &unk_1E6429750;
              objc_copyWeak(&v50, &location);
              objc_copyWeak(&v51, &from);
              v49[4] = v14;
              long long v24 = [v21 _actionWithTitle:v23 image:v20 style:v18 handler:v49 shouldDismissHandler:&__block_literal_global_49];

              if (v17)
              {
                uint64_t v25 = [v14 buttonTitleStyle];
                uint64_t v26 = SKUIViewElementAlignmentForStyle(v25);
                if (v26) {
                  [v24 _setTitleTextAlignment:SKUIViewElementNSTextAlignmentForIKElementAlignment(v26)];
                }
                long long v27 = v25;
                if (!v25)
                {
                  long long v27 = [v14 style];
                  v44 = v27;
                }
                long long v28 = SKUIViewElementPlainColorWithStyle(v27, 0);
                if (!v25) {

                }
                if (v28) {
                  [v24 _setTitleTextColor:v28];
                }
                long long v29 = [v19 style];
                long long v30 = v29;
                if (!v29)
                {
                  long long v29 = [v14 style];
                  v43 = v29;
                }
                v31 = SKUIViewElementPlainColorWithStyle(v29, 0);
                if (!v30) {

                }
                if (v31) {
                  [v24 _setImageTintColor:v31];
                }
                objc_msgSend(v24, "_setChecked:", objc_msgSend(v14, "isSelected"));
              }
              [v47 addAction:v24];

              objc_destroyWeak(&v51);
              objc_destroyWeak(&v50);
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v12);
        }

        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      else
      {
LABEL_42:
        if (!v47)
        {
          id v47 = 0;
          goto LABEL_49;
        }
      }
      uint64_t v32 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", v36);
      uint64_t v33 = [v32 userInterfaceIdiom];

      if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        [(SKUIModalDocumentController *)self _pushPopoverSheetDocument:v40 viewController:v47 popoverPresentationController:v36 options:v37];
      }
      else {
        [(SKUIModalDocumentController *)self _pushSheetDocument:v40 viewController:v47];
      }
LABEL_49:
      id v35 = v36;
LABEL_50:

      return;
    case 4:
      v34 = [[SKUIToastViewController alloc] initWithDialogTemplate:v41];
      [(SKUIToastViewController *)v34 present];

      goto LABEL_47;
    default:
LABEL_47:
      id v35 = 0;
      id v47 = 0;
      goto LABEL_50;
  }
}

void __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _unloadDocumentForViewController:v3];
}

uint64_t __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _unloadDocumentForViewController:v3];

  double v4 = *(void **)(a1 + 32);

  return [v4 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

uint64_t __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke_3()
{
  return 1;
}

- (void)_pushFamilySetupDocument:(id)a3 options:(id)a4
{
  id v5 = a3;
  uint64_t v6 = SKUIAccountsFramework();
  id v11 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Acaccountstore.isa, v6));
  uint64_t v7 = SKUIAppleAccountUIFramework();
  id v8 = objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Aauifamilysetu.isa, v7));
  id v9 = objc_msgSend(v11, "aa_primaryAppleAccount");
  BOOL v10 = (void *)[v8 initWithAccount:v9 store:v11];

  [v10 setDelegate:self];
  [(SKUIModalDocumentController *)self _pushSheetDocument:v5 viewController:v10];
}

- (void)_pushGiftDocument:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v16 = [v5 templateElement];
  uint64_t v6 = [v16 giftType];
  uint64_t v7 = [SKUIGift alloc];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v16 productItem];
    BOOL v10 = [(SKUIGift *)v8 initWithItem:v9];
  }
  else
  {
    BOOL v10 = [(SKUIGift *)v7 initWithGiftCategory:0];
  }
  id v11 = [[SKUIGiftViewController alloc] initWithGift:v10];
  uint64_t v12 = [(SKUIModalDocumentController *)self clientContext];
  [(SKUIGiftViewController *)v11 setClientContext:v12];

  [(SKUIGiftViewController *)v11 setGiftDelegate:self];
  giftViewControllers = self->_giftViewControllers;
  if (!giftViewControllers)
  {
    long long v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = self->_giftViewControllers;
    self->_giftViewControllers = v14;

    giftViewControllers = self->_giftViewControllers;
  }
  [(NSMutableArray *)giftViewControllers addObject:v11];
  [(SKUIModalDocumentController *)self _pushSheetDocument:v5 viewController:v11];
}

- (void)_pushOverlayStackItem:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  overlayNavigationController = self->_overlayNavigationController;
  if (overlayNavigationController)
  {
    uint64_t v7 = [v4 viewController];
    -[UINavigationController pushViewController:animated:](overlayNavigationController, "pushViewController:animated:", v7, [v5 isAnimated]);
  }
  else
  {
    id v8 = [v4 overlayType];
    id v9 = [v5 viewController];
    if ([v8 isEqualToString:0x1F1C90148]
      && [v5 usesNavigationControllerForModalPresentation])
    {
      BOOL v10 = objc_alloc_init(_SKUIModalSheetNavigationController);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
      [(_SKUIModalSheetNavigationController *)v10 setDelegate:WeakRetained];

      uint64_t v12 = v10;
      id v13 = [[SKUINavigationDocumentController alloc] initWithNavigationController:v12];
      long long v14 = [(SKUIModalDocumentController *)self clientContext];
      [(SKUINavigationDocumentController *)v13 setClientContext:v14];

      [v5 setNavigationDocumentController:v13];
      v20[0] = v5;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [(SKUINavigationDocumentController *)v13 setStackItems:v15 animated:0];

      id v16 = [(SKUIModalDocumentController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v16 modalDocumentController:self barStyleForStackItem:v5];
        uint64_t v18 = [(_SKUIModalSheetNavigationController *)v12 navigationBar];
        [v18 setBarStyle:v17];
      }
    }
    else
    {
      uint64_t v12 = v9;
    }
    uint64_t v19 = [(SKUIModalDocumentController *)self _showOverlayContainerViewController];
    if (![v19 _appearState])
    {
      [v19 beginAppearanceTransition:1 animated:0];
      [v19 endAppearanceTransition];
    }
    [v19 showViewController:v12 withCompletionBlock:0];
  }
}

- (void)_pushPlaylistDocument:(id)a3 options:(id)a4
{
  id v5 = [a3 templateElement];
  uint64_t v6 = [v5 firstChildForElementType:152];
  uint64_t v7 = [v6 assets];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SKUIModalDocumentController__pushPlaylistDocument_options___block_invoke;
  v9[3] = &unk_1E6425468;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __61__SKUIModalDocumentController__pushPlaylistDocument_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v10 = [[SKUIPlayableAsset alloc] initWithVideoViewElement:*(void *)(a1 + 32) assetViewElement:v6];

  uint64_t v7 = [*(id *)(a1 + 40) clientContext];
  id v8 = SKUIVideoPreviewPlayPlayableAsset(v10, v7);

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) _presenterViewController];
    [v9 presentViewController:v8 animated:1 completion:0];

    SKUIVideoPreviewDismissOnEnterBackground(v8);
    *a4 = 1;
  }
}

- (void)_pushPopoverStackItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIModalDocumentController *)self _modalSourceViewProviderFromStackItems];
  if (self->_popoverController)
  {
    -[SKUIModalDocumentController _unloadDocumentForPopoverController:](self, "_unloadDocumentForPopoverController:");
    [(UIPopoverController *)self->_popoverController setDelegate:0];
    [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:0];
    id v6 = [(UIPopoverController *)self->_popoverController contentViewController];
    uint64_t v7 = [v6 transitionCoordinator];

    popoverController = self->_popoverController;
    self->_popoverController = 0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = [v4 sourceElementIdentifier];
  if (v9 && v5)
  {
    id v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v10 beginIgnoringInteractionEvents];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke;
    v11[3] = &unk_1E64297C0;
    id v12 = v9;
    id v13 = v4;
    long long v14 = self;
    id v15 = v7;
    [v5 getModalSourceViewForElementIdentifier:v12 completionBlock:v11];
  }
  else
  {
    [(SKUIModalDocumentController *)self _pushSheetStackItem:v4];
  }
}

void __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke(uint64_t a1, void *a2)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 sourceButtonBarItem];
  uint64_t v5 = [v3 originalSourceView];

  if (v4 | v5)
  {
    id v6 = [*(id *)(a1 + 40) viewController];
    if ([*(id *)(a1 + 40) usesNavigationControllerForModalPresentation])
    {
      v40 = v6;
      id v7 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 80));
      [v7 setDelegate:WeakRetained];

      [v7 setModalPresentationStyle:7];
      id v9 = [[SKUINavigationDocumentController alloc] initWithNavigationController:v7];
      id v10 = [*(id *)(a1 + 48) clientContext];
      [(SKUINavigationDocumentController *)v9 setClientContext:v10];

      [*(id *)(a1 + 40) setNavigationDocumentController:v9];
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:v7];
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = *(void **)(v12 + 88);
      *(void *)(v12 + 88) = v11;

      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 88), "setDelegate:");
      long long v14 = [*(id *)(a1 + 40) document];
      id v15 = [v14 templateElement];
      id v16 = [v15 style];
      uint64_t v17 = [v16 ikBackgroundColor];
      uint64_t v18 = [v17 color];

      if ((SKUIColorSchemeStyleForColor(v18) | 2) == 3)
      {
        uint64_t v19 = [v7 navigationBar];
        [v19 setBarStyle:1];

        [*(id *)(*(void *)(a1 + 48) + 88) _setPopoverBackgroundStyle:7];
        id v20 = [*(id *)(*(void *)(a1 + 48) + 88) contentViewController];
        long long v21 = [v20 popoverPresentationController];

        if (objc_opt_respondsToSelector()) {
          [v21 _setPopoverBackgroundStyle:7];
        }
      }
      long long v22 = [v7 navigationBar];
      [v22 bounds];
      double v24 = 480.0 - v23;

      id v6 = v40;
    }
    else
    {
      uint64_t v27 = [objc_alloc(MEMORY[0x1E4FB1AF8]) initWithContentViewController:v6];
      uint64_t v28 = *(void *)(a1 + 48);
      long long v29 = *(void **)(v28 + 88);
      *(void *)(v28 + 88) = v27;

      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 88), "setDelegate:");
      id v9 = 0;
      double v24 = 480.0;
    }
    [v6 preferredContentSize];
    double v31 = *MEMORY[0x1E4F1DB30];
    double v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*MEMORY[0x1E4F1DB30] == v33 && v32 == v30) {
      objc_msgSend(v6, "setPreferredContentSize:", 320.0, v24, v31, v32);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 88), "setPopoverContentSize:", 320.0, v24, v31, v32);
    if (v9)
    {
      v46[0] = *(void *)(a1 + 40);
      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      [(SKUINavigationDocumentController *)v9 setStackItems:v35 animated:0];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke_2;
    aBlock[3] = &unk_1E6429798;
    id v43 = (id)v5;
    int8x16_t v41 = *(int8x16_t *)(a1 + 40);
    id v36 = (id)v41.i64[0];
    int8x16_t v44 = vextq_s8(v41, v41, 8uLL);
    id v45 = (id)v4;
    id v37 = (void (**)(void *, void))_Block_copy(aBlock);
    id v38 = *(void **)(a1 + 56);
    if (v38) {
      [v38 animateAlongsideTransition:0 completion:v37];
    }
    else {
      v37[2](v37, 0);
    }
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = [*(id *)(a1 + 40) document];
    NSLog(&cfstr_CouldNotFindSo.isa, v25, v26);
  }
  id v39 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v39 endIgnoringInteractionEvents];
}

uint64_t __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 88);
    id v12 = v3;
    [v4 bounds];
    uint64_t v4 = objc_msgSend(v5, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", *(void *)(a1 + 32), 15, objc_msgSend(*(id *)(a1 + 48), "isAnimated"), v6, v7, v8, v9);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (!v10) {
      goto LABEL_6;
    }
    id v12 = v3;
    uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v10, 15, objc_msgSend(*(id *)(a1 + 48), "isAnimated"));
  }
  id v3 = v12;
LABEL_6:

  return MEMORY[0x1F41817F8](v4, v3);
}

- (id)_modalSourceViewProviderFromStackItems
{
  if ([(NSMutableArray *)self->_stackItems count])
  {
    id v3 = [(NSMutableArray *)self->_stackItems lastObject];
    uint64_t v4 = [v3 viewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 topViewController];

      uint64_t v4 = (void *)v5;
    }
    if ([v4 conformsToProtocol:&unk_1F1DAE078]) {
      id WeakRetained = v4;
    }
    else {
      id WeakRetained = 0;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_modalSourceViewProvider);
  }

  return WeakRetained;
}

- (void)_pushRedeemDocument:(id)a3 options:(id)a4
{
  id v5 = a3;
  double v9 = [[SKUIRedeemViewController alloc] initWithRedeemCategory:0];
  double v6 = [(SKUIModalDocumentController *)self clientContext];
  [(SKUIRedeemViewController *)v9 setClientContext:v6];

  double v7 = [v5 templateElement];
  double v8 = [v7 initialCode];
  [(SKUIRedeemViewController *)v9 setInitialCode:v8];

  [(SKUIModalDocumentController *)self _pushSheetDocument:v5 viewController:v9];
}

- (void)_pushSheetDocument:(id)a3 viewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v9 = [[SKUIDocumentStackItem alloc] initWithDocument:v7 presentationOptions:0];

  [(SKUIDocumentStackItem *)v9 setViewController:v6];
  [(NSMutableArray *)self->_stackItems addObject:v9];
  double v8 = [(SKUIModalDocumentController *)self _presenterViewController];
  [v8 presentViewController:v6 animated:1 completion:0];
}

- (void)_pushPopoverSheetDocument:(id)a3 viewController:(id)a4 popoverPresentationController:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalSourceViewProvider);
  id v15 = [v13 objectForKey:@"sourceElement"];

  if (v15) {
    BOOL v16 = WeakRetained == 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = v16;
  if (v11 && v17)
  {
    uint64_t v18 = [v11 popoverPresentationController];
    uint64_t v19 = [(SKUIModalDocumentController *)self _presenterViewController];
    id v20 = [v19 view];
    [(SKUIModalDocumentController *)self _centerRect:v20 adjust:0];
    objc_msgSend(v18, "setSourceRect:");

    long long v21 = [v11 popoverPresentationController];
    long long v22 = [(SKUIModalDocumentController *)self _presenterViewController];
    double v23 = [v22 view];
    [v21 setSourceView:v23];

    [(SKUIModalDocumentController *)self _presetPopoverSheetDocument:v10 viewController:v11 popoverPresentationController:v12];
  }
  else if (v11)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __110__SKUIModalDocumentController__pushPopoverSheetDocument_viewController_popoverPresentationController_options___block_invoke;
    v24[3] = &unk_1E64297C0;
    id v25 = v11;
    uint64_t v26 = self;
    id v27 = v10;
    id v28 = v12;
    [WeakRetained getModalSourceViewForElementIdentifier:v15 completionBlock:v24];
  }
}

void __110__SKUIModalDocumentController__pushPopoverSheetDocument_viewController_popoverPresentationController_options___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [*(id *)(a1 + 32) popoverPresentationController];
  uint64_t v4 = [v10 originalSourceView];
  [v3 setSourceView:v4];

  id v5 = [v10 originalSourceView];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) popoverPresentationController];
    id v7 = *(void **)(a1 + 40);
    double v8 = [v10 originalSourceView];
    [v7 _centerRect:v8 adjust:1];
    objc_msgSend(v6, "setSourceRect:");

    double v9 = [*(id *)(a1 + 32) popoverPresentationController];
    [v9 setDelegate:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 40) _presetPopoverSheetDocument:*(void *)(a1 + 48) viewController:*(void *)(a1 + 32) popoverPresentationController:*(void *)(a1 + 56)];
}

- (void)_pushSheetStackItem:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 document];
  id v6 = [v5 templateElement];
  id v7 = [v6 style];
  double v8 = [v7 ikBackgroundColor];
  double v9 = [v8 color];

  if (v9)
  {
    double v26 = 1.0;
    unsigned int v11 = [v9 getRed:0 green:0 blue:0 alpha:&v26];
    double v10 = v26;
    if (v26 < 0.00000011920929) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  objc_msgSend(v4, "viewController", v10);
  id v13 = (_SKUIModalSheetNavigationController *)objc_claimAutoreleasedReturnValue();
  long long v14 = [(SKUIModalDocumentController *)self _presenterViewController];
  if ([v4 usesNavigationControllerForModalPresentation])
  {
    id v15 = objc_alloc_init(_SKUIModalSheetNavigationController);
    if ([v14 preferredUserInterfaceStyle]) {
      -[_SKUIModalSheetNavigationController setForcedUserInterfaceStyle:](v15, "setForcedUserInterfaceStyle:", [v14 preferredUserInterfaceStyle]);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
    [(_SKUIModalSheetNavigationController *)v15 setDelegate:WeakRetained];

    [(_SKUIModalSheetNavigationController *)v15 _setClipUnderlapWhileTransitioning:v12];
    int v17 = v15;

    uint64_t v18 = [[SKUINavigationDocumentController alloc] initWithNavigationController:v17];
    uint64_t v19 = [(SKUIModalDocumentController *)self clientContext];
    [(SKUINavigationDocumentController *)v18 setClientContext:v19];

    [v4 setNavigationDocumentController:v18];
    v27[0] = v4;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(SKUINavigationDocumentController *)v18 setStackItems:v20 animated:0];

    long long v21 = [(SKUIModalDocumentController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v22 = [v21 modalDocumentController:self barStyleForStackItem:v4];
      double v23 = [(_SKUIModalSheetNavigationController *)v17 navigationBar];
      [v23 setBarStyle:v22];
    }
  }
  else
  {
    int v17 = v13;
  }
  double v24 = [v4 sheetType];
  if ([v24 isEqualToString:0x1F1C92FE8]) {
    [(_SKUIModalSheetNavigationController *)v17 setModalPresentationStyle:2];
  }
  if (v12)
  {
    id v25 = [[SKUIBackdropContentViewController alloc] initWithContentViewController:v17];
    objc_msgSend(v14, "presentViewController:animated:completion:", v25, objc_msgSend(v4, "isAnimated"), 0);
  }
  else
  {
    objc_msgSend(v14, "presentViewController:animated:completion:", v17, objc_msgSend(v4, "isAnimated"), 0);
  }
}

- (void)_sendDidFinishIfApplicable
{
  id v3 = [(SKUIModalDocumentController *)self delegate];
  if (![(NSMutableArray *)self->_stackItems count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v3 modalDocumentControllerDidFinish:self];
  }
}

- (id)_showOverlayContainerViewController
{
  overlayViewController = self->_overlayViewController;
  if (!overlayViewController)
  {
    id v4 = objc_alloc_init(SKUIOverlayContainerViewController);
    id v5 = self->_overlayViewController;
    self->_overlayViewController = v4;

    id v6 = [(SKUIOverlayContainerViewController *)self->_overlayViewController backstopControl];
    [v6 addTarget:self action:sel__overlayControllerBackstopAction_ forControlEvents:64];

    [(SKUIOverlayContainerViewController *)self->_overlayViewController setDelegate:self];
    [(UIViewController *)self->_rootViewController addChildViewController:self->_overlayViewController];
    id v7 = [(UIViewController *)self->_rootViewController view];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    BOOL v16 = [(SKUIOverlayContainerViewController *)self->_overlayViewController view];
    [v16 setAutoresizingMask:18];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
    [v7 addSubview:v16];
    [(SKUIOverlayContainerViewController *)self->_overlayViewController didMoveToParentViewController:self->_rootViewController];
    int v17 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceLevel:1];
    [(UIViewController *)self->_rootViewController setOverrideTraitCollection:v17 forChildViewController:self->_overlayViewController];

    overlayViewController = self->_overlayViewController;
  }

  return overlayViewController;
}

- (void)_unloadDocumentForPopoverController:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __67__SKUIModalDocumentController__unloadDocumentForPopoverController___block_invoke;
  double v14 = &unk_1E64297E8;
  double v15 = self;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:&v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    double v9 = -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v7, v11, v12, v13, v14, v15);
    double v10 = [v9 document];
    [v10 onUnload];

    [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v8];
  }
}

uint64_t __67__SKUIModalDocumentController__unloadDocumentForPopoverController___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _popoverController:*(void *)(a1 + 40) containsStackItem:a2];
}

- (void)_unloadDocumentForViewController:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SKUIModalDocumentController__unloadDocumentForViewController___block_invoke;
  v11[3] = &unk_1E6427028;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    double v9 = [(NSMutableArray *)self->_stackItems objectAtIndex:v7];
    double v10 = [v9 document];
    [v10 onUnload];

    [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v8];
  }
}

BOOL __64__SKUIModalDocumentController__unloadDocumentForViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 viewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIModalDocumentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIModalDocumentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIModalSourceViewProvider)modalSourceViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalSourceViewProvider);

  return (SKUIModalSourceViewProvider *)WeakRetained;
}

- (void)setModalSourceViewProvider:(id)a3
{
}

- (UINavigationControllerDelegate)navigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);

  return (UINavigationControllerDelegate *)WeakRetained;
}

- (void)setNavigationControllerDelegate:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (SKUIModalDocumentDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SKUIModalDocumentDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_destroyWeak((id *)&self->_navigationControllerDelegate);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_overlayNavigationController, 0);
  objc_destroyWeak((id *)&self->_modalSourceViewProvider);
  objc_storeStrong((id *)&self->_giftViewControllers, 0);
  objc_storeStrong((id *)&self->_reportAConcernViewController, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeReviewViewControllers, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIModalDocumentController init]";
}

@end