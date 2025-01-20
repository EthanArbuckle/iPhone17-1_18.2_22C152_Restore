@interface SUUINavigationBarButtonsController
- (SUUINavigationBarButtonsController)initWithNavigationBarViewElement:(id)a3;
- (UIEdgeInsets)_imageInsetsForImageViewElement:(id)a3;
- (id)_imageForImageViewElement:(id)a3;
- (id)addButtonItemWithButtonViewElement:(id)a3;
- (id)barButtonItemForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_itemOfferAction:(id)a3;
- (void)_reloadButtonItem:(id)a3 withButtonViewElement:(id)a4;
- (void)_showConfirmationAction:(id)a3;
- (void)_updateButtonItem:(id)a3 withButtonViewElement:(id)a4;
- (void)_updateItemOfferButton:(id)a3 withButtonViewElement:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)disconnectAllButtons;
- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3;
@end

@implementation SUUINavigationBarButtonsController

- (SUUINavigationBarButtonsController)initWithNavigationBarViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarButtonsController;
  v6 = [(SUUINavigationBarButtonsController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_navigationBarElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_opt_class();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_buttonItemElements;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) customView];
        if (objc_opt_isKindOfClass()) {
          [v8 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarButtonsController;
  [(SUUINavigationBarSectionController *)&v9 dealloc];
}

- (id)addButtonItemWithButtonViewElement:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F824A8]);
  if ([v4 buttonViewType] == 2)
  {
    uint64_t v6 = objc_alloc_init(SUUIItemOfferButton);
    [(SUUIItemOfferButton *)v6 addTarget:self action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
    [(SUUIItemOfferButton *)v6 addTarget:self action:sel__itemOfferAction_ forControlEvents:0x20000];
    [(SUUIItemOfferButton *)v6 addTarget:self action:sel__showConfirmationAction_ forControlEvents:0x40000];
    uint64_t v7 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIItemOfferButton *)v6 setBackgroundColor:v7];

    [(SUUIItemOfferButton *)v6 setDelegate:self];
    [(SUUINavigationBarButtonsController *)self _updateItemOfferButton:v6 withButtonViewElement:v4];
    [v5 setCustomView:v6];
  }
  else
  {
    [v5 setAction:sel__buttonAction_];
    [v5 setTarget:self];
    [(SUUINavigationBarButtonsController *)self _updateButtonItem:v5 withButtonViewElement:v4];
  }
  buttonItemElements = self->_buttonItemElements;
  if (!buttonItemElements)
  {
    objc_super v9 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:512 capacity:0];
    long long v10 = self->_buttonItemElements;
    self->_buttonItemElements = v9;

    buttonItemElements = self->_buttonItemElements;
  }
  [(NSMapTable *)buttonItemElements setObject:v4 forKey:v5];
  long long v11 = [(SUUINavigationBarSectionController *)self viewLayoutContext];
  long long v12 = [v11 imageResourceCacheKeyForViewElement:v4];

  if (v12)
  {
    buttonItemToImageResourceCacheKey = self->_buttonItemToImageResourceCacheKey;
    if (!buttonItemToImageResourceCacheKey)
    {
      v14 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:512 capacity:1];
      uint64_t v15 = self->_buttonItemToImageResourceCacheKey;
      self->_buttonItemToImageResourceCacheKey = v14;

      buttonItemToImageResourceCacheKey = self->_buttonItemToImageResourceCacheKey;
    }
    [(NSMapTable *)buttonItemToImageResourceCacheKey setObject:v12 forKey:v5];
  }

  return v5;
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_buttonItemElements;
  uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = [(NSMapTable *)self->_buttonItemElements objectForKey:v9];
        long long v11 = [v10 itmlID];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v9;

          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMapTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (void)disconnectAllButtons
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_buttonItemElements;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_super v9 = objc_msgSend(v8, "customView", (void)v10);
        [v8 setTarget:0];
        [v9 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
      }
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_buttonItemElements removeAllObjects];
  [(NSMapTable *)self->_buttonItemToImageResourceCacheKey removeAllObjects];
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  v40[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 leftBarButtonItems];
  v28 = v4;
  uint64_t v6 = [v4 rightBarButtonItems];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  navigationBarElement = self->_navigationBarElement;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __82__SUUINavigationBarButtonsController_reloadAfterDocumentUpdateWithNavigationItem___block_invoke;
  v36[3] = &unk_265403818;
  id v10 = v7;
  id v37 = v10;
  id v11 = v8;
  id v38 = v11;
  [(SUUIViewElement *)navigationBarElement enumerateChildrenUsingBlock:v36];
  uint64_t v12 = 0;
  v26 = (void *)v6;
  v27 = (void *)v5;
  v40[0] = v5;
  v40[1] = v10;
  v24 = v11;
  v25 = v10;
  char v13 = 1;
  v40[2] = v6;
  v40[3] = v11;
  do
  {
    char v29 = v13;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)v40[2 * v12];
    uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v33;
      long long v18 = (id *)&v40[2 * v12 + 1];
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * v19);
        uint64_t v21 = [(NSMapTable *)self->_buttonItemElements objectForKey:v20];

        id v22 = *v18;
        if (v21)
        {
          v23 = [*v18 objectAtIndex:v16];
          [(SUUINavigationBarButtonsController *)self _reloadButtonItem:v20 withButtonViewElement:v23];
          [(NSMapTable *)self->_buttonItemElements setObject:v23 forKey:v20];
          ++v16;
        }
        if (v16 == [v22 count]) {
          break;
        }
        if (v15 == ++v19)
        {
          uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    char v13 = 0;
    uint64_t v12 = 1;
  }
  while ((v29 & 1) != 0);
  v31.receiver = self;
  v31.super_class = (Class)SUUINavigationBarButtonsController;
  [(SUUINavigationBarSectionController *)&v31 reloadAfterDocumentUpdateWithNavigationItem:v28];
}

uint64_t __82__SUUINavigationBarButtonsController_reloadAfterDocumentUpdateWithNavigationItem___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t IsButton = SUUIIKViewElementTypeIsButton([v8 elementType]);
  id v4 = v8;
  if (IsButton)
  {
    uint64_t v5 = [v8 style];
    uint64_t v6 = [v5 elementAlignment];

    if (v6 == 3)
    {
      uint64_t IsButton = [*(id *)(a1 + 40) insertObject:v8 atIndex:0];
    }
    else
    {
      id v4 = v8;
      if (v6 != 1) {
        goto LABEL_7;
      }
      uint64_t IsButton = [*(id *)(a1 + 32) addObject:v8];
    }
    id v4 = v8;
  }
LABEL_7:
  return MEMORY[0x270F9A758](IsButton, v4);
}

- (void)_cancelConfirmationAction:(id)a3
{
}

- (void)_buttonAction:(id)a3
{
  id v3 = [(NSMapTable *)self->_buttonItemElements objectForKey:a3];
  [v3 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (void)_itemOfferAction:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_buttonItemElements;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "customView", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          uint64_t v12 = [(NSMapTable *)self->_buttonItemElements objectForKey:v10];
          [v12 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_showConfirmationAction:(id)a3
{
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v22 = a4;
  uint64_t v7 = [(SUUINavigationBarSectionController *)self viewLayoutContext];
  uint64_t v21 = v6;
  uint64_t v8 = [v6 requestIdentifier];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_buttonItemToImageResourceCacheKey;
  uint64_t v9 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v14 = [(NSMapTable *)self->_buttonItemToImageResourceCacheKey objectForKey:v13];
        long long v15 = [v7 requestIdentifierForResourceCacheKey:v14];
        long long v16 = v15;
        if (v15 && [v15 unsignedIntegerValue] == v8)
        {
          [v13 setImage:v22];
          uint64_t v17 = [(SUUINavigationBarSectionController *)self context];
          uint64_t v18 = [v17 parentViewController];
          uint64_t v19 = [v18 navigationController];
          uint64_t v20 = [v19 navigationBar];

          [v20 setNeedsLayout];
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)_imageForImageViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 resourceName];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = SUUIImageWithResourceName(v5);
  }
  else
  {
    uint64_t v8 = [(SUUINavigationBarSectionController *)self viewLayoutContext];
    uint64_t v9 = [v8 requestIdentifierForViewElement:v4];
    if (!v9
      || ([v8 resourceLoader],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue")),
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v7))
    {
      [v8 loadImageForImageElement:v4 reason:1];
      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (UIEdgeInsets)_imageInsetsForImageViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 style];
  [v5 elementPadding];
  double v9 = v6;
  double v11 = v10;
  double v12 = v7;
  double v13 = v8;
  if (v10 == *(double *)(MEMORY[0x263F834E8] + 8)
    && v6 == *MEMORY[0x263F834E8]
    && v8 == *(double *)(MEMORY[0x263F834E8] + 24)
    && v7 == *(double *)(MEMORY[0x263F834E8] + 16))
  {
    uint64_t v17 = [v4 resourceName];
    int v18 = [v17 isEqualToString:@"previewHistory"];

    if (v18)
    {
      uint64_t v19 = [(SUUINavigationBarSectionController *)self context];
      uint64_t v20 = [v19 clientContext];
      uint64_t v21 = SUUIUserInterfaceIdiom(v20);

      if (v21 == 1) {
        double v9 = 3.0;
      }
      else {
        double v9 = 2.0;
      }
    }
    else
    {
      id v22 = [MEMORY[0x263F82670] currentDevice];
      if ([v22 userInterfaceIdiom])
      {

        goto LABEL_21;
      }
      v23 = [v4 resourceName];
      int v24 = [v23 isEqualToString:@"share"];

      if (!v24) {
        goto LABEL_21;
      }
      double v9 = -3.0;
    }
    double v13 = 0.0;
    double v12 = 0.0;
    double v11 = 0.0;
  }
LABEL_21:

  double v25 = v9;
  double v26 = v11;
  double v27 = v12;
  double v28 = v13;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)_reloadButtonItem:(id)a3 withButtonViewElement:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v6 updateType])
  {
    if ([v6 buttonViewType] == 2)
    {
      double v7 = [v8 customView];
      [(SUUINavigationBarButtonsController *)self _updateItemOfferButton:v7 withButtonViewElement:v6];
    }
    else
    {
      [(SUUINavigationBarButtonsController *)self _updateButtonItem:v8 withButtonViewElement:v6];
    }
  }
}

- (void)_updateButtonItem:(id)a3 withButtonViewElement:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  objc_msgSend(v12, "setEnabled:", objc_msgSend(v6, "isEnabled"));
  objc_msgSend(v12, "setStyle:", 2 * (objc_msgSend(v6, "buttonViewType") == 8));
  double v7 = [v6 buttonImage];
  if (v7)
  {
    id v8 = [v6 accessibilityText];

    [v12 setAccessibilityLabel:v8];
    double v9 = [(SUUINavigationBarButtonsController *)self _imageForImageViewElement:v7];
    [v12 setImage:v9];

    [(SUUINavigationBarButtonsController *)self _imageInsetsForImageViewElement:v7];
    objc_msgSend(v12, "setImageInsets:");
  }
  else
  {
    double v10 = [v6 buttonText];

    double v11 = [v10 string];
    [v12 setTitle:v11];
  }
}

- (void)_updateItemOfferButton:(id)a3 withButtonViewElement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v5 confirmationText];
  [v6 setConfirmationTitle:v9];
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v5, "isEnabled"));
  [v6 setShowsConfirmationState:v9 != 0];
  double v7 = [v5 buttonText];

  id v8 = [v7 string];
  [v6 setTitle:v8];

  [v6 sizeToFit];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarElement, 0);
  objc_storeStrong((id *)&self->_buttonItemToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_buttonItemElements, 0);
}

@end