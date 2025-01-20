@interface WFMenu
- (BOOL)shouldDisplayInFixedOrder;
- (NSArray)elements;
- (NSString)title;
- (UIMenu)platformMenu;
- (WFMenu)initWithElements:(id)a3;
- (WFMenu)initWithTitle:(id)a3 elements:(id)a4;
- (id)uiMenuElementForWFMenuElement:(id)a3 shouldShowState:(BOOL)a4;
- (unint64_t)inlineMenuOptions;
- (void)setShouldDisplayInFixedOrder:(BOOL)a3;
@end

@implementation WFMenu

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setShouldDisplayInFixedOrder:(BOOL)a3
{
  self->_shouldDisplayInFixedOrder = a3;
}

- (BOOL)shouldDisplayInFixedOrder
{
  return self->_shouldDisplayInFixedOrder;
}

- (NSArray)elements
{
  return self->_elements;
}

- (NSString)title
{
  return self->_title;
}

- (WFMenu)initWithTitle:(id)a3 elements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFMenu;
  v8 = [(WFMenu *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    elements = v8->_elements;
    v8->_elements = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFMenu)initWithElements:(id)a3
{
  return [(WFMenu *)self initWithTitle:0 elements:a3];
}

- (unint64_t)inlineMenuOptions
{
  return 1;
}

- (UIMenu)platformMenu
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(WFMenu *)self elements];
  v5 = objc_msgSend(v4, "if_firstObjectPassingTest:", &__block_literal_global_598);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(WFMenu *)self elements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(WFMenu *)self uiMenuElementForWFMenuElement:*(void *)(*((void *)&v18 + 1) + 8 * i) shouldShowState:v5 != 0];
        [v3 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x263F82940];
  uint64_t v13 = [(WFMenu *)self title];
  v14 = (void *)v13;
  if (v13) {
    objc_super v15 = (__CFString *)v13;
  }
  else {
    objc_super v15 = &stru_26E88D610;
  }
  v16 = [v12 menuWithTitle:v15 children:v3];

  return (UIMenu *)v16;
}

- (id)uiMenuElementForWFMenuElement:(id)a3 shouldShowState:(BOOL)a4
{
  BOOL v4 = a4;
  v46[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 menuElementRepresentationShowingStatus:v4];

      goto LABEL_24;
    }
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke;
  aBlock[3] = &unk_264C50D50;
  BOOL v44 = v4;
  aBlock[4] = self;
  uint64_t v8 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  id v9 = v6;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 shouldCollapse];
      uint64_t v11 = [v9 menuElements];
      v8[2](v8, v11, v10);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        uint64_t v13 = (void *)MEMORY[0x263F82940];
        uint64_t v14 = [v9 title];
        objc_super v15 = (void *)v14;
        if (v14) {
          v16 = (__CFString *)v14;
        }
        else {
          v16 = &stru_26E88D610;
        }
        v17 = [v13 menuWithTitle:v16 children:v12];

        long long v18 = [v9 menuElements];
        long long v19 = WFMenuCollapsedSubtitleForMenuElements(v18);
        [(__CFString *)v17 setSubtitle:v19];

        long long v20 = (void *)MEMORY[0x263F82940];
        unint64_t v21 = [(WFMenu *)self inlineMenuOptions];
        v46[0] = v17;
        v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
        uint64_t v7 = [v20 menuWithTitle:&stru_26E88D610 image:0 identifier:0 options:v21 children:v22];
      }
      else
      {
        if (([v9 onlyDisplayTitleWhenCollapsed] & 1) != 0
          || ([v9 title], v34 = objc_claimAutoreleasedReturnValue(), v34, !v34))
        {
          v17 = &stru_26E88D610;
        }
        else
        {
          v17 = [v9 title];
        }
        uint64_t v7 = objc_msgSend(MEMORY[0x263F82940], "menuWithTitle:image:identifier:options:children:", v17, 0, 0, -[WFMenu inlineMenuOptions](self, "inlineMenuOptions"), v12);
      }
      goto LABEL_22;
    }

    uint64_t v23 = (__CFString *)v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [MEMORY[0x263EFF910] date];
      v25 = (void *)MEMORY[0x263F82658];
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_2;
      v39 = &unk_264C50DA0;
      v40 = v23;
      id v41 = v24;
      v42 = v8;
      v26 = v23;
      id v12 = v24;
      v27 = [v25 elementWithProvider:&v36];
      v28 = (void *)MEMORY[0x263F82940];
      uint64_t v29 = [(__CFString *)v26 title];
      v30 = (void *)v29;
      if (v29) {
        v31 = (__CFString *)v29;
      }
      else {
        v31 = &stru_26E88D610;
      }
      unint64_t v32 = [(WFMenu *)self inlineMenuOptions];
      v45 = v27;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      uint64_t v7 = [v28 menuWithTitle:v31 image:0 identifier:0 options:v32 children:v33];

      v17 = v40;
LABEL_22:

      goto LABEL_23;
    }
  }
  uint64_t v7 = 0;
LABEL_23:

LABEL_24:
  return v7;
}

id __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = objc_opt_new();
  if ((a3 & 1) != 0 || !*(unsigned char *)(a1 + 40))
  {
    uint64_t v8 = objc_msgSend(v5, "if_firstObjectPassingTest:", &__block_literal_global_598);
    BOOL v7 = v8 != 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "uiMenuElementForWFMenuElement:shouldShowState:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v6 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

void __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [a1[4] itemProvider];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_3;
  v7[3] = &unk_264C50D78;
  id v8 = a1[4];
  id v10 = a1[6];
  id v9 = a1[5];
  id v11 = v3;
  id v5 = (void (*)(void *, void *))v4[2];
  id v6 = v3;
  v5(v4, v7);
}

void __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_3(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v4 = [*(id *)(a1 + 32) shouldCollapse];
  id v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v4)
  {
    id v6 = (void *)MEMORY[0x263F82940];
    uint64_t v7 = [*(id *)(a1 + 32) title];
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    else {
      id v9 = &stru_26E88D610;
    }
    id v10 = [v6 menuWithTitle:v9 children:v5];

    id v11 = WFMenuCollapsedSubtitleForMenuElements(v3);
    [v10 setSubtitle:v11];

    v22[0] = v10;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];

    id v5 = (void *)v12;
  }
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  [v13 timeIntervalSinceDate:*(void *)(a1 + 40)];
  double v15 = 0.25 - v14;

  double v16 = fmax(v15, 0.0);
  if (v16 == 0.0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_4;
    v19[3] = &unk_264C50E38;
    id v21 = *(id *)(a1 + 56);
    id v20 = v5;
    long long v18 = (void *)MEMORY[0x263EF83A0];
    dispatch_after(v17, MEMORY[0x263EF83A0], v19);
  }
}

uint64_t __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end