@interface _TVCommonSenseTemplateController
- (IKViewElement)templateElement;
- (_TVCommonSenseView)commonSenseView;
- (id)_infoTableFromElement:(id)a3;
- (void)_loadTemplate;
- (void)_updateFooterWithElement:(id)a3;
- (void)_updateHeaderWithElement:(id)a3;
- (void)loadView;
- (void)setCommonSenseView:(id)a3;
- (void)setTemplateElement:(id)a3;
- (void)updateWithCommonSenseTemplate:(id)a3;
@end

@implementation _TVCommonSenseTemplateController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)_TVCommonSenseTemplateController;
  [(_TVCommonSenseTemplateController *)&v7 loadView];
  v3 = [(_TVCommonSenseTemplateController *)self view];
  [v3 setBackgroundColor:0];
  v4 = [_TVCommonSenseView alloc];
  [v3 bounds];
  v5 = -[_TVCommonSenseView initWithFrame:](v4, "initWithFrame:");
  commonSenseView = self->_commonSenseView;
  self->_commonSenseView = v5;

  [v3 addSubview:self->_commonSenseView];
  [(_TVCommonSenseTemplateController *)self _loadTemplate];
}

- (void)updateWithCommonSenseTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_templateElement, a3);
  if ([(_TVCommonSenseTemplateController *)self isViewLoaded])
  {
    [(_TVCommonSenseTemplateController *)self _loadTemplate];
  }
}

- (void)_loadTemplate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(_TVCommonSenseTemplateController *)self templateElement];
  v4 = v3;
  if (v3 && objc_msgSend(v3, "tv_elementType") == 77)
  {
    v5 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = objc_msgSend(v4, "children", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "tv_elementType");
          switch(v12)
          {
            case 13:
              [(_TVCommonSenseTemplateController *)self _updateFooterWithElement:v11];
              break;
            case 20:
              v13 = [(_TVCommonSenseTemplateController *)self _infoTableFromElement:v11];
              [v5 addObject:v13];

              break;
            case 15:
              [(_TVCommonSenseTemplateController *)self _updateHeaderWithElement:v11];
              break;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      v14 = [(_TVCommonSenseTemplateController *)self commonSenseView];
      [v14 setInfoViews:v5];
    }
  }
}

- (void)_updateHeaderWithElement:(id)a3
{
  id v9 = a3;
  if (objc_msgSend(v9, "tv_elementType") == 15)
  {
    v4 = +[TVInterfaceFactory sharedInterfaceFactory];
    v5 = [(_TVCommonSenseTemplateController *)self commonSenseView];
    v6 = [v5 headerView];
    uint64_t v7 = [v4 _viewFromElement:v9 existingView:v6];

    uint64_t v8 = [(_TVCommonSenseTemplateController *)self commonSenseView];
    [v8 setHeaderView:v7];
  }
}

- (void)_updateFooterWithElement:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(v4, "tv_elementType") == 13)
  {
    v5 = [(_TVCommonSenseTemplateController *)self commonSenseView];
    v6 = [v5 footerView];
    uint64_t v7 = v6;
    uint64_t v20 = self;
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = objc_alloc_init(_TVCommonSenseFooterView);
    }
    id v9 = v8;

    [(UIView *)v9 transferLayoutStylesFromElement:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = [v4 children];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "tv_elementType") == 16)
          {
            long long v16 = +[TVInterfaceFactory sharedInterfaceFactory];
            long long v17 = [(_TVCommonSenseFooterView *)v9 logoView];
            long long v18 = [v16 _viewFromElement:v15 existingView:v17];

            [(_TVCommonSenseFooterView *)v9 setLogoView:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    v19 = [(_TVCommonSenseTemplateController *)v20 commonSenseView];
    [v19 setFooterView:v9];
  }
}

- (id)_infoTableFromElement:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "tv_elementType") == 20)
  {
    id v4 = +[TVInterfaceFactory sharedInterfaceFactory];
    v5 = [v4 _viewFromElement:v3 existingView:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_TVCommonSenseView)commonSenseView
{
  return self->_commonSenseView;
}

- (void)setCommonSenseView:(id)a3
{
}

- (IKViewElement)templateElement
{
  return self->_templateElement;
}

- (void)setTemplateElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_commonSenseView, 0);
}

@end