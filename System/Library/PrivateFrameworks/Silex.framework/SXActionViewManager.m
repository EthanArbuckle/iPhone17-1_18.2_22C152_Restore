@interface SXActionViewManager
- (SXActionViewManager)initWithViewControllerPresenting:(id)a3;
- (SXViewControllerPresenting)viewControllerPresenter;
- (void)presentActivityGroup:(id)a3 action:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
@end

@implementation SXActionViewManager

- (SXActionViewManager)initWithViewControllerPresenting:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXActionViewManager;
  v6 = [(SXActionViewManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewControllerPresenter, a3);
  }

  return v7;
}

- (void)presentActivityGroup:(id)a3 action:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v43 = a7;
  if (v15)
  {
    uint64_t v18 = [v15 activities];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [v15 activities];
      uint64_t v21 = [v20 count];

      if (v16)
      {
        if (v21)
        {
          v39 = self;
          id v40 = v17;
          id v41 = v16;
          v22 = (void *)MEMORY[0x263F1C3F8];
          v23 = [v15 title];
          v24 = [v22 alertControllerWithTitle:v23 message:0 preferredStyle:0];

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id obj = [v15 activities];
          uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v49 != v27) {
                  objc_enumerationMutation(obj);
                }
                v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                v30 = (void *)MEMORY[0x263F1C3F0];
                v31 = [v29 label];
                v46[0] = MEMORY[0x263EF8330];
                v46[1] = 3221225472;
                v46[2] = __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke;
                v46[3] = &unk_264651F58;
                id v32 = v43;
                v46[4] = v29;
                id v47 = v32;
                v33 = [v30 actionWithTitle:v31 style:0 handler:v46];

                [v24 addAction:v33];
              }
              uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
            }
            while (v26);
          }

          v34 = (void *)MEMORY[0x263F1C3F0];
          v35 = SXBundle();
          v36 = [v35 localizedStringForKey:@"Cancel" value:&stru_26D5311C0 table:0];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke_2;
          v44[3] = &unk_264651F80;
          id v45 = v43;
          v37 = [v34 actionWithTitle:v36 style:1 handler:v44];

          [v24 addAction:v37];
          v38 = [(SXActionViewManager *)v39 viewControllerPresenter];
          id v17 = v40;
          objc_msgSend(v38, "presentViewController:animated:sourceView:sourceRect:", v24, 1, v40, x, y, width, height);

          id v16 = v41;
        }
      }
    }
  }
}

uint64_t __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __84__SXActionViewManager_presentActivityGroup_action_sourceView_sourceRect_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (SXViewControllerPresenting)viewControllerPresenter
{
  return self->_viewControllerPresenter;
}

- (void).cxx_destruct
{
}

@end