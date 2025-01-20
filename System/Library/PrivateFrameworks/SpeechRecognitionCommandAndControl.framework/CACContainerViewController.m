@interface CACContainerViewController
- (BOOL)_canShowWhileLocked;
- (NSMutableArray)viewControllers;
- (UIView)viewAboveContainedViews;
- (void)installViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)loadView;
- (void)setViewControllers:(id)a3;
- (void)uninstallViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation CACContainerViewController

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  [(CACContainerViewController *)self setView:v3];
}

- (UIView)viewAboveContainedViews
{
  viewAboveContainedViews = self->_viewAboveContainedViews;
  if (!viewAboveContainedViews)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    v5 = [(CACContainerViewController *)self view];
    [v5 bounds];
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_viewAboveContainedViews;
    self->_viewAboveContainedViews = v6;

    [(UIView *)self->_viewAboveContainedViews setAutoresizingMask:18];
    v8 = [(CACContainerViewController *)self view];
    [v8 addSubview:self->_viewAboveContainedViews];

    viewAboveContainedViews = self->_viewAboveContainedViews;
  }
  return viewAboveContainedViews;
}

- (void)installViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(void))a5;
  v10 = [(CACContainerViewController *)self viewControllers];
  int v11 = [v10 containsObject:v8];

  if (v11)
  {
    v12 = CACLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_238377000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to reinstall view controller that was already installed: %@", (uint8_t *)&buf, 0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    v13 = [(CACContainerViewController *)self viewControllers];

    if (!v13)
    {
      v14 = [MEMORY[0x263EFF980] array];
      [(CACContainerViewController *)self setViewControllers:v14];
    }
    v15 = [(CACContainerViewController *)self view];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [v8 view];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    v25 = [v8 view];
    [v25 setAutoresizingMask:18];

    [(CACContainerViewController *)self addChildViewController:v8];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    v26 = [(CACContainerViewController *)self viewControllers];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke;
    v44[3] = &unk_264D129B0;
    id v27 = v8;
    id v45 = v27;
    v46 = self;
    p_long long buf = &buf;
    [v26 enumerateObjectsUsingBlock:v44];

    if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      v28 = [(CACContainerViewController *)self viewControllers];
      [v28 addObject:v27];

      if (self->_viewAboveContainedViews)
      {
        v29 = [(CACContainerViewController *)self view];
        v30 = [v27 view];
        [v29 insertSubview:v30 belowSubview:self->_viewAboveContainedViews];
      }
      else
      {
        v29 = [(CACContainerViewController *)self view];
        v30 = [v27 view];
        [v29 addSubview:v30];
      }
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke_2;
    v40[3] = &unk_264D11730;
    id v31 = v27;
    id v41 = v31;
    v42 = self;
    v43 = v9;
    uint64_t v32 = MEMORY[0x23EC8F1E0](v40);
    v33 = (void *)v32;
    if (v6)
    {
      v34 = [v31 view];
      [v34 setAlpha:0.0];

      v35 = (void *)MEMORY[0x263F82E00];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke_3;
      v38[3] = &unk_264D115D0;
      id v39 = v31;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke_4;
      v36[3] = &unk_264D125E8;
      id v37 = v33;
      [v35 animateWithDuration:v38 animations:v36 completion:0.3];
    }
    else
    {
      (*(void (**)(uint64_t))(v32 + 16))(v32);
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __72__CACContainerViewController_installViewController_animated_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [v12 zOrder];
  if (v7 > [*(id *)(a1 + 32) zOrder])
  {
    id v8 = [*(id *)(a1 + 40) viewControllers];
    [v8 insertObject:*(void *)(a1 + 32) atIndex:a3];

    v9 = [*(id *)(a1 + 40) view];
    v10 = [*(id *)(a1 + 32) view];
    int v11 = [v12 view];
    [v9 insertSubview:v10 belowSubview:v11];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __72__CACContainerViewController_installViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __72__CACContainerViewController_installViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __72__CACContainerViewController_installViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uninstallViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(void))a5;
  v10 = CACLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_238377000, v10, OS_LOG_TYPE_INFO, "Uninstalling view controller... %@", buf, 0xCu);
  }

  int v11 = [(CACContainerViewController *)self viewControllers];
  char v12 = [v11 containsObject:v8];

  if (v12)
  {
    [v8 willMoveToParentViewController:0];
    v13 = [(CACContainerViewController *)self viewControllers];
    [v13 removeObject:v8];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke;
    v23[3] = &unk_264D129D8;
    id v14 = v8;
    id v24 = v14;
    v25 = v9;
    BOOL v26 = v6;
    uint64_t v15 = MEMORY[0x23EC8F1E0](v23);
    double v16 = (void *)v15;
    if (v6)
    {
      double v17 = (void *)MEMORY[0x263F82E00];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_3;
      v21[3] = &unk_264D115D0;
      id v22 = v14;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_4;
      v19[3] = &unk_264D125E8;
      id v20 = v16;
      [v17 animateWithDuration:v21 animations:v19 completion:0.3];
    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }
  }
  else
  {
    double v18 = CACLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v8;
      _os_log_impl(&dword_238377000, v18, OS_LOG_TYPE_DEFAULT, "Attempted to uninstall overlay view controller that was not installed: %@", buf, 0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

void __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  BOOL v6 = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_2;
  uint64_t v7 = &unk_264D116E0;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  v2 = (void (**)(void))MEMORY[0x23EC8F1E0](&v4);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "presentedViewController", v4, v5, v6, v7);

  if (v3) {
    [*(id *)(a1 + 32) dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) completion:v2];
  }
  else {
    v2[2](v2);
  }
}

uint64_t __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_viewAboveContainedViews, 0);
}

@end