@interface PTRow
@end

@implementation PTRow

uint64_t __36__PTRow_PhotosUICore__px_increment___block_invoke(uint64_t a1, void *a2)
{
  [a2 floatValue];
  double v4 = *(double *)(a1 + 32) * round(v3 / *(double *)(a1 + 32));
  v5 = NSNumber;
  return [v5 numberWithDouble:v4];
}

void __49__PTRow_PhotosUICore__px_rowWithTitle_urlString___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:&__block_literal_global_68146];
}

uint64_t __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  ++isIndexingQueryCount;
  int v6 = isIndexing;
  if ((isIndexing & 1) == 0)
  {
    v7 = [v4 presentingViewController];

    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_2;
      v17[3] = &unk_1E5DD3128;
      id v18 = *(id *)(a1 + 32);
      [v5 dismissViewControllerAnimated:1 completion:v17];
      v8 = v18;
    }
    else
    {
      v8 = [v5 navigationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v8 dismissButton];
        v10 = [MEMORY[0x1E4FB1438] sharedApplication];
        uint64_t v11 = [v9 action];
        v12 = [v9 target];
        [v10 sendAction:v11 to:v12 from:0 forEvent:0];

        if (*(void *)(a1 + 32))
        {
          dispatch_time_t v13 = dispatch_time(0, 500000000);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_3;
          v15[3] = &unk_1E5DD3128;
          id v16 = *(id *)(a1 + 32);
          dispatch_after(v13, MEMORY[0x1E4F14428], v15);
        }
      }
    }
  }
  return v6 ^ 1u;
}

uint64_t __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__PTRow_PhotosUICore__px_rowWithTitle_action___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a3 navigationController];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return 1;
}

void __64__PTRow_PhotosUICore__px_rowWithTitle_continuousOutputProducer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB1EC0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v2, "px_viewControllerWithContinuousOutputProducer:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 pushViewController:v5 animated:1];
}

void __66__PTRow_PhotosUICore__px_rowWithTitle_asynchronousOutputProducer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB1EC0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v2, "px_viewControllerWithAsynchronousOutputProducer:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 pushViewController:v5 animated:1];
}

void __46__PTRow_PhotosUICore__px_rowWithTitle_output___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);
}

BOOL __99__PTRow_PhotosUICoreProtoSoftLinking__px_rowWithTitle_protoViewControllerFactoryClassName_options___block_invoke(void **a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PXSoftLinkedProtoMakeViewControllerWithFactoryClassName(a1[4], a1[5], a1[6]);
  int v6 = v5;
  if (v5)
  {
    [v5 setModalPresentationStyle:1];
    [v4 presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Couldn't load view controller controller from factory %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v6 != 0;
}

@end