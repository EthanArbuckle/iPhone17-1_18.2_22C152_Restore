@interface PTRow
@end

@implementation PTRow

void __64__PTRow_PhotosUI__pu_rowWithTitle_settingsProvider_isTransient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E4FB1EC0], "px_viewControllerWithSettings:", v7);
  objc_msgSend(v6, "pu_debugSetTransient:", *(unsigned __int8 *)(a1 + 40));
  [v5 pushViewController:v6 animated:1];
}

id __44__PTRow_PhotosUI__pu_rowWithTitle_settings___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __42__PTRow_PhotosUI__pu_rowWithTitle_action___block_invoke(uint64_t a1)
{
  return 1;
}

void __62__PTRow_PhotosUI__pu_rowWithTitle_asynchronousOutputProducer___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1EC0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v2, "px_viewControllerWithAsynchronousOutputProducer:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_debugSetTransient:", 1);
  [v4 pushViewController:v5 animated:1];
}

void __42__PTRow_PhotosUI__pu_rowWithTitle_output___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);
}

@end