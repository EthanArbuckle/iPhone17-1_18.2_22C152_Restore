@interface PXAppleMusicImageLoader
@end

@implementation PXAppleMusicImageLoader

uint64_t __60___PXAppleMusicImageLoader__handleURLFetchFailureWithError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16);
  return v2();
}

uint64_t __62___PXAppleMusicImageLoader__handleRequestData_response_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16);
  return v2();
}

void __50___PXAppleMusicImageLoader__beginDownloadFromURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleRequestData:v9 response:v8 error:v7];
}

@end