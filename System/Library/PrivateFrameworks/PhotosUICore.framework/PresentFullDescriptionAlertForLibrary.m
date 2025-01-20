@interface PresentFullDescriptionAlertForLibrary
@end

@implementation PresentFullDescriptionAlertForLibrary

void ___PresentFullDescriptionAlertForLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke_2;
  block[3] = &unk_1E5DD0F30;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void ___PresentFullDescriptionAlertForLibrary_block_invoke_2(uint64_t a1)
{
  id v4 = +[PXGenerativeStoryFeatureEligibilityDataSource fullDescriptionWithFeatureEligibilityState:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Library State" message:0 preferredStyle:1];
  [v2 _setAttributedMessage:v4];
  id v3 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v2 addAction:v3];

  [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
}

void ___PresentFullDescriptionAlertForLibrary_block_invoke_261441(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___PresentFullDescriptionAlertForLibrary_block_invoke_2_261442;
  v5[3] = &unk_1E5DD32A8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void ___PresentFullDescriptionAlertForLibrary_block_invoke_2_261442(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Library State" message:0 preferredStyle:1];
  [v3 _setAttributedMessage:*(void *)(a1 + 32)];
  v2 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v3 addAction:v2];

  [*(id *)(a1 + 40) presentViewController:v3 animated:1 completion:0];
}

@end