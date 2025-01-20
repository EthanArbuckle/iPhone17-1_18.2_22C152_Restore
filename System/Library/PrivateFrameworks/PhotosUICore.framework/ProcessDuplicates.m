@interface ProcessDuplicates
@end

@implementation ProcessDuplicates

void ___ProcessDuplicates_block_invoke_2(uint64_t a1)
{
  v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___ProcessDuplicates_block_invoke_3;
  v3[3] = &unk_1E5DD32A8;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void ___ProcessDuplicates_block_invoke_3(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v12 = 0;
  char v3 = objc_msgSend(v2, "internal_processIdenticalDuplicatesWithError:", &v12);
  id v4 = v12;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ProcessDuplicates_block_invoke_4;
  block[3] = &unk_1E5DCA2A0;
  id v5 = *(id *)(a1 + 32);
  char v11 = v3;
  id v8 = v5;
  id v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void ___ProcessDuplicates_block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___ProcessDuplicates_block_invoke_5;
  v3[3] = &unk_1E5DD21E8;
  char v6 = *(unsigned char *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void ___ProcessDuplicates_block_invoke_5(uint64_t a1)
{
  v2 = @"Processing succeeded";
  if (!*(unsigned char *)(a1 + 48)) {
    v2 = @"Processing failed";
  }
  char v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = *(void **)(a1 + 32);
  id v5 = v2;
  char v6 = [v4 description];
  id v8 = [v3 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v8 addAction:v7];

  [*(id *)(a1 + 40) presentViewController:v8 animated:1 completion:0];
}

@end