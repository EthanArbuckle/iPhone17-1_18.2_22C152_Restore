@interface ICQMegaBackupNetworkRequest
@end

@implementation ICQMegaBackupNetworkRequest

void __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke_2;
  v15[3] = &unk_1E6A520F8;
  v15[4] = v10;
  id v16 = v8;
  id v17 = v7;
  id v18 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  return [v4 handleURLResponse:v5 data:v6 error:v7];
}

@end