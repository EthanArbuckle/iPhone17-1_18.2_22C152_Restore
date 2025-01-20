@interface PKExtensionProvider
@end

@implementation PKExtensionProvider

void __116__PKExtensionProvider_PKUIAdditions___beginRemoteViewControllerExtensionServiceWithExtension_inputItems_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F87538];
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    v17[0] = v9;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v14 = [v11 errorWithDomain:v12 code:-1002 userInfo:v13];
  }
  else
  {
    v14 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id, id, void *))(v15 + 16))(v15, v8, v7, v14);
  }
}

@end