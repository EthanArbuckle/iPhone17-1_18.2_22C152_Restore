@interface CreateInfoForImageWithProperties
@end

@implementation CreateInfoForImageWithProperties

void ____CreateInfoForImageWithProperties_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 56) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v6 = [a3 URL];
      if (v6)
      {
        [*(id *)(a1 + 32) setObject:v6 forKey:*MEMORY[0x1E4F43978]];
        uint64_t v7 = [a3 sandboxExtensionToken];
        if (v7) {
          [*(id *)(a1 + 32) setObject:v7 forKey:@"PUPhotoPickerOriginalImagePathSandboxExtensionToken"];
        }
      }
    }
    else if (a2)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:a2];
      if (v13) {
        [*(id *)(a1 + 32) setObject:v13 forKey:*MEMORY[0x1E4F439A0]];
      }
    }
  }
  if (*(unsigned char *)(a1 + 58) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v8 = [a3 URL];
      if (!v8) {
        return;
      }
      [*(id *)(a1 + 32) setObject:v8 forKey:*MEMORY[0x1E4F43978]];
      uint64_t v9 = [a3 sandboxExtensionToken];
      if (!v9) {
        return;
      }
      uint64_t v10 = v9;
      v11 = *(void **)(a1 + 32);
      v12 = @"PUPhotoPickerOriginalImagePathSandboxExtensionToken";
    }
    else
    {
      if (!a2) {
        return;
      }
      v11 = *(void **)(a1 + 32);
      v12 = (__CFString *)*MEMORY[0x1E4F44070];
      uint64_t v10 = a2;
    }
    [v11 setObject:v10 forKey:v12];
  }
}

@end