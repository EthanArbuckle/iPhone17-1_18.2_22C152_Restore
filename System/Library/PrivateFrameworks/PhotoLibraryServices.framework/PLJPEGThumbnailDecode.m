@interface PLJPEGThumbnailDecode
+ (id)_baseSessionOptions;
+ (id)decodeSessionOptions;
+ (id)decodeSessionOptionsForMaxPixelSize:(id)a3;
@end

@implementation PLJPEGThumbnailDecode

+ (id)decodeSessionOptionsForMaxPixelSize:(id)a3
{
  id v4 = a3;
  v5 = [a1 _baseSessionOptions];
  v6 = v5;
  if (v4) {
    [v5 setObject:v4 forKey:*MEMORY[0x1E4F562A8]];
  }

  return v6;
}

+ (id)decodeSessionOptions
{
  pl_dispatch_once();
  v2 = (void *)decodeSessionOptions_decodeSessionOptions;
  return v2;
}

void __45__PLJPEGThumbnailDecode_decodeSessionOptions__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _baseSessionOptions];
  if (PLIsPTPD())
  {
    v1 = [NSNumber numberWithInt:1111970369];
    [v4 setObject:v1 forKey:*MEMORY[0x1E4F562B0]];
  }
  uint64_t v2 = [v4 copy];
  v3 = (void *)decodeSessionOptions_decodeSessionOptions;
  decodeSessionOptions_decodeSessionOptions = v2;
}

+ (id)_baseSessionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F56298], 0);
}

@end