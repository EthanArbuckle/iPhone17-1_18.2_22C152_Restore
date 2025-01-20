@interface NUAuxiliaryImageRenderRequest(PU)
+ (uint64_t)createGainMapForComposition:()PU;
@end

@implementation NUAuxiliaryImageRenderRequest(PU)

+ (uint64_t)createGainMapForComposition:()PU
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F7A380];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithComposition:v4];

  [v5 setAuxiliaryImageType:7];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
  [v5 setPriority:v6];

  [v5 setName:@"NUAuxiliaryImageRenderRequest-createGainMap"];
  id v13 = 0;
  v7 = [v5 submitSynchronous:&v13];
  id v8 = v13;
  if (v7)
  {
    v9 = [v7 auxiliaryImage];
    uint64_t v10 = [v9 cgImageRef];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_78261);
    }
    v11 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_error_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Could not load gain image: %@", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

@end