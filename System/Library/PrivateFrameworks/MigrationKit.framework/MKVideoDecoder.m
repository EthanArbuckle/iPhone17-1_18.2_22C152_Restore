@interface MKVideoDecoder
- (MKVideoDecoder)init;
- (NSString)mediaType;
- (id)extractFormatOfAsset:(id)a3;
- (id)mediaFormatWithFormatDescriptions:(id)a3;
- (void)setMediaType:(id)a3;
@end

@implementation MKVideoDecoder

- (MKVideoDecoder)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKVideoDecoder;
  v2 = [(MKVideoDecoder *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKVideoDecoder *)v2 setMediaType:*MEMORY[0x263EF9D48]];
  }
  return v3;
}

- (id)extractFormatOfAsset:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = [NSURL fileURLWithPath:v4];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = (void *)v5;
  uint64_t v7 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v5 options:0];
  if (!v7)
  {

LABEL_7:
    id v12 = 0;
    v15 = &stru_26DF6A8B0;
    goto LABEL_8;
  }
  v8 = (void *)v7;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  v10 = [(MKVideoDecoder *)self mediaType];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __39__MKVideoDecoder_extractFormatOfAsset___block_invoke;
  v20[3] = &unk_264905E40;
  v22 = &v24;
  v23 = &v30;
  v11 = v9;
  v21 = v11;
  [v8 loadTracksWithMediaType:v10 completionHandler:v20];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = (id)v25[5];
  if ([(id)v31[5] count])
  {
    v13 = [(id)v31[5] objectAtIndex:0];
    v14 = [v13 formatDescriptions];
    v15 = [(MKVideoDecoder *)self mediaFormatWithFormatDescriptions:v14];
  }
  else
  {
    v15 = &stru_26DF6A8B0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  if (v12)
  {
    v18 = +[MKLog log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(MKVideoDecoder *)(uint64_t)v4 extractFormatOfAsset:v18];
    }
  }
LABEL_8:
  if (![(__CFString *)v15 length])
  {
    v19.receiver = self;
    v19.super_class = (Class)MKVideoDecoder;
    uint64_t v16 = [(MKFileDecoder *)&v19 extractFormatOfAsset:v4];

    v15 = (__CFString *)v16;
  }

  return v15;
}

void __39__MKVideoDecoder_extractFormatOfAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)mediaFormatWithFormatDescriptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v3 objectAtIndexedSubscript:v5];

      CMMediaType MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v6);
      id v8 = FourCCString(MediaType);
      FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v6);
      v10 = FourCCString(MediaSubType);
      [v4 appendFormat:@"%@/%@", v8, v10];
      if ([v3 count] - 1 > v5) {
        [v4 appendString:@","];
      }

      ++v5;
    }
    while ([v3 count] > v5);
  }

  return v4;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  self->_mediaType = (NSString *)a3;
}

- (void)extractFormatOfAsset:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "could not extract a format of asset. path=%@, error=%@", (uint8_t *)&v6, 0x16u);
}

@end