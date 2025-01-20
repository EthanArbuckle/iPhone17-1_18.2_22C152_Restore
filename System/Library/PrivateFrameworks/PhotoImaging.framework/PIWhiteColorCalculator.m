@interface PIWhiteColorCalculator
@end

@implementation PIWhiteColorCalculator

uint64_t __50___PIWhiteColorCalculator__submitGERenderRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50___PIWhiteColorCalculator__submitGERenderRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 filterNode:@"CIEdges" input:a4 settings:&unk_1F000ACB0];
}

uint64_t __50___PIWhiteColorCalculator__submitGWRenderRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51___PIWhiteColorCalculator__computeGreenPercentage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke_2;
  v9[3] = &unk_1E5D7F4F8;
  v9[4] = v4;
  id v10 = v3;
  uint64_t v12 = *(void *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v3;
  [v4 readBufferFromImage:v5 withRGBAfBufferBlock:v9];
}

__n128 __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _computeWhitePointColorWithGrayEdgesBuffer:*(void *)(a1 + 40) grayWorldBuffer:a2 greenChannelPercentage:*(void *)(a1 + 48) RAWCameraSpaceProperties:*(double *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  *(_OWORD *)(v3 + 64) = v7;
  *(_OWORD *)(v3 + 80) = v8;
  *(void *)(v3 + 96) = v9;
  __n128 result = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(__n128 *)(v3 + 48) = v6;
  return result;
}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  long long v5 = [v4 data];

  if (v5)
  {
    __n128 v6 = [v5 objectForKeyedSubscript:@"color"];

    Components = CGColorGetComponents((CGColorRef)v6);
    CGFloat v8 = (*Components + Components[1] + Components[2]) * 0.25;
    [*(id *)(a1 + 32) doubleValue];
    if (v9 * v8 > 0.660000026) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0x3FE3333340000000;
    }
  }
}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = [v4 image];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = [v4 image];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    uint64_t v3 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (*(unsigned char *)(a1 + 96)) {
        long long v11 = @"YES";
      }
      else {
        long long v11 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v11;
      _os_log_debug_impl(&dword_1A9680000, v3, OS_LOG_TYPE_DEBUG, "Brightness is %@, greenChannelPercentage is %f, Sushi: %@", buf, 0x20u);
    }
    if (*(unsigned char *)(a1 + 96))
    {
      v4 = [*(id *)(a1 + 40) rawProperties];
      uint64_t v5 = [v4 rawCameraSpaceProperties];
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v6 = *(void **)(a1 + 48);
    if (v6) {
      [v6 _whitePointColorFromGrayEdgesImage:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) grayWorldImage:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) greenChannelPercentage:v5 RAWCameraSpaceProperties:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    }
    [*(id *)(a1 + 32) doubleValue];
    uint64_t v17 = v7;
    v12[2] = v15;
    v12[3] = v16;
    uint64_t v13 = v7;
    v12[0] = *(_OWORD *)buf;
    v12[1] = *(_OWORD *)&buf[16];
    CGFloat v8 = objc_msgSend(MEMORY[0x1E4F29238], "pi_valueWithGrayColorResult:", v12);
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__6630;
  v31[4] = __Block_byref_object_dispose__6631;
  id v32 = 0;
  v4 = [v3 buffer];
  uint64_t v5 = [v4 size];
  uint64_t v7 = v6;

  CGFloat v8 = [MEMORY[0x1E4F7A448] sharedFactory];
  uint64_t v9 = [v8 bufferFactory];
  uint64_t v10 = [v3 buffer];
  uint64_t v11 = [v10 size];
  uint64_t v13 = v12;
  v14 = [MEMORY[0x1E4F7A5D8] RGBAf];
  long long v15 = objc_msgSend(v9, "newStorageWithSize:format:", v11, v13, v14);

  long long v16 = (long long *)MEMORY[0x1E4F7A328];
  long long v28 = *MEMORY[0x1E4F7A328];
  uint64_t v29 = v5;
  uint64_t v30 = v7;
  uint64_t v17 = [MEMORY[0x1E4F7A5F8] regionWithRect:&v28];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke_2;
  v21[3] = &unk_1E5D7F480;
  id v18 = v3;
  long long v25 = *v16;
  uint64_t v26 = v5;
  uint64_t v27 = v7;
  id v22 = v18;
  v24 = v31;
  id v23 = *(id *)(a1 + 32);
  [v15 writeBufferInRegion:v17 block:v21];

  v19 = [MEMORY[0x1E4F7A448] sharedFactory];
  v20 = [v19 bufferFactory];
  [v20 returnStorage:v15];

  _Block_object_dispose(v31, 8);
}

void __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) buffer];
  uint64_t v5 = (void *)[v4 bytes];
  uint64_t v7 = *(void *)(a1 + 72);
  vImagePixelCount v6 = *(void *)(a1 + 80);
  src.data = v5;
  src.height = v6;
  src.width = 4 * v7;
  CGFloat v8 = [*(id *)(a1 + 32) buffer];
  src.rowBytes = [v8 rowBytes];

  v12.rowBytes = objc_msgSend(v3, "rowBytes", objc_msgSend(v3, "bytes"), *(void *)(a1 + 80), 4 * *(void *)(a1 + 72));
  vImageConvert_Planar16FtoPlanarF(&src, &v12, 0);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
  id v11 = v3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end