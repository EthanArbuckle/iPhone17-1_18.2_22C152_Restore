@interface PXGViewTextureProvider
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForViewClass:(Class)a3 userData:(id)a4 requestID:(int)a5;
@end

@implementation PXGViewTextureProvider

- (void)_requestTextureForViewClass:(Class)a3 userData:(id)a4 requestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  v9 = [[PXGViewPayload alloc] initWithViewClass:a3 userData:v8];

  [(PXGTextureProvider *)self providePayload:v9 forRequestID:v5];
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12 = a7;
  v35.receiver = self;
  v35.super_class = (Class)PXGViewTextureProvider;
  id v13 = [(PXGTextureProvider *)&v35 requestTexturesForSpritesInRange:a3 geometries:a4 styles:a5 infos:a6 inLayout:v12];
  NSUInteger v15 = v14;
  v16 = [v12 contentSource];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v17 = v16;
    if (v17)
    {
      unint64_t v18 = HIDWORD(*(unint64_t *)&a3);
      if (a3.length)
      {
        NSUInteger v28 = v15;
        id v29 = v13;
        int v19 = (int)v13;
        do
        {
          uint64_t v20 = [v17 viewClassForSpriteAtIndex:a3 inLayout:v12];
          if (v20)
          {
            v21 = (void *)v20;
            v22 = [v17 viewUserDataForSpriteAtIndex:a3 inLayout:v12];
            v23 = (void *)[v22 copyWithZone:0];

            objc_initWeak(&location, self);
            v24 = [(PXGTextureProvider *)self requestQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __92__PXGViewTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
            block[3] = &unk_1E5DB00F0;
            id v31 = v23;
            id v25 = v23;
            objc_copyWeak(v32, &location);
            v32[1] = v21;
            int v33 = v19;
            dispatch_async(v24, block);

            objc_destroyWeak(v32);
            objc_destroyWeak(&location);
          }
          ++v19;
          a3 = (_PXGSpriteIndexRange)(a3.location + 1);
          LODWORD(v18) = v18 - 1;
        }
        while (v18);
        NSUInteger v15 = v28;
        id v13 = v29;
      }
    }
  }
  else
  {
    id v17 = 0;
  }

  NSUInteger v26 = (NSUInteger)v13;
  NSUInteger v27 = v15;
  result.length = v27;
  result.id location = v26;
  return result;
}

void __92__PXGViewTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) prepareForRender];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _requestTextureForViewClass:*(void *)(a1 + 48) userData:*(void *)(a1 + 32) requestID:*(unsigned int *)(a1 + 56)];
}

@end