@interface PXGStringTextureProvider
- (BOOL)_shouldRedrawForViewEnvironmentChange:(id)a3;
- (PXGStringTextureProvider)init;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForAttributedString:(id)a3 attributedStringBoundingSize:(CGSize)a4 string:(id)a5 withAttributes:(id)a6 targetSize:(CGSize)a7 drawingOptions:(int64_t)a8 drawingContext:(id)a9 userInterfaceDirection:(unint64_t)a10 verticalAlignment:(int64_t)a11 screenScale:(double)a12 textureRequestID:(int)a13 padding:(UIEdgeInsets)a14;
- (void)cancelTextureRequests:(id)a3;
- (void)viewEnvironmentDidChange:(id)a3;
@end

@implementation PXGStringTextureProvider

- (PXGStringTextureProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGStringTextureProvider;
  result = [(PXGCGImageTextureProvider *)&v3 init];
  if (result) {
    result->_requestBlockLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)viewEnvironmentDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXGStringTextureProvider;
  id v4 = a3;
  [(PXGTextureProvider *)&v8 viewEnvironmentDidChange:v4];
  BOOL v5 = -[PXGStringTextureProvider _shouldRedrawForViewEnvironmentChange:](self, "_shouldRedrawForViewEnvironmentChange:", v4, v8.receiver, v8.super_class);

  if (v5)
  {
    [(PXGCGImageTextureProvider *)self invalidateCache];
    p_requestBlockLock = &self->_requestBlockLock;
    os_unfair_lock_lock(&self->_requestBlockLock);
    v7 = (void *)[(NSMutableDictionary *)self->_requestBlockLock_requestIDsToProviderBlock copy];
    os_unfair_lock_unlock(p_requestBlockLock);
    [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_260927];
  }
}

- (BOOL)_shouldRedrawForViewEnvironmentChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXGTextureProvider *)self viewEnvironment];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  return v6 != v7;
}

- (void).cxx_destruct
{
}

- (void)_requestTextureForAttributedString:(id)a3 attributedStringBoundingSize:(CGSize)a4 string:(id)a5 withAttributes:(id)a6 targetSize:(CGSize)a7 drawingOptions:(int64_t)a8 drawingContext:(id)a9 userInterfaceDirection:(unint64_t)a10 verticalAlignment:(int64_t)a11 screenScale:(double)a12 textureRequestID:(int)a13 padding:(UIEdgeInsets)a14
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  if ([(PXGTextureProvider *)self isRequestActive:a13]) {
    PXPixelSizeAreaIsZero();
  }
}

uint64_t __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_2;
  v7[3] = &unk_1E5DCD6D8;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 96);
  id v2 = *(id *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 104);
  id v11 = v2;
  uint64_t v14 = v3;
  long long v4 = *(_OWORD *)(a1 + 128);
  long long v15 = *(_OWORD *)(a1 + 112);
  long long v16 = v4;
  uint64_t v17 = *(void *)(a1 + 144);
  uint64_t v5 = MEMORY[0x1AD10B1D0](0, 0, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

  return v5;
}

uint64_t __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_3(uint64_t a1, uint64_t a2)
{
  char v9 = 0;
  __int16 v8 = 0;
  memset(v12, 0, sizeof(v12));
  char v2 = *(unsigned char *)(a1 + 44);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  long long v6 = *(_OWORD *)off_1E5DAAFA0;
  char v7 = v2;
  int v10 = 1065353216;
  char v11 = 0;
  return [v3 provideCGImage:a2 options:&v6 forRequestID:v4];
}

void __233__PXGStringTextureProvider__requestTextureForAttributedString_attributedStringBoundingSize_string_withAttributes_targetSize_drawingOptions_drawingContext_userInterfaceDirection_verticalAlignment_screenScale_textureRequestID_padding___block_invoke_2(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  long long v12 = *(void **)(a1 + 32);
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 40) attributes:*(void *)(a1 + 48)];
  }
  PXGDrawAttributedString(v13, *(void *)(a1 + 80), *(void **)(a1 + 56), *(void *)(a1 + 88), a2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), v14, a3, a4, a5, a6, *(CGFloat *)(a1 + 128));
}

uint64_t __53__PXGStringTextureProvider_viewEnvironmentDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (void)cancelTextureRequests:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXGStringTextureProvider;
  id v4 = a3;
  [(PXGTextureProvider *)&v6 cancelTextureRequests:v4];
  os_unfair_lock_lock(&self->_requestBlockLock);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PXGStringTextureProvider_cancelTextureRequests___block_invoke;
  v5[3] = &unk_1E5DD3010;
  v5[4] = self;
  [v4 enumerateIndexesUsingBlock:v5];

  os_unfair_lock_unlock(&self->_requestBlockLock);
}

void __50__PXGStringTextureProvider_cancelTextureRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [*(id *)(*(void *)(a1 + 32) + 264) removeObjectForKey:v3];
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10 = a3;
  uint64_t length = a3.length;
  id v13 = a7;
  val = self;
  v81.receiver = self;
  v81.super_class = (Class)PXGStringTextureProvider;
  v57 = a6;
  id v14 = [(PXGTextureProvider *)&v81 requestTexturesForSpritesInRange:v10 geometries:a4 styles:a5 infos:a6 inLayout:v13];
  NSUInteger v47 = v15;
  NSUInteger v48 = (NSUInteger)v14;
  v58 = [v13 contentSource];
  uint64_t v56 = [v13 userInterfaceDirection];
  [v13 displayScale];
  uint64_t v55 = v16;
  if (length)
  {
    uint64_t v53 = *((void *)off_1E5DAAF10 + 1);
    uint64_t v54 = *(void *)off_1E5DAAF10;
    uint64_t v51 = *((void *)off_1E5DAAF10 + 3);
    uint64_t v52 = *((void *)off_1E5DAAF10 + 2);
    v49 = *(void **)(MEMORY[0x1E4F28AE0] + 8);
    v50 = (void *)*MEMORY[0x1E4F28AE0];
    NSUInteger v17 = v48;
    do
    {
      id v18 = [v58 attributedStringForSpriteAtIndex:v10 inLayout:v13];
      uint64_t v62 = length;
      if (v18)
      {
        id v19 = 0;
        id v20 = 0;
      }
      else
      {
        id v20 = [v58 stringAtIndex:v10 inLayout:v13];
        id v19 = [v58 stringAttributesAtIndex:v10 inLayout:v13];
      }
      uint64_t v21 = [v58 verticalAlignmentForStringAtIndex:v10 inLayout:v13];
      if ([v13 stringSourceRespondsTo]) {
        uint64_t v22 = [v58 stringDrawingOptionsForSpriteAtIndex:v10 inLayout:v13];
      }
      else {
        uint64_t v22 = 1;
      }
      uint64_t v24 = v51;
      uint64_t v23 = v52;
      uint64_t v25 = v53;
      uint64_t v26 = v54;
      if (([v13 stringSourceRespondsTo] & 0x100) != 0)
      {
        [v58 paddingForSpriteAtIndex:v10 inLayout:v13];
        uint64_t v26 = v27;
        uint64_t v25 = v28;
        uint64_t v23 = v29;
        uint64_t v24 = v30;
      }
      if (([v13 stringSourceRespondsTo] & 0x10000) != 0)
      {
        v31 = [v58 drawingContextForSpriteAtIndex:v10 inLayout:v13];
      }
      else
      {
        v31 = 0;
      }
      v33 = v49;
      v32 = v50;
      if (([v13 stringSourceRespondsTo] & 0x1000000) != 0)
      {
        [v58 attributedStringBoundingSizeForSpriteAtIndex:v10 inLayout:v13];
        v32 = v34;
        v33 = v35;
      }
      float32x2_t v36 = (float32x2_t)*(&v57->var3 + 5 * v10.location);
      objc_initWeak(&location, val);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      aBlock[3] = &unk_1E5DCD690;
      objc_copyWeak(v69, &location);
      id v60 = v19;
      id v65 = v60;
      id v61 = v18;
      id v66 = v61;
      v69[1] = v32;
      v69[2] = v33;
      id v59 = v20;
      id v67 = v59;
      float64x2_t v70 = vcvtq_f64_f32(v36);
      uint64_t v71 = v22;
      id v37 = v31;
      id v68 = v37;
      uint64_t v72 = v56;
      uint64_t v73 = v21;
      int v79 = v17;
      uint64_t v74 = v55;
      uint64_t v75 = v26;
      uint64_t v76 = v25;
      uint64_t v77 = v23;
      uint64_t v78 = v24;
      v38 = (void (**)(void))_Block_copy(aBlock);
      os_unfair_lock_lock(&val->_requestBlockLock);
      if (!val->_requestBlockLock_requestIDsToProviderBlock)
      {
        v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        requestBlockLock_requestIDsToProviderBlock = val->_requestBlockLock_requestIDsToProviderBlock;
        val->_requestBlockLock_requestIDsToProviderBlock = v39;
      }
      v41 = (void *)[v38 copy];
      v42 = _Block_copy(v41);
      v43 = val->_requestBlockLock_requestIDsToProviderBlock;
      v44 = [NSNumber numberWithInt:v17];
      [(NSMutableDictionary *)v43 setObject:v42 forKeyedSubscript:v44];

      os_unfair_lock_unlock(&val->_requestBlockLock);
      v38[2](v38);

      objc_destroyWeak(v69);
      objc_destroyWeak(&location);

      NSUInteger v17 = (v17 + 1);
      _PXGSpriteIndexRange v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      uint64_t length = v62 - 1;
    }
    while (v62 != 1);
  }

  NSUInteger v46 = v47;
  NSUInteger v45 = v48;
  result.uint64_t length = v46;
  result.id location = v45;
  return result;
}

void __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [WeakRetained viewEnvironment];
    id v6 = v4;
    id v7 = v5;
    __int16 v8 = v7;
    if (v6)
    {
      if (v7)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = ___PXGResolvedAttributesWithViewEnvironment_block_invoke;
        v27[3] = &unk_1E5DCD770;
        id v28 = v9;
        id v29 = v8;
        id v10 = v9;
        [v6 enumerateKeysAndObjectsUsingBlock:v27];
        id v11 = (id)[v10 copy];
      }
      else
      {
        id v11 = v6;
      }
    }
    else
    {
      id v11 = 0;
    }

    long long v12 = [v3 requestQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
    v14[3] = &unk_1E5DCD668;
    v14[4] = v3;
    id v15 = *(id *)(a1 + 40);
    long long v19 = *(_OWORD *)(a1 + 72);
    id v16 = *(id *)(a1 + 48);
    id v17 = v11;
    long long v20 = *(_OWORD *)(a1 + 88);
    uint64_t v21 = *(void *)(a1 + 104);
    id v18 = *(id *)(a1 + 56);
    long long v22 = *(_OWORD *)(a1 + 112);
    uint64_t v23 = *(void *)(a1 + 128);
    int v26 = *(_DWORD *)(a1 + 168);
    long long v24 = *(_OWORD *)(a1 + 136);
    long long v25 = *(_OWORD *)(a1 + 152);
    id v13 = v11;
    dispatch_async(v12, v14);
  }
}

uint64_t __94__PXGStringTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t a1)
{
  LODWORD(v2) = *(_DWORD *)(a1 + 168);
  return objc_msgSend(*(id *)(a1 + 32), "_requestTextureForAttributedString:attributedStringBoundingSize:string:withAttributes:targetSize:drawingOptions:drawingContext:userInterfaceDirection:verticalAlignment:screenScale:textureRequestID:padding:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 104), *(void *)(a1 + 64), *(void *)(a1 + 112), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 128), *(void *)(a1 + 120), v2, *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152),
           *(void *)(a1 + 160));
}

@end