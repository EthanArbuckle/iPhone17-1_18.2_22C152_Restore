@interface OSABinaryImageCatalog
+ (BOOL)isApplePath:(id)a3 orBundle:(id)a4;
- (BOOL)isAddressInTargetedCache:(unint64_t)a3;
- (OSABinaryImageCatalog)init;
- (id)reportUsedImages;
- (id)reportUsedImagesFullInfoUsingBlock:(id)a3;
- (id)searchFrame:(unint64_t)a3 in:(id)a4 regions:(id)a5 result:(id *)a6;
- (id)searchFrame:(unint64_t)a3 in:(id)a4 result:(id *)a5;
- (unint64_t)markImageAsUsed:(id)a3 from:(int)a4;
- (void)appendNotesTo:(id)a3;
- (void)setKernelCache:(unsigned __int8)a3[16] address:(unint64_t)a4 size:(unint64_t)a5;
- (void)setKernelImages:(id)a3;
- (void)setKernelTextExecImages:(id)a3;
- (void)setRootedCacheLibs:(dyld_uuid_info_64 *)a3 count:(unsigned int)a4;
- (void)targetSharedCache:(unsigned __int8)a3[16] withSlide:(unint64_t)a4 atBaseAddress:(unint64_t)a5;
@end

@implementation OSABinaryImageCatalog

- (OSABinaryImageCatalog)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)OSABinaryImageCatalog;
  v2 = [(OSABinaryImageCatalog *)&v16 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    used_segments = v2->_used_segments;
    v2->_used_segments = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    kernel_segments = v2->_kernel_segments;
    v2->_kernel_segments = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    kernel_text_exec_segments = v2->_kernel_text_exec_segments;
    v2->_kernel_text_exec_segments = v7;

    uint64_t v9 = objc_opt_new();
    shared_segments = v2->_shared_segments;
    v2->_shared_segments = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v11;

    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    v13 = [[OSABinaryImageSegment alloc] initWithAddress:0 size:0 for:uu];
    absolute_segment = v2->_absolute_segment;
    v2->_absolute_segment = v13;

    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_118);
    }
  }
  return v2;
}

uint64_t __29__OSABinaryImageCatalog_init__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ReportCrash.stackshot.sharedCacheLoader", 0);
  v1 = (void *)_sharedCacheLoaderQueue;
  _sharedCacheLoaderQueue = (uint64_t)v0;

  _shared_caches = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

- (void)setKernelImages:(id)a3
{
}

- (void)setKernelTextExecImages:(id)a3
{
}

- (void)setKernelCache:(unsigned __int8)a3[16] address:(unint64_t)a4 size:(unint64_t)a5
{
  self->_kernel_cache_segment = [[OSABinaryImageSegment alloc] initWithAddress:a4 size:0x40000000 for:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setRootedCacheLibs:(dyld_uuid_info_64 *)a3 count:(unsigned int)a4
{
  LODWORD(v4) = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  rootedCacheLibs = self->_rootedCacheLibs;
  self->_rootedCacheLibs = v7;

  if (v4)
  {
    uint64_t v4 = v4;
    imageUUID = a3->imageUUID;
    do
    {
      if (!uuid_is_null(imageUUID)) {
        [(NSMutableArray *)self->_rootedCacheLibs addImage:imageUUID address:*((void *)imageUUID - 1) size:0];
      }
      imageUUID += 24;
      --v4;
    }
    while (v4);
  }
  v10 = self->_rootedCacheLibs;
  [(NSMutableArray *)v10 sortByAddressAndSetInferredSizes];
}

- (unint64_t)markImageAsUsed:(id)a3 from:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([v6 source])
  {
    unint64_t v7 = objc_msgSend(v6, "used_index");
  }
  else
  {
    [v6 setSource:v4];
    unint64_t v7 = [(NSMutableArray *)self->_used_segments count];
    objc_msgSend(v6, "setUsed_index:", v7);
    [(NSMutableArray *)self->_used_segments addObject:v6];
  }

  return v7;
}

- (void)targetSharedCache:(unsigned __int8)a3[16] withSlide:(unint64_t)a4 atBaseAddress:(unint64_t)a5
{
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
  v10 = [(NSMutableDictionary *)self->_shared_segments objectForKeyedSubscript:v9];
  targeted_cache = self->_targeted_cache;
  self->_targeted_cache = v10;

  self->_targeted_slide = a4;
  if (!self->_targeted_cache)
  {
    v12 = _sharedCacheLoaderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__OSABinaryImageCatalog_targetSharedCache_withSlide_atBaseAddress___block_invoke;
    block[3] = &unk_1E5D20260;
    unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = a3;
    unint64_t v17 = a5;
    unint64_t v18 = a4;
    id v14 = v9;
    v15 = self;
    dispatch_sync(v12, block);
  }
}

void __67__OSABinaryImageCatalog_targetSharedCache_withSlide_atBaseAddress___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_shared_caches objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v2)
  {
    if (!uuid_is_null(*(const unsigned __int8 **)(a1 + 48)))
    {
      uint64_t v9 = [[OSASymbolInfo alloc] initWithSharedCache:*(void *)(a1 + 48) atBaseAddress:*(void *)(a1 + 56) - *(void *)(a1 + 64)];
      if (v9)
      {
        v15 = v9;
        [(id)_shared_caches setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];
        uint64_t v2 = (uint64_t)v15;
        goto LABEL_2;
      }
      v10 = *(void **)(*(void *)(a1 + 40) + 80);
      uint64_t v11 = NSString;
      v12 = [*(id *)(a1 + 32) UUIDString];
      v13 = [v11 stringWithFormat:@"unable to instantiate shared cache %@", v12];
      [v10 addObject:v13];
    }
    id v14 = 0;
    goto LABEL_6;
  }
LABEL_2:
  id v14 = (id)v2;
  v3 = [MEMORY[0x1E4F1CA98] null];
  char v4 = [v14 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    v5 = [[OSABinaryImageSegment alloc] initWithSymbol:v14];
    uint64_t v6 = *(void *)(a1 + 40);
    unint64_t v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;

    [*(id *)(*(void *)(a1 + 40) + 64) setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
    goto LABEL_7;
  }
LABEL_6:
  v8 = [MEMORY[0x1E4F1CA98] null];
  [*(id *)(*(void *)(a1 + 40) + 64) setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];

LABEL_7:
}

- (BOOL)isAddressInTargetedCache:(unint64_t)a3
{
  unint64_t targeted_slide = self->_targeted_slide;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v6 = a3 - targeted_slide;
  unint64_t v7 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
  if (v6 >= [v7 start])
  {
    uint64_t v9 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
    uint64_t v10 = [v9 start];
    uint64_t v11 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
    BOOL v8 = v6 < [v11 size] + v10;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)appendNotesTo:(id)a3
{
}

- (id)searchFrame:(unint64_t)a3 in:(id)a4 result:(id *)a5
{
  return [(OSABinaryImageCatalog *)self searchFrame:a3 in:a4 regions:0 result:a5];
}

- (id)searchFrame:(unint64_t)a3 in:(id)a4 regions:(id)a5 result:(id *)a6
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__6;
  v64 = __Block_byref_object_dispose__6;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = (id *)&v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__6;
  v58 = __Block_byref_object_dispose__6;
  id v59 = 0;
  kernel_cache_segment = self->_kernel_cache_segment;
  if (kernel_cache_segment)
  {
    v13 = [(OSABinaryImageSegment *)kernel_cache_segment symbolInfo];
    BOOL v14 = [v13 start] > a3;

    if (!v14)
    {
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_kernel_cache_segment, 85));
      v68[0] = v15;
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = NSNumber;
      unint64_t v17 = [(OSABinaryImageSegment *)self->_kernel_cache_segment symbolInfo];
      unint64_t v18 = objc_msgSend(v16, "numberWithUnsignedLongLong:", a3 - objc_msgSend(v17, "start"));
      v68[1] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      uint64_t v20 = [v19 copy];
      v21 = (void *)v61[5];
      v61[5] = v20;

      objc_storeStrong(v55 + 5, self->_kernel_cache_segment);
    }
  }
  v22 = (void *)v61[5];
  if (!v22)
  {
    v23 = self->_kernel_segments;
    if ([(NSMutableArray *)self->_kernel_text_exec_segments count])
    {
      v24 = self->_kernel_text_exec_segments;

      int v25 = 84;
      v23 = v24;
    }
    else
    {
      int v25 = 75;
    }
    uint64_t v26 = [(NSMutableArray *)v23 count];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke;
    v52[3] = &unk_1E5D20288;
    v52[4] = self;
    v52[5] = &v60;
    int v53 = v25;
    v52[6] = &v54;
    v52[7] = a3;
    -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v23, "indexOfObject:inSortedRange:options:usingComparator:", &unk_1EFE25808, 0, v26, 256, v52);
    if (v61[5]) {
      goto LABEL_21;
    }
    unint64_t v27 = a3 - self->_targeted_slide;
    if ([(NSMutableArray *)self->_rootedCacheLibs count])
    {
      rootedCacheLibs = self->_rootedCacheLibs;
      uint64_t v29 = [(NSMutableArray *)rootedCacheLibs count];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_2;
      v51[3] = &unk_1E5D202B0;
      v51[4] = self;
      v51[5] = &v60;
      v51[6] = &v54;
      v51[7] = v27;
      -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](rootedCacheLibs, "indexOfObject:inSortedRange:options:usingComparator:", &unk_1EFE25808, 0, v29, 256, v51);
    }
    if (v61[5]) {
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
      if (v27 < [v30 start])
      {
LABEL_16:

        goto LABEL_17;
      }
      v31 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
      uint64_t v48 = [v31 start];
      v32 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
      LODWORD(v48) = v27 < [v32 size] + v48;

      if (v48)
      {
        v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_targeted_cache, 83));
        v67[0] = v33;
        v34 = NSNumber;
        v35 = [(OSABinaryImageSegment *)self->_targeted_cache symbolInfo];
        v36 = objc_msgSend(v34, "numberWithUnsignedLongLong:", v27 - objc_msgSend(v35, "start"));
        v67[1] = v36;
        v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
        uint64_t v38 = [v37 copy];
        v39 = (void *)v61[5];
        v61[5] = v38;

        v40 = v55;
        v41 = self->_targeted_cache;
        id v30 = v40[5];
        v40[5] = v41;
        goto LABEL_16;
      }
    }
LABEL_17:
    if (!v61[5])
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_3;
      v50[3] = &unk_1E5D202D8;
      v50[4] = self;
      v50[5] = &v60;
      v50[6] = &v54;
      v50[7] = a3;
      [v10 indexOfObjectPassingTest:v50];
      if (!v61[5])
      {
        v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_absolute_segment, 65));
        v66[0] = v42;
        v43 = [NSNumber numberWithUnsignedLongLong:a3];
        v66[1] = v43;
        uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
        v45 = (void *)v61[5];
        v61[5] = v44;

        if (v11)
        {
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_4;
          v49[3] = &unk_1E5D20300;
          v49[4] = &v54;
          v49[5] = a3;
          [v11 indexOfObjectPassingTest:v49];
        }
      }
    }
LABEL_21:
    if (a6) {
      *a6 = v55[5];
    }

    v22 = (void *)v61[5];
  }
  id v46 = v22;
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  return v46;
}

uint64_t __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  id v8 = v7;
  unint64_t v9 = *(void *)(a1 + 56);
  id v10 = [v8 symbolInfo];
  if (v9 >= [v10 start])
  {
    unint64_t v11 = *(void *)(a1 + 56);
    v12 = [v8 symbolInfo];
    uint64_t v13 = [v12 start];
    BOOL v14 = [v8 symbolInfo];
    unint64_t v15 = [v14 size] + v13;

    if (v11 < v15)
    {
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v8, *(unsigned int *)(a1 + 64)));
      v29[0] = v16;
      unint64_t v17 = NSNumber;
      uint64_t v18 = *(void *)(a1 + 56);
      v19 = [v8 symbolInfo];
      uint64_t v20 = objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 - objc_msgSend(v19, "start"));
      v29[1] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      uint64_t v22 = [v21 copy];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
    }
  }
  else
  {
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v26 = [v8 symbolInfo];
    if ((isKindOfClass ^ ((unint64_t)[v26 start] >= *(void *)(a1 + 56)))) {
      uint64_t v25 = -1;
    }
    else {
      uint64_t v25 = 1;
    }
  }
  return v25;
}

uint64_t __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  id v8 = v7;
  unint64_t v9 = *(void *)(a1 + 56);
  id v10 = [v8 symbolInfo];
  if (v9 >= [v10 start])
  {
    unint64_t v11 = *(void *)(a1 + 56);
    v12 = [v8 symbolInfo];
    uint64_t v13 = [v12 start];
    BOOL v14 = [v8 symbolInfo];
    unint64_t v15 = [v14 size] + v13;

    if (v11 < v15)
    {
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v8, 67));
      v29[0] = v16;
      unint64_t v17 = NSNumber;
      uint64_t v18 = *(void *)(a1 + 56);
      v19 = [v8 symbolInfo];
      uint64_t v20 = objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 - objc_msgSend(v19, "start"));
      v29[1] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      uint64_t v22 = [v21 copy];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
    }
  }
  else
  {
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v26 = [v8 symbolInfo];
    if ((isKindOfClass ^ ((unint64_t)[v26 start] >= *(void *)(a1 + 56)))) {
      uint64_t v25 = -1;
    }
    else {
      uint64_t v25 = 1;
    }
  }
  return v25;
}

BOOL __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  unint64_t v8 = *(void *)(a1 + 56);
  unint64_t v9 = [v7 symbolInfo];
  if (v8 >= [v9 start])
  {
    unint64_t v10 = *(void *)(a1 + 56);
    unint64_t v11 = [v7 symbolInfo];
    uint64_t v12 = [v11 start];
    uint64_t v13 = [v7 symbolInfo];
    unint64_t v14 = [v13 size] + v12;

    if (v10 < v14)
    {
      unint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v7, 80));
      v26[0] = v15;
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = NSNumber;
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = [v7 symbolInfo];
      v19 = objc_msgSend(v16, "numberWithUnsignedLongLong:", v17 - objc_msgSend(v18, "start"));
      v26[1] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      uint64_t v21 = [v20 copy];
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
  }
  BOOL v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;

  return v24;
}

BOOL __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  unint64_t v8 = *(void *)(a1 + 40);
  unint64_t v9 = [v7 symbolInfo];
  if (v8 >= [v9 start])
  {
    unint64_t v10 = *(void *)(a1 + 40);
    unint64_t v11 = [v7 symbolInfo];
    uint64_t v12 = [v11 start];
    uint64_t v13 = [v7 symbolInfo];
    unint64_t v14 = [v13 size] + v12;

    if (v10 < v14)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
  }
  BOOL v15 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;

  return v15;
}

- (id)reportUsedImages
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_used_segments, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = self->_used_segments;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "details", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)reportUsedImagesFullInfoUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void *))a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_used_segments, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_used_segments;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "full_details", (void)v13);
        if (v4) {
          v4[2](v4, v11);
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)isApplePath:(id)a3 orBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPrefix:@"/System"] & 1) != 0
    || ([v5 hasPrefix:@"/usr/lib"] & 1) != 0
    || ([v5 hasPrefix:@"/usr/bin"] & 1) != 0
    || ([v5 hasPrefix:@"/usr/sbin"] & 1) != 0
    || ([v5 hasPrefix:@"/bin"] & 1) != 0
    || ([v5 hasPrefix:@"/sbin"] & 1) != 0
    || ([v6 hasPrefix:@"com.apple."] & 1) != 0
    || ([v6 hasPrefix:@"commpage"] & 1) != 0
    || ([v6 isEqualToString:@"Ozone"] & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [v6 isEqualToString:@"Motion"];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_used_segments, 0);
  objc_storeStrong((id *)&self->_shared_segments, 0);
  objc_storeStrong((id *)&self->_targeted_cache, 0);
  objc_storeStrong((id *)&self->_rootedCacheLibs, 0);
  objc_storeStrong((id *)&self->_kernel_text_exec_segments, 0);
  objc_storeStrong((id *)&self->_kernel_segments, 0);
  objc_storeStrong((id *)&self->_kernel_cache_segment, 0);
  objc_storeStrong((id *)&self->_absolute_segment, 0);
}

@end