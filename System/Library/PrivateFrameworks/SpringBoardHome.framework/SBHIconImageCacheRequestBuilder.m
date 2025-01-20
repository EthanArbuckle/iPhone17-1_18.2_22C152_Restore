@interface SBHIconImageCacheRequestBuilder
- (BOOL)isFinalized;
- (NSString)description;
- (id)finalizeRequestWithCompletionHandler:(id)a3;
- (id)initWithIconImageCache:(void *)a3 sharedCancellation:(void *)a4 reason:;
- (id)succinctDescription;
- (void)addIcon:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6;
- (void)addIcon:(id)a3 prioritizedImageAppearances:(id)a4 options:(unint64_t)a5;
- (void)addIcons:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6;
- (void)addIcons:(id)a3 prioritizedImageAppearances:(id)a4 options:(unint64_t)a5;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)setFinalized:(BOOL)a3;
@end

@implementation SBHIconImageCacheRequestBuilder

- (id)initWithIconImageCache:(void *)a3 sharedCancellation:(void *)a4 reason:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)SBHIconImageCacheRequestBuilder;
    v10 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 3, v7);
      objc_storeStrong(a1 + 4, a3);
      uint64_t v11 = [v9 copy];
      id v12 = a1[5];
      a1[5] = (id)v11;

      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v14 = a1[1];
      a1[1] = v13;

      dispatch_group_t v15 = dispatch_group_create();
      id v16 = a1[6];
      a1[6] = v15;
    }
  }

  return a1;
}

- (void)dealloc
{
  if (![(SBHIconImageCacheRequestBuilder *)self isFinalized]) {
    NSLog(&cfstr_RequestBuilder.isa);
  }
  v3.receiver = self;
  v3.super_class = (Class)SBHIconImageCacheRequestBuilder;
  [(SBHIconImageCacheRequestBuilder *)&v3 dealloc];
}

- (void)addIcon:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([(id)objc_opt_class() hasIconImage])
  {
    if (self)
    {
      id v12 = self->_reason;
      id v13 = self->_sharedCancellation;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
      completionGroup = self->_completionGroup;
    }
    else
    {
      id WeakRetained = 0;
      id v12 = 0;
      id v13 = 0;
      completionGroup = 0;
    }
    id v16 = completionGroup;
    v21 = (void *)[WeakRetained currentImageGenerationForIcon:v10];
    if ((a6 & 2) == 0)
    {
      dispatch_group_enter(v16);
      v20 = [SBHIconImageCacheRequest alloc];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke;
      v24[3] = &unk_1E6AACB50;
      v25 = v16;
      v17 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:variant:options:sharedCancellation:iconImageCache:completionHandler:]((id *)&v20->super.isa, v10, v11, (void *)a5, v12, v21, 0, (void *)a6, v13, WeakRetained, v24);
      [(NSMutableArray *)self->_requests addObject:v17];
    }
    if (a6)
    {
      dispatch_group_enter(v16);
      objc_super v18 = [SBHIconImageCacheRequest alloc];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke_2;
      v22[3] = &unk_1E6AACB50;
      v23 = v16;
      v19 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:variant:options:sharedCancellation:iconImageCache:completionHandler:]((id *)&v18->super.isa, v10, v11, (void *)a5, v12, v21, (void *)1, (void *)a6, v13, WeakRetained, v22);
      [(NSMutableArray *)self->_requests addObject:v19];
    }
  }
  else
  {
    id v12 = SBLogIconImageCache();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SBHIconImageCacheRequestBuilder addIcon:imageAppearance:priority:options:](v12);
    }
  }
}

void __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke(uint64_t a1)
{
}

void __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke_2(uint64_t a1)
{
}

- (void)addIcon:(id)a3 prioritizedImageAppearances:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__SBHIconImageCacheRequestBuilder_addIcon_prioritizedImageAppearances_options___block_invoke;
  v10[3] = &unk_1E6AAC910;
  v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a5;
  id v9 = v8;
  [a4 enumerateKeysAndObjectsUsingBlock:v10];
}

void __79__SBHIconImageCacheRequestBuilder_addIcon_prioritizedImageAppearances_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIcon:imageAppearance:priority:options:", *(void *)(a1 + 40), v5, objc_msgSend(a3, "integerValue"), *(void *)(a1 + 48));
}

- (void)addIcons:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v10);
        }
        [(SBHIconImageCacheRequestBuilder *)self addIcon:*(void *)(*((void *)&v16 + 1) + 8 * v15++) imageAppearance:v11 priority:a5 options:a6];
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)addIcons:(id)a3 prioritizedImageAppearances:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBHIconImageCacheRequestBuilder_addIcons_prioritizedImageAppearances_options___block_invoke;
  v10[3] = &unk_1E6AAC910;
  v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a5;
  id v9 = v8;
  [a4 enumerateKeysAndObjectsUsingBlock:v10];
}

void __80__SBHIconImageCacheRequestBuilder_addIcons_prioritizedImageAppearances_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIcons:imageAppearance:priority:options:", *(void *)(a1 + 40), v5, objc_msgSend(a3, "integerValue"), *(void *)(a1 + 48));
}

- (id)finalizeRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(SBHIconImageCacheRequestBuilder *)self setFinalized:1];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  }
  else {
    id WeakRetained = 0;
  }
  v6 = [WeakRetained finalizeRequestBuilder:self completionHandler:v4];

  return v6;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  objc_super v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBHIconImageCacheRequestBuilder_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __61__SBHIconImageCacheRequestBuilder_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 40);
  }
  else {
    uint64_t v4 = 0;
  }
  return (id)[v2 appendObject:v4 withName:@"reason"];
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_sharedCancellation, 0);
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)addIcon:(os_log_t)log imageAppearance:priority:options:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_DEBUG, "skipping icon from cache builder because it doesn't have an icon image", v1, 2u);
}

@end