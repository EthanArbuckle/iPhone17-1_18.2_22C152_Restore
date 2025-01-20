@interface SBHIconImageCacheRequest
+ (void)performWithDependentRequestLockUsingBlock:(id)a3;
- (NSString)description;
- (SBHIconImageCacheRequest)init;
- (__CFString)variantDescription;
- (double)elapsedTime;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithIcon:(void *)a3 imageAppearance:(void *)a4 priority:(void *)a5 reason:(void *)a6 imageGeneration:(void *)a7 variant:(void *)a8 options:(void *)a9 sharedCancellation:(void *)a10 iconImageCache:(void *)a11 completionHandler:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)isCancelled;
- (uint64_t)matchesIcon:(uint64_t)result;
- (void)addDependentRequest:(uint64_t)a1;
- (void)callCompletionHandlers;
- (void)cancel;
@end

@implementation SBHIconImageCacheRequest

- (id)initWithIcon:(void *)a3 imageAppearance:(void *)a4 priority:(void *)a5 reason:(void *)a6 imageGeneration:(void *)a7 variant:(void *)a8 options:(void *)a9 sharedCancellation:(void *)a10 iconImageCache:(void *)a11 completionHandler:
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a5;
  id v39 = a9;
  id v20 = a10;
  id v21 = a11;
  if (a1)
  {
    v40.receiver = a1;
    v40.super_class = (Class)SBHIconImageCacheRequest;
    v22 = (id *)objc_msgSendSuper2(&v40, sel_init);
    a1 = v22;
    if (v22)
    {
      objc_storeStrong(v22 + 5, a2);
      id v23 = objc_alloc_init(MEMORY[0x1E4F29128]);
      id v24 = a1[4];
      a1[4] = v23;

      objc_storeStrong(a1 + 6, a9);
      v25 = objc_alloc_init(SBHIconImageCacheCancellation);
      id v26 = a1[7];
      a1[7] = v25;

      uint64_t v27 = [v18 copy];
      id v28 = a1[8];
      a1[8] = (id)v27;

      a1[10] = a4;
      uint64_t v29 = [v19 copy];
      id v30 = a1[11];
      a1[11] = (id)v29;

      a1[9] = a6;
      a1[12] = a8;
      a1[13] = a7;
      objc_storeWeak(a1 + 21, v20);
      uint64_t v31 = [v21 copy];
      id v32 = a1[15];
      a1[15] = (id)v31;

      v33 = [v17 iconImageCacheIdentifier];
      v34 = [[SBHIconImageIdentity alloc] initWithIconIdentifier:v33 imageGeneration:a6 imageAppearance:v18];
      id v35 = a1[14];
      a1[14] = v34;

      a1[16] = (id)mach_continuous_time();
    }
  }

  return a1;
}

- (uint64_t)isCancelled
{
  if (!a1) {
    return 0;
  }
  id v2 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  if ([v3 isCancelled]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v2 isCancelled];
  }

  return v4;
}

- (void)addDependentRequest:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 25))
    {
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __48__SBHIconImageCacheRequest_addDependentRequest___block_invoke;
      v12 = &unk_1E6AAC810;
      id v13 = v3;
      BSDispatchMain();
      v6 = v13;
    }
    else
    {
      v5 = objc_opt_class();
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __48__SBHIconImageCacheRequest_addDependentRequest___block_invoke_2;
      v7[3] = &unk_1E6AACA90;
      v7[4] = a1;
      id v8 = v4;
      [v5 performWithDependentRequestLockUsingBlock:v7];
      v6 = v8;
    }
  }
}

- (__CFString)variantDescription
{
  if (a1)
  {
    uint64_t info = a1[3].info;
    id v3 = @"ummasked";
    if (info != 1) {
      id v3 = 0;
    }
    if (info) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = @"masked";
    }
    a1 = v4;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)callCompletionHandlers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 88);
  id v8 = [a2 uniqueIdentifier];
  int v9 = 138543874;
  id v10 = v6;
  __int16 v11 = 2114;
  id v12 = v7;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_DEBUG, "Calling completion handlers for request %{public}@, reason %{public}@, icon %@", (uint8_t *)&v9, 0x20u);
}

- (uint64_t)matchesIcon:(uint64_t)result
{
  if (result) {
    return BSEqualObjects();
  }
  return result;
}

- (SBHIconImageCacheRequest)init
{
  id v3 = +[SBHIconImageAppearance defaultAppearance];
  uint64_t v4 = (SBHIconImageCacheRequest *)-[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:variant:options:sharedCancellation:iconImageCache:completionHandler:]((id *)&self->super.isa, 0, v3, (void *)2, 0, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (void)performWithDependentRequestLockUsingBlock:(id)a3
{
  id v3 = (void (**)(void))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&performWithDependentRequestLockUsingBlock__lock);
  v3[2](v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&performWithDependentRequestLockUsingBlock__lock);
}

- (double)elapsedTime
{
  if (!a1) {
    return 0.0;
  }
  if (!*(void *)(a1 + 8)) {
    mach_continuous_time();
  }
  BSTimeDifferenceFromMachTimeToMachTime();
  return result;
}

void __50__SBHIconImageCacheRequest_callCompletionHandlers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0;
}

void __48__SBHIconImageCacheRequest_addDependentRequest___block_invoke(uint64_t a1)
{
}

uint64_t __48__SBHIconImageCacheRequest_addDependentRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)cancel
{
  if (self) {
    self = (SBHIconImageCacheRequest *)self->_cancellation;
  }
  [(SBHIconImageCacheRequest *)self cancel];
}

- (NSString)description
{
  return (NSString *)[(SBHIconImageCacheRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBHIconImageCacheRequest *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHIconImageCacheRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  if (self)
  {
    unint64_t status = self->_status;
    uint64_t v6 = [(SBHIconImageCacheRequest *)self succinctDescriptionBuilder];
    identifier = self->_identifier;
  }
  else
  {
    uint64_t v6 = [0 succinctDescriptionBuilder];
    unint64_t status = 0;
    identifier = 0;
  }
  id v8 = (id)[v6 appendObject:identifier withName:@"identifier"];
  if (self)
  {
    id v9 = (id)[v6 appendObject:self->_icon withName:@"identifier"];
    imageAppearance = self->_imageAppearance;
  }
  else
  {
    id v27 = (id)[v6 appendObject:0 withName:@"identifier"];
    imageAppearance = 0;
  }
  id v11 = (id)[v6 appendObject:imageAppearance withName:@"imageAppearance"];
  if (!self)
  {
    id v28 = (id)[v6 appendObject:@"background" withName:@"priority"];
    id v29 = (id)[v6 appendObject:0 withName:@"reason"];
    id v30 = (id)[v6 appendUnsignedInteger:0 withName:@"imageGeneration"];
LABEL_13:
    id v18 = @"masked";
    goto LABEL_14;
  }
  unint64_t priority = self->_priority;
  if (priority > 4) {
    __int16 v13 = 0;
  }
  else {
    __int16 v13 = off_1E6AACB70[priority];
  }
  id v14 = (id)[v6 appendObject:v13 withName:@"priority"];
  id v15 = (id)[v6 appendObject:self->_reason withName:@"reason"];
  id v16 = (id)[v6 appendUnsignedInteger:self->_imageGeneration withName:@"imageGeneration"];
  int64_t variant = self->_variant;
  if (variant == 1) {
    id v18 = @"ummasked";
  }
  else {
    id v18 = 0;
  }
  if (!variant) {
    goto LABEL_13;
  }
LABEL_14:
  id v19 = (id)[v6 appendObject:v18 withName:@"variant"];
  if (status > 4) {
    id v20 = 0;
  }
  else {
    id v20 = off_1E6AACB98[status];
  }
  [v6 appendString:v20 withName:@"status"];
  id v21 = (id)[v6 appendBool:-[SBHIconImageCacheRequest isCancelled]((uint64_t)self) withName:@"isCancelled" ifEqualTo:1];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_blockingRequest);
  }
  else {
    id WeakRetained = 0;
  }
  id v23 = (id)[v6 appendObject:WeakRetained withName:@"blockingRequest" skipIfNil:1];

  if (status == 4 || status == 2)
  {
    if (self)
    {
      unint64_t v24 = self->_result;
      if (v24 > 3) {
        v25 = 0;
      }
      else {
        v25 = off_1E6AACBC0[v24];
      }
    }
    else
    {
      v25 = @"cancelled";
    }
    [v6 appendString:v25 withName:@"result"];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_destroyWeak((id *)&self->_blockingRequest);
  objc_storeStrong((id *)&self->_fetchedImage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_imageIdentity, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_cancellation, 0);
  objc_storeStrong((id *)&self->_sharedCancellation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dependentRequests, 0);
}

@end