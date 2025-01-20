@interface PIFaceObservationCache
+ (id)faceRequestWithRequest:(id)a3;
- (PIFaceObservationCache)init;
- (id)submitSynchronous:(id)a3 error:(id *)a4;
- (void)submit:(id)a3 response:(id)a4;
@end

@implementation PIFaceObservationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (id)submitSynchronous:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self->_result;
  if (!v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PIFaceObservationCache_submitSynchronous_error___block_invoke;
    block[3] = &unk_1E5D7EFD0;
    block[4] = self;
    id v12 = v6;
    v13 = a4;
    dispatch_sync(queue, block);

    v7 = self->_result;
  }
  v9 = v7;

  return v9;
}

intptr_t __50__PIFaceObservationCache_submitSynchronous_error___block_invoke(uint64_t a1)
{
  intptr_t result = dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) submitGenericSynchronous:*(void *)(a1 + 48)];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)submit:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (self->_result)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:self->_result];
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PIFaceObservationCache_submit_response___block_invoke;
    block[3] = &unk_1E5D80CC8;
    block[4] = self;
    id v13 = v7;
    id v12 = v6;
    dispatch_async(queue, block);
  }
}

void __42__PIFaceObservationCache_submit_response___block_invoke(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24))
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:*(void *)(*(void *)(a1 + 32) + 24)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(v2 + 8));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__PIFaceObservationCache_submit_response___block_invoke_2;
    v5[3] = &unk_1E5D81798;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    [v3 submit:v5];
  }
}

void __42__PIFaceObservationCache_submit_response___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = 0;
  id v3 = a2;
  id v4 = [v3 result:&v7];
  id v5 = v7;
  id v6 = v5;
  if (v4 && !v5) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PIFaceObservationCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)PIFaceObservationCache;
  uint64_t v2 = [(PIFaceObservationCache *)&v9 init];
  dispatch_group_t v3 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v3;

  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("PIFaceObservationCache", v5);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v6;

  return v2;
}

+ (id)faceRequestWithRequest:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  dispatch_group_t v3 = (objc_class *)MEMORY[0x1E4F7A440];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithRequest:v4];

  dispatch_queue_t v6 = +[PIPipelineFilters sourceFilterNoOrientation];
  id v7 = +[PIPipelineFilters applyOrientationFilter];
  [v5 setName:@"PIFaceObservationCache-newRequest"];
  v11[0] = v6;
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v5 setPipelineFilters:v8];

  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:762048];
  [v5 setScalePolicy:v9];

  [v5 setSampleMode:3];
  return v5;
}

@end