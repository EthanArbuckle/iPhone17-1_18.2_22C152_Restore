@interface NTKTimelineExtendDataOperation
- (id)handler;
- (void)_cancel;
- (void)_extendRight;
- (void)_invokeHandlerWithEntries:(id)a3;
- (void)setExtendsRightFromDate:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation NTKTimelineExtendDataOperation

- (void)setExtendsRightFromDate:(id)a3
{
}

- (void)_cancel
{
  id handler = self->_handler;
  self->_id handler = 0;
}

- (void)_invokeHandlerWithEntries:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__NTKTimelineExtendDataOperation__invokeHandlerWithEntries___block_invoke;
  v6[3] = &unk_1E62C09C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __60__NTKTimelineExtendDataOperation__invokeHandlerWithEntries___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 48))
  {
    uint64_t result = [(id)result canceled];
    if ((result & 1) == 0)
    {
      v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16);
      return v3();
    }
  }
  return result;
}

- (void)_extendRight
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__NTKTimelineExtendDataOperation__extendRight__block_invoke;
  aBlock[3] = &unk_1E62C11C0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  localDataSource = self->super._localDataSource;
  if (localDataSource)
  {
    [(CLKCComplicationDataSource *)localDataSource getTimelineEntriesAfterDate:self->_boundaryDate limit:100 withHandler:v3];
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    id v18 = 0;
    id v5 = [[NTKTimelineRemoteDataSourceProvider alloc] initWithDataSource:self->super._remoteDataSource];
    v6 = (void *)v14[5];
    v14[5] = (uint64_t)v5;

    id v7 = (void *)v14[5];
    remoteComplication = self->super._remoteComplication;
    boundaryDate = self->_boundaryDate;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__NTKTimelineExtendDataOperation__extendRight__block_invoke_2;
    v10[3] = &unk_1E62C11E8;
    id v11 = v3;
    v12 = &v13;
    [v7 getEntriesForComplication:remoteComplication afterDate:boundaryDate limit:100 completion:v10];

    _Block_object_dispose(&v13, 8);
  }
}

void __46__NTKTimelineExtendDataOperation__extendRight__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _finalizedValidEntries:a2];
  [v2 _invokeHandlerWithEntries:v3];
}

void __46__NTKTimelineExtendDataOperation__extendRight__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_boundaryDate, 0);
}

@end