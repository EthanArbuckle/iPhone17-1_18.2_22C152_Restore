@interface NTKTimelineUpdateEndDateOperation
- (id)handler;
- (void)_cancel;
- (void)_getEndDate;
- (void)_invokeHandler;
- (void)setHandler:(id)a3;
@end

@implementation NTKTimelineUpdateEndDateOperation

- (void)_getEndDate
{
  if (![(NTKTimelineDataOperation *)self canceled])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__NTKTimelineUpdateEndDateOperation__getEndDate__block_invoke;
    aBlock[3] = &unk_1E62C10F8;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    localDataSource = self->super._localDataSource;
    if (localDataSource) {
      [(CLKCComplicationDataSource *)localDataSource getTimelineEndDateWithHandler:v3];
    }
    else {
      [(CLKComplicationDataSource *)self->super._remoteDataSource getTimelineEndDateForComplication:self->super._remoteComplication withHandler:v3];
    }
  }
}

void __48__NTKTimelineUpdateEndDateOperation__getEndDate__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _invokeHandler];
}

- (void)_cancel
{
}

- (void)_invokeHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKTimelineUpdateEndDateOperation__invokeHandler__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__NTKTimelineUpdateEndDateOperation__invokeHandler__block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end