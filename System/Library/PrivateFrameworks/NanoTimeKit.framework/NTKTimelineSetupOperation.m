@interface NTKTimelineSetupOperation
- (id)handler;
- (void)_cancel;
- (void)_getAlwaysOnTemplate;
- (void)_getCurrentEntry;
- (void)_getEndDate;
- (void)_getPrivacyBehavior;
- (void)_getTimelineAnimationBehavior;
- (void)_invokeHandler;
- (void)setHandler:(id)a3;
@end

@implementation NTKTimelineSetupOperation

- (void)_cancel
{
}

- (void)_getEndDate
{
  if (![(NTKTimelineDataOperation *)self canceled])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__NTKTimelineSetupOperation__getEndDate__block_invoke;
    aBlock[3] = &unk_1E62C10F8;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__NTKTimelineSetupOperation__getEndDate__block_invoke_2;
    v6[3] = &unk_1E62C10F8;
    v6[4] = self;
    v4 = _Block_copy(v6);
    localDataSource = self->super._localDataSource;
    if (localDataSource) {
      [(CLKCComplicationDataSource *)localDataSource getTimelineEndDateWithHandler:v3];
    }
    else {
      [(CLKComplicationDataSource *)self->super._remoteDataSource getTimelineEndDateForComplication:self->super._remoteComplication withHandler:v4];
    }
  }
}

void __40__NTKTimelineSetupOperation__getEndDate__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _getCurrentEntry];
}

void __40__NTKTimelineSetupOperation__getEndDate__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _getPrivacyBehavior];
}

- (void)_getPrivacyBehavior
{
  if (![(NTKTimelineDataOperation *)self canceled])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__NTKTimelineSetupOperation__getPrivacyBehavior__block_invoke;
    aBlock[3] = &unk_1E62C1120;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    [(CLKComplicationDataSource *)self->super._remoteDataSource getPrivacyBehaviorForComplication:self->super._remoteComplication withHandler:v3];
  }
}

uint64_t __48__NTKTimelineSetupOperation__getPrivacyBehavior__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 48) = a2;
  return [*(id *)(a1 + 32) _getTimelineAnimationBehavior];
}

- (void)_getTimelineAnimationBehavior
{
  if (![(NTKTimelineDataOperation *)self canceled])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NTKTimelineSetupOperation__getTimelineAnimationBehavior__block_invoke;
    aBlock[3] = &unk_1E62C1120;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    [(CLKComplicationDataSource *)self->super._remoteDataSource getTimelineAnimationBehaviorForComplication:self->super._remoteComplication withHandler:v3];
  }
}

uint64_t __58__NTKTimelineSetupOperation__getTimelineAnimationBehavior__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 56) = a2;
  return [*(id *)(a1 + 32) _getCurrentEntry];
}

- (void)_getCurrentEntry
{
  if (![(NTKTimelineDataOperation *)self canceled])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke;
    aBlock[3] = &unk_1E62C1148;
    aBlock[4] = self;
    v3 = _Block_copy(aBlock);
    localDataSource = self->super._localDataSource;
    if (localDataSource)
    {
      [(CLKCComplicationDataSource *)localDataSource getCurrentTimelineEntryWithHandler:v3];
    }
    else
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__2;
      v16 = __Block_byref_object_dispose__2;
      id v17 = 0;
      v5 = [[NTKTimelineRemoteDataSourceProvider alloc] initWithDataSource:self->super._remoteDataSource];
      v6 = (void *)v13[5];
      v13[5] = (uint64_t)v5;

      v7 = (void *)v13[5];
      remoteComplication = self->super._remoteComplication;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke_34;
      v9[3] = &unk_1E62C1170;
      id v10 = v3;
      v11 = &v12;
      [v7 getCurrentEntryForComplication:remoteComplication completion:v9];

      _Block_object_dispose(&v12, 8);
    }
  }
}

void __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = objc_msgSend(*(id *)(a1 + 32), "_validateEntry:");
  if (v3)
  {
    id v4 = [v5 finalizedCopy];
  }
  else
  {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v4);
  if (v3) {

  }
  [*(id *)(a1 + 32) _getAlwaysOnTemplate];
}

void __45__NTKTimelineSetupOperation__getCurrentEntry__block_invoke_34(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_getAlwaysOnTemplate
{
  if (![(NTKTimelineDataOperation *)self canceled])
  {
    int v3 = +[CLKRenderingContext sharedRenderingContext];
    id v4 = [v3 device];

    if ([v4 supportsTritium])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __49__NTKTimelineSetupOperation__getAlwaysOnTemplate__block_invoke;
      aBlock[3] = &unk_1E62C1198;
      aBlock[4] = self;
      id v5 = (void (**)(void *, void *))_Block_copy(aBlock);
      localDataSource = self->super._localDataSource;
      if (localDataSource)
      {
        v7 = [(CLKCComplicationDataSource *)localDataSource alwaysOnTemplate];
        v5[2](v5, v7);
      }
      else
      {
        [(CLKComplicationDataSource *)self->super._remoteDataSource getAlwaysOnTemplateForComplication:self->super._remoteComplication withHandler:v5];
      }
    }
    else
    {
      [(NTKTimelineSetupOperation *)self _invokeHandler];
    }
  }
}

void __49__NTKTimelineSetupOperation__getAlwaysOnTemplate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    int v3 = [*(id *)(a1 + 32) _validateTemplate:v5];
    if (v3)
    {
      id v4 = [v5 finalizedCopy];
    }
    else
    {
      id v4 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v4);
    if (v3) {
  }
    }
  [*(id *)(a1 + 32) _invokeHandler];
}

- (void)_invokeHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NTKTimelineSetupOperation__invokeHandler__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__NTKTimelineSetupOperation__invokeHandler__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 80))
  {
    uint64_t result = [(id)result canceled];
    if ((result & 1) == 0)
    {
      int v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16);
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
  objc_storeStrong((id *)&self->_alwaysOnTemplate, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end