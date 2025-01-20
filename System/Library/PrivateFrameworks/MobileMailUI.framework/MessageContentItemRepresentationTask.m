@interface MessageContentItemRepresentationTask
- (BOOL)hasBeenAccessedByInvokerWithID:(id)a3;
- (EFFuture)future;
- (EFLocked)invokerIDs;
- (EFPromise)contentRequestPromise;
- (EMContentItem)contentItem;
- (MessageContentItemRepresentationTask)initWithContentItem:(id)a3 type:(id)a4 networkUsage:(int64_t)a5;
- (NSProgress)contentRequestProgress;
- (NSProgress)topLevelProgress;
- (NSString)type;
- (int64_t)networkUsage;
- (void)addAccessedByInvokerWithID:(id)a3;
- (void)resume;
- (void)setContentItem:(id)a3;
- (void)setContentRequestProgress:(id)a3;
- (void)setContentRequestPromise:(id)a3;
- (void)setInvokerIDs:(id)a3;
- (void)setNetworkUsage:(int64_t)a3;
- (void)setTopLevelProgress:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MessageContentItemRepresentationTask

- (MessageContentItemRepresentationTask)initWithContentItem:(id)a3 type:(id)a4 networkUsage:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MessageContentItemRepresentationTask;
  v11 = [(MessageContentItemRepresentationTask *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a4);
    objc_storeStrong((id *)&v12->_contentItem, a3);
    v12->_networkUsage = a5;
    id v13 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v15 = [v13 initWithObject:v14];
    invokerIDs = v12->_invokerIDs;
    v12->_invokerIDs = (EFLocked *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    topLevelProgress = v12->_topLevelProgress;
    v12->_topLevelProgress = (NSProgress *)v17;

    uint64_t v19 = [MEMORY[0x1E4F60E18] promise];
    contentRequestPromise = v12->_contentRequestPromise;
    v12->_contentRequestPromise = (EFPromise *)v19;
  }
  return v12;
}

- (EFFuture)future
{
  v2 = [(MessageContentItemRepresentationTask *)self contentRequestPromise];
  v3 = [v2 future];

  return (EFFuture *)v3;
}

- (void)addAccessedByInvokerWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MessageContentItemRepresentationTask *)self invokerIDs];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__MessageContentItemRepresentationTask_addAccessedByInvokerWithID___block_invoke;
    v6[3] = &unk_1E6D1AA00;
    id v7 = v4;
    [v5 performWhileLocked:v6];
  }
}

uint64_t __67__MessageContentItemRepresentationTask_addAccessedByInvokerWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (BOOL)hasBeenAccessedByInvokerWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v5 = [(MessageContentItemRepresentationTask *)self invokerIDs];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__MessageContentItemRepresentationTask_hasBeenAccessedByInvokerWithID___block_invoke;
    v8[3] = &unk_1E6D1AA28;
    id v10 = &v11;
    id v9 = v4;
    [v5 performWhileLocked:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __71__MessageContentItemRepresentationTask_hasBeenAccessedByInvokerWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 containsObject:*(void *)(a1 + 32)];
}

- (void)resume
{
  id v3 = [(MessageContentItemRepresentationTask *)self contentRequestProgress];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1E4F60250];
    v5 = [(MessageContentItemRepresentationTask *)self type];
    objc_msgSend(v4, "optionsWithRequestedRepresentationType:networkUsage:", v5, -[MessageContentItemRepresentationTask networkUsage](self, "networkUsage"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v6 = [(MessageContentItemRepresentationTask *)self contentItem];
    id v7 = [(MessageContentItemRepresentationTask *)self contentRequestPromise];
    v8 = [v7 completionHandlerAdapter];
    id v9 = [v6 requestRepresentationWithOptions:v11 completionHandler:v8];

    if (v9)
    {
      [(MessageContentItemRepresentationTask *)self setContentRequestProgress:v9];
      id v10 = [(MessageContentItemRepresentationTask *)self topLevelProgress];
      [v10 addChild:v9 withPendingUnitCount:1];
    }
  }
}

- (int64_t)networkUsage
{
  return self->_networkUsage;
}

- (void)setNetworkUsage:(int64_t)a3
{
  self->_networkUsage = a3;
}

- (EMContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSProgress)topLevelProgress
{
  return self->_topLevelProgress;
}

- (void)setTopLevelProgress:(id)a3
{
}

- (EFPromise)contentRequestPromise
{
  return self->_contentRequestPromise;
}

- (void)setContentRequestPromise:(id)a3
{
}

- (NSProgress)contentRequestProgress
{
  return self->_contentRequestProgress;
}

- (void)setContentRequestProgress:(id)a3
{
}

- (EFLocked)invokerIDs
{
  return self->_invokerIDs;
}

- (void)setInvokerIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invokerIDs, 0);
  objc_storeStrong((id *)&self->_contentRequestProgress, 0);
  objc_storeStrong((id *)&self->_contentRequestPromise, 0);
  objc_storeStrong((id *)&self->_topLevelProgress, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end