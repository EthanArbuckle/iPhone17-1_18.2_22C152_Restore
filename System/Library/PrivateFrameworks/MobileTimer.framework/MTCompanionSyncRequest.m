@interface MTCompanionSyncRequest
+ (MTCompanionSyncRequest)requestWithType:(unint64_t)a3;
- (BOOL)completed;
- (MTCompanionSyncRequest)initWithRequestType:(unint64_t)a3;
- (NAScheduler)serializer;
- (NSError)error;
- (NSMutableArray)completionBlocks;
- (NSString)description;
- (id)requestDescription;
- (unint64_t)requestType;
- (void)addCompletionBlock:(id)a3;
- (void)complete:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setSerializer:(id)a3;
@end

@implementation MTCompanionSyncRequest

+ (MTCompanionSyncRequest)requestWithType:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithRequestType:a3];
  return (MTCompanionSyncRequest *)v3;
}

- (MTCompanionSyncRequest)initWithRequestType:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MTCompanionSyncRequest;
  v4 = [(MTCompanionSyncRequest *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_requestType = a3;
    uint64_t v6 = objc_opt_new();
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = (NSMutableArray *)v6;

    uint64_t v8 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTCompanionSyncRequest.serialqueue", +[MTScheduler defaultPriority]);
    serializer = v5->_serializer;
    v5->_serializer = (NAScheduler *)v8;
  }
  return v5;
}

- (void)complete:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MTCompanionSyncRequest_complete___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

void __35__MTCompanionSyncRequest_complete___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35__MTCompanionSyncRequest_complete___block_invoke_2;
    v5[3] = &unk_1E59182C0;
    id v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "na_each:", v5);
    id v4 = *(void **)(a1 + 40);
    if (!v4)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
      id v4 = *(void **)(a1 + 40);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v4);
  }
}

uint64_t __35__MTCompanionSyncRequest_complete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    serializer = self->_serializer;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MTCompanionSyncRequest_addCompletionBlock___block_invoke;
    v7[3] = &unk_1E59150D0;
    v7[4] = self;
    id v8 = v4;
    [(NAScheduler *)serializer performBlock:v7];
  }
}

void __45__MTCompanionSyncRequest_addCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8)
    || (v3 = *(void **)(v2 + 32),
        id v4 = (void *)MEMORY[0x19F3A0FB0](*(void *)(a1 + 40)),
        [v3 addObject:v4],
        v4,
        uint64_t v5 = *(void *)(a1 + 32),
        *(unsigned char *)(v5 + 8))
    || *(void *)(v5 + 24))
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MTCompanionSyncRequest *)self requestDescription];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@ >", v4, self, v5];

  return (NSString *)v6;
}

- (id)requestDescription
{
  return @"DELTA";
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end