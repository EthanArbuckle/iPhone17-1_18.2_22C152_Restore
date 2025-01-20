@interface SUUIURLConnectionRequest
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation SUUIURLConnectionRequest

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  dispatch_async(v5, &__block_literal_global_47);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2;
  v9[3] = &unk_265407040;
  v10 = v5;
  id v11 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SUUIURLConnectionRequest;
  id v6 = v4;
  v7 = v5;
  [(SSURLConnectionRequest *)&v8 startWithConnectionResponseBlock:v9];
}

void __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F7BCD8] object:0];
}

void __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_2);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F7BCE0] object:0];
}

@end