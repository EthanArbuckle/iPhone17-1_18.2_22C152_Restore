@interface SKUIURLConnectionRequest
- (void)startWithConnectionResponseBlock:(id)a3;
@end

@implementation SKUIURLConnectionRequest

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIURLConnectionRequest startWithConnectionResponseBlock:]();
  }
  v5 = dispatch_get_global_queue(0, 0);
  dispatch_async(v5, &__block_literal_global_69);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2;
  v9[3] = &unk_1E642AF30;
  v10 = v5;
  id v11 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SKUIURLConnectionRequest;
  id v6 = v4;
  v7 = v5;
  [(SSURLConnectionRequest *)&v8 startWithConnectionResponseBlock:v9];
}

void __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4FA8970] object:0];
}

void __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_5_0);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4FA8978] object:0];
}

- (void)startWithConnectionResponseBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIURLConnectionRequest startWithConnectionResponseBlock:]";
}

@end