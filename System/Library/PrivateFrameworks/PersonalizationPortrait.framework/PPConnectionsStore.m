@interface PPConnectionsStore
- (BOOL)iterRecentLocationDonationsSinceDate:(id)a3 client:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 client:(id)a6 error:(id *)a7 block:(id)a8;
- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 error:(id *)a8 block:(id)a9;
- (PPConnectionsStore)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPConnectionsStore

- (PPConnectionsStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPConnectionsStore;
  v2 = [(PPConnectionsStore *)&v6 init];
  if (v2)
  {
    v3 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v3;
  }
  return v2;
}

void __87__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_client_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    v4 = self->_clientFeedbackHelper;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 client:(id)a6 error:(id *)a7 block:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  v16 = +[PPConnectionsClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_client_error_block___block_invoke;
  v19[3] = &unk_1E550F880;
  id v20 = v13;
  id v17 = v13;
  LOBYTE(a7) = [v16 recentLocationsForConsumer:a3 criteria:v15 limit:a5 explanationSet:0 client:v14 error:a7 handleBatch:v19];

  return (char)a7;
}

- (void).cxx_destruct
{
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 isMapped])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPConnectionsStore.m" lineNumber:111 description:@"You cannot send mapped feedback on connections. Please use PPFeedback to create the feedback for connections."];
  }
  uint64_t v9 = [(PPConnectionsStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PPConnectionsStore.m", 112, @"The clientIdentifier property must be set on the %@ in order to send feedback.", v17 object file lineNumber description];
  }
  uint64_t v11 = [(PPConnectionsStore *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  long long v12 = +[PPConnectionsClient sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__PPConnectionsStore_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E550F8A8;
  v18[4] = self;
  id v19 = v7;
  id v13 = v7;
  [v12 registerFeedback:v8 completion:v18];
}

void __50__PPConnectionsStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if (v5)
  {
    id v7 = pp_connections_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "Error from registerFeedback:completion: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 client:(id)a7 error:(id *)a8 block:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = +[PPConnectionsClient sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_explanationSet_client_error_block___block_invoke;
  v22[3] = &unk_1E550F880;
  id v23 = v15;
  id v20 = v15;
  LOBYTE(a8) = [v19 recentLocationsForConsumer:a3 criteria:v18 limit:a5 explanationSet:v17 client:v16 error:a8 handleBatch:v22];

  return (char)a8;
}

void __102__PPConnectionsStore_iterRecentLocationsForConsumer_criteria_limit_explanationSet_client_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)iterRecentLocationDonationsSinceDate:(id)a3 client:(id)a4 error:(id *)a5 block:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  long long v12 = +[PPConnectionsClient sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PPConnectionsStore_iterRecentLocationDonationsSinceDate_client_error_block___block_invoke;
  v15[3] = &unk_1E550F880;
  id v16 = v9;
  id v13 = v9;
  LOBYTE(a5) = [v12 recentLocationDonationsSinceDate:v11 client:v10 error:a5 handleBatch:v15];

  return (char)a5;
}

void __78__PPConnectionsStore_iterRecentLocationDonationsSinceDate_client_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end