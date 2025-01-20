@interface SKStatusSubscription
+ (id)logger;
- (BOOL)isPersonalStatusSubscription;
- (NSArray)ownerHandles;
- (NSString)subscriptionIdentifier;
- (SKHandle)ownerHandle;
- (SKPublishedStatus)currentStatus;
- (SKStatusSubscription)initWithSubscriptionMetadata:(id)a3 daemonConnection:(id)a4;
- (SKStatusSubscriptionDaemonConnection)daemonConnection;
- (SKStatusSubscriptionMetadata)subscriptionMetadata;
- (id)_ownerHandlesDescription;
- (id)description;
- (void)deleteSubscriptionWithCompletion:(id)a3;
- (void)releasePersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4;
- (void)releaseTransientSubscriptionAssertionWithCompletion:(id)a3;
- (void)retainPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4;
- (void)retainTransientSubscriptionAssertionWithCompletion:(id)a3;
@end

@implementation SKStatusSubscription

- (SKStatusSubscription)initWithSubscriptionMetadata:(id)a3 daemonConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKStatusSubscription;
  v9 = [(SKStatusSubscription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscriptionMetadata, a3);
    objc_storeStrong((id *)&v10->_daemonConnection, a4);
  }

  return v10;
}

- (void)retainTransientSubscriptionAssertionWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata subscriptionIdentifier];
  v6 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata statusTypeIdentifier];
  id v7 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Retaining transient subscription assertion for subscriptionIdentifier %@", buf, 0xCu);
  }

  id v8 = [(SKStatusSubscription *)self daemonConnection];
  v9 = [v8 asynchronousRemoteDaemonWithErrorHandler:&__block_literal_global_6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1;
  v12[3] = &unk_2644B66D8;
  id v13 = v5;
  id v14 = v4;
  id v10 = v4;
  id v11 = v5;
  [v9 retainTransientSubscriptionAssertionForSubscriptionIdentifier:v11 statusTypeIdentifier:v6 completion:v12];
}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();
  }
}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusSubscription logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained transient subscription assertion for subscription identifier %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)releaseTransientSubscriptionAssertionWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata subscriptionIdentifier];
  uint64_t v6 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata statusTypeIdentifier];
  uint64_t v7 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Releasing transient subscription assertion for subscriptionIdentifier %@", buf, 0xCu);
  }

  int v8 = [(SKStatusSubscription *)self daemonConnection];
  uint64_t v9 = [v8 asynchronousRemoteDaemonWithErrorHandler:&__block_literal_global_3];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_4;
  v12[3] = &unk_2644B66D8;
  id v13 = v5;
  id v14 = v4;
  id v10 = v4;
  id v11 = v5;
  [v9 releaseTransientSubscriptionAssertionForSubscriptionIdentifier:v11 statusTypeIdentifier:v6 completion:v12];
}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();
  }
}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusSubscription logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released transient subscription assertion for subscription identifier %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)retainPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata subscriptionIdentifier];
  uint64_t v9 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata statusTypeIdentifier];
  uint64_t v10 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "Retaining persistent subscription assertion for subscriptionIdentifier %@ applicationIdentifier %@", buf, 0x16u);
  }

  id v11 = [(SKStatusSubscription *)self daemonConnection];
  objc_super v12 = [v11 asynchronousRemoteDaemonWithErrorHandler:&__block_literal_global_6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7;
  v16[3] = &unk_2644B6550;
  id v17 = v8;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = v8;
  [v12 retainPersistentSubscriptionAssertionForSubscriptionIdentifier:v15 statusTypeIdentifier:v9 applicationIdentifier:v14 completion:v16];
}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();
  }
}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusSubscription logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained persistent subscription assertion for subscription identifier %@ applicationIdentifier %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)releasePersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata subscriptionIdentifier];
  int v9 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata statusTypeIdentifier];
  uint64_t v10 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "Releasing persistent subscription assertion for subscriptionIdentifier %@ applicationIdentifier %@", buf, 0x16u);
  }

  __int16 v11 = [(SKStatusSubscription *)self daemonConnection];
  uint64_t v12 = [v11 asynchronousRemoteDaemonWithErrorHandler:&__block_literal_global_9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_10;
  v16[3] = &unk_2644B6550;
  id v17 = v8;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = v8;
  [v12 releasePersistentSubscriptionAssertionForSubscriptionIdentifier:v15 statusTypeIdentifier:v9 applicationIdentifier:v14 completion:v16];
}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();
  }
}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_10(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusSubscription logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_10_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released persistent subscription assertion for subscription identifier %@ applicationIdentifier %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)deleteSubscriptionWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata subscriptionIdentifier];
  uint64_t v6 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata statusTypeIdentifier];
  uint64_t v7 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Deleting subscription with subscriptionIdentifier %@", buf, 0xCu);
  }

  uint64_t v8 = [(SKStatusSubscription *)self daemonConnection];
  int v9 = [v8 asynchronousRemoteDaemonWithErrorHandler:&__block_literal_global_12];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_13;
  v12[3] = &unk_2644B66D8;
  id v13 = v5;
  id v14 = v4;
  id v10 = v4;
  id v11 = v5;
  [v9 deleteSubscriptionWithIdentifier:v11 statusTypeIdentifier:v6 completion:v12];
}

void __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKStatusSubscription logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();
  }
}

void __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusSubscription logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_13_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully deleting subscription with identifier %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (NSString)subscriptionIdentifier
{
  return [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata subscriptionIdentifier];
}

- (BOOL)isPersonalStatusSubscription
{
  return [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata isPersonalStatusSubscription];
}

- (SKPublishedStatus)currentStatus
{
  return [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata currentStatus];
}

- (NSArray)ownerHandles
{
  return [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata ownerHandles];
}

- (id)_ownerHandlesDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(SKStatusSubscription *)self ownerHandles];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) handleString];
        uint64_t v10 = (void *)v9;
        if (v9) {
          id v11 = (__CFString *)v9;
        }
        else {
          id v11 = @"<nil>";
        }
        uint64_t v12 = v11;

        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  id v13 = (void *)[v3 copy];

  return v13;
}

- (id)description
{
  BOOL v3 = [(SKStatusSubscription *)self isPersonalStatusSubscription];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(SKStatusSubscription *)self subscriptionIdentifier];
  if (v3)
  {
    uint64_t v7 = [(SKStatusSubscription *)self currentStatus];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; subscriptionID = \"%@\"; personal = YES; status = \"%@\">",
      v5,
      self,
      v6,
    int v8 = v7);
  }
  else
  {
    uint64_t v7 = [(SKStatusSubscription *)self _ownerHandlesDescription];
    uint64_t v9 = [(SKStatusSubscription *)self currentStatus];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; subscriptionID = \"%@\"; owners = \"%@\"; status = \"%@\">",
      v5,
      self,
      v6,
      v7,
    int v8 = v9);
  }
  return v8;
}

+ (id)logger
{
  if (logger_onceToken_6 != -1) {
    dispatch_once(&logger_onceToken_6, &__block_literal_global_25);
  }
  id v2 = (void *)logger__logger_6;
  return v2;
}

uint64_t __30__SKStatusSubscription_logger__block_invoke()
{
  logger__logger_6 = (uint64_t)os_log_create("com.apple.StatusKit", "SKStatusSubscription");
  return MEMORY[0x270F9A758]();
}

- (SKStatusSubscriptionMetadata)subscriptionMetadata
{
  return self->_subscriptionMetadata;
}

- (SKStatusSubscriptionDaemonConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_subscriptionMetadata, 0);
}

- (SKHandle)ownerHandle
{
  id v2 = [(SKStatusSubscriptionMetadata *)self->_subscriptionMetadata ownerHandles];
  BOOL v3 = [v2 firstObject];

  return (SKHandle *)v3;
}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retaining transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error retaining transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error releasing transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error releasing transient subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retaining persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __97__SKStatusSubscription_retainPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error retaining persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error releasing persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __98__SKStatusSubscription_releasePersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error releasing persistent subscription assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __57__SKStatusSubscription_deleteSubscriptionWithCompletion___block_invoke_13_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21E62A000, log, OS_LOG_TYPE_ERROR, "Error deleting subscription with identifier %@. Error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end