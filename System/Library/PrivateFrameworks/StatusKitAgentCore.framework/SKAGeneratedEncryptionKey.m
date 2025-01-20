@interface SKAGeneratedEncryptionKey
+ (id)logger;
- (MPStatusKitIncomingRatchet)incomingRatchet;
- (MPStatusKitOutgoingRatchet)outgoingRatchet;
- (NSData)originalOutgoingRatchetState;
- (NSDate)dateGenerated;
- (SKAGeneratedEncryptionKey)initWithCoreDataGeneratedEncryptionKey:(id)a3;
- (SKAGeneratedEncryptionKey)initWithOriginalOutgoingRatchetState:(id)a3 dateGenerated:(id)a4;
@end

@implementation SKAGeneratedEncryptionKey

- (SKAGeneratedEncryptionKey)initWithCoreDataGeneratedEncryptionKey:(id)a3
{
  id v4 = a3;
  v5 = [v4 originalOutgoingRatchetState];
  v6 = [v4 dateGenerated];

  v7 = [(SKAGeneratedEncryptionKey *)self initWithOriginalOutgoingRatchetState:v5 dateGenerated:v6];
  return v7;
}

- (SKAGeneratedEncryptionKey)initWithOriginalOutgoingRatchetState:(id)a3 dateGenerated:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKAGeneratedEncryptionKey;
  v9 = [(SKAGeneratedEncryptionKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalOutgoingRatchetState, a3);
    objc_storeStrong((id *)&v10->_dateGenerated, a4);
  }

  return v10;
}

+ (id)logger
{
  if (logger_onceToken_23 != -1) {
    dispatch_once(&logger_onceToken_23, &__block_literal_global_23);
  }
  v2 = (void *)logger__logger_23;
  return v2;
}

uint64_t __35__SKAGeneratedEncryptionKey_logger__block_invoke()
{
  logger__logger_23 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAGeneratedEncryptionKey");
  return MEMORY[0x270F9A758]();
}

- (NSData)originalOutgoingRatchetState
{
  return self->_originalOutgoingRatchetState;
}

- (NSDate)dateGenerated
{
  return self->_dateGenerated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateGenerated, 0);
  objc_storeStrong((id *)&self->_originalOutgoingRatchetState, 0);
}

- (MPStatusKitOutgoingRatchet)outgoingRatchet
{
  v2 = self->_originalOutgoingRatchetState;
  if (v2)
  {
    id v14 = 0;
    v3 = (void *)[objc_alloc(MEMORY[0x263F55678]) initWithData:v2 error:&v14];
    id v4 = v14;
    if (!v3)
    {
      v5 = +[SKAGeneratedEncryptionKey logger];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(SKAGeneratedEncryptionKey(Ratchets) *)(uint64_t)v4 outgoingRatchet];
      }
    }
  }
  else
  {
    id v4 = +[SKAGeneratedEncryptionKey logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SKAGeneratedEncryptionKey(Ratchets) *)v4 outgoingRatchet];
    }
    v3 = 0;
  }

  return (MPStatusKitOutgoingRatchet *)v3;
}

- (MPStatusKitIncomingRatchet)incomingRatchet
{
  v2 = [(SKAGeneratedEncryptionKey *)self outgoingRatchet];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 currentSubscriptionKeys];
    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x263F55670]);
      uint64_t v6 = [v4 index];
      uint64_t v7 = [v4 chainKey];
      uint64_t v8 = [v4 signingKey];
      uint64_t v25 = 0;
      uint64_t v9 = (void *)[v5 initWithIndex:v6 chainKey:v7 signingKey:v8 error:&v25];
    }
    else
    {
      uint64_t v7 = +[SKAGeneratedEncryptionKey logger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(SKAGeneratedEncryptionKey(Ratchets) *)v7 incomingRatchet];
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    id v4 = +[SKAGeneratedEncryptionKey logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SKAGeneratedEncryptionKey(Ratchets) *)v4 incomingRatchet];
    }
    uint64_t v9 = 0;
  }

  return (MPStatusKitIncomingRatchet *)v9;
}

@end