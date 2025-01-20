@interface WBSPasswordBreachQueuedPassword
- (NSArray)persistentIdentifiers;
- (NSData)highFrequencyEncodedPasswordData;
- (NSUUID)uuid;
- (WBSPair)topBucketIdentiferAndHash;
- (WBSPasswordBreachQueuedPassword)initWithCredentials:(id)a3 context:(id)a4;
- (id)description;
- (id)initFakePasswordWithContext:(id)a3;
- (unint64_t)remainingHashCount;
- (void)pushBucketIdentifiersAndHashesFromQueuedPassword:(id)a3;
- (void)removeTopBucketIdentifierAndHash;
@end

@implementation WBSPasswordBreachQueuedPassword

- (id)initFakePasswordWithContext:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSPasswordBreachQueuedPassword;
  v5 = [(WBSPasswordBreachQueuedPassword *)&v22 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9B8] data];
    v23[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    persistentIdentifiers = v5->_persistentIdentifiers;
    v5->_persistentIdentifiers = (NSArray *)v7;

    v9 = [v4 cryptographicOperations];
    v10 = [v9 generateFakeEncodedPasswordForLowFrequencyBucket];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
      bucketIdentifierAndHashStack = v5->_bucketIdentifierAndHashStack;
      v5->_bucketIdentifierAndHashStack = (NSMutableArray *)v11;

      uint64_t v13 = [v9 generateFakeEncodedPasswordForHighFrequencyBucket];
      highFrequencyEncodedPassword = v5->_highFrequencyEncodedPassword;
      v5->_highFrequencyEncodedPassword = (NSData *)v13;

      if (v5->_highFrequencyEncodedPassword)
      {
        v15 = [v4 configuration];
        int v16 = [v15 verboseSensitiveLoggingEnabled];

        if (v16)
        {
          v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:](v17, v5);
          }
        }
        v18 = v5;
        goto LABEL_14;
      }
      v20 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:](v20);
      }
    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:](v19);
      }
    }
    v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (WBSPasswordBreachQueuedPassword)initWithCredentials:(id)a3 context:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WBSPasswordBreachQueuedPassword;
  v8 = [(WBSPasswordBreachQueuedPassword *)&v36 init];
  if (v8)
  {
    v31 = [v7 cryptographicOperations];
    uint64_t v9 = [v6 count];
    v10 = [v6 firstObject];
    uint64_t v11 = [v10 password];

    v12 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) persistentIdentifier];
          [(NSArray *)v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
    }

    persistentIdentifiers = v8->_persistentIdentifiers;
    v8->_persistentIdentifiers = v12;
    v20 = v12;

    v21 = (void *)MEMORY[0x1E4F1CA48];
    objc_super v22 = [v31 encodePasswordForLowFrequencyBucket:v11];
    uint64_t v23 = [v21 arrayWithObject:v22];
    bucketIdentifierAndHashStack = v8->_bucketIdentifierAndHashStack;
    v8->_bucketIdentifierAndHashStack = (NSMutableArray *)v23;

    uint64_t v25 = [v31 encodePasswordForHighFrequencyBucket:v11];
    highFrequencyEncodedPassword = v8->_highFrequencyEncodedPassword;
    v8->_highFrequencyEncodedPassword = (NSData *)v25;

    v27 = [v7 configuration];
    LODWORD(v21) = [v27 verboseSensitiveLoggingEnabled];

    if (v21)
    {
      v28 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[WBSPasswordBreachQueuedPassword initWithCredentials:context:]((uint64_t)v11, v28, v8);
      }
    }
    v29 = v8;
  }
  return v8;
}

- (void)removeTopBucketIdentifierAndHash
{
}

- (void)pushBucketIdentifiersAndHashesFromQueuedPassword:(id)a3
{
}

- (WBSPair)topBucketIdentiferAndHash
{
  return (WBSPair *)[(NSMutableArray *)self->_bucketIdentifierAndHashStack lastObject];
}

- (unint64_t)remainingHashCount
{
  return [(NSMutableArray *)self->_bucketIdentifierAndHashStack count];
}

- (NSData)highFrequencyEncodedPasswordData
{
  return self->_highFrequencyEncodedPassword;
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    id v5 = [(WBSPasswordBreachQueuedPassword *)self highFrequencyEncodedPasswordData];
    id v6 = (NSUUID *)objc_msgSend(v4, "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
    id v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, persistentIdentifiers: %@, bucketIdentifierAndHashStack: %@, uuid: %@, highFrequencyEncodedPassword: %@>", objc_opt_class(), self, self->_persistentIdentifiers, self->_bucketIdentifierAndHashStack, self->_uuid, self->_highFrequencyEncodedPassword];
}

- (NSArray)persistentIdentifiers
{
  return self->_persistentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_highFrequencyEncodedPassword, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_bucketIdentifierAndHashStack, 0);
}

- (void)initFakePasswordWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Could not generate low frequency password.", v1, 2u);
}

- (void)initFakePasswordWithContext:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Could not generate high frequency password.", v1, 2u);
}

- (void)initFakePasswordWithContext:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 uuid];
  int v5 = 138739971;
  id v6 = v4;
  _os_log_debug_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEBUG, "Generated password with UUID %{sensitive}@", (uint8_t *)&v5, 0xCu);
}

- (void)initWithCredentials:(void *)a3 context:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = a2;
  id v6 = [a3 uuid];
  int v7 = 138740227;
  uint64_t v8 = a1;
  __int16 v9 = 2117;
  v10 = v6;
  _os_log_debug_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEBUG, "Enqueued password \"%{sensitive}@\" with UUID %{sensitive}@", (uint8_t *)&v7, 0x16u);
}

@end