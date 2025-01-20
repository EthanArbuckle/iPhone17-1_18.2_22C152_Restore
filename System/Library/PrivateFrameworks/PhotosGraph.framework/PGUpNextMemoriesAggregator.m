@interface PGUpNextMemoriesAggregator
- (BOOL)addUpNextMemory:(id)a3 debugInfo:(id *)a4;
- (BOOL)gateOnUserFeedback;
- (NSMutableArray)acceptedMemories;
- (NSMutableSet)keyAssetLocalIdentifiers;
- (NSMutableSet)lowercaseTitles;
- (OS_os_log)loggingConnection;
- (PGUpNextMemoriesAggregator)initWithLowercaseTitles:(id)a3 keyAssetLocalIdentifiers:(id)a4 gateOnUserFeedback:(BOOL)a5 loggingConnection:(id)a6;
- (void)setAcceptedMemories:(id)a3;
@end

@implementation PGUpNextMemoriesAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_acceptedMemories, 0);
  objc_storeStrong((id *)&self->_lowercaseTitles, 0);
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifiers, 0);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (NSMutableSet)lowercaseTitles
{
  return self->_lowercaseTitles;
}

- (NSMutableSet)keyAssetLocalIdentifiers
{
  return self->_keyAssetLocalIdentifiers;
}

- (void)setAcceptedMemories:(id)a3
{
}

- (NSMutableArray)acceptedMemories
{
  return self->_acceptedMemories;
}

- (BOOL)gateOnUserFeedback
{
  return self->_gateOnUserFeedback;
}

- (BOOL)addUpNextMemory:(id)a3 debugInfo:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23 = [v5 memory];
  v6 = [v5 title];
  v7 = [v6 lowercaseString];
  v8 = [v5 subtitle];
  v9 = [v5 keyAssetLocalIdentifier];
  v10 = [v5 memoryLocalIdentifier];
  v11 = [v10 substringToIndex:8];

  v12 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
  v13 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
  uint64_t v14 = [v9 substringToIndex:8];
  v21 = (void *)v14;
  if ([(NSMutableSet *)self->_lowercaseTitles containsObject:v7])
  {
    id v15 = [NSString stringWithFormat:@"Same title, skip memory: %@\n\t%@ - %@\n\tkeyAsset: %@", v11, v12, v13, v14];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
LABEL_14:
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    [NSString stringWithFormat:@"No key asset found for memory: %@\n\t%@ - %@"], v11, v12, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ([(NSMutableSet *)self->_keyAssetLocalIdentifiers containsObject:v9])
  {
    id v15 = [NSString stringWithFormat:@"Conflicting key asset for memory: %@\n\t%@ - %@\n\tkeyAsset: %@", v11, v12, v13, v14];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      goto LABEL_14;
    }
LABEL_15:
    BOOL v17 = 0;
    goto LABEL_16;
  }
  if (self->_gateOnUserFeedback && [v5 isBlockedByUserFeedback])
  {
    id v15 = [NSString stringWithFormat:@"UserFeedbackScore below threshold, skip memory: %@\n\t%@ - %@\n\tkeyAsset: %@", v11, v12, v13, v14];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  [(NSMutableSet *)self->_keyAssetLocalIdentifiers addObject:v9];
  [(NSMutableSet *)self->_lowercaseTitles addObject:v7];
  [(NSMutableArray *)self->_acceptedMemories addObject:v23];
  [NSString stringWithFormat:@"Accepted memory: %@\n\t%@ - %@\n\tkeyAsset: %@"], v11, v12, v13, v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v20 = self->_loggingConnection;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v15;
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
  }
  BOOL v17 = 1;
LABEL_16:
  if (a4)
  {
    id v18 = v15;
    *a4 = v18;
    id v15 = v18;
  }

  return v17;
}

- (PGUpNextMemoriesAggregator)initWithLowercaseTitles:(id)a3 keyAssetLocalIdentifiers:(id)a4 gateOnUserFeedback:(BOOL)a5 loggingConnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PGUpNextMemoriesAggregator;
  v13 = [(PGUpNextMemoriesAggregator *)&v22 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_gateOnUserFeedback = a5;
    id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    acceptedMemories = v14->_acceptedMemories;
    v14->_acceptedMemories = v15;

    uint64_t v17 = [v10 mutableCopy];
    lowercaseTitles = v14->_lowercaseTitles;
    v14->_lowercaseTitles = (NSMutableSet *)v17;

    uint64_t v19 = [v11 mutableCopy];
    keyAssetLocalIdentifiers = v14->_keyAssetLocalIdentifiers;
    v14->_keyAssetLocalIdentifiers = (NSMutableSet *)v19;

    objc_storeStrong((id *)&v14->_loggingConnection, a6);
  }

  return v14;
}

@end