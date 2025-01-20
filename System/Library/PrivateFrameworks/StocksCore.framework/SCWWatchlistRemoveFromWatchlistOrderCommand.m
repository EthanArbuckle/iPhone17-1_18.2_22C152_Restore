@interface SCWWatchlistRemoveFromWatchlistOrderCommand
+ (BOOL)supportsSecureCoding;
- (NSString)watchlistIdentifier;
- (SCWWatchlistRemoveFromWatchlistOrderCommand)initWithCoder:(id)a3;
- (SCWWatchlistRemoveFromWatchlistOrderCommand)initWithWatchlistIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistRemoveFromWatchlistOrderCommand

- (SCWWatchlistRemoveFromWatchlistOrderCommand)initWithWatchlistIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistRemoveFromWatchlistOrderCommand;
  v5 = [(SCWWatchlistRemoveFromWatchlistOrderCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    watchlistIdentifier = v5->_watchlistIdentifier;
    v5->_watchlistIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SCWWatchlistRemoveFromWatchlistOrderCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  id v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlistorder" recordType:@"WatchlistOrder" modifyBlock:v4];
}

void __63__SCWWatchlistRemoveFromWatchlistOrderCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"watchlistIDs"];
  id v10 = [v3 orderedSetWithArray:v6];

  v7 = [*(id *)(a1 + 32) watchlistIdentifier];
  [v10 removeObject:v7];

  v8 = [v10 array];
  objc_super v9 = [v4 encryptedValues];

  [v9 setObject:v8 forKeyedSubscript:@"watchlistIDs"];
}

- (SCWWatchlistRemoveFromWatchlistOrderCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];

  if (v5)
  {
    self = [(SCWWatchlistRemoveFromWatchlistOrderCommand *)self initWithWatchlistIdentifier:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistRemoveFromWatchlistOrderCommand *)self watchlistIdentifier];
  [v4 encodeObject:v5 forKey:@"watchlistIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
}

@end