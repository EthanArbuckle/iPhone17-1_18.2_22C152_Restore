@interface SCWWatchlistAddToWatchlistOrderCommand
+ (BOOL)supportsSecureCoding;
- (NSArray)watchlistIdentifiers;
- (NSString)watchlistIdentifier;
- (SCWWatchlistAddToWatchlistOrderCommand)initWithCoder:(id)a3;
- (SCWWatchlistAddToWatchlistOrderCommand)initWithWatchlistIdentifiers:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistAddToWatchlistOrderCommand

- (SCWWatchlistAddToWatchlistOrderCommand)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"watchlistIdentifiers"];

  if (v8)
  {
    self = [(SCWWatchlistAddToWatchlistOrderCommand *)self initWithWatchlistIdentifiers:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (SCWWatchlistAddToWatchlistOrderCommand)initWithWatchlistIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistAddToWatchlistOrderCommand;
  id v5 = [(SCWWatchlistAddToWatchlistOrderCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    watchlistIdentifiers = v5->_watchlistIdentifiers;
    v5->_watchlistIdentifiers = (NSArray *)v6;
  }
  return v5;
}

void __58__SCWWatchlistAddToWatchlistOrderCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  id v5 = [v4 encryptedValues];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"watchlistIDs"];
  id v10 = [v3 orderedSetWithArray:v6];

  v7 = [*(id *)(a1 + 32) watchlistIdentifiers];
  [v10 addObjectsFromArray:v7];

  v8 = [v10 array];
  objc_super v9 = [v4 encryptedValues];

  [v9 setObject:v8 forKeyedSubscript:@"watchlistIDs"];
}

- (NSArray)watchlistIdentifiers
{
  return self->_watchlistIdentifiers;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__SCWWatchlistAddToWatchlistOrderCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  id v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlistorder" recordType:@"WatchlistOrder" modifyBlock:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistAddToWatchlistOrderCommand *)self watchlistIdentifiers];
  [v4 encodeObject:v5 forKey:@"watchlistIdentifiers"];
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifiers, 0);

  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end