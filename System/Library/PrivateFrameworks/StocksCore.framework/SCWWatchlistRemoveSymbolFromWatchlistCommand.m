@interface SCWWatchlistRemoveSymbolFromWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSString)symbol;
- (NSString)watchlistIdentifier;
- (SCWWatchlistRemoveSymbolFromWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistRemoveSymbolFromWatchlistCommand)initWithSymbol:(id)a3 watchlistIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistRemoveSymbolFromWatchlistCommand

- (SCWWatchlistRemoveSymbolFromWatchlistCommand)initWithSymbol:(id)a3 watchlistIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWWatchlistRemoveSymbolFromWatchlistCommand;
  v8 = [(SCWWatchlistRemoveSymbolFromWatchlistCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    symbol = v8->_symbol;
    v8->_symbol = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v11;
  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SCWWatchlistRemoveSymbolFromWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  id v6 = [(SCWWatchlistRemoveSymbolFromWatchlistCommand *)self watchlistIdentifier];
  [v4 createOrUpdateRecordWithName:v6 recordType:@"Watchlist" modifyBlock:v5];
}

void __64__SCWWatchlistRemoveSymbolFromWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v10 = [v3 orderedSetWithArray:v6];

  id v7 = [*(id *)(a1 + 32) symbol];
  [v10 removeObject:v7];

  v8 = [v10 array];
  uint64_t v9 = [v4 encryptedValues];

  [v9 setObject:v8 forKeyedSubscript:@"symbols"];
}

- (SCWWatchlistRemoveSymbolFromWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];

  if (v5)
  {
    self = [(SCWWatchlistRemoveSymbolFromWatchlistCommand *)self initWithSymbol:v5 watchlistIdentifier:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCWWatchlistRemoveSymbolFromWatchlistCommand *)self symbol];
  [v4 encodeObject:v5 forKey:@"symbol"];

  id v6 = [(SCWWatchlistRemoveSymbolFromWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v6 forKey:@"watchlistIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);

  objc_storeStrong((id *)&self->_symbol, 0);
}

@end