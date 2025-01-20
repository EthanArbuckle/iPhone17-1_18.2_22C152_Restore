@interface SCWWatchlistReorderAllSymbolsInWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSOrderedSet)symbols;
- (NSString)watchlistIdentifier;
- (SCWWatchlistReorderAllSymbolsInWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistReorderAllSymbolsInWatchlistCommand)initWithSymbols:(id)a3 watchlistIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistReorderAllSymbolsInWatchlistCommand

- (SCWWatchlistReorderAllSymbolsInWatchlistCommand)initWithSymbols:(id)a3 watchlistIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWWatchlistReorderAllSymbolsInWatchlistCommand;
  v8 = [(SCWWatchlistReorderAllSymbolsInWatchlistCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    symbols = v8->_symbols;
    v8->_symbols = (NSOrderedSet *)v9;

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
  aBlock[2] = __67__SCWWatchlistReorderAllSymbolsInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  id v6 = [(SCWWatchlistReorderAllSymbolsInWatchlistCommand *)self watchlistIdentifier];
  [v4 createOrUpdateRecordWithName:v6 recordType:@"Watchlist" modifyBlock:v5];
}

void __67__SCWWatchlistReorderAllSymbolsInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v12 = [v3 orderedSetWithArray:v6];

  id v7 = (void *)MEMORY[0x1E4F1CA70];
  v8 = [*(id *)(a1 + 32) symbols];
  uint64_t v9 = [v7 orderedSetWithOrderedSet:v8];

  [v9 unionOrderedSet:v12];
  v10 = [v9 array];
  uint64_t v11 = [v4 encryptedValues];
  [v11 setObject:v10 forKeyedSubscript:@"symbols"];

  [v4 setObject:0 forKeyedSubscript:@"sortState"];
  [v4 setObject:0 forKeyedSubscript:@"sortOrderState"];
}

- (SCWWatchlistReorderAllSymbolsInWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"symbols"];

  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];

  if (v8)
  {
    self = [(SCWWatchlistReorderAllSymbolsInWatchlistCommand *)self initWithSymbols:v8 watchlistIdentifier:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }
  uint64_t v11 = v10;

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistReorderAllSymbolsInWatchlistCommand *)self symbols];
  [v4 encodeObject:v5 forKey:@"symbols"];

  id v6 = [(SCWWatchlistReorderAllSymbolsInWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v6 forKey:@"watchlistIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSOrderedSet)symbols
{
  return self->_symbols;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);

  objc_storeStrong((id *)&self->_symbols, 0);
}

@end