@interface SCWWatchlistReorderSymbolInWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSString)precedingSymbol;
- (NSString)symbol;
- (NSString)watchlistIdentifier;
- (SCWWatchlistReorderSymbolInWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistReorderSymbolInWatchlistCommand)initWithSymbol:(id)a3 precedingSymbol:(id)a4 watchlistIdentifier:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistReorderSymbolInWatchlistCommand

- (SCWWatchlistReorderSymbolInWatchlistCommand)initWithSymbol:(id)a3 precedingSymbol:(id)a4 watchlistIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCWWatchlistReorderSymbolInWatchlistCommand;
  v11 = [(SCWWatchlistReorderSymbolInWatchlistCommand *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    symbol = v11->_symbol;
    v11->_symbol = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    precedingSymbol = v11->_precedingSymbol;
    v11->_precedingSymbol = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    watchlistIdentifier = v11->_watchlistIdentifier;
    v11->_watchlistIdentifier = (NSString *)v16;
  }
  return v11;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SCWWatchlistReorderSymbolInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  v6 = [(SCWWatchlistReorderSymbolInWatchlistCommand *)self watchlistIdentifier];
  [v4 createOrUpdateRecordWithName:v6 recordType:@"Watchlist" modifyBlock:v5];
}

void __63__SCWWatchlistReorderSymbolInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1CA70];
  id v25 = v3;
  v5 = [v3 encryptedValues];
  v6 = [v5 objectForKeyedSubscript:@"symbols"];
  v7 = [v4 orderedSetWithArray:v6];

  id v8 = [*(id *)(a1 + 32) symbol];
  id v9 = [*(id *)(a1 + 32) precedingSymbol];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v11 = [*(id *)(a1 + 32) symbol];
    int v12 = [v7 containsObject:v11];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) precedingSymbol];
      if (!v13
        || (uint64_t v14 = (void *)v13,
            [*(id *)(a1 + 32) precedingSymbol],
            v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v7 containsObject:v15],
            v15,
            v14,
            v16))
      {
        v17 = [*(id *)(a1 + 32) precedingSymbol];
        uint64_t v18 = [v7 indexOfObject:v17];

        objc_super v19 = [*(id *)(a1 + 32) precedingSymbol];

        v20 = [*(id *)(a1 + 32) symbol];
        [v7 removeObject:v20];

        v21 = [*(id *)(a1 + 32) symbol];
        if (!v19 || v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v7 insertObject:v21 atIndex:0];
        }
        else
        {
          v22 = [*(id *)(a1 + 32) precedingSymbol];
          objc_msgSend(v7, "insertObject:atIndex:", v21, objc_msgSend(v7, "indexOfObject:", v22) + 1);
        }
        v23 = [v7 array];
        v24 = [v25 encryptedValues];
        [v24 setObject:v23 forKeyedSubscript:@"symbols"];
      }
    }
  }
}

- (SCWWatchlistReorderSymbolInWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"precedingStockSymbol"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];

  if (v5)
  {
    self = [(SCWWatchlistReorderSymbolInWatchlistCommand *)self initWithSymbol:v5 precedingSymbol:v6 watchlistIdentifier:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCWWatchlistReorderSymbolInWatchlistCommand *)self symbol];
  [v4 encodeObject:v5 forKey:@"symbol"];

  v6 = [(SCWWatchlistReorderSymbolInWatchlistCommand *)self precedingSymbol];
  [v4 encodeObject:v6 forKey:@"precedingStockSymbol"];

  id v7 = [(SCWWatchlistReorderSymbolInWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v7 forKey:@"watchlistIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (NSString)precedingSymbol
{
  return self->_precedingSymbol;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
  objc_storeStrong((id *)&self->_precedingSymbol, 0);

  objc_storeStrong((id *)&self->_symbol, 0);
}

@end