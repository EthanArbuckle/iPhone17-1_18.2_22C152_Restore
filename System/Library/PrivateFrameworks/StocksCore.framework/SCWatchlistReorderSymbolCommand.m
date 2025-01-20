@interface SCWatchlistReorderSymbolCommand
+ (BOOL)supportsSecureCoding;
- (NSString)precedingSymbol;
- (NSString)symbol;
- (SCWatchlistReorderSymbolCommand)initWithCoder:(id)a3;
- (SCWatchlistReorderSymbolCommand)initWithSymbol:(id)a3 precedingSymbol:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWatchlistReorderSymbolCommand

- (SCWatchlistReorderSymbolCommand)initWithSymbol:(id)a3 precedingSymbol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWatchlistReorderSymbolCommand;
  v8 = [(SCWatchlistReorderSymbolCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    symbol = v8->_symbol;
    v8->_symbol = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    precedingSymbol = v8->_precedingSymbol;
    v8->_precedingSymbol = (NSString *)v11;
  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SCWatchlistReorderSymbolCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlist" recordType:@"Watchlist" modifyBlock:v4];
}

void __51__SCWatchlistReorderSymbolCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1CA70];
  id v23 = v3;
  v5 = [v3 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v7 = [v4 orderedSetWithArray:v6];

  v8 = [*(id *)(a1 + 32) symbol];
  uint64_t v9 = [*(id *)(a1 + 32) precedingSymbol];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [*(id *)(a1 + 32) symbol];
    int v12 = [v7 containsObject:v11];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) precedingSymbol];
      if (!v13
        || (objc_super v14 = (void *)v13,
            [*(id *)(a1 + 32) precedingSymbol],
            v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v7 containsObject:v15],
            v15,
            v14,
            v16))
      {
        v17 = [*(id *)(a1 + 32) precedingSymbol];

        v18 = [*(id *)(a1 + 32) symbol];
        [v7 removeObject:v18];

        v19 = [*(id *)(a1 + 32) symbol];
        if (v17)
        {
          v20 = [*(id *)(a1 + 32) precedingSymbol];
          objc_msgSend(v7, "insertObject:atIndex:", v19, objc_msgSend(v7, "indexOfObject:", v20) + 1);
        }
        else
        {
          [v7 insertObject:v19 atIndex:0];
        }

        v21 = [v7 array];
        v22 = [v23 encryptedValues];
        [v22 setObject:v21 forKeyedSubscript:@"symbols"];
      }
    }
  }
}

- (SCWatchlistReorderSymbolCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"precedingSymbol"];

  if (v5)
  {
    self = [(SCWatchlistReorderSymbolCommand *)self initWithSymbol:v5 precedingSymbol:v6];
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
  v5 = [(SCWatchlistReorderSymbolCommand *)self symbol];
  [v4 encodeObject:v5 forKey:@"symbol"];

  id v6 = [(SCWatchlistReorderSymbolCommand *)self precedingSymbol];
  [v4 encodeObject:v6 forKey:@"precedingSymbol"];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precedingSymbol, 0);

  objc_storeStrong((id *)&self->_symbol, 0);
}

@end