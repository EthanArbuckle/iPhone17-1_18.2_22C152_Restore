@interface SCWatchlistReplaceSymbolCommand
+ (BOOL)supportsSecureCoding;
- (NSString)oldSymbol;
- (NSString)replacementSymbol;
- (SCWatchlistReplaceSymbolCommand)initWithCoder:(id)a3;
- (SCWatchlistReplaceSymbolCommand)initWithOldSymbol:(id)a3 replacementSymbol:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWatchlistReplaceSymbolCommand

- (SCWatchlistReplaceSymbolCommand)initWithOldSymbol:(id)a3 replacementSymbol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWatchlistReplaceSymbolCommand;
  v8 = [(SCWatchlistReplaceSymbolCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    oldSymbol = v8->_oldSymbol;
    v8->_oldSymbol = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    replacementSymbol = v8->_replacementSymbol;
    v8->_replacementSymbol = (NSString *)v11;
  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SCWatchlistReplaceSymbolCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlist" recordType:@"Watchlist" modifyBlock:v4];
}

void __51__SCWatchlistReplaceSymbolCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v12 = [v3 orderedSetWithArray:v6];

  id v7 = [*(id *)(a1 + 32) oldSymbol];
  uint64_t v8 = [v12 indexOfObject:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [*(id *)(a1 + 32) replacementSymbol];
    [v12 replaceObjectAtIndex:v8 withObject:v9];
  }
  v10 = [v12 array];
  uint64_t v11 = [v4 encryptedValues];

  [v11 setObject:v10 forKeyedSubscript:@"symbols"];
}

- (SCWatchlistReplaceSymbolCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oldSymbol"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replacementSymbol"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    self = [(SCWatchlistReplaceSymbolCommand *)self initWithOldSymbol:v5 replacementSymbol:v6];
    uint64_t v8 = self;
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCWatchlistReplaceSymbolCommand *)self oldSymbol];
  [v4 encodeObject:v5 forKey:@"oldSymbol"];

  id v6 = [(SCWatchlistReplaceSymbolCommand *)self replacementSymbol];
  [v4 encodeObject:v6 forKey:@"replacementSymbol"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)oldSymbol
{
  return self->_oldSymbol;
}

- (NSString)replacementSymbol
{
  return self->_replacementSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementSymbol, 0);

  objc_storeStrong((id *)&self->_oldSymbol, 0);
}

@end