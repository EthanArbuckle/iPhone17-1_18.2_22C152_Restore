@interface SCWatchlistRemoveSymbolCommand
+ (BOOL)supportsSecureCoding;
- (NSString)symbol;
- (SCWatchlistRemoveSymbolCommand)initWithCoder:(id)a3;
- (SCWatchlistRemoveSymbolCommand)initWithSymbol:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWatchlistRemoveSymbolCommand

- (SCWatchlistRemoveSymbolCommand)initWithSymbol:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWatchlistRemoveSymbolCommand;
  v5 = [(SCWatchlistRemoveSymbolCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    symbol = v5->_symbol;
    v5->_symbol = (NSString *)v6;
  }
  return v5;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__SCWatchlistRemoveSymbolCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  id v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlist" recordType:@"Watchlist" modifyBlock:v4];
}

void __50__SCWatchlistRemoveSymbolCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v10 = [v3 orderedSetWithArray:v6];

  v7 = [*(id *)(a1 + 32) symbol];
  [v10 removeObject:v7];

  v8 = [v10 array];
  objc_super v9 = [v4 encryptedValues];

  [v9 setObject:v8 forKeyedSubscript:@"symbols"];
}

- (SCWatchlistRemoveSymbolCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];

  if (v5)
  {
    self = [(SCWatchlistRemoveSymbolCommand *)self initWithSymbol:v5];
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
  id v5 = [(SCWatchlistRemoveSymbolCommand *)self symbol];
  [v4 encodeObject:v5 forKey:@"symbol"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void).cxx_destruct
{
}

@end