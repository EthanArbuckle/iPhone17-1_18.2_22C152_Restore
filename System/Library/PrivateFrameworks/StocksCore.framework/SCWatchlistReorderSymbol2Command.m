@interface SCWatchlistReorderSymbol2Command
+ (BOOL)supportsSecureCoding;
- (NSString)symbol;
- (SCWatchlistReorderSymbol2Command)initWithCoder:(id)a3;
- (SCWatchlistReorderSymbol2Command)initWithSymbol:(id)a3 toIndex:(unint64_t)a4;
- (unint64_t)toIndex;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWatchlistReorderSymbol2Command

- (SCWatchlistReorderSymbol2Command)initWithSymbol:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCWatchlistReorderSymbol2Command;
  v7 = [(SCWatchlistReorderSymbol2Command *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    symbol = v7->_symbol;
    v7->_symbol = (NSString *)v8;

    v7->_toIndex = a4;
  }

  return v7;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SCWatchlistReorderSymbol2Command_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlist" recordType:@"Watchlist" modifyBlock:v4];
}

void __52__SCWatchlistReorderSymbol2Command_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v14 = [v3 orderedSetWithArray:v6];

  v7 = [*(id *)(a1 + 32) symbol];
  [v14 removeObject:v7];

  uint64_t v8 = [*(id *)(a1 + 32) symbol];
  unint64_t v9 = [*(id *)(a1 + 32) toIndex];
  unint64_t v10 = [v14 count];
  if (v9 >= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  [v14 insertObject:v8 atIndex:v11];

  v12 = [v14 array];
  v13 = [v4 encryptedValues];

  [v13 setObject:v12 forKeyedSubscript:@"symbols"];
}

- (SCWatchlistReorderSymbol2Command)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toIndex"];

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
    self = -[SCWatchlistReorderSymbol2Command initWithSymbol:toIndex:](self, "initWithSymbol:toIndex:", v5, [v6 unsignedIntegerValue]);
    uint64_t v8 = self;
  }
  unint64_t v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCWatchlistReorderSymbol2Command *)self symbol];
  [v4 encodeObject:v5 forKey:@"symbol"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCWatchlistReorderSymbol2Command toIndex](self, "toIndex"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"toIndex"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (unint64_t)toIndex
{
  return self->_toIndex;
}

- (void).cxx_destruct
{
}

@end