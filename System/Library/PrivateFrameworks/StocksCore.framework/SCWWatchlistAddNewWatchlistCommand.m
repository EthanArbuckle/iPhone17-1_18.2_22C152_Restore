@interface SCWWatchlistAddNewWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSArray)symbols;
- (NSNumber)displayState;
- (NSNumber)sortOrderState;
- (NSNumber)sortState;
- (NSString)name;
- (NSString)watchlistIdentifier;
- (SCWWatchlistAddNewWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistAddNewWatchlistCommand)initWithName:(id)a3 identifier:(id)a4 sortState:(id)a5 sortOrderState:(id)a6 displayState:(id)a7;
- (SCWWatchlistAddNewWatchlistCommand)initWithName:(id)a3 identifier:(id)a4 symbols:(id)a5 sortState:(id)a6 sortOrderState:(id)a7 displayState:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistAddNewWatchlistCommand

- (SCWWatchlistAddNewWatchlistCommand)initWithName:(id)a3 identifier:(id)a4 sortState:(id)a5 sortOrderState:(id)a6 displayState:(id)a7
{
  return [(SCWWatchlistAddNewWatchlistCommand *)self initWithName:a3 identifier:a4 symbols:MEMORY[0x1E4F1CBF0] sortState:a5 sortOrderState:a6 displayState:a7];
}

- (SCWWatchlistAddNewWatchlistCommand)initWithName:(id)a3 identifier:(id)a4 symbols:(id)a5 sortState:(id)a6 sortOrderState:(id)a7 displayState:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)SCWWatchlistAddNewWatchlistCommand;
  v20 = [(SCWWatchlistAddNewWatchlistCommand *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    symbols = v20->_symbols;
    v20->_symbols = (NSArray *)v23;

    uint64_t v25 = [v15 copy];
    watchlistIdentifier = v20->_watchlistIdentifier;
    v20->_watchlistIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    sortState = v20->_sortState;
    v20->_sortState = (NSNumber *)v27;

    uint64_t v29 = [v18 copy];
    sortOrderState = v20->_sortOrderState;
    v20->_sortOrderState = (NSNumber *)v29;

    uint64_t v31 = [v19 copy];
    displayState = v20->_displayState;
    v20->_displayState = (NSNumber *)v31;
  }
  return v20;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SCWWatchlistAddNewWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  v6 = [(SCWWatchlistAddNewWatchlistCommand *)self watchlistIdentifier];
  [v4 createOrUpdateRecordWithName:v6 recordType:@"Watchlist" modifyBlock:v5];
}

void __54__SCWWatchlistAddNewWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = a2;
  v5 = [v4 encryptedValues];
  v6 = [v5 objectForKeyedSubscript:@"symbols"];
  id v15 = [v3 orderedSetWithArray:v6];

  v7 = [*(id *)(a1 + 32) symbols];
  [v15 addObjectsFromArray:v7];

  v8 = [v15 array];
  v9 = [v4 encryptedValues];
  [v9 setObject:v8 forKeyedSubscript:@"symbols"];

  v10 = [*(id *)(a1 + 32) name];
  v11 = [v4 encryptedValues];
  [v11 setObject:v10 forKeyedSubscript:@"name"];

  v12 = [*(id *)(a1 + 32) sortState];
  [v4 setObject:v12 forKeyedSubscript:@"sortState"];

  v13 = [*(id *)(a1 + 32) sortOrderState];
  [v4 setObject:v13 forKeyedSubscript:@"sortOrderState"];

  id v14 = [*(id *)(a1 + 32) displayState];
  [v4 setObject:v14 forKeyedSubscript:@"displayState"];
}

- (SCWWatchlistAddNewWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"symbols"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortState"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortOrderState"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayState"];

  if (v5)
  {
    self = [(SCWWatchlistAddNewWatchlistCommand *)self initWithName:v5 identifier:v10 symbols:v9 sortState:v11 sortOrderState:v12 displayState:v13];
    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCWWatchlistAddNewWatchlistCommand *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(SCWWatchlistAddNewWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v6 forKey:@"watchlistIdentifier"];

  uint64_t v7 = [(SCWWatchlistAddNewWatchlistCommand *)self sortState];
  [v4 encodeObject:v7 forKey:@"sortState"];

  v8 = [(SCWWatchlistAddNewWatchlistCommand *)self sortOrderState];
  [v4 encodeObject:v8 forKey:@"sortOrderState"];

  v9 = [(SCWWatchlistAddNewWatchlistCommand *)self displayState];
  [v4 encodeObject:v9 forKey:@"displayState"];

  id v10 = [(SCWWatchlistAddNewWatchlistCommand *)self symbols];
  [v4 encodeObject:v10 forKey:@"symbols"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)symbols
{
  return self->_symbols;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSNumber)sortState
{
  return self->_sortState;
}

- (NSNumber)sortOrderState
{
  return self->_sortOrderState;
}

- (NSNumber)displayState
{
  return self->_displayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayState, 0);
  objc_storeStrong((id *)&self->_sortOrderState, 0);
  objc_storeStrong((id *)&self->_sortState, 0);
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
  objc_storeStrong((id *)&self->_symbols, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end