@interface SCWWatchlistUpdateSortStateInWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSNumber)displayState;
- (NSNumber)sortOrderState;
- (NSNumber)sortState;
- (NSString)watchlistIdentifier;
- (SCWWatchlistUpdateSortStateInWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistUpdateSortStateInWatchlistCommand)initWithWatchlistIdentifier:(id)a3 sortState:(id)a4 sortOrderState:(id)a5 displayState:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistUpdateSortStateInWatchlistCommand

- (SCWWatchlistUpdateSortStateInWatchlistCommand)initWithWatchlistIdentifier:(id)a3 sortState:(id)a4 sortOrderState:(id)a5 displayState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SCWWatchlistUpdateSortStateInWatchlistCommand;
  v14 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    watchlistIdentifier = v14->_watchlistIdentifier;
    v14->_watchlistIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    sortState = v14->_sortState;
    v14->_sortState = (NSNumber *)v17;

    uint64_t v19 = [v12 copy];
    sortOrderState = v14->_sortOrderState;
    v14->_sortOrderState = (NSNumber *)v19;

    uint64_t v21 = [v13 copy];
    displayState = v14->_displayState;
    v14->_displayState = (NSNumber *)v21;
  }
  return v14;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SCWWatchlistUpdateSortStateInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  v6 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)self watchlistIdentifier];
  [v4 createOrUpdateRecordWithName:v6 recordType:@"Watchlist" modifyBlock:v5];
}

void __65__SCWWatchlistUpdateSortStateInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) sortState];
  [v7 setObject:v3 forKeyedSubscript:@"sortState"];

  id v4 = [*(id *)(a1 + 32) sortOrderState];
  [v7 setObject:v4 forKeyedSubscript:@"sortOrderState"];

  v5 = [*(id *)(a1 + 32) displayState];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) displayState];
    [v7 setObject:v6 forKeyedSubscript:@"displayState"];
  }
}

- (SCWWatchlistUpdateSortStateInWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortState"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortOrderState"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayState"];

  if (v5)
  {
    self = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)self initWithWatchlistIdentifier:v5 sortState:v6 sortOrderState:v7 displayState:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v5 forKey:@"watchlistIdentifier"];

  v6 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)self sortState];
  [v4 encodeObject:v6 forKey:@"sortState"];

  id v7 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)self sortOrderState];
  [v4 encodeObject:v7 forKey:@"sortOrderState"];

  id v8 = [(SCWWatchlistUpdateSortStateInWatchlistCommand *)self displayState];
  [v4 encodeObject:v8 forKey:@"displayState"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
}

@end