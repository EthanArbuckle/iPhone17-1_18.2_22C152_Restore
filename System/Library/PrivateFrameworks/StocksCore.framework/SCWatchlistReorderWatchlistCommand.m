@interface SCWatchlistReorderWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSString)precedingWatchlistIdentifier;
- (NSString)watchlistIdentifier;
- (SCWatchlistReorderWatchlistCommand)initWithCoder:(id)a3;
- (SCWatchlistReorderWatchlistCommand)initWithWatchlistIdentifier:(id)a3 precedingWatchlistIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWatchlistReorderWatchlistCommand

- (SCWatchlistReorderWatchlistCommand)initWithWatchlistIdentifier:(id)a3 precedingWatchlistIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWatchlistReorderWatchlistCommand;
  v8 = [(SCWatchlistReorderWatchlistCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    precedingWatchlistIdentifier = v8->_precedingWatchlistIdentifier;
    v8->_precedingWatchlistIdentifier = (NSString *)v11;
  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SCWatchlistReorderWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v3 = a3;
  v4 = _Block_copy(aBlock);
  [v3 createOrUpdateRecordWithName:@"watchlistorder" recordType:@"WatchlistOrder" modifyBlock:v4];
}

void __54__SCWatchlistReorderWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1CA70];
  id v29 = v3;
  v5 = [v3 encryptedValues];
  id v6 = [v5 objectForKeyedSubscript:@"watchlistIDs"];
  id v7 = [v4 orderedSetWithArray:v6];

  v8 = [*(id *)(a1 + 32) watchlistIdentifier];
  uint64_t v9 = [*(id *)(a1 + 32) precedingWatchlistIdentifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [*(id *)(a1 + 32) watchlistIdentifier];
    int v12 = [v7 containsObject:v11];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) precedingWatchlistIdentifier];
      if (!v13
        || (objc_super v14 = (void *)v13,
            [*(id *)(a1 + 32) precedingWatchlistIdentifier],
            v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v7 containsObject:v15],
            v15,
            v14,
            v16))
      {
        v17 = [*(id *)(a1 + 32) precedingWatchlistIdentifier];

        v18 = *(void **)(a1 + 32);
        if (v17)
        {
          v19 = [v18 precedingWatchlistIdentifier];
          uint64_t v20 = [v7 indexOfObject:v19];

          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_10:
            v27 = [v7 array];
            v28 = [v29 encryptedValues];
            [v28 setObject:v27 forKeyedSubscript:@"watchlistIDs"];

            goto LABEL_11;
          }
          v21 = [*(id *)(a1 + 32) watchlistIdentifier];
          [v7 removeObject:v21];

          v22 = [*(id *)(a1 + 32) watchlistIdentifier];
          v23 = v7;
          v24 = v22;
          uint64_t v25 = v20;
        }
        else
        {
          v26 = [v18 watchlistIdentifier];
          [v7 removeObject:v26];

          v22 = [*(id *)(a1 + 32) watchlistIdentifier];
          v23 = v7;
          v24 = v22;
          uint64_t v25 = 0;
        }
        [v23 insertObject:v24 atIndex:v25];

        goto LABEL_10;
      }
    }
  }
LABEL_11:
}

- (SCWatchlistReorderWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"precedingWatchlistIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];

  if (v6)
  {
    self = [(SCWatchlistReorderWatchlistCommand *)self initWithWatchlistIdentifier:v6 precedingWatchlistIdentifier:v5];
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
  v5 = [(SCWatchlistReorderWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v5 forKey:@"watchlistIdentifier"];

  id v6 = [(SCWatchlistReorderWatchlistCommand *)self precedingWatchlistIdentifier];
  [v4 encodeObject:v6 forKey:@"precedingWatchlistIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSString)precedingWatchlistIdentifier
{
  return self->_precedingWatchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precedingWatchlistIdentifier, 0);

  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end