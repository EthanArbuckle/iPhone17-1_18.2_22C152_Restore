@interface SCWWatchlistRenameWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSString)updatedName;
- (NSString)watchlistIdentifier;
- (SCWWatchlistRenameWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistRenameWatchlistCommand)initWithWatchlistIdentifier:(id)a3 updatedName:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistRenameWatchlistCommand

- (SCWWatchlistRenameWatchlistCommand)initWithWatchlistIdentifier:(id)a3 updatedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWWatchlistRenameWatchlistCommand;
  v8 = [(SCWWatchlistRenameWatchlistCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    updatedName = v8->_updatedName;
    v8->_updatedName = (NSString *)v11;
  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SCWWatchlistRenameWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5FA38A8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  id v6 = [(SCWWatchlistRenameWatchlistCommand *)self watchlistIdentifier];
  [v4 createOrUpdateRecordWithName:v6 recordType:@"Watchlist" modifyBlock:v5];
}

void __54__SCWWatchlistRenameWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 updatedName];
  id v4 = [v3 encryptedValues];

  [v4 setObject:v5 forKeyedSubscript:@"name"];
}

- (SCWWatchlistRenameWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];

  if (v5)
  {
    self = [(SCWWatchlistRenameWatchlistCommand *)self initWithWatchlistIdentifier:v5 updatedName:v6];
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
  id v5 = [(SCWWatchlistRenameWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v5 forKey:@"watchlistIdentifier"];

  id v6 = [(SCWWatchlistRenameWatchlistCommand *)self updatedName];
  [v4 encodeObject:v6 forKey:@"name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedName, 0);

  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end