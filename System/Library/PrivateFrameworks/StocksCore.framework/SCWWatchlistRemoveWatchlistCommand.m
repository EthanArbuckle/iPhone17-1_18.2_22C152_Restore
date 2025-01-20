@interface SCWWatchlistRemoveWatchlistCommand
+ (BOOL)supportsSecureCoding;
- (NSString)watchlistIdentifier;
- (SCWWatchlistRemoveWatchlistCommand)initWithCoder:(id)a3;
- (SCWWatchlistRemoveWatchlistCommand)initWithWatchlistIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCWWatchlistRemoveWatchlistCommand

- (SCWWatchlistRemoveWatchlistCommand)initWithWatchlistIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistRemoveWatchlistCommand;
  v5 = [(SCWWatchlistRemoveWatchlistCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    watchlistIdentifier = v5->_watchlistIdentifier;
    v5->_watchlistIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)executeWithZone:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWWatchlistRemoveWatchlistCommand *)self watchlistIdentifier];
  [v4 deleteRecordWithName:v5];
}

- (SCWWatchlistRemoveWatchlistCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"watchlistIdentifier"];

  if (v5)
  {
    self = [(SCWWatchlistRemoveWatchlistCommand *)self initWithWatchlistIdentifier:v5];
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
  id v5 = [(SCWWatchlistRemoveWatchlistCommand *)self watchlistIdentifier];
  [v4 encodeObject:v5 forKey:@"watchlistIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
}

@end