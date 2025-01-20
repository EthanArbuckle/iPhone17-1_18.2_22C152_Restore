@interface ICURLBagLibraryDAAPConfiguration
- (BOOL)isOnlineGeniusForMatchEnabled;
- (ICURLBagLibraryDAAPConfiguration)initWithBagLibraryDAAPDictionary:(id)a3;
- (NSString)baseURL;
- (NSString)databaseName;
- (id)description;
- (int64_t)autoUpdatePollingFrequencySeconds;
- (int64_t)databaseID;
- (int64_t)playDataBatchIntervalInMinutes;
- (int64_t)subscribedContainerPollingFrequencySeconds;
- (int64_t)updatePollingFrequencySeconds;
- (unint64_t)maxSyncRetryIntervalSeconds;
@end

@implementation ICURLBagLibraryDAAPConfiguration

- (void).cxx_destruct
{
}

- (unint64_t)maxSyncRetryIntervalSeconds
{
  return [(NSDictionary *)self->_bagDictionary ic_uintValueForKey:@"max-sync-retry-interval-secs"];
}

- (int64_t)autoUpdatePollingFrequencySeconds
{
  return [(NSDictionary *)self->_bagDictionary ic_intValueForKey:@"auto-update-polling-frequency-secs"];
}

- (int64_t)updatePollingFrequencySeconds
{
  return [(NSDictionary *)self->_bagDictionary ic_intValueForKey:@"update-polling-frequency-secs"];
}

- (int64_t)subscribedContainerPollingFrequencySeconds
{
  return [(NSDictionary *)self->_bagDictionary ic_intValueForKey:@"subscribed-container-polling-frequency-secs"];
}

- (int64_t)playDataBatchIntervalInMinutes
{
  return [(NSDictionary *)self->_bagDictionary ic_intValueForKey:@"play-data-batch-interval-in-minutes"];
}

- (BOOL)isOnlineGeniusForMatchEnabled
{
  return [(NSDictionary *)self->_bagDictionary ic_BOOLValueForKey:@"is-online-genius-for-match-enabled"];
}

- (NSString)baseURL
{
  return (NSString *)[(NSDictionary *)self->_bagDictionary ic_stringValueForKey:@"base-url"];
}

- (NSString)databaseName
{
  return (NSString *)[(NSDictionary *)self->_bagDictionary ic_stringValueForKey:@"database-name"];
}

- (int64_t)databaseID
{
  return [(NSDictionary *)self->_bagDictionary ic_intValueForKey:@"database-id"];
}

- (id)description
{
  return [(NSDictionary *)self->_bagDictionary description];
}

- (ICURLBagLibraryDAAPConfiguration)initWithBagLibraryDAAPDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICURLBagLibraryDAAPConfiguration;
  v6 = [(ICURLBagLibraryDAAPConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bagDictionary, a3);
  }

  return v7;
}

@end