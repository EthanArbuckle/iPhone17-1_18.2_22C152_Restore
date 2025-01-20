@interface PDCloudStoreTokenRecordFetchConfiguration
- (BOOL)hasCloudStoreZones;
- (BOOL)hasContainerDatabase;
- (BOOL)ignoreChangesMadeByThisDevice;
- (BOOL)shouldSaveToken;
- (BOOL)useStoredChangeToken;
- (NSDate)ignoreRecordsAfterDate;
- (NSDate)ignoreRecordsBeforeDate;
- (NSSet)cloudStoreZonesAndChangeTokens;
- (PDCloudStoreContainerDatabase)containerDatabase;
- (id)description;
- (int64_t)batchLimit;
- (void)setBatchLimit:(int64_t)a3;
- (void)setCloudStoreZonesAndChangeTokens:(id)a3;
- (void)setContainerDatabase:(id)a3;
- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3;
- (void)setIgnoreRecordsAfterDate:(id)a3;
- (void)setIgnoreRecordsBeforeDate:(id)a3;
- (void)setShouldSaveToken:(BOOL)a3;
- (void)setUseStoredChangeToken:(BOOL)a3;
@end

@implementation PDCloudStoreTokenRecordFetchConfiguration

- (BOOL)hasCloudStoreZones
{
  if (![(NSSet *)self->_cloudStoreZonesAndChangeTokens count]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_cloudStoreZonesAndChangeTokens;
  id v4 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cloudStoreZone", (void)v11);

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      id v5 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)hasContainerDatabase
{
  return self->_containerDatabase != 0;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  if (self->_useStoredChangeToken) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  [v3 appendFormat:@"useStoredChangeToken: '%@'; ", v4];
  if (self->_shouldSaveToken) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"shouldSaveToken: '%@'; ", v5];
  [v3 appendFormat:@"containerDatabase: '%@'; ", self->_containerDatabase];
  objc_msgSend(v3, "appendFormat:", @"cloudStoreZonesAndChangeTokens: '%@'; ",
    self->_cloudStoreZonesAndChangeTokens);
  [v3 appendFormat:@"ignoreRecordsAfterDate: '%@'; ", self->_ignoreRecordsAfterDate];
  [v3 appendFormat:@"ignoreRecordsBeforeDate: '%@'; ", self->_ignoreRecordsBeforeDate];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)useStoredChangeToken
{
  return self->_useStoredChangeToken;
}

- (void)setUseStoredChangeToken:(BOOL)a3
{
  self->_useStoredChangeToken = a3;
}

- (BOOL)shouldSaveToken
{
  return self->_shouldSaveToken;
}

- (void)setShouldSaveToken:(BOOL)a3
{
  self->_shouldSaveToken = a3;
}

- (BOOL)ignoreChangesMadeByThisDevice
{
  return self->_ignoreChangesMadeByThisDevice;
}

- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3
{
  self->_ignoreChangesMadeByThisDevice = a3;
}

- (int64_t)batchLimit
{
  return self->_batchLimit;
}

- (void)setBatchLimit:(int64_t)a3
{
  self->_batchLimit = a3;
}

- (NSSet)cloudStoreZonesAndChangeTokens
{
  return self->_cloudStoreZonesAndChangeTokens;
}

- (void)setCloudStoreZonesAndChangeTokens:(id)a3
{
}

- (PDCloudStoreContainerDatabase)containerDatabase
{
  return self->_containerDatabase;
}

- (void)setContainerDatabase:(id)a3
{
}

- (NSDate)ignoreRecordsBeforeDate
{
  return self->_ignoreRecordsBeforeDate;
}

- (void)setIgnoreRecordsBeforeDate:(id)a3
{
}

- (NSDate)ignoreRecordsAfterDate
{
  return self->_ignoreRecordsAfterDate;
}

- (void)setIgnoreRecordsAfterDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreRecordsAfterDate, 0);
  objc_storeStrong((id *)&self->_ignoreRecordsBeforeDate, 0);
  objc_storeStrong((id *)&self->_containerDatabase, 0);
  objc_storeStrong((id *)&self->_cloudStoreZonesAndChangeTokens, 0);
}

@end