@interface WLSourceDeviceAccount
+ (BOOL)accountInfoArrayContainsNonSyncableAccount:(id)a3;
+ (BOOL)accountInfoRepresentsSyncableAccount:(id)a3;
+ (WLSourceDeviceAccount)accountWithInfo:(id)a3;
- (NSString)identifier;
- (WLSourceDeviceAccount)initWithInfo:(id)a3;
- (unint64_t)sqlID;
- (void)setIdentifier:(id)a3;
- (void)setSqlID:(unint64_t)a3;
@end

@implementation WLSourceDeviceAccount

+ (WLSourceDeviceAccount)accountWithInfo:(id)a3
{
  id v3 = a3;
  v4 = [[WLSourceDeviceAccount alloc] initWithInfo:v3];

  return v4;
}

- (WLSourceDeviceAccount)initWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [(WLSourceDeviceAccount *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"itemID"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)accountInfoArrayContainsNonSyncableAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", @"itemID", (void)v12);
        char v9 = [v8 isEqualToString:@"__local"];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)accountInfoRepresentsSyncableAccount:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"itemID"];
  char v4 = [v3 isEqualToString:@"__all"];

  return v4;
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end