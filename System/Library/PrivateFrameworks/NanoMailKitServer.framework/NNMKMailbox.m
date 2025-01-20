@interface NNMKMailbox
+ (BOOL)supportsSecureCoding;
+ (id)generateLegacyMailboxIdWithAccountId:(id)a3 mailboxName:(id)a4;
+ (id)generateMailboxIdWithAccountId:(id)a3 mailboxName:(id)a4;
+ (id)idsFromMailboxes:(id)a3;
+ (unint64_t)defaultFilterTypes;
+ (unint64_t)messageStateForMailboxFilterType:(unint64_t)a3;
+ (unint64_t)syncedTypeFromFilterType:(unint64_t)a3;
+ (unint64_t)syncedTypeFromMailbox:(id)a3;
- (BOOL)databaseContentVerified;
- (BOOL)hasAnyFilter;
- (BOOL)hasCompoundFilters;
- (BOOL)hasFilterType:(unint64_t)a3;
- (BOOL)hasSelection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPushEnabled;
- (BOOL)isSelected;
- (BOOL)isSelectedForFilterType:(unint64_t)a3;
- (BOOL)shouldFilter;
- (BOOL)syncActive;
- (BOOL)syncEnabled;
- (BOOL)syncRequested;
- (NNMKMailbox)init;
- (NNMKMailbox)initWithCoder:(id)a3;
- (NNMKMailbox)initWithFilterType:(unint64_t)a3;
- (NSDate)lastUpdate;
- (NSDate)syncRequestedDate;
- (NSString)accountId;
- (NSString)accountLocalId;
- (NSString)customName;
- (NSString)displayName;
- (NSString)mailboxId;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)filterType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)addFilterType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeFilterType:(unint64_t)a3;
- (void)resetURL;
- (void)setAccountId:(id)a3;
- (void)setAccountLocalId:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setDatabaseContentVerified:(BOOL)a3;
- (void)setFilterType:(unint64_t)a3;
- (void)setHasSelection:(BOOL)a3;
- (void)setIsPushEnabled:(BOOL)a3;
- (void)setLastUpdate:(id)a3;
- (void)setMailboxId:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSyncActive:(BOOL)a3;
- (void)setSyncEnabled:(BOOL)a3;
- (void)setSyncRequested:(BOOL)a3;
- (void)setSyncRequestedDate:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation NNMKMailbox

+ (id)generateLegacyMailboxIdWithAccountId:(id)a3 mailboxName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@/%@", a3, a4];
}

- (NNMKMailbox)init
{
  return [(NNMKMailbox *)self initWithFilterType:0];
}

- (NNMKMailbox)initWithFilterType:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NNMKMailbox;
  v4 = [(NNMKMailbox *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_filterType = a3;
    accountId = v4->_accountId;
    v4->_accountId = 0;

    url = v5->_url;
    v5->_url = 0;

    customName = v5->_customName;
    v5->_customName = (NSString *)&stru_26F11E918;

    mailboxId = v5->_mailboxId;
    v5->_mailboxId = (NSString *)@"-1";
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NNMKMailbox);
  [(NNMKMailbox *)v4 setType:[(NNMKMailbox *)self type]];
  [(NNMKMailbox *)v4 setFilterType:[(NNMKMailbox *)self filterType]];
  v5 = [(NNMKMailbox *)self mailboxId];
  [(NNMKMailbox *)v4 setMailboxId:v5];

  v6 = [(NNMKMailbox *)self accountId];
  [(NNMKMailbox *)v4 setAccountId:v6];

  v7 = [(NNMKMailbox *)self accountLocalId];
  [(NNMKMailbox *)v4 setAccountLocalId:v7];

  v8 = [(NNMKMailbox *)self url];
  [(NNMKMailbox *)v4 setUrl:v8];

  v9 = [(NNMKMailbox *)self customName];
  [(NNMKMailbox *)v4 setCustomName:v9];

  [(NNMKMailbox *)v4 setSyncEnabled:[(NNMKMailbox *)self syncEnabled]];
  [(NNMKMailbox *)v4 setSyncRequested:[(NNMKMailbox *)self syncRequested]];
  [(NNMKMailbox *)v4 setSyncActive:[(NNMKMailbox *)self syncActive]];
  v10 = [(NNMKMailbox *)self lastUpdate];
  [(NNMKMailbox *)v4 setLastUpdate:v10];

  [(NNMKMailbox *)v4 setDatabaseContentVerified:[(NNMKMailbox *)self databaseContentVerified]];
  return v4;
}

- (void)setMailboxId:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = @"-1";
  if (v4) {
    v5 = v4;
  }
  mailboxId = self->_mailboxId;
  self->_mailboxId = &v5->isa;
}

- (void)setSelected:(BOOL)a3
{
  self->_syncEnabled = a3;
}

- (BOOL)hasSelection
{
  return self->_syncEnabled || self->_syncRequested;
}

- (BOOL)isPushEnabled
{
  return (self->_type & 0xFFFFFFFFFFFFFFF6) == 0;
}

- (BOOL)isSelected
{
  return self->_syncEnabled;
}

- (BOOL)isSelectedForFilterType:(unint64_t)a3
{
  return (self->_syncEnabled || self->_syncRequested) && [(NNMKMailbox *)self hasFilterType:a3];
}

- (BOOL)hasAnyFilter
{
  return self->_filterType != 0;
}

- (BOOL)shouldFilter
{
  unint64_t type = self->_type;
  return type == 6 || type == 0;
}

+ (id)idsFromMailboxes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "mailboxId", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKMailbox)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKMailbox *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyType"];
    v5->_unint64_t type = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFilterType"];
    v5->_filterType = [v7 unsignedIntegerValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMailboxId"];
    mailboxId = v5->_mailboxId;
    v5->_mailboxId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccountId"];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccountLocalId"];
    accountLocalId = v5->_accountLocalId;
    v5->_accountLocalId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyURL"];
    url = v5->_url;
    v5->_url = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyCustomName"];
    customName = v5->_customName;
    v5->_customName = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySyncEnabled"];
    v5->_syncEnabled = [v18 BOOLValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySyncRequested"];
    v5->_syncRequested = [v19 BOOLValue];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySyncActive"];
    v5->_syncActive = [v20 BOOLValue];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyLastUpdate"];
    lastUpdate = v5->_lastUpdate;
    v5->_lastUpdate = (NSDate *)v21;

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyNeedsDatabaseVerification"];
    v5->_databaseContentVerified = [v23 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t type = self->_type;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:type];
  [v6 encodeObject:v7 forKey:@"kNSCodingKeyType"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_filterType];
  [v6 encodeObject:v8 forKey:@"kNSCodingKeyFilterType"];

  [v6 encodeObject:self->_accountId forKey:@"kNSCodingKeyAccountId"];
  [v6 encodeObject:self->_accountLocalId forKey:@"kNSCodingKeyAccountLocalId"];
  [v6 encodeObject:self->_mailboxId forKey:@"kNSCodingKeyMailboxId"];
  [v6 encodeObject:self->_url forKey:@"kNSCodingKeyURL"];
  [v6 encodeObject:self->_customName forKey:@"kNSCodingKeyCustomName"];
  v9 = [NSNumber numberWithBool:self->_syncEnabled];
  [v6 encodeObject:v9 forKey:@"kNSCodingKeySyncEnabled"];

  uint64_t v10 = [NSNumber numberWithBool:self->_syncRequested];
  [v6 encodeObject:v10 forKey:@"kNSCodingKeySyncRequested"];

  objc_super v11 = [NSNumber numberWithBool:self->_syncActive];
  [v6 encodeObject:v11 forKey:@"kNSCodingKeySyncActive"];

  [v6 encodeObject:self->_lastUpdate forKey:@"kNSCodingKeyLastUpdate"];
  id v12 = [NSNumber numberWithBool:self->_databaseContentVerified];
  [v6 encodeObject:v12 forKey:@"kNSCodingKeyNeedsDatabaseVerification"];
}

+ (unint64_t)messageStateForMailboxFilterType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 7)
  {
    if (a3 == 2) {
      return 64;
    }
    if (a3 == 4) {
      return 8;
    }
  }
  else
  {
    switch(a3)
    {
      case 8uLL:
        return 1;
      case 0x10uLL:
        return 32;
      case 0x20uLL:
        return 128;
    }
  }
  return 0;
}

+ (id)generateMailboxIdWithAccountId:(id)a3 mailboxName:(id)a4
{
  id v5 = NSString;
  id v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 URLQueryAllowedCharacterSet];
  uint64_t v10 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  objc_super v11 = [v5 stringWithFormat:@"imap://%@/%@", v8, v10];

  return v11;
}

- (BOOL)hasFilterType:(unint64_t)a3
{
  return ([(NNMKMailbox *)self filterType] & a3) != 0;
}

- (void)addFilterType:(unint64_t)a3
{
  unint64_t v4 = [(NNMKMailbox *)self filterType] | a3;
  [(NNMKMailbox *)self setFilterType:v4];
}

- (void)removeFilterType:(unint64_t)a3
{
  if (-[NNMKMailbox hasFilterType:](self, "hasFilterType:"))
  {
    unint64_t v5 = [(NNMKMailbox *)self filterType] ^ a3;
    [(NNMKMailbox *)self setFilterType:v5];
  }
}

- (BOOL)hasCompoundFilters
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [&unk_26F131958 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(&unk_26F131958);
        }
        v5 += -[NNMKMailbox hasFilterType:](self, "hasFilterType:", [*(id *)(*((void *)&v9 + 1) + 8 * v7) unsignedIntegerValue]);
        if (v5 > 1)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v3 = [&unk_26F131958 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (uint64_t v5 = [v4 type], v5 == -[NNMKMailbox type](self, "type"))
    && (uint64_t v6 = [v4 filterType], v6 == -[NNMKMailbox filterType](self, "filterType")))
  {
    uint64_t v7 = [v4 mailboxId];
    id v8 = [(NNMKMailbox *)self mailboxId];
    if ([v7 isEqualToString:v8])
    {
      long long v9 = [v4 customName];
      long long v10 = [(NNMKMailbox *)self customName];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(NNMKMailbox *)self mailboxId];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Mailbox Id: %@, Type: %lu, Filter: %lu, Account: %@, URL: %@, Name: %@, Enabled: %lu, Active: %lu, Requested: %lu", self->_mailboxId, self->_type, self->_filterType, self->_accountId, self->_url, self->_customName, self->_syncEnabled, self->_syncActive, self->_syncRequested];
}

+ (unint64_t)syncedTypeFromMailbox:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 url];

  if (v5)
  {
    uint64_t v6 = [v4 type];

    if (v6 == 1) {
      return 100;
    }
    else {
      return 200;
    }
  }
  else
  {
    uint64_t v8 = [v4 filterType];

    return [a1 syncedTypeFromFilterType:v8];
  }
}

+ (unint64_t)syncedTypeFromFilterType:(unint64_t)a3
{
  unint64_t result = a3;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        return 5;
      case 0x20uLL:
        return 6;
      case 0x40uLL:
        return 7;
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        unint64_t result = 1;
        break;
      case 2uLL:
        return result;
      case 4uLL:
        unint64_t result = 3;
        break;
      case 8uLL:
        unint64_t result = 4;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (unint64_t)defaultFilterTypes
{
  return 31;
}

- (void)resetURL
{
  self->_url = 0;
  MEMORY[0x270F9A758]();
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(unint64_t)a3
{
  self->_filterType = a3;
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)accountLocalId
{
  return self->_accountLocalId;
}

- (void)setAccountLocalId:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)customName
{
  return self->_customName;
}

- (void)setCustomName:(id)a3
{
}

- (NSDate)syncRequestedDate
{
  return self->_syncRequestedDate;
}

- (void)setSyncRequestedDate:(id)a3
{
}

- (BOOL)syncRequested
{
  return self->_syncRequested;
}

- (void)setSyncRequested:(BOOL)a3
{
  self->_syncRequested = a3;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (void)setSyncEnabled:(BOOL)a3
{
  self->_syncEnabled = a3;
}

- (BOOL)syncActive
{
  return self->_syncActive;
}

- (void)setSyncActive:(BOOL)a3
{
  self->_syncActive = a3;
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
}

- (void)setHasSelection:(BOOL)a3
{
  self->_hasSelection = a3;
}

- (void)setIsPushEnabled:(BOOL)a3
{
  self->_isPushEnabled = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)databaseContentVerified
{
  return self->_databaseContentVerified;
}

- (void)setDatabaseContentVerified:(BOOL)a3
{
  self->_databaseContentVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_syncRequestedDate, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_accountLocalId, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "NNMKMailbox entity is unable to decode some of the fields (possible Message.framework API changes): %{public}@", buf, 0xCu);
}

@end