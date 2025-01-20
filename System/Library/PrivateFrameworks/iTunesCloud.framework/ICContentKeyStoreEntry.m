@interface ICContentKeyStoreEntry
- (ICContentKeyStoreEntry)initWithDictionaryRepresentation:(id)a3;
- (ICContentKeyStoreEntry)initWithIdentifier:(id)a3;
- (NSData)keyData;
- (NSDate)renewalDate;
- (NSNumber)accountDSID;
- (NSNumber)adamID;
- (NSString)identifier;
- (id)dictionaryRepresentation;
- (int64_t)keyServerProtocolType;
- (unint64_t)failureCount;
- (void)setAccountDSID:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setFailureCount:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyServerProtocolType:(int64_t)a3;
- (void)setRenewalDate:(id)a3;
@end

@implementation ICContentKeyStoreEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_keyData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setKeyServerProtocolType:(int64_t)a3
{
  self->_keyServerProtocolType = a3;
}

- (int64_t)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (void)setAdamID:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAccountDSID:(id)a3
{
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setFailureCount:(unint64_t)a3
{
  self->_failureCount = a3;
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (void)setRenewalDate:(id)a3
{
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setKeyData:(id)a3
{
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKeyedSubscript:@"key"];
  }
  renewalDate = self->_renewalDate;
  if (renewalDate)
  {
    v6 = NSNumber;
    [(NSDate *)renewalDate timeIntervalSinceReferenceDate];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"renewalDate"];
  }
  v8 = [NSNumber numberWithUnsignedInteger:self->_failureCount];
  [v3 setObject:v8 forKeyedSubscript:@"failureCount"];

  [v3 setObject:self->_accountDSID forKeyedSubscript:@"dsid"];
  [v3 setObject:self->_adamID forKeyedSubscript:@"adamID"];
  v9 = [NSNumber numberWithInteger:self->_keyServerProtocolType];
  [v3 setObject:v9 forKeyedSubscript:@"keyServerProtocolType"];

  v10 = (void *)[v3 copy];

  return v10;
}

- (ICContentKeyStoreEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  v6 = [(ICContentKeyStoreEntry *)self initWithIdentifier:v5];

  if (v6)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"key"];
    keyData = v6->_keyData;
    v6->_keyData = (NSData *)v7;

    v9 = (void *)MEMORY[0x1E4F1C9C8];
    v10 = [v4 objectForKeyedSubscript:@"renewalDate"];
    [v10 doubleValue];
    uint64_t v11 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    renewalDate = v6->_renewalDate;
    v6->_renewalDate = (NSDate *)v11;

    v13 = [v4 objectForKeyedSubscript:@"failureCount"];
    v6->_failureCount = [v13 unsignedIntValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"dsid"];
    accountDSID = v6->_accountDSID;
    v6->_accountDSID = (NSNumber *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"adamID"];
    adamID = v6->_adamID;
    v6->_adamID = (NSNumber *)v16;

    v18 = [v4 objectForKeyedSubscript:@"keyServerProtocolType"];
    v6->_keyServerProtocolType = [v18 integerValue];
  }
  return v6;
}

- (ICContentKeyStoreEntry)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICContentKeyStoreEntry;
  v6 = [(ICContentKeyStoreEntry *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

@end