@interface ICDelegationNetServiceTXTRecord
- (BOOL)isEqual:(id)a3;
- (ICDelegationNetServiceTXTRecord)initWithTXTRecordData:(id)a3;
- (NSArray)delegationAccountUUIDs;
- (NSData)TXTRecordData;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)securityMode;
- (int64_t)serviceVersion;
- (unint64_t)hash;
- (void)setDelegationAccountUUIDs:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setSecurityMode:(int64_t)a3;
- (void)setServiceVersion:(int64_t)a3;
@end

@implementation ICDelegationNetServiceTXTRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_delegationAccountUUIDs, 0);
}

- (void)setServiceVersion:(int64_t)a3
{
  self->_serviceVersion = a3;
}

- (int64_t)serviceVersion
{
  return self->_serviceVersion;
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_securityMode = a3;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDelegationAccountUUIDs:(id)a3
{
}

- (NSArray)delegationAccountUUIDs
{
  return self->_delegationAccountUUIDs;
}

- (NSData)TXTRecordData
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [@"1" dataUsingEncoding:4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_delegationAccountUUIDs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [@"AUUID-" stringByAppendingString:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        [v3 setObject:v4 forKey:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }

  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%li", self->_serviceVersion);
  v12 = [v11 dataUsingEncoding:4];
  [v3 setObject:v12 forKey:@"ServiceVersion"];

  unint64_t securityMode = self->_securityMode;
  if (securityMode)
  {
    if (securityMode >= 5) {
      unint64_t securityMode = 0;
    }
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%li", securityMode);
    v15 = [v14 dataUsingEncoding:4];
    if (v15) {
      [v3 setObject:v15 forKey:@"SecurityMode"];
    }
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    v17 = [(NSString *)deviceName dataUsingEncoding:4];
    [v3 setObject:v17 forKey:@"DeviceName"];
  }
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = self;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - TXTRecord dictionary for data encoding: %{public}@", buf, 0x16u);
  }

  v19 = [MEMORY[0x1E4F18D60] dataFromTXTRecordDictionary:v3];

  return (NSData *)v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_delegationAccountUUIDs);
    objc_storeStrong((id *)(v5 + 16), self->_deviceName);
    *(void *)(v5 + 32) = self->_serviceVersion;
    *(void *)(v5 + 24) = self->_securityMode;
  }
  return (id)v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_delegationAccountUUIDs) {
    [NSString stringWithFormat:@"Delegation UUIDs: %@", self->_delegationAccountUUIDs];
  }
  else {
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Delegation UUIDs: Missing", v11);
  }
  [v3 addObject:v4];

  if (self->_deviceName) {
    [NSString stringWithFormat:@"Device name: %@", self->_deviceName];
  }
  else {
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Device name: Uknonwn", v12);
  }
  [v3 addObject:v5];

  uint64_t v6 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)ICDelegationNetServiceTXTRecord;
  uint64_t v7 = [(ICDelegationNetServiceTXTRecord *)&v13 description];
  uint64_t v8 = [v3 componentsJoinedByString:@"; "];
  v9 = [v6 stringWithFormat:@"%@ [%@]", v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICDelegationNetServiceTXTRecord *)a3;
  if (v4 == self) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_serviceVersion != v4->_serviceVersion) {
    goto LABEL_13;
  }
  delegationAccountUUIDs = self->_delegationAccountUUIDs;
  uint64_t v6 = v4->_delegationAccountUUIDs;
  if (delegationAccountUUIDs != v6)
  {
    char v7 = 0;
    if (!delegationAccountUUIDs || !v6) {
      goto LABEL_15;
    }
    if (!-[NSArray isEqualToArray:](delegationAccountUUIDs, "isEqualToArray:")) {
      goto LABEL_13;
    }
  }
  if (self->_securityMode != v4->_securityMode)
  {
LABEL_13:
    char v7 = 0;
    goto LABEL_15;
  }
  deviceName = self->_deviceName;
  v9 = v4->_deviceName;
  if (deviceName == v9)
  {
LABEL_14:
    char v7 = 1;
    goto LABEL_15;
  }
  char v7 = 0;
  if (deviceName && v9) {
    char v7 = -[NSString isEqualToString:](deviceName, "isEqualToString:");
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_delegationAccountUUIDs hash];
  int64_t securityMode = self->_securityMode;
  int64_t serviceVersion = self->_serviceVersion;
  return v3 ^ serviceVersion ^ securityMode ^ ~[(NSString *)self->_deviceName hash];
}

- (ICDelegationNetServiceTXTRecord)initWithTXTRecordData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICDelegationNetServiceTXTRecord *)self init];
  if (v5)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__31841;
    long long v23 = __Block_byref_object_dispose__31842;
    id v24 = 0;
    uint64_t v6 = [MEMORY[0x1E4F18D60] dictionaryFromTXTRecordData:v4];
    char v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v5;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - TXTRecord dictionary from data decoding: %{public}@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__ICDelegationNetServiceTXTRecord_initWithTXTRecordData___block_invoke;
    v18[3] = &unk_1E5ACB340;
    v18[4] = &v19;
    [v6 enumerateKeysAndObjectsUsingBlock:v18];
    objc_storeStrong((id *)&v5->_delegationAccountUUIDs, (id)v20[5]);
    uint64_t v8 = [v6 objectForKey:@"ServiceVersion"];
    if ([v8 length]) {
      v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    }
    else {
      v9 = 0;
    }
    v5->_int64_t serviceVersion = [v9 integerValue];
    v10 = [v6 objectForKey:@"SecurityMode"];
    if ([v10 length]) {
      uint64_t v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v11 integerValue];
    if ((unint64_t)(v12 - 1) >= 4) {
      int64_t v13 = 0;
    }
    else {
      int64_t v13 = v12;
    }
    v5->_int64_t securityMode = v13;
    v14 = [v6 objectForKey:@"DeviceName"];
    if ([v14 length])
    {
      uint64_t v15 = [[NSString alloc] initWithData:v14 encoding:4];
      deviceName = v5->_deviceName;
      v5->_deviceName = (NSString *)v15;
    }
    else
    {
      deviceName = v5->_deviceName;
      v5->_deviceName = 0;
    }

    _Block_object_dispose(&v19, 8);
  }

  return v5;
}

void __57__ICDelegationNetServiceTXTRecord_initWithTXTRecordData___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (![v10 rangeOfString:@"AUUID-"])
  {
    uint64_t v4 = v3;
    if (v3 == [@"AUUID-" length])
    {
      uint64_t v5 = [v10 substringFromIndex:v4];
      if ([v5 length])
      {
        uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        if (!v6)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
          v9 = *(void **)(v8 + 40);
          *(void *)(v8 + 40) = v7;

          uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        }
        [v6 addObject:v5];
      }
    }
  }
}

@end