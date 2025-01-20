@interface RPRemoteDisplayPerson
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)discoveredDevices;
- (NSString)accountAltDSID;
- (NSString)accountID;
- (NSString)contactID;
- (RPRemoteDisplayPerson)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)initPersonWithDevice:(id)a3;
- (unsigned)flags;
- (void)addDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeDevice:(id)a3;
@end

@implementation RPRemoteDisplayPerson

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPRemoteDisplayPerson;
  v5 = [(RPRemoteDisplayPerson *)&v11 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_flags = v12;
    }
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  accountAltDSID = self->_accountAltDSID;
  id v10 = v4;
  if (accountAltDSID)
  {
    [v4 encodeObject:accountAltDSID forKey:@"_altDSID"];
    id v4 = v10;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    [v10 encodeObject:accountID forKey:@"_aID"];
    id v4 = v10;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    [v10 encodeObject:contactID forKey:@"_cnID"];
    id v4 = v10;
  }
  discoveredDevices = self->_discoveredDevices;
  if (discoveredDevices)
  {
    [v10 encodeObject:discoveredDevices forKey:@"_dv"];
    id v4 = v10;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v10 encodeInt64:flags forKey:@"_fl"];
    id v4 = v10;
  }
}

- (id)description
{
  return [(RPRemoteDisplayPerson *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 <= 49) {
    uint64_t v4 = 100;
  }
  else {
    uint64_t v4 = 8;
  }
  accountID = self->_accountID;
  NSAppendPrintF();
  id v5 = 0;
  id v6 = v5;
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
  {
    v16 = v5;
    accountID = accountAltDSID;
    NSAppendPrintF();
    id v8 = v16;

    id v6 = v8;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    accountID = (NSString *)v4;
    v15 = contactID;
    NSAppendPrintF();
    id v10 = v6;

    id v6 = v10;
  }
  if ([(NSMutableArray *)self->_discoveredDevices count])
  {
    NSAppendPrintF();
    id v11 = v6;

    id v6 = v11;
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    id v12 = v6;

    id v6 = v12;
  }
  return v6;
}

- (id)initPersonWithDevice:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RPRemoteDisplayPerson;
  id v5 = [(RPRemoteDisplayPerson *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 accountAltDSID];
    accountAltDSID = v5->_accountAltDSID;
    v5->_accountAltDSID = (NSString *)v6;

    uint64_t v8 = [v4 accountID];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    uint64_t v10 = [v4 contactID];
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

    uint64_t v12 = objc_opt_new();
    discoveredDevices = v5->_discoveredDevices;
    v5->_discoveredDevices = (NSMutableArray *)v12;

    [(NSMutableArray *)v5->_discoveredDevices addObject:v4];
    if (([v4 statusFlags] & 0x80000) != 0)
    {
      int v14 = 1;
    }
    else
    {
      if (([v4 statusFlags] & 0x1000000000) == 0)
      {
LABEL_7:
        v15 = v5;
        goto LABEL_8;
      }
      int v14 = 2;
    }
    v5->_flags |= v14;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)addDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = v5->_discoveredDevices;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "isEqualToDevice:", v4, (void)v13))
        {

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  discoveredDevices = v5->_discoveredDevices;
  if (!discoveredDevices)
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = v5->_discoveredDevices;
    v5->_discoveredDevices = (NSMutableArray *)v11;

    discoveredDevices = v5->_discoveredDevices;
  }
  -[NSMutableArray addObject:](discoveredDevices, "addObject:", v4, (void)v13);
LABEL_13:
  objc_sync_exit(v5);
}

- (void)removeDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = v5->_discoveredDevices;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqualToDevice:", v4, (void)v12))
        {
          id v11 = v10;

          if (v11) {
            [(NSMutableArray *)v5->_discoveredDevices removeObject:v11];
          }
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0;
LABEL_12:
  objc_sync_exit(v5);
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSMutableArray)discoveredDevices
{
  return self->_discoveredDevices;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
}

@end