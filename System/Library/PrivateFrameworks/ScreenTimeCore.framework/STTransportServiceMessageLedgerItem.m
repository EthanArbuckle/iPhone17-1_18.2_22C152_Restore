@interface STTransportServiceMessageLedgerItem
+ (BOOL)supportsSecureCoding;
+ (id)_descriptionForStatusesByAddress:(id)a3;
+ (id)_partialMessageAddressesFromMessageAddresses:(id)a3;
- (BOOL)containsStatusWithState:(int64_t)a3;
- (BOOL)deliveredToAllAddresses;
- (BOOL)expired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransportMessageLedgerItem:(id)a3;
- (NSDate)creationDate;
- (NSDictionary)statusesByAddress;
- (STMessageTransportMessage)message;
- (STTransportServiceMessageLedgerItem)initWithCoder:(id)a3;
- (STTransportServiceMessageLedgerItem)initWithMessage:(id)a3 addresses:(id)a4;
- (STTransportServiceMessageLedgerItem)initWithMessage:(id)a3 statusesByAddress:(id)a4;
- (STTransportServiceMessageLedgerItem)itemWithUpdatedStatusForAddresses:(id)a3 usingBlock:(id)a4;
- (STTransportServiceMessageLedgerItem)itemWithUpdatedStatusUsingBlock:(id)a3;
- (id)_initWithMessage:(id)a3 statusesByAddress:(id)a4 creationDate:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STTransportServiceMessageLedgerItem

- (STTransportServiceMessageLedgerItem)initWithMessage:(id)a3 addresses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
        v15 = objc_opt_new();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14, (void)v18);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v16 = [(STTransportServiceMessageLedgerItem *)self initWithMessage:v6 statusesByAddress:v8];
  return v16;
}

- (STTransportServiceMessageLedgerItem)initWithMessage:(id)a3 statusesByAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDate now];
  id v9 = [(STTransportServiceMessageLedgerItem *)self _initWithMessage:v7 statusesByAddress:v6 creationDate:v8];

  return v9;
}

- (id)_initWithMessage:(id)a3 statusesByAddress:(id)a4 creationDate:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)STTransportServiceMessageLedgerItem;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(STTransportServiceMessageLedgerItem *)&v18 init];
  id v11 = (STMessageTransportMessage *)objc_msgSend(v9, "copy", v18.receiver, v18.super_class);

  message = v10->_message;
  v10->_message = v11;

  v13 = (NSDictionary *)[v8 copy];
  statusesByAddress = v10->_statusesByAddress;
  v10->_statusesByAddress = v13;

  v15 = (NSDate *)[v7 copy];
  creationDate = v10->_creationDate;
  v10->_creationDate = v15;

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STTransportServiceMessageLedgerItem *)self message];
  v5 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
  id v6 = +[STTransportServiceMessageLedgerItem _descriptionForStatusesByAddress:v5];
  id v7 = [(STTransportServiceMessageLedgerItem *)self creationDate];
  id v8 = +[NSString stringWithFormat:@"<%@: %p { Message: %@, Status: %@, Created: %@ }>", v3, self, v4, v6, v7];

  return v8;
}

+ (id)_descriptionForStatusesByAddress:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100091CC0;
  v6[3] = &unk_1002FE710;
  id v4 = (id)objc_opt_new();
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (STTransportServiceMessageLedgerItem)itemWithUpdatedStatusUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
  id v6 = [v5 allKeys];
  id v7 = +[NSSet setWithArray:v6];
  id v8 = [(STTransportServiceMessageLedgerItem *)self itemWithUpdatedStatusForAddresses:v7 usingBlock:v4];

  return (STTransportServiceMessageLedgerItem *)v8;
}

- (STTransportServiceMessageLedgerItem)itemWithUpdatedStatusForAddresses:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STTransportServiceMessageLedgerItem _partialMessageAddressesFromMessageAddresses:v6];
  id v9 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
  long long v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  long long v21 = sub_100091F28;
  v22 = &unk_1002FE738;
  id v23 = v6;
  id v24 = v8;
  id v25 = [v9 mutableCopy];
  id v26 = v7;
  id v10 = v25;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:&v19];
  uint64_t v14 = [STTransportServiceMessageLedgerItem alloc];
  v15 = [(STTransportServiceMessageLedgerItem *)self message];
  v16 = [(STTransportServiceMessageLedgerItem *)self creationDate];
  id v17 = [(STTransportServiceMessageLedgerItem *)v14 _initWithMessage:v15 statusesByAddress:v10 creationDate:v16];

  return (STTransportServiceMessageLedgerItem *)v17;
}

+ (id)_partialMessageAddressesFromMessageAddresses:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000920D8;
  v7[3] = &unk_1002FE760;
  id v8 = (id)objc_opt_new();
  id v4 = v8;
  [v3 enumerateObjectsUsingBlock:v7];

  id v5 = [v4 copy];
  return v5;
}

- (BOOL)deliveredToAllAddresses
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100092208;
  v4[3] = &unk_1002FE788;
  v4[4] = &v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (BOOL)expired
{
  id v3 = +[NSDate now];
  id v4 = [(STTransportServiceMessageLedgerItem *)self creationDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6 >= 2592000.0;
}

- (BOOL)containsStatusWithState:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
  double v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) state] == (id)a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (STTransportServiceMessageLedgerItem)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"statusesByAddress"];

  [v4 decodeDoubleForKey:@"creationDate"];
  double v11 = v10;

  if (v11 == 0.0) {
    +[NSDate now];
  }
  else {
  long long v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v11];
  }
  long long v13 = [(STTransportServiceMessageLedgerItem *)self _initWithMessage:v5 statusesByAddress:v9 creationDate:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  message = self->_message;
  id v5 = a3;
  [v5 encodeObject:message forKey:@"message"];
  [v5 encodeObject:self->_statusesByAddress forKey:@"statusesByAddress"];
  [(NSDate *)self->_creationDate timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"creationDate");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  creationDate = self->_creationDate;
  statusesByAddress = self->_statusesByAddress;
  message = self->_message;
  return [v4 _initWithMessage:message statusesByAddress:statusesByAddress creationDate:creationDate];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STTransportServiceMessageLedgerItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STTransportServiceMessageLedgerItem *)self isEqualToTransportMessageLedgerItem:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToTransportMessageLedgerItem:(id)a3
{
  id v4 = (STTransportServiceMessageLedgerItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    BOOL v5 = [(STTransportServiceMessageLedgerItem *)self message];
    uint64_t v6 = [(STTransportServiceMessageLedgerItem *)v4 message];
    if ([v5 isEqualToMessage:v6])
    {
      uint64_t v7 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
      uint64_t v8 = [(STTransportServiceMessageLedgerItem *)v4 statusesByAddress];
      if ([v7 isEqualToDictionary:v8])
      {
        id v9 = [(STTransportServiceMessageLedgerItem *)self creationDate];
        double v10 = [(STTransportServiceMessageLedgerItem *)v4 creationDate];
        unsigned __int8 v11 = [v9 isEqualToDate:v10];
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  return v11;
}

- (unint64_t)hash
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v14 = 0;
  id v3 = [(STTransportServiceMessageLedgerItem *)self message];
  id v4 = [v3 hash];

  id v14 = v4;
  BOOL v5 = [(STTransportServiceMessageLedgerItem *)self statusesByAddress];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100092898;
  v10[3] = &unk_1002FE788;
  v10[4] = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v6 = v12[3];
  uint64_t v7 = [(STTransportServiceMessageLedgerItem *)self creationDate];
  unint64_t v8 = (unint64_t)[v7 hash] ^ v6;

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (STMessageTransportMessage)message
{
  return (STMessageTransportMessage *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)statusesByAddress
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusesByAddress, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end