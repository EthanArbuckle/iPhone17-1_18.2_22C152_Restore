@interface KTDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)active:(id)a3;
- (BOOL)expired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marked:(id)a3;
- (BOOL)shouldRemove;
- (KTDevice)initWithCoder:(id)a3;
- (KTDevice)initWithIdsDevice:(id)a3;
- (KTDevice)initWithMutation:(id)a3;
- (NSData)deviceID;
- (NSData)deviceIDHash;
- (NSDate)addedDate;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSMutableArray)clientDatas;
- (id)clientRecordForAppVersion:(unint64_t)a3 clientDataHash:(id)a4;
- (id)clientRecordsForHash:(id)a3;
- (id)debugDescription;
- (void)addClientDatasObject:(id)a3;
- (void)cleanupRecords;
- (void)deleteMarkedEntries:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)markClientDatasForAppVersion:(unint64_t)a3 mutationMs:(unint64_t)a4 except:(id)a5;
- (void)removeClientDatasObject:(id)a3;
- (void)setClientDatas:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDeviceIDHash:(id)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithDeviceStateArray:(id)a3;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
@end

@implementation KTDevice

- (id)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"[\n"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v21 = self;
  obj = self->_clientDatas;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v3 appendFormat:@"   {\n"];
        v9 = [v8 clientData];
        v10 = [v9 kt_hexString];
        [v3 appendFormat:@"    clientData:%@\n", v10];

        v11 = [v8 clientDataHash];
        v12 = [v11 kt_hexString];
        [v3 appendFormat:@"    clientDataHash:%@\n", v12];

        [v3 appendFormat:@"    appVersion:%lu\n", [v8 applicationVersion]];
        v13 = [v8 addedDate];
        v14 = [v8 markedForDeletion];
        v15 = [v8 expiry];
        v16 = [v8 escrowExpiry];
        [v3 appendFormat:@"    addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n",
          v13,
          v14,
          v15,
          v16);

        [v3 appendFormat:@"   },\n"];
      }
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  [v3 appendFormat:@"  ]"];
  v17 = [(NSData *)v21->_deviceID kt_hexString];
  v18 = [(NSData *)v21->_deviceIDHash kt_hexString];
  v19 = +[NSString stringWithFormat:@"{\n  deviceID:%@\n  deviceIDHash:%@\n  clientDatas: %@\n}", v17, v18, v3];

  return v19;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(KTDevice *)self deviceID];

  if (v4)
  {
    id v5 = [(KTDevice *)self deviceID];
    uint64_t v6 = [v5 kt_hexString];
    [v3 setObject:v6 forKeyedSubscript:@"deviceID"];
  }
  v7 = [(KTDevice *)self deviceIDHash];
  v8 = [v7 kt_hexString];
  [v3 setObject:v8 forKeyedSubscript:@"deviceIDHash"];

  v9 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = [(KTDevice *)self clientDatas];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:@"clientDatas"];

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(KTDevice *)self deviceID];
  [v4 encodeObject:v5 forKey:@"deviceID"];

  uint64_t v6 = [(KTDevice *)self deviceIDHash];
  [v4 encodeObject:v6 forKey:@"deviceIDHash"];

  id v7 = [(KTDevice *)self clientDatas];
  [v4 encodeObject:v7 forKey:@"clientDataRecords"];
}

- (KTDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIDHash"];
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"clientDataRecords"];

  v10 = objc_alloc_init(KTDevice);
  id v11 = v10;
  if (v10)
  {
    [(KTDevice *)v10 setDeviceID:v5];
    [(KTDevice *)v11 setDeviceIDHash:v6];
    id v12 = [v9 mutableCopy];
    [(KTDevice *)v11 setClientDatas:v12];
  }
  return v11;
}

- (KTDevice)initWithIdsDevice:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KTDevice;
  id v5 = [(KTDevice *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 deviceIdHash];
    [(KTDevice *)v5 setDeviceIDHash:v6];

    uint64_t v7 = +[NSMutableArray array];
    [(KTDevice *)v5 setClientDatas:v7];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [v4 clientDataArray];
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [[KTClientDataRecord alloc] initWithSingleDataRecord:*(void *)(*((void *)&v16 + 1) + 8 * (void)v12)];
          v14 = [(KTDevice *)v5 clientDatas];
          [v14 addObject:v13];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (KTDevice)initWithMutation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KTDevice;
  id v5 = [(KTDevice *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 deviceIdHash];
    deviceIDHash = v5->_deviceIDHash;
    v5->_deviceIDHash = (NSData *)v6;

    v8 = [[KTClientDataRecord alloc] initWithMutation:v4];
    uint64_t v9 = +[NSMutableArray arrayWithObject:v8];
    clientDatas = v5->_clientDatas;
    v5->_clientDatas = (NSMutableArray *)v9;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTDevice *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(KTDevice *)self deviceID];
      uint64_t v7 = [(KTDevice *)v5 deviceID];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(KTDevice *)self deviceID];
        id v10 = [(KTDevice *)v5 deviceID];
        unsigned int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_15;
        }
      }
      uint64_t v13 = [(KTDevice *)self deviceIDHash];
      uint64_t v14 = [(KTDevice *)v5 deviceIDHash];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        long long v16 = [(KTDevice *)self deviceIDHash];
        long long v17 = [(KTDevice *)v5 deviceIDHash];
        unsigned int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_15;
        }
      }
      long long v19 = [(KTDevice *)self clientDatas];
      uint64_t v20 = [(KTDevice *)v5 clientDatas];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        v21 = (void *)v20;
        v22 = [(KTDevice *)self clientDatas];
        long long v23 = [(KTDevice *)v5 clientDatas];
        unsigned __int8 v24 = [v22 isEqual:v23];

        if ((v24 & 1) == 0)
        {
LABEL_15:
          BOOL v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      BOOL v12 = 1;
      goto LABEL_18;
    }
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (id)clientRecordForAppVersion:(unint64_t)a3 clientDataHash:(id)a4
{
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = self->_clientDatas;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "applicationVersion", (void)v17) == (id)a3)
        {
          uint64_t v13 = [v12 clientDataHash];
          unsigned __int8 v14 = [v13 isEqualToData:v6];

          if (v14)
          {
            id v15 = v12;
            goto LABEL_12;
          }
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (id)clientRecordsForHash:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_clientDatas;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        BOOL v12 = [v11 clientDataHash:v16];
        unsigned int v13 = [v12 isEqualToData:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v14 = v5;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (void)removeClientDatasObject:(id)a3
{
}

- (void)addClientDatasObject:(id)a3
{
}

- (void)markClientDatasForAppVersion:(unint64_t)a3 mutationMs:(unint64_t)a4 except:(id)a5
{
  id v8 = a5;
  uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:(double)a4 / 1000.0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(KTDevice *)self clientDatas];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v14);
        if ((!v8
           || ([*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) isEqual:v8] & 1) == 0)
          && [v15 applicationVersion] == (id)a3
          && ([v15 marked:v9] & 1) == 0
          && ([v15 expired:v9] & 1) == 0)
        {
          [v15 markWithMutationMs:a4];
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (BOOL)marked:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(KTDevice *)self clientDatas];
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
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) marked:v4])
        {
          BOOL v10 = 0;
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
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)expired:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(KTDevice *)self clientDatas];
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
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) expired:v4])
        {
          BOOL v10 = 0;
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
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)active:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(KTDevice *)self clientDatas];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) active:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (NSDate)addedDate
{
  v3 = +[NSDate date];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(KTDevice *)self clientDatas];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 addedDate];
        id v11 = [v10 compare:v3];

        if (v11 == (id)-1)
        {
          uint64_t v12 = [v9 addedDate];

          v3 = (void *)v12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDate *)v3;
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v11 = a3;
  id v6 = [v11 appVersion];
  uint64_t v7 = [v11 clientDataHash];
  uint64_t v8 = [(KTDevice *)self clientRecordForAppVersion:v6 clientDataHash:v7];

  uint64_t v9 = [v11 idsMutation];
  id v10 = [v9 mutationMs];

  -[KTDevice markClientDatasForAppVersion:mutationMs:except:](self, "markClientDatasForAppVersion:mutationMs:except:", [v11 appVersion], v10, v8);
  if (v8)
  {
    [(KTClientDataRecord *)v8 updateWithAddMutation:v11 error:a4];
  }
  else
  {
    uint64_t v8 = [[KTClientDataRecord alloc] initWithMutation:v11];
    [(KTDevice *)self addClientDatasObject:v8];
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [v9 appVersion];
  uint64_t v7 = [v9 clientDataHash];
  uint64_t v8 = [(KTDevice *)self clientRecordForAppVersion:v6 clientDataHash:v7];

  if (v8) {
    [v8 updateWithMarkDeleteMutation:v9 error:a4];
  }
}

- (void)updateWithDeviceStateArray:(id)a3
{
  id v4 = a3;
  long long v13 = self;
  id v5 = [(KTDevice *)self clientDatas];
  id v6 = +[NSArray arrayWithArray:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100194AE4;
        v14[3] = &unk_1002C49A8;
        v14[4] = v12;
        if ([v4 indexOfObjectPassingTest:v14] == (id)0x7FFFFFFFFFFFFFFFLL) {
          [(KTDevice *)v13 removeClientDatasObject:v12];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (BOOL)shouldRemove
{
  v2 = [(KTDevice *)self clientDatas];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)cleanupRecords
{
  BOOL v3 = [(KTDevice *)self clientDatas];
  id v4 = +[NSArray arrayWithArray:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldRemove", (void)v11)) {
          [(KTDevice *)self removeClientDatasObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)deleteMarkedEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(KTDevice *)self clientDatas];
  id v6 = +[NSArray arrayWithArray:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "marked:", v4, (void)v13)) {
          [(KTDevice *)self removeClientDatasObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSData)deviceID
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSData)deviceIDHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceIDHash:(id)a3
{
}

- (NSMutableArray)clientDatas
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDatas, 0);
  objc_storeStrong((id *)&self->_deviceIDHash, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end