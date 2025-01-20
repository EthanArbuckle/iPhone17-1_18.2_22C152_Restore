@interface TAAISFetchSuccess
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSUUID)uuid;
- (TAAISFetchSuccess)initWithCoder:(id)a3;
- (TAAISFetchSuccess)initWithUUID:(id)a3 withAISInfo:(id)a4 successType:(unint64_t)a5 date:(id)a6;
- (TAAccessoryInformation)info;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)successType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAAISFetchSuccess

- (TAAISFetchSuccess)initWithUUID:(id)a3 withAISInfo:(id)a4 successType:(unint64_t)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TAAISFetchSuccess;
  v13 = [(TAAISFetchSuccess *)&v22 init];
  if (!v13) {
    goto LABEL_5;
  }
  v14 = 0;
  if (v10 && v12)
  {
    uint64_t v15 = [v10 copy];
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    info = v13->_info;
    v13->_info = (TAAccessoryInformation *)v17;

    v13->_successType = a5;
    uint64_t v19 = [v12 copy];
    date = v13->_date;
    v13->_date = (NSDate *)v19;

LABEL_5:
    v14 = v13;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (TAAISFetchSuccess *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(TAAISFetchSuccess *)self uuid];
      v9 = [(TAAISFetchSuccess *)v7 uuid];
      if (v8 != v9)
      {
        v3 = [(TAAISFetchSuccess *)self uuid];
        v4 = [(TAAISFetchSuccess *)v7 uuid];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_21;
        }
      }
      id v11 = [(TAAISFetchSuccess *)self info];
      id v12 = [(TAAISFetchSuccess *)v7 info];
      if (v11 != v12)
      {
        v13 = [(TAAISFetchSuccess *)self info];
        v25 = [(TAAISFetchSuccess *)v7 info];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_19;
        }
        v24 = v13;
      }
      unint64_t v14 = [(TAAISFetchSuccess *)self successType];
      if (v14 == [(TAAISFetchSuccess *)v7 successType])
      {
        v23 = v4;
        uint64_t v15 = [(TAAISFetchSuccess *)self date];
        uint64_t v16 = [(TAAISFetchSuccess *)v7 date];
        if (v15 == (void *)v16)
        {

          char v10 = 1;
        }
        else
        {
          uint64_t v17 = (void *)v16;
          v21 = [(TAAISFetchSuccess *)self date];
          [(TAAISFetchSuccess *)v7 date];
          v18 = objc_super v22 = v3;
          char v10 = [v21 isEqual:v18];

          v3 = v22;
        }
        BOOL v19 = v11 == v12;
        v4 = v23;
      }
      else
      {
        char v10 = 0;
        BOOL v19 = v11 == v12;
      }
      v13 = v24;
      if (v19)
      {
LABEL_20:

        if (v8 == v9)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    char v10 = 0;
  }
LABEL_23:

  return v10;
}

- (id)descriptionDictionary
{
  v16[5] = *MEMORY[0x263EF8340];
  v15[0] = @"EventType";
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v16[0] = v5;
  v15[1] = @"uuid";
  v6 = [(TAAISFetchSuccess *)self uuid];
  v7 = [v6 UUIDString];
  v16[1] = v7;
  v15[2] = @"info";
  v8 = [(TAAISFetchSuccess *)self info];
  if (v8)
  {
    v2 = [(TAAISFetchSuccess *)self info];
    v9 = [v2 descriptionDictionary];
  }
  else
  {
    v9 = &stru_26D677430;
  }
  v16[2] = v9;
  v15[3] = @"type";
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAAISFetchSuccess successType](self, "successType"));
  v16[3] = v10;
  v15[4] = @"date";
  id v11 = [(TAAISFetchSuccess *)self date];
  id v12 = [v11 getDateString];
  v16[4] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  if (v8)
  {
  }
  return v13;
}

- (NSString)description
{
  v3 = [(TAAISFetchSuccess *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TAAISFetchSuccess alloc];
  uuid = self->_uuid;
  info = self->_info;
  unint64_t successType = self->_successType;
  date = self->_date;
  return [(TAAISFetchSuccess *)v4 initWithUUID:uuid withAISInfo:info successType:successType date:date];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAAISFetchSuccess)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"info"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"type"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  v9 = [(TAAISFetchSuccess *)self initWithUUID:v5 withAISInfo:v6 successType:v7 date:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_info forKey:@"info"];
  [v5 encodeInteger:self->_successType forKey:@"type"];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)getDate
{
  return self->_date;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TAAccessoryInformation)info
{
  return self->_info;
}

- (unint64_t)successType
{
  return self->_successType;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end