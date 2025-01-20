@interface TAPlaySoundSuccess
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)address;
- (NSDate)date;
- (NSString)description;
- (NSUUID)uuid;
- (TAPlaySoundSuccess)initWithCoder:(id)a3;
- (TAPlaySoundSuccess)initWithUUID:(id)a3 address:(id)a4 successType:(unint64_t)a5 date:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)successType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAPlaySoundSuccess

- (TAPlaySoundSuccess)initWithUUID:(id)a3 address:(id)a4 successType:(unint64_t)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TAPlaySoundSuccess;
  v14 = [(TAPlaySoundSuccess *)&v18 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_6;
  }
  v16 = 0;
  if (v11 && v12 && v13)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_address, a4);
    v15->_successType = a5;
    objc_storeStrong((id *)&v15->_date, a6);
LABEL_6:
    v16 = v15;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (TAPlaySoundSuccess *)a3;
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
      v8 = [(TAPlaySoundSuccess *)self uuid];
      v9 = [(TAPlaySoundSuccess *)v7 uuid];
      if (v8 != v9)
      {
        v3 = [(TAPlaySoundSuccess *)self uuid];
        v4 = [(TAPlaySoundSuccess *)v7 uuid];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_21;
        }
      }
      id v11 = [(TAPlaySoundSuccess *)self address];
      id v12 = [(TAPlaySoundSuccess *)v7 address];
      if (v11 != v12)
      {
        id v13 = [(TAPlaySoundSuccess *)self address];
        v25 = [(TAPlaySoundSuccess *)v7 address];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_19;
        }
        v24 = v13;
      }
      unint64_t v14 = [(TAPlaySoundSuccess *)self successType];
      if (v14 == [(TAPlaySoundSuccess *)v7 successType])
      {
        v23 = v4;
        v15 = [(TAPlaySoundSuccess *)self date];
        uint64_t v16 = [(TAPlaySoundSuccess *)v7 date];
        if (v15 == (void *)v16)
        {

          char v10 = 1;
        }
        else
        {
          v17 = (void *)v16;
          v21 = [(TAPlaySoundSuccess *)self date];
          [(TAPlaySoundSuccess *)v7 date];
          objc_super v18 = v22 = v3;
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
      id v13 = v24;
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
  v15[5] = *MEMORY[0x263EF8340];
  v14[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v15[0] = v4;
  v14[1] = @"uuid";
  v5 = [(TAPlaySoundSuccess *)self uuid];
  v6 = [v5 UUIDString];
  v15[1] = v6;
  v14[2] = @"add";
  v7 = [(TAPlaySoundSuccess *)self address];
  v8 = [v7 hexString];
  v15[2] = v8;
  v14[3] = @"type";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAPlaySoundSuccess successType](self, "successType"));
  v15[3] = v9;
  v14[4] = @"date";
  char v10 = [(TAPlaySoundSuccess *)self date];
  id v11 = [v10 getDateString];
  v15[4] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v12;
}

- (NSString)description
{
  v3 = [(TAPlaySoundSuccess *)self descriptionDictionary];
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
  v4 = [TAPlaySoundSuccess alloc];
  uuid = self->_uuid;
  address = self->_address;
  unint64_t successType = self->_successType;
  date = self->_date;
  return [(TAPlaySoundSuccess *)v4 initWithUUID:uuid address:address successType:successType date:date];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPlaySoundSuccess)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"add"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"type"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  v9 = [(TAPlaySoundSuccess *)self initWithUUID:v5 address:v6 successType:v7 date:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_address forKey:@"add"];
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

- (NSData)address
{
  return self->_address;
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
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end