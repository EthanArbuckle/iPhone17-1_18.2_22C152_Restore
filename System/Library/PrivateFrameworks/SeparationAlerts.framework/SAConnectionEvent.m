@interface SAConnectionEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSUUID)identifier;
- (SAConnectionEvent)initWithCoder:(id)a3;
- (SAConnectionEvent)initWithDeviceUUID:(id)a3 state:(int64_t)a4 date:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (int64_t)state;
- (void)description;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SAConnectionEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAConnectionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SAConnectionEventIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"SAConnectionEventState"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SAConnectionEventDate"];

  v8 = [(SAConnectionEvent *)self initWithDeviceUUID:v5 state:v6 date:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SAConnectionEvent *)self identifier];
  [v4 encodeObject:v5 forKey:@"SAConnectionEventIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAConnectionEvent state](self, "state"), @"SAConnectionEventState");
  id v6 = [(SAConnectionEvent *)self date];
  [v4 encodeObject:v6 forKey:@"SAConnectionEventDate"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  id v6 = (void *)MEMORY[0x1D25F7C90]();
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SAConnectionEvent allocWithZone:a3];
  v5 = [(SAConnectionEvent *)self identifier];
  int64_t v6 = [(SAConnectionEvent *)self state];
  id v7 = [(SAConnectionEvent *)self date];
  id v8 = [(SAConnectionEvent *)v4 initWithDeviceUUID:v5 state:v6 date:v7];

  return v8;
}

- (SAConnectionEvent)initWithDeviceUUID:(id)a3 state:(int64_t)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SAConnectionEvent;
  v10 = [(SAConnectionEvent *)&v17 init];
  if (!v10) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v8 && v9)
  {
    uint64_t v12 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v12;

    v10->_state = a4;
    uint64_t v14 = [v9 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v14;

LABEL_5:
    v11 = v10;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v6 = (SAConnectionEvent *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [(SAConnectionEvent *)self identifier];
      id v9 = [(SAConnectionEvent *)v7 identifier];
      if (v8 == v9
        || ([(SAConnectionEvent *)self identifier],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SAConnectionEvent *)v7 identifier],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int64_t v11 = [(SAConnectionEvent *)self state];
        if (v11 == [(SAConnectionEvent *)v7 state])
        {
          uint64_t v12 = [(SAConnectionEvent *)self date];
          uint64_t v13 = [(SAConnectionEvent *)v7 date];
          if (v12 == (void *)v13)
          {

            char v10 = 1;
          }
          else
          {
            uint64_t v14 = (void *)v13;
            v15 = [(SAConnectionEvent *)self date];
            [(SAConnectionEvent *)v7 date];
            v16 = v18 = v3;
            char v10 = [v15 isEqual:v16];

            v3 = v18;
          }
        }
        else
        {
          char v10 = 0;
        }
        if (v8 == v9) {
          goto LABEL_15;
        }
      }
      else
      {
        char v10 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    char v10 = 0;
  }
LABEL_16:

  return v10;
}

- (id)descriptionDictionary
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v13[0] = v4;
  v12[1] = @"SAConnectionEventIdentifier";
  v5 = [(SAConnectionEvent *)self identifier];
  int64_t v6 = [v5 description];
  v13[1] = v6;
  v12[2] = @"SAConnectionEventState";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SAConnectionEvent state](self, "state"));
  v13[2] = v7;
  v12[3] = @"SAConnectionEventDate";
  id v8 = [(SAConnectionEvent *)self date];
  id v9 = [v8 getDateString];
  v13[3] = v9;
  char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (NSString)description
{
  v3 = [(SAConnectionEvent *)self descriptionDictionary];
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    int64_t v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      [(SAConnectionEvent *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return (NSString *)v8;
}

- (id)getDate
{
  return self->_date;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)description
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", (uint8_t *)&v7, 0x16u);
}

@end