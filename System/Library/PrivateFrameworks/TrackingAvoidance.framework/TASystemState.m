@interface TASystemState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOn;
- (NSDate)date;
- (NSString)description;
- (TASystemState)initWithCoder:(id)a3;
- (TASystemState)initWithSystemStateType:(unint64_t)a3 isOn:(BOOL)a4 date:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)getEventSubtype;
- (unint64_t)hash;
- (unint64_t)systemStateType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TASystemState

- (id)getDate
{
  return self->_date;
}

- (TASystemState)initWithSystemStateType:(unint64_t)a3 isOn:(BOOL)a4 date:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TASystemState;
  v9 = [(TASystemState *)&v15 init];
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v9->_systemStateType = a3;
    v9->_isOn = a4;
    uint64_t v11 = [v8 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v11;
  }
  v13 = v10;
LABEL_6:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TASystemState *)self systemStateType];
  uint64_t v4 = [(TASystemState *)self isOn];
  v5 = [(TASystemState *)self date];
  unint64_t v6 = v3 ^ [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TASystemState *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(TASystemState *)self systemStateType];
      if (v6 == [(TASystemState *)v5 systemStateType]
        && (BOOL v7 = [(TASystemState *)self isOn], v7 == [(TASystemState *)v5 isOn]))
      {
        v9 = [(TASystemState *)self date];
        v10 = [(TASystemState *)v5 date];
        if (v9 == v10)
        {
          char v8 = 1;
        }
        else
        {
          uint64_t v11 = [(TASystemState *)self date];
          v12 = [(TASystemState *)v5 date];
          char v8 = [v11 isEqual:v12];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"EventType";
  unint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v12[0] = v4;
  v11[1] = @"SystemStateType";
  v5 = TASystemStateTypeToString(self->_systemStateType);
  v12[1] = v5;
  v11[2] = @"IsOn";
  unint64_t v6 = [NSNumber numberWithBool:self->_isOn];
  v12[2] = v6;
  v11[3] = @"Date";
  BOOL v7 = [(TASystemState *)self date];
  char v8 = [v7 getDateString];
  v12[3] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (NSString)description
{
  unint64_t v3 = [(TASystemState *)self descriptionDictionary];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    unint64_t v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  char v8 = v7;

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [TASystemState alloc];
  BOOL isOn = self->_isOn;
  unint64_t systemStateType = self->_systemStateType;
  date = self->_date;
  return [(TASystemState *)v4 initWithSystemStateType:systemStateType isOn:isOn date:date];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASystemState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"SystemStateType"];
  uint64_t v6 = [v4 decodeBoolForKey:@"IsOn"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  char v8 = [(TASystemState *)self initWithSystemStateType:v5 isOn:v6 date:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t systemStateType = self->_systemStateType;
  id v5 = a3;
  [v5 encodeInteger:systemStateType forKey:@"SystemStateType"];
  [v5 encodeBool:self->_isOn forKey:@"IsOn"];
  [v5 encodeObject:self->_date forKey:@"Date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (unint64_t)getEventSubtype
{
  return self->_systemStateType;
}

- (unint64_t)systemStateType
{
  return self->_systemStateType;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end