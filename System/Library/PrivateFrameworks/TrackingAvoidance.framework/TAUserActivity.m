@interface TAUserActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (TAUserActivity)initWithActivityType:(unint64_t)a3 date:(id)a4;
- (TAUserActivity)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)activityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAUserActivity

- (TAUserActivity)initWithActivityType:(unint64_t)a3 date:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAUserActivity;
  v7 = [(TAUserActivity *)&v13 init];
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v7->_activityType = a3;
    uint64_t v9 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;
  }
  v11 = v8;
LABEL_6:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TAUserActivity *)self activityType];
  v4 = [(TAUserActivity *)self date];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TAUserActivity *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(TAUserActivity *)self activityType];
      if (v6 == [(TAUserActivity *)v5 activityType])
      {
        v7 = [(TAUserActivity *)self date];
        v8 = [(TAUserActivity *)v5 date];
        if (v7 == v8)
        {
          char v11 = 1;
        }
        else
        {
          uint64_t v9 = [(TAUserActivity *)self date];
          v10 = [(TAUserActivity *)v5 date];
          char v11 = [v9 isEqual:v10];
        }
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
  }

  return v11;
}

- (id)descriptionDictionary
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"EventType";
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v12[0] = v4;
  v11[1] = @"ActivityType";
  unint64_t v5 = self->_activityType - 1;
  if (v5 > 3) {
    unint64_t v6 = @"<unknown>";
  }
  else {
    unint64_t v6 = off_2646AAFA0[v5];
  }
  v12[1] = v6;
  v11[2] = @"Date";
  v7 = [(TAUserActivity *)self date];
  v8 = [v7 getDateString];
  v12[2] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (NSString)description
{
  unint64_t v3 = [(TAUserActivity *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
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
  v8 = v7;

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TAUserActivity alloc];
  unint64_t activityType = self->_activityType;
  date = self->_date;
  return [(TAUserActivity *)v4 initWithActivityType:activityType date:date];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAUserActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"ActivityType"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  id v7 = [(TAUserActivity *)self initWithActivityType:v5 date:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activityType = self->_activityType;
  id v5 = a3;
  [v5 encodeInteger:activityType forKey:@"ActivityType"];
  [v5 encodeObject:self->_date forKey:@"Date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)getDate
{
  return self->_date;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end