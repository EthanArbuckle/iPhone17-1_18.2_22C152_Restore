@interface SATimeEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (SATimeEvent)initWithCoder:(id)a3;
- (SATimeEvent)initWithDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SATimeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SATimeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SATimeEventDate"];

  v6 = [(SATimeEvent *)self initWithDate:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SATimeEvent *)self date];
  [v4 encodeObject:v5 forKey:@"SATimeEventDate"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  v6 = (void *)MEMORY[0x1D25F7C90]();
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SATimeEvent allocWithZone:a3];
  id v5 = [(SATimeEvent *)self date];
  v6 = [(SATimeEvent *)v4 initWithDate:v5];

  return v6;
}

- (SATimeEvent)initWithDate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SATimeEvent;
  id v5 = [(SATimeEvent *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      id v8 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v6;
  }
  id v8 = v5;
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SATimeEvent *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(SATimeEvent *)self date];
      id v7 = [(SATimeEvent *)v5 date];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        id v8 = [(SATimeEvent *)self date];
        v9 = [(SATimeEvent *)v5 date];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)descriptionDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v9[1] = @"SATimeEventDate";
  v10[0] = v4;
  id v5 = [(SATimeEvent *)self date];
  uint64_t v6 = [v5 getDateString];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (NSString)description
{
  v3 = [(SATimeEvent *)self descriptionDictionary];
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = (void *)TASALog;
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

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end