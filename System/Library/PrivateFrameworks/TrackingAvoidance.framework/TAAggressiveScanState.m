@interface TAAggressiveScanState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (TAAggressiveScanState)initWithCoder:(id)a3;
- (TAAggressiveScanState)initWithState:(unint64_t)a3 date:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation TAAggressiveScanState

- (id)getDate
{
  return self->_date;
}

- (TAAggressiveScanState)initWithState:(unint64_t)a3 date:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAAggressiveScanState;
  v7 = [(TAAggressiveScanState *)&v13 init];
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v7->_state = a3;
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
  v2 = [(TAAggressiveScanState *)self date];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (TAAggressiveScanState *)a3;
  if (self == v6)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(TAAggressiveScanState *)self date];
      uint64_t v9 = [(TAAggressiveScanState *)v7 date];
      if (v8 == v9
        || ([(TAAggressiveScanState *)self date],
            unint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [(TAAggressiveScanState *)v7 date],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v11 = [(TAAggressiveScanState *)self state];
        BOOL v10 = v11 == [(TAAggressiveScanState *)v7 state];
        if (v8 == v9)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        BOOL v10 = 0;
      }

      goto LABEL_10;
    }
    BOOL v10 = 0;
  }
LABEL_11:

  return v10;
}

- (id)descriptionDictionary
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"EventType";
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v11[0] = v4;
  v10[1] = @"Date";
  v5 = [(TAAggressiveScanState *)self date];
  id v6 = [v5 getDateString];
  v11[1] = v6;
  v10[2] = @"State";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAAggressiveScanState state](self, "state"));
  v11[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (NSString)description
{
  unint64_t v3 = [(TAAggressiveScanState *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = (void *)TAStatusLog;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAAggressiveScanState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"State"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];

  id v7 = [(TAAggressiveScanState *)self initWithState:v5 date:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"State"];
  [v5 encodeObject:self->_date forKey:@"Date"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  id v6 = (void *)MEMORY[0x223CB66C0]();
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TAAggressiveScanState alloc];
  unint64_t state = self->_state;
  date = self->_date;
  return [(TAAggressiveScanState *)v4 initWithState:state date:date];
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end