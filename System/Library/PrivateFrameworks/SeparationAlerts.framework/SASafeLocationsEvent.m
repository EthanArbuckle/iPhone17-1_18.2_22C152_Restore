@interface SASafeLocationsEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDictionary)safeLocations;
- (NSString)description;
- (SASafeLocationsEvent)initWithCoder:(id)a3;
- (SASafeLocationsEvent)initWithSafeLocations:(id)a3 date:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SASafeLocationsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASafeLocationsEvent)initWithCoder:(id)a3
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];
  v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"kSASafeLocationsEventKeySafeLocations"];
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kSASafeLocationsEventKeyDate"];

  v10 = [(SASafeLocationsEvent *)self initWithSafeLocations:v8 date:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SASafeLocationsEvent *)self safeLocations];
  [v4 encodeObject:v5 forKey:@"kSASafeLocationsEventKeySafeLocations"];

  id v6 = [(SASafeLocationsEvent *)self date];
  [v4 encodeObject:v6 forKey:@"kSASafeLocationsEventKeyDate"];
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
  id v4 = +[SASafeLocationsEvent allocWithZone:a3];
  id v5 = [(SASafeLocationsEvent *)self safeLocations];
  id v6 = [(SASafeLocationsEvent *)self date];
  id v7 = [(SASafeLocationsEvent *)v4 initWithSafeLocations:v5 date:v6];

  return v7;
}

- (SASafeLocationsEvent)initWithSafeLocations:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SASafeLocationsEvent;
  id v8 = [(SASafeLocationsEvent *)&v15 init];
  if (v8)
  {
    if (!v7)
    {
      v13 = 0;
      goto LABEL_8;
    }
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      safeLocations = v8->_safeLocations;
      v8->_safeLocations = (NSDictionary *)v9;
    }
    uint64_t v11 = [v7 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v11;
  }
  v13 = v8;
LABEL_8:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SASafeLocationsEvent *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(SASafeLocationsEvent *)self safeLocations];
      id v8 = [(SASafeLocationsEvent *)v6 safeLocations];
      if (v7 != v8)
      {
        uint64_t v9 = [(SASafeLocationsEvent *)self safeLocations];
        v3 = [(SASafeLocationsEvent *)v6 safeLocations];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      uint64_t v11 = [(SASafeLocationsEvent *)self date];
      v12 = [(SASafeLocationsEvent *)v6 date];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(SASafeLocationsEvent *)self date];
        v14 = [(SASafeLocationsEvent *)v6 date];
        char v10 = [v13 isEqual:v14];
      }
      uint64_t v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)descriptionDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v9[1] = @"kSASafeLocationsEventKeySafeLocations";
  v10[0] = v4;
  id v5 = [(SASafeLocationsEvent *)self safeLocations];
  if (v5)
  {
    self = [(SASafeLocationsEvent *)self safeLocations];
    id v6 = [(SASafeLocationsEvent *)self description];
  }
  else
  {
    id v6 = &stru_1F27F45F0;
  }
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v5)
  {
  }
  return v7;
}

- (NSString)description
{
  v2 = [(SASafeLocationsEvent *)self descriptionDictionary];
  id v9 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      -[SASafeLocationUpdateEvent description](v5);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (NSDictionary)safeLocations
{
  return self->_safeLocations;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
}

@end