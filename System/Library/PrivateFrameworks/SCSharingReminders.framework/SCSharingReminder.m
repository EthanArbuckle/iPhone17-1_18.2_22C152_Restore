@interface SCSharingReminder
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)scheduledDate;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)type;
- (SCSharingReminder)initWithCoder:(id)a3;
- (SCSharingReminder)initWithIdentifier:(id)a3 displayName:(id)a4 type:(id)a5 deliverAfter:(double)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setScheduledDate:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SCSharingReminder

- (SCSharingReminder)initWithIdentifier:(id)a3 displayName:(id)a4 type:(id)a5 deliverAfter:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCSharingReminder;
  v14 = [(SCSharingReminder *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_displayName, a4);
    uint64_t v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a6];
    scheduledDate = v15->_scheduledDate;
    v15->_scheduledDate = (NSDate *)v16;

    objc_storeStrong((id *)&v15->_type, a5);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SCSharingReminder *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(SCSharingReminder *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(SCSharingReminder *)self scheduledDate];
  [v4 encodeObject:v7 forKey:@"scheduledDate"];

  id v8 = [(SCSharingReminder *)self type];
  [v4 encodeObject:v8 forKey:@"type"];
}

- (SCSharingReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCSharingReminder;
  v5 = [(SCSharingReminder *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledDate"];
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCSharingReminder *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SCSharingReminder *)v5 identifier];
      v7 = [(SCSharingReminder *)self identifier];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(SCSharingReminder *)v5 type];
        v9 = [(SCSharingReminder *)self type];
        if ([v8 isEqualToString:v9])
        {
          uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
          id v11 = [(SCSharingReminder *)v5 scheduledDate];
          uint64_t v12 = [(SCSharingReminder *)self scheduledDate];
          char v13 = [v10 isDate:v11 inSameDayAsDate:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [(SCSharingReminder *)self scheduledDate];
  v5 = [v3 components:28 fromDate:v4];

  uint64_t v6 = [(SCSharingReminder *)self identifier];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(SCSharingReminder *)self type];
  uint64_t v9 = [v8 hash] ^ v7;
  unint64_t v10 = v9 ^ [v5 hash];

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SCSharingReminder *)self identifier];
  v5 = [(SCSharingReminder *)self displayName];
  uint64_t v6 = [(SCSharingReminder *)self type];
  uint64_t v7 = [(SCSharingReminder *)self scheduledDate];
  uint64_t v8 = localizedDateStringFromUTC((uint64_t)v7);
  uint64_t v9 = [v3 stringWithFormat:@"%@ %@ [%@] scheduled: %@", v4, v5, v6, v8];

  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end