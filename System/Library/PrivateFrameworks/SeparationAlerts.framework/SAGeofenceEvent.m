@interface SAGeofenceEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLRegion)region;
- (NSDate)eventDate;
- (NSString)description;
- (SAGeofenceEvent)initWithCoder:(id)a3;
- (SAGeofenceEvent)initWithRegion:(id)a3 eventType:(unint64_t)a4 eventDate:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SAGeofenceEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAGeofenceEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GeofenceEventRegion"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"GeofenceEventType"];
  v7 = [v4 decodeObjectForKey:@"GeofenceEventDate"];

  v8 = [(SAGeofenceEvent *)self initWithRegion:v5 eventType:v6 eventDate:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SAGeofenceEvent *)self region];
  [v4 encodeObject:v5 forKey:@"GeofenceEventRegion"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAGeofenceEvent eventType](self, "eventType"), @"GeofenceEventType");
  id v6 = [(SAGeofenceEvent *)self eventDate];
  [v4 encodeObject:v6 forKey:@"GeofenceEventDate"];
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
  id v4 = +[SAGeofenceEvent allocWithZone:a3];
  v5 = [(SAGeofenceEvent *)self region];
  unint64_t v6 = [(SAGeofenceEvent *)self eventType];
  id v7 = [(SAGeofenceEvent *)self eventDate];
  id v8 = [(SAGeofenceEvent *)v4 initWithRegion:v5 eventType:v6 eventDate:v7];

  return v8;
}

- (SAGeofenceEvent)initWithRegion:(id)a3 eventType:(unint64_t)a4 eventDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SAGeofenceEvent;
  v10 = [(SAGeofenceEvent *)&v17 init];
  if (!v10) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v8 && v9)
  {
    uint64_t v12 = [v8 copy];
    region = v10->_region;
    v10->_region = (CLRegion *)v12;

    v10->_eventType = a4;
    uint64_t v14 = [v9 copy];
    eventDate = v10->_eventDate;
    v10->_eventDate = (NSDate *)v14;

LABEL_5:
    v11 = v10;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SAGeofenceEvent *)a3;
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
      id v8 = [(SAGeofenceEvent *)self region];
      id v9 = [(SAGeofenceEvent *)v7 region];
      if (v8 == v9
        || ([(SAGeofenceEvent *)self region],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SAGeofenceEvent *)v7 region],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v11 = [(SAGeofenceEvent *)self eventType];
        if (v11 == [(SAGeofenceEvent *)v7 eventType])
        {
          uint64_t v12 = [(SAGeofenceEvent *)self eventDate];
          uint64_t v13 = [(SAGeofenceEvent *)v7 eventDate];
          if (v12 == (void *)v13)
          {

            char v10 = 1;
          }
          else
          {
            uint64_t v14 = (void *)v13;
            v15 = [(SAGeofenceEvent *)self eventDate];
            [(SAGeofenceEvent *)v7 eventDate];
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
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"EventType";
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v14[0] = v4;
  v13[1] = @"GeofenceEventDate";
  v5 = [(SAGeofenceEvent *)self eventDate];
  unint64_t v6 = [v5 getDateString];
  v14[1] = v6;
  v13[2] = @"GeofenceEventType";
  unint64_t v7 = [(SAGeofenceEvent *)self eventType];
  if (v7 > 6) {
    id v8 = @"<invalid>";
  }
  else {
    id v8 = off_1E68D7350[v7];
  }
  v14[2] = v8;
  v13[3] = @"GeofenceEventRegion";
  id v9 = [(SAGeofenceEvent *)self region];
  char v10 = [v9 description];
  v14[3] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (NSString)description
{
  v3 = [(SAGeofenceEvent *)self descriptionDictionary];
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    unint64_t v6 = (void *)TASALog;
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
  return self->_eventDate;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (CLRegion)region
{
  return self->_region;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end