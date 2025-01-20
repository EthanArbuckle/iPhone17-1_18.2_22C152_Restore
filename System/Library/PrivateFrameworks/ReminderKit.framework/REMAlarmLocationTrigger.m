@interface REMAlarmLocationTrigger
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporal;
- (REMAlarmLocationTrigger)initWithCoder:(id)a3;
- (REMAlarmLocationTrigger)initWithObjectID:(id)a3 structuredLocation:(id)a4 proximity:(int64_t)a5;
- (REMAlarmLocationTrigger)initWithStructuredLocation:(id)a3 proximity:(int64_t)a4;
- (REMStructuredLocation)structuredLocation;
- (id)_deepCopy;
- (id)description;
- (int64_t)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProximity:(int64_t)a3;
- (void)setStructuredLocation:(id)a3;
@end

@implementation REMAlarmLocationTrigger

+ (id)cdEntityName
{
  return @"REMCDAlarmLocationTrigger";
}

- (REMAlarmLocationTrigger)initWithObjectID:(id)a3 structuredLocation:(id)a4 proximity:(int64_t)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMAlarmLocationTrigger;
  v9 = [(REMAlarmTrigger *)&v12 initWithObjectID:a3];
  v10 = v9;
  if (v9)
  {
    [(REMAlarmLocationTrigger *)v9 setStructuredLocation:v8];
    [(REMAlarmLocationTrigger *)v10 setProximity:a5];
  }

  return v10;
}

- (REMAlarmLocationTrigger)initWithStructuredLocation:(id)a3 proximity:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmLocationTrigger;
  v7 = [(REMAlarmTrigger *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    [(REMAlarmLocationTrigger *)v7 setStructuredLocation:v6];
    [(REMAlarmLocationTrigger *)v8 setProximity:a4];
  }

  return v8;
}

- (REMAlarmLocationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmLocationTrigger;
  v5 = [(REMAlarmTrigger *)&v10 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"structuredLocation"];
    [(REMAlarmLocationTrigger *)v5 setStructuredLocation:v6];

    unint64_t v7 = [v4 decodeIntegerForKey:@"proximity"];
    if (v7 >= 3)
    {
      id v8 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[REMAlarmLocationTrigger initWithCoder:](v7, v8);
      }

      unint64_t v7 = 0;
    }
    [(REMAlarmLocationTrigger *)v5 setProximity:v7];
  }

  return v5;
}

- (id)_deepCopy
{
  v3 = [REMAlarmLocationTrigger alloc];
  id v4 = [(REMAlarmLocationTrigger *)self structuredLocation];
  v5 = (void *)[v4 copy];
  id v6 = [(REMAlarmLocationTrigger *)v3 initWithStructuredLocation:v5 proximity:[(REMAlarmLocationTrigger *)self proximity]];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(REMAlarmLocationTrigger *)self structuredLocation];
    unint64_t v7 = [v5 structuredLocation];
    if ([v6 isEqual:v7])
    {
      int64_t v8 = [(REMAlarmLocationTrigger *)self proximity];
      BOOL v9 = v8 == [v5 proximity];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(REMAlarmLocationTrigger *)self structuredLocation];
    unint64_t v7 = [v5 structuredLocation];
    if ([v6 isContentEqual:v7])
    {
      int64_t v8 = [(REMAlarmLocationTrigger *)self proximity];
      BOOL v9 = v8 == [v5 proximity];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isTemporal
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(REMAlarmLocationTrigger *)self structuredLocation];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmLocationTrigger;
  id v4 = [(REMAlarmLocationTrigger *)&v8 description];
  id v5 = [(REMAlarmLocationTrigger *)self structuredLocation];
  objc_msgSend(v3, "stringWithFormat:", @"%@ {structuredLocation = %@; proximity = %ld;}",
    v4,
    v5,
  id v6 = [(REMAlarmLocationTrigger *)self proximity]);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMAlarmLocationTrigger;
  id v4 = a3;
  [(REMAlarmTrigger *)&v6 encodeWithCoder:v4];
  id v5 = [(REMAlarmLocationTrigger *)self structuredLocation];
  [v4 encodeObject:v5 forKey:@"structuredLocation"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAlarmLocationTrigger proximity](self, "proximity"), @"proximity");
}

- (REMStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAlarmProximity %ld", (uint8_t *)&v2, 0xCu);
}

@end