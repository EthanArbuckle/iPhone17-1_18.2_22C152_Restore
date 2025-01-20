@interface REMTemplateContentAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDisplayDate;
- (BOOL)hasHashtags;
- (BOOL)hasImageAttachments;
- (BOOL)hasLocationTriggersOrVehicleEventTriggers;
- (BOOL)isEqual:(id)a3;
- (REMTemplateContentAttributes)initWithCoder:(id)a3;
- (REMTemplateContentAttributes)initWithReminderCount:(int64_t)a3 hasDisplayDate:(BOOL)a4 hasHashtags:(BOOL)a5 hasLocationTriggersOrVehicleEventTriggers:(BOOL)a6 hasImageAttachments:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)reminderCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTemplateContentAttributes

- (REMTemplateContentAttributes)initWithReminderCount:(int64_t)a3 hasDisplayDate:(BOOL)a4 hasHashtags:(BOOL)a5 hasLocationTriggersOrVehicleEventTriggers:(BOOL)a6 hasImageAttachments:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)REMTemplateContentAttributes;
  result = [(REMTemplateContentAttributes *)&v13 init];
  if (result)
  {
    result->_reminderCount = a3;
    result->_hasDisplayDate = a4;
    result->_hasHashtags = a5;
    result->_hasLocationTriggersOrVehicleEventTriggers = a6;
    result->_hasImageAttachments = a7;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMTemplateContentAttributes reminderCount](self, "reminderCount"));
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplateContentAttributes hasDisplayDate](self, "hasDisplayDate"));
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplateContentAttributes hasHashtags](self, "hasHashtags"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplateContentAttributes hasImageAttachments](self, "hasImageAttachments"));
  v10 = [v3 stringWithFormat:@"<%@: %p reminderCount: %@, hasDisplayDate: %@, hasHashtags: %@, hasLocationTriggersOrVehicleEventTriggers: %@, hasImageAttachments: %@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t v5 = [(REMTemplateContentAttributes *)self reminderCount],
        v5 == [v4 reminderCount])
    && (int v6 = [(REMTemplateContentAttributes *)self hasDisplayDate],
        v6 == [v4 hasDisplayDate])
    && (int v7 = [(REMTemplateContentAttributes *)self hasHashtags],
        v7 == [v4 hasHashtags])
    && (int v8 = -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"), v8 == [v4 hasLocationTriggersOrVehicleEventTriggers]))
  {
    BOOL v11 = [(REMTemplateContentAttributes *)self hasImageAttachments];
    int v9 = v11 ^ [v4 hasImageAttachments] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMTemplateContentAttributes alloc];
  int64_t v5 = [(REMTemplateContentAttributes *)self reminderCount];
  BOOL v6 = [(REMTemplateContentAttributes *)self hasDisplayDate];
  BOOL v7 = [(REMTemplateContentAttributes *)self hasHashtags];
  BOOL v8 = [(REMTemplateContentAttributes *)self hasLocationTriggersOrVehicleEventTriggers];
  BOOL v9 = [(REMTemplateContentAttributes *)self hasImageAttachments];

  return [(REMTemplateContentAttributes *)v4 initWithReminderCount:v5 hasDisplayDate:v6 hasHashtags:v7 hasLocationTriggersOrVehicleEventTriggers:v8 hasImageAttachments:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplateContentAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"reminderCount"];
  uint64_t v6 = [v4 decodeBoolForKey:@"hasDisplayDate"];
  uint64_t v7 = [v4 decodeBoolForKey:@"hasHashtags"];
  uint64_t v8 = [v4 decodeBoolForKey:@"hasLocationTriggersOrVehicleEventTriggers"];
  uint64_t v9 = [v4 decodeBoolForKey:@"hasImageAttachments"];

  return [(REMTemplateContentAttributes *)self initWithReminderCount:v5 hasDisplayDate:v6 hasHashtags:v7 hasLocationTriggersOrVehicleEventTriggers:v8 hasImageAttachments:v9];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMTemplateContentAttributes reminderCount](self, "reminderCount"), @"reminderCount");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasDisplayDate](self, "hasDisplayDate"), @"hasDisplayDate");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasHashtags](self, "hasHashtags"), @"hasHashtags");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"), @"hasLocationTriggersOrVehicleEventTriggers");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasImageAttachments](self, "hasImageAttachments"), @"hasImageAttachments");
}

- (int64_t)reminderCount
{
  return self->_reminderCount;
}

- (BOOL)hasDisplayDate
{
  return self->_hasDisplayDate;
}

- (BOOL)hasHashtags
{
  return self->_hasHashtags;
}

- (BOOL)hasLocationTriggersOrVehicleEventTriggers
{
  return self->_hasLocationTriggersOrVehicleEventTriggers;
}

- (BOOL)hasImageAttachments
{
  return self->_hasImageAttachments;
}

@end