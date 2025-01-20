@interface NEKICSWrapper
+ (id)wrapperForCalendarItem:(id)a3 needsInvite:(id)a4 eventStore:(id)a5;
+ (id)wrapperForReminder:(id)a3 oldListIdentifier:(id)a4 store:(id)a5;
+ (void)setAllPropertiesForItem:(id)a3 identifier:(id)a4 wrapper:(id)a5 needsInvite:(id)a6 eventStore:(id)a7 calendar:(id)a8;
+ (void)setAllPropertiesForReminder:(id)a3 identifier:(id)a4 wrapper:(id)a5 store:(id)a6 list:(id)a7 oldListIdentifier:(id)a8;
+ (void)setMinimalPropertiesForItem:(id)a3 identifier:(id)a4 wrapper:(id)a5;
+ (void)setMinimalPropertiesForReminder:(id)a3 identifier:(id)a4 wrapper:(id)a5;
+ (void)setPropertiesForWrapper:(id)a3 withCalendarItems:(id)a4 needsInvite:(id)a5 sendAllProperties:(BOOL)a6 eventStore:(id)a7 calendar:(id)a8 originalEvent:(id)a9;
+ (void)setPropertiesForWrapper:(id)a3 withReminders:(id)a4 oldListIdentifier:(id)a5 sendAllProperties:(BOOL)a6 store:(id)a7 list:(id)a8;
- (BOOL)attendeeCommentForIdentifier:(id)a3;
- (BOOL)attendeeStatusFlagForIdentifier:(id)a3;
- (BOOL)dateChangedForIdentifier:(id)a3;
- (BOOL)hasPropertiesForIdentifier:(id)a3;
- (BOOL)isReminderWithLocation;
- (BOOL)isTaskCompleted;
- (BOOL)locationChangedForIdentifier:(id)a3;
- (BOOL)timeChangedForIdentifier:(id)a3;
- (BOOL)titleChangedForIdentifier:(id)a3;
- (NEKCalendarID)calendarIdentifier;
- (NEKICSWrapper)init;
- (NSData)ICSData;
- (NSData)lzfseICSData;
- (NSDictionary)startDateMap;
- (NSMutableDictionary)properties;
- (NSString)description;
- (NSString)nuevoIdentifier;
- (NSString)objectIdentifier;
- (NSString)oldCalendarIdentifier;
- (NSString)oldIdentifier;
- (NSString)sequencer;
- (NSString)syncId;
- (NSString)title;
- (double)taskCompletionDate;
- (id)ICSWrapperMetadata;
- (id)externalIDForIdentifier:(id)a3;
- (id)invitationStatusForIdentifier:(id)a3;
- (id)locationPredictionStateForIdentifier:(id)a3;
- (id)properInvitationStatusForIdentifier:(id)a3;
- (id)propertiesForCalendarItemIdentifier:(id)a3;
- selfAttendeeEmailForIdentifier:(id)a3;
- selfAttendeeUUIDForIdentifier:(id)a3;
- selfOrganizerEmailForIdentifier:(id)a3;
- selfOrganizerUUIDForIdentifier:(id)a3;
- (id)settablePropertiesForCalendarItemIdentifier:(id)a3;
- (id)startDateForIdentifier:(id)a3;
- (int64_t)attendeeStatusForIdentifier:(id)a3;
- (int64_t)calendarItemCount;
- (int64_t)changeType;
- (int64_t)displayOrder;
- (int64_t)objectTypeForCalendarItemWithIdentifier:(id)a3;
- (unint64_t)entityTypeForCalendarItemWithIdentifier:(id)a3;
- (void)enumerateCalendarItemIdentifiersUsingBlock:(id)a3;
- (void)setAttendeeComment:(BOOL)a3 forIdentifier:(id)a4;
- (void)setAttendeeStatus:(int64_t)a3 forIdentifier:(id)a4;
- (void)setAttendeeStatusFlag:(BOOL)a3 forIdentifier:(id)a4;
- (void)setCalendarIdentifier:(id)a3;
- (void)setCalendarItemCount:(int64_t)a3;
- (void)setDateChanged:(BOOL)a3 forIdentifier:(id)a4;
- (void)setDisplayOrder:(int64_t)a3;
- (void)setExternalID:(id)a3 forIdentifier:(id)a4;
- (void)setICSData:(id)a3;
- (void)setInvitationStatus:(unint64_t)a3 forIdentifier:(id)a4;
- (void)setIsReminderWithLocation:(BOOL)a3;
- (void)setLocationChanged:(BOOL)a3 forIdentifier:(id)a4;
- (void)setLocationPredictionState:(int64_t)a3 forIdentifier:(id)a4;
- (void)setLzfseICSData:(id)a3;
- (void)setMetadata:(id)a3 forCalendarItemIdentifier:(id)a4;
- (void)setNuevoIdentifier:(id)a3;
- (void)setOldCalendarIdentifier:(id)a3;
- (void)setOldIdentifier:(id)a3;
- (void)setProperInvitationStatus:(unint64_t)a3 forIdentifier:(id)a4;
- (void)setProperties:(id)a3;
- (void)setSelfAttendeeEmail:(id)a3 forIdentifier:(id)a4;
- (void)setSelfAttendeeUUID:(id)a3 forIdentifier:(id)a4;
- (void)setSelfOrganizerEmail:(id)a3 forIdentifier:(id)a4;
- (void)setSelfOrganizerUUID:(id)a3 forIdentifier:(id)a4;
- (void)setStartDate:(id)a3 forIdentifier:(id)a4;
- (void)setStartDateMap:(id)a3;
- (void)setSyncId:(id)a3;
- (void)setTaskCompleted:(BOOL)a3;
- (void)setTaskCompletionDate:(double)a3;
- (void)setTimeChanged:(BOOL)a3 forIdentifier:(id)a4;
- (void)setTitleChanged:(BOOL)a3 forIdentifier:(id)a4;
@end

@implementation NEKICSWrapper

- (id)ICSWrapperMetadata
{
  v2 = [(NEKICSWrapper *)self properties];
  v3 = [v2 allValues];

  return v3;
}

- (NEKICSWrapper)init
{
  v9.receiver = self;
  v9.super_class = (Class)NEKICSWrapper;
  v2 = [(NEKICSWrapper *)&v9 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    syncId = v2->_syncId;
    v2->_syncId = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    properties = v2->_properties;
    v2->_properties = v6;
  }
  return v2;
}

- (NSData)ICSData
{
  zICSData = self->_zICSData;
  if (zICSData)
  {
    uint64_t v4 = [(NSData *)zICSData NEKFluff];
  }
  else
  {
    rICSData = self->_rICSData;
    if (rICSData) {
      uint64_t v4 = rICSData;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (void)setICSData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v12[0] = 67109120;
      v12[1] = [v4 length];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting ICS, len:%d", (uint8_t *)v12, 8u);
    }
    if ((unint64_t)[v4 length] < 0x800)
    {
      zICSData = self->_zICSData;
      self->_zICSData = 0;

      v11 = (NSData *)[v4 copy];
      rICSData = self->_rICSData;
      self->_rICSData = v11;
      goto LABEL_9;
    }
    v7 = [v4 NEKSqueeze];
    v8 = self->_zICSData;
    self->_zICSData = v7;
  }
  else
  {
    v8 = self->_zICSData;
    self->_zICSData = 0;
  }

  rICSData = self->_rICSData;
  self->_rICSData = 0;
LABEL_9:
}

- (NSString)objectIdentifier
{
  syncId = self->_syncId;
  if (syncId)
  {
    v3 = syncId;
  }
  else
  {
    v3 = +[NSUUID eks_garbageUUID];
  }

  return v3;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

- (id)propertiesForCalendarItemIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_properties objectForKey:a3];
}

- (id)settablePropertiesForCalendarItemIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_properties objectForKey:v4];
  if (!v5)
  {
    v5 = objc_alloc_init(NEKICSWrapperMetadata);
    [(NSMutableDictionary *)self->_properties setObject:v5 forKey:v4];
  }

  return v5;
}

- (BOOL)hasPropertiesForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setMetadata:(id)a3 forCalendarItemIdentifier:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:");
    }
  }
}

- (NSDictionary)startDateMap
{
  startDateMap = self->_startDateMap;
  if (!startDateMap)
  {
    id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSMutableDictionary count](self->_properties, "count")];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_properties;
    id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v10, (void)v16);
          v12 = [v11 startDate];
          [v4 setObject:v10 forKey:v12];
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    v13 = (NSDictionary *)[v4 copy];
    v14 = self->_startDateMap;
    self->_startDateMap = v13;

    startDateMap = self->_startDateMap;
  }

  return startDateMap;
}

- (void)setDateChanged:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setDateChanged:v4];
}

- (BOOL)dateChangedForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 dateChanged];

  return v4;
}

- (void)setTimeChanged:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setTimeChanged:v4];
}

- (BOOL)timeChangedForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 timeChanged];

  return v4;
}

- (void)setTitleChanged:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setTitleChanged:v4];
}

- (BOOL)titleChangedForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 titleChanged];

  return v4;
}

- (void)setLocationChanged:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setLocationChanged:v4];
}

- (BOOL)locationChangedForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 locationChanged];

  return v4;
}

- (void)setAttendeeComment:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setAttendeeComment:v4];
}

- (BOOL)attendeeCommentForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 attendeeComment];

  return v4;
}

- (void)setSelfAttendeeEmail:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  id v7 = sub_100005450(v6);

  [v8 setSelfAttendeeEmail:v7];
}

- selfAttendeeEmailForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 selfAttendeeEmail];

  return v4;
}

- (void)setSelfAttendeeUUID:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  id v7 = sub_100005450(v6);

  [v8 setSelfAttendeeUUID:v7];
}

- selfAttendeeUUIDForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 selfAttendeeUUID];

  return v4;
}

- (void)setSelfOrganizerEmail:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  id v7 = sub_100005450(v6);

  [v8 setSelfOrganizerEmail:v7];
}

- selfOrganizerEmailForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 selfOrganizerEmail];

  return v4;
}

- (void)setSelfOrganizerUUID:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  id v7 = sub_100005450(v6);

  [v8 setSelfOrganizerUUID:v7];
}

- selfOrganizerUUIDForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 selfOrganizerUUID];

  return v4;
}

- (void)setInvitationStatus:(unint64_t)a3 forIdentifier:(id)a4
{
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setInvitationStatus:a3];
}

- (id)invitationStatusForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 invitationStatus]);

  return v4;
}

- (void)setProperInvitationStatus:(unint64_t)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:v6];
  [v7 setProperInvitationStatus:a3];

  id v8 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:v6];

  [v8 setHasProperInvitationStatus:1];
}

- (id)properInvitationStatusForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  if ([v3 hasProperInvitationStatus])
  {
    unsigned __int8 v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 properInvitationStatus]);
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setLocationPredictionState:(int64_t)a3 forIdentifier:(id)a4
{
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setLocationPredictionState:a3];
}

- (id)locationPredictionStateForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 locationPredictionState]);

  return v4;
}

- (void)setAttendeeStatus:(int64_t)a3 forIdentifier:(id)a4
{
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setAttendeeStatus:a3];
}

- (int64_t)attendeeStatusForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  id v4 = [v3 attendeeStatus];

  return (int64_t)v4;
}

- (void)setAttendeeStatusFlag:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v5 setAttendeeStatusFlag:v4];
}

- (BOOL)attendeeStatusFlagForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 attendeeStatusFlag];

  return v4;
}

- (void)setExternalID:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v7 setExternalID:v6];
}

- (id)externalIDForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 externalID];

  return v4;
}

- (void)setStartDate:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(NEKICSWrapper *)self settablePropertiesForCalendarItemIdentifier:a4];
  [v7 setStartDate:v6];
}

- (id)startDateForIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned __int8 v4 = [v3 startDate];

  return v4;
}

- (void)enumerateCalendarItemIdentifiersUsingBlock:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableDictionary *)self->_properties keyEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)entityTypeForCalendarItemWithIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  unsigned int v4 = [v3 entityType];

  unint64_t v5 = 1;
  if (v4 != 3) {
    unint64_t v5 = -1;
  }
  if (v4 == 2) {
    return 0;
  }
  else {
    return v5;
  }
}

- (int64_t)objectTypeForCalendarItemWithIdentifier:(id)a3
{
  v3 = [(NEKICSWrapper *)self propertiesForCalendarItemIdentifier:a3];
  id v4 = [v3 entityType];

  if (v4 == (id)1) {
    return 3;
  }
  else {
    return 2;
  }
}

- (NSString)description
{
  if (self->_calendarItemCount != 1)
  {
    long long v13 = (objc_class *)objc_opt_class();
    unint64_t v5 = NSStringFromClass(v13);
    calendarIdentifier = self->_calendarIdentifier;
    objc_super v9 = [(NEKICSWrapper *)self oldCalendarIdentifier];
    long long v10 = +[NSNumber numberWithInteger:self->_calendarItemCount];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p, calendarIdentifier = %@; oldCalendarIdentifier = %@; count = %@>",
      v5,
      self,
      calendarIdentifier,
      v9,
    long long v12 = v10);
    goto LABEL_5;
  }
  v3 = [(NEKICSWrapper *)self title];

  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  syncId = self->_syncId;
  id v7 = self->_calendarIdentifier;
  uint64_t v8 = [(NEKICSWrapper *)self oldCalendarIdentifier];
  objc_super v9 = (void *)v8;
  if (v3)
  {
    long long v10 = [(NEKICSWrapper *)self title];
    long long v11 = sub_10002D3E0(v10);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; identifier=%@; calendarIdentifier=%@; oldCalendarIdentifier=%@; title='%@'>",
      v5,
      self,
      syncId,
      v7,
      v9,
    long long v12 = v11);

LABEL_5:
    goto LABEL_7;
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; identifier=%@; calendarIdentifier=%@; oldCalendarIdentifier=%@>",
    v5,
    self,
    syncId,
    v7,
  long long v12 = v8);
LABEL_7:

  return (NSString *)v12;
}

- (NSData)lzfseICSData
{
  return self->_lzfseICSData;
}

- (void)setLzfseICSData:(id)a3
{
}

- (NEKCalendarID)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)oldCalendarIdentifier
{
  return self->_oldCalendarIdentifier;
}

- (void)setOldCalendarIdentifier:(id)a3
{
}

- (NSString)oldIdentifier
{
  return self->_oldIdentifier;
}

- (void)setOldIdentifier:(id)a3
{
}

- (NSString)nuevoIdentifier
{
  return self->_nuevoIdentifier;
}

- (void)setNuevoIdentifier:(id)a3
{
}

- (int64_t)calendarItemCount
{
  return self->_calendarItemCount;
}

- (void)setCalendarItemCount:(int64_t)a3
{
  self->_calendarItemCount = a3;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isTaskCompleted
{
  return self->_taskCompleted;
}

- (void)setTaskCompleted:(BOOL)a3
{
  self->_taskCompleted = a3;
}

- (double)taskCompletionDate
{
  return self->_taskCompletionDate;
}

- (void)setTaskCompletionDate:(double)a3
{
  self->_taskCompletionDate = a3;
}

- (int64_t)displayOrder
{
  return self->_displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  self->_displayOrder = a3;
}

- (BOOL)isReminderWithLocation
{
  return self->_isReminderWithLocation;
}

- (void)setIsReminderWithLocation:(BOOL)a3
{
  self->_isReminderWithLocation = a3;
}

- (void)setStartDateMap:(id)a3
{
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncId, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_startDateMap, 0);
  objc_storeStrong((id *)&self->_nuevoIdentifier, 0);
  objc_storeStrong((id *)&self->_oldIdentifier, 0);
  objc_storeStrong((id *)&self->_oldCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_lzfseICSData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_rICSData, 0);

  objc_storeStrong((id *)&self->_zICSData, 0);
}

+ (id)wrapperForReminder:(id)a3 oldListIdentifier:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v48 = v8;
  [v8 alarms];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v54 count:16];
  id v47 = v10;
  if (v12)
  {
    id v13 = v12;
    id v45 = a1;
    uint64_t v14 = *(void *)v50;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v17 = [v16 trigger];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = [v16 trigger];
          long long v19 = [v18 structuredLocation];

          if (v19)
          {
            ct_green_tea_logger_create();
            v20 = getCTGreenTeaOsLogHandle();
            v21 = v20;
            if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Read in location for a reminder", buf, 2u);
            }

            ct_green_tea_logger_destroy();
            unsigned int v43 = 1;
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    unsigned int v43 = 0;
LABEL_17:
    a1 = v45;
  }
  else
  {
    unsigned int v43 = 0;
  }

  v22 = objc_alloc_init(NEKICSWrapper);
  v23 = [v8 list];
  v24 = [[NEKCalendarID alloc] initWithList:v23];
  [(NEKICSWrapper *)v22 setCalendarIdentifier:v24];

  [(NEKICSWrapper *)v22 setCalendarItemCount:1];
  v44 = [v23 store];
  id v53 = v8;
  v25 = +[NSArray arrayWithObjects:&v53 count:1];
  v46 = v23;
  [a1 setPropertiesForWrapper:v22 withReminders:v25 oldListIdentifier:v9 sendAllProperties:1 store:v10 list:v23];

  v26 = +[REMExporting icsTodoFromReminder:v8 exportingOption:REMICSExportingEventKitSync];
  id v27 = objc_alloc_init((Class)ICSCalendar);
  id v28 = v26;
  id v29 = v27;
  id v30 = objc_alloc_init((Class)ICSCalendar);
  if (v30)
  {
    [v30 setX_calendarserver_access:[v29 x_calendarserver_access]];
    *(void *)buf = v28;
    v31 = +[NSArray arrayWithObjects:buf count:1];
    [v30 setComponents:v31 options:2];

    id v32 = v30;
    id v34 = [objc_alloc((Class)ICSDocument) initWithCalendar:v32];
    v35 = [v34 ICSDataWithOptions:68];

    v36 = v33;
    id v10 = v47;
  }
  else
  {
    v35 = 0;
  }

  v37 = *(NSObject **)(qword_1000C6CB0 + 8);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_10006C268(v37, (uint64_t)v35);
  }
  [(NEKICSWrapper *)v22 setICSData:v35];

  v38 = [v48 daCalendarItemUniqueIdentifier];
  [(NEKICSWrapper *)v22 setSyncId:v38];

  v39 = [v48 title];
  uint64_t v40 = [v39 string];
  title = v22->_title;
  v22->_title = (NSString *)v40;

  [(NEKICSWrapper *)v22 setIsReminderWithLocation:v43];
  -[NEKICSWrapper setDisplayOrder:](v22, "setDisplayOrder:", [v48 icsDisplayOrder]);

  return v22;
}

+ (void)setAllPropertiesForReminder:(id)a3 identifier:(id)a4 wrapper:(id)a5 store:(id)a6 list:(id)a7 oldListIdentifier:(id)a8
{
  id v19 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  v15 = [a3 externalIdentifier];
  if (v15) {
    [v12 setExternalID:v15 forIdentifier:v19];
  }
  if (v14)
  {
    [v12 setOldCalendarIdentifier:v14];
  }
  else
  {
    long long v16 = [v13 objectID];
    long long v17 = [v16 uuid];
    long long v18 = [v17 UUIDString];
    [v12 setOldCalendarIdentifier:v18];
  }
}

+ (void)setMinimalPropertiesForReminder:(id)a3 identifier:(id)a4 wrapper:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isCompleted])
  {
    id v10 = [v7 completionDate];
    [v9 setTaskCompleted:1];
    [v10 timeIntervalSinceReferenceDate];
    [v9 setTaskCompletionDate:];
    id v11 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting task with identifier %{public}@ as completed, completion date is %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

+ (void)setPropertiesForWrapper:(id)a3 withReminders:(id)a4 oldListIdentifier:(id)a5 sendAllProperties:(BOOL)a6 store:(id)a7 list:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  BOOL v17 = v10;
  id v18 = a1;
  id v48 = v16;
  id v47 = a7;
  id v46 = a8;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v15;
  id v19 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v19)
  {
    id v21 = v19;
    uint64_t v50 = *(void *)v52;
    *(void *)&long long v20 = 138543618;
    long long v43 = v20;
    BOOL v44 = v17;
    id v45 = a1;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v52 != v50) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v22);
        v25 = [v23 daCalendarItemUniqueIdentifier];
        if (v25) {
          goto LABEL_10;
        }
        v26 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10006C338(v59, v26, v23, &v60);
        }
        id v27 = [v23 remObjectID:v43];
        id v28 = [v27 uuid];
        v25 = [v28 UUIDString];

        if (v25)
        {
LABEL_10:
          id v29 = [v14 settablePropertiesForCalendarItemIdentifier:v25, v43];
          [v29 setEntityType:1];
          if (os_variant_has_internal_diagnostics())
          {
            id v30 = *(NSObject **)(qword_1000C6CA8 + 8);
            BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            if (v17)
            {
              if (v31)
              {
                id v32 = v30;
                v33 = [v23 eks_debugDesc];
                id v34 = [v23 daCalendarItemUniqueIdentifier];
                *(_DWORD *)buf = 138412546;
                v56 = v33;
                __int16 v57 = 2114;
                v58 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Setting all properties on %@, identifier: %{public}@", buf, 0x16u);

                id v18 = v45;
                BOOL v17 = v44;
              }
LABEL_15:
              [v18 setAllPropertiesForReminder:v23 identifier:v25 wrapper:v14 store:v47 list:v46 oldListIdentifier:v48];
LABEL_19:

              goto LABEL_20;
            }
            if (v31)
            {
              v35 = v30;
              v36 = [v23 eks_debugDesc];
              v37 = [v23 daCalendarItemUniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v56 = v36;
              __int16 v57 = 2114;
              v58 = v37;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Setting minimal properties on %@, identifier: %{public}@", buf, 0x16u);

              BOOL v17 = v44;
              id v18 = v45;
            }
          }
          else if (v17)
          {
            goto LABEL_15;
          }
          [v18 setMinimalPropertiesForReminder:v23 identifier:v25 wrapper:v14];
          goto LABEL_19;
        }
        v38 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = v38;
          uint64_t v40 = [v23 eks_debugDesc];
          v41 = [v23 daCalendarItemUniqueIdentifier];
          *(_DWORD *)buf = v43;
          v56 = v40;
          __int16 v57 = 2114;
          v58 = v41;
          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Can't create canonical unique identifier for reminder %{public}@. Identifier returned by REMReminder is %{public}@", buf, 0x16u);

          id v18 = v45;
        }
LABEL_20:
        v22 = (char *)v22 + 1;
      }
      while (v21 != v22);
      id v42 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      id v21 = v42;
    }
    while (v42);
  }
}

+ (id)wrapperForCalendarItem:(id)a3 needsInvite:(id)a4 eventStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = [v11 uniqueId];
    if ([v11 isDetached])
    {
      id v13 = v10;
      id v14 = [v11 originalItem];
      if (v14)
      {
        id v15 = v14;
        id v16 = [v14 uniqueId];
        BOOL v17 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v83 = v12;
          __int16 v84 = 2112;
          v85 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "wrapperForCalendarItem: Entity with identifier %{public}@ is detached, master identifier is %@", buf, 0x16u);
        }
        id v18 = v15;

        uint64_t v19 = 0;
        id v8 = v18;
      }
      else
      {
        id v30 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v83 = v12;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Entity with identifier %{public}@ is detached, but can't get master", buf, 0xCu);
        }
        uint64_t v19 = 0;
        id v18 = 0;
        id v8 = v11;
      }
      id v10 = v13;
    }
    else
    {
      if ([v11 hasRecurrenceRules])
      {
        id v11 = v11;
        id v27 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v83 = v12;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Entity with identifier %{public}@ is master for a recurring series", buf, 0xCu);
        }
        uint64_t v19 = 0;
        id v18 = v11;
      }
      else
      {
        uint64_t v19 = 0;
        id v18 = 0;
      }
      id v8 = v11;
    }
LABEL_34:

    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 alarms];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [v12 countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v20)
    {
      id v21 = v20;
      id v22 = v10;
      id v23 = v9;
      uint64_t v24 = *(void *)v77;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v77 != v24) {
            objc_enumerationMutation(v12);
          }
          v26 = [*(id *)(*((void *)&v76 + 1) + 8 * i) structuredLocation];

          if (v26)
          {
            ct_green_tea_logger_create();
            id v28 = getCTGreenTeaOsLogHandle();
            id v29 = v28;
            if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Read in location for a reminder", buf, 2u);
            }

            ct_green_tea_logger_destroy();
            id v18 = 0;
            uint64_t v19 = 1;
            goto LABEL_26;
          }
        }
        id v21 = [v12 countByEnumeratingWithState:&v76 objects:v81 count:16];
        if (v21) {
          continue;
        }
        break;
      }
      uint64_t v19 = 0;
      id v18 = 0;
LABEL_26:
      id v11 = v12;
      id v9 = v23;
      id v10 = v22;
    }
    else
    {
      uint64_t v19 = 0;
      id v18 = 0;
      id v11 = v12;
    }
    goto LABEL_34;
  }
  uint64_t v19 = 0;
  id v18 = 0;
LABEL_35:
  BOOL v31 = objc_alloc_init(NEKICSWrapper);
  id v32 = [v8 calendar];
  v33 = [[NEKCalendarID alloc] initWithCalendar:v32];
  [(NEKICSWrapper *)v31 setCalendarIdentifier:v33];

  [(NEKICSWrapper *)v31 setCalendarItemCount:1];
  uint64_t v73 = [v32 eventStore];
  id v80 = v8;
  +[NSArray arrayWithObjects:&v80 count:1];
  v75 = v74 = v9;
  v71 = v10;
  [a1 setPropertiesForWrapper:v31 withCalendarItems:0 needsInvite:0 sendAllProperties:0 eventStore:0 calendar:0 originalEvent:0];
  id v34 = +[NEKEnvironment instance];
  v35 = [v34 recordMap];

  v36 = [v8 objectID];
  v70 = v35;
  v37 = [v35 identifierForRecordID:v36];

  v38 = [v8 eks_compoundIdentifier];
  v39 = v38;
  if (v38)
  {
    if (v37)
    {
      if (([v38 isEqualToString:v37] & 1) == 0)
      {
        uint64_t v40 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v83 = v37;
          __int16 v84 = 2114;
          v85 = v39;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "CalendarItem remap detected: %{public}@ => %{public}@", buf, 0x16u);
        }
      }
    }
  }
  v72 = v39;
  if (v31 && v37)
  {
    uint64_t v41 = v19;
    id v42 = v18;
    id v43 = a1;
    BOOL v44 = v31;
    id v45 = [v37 componentsSeparatedByString:@"::"];
    if ([v45 count] == (id)2)
    {
      id v46 = [v45 objectAtIndexedSubscript:0];
      [(NEKICSWrapper *)v44 setOldIdentifier:v46];

      id v47 = [v72 componentsSeparatedByString:@"::"];

      id v48 = [v47 objectAtIndexedSubscript:0];
      [(NEKICSWrapper *)v44 setNuevoIdentifier:v48];

      id v45 = v47;
    }

    a1 = v43;
    id v18 = v42;
    uint64_t v19 = v41;
  }
  long long v49 = (void *)v73;
  if (v18)
  {
    uint64_t v50 = [v18 detachedItems];
    long long v51 = [v50 allObjects];

    if ([v51 count])
    {
      uint64_t v52 = v19;
      id v53 = a1;
      long long v54 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = [v18 uniqueIdentifier];
        unsigned int v57 = [v51 count];
        *(_DWORD *)buf = 138543618;
        id v83 = v56;
        __int16 v84 = 1024;
        LODWORD(v85) = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Handling detached events for %{public}@, count=%d", buf, 0x12u);
      }
      [v53 setPropertiesForWrapper:v31 withCalendarItems:v51 needsInvite:v74 sendAllProperties:1 eventStore:0 calendar:0 originalEvent:v18];
      uint64_t v19 = v52;
      long long v49 = (void *)v73;
    }
  }
  v58 = +[NEKCapabilities instance];
  unsigned int v59 = [v58 canUseLzfse];

  if (v59) {
    uint64_t v60 = 130;
  }
  else {
    uint64_t v60 = 2;
  }
  v61 = [v49 ICSDataForCalendarItems:v75 options:v60];
  if (v59)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v62 = *(NSObject **)(qword_1000C6CB0 + 8);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v62;
        v64 = [v61 base64EncodedStringWithOptions:0];
        *(_DWORD *)buf = 138412290;
        id v83 = v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "LZFSE ICS: <<!%@!>>", buf, 0xCu);
      }
    }
    [(NEKICSWrapper *)v31 setLzfseICSData:v61];
  }
  else
  {
    v65 = *(NSObject **)(qword_1000C6CB0 + 8);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
      sub_10006C268(v65, (uint64_t)v61);
    }
    [(NEKICSWrapper *)v31 setICSData:v61];
  }

  v66 = sub_1000614D4(v8);
  [(NEKICSWrapper *)v31 setSyncId:v66];

  uint64_t v67 = [v8 title];
  title = v31->_title;
  v31->_title = (NSString *)v67;

  [(NEKICSWrapper *)v31 setIsReminderWithLocation:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[NEKICSWrapper setDisplayOrder:](v31, "setDisplayOrder:", [v8 displayOrder]);
  }

  return v31;
}

+ (void)setAllPropertiesForItem:(id)a3 identifier:(id)a4 wrapper:(id)a5 needsInvite:(id)a6 eventStore:(id)a7 calendar:(id)a8
{
  id v38 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [v38 selfAttendee];
  uint64_t v19 = v18;
  if (v18)
  {
    [v14 setAttendeeStatus:[v18 participantStatus] forIdentifier:v13];
    id v20 = [v19 emailAddress];
    [v14 setSelfAttendeeEmail:v20 forIdentifier:v13];
    id v21 = [v19 URL];
    id v22 = [v21 absoluteString];
    [v14 setSelfAttendeeUUID:v22 forIdentifier:v13];
  }
  id v23 = [v38 organizer];
  uint64_t v24 = v23;
  if (v23 && [v23 isCurrentUser])
  {
    v25 = [v24 emailAddress];
    [v14 setSelfOrganizerEmail:v25 forIdentifier:v13];
    v26 = [v24 URL];
    id v27 = [v26 absoluteString];
    [v14 setSelfOrganizerUUID:v27 forIdentifier:v13];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v29 = v38;
  if (isKindOfClass)
  {
    id v30 = v38;
    BOOL v31 = [v30 startDate];
    [v14 setStartDate:v31 forIdentifier:v13];

    [v14 setDateChanged:[v30 dateChanged] forIdentifier:v13];
    [v14 setTimeChanged:[v30 timeChanged] forIdentifier:v13];
    [v14 setTitleChanged:[v30 titleChanged] forIdentifier:v13];
    [v14 setLocationChanged:[v30 locationChanged] forIdentifier:v13];
    [v14 setAttendeeComment:[v30 attendeeComment] forIdentifier:v13];
    [v14 setAttendeeStatusFlag:[v30 attendeeStatus] forIdentifier:v13];
    id v32 = [v30 invitationStatus];
    if ([v15 containsObject:v13]) {
      [v14 setInvitationStatus:v32 forIdentifier:v13];
    }
    [v14 setProperInvitationStatus:v32 forIdentifier:v13];

    id v29 = v38;
  }
  v33 = [v29 externalID];
  if (v33) {
    [v14 setExternalID:v33 forIdentifier:v13];
  }
  if (v17)
  {
    id v34 = sub_1000614D4(v17);
    if (!v16)
    {
      [v14 setOldCalendarIdentifier:v34];
LABEL_21:

      goto LABEL_22;
    }
    v35 = [v16 calendarIdentifierInRowMappingForEventOrTask:v38];
    if (v35)
    {
      v36 = v14;
      v37 = v35;
    }
    else
    {
      if ([v16 hasRowMappingForEntity:v38])
      {
LABEL_20:

        goto LABEL_21;
      }
      v36 = v14;
      v37 = v34;
    }
    [v36 setOldCalendarIdentifier:v37];
    goto LABEL_20;
  }
LABEL_22:
}

+ (void)setMinimalPropertiesForItem:(id)a3 identifier:(id)a4 wrapper:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 objectID];
  id v11 = [v10 entityType];

  if (v11 == (id)3)
  {
    id v12 = [v7 completionDate];
    if (v12)
    {
      [v9 setTaskCompleted:1];
      [v12 timeIntervalSinceReferenceDate];
      [v9 setTaskCompletionDate:];
      id v15 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        *(void *)id v17 = v8;
        *(_WORD *)&v17[8] = 2114;
        *(void *)&v17[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting task with identifier %{public}@ as completed, completion date is %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
    goto LABEL_10;
  }
  if (v11 == (id)2)
  {
    id v12 = [v7 selfAttendee];
    if (v12)
    {
      id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        int v16 = 67109378;
        *(_DWORD *)id v17 = [v12 participantStatus];
        *(_WORD *)&v17[4] = 2114;
        *(void *)&v17[6] = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "self attendee status is 0x%08x for event with identifier %{public}@", (uint8_t *)&v16, 0x12u);
      }
      [v9 setAttendeeStatus:[v12 participantStatus] forIdentifier:v8];
    }
LABEL_10:
  }
}

+ (void)setPropertiesForWrapper:(id)a3 withCalendarItems:(id)a4 needsInvite:(id)a5 sendAllProperties:(BOOL)a6 eventStore:(id)a7 calendar:(id)a8 originalEvent:(id)a9
{
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v43 = a5;
  id v42 = a7;
  id v41 = a8;
  id v38 = a9;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v15;
  id v16 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v46 = *(void *)v48;
    id v40 = v14;
    BOOL v39 = v11;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v48 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v21 = [v19 uniqueId];
        if (v21)
        {
          id v22 = [v14 settablePropertiesForCalendarItemIdentifier:v21];
          id v23 = [v19 objectID];
          id v24 = [v23 entityType];

          [v22 setEntityType:v24 == (id)3];
          if (os_variant_has_internal_diagnostics())
          {
            v25 = [v19 attendees];
            unsigned int v26 = [v25 count];

            id v27 = *(NSObject **)(qword_1000C6CA8 + 8);
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if (v11)
            {
              if (v28)
              {
                id v29 = v27;
                id v30 = [v19 eks_debugDesc];
                BOOL v31 = [v19 uniqueIdentifier];
                *(_DWORD *)buf = 138412802;
                uint64_t v52 = v30;
                __int16 v53 = 2114;
                long long v54 = v31;
                __int16 v55 = 1024;
                unsigned int v56 = v26;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Setting all properties on %@, identifier: %{public}@, attendees: %d", buf, 0x1Cu);

                id v14 = v40;
                BOOL v11 = v39;
              }
            }
            else if (v28)
            {
              v35 = v27;
              v36 = [v19 eks_debugDesc];
              v37 = [v19 uniqueIdentifier];
              *(_DWORD *)buf = 138412802;
              uint64_t v52 = v36;
              __int16 v53 = 2114;
              long long v54 = v37;
              __int16 v55 = 1024;
              unsigned int v56 = v26;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Setting minimal properties on %@, identifier: %{public}@, attendees: %d", buf, 0x1Cu);

              BOOL v11 = v39;
              id v14 = v40;
            }
          }
          if (v11) {
            [a1 setAllPropertiesForItem:v19 identifier:v21 wrapper:v14 needsInvite:v43 eventStore:v42 calendar:v41];
          }
          else {
            [a1 setMinimalPropertiesForItem:v19 identifier:v21 wrapper:v14];
          }
        }
        else
        {
          id v32 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v33 = v32;
            id v34 = [v19 uniqueId];
            *(_DWORD *)buf = 138543618;
            uint64_t v52 = v19;
            __int16 v53 = 2114;
            long long v54 = v34;
            _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Can't create canonical unique identifier for event %{public}@. Identifier returned by CalCalendarItemCopyUniqueIdentifier is %{public}@", buf, 0x16u);

            BOOL v11 = v39;
            id v14 = v40;
          }
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v17);
  }
}

@end