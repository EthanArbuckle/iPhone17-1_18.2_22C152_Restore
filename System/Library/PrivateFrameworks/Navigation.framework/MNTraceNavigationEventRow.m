@interface MNTraceNavigationEventRow
- (NSDate)date;
- (NSString)eventDescription;
- (NSString)eventName;
- (NSString)speakableEventDescription;
- (double)relativeTimestamp;
- (id)description;
- (int64_t)eventType;
- (unint64_t)locationID;
- (void)setDate:(id)a3;
- (void)setEventDescription:(id)a3;
- (void)setEventName:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setLocationID:(unint64_t)a3;
- (void)setRelativeTimestamp:(double)a3;
- (void)setSpeakableEventDescription:(id)a3;
@end

@implementation MNTraceNavigationEventRow

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  v4 = NSString;
  [(MNTraceNavigationEventRow *)self relativeTimestamp];
  v6 = objc_msgSend(v4, "stringWithFormat:", @"%0.2fs (%d)", v5, -[MNTraceNavigationEventRow locationID](self, "locationID"));
  [v3 addObject:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"YYYY-MM-dd h:mm:ss a"];
  v8 = [(MNTraceNavigationEventRow *)self date];
  v9 = [v7 stringFromDate:v8];

  [v3 addObject:v9];
  v10 = [(MNTraceNavigationEventRow *)self eventName];

  if (v10)
  {
    v11 = [(MNTraceNavigationEventRow *)self eventName];
    [v3 addObject:v11];
  }
  v12 = [(MNTraceNavigationEventRow *)self eventDescription];

  if (v12)
  {
    v13 = [(MNTraceNavigationEventRow *)self eventDescription];
    [v3 addObject:v13];
  }
  v14 = [v3 componentsJoinedByString:@" | "];

  return v14;
}

- (double)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setRelativeTimestamp:(double)a3
{
  self->_relativeTimestamp = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_locationID = a3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void)setEventDescription:(id)a3
{
}

- (NSString)speakableEventDescription
{
  return self->_speakableEventDescription;
}

- (void)setSpeakableEventDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableEventDescription, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end