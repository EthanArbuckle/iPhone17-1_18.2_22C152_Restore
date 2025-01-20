@interface _TransitPayTipInteractionRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isTourist;
- (NSDate)dismissalDate;
- (NSDate)lastDisplayed;
- (NSMutableDictionary)displayCountForSinks;
- (_TransitPayTipInteractionRecord)initWithCoder:(id)a3;
- (_TransitPayTipInteractionRecord)initWithTipType:(int)a3 isTourist:(BOOL)a4;
- (id)incrementDisplayCountForSink:(int)a3;
- (int)tipType;
- (int64_t)displayCountForSink:(int)a3;
- (void)_resetTipDisplayCountForSink:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDismissalDate:(id)a3;
- (void)setDisplayCountForSinks:(id)a3;
- (void)setIsTourist:(BOOL)a3;
- (void)setLastDisplayed:(id)a3;
- (void)setTipType:(int)a3;
- (void)userDismissedInSink:(int)a3;
@end

@implementation _TransitPayTipInteractionRecord

- (_TransitPayTipInteractionRecord)initWithTipType:(int)a3 isTourist:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_TransitPayTipInteractionRecord;
  v6 = [(_TransitPayTipInteractionRecord *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_isTourist = a4;
    v6->_tipType = a3;
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    displayCountForSinks = v7->_displayCountForSinks;
    v7->_displayCountForSinks = v8;

    dismissalDate = v7->_dismissalDate;
    v7->_dismissalDate = 0;

    lastDisplayed = v7->_lastDisplayed;
    v7->_lastDisplayed = 0;
  }
  return v7;
}

- (id)incrementDisplayCountForSink:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [objc_alloc((Class)NSNumber) initWithInteger:([_TransitPayTipInteractionRecord displayCountForSink:self] + 1)];
  v6 = +[NSNumber numberWithInt:v3];
  v7 = [v6 stringValue];

  [(NSMutableDictionary *)self->_displayCountForSinks setObject:v5 forKeyedSubscript:v7];
  v8 = +[NSDate now];
  lastDisplayed = self->_lastDisplayed;
  self->_lastDisplayed = v8;

  return v5;
}

- (int64_t)displayCountForSink:(int)a3
{
  id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  v6 = [v5 stringValue];

  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_displayCountForSinks objectForKey:v6];
    if (!v7)
    {
      v8 = sub_100021338();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        CFStringRef v9 = @"UNKNOWN SINK TYPE";
        if (a3 == 4) {
          CFStringRef v9 = @"SinkTypeRoutePlanning";
        }
        if (a3 == 2) {
          CFStringRef v9 = @"SinkTypeMapsHome";
        }
        int v12 = 138412290;
        CFStringRef v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ did not have a display count, setting to 0", (uint8_t *)&v12, 0xCu);
      }

      v7 = &off_1013A9DD8;
    }
    int64_t v10 = (int)[v7 intValue];
  }
  else
  {
    v7 = sub_100021338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Sink type key is null, this should never happen", (uint8_t *)&v12, 2u);
    }
    int64_t v10 = 0;
  }

  return v10;
}

- (void)userDismissedInSink:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[NSDate now];
  dismissalDate = self->_dismissalDate;
  self->_dismissalDate = v5;

  [(_TransitPayTipInteractionRecord *)self _resetTipDisplayCountForSink:v3];
}

- (void)_resetTipDisplayCountForSink:(int)a3
{
  displayCountForSinks = self->_displayCountForSinks;
  id v5 = +[NSNumber numberWithInt:*(void *)&a3];
  v6 = [v5 stringValue];

  [(NSMutableDictionary *)displayCountForSinks setObject:&off_1013A9DD8 forKeyedSubscript:v6];
  lastDisplayed = self->_lastDisplayed;
  self->_lastDisplayed = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TransitPayTipInteractionRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_TransitPayTipInteractionRecord;
  id v5 = [(_TransitPayTipInteractionRecord *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissalDate"];
    dismissalDate = v5->_dismissalDate;
    v5->_dismissalDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastDisplayed"];
    lastDisplayed = v5->_lastDisplayed;
    v5->_lastDisplayed = (NSDate *)v8;

    v5->_isTourist = [v4 decodeBoolForKey:@"isTourist"];
    v5->_tipType = [v4 decodeInt32ForKey:@"tipType"];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    int v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    CFStringRef v13 = [v4 decodeObjectOfClasses:v12 forKey:@"displayCountForSinks"];
    v14 = (NSMutableDictionary *)[v13 mutableCopy];
    displayCountForSinks = v5->_displayCountForSinks;
    v5->_displayCountForSinks = v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dismissalDate = self->_dismissalDate;
  id v5 = a3;
  [v5 encodeObject:dismissalDate forKey:@"dismissalDate"];
  [v5 encodeObject:self->_lastDisplayed forKey:@"lastDisplayed"];
  [v5 encodeBool:self->_isTourist forKey:@"isTourist"];
  [v5 encodeInt32:self->_tipType forKey:@"tipType"];
  id v6 = [(NSMutableDictionary *)self->_displayCountForSinks copy];
  [v5 encodeObject:v6 forKey:@"displayCountForSinks"];
}

- (NSDate)lastDisplayed
{
  return self->_lastDisplayed;
}

- (void)setLastDisplayed:(id)a3
{
}

- (int)tipType
{
  return self->_tipType;
}

- (void)setTipType:(int)a3
{
  self->_tipType = a3;
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(BOOL)a3
{
  self->_isTourist = a3;
}

- (NSMutableDictionary)displayCountForSinks
{
  return self->_displayCountForSinks;
}

- (void)setDisplayCountForSinks:(id)a3
{
}

- (NSDate)dismissalDate
{
  return self->_dismissalDate;
}

- (void)setDismissalDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalDate, 0);
  objc_storeStrong((id *)&self->_displayCountForSinks, 0);

  objc_storeStrong((id *)&self->_lastDisplayed, 0);
}

@end