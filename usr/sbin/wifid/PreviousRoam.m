@interface PreviousRoam
+ (id)roamWithBssid:(id)a3 andReason:(unint64_t)a4;
+ (void)initialize;
- (NSData)bssid;
- (NSDate)timestamp;
- (NSString)reason;
- (PreviousRoam)initWithBssid:(id)a3 andReason:(unint64_t)a4;
- (id)description;
- (void)dealloc;
- (void)setBssid:(id)a3;
- (void)setReason:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PreviousRoam

+ (void)initialize
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  qword_10027D5B0 = (uint64_t)v2;

  [v2 setDateFormat:@"HH:mm:ss"];
}

+ (id)roamWithBssid:(id)a3 andReason:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithBssid:a3 andReason:a4];

  return v4;
}

- (PreviousRoam)initWithBssid:(id)a3 andReason:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PreviousRoam;
  v6 = [(PreviousRoam *)&v8 init];
  [(PreviousRoam *)v6 setBssid:a3];
  [(PreviousRoam *)v6 setReason:+[WiFiRoamManager stringRepresentationWithReason:a4]];
  [(PreviousRoam *)v6 setTimestamp:+[NSDate date]];
  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@(%@):%@", self->_bssid, self->_reason, [(id)qword_10027D5B0 stringFromDate:self->_timestamp]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PreviousRoam;
  [(PreviousRoam *)&v3 dealloc];
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

@end