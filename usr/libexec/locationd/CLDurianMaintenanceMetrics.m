@interface CLDurianMaintenanceMetrics
- (BOOL)neededDiscovery;
- (CLDurianMaintenanceMetrics)init;
- (NSDictionary)groupMaintDeltas;
- (NSDictionary)maintainedCategoryCountDictionary;
- (NSDictionary)maintainedReasonCountDictionary;
- (NSString)deviceTypes;
- (NSString)forceReason;
- (NSString)loiType;
- (double)assertionDuration;
- (double)duration;
- (double)referenceTime;
- (double)timeBetweenTriggers;
- (int)coex;
- (int)devices;
- (int)leashable;
- (void)accumulateMaintainedReasonCountWithReason:(id)a3 andCategory:(unint64_t)a4;
- (void)dealloc;
- (void)resetWithTime:(double)a3;
- (void)setAssertionDuration:(double)a3;
- (void)setCoex:(int)a3;
- (void)setDeviceTypes:(id)a3;
- (void)setDevices:(int)a3;
- (void)setDuration:(double)a3;
- (void)setForceReason:(id)a3;
- (void)setGroupMaintDelta:(int)a3 forUUID:(id)a4;
- (void)setLeashable:(int)a3;
- (void)setLoiType:(id)a3;
- (void)setNeededDiscovery:(BOOL)a3;
- (void)setReferenceTime:(double)a3;
- (void)setTimeBetweenTriggers:(double)a3;
- (void)startNewMaintEventWithCount:(int)a3 leashable:(int)a4 deviceTypes:(id)a5 coex:(int)a6 loiType:(id)a7;
@end

@implementation CLDurianMaintenanceMetrics

- (CLDurianMaintenanceMetrics)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLDurianMaintenanceMetrics;
  v2 = [(CLDurianMaintenanceMetrics *)&v4 init];
  if (v2)
  {
    v2->_groupMaintDeltas = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_maintainedReasonCountDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_maintainedCategoryCountDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianMaintenanceMetrics;
  [(CLDurianMaintenanceMetrics *)&v3 dealloc];
}

- (void)resetWithTime:(double)a3
{
  self->_referenceTime = a3;
  *(void *)&self->_devices = 0;
  self->_neededDiscovery = 0;
  self->_coex = 0;
  self->_timeBetweenTriggers = 0.0;
  self->_duration = 0.0;
  [(CLDurianMaintenanceMetrics *)self setForceReason:@"none"];
  [(CLDurianMaintenanceMetrics *)self setLoiType:@"none"];
  [(NSMutableDictionary *)self->_groupMaintDeltas removeAllObjects];
  [(NSMutableDictionary *)self->_maintainedReasonCountDictionary removeAllObjects];
  maintainedCategoryCountDictionary = self->_maintainedCategoryCountDictionary;

  [(NSMutableDictionary *)maintainedCategoryCountDictionary removeAllObjects];
}

- (NSDictionary)maintainedReasonCountDictionary
{
  id v2 = [(NSMutableDictionary *)self->_maintainedReasonCountDictionary copy];

  return (NSDictionary *)v2;
}

- (NSDictionary)maintainedCategoryCountDictionary
{
  id v2 = [(NSMutableDictionary *)self->_maintainedCategoryCountDictionary copy];

  return (NSDictionary *)v2;
}

- (void)startNewMaintEventWithCount:(int)a3 leashable:(int)a4 deviceTypes:(id)a5 coex:(int)a6 loiType:(id)a7
{
  self->_devices = a3;
  self->_leashable = a4;
  [(CLDurianMaintenanceMetrics *)self setDeviceTypes:a5];
  if (self->_referenceTime == 0.0) {
    CFAbsoluteTime v10 = -1.0;
  }
  else {
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent() - self->_referenceTime;
  }
  self->_timeBetweenTriggers = v10;
  self->_referenceTime = CFAbsoluteTimeGetCurrent();
  self->_coex = a6;

  [(CLDurianMaintenanceMetrics *)self setLoiType:a7];
}

- (void)accumulateMaintainedReasonCountWithReason:(id)a3 andCategory:(unint64_t)a4
{
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_maintainedReasonCountDictionary, "objectForKeyedSubscript:"))
  {
    v7 = [NSNumber numberWithInt:][self->_maintainedReasonCountDictionary objectForKeyedSubscript:a3].intValue+ 1];
    maintainedReasonCountDictionary = self->_maintainedReasonCountDictionary;
  }
  else
  {
    maintainedReasonCountDictionary = self->_maintainedReasonCountDictionary;
    v7 = (NSNumber *)&off_102395390;
  }
  [(NSMutableDictionary *)maintainedReasonCountDictionary setObject:v7 forKeyedSubscript:a3];
  if ([(NSMutableDictionary *)self->_maintainedCategoryCountDictionary objectForKeyedSubscript:+[NSNumber numberWithUnsignedInteger:a4]])
  {
    v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [self->_maintainedCategoryCountDictionary objectForKeyedSubscript:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4)]+ 1);
    maintainedCategoryCountDictionary = self->_maintainedCategoryCountDictionary;
    v11 = +[NSNumber numberWithUnsignedInteger:a4];
    v12 = maintainedCategoryCountDictionary;
    v13 = v9;
  }
  else
  {
    v14 = self->_maintainedCategoryCountDictionary;
    v11 = +[NSNumber numberWithUnsignedInteger:a4];
    v13 = (NSNumber *)&off_102395390;
    v12 = v14;
  }

  [(NSMutableDictionary *)v12 setObject:v13 forKeyedSubscript:v11];
}

- (void)setGroupMaintDelta:(int)a3 forUUID:(id)a4
{
  v6 = +[NSNumber numberWithInt:*(void *)&a3];
  groupMaintDeltas = self->_groupMaintDeltas;

  [(NSMutableDictionary *)groupMaintDeltas setObject:v6 forKeyedSubscript:a4];
}

- (double)referenceTime
{
  return self->_referenceTime;
}

- (void)setReferenceTime:(double)a3
{
  self->_referenceTime = a3;
}

- (double)timeBetweenTriggers
{
  return self->_timeBetweenTriggers;
}

- (void)setTimeBetweenTriggers:(double)a3
{
  self->_timeBetweenTriggers = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)assertionDuration
{
  return self->_assertionDuration;
}

- (void)setAssertionDuration:(double)a3
{
  self->_assertionDuration = a3;
}

- (BOOL)neededDiscovery
{
  return self->_neededDiscovery;
}

- (void)setNeededDiscovery:(BOOL)a3
{
  self->_neededDiscovery = a3;
}

- (int)coex
{
  return self->_coex;
}

- (void)setCoex:(int)a3
{
  self->_coex = a3;
}

- (int)devices
{
  return self->_devices;
}

- (void)setDevices:(int)a3
{
  self->_devices = a3;
}

- (int)leashable
{
  return self->_leashable;
}

- (void)setLeashable:(int)a3
{
  self->_leashable = a3;
}

- (NSString)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setDeviceTypes:(id)a3
{
}

- (NSString)forceReason
{
  return self->_forceReason;
}

- (void)setForceReason:(id)a3
{
}

- (NSString)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(id)a3
{
}

- (NSDictionary)groupMaintDeltas
{
  return &self->_groupMaintDeltas->super;
}

@end