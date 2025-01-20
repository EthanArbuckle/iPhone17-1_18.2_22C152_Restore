@interface DADeviceState
+ (BOOL)supportsSecureCoding;
- (BOOL)object:(id)a3 isEqualToObject:(id)a4;
- (DADeviceState)init;
- (DADeviceState)initWithCoder:(id)a3;
- (DADeviceState)initWithDEDDevice:(id)a3;
- (DADeviceState)initWithSerialNumber:(id)a3 attributes:(id)a4;
- (DASessionSettings)sessionSettings;
- (NSArray)errors;
- (NSArray)history;
- (NSArray)suitesAvailable;
- (NSData)testSuiteImageData;
- (NSDictionary)attributes;
- (NSNumber)progress;
- (NSNumber)suiteID;
- (NSNumber)timestamp;
- (NSString)diagnosticEventID;
- (NSString)serialNumber;
- (NSString)suiteDescription;
- (NSString)suiteName;
- (double)durationRemaining;
- (id)_stringForPhase:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)phase;
- (void)_sendChangeNotification;
- (void)_sendChangeNotificationIfNeeded;
- (void)addErrorCode:(int64_t)a3 userInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeErrorCode:(int64_t)a3;
- (void)removeErrorCodes:(id)a3;
- (void)resetState;
- (void)setDiagnosticEventID:(id)a3;
- (void)setDurationRemaining:(double)a3;
- (void)setErrors:(id)a3;
- (void)setHistory:(id)a3;
- (void)setPhase:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)setSessionSettings:(id)a3;
- (void)setSuiteDescription:(id)a3;
- (void)setSuiteID:(id)a3;
- (void)setSuiteName:(id)a3;
- (void)setSuitesAvailable:(id)a3;
- (void)setTestSuiteImageData:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)transactionWithBlock:(id)a3;
- (void)updateWithDeviceState:(id)a3;
@end

@implementation DADeviceState

- (DADeviceState)init
{
  v20.receiver = self;
  v20.super_class = (Class)DADeviceState;
  v2 = [(DADeviceState *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v2->_phase = 0;
    diagnosticEventID = v2->_diagnosticEventID;
    v2->_diagnosticEventID = 0;

    suiteID = v3->_suiteID;
    v3->_suiteID = 0;

    suiteName = v3->_suiteName;
    v3->_suiteName = 0;

    suiteDescription = v3->_suiteDescription;
    v3->_suiteDescription = 0;

    suitesAvailable = v3->_suitesAvailable;
    v3->_suitesAvailable = (NSArray *)&__NSArray0__struct;

    progress = v3->_progress;
    v3->_progress = (NSNumber *)&off_100019920;

    v3->_durationRemaining = 0.0;
    history = v3->_history;
    v3->_history = (NSArray *)&__NSArray0__struct;

    errors = v3->_errors;
    v3->_errors = (NSArray *)&__NSArray0__struct;

    timestamp = v3->_timestamp;
    v3->_timestamp = 0;

    attributes = v3->_attributes;
    v3->_attributes = (NSDictionary *)&__NSDictionary0__struct;

    serialNumber = v3->_serialNumber;
    v3->_serialNumber = (NSString *)@"unknown";

    uint64_t v15 = objc_opt_new();
    sessionSettings = v3->_sessionSettings;
    v3->_sessionSettings = (DASessionSettings *)v15;

    v3->_pendingChanges = 0;
    v3->_freezeNotifications = 0;
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.Diagnostics.deviceState.notificationQueue", 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v17;
  }
  return v3;
}

- (DADeviceState)initWithSerialNumber:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(DADeviceState *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serialNumber, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (DADeviceState)initWithDEDDevice:(id)a3
{
  id v4 = a3;
  v5 = [(DADeviceState *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 model];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    v20[0] = @"productClass";
    v19 = [v4 deviceClass];
    v21[0] = v19;
    v20[1] = @"IMEI";
    id v8 = +[NSNull null];
    v21[1] = v8;
    v20[2] = @"marketingName";
    v9 = [v4 name];
    v21[2] = v9;
    v20[3] = @"deviceType";
    v10 = [v4 productType];
    v21[3] = v10;
    v20[4] = @"deviceClass";
    v11 = [v4 deviceClass];
    v21[4] = v11;
    v20[5] = @"deviceEnclosureColor";
    v12 = [v4 enclosureColor];
    v13 = v12;
    if (!v12)
    {
      v13 = +[NSNull null];
    }
    v21[5] = v13;
    v20[6] = @"deviceColor";
    v14 = [v4 color];
    uint64_t v15 = v14;
    if (!v14)
    {
      uint64_t v15 = +[NSNull null];
    }
    v21[6] = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:7];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v16;

    if (!v14) {
    if (!v12)
    }
  }
  return v5;
}

- (DADeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DADeviceState *)self init];
  if (v5)
  {
    v5->_phase = (int64_t)[v4 decodeIntegerForKey:@"phase"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diagnosticEventID"];
    diagnosticEventID = v5->_diagnosticEventID;
    v5->_diagnosticEventID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suiteID"];
    suiteID = v5->_suiteID;
    v5->_suiteID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suiteName"];
    suiteName = v5->_suiteName;
    v5->_suiteName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suiteDescription"];
    suiteDescription = v5->_suiteDescription;
    v5->_suiteDescription = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"suitesAvailable"];
    suitesAvailable = v5->_suitesAvailable;
    v5->_suitesAvailable = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (NSNumber *)v18;

    [v4 decodeDoubleForKey:@"durationRemaining"];
    v5->_durationRemaining = v20;
    uint64_t v21 = objc_opt_class();
    v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"history"];
    history = v5->_history;
    v5->_history = (NSArray *)v23;

    uint64_t v25 = objc_opt_class();
    v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"errors"];
    errors = v5->_errors;
    v5->_errors = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v29;

    v5->_pendingChanges = 0;
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v38 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, v34, v35, v36, v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v39;

    if (!v5->_attributes)
    {
      v5->_attributes = (NSDictionary *)&__NSDictionary0__struct;
    }
    if (!v5->_serialNumber)
    {
      v5->_serialNumber = (NSString *)@"unknown";
    }
    v41 = +[DASessionSettings acceptableValueClasses];
    v42 = [v4 decodeObjectOfClasses:v41 forKey:@"sessionSettings"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v43 = +[DASessionSettings sessionSettingsWithDictionary:v42];
      sessionSettings = v5->_sessionSettings;
      v5->_sessionSettings = (DASessionSettings *)v43;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DADeviceState phase](self, "phase"), @"phase");
  v5 = [(DADeviceState *)self diagnosticEventID];
  [v4 encodeObject:v5 forKey:@"diagnosticEventID"];

  uint64_t v6 = [(DADeviceState *)self suiteID];
  [v4 encodeObject:v6 forKey:@"suiteID"];

  id v7 = [(DADeviceState *)self suiteName];
  [v4 encodeObject:v7 forKey:@"suiteName"];

  uint64_t v8 = [(DADeviceState *)self suiteDescription];
  [v4 encodeObject:v8 forKey:@"suiteDescription"];

  v9 = [(DADeviceState *)self suitesAvailable];
  [v4 encodeObject:v9 forKey:@"suitesAvailable"];

  uint64_t v10 = [(DADeviceState *)self progress];
  [v4 encodeObject:v10 forKey:@"progress"];

  v11 = [(DADeviceState *)self history];
  [v4 encodeObject:v11 forKey:@"history"];

  uint64_t v12 = [(DADeviceState *)self errors];
  [v4 encodeObject:v12 forKey:@"errors"];

  v13 = [(DADeviceState *)self timestamp];
  [v4 encodeObject:v13 forKey:@"timestamp"];

  uint64_t v14 = [(DADeviceState *)self attributes];
  [v4 encodeObject:v14 forKey:@"attributes"];

  uint64_t v15 = [(DADeviceState *)self serialNumber];
  [v4 encodeObject:v15 forKey:@"serialNumber"];

  id v17 = [(DADeviceState *)self sessionSettings];
  uint64_t v16 = [v17 dictionary];
  [v4 encodeObject:v16 forKey:@"sessionSettings"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[4] = self->_phase;
  id v6 = [(NSString *)self->_diagnosticEventID copyWithZone:a3];
  id v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(NSNumber *)self->_suiteID copyWithZone:a3];
  v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = [(NSString *)self->_suiteName copyWithZone:a3];
  v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = [(NSString *)self->_suiteDescription copyWithZone:a3];
  v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = [(NSArray *)self->_suitesAvailable copyWithZone:a3];
  uint64_t v15 = (void *)v5[12];
  v5[12] = v14;

  id v16 = [(NSNumber *)self->_progress copyWithZone:a3];
  id v17 = (void *)v5[13];
  v5[13] = v16;

  v5[14] = *(void *)&self->_durationRemaining;
  id v18 = [(NSArray *)self->_history copyWithZone:a3];
  v19 = (void *)v5[16];
  v5[16] = v18;

  id v20 = [(NSArray *)self->_errors copyWithZone:a3];
  uint64_t v21 = (void *)v5[17];
  v5[17] = v20;

  id v22 = [(NSNumber *)self->_timestamp copyWithZone:a3];
  uint64_t v23 = (void *)v5[18];
  v5[18] = v22;

  id v24 = [(NSDictionary *)self->_attributes copyWithZone:a3];
  uint64_t v25 = (void *)v5[6];
  v5[6] = v24;

  id v26 = [(NSString *)self->_serialNumber copyWithZone:a3];
  uint64_t v27 = (void *)v5[5];
  v5[5] = v26;

  v28 = [(DASessionSettings *)self->_sessionSettings dictionary];
  id v29 = [v28 copyWithZone:a3];
  uint64_t v30 = +[DASessionSettings sessionSettingsWithDictionary:v29];
  uint64_t v31 = (void *)v5[15];
  v5[15] = v30;

  return v5;
}

- (void)setPhase:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_phase != a3)
  {
    obj->_phase = a3;
    obj->_pendingChanges |= 1uLL;
    [(DADeviceState *)obj _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(obj);
}

- (void)setDiagnosticEventID:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_diagnosticEventID isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_diagnosticEventID, a3);
    v5->_pendingChanges |= 0x200uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setSuiteID:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_suiteID isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_suiteID, a3);
    v5->_pendingChanges |= 0x400uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setSuitesAvailable:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_suitesAvailable isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_suitesAvailable, a3);
    v5->_pendingChanges |= 0x800uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setSuiteName:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_suiteName isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_suiteName, a3);
    v5->_pendingChanges |= 2uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setSuiteDescription:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_suiteDescription isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_suiteDescription, a3);
    v5->_pendingChanges |= 4uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setProgress:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_progress isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_progress, a3);
    v5->_pendingChanges |= 8uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setDurationRemaining:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_durationRemaining != a3)
  {
    obj->_durationRemaining = a3;
    obj->_pendingChanges |= 0x100uLL;
    [(DADeviceState *)obj _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(obj);
}

- (void)setSessionSettings:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_sessionSettings isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_sessionSettings, a3);
    v5->_pendingChanges |= 0x10uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setHistory:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_history isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_history, a3);
    v5->_pendingChanges |= 0x20uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setErrors:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_errors isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_errors, a3);
    v5->_pendingChanges |= 0x40uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (void)setTimestamp:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(DADeviceState *)v5 object:v5->_timestamp isEqualToObject:v6])
  {
    objc_storeStrong((id *)&v5->_timestamp, a3);
    v5->_pendingChanges |= 0x80uLL;
    [(DADeviceState *)v5 _sendChangeNotificationIfNeeded];
  }
  objc_sync_exit(v5);
}

- (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqual:a4];
  }
  else {
    return 1;
  }
}

- (void)transactionWithBlock:(id)a3
{
  id v4 = (void (**)(id, unsigned char *))a3;
  v5 = [(DADeviceState *)self copy];
  v5[16] = 1;
  v4[2](v4, v5);

  [(DADeviceState *)self updateWithDeviceState:v5];
}

- (void)updateWithDeviceState:(id)a3
{
  id v15 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v4->_freezeNotifications = 1;
  -[DADeviceState setPhase:](v4, "setPhase:", [v15 phase]);
  v5 = [v15 diagnosticEventID];
  [(DADeviceState *)v4 setDiagnosticEventID:v5];

  id v6 = [v15 suiteID];
  [(DADeviceState *)v4 setSuiteID:v6];

  id v7 = [v15 suiteName];
  [(DADeviceState *)v4 setSuiteName:v7];

  id v8 = [v15 suiteDescription];
  [(DADeviceState *)v4 setSuiteDescription:v8];

  v9 = [v15 suitesAvailable];
  [(DADeviceState *)v4 setSuitesAvailable:v9];

  id v10 = [v15 progress];
  [(DADeviceState *)v4 setProgress:v10];

  [v15 durationRemaining];
  -[DADeviceState setDurationRemaining:](v4, "setDurationRemaining:");
  v11 = [v15 sessionSettings];
  [(DADeviceState *)v4 setSessionSettings:v11];

  id v12 = [v15 history];
  [(DADeviceState *)v4 setHistory:v12];

  v13 = [v15 errors];
  [(DADeviceState *)v4 setErrors:v13];

  id v14 = [v15 timestamp];
  [(DADeviceState *)v4 setTimestamp:v14];

  [(DADeviceState *)v4 _sendChangeNotification];
  v4->_freezeNotifications = 0;
  objc_sync_exit(v4);
}

- (void)addErrorCode:(int64_t)a3 userInfo:(id)a4
{
  id v10 = a4;
  id v6 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"DADeviceStateErrorDomain", a3);
  id v7 = [(DADeviceState *)self errors];
  objc_sync_enter(v7);
  id v8 = [(DADeviceState *)self errors];
  v9 = [v8 arrayByAddingObject:v6];
  [(DADeviceState *)self setErrors:v9];

  objc_sync_exit(v7);
}

- (void)removeErrorCode:(int64_t)a3
{
  id v5 = +[NSNumber numberWithInteger:a3];
  id v4 = +[NSSet setWithObject:v5];
  [(DADeviceState *)self removeErrorCodes:v4];
}

- (void)removeErrorCodes:(id)a3
{
  id v4 = a3;
  id obj = [(DADeviceState *)self errors];
  objc_sync_enter(obj);
  id v5 = [(DADeviceState *)self errors];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(DADeviceState *)self errors];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "code", obj));
        unsigned __int8 v13 = [v4 containsObject:v12];

        if ((v13 & 1) == 0) {
          [v6 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v6 copy];
  [(DADeviceState *)self setErrors:v14];

  objc_sync_exit(obj);
}

- (id)description
{
  long long v18 = [(DADeviceState *)self _stringForPhase:[(DADeviceState *)self phase]];
  long long v17 = [(DADeviceState *)self diagnosticEventID];
  v3 = [(DADeviceState *)self suiteID];
  id v4 = [(DADeviceState *)self suiteName];
  id v5 = [(DADeviceState *)self suiteDescription];
  id v6 = [(DADeviceState *)self suitesAvailable];
  id v7 = [(DADeviceState *)self progress];
  [(DADeviceState *)self durationRemaining];
  uint64_t v9 = v8;
  id v10 = [(DADeviceState *)self sessionSettings];
  v11 = [(DADeviceState *)self history];
  id v12 = [(DADeviceState *)self errors];
  unsigned __int8 v13 = [(DADeviceState *)self timestamp];
  id v14 = [(DADeviceState *)self attributes];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"phase: %@; diagnosticEventID: %@; suiteID: %@; suiteName: %@; suiteDescription: %@; suitesAvailable: %@; progress: %@; durationRemaining: %f; sessionSettings: %@; history: %@; errors: %@; timestamp: %@; attributes: %@",
    v18,
    v17,
    v3,
    v4,
    v5,
    v6,
    v7,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_stringForPhase:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"unknown";
  }
  else {
    return *(&off_1000189D8 + a3);
  }
}

- (void)_sendChangeNotificationIfNeeded
{
  if (!self->_freezeNotifications) {
    [(DADeviceState *)self _sendChangeNotification];
  }
}

- (void)_sendChangeNotification
{
  unint64_t pendingChanges = self->_pendingChanges;
  id v4 = [(DADeviceState *)self copy];
  id v5 = +[DADeviceStateChangeNotificationInfo infoWithChangedProperties:pendingChanges snapshot:v4];

  self->_unint64_t pendingChanges = 0;
  notificationQueue = self->_notificationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009344;
  v8[3] = &unk_1000185C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(notificationQueue, v8);
}

- (void)resetState
{
  id obj = self;
  objc_sync_enter(obj);
  diagnosticEventID = obj->_diagnosticEventID;
  obj->_diagnosticEventID = 0;

  suiteID = obj->_suiteID;
  obj->_suiteID = 0;

  suiteName = obj->_suiteName;
  obj->_suiteName = 0;

  suiteDescription = obj->_suiteDescription;
  obj->_suiteDescription = 0;

  suitesAvailable = obj->_suitesAvailable;
  obj->_suitesAvailable = (NSArray *)&__NSArray0__struct;

  progress = obj->_progress;
  obj->_progress = (NSNumber *)&off_100019920;

  obj->_durationRemaining = 0.0;
  errors = obj->_errors;
  obj->_errors = (NSArray *)&__NSArray0__struct;

  timestamp = obj->_timestamp;
  obj->_timestamp = 0;

  obj->_unint64_t pendingChanges = 0;
  obj->_freezeNotifications = 0;
  objc_sync_exit(obj);
}

- (int64_t)phase
{
  return self->_phase;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)diagnosticEventID
{
  return self->_diagnosticEventID;
}

- (NSNumber)suiteID
{
  return self->_suiteID;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (NSString)suiteDescription
{
  return self->_suiteDescription;
}

- (NSData)testSuiteImageData
{
  return self->_testSuiteImageData;
}

- (void)setTestSuiteImageData:(id)a3
{
}

- (NSArray)suitesAvailable
{
  return self->_suitesAvailable;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (double)durationRemaining
{
  return self->_durationRemaining;
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (NSArray)history
{
  return self->_history;
}

- (NSArray)errors
{
  return self->_errors;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_sessionSettings, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_suitesAvailable, 0);
  objc_storeStrong((id *)&self->_testSuiteImageData, 0);
  objc_storeStrong((id *)&self->_suiteDescription, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong((id *)&self->_suiteID, 0);
  objc_storeStrong((id *)&self->_diagnosticEventID, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end