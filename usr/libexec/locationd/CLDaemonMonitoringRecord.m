@interface CLDaemonMonitoringRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)conditionLimitExceeded;
- (BOOL)conditionUnsupported;
- (BOOL)isMonitoring;
- (BOOL)persistenceUnavailable;
- (BOOL)shouldSendEvent;
- (CLCondition)daemonCondition;
- (CLDaemonMonitoringRecord)initWithClientMonitoringRecord:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 initForStopMonitoring:(BOOL)a8 callbackHandler:(id)a9;
- (CLDaemonMonitoringRecord)initWithCoder:(id)a3;
- (CLMonitoringEvent)daemonEvent;
- (NSString)recordIdentifier;
- (id)debugDescription;
- (id)description;
- (id)getMonitoringRecordToNotifyClient;
- (unint64_t)clientState;
- (unint64_t)daemonState;
- (unint64_t)diagnosticMaskIfMonitoringIsNonFunctional;
- (unint64_t)serviceTypeMask;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetDaemonPartOfCondition;
- (void)setConditionLimitExceeded:(BOOL)a3;
- (void)setConditionUnsupported:(BOOL)a3;
- (void)setDaemonCondition:(id)a3;
- (void)setDaemonEvent:(id)a3;
- (void)setPersistenceUnavailable:(BOOL)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setupDaemonPartOfConditionWithAuthContext:(id)a3 clientKeyPath:(id)a4 universe:(id)a5 identifier:(id)a6 stopMonitoring:(BOOL)a7 callbackHandler:(id)a8;
- (void)updateClientEvent:(id)a3;
@end

@implementation CLDaemonMonitoringRecord

- (CLDaemonMonitoringRecord)initWithClientMonitoringRecord:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 initForStopMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  BOOL v9 = a8;
  v17.receiver = self;
  v17.super_class = (Class)CLDaemonMonitoringRecord;
  v15 = (CLDaemonMonitoringRecord *)-[CLDaemonMonitoringRecord initRecordWithMonitoringRecord:](&v17, "initRecordWithMonitoringRecord:");
  if (v15)
  {
    if (!v9) {
      a7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@@%@", a7, [a3 identifier]);
    }
    [(CLDaemonMonitoringRecord *)v15 setRecordIdentifier:a7];
    [(CLDaemonMonitoringRecord *)v15 setupDaemonPartOfConditionWithAuthContext:a5 clientKeyPath:a4 universe:a6 identifier:[(CLDaemonMonitoringRecord *)v15 recordIdentifier] stopMonitoring:v9 callbackHandler:a9];
  }
  return v15;
}

- (void)dealloc
{
  self->_daemonCondition = 0;
  [(CLDaemonMonitoringRecord *)self setDaemonEvent:0];

  self->_recordIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonMonitoringRecord;
  [(CLDaemonMonitoringRecord *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLDaemonMonitoringRecord.mm", 77, @"Invalid parameter not satisfying: %@", @"coder.requiresSecureCoding" object file lineNumber description];
  }
  v6 = [(CLDaemonMonitoringRecord *)self recordIdentifier];
  [a3 encodeObject:v6 forKey:off_10241DCA8];
  v7.receiver = self;
  v7.super_class = (Class)CLDaemonMonitoringRecord;
  [(CLDaemonMonitoringRecord *)&v7 encodeWithCoder:a3];
}

- (CLDaemonMonitoringRecord)initWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLDaemonMonitoringRecord.mm", 83, @"Invalid parameter not satisfying: %@", @"coder.requiresSecureCoding" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)CLDaemonMonitoringRecord;
  v6 = [(CLDaemonMonitoringRecord *)&v8 initWithCoder:a3];
  if (v6) {
    -[CLDaemonMonitoringRecord setRecordIdentifier:](v6, "setRecordIdentifier:", [a3 decodeObjectOfClass:objc_opt_class() forKey:off_10241DCA8]);
  }
  return v6;
}

- (void)setupDaemonPartOfConditionWithAuthContext:(id)a3 clientKeyPath:(id)a4 universe:(id)a5 identifier:(id)a6 stopMonitoring:(BOOL)a7 callbackHandler:(id)a8
{
  BOOL v9 = a7;
  [(CLDaemonMonitoringRecord *)self condition];
  uint64_t v15 = objc_opt_class();
  if (v15 == objc_opt_class())
  {
    if (objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", @"CLFenceManager"))
    {
      id v16 = [[CLDaemonCircularGeographicCondition alloc] initFromClientCondition:[(CLDaemonMonitoringRecord *)self condition] clientKeyPath:a4 authorizationContext:a3 universe:a5 identifier:a6 removePersistingFenceFromMonitoring:v9 callbackHandler:a8];
      goto LABEL_10;
    }
  }
  else if (v15 == objc_opt_class())
  {
    if (objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", @"CLBTLEFenceManager"))
    {
      id v16 = [[CLDaemonBeaconIdentityCondition alloc] initFromClientCondition:[(CLDaemonMonitoringRecord *)self condition] clientKeyPath:a4 authorizationContext:a3 universe:a5 identifier:[(CLDaemonMonitoringRecord *)self recordIdentifier] removePersistingFenceFromMonitoring:v9 callbackHandler:a8];
      goto LABEL_10;
    }
  }
  else
  {
    if (v15 != objc_opt_class()) {
      sub_101A713D8();
    }
    if (objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", @"CLBarometerCalibration"))
    {
      id v16 = [[CLDaemonMinimumAltitudeCondition alloc] initFromClientCondition:[(CLDaemonMonitoringRecord *)self condition] clientKeyPath:a4 authorizationContext:a3 universe:a5 identifier:a6 callbackHandler:a8];
LABEL_10:
      [(CLDaemonMonitoringRecord *)self setDaemonCondition:v16];
      goto LABEL_12;
    }
  }
  [(CLDaemonMonitoringRecord *)self setConditionUnsupported:1];
LABEL_12:
  id v17 = [objc_alloc((Class)CLMonitoringEvent) initWithIdentifier:-[CLMonitoringEvent identifier](-[CLDaemonMonitoringRecord clientEvent](self, "clientEvent"), "identifier") refinement:0 state:0 date:+[NSDate now](NSDate, "now") diagnostics:0];

  [(CLDaemonMonitoringRecord *)self setDaemonEvent:v17];
}

- (void)resetDaemonPartOfCondition
{
  [(CLCondition *)[(CLDaemonMonitoringRecord *)self daemonCondition] stopMonitoring];
  self->_daemonCondition = 0;

  [(CLDaemonMonitoringRecord *)self setDaemonEvent:0];
}

- (unint64_t)clientState
{
  v2 = [(CLDaemonMonitoringRecord *)self clientEvent];

  return [(CLMonitoringEvent *)v2 state];
}

- (unint64_t)daemonState
{
  v2 = [(CLDaemonMonitoringRecord *)self daemonEvent];

  return [(CLMonitoringEvent *)v2 state];
}

- (BOOL)shouldSendEvent
{
  CLMonitoringState v3 = [(CLMonitoringEvent *)[(CLDaemonMonitoringRecord *)self daemonEvent] state];
  if (v3)
  {
    unint64_t v4 = [(CLDaemonMonitoringRecord *)self clientState];
    LOBYTE(v3) = v4 != [(CLMonitoringEvent *)[(CLDaemonMonitoringRecord *)self daemonEvent] state];
  }
  return v3;
}

- (void)updateClientEvent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonMonitoringRecord;
  [(CLDaemonMonitoringRecord *)&v3 updateEvent:a3];
}

- (id)getMonitoringRecordToNotifyClient
{
  id v2 = [objc_alloc((Class)CLMonitoringRecord) initRecordWithCondition:-[CLDaemonMonitoringRecord condition](self, "condition") options:-[CLDaemonMonitoringRecord options](self, "options") daemonEvent:-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent")];

  return v2;
}

- (id)debugDescription
{
  objc_super v3 = +[NSMutableString stringWithString:[(CLDaemonMonitoringRecord *)self description]];
  [(NSMutableString *)v3 appendFormat:@", obj: %p", self];
  return v3;
}

- (id)description
{
  id v3 = +[NSMutableString string];
  [v3 appendString:[-[CLDaemonMonitoringRecord condition](self, "condition") description]];
  [v3 appendFormat:@", options: %lu", -[CLDaemonMonitoringRecord options](self, "options")];
  [v3 appendFormat:@", clientEvent: %@", -[CLDaemonMonitoringRecord clientEvent](self, "clientEvent")];
  [v3 appendFormat:@", daemonEvent: %@", -[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent")];
  return v3;
}

- (BOOL)isMonitoring
{
  id v2 = [(CLDaemonMonitoringRecord *)self daemonCondition];

  return [(CLCondition *)v2 isMonitoring];
}

- (unint64_t)diagnosticMaskIfMonitoringIsNonFunctional
{
  unint64_t v3 = (unint64_t)[-[CLCondition authorizationContext](-[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"), "authorizationContext") diagnosticMask] & 3;
  if (![(CLDaemonMonitoringRecord *)self conditionLimitExceeded]
    && ![(CLDaemonMonitoringRecord *)self conditionUnsupported]
    && ![(CLDaemonMonitoringRecord *)self persistenceUnavailable])
  {
    v3 |= (unint64_t)[(CLCondition *)[(CLDaemonMonitoringRecord *)self daemonCondition] diagnosticMaskIfNonFunctional];
  }
  return v3;
}

- (unint64_t)serviceTypeMask
{
  if (objc_opt_isKindOfClass()) {
    return 2;
  }
  [(CLDaemonMonitoringRecord *)self condition];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  [(CLDaemonMonitoringRecord *)self condition];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLDaemonMonitoringRecord.mm", 258, @"Condition type is not supported", ", ", "\"condition\", ":", "%{private, location:escape_only}@"", [(CLDaemonMonitoringRecord *)self condition] object file lineNumber description];
  }
  return 16;
}

- (CLCondition)daemonCondition
{
  return self->_daemonCondition;
}

- (void)setDaemonCondition:(id)a3
{
}

- (CLMonitoringEvent)daemonEvent
{
  return self->_daemonEvent;
}

- (void)setDaemonEvent:(id)a3
{
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (BOOL)conditionLimitExceeded
{
  return self->_conditionLimitExceeded;
}

- (void)setConditionLimitExceeded:(BOOL)a3
{
  self->_conditionLimitExceeded = a3;
}

- (BOOL)persistenceUnavailable
{
  return self->_persistenceUnavailable;
}

- (void)setPersistenceUnavailable:(BOOL)a3
{
  self->_persistenceUnavailable = a3;
}

- (BOOL)conditionUnsupported
{
  return self->_conditionUnsupported;
}

- (void)setConditionUnsupported:(BOOL)a3
{
  self->_conditionUnsupported = a3;
}

@end