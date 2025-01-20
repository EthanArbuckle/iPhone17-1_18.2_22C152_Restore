@interface RCPEvent
+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3;
+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3 deliveryTimeStamp:(unint64_t)a4;
+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3 deliveryTimeStamp:(unint64_t)a4 senderProperties:(id)a5 preActions:(id)a6;
- (NSArray)preActions;
- (RCPEvent)init;
- (RCPEvent)initWithCoder:(id)a3;
- (RCPEvent)initWithDeliveryTimeStamp:(unint64_t)a3;
- (RCPEventSenderProperties)senderProperties;
- (__IOHIDEvent)hidEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventAdjustedForDeliveryTimeInterval:(double)a3 eventEnvironment:(id)a4;
- (unint64_t)deliveryTimestamp;
- (unint64_t)timestamp;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryTimestamp:(unint64_t)a3;
- (void)setSenderProperties:(id)a3;
@end

@implementation RCPEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preActions, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
}

+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3 deliveryTimeStamp:(unint64_t)a4 senderProperties:(id)a5 preActions:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)[objc_alloc((Class)a1) initWithDeliveryTimeStamp:a4];
  CFRetain(a3);
  v13 = (void *)v12[2];
  v12[2] = v10;
  v12[3] = a3;
  id v14 = v10;

  v15 = (void *)v12[4];
  v12[4] = v11;

  return (RCPEvent *)v12;
}

- (RCPEvent)initWithDeliveryTimeStamp:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCPEvent;
  result = [(RCPEvent *)&v5 init];
  if (result) {
    result->_deliveryTimestamp = a3;
  }
  return result;
}

- (__IOHIDEvent)hidEvent
{
  return self->_hidEvent;
}

- (unint64_t)deliveryTimestamp
{
  return self->_deliveryTimestamp;
}

- (NSArray)preActions
{
  return self->_preActions;
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)dealloc
{
  hidEvent = self->_hidEvent;
  if (hidEvent) {
    CFRelease(hidEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)RCPEvent;
  [(RCPEvent *)&v4 dealloc];
}

- (RCPEvent)init
{
  uint64_t v3 = mach_absolute_time();
  return [(RCPEvent *)self initWithDeliveryTimeStamp:v3];
}

- (RCPEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RCPEvent;
  objc_super v5 = [(RCPEvent *)&v13 init];
  if (v5)
  {
    v5->_deliveryTimestamp = [v4 decodeInt64ForKey:@"deliveryTimestamp"];
    v5->_hidEvent = (__IOHIDEvent *)MEMORY[0x1AD0EC5F0](0, [v4 decodeObjectForKey:@"hidEventData"]);
    uint64_t v6 = [v4 decodeObjectForKey:@"preActions"];
    preActions = v5->_preActions;
    v5->_preActions = (NSArray *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v5->_preActions;
      v5->_preActions = 0;
    }
    uint64_t v9 = [v4 decodeObjectForKey:@"senderProperties"];
    senderProperties = v5->_senderProperties;
    v5->_senderProperties = (RCPEventSenderProperties *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v11 = v5->_senderProperties;
      v5->_senderProperties = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInt64:self->_deliveryTimestamp forKey:@"deliveryTimestamp"];
  Data = (const void *)IOHIDEventCreateData();
  [v7 encodeObject:CFAutorelease(Data) forKey:@"hidEventData"];
  senderProperties = self->_senderProperties;
  if (senderProperties) {
    [v7 encodeObject:senderProperties forKey:@"senderProperties"];
  }
  preActions = self->_preActions;
  if (preActions) {
    [v7 encodeObject:preActions forKey:@"preActions"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self];
  objc_super v5 = [v3 unarchiveObjectWithData:v4];

  return v5;
}

+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3
{
  id v4 = objc_opt_new();
  CFRetain(a3);
  v4[3] = a3;
  return (RCPEvent *)v4;
}

+ (RCPEvent)eventWithHIDEvent:(__IOHIDEvent *)a3 deliveryTimeStamp:(unint64_t)a4
{
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithDeliveryTimeStamp:a4];
  CFRetain(a3);
  v5[3] = a3;
  return (RCPEvent *)v5;
}

- (unint64_t)timestamp
{
  return IOHIDEventGetTimeStamp();
}

- (id)eventAdjustedForDeliveryTimeInterval:(double)a3 eventEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[(RCPEvent *)self copy];
  objc_msgSend(v6, "timeIntervalForMachAbsoluteTime:", -[RCPEvent deliveryTimestamp](self, "deliveryTimestamp"));
  double v9 = a3 - v8;
  objc_msgSend(v7, "setDeliveryTimestamp:", objc_msgSend(v6, "machAbsoluteTimeForTimeInterval:", a3));
  [v7 hidEvent];
  objc_msgSend(v6, "timeIntervalForMachAbsoluteTime:", -[RCPEvent timestamp](self, "timestamp"));
  [v6 machAbsoluteTimeForTimeInterval:v9 + v10];

  IOHIDEventSetTimeStamp();
  return v7;
}

- (void)setDeliveryTimestamp:(unint64_t)a3
{
  self->_deliveryTimestamp = a3;
}

- (void)setSenderProperties:(id)a3
{
}

@end