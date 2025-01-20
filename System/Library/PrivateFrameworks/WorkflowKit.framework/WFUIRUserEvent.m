@interface WFUIRUserEvent
+ (BOOL)supportsSecureCoding;
- (NSArray)uiEvents;
- (NSData)screenCaptureData;
- (NSString)actionName;
- (NSString)localizedActionName;
- (NSString)processName;
- (NSString)userDescription;
- (WFUIRUserEvent)initWithCoder:(id)a3;
- (WFUIRUserEvent)initWithSerializedRepresentation:(id)a3;
- (double)delay;
- (double)timeout;
- (id)serializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFUIRUserEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiEvents, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_screenCaptureData, 0);
}

- (NSArray)uiEvents
{
  return self->_uiEvents;
}

- (double)delay
{
  return self->_delay;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSData)screenCaptureData
{
  return self->_screenCaptureData;
}

- (WFUIRUserEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFUIRUserEvent;
  v5 = [(WFUIRUserEvent *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedActionName"];
    localizedActionName = v5->_localizedActionName;
    v5->_localizedActionName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionName"];
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDescription"];
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delay"];
    [v14 doubleValue];
    v5->_delay = v15;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeout"];
    [v16 doubleValue];
    v5->_timeout = v17;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFUIRUserEvent *)self localizedActionName];
  [v4 encodeObject:v5 forKey:@"localizedActionName"];

  uint64_t v6 = [(WFUIRUserEvent *)self actionName];
  [v4 encodeObject:v6 forKey:@"actionName"];

  v7 = [(WFUIRUserEvent *)self processName];
  [v4 encodeObject:v7 forKey:@"processName"];

  uint64_t v8 = [(WFUIRUserEvent *)self userDescription];
  [v4 encodeObject:v8 forKey:@"userDescription"];

  v9 = NSNumber;
  [(WFUIRUserEvent *)self delay];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  [v4 encodeObject:v10 forKey:@"delay"];

  v11 = NSNumber;
  [(WFUIRUserEvent *)self timeout];
  objc_msgSend(v11, "numberWithDouble:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"timeout"];
}

- (id)serializedRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(WFUIRUserEvent *)self actionName];
  [v3 setValue:v4 forKey:@"actionName"];

  v5 = [(WFUIRUserEvent *)self localizedActionName];
  [v3 setValue:v5 forKey:@"localizedActionName"];

  uint64_t v6 = [(WFUIRUserEvent *)self processName];
  [v3 setValue:v6 forKey:@"processName"];

  v7 = [(WFUIRUserEvent *)self userDescription];
  [v3 setValue:v7 forKey:@"userDescription"];

  uint64_t v8 = NSNumber;
  [(WFUIRUserEvent *)self delay];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setValue:v9 forKey:@"delay"];

  uint64_t v10 = NSNumber;
  [(WFUIRUserEvent *)self timeout];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setValue:v11 forKey:@"timeout"];

  return v3;
}

- (WFUIRUserEvent)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFUIRUserEvent;
  v5 = [(WFUIRUserEvent *)&v21 init];
  if (v5)
  {
    id v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [v6 objectForKey:@"actionName"];
      actionName = v5->_actionName;
      v5->_actionName = (NSString *)v7;

      uint64_t v9 = [v6 objectForKey:@"localizedActionName"];
      localizedActionName = v5->_localizedActionName;
      v5->_localizedActionName = (NSString *)v9;

      uint64_t v11 = [v6 objectForKey:@"processName"];
      processName = v5->_processName;
      v5->_processName = (NSString *)v11;

      uint64_t v13 = [v6 objectForKey:@"userDescription"];
      userDescription = v5->_userDescription;
      v5->_userDescription = (NSString *)v13;

      double v15 = [v6 objectForKey:@"delay"];
      [v15 doubleValue];
      v5->_delay = v16;

      double v17 = [v6 objectForKey:@"timeout"];
      [v17 doubleValue];
      v5->_timeout = v18;

      v19 = v5;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end