@interface SPRMonitorLog
+ (BOOL)supportsSecureCoding;
+ (id)getEventString:(unsigned __int16)a3;
- (NSData)details;
- (NSString)component;
- (NSString)event;
- (NSString)origin;
- (SPRMonitorLog)initWithAudit:(id)a3 details:(id)a4 origin:(id)a5 component:(id)a6;
- (SPRMonitorLog)initWithCoder:(id)a3;
- (SPRMonitorLog)initWithEvent:(unsigned __int16)a3 details:(id)a4 origin:(id)a5 component:(id)a6;
- (SPRMonitorLog)initWithIncident:(id)a3 details:(id)a4 origin:(id)a5 component:(id)a6;
- (id)description;
- (int64_t)logType;
- (void)encodeWithCoder:(id)a3;
- (void)setComponent:(id)a3;
- (void)setDetails:(id)a3;
- (void)setEvent:(id)a3;
- (void)setOrigin:(id)a3;
@end

@implementation SPRMonitorLog

- (SPRMonitorLog)initWithEvent:(unsigned __int16)a3 details:(id)a4 origin:(id)a5 component:(id)a6
{
  uint64_t v8 = a3;
  v10 = (NSData *)a4;
  v11 = (NSString *)a5;
  v12 = (NSString *)a6;
  objc_msgSend_getEventString_(SPRMonitorLog, v13, v8, v14, v15, v16);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  self->_event = v17;

  details = self->_details;
  self->_details = v10;
  v20 = v10;

  origin = self->_origin;
  self->_origin = v11;
  v22 = v11;

  component = self->_component;
  self->_component = v12;

  self->_logType = 0;
  return self;
}

- (SPRMonitorLog)initWithAudit:(id)a3 details:(id)a4 origin:(id)a5 component:(id)a6
{
  v10 = (NSString *)a3;
  v11 = (NSData *)a4;
  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  event = self->_event;
  self->_event = v10;
  uint64_t v15 = v10;

  details = self->_details;
  self->_details = v11;
  v17 = v11;

  origin = self->_origin;
  self->_origin = v12;
  v19 = v12;

  component = self->_component;
  self->_component = v13;

  self->_logType = 0;
  return self;
}

- (SPRMonitorLog)initWithIncident:(id)a3 details:(id)a4 origin:(id)a5 component:(id)a6
{
  v10 = (NSString *)a3;
  v11 = (NSData *)a4;
  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  event = self->_event;
  self->_event = v10;
  uint64_t v15 = v10;

  details = self->_details;
  self->_details = v11;
  v17 = v11;

  origin = self->_origin;
  self->_origin = v12;
  v19 = v12;

  component = self->_component;
  self->_component = v13;

  self->_logType = 1;
  return self;
}

- (id)description
{
  if (self->_details)
  {
    id v6 = [NSString alloc];
    uint64_t v10 = objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)self->_details, 4, v8, v9);
    if (v10)
    {
      uint64_t v15 = (__CFString *)v10;
      objc_msgSend_stringWithFormat_(NSString, v11, @"{event: %@, details: %@, origin: %@, component: %@}", v12, v13, v14, self->_event, v10, self->_origin, self->_component);
    }
    else
    {
      uint64_t v15 = @"not printable";
      objc_msgSend_stringWithFormat_(NSString, v11, @"{event: %@, details: %@, origin: %@, component: %@}", v12, v13, v14, self->_event, @"not printable", self->_origin, self->_component);
    }
  }
  else
  {
    uint64_t v15 = @"nil";
    objc_msgSend_stringWithFormat_(NSString, a2, @"{event: %@, details: %@, origin: %@, component: %@}", v2, v3, v4, self->_event, @"nil", self->_origin, self->_component);
  uint64_t v16 = };

  return v16;
}

+ (id)getEventString:(unsigned __int16)a3
{
  if ((a3 - 13) > 0x14) {
    return @"UNKNOWN_MONITORING_EVENT";
  }
  else {
    return off_26459C9B8[(__int16)(a3 - 13)];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRMonitorLog)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_logType = objc_msgSend_decodeIntegerForKey_(v4, v5, @"logType", v6, v7, v8);
  uint64_t v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"event", v11, v12);
  uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  self->_event = v13;

  uint64_t v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"details", v17, v18);
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  details = self->_details;
  self->_details = v19;

  uint64_t v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"origin", v23, v24);
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  origin = self->_origin;
  self->_origin = v25;

  uint64_t v27 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"component", v29, v30);
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();

  component = self->_component;
  self->_component = v31;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t logType = self->_logType;
  id v20 = a3;
  objc_msgSend_encodeInteger_forKey_(v20, v5, logType, @"logType", v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v8, (uint64_t)self->_event, @"event", v9, v10);
  objc_msgSend_encodeObject_forKey_(v20, v11, (uint64_t)self->_details, @"details", v12, v13);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)self->_origin, @"origin", v15, v16);
  objc_msgSend_encodeObject_forKey_(v20, v17, (uint64_t)self->_component, @"component", v18, v19);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvent:(id)a3
{
}

- (NSData)details
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetails:(id)a3
{
}

- (NSString)origin
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOrigin:(id)a3
{
}

- (NSString)component
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setComponent:(id)a3
{
}

- (int64_t)logType
{
  return self->_logType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end