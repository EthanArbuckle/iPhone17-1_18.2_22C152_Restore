@interface NFTechnologyEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)touchIDRequired;
- (BOOL)vasSupported;
- (NFTechnologyEvent)initWithCoder:(id)a3;
- (NFTechnologyEvent)initWithDictionary:(id)a3;
- (NFTechnologyEvent)initWithFieldNotification:(id)a3;
- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4;
- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4 andSystemCode:(unsigned __int16)a5;
- (id)description;
- (unsigned)systemCode;
- (unsigned)technology;
- (unsigned)terminalType;
- (unsigned)valueAddedServiceMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFTechnologyEvent

- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4 andSystemCode:(unsigned __int16)a5
{
  unsigned __int8 v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NFTechnologyEvent;
  result = [(NFTechnologyEvent *)&v9 init];
  if (result)
  {
    result->_technology = a3;
    result->_valueAddedServiceMode = v6;
    result->_systemCode = a5;
  }
  return result;
}

- (NFTechnologyEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFTechnologyEvent;
  v5 = [(NFTechnologyEvent *)&v13 init];
  if (v5)
  {
    unsigned __int8 v6 = [v4 objectForKeyedSubscript:@"technologyMask"];
    v5->_technology = [v6 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:@"valueAddedServiceMode"];
    v5->_valueAddedServiceMode = [v7 unsignedIntegerValue];

    v8 = [v4 objectForKeyedSubscript:@"systemCode"];
    v5->_systemCode = (unsigned __int16)[v8 unsignedIntegerValue];

    objc_super v9 = [v4 objectForKeyedSubscript:@"vasSupported"];
    v5->_vasSupported = [v9 BOOLValue];

    v10 = [v4 objectForKeyedSubscript:@"terminalType"];
    v5->_terminalType = [v10 unsignedIntegerValue];

    v11 = [v4 objectForKeyedSubscript:@"touchIDRequired"];
    v5->_touchIDRequired = [v11 BOOLValue];
  }
  return v5;
}

- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4
{
  unsigned __int8 v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NFTechnologyEvent;
  result = [(NFTechnologyEvent *)&v7 init];
  if (result)
  {
    result->_technology = a3;
    result->_valueAddedServiceMode = v4;
  }
  return result;
}

- (NFTechnologyEvent)initWithFieldNotification:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTechnologyEvent;
  v5 = [(NFTechnologyEvent *)&v9 init];
  if (v5)
  {
    if ([v4 notificationType] == (id)1)
    {
      v5->_technology = [v4 rfTechnology];
      v5->_valueAddedServiceMode = 4;
      v5->_systemCode = (unsigned __int16)[v4 typeFSystemCode];
    }
    else if ([v4 notificationType] == (id)2)
    {
      id v6 = v4;
      v5->_technology = [v6 rfTechnology];
      v5->_valueAddedServiceMode = [v6 terminalMode];
      v5->_systemCode = (unsigned __int16)[v6 typeFSystemCode];
      v5->_vasSupported = [v6 terminalMode] != 4;
      v5->_touchIDRequired = [v6 odaRequired];
      unsigned int v7 = [v6 terminalType];

      v5->_terminalType = v7;
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  unsigned int technology = self->_technology;
  id v4 = objc_alloc((Class)NSString);
  if ((technology & 4) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)NFTechnologyEvent;
    id v6 = [(NFTechnologyEvent *)&v26 description];
    unsigned int v15 = self->_technology;
    uint64_t v16 = v15 & 1;
    uint64_t v17 = (v15 >> 1) & 1;
    uint64_t v18 = (v15 >> 2) & 1;
    uint64_t v19 = (v15 >> 3) & 1;
    v20 = "YES";
    if (self->_vasSupported) {
      v21 = "YES";
    }
    else {
      v21 = "NO";
    }
    if (!self->_touchIDRequired) {
      v20 = "NO";
    }
    id v14 = [v4 initWithFormat:@"%@ { A=%d B=%d, F=%d SystemCode=0x%04x, VAS=%d, VAS Mode=0x%04x, VAS Supported=%s, TerminalType=%d, TouchIDRequired=%s }", v6, v16, v17, v18, self->_systemCode, v19, self->_valueAddedServiceMode, v21, self->_terminalType, v20];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)NFTechnologyEvent;
    uint64_t v5 = [(NFTechnologyEvent *)&v25 description];
    id v6 = (void *)v5;
    unsigned int v7 = self->_technology;
    uint64_t v8 = v7 & 1;
    uint64_t v9 = (v7 >> 1) & 1;
    uint64_t v10 = (v7 >> 2) & 1;
    uint64_t v11 = (v7 >> 3) & 1;
    v12 = "YES";
    if (self->_vasSupported) {
      objc_super v13 = "YES";
    }
    else {
      objc_super v13 = "NO";
    }
    if (!self->_touchIDRequired) {
      v12 = "NO";
    }
    id v14 = [v4 initWithFormat:@"%@ { A=%d B=%d, F=%d, ECP=%d, VAS Mode=0x%04x, VAS Supported=%s, TerminalType=%d, TouchIDRequired=%s }", v5, v8, v9, v10, v11, self->_valueAddedServiceMode, v13, self->_terminalType, v12, v24];
  }
  v22 = v14;

  return v22;
}

- (NFTechnologyEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFTechnologyEvent;
  uint64_t v5 = [(NFTechnologyEvent *)&v7 init];
  if (v5)
  {
    v5->_unsigned int technology = [v4 decodeInt32ForKey:@"technologyMask"];
    v5->_valueAddedServiceMode = [v4 decodeInt32ForKey:@"valueAddedServiceMode"];
    v5->_systemCode = (unsigned __int16)[v4 decodeInt32ForKey:@"systemCode"];
    v5->_vasSupported = [v4 decodeBoolForKey:@"vasSupported"];
    v5->_touchIDRequired = [v4 decodeBoolForKey:@"touchIDRequired"];
    v5->_terminalType = [v4 decodeInt32ForKey:@"terminalType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t technology = self->_technology;
  id v5 = a3;
  [v5 encodeInt32:technology forKey:@"technologyMask"];
  [v5 encodeInt32:self->_valueAddedServiceMode forKey:@"valueAddedServiceMode"];
  [v5 encodeInt32:self->_systemCode forKey:@"systemCode"];
  [v5 encodeBool:self->_vasSupported forKey:@"vasSupported"];
  [v5 encodeBool:self->_touchIDRequired forKey:@"touchIDRequired"];
  [v5 encodeInt32:self->_terminalType forKey:@"terminalType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)technology
{
  return self->_technology;
}

- (unsigned)valueAddedServiceMode
{
  return self->_valueAddedServiceMode;
}

- (unsigned)systemCode
{
  return self->_systemCode;
}

- (BOOL)vasSupported
{
  return self->_vasSupported;
}

- (BOOL)touchIDRequired
{
  return self->_touchIDRequired;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

@end