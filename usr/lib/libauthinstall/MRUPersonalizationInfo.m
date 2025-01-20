@interface MRUPersonalizationInfo
- (MRUHardwareInfo)hardwareInfo;
- (MRUPersonalizationInfo)initWithCoder:(id)a3;
- (MRUPersonalizationInfo)initWithHardwareInfo:(id)a3 componentName:(id)a4 objectName:(id)a5 nonce:(id)a6;
- (MRUPersonalizationInfo)initWithHardwareInfo:(id)a3 componentName:(id)a4 objectName:(id)a5 nonce:(id)a6 tagNumber:(id)a7;
- (MRUPersonalizationInfo)initWithOptions:(id)a3 error:(id *)a4;
- (NSData)nonce;
- (NSDictionary)asDictionary;
- (NSString)_componentNameSuffix;
- (NSString)_propertyNameSuffix;
- (NSString)boardIDPropertyName;
- (NSString)chipIDPropertyName;
- (NSString)ecidPropertyName;
- (NSString)noncePropertyName;
- (NSString)objectName;
- (NSString)productionModePropertyName;
- (NSString)securityDomainPropertyName;
- (NSString)securityModePropertyName;
- (NSString)tag;
- (NSString)ticketName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRUPersonalizationInfo

- (MRUPersonalizationInfo)initWithHardwareInfo:(id)a3 componentName:(id)a4 objectName:(id)a5 nonce:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MRUPersonalizationInfo;
  v15 = [(MRUPersonalizationInfo *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_hardwareInfo, a3);
    objc_storeStrong((id *)&v16->_componentName, a4);
    objc_storeStrong((id *)&v16->_objectName, a5);
    objc_storeStrong((id *)&v16->_nonce, a6);
    tagNumber = v16->_tagNumber;
    v16->_tagNumber = 0;
  }
  return v16;
}

- (MRUPersonalizationInfo)initWithHardwareInfo:(id)a3 componentName:(id)a4 objectName:(id)a5 nonce:(id)a6 tagNumber:(id)a7
{
  id v13 = a7;
  id v14 = [(MRUPersonalizationInfo *)self initWithHardwareInfo:a3 componentName:a4 objectName:a5 nonce:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_tagNumber, a7);
  }

  return v15;
}

- (MRUPersonalizationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRUPersonalizationInfo;
  v5 = [(MRUPersonalizationInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"hardwareInfo"];
    hardwareInfo = v5->_hardwareInfo;
    v5->_hardwareInfo = (MRUHardwareInfo *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"componentName"];
    componentName = v5->_componentName;
    v5->_componentName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"objectName"];
    objectName = v5->_objectName;
    v5->_objectName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v12;

    if ([v4 containsValueForKey:@"tagNumber"])
    {
      uint64_t v14 = [v4 decodeObjectForKey:@"tagNumber"];
      tagNumber = v5->_tagNumber;
      v5->_tagNumber = (NSNumber *)v14;
    }
    else
    {
      tagNumber = v5->_tagNumber;
      v5->_tagNumber = 0;
    }
  }
  return v5;
}

- (MRUPersonalizationInfo)initWithOptions:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MRUPersonalizationInfo;
  v7 = [(MRUPersonalizationInfo *)&v30 init];
  if (!v7) {
    goto LABEL_26;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"HardwareInfo"];
  if (!v8)
  {
    if (*a4)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08320];
      objc_super v19 = [NSString stringWithFormat:@"No hardwareInfo in options dict"];
      v40[0] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
      *a4 = [v18 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:2 userInfo:v20];
    }
    goto LABEL_25;
  }
  v9 = (void *)v8;
  id v29 = 0;
  uint64_t v10 = [[MRUHardwareInfo alloc] initWithOptions:v8 error:&v29];
  id v11 = v29;
  if (v10)
  {
    objc_storeStrong((id *)&v7->_hardwareInfo, v10);
    uint64_t v12 = [v6 objectForKeyedSubscript:@"ComponentName"];
    if (!v12)
    {
      if (!*a4)
      {
        int v16 = 1;
        goto LABEL_23;
      }
      v25 = (void *)MEMORY[0x263F087E8];
      id v28 = v11;
      uint64_t v35 = *MEMORY[0x263F08320];
      id v13 = [NSString stringWithFormat:@"No component name in options dict"];
      v36 = v13;
      int v16 = 1;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      *a4 = [v25 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:2 userInfo:v14];
      goto LABEL_21;
    }
    id v28 = v11;
    objc_storeStrong((id *)&v7->_componentName, v12);
    id v13 = [v6 objectForKeyedSubscript:@"ObjectName"];
    if (v13)
    {
      objc_storeStrong((id *)&v7->_objectName, v13);
      uint64_t v14 = [v6 objectForKeyedSubscript:@"Nonce"];
      if (v14)
      {
        objc_storeStrong((id *)&v7->_nonce, v14);
        uint64_t v15 = [v6 objectForKeyedSubscript:@"TagNumber"];
        int v16 = 0;
        tagNumber = v7->_tagNumber;
        v7->_tagNumber = (NSNumber *)v15;
      }
      else
      {
        if (!*a4)
        {
          int v16 = 1;
          goto LABEL_21;
        }
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v31 = *MEMORY[0x263F08320];
        tagNumber = [NSString stringWithFormat:@"No nonce in options dict"];
        v32 = tagNumber;
        v22 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        *a4 = [v27 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:2 userInfo:v22];

        int v16 = 1;
      }
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
    if (*a4)
    {
      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      uint64_t v14 = [NSString stringWithFormat:@"No object name in options dict"];
      v34 = v14;
      int v16 = 1;
      tagNumber = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = [v26 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:2 userInfo:tagNumber];
      goto LABEL_20;
    }
  }
  else
  {
    if (!*a4)
    {
      int v16 = 1;
      goto LABEL_24;
    }
    v21 = (void *)MEMORY[0x263F087E8];
    v37[0] = *MEMORY[0x263F08320];
    uint64_t v12 = [NSString stringWithFormat:@"Failed to create hardwareInfo, options: %@", v9];
    v37[1] = *MEMORY[0x263F08608];
    v38[0] = v12;
    id v28 = v11;
    v38[1] = v11;
    id v13 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    *a4 = [v21 errorWithDomain:@"com.apple.Manta.MantaRestoreUtils" code:3 userInfo:v13];
  }
  int v16 = 1;
LABEL_22:

  id v11 = v28;
LABEL_23:

LABEL_24:
  if (!v16)
  {
LABEL_26:
    v23 = v7;
    goto LABEL_27;
  }
LABEL_25:
  v23 = 0;
LABEL_27:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_hardwareInfo forKey:@"hardwareInfo"];
  [v5 encodeObject:self->_componentName forKey:@"componentName"];
  [v5 encodeObject:self->_objectName forKey:@"objectName"];
  [v5 encodeObject:self->_nonce forKey:@"nonce"];
  tagNumber = self->_tagNumber;
  if (tagNumber) {
    [v5 encodeObject:tagNumber forKey:@"tagNumber"];
  }
}

- (NSDictionary)asDictionary
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v9[0] = @"HardwareInfo";
  v3 = [(MRUHardwareInfo *)self->_hardwareInfo asDictionary];
  uint64_t v10 = v3;
  long long v11 = *(_OWORD *)&self->_componentName;
  v9[1] = @"ComponentName";
  v9[2] = @"ObjectName";
  v9[3] = @"Nonce";
  nonce = self->_nonce;
  id v4 = [NSDictionary dictionaryWithObjects:&v10 forKeys:v9 count:4];
  id v5 = (void *)[v4 mutableCopy];

  tagNumber = self->_tagNumber;
  if (tagNumber) {
    [v5 setObject:tagNumber forKey:@"TagNumber"];
  }
  v7 = [NSDictionary dictionaryWithDictionary:v5];

  return (NSDictionary *)v7;
}

- (NSString)_componentNameSuffix
{
  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    [NSString stringWithFormat:@"%d", -[NSNumber intValue](tagNumber, "intValue")];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_26C809658;
  }

  return (NSString *)v3;
}

- (NSString)_propertyNameSuffix
{
  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    [NSString stringWithFormat:@",%d", -[NSNumber intValue](tagNumber, "intValue")];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_26C809658;
  }

  return (NSString *)v3;
}

- (NSString)ticketName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _componentNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@%@,Ticket", componentName, v4];

  return (NSString *)v5;
}

- (NSString)tag
{
  v2 = NSString;
  componentName = self->_componentName;
  objectName = self->_objectName;
  id v5 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v6 = [v2 stringWithFormat:@"%@,%@%@", componentName, objectName, v5];

  return (NSString *)v6;
}

- (NSString)objectName
{
  return self->_objectName;
}

- (NSString)boardIDPropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,BoardID%@", componentName, v4];

  return (NSString *)v5;
}

- (NSString)chipIDPropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,ChipID%@", componentName, v4];

  return (NSString *)v5;
}

- (NSString)ecidPropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,ECID%@", componentName, v4];

  return (NSString *)v5;
}

- (NSString)noncePropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,Nonce%@", componentName, v4];

  return (NSString *)v5;
}

- (NSString)productionModePropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,ProductionMode%@", componentName, v4];

  return (NSString *)v5;
}

- (NSString)securityDomainPropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,SecurityDomain%@", componentName, v4];

  return (NSString *)v5;
}

- (NSString)securityModePropertyName
{
  v2 = NSString;
  componentName = self->_componentName;
  id v4 = [(MRUPersonalizationInfo *)self _propertyNameSuffix];
  id v5 = [v2 stringWithFormat:@"%@,SecurityMode%@", componentName, v4];

  return (NSString *)v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(\n", v5];

  id v7 = [(MRUHardwareInfo *)self->_hardwareInfo description];
  [v6 appendFormat:@"\thardwareInfo: %s\n", [v7 UTF8String]];

  id v8 = [(MRUPersonalizationInfo *)self ticketName];
  [v6 appendFormat:@"\tticketName: %s\n", [v8 UTF8String]];

  id v9 = [(MRUPersonalizationInfo *)self tag];
  [v6 appendFormat:@"\ttagName: %s\n", [v9 UTF8String]];

  id v10 = [(NSData *)self->_nonce description];
  [v6 appendFormat:@"\tnonce: %s\n", [v10 UTF8String]];

  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    id v12 = [(NSNumber *)tagNumber description];
    [v6 appendFormat:@"\ttagNumber: %s\n", [v12 UTF8String]];
  }
  [v6 appendString:@""]);
  uint64_t v13 = [NSString stringWithString:v6];

  return v13;
}

- (MRUHardwareInfo)hardwareInfo
{
  return (MRUHardwareInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_hardwareInfo, 0);
  objc_storeStrong((id *)&self->_tagNumber, 0);
  objc_storeStrong((id *)&self->_objectName, 0);

  objc_storeStrong((id *)&self->_componentName, 0);
}

@end