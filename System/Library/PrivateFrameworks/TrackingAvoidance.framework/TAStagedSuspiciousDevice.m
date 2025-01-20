@interface TAStagedSuspiciousDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)keepInStagingUntil;
- (TAStagedSuspiciousDevice)initWithCoder:(id)a3;
- (TAStagedSuspiciousDevice)initWithDetection:(id)a3 keepInStagingUntil:(id)a4;
- (TASuspiciousDevice)detection;
- (id)description;
- (id)descriptionDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setKeepInStagingUntil:(id)a3;
@end

@implementation TAStagedSuspiciousDevice

- (TAStagedSuspiciousDevice)initWithDetection:(id)a3 keepInStagingUntil:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAStagedSuspiciousDevice;
  v9 = [(TAStagedSuspiciousDevice *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_detection, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (TAStagedSuspiciousDevice *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      id v7 = [(TAStagedSuspiciousDevice *)self detection];
      id v8 = [(TAStagedSuspiciousDevice *)v6 detection];
      if (v7 != v8)
      {
        v9 = [(TAStagedSuspiciousDevice *)self detection];
        v3 = [(TAStagedSuspiciousDevice *)v6 detection];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(TAStagedSuspiciousDevice *)self keepInStagingUntil];
      v12 = [(TAStagedSuspiciousDevice *)v6 keepInStagingUntil];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        objc_super v13 = [(TAStagedSuspiciousDevice *)self keepInStagingUntil];
        v14 = [(TAStagedSuspiciousDevice *)v6 keepInStagingUntil];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)descriptionDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"Detection";
  v3 = [(TASuspiciousDevice *)self->_detection descriptionDictionary];
  v7[1] = @"KeepInStagingUntil";
  v8[0] = v3;
  v4 = [(NSDate *)self->_keepInStagingUntil getDateString];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)description
{
  v3 = [(TAStagedSuspiciousDevice *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAStagedSuspiciousDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Detection"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeepInStagingUntil"];

  id v7 = [(TAStagedSuspiciousDevice *)self initWithDetection:v5 keepInStagingUntil:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  detection = self->_detection;
  id v5 = a3;
  [v5 encodeObject:detection forKey:@"Detection"];
  [v5 encodeObject:self->_keepInStagingUntil forKey:@"KeepInStagingUntil"];
}

- (TASuspiciousDevice)detection
{
  return self->_detection;
}

- (NSDate)keepInStagingUntil
{
  return self->_keepInStagingUntil;
}

- (void)setKeepInStagingUntil:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepInStagingUntil, 0);
  objc_storeStrong((id *)&self->_detection, 0);
}

@end