@interface ULServiceStatus
+ (BOOL)supportsSecureCoding;
+ (ULServiceStatus)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)serviceSuspendReasons;
- (NSError)error;
- (NSUUID)currentLocationOfInterestUuid;
- (ULLocationType)currentLocationOfInterestType;
- (ULServiceDescriptor)serviceDescriptor;
- (ULServiceMetaInfo)metaInfo;
- (ULServiceQualityInfo)serviceQualityInfo;
- (ULServiceStatus)init;
- (ULServiceStatus)initWithCoder:(id)a3;
- (ULServiceStatus)initWithServiceState:(unint64_t)a3 serviceSuspendReasons:(id)a4 serviceDescriptor:(id)a5 currentLocationOfInterestUuid:(id)a6 currentLocationOfInterestType:(id)a7 error:(id)a8 serviceQualityInfo:(id)a9 metaInfo:(id)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)serviceState;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentLocationOfInterestType:(id)a3;
- (void)setCurrentLocationOfInterestUuid:(id)a3;
- (void)setError:(id)a3;
- (void)setMetaInfo:(id)a3;
- (void)setServiceDescriptor:(id)a3;
- (void)setServiceQualityInfo:(id)a3;
- (void)setServiceState:(unint64_t)a3;
- (void)setServiceSuspendReasons:(id)a3;
@end

@implementation ULServiceStatus

- (ULServiceStatus)initWithServiceState:(unint64_t)a3 serviceSuspendReasons:(id)a4 serviceDescriptor:(id)a5 currentLocationOfInterestUuid:(id)a6 currentLocationOfInterestType:(id)a7 error:(id)a8 serviceQualityInfo:(id)a9 metaInfo:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v27.receiver = self;
  v27.super_class = (Class)ULServiceStatus;
  v23 = [(ULServiceStatus *)&v27 init];
  v24 = v23;
  if (v23)
  {
    [(ULServiceStatus *)v23 setServiceState:a3];
    [(ULServiceStatus *)v24 setServiceSuspendReasons:v16];
    [(ULServiceStatus *)v24 setServiceDescriptor:v17];
    [(ULServiceStatus *)v24 setCurrentLocationOfInterestUuid:v18];
    [(ULServiceStatus *)v24 setCurrentLocationOfInterestType:v19];
    [(ULServiceStatus *)v24 setError:v20];
    [(ULServiceStatus *)v24 setServiceQualityInfo:v21];
    [(ULServiceStatus *)v24 setMetaInfo:v22];
    v25 = v24;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(ULServiceStatus *)self serviceState];
  v6 = [(ULServiceStatus *)self serviceSuspendReasons];
  v7 = [(ULServiceStatus *)self serviceDescriptor];
  v8 = [(ULServiceStatus *)self currentLocationOfInterestUuid];
  v9 = [(ULServiceStatus *)self currentLocationOfInterestType];
  v10 = [(ULServiceStatus *)self error];
  v11 = [(ULServiceStatus *)self serviceQualityInfo];
  v12 = [(ULServiceStatus *)self metaInfo];
  v13 = (void *)[v4 initWithServiceState:v5 serviceSuspendReasons:v6 serviceDescriptor:v7 currentLocationOfInterestUuid:v8 currentLocationOfInterestType:v9 error:v10 serviceQualityInfo:v11 metaInfo:v12];

  objc_msgSend(v13, "setServiceState:", -[ULServiceStatus serviceState](self, "serviceState"));
  v14 = [(ULServiceStatus *)self serviceSuspendReasons];
  v15 = (void *)[v14 copyWithZone:a3];
  [v13 setServiceSuspendReasons:v15];

  id v16 = [(ULServiceStatus *)self serviceDescriptor];
  id v17 = (void *)[v16 copyWithZone:a3];
  [v13 setServiceDescriptor:v17];

  id v18 = [(ULServiceStatus *)self currentLocationOfInterestUuid];
  id v19 = (void *)[v18 copyWithZone:a3];
  [v13 setCurrentLocationOfInterestUuid:v19];

  id v20 = [(ULServiceStatus *)self currentLocationOfInterestType];
  id v21 = (void *)[v20 copyWithZone:a3];
  [v13 setCurrentLocationOfInterestType:v21];

  id v22 = [(ULServiceStatus *)self error];
  v23 = (void *)[v22 copyWithZone:a3];
  [v13 setError:v23];

  v24 = [(ULServiceStatus *)self serviceQualityInfo];
  v25 = (void *)[v24 copyWithZone:a3];
  [v13 setServiceQualityInfo:v25];

  v26 = [(ULServiceStatus *)self metaInfo];
  objc_super v27 = (void *)[v26 copyWithZone:a3];
  [v13 setMetaInfo:v27];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t serviceState = self->_serviceState;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedInteger:serviceState];
  [v7 encodeObject:v6 forKey:@"serviceState"];

  [v7 encodeObject:self->_serviceSuspendReasons forKey:@"serviceSuspendReasons"];
  [v7 encodeObject:self->_serviceDescriptor forKey:@"serviceDescriptor"];
  [v7 encodeObject:self->_currentLocationOfInterestUuid forKey:@"currentLocationOfInterestUuid"];
  [v7 encodeObject:self->_currentLocationOfInterestType forKey:@"currentLocationOfInterestType"];
  [v7 encodeObject:self->_error forKey:@"error"];
  [v7 encodeObject:self->_serviceQualityInfo forKey:@"serviceQualityInfo"];
  [v7 encodeObject:self->_metaInfo forKey:@"metaInfo"];
}

- (ULServiceStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ULServiceStatus;
  unint64_t v5 = [(ULServiceStatus *)&v30 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceState"];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(ULServiceStatus *)v6 unsignedIntegerValue];

      v5->_unint64_t serviceState = v8;
      id v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"serviceSuspendReasons"];
      if (v7)
      {
        uint64_t v9 = self;

        serviceSuspendReasons = v5->_serviceSuspendReasons;
        v5->_serviceSuspendReasons = (NSArray *)v9;

        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceDescriptor"];
        uint64_t v12 = self;

        serviceDescriptor = v5->_serviceDescriptor;
        v5->_serviceDescriptor = (ULServiceDescriptor *)v12;

        v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentLocationOfInterestUuid"];
        uint64_t v15 = self;

        currentLocationOfInterestUuid = v5->_currentLocationOfInterestUuid;
        v5->_currentLocationOfInterestUuid = (NSUUID *)v15;

        id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentLocationOfInterestType"];
        uint64_t v18 = self;

        currentLocationOfInterestType = v5->_currentLocationOfInterestType;
        v5->_currentLocationOfInterestType = (ULLocationType *)v18;

        id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
        uint64_t v21 = self;

        error = v5->_error;
        v5->_error = (NSError *)v21;

        v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceQualityInfo"];
        uint64_t v24 = self;

        serviceQualityInfo = v5->_serviceQualityInfo;
        v5->_serviceQualityInfo = (ULServiceQualityInfo *)v24;

        v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaInfo"];
        uint64_t v27 = self;

        metaInfo = v5->_metaInfo;
        v5->_metaInfo = (ULServiceMetaInfo *)v27;

        id v7 = v5;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  unint64_t v7 = [(ULServiceStatus *)self serviceState];
  uint64_t v8 = @"Suspended";
  if (v7 != 1) {
    uint64_t v8 = @"Unknown";
  }
  if (!v7) {
    uint64_t v8 = @"Running";
  }
  [v6 appendFormat:@", serviceState: %@", v8];
  [v6 appendFormat:@", serviceSuspendReasons: %@", self->_serviceSuspendReasons];
  [v6 appendFormat:@", serviceDescriptor: %@", self->_serviceDescriptor];
  [v6 appendFormat:@", currentLocationOfInterestUuid: %@", self->_currentLocationOfInterestUuid];
  uint64_t v9 = [(ULServiceStatus *)self currentLocationOfInterestType];
  if (v9)
  {
    v10 = [(ULServiceStatus *)self currentLocationOfInterestType];
    v11 = ULLocationTypeToString([v10 locationType]);
    [v6 appendFormat:@", currentLocationOfInterestType: %@", v11];
  }
  else
  {
    [v6 appendFormat:@", currentLocationOfInterestType: %@", @"Unknown"];
  }

  [v6 appendFormat:@", error: %@", self->_error];
  [v6 appendFormat:@", serviceQualityInfo: %@", self->_serviceQualityInfo];
  [v6 appendFormat:@", metaInfo: %@", self->_metaInfo];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(ULServiceStatus *)self serviceState];
    if (v6 == [v5 serviceState])
    {
      unint64_t v7 = [(ULServiceStatus *)self serviceSuspendReasons];
      uint64_t v8 = [v5 serviceSuspendReasons];
      if ([v7 isEqual:v8])
      {
      }
      else
      {
        v10 = [(ULServiceStatus *)self serviceSuspendReasons];
        v11 = [v5 serviceSuspendReasons];

        if (v10 != v11) {
          goto LABEL_22;
        }
      }
      uint64_t v12 = [(ULServiceStatus *)self serviceDescriptor];
      v13 = [v5 serviceDescriptor];
      if ([v12 isEqual:v13])
      {
      }
      else
      {
        v14 = [(ULServiceStatus *)self serviceDescriptor];
        uint64_t v15 = [v5 serviceDescriptor];

        if (v14 != v15) {
          goto LABEL_22;
        }
      }
      id v16 = [(ULServiceStatus *)self currentLocationOfInterestUuid];
      id v17 = [v5 currentLocationOfInterestUuid];
      if ([v16 isEqual:v17])
      {
      }
      else
      {
        uint64_t v18 = [(ULServiceStatus *)self currentLocationOfInterestUuid];
        id v19 = [v5 currentLocationOfInterestUuid];

        if (v18 != v19) {
          goto LABEL_22;
        }
      }
      id v20 = [(ULServiceStatus *)self currentLocationOfInterestType];
      uint64_t v21 = [v5 currentLocationOfInterestType];
      if ([v20 isEqual:v21])
      {
      }
      else
      {
        id v22 = [(ULServiceStatus *)self currentLocationOfInterestType];
        v23 = [v5 currentLocationOfInterestType];

        if (v22 != v23) {
          goto LABEL_22;
        }
      }
      uint64_t v24 = [(ULServiceStatus *)self error];
      v25 = [v5 error];
      if ([v24 isEqual:v25])
      {
      }
      else
      {
        v26 = [(ULServiceStatus *)self error];
        uint64_t v27 = [v5 error];

        if (v26 != v27) {
          goto LABEL_22;
        }
      }
      v28 = [(ULServiceStatus *)self serviceQualityInfo];
      v29 = [v5 serviceQualityInfo];
      if ([v28 isEqual:v29])
      {

        goto LABEL_25;
      }
      objc_super v30 = [(ULServiceStatus *)self serviceQualityInfo];
      v31 = [v5 serviceQualityInfo];

      if (v30 == v31)
      {
LABEL_25:
        v33 = [(ULServiceStatus *)self metaInfo];
        v34 = [v5 metaInfo];
        if ([v33 isEqual:v34])
        {

          char v9 = 1;
        }
        else
        {
          v35 = [(ULServiceStatus *)self metaInfo];
          v36 = [v5 metaInfo];
          BOOL v37 = v35 != v36;

          char v9 = !v37;
        }
        goto LABEL_23;
      }
    }
LABEL_22:
    char v9 = 0;
LABEL_23:

    goto LABEL_24;
  }
  char v9 = 0;
LABEL_24:

  return v9 & 1;
}

- (unint64_t)hash
{
  unint64_t serviceState = self->_serviceState;
  uint64_t v4 = [(NSArray *)self->_serviceSuspendReasons hash] ^ serviceState;
  unint64_t v5 = [(ULServiceDescriptor *)self->_serviceDescriptor hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSUUID *)self->_currentLocationOfInterestUuid hash];
  unint64_t v7 = [(ULLocationType *)self->_currentLocationOfInterestType hash];
  uint64_t v8 = v7 ^ [(NSError *)self->_error hash];
  unint64_t v9 = v6 ^ v8 ^ [(ULServiceQualityInfo *)self->_serviceQualityInfo hash];
  return v9 ^ [(ULServiceMetaInfo *)self->_metaInfo hash];
}

- (ULServiceStatus)init
{
}

+ (ULServiceStatus)new
{
}

- (unint64_t)serviceState
{
  return self->_serviceState;
}

- (void)setServiceState:(unint64_t)a3
{
  self->_unint64_t serviceState = a3;
}

- (NSArray)serviceSuspendReasons
{
  return self->_serviceSuspendReasons;
}

- (void)setServiceSuspendReasons:(id)a3
{
}

- (ULServiceDescriptor)serviceDescriptor
{
  return self->_serviceDescriptor;
}

- (void)setServiceDescriptor:(id)a3
{
}

- (NSUUID)currentLocationOfInterestUuid
{
  return self->_currentLocationOfInterestUuid;
}

- (void)setCurrentLocationOfInterestUuid:(id)a3
{
}

- (ULLocationType)currentLocationOfInterestType
{
  return self->_currentLocationOfInterestType;
}

- (void)setCurrentLocationOfInterestType:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (ULServiceQualityInfo)serviceQualityInfo
{
  return self->_serviceQualityInfo;
}

- (void)setServiceQualityInfo:(id)a3
{
}

- (ULServiceMetaInfo)metaInfo
{
  return self->_metaInfo;
}

- (void)setMetaInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaInfo, 0);
  objc_storeStrong((id *)&self->_serviceQualityInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentLocationOfInterestType, 0);
  objc_storeStrong((id *)&self->_currentLocationOfInterestUuid, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);

  objc_storeStrong((id *)&self->_serviceSuspendReasons, 0);
}

@end