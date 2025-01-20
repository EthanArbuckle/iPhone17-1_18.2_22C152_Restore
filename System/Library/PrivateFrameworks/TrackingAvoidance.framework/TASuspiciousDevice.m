@interface TASuspiciousDevice
+ (BOOL)supportsSecureCoding;
+ (id)convertTAForceSurfaceReasonToString:(unint64_t)a3;
+ (id)convertTANotificationImmediacyTypeToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)locationHistory;
- (NSData)address;
- (NSDate)date;
- (NSDictionary)detectionSummary;
- (TAAccessoryInformation)accessoryInfo;
- (TAMetricsDetection)detectionMetrics;
- (TASPAdvertisement)latestAdvertisement;
- (TASuspiciousDevice)initWithCoder:(id)a3;
- (TASuspiciousDevice)initWithLatestAdv:(id)a3 detectionSummary:(id)a4 date:(id)a5 locHistory:(id)a6 detectionMetrics:(id)a7 detectionType:(unint64_t)a8 immediacyType:(unint64_t)a9 accessoryInfo:(id)a10 forceSurfaceReason:(unint64_t)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)detectionType;
- (unint64_t)forceSurfaceReason;
- (unint64_t)immediacyType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryInfo:(id)a3;
- (void)updateForceReasonWith:(unint64_t)a3;
@end

@implementation TASuspiciousDevice

- (TASuspiciousDevice)initWithLatestAdv:(id)a3 detectionSummary:(id)a4 date:(id)a5 locHistory:(id)a6 detectionMetrics:(id)a7 detectionType:(unint64_t)a8 immediacyType:(unint64_t)a9 accessoryInfo:(id)a10 forceSurfaceReason:(unint64_t)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  v37.receiver = self;
  v37.super_class = (Class)TASuspiciousDevice;
  v22 = [(TASuspiciousDevice *)&v37 init];
  if (!v22) {
    goto LABEL_7;
  }
  v23 = 0;
  if (v16 && v17 && v18 && v19)
  {
    v24 = [v16 address];
    uint64_t v25 = [v24 copy];
    address = v22->_address;
    v22->_address = (NSData *)v25;

    uint64_t v27 = [v17 copy];
    detectionSummary = v22->_detectionSummary;
    v22->_detectionSummary = (NSDictionary *)v27;

    uint64_t v29 = [v18 copy];
    date = v22->_date;
    v22->_date = (NSDate *)v29;

    uint64_t v31 = [v16 copy];
    latestAdvertisement = v22->_latestAdvertisement;
    v22->_latestAdvertisement = (TASPAdvertisement *)v31;

    uint64_t v33 = [v19 copy];
    locationHistory = v22->_locationHistory;
    v22->_locationHistory = (NSArray *)v33;

    objc_storeStrong((id *)&v22->_detectionMetrics, a7);
    v22->_detectionType = a8;
    v22->_immediacyType = a9;
    objc_storeStrong((id *)&v22->_accessoryInfo, a10);
    v22->_forceSurfaceReason = a11;
LABEL_7:
    v23 = v22;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[TASuspiciousDevice alloc] initWithLatestAdv:self->_latestAdvertisement detectionSummary:self->_detectionSummary date:self->_date locHistory:self->_locationHistory detectionMetrics:self->_detectionMetrics detectionType:self->_detectionType immediacyType:self->_immediacyType accessoryInfo:self->_accessoryInfo forceSurfaceReason:self->_forceSurfaceReason];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (TASuspiciousDevice *)a3;
  if (self == v5)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v7 = [(TASuspiciousDevice *)self address];
      v8 = [(TASuspiciousDevice *)v6 address];
      v68 = (void *)v7;
      if ((void *)v7 != v8)
      {
        v3 = [(TASuspiciousDevice *)self address];
        v9 = [(TASuspiciousDevice *)v6 address];
        if (![v3 isEqual:v9])
        {
          BOOL v10 = 0;
          goto LABEL_51;
        }
        v66 = v9;
      }
      uint64_t v11 = [(TASuspiciousDevice *)self detectionSummary];
      v12 = [(TASuspiciousDevice *)v6 detectionSummary];
      v67 = (void *)v11;
      if ((void *)v11 != v12)
      {
        v13 = [(TASuspiciousDevice *)self detectionSummary];
        v14 = [(TASuspiciousDevice *)v6 detectionSummary];
        if (![v13 isEqual:v14])
        {
          BOOL v10 = 0;
LABEL_49:

LABEL_50:
          v9 = v66;
          if (v68 == v8)
          {
LABEL_52:

            goto LABEL_53;
          }
LABEL_51:

          goto LABEL_52;
        }
        v62 = v14;
        v63 = v13;
      }
      v15 = [(TASuspiciousDevice *)self date];
      uint64_t v16 = [(TASuspiciousDevice *)v6 date];
      id v17 = (void *)v16;
      if (v15 != (void *)v16)
      {
        v64 = v8;
        id v18 = v12;
        id v19 = v3;
        id v20 = (void *)v16;
        id v21 = v15;
        v22 = [(TASuspiciousDevice *)self date];
        [(TASuspiciousDevice *)v6 date];
        v23 = v61 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          BOOL v10 = 0;
          v15 = v21;
          id v17 = v20;
          v3 = v19;
          v12 = v18;
          v8 = v64;
LABEL_47:

LABEL_48:
          v14 = v62;
          v13 = v63;
          if (v67 == v12) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
        v15 = v21;
        id v17 = v20;
        v3 = v19;
        v12 = v18;
        v8 = v64;
        v59 = v23;
      }
      uint64_t v24 = [(TASuspiciousDevice *)self latestAdvertisement];
      uint64_t v60 = [(TASuspiciousDevice *)v6 latestAdvertisement];
      v65 = (void *)v24;
      if (v24 != v60)
      {
        uint64_t v25 = [(TASuspiciousDevice *)self latestAdvertisement];
        v56 = [(TASuspiciousDevice *)v6 latestAdvertisement];
        v57 = v25;
        if (!objc_msgSend(v25, "isEqual:"))
        {
          BOOL v10 = 0;
          v26 = (void *)v60;
LABEL_45:

LABEL_46:
          v23 = v59;
          if (v15 == v17) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }
      }
      uint64_t v27 = [(TASuspiciousDevice *)self locationHistory];
      uint64_t v58 = [(TASuspiciousDevice *)v6 locationHistory];
      if (v27 != v58)
      {
        v28 = (void *)v27;
        uint64_t v29 = [(TASuspiciousDevice *)self locationHistory];
        v53 = [(TASuspiciousDevice *)v6 locationHistory];
        v54 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          BOOL v10 = 0;
          v32 = (void *)v58;
LABEL_43:

LABEL_44:
          v26 = (void *)v60;
          if (v65 == (void *)v60) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
        uint64_t v27 = (uint64_t)v28;
      }
      uint64_t v30 = [(TASuspiciousDevice *)self detectionMetrics];
      uint64_t v55 = [(TASuspiciousDevice *)v6 detectionMetrics];
      v51 = (void *)v30;
      v52 = (void *)v27;
      if (v30 == v55)
      {
        v50 = v3;
      }
      else
      {
        uint64_t v31 = [(TASuspiciousDevice *)self detectionMetrics];
        v48 = [(TASuspiciousDevice *)v6 detectionMetrics];
        v49 = v31;
        if (!objc_msgSend(v31, "isEqual:"))
        {
          BOOL v10 = 0;
          v39 = v51;
          v40 = (void *)v55;
          goto LABEL_41;
        }
        v50 = v3;
        uint64_t v30 = (uint64_t)v51;
      }
      unint64_t v33 = [(TASuspiciousDevice *)self detectionType];
      if (v33 == [(TASuspiciousDevice *)v6 detectionType])
      {
        uint64_t v34 = [(TASuspiciousDevice *)self accessoryInfo];
        uint64_t v45 = [(TASuspiciousDevice *)v6 accessoryInfo];
        v46 = (void *)v34;
        BOOL v35 = v34 == v45;
        v3 = v50;
        if (v35
          || ([(TASuspiciousDevice *)self accessoryInfo],
              v47 = objc_claimAutoreleasedReturnValue(),
              [(TASuspiciousDevice *)v6 accessoryInfo],
              uint64_t v44 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v47, "isEqual:")))
        {
          unint64_t v41 = [(TASuspiciousDevice *)self immediacyType];
          if (v41 == [(TASuspiciousDevice *)v6 immediacyType])
          {
            unint64_t v42 = [(TASuspiciousDevice *)self forceSurfaceReason];
            BOOL v10 = v42 == [(TASuspiciousDevice *)v6 forceSurfaceReason];
          }
          else
          {
            BOOL v10 = 0;
          }
          objc_super v37 = (void *)v45;
          v36 = v46;
          v3 = v50;
          v38 = (void *)v44;
          if (v46 == (void *)v45)
          {
LABEL_40:

            v40 = (void *)v55;
            v39 = v51;
            if (v51 == (void *)v55) {
              goto LABEL_42;
            }
            goto LABEL_41;
          }
        }
        else
        {
          BOOL v10 = 0;
          objc_super v37 = (void *)v45;
          v36 = v46;
          v38 = (void *)v44;
        }

        goto LABEL_40;
      }
      BOOL v10 = 0;
      v39 = (void *)v30;
      v40 = (void *)v55;
      v3 = v50;
      if (v39 == (void *)v55)
      {
LABEL_42:

        v28 = v52;
        v32 = (void *)v58;
        if (v52 == (void *)v58) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
LABEL_41:

      goto LABEL_42;
    }
    BOOL v10 = 0;
  }
LABEL_53:

  return v10;
}

- (id)descriptionDictionary
{
  v19[9] = *MEMORY[0x263EF8340];
  v18[0] = @"ResultType";
  v4 = (objc_class *)objc_opt_class();
  id v17 = NSStringFromClass(v4);
  v19[0] = v17;
  v18[1] = @"Address";
  v5 = [(NSData *)self->_address hexString];
  detectionSummary = self->_detectionSummary;
  date = self->_date;
  v19[1] = v5;
  v19[2] = detectionSummary;
  v18[2] = @"Summary";
  v18[3] = @"Date";
  v8 = [(NSDate *)date getDateString];
  v19[3] = v8;
  v18[4] = @"DeviceType";
  v9 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:[(TASPAdvertisement *)self->_latestAdvertisement getDeviceType]];
  v19[4] = v9;
  v18[5] = @"Type";
  BOOL v10 = +[TAMetricsDetection convertTADetectionTypeToString:self->_detectionType];
  v19[5] = v10;
  v18[6] = @"Immediacy";
  uint64_t v11 = +[TASuspiciousDevice convertTANotificationImmediacyTypeToString:self->_immediacyType];
  v19[6] = v11;
  v18[7] = @"AISInfo";
  v12 = [(TASuspiciousDevice *)self accessoryInfo];
  if (v12)
  {
    v2 = [(TASuspiciousDevice *)self accessoryInfo];
    v13 = [v2 descriptionDictionary];
  }
  else
  {
    v13 = &stru_26D677430;
  }
  v19[7] = v13;
  v18[8] = @"ForceReason";
  v14 = +[TASuspiciousDevice convertTAForceSurfaceReasonToString:self->_forceSurfaceReason];
  v19[8] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:9];

  if (v12)
  {
  }
  return v15;
}

- (id)description
{
  v3 = [(TASuspiciousDevice *)self descriptionDictionary];
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
  v8 = v7;

  return v8;
}

+ (id)convertTANotificationImmediacyTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Never";
  }
  else {
    return off_2646AA9E8[a3 - 1];
  }
}

+ (id)convertTAForceSurfaceReasonToString:(unint64_t)a3
{
  v3 = @"None";
  if (a3 == 1) {
    v3 = @"ArriveHome";
  }
  if (a3 == 2) {
    return @"BeepOnMove";
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASuspiciousDevice)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LastAdvertisement"];
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v3 decodeObjectOfClasses:v8 forKey:@"Summary"];

  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"LocationHistory"];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Metrics"];
  uint64_t v16 = (int)[v3 decodeInt32ForKey:@"Type"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"Immediacy"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AISInfo"];
  uint64_t v19 = [v3 decodeIntegerForKey:@"ForceReason"];

  id v20 = [(TASuspiciousDevice *)self initWithLatestAdv:v4 detectionSummary:v9 date:v10 locHistory:v14 detectionMetrics:v15 detectionType:v16 immediacyType:v17 accessoryInfo:v18 forceSurfaceReason:v19];
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(TASuspiciousDevice *)self latestAdvertisement];
  [v10 encodeObject:v4 forKey:@"LastAdvertisement"];

  id v5 = [(TASuspiciousDevice *)self detectionSummary];
  [v10 encodeObject:v5 forKey:@"Summary"];

  uint64_t v6 = [(TASuspiciousDevice *)self date];
  [v10 encodeObject:v6 forKey:@"Date"];

  uint64_t v7 = [(TASuspiciousDevice *)self locationHistory];
  [v10 encodeObject:v7 forKey:@"LocationHistory"];

  v8 = [(TASuspiciousDevice *)self detectionMetrics];
  [v10 encodeObject:v8 forKey:@"Metrics"];

  objc_msgSend(v10, "encodeInt32:forKey:", -[TASuspiciousDevice detectionType](self, "detectionType"), @"Type");
  objc_msgSend(v10, "encodeInteger:forKey:", -[TASuspiciousDevice immediacyType](self, "immediacyType"), @"Immediacy");
  v9 = [(TASuspiciousDevice *)self accessoryInfo];
  [v10 encodeObject:v9 forKey:@"AISInfo"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[TASuspiciousDevice forceSurfaceReason](self, "forceSurfaceReason"), @"ForceReason");
}

- (void)updateForceReasonWith:(unint64_t)a3
{
  self->_forceSurfaceReason = a3;
}

- (NSData)address
{
  return self->_address;
}

- (NSDictionary)detectionSummary
{
  return self->_detectionSummary;
}

- (NSDate)date
{
  return self->_date;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (NSArray)locationHistory
{
  return self->_locationHistory;
}

- (TAMetricsDetection)detectionMetrics
{
  return self->_detectionMetrics;
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (unint64_t)immediacyType
{
  return self->_immediacyType;
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
}

- (unint64_t)forceSurfaceReason
{
  return self->_forceSurfaceReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_detectionMetrics, 0);
  objc_storeStrong((id *)&self->_locationHistory, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_detectionSummary, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end