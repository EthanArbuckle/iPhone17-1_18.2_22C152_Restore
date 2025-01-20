@interface PKAccountPhysicalCardShippingUpdate
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPhysicalCardShippingUpdate:(id)a3;
- (NSDate)timestamp;
- (NSDateComponents)estimatedDeliveryDate;
- (NSString)description;
- (NSString)formattedEstimatedDeliveryDate;
- (NSString)localizedDeliveryExceptionReason;
- (NSString)physicalCardIdentifier;
- (NSString)shippingCompany;
- (NSString)trackingNumber;
- (NSURL)shipmentTrackingURL;
- (PKAccountPhysicalCardShippingUpdate)initWithCoder:(id)a3;
- (PKAccountPhysicalCardShippingUpdate)initWithRecord:(id)a3;
- (int64_t)shippingStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setEstimatedDeliveryDate:(id)a3;
- (void)setLocalizedDeliveryExceptionReason:(id)a3;
- (void)setPhysicalCardIdentifier:(id)a3;
- (void)setShippingCompany:(id)a3;
- (void)setShippingStatus:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrackingNumber:(id)a3;
@end

@implementation PKAccountPhysicalCardShippingUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPhysicalCardShippingUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountPhysicalCardShippingUpdate;
  v5 = [(PKAccountPhysicalCardShippingUpdate *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalCardIdentifier"];
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v6;

    v5->_shippingStatus = [v4 decodeIntegerForKey:@"shippingStatus"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deliveryExceptionReason"];
    localizedDeliveryExceptionReason = v5->_localizedDeliveryExceptionReason;
    v5->_localizedDeliveryExceptionReason = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingNumber"];
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingCompany"];
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusTimestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedDeliveryDate"];
    estimatedDeliveryDate = v5->_estimatedDeliveryDate;
    v5->_estimatedDeliveryDate = (NSDateComponents *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  physicalCardIdentifier = self->_physicalCardIdentifier;
  id v5 = a3;
  [v5 encodeObject:physicalCardIdentifier forKey:@"physicalCardIdentifier"];
  [v5 encodeInteger:self->_shippingStatus forKey:@"shippingStatus"];
  [v5 encodeObject:self->_localizedDeliveryExceptionReason forKey:@"deliveryExceptionReason"];
  [v5 encodeObject:self->_trackingNumber forKey:@"trackingNumber"];
  [v5 encodeObject:self->_shippingCompany forKey:@"shippingCompany"];
  [v5 encodeObject:self->_timestamp forKey:@"statusTimestamp"];
  [v5 encodeObject:self->_estimatedDeliveryDate forKey:@"estimatedDeliveryDate"];
}

- (PKAccountPhysicalCardShippingUpdate)initWithRecord:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKAccountPhysicalCardShippingUpdate;
  id v5 = [(PKAccountPhysicalCardShippingUpdate *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"physicalCardIdentifier");
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"shippingStatus");
    v5->_shippingStatus = PKPhysicalCardShippingStatusFromString(v8);

    uint64_t v9 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"deliveryExceptionReason");
    localizedDeliveryExceptionReason = v5->_localizedDeliveryExceptionReason;
    v5->_localizedDeliveryExceptionReason = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"trackingNumber");
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v11;

    uint64_t v13 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"shippingCompany");
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v13;

    uint64_t v15 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"statusTimestamp");
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v15;

    v17 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"estimatedDeliveryDate");
    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v18 setDateFormat:@"yyyy-MM-dd"];
      objc_super v19 = [v18 dateFromString:v17];
      v20 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      uint64_t v21 = [v20 components:28 fromDate:v19];
      estimatedDeliveryDate = v5->_estimatedDeliveryDate;
      v5->_estimatedDeliveryDate = (NSDateComponents *)v21;
    }
  }

  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v10 = [a3 encryptedValues];
  if (PKApplePayContainerEnvironment() == 2)
  {
    [v10 setObject:self->_physicalCardIdentifier forKey:@"physicalCardIdentifier"];
    unint64_t v4 = self->_shippingStatus - 1;
    id v5 = v4 > 3 ? 0 : off_1E56F49F0[v4];
    [v10 setObject:v5 forKey:@"shippingStatus"];
    [v10 setObject:self->_localizedDeliveryExceptionReason forKey:@"deliveryExceptionReason"];
    [v10 setObject:self->_trackingNumber forKey:@"trackingNumber"];
    [v10 setObject:self->_shippingCompany forKey:@"shippingCompany"];
    [v10 setObject:self->_timestamp forKey:@"statusTimestamp"];
    if (self->_estimatedDeliveryDate)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      v7 = [v6 dateFromComponents:self->_estimatedDeliveryDate];

      id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v8 setDateFormat:@"yyyy-MM-dd"];
      uint64_t v9 = [v8 stringFromDate:v7];
      [v10 setObject:v9 forKey:@"estimatedDeliveryDate"];
    }
  }
}

+ (id)recordType
{
  return @"PhysicalCardShippingUpdate";
}

+ (id)recordNamePrefix
{
  return @"physicalCardShippingUpdate";
}

- (NSURL)shipmentTrackingURL
{
  if ([(NSString *)self->_shippingCompany length] && [(NSString *)self->_trackingNumber length])
  {
    trackingNumber = self->_trackingNumber;
    unint64_t v4 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    id v5 = [(NSString *)trackingNumber stringByAddingPercentEncodingWithAllowedCharacters:v4];

    shippingCompany = self->_shippingCompany;
    v7 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    id v8 = [(NSString *)shippingCompany stringByAddingPercentEncodingWithAllowedCharacters:v7];

    uint64_t v9 = [NSString stringWithFormat:@"https://trackingshipment.apple.com/?Company=%@&TrackingNumber=%@", v8, v5];
    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  }
  else
  {
    id v10 = 0;
  }
  return (NSURL *)v10;
}

- (NSString)formattedEstimatedDeliveryDate
{
  if (self->_estimatedDeliveryDate)
  {
    if (qword_1EB4034C8 != -1) {
      dispatch_once(&qword_1EB4034C8, &__block_literal_global_208);
    }
    v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    unint64_t v4 = [v3 dateFromComponents:self->_estimatedDeliveryDate];

    id v5 = [(id)_MergedGlobals_282 stringFromDate:v4];
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

uint64_t __69__PKAccountPhysicalCardShippingUpdate_formattedEstimatedDeliveryDate__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_282;
  _MergedGlobals_282 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_282;
  return [v2 setDateFormat:@"MMM d"];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKAccountPhysicalCardShippingUpdate *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKAccountPhysicalCardShippingUpdate *)self isEqualToPhysicalCardShippingUpdate:v4];
  }

  return v5;
}

- (BOOL)isEqualToPhysicalCardShippingUpdate:(id)a3
{
  unint64_t v4 = a3;
  BOOL v5 = (void *)v4[1];
  uint64_t v6 = self->_physicalCardIdentifier;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    id v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_7;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_36;
    }
  }
  if (self->_shippingStatus != v4[2]) {
    goto LABEL_36;
  }
  uint64_t v11 = (void *)v4[3];
  uint64_t v6 = self->_localizedDeliveryExceptionReason;
  uint64_t v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    id v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_7;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_36;
    }
  }
  uint64_t v14 = (void *)v4[4];
  uint64_t v6 = self->_trackingNumber;
  uint64_t v15 = v14;
  if (v6 == v15)
  {
  }
  else
  {
    id v8 = v15;
    if (!v6 || !v15) {
      goto LABEL_7;
    }
    BOOL v16 = [(NSString *)v6 isEqualToString:v15];

    if (!v16) {
      goto LABEL_36;
    }
  }
  v17 = (void *)v4[5];
  uint64_t v6 = self->_shippingCompany;
  id v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_29;
  }
  id v8 = v18;
  if (!v6 || !v18)
  {
LABEL_7:

    goto LABEL_36;
  }
  BOOL v19 = [(NSString *)v6 isEqualToString:v18];

  if (!v19) {
    goto LABEL_36;
  }
LABEL_29:
  timestamp = self->_timestamp;
  uint64_t v21 = (NSDate *)v4[6];
  if (!timestamp || !v21)
  {
    if (timestamp == v21) {
      goto LABEL_32;
    }
LABEL_36:
    char v24 = 0;
    goto LABEL_37;
  }
  if ((-[NSDate isEqual:](timestamp, "isEqual:") & 1) == 0) {
    goto LABEL_36;
  }
LABEL_32:
  estimatedDeliveryDate = self->_estimatedDeliveryDate;
  v23 = (NSDateComponents *)v4[7];
  if (estimatedDeliveryDate && v23) {
    char v24 = -[NSDateComponents isEqual:](estimatedDeliveryDate, "isEqual:");
  }
  else {
    char v24 = estimatedDeliveryDate == v23;
  }
LABEL_37:

  return v24;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_physicalCardIdentifier];
  [v3 safelyAddObject:self->_localizedDeliveryExceptionReason];
  [v3 safelyAddObject:self->_trackingNumber];
  [v3 safelyAddObject:self->_shippingCompany];
  [v3 safelyAddObject:self->_timestamp];
  [v3 safelyAddObject:self->_estimatedDeliveryDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_shippingStatus - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"physicalCardIdentifier: '%@'; ", self->_physicalCardIdentifier];
  unint64_t v4 = self->_shippingStatus - 1;
  if (v4 > 3) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = off_1E56F49F0[v4];
  }
  [v3 appendFormat:@"shippingStatus: '%@'; ", v5];
  [v3 appendFormat:@"deliveryExceptionReason: '%@'; ", self->_localizedDeliveryExceptionReason];
  [v3 appendFormat:@"trackingNumber: '%@'; ", self->_trackingNumber];
  [v3 appendFormat:@"shippingCompany: '%@'; ", self->_shippingCompany];
  [v3 appendFormat:@"timestamp: '%@'; ", self->_timestamp];
  [v3 appendFormat:@"estimatedDeliveryDate: '%@'; ", self->_estimatedDeliveryDate];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)physicalCardIdentifier
{
  return self->_physicalCardIdentifier;
}

- (void)setPhysicalCardIdentifier:(id)a3
{
}

- (int64_t)shippingStatus
{
  return self->_shippingStatus;
}

- (void)setShippingStatus:(int64_t)a3
{
  self->_shippingStatus = a3;
}

- (NSString)localizedDeliveryExceptionReason
{
  return self->_localizedDeliveryExceptionReason;
}

- (void)setLocalizedDeliveryExceptionReason:(id)a3
{
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void)setTrackingNumber:(id)a3
{
}

- (NSString)shippingCompany
{
  return self->_shippingCompany;
}

- (void)setShippingCompany:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDateComponents)estimatedDeliveryDate
{
  return self->_estimatedDeliveryDate;
}

- (void)setEstimatedDeliveryDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedDeliveryDate, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shippingCompany, 0);
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_localizedDeliveryExceptionReason, 0);
  objc_storeStrong((id *)&self->_physicalCardIdentifier, 0);
}

@end