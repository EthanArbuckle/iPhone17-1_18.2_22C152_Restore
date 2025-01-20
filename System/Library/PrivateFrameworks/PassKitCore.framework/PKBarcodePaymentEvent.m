@interface PKBarcodePaymentEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)biometricsChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBarcodePaymentEvent:(id)a3;
- (NSData)eventMetadata;
- (NSDate)timestamp;
- (NSString)barcodeIdentifier;
- (NSString)deviceAccountIdentifier;
- (PKBarcodePaymentEvent)init;
- (PKBarcodePaymentEvent)initWithCoder:(id)a3;
- (id)data;
- (int64_t)authenticationType;
- (int64_t)version;
- (unint64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationType:(int64_t)a3;
- (void)setBarcodeIdentifier:(id)a3;
- (void)setBiometricsChanged:(BOOL)a3;
- (void)setDeviceAccountIdentifier:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PKBarcodePaymentEvent

- (PKBarcodePaymentEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKBarcodePaymentEvent;
  result = [(PKBarcodePaymentEvent *)&v3 init];
  if (result) {
    result->_version = 1;
  }
  return result;
}

- (id)data
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithInteger:self->_version];
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  v6 = [v5 stringFromDate:self->_timestamp];
  [v3 setObject:v6 forKeyedSubscript:@"timestamp"];

  [v3 setObject:self->_barcodeIdentifier forKeyedSubscript:@"barcodeIdentifier"];
  v7 = [NSNumber numberWithBool:self->_biometricsChanged];
  [v3 setObject:v7 forKeyedSubscript:@"biometricsChanged"];

  [v3 setObject:self->_deviceAccountIdentifier forKeyedSubscript:@"deviceAccountIdentifier"];
  v8 = [(NSData *)self->_eventMetadata base64EncodedStringWithOptions:0];
  [v3 setObject:v8 forKeyedSubscript:@"eventMetadata"];

  unint64_t authenticationType = self->_authenticationType;
  if (authenticationType <= 3) {
    [v3 setObject:off_1E56F1458[authenticationType] forKeyedSubscript:@"authenticationType"];
  }
  if (self->_eventType == 1) {
    [v3 setObject:@"barcodeDisplayed" forKeyedSubscript:@"eventType"];
  }
  v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKBarcodePaymentEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKBarcodePaymentEvent *)self isEqualToBarcodePaymentEvent:v5];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_timestamp];
  [v3 safelyAddObject:self->_barcodeIdentifier];
  [v3 safelyAddObject:self->_eventMetadata];
  [v3 safelyAddObject:self->_deviceAccountIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_version - v4 + 32 * v4;
  unint64_t v6 = self->_eventType - v5 + 32 * v5;
  uint64_t v7 = self->_biometricsChanged - v6 + 32 * v6;
  unint64_t v8 = self->_authenticationType - v7 + 32 * v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBarcodePaymentEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKBarcodePaymentEvent;
  int64_t v5 = [(PKBarcodePaymentEvent *)&v15 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"version"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v5->_eventType = [v4 decodeIntegerForKey:@"eventType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeIdentifier"];
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v8;

    v5->_biometricsChanged = [v4 decodeBoolForKey:@"biometricsChanged"];
    v5->_unint64_t authenticationType = [v4 decodeIntegerForKey:@"authenticationType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventMetadata"];
    eventMetadata = v5->_eventMetadata;
    v5->_eventMetadata = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAccountIdentifier"];
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeInteger:self->_eventType forKey:@"eventType"];
  [v5 encodeObject:self->_barcodeIdentifier forKey:@"barcodeIdentifier"];
  [v5 encodeBool:self->_biometricsChanged forKey:@"biometricsChanged"];
  [v5 encodeInteger:self->_authenticationType forKey:@"authenticationType"];
  [v5 encodeObject:self->_eventMetadata forKey:@"eventMetadata"];
  [v5 encodeObject:self->_deviceAccountIdentifier forKey:@"deviceAccountIdentifier"];
}

- (BOOL)isEqualToBarcodePaymentEvent:(id)a3
{
  id v4 = a3;
  if (self->_version != v4[2]) {
    goto LABEL_27;
  }
  timestamp = self->_timestamp;
  uint64_t v6 = (NSDate *)v4[3];
  if (timestamp) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (timestamp != v6) {
      goto LABEL_27;
    }
  }
  else
  {
    char v8 = -[NSDate isEqual:](timestamp, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_27;
    }
  }
  if (self->_eventType == v4[4])
  {
    v9 = (void *)v4[5];
    uint64_t v10 = self->_barcodeIdentifier;
    v11 = v9;
    if (v10 == v11)
    {
    }
    else
    {
      uint64_t v12 = v11;
      LOBYTE(v13) = 0;
      if (!v10 || !v11)
      {
LABEL_30:

        goto LABEL_28;
      }
      BOOL v13 = [(NSString *)v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_28;
      }
    }
    if (self->_biometricsChanged == *((unsigned __int8 *)v4 + 8) && self->_authenticationType == v4[6])
    {
      eventMetadata = self->_eventMetadata;
      objc_super v15 = (NSData *)v4[8];
      if (eventMetadata && v15)
      {
        if (-[NSData isEqual:](eventMetadata, "isEqual:")) {
          goto LABEL_22;
        }
      }
      else if (eventMetadata == v15)
      {
LABEL_22:
        deviceAccountIdentifier = self->_deviceAccountIdentifier;
        v17 = (void *)v4[7];
        uint64_t v10 = deviceAccountIdentifier;
        v18 = v17;
        if (v10 == v18)
        {
          LOBYTE(v13) = 1;
          uint64_t v12 = v10;
        }
        else
        {
          uint64_t v12 = v18;
          LOBYTE(v13) = 0;
          if (v10 && v18) {
            LOBYTE(v13) = [(NSString *)v10 isEqualToString:v18];
          }
        }
        goto LABEL_30;
      }
    }
  }
LABEL_27:
  LOBYTE(v13) = 0;
LABEL_28:

  return v13;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
}

- (BOOL)biometricsChanged
{
  return self->_biometricsChanged;
}

- (void)setBiometricsChanged:(BOOL)a3
{
  self->_biometricsChanged = a3;
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_unint64_t authenticationType = a3;
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
}

- (NSData)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end