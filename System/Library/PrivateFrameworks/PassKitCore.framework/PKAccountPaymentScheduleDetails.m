@interface PKAccountPaymentScheduleDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)scheduledDate;
- (NSString)paymentTermsIdentifier;
- (PKAccountPaymentScheduleDetails)initWithCoder:(id)a3;
- (PKAccountPaymentScheduleDetails)initWithDictionary:(id)a3;
- (PKAccountPaymentScheduleDetails)initWithDictionary:(id)a3 productTimeZone:(id)a4;
- (id)description;
- (id)hashString;
- (id)jsonDictionaryRepresentation;
- (id)jsonString;
- (int64_t)frequency;
- (int64_t)preset;
- (int64_t)scheduledDay;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setPaymentTermsIdentifier:(id)a3;
- (void)setPreset:(int64_t)a3;
- (void)setScheduleTimeZone:(id)a3;
- (void)setScheduledDate:(id)a3;
- (void)setScheduledDay:(int64_t)a3;
@end

@implementation PKAccountPaymentScheduleDetails

- (PKAccountPaymentScheduleDetails)initWithDictionary:(id)a3
{
  return [(PKAccountPaymentScheduleDetails *)self initWithDictionary:a3 productTimeZone:0];
}

- (PKAccountPaymentScheduleDetails)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKAccountPaymentScheduleDetails *)self init];
  if (v8)
  {
    v9 = [v6 PKStringForKey:@"frequency"];
    v8->_frequency = PKAccountPaymentFrequencyFromString(v9);
    v8->_scheduledDay = [v6 PKIntegerForKey:@"scheduledDay"];
    v10 = [v6 PKStringForKey:@"preset"];
    v8->_preset = PKAccountPaymentPresetFromString(v10);
    v11 = [v6 PKStringForKey:@"scheduledDate"];
    objc_storeStrong((id *)&v8->_productTimeZone, a4);
    v12 = PKPaymentDateFormatterWithTimeZone(v7);
    v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 dateFromString:v11];
      scheduledDate = v8->_scheduledDate;
      v8->_scheduledDate = (NSDate *)v14;
    }
    uint64_t v16 = [v6 PKStringForKey:@"paymentTermsIdentifier"];
    paymentTermsIdentifier = v8->_paymentTermsIdentifier;
    v8->_paymentTermsIdentifier = (NSString *)v16;
  }
  return v8;
}

- (void)setScheduleTimeZone:(id)a3
{
}

- (id)jsonString
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(PKAccountPaymentScheduleDetails *)self jsonDictionaryRepresentation];
  id v9 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:2 error:&v9];
  id v5 = v9;

  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = PKAccountPaymentFrequencyToString(self->_frequency);
  [v3 setObject:v4 forKeyedSubscript:@"frequency"];

  id v5 = PKAccountPaymentPresetToString(self->_preset);
  [v3 setObject:v5 forKeyedSubscript:@"preset"];

  [v3 setObject:self->_paymentTermsIdentifier forKeyedSubscript:@"paymentTermsIdentifier"];
  if (self->_frequency == 6 && self->_scheduledDay)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v6 forKeyedSubscript:@"scheduledDay"];
  }
  else
  {
    id v6 = PKPaymentDateFormatterWithTimeZone(self->_productTimeZone);
    id v7 = [v6 stringFromDate:self->_scheduledDate];
    [v3 setObject:v7 forKeyedSubscript:@"scheduledDate"];
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)hashString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  int64_t frequency = self->_frequency;
  if (frequency)
  {
    id v5 = PKAccountPaymentFrequencyToString(frequency);
    [v3 appendString:v5];
  }
  int64_t preset = self->_preset;
  if (preset)
  {
    id v7 = PKAccountPaymentPresetToString(preset);
    [v3 appendString:v7];
  }
  if (self->_frequency == 6 && self->_scheduledDay)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v9 = [v8 stringValue];
  }
  else
  {
    if (!self->_scheduledDate) {
      goto LABEL_11;
    }
    v8 = PKPaymentDateFormatterWithTimeZone(self->_productTimeZone);
    uint64_t v9 = [v8 stringFromDate:self->_scheduledDate];
  }
  v10 = (void *)v9;
  [v3 appendString:v9];

LABEL_11:
  if (self->_paymentTermsIdentifier) {
    objc_msgSend(v3, "appendString:");
  }
  id v11 = (void *)[v3 copy];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentScheduleDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountPaymentScheduleDetails;
  id v5 = [(PKAccountPaymentScheduleDetails *)&v11 init];
  if (v5)
  {
    v5->_int64_t frequency = [v4 decodeIntegerForKey:@"frequency"];
    v5->_scheduledDay = [v4 decodeIntegerForKey:@"scheduledDay"];
    v5->_int64_t preset = [v4 decodeIntegerForKey:@"preset"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledDate"];
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTermsIdentifier"];
    paymentTermsIdentifier = v5->_paymentTermsIdentifier;
    v5->_paymentTermsIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t frequency = self->_frequency;
  id v5 = a3;
  [v5 encodeInteger:frequency forKey:@"frequency"];
  [v5 encodeInteger:self->_preset forKey:@"preset"];
  [v5 encodeObject:self->_scheduledDate forKey:@"scheduledDate"];
  [v5 encodeInteger:self->_scheduledDay forKey:@"scheduledDay"];
  [v5 encodeObject:self->_paymentTermsIdentifier forKey:@"paymentTermsIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  scheduledDate = self->_scheduledDate;
  uint64_t v6 = (NSDate *)v4[5];
  if (scheduledDate && v6)
  {
    if ((-[NSDate isEqual:](scheduledDate, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (scheduledDate != v6)
  {
    goto LABEL_15;
  }
  paymentTermsIdentifier = self->_paymentTermsIdentifier;
  uint64_t v8 = (NSString *)v4[6];
  if (!paymentTermsIdentifier || !v8)
  {
    if (paymentTermsIdentifier == v8) {
      goto LABEL_12;
    }
LABEL_15:
    BOOL v9 = 0;
    goto LABEL_16;
  }
  if ((-[NSString isEqual:](paymentTermsIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  if (self->_frequency != v4[2] || self->_scheduledDay != v4[3]) {
    goto LABEL_15;
  }
  BOOL v9 = self->_preset == v4[4];
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_scheduledDate];
  [v3 safelyAddObject:self->_paymentTermsIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_frequency - v4 + 32 * v4;
  int64_t v6 = self->_scheduledDay - v5 + 32 * v5;
  unint64_t v7 = self->_preset - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = PKAccountPaymentFrequencyToString(self->_frequency);
  [v3 appendFormat:@"frequency: '%@'; ", v4];

  if (self->_scheduledDay) {
    objc_msgSend(v3, "appendFormat:", @"scheduledDay: '%ld': ", self->_scheduledDay);
  }
  int64_t v5 = PKAccountPaymentPresetToString(self->_preset);
  [v3 appendFormat:@"preset: '%@'; ", v5];

  [v3 appendFormat:@"scheduledDate: '%@'; ", self->_scheduledDate];
  [v3 appendFormat:@"paymentTermsIdentifier: '%@'; ", self->_paymentTermsIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_int64_t frequency = a3;
}

- (int64_t)scheduledDay
{
  return self->_scheduledDay;
}

- (void)setScheduledDay:(int64_t)a3
{
  self->_scheduledDay = a3;
}

- (int64_t)preset
{
  return self->_preset;
}

- (void)setPreset:(int64_t)a3
{
  self->_int64_t preset = a3;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
}

- (NSString)paymentTermsIdentifier
{
  return self->_paymentTermsIdentifier;
}

- (void)setPaymentTermsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
}

@end