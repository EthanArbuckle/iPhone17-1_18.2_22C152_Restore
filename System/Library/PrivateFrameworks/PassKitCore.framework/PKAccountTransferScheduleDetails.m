@interface PKAccountTransferScheduleDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)scheduledDate;
- (NSString)transferTermsIdentifier;
- (PKAccountTransferScheduleDetails)initWithCoder:(id)a3;
- (PKAccountTransferScheduleDetails)initWithDictionary:(id)a3;
- (PKAccountTransferScheduleDetails)initWithDictionary:(id)a3 productTimeZone:(id)a4;
- (id)description;
- (id)hashString;
- (id)jsonDictionaryRepresentation;
- (id)jsonString;
- (int64_t)scheduledDay;
- (unint64_t)frequency;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFrequency:(unint64_t)a3;
- (void)setScheduleTimeZone:(id)a3;
- (void)setScheduledDate:(id)a3;
- (void)setScheduledDay:(int64_t)a3;
- (void)setTransferTermsIdentifier:(id)a3;
@end

@implementation PKAccountTransferScheduleDetails

- (PKAccountTransferScheduleDetails)initWithDictionary:(id)a3
{
  return [(PKAccountTransferScheduleDetails *)self initWithDictionary:a3 productTimeZone:0];
}

- (PKAccountTransferScheduleDetails)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKAccountTransferScheduleDetails *)self init];
  if (v8)
  {
    v9 = [v6 PKStringForKey:@"frequency"];
    v19[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v8->_frequency = PKAccountTransferFrequencyFromStrings(v10);

    v8->_scheduledDay = [v6 PKIntegerForKey:@"scheduledDay"];
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
    uint64_t v16 = [v6 PKStringForKey:@"transferTermsIdentifier"];
    transferTermsIdentifier = v8->_transferTermsIdentifier;
    v8->_transferTermsIdentifier = (NSString *)v16;
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
  v3 = [(PKAccountTransferScheduleDetails *)self jsonDictionaryRepresentation];
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
  v4 = PKAccountTransferFrequencyToStrings(self->_frequency);
  id v5 = [v4 firstObject];
  [v3 setObject:v5 forKeyedSubscript:@"frequency"];

  [v3 setObject:self->_transferTermsIdentifier forKeyedSubscript:@"transferTermsIdentifier"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (id)hashString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = PKAccountTransferFrequencyToStrings(self->_frequency);
  id v5 = [v4 firstObject];
  [v3 appendString:v5];

  if (self->_transferTermsIdentifier) {
    objc_msgSend(v3, "appendString:");
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransferScheduleDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountTransferScheduleDetails;
  id v5 = [(PKAccountTransferScheduleDetails *)&v11 init];
  if (v5)
  {
    v5->_frequency = [v4 decodeIntegerForKey:@"frequency"];
    v5->_scheduledDay = [v4 decodeIntegerForKey:@"scheduledDay"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledDate"];
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferTermsIdentifier"];
    transferTermsIdentifier = v5->_transferTermsIdentifier;
    v5->_transferTermsIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t frequency = self->_frequency;
  id v5 = a3;
  [v5 encodeInteger:frequency forKey:@"frequency"];
  [v5 encodeObject:self->_scheduledDate forKey:@"scheduledDate"];
  [v5 encodeInteger:self->_scheduledDay forKey:@"scheduledDay"];
  [v5 encodeObject:self->_transferTermsIdentifier forKey:@"transferTermsIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  scheduledDate = self->_scheduledDate;
  uint64_t v6 = (NSDate *)v4[4];
  if (scheduledDate && v6)
  {
    if ((-[NSDate isEqual:](scheduledDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (scheduledDate != v6)
  {
    goto LABEL_14;
  }
  transferTermsIdentifier = self->_transferTermsIdentifier;
  uint64_t v8 = (NSString *)v4[5];
  if (!transferTermsIdentifier || !v8)
  {
    if (transferTermsIdentifier == v8) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  if ((-[NSString isEqual:](transferTermsIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  if (self->_frequency != v4[2]) {
    goto LABEL_14;
  }
  BOOL v9 = self->_scheduledDay == v4[3];
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_scheduledDate];
  [v3 safelyAddObject:self->_transferTermsIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_frequency - v4 + 32 * v4;
  unint64_t v6 = self->_scheduledDay - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = PKAccountTransferFrequencyToStrings(self->_frequency);
  unint64_t v5 = [v4 firstObject];
  objc_msgSend(v3, "appendFormat:", @"frequency: '%ld'; ", v5);

  if (self->_scheduledDay) {
    objc_msgSend(v3, "appendFormat:", @"scheduledDay: '%ld': ", self->_scheduledDay);
  }
  [v3 appendFormat:@"scheduledDate: '%@'; ", self->_scheduledDate];
  [v3 appendFormat:@"transferTermsIdentifier: '%@'; ", self->_transferTermsIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_unint64_t frequency = a3;
}

- (int64_t)scheduledDay
{
  return self->_scheduledDay;
}

- (void)setScheduledDay:(int64_t)a3
{
  self->_scheduledDay = a3;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
}

- (NSString)transferTermsIdentifier
{
  return self->_transferTermsIdentifier;
}

- (void)setTransferTermsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
}

@end