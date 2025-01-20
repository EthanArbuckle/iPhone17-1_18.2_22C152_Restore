@interface PKVerificationRequestRecord
+ (BOOL)supportsSecureCoding;
+ (id)verificationRequestRecordForPass:(id)a3;
- (NSArray)allChannels;
- (NSDate)date;
- (NSDictionary)requiredFieldData;
- (NSString)currentStepIdentifier;
- (NSString)passUniqueID;
- (NSString)previousStepIdentifier;
- (PKVerificationChannel)channel;
- (PKVerificationRequestRecord)initWithCoder:(id)a3;
- (id)description;
- (id)requiredVerificationFields;
- (int64_t)verificationStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAllChannels:(id)a3;
- (void)setChannel:(id)a3;
- (void)setCurrentStepIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setPreviousStepIdentifier:(id)a3;
- (void)setRequiredFieldData:(id)a3;
- (void)setVerificationStatus:(int64_t)a3;
@end

@implementation PKVerificationRequestRecord

+ (id)verificationRequestRecordForPass:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 uniqueID];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)objc_opt_class());
    v7 = [v3 uniqueID];
    [v6 setPassUniqueID:v7];

    v8 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setDate:v8];
  }
  else
  {
    v9 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = [v3 description];
      int v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_190E10000, v9, OS_LOG_TYPE_ERROR, "Cannot create verification record without pass unique ID :%{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (PKVerificationRequestRecord)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKVerificationRequestRecord;
  uint64_t v5 = [(PKVerificationRequestRecord *)&v23 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueID"];
    [(PKVerificationRequestRecord *)v5 setPassUniqueID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    [(PKVerificationRequestRecord *)v5 setDate:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channel"];
    [(PKVerificationRequestRecord *)v5 setChannel:v8];

    -[PKVerificationRequestRecord setVerificationStatus:](v5, "setVerificationStatus:", [v4 decodeIntegerForKey:@"verificationStatus"]);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    int v12 = [v4 decodeObjectOfClasses:v11 forKey:@"allChannels"];
    [(PKVerificationRequestRecord *)v5 setAllChannels:v12];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"PKVerificationRequestRecordRequiredFieldData"];
    [(PKVerificationRequestRecord *)v5 setRequiredFieldData:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentStepIdentifier"];
    [(PKVerificationRequestRecord *)v5 setCurrentStepIdentifier:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousStepIdentifier"];
    [(PKVerificationRequestRecord *)v5 setPreviousStepIdentifier:v21];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKVerificationRequestRecord *)self passUniqueID];
  [v4 encodeObject:v5 forKey:@"passUniqueID"];

  id v6 = [(PKVerificationRequestRecord *)self channel];
  [v4 encodeObject:v6 forKey:@"channel"];

  v7 = [(PKVerificationRequestRecord *)self date];
  [v4 encodeObject:v7 forKey:@"date"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKVerificationRequestRecord verificationStatus](self, "verificationStatus"), @"verificationStatus");
  v8 = [(PKVerificationRequestRecord *)self allChannels];
  [v4 encodeObject:v8 forKey:@"allChannels"];

  v9 = [(PKVerificationRequestRecord *)self requiredFieldData];
  [v4 encodeObject:v9 forKey:@"PKVerificationRequestRecordRequiredFieldData"];

  uint64_t v10 = [(PKVerificationRequestRecord *)self currentStepIdentifier];
  [v4 encodeObject:v10 forKey:@"currentStepIdentifier"];

  id v11 = [(PKVerificationRequestRecord *)self previousStepIdentifier];
  [v4 encodeObject:v11 forKey:@"previousStepIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: ", v5];

  objc_msgSend(v6, "appendFormat:", @"status: '%lu'; ", self->_verificationStatus);
  objc_msgSend(v6, "appendFormat:", @"step: (cur: %@, prev: %@); ",
    self->_currentStepIdentifier,
    self->_previousStepIdentifier);
  [v6 appendFormat:@"date: '%@'; ", self->_date];
  [v6 appendFormat:@"channel: '%@'; ", self->_channel];
  [v6 appendFormat:@"allChannels: '%@'; ", self->_allChannels];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (id)requiredVerificationFields
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_requiredFieldData PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(NSDictionary *)self->_requiredFieldData PKDictionaryForKey:@"requiredFieldOptions"];
        id v11 = [v10 PKDictionaryForKey:v9];

        int v12 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v9 configuration:v11];
        [v4 safelyAddObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSString)currentStepIdentifier
{
  return self->_currentStepIdentifier;
}

- (void)setCurrentStepIdentifier:(id)a3
{
}

- (NSString)previousStepIdentifier
{
  return self->_previousStepIdentifier;
}

- (void)setPreviousStepIdentifier:(id)a3
{
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (PKVerificationChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSArray)allChannels
{
  return self->_allChannels;
}

- (void)setAllChannels:(id)a3
{
}

- (NSDictionary)requiredFieldData
{
  return self->_requiredFieldData;
}

- (void)setRequiredFieldData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFieldData, 0);
  objc_storeStrong((id *)&self->_allChannels, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_previousStepIdentifier, 0);
  objc_storeStrong((id *)&self->_currentStepIdentifier, 0);
}

@end