@interface PKPaymentCommutePlanDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)expiryDate;
- (NSDate)lastUpdateDate;
- (NSDate)startDate;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)uniqueIdentifier;
- (PKPaymentCommutePlanDetail)initWithAppletCommutePlan:(id)a3 label:(id)a4 value:(id)a5;
- (PKPaymentCommutePlanDetail)initWithCoder:(id)a3;
- (PKPaymentCommutePlanDetail)initWithDictionary:(id)a3;
- (PKPaymentCommutePlanDetail)initWithIdentifier:(id)a3 uniqueIdentifier:(id)a4 startDate:(id)a5 expiryDate:(id)a6 title:(id)a7 description:(id)a8;
- (PKPaymentCommutePlanDetail)initWithTransitCommutePlan:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)value;
- (unint64_t)hash;
- (unint64_t)planType;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPlanType:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation PKPaymentCommutePlanDetail

- (PKPaymentCommutePlanDetail)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCommutePlanDetail;
  v5 = [(PKPaymentCommutePlanDetail *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_value = [v4 PKIntegerForKey:@"value"];
    uint64_t v10 = [v4 PKStringForKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    uint64_t v14 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v14;

    uint64_t v16 = [v4 PKDateForKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v16;

    uint64_t v18 = [v4 PKDateForKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v18;

    v5->_status = [v4 PKIntegerForKey:@"status"];
  }

  return v5;
}

- (unint64_t)planType
{
  return self->_expiryDate == 0;
}

- (PKPaymentCommutePlanDetail)initWithAppletCommutePlan:(id)a3 label:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCommutePlanDetail;
  v11 = [(PKPaymentCommutePlanDetail *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 identifier];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v8 uniqueIdentifier];
    uniqueIdentifier = v11->_uniqueIdentifier;
    v11->_uniqueIdentifier = (NSString *)v14;

    v11->_status = [v8 status];
    uint64_t v16 = [v8 startDate];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v16;

    uint64_t v18 = [v8 expirationDate];
    expiryDate = v11->_expiryDate;
    v11->_expiryDate = (NSDate *)v18;

    objc_storeStrong((id *)&v11->_localizedTitle, a4);
    objc_storeStrong((id *)&v11->_localizedDescription, a5);
  }

  return v11;
}

- (PKPaymentCommutePlanDetail)initWithTransitCommutePlan:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentCommutePlanDetail;
  v5 = [(PKPaymentCommutePlanDetail *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 uniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_status = 0;
    uint64_t v10 = [v4 startDate];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    uint64_t v12 = [v4 expiryDate];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    uint64_t v14 = [v4 title];
    uint64_t v15 = [v14 label];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v15;

    uint64_t v17 = [v14 value];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v17;
  }
  return v5;
}

- (PKPaymentCommutePlanDetail)initWithIdentifier:(id)a3 uniqueIdentifier:(id)a4 startDate:(id)a5 expiryDate:(id)a6 title:(id)a7 description:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentCommutePlanDetail;
  uint64_t v18 = [(PKPaymentCommutePlanDetail *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v19->_startDate, a5);
    objc_storeStrong((id *)&v19->_expiryDate, a6);
    objc_storeStrong((id *)&v19->_localizedTitle, a7);
    objc_storeStrong((id *)&v19->_localizedDescription, a8);
    v19->_planType = 0;
  }

  return v19;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier) {
    uniqueIdentifier = self->_identifier;
  }
  v3 = uniqueIdentifier;
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentCommutePlanDetail allocWithZone:](PKPaymentCommutePlanDetail, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(PKPaymentCommutePlanDetail *)self uniqueIdentifier];
  uint64_t v9 = [v8 copyWithZone:a3];
  uniqueIdentifier = v5->_uniqueIdentifier;
  v5->_uniqueIdentifier = (NSString *)v9;

  v5->_value = self->_value;
  uint64_t v11 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v13;

  uint64_t v15 = [(NSDate *)self->_lastUpdateDate copyWithZone:a3];
  lastUpdateDate = v5->_lastUpdateDate;
  v5->_lastUpdateDate = (NSDate *)v15;

  uint64_t v17 = [(NSDate *)self->_startDate copyWithZone:a3];
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v17;

  uint64_t v19 = [(NSDate *)self->_expiryDate copyWithZone:a3];
  expiryDate = v5->_expiryDate;
  v5->_expiryDate = (NSDate *)v19;

  v5->_status = self->_status;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  v5 = [(PKPaymentCommutePlanDetail *)self uniqueIdentifier];
  [v6 encodeObject:v5 forKey:@"uniqueIdentifier"];

  [v6 encodeInteger:self->_value forKey:@"value"];
  [v6 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v6 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v6 encodeObject:self->_lastUpdateDate forKey:@"lastUpdatedDate"];
  [v6 encodeObject:self->_startDate forKey:@"startDate"];
  [v6 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  [v6 encodeInteger:self->_status forKey:@"status"];
}

- (PKPaymentCommutePlanDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCommutePlanDetail;
  v5 = [(PKPaymentCommutePlanDetail *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_value = [v4 decodeIntegerForKey:@"value"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v18;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
  }

  return v5;
}

- (NSString)identifier
{
  identifier = (__CFString *)self->_identifier;
  if (!identifier) {
    identifier = @"ApplicationStoredValueBalanceDefault";
  }
  v3 = identifier;
  return (NSString *)v3;
}

- (id)description
{
  unint64_t planType = self->_planType;
  id v4 = NSString;
  identifier = self->_identifier;
  uint64_t v6 = [(PKPaymentCommutePlanDetail *)self uniqueIdentifier];
  v7 = (void *)v6;
  if (planType) {
    [v4 stringWithFormat:@"Count Plan: %@ %@ %ld %@ %@ %lu", identifier, v6, self->_value, self->_localizedTitle, self->_localizedDescription, self->_status, v10];
  }
  else {
  uint64_t v8 = [v4 stringWithFormat:@"Timed Plan: %@ %@ %@ %@ %@ %@ %lu", identifier, v6, self->_startDate, self->_expiryDate, self->_localizedTitle, self->_localizedDescription, self->_status];
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  id v4 = [(PKPaymentCommutePlanDetail *)self uniqueIdentifier];
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_localizedTitle];
  [v3 safelyAddObject:self->_localizedDescription];
  [v3 safelyAddObject:self->_lastUpdateDate];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_expiryDate];
  uint64_t v5 = PKCombinedHash(17, v3);
  int64_t v6 = self->_value - v5 + 32 * v5;
  unint64_t v7 = self->_status - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    uint64_t v6 = [v4 identifier];
    unint64_t v7 = (void *)v6;
    if (identifier && v6)
    {
      if ([(NSString *)identifier isEqual:v6])
      {
LABEL_5:
        uint64_t v8 = [(PKPaymentCommutePlanDetail *)self uniqueIdentifier];
        uint64_t v9 = [v4 uniqueIdentifier];
        uint64_t v10 = (void *)v9;
        if (v8 && v9)
        {
          if (([v8 isEqual:v9] & 1) == 0) {
            goto LABEL_30;
          }
        }
        else if (v8 != (void *)v9)
        {
LABEL_30:
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        int64_t value = self->_value;
        if (value != [v4 value]) {
          goto LABEL_30;
        }
        unint64_t status = self->_status;
        if (status != [v4 status]) {
          goto LABEL_30;
        }
        localizedTitle = self->_localizedTitle;
        uint64_t v15 = [v4 localizedTitle];
        uint64_t v16 = (void *)v15;
        if (localizedTitle && v15)
        {
          if ([(NSString *)localizedTitle isEqual:v15])
          {
LABEL_18:
            localizedDescription = self->_localizedDescription;
            uint64_t v18 = [v4 localizedDescription];
            uint64_t v19 = (void *)v18;
            if (localizedDescription && v18)
            {
              if ([(NSString *)localizedDescription isEqual:v18])
              {
LABEL_21:
                startDate = self->_startDate;
                uint64_t v21 = [v4 startDate];
                id v22 = (void *)v21;
                if (startDate && v21)
                {
                  if ([(NSDate *)startDate isEqual:v21])
                  {
LABEL_24:
                    expiryDate = self->_expiryDate;
                    uint64_t v24 = [v4 expiryDate];
                    v25 = (void *)v24;
                    if (expiryDate && v24)
                    {
                      if ([(NSDate *)expiryDate isEqual:v24]) {
                        goto LABEL_27;
                      }
                    }
                    else if (expiryDate == (NSDate *)v24)
                    {
LABEL_27:
                      lastUpdateDate = self->_lastUpdateDate;
                      uint64_t v27 = [v4 lastUpdateDate];
                      v28 = (void *)v27;
                      if (lastUpdateDate && v27) {
                        char v11 = [(NSDate *)lastUpdateDate isEqual:v27];
                      }
                      else {
                        char v11 = lastUpdateDate == (NSDate *)v27;
                      }

                      goto LABEL_44;
                    }
                    char v11 = 0;
LABEL_44:

                    goto LABEL_45;
                  }
                }
                else if (startDate == (NSDate *)v21)
                {
                  goto LABEL_24;
                }
                char v11 = 0;
LABEL_45:

                goto LABEL_46;
              }
            }
            else if (localizedDescription == (NSString *)v18)
            {
              goto LABEL_21;
            }
            char v11 = 0;
LABEL_46:

            goto LABEL_47;
          }
        }
        else if (localizedTitle == (NSString *)v15)
        {
          goto LABEL_18;
        }
        char v11 = 0;
LABEL_47:

        goto LABEL_31;
      }
    }
    else if (identifier == (NSString *)v6)
    {
      goto LABEL_5;
    }
    char v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  char v11 = 0;
LABEL_33:

  return v11;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_int64_t value = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (void)setPlanType:(unint64_t)a3
{
  self->_unint64_t planType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end