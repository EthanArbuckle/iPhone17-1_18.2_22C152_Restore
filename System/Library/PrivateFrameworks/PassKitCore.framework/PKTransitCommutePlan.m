@interface PKTransitCommutePlan
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDisplayableInformation;
- (BOOL)hasExpiredPlanDate;
- (BOOL)isDeviceBound;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlanAvailable;
- (BOOL)isPlanDisplayable;
- (BOOL)requiresAppletSourceOfTruth;
- (NSArray)details;
- (NSArray)deviceAccountIdentifiers;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSSet)foreignReferenceIdentifiers;
- (NSString)descriptionText;
- (NSString)expiryDateString;
- (NSString)formattedDateString;
- (NSString)identifier;
- (NSString)startDateString;
- (NSString)titleText;
- (NSString)uniqueIdentifier;
- (PKPassField)title;
- (PKPassField)usage;
- (PKTransitCommutePlan)initWithCoder:(id)a3;
- (id)_expiryField;
- (id)_startField;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)passFieldForKey:(id)a3;
- (id)updateWithCommutePlanDetail:(id)a3;
- (unint64_t)hash;
- (unint64_t)properties;
- (void)_updateFieldsByKey;
- (void)_updateProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDeviceAccountIdentifiers:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setExpiryDateString:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDeviceBound:(BOOL)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setRequiresAppletSourceOfTruth:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDateString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUsage:(id)a3;
@end

@implementation PKTransitCommutePlan

- (void)_updateFieldsByKey
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  fieldsByKey = self->_fieldsByKey;
  if (fieldsByKey)
  {
    [(NSMutableDictionary *)fieldsByKey removeAllObjects];
  }
  else
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = self->_fieldsByKey;
    self->_fieldsByKey = v4;
  }
  uint64_t v6 = [(PKPassField *)self->_title key];
  v17 = (void *)v6;
  if (v6)
  {
    [(NSMutableDictionary *)self->_fieldsByKey setObject:self->_title forKey:v6];
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      title = self->_title;
      *(_DWORD *)buf = 138412290;
      v24 = title;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Encountered nil key in parsing title field PKPassField: %@", buf, 0xCu);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = self->_details;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(PKPassField **)(*((void *)&v18 + 1) + 8 * i);
        v15 = [(PKPassField *)v14 key];
        if (v15)
        {
          [(NSMutableDictionary *)self->_fieldsByKey setObject:v14 forKey:v15];
        }
        else
        {
          v16 = PKLogFacilityTypeGetObject(0xCuLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v14;
            _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Encountered nil key in parsing detail field PKPassField: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_updateProperties
{
  self->_properties &= 0xFFFFFFFFFFFFFFFALL;
  v3 = [(NSMutableDictionary *)self->_fieldsByKey objectForKey:@"expiryDate"];
  if (v3)
  {
  }
  else
  {
    v4 = [(NSMutableDictionary *)self->_fieldsByKey objectForKey:@"startDate"];

    if (!v4) {
      goto LABEL_5;
    }
  }
  self->_properties |= 1uLL;
LABEL_5:
  v5 = [(NSMutableDictionary *)self->_fieldsByKey objectForKey:@"amountRemaining"];

  if (v5) {
    self->_properties |= 4uLL;
  }
}

- (id)passFieldForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_fieldsByKey objectForKeyedSubscript:a3];
}

- (BOOL)hasExpiredPlanDate
{
  v2 = [(PKTransitCommutePlan *)self expiryDate];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  if (v2) {
    BOOL v4 = [v2 compare:v3] != 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSSet)foreignReferenceIdentifiers
{
  v2 = [(PKTransitCommutePlan *)self passFieldForKey:@"amountRemaining"];
  v3 = [v2 foreignReferenceIdentifiers];

  return (NSSet *)v3;
}

- (NSString)formattedDateString
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [(PKTransitCommutePlan *)self startDate];
  v5 = [(PKTransitCommutePlan *)self expiryDate];
  if (v4 && [v4 compare:v3] == 1)
  {
    uint64_t v6 = [(PKTransitCommutePlan *)self startDateString];
    v7 = @"COMMUTE_PLAN_STARTS_ON";
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    if (!v5 || (PKStoreDemoModeEnabled() & 1) != 0)
    {
      uint64_t v6 = 0;
LABEL_8:
      v8 = 0;
      goto LABEL_14;
    }
    if ([v5 compare:v3] == 1) {
      v7 = @"COMMUTE_PLAN_EXPIRES_ON";
    }
    else {
      v7 = @"COMMUTE_PLAN_EXPIRED_ON";
    }
    uint64_t v6 = [(PKTransitCommutePlan *)self expiryDateString];
    if (!v6) {
      goto LABEL_8;
    }
  }
  v8 = PKLocalizedPaymentString(&v7->isa, &stru_1EE0F6808.isa, v6);
LABEL_14:

  return (NSString *)v8;
}

- (BOOL)isPlanDisplayable
{
  v2 = [(PKTransitCommutePlan *)self expiryDate];
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v3 compare:v2] != 1;

  return v4;
}

- (BOOL)isPlanAvailable
{
  v3 = [(PKTransitCommutePlan *)self startDate];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = [v4 compare:v3] != -1 && -[PKTransitCommutePlan isPlanDisplayable](self, "isPlanDisplayable");

  return v5;
}

- (BOOL)hasDisplayableInformation
{
  return (unint64_t)[(NSMutableDictionary *)self->_fieldsByKey count] > 1;
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

- (id)updateWithCommutePlanDetail:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(PKTransitCommutePlan *)self mutableCopy];
  uint64_t v6 = [v4 uniqueIdentifier];
  [v5 setUniqueIdentifier:v6];

  v7 = [v4 startDate];
  [v5 setStartDate:v7];

  v8 = [v4 expiryDate];
  [v5 setExpiryDate:v8];

  v9 = [v4 localizedTitle];
  uint64_t v10 = [v5 titleText];
  uint64_t v11 = [v4 localizedDescription];

  uint64_t v12 = [v5 descriptionText];
  id v13 = v9;
  v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 length];

    if (v15)
    {
      id v16 = v10;
      if (!v16 || (v17 = v16, uint64_t v18 = [v16 length], v17, !v18)) {
        [v5 setTitleText:v14];
      }
    }
  }
  id v19 = v11;
  long long v20 = v19;
  if (v19)
  {
    uint64_t v21 = [v19 length];

    if (v21)
    {
      id v22 = v12;
      if (!v22 || (v23 = v22, uint64_t v24 = [v22 length], v23, !v24)) {
        [v5 setDescriptionText:v20];
      }
    }
  }
  uint64_t v25 = (void *)[v5 copy];

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  BOOL v5 = [(PKTransitCommutePlan *)self uniqueIdentifier];
  [v6 encodeObject:v5 forKey:@"uniqueIdentifier"];

  [v6 encodeObject:self->_deviceAccountIdentifiers forKey:@"deviceAccountIdentifiers"];
  [v6 encodeObject:self->_title forKey:@"title"];
  [v6 encodeObject:self->_details forKey:@"details"];
  [v6 encodeInteger:self->_properties forKey:@"properties"];
  [v6 encodeObject:self->_startDate forKey:@"startDate"];
  [v6 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  [v6 encodeObject:self->_usage forKey:@"usage"];
  [v6 encodeBool:self->_requiresAppletSourceOfTruth forKey:@"requiresAppletSourceOfTruth"];
  [v6 encodeBool:self->_isDeviceBound forKey:@"isDeviceBound"];
}

- (PKTransitCommutePlan)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKTransitCommutePlan *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"deviceAccountIdentifiers"];
    deviceAccountIdentifiers = v5->_deviceAccountIdentifiers;
    v5->_deviceAccountIdentifiers = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (PKPassField *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    id v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"details"];
    details = v5->_details;
    v5->_details = (NSArray *)v20;

    v5->_properties = [v4 decodeIntegerForKey:@"properties"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usage"];
    usage = v5->_usage;
    v5->_usage = (PKPassField *)v26;

    v5->_requiresAppletSourceOfTruth = [v4 decodeBoolForKey:@"requiresAppletSourceOfTruth"];
    v5->_isDeviceBound = [v4 decodeBoolForKey:@"isDeviceBound"];
    [(PKTransitCommutePlan *)v5 _updateFieldsByKey];
    [(PKTransitCommutePlan *)v5 _updateProperties];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [v5 setIdentifier:v6];

  v7 = [(PKTransitCommutePlan *)self uniqueIdentifier];
  uint64_t v8 = (void *)[v7 copyWithZone:a3];
  [v5 setUniqueIdentifier:v8];

  v9 = (void *)[(NSArray *)self->_deviceAccountIdentifiers copyWithZone:a3];
  [v5 setDeviceAccountIdentifiers:v9];

  id v10 = [(PKPassField *)self->_title copyWithZone:a3];
  [v5 setTitle:v10];

  uint64_t v11 = (void *)[(NSArray *)self->_details copyWithZone:a3];
  [v5 setDetails:v11];

  [v5 setProperties:self->_properties];
  uint64_t v12 = (void *)[(NSDate *)self->_startDate copyWithZone:a3];
  [v5 setStartDate:v12];

  uint64_t v13 = (void *)[(NSDate *)self->_expiryDate copyWithZone:a3];
  [v5 setExpiryDate:v13];

  id v14 = [(PKPassField *)self->_usage copyWithZone:a3];
  [v5 setUsage:v14];

  [v5 setRequiresAppletSourceOfTruth:self->_requiresAppletSourceOfTruth];
  [v5 setIsDeviceBound:self->_isDeviceBound];
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = (void *)[(NSString *)self->_identifier mutableCopyWithZone:a3];
  [v5 setIdentifier:v6];

  v7 = [(PKTransitCommutePlan *)self uniqueIdentifier];
  uint64_t v8 = (void *)[v7 mutableCopyWithZone:a3];
  [v5 setUniqueIdentifier:v8];

  v9 = (void *)[(NSArray *)self->_deviceAccountIdentifiers mutableCopyWithZone:a3];
  [v5 setDeviceAccountIdentifiers:v9];

  id v10 = [(PKPassField *)self->_title copyWithZone:a3];
  [v5 setTitle:v10];

  uint64_t v11 = (void *)[(NSArray *)self->_details mutableCopyWithZone:a3];
  [v5 setDetails:v11];

  [v5 setProperties:self->_properties];
  uint64_t v12 = (void *)[(NSDate *)self->_startDate copyWithZone:a3];
  [v5 setStartDate:v12];

  uint64_t v13 = (void *)[(NSDate *)self->_expiryDate copyWithZone:a3];
  [v5 setExpiryDate:v13];

  id v14 = [(PKPassField *)self->_usage copyWithZone:a3];
  [v5 setUsage:v14];

  [v5 setRequiresAppletSourceOfTruth:self->_requiresAppletSourceOfTruth];
  [v5 setIsDeviceBound:self->_isDeviceBound];
  return v5;
}

- (void)setTitle:(id)a3
{
  id v4 = (PKPassField *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  [(PKTransitCommutePlan *)self _updateFieldsByKey];
  [(PKTransitCommutePlan *)self _updateProperties];
}

- (void)setDetails:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  details = self->_details;
  self->_details = v4;

  [(PKTransitCommutePlan *)self _updateFieldsByKey];
  [(PKTransitCommutePlan *)self _updateProperties];
}

- (id)_expiryField
{
  return (id)[(NSMutableDictionary *)self->_fieldsByKey objectForKey:@"expiryDate"];
}

- (id)_startField
{
  return (id)[(NSMutableDictionary *)self->_fieldsByKey objectForKey:@"startDate"];
}

- (NSString)titleText
{
  return [(PKPassField *)self->_title label];
}

- (NSString)descriptionText
{
  return [(PKPassField *)self->_title value];
}

- (void)setTitleText:(id)a3
{
}

- (void)setDescriptionText:(id)a3
{
}

- (NSDate)expiryDate
{
  expiryDate = self->_expiryDate;
  if (expiryDate)
  {
    v3 = expiryDate;
  }
  else
  {
    id v4 = [(PKTransitCommutePlan *)self _expiryField];
    _dateFromField(v4);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSDate)startDate
{
  startDate = self->_startDate;
  if (startDate)
  {
    v3 = startDate;
  }
  else
  {
    id v4 = [(PKTransitCommutePlan *)self _startField];
    _dateFromField(v4);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)expiryDateString
{
  v3 = [(PKTransitCommutePlan *)self expiryDate];
  id v4 = [(PKTransitCommutePlan *)self _expiryField];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend(v5, "setDateStyle:", objc_msgSend(v4, "dateStyle"));
  uint64_t v6 = [v5 stringFromDate:v3];

  return (NSString *)v6;
}

- (NSString)startDateString
{
  v3 = [(PKTransitCommutePlan *)self startDate];
  id v4 = [(PKTransitCommutePlan *)self _startField];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend(v5, "setDateStyle:", objc_msgSend(v4, "dateStyle"));
  uint64_t v6 = [v5 stringFromDate:v3];

  return (NSString *)v6;
}

- (PKPassField)usage
{
  return (PKPassField *)[(NSMutableDictionary *)self->_fieldsByKey objectForKey:@"usage"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKTransitCommutePlan *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier && v7)
      {
        if (-[NSString isEqual:](identifier, "isEqual:"))
        {
LABEL_6:
          uint64_t v8 = [(PKTransitCommutePlan *)self uniqueIdentifier];
          uint64_t v9 = [(PKTransitCommutePlan *)v5 uniqueIdentifier];
          id v10 = (void *)v9;
          if (v8 && v9)
          {
            if (([v8 isEqual:v9] & 1) == 0) {
              goto LABEL_46;
            }
          }
          else if (v8 != (void *)v9)
          {
            goto LABEL_46;
          }
          title = self->_title;
          uint64_t v13 = v5->_title;
          if (title && v13)
          {
            if ((-[PKPassField isEqual:](title, "isEqual:") & 1) == 0) {
              goto LABEL_46;
            }
          }
          else if (title != v13)
          {
            goto LABEL_46;
          }
          details = self->_details;
          uint64_t v15 = v5->_details;
          if (details && v15)
          {
            if ((-[NSArray isEqual:](details, "isEqual:") & 1) == 0) {
              goto LABEL_46;
            }
          }
          else if (details != v15)
          {
            goto LABEL_46;
          }
          deviceAccountIdentifiers = self->_deviceAccountIdentifiers;
          v17 = v5->_deviceAccountIdentifiers;
          if (deviceAccountIdentifiers && v17)
          {
            if ((-[NSArray isEqual:](deviceAccountIdentifiers, "isEqual:") & 1) == 0) {
              goto LABEL_46;
            }
          }
          else if (deviceAccountIdentifiers != v17)
          {
            goto LABEL_46;
          }
          startDate = self->_startDate;
          id v19 = v5->_startDate;
          if (startDate && v19)
          {
            if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
              goto LABEL_46;
            }
          }
          else if (startDate != v19)
          {
            goto LABEL_46;
          }
          expiryDate = self->_expiryDate;
          uint64_t v21 = v5->_expiryDate;
          if (expiryDate && v21)
          {
            if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0) {
              goto LABEL_46;
            }
          }
          else if (expiryDate != v21)
          {
            goto LABEL_46;
          }
          if (self->_properties == v5->_properties
            && self->_requiresAppletSourceOfTruth == v5->_requiresAppletSourceOfTruth
            && self->_isDeviceBound == v5->_isDeviceBound)
          {
            usage = self->_usage;
            v23 = v5->_usage;
            if (usage && v23) {
              char v11 = -[PKPassField isEqual:](usage, "isEqual:");
            }
            else {
              char v11 = usage == v23;
            }
            goto LABEL_47;
          }
LABEL_46:
          char v11 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      else if (identifier == v7)
      {
        goto LABEL_6;
      }
      char v11 = 0;
LABEL_48:

      goto LABEL_49;
    }
    char v11 = 0;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  id v4 = [(PKTransitCommutePlan *)self uniqueIdentifier];
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_title];
  [v3 addObjectsFromArray:self->_details];
  [v3 addObjectsFromArray:self->_deviceAccountIdentifiers];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_expiryDate];
  [v3 safelyAddObject:self->_usage];
  uint64_t v5 = PKCombinedHash(17, v3);
  unint64_t v6 = self->_properties - v5 + 32 * v5;
  uint64_t v7 = self->_requiresAppletSourceOfTruth - v6 + 32 * v6;
  unint64_t v8 = self->_isDeviceBound - v7 + 32 * v7;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSArray)deviceAccountIdentifiers
{
  return self->_deviceAccountIdentifiers;
}

- (void)setDeviceAccountIdentifiers:(id)a3
{
}

- (PKPassField)title
{
  return self->_title;
}

- (NSArray)details
{
  return self->_details;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (void)setStartDate:(id)a3
{
}

- (void)setExpiryDate:(id)a3
{
}

- (void)setStartDateString:(id)a3
{
}

- (void)setExpiryDateString:(id)a3
{
}

- (void)setUsage:(id)a3
{
}

- (BOOL)requiresAppletSourceOfTruth
{
  return self->_requiresAppletSourceOfTruth;
}

- (void)setRequiresAppletSourceOfTruth:(BOOL)a3
{
  self->_requiresAppletSourceOfTruth = a3;
}

- (BOOL)isDeviceBound
{
  return self->_isDeviceBound;
}

- (void)setIsDeviceBound:(BOOL)a3
{
  self->_isDeviceBound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_expiryDateString, 0);
  objc_storeStrong((id *)&self->_startDateString, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fieldsByKey, 0);
}

@end