@interface PKPassUpgradeRequest
+ (BOOL)supportsSecureCoding;
+ (id)passUpgradeRequestFromDictionary:(id)a3;
- (NSArray)paymentApplicationIdentifiers;
- (NSDictionary)fields;
- (NSString)secureElementIdentifier;
- (PKOSVersionRequirement)minimumOSVersion;
- (PKOSVersionRequirementRange)osVersionRange;
- (PKPassUpgradeRequest)initWithCoder:(id)a3;
- (PKPassUpgradeRequest)initWithDictionary:(id)a3;
- (id)asDictionary;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
@end

@implementation PKPassUpgradeRequest

+ (id)passUpgradeRequestFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 PKStringForKey:@"type"];
  v5 = v4;
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0x26uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Missing type key for Upgrade request", v11, 2u);
    }

    goto LABEL_9;
  }
  uint64_t v6 = requestTypeFromString(v4);
  if (!v6)
  {
    v7 = PKPassUpgradeRequest;
    goto LABEL_12;
  }
  if (v6 == 2)
  {
    v7 = PKPassUpgradePrecursorPassRequest;
    goto LABEL_12;
  }
  if (v6 != 1)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_13;
  }
  v7 = PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
LABEL_12:
  v9 = (void *)[[v7 alloc] initWithDictionary:v3];
LABEL_13:

  return v9;
}

- (PKPassUpgradeRequest)initWithDictionary:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPassUpgradeRequest;
  uint64_t v6 = [(PKPassUpgradeRequest *)&v28 init];
  if (v6)
  {
    v7 = [v5 PKStringForKey:@"type"];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = requestTypeFromString(v7);
      v6->_type = v9;
      if (v9)
      {
        v10 = [PKOSVersionRequirementRange alloc];
        v11 = [v5 PKDictionaryForKey:@"osVersionRange"];
        uint64_t v12 = [(PKOSVersionRequirementRange *)v10 initWithDictionary:v11];
        osVersionRange = v6->_osVersionRange;
        v6->_osVersionRange = (PKOSVersionRequirementRange *)v12;

        if (!v6->_osVersionRange)
        {
          v14 = [PKOSVersionRequirement alloc];
          v15 = [v5 PKDictionaryForKey:@"minimumOSVersion"];
          v16 = [(PKOSVersionRequirement *)v14 initWithDictionary:v15];

          if (v16)
          {
            v17 = [[PKOSVersionRequirementRange alloc] initWithMinimumVersion:v16 maximumVersion:0];
            v18 = v6->_osVersionRange;
            v6->_osVersionRange = v17;
          }
        }
        uint64_t v19 = [v5 PKStringForKey:@"secureElementIdentifier"];
        secureElementIdentifier = v6->_secureElementIdentifier;
        v6->_secureElementIdentifier = (NSString *)v19;

        uint64_t v21 = [v5 PKArrayContaining:objc_opt_class() forKey:@"paymentApplicationIdentifiers"];
        paymentApplicationIdentifiers = v6->_paymentApplicationIdentifiers;
        v6->_paymentApplicationIdentifiers = (NSArray *)v21;

        objc_storeStrong((id *)&v6->_fields, a3);
        goto LABEL_9;
      }
      v24 = PKLogFacilityTypeGetObject(0x26uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        v25 = "Invalid type for upgrade request";
        goto LABEL_14;
      }
    }
    else
    {
      v24 = PKLogFacilityTypeGetObject(0x26uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        v25 = "Missing type key for Upgrade request";
LABEL_14:
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, v25, v27, 2u);
      }
    }

    v23 = 0;
    goto LABEL_16;
  }
LABEL_9:
  v23 = v6;
LABEL_16:

  return v23;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  unint64_t type = self->_type;
  uint64_t v6 = @"unknown";
  if (type == 2) {
    uint64_t v6 = @"precursorPass";
  }
  if (type == 1) {
    v7 = @"expressAutomaticSelectionCriteria";
  }
  else {
    v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"type"];
  v8 = [(PKOSVersionRequirementRange *)self->_osVersionRange minimum];
  uint64_t v9 = v8;
  if (v8)
  {
    v10 = [v8 asDictionary];
    [v4 setObject:v10 forKeyedSubscript:@"minimumOSVersion"];
  }
  osVersionRange = self->_osVersionRange;
  if (osVersionRange)
  {
    uint64_t v12 = [(PKOSVersionRequirementRange *)osVersionRange asDictionary];
    [v4 setObject:v12 forKeyedSubscript:@"osVersionRange"];
  }
  secureElementIdentifier = self->_secureElementIdentifier;
  if (secureElementIdentifier) {
    [v4 setObject:secureElementIdentifier forKeyedSubscript:@"secureElementIdentifier"];
  }
  if ([(NSArray *)self->_paymentApplicationIdentifiers count]) {
    [v4 setObject:self->_paymentApplicationIdentifiers forKeyedSubscript:@"paymentApplicationIdentifiers"];
  }
  v14 = (void *)[v4 copy];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassUpgradeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPassUpgradeRequest;
  id v5 = [(PKPassUpgradeRequest *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_unint64_t type = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersionRange"];
    osVersionRange = v5->_osVersionRange;
    v5->_osVersionRange = (PKOSVersionRequirementRange *)v7;

    if (!v5->_osVersionRange)
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumOSVersion"];
      if (v9)
      {
        v10 = [[PKOSVersionRequirementRange alloc] initWithMinimumVersion:v9 maximumVersion:0];
        v11 = v5->_osVersionRange;
        v5->_osVersionRange = v10;
      }
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementIdentifier"];
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"paymentApplicationIdentifiers"];
    paymentApplicationIdentifiers = v5->_paymentApplicationIdentifiers;
    v5->_paymentApplicationIdentifiers = (NSArray *)v17;

    uint64_t v19 = [v4 decodePropertyListForKey:@"fields"];
    fields = v5->_fields;
    v5->_fields = (NSDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t type = self->_type;
  id v8 = a3;
  uint64_t v6 = [v4 numberWithUnsignedInteger:type];
  [v8 encodeObject:v6 forKey:@"type"];

  uint64_t v7 = [(PKOSVersionRequirementRange *)self->_osVersionRange minimum];
  [v8 encodeObject:v7 forKey:@"minimumOSVersion"];

  [v8 encodeObject:self->_osVersionRange forKey:@"osVersionRange"];
  [v8 encodeObject:self->_secureElementIdentifier forKey:@"secureElementIdentifier"];
  [v8 encodeObject:self->_paymentApplicationIdentifiers forKey:@"paymentApplicationIdentifiers"];
  [v8 encodeObject:self->_fields forKey:@"fields"];
}

- (PKOSVersionRequirement)minimumOSVersion
{
  return [(PKOSVersionRequirementRange *)self->_osVersionRange minimum];
}

- (unint64_t)type
{
  return self->_type;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSArray)paymentApplicationIdentifiers
{
  return self->_paymentApplicationIdentifiers;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end