@interface PKCarUnlockSupportedTerminal
+ (BOOL)supportsSecureCoding;
- (NSArray)associatedApplicationIdentifiers;
- (NSSet)terminalCriteria;
- (NSString)manufacturerIdentifier;
- (NSString)partnerIdentifier;
- (NSString)partnerName;
- (PKCarUnlockSupportedTerminal)initWithCoder:(id)a3;
- (PKCarUnlockSupportedTerminal)initWithDictionary:(id)a3;
- (id)description;
- (id)vehicleInitiatedPairingLaunchURLWithReferralSource:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCarUnlockSupportedTerminal

- (PKCarUnlockSupportedTerminal)initWithDictionary:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v29 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameters to create supported terminal with";
    goto LABEL_32;
  }
  self = [(PKCarUnlockSupportedTerminal *)self init];
  if (self)
  {
    v5 = [v4 PKArrayContaining:objc_opt_class() forKey:@"associatedApplicationIdentifiers"];
    associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
    self->_associatedApplicationIdentifiers = v5;

    if (![(NSArray *)self->_associatedApplicationIdentifiers count])
    {
      uint64_t v7 = [v4 PKStringForKey:@"associatedApplicationIdentifier"];
      v8 = (void *)v7;
      if (v7)
      {
        v40[0] = v7;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
        v10 = self->_associatedApplicationIdentifiers;
        self->_associatedApplicationIdentifiers = v9;
      }
    }
    v11 = [v4 PKStringForKey:@"partnerIdentifier"];
    partnerIdentifier = self->_partnerIdentifier;
    self->_partnerIdentifier = v11;

    if (self->_partnerIdentifier)
    {
      v13 = [v4 PKStringForKey:@"partnerName"];
      partnerName = self->_partnerName;
      self->_partnerName = v13;

      if (self->_partnerName)
      {
        v15 = [v4 PKStringForKey:@"manufacturerIdentifier"];
        manufacturerIdentifier = self->_manufacturerIdentifier;
        self->_manufacturerIdentifier = v15;

        if (self->_manufacturerIdentifier)
        {
          v32 = self;
          v17 = [v4 PKArrayContaining:objc_opt_class() forKey:@"terminalCriteria"];
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v17, "count"));
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v19 = v17;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v34 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = [[PKPassAutomaticSelectionCriterion alloc] initWithDictionary:*(void *)(*((void *)&v33 + 1) + 8 * i)];
                if (v24)
                {
                  [v18 addObject:v24];
                }
                else
                {
                  v25 = PKLogFacilityTypeGetObject(0x16uLL);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v38 = 0;
                    _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Invalid terminal criterion: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
            }
            while (v21);
          }

          uint64_t v26 = [v18 copy];
          self = v32;
          terminalCriteria = v32->_terminalCriteria;
          v32->_terminalCriteria = (NSSet *)v26;

          goto LABEL_23;
        }
        v29 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "Missing manufacturer identifier for supported terminal";
          goto LABEL_32;
        }
LABEL_33:

        v28 = 0;
        goto LABEL_34;
      }
      v29 = PKLogFacilityTypeGetObject(0x16uLL);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_WORD *)buf = 0;
      v30 = "Missing partner name for supported terminal";
    }
    else
    {
      v29 = PKLogFacilityTypeGetObject(0x16uLL);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_WORD *)buf = 0;
      v30 = "Missing partner ID for supported terminal";
    }
LABEL_32:
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_33;
  }
LABEL_23:
  self = self;
  v28 = self;
LABEL_34:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalCriteria, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerName, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"associatedAppIdentifiers: '%@'; ", self->_associatedApplicationIdentifiers];
  [v3 appendFormat:@"partnerIdentifier: '%@'; ", self->_partnerIdentifier];
  [v3 appendFormat:@"manufacturerIdentifier: '%@'; ", self->_manufacturerIdentifier];
  [v3 appendFormat:@"partnerName: '%@'; ", self->_partnerName];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)vehicleInitiatedPairingLaunchURLWithReferralSource:(unint64_t)a3
{
  id v4 = [(PKCarUnlockSupportedTerminal *)self partnerIdentifier];
  v5 = PKVehicleInitiatedPairingLaunchURL(v4, 1, 0, a3);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  id v5 = a3;
  [v5 encodeObject:associatedApplicationIdentifiers forKey:@"associatedApplicationIdentifiers"];
  [v5 encodeObject:self->_partnerIdentifier forKey:@"partnerIdentifier"];
  [v5 encodeObject:self->_partnerName forKey:@"partnerName"];
  [v5 encodeObject:self->_manufacturerIdentifier forKey:@"manufacturerIdentifier"];
  [v5 encodeObject:self->_terminalCriteria forKey:@"terminalCriteria"];
}

- (PKCarUnlockSupportedTerminal)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCarUnlockSupportedTerminal;
  id v5 = [(PKCarUnlockSupportedTerminal *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"associatedApplicationIdentifiers"];
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerIdentifier"];
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerName"];
    partnerName = v5->_partnerName;
    v5->_partnerName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerIdentifier"];
    manufacturerIdentifier = v5->_manufacturerIdentifier;
    v5->_manufacturerIdentifier = (NSString *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"terminalCriteria"];
    terminalCriteria = v5->_terminalCriteria;
    v5->_terminalCriteria = (NSSet *)v17;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (NSString)partnerName
{
  return self->_partnerName;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (NSSet)terminalCriteria
{
  return self->_terminalCriteria;
}

@end