@interface PKAccountBeneficiary
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
- (NSDecimalNumber)allocation;
- (NSString)identifier;
- (PKAccountBeneficiary)initWithCoder:(id)a3;
- (PKAccountBeneficiary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayableRelationshipString;
- (unint64_t)relationshipType;
- (void)encodeWithCoder:(id)a3;
- (void)setAllocation:(id)a3;
- (void)setContact:(id)a3;
@end

@implementation PKAccountBeneficiary

- (PKAccountBeneficiary)initWithDictionary:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKAccountBeneficiary;
  v5 = [(PKAccountBeneficiary *)&v51 init];
  if (!v5) {
    goto LABEL_27;
  }
  id v50 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  v6 = [v4 PKStringForKey:@"firstName"];
  v7 = [v4 PKStringForKey:@"lastName"];
  v8 = [v4 PKStringForKey:@"relationshipType"];
  v9 = v8;
  if (v8 == @"child") {
    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_21:
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  char v10 = [(__CFString *)v8 isEqualToString:@"child"];

  if ((v10 & 1) == 0)
  {
    v12 = v9;
    if (v12 == @"spouse"
      || (v13 = v12,
          char v14 = [(__CFString *)v12 isEqualToString:@"spouse"],
          v13,
          (v14 & 1) != 0))
    {
      uint64_t v11 = 2;
      goto LABEL_22;
    }
    v15 = v13;
    if (v15 == @"domestic-partner"
      || (v16 = v15,
          char v17 = [(__CFString *)v15 isEqualToString:@"domestic-partner"],
          v16,
          (v17 & 1) != 0))
    {
      uint64_t v11 = 3;
      goto LABEL_22;
    }
    v18 = v16;
    if (v18 == @"parent"
      || (v19 = v18,
          char v20 = [(__CFString *)v18 isEqualToString:@"parent"],
          v19,
          (v20 & 1) != 0))
    {
      uint64_t v11 = 4;
      goto LABEL_22;
    }
    v21 = v19;
    if (v21 == @"sibling"
      || (v22 = v21,
          char v23 = [(__CFString *)v21 isEqualToString:@"sibling"],
          v22,
          (v23 & 1) != 0))
    {
      uint64_t v11 = 5;
      goto LABEL_22;
    }
    v24 = v22;
    if (v24 == @"other"
      || (v25 = v24,
          int v26 = [(__CFString *)v24 isEqualToString:@"other"],
          v25,
          v26))
    {
      uint64_t v11 = 6;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v11 = 1;
LABEL_22:

  v27 = [v4 PKDecimalNumberFromStringForKey:@"allocation"];
  v28 = [v4 PKStringForKey:@"identifier"];
  uint64_t v29 = [v6 length];
  v30 = v7;
  uint64_t v31 = [v7 length];
  uint64_t v32 = [v28 length];
  uint64_t v33 = v32;
  if (v29 && v31 && v27 && v32)
  {
    [v50 setGivenName:v6];
    [v50 setFamilyName:v30];
    uint64_t v34 = [v50 copy];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v34;

    v36 = v6;
    allocation = v5->_allocation;
    v5->_relationshipType = v11;
    v5->_allocation = v27;
    v38 = v27;

    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v28;

LABEL_27:
    v40 = v5;
    goto LABEL_39;
  }
  v41 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    if (v29) {
      v42 = @"YES";
    }
    else {
      v42 = @"NO";
    }
    v48 = v6;
    if (v31) {
      v43 = @"YES";
    }
    else {
      v43 = @"NO";
    }
    uint64_t v44 = [(NSDecimalNumber *)v27 stringValue];
    v45 = (void *)v44;
    *(_DWORD *)buf = 138413058;
    v46 = @"NO";
    if (v33) {
      v46 = @"YES";
    }
    v53 = v42;
    __int16 v54 = 2112;
    v55 = v43;
    v6 = v49;
    __int16 v56 = 2112;
    uint64_t v57 = v44;
    __int16 v58 = 2112;
    v59 = v46;
    _os_log_impl(&dword_190E10000, v41, OS_LOG_TYPE_DEFAULT, "Account beneficiary field is missing; firstName present: %@ lastName present: %@ allocation: %@ identifier present: %@",
      buf,
      0x2Au);
  }
  v40 = 0;
LABEL_39:

  return v40;
}

- (id)displayableRelationshipString
{
  unint64_t v7 = self->_relationshipType - 1;
  if (v7 > 5)
  {
    v8 = 0;
  }
  else
  {
    v8 = PKLocalizedFeatureString(off_1E56F33E0[v7], 5, 0, v2, v3, v4, v5, v6, vars0);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  [v5 encodeObject:contact forKey:@"contact"];
  [v5 encodeInteger:self->_relationshipType forKey:@"relationshipType"];
  [v5 encodeObject:self->_allocation forKey:@"allocation"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (PKAccountBeneficiary)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountBeneficiary;
  id v5 = [(PKAccountBeneficiary *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v5->_relationshipType = [v4 decodeIntegerForKey:@"relationshipType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allocation"];
    allocation = v5->_allocation;
    v5->_allocation = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(CNContact *)self->_contact copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_relationshipType;
  uint64_t v8 = [(NSDecimalNumber *)self->_allocation copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"contact", self->_contact];
  unint64_t v4 = self->_relationshipType - 1;
  if (v4 > 5) {
    id v5 = @"unknown";
  }
  else {
    id v5 = off_1E56F3410[v4];
  }
  [v3 appendFormat:@"%@: '%@'; ", @"relationshipType", v5];
  [v3 appendFormat:@"%@: '%@'; ", @"allocation", self->_allocation];
  [v3 appendFormat:@"%@: '%@'; ", @"identifier", self->_identifier];
  [v3 appendFormat:@">"];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (unint64_t)relationshipType
{
  return self->_relationshipType;
}

- (NSDecimalNumber)allocation
{
  return self->_allocation;
}

- (void)setAllocation:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allocation, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end