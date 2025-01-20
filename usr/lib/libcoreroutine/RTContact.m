@interface RTContact
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)identifier;
- (NSString)middleName;
- (RTContact)init;
- (RTContact)initWithIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 postalAddresses:(id)a7;
- (RTContact)initWithIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 postalAddresses:(id)a7 phoneNumbers:(id)a8 emailAddresses:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation RTContact

- (RTContact)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_givenName_middleName_familyName_postalAddresses_);
}

- (RTContact)initWithIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 postalAddresses:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)RTContact;
  v17 = [(RTContact *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    givenName = v17->_givenName;
    v17->_givenName = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    middleName = v17->_middleName;
    v17->_middleName = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    familyName = v17->_familyName;
    v17->_familyName = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    postalAddresses = v17->_postalAddresses;
    v17->_postalAddresses = (NSArray *)v26;
  }
  return v17;
}

- (RTContact)initWithIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 postalAddresses:(id)a7 phoneNumbers:(id)a8 emailAddresses:(id)a9
{
  id v15 = a8;
  id v16 = a9;
  v17 = [(RTContact *)self initWithIdentifier:a3 givenName:a4 middleName:a5 familyName:a6 postalAddresses:a7];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    phoneNumbers = v17->_phoneNumbers;
    v17->_phoneNumbers = (NSArray *)v18;

    uint64_t v20 = [v16 copy];
    emailAddresses = v17->_emailAddresses;
    v17->_emailAddresses = (NSArray *)v20;
  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[(id)[(id)[objc_opt_class() allocWithZone:a3] initWithIdentifier:self->_identifier givenName:self->_givenName middleName:self->_middleName familyName:self->_familyName postalAddresses:self->_postalAddresses phoneNumbers:self->_phoneNumbers emailAddresses:self->_emailAddresses];
}

- (id)description
{
  v3 = objc_opt_new();
  v44 = [(RTContact *)self identifier];
  v4 = [(RTContact *)self givenName];
  v5 = [(RTContact *)self middleName];
  v6 = [(RTContact *)self familyName];
  v7 = [(RTContact *)self postalAddresses];
  uint64_t v8 = [v7 count];
  v9 = [(RTContact *)self phoneNumbers];
  uint64_t v10 = [v9 count];
  v11 = [(RTContact *)self emailAddresses];
  [v3 appendFormat:@"identifier, %@, givenName, %@, middleName, %@, familyName, %@, postalAddresses count, %lu, phoneNumbers count, %lu, emailAddresses count, %lu, ", v44, v4, v5, v6, v8, v10, [v11 count]];

  id v12 = [(RTContact *)self postalAddresses];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = (void *)MEMORY[0x1E016D870]();
      unint64_t v16 = v14 + 1;
      v17 = [(RTContact *)self postalAddresses];
      uint64_t v18 = [v17 objectAtIndexedSubscript:v14];
      v19 = +[RTContactPostalAddress labelTypeToString:](RTContactPostalAddress, "labelTypeToString:", [v18 labelType]);
      uint64_t v20 = [(RTContact *)self postalAddresses];
      v21 = [v20 objectAtIndexedSubscript:v14];
      uint64_t v22 = [v21 thoroughfare];
      [v3 appendFormat:@"postalAddress %lu, labelType, %@, thoroughfare, %@, ", v16, v19, v22];

      v23 = [(RTContact *)self postalAddresses];
      unint64_t v24 = [v23 count];

      unint64_t v14 = v16;
    }
    while (v24 > v16);
  }
  v25 = [(RTContact *)self phoneNumbers];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    unint64_t v27 = 0;
    do
    {
      v28 = (void *)MEMORY[0x1E016D870]();
      unint64_t v29 = v27 + 1;
      v30 = [(RTContact *)self phoneNumbers];
      v31 = [v30 objectAtIndexedSubscript:v27];
      [v3 appendFormat:@"phoneNumber %lu, %@, ", v29, v31];

      v32 = [(RTContact *)self phoneNumbers];
      unint64_t v33 = [v32 count];

      unint64_t v27 = v29;
    }
    while (v33 > v29);
  }
  v34 = [(RTContact *)self emailAddresses];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    unint64_t v36 = 0;
    do
    {
      v37 = (void *)MEMORY[0x1E016D870]();
      unint64_t v38 = v36 + 1;
      v39 = [(RTContact *)self emailAddresses];
      v40 = [v39 objectAtIndexedSubscript:v36];
      [v3 appendFormat:@"emailAddress %lu, %@, ", v38, v40];

      v41 = [(RTContact *)self emailAddresses];
      unint64_t v42 = [v41 count];

      unint64_t v36 = v38;
    }
    while (v42 > v38);
  }

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end