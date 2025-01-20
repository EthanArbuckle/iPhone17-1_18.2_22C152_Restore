@interface TUContinuitySessionContact
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
- (NSSet)anonyms;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (TUContinuitySessionContact)initWithCoder:(id)a3;
- (TUContinuitySessionContact)initWithContact:(id)a3 contactIdentifier:(id)a4 anonyms:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuitySessionContact

- (TUContinuitySessionContact)initWithContact:(id)a3 contactIdentifier:(id)a4 anonyms:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUContinuitySessionContact;
  v12 = [(TUContinuitySessionContact *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_contactIdentifier, a4);
    objc_storeStrong((id *)&v13->_anonyms, a5);
  }

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" contact=%@", self->_contact];
  [v6 appendFormat:@" contactIdentifier=%@", self->_contactIdentifier];
  [v6 appendFormat:@" anonyms=%@", self->_anonyms];
  [v6 appendFormat:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

- (NSString)displayName
{
  v3 = [(TUContinuitySessionContact *)self contact];
  v4 = [v3 displayName];

  if (v4 && [v4 length])
  {
    v5 = v4;
  }
  else
  {
    v6 = [(TUContinuitySessionContact *)self contact];
    v7 = [v6 organizationName];

    if (v7 && [v7 length]) {
      v5 = v7;
    }
    else {
      v5 = &stru_1EECEA668;
    }
  }

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuitySessionContact)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_contact);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_contactIdentifier);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = NSStringFromSelector(sel_anonyms);
  objc_super v15 = [v4 decodeObjectOfClasses:v13 forKey:v14];

  v16 = [(TUContinuitySessionContact *)self initWithContact:v7 contactIdentifier:v10 anonyms:v15];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_contact);
  [v5 encodeObject:contact forKey:v6];

  contactIdentifier = self->_contactIdentifier;
  uint64_t v8 = NSStringFromSelector(sel_contactIdentifier);
  [v5 encodeObject:contactIdentifier forKey:v8];

  anonyms = self->_anonyms;
  NSStringFromSelector(sel_anonyms);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:anonyms forKey:v10];
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSSet)anonyms
{
  return self->_anonyms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonyms, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end