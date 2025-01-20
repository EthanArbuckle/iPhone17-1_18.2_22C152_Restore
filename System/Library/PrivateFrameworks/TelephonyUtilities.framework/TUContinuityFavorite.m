@interface TUContinuityFavorite
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
- (NSString)actionType;
- (NSString)bundleIdentifier;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (TUContinuityFavorite)initWithCoder:(id)a3;
- (TUContinuityFavorite)initWithContact:(id)a3 contactIdentifier:(id)a4 anonym:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7;
- (TUContinuityHandleAnonym)anonym;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuityFavorite

- (TUContinuityFavorite)initWithContact:(id)a3 contactIdentifier:(id)a4 anonym:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TUContinuityFavorite;
  v17 = [(TUContinuityFavorite *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contact, a3);
    objc_storeStrong((id *)&v18->_contactIdentifier, a4);
    objc_storeStrong((id *)&v18->_anonym, a5);
    objc_storeStrong((id *)&v18->_actionType, a6);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a7);
  }

  return v18;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" contact=%@", self->_contact];
  [v6 appendFormat:@" contactIdentifier=%@", self->_contactIdentifier];
  [v6 appendFormat:@" anonym=%@", self->_anonym];
  [v6 appendFormat:@" actionType=%@", self->_actionType];
  [v6 appendFormat:@" bundleIdentifier=%@", self->_bundleIdentifier];
  [v6 appendFormat:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

- (NSString)displayName
{
  v3 = [(TUContinuityFavorite *)self contact];
  v4 = [v3 displayName];

  if (v4 && [v4 length])
  {
    v5 = v4;
  }
  else
  {
    v6 = [(TUContinuityFavorite *)self contact];
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

- (TUContinuityFavorite)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_contact);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_contactIdentifier);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_anonym);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  id v15 = NSStringFromSelector(sel_actionType);
  id v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = objc_opt_class();
  v18 = NSStringFromSelector(sel_bundleIdentifier);
  v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

  id v20 = [(TUContinuityFavorite *)self initWithContact:v7 contactIdentifier:v10 anonym:v13 actionType:v16 bundleIdentifier:v19];
  return v20;
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

  anonym = self->_anonym;
  v10 = NSStringFromSelector(sel_anonym);
  [v5 encodeObject:anonym forKey:v10];

  actionType = self->_actionType;
  v12 = NSStringFromSelector(sel_actionType);
  [v5 encodeObject:actionType forKey:v12];

  bundleIdentifier = self->_bundleIdentifier;
  NSStringFromSelector(sel_bundleIdentifier);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:bundleIdentifier forKey:v14];
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (TUContinuityHandleAnonym)anonym
{
  return self->_anonym;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_anonym, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end