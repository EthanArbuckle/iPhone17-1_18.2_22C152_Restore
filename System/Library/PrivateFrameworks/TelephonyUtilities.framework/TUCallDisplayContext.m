@interface TUCallDisplayContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)contactIdentifiers;
- (NSPersonNameComponents)personNameComponents;
- (NSString)callDirectoryExtensionIdentifier;
- (NSString)callDirectoryLabel;
- (NSString)callDirectoryLocalizedExtensionContainingAppName;
- (NSString)companyDepartment;
- (NSString)companyName;
- (NSString)contactIdentifier;
- (NSString)contactLabel;
- (NSString)contactName;
- (NSString)firstName;
- (NSString)label;
- (NSString)location;
- (NSString)mapName;
- (NSString)name;
- (NSString)suggestedName;
- (NSURL)companyLogoURL;
- (TUCallDisplayContext)init;
- (TUCallDisplayContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayContextByMergingWithDisplayContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)legacyAddressBookIdentifier;
- (int64_t)callDirectoryIdentityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallDirectoryExtensionIdentifier:(id)a3;
- (void)setCallDirectoryIdentityType:(int64_t)a3;
- (void)setCallDirectoryLabel:(id)a3;
- (void)setCallDirectoryLocalizedExtensionContainingAppName:(id)a3;
- (void)setCompanyDepartment:(id)a3;
- (void)setCompanyLogoURL:(id)a3;
- (void)setCompanyName:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setContactName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLegacyAddressBookIdentifier:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMapName:(id)a3;
- (void)setName:(id)a3;
- (void)setPersonNameComponents:(id)a3;
- (void)setSuggestedName:(id)a3;
@end

@implementation TUCallDisplayContext

- (TUCallDisplayContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUCallDisplayContext;
  result = [(TUCallDisplayContext *)&v3 init];
  if (result) {
    result->_legacyAddressBookIdentifier = -1;
  }
  return result;
}

- (NSString)contactIdentifier
{
  v2 = [(TUCallDisplayContext *)self contactIdentifiers];
  objc_super v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (void)setContactIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TUCallDisplayContext *)self contactIdentifiers];
  v6 = [v5 firstObject];
  char v7 = TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v4);

  if ((v7 & 1) == 0)
  {
    v9[0] = v4;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(TUCallDisplayContext *)self setContactIdentifiers:v8];
  }
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    id v4 = TUBundle();
    v5 = [v4 localizedStringForKey:@"UNKNOWN" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    v6 = self->_name;
    self->_name = v5;

    name = self->_name;
  }

  return name;
}

- (NSString)label
{
  label = self->_label;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v5 = [(NSString *)label stringByTrimmingCharactersInSet:v4];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    char v7 = self->_label;
    self->_label = 0;
  }
  v8 = self->_label;

  return v8;
}

- (NSString)firstName
{
  v2 = [(TUCallDisplayContext *)self personNameComponents];
  objc_super v3 = [v2 givenName];

  return (NSString *)v3;
}

- (void)setFirstName:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = [(TUCallDisplayContext *)self personNameComponents];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
      [(TUCallDisplayContext *)self setPersonNameComponents:v5];
    }
  }
  uint64_t v6 = [(TUCallDisplayContext *)self personNameComponents];
  [v6 setGivenName:v7];
}

- (id)displayContextByMergingWithDisplayContext:(id)a3
{
  id v4 = a3;
  if ([(TUCallDisplayContext *)self isEqual:v4])
  {
    id v5 = self;
  }
  else
  {
    uint64_t v6 = (void *)[(TUCallDisplayContext *)self mutableCopy];
    [v6 mergeValuesFromDisplayContext:v4];
    id v5 = (TUCallDisplayContext *)[v6 copy];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(TUCallDisplayContext *)self name];
    id v7 = [v5 name];
    if (TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      v8 = [(TUCallDisplayContext *)self personNameComponents];
      v9 = [v5 personNameComponents];
      if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        v10 = [(TUCallDisplayContext *)self suggestedName];
        v11 = [v5 suggestedName];
        if (TUStringsAreEqualOrNil((unint64_t)v10, (uint64_t)v11))
        {
          uint64_t v12 = [(TUCallDisplayContext *)self label];
          uint64_t v13 = [v5 label];
          v54 = (void *)v12;
          unint64_t v14 = v12;
          v15 = (void *)v13;
          if (TUStringsAreEqualOrNil(v14, v13))
          {
            v53 = v15;
            unint64_t v16 = [(TUCallDisplayContext *)self companyName];
            v51 = [v5 companyName];
            v52 = (void *)v16;
            if (TUStringsAreEqualOrNil(v16, (uint64_t)v51))
            {
              unint64_t v17 = [(TUCallDisplayContext *)self companyDepartment];
              v49 = [v5 companyDepartment];
              v50 = (void *)v17;
              if (TUStringsAreEqualOrNil(v17, (uint64_t)v49))
              {
                unint64_t v18 = [(TUCallDisplayContext *)self contactName];
                v47 = [v5 contactName];
                v48 = (void *)v18;
                if (TUStringsAreEqualOrNil(v18, (uint64_t)v47))
                {
                  unint64_t v19 = [(TUCallDisplayContext *)self contactLabel];
                  v45 = [v5 contactLabel];
                  v46 = (void *)v19;
                  if (TUStringsAreEqualOrNil(v19, (uint64_t)v45))
                  {
                    unint64_t v20 = [(TUCallDisplayContext *)self mapName];
                    v43 = [v5 mapName];
                    v44 = (void *)v20;
                    int v21 = TUStringsAreEqualOrNil(v20, (uint64_t)v43);
                    v15 = v53;
                    if (v21)
                    {
                      v42 = [(TUCallDisplayContext *)self location];
                      v41 = [v5 location];
                      if (TUStringsAreEqualOrNil((unint64_t)v42, (uint64_t)v41))
                      {
                        v40 = [(TUCallDisplayContext *)self callDirectoryLabel];
                        v39 = [v5 callDirectoryLabel];
                        if (TUStringsAreEqualOrNil((unint64_t)v40, (uint64_t)v39))
                        {
                          v38 = [(TUCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
                          v37 = [v5 callDirectoryLocalizedExtensionContainingAppName];
                          if (TUStringsAreEqualOrNil((unint64_t)v38, (uint64_t)v37))
                          {
                            unint64_t v22 = [(TUCallDisplayContext *)self callDirectoryExtensionIdentifier];
                            v35 = [v5 callDirectoryExtensionIdentifier];
                            v36 = (void *)v22;
                            if (TUStringsAreEqualOrNil(v22, (uint64_t)v35))
                            {
                              unint64_t v23 = [(TUCallDisplayContext *)self contactIdentifiers];
                              v33 = [v5 contactIdentifiers];
                              v34 = (void *)v23;
                              if (TUObjectsAreEqualOrNil(v23, (uint64_t)v33))
                              {
                                uint64_t v24 = [(TUCallDisplayContext *)self companyLogoURL];
                                uint64_t v25 = [v5 companyLogoURL];
                                v32 = (void *)v24;
                                unint64_t v26 = v24;
                                v27 = (void *)v25;
                                if (TUObjectsAreEqualOrNil(v26, v25)
                                  && (int64_t v31 = -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"), v31 == [v5 callDirectoryIdentityType]))
                                {
                                  int v28 = [(TUCallDisplayContext *)self legacyAddressBookIdentifier];
                                  BOOL v29 = v28 == [v5 legacyAddressBookIdentifier];
                                }
                                else
                                {
                                  BOOL v29 = 0;
                                }
                              }
                              else
                              {
                                BOOL v29 = 0;
                              }
                            }
                            else
                            {
                              BOOL v29 = 0;
                            }

                            v15 = v53;
                          }
                          else
                          {
                            BOOL v29 = 0;
                          }
                        }
                        else
                        {
                          BOOL v29 = 0;
                        }
                      }
                      else
                      {
                        BOOL v29 = 0;
                      }
                    }
                    else
                    {
                      BOOL v29 = 0;
                    }
                  }
                  else
                  {
                    BOOL v29 = 0;
                    v15 = v53;
                  }
                }
                else
                {
                  BOOL v29 = 0;
                  v15 = v53;
                }
              }
              else
              {
                BOOL v29 = 0;
                v15 = v53;
              }
            }
            else
            {
              BOOL v29 = 0;
              v15 = v53;
            }
          }
          else
          {
            BOOL v29 = 0;
          }
        }
        else
        {
          BOOL v29 = 0;
        }
      }
      else
      {
        BOOL v29 = 0;
      }
    }
    else
    {
      BOOL v29 = 0;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (unint64_t)hash
{
  v35 = [(TUCallDisplayContext *)self name];
  uint64_t v3 = [v35 hash];
  v34 = [(TUCallDisplayContext *)self personNameComponents];
  uint64_t v4 = [v34 hash] ^ v3;
  v33 = [(TUCallDisplayContext *)self suggestedName];
  uint64_t v5 = [v33 hash];
  v32 = [(TUCallDisplayContext *)self label];
  uint64_t v6 = v4 ^ v5 ^ [v32 hash];
  int64_t v31 = [(TUCallDisplayContext *)self companyName];
  uint64_t v7 = [v31 hash];
  v30 = [(TUCallDisplayContext *)self companyDepartment];
  uint64_t v8 = v7 ^ [v30 hash];
  BOOL v29 = [(TUCallDisplayContext *)self companyLogoURL];
  uint64_t v9 = v6 ^ v8 ^ [v29 hash];
  int v28 = [(TUCallDisplayContext *)self contactName];
  uint64_t v10 = [v28 hash];
  v11 = [(TUCallDisplayContext *)self contactLabel];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = [(TUCallDisplayContext *)self mapName];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(TUCallDisplayContext *)self location];
  uint64_t v16 = v9 ^ v14 ^ [v15 hash];
  unint64_t v17 = [(TUCallDisplayContext *)self callDirectoryLabel];
  uint64_t v18 = [v17 hash];
  unint64_t v19 = [(TUCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
  uint64_t v20 = v18 ^ [v19 hash];
  int v21 = [(TUCallDisplayContext *)self callDirectoryExtensionIdentifier];
  uint64_t v22 = v20 ^ [v21 hash];
  unint64_t v23 = [(TUCallDisplayContext *)self contactIdentifiers];
  uint64_t v24 = v22 ^ [v23 hash];
  int64_t v25 = v16 ^ v24 ^ [(TUCallDisplayContext *)self callDirectoryIdentityType];
  unint64_t v26 = v25 ^ [(TUCallDisplayContext *)self legacyAddressBookIdentifier];

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(TUCallDisplayContext *)self name];
  [v4 setName:v5];

  uint64_t v6 = [(TUCallDisplayContext *)self personNameComponents];
  [v4 setPersonNameComponents:v6];

  uint64_t v7 = [(TUCallDisplayContext *)self suggestedName];
  [v4 setSuggestedName:v7];

  uint64_t v8 = [(TUCallDisplayContext *)self label];
  [v4 setLabel:v8];

  uint64_t v9 = [(TUCallDisplayContext *)self companyName];
  [v4 setCompanyName:v9];

  uint64_t v10 = [(TUCallDisplayContext *)self companyDepartment];
  [v4 setCompanyDepartment:v10];

  v11 = [(TUCallDisplayContext *)self companyLogoURL];
  [v4 setCompanyLogoURL:v11];

  uint64_t v12 = [(TUCallDisplayContext *)self contactIdentifiers];
  [v4 setContactIdentifiers:v12];

  uint64_t v13 = [(TUCallDisplayContext *)self contactName];
  [v4 setContactName:v13];

  uint64_t v14 = [(TUCallDisplayContext *)self contactLabel];
  [v4 setContactLabel:v14];

  v15 = [(TUCallDisplayContext *)self mapName];
  [v4 setMapName:v15];

  uint64_t v16 = [(TUCallDisplayContext *)self location];
  [v4 setLocation:v16];

  unint64_t v17 = [(TUCallDisplayContext *)self callDirectoryLabel];
  [v4 setCallDirectoryLabel:v17];

  uint64_t v18 = [(TUCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
  [v4 setCallDirectoryLocalizedExtensionContainingAppName:v18];

  unint64_t v19 = [(TUCallDisplayContext *)self callDirectoryExtensionIdentifier];
  [v4 setCallDirectoryExtensionIdentifier:v19];

  objc_msgSend(v4, "setCallDirectoryIdentityType:", -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"));
  objc_msgSend(v4, "setLegacyAddressBookIdentifier:", -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier"));
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(TUCallDisplayContext *)+[TUMutableCallDisplayContext allocWithZone:a3] init];
  uint64_t v5 = [(TUCallDisplayContext *)self name];
  [(TUCallDisplayContext *)v4 setName:v5];

  uint64_t v6 = [(TUCallDisplayContext *)self personNameComponents];
  [(TUCallDisplayContext *)v4 setPersonNameComponents:v6];

  uint64_t v7 = [(TUCallDisplayContext *)self suggestedName];
  [(TUCallDisplayContext *)v4 setSuggestedName:v7];

  uint64_t v8 = [(TUCallDisplayContext *)self label];
  [(TUCallDisplayContext *)v4 setLabel:v8];

  uint64_t v9 = [(TUCallDisplayContext *)self companyName];
  [(TUCallDisplayContext *)v4 setCompanyName:v9];

  uint64_t v10 = [(TUCallDisplayContext *)self companyDepartment];
  [(TUCallDisplayContext *)v4 setCompanyDepartment:v10];

  v11 = [(TUCallDisplayContext *)self companyLogoURL];
  [(TUCallDisplayContext *)v4 setCompanyLogoURL:v11];

  uint64_t v12 = [(TUCallDisplayContext *)self contactIdentifiers];
  [(TUCallDisplayContext *)v4 setContactIdentifiers:v12];

  uint64_t v13 = [(TUCallDisplayContext *)self contactName];
  [(TUCallDisplayContext *)v4 setContactName:v13];

  uint64_t v14 = [(TUCallDisplayContext *)self contactLabel];
  [(TUCallDisplayContext *)v4 setContactLabel:v14];

  v15 = [(TUCallDisplayContext *)self mapName];
  [(TUCallDisplayContext *)v4 setMapName:v15];

  uint64_t v16 = [(TUCallDisplayContext *)self location];
  [(TUCallDisplayContext *)v4 setLocation:v16];

  unint64_t v17 = [(TUCallDisplayContext *)self callDirectoryLabel];
  [(TUCallDisplayContext *)v4 setCallDirectoryLabel:v17];

  uint64_t v18 = [(TUCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
  [(TUCallDisplayContext *)v4 setCallDirectoryLocalizedExtensionContainingAppName:v18];

  unint64_t v19 = [(TUCallDisplayContext *)self callDirectoryExtensionIdentifier];
  [(TUCallDisplayContext *)v4 setCallDirectoryExtensionIdentifier:v19];

  [(TUCallDisplayContext *)v4 setCallDirectoryIdentityType:[(TUCallDisplayContext *)self callDirectoryIdentityType]];
  [(TUCallDisplayContext *)v4 setLegacyAddressBookIdentifier:[(TUCallDisplayContext *)self legacyAddressBookIdentifier]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCallDisplayContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)TUCallDisplayContext;
  uint64_t v5 = [(TUCallDisplayContext *)&v71 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_name);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_personNameComponents);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    personNameComponents = v5->_personNameComponents;
    v5->_personNameComponents = (NSPersonNameComponents *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_suggestedName);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    suggestedName = v5->_suggestedName;
    v5->_suggestedName = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    unint64_t v19 = NSStringFromSelector(sel_label);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    label = v5->_label;
    v5->_label = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    unint64_t v23 = NSStringFromSelector(sel_companyName);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_companyDepartment);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    companyDepartment = v5->_companyDepartment;
    v5->_companyDepartment = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    int64_t v31 = NSStringFromSelector(sel_companyLogoURL);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    companyLogoURL = v5->_companyLogoURL;
    v5->_companyLogoURL = (NSURL *)v32;

    uint64_t v34 = objc_opt_class();
    v35 = NSStringFromSelector(sel_contactName);
    uint64_t v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    contactName = v5->_contactName;
    v5->_contactName = (NSString *)v36;

    uint64_t v38 = objc_opt_class();
    v39 = NSStringFromSelector(sel_contactLabel);
    uint64_t v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    contactLabel = v5->_contactLabel;
    v5->_contactLabel = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector(sel_mapName);
    uint64_t v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    mapName = v5->_mapName;
    v5->_mapName = (NSString *)v44;

    uint64_t v46 = objc_opt_class();
    v47 = NSStringFromSelector(sel_location);
    uint64_t v48 = [v4 decodeObjectOfClass:v46 forKey:v47];
    location = v5->_location;
    v5->_location = (NSString *)v48;

    uint64_t v50 = objc_opt_class();
    v51 = NSStringFromSelector(sel_callDirectoryLabel);
    uint64_t v52 = [v4 decodeObjectOfClass:v50 forKey:v51];
    callDirectoryLabel = v5->_callDirectoryLabel;
    v5->_callDirectoryLabel = (NSString *)v52;

    uint64_t v54 = objc_opt_class();
    v55 = NSStringFromSelector(sel_callDirectoryLocalizedExtensionContainingAppName);
    uint64_t v56 = [v4 decodeObjectOfClass:v54 forKey:v55];
    callDirectoryLocalizedExtensionContainingAppName = v5->_callDirectoryLocalizedExtensionContainingAppName;
    v5->_callDirectoryLocalizedExtensionContainingAppName = (NSString *)v56;

    uint64_t v58 = objc_opt_class();
    v59 = NSStringFromSelector(sel_callDirectoryExtensionIdentifier);
    uint64_t v60 = [v4 decodeObjectOfClass:v58 forKey:v59];
    callDirectoryExtensionIdentifier = v5->_callDirectoryExtensionIdentifier;
    v5->_callDirectoryExtensionIdentifier = (NSString *)v60;

    v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v63 = objc_opt_class();
    v64 = objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v65 = NSStringFromSelector(sel_contactIdentifiers);
    uint64_t v66 = [v4 decodeObjectOfClasses:v64 forKey:v65];
    contactIdentifiers = v5->_contactIdentifiers;
    v5->_contactIdentifiers = (NSArray *)v66;

    v68 = NSStringFromSelector(sel_callDirectoryIdentityType);
    v5->_callDirectoryIdentityType = [v4 decodeIntegerForKey:v68];

    v69 = NSStringFromSelector(sel_legacyAddressBookIdentifier);
    v5->_legacyAddressBookIdentifier = [v4 decodeInt32ForKey:v69];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallDisplayContext *)self name];
  uint64_t v6 = NSStringFromSelector(sel_name);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(TUCallDisplayContext *)self personNameComponents];
  uint64_t v8 = NSStringFromSelector(sel_personNameComponents);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(TUCallDisplayContext *)self suggestedName];
  uint64_t v10 = NSStringFromSelector(sel_suggestedName);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(TUCallDisplayContext *)self label];
  uint64_t v12 = NSStringFromSelector(sel_label);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUCallDisplayContext *)self companyName];
  uint64_t v14 = NSStringFromSelector(sel_companyName);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(TUCallDisplayContext *)self companyDepartment];
  uint64_t v16 = NSStringFromSelector(sel_companyDepartment);
  [v4 encodeObject:v15 forKey:v16];

  unint64_t v17 = [(TUCallDisplayContext *)self companyLogoURL];
  uint64_t v18 = NSStringFromSelector(sel_companyLogoURL);
  [v4 encodeObject:v17 forKey:v18];

  unint64_t v19 = [(TUCallDisplayContext *)self contactName];
  uint64_t v20 = NSStringFromSelector(sel_contactName);
  [v4 encodeObject:v19 forKey:v20];

  int v21 = [(TUCallDisplayContext *)self contactLabel];
  uint64_t v22 = NSStringFromSelector(sel_contactLabel);
  [v4 encodeObject:v21 forKey:v22];

  unint64_t v23 = [(TUCallDisplayContext *)self mapName];
  uint64_t v24 = NSStringFromSelector(sel_mapName);
  [v4 encodeObject:v23 forKey:v24];

  int64_t v25 = [(TUCallDisplayContext *)self location];
  uint64_t v26 = NSStringFromSelector(sel_location);
  [v4 encodeObject:v25 forKey:v26];

  v27 = [(TUCallDisplayContext *)self callDirectoryLabel];
  uint64_t v28 = NSStringFromSelector(sel_callDirectoryLabel);
  [v4 encodeObject:v27 forKey:v28];

  BOOL v29 = [(TUCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
  uint64_t v30 = NSStringFromSelector(sel_callDirectoryLocalizedExtensionContainingAppName);
  [v4 encodeObject:v29 forKey:v30];

  int64_t v31 = [(TUCallDisplayContext *)self callDirectoryExtensionIdentifier];
  uint64_t v32 = NSStringFromSelector(sel_callDirectoryExtensionIdentifier);
  [v4 encodeObject:v31 forKey:v32];

  v33 = [(TUCallDisplayContext *)self contactIdentifiers];
  uint64_t v34 = NSStringFromSelector(sel_contactIdentifiers);
  [v4 encodeObject:v33 forKey:v34];

  int64_t v35 = [(TUCallDisplayContext *)self callDirectoryIdentityType];
  uint64_t v36 = NSStringFromSelector(sel_callDirectoryIdentityType);
  [v4 encodeInteger:v35 forKey:v36];

  uint64_t v37 = [(TUCallDisplayContext *)self legacyAddressBookIdentifier];
  NSStringFromSelector(sel_legacyAddressBookIdentifier);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt32:v37 forKey:v38];
}

- (void)setName:(id)a3
{
}

- (NSPersonNameComponents)personNameComponents
{
  return self->_personNameComponents;
}

- (void)setPersonNameComponents:(id)a3
{
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
}

- (NSString)companyDepartment
{
  return self->_companyDepartment;
}

- (void)setCompanyDepartment:(id)a3
{
}

- (NSURL)companyLogoURL
{
  return self->_companyLogoURL;
}

- (void)setCompanyLogoURL:(id)a3
{
}

- (NSString)mapName
{
  return self->_mapName;
}

- (void)setMapName:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
}

- (NSString)callDirectoryLabel
{
  return self->_callDirectoryLabel;
}

- (void)setCallDirectoryLabel:(id)a3
{
}

- (NSString)callDirectoryLocalizedExtensionContainingAppName
{
  return self->_callDirectoryLocalizedExtensionContainingAppName;
}

- (void)setCallDirectoryLocalizedExtensionContainingAppName:(id)a3
{
}

- (NSString)callDirectoryExtensionIdentifier
{
  return self->_callDirectoryExtensionIdentifier;
}

- (void)setCallDirectoryExtensionIdentifier:(id)a3
{
}

- (int64_t)callDirectoryIdentityType
{
  return self->_callDirectoryIdentityType;
}

- (void)setCallDirectoryIdentityType:(int64_t)a3
{
  self->_callDirectoryIdentityType = a3;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
}

- (int)legacyAddressBookIdentifier
{
  return self->_legacyAddressBookIdentifier;
}

- (void)setLegacyAddressBookIdentifier:(int)a3
{
  self->_legacyAddressBookIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_callDirectoryExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_callDirectoryLocalizedExtensionContainingAppName, 0);
  objc_storeStrong((id *)&self->_callDirectoryLabel, 0);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapName, 0);
  objc_storeStrong((id *)&self->_companyLogoURL, 0);
  objc_storeStrong((id *)&self->_companyDepartment, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_personNameComponents, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end