@interface PPContact
+ (BOOL)identifier:(id)a3 startsWithPrefix:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (PPContact)contactWithIdentifier:(id)a3 source:(unsigned __int8)a4 namePrefix:(id)a5 givenName:(id)a6 middleName:(id)a7 familyName:(id)a8 nameSuffix:(id)a9 nickname:(id)a10 localizedFullName:(id)a11 organizationName:(id)a12 jobTitle:(id)a13 birthday:(id)a14 nonGregorianBirthday:(id)a15 phoneNumbers:(id)a16 emailAddresses:(id)a17 socialProfiles:(id)a18 postalAddresses:(id)a19;
+ (id)contactsContactIdentifierWithIdentifier:(id)a3 error:(id *)a4;
+ (id)sourceIdentifierWithSource:(unsigned __int8)a3 identifier:(id)a4;
+ (int64_t)foundInAppsRecordIdentifierNumberWithIdentifier:(id)a3 error:(id *)a4;
+ (unsigned)sourceFromSourceIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContact:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)socialProfiles;
- (NSDateComponents)birthday;
- (NSDateComponents)nonGregorianBirthday;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)identifier;
- (NSString)jobTitle;
- (NSString)localizedFullName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)organizationName;
- (PPContact)initWithCoder:(id)a3;
- (PPContact)initWithContactsContact:(id)a3;
- (PPContact)initWithFoundInAppsContact:(id)a3;
- (PPContact)initWithIdentifier:(id)a3 source:(unsigned __int8)a4 namePrefix:(id)a5 givenName:(id)a6 middleName:(id)a7 familyName:(id)a8 nameSuffix:(id)a9 nickname:(id)a10 localizedFullName:(id)a11 organizationName:(id)a12 jobTitle:(id)a13 birthday:(id)a14 nonGregorianBirthday:(id)a15 phoneNumbers:(id)a16 emailAddresses:(id)a17 socialProfiles:(id)a18 postalAddresses:(id)a19;
- (id)contactsContactIdentifierWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)foundInAppsRecordIdentifierNumberWithError:(id *)a3;
- (unint64_t)hash;
- (unsigned)source;
- (void)_generateLocalizedFullName;
- (void)encodeWithCoder:(id)a3;
- (void)setEmailAddressForTesting:(id)a3;
- (void)setIdentifierForTesting:(id)a3;
@end

@implementation PPContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_localizedFullName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSDateComponents)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (NSDateComponents)birthday
{
  return self->_birthday;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)localizedFullName
{
  return self->_localizedFullName;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (unsigned)source
{
  return self->_source;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqualToContact:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_61;
  }
  identifier = self->_identifier;
  v7 = (NSString *)v4[2];
  if (identifier == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = identifier;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_61;
    }
  }
  if (self->_source != *((unsigned __int8 *)v5 + 8))
  {
LABEL_61:
    char v81 = 0;
    goto LABEL_62;
  }
  namePrefix = self->_namePrefix;
  v12 = (NSString *)v5[3];
  if (namePrefix == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = namePrefix;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_61;
    }
  }
  givenName = self->_givenName;
  v17 = (NSString *)v5[4];
  if (givenName == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = givenName;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_61;
    }
  }
  middleName = self->_middleName;
  v22 = (NSString *)v5[5];
  if (middleName == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = middleName;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_61;
    }
  }
  familyName = self->_familyName;
  v27 = (NSString *)v5[6];
  if (familyName == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = familyName;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_61;
    }
  }
  nameSuffix = self->_nameSuffix;
  v32 = (NSString *)v5[7];
  if (nameSuffix == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = nameSuffix;
    char v35 = [(NSString *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_61;
    }
  }
  nickname = self->_nickname;
  v37 = (NSString *)v5[8];
  if (nickname == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = nickname;
    char v40 = [(NSString *)v39 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_61;
    }
  }
  localizedFullName = self->_localizedFullName;
  v42 = (NSString *)v5[9];
  if (localizedFullName == v42)
  {
  }
  else
  {
    v43 = v42;
    v44 = localizedFullName;
    char v45 = [(NSString *)v44 isEqual:v43];

    if ((v45 & 1) == 0) {
      goto LABEL_61;
    }
  }
  organizationName = self->_organizationName;
  v47 = (NSString *)v5[10];
  if (organizationName == v47)
  {
  }
  else
  {
    v48 = v47;
    v49 = organizationName;
    char v50 = [(NSString *)v49 isEqual:v48];

    if ((v50 & 1) == 0) {
      goto LABEL_61;
    }
  }
  jobTitle = self->_jobTitle;
  v52 = (NSString *)v5[11];
  if (jobTitle == v52)
  {
  }
  else
  {
    v53 = v52;
    v54 = jobTitle;
    char v55 = [(NSString *)v54 isEqual:v53];

    if ((v55 & 1) == 0) {
      goto LABEL_61;
    }
  }
  birthday = self->_birthday;
  v57 = (NSDateComponents *)v5[12];
  if (birthday == v57)
  {
  }
  else
  {
    v58 = v57;
    v59 = birthday;
    char v60 = [(NSDateComponents *)v59 isEqual:v58];

    if ((v60 & 1) == 0) {
      goto LABEL_61;
    }
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  v62 = (NSDateComponents *)v5[13];
  if (nonGregorianBirthday == v62)
  {
  }
  else
  {
    v63 = v62;
    v64 = nonGregorianBirthday;
    char v65 = [(NSDateComponents *)v64 isEqual:v63];

    if ((v65 & 1) == 0) {
      goto LABEL_61;
    }
  }
  phoneNumbers = self->_phoneNumbers;
  v67 = (NSArray *)v5[14];
  if (phoneNumbers == v67)
  {
  }
  else
  {
    v68 = v67;
    v69 = phoneNumbers;
    char v70 = [(NSArray *)v69 isEqual:v68];

    if ((v70 & 1) == 0) {
      goto LABEL_61;
    }
  }
  emailAddresses = self->_emailAddresses;
  v72 = (NSArray *)v5[15];
  if (emailAddresses == v72)
  {
  }
  else
  {
    v73 = v72;
    v74 = emailAddresses;
    char v75 = [(NSArray *)v74 isEqual:v73];

    if ((v75 & 1) == 0) {
      goto LABEL_61;
    }
  }
  socialProfiles = self->_socialProfiles;
  v77 = (NSArray *)v5[16];
  if (socialProfiles == v77)
  {
  }
  else
  {
    v78 = v77;
    v79 = socialProfiles;
    char v80 = [(NSArray *)v79 isEqual:v78];

    if ((v80 & 1) == 0) {
      goto LABEL_61;
    }
  }
  v83 = self->_postalAddresses;
  v84 = v83;
  if (v83 == v5[17]) {
    char v81 = 1;
  }
  else {
    char v81 = -[NSArray isEqual:](v83, "isEqual:");
  }

LABEL_62:
  return v81;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPContact *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPContact *)self isEqualToContact:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19 = objc_opt_class();
  v24 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  unsigned int source = self->_source;
  char v20 = (void *)[(NSString *)self->_namePrefix copyWithZone:a3];
  v18 = (void *)[(NSString *)self->_givenName copyWithZone:a3];
  v17 = (void *)[(NSString *)self->_middleName copyWithZone:a3];
  v16 = (void *)[(NSString *)self->_familyName copyWithZone:a3];
  v23 = (void *)[(NSString *)self->_nameSuffix copyWithZone:a3];
  v14 = (void *)[(NSString *)self->_nickname copyWithZone:a3];
  v13 = (void *)[(NSString *)self->_localizedFullName copyWithZone:a3];
  v12 = (void *)[(NSString *)self->_organizationName copyWithZone:a3];
  char v15 = (void *)[(NSString *)self->_jobTitle copyWithZone:a3];
  v11 = (void *)[(NSDateComponents *)self->_birthday copyWithZone:a3];
  v5 = (void *)[(NSDateComponents *)self->_nonGregorianBirthday copyWithZone:a3];
  BOOL v6 = (void *)[(NSArray *)self->_phoneNumbers copyWithZone:a3];
  v7 = (void *)[(NSArray *)self->_emailAddresses copyWithZone:a3];
  v8 = (void *)[(NSArray *)self->_socialProfiles copyWithZone:a3];
  v9 = (void *)[(NSArray *)self->_postalAddresses copyWithZone:a3];
  objc_msgSend(v19, "contactWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v24, source, v20, v18, v17, v16, v23, v14, v13, v12, v15, v11, v5, v6, v7, v8,
  v22 = v9);

  return v22;
}

- (unint64_t)hash
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = self->_source - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_namePrefix hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_givenName hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_middleName hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_familyName hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_nameSuffix hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_nickname hash] - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_localizedFullName hash] - v10 + 32 * v10;
  NSUInteger v12 = [(NSString *)self->_organizationName hash] - v11 + 32 * v11;
  NSUInteger v13 = [(NSString *)self->_jobTitle hash] - v12 + 32 * v12;
  uint64_t v14 = [(NSDateComponents *)self->_birthday hash] - v13 + 32 * v13;
  unint64_t v15 = [(NSDateComponents *)self->_nonGregorianBirthday hash] - v14 + 32 * v14;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v16 = self->_phoneNumbers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v15 = [*(id *)(*((void *)&v49 + 1) + 8 * v20++) hash] - v15 + 32 * v15;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v18);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v21 = self->_emailAddresses;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v15 = [*(id *)(*((void *)&v45 + 1) + 8 * v25++) hash] - v15 + 32 * v15;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v23);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v26 = self->_socialProfiles;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        unint64_t v15 = [*(id *)(*((void *)&v41 + 1) + 8 * v30++) hash] - v15 + 32 * v15;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v28);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v31 = self->_postalAddresses;
  uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        unint64_t v15 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v35++), "hash", (void)v37) - v15 + 32 * v15;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v33);
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"idt"];
  [v5 encodeInt32:self->_source forKey:@"src"];
  [v5 encodeObject:self->_namePrefix forKey:@"npr"];
  [v5 encodeObject:self->_givenName forKey:@"gnm"];
  [v5 encodeObject:self->_middleName forKey:@"mnm"];
  [v5 encodeObject:self->_familyName forKey:@"fnm"];
  [v5 encodeObject:self->_nameSuffix forKey:@"nsf"];
  [v5 encodeObject:self->_nickname forKey:@"nck"];
  [v5 encodeObject:self->_localizedFullName forKey:@"lfn"];
  [v5 encodeObject:self->_organizationName forKey:@"org"];
  [v5 encodeObject:self->_jobTitle forKey:@"job"];
  [v5 encodeObject:self->_birthday forKey:@"bdy"];
  [v5 encodeObject:self->_nonGregorianBirthday forKey:@"ngb"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phn"];
  [v5 encodeObject:self->_emailAddresses forKey:@"eml"];
  [v5 encodeObject:self->_socialProfiles forKey:@"soc"];
  [v5 encodeObject:self->_postalAddresses forKey:@"pos"];
}

- (PPContact)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  NSUInteger v6 = (void *)MEMORY[0x192F97350]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  NSUInteger v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  NSUInteger v10 = [v4 decodeObjectOfClass:v5 forKey:@"idt"];
  if (v10)
  {
    unsigned __int8 v25 = [v4 decodeInt32ForKey:@"src"];
    uint64_t v24 = [v4 decodeObjectOfClass:v5 forKey:@"npr"];
    uint64_t v23 = [v4 decodeObjectOfClass:v5 forKey:@"gnm"];
    uint64_t v22 = [v4 decodeObjectOfClass:v5 forKey:@"mnm"];
    v21 = [v4 decodeObjectOfClass:v5 forKey:@"fnm"];
    uint64_t v28 = [v4 decodeObjectOfClass:v5 forKey:@"nsf"];
    uint64_t v27 = [v4 decodeObjectOfClass:v5 forKey:@"nck"];
    uint64_t v20 = [v4 decodeObjectOfClass:v5 forKey:@"lfn"];
    v26 = [v4 decodeObjectOfClass:v5 forKey:@"org"];
    uint64_t v19 = [v4 decodeObjectOfClass:v5 forKey:@"job"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bdy"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ngb"];
    v16 = [v4 decodeObjectOfClasses:v9 forKey:@"phn"];
    NSUInteger v11 = [v4 decodeObjectOfClasses:v9 forKey:@"eml"];
    NSUInteger v12 = [v4 decodeObjectOfClasses:v9 forKey:@"soc"];
    NSUInteger v13 = [v4 decodeObjectOfClasses:v9 forKey:@"pos"];
    self = objc_retain(-[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](self, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v10, v25, v24, v23, v22, v21, v28, v27, v20, v26, v19, v18, v17, v16, v11,
               v12,
               v13));

    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)setEmailAddressForTesting:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[PPLabeledValue alloc] initWithLabel:@"email" value:v4];

  v8[0] = v5;
  NSUInteger v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v6;
}

- (void)setIdentifierForTesting:(id)a3
{
}

- (void)_generateLocalizedFullName
{
  NSUInteger v3 = objc_opt_new();
  id v6 = v3;
  if (self->_namePrefix)
  {
    objc_msgSend(v3, "setNamePrefix:");
    NSUInteger v3 = v6;
  }
  if (self->_givenName)
  {
    objc_msgSend(v6, "setGivenName:");
    NSUInteger v3 = v6;
  }
  if (self->_middleName)
  {
    objc_msgSend(v6, "setMiddleName:");
    NSUInteger v3 = v6;
  }
  if (self->_familyName)
  {
    objc_msgSend(v6, "setFamilyName:");
    NSUInteger v3 = v6;
  }
  if (self->_nameSuffix)
  {
    objc_msgSend(v6, "setNameSuffix:");
    NSUInteger v3 = v6;
  }
  if (self->_nickname)
  {
    objc_msgSend(v6, "setNickname:");
    NSUInteger v3 = v6;
  }
  [v3 setContactType:0];
  id v4 = [MEMORY[0x1E4F1B910] stringFromContact:v6 style:0];
  localizedFullName = self->_localizedFullName;
  self->_localizedFullName = v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPContact %@: '%@' src:%d>", self->_identifier, self->_localizedFullName, self->_source];
  return v2;
}

- (id)contactsContactIdentifierWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_source == 1)
  {
    uint64_t v5 = +[PPContact contactsContactIdentifierWithIdentifier:self->_identifier error:a3];
  }
  else
  {
    id v6 = (void *)[[NSString alloc] initWithFormat:@"attempt to get CN identifier for non-CN contact: src:%d id:%@", self->_source, self->_identifier];
    id v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int source = self->_source;
      identifier = self->_identifier;
      *(_DWORD *)buf = 67109378;
      int v18 = source;
      __int16 v19 = 2112;
      uint64_t v20 = identifier;
      _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "attempt to get CN identifier for non-CN contact: src:%d id:%@", buf, 0x12u);
    }

    if (a3)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      v15[0] = @"PPErrorInfoKey";
      v15[1] = @"identifier";
      NSUInteger v9 = self->_identifier;
      v16[0] = v6;
      v16[1] = v9;
      v15[2] = @"source";
      NSUInteger v10 = [NSNumber numberWithUnsignedChar:self->_source];
      v16[2] = v10;
      NSUInteger v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
      *a3 = [v8 errorWithDomain:@"PPErrorDomain" code:2 userInfo:v11];
    }
    uint64_t v5 = 0;
  }
  return v5;
}

- (int64_t)foundInAppsRecordIdentifierNumberWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_source == 2)
  {
    identifier = self->_identifier;
    return +[PPContact foundInAppsRecordIdentifierNumberWithIdentifier:identifier error:a3];
  }
  else
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"attempt to get FIA identifier for non-FIA contact: src:%d id:%@", self->_source, self->_identifier];
    uint64_t v8 = pp_contacts_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int source = self->_source;
      uint64_t v14 = self->_identifier;
      *(_DWORD *)buf = 67109378;
      int v18 = source;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_error_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_ERROR, "attempt to get FIA identifier for non-FIA contact: src:%d id:%@", buf, 0x12u);
    }

    if (a3)
    {
      NSUInteger v9 = (void *)MEMORY[0x1E4F28C58];
      v15[0] = @"PPErrorInfoKey";
      v15[1] = @"identifier";
      NSUInteger v10 = self->_identifier;
      v16[0] = v7;
      v16[1] = v10;
      v15[2] = @"source";
      NSUInteger v11 = [NSNumber numberWithUnsignedChar:self->_source];
      v16[2] = v11;
      NSUInteger v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
      *a3 = [v9 errorWithDomain:@"PPErrorDomain" code:2 userInfo:v12];
    }
    return 0;
  }
}

- (PPContact)initWithFoundInAppsContact:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"PPContact.m", 142, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v62 = self;
  id v6 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v7 = [v5 phones];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v77 != v10) {
          objc_enumerationMutation(v7);
        }
        NSUInteger v12 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        NSUInteger v13 = (void *)MEMORY[0x192F97350]();
        uint64_t v14 = [v12 phoneNumber];
        uint64_t v15 = [v14 length];

        if (v15)
        {
          v16 = [v12 label];
          uint64_t v17 = [v12 phoneNumber];
          int v18 = +[PPLabeledValue labeledValueWithLabel:v16 value:v17];
          [v6 addObject:v18];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v9);
  }
  v67 = v6;

  __int16 v19 = objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v20 = [v5 emailAddresses];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v73 != v23) {
          objc_enumerationMutation(v20);
        }
        unsigned __int8 v25 = *(void **)(*((void *)&v72 + 1) + 8 * j);
        v26 = (void *)MEMORY[0x192F97350]();
        uint64_t v27 = [v25 emailAddress];
        uint64_t v28 = [v27 length];

        if (v28)
        {
          uint64_t v29 = [v25 label];
          uint64_t v30 = [v25 emailAddress];
          v31 = +[PPLabeledValue labeledValueWithLabel:v29 value:v30];
          [v19 addObject:v31];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v22);
  }

  uint64_t v32 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v64 = v5;
  uint64_t v33 = [v5 postalAddresses];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v69 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = *(void **)(*((void *)&v68 + 1) + 8 * k);
        long long v39 = (void *)MEMORY[0x192F97350]();
        long long v40 = [[PPPostalAddress alloc] initWithFoundInAppsPostalAddress:v38];
        long long v41 = [v38 label];
        long long v42 = +[PPLabeledValue labeledValueWithLabel:v41 value:v40];
        [v32 addObject:v42];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v35);
  }

  long long v43 = objc_opt_class();
  id v44 = [NSString alloc];
  v61 = [v64 recordId];
  char v60 = objc_msgSend(v44, "initWithFormat:", @"%llu", objc_msgSend(v61, "numericValue"));
  v66 = [v43 sourceIdentifierWithSource:2 identifier:v60];
  v59 = [v64 name];
  char v65 = [v59 prefix];
  v58 = [v64 name];
  long long v45 = [v58 firstName];
  uint64_t v57 = [v64 name];
  v54 = [v57 middleName];
  v56 = [v64 name];
  long long v46 = [v56 lastName];
  char v55 = [v64 name];
  long long v47 = [v55 suffix];
  long long v48 = [v64 name];
  long long v49 = [v48 fullName];
  long long v50 = [v64 birthday];
  long long v51 = [v50 dateComponents];
  v63 = -[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](v62, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v66, 2, v65, v45, v54, v46, v47, 0, v49, 0, 0, v51, 0, v67, v19, 0,
          v32);

  return v63;
}

- (PPContact)initWithContactsContact:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v73 = [MEMORY[0x1E4F28B00] currentHandler];
    [v73 handleFailureInMethod:a2, self, @"PPContact.m", 77, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v93 = objc_opt_new();
  v86 = self;
  id v88 = v5;
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AEE0]])
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v6 = [v5 phoneNumbers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v106 objects:v113 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v107 != v9) {
            objc_enumerationMutation(v6);
          }
          NSUInteger v11 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          NSUInteger v12 = (void *)MEMORY[0x192F97350]();
          NSUInteger v13 = [v11 value];
          uint64_t v14 = [v13 stringValue];
          uint64_t v15 = [v14 length];

          if (v15)
          {
            v16 = [v11 label];
            uint64_t v17 = [v11 value];
            int v18 = [v17 stringValue];
            __int16 v19 = +[PPLabeledValue labeledValueWithLabel:v16 value:v18];
            [v93 addObject:v19];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v106 objects:v113 count:16];
      }
      while (v8);
    }

    self = v86;
    id v5 = v88;
  }
  v92 = objc_opt_new();
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
  {
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    uint64_t v20 = [v5 emailAddresses];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v102 objects:v112 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v103;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v103 != v23) {
            objc_enumerationMutation(v20);
          }
          unsigned __int8 v25 = *(void **)(*((void *)&v102 + 1) + 8 * j);
          v26 = (void *)MEMORY[0x192F97350]();
          uint64_t v27 = [v25 value];
          uint64_t v28 = [v27 length];

          if (v28)
          {
            uint64_t v29 = [v25 label];
            uint64_t v30 = [v25 value];
            v31 = +[PPLabeledValue labeledValueWithLabel:v29 value:v30];
            [v92 addObject:v31];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v102 objects:v112 count:16];
      }
      while (v22);
    }

    id v5 = v88;
  }
  v91 = objc_opt_new();
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AF78]])
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v32 = [v5 socialProfiles];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v98 objects:v111 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v99 != v35) {
            objc_enumerationMutation(v32);
          }
          long long v37 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          long long v38 = (void *)MEMORY[0x192F97350]();
          long long v39 = [v37 value];
          long long v40 = [v39 username];
          uint64_t v41 = [v40 length];

          if (v41)
          {
            long long v42 = [v37 value];
            long long v43 = [v42 service];
            id v44 = [v37 value];
            long long v45 = [v44 username];
            long long v46 = +[PPLabeledValue labeledValueWithLabel:v43 value:v45];
            [v91 addObject:v46];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v98 objects:v111 count:16];
      }
      while (v34);
    }

    self = v86;
    id v5 = v88;
  }
  v90 = objc_opt_new();
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AF10]])
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v47 = [v5 postalAddresses];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v94 objects:v110 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v95;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v95 != v50) {
            objc_enumerationMutation(v47);
          }
          long long v52 = *(void **)(*((void *)&v94 + 1) + 8 * m);
          v53 = (void *)MEMORY[0x192F97350]();
          v54 = [v52 value];

          if (v54)
          {
            char v55 = [PPPostalAddress alloc];
            v56 = [v52 value];
            uint64_t v57 = [(PPPostalAddress *)v55 initWithContactsPostalAddress:v56];

            v58 = [v52 label];
            v59 = +[PPLabeledValue labeledValueWithLabel:v58 value:v57];
            [v90 addObject:v59];
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v49);
    }

    self = v86;
    id v5 = v88;
  }
  char v60 = objc_opt_class();
  v61 = [v5 identifier];
  v62 = [v60 sourceIdentifierWithSource:1 identifier:v61];
  int v63 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AEB0]];
  if (v63)
  {
    v64 = [v5 namePrefix];
  }
  else
  {
    v64 = 0;
  }
  int v65 = [v5 isKeyAvailable:*MEMORY[0x1E4F1ADF0]];
  if (v65)
  {
    v87 = [v5 givenName];
  }
  else
  {
    v87 = 0;
  }
  int v79 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AEA0]];
  if (v79)
  {
    v85 = [v5 middleName];
  }
  else
  {
    v85 = 0;
  }
  int v78 = [v5 isKeyAvailable:*MEMORY[0x1E4F1ADE0]];
  if (v78)
  {
    v84 = [v5 familyName];
  }
  else
  {
    v84 = 0;
  }
  int v77 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AEB8]];
  if (v77)
  {
    uint64_t v83 = [v5 nameSuffix];
  }
  else
  {
    uint64_t v83 = 0;
  }
  int v76 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AEC0]];
  if (v76)
  {
    v82 = [v5 nickname];
  }
  else
  {
    v82 = 0;
  }
  v89 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
  int v75 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AED8]];
  if (v75)
  {
    char v81 = [v5 organizationName];
  }
  else
  {
    char v81 = 0;
  }
  int v66 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AE78]];
  if (v66)
  {
    char v80 = [v5 jobTitle];
  }
  else
  {
    char v80 = 0;
  }
  int v67 = [v5 isKeyAvailable:*MEMORY[0x1E4F1AD90]];
  if (v67)
  {
    long long v68 = [v5 birthday];
  }
  else
  {
    long long v68 = 0;
  }
  if (([v5 isKeyAvailable:*MEMORY[0x1E4F1AEC8]] & 1) == 0)
  {
    long long v71 = objc_retain(-[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](self, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v62, 1, v64, v87, v85, v84, v83, v82, v89, v81, v80, v68, 0, v93, v92,
              v91,
              v90));
    if (!v67) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  [v5 nonGregorianBirthday];
  long long v74 = v61;
  long long v70 = v69 = v64;
  long long v71 = objc_retain(-[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](self, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v62, 1, v69, v87, v85, v84, v83, v82, v89, v81, v80, v68, v70, v93, v92,
            v91,
            v90));

  v64 = v69;
  v61 = v74;
  if (v67) {
LABEL_78:
  }

LABEL_79:
  if (v66) {

  }
  if (v75) {
  if (v76)
  }

  if (v77) {
  if (v78)
  }

  if (!v79)
  {
    if (!v65) {
      goto LABEL_91;
    }
LABEL_95:

    if (!v63) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }

  if (v65) {
    goto LABEL_95;
  }
LABEL_91:
  if (v63) {
LABEL_92:
  }

LABEL_93:
  return v71;
}

- (PPContact)initWithIdentifier:(id)a3 source:(unsigned __int8)a4 namePrefix:(id)a5 givenName:(id)a6 middleName:(id)a7 familyName:(id)a8 nameSuffix:(id)a9 nickname:(id)a10 localizedFullName:(id)a11 organizationName:(id)a12 jobTitle:(id)a13 birthday:(id)a14 nonGregorianBirthday:(id)a15 phoneNumbers:(id)a16 emailAddresses:(id)a17 socialProfiles:(id)a18 postalAddresses:(id)a19
{
  id v48 = a3;
  id v35 = a5;
  id v47 = a5;
  id v46 = a6;
  id v45 = a7;
  id v36 = a8;
  id v44 = a8;
  id v43 = a9;
  id v42 = a10;
  id v41 = a11;
  id v38 = a12;
  id v40 = a13;
  id v39 = a14;
  id v23 = a15;
  id v24 = a16;
  id v25 = a17;
  id v26 = a18;
  id v27 = a19;
  if (!v48)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PPContact.m", 47, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v49.receiver = self;
  v49.super_class = (Class)PPContact;
  uint64_t v28 = [(PPContact *)&v49 init];
  uint64_t v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_identifier, a3);
    v29->_int source = a4;
    objc_storeStrong((id *)&v29->_namePrefix, v35);
    objc_storeStrong((id *)&v29->_givenName, a6);
    objc_storeStrong((id *)&v29->_middleName, a7);
    objc_storeStrong((id *)&v29->_familyName, v36);
    objc_storeStrong((id *)&v29->_nameSuffix, a9);
    objc_storeStrong((id *)&v29->_nickname, a10);
    objc_storeStrong((id *)&v29->_organizationName, a12);
    objc_storeStrong((id *)&v29->_jobTitle, a13);
    objc_storeStrong((id *)&v29->_birthday, a14);
    objc_storeStrong((id *)&v29->_nonGregorianBirthday, a15);
    objc_storeStrong((id *)&v29->_phoneNumbers, a16);
    objc_storeStrong((id *)&v29->_emailAddresses, a17);
    objc_storeStrong((id *)&v29->_socialProfiles, a18);
    objc_storeStrong((id *)&v29->_postalAddresses, a19);
    objc_storeStrong((id *)&v29->_localizedFullName, a11);
    if (!v29->_localizedFullName) {
      [(PPContact *)v29 _generateLocalizedFullName];
    }
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PPContact)contactWithIdentifier:(id)a3 source:(unsigned __int8)a4 namePrefix:(id)a5 givenName:(id)a6 middleName:(id)a7 familyName:(id)a8 nameSuffix:(id)a9 nickname:(id)a10 localizedFullName:(id)a11 organizationName:(id)a12 jobTitle:(id)a13 birthday:(id)a14 nonGregorianBirthday:(id)a15 phoneNumbers:(id)a16 emailAddresses:(id)a17 socialProfiles:(id)a18 postalAddresses:(id)a19
{
  unsigned int v37 = a4;
  id v32 = a19;
  id v30 = a18;
  id v27 = a17;
  id v26 = a16;
  id v25 = a15;
  id v43 = a14;
  id v42 = a13;
  id v41 = a12;
  id v40 = a11;
  id v39 = a10;
  id v24 = a9;
  id v29 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v38 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v22, v37, v21, v20, v19, v29, v24, v39, v40, v41, v42, v43, v25, v26, v27,
                  v30,
                  v32);

  return (PPContact *)v38;
}

+ (BOOL)identifier:(id)a3 startsWithPrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x192F97350]();
  uint64_t v8 = [v6 stringByAppendingString:@":"];
  uint64_t v9 = [v8 length];
  unint64_t v10 = [v5 length];
  if (v10 <= [v8 length])
  {
    char v13 = 0;
  }
  else
  {
    NSUInteger v11 = (void *)MEMORY[0x192F97350]();
    NSUInteger v12 = objc_msgSend(v5, "substringWithRange:", 0, v9);
    char v13 = [v12 isEqualToString:v8];
  }
  return v13;
}

+ (unsigned)sourceFromSourceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@":"])
  {
    id v4 = (void *)MEMORY[0x192F97350]();
    id v5 = [v3 componentsSeparatedByString:@":"];
    id v6 = [v5 firstObject];

    if ([v6 isEqualToString:@"CN"])
    {
      unsigned __int8 v7 = 1;
    }
    else if ([v6 isEqualToString:@"FIA"])
    {
      unsigned __int8 v7 = 2;
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (id)sourceIdentifierWithSource:(unsigned __int8)a3 identifier:(id)a4
{
  int v5 = a3;
  id v7 = a4;
  switch(v5)
  {
    case 0:
      uint64_t v8 = @"UNK";
      goto LABEL_7;
    case 2:
      uint64_t v8 = @"FIA";
      goto LABEL_7;
    case 1:
      uint64_t v8 = @"CN";
LABEL_7:
      if ([a1 identifier:v7 startsWithPrefix:v8]) {
        id v9 = v7;
      }
      else {
        id v9 = (id)[[NSString alloc] initWithFormat:@"%@%@%@", v8, @":", v7];
      }
      id v4 = v9;
      break;
  }

  return v4;
}

+ (id)contactsContactIdentifierWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([a1 identifier:v5 startsWithPrefix:@"CN"])
  {
    uint64_t v6 = [@"CN" length];
    uint64_t v7 = [@":" length] + v6;
    uint64_t v8 = [v5 length] - v7;
    id v9 = (void *)MEMORY[0x192F97350]();
    objc_msgSend(v5, "substringWithRange:", v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (int64_t)foundInAppsRecordIdentifierNumberWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [a1 identifier:v6 startsWithPrefix:@"FIA"];
  uint64_t v8 = v6;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x192F97350]();
    uint64_t v10 = [@"FIA" length];
    uint64_t v11 = [@":" length] + v10;
    uint64_t v8 = objc_msgSend(v6, "substringWithRange:", v11, objc_msgSend(v6, "length") - v11);
  }
  NSUInteger v12 = objc_opt_new();
  char v13 = [v12 numberFromString:v8];
  uint64_t v14 = v13;
  if (v13)
  {
    int64_t v15 = [v13 longLongValue];
  }
  else
  {
    v16 = (void *)[[NSString alloc] initWithFormat:@"Number formatter failed to get FIA identifier from id: %@", v6];
    uint64_t v17 = pp_contacts_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_18CAA6000, v17, OS_LOG_TYPE_INFO, "Number formatter failed to get FIA identifier from id: %@", buf, 0xCu);
    }

    if (a4)
    {
      int v18 = (void *)MEMORY[0x1E4F28C58];
      v21[0] = @"PPErrorInfoKey";
      v21[1] = @"identifier";
      v22[0] = v16;
      v22[1] = v6;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      *a4 = [v18 errorWithDomain:@"PPErrorDomain" code:2 userInfo:v19];
    }
    int64_t v15 = -1;
  }

  return v15;
}

@end