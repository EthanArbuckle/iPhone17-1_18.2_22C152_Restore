@interface TISupplementalPersonItem
+ (BOOL)supportsSecureCoding;
- (NSPersonNameComponents)personNameComponents;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)organizationName;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticOrganizationName;
- (NSString)previousFamilyName;
- (TISupplementalPersonItem)initWithCoder:(id)a3;
- (TISupplementalPersonItem)initWithContact:(id)a3;
- (TISupplementalPersonItem)initWithPersonNameComponents:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setPhoneticOrganizationName:(id)a3;
- (void)setPreviousFamilyName:(id)a3;
@end

@implementation TISupplementalPersonItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);

  objc_storeStrong((id *)&self->_givenName, 0);
}

- (void)setPreviousFamilyName:(id)a3
{
}

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (void)setNickname:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setPhoneticOrganizationName:(id)a3
{
}

- (NSString)phoneticOrganizationName
{
  return self->_phoneticOrganizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setPhoneticMiddleName:(id)a3
{
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (id)description
{
  v23[20] = *MEMORY[0x1E4F143B8];
  givenName = self->_givenName;
  v23[0] = "givenName";
  v23[1] = givenName;
  phoneticGivenName = self->_phoneticGivenName;
  v23[2] = "phoneticGivenName";
  v23[3] = phoneticGivenName;
  middleName = self->_middleName;
  v23[4] = "middleName";
  v23[5] = middleName;
  phoneticMiddleName = self->_phoneticMiddleName;
  v23[6] = "phoneticMiddleName";
  v23[7] = phoneticMiddleName;
  familyName = self->_familyName;
  v23[8] = "familyName";
  v23[9] = familyName;
  phoneticFamilyName = self->_phoneticFamilyName;
  v23[10] = "phoneticFamilyName";
  v23[11] = phoneticFamilyName;
  previousFamilyName = self->_previousFamilyName;
  v23[12] = "previousFamilyName";
  v23[13] = previousFamilyName;
  organizationName = self->_organizationName;
  v23[14] = "organizationName";
  v23[15] = organizationName;
  phoneticOrganizationName = self->_phoneticOrganizationName;
  v23[16] = "phoneticOrganizationName";
  v23[17] = phoneticOrganizationName;
  nickname = self->_nickname;
  v23[18] = "nickname";
  v23[19] = nickname;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  for (uint64_t i = 0; i != 20; i += 2)
  {
    uint64_t v16 = v23[i];
    v15 = (void *)v23[i + 1];
    if ([v15 length])
    {
      v17 = [NSString stringWithFormat:@"%s=\"%@\"", v16, v15];
      [v13 addObject:v17];
    }
  }
  v18 = NSString;
  uint64_t v19 = objc_opt_class();
  v20 = [v13 componentsJoinedByString:@", "];
  objc_msgSend(v18, "stringWithFormat:", @"<%@: %p; %@, identifier=%llu>",
    v19,
    self,
    v20,
  v21 = [(TISupplementalItem *)self identifier]);

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TISupplementalPersonItem;
  id v4 = a3;
  [(TISupplementalItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_givenName, @"givenName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_phoneticGivenName forKey:@"phoneticGivenName"];
  [v4 encodeObject:self->_middleName forKey:@"middleName"];
  [v4 encodeObject:self->_phoneticMiddleName forKey:@"phoneticMiddleName"];
  [v4 encodeObject:self->_familyName forKey:@"familyName"];
  [v4 encodeObject:self->_phoneticFamilyName forKey:@"phoneticFamilyName"];
  [v4 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v4 encodeObject:self->_phoneticOrganizationName forKey:@"phoneticOrganizationName"];
  [v4 encodeObject:self->_nickname forKey:@"nickname"];
  [v4 encodeObject:self->_previousFamilyName forKey:@"previousFamilyName"];
}

- (TISupplementalPersonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TISupplementalPersonItem;
  objc_super v5 = [(TISupplementalItem *)&v28 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"givenName"];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticGivenName"];
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticMiddleName"];
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticMiddleName"];
    phoneticMiddleName = v5->_phoneticMiddleName;
    v5->_phoneticMiddleName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyName"];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticFamilyName"];
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticOrganizationName"];
    phoneticOrganizationName = v5->_phoneticOrganizationName;
    v5->_phoneticOrganizationName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nickname"];
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousFamilyName"];
    previousFamilyName = v5->_previousFamilyName;
    v5->_previousFamilyName = (NSString *)v24;

    v26 = v5;
  }

  return v5;
}

- (NSPersonNameComponents)personNameComponents
{
  if ([(NSString *)self->_organizationName length]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(NSString *)self->_phoneticOrganizationName length] != 0;
  }
  if ([(NSString *)self->_givenName length]
    || [(NSString *)self->_phoneticGivenName length]
    || [(NSString *)self->_middleName length]
    || [(NSString *)self->_phoneticMiddleName length]
    || [(NSString *)self->_familyName length]
    || [(NSString *)self->_phoneticFamilyName length]
    || (![(NSString *)self->_nickname length] ? (char v4 = 1) : (char v4 = v3), (v4 & 1) == 0))
  {
    objc_super v5 = objc_opt_new();
    [v5 setGivenName:self->_givenName];
    [v5 setMiddleName:self->_middleName];
    [v5 setFamilyName:self->_familyName];
    [v5 setNickname:self->_nickname];
    if ([(NSString *)self->_phoneticGivenName length]
      || [(NSString *)self->_phoneticFamilyName length]
      || [(NSString *)self->_phoneticMiddleName length])
    {
      uint64_t v6 = objc_opt_new();
      [v5 setPhoneticRepresentation:v6];

      phoneticGivenName = self->_phoneticGivenName;
      uint64_t v8 = [v5 phoneticRepresentation];
      [v8 setGivenName:phoneticGivenName];

      phoneticMiddleName = self->_phoneticMiddleName;
      uint64_t v10 = [v5 phoneticRepresentation];
      [v10 setMiddleName:phoneticMiddleName];

      phoneticFamilyName = self->_phoneticFamilyName;
      uint64_t v12 = [v5 phoneticRepresentation];
      [v12 setFamilyName:phoneticFamilyName];
    }
  }
  else
  {
    objc_super v5 = 0;
  }

  return (NSPersonNameComponents *)v5;
}

- (TISupplementalPersonItem)initWithPersonNameComponents:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TISupplementalPersonItem;
  objc_super v5 = [(TISupplementalItem *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 givenName];
    uint64_t v7 = [v6 copy];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v7;

    v9 = [v4 middleName];
    uint64_t v10 = [v9 copy];
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v10;

    uint64_t v12 = [v4 familyName];
    uint64_t v13 = [v12 copy];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v13;

    v15 = [v4 nickname];
    uint64_t v16 = [v15 copy];
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v16;

    uint64_t v18 = [v4 phoneticRepresentation];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 givenName];
      uint64_t v21 = [v20 copy];
      phoneticGivenName = v5->_phoneticGivenName;
      v5->_phoneticGivenName = (NSString *)v21;

      v23 = [v19 middleName];
      uint64_t v24 = [v23 copy];
      phoneticMiddleName = v5->_phoneticMiddleName;
      v5->_phoneticMiddleName = (NSString *)v24;

      v26 = [v19 familyName];
      uint64_t v27 = [v26 copy];
      phoneticFamilyName = v5->_phoneticFamilyName;
      v5->_phoneticFamilyName = (NSString *)v27;
    }
    v29 = v5;
  }
  return v5;
}

- (TISupplementalPersonItem)initWithContact:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)TISupplementalPersonItem;
  objc_super v5 = [(TISupplementalItem *)&v69 init];
  if (!v5)
  {
LABEL_53:

    return v5;
  }
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v6 = (void *)getCNContactGivenNameKeySymbolLoc_ptr;
  uint64_t v78 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    uint64_t v70 = MEMORY[0x1E4F143A8];
    uint64_t v71 = 3221225472;
    v72 = __getCNContactGivenNameKeySymbolLoc_block_invoke;
    v73 = &unk_1E555A528;
    v74 = &v75;
    uint64_t v7 = (void *)ContactsLibrary();
    uint64_t v8 = dlsym(v7, "CNContactGivenNameKey");
    *(void *)(v74[1] + 24) = v8;
    getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
    uint64_t v6 = (void *)v76[3];
  }
  _Block_object_dispose(&v75, 8);
  if (v6)
  {
    if ([v4 isKeyAvailable:*v6])
    {
      v9 = [v4 givenName];
      uint64_t v10 = [v9 copy];
      givenName = v5->_givenName;
      v5->_givenName = (NSString *)v10;
    }
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2020000000;
    uint64_t v12 = (void *)getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
    uint64_t v78 = getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
    if (!getCNContactPhoneticGivenNameKeySymbolLoc_ptr)
    {
      uint64_t v70 = MEMORY[0x1E4F143A8];
      uint64_t v71 = 3221225472;
      v72 = __getCNContactPhoneticGivenNameKeySymbolLoc_block_invoke;
      v73 = &unk_1E555A528;
      v74 = &v75;
      uint64_t v13 = (void *)ContactsLibrary();
      uint64_t v14 = dlsym(v13, "CNContactPhoneticGivenNameKey");
      *(void *)(v74[1] + 24) = v14;
      getCNContactPhoneticGivenNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
      uint64_t v12 = (void *)v76[3];
    }
    _Block_object_dispose(&v75, 8);
    if (v12)
    {
      if ([v4 isKeyAvailable:*v12])
      {
        v15 = [v4 phoneticGivenName];
        uint64_t v16 = [v15 copy];
        phoneticGivenName = v5->_phoneticGivenName;
        v5->_phoneticGivenName = (NSString *)v16;
      }
      uint64_t v75 = 0;
      v76 = &v75;
      uint64_t v77 = 0x2020000000;
      uint64_t v18 = (void *)getCNContactMiddleNameKeySymbolLoc_ptr;
      uint64_t v78 = getCNContactMiddleNameKeySymbolLoc_ptr;
      if (!getCNContactMiddleNameKeySymbolLoc_ptr)
      {
        uint64_t v70 = MEMORY[0x1E4F143A8];
        uint64_t v71 = 3221225472;
        v72 = __getCNContactMiddleNameKeySymbolLoc_block_invoke;
        v73 = &unk_1E555A528;
        v74 = &v75;
        uint64_t v19 = (void *)ContactsLibrary();
        uint64_t v20 = dlsym(v19, "CNContactMiddleNameKey");
        *(void *)(v74[1] + 24) = v20;
        getCNContactMiddleNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
        uint64_t v18 = (void *)v76[3];
      }
      _Block_object_dispose(&v75, 8);
      if (v18)
      {
        if ([v4 isKeyAvailable:*v18])
        {
          uint64_t v21 = [v4 middleName];
          uint64_t v22 = [v21 copy];
          middleName = v5->_middleName;
          v5->_middleName = (NSString *)v22;
        }
        uint64_t v75 = 0;
        v76 = &v75;
        uint64_t v77 = 0x2020000000;
        uint64_t v24 = (void *)getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
        uint64_t v78 = getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
        if (!getCNContactPhoneticMiddleNameKeySymbolLoc_ptr)
        {
          uint64_t v70 = MEMORY[0x1E4F143A8];
          uint64_t v71 = 3221225472;
          v72 = __getCNContactPhoneticMiddleNameKeySymbolLoc_block_invoke;
          v73 = &unk_1E555A528;
          v74 = &v75;
          v25 = (void *)ContactsLibrary();
          v26 = dlsym(v25, "CNContactPhoneticMiddleNameKey");
          *(void *)(v74[1] + 24) = v26;
          getCNContactPhoneticMiddleNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
          uint64_t v24 = (void *)v76[3];
        }
        _Block_object_dispose(&v75, 8);
        if (v24)
        {
          if ([v4 isKeyAvailable:*v24])
          {
            uint64_t v27 = [v4 phoneticMiddleName];
            uint64_t v28 = [v27 copy];
            phoneticMiddleName = v5->_phoneticMiddleName;
            v5->_phoneticMiddleName = (NSString *)v28;
          }
          uint64_t v75 = 0;
          v76 = &v75;
          uint64_t v77 = 0x2020000000;
          v30 = (void *)getCNContactFamilyNameKeySymbolLoc_ptr;
          uint64_t v78 = getCNContactFamilyNameKeySymbolLoc_ptr;
          if (!getCNContactFamilyNameKeySymbolLoc_ptr)
          {
            uint64_t v70 = MEMORY[0x1E4F143A8];
            uint64_t v71 = 3221225472;
            v72 = __getCNContactFamilyNameKeySymbolLoc_block_invoke;
            v73 = &unk_1E555A528;
            v74 = &v75;
            objc_super v31 = (void *)ContactsLibrary();
            v32 = dlsym(v31, "CNContactFamilyNameKey");
            *(void *)(v74[1] + 24) = v32;
            getCNContactFamilyNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
            v30 = (void *)v76[3];
          }
          _Block_object_dispose(&v75, 8);
          if (v30)
          {
            if ([v4 isKeyAvailable:*v30])
            {
              v33 = [v4 familyName];
              uint64_t v34 = [v33 copy];
              familyName = v5->_familyName;
              v5->_familyName = (NSString *)v34;
            }
            uint64_t v75 = 0;
            v76 = &v75;
            uint64_t v77 = 0x2020000000;
            v36 = (void *)getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
            uint64_t v78 = getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
            if (!getCNContactPhoneticFamilyNameKeySymbolLoc_ptr)
            {
              uint64_t v70 = MEMORY[0x1E4F143A8];
              uint64_t v71 = 3221225472;
              v72 = __getCNContactPhoneticFamilyNameKeySymbolLoc_block_invoke;
              v73 = &unk_1E555A528;
              v74 = &v75;
              v37 = (void *)ContactsLibrary();
              v38 = dlsym(v37, "CNContactPhoneticFamilyNameKey");
              *(void *)(v74[1] + 24) = v38;
              getCNContactPhoneticFamilyNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
              v36 = (void *)v76[3];
            }
            _Block_object_dispose(&v75, 8);
            if (v36)
            {
              if ([v4 isKeyAvailable:*v36])
              {
                v39 = [v4 phoneticFamilyName];
                uint64_t v40 = [v39 copy];
                phoneticFamilyName = v5->_phoneticFamilyName;
                v5->_phoneticFamilyName = (NSString *)v40;
              }
              uint64_t v75 = 0;
              v76 = &v75;
              uint64_t v77 = 0x2020000000;
              v42 = (void *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
              uint64_t v78 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
              if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr)
              {
                uint64_t v70 = MEMORY[0x1E4F143A8];
                uint64_t v71 = 3221225472;
                v72 = __getCNContactPreviousFamilyNameKeySymbolLoc_block_invoke;
                v73 = &unk_1E555A528;
                v74 = &v75;
                v43 = (void *)ContactsLibrary();
                v44 = dlsym(v43, "CNContactPreviousFamilyNameKey");
                *(void *)(v74[1] + 24) = v44;
                getCNContactPreviousFamilyNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
                v42 = (void *)v76[3];
              }
              _Block_object_dispose(&v75, 8);
              if (v42)
              {
                if ([v4 isKeyAvailable:*v42])
                {
                  v45 = [v4 previousFamilyName];
                  uint64_t v46 = [v45 copy];
                  previousFamilyName = v5->_previousFamilyName;
                  v5->_previousFamilyName = (NSString *)v46;
                }
                uint64_t v75 = 0;
                v76 = &v75;
                uint64_t v77 = 0x2020000000;
                v48 = (void *)getCNContactOrganizationNameKeySymbolLoc_ptr;
                uint64_t v78 = getCNContactOrganizationNameKeySymbolLoc_ptr;
                if (!getCNContactOrganizationNameKeySymbolLoc_ptr)
                {
                  uint64_t v70 = MEMORY[0x1E4F143A8];
                  uint64_t v71 = 3221225472;
                  v72 = __getCNContactOrganizationNameKeySymbolLoc_block_invoke;
                  v73 = &unk_1E555A528;
                  v74 = &v75;
                  v49 = (void *)ContactsLibrary();
                  v50 = dlsym(v49, "CNContactOrganizationNameKey");
                  *(void *)(v74[1] + 24) = v50;
                  getCNContactOrganizationNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
                  v48 = (void *)v76[3];
                }
                _Block_object_dispose(&v75, 8);
                if (v48)
                {
                  if ([v4 isKeyAvailable:*v48])
                  {
                    v51 = [v4 organizationName];
                    uint64_t v52 = [v51 copy];
                    organizationName = v5->_organizationName;
                    v5->_organizationName = (NSString *)v52;
                  }
                  uint64_t v75 = 0;
                  v76 = &v75;
                  uint64_t v77 = 0x2020000000;
                  v54 = (void *)getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr;
                  uint64_t v78 = getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr;
                  if (!getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr)
                  {
                    uint64_t v70 = MEMORY[0x1E4F143A8];
                    uint64_t v71 = 3221225472;
                    v72 = __getCNContactPhoneticOrganizationNameKeySymbolLoc_block_invoke;
                    v73 = &unk_1E555A528;
                    v74 = &v75;
                    v55 = (void *)ContactsLibrary();
                    v56 = dlsym(v55, "CNContactPhoneticOrganizationNameKey");
                    *(void *)(v74[1] + 24) = v56;
                    getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
                    v54 = (void *)v76[3];
                  }
                  _Block_object_dispose(&v75, 8);
                  if (v54)
                  {
                    if ([v4 isKeyAvailable:*v54])
                    {
                      v57 = [v4 phoneticOrganizationName];
                      uint64_t v58 = [v57 copy];
                      phoneticOrganizationName = v5->_phoneticOrganizationName;
                      v5->_phoneticOrganizationName = (NSString *)v58;
                    }
                    uint64_t v75 = 0;
                    v76 = &v75;
                    uint64_t v77 = 0x2020000000;
                    v60 = (void *)getCNContactNicknameKeySymbolLoc_ptr;
                    uint64_t v78 = getCNContactNicknameKeySymbolLoc_ptr;
                    if (!getCNContactNicknameKeySymbolLoc_ptr)
                    {
                      uint64_t v70 = MEMORY[0x1E4F143A8];
                      uint64_t v71 = 3221225472;
                      v72 = __getCNContactNicknameKeySymbolLoc_block_invoke;
                      v73 = &unk_1E555A528;
                      v74 = &v75;
                      v61 = (void *)ContactsLibrary();
                      v62 = dlsym(v61, "CNContactNicknameKey");
                      *(void *)(v74[1] + 24) = v62;
                      getCNContactNicknameKeySymbolLoc_ptr = *(void *)(v74[1] + 24);
                      v60 = (void *)v76[3];
                    }
                    _Block_object_dispose(&v75, 8);
                    if (v60)
                    {
                      if ([v4 isKeyAvailable:*v60])
                      {
                        v63 = [v4 nickname];
                        uint64_t v64 = [v63 copy];
                        nickname = v5->_nickname;
                        v5->_nickname = (NSString *)v64;
                      }
                      v66 = v5;
                      goto LABEL_53;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  dlerror();
  uint64_t v68 = abort_report_np();
  return (TISupplementalPersonItem *)__getCNContactGivenNameKeySymbolLoc_block_invoke(v68);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end