@interface PPPBContact
+ (Class)emailAddressesType;
+ (Class)phoneNumbersType;
+ (Class)postalAddressesType;
+ (Class)socialProfilesType;
- (BOOL)hasBirthday;
- (BOOL)hasCreatedAt;
- (BOOL)hasDisplayNameOrder;
- (BOOL)hasFamilyName;
- (BOOL)hasGivenName;
- (BOOL)hasIdentifier;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickname;
- (BOOL)hasNonGregorianBirthday;
- (BOOL)hasOrganizationName;
- (BOOL)hasSortingFamilyName;
- (BOOL)hasSortingGivenName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)emailAddresses;
- (NSMutableArray)phoneNumbers;
- (NSMutableArray)postalAddresses;
- (NSMutableArray)socialProfiles;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)identifier;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)organizationName;
- (NSString)sortingFamilyName;
- (NSString)sortingGivenName;
- (PPPBDateComponents)birthday;
- (PPPBDateComponents)nonGregorianBirthday;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emailAddressesAtIndex:(unint64_t)a3;
- (id)phoneNumbersAtIndex:(unint64_t)a3;
- (id)postalAddressesAtIndex:(unint64_t)a3;
- (id)socialProfilesAtIndex:(unint64_t)a3;
- (int)displayNameOrder;
- (int64_t)createdAt;
- (unint64_t)emailAddressesCount;
- (unint64_t)hash;
- (unint64_t)phoneNumbersCount;
- (unint64_t)postalAddressesCount;
- (unint64_t)socialProfilesCount;
- (void)addEmailAddresses:(id)a3;
- (void)addPhoneNumbers:(id)a3;
- (void)addPostalAddresses:(id)a3;
- (void)addSocialProfiles:(id)a3;
- (void)clearEmailAddresses;
- (void)clearPhoneNumbers;
- (void)clearPostalAddresses;
- (void)clearSocialProfiles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setCreatedAt:(int64_t)a3;
- (void)setDisplayNameOrder:(int)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setHasCreatedAt:(BOOL)a3;
- (void)setHasDisplayNameOrder:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setNonGregorianBirthday:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPostalAddresses:(id)a3;
- (void)setSocialProfiles:(id)a3;
- (void)setSortingFamilyName:(id)a3;
- (void)setSortingGivenName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortingGivenName, 0);
  objc_storeStrong((id *)&self->_sortingFamilyName, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
}

- (int64_t)createdAt
{
  return self->_createdAt;
}

- (void)setSortingFamilyName:(id)a3
{
}

- (NSString)sortingFamilyName
{
  return self->_sortingFamilyName;
}

- (void)setSortingGivenName:(id)a3
{
}

- (NSString)sortingGivenName
{
  return self->_sortingGivenName;
}

- (int)displayNameOrder
{
  return self->_displayNameOrder;
}

- (void)setNameSuffix:(id)a3
{
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNamePrefix:(id)a3
{
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setSocialProfiles:(id)a3
{
}

- (NSMutableArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setNonGregorianBirthday:(id)a3
{
}

- (PPPBDateComponents)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (void)setBirthday:(id)a3
{
}

- (PPPBDateComponents)birthday
{
  return self->_birthday;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setPostalAddresses:(id)a3
{
}

- (NSMutableArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setNickname:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[PPPBContact setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 6)) {
    -[PPPBContact setGivenName:](self, "setGivenName:");
  }
  if (*((void *)v4 + 8)) {
    -[PPPBContact setMiddleName:](self, "setMiddleName:");
  }
  if (*((void *)v4 + 5)) {
    -[PPPBContact setFamilyName:](self, "setFamilyName:");
  }
  if (*((void *)v4 + 11)) {
    -[PPPBContact setNickname:](self, "setNickname:");
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = *((id *)v4 + 14);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PPPBContact *)self addPhoneNumbers:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PPPBContact *)self addEmailAddresses:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = *((id *)v4 + 15);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [(PPPBContact *)self addPostalAddresses:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 13)) {
    -[PPPBContact setOrganizationName:](self, "setOrganizationName:");
  }
  birthday = self->_birthday;
  uint64_t v21 = *((void *)v4 + 2);
  if (birthday)
  {
    if (v21) {
      -[PPPBDateComponents mergeFrom:](birthday, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[PPPBContact setBirthday:](self, "setBirthday:");
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  uint64_t v23 = *((void *)v4 + 12);
  if (nonGregorianBirthday)
  {
    if (v23) {
      -[PPPBDateComponents mergeFrom:](nonGregorianBirthday, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[PPPBContact setNonGregorianBirthday:](self, "setNonGregorianBirthday:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = *((id *)v4 + 16);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[PPPBContact addSocialProfiles:](self, "addSocialProfiles:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v26);
  }

  if (*((void *)v4 + 9)) {
    -[PPPBContact setNamePrefix:](self, "setNamePrefix:");
  }
  if (*((void *)v4 + 10)) {
    -[PPPBContact setNameSuffix:](self, "setNameSuffix:");
  }
  if ((*((unsigned char *)v4 + 152) & 2) != 0)
  {
    self->_displayNameOrder = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 18)) {
    -[PPPBContact setSortingGivenName:](self, "setSortingGivenName:");
  }
  if (*((void *)v4 + 17)) {
    -[PPPBContact setSortingFamilyName:](self, "setSortingFamilyName:");
  }
  if (*((unsigned char *)v4 + 152))
  {
    self->_createdAt = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v21 = [(NSString *)self->_identifier hash];
  NSUInteger v20 = [(NSString *)self->_givenName hash];
  NSUInteger v19 = [(NSString *)self->_middleName hash];
  NSUInteger v18 = [(NSString *)self->_familyName hash];
  NSUInteger v17 = [(NSString *)self->_nickname hash];
  uint64_t v16 = [(NSMutableArray *)self->_phoneNumbers hash];
  uint64_t v15 = [(NSMutableArray *)self->_emailAddresses hash];
  uint64_t v14 = [(NSMutableArray *)self->_postalAddresses hash];
  NSUInteger v13 = [(NSString *)self->_organizationName hash];
  unint64_t v3 = [(PPPBDateComponents *)self->_birthday hash];
  unint64_t v4 = [(PPPBDateComponents *)self->_nonGregorianBirthday hash];
  uint64_t v5 = [(NSMutableArray *)self->_socialProfiles hash];
  NSUInteger v6 = [(NSString *)self->_namePrefix hash];
  NSUInteger v7 = [(NSString *)self->_nameSuffix hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_displayNameOrder;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_sortingGivenName hash];
  NSUInteger v10 = [(NSString *)self->_sortingFamilyName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_createdAt;
  }
  else {
    uint64_t v11 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_43;
    }
  }
  givenName = self->_givenName;
  if ((unint64_t)givenName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](givenName, "isEqual:")) {
      goto LABEL_43;
    }
  }
  middleName = self->_middleName;
  if ((unint64_t)middleName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](middleName, "isEqual:")) {
      goto LABEL_43;
    }
  }
  familyName = self->_familyName;
  if ((unint64_t)familyName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](familyName, "isEqual:")) {
      goto LABEL_43;
    }
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](nickname, "isEqual:")) {
      goto LABEL_43;
    }
  }
  phoneNumbers = self->_phoneNumbers;
  if ((unint64_t)phoneNumbers | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](phoneNumbers, "isEqual:")) {
      goto LABEL_43;
    }
  }
  emailAddresses = self->_emailAddresses;
  if ((unint64_t)emailAddresses | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](emailAddresses, "isEqual:")) {
      goto LABEL_43;
    }
  }
  postalAddresses = self->_postalAddresses;
  if ((unint64_t)postalAddresses | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](postalAddresses, "isEqual:")) {
      goto LABEL_43;
    }
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_43;
    }
  }
  birthday = self->_birthday;
  if ((unint64_t)birthday | *((void *)v4 + 2))
  {
    if (!-[PPPBDateComponents isEqual:](birthday, "isEqual:")) {
      goto LABEL_43;
    }
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  if ((unint64_t)nonGregorianBirthday | *((void *)v4 + 12))
  {
    if (!-[PPPBDateComponents isEqual:](nonGregorianBirthday, "isEqual:")) {
      goto LABEL_43;
    }
  }
  socialProfiles = self->_socialProfiles;
  if ((unint64_t)socialProfiles | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](socialProfiles, "isEqual:")) {
      goto LABEL_43;
    }
  }
  namePrefix = self->_namePrefix;
  if ((unint64_t)namePrefix | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](namePrefix, "isEqual:")) {
      goto LABEL_43;
    }
  }
  nameSuffix = self->_nameSuffix;
  if ((unint64_t)nameSuffix | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](nameSuffix, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 2) == 0 || self->_displayNameOrder != *((_DWORD *)v4 + 6)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 2) != 0)
  {
LABEL_43:
    BOOL v21 = 0;
    goto LABEL_44;
  }
  sortingGivenName = self->_sortingGivenName;
  if ((unint64_t)sortingGivenName | *((void *)v4 + 18)
    && !-[NSString isEqual:](sortingGivenName, "isEqual:"))
  {
    goto LABEL_43;
  }
  sortingFamilyName = self->_sortingFamilyName;
  if ((unint64_t)sortingFamilyName | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](sortingFamilyName, "isEqual:")) {
      goto LABEL_43;
    }
  }
  BOOL v21 = (*((unsigned char *)v4 + 152) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 152) & 1) == 0 || self->_createdAt != *((void *)v4 + 1)) {
      goto LABEL_43;
    }
    BOOL v21 = 1;
  }
LABEL_44:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_givenName copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_middleName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_familyName copyWithZone:a3];
  NSUInteger v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_nickname copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v14;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v16 = self->_phoneNumbers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v68;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v68 != v19) {
          objc_enumerationMutation(v16);
        }
        BOOL v21 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v20) copyWithZone:a3];
        [(id)v5 addPhoneNumbers:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v18);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v22 = self->_emailAddresses;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v64;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v64 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v26) copyWithZone:a3];
        [(id)v5 addEmailAddresses:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v24);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v28 = self->_postalAddresses;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v60;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v60 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * v32) copyWithZone:a3];
        [(id)v5 addPostalAddresses:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [(NSString *)self->_organizationName copyWithZone:a3];
  long long v35 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v34;

  id v36 = [(PPPBDateComponents *)self->_birthday copyWithZone:a3];
  long long v37 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v36;

  id v38 = [(PPPBDateComponents *)self->_nonGregorianBirthday copyWithZone:a3];
  long long v39 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v38;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v40 = self->_socialProfiles;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v56;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * v44), "copyWithZone:", a3, (void)v55);
        [(id)v5 addSocialProfiles:v45];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v42);
  }

  uint64_t v46 = [(NSString *)self->_namePrefix copyWithZone:a3];
  v47 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v46;

  uint64_t v48 = [(NSString *)self->_nameSuffix copyWithZone:a3];
  uint64_t v49 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v48;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_displayNameOrder;
    *(unsigned char *)(v5 + 152) |= 2u;
  }
  uint64_t v50 = -[NSString copyWithZone:](self->_sortingGivenName, "copyWithZone:", a3, (void)v55);
  v51 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v50;

  uint64_t v52 = [(NSString *)self->_sortingFamilyName copyWithZone:a3];
  v53 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v52;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_createdAt;
    *(unsigned char *)(v5 + 152) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v21 = a3;
  if (self->_identifier) {
    objc_msgSend(v21, "setIdentifier:");
  }
  if (self->_givenName) {
    objc_msgSend(v21, "setGivenName:");
  }
  if (self->_middleName) {
    objc_msgSend(v21, "setMiddleName:");
  }
  if (self->_familyName) {
    objc_msgSend(v21, "setFamilyName:");
  }
  if (self->_nickname) {
    objc_msgSend(v21, "setNickname:");
  }
  if ([(PPPBContact *)self phoneNumbersCount])
  {
    [v21 clearPhoneNumbers];
    unint64_t v4 = [(PPPBContact *)self phoneNumbersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        NSUInteger v7 = [(PPPBContact *)self phoneNumbersAtIndex:i];
        [v21 addPhoneNumbers:v7];
      }
    }
  }
  if ([(PPPBContact *)self emailAddressesCount])
  {
    [v21 clearEmailAddresses];
    unint64_t v8 = [(PPPBContact *)self emailAddressesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PPPBContact *)self emailAddressesAtIndex:j];
        [v21 addEmailAddresses:v11];
      }
    }
  }
  if ([(PPPBContact *)self postalAddressesCount])
  {
    [v21 clearPostalAddresses];
    unint64_t v12 = [(PPPBContact *)self postalAddressesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(PPPBContact *)self postalAddressesAtIndex:k];
        [v21 addPostalAddresses:v15];
      }
    }
  }
  if (self->_organizationName) {
    objc_msgSend(v21, "setOrganizationName:");
  }
  if (self->_birthday) {
    objc_msgSend(v21, "setBirthday:");
  }
  if (self->_nonGregorianBirthday) {
    objc_msgSend(v21, "setNonGregorianBirthday:");
  }
  if ([(PPPBContact *)self socialProfilesCount])
  {
    [v21 clearSocialProfiles];
    unint64_t v16 = [(PPPBContact *)self socialProfilesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(PPPBContact *)self socialProfilesAtIndex:m];
        [v21 addSocialProfiles:v19];
      }
    }
  }
  if (self->_namePrefix) {
    objc_msgSend(v21, "setNamePrefix:");
  }
  uint64_t v20 = v21;
  if (self->_nameSuffix)
  {
    objc_msgSend(v21, "setNameSuffix:");
    uint64_t v20 = v21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v20[6] = self->_displayNameOrder;
    *((unsigned char *)v20 + 152) |= 2u;
  }
  if (self->_sortingGivenName)
  {
    objc_msgSend(v21, "setSortingGivenName:");
    uint64_t v20 = v21;
  }
  if (self->_sortingFamilyName)
  {
    objc_msgSend(v21, "setSortingFamilyName:");
    uint64_t v20 = v21;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v20 + 1) = self->_createdAt;
    *((unsigned char *)v20 + 152) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_givenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_middleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_familyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_nickname) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v5 = self->_phoneNumbers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_emailAddresses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_postalAddresses;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_birthday) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nonGregorianBirthday) {
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = self->_socialProfiles;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  if (self->_namePrefix) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameSuffix) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sortingGivenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_sortingFamilyName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  givenName = self->_givenName;
  if (givenName) {
    [v4 setObject:givenName forKey:@"givenName"];
  }
  middleName = self->_middleName;
  if (middleName) {
    [v4 setObject:middleName forKey:@"middleName"];
  }
  familyName = self->_familyName;
  if (familyName) {
    [v4 setObject:familyName forKey:@"familyName"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v4 setObject:nickname forKey:@"nickname"];
  }
  if ([(NSMutableArray *)self->_phoneNumbers count])
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_phoneNumbers, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v11 = self->_phoneNumbers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v63 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v62 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"phoneNumbers"];
  }
  if ([(NSMutableArray *)self->_emailAddresses count])
  {
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_emailAddresses, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v18 = self->_emailAddresses;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v59 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v58 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"emailAddresses"];
  }
  if ([(NSMutableArray *)self->_postalAddresses count])
  {
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_postalAddresses, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v25 = self->_postalAddresses;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [*(id *)(*((void *)&v54 + 1) + 8 * k) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v27);
    }

    [v4 setObject:v24 forKey:@"postalAddresses"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v4 setObject:organizationName forKey:@"organizationName"];
  }
  birthday = self->_birthday;
  if (birthday)
  {
    long long v33 = [(PPPBDateComponents *)birthday dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"birthday"];
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  if (nonGregorianBirthday)
  {
    long long v35 = [(PPPBDateComponents *)nonGregorianBirthday dictionaryRepresentation];
    [v4 setObject:v35 forKey:@"nonGregorianBirthday"];
  }
  if ([(NSMutableArray *)self->_socialProfiles count])
  {
    long long v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_socialProfiles, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v37 = self->_socialProfiles;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v51;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v51 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * m), "dictionaryRepresentation", (void)v50);
          [v36 addObject:v42];
        }
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v50 objects:v66 count:16];
      }
      while (v39);
    }

    [v4 setObject:v36 forKey:@"socialProfiles"];
  }
  namePrefix = self->_namePrefix;
  if (namePrefix) {
    [v4 setObject:namePrefix forKey:@"namePrefix"];
  }
  nameSuffix = self->_nameSuffix;
  if (nameSuffix) {
    [v4 setObject:nameSuffix forKey:@"nameSuffix"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v45 = [NSNumber numberWithInt:self->_displayNameOrder];
    [v4 setObject:v45 forKey:@"displayNameOrder"];
  }
  sortingGivenName = self->_sortingGivenName;
  if (sortingGivenName) {
    [v4 setObject:sortingGivenName forKey:@"sortingGivenName"];
  }
  sortingFamilyName = self->_sortingFamilyName;
  if (sortingFamilyName) {
    [v4 setObject:sortingFamilyName forKey:@"sortingFamilyName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v48 = [NSNumber numberWithLongLong:self->_createdAt];
    [v4 setObject:v48 forKey:@"created_at"];
  }
  return v4;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBContact;
  id v4 = [(PPPBContact *)&v8 description];
  unint64_t v5 = [(PPPBContact *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCreatedAt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreatedAt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreatedAt:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_createdAt = a3;
}

- (BOOL)hasSortingFamilyName
{
  return self->_sortingFamilyName != 0;
}

- (BOOL)hasSortingGivenName
{
  return self->_sortingGivenName != 0;
}

- (BOOL)hasDisplayNameOrder
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDisplayNameOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDisplayNameOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_displayNameOrder = a3;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (id)socialProfilesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_socialProfiles objectAtIndex:a3];
}

- (unint64_t)socialProfilesCount
{
  return [(NSMutableArray *)self->_socialProfiles count];
}

- (void)addSocialProfiles:(id)a3
{
  id v4 = a3;
  socialProfiles = self->_socialProfiles;
  id v8 = v4;
  if (!socialProfiles)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_socialProfiles;
    self->_socialProfiles = v6;

    id v4 = v8;
    socialProfiles = self->_socialProfiles;
  }
  [(NSMutableArray *)socialProfiles addObject:v4];
}

- (void)clearSocialProfiles
{
}

- (BOOL)hasNonGregorianBirthday
{
  return self->_nonGregorianBirthday != 0;
}

- (BOOL)hasBirthday
{
  return self->_birthday != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (id)postalAddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_postalAddresses objectAtIndex:a3];
}

- (unint64_t)postalAddressesCount
{
  return [(NSMutableArray *)self->_postalAddresses count];
}

- (void)addPostalAddresses:(id)a3
{
  id v4 = a3;
  postalAddresses = self->_postalAddresses;
  id v8 = v4;
  if (!postalAddresses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_postalAddresses;
    self->_postalAddresses = v6;

    id v4 = v8;
    postalAddresses = self->_postalAddresses;
  }
  [(NSMutableArray *)postalAddresses addObject:v4];
}

- (void)clearPostalAddresses
{
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_emailAddresses objectAtIndex:a3];
}

- (unint64_t)emailAddressesCount
{
  return [(NSMutableArray *)self->_emailAddresses count];
}

- (void)addEmailAddresses:(id)a3
{
  id v4 = a3;
  emailAddresses = self->_emailAddresses;
  id v8 = v4;
  if (!emailAddresses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    id v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  [(NSMutableArray *)emailAddresses addObject:v4];
}

- (void)clearEmailAddresses
{
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_phoneNumbers objectAtIndex:a3];
}

- (unint64_t)phoneNumbersCount
{
  return [(NSMutableArray *)self->_phoneNumbers count];
}

- (void)addPhoneNumbers:(id)a3
{
  id v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  id v8 = v4;
  if (!phoneNumbers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    id v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  [(NSMutableArray *)phoneNumbers addObject:v4];
}

- (void)clearPhoneNumbers
{
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)socialProfilesType
{
  return (Class)objc_opt_class();
}

+ (Class)postalAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

@end