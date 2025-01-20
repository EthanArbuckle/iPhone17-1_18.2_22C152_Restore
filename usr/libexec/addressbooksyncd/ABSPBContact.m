@interface ABSPBContact
+ (Class)addressesType;
+ (Class)emailsType;
+ (Class)phoneNumbersType;
+ (Class)urlsType;
+ (id)toPBContact:(id)a3;
- (ABSPBAlert)callAlert;
- (ABSPBAlert)textAlert;
- (ABSPBDate)birthday;
- (ABSPBDate)nonGregorianBirthday;
- (BOOL)hasBirthday;
- (BOOL)hasCallAlert;
- (BOOL)hasDepartmentName;
- (BOOL)hasFamilyName;
- (BOOL)hasGivenName;
- (BOOL)hasIdentifier;
- (BOOL)hasJobTitle;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickname;
- (BOOL)hasNonGregorianBirthday;
- (BOOL)hasNote;
- (BOOL)hasOrganizationName;
- (BOOL)hasPhonemeData;
- (BOOL)hasPhoneticFamilyName;
- (BOOL)hasPhoneticGivenName;
- (BOOL)hasPhoneticMiddleName;
- (BOOL)hasPhoneticOrganizationName;
- (BOOL)hasPreferredChannel;
- (BOOL)hasPreviousFamilyName;
- (BOOL)hasPronunciationFamilyName;
- (BOOL)hasPronunciationGivenName;
- (BOOL)hasTextAlert;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)addresses;
- (NSMutableArray)emails;
- (NSMutableArray)phoneNumbers;
- (NSMutableArray)urls;
- (NSString)departmentName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)identifier;
- (NSString)jobTitle;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)note;
- (NSString)organizationName;
- (NSString)phonemeData;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticOrganizationName;
- (NSString)preferredChannel;
- (NSString)previousFamilyName;
- (NSString)pronunciationFamilyName;
- (NSString)pronunciationGivenName;
- (id)addressesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emailsAtIndex:(unint64_t)a3;
- (id)phoneNumbersAtIndex:(unint64_t)a3;
- (id)toContact;
- (id)urlsAtIndex:(unint64_t)a3;
- (unint64_t)addressesCount;
- (unint64_t)emailsCount;
- (unint64_t)hash;
- (unint64_t)phoneNumbersCount;
- (unint64_t)urlsCount;
- (void)addAddresses:(id)a3;
- (void)addEmails:(id)a3;
- (void)addPhoneNumbers:(id)a3;
- (void)addUrls:(id)a3;
- (void)clearAddresses;
- (void)clearEmails;
- (void)clearPhoneNumbers;
- (void)clearUrls;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setCallAlert:(id)a3;
- (void)setDepartmentName:(id)a3;
- (void)setEmails:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setJobTitle:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setNonGregorianBirthday:(id)a3;
- (void)setNote:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPhonemeData:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setPhoneticOrganizationName:(id)a3;
- (void)setPreferredChannel:(id)a3;
- (void)setPreviousFamilyName:(id)a3;
- (void)setPronunciationFamilyName:(id)a3;
- (void)setPronunciationGivenName:(id)a3;
- (void)setTextAlert:(id)a3;
- (void)setUrls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBContact

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasPreviousFamilyName
{
  return self->_previousFamilyName != 0;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasDepartmentName
{
  return self->_departmentName != 0;
}

- (BOOL)hasJobTitle
{
  return self->_jobTitle != 0;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (BOOL)hasBirthday
{
  return self->_birthday != 0;
}

- (BOOL)hasNonGregorianBirthday
{
  return self->_nonGregorianBirthday != 0;
}

- (BOOL)hasPhoneticOrganizationName
{
  return self->_phoneticOrganizationName != 0;
}

- (BOOL)hasPhoneticFamilyName
{
  return self->_phoneticFamilyName != 0;
}

- (BOOL)hasPhoneticGivenName
{
  return self->_phoneticGivenName != 0;
}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (BOOL)hasPronunciationGivenName
{
  return self->_pronunciationGivenName != 0;
}

- (BOOL)hasPronunciationFamilyName
{
  return self->_pronunciationFamilyName != 0;
}

- (BOOL)hasPhonemeData
{
  return self->_phonemeData != 0;
}

- (BOOL)hasCallAlert
{
  return self->_callAlert != 0;
}

- (BOOL)hasTextAlert
{
  return self->_textAlert != 0;
}

- (void)clearPhoneNumbers
{
}

- (void)addPhoneNumbers:(id)a3
{
  id v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  id v8 = v4;
  if (!phoneNumbers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    id v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  [(NSMutableArray *)phoneNumbers addObject:v4];
}

- (unint64_t)phoneNumbersCount
{
  return (unint64_t)[(NSMutableArray *)self->_phoneNumbers count];
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_phoneNumbers objectAtIndex:a3];
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

- (void)clearUrls
{
}

- (void)addUrls:(id)a3
{
  id v4 = a3;
  urls = self->_urls;
  id v8 = v4;
  if (!urls)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_urls;
    self->_urls = v6;

    id v4 = v8;
    urls = self->_urls;
  }
  [(NSMutableArray *)urls addObject:v4];
}

- (unint64_t)urlsCount
{
  return (unint64_t)[(NSMutableArray *)self->_urls count];
}

- (id)urlsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_urls objectAtIndex:a3];
}

+ (Class)urlsType
{
  return (Class)objc_opt_class();
}

- (void)clearEmails
{
}

- (void)addEmails:(id)a3
{
  id v4 = a3;
  emails = self->_emails;
  id v8 = v4;
  if (!emails)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_emails;
    self->_emails = v6;

    id v4 = v8;
    emails = self->_emails;
  }
  [(NSMutableArray *)emails addObject:v4];
}

- (unint64_t)emailsCount
{
  return (unint64_t)[(NSMutableArray *)self->_emails count];
}

- (id)emailsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_emails objectAtIndex:a3];
}

+ (Class)emailsType
{
  return (Class)objc_opt_class();
}

- (void)clearAddresses
{
}

- (void)addAddresses:(id)a3
{
  id v4 = a3;
  addresses = self->_addresses;
  id v8 = v4;
  if (!addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_addresses;
    self->_addresses = v6;

    id v4 = v8;
    addresses = self->_addresses;
  }
  [(NSMutableArray *)addresses addObject:v4];
}

- (unint64_t)addressesCount
{
  return (unint64_t)[(NSMutableArray *)self->_addresses count];
}

- (id)addressesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_addresses objectAtIndex:a3];
}

+ (Class)addressesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPreferredChannel
{
  return self->_preferredChannel != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBContact;
  v3 = [(ABSPBContact *)&v7 description];
  id v4 = [(ABSPBContact *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  namePrefix = self->_namePrefix;
  if (namePrefix) {
    [v4 setObject:namePrefix forKey:@"namePrefix"];
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
  previousFamilyName = self->_previousFamilyName;
  if (previousFamilyName) {
    [v4 setObject:previousFamilyName forKey:@"previousFamilyName"];
  }
  nameSuffix = self->_nameSuffix;
  if (nameSuffix) {
    [v4 setObject:nameSuffix forKey:@"nameSuffix"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v4 setObject:nickname forKey:@"nickname"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v4 setObject:organizationName forKey:@"organizationName"];
  }
  departmentName = self->_departmentName;
  if (departmentName) {
    [v4 setObject:departmentName forKey:@"departmentName"];
  }
  jobTitle = self->_jobTitle;
  if (jobTitle) {
    [v4 setObject:jobTitle forKey:@"jobTitle"];
  }
  note = self->_note;
  if (note) {
    [v4 setObject:note forKey:@"note"];
  }
  birthday = self->_birthday;
  if (birthday)
  {
    v18 = [(ABSPBDate *)birthday dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"birthday"];
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  if (nonGregorianBirthday)
  {
    v20 = [(ABSPBDate *)nonGregorianBirthday dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"nonGregorianBirthday"];
  }
  phoneticOrganizationName = self->_phoneticOrganizationName;
  if (phoneticOrganizationName) {
    [v4 setObject:phoneticOrganizationName forKey:@"phoneticOrganizationName"];
  }
  phoneticFamilyName = self->_phoneticFamilyName;
  if (phoneticFamilyName) {
    [v4 setObject:phoneticFamilyName forKey:@"phoneticFamilyName"];
  }
  phoneticGivenName = self->_phoneticGivenName;
  if (phoneticGivenName) {
    [v4 setObject:phoneticGivenName forKey:@"phoneticGivenName"];
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if (phoneticMiddleName) {
    [v4 setObject:phoneticMiddleName forKey:@"phoneticMiddleName"];
  }
  pronunciationGivenName = self->_pronunciationGivenName;
  if (pronunciationGivenName) {
    [v4 setObject:pronunciationGivenName forKey:@"pronunciationGivenName"];
  }
  pronunciationFamilyName = self->_pronunciationFamilyName;
  if (pronunciationFamilyName) {
    [v4 setObject:pronunciationFamilyName forKey:@"pronunciationFamilyName"];
  }
  phonemeData = self->_phonemeData;
  if (phonemeData) {
    [v4 setObject:phonemeData forKey:@"phonemeData"];
  }
  callAlert = self->_callAlert;
  if (callAlert)
  {
    v29 = [(ABSPBAlert *)callAlert dictionaryRepresentation];
    [v4 setObject:v29 forKey:@"callAlert"];
  }
  textAlert = self->_textAlert;
  if (textAlert)
  {
    v31 = [(ABSPBAlert *)textAlert dictionaryRepresentation];
    [v4 setObject:v31 forKey:@"textAlert"];
  }
  if ([(NSMutableArray *)self->_phoneNumbers count])
  {
    id v32 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_phoneNumbers, "count")];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v33 = self->_phoneNumbers;
    id v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v75 objects:v82 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v76;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v76 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v75 + 1) + 8 * i) dictionaryRepresentation];
          [v32 addObject:v38];
        }
        id v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v75 objects:v82 count:16];
      }
      while (v35);
    }

    [v4 setObject:v32 forKey:@"phoneNumbers"];
  }
  if ([(NSMutableArray *)self->_urls count])
  {
    id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_urls, "count")];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v40 = self->_urls;
    id v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v71 objects:v81 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v72;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v72 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v71 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        id v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v71 objects:v81 count:16];
      }
      while (v42);
    }

    [v4 setObject:v39 forKey:@"urls"];
  }
  if ([(NSMutableArray *)self->_emails count])
  {
    id v46 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_emails, "count")];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v47 = self->_emails;
    id v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v67 objects:v80 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v68;
      do
      {
        for (k = 0; k != v49; k = (char *)k + 1)
        {
          if (*(void *)v68 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v46 addObject:v52];
        }
        id v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v67 objects:v80 count:16];
      }
      while (v49);
    }

    [v4 setObject:v46 forKey:@"emails"];
  }
  if ([(NSMutableArray *)self->_addresses count])
  {
    id v53 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_addresses, "count")];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v54 = self->_addresses;
    id v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v64;
      do
      {
        for (m = 0; m != v56; m = (char *)m + 1)
        {
          if (*(void *)v64 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)m) dictionaryRepresentation:v63];
          [v53 addObject:v59];
        }
        id v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v63 objects:v79 count:16];
      }
      while (v56);
    }

    [v4 setObject:v53 forKey:@"addresses"];
  }
  preferredChannel = self->_preferredChannel;
  if (preferredChannel) {
    [v4 setObject:preferredChannel forKey:@"preferredChannel"];
  }
  id v61 = v4;

  return v61;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBContactReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_namePrefix) {
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
  if (self->_previousFamilyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameSuffix) {
    PBDataWriterWriteStringField();
  }
  if (self->_nickname) {
    PBDataWriterWriteStringField();
  }
  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_departmentName) {
    PBDataWriterWriteStringField();
  }
  if (self->_jobTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_note) {
    PBDataWriterWriteStringField();
  }
  if (self->_birthday) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nonGregorianBirthday) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_phoneticOrganizationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticFamilyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticGivenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticMiddleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_pronunciationGivenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_pronunciationFamilyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phonemeData) {
    PBDataWriterWriteStringField();
  }
  if (self->_callAlert) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_textAlert) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_phoneNumbers;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = self->_urls;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_emails;
  v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_addresses;
  v21 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  if (self->_preferredChannel) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_identifier) {
    [v20 setIdentifier:];
  }
  if (self->_namePrefix) {
    [v20 setNamePrefix:];
  }
  if (self->_givenName) {
    [v20 setGivenName:];
  }
  if (self->_middleName) {
    [v20 setMiddleName:];
  }
  if (self->_familyName) {
    [v20 setFamilyName:];
  }
  if (self->_previousFamilyName) {
    [v20 setPreviousFamilyName:];
  }
  if (self->_nameSuffix) {
    [v20 setNameSuffix:];
  }
  if (self->_nickname) {
    [v20 setNickname:];
  }
  if (self->_organizationName) {
    [v20 setOrganizationName:];
  }
  if (self->_departmentName) {
    [v20 setDepartmentName:];
  }
  if (self->_jobTitle) {
    [v20 setJobTitle:];
  }
  if (self->_note) {
    [v20 setNote:];
  }
  if (self->_birthday) {
    [v20 setBirthday:];
  }
  if (self->_nonGregorianBirthday) {
    [v20 setNonGregorianBirthday:];
  }
  if (self->_phoneticOrganizationName) {
    [v20 setPhoneticOrganizationName:];
  }
  if (self->_phoneticFamilyName) {
    [v20 setPhoneticFamilyName:];
  }
  if (self->_phoneticGivenName) {
    [v20 setPhoneticGivenName:];
  }
  if (self->_phoneticMiddleName) {
    [v20 setPhoneticMiddleName:];
  }
  if (self->_pronunciationGivenName) {
    [v20 setPronunciationGivenName:];
  }
  if (self->_pronunciationFamilyName) {
    [v20 setPronunciationFamilyName:];
  }
  if (self->_phonemeData) {
    [v20 setPhonemeData:];
  }
  if (self->_callAlert) {
    [v20 setCallAlert:];
  }
  if (self->_textAlert) {
    [v20 setTextAlert:];
  }
  if ([(ABSPBContact *)self phoneNumbersCount])
  {
    [v20 clearPhoneNumbers];
    unint64_t v4 = [(ABSPBContact *)self phoneNumbersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(ABSPBContact *)self phoneNumbersAtIndex:i];
        [v20 addPhoneNumbers:v7];
      }
    }
  }
  if ([(ABSPBContact *)self urlsCount])
  {
    [v20 clearUrls];
    unint64_t v8 = [(ABSPBContact *)self urlsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(ABSPBContact *)self urlsAtIndex:j];
        [v20 addUrls:v11];
      }
    }
  }
  if ([(ABSPBContact *)self emailsCount])
  {
    [v20 clearEmails];
    unint64_t v12 = [(ABSPBContact *)self emailsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(ABSPBContact *)self emailsAtIndex:k];
        [v20 addEmails:v15];
      }
    }
  }
  if ([(ABSPBContact *)self addressesCount])
  {
    [v20 clearAddresses];
    unint64_t v16 = [(ABSPBContact *)self addressesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        v19 = [(ABSPBContact *)self addressesAtIndex:m];
        [v20 addAddresses:v19];
      }
    }
  }
  if (self->_preferredChannel) {
    [v20 setPreferredChannel:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(NSString *)self->_namePrefix copyWithZone:a3];
  unint64_t v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = [(NSString *)self->_givenName copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(NSString *)self->_middleName copyWithZone:a3];
  unint64_t v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = [(NSString *)self->_familyName copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  id v16 = [(NSString *)self->_previousFamilyName copyWithZone:a3];
  unint64_t v17 = (void *)v5[24];
  v5[24] = v16;

  id v18 = [(NSString *)self->_nameSuffix copyWithZone:a3];
  v19 = (void *)v5[12];
  v5[12] = v18;

  id v20 = [(NSString *)self->_nickname copyWithZone:a3];
  v21 = (void *)v5[13];
  v5[13] = v20;

  id v22 = [(NSString *)self->_organizationName copyWithZone:a3];
  uint64_t v23 = (void *)v5[16];
  v5[16] = v22;

  id v24 = [(NSString *)self->_departmentName copyWithZone:a3];
  long long v25 = (void *)v5[4];
  v5[4] = v24;

  id v26 = [(NSString *)self->_jobTitle copyWithZone:a3];
  long long v27 = (void *)v5[9];
  v5[9] = v26;

  id v28 = [(NSString *)self->_note copyWithZone:a3];
  long long v29 = (void *)v5[15];
  v5[15] = v28;

  id v30 = [(ABSPBDate *)self->_birthday copyWithZone:a3];
  long long v31 = (void *)v5[2];
  v5[2] = v30;

  id v32 = [(ABSPBDate *)self->_nonGregorianBirthday copyWithZone:a3];
  long long v33 = (void *)v5[14];
  v5[14] = v32;

  id v34 = [(NSString *)self->_phoneticOrganizationName copyWithZone:a3];
  long long v35 = (void *)v5[22];
  v5[22] = v34;

  id v36 = [(NSString *)self->_phoneticFamilyName copyWithZone:a3];
  long long v37 = (void *)v5[19];
  v5[19] = v36;

  id v38 = [(NSString *)self->_phoneticGivenName copyWithZone:a3];
  long long v39 = (void *)v5[20];
  v5[20] = v38;

  id v40 = [(NSString *)self->_phoneticMiddleName copyWithZone:a3];
  id v41 = (void *)v5[21];
  v5[21] = v40;

  id v42 = [(NSString *)self->_pronunciationGivenName copyWithZone:a3];
  uint64_t v43 = (void *)v5[26];
  v5[26] = v42;

  id v44 = [(NSString *)self->_pronunciationFamilyName copyWithZone:a3];
  v45 = (void *)v5[25];
  v5[25] = v44;

  id v46 = [(NSString *)self->_phonemeData copyWithZone:a3];
  v47 = (void *)v5[18];
  v5[18] = v46;

  id v48 = [(ABSPBAlert *)self->_callAlert copyWithZone:a3];
  id v49 = (void *)v5[3];
  v5[3] = v48;

  id v50 = [(ABSPBAlert *)self->_textAlert copyWithZone:a3];
  v51 = (void *)v5[27];
  v5[27] = v50;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v52 = self->_phoneNumbers;
  id v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v91 objects:v98 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v92;
    do
    {
      id v56 = 0;
      do
      {
        if (*(void *)v92 != v55) {
          objc_enumerationMutation(v52);
        }
        id v57 = [*(id *)(*((void *)&v91 + 1) + 8 * (void)v56) copyWithZone:a3];
        [v5 addPhoneNumbers:v57];

        id v56 = (char *)v56 + 1;
      }
      while (v54 != v56);
      id v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v91 objects:v98 count:16];
    }
    while (v54);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v58 = self->_urls;
  id v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v87 objects:v97 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v88;
    do
    {
      v62 = 0;
      do
      {
        if (*(void *)v88 != v61) {
          objc_enumerationMutation(v58);
        }
        id v63 = [*(id *)(*((void *)&v87 + 1) + 8 * (void)v62) copyWithZone:a3];
        [v5 addUrls:v63];

        v62 = (char *)v62 + 1;
      }
      while (v60 != v62);
      id v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v87 objects:v97 count:16];
    }
    while (v60);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v64 = self->_emails;
  id v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v83 objects:v96 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v84;
    do
    {
      long long v68 = 0;
      do
      {
        if (*(void *)v84 != v67) {
          objc_enumerationMutation(v64);
        }
        id v69 = [*(id *)(*((void *)&v83 + 1) + 8 * (void)v68) copyWithZone:a3];
        [v5 addEmails:v69];

        long long v68 = (char *)v68 + 1;
      }
      while (v66 != v68);
      id v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v83 objects:v96 count:16];
    }
    while (v66);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v70 = self->_addresses;
  id v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (v71)
  {
    id v72 = v71;
    uint64_t v73 = *(void *)v80;
    do
    {
      long long v74 = 0;
      do
      {
        if (*(void *)v80 != v73) {
          objc_enumerationMutation(v70);
        }
        id v75 = [*(id *)(*((void *)&v79 + 1) + 8 * (void)v74) copyWithZone:a3];
        [v5 addAddresses:v75];

        long long v74 = (char *)v74 + 1;
      }
      while (v72 != v74);
      id v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v79 objects:v95 count:16];
    }
    while (v72);
  }

  id v76 = [(NSString *)self->_preferredChannel copyWithZone:a3];
  long long v77 = (void *)v5[23];
  v5[23] = v76;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | v4[8])
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_58;
    }
  }
  namePrefix = self->_namePrefix;
  if ((unint64_t)namePrefix | v4[11] && !-[NSString isEqual:](namePrefix, "isEqual:")) {
    goto LABEL_58;
  }
  givenName = self->_givenName;
  if ((unint64_t)givenName | v4[7] && !-[NSString isEqual:](givenName, "isEqual:")) {
    goto LABEL_58;
  }
  middleName = self->_middleName;
  if ((unint64_t)middleName | v4[10] && !-[NSString isEqual:](middleName, "isEqual:")) {
    goto LABEL_58;
  }
  familyName = self->_familyName;
  if ((unint64_t)familyName | v4[6] && !-[NSString isEqual:](familyName, "isEqual:")) {
    goto LABEL_58;
  }
  previousFamilyName = self->_previousFamilyName;
  if ((unint64_t)previousFamilyName | v4[24]
    && !-[NSString isEqual:](previousFamilyName, "isEqual:"))
  {
    goto LABEL_58;
  }
  nameSuffix = self->_nameSuffix;
  if ((unint64_t)nameSuffix | v4[12] && !-[NSString isEqual:](nameSuffix, "isEqual:")) {
    goto LABEL_58;
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | v4[13] && !-[NSString isEqual:](nickname, "isEqual:")) {
    goto LABEL_58;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | v4[16] && !-[NSString isEqual:](organizationName, "isEqual:")) {
    goto LABEL_58;
  }
  departmentName = self->_departmentName;
  if ((unint64_t)departmentName | v4[4] && !-[NSString isEqual:](departmentName, "isEqual:")) {
    goto LABEL_58;
  }
  jobTitle = self->_jobTitle;
  if ((unint64_t)jobTitle | v4[9] && !-[NSString isEqual:](jobTitle, "isEqual:")) {
    goto LABEL_58;
  }
  note = self->_note;
  if ((unint64_t)note | v4[15] && !-[NSString isEqual:](note, "isEqual:")) {
    goto LABEL_58;
  }
  birthday = self->_birthday;
  if ((unint64_t)birthday | v4[2] && !-[ABSPBDate isEqual:](birthday, "isEqual:")) {
    goto LABEL_58;
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  if ((unint64_t)nonGregorianBirthday | v4[14] && !-[ABSPBDate isEqual:](nonGregorianBirthday, "isEqual:")) {
    goto LABEL_58;
  }
  phoneticOrganizationName = self->_phoneticOrganizationName;
  if ((unint64_t)phoneticOrganizationName | v4[22]
    && !-[NSString isEqual:](phoneticOrganizationName, "isEqual:"))
  {
    goto LABEL_58;
  }
  phoneticFamilyName = self->_phoneticFamilyName;
  if ((unint64_t)phoneticFamilyName | v4[19]
    && !-[NSString isEqual:](phoneticFamilyName, "isEqual:"))
  {
    goto LABEL_58;
  }
  phoneticGivenName = self->_phoneticGivenName;
  if ((unint64_t)phoneticGivenName | v4[20]
    && !-[NSString isEqual:](phoneticGivenName, "isEqual:"))
  {
    goto LABEL_58;
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if ((unint64_t)phoneticMiddleName | v4[21]
    && !-[NSString isEqual:](phoneticMiddleName, "isEqual:"))
  {
    goto LABEL_58;
  }
  pronunciationGivenName = self->_pronunciationGivenName;
  if ((unint64_t)pronunciationGivenName | v4[26]
    && !-[NSString isEqual:](pronunciationGivenName, "isEqual:"))
  {
    goto LABEL_58;
  }
  pronunciationFamilyName = self->_pronunciationFamilyName;
  if ((unint64_t)pronunciationFamilyName | v4[25]
    && !-[NSString isEqual:](pronunciationFamilyName, "isEqual:"))
  {
    goto LABEL_58;
  }
  if (((phonemeData = self->_phonemeData, !((unint64_t)phonemeData | v4[18]))
     || -[NSString isEqual:](phonemeData, "isEqual:"))
    && ((callAlert = self->_callAlert, !((unint64_t)callAlert | v4[3]))
     || -[ABSPBAlert isEqual:](callAlert, "isEqual:"))
    && ((textAlert = self->_textAlert, !((unint64_t)textAlert | v4[27]))
     || -[ABSPBAlert isEqual:](textAlert, "isEqual:"))
    && ((phoneNumbers = self->_phoneNumbers, !((unint64_t)phoneNumbers | v4[17]))
     || -[NSMutableArray isEqual:](phoneNumbers, "isEqual:"))
    && ((urls = self->_urls, !((unint64_t)urls | v4[28]))
     || -[NSMutableArray isEqual:](urls, "isEqual:"))
    && ((emails = self->_emails, !((unint64_t)emails | v4[5]))
     || -[NSMutableArray isEqual:](emails, "isEqual:"))
    && ((addresses = self->_addresses, !((unint64_t)addresses | v4[1]))
     || -[NSMutableArray isEqual:](addresses, "isEqual:")))
  {
    preferredChannel = self->_preferredChannel;
    if ((unint64_t)preferredChannel | v4[23]) {
      unsigned __int8 v33 = -[NSString isEqual:](preferredChannel, "isEqual:");
    }
    else {
      unsigned __int8 v33 = 1;
    }
  }
  else
  {
LABEL_58:
    unsigned __int8 v33 = 0;
  }

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(NSString *)self->_namePrefix hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_givenName hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_middleName hash];
  NSUInteger v7 = [(NSString *)self->_familyName hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_previousFamilyName hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_nameSuffix hash];
  NSUInteger v10 = [(NSString *)self->_nickname hash];
  unint64_t v11 = v10 ^ [(NSString *)self->_organizationName hash];
  unint64_t v12 = v11 ^ [(NSString *)self->_departmentName hash];
  unint64_t v13 = v9 ^ v12 ^ [(NSString *)self->_jobTitle hash];
  NSUInteger v14 = [(NSString *)self->_note hash];
  unint64_t v15 = v14 ^ [(ABSPBDate *)self->_birthday hash];
  unint64_t v16 = v15 ^ [(ABSPBDate *)self->_nonGregorianBirthday hash];
  unint64_t v17 = v16 ^ [(NSString *)self->_phoneticOrganizationName hash];
  unint64_t v18 = v13 ^ v17 ^ [(NSString *)self->_phoneticFamilyName hash];
  NSUInteger v19 = [(NSString *)self->_phoneticGivenName hash];
  unint64_t v20 = v19 ^ [(NSString *)self->_phoneticMiddleName hash];
  unint64_t v21 = v20 ^ [(NSString *)self->_pronunciationGivenName hash];
  unint64_t v22 = v21 ^ [(NSString *)self->_pronunciationFamilyName hash];
  unint64_t v23 = v22 ^ [(NSString *)self->_phonemeData hash];
  unint64_t v24 = v18 ^ v23 ^ [(ABSPBAlert *)self->_callAlert hash];
  unint64_t v25 = [(ABSPBAlert *)self->_textAlert hash];
  unint64_t v26 = v25 ^ (unint64_t)[(NSMutableArray *)self->_phoneNumbers hash];
  unint64_t v27 = v26 ^ (unint64_t)[(NSMutableArray *)self->_urls hash];
  unint64_t v28 = v27 ^ (unint64_t)[(NSMutableArray *)self->_emails hash];
  unint64_t v29 = v28 ^ (unint64_t)[(NSMutableArray *)self->_addresses hash];
  return v24 ^ v29 ^ [(NSString *)self->_preferredChannel hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[ABSPBContact setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 11)) {
    -[ABSPBContact setNamePrefix:](self, "setNamePrefix:");
  }
  if (*((void *)v4 + 7)) {
    -[ABSPBContact setGivenName:](self, "setGivenName:");
  }
  if (*((void *)v4 + 10)) {
    -[ABSPBContact setMiddleName:](self, "setMiddleName:");
  }
  if (*((void *)v4 + 6)) {
    -[ABSPBContact setFamilyName:](self, "setFamilyName:");
  }
  if (*((void *)v4 + 24)) {
    -[ABSPBContact setPreviousFamilyName:](self, "setPreviousFamilyName:");
  }
  if (*((void *)v4 + 12)) {
    -[ABSPBContact setNameSuffix:](self, "setNameSuffix:");
  }
  if (*((void *)v4 + 13)) {
    -[ABSPBContact setNickname:](self, "setNickname:");
  }
  if (*((void *)v4 + 16)) {
    -[ABSPBContact setOrganizationName:](self, "setOrganizationName:");
  }
  if (*((void *)v4 + 4)) {
    -[ABSPBContact setDepartmentName:](self, "setDepartmentName:");
  }
  if (*((void *)v4 + 9)) {
    -[ABSPBContact setJobTitle:](self, "setJobTitle:");
  }
  if (*((void *)v4 + 15)) {
    -[ABSPBContact setNote:](self, "setNote:");
  }
  birthday = self->_birthday;
  uint64_t v6 = *((void *)v4 + 2);
  if (birthday)
  {
    if (v6) {
      -[ABSPBDate mergeFrom:](birthday, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ABSPBContact setBirthday:](self, "setBirthday:");
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  uint64_t v8 = *((void *)v4 + 14);
  if (nonGregorianBirthday)
  {
    if (v8) {
      -[ABSPBDate mergeFrom:](nonGregorianBirthday, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ABSPBContact setNonGregorianBirthday:](self, "setNonGregorianBirthday:");
  }
  if (*((void *)v4 + 22)) {
    -[ABSPBContact setPhoneticOrganizationName:](self, "setPhoneticOrganizationName:");
  }
  if (*((void *)v4 + 19)) {
    -[ABSPBContact setPhoneticFamilyName:](self, "setPhoneticFamilyName:");
  }
  if (*((void *)v4 + 20)) {
    -[ABSPBContact setPhoneticGivenName:](self, "setPhoneticGivenName:");
  }
  if (*((void *)v4 + 21)) {
    -[ABSPBContact setPhoneticMiddleName:](self, "setPhoneticMiddleName:");
  }
  if (*((void *)v4 + 26)) {
    -[ABSPBContact setPronunciationGivenName:](self, "setPronunciationGivenName:");
  }
  if (*((void *)v4 + 25)) {
    -[ABSPBContact setPronunciationFamilyName:](self, "setPronunciationFamilyName:");
  }
  if (*((void *)v4 + 18)) {
    -[ABSPBContact setPhonemeData:](self, "setPhonemeData:");
  }
  callAlert = self->_callAlert;
  uint64_t v10 = *((void *)v4 + 3);
  if (callAlert)
  {
    if (v10) {
      -[ABSPBAlert mergeFrom:](callAlert, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[ABSPBContact setCallAlert:](self, "setCallAlert:");
  }
  textAlert = self->_textAlert;
  uint64_t v12 = *((void *)v4 + 27);
  if (textAlert)
  {
    if (v12) {
      -[ABSPBAlert mergeFrom:](textAlert, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ABSPBContact setTextAlert:](self, "setTextAlert:");
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = *((id *)v4 + 17);
  id v14 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        [(ABSPBContact *)self addPhoneNumbers:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      id v15 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v15);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = *((id *)v4 + 28);
  id v19 = [v18 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v20; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        [(ABSPBContact *)self addUrls:*(void *)(*((void *)&v41 + 1) + 8 * (void)j)];
      }
      id v20 = [v18 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v20);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = *((id *)v4 + 5);
  id v24 = [v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v25; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v23);
        }
        [(ABSPBContact *)self addEmails:*(void *)(*((void *)&v37 + 1) + 8 * (void)k)];
      }
      id v25 = [v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v25);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v28 = *((id *)v4 + 1);
  id v29 = [v28 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v30; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        -[ABSPBContact addAddresses:](self, "addAddresses:", *(void *)(*((void *)&v33 + 1) + 8 * (void)m), (void)v33);
      }
      id v30 = [v28 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v30);
  }

  if (*((void *)v4 + 23)) {
    -[ABSPBContact setPreferredChannel:](self, "setPreferredChannel:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setNamePrefix:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (void)setPreviousFamilyName:(id)a3
{
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNameSuffix:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)departmentName
{
  return self->_departmentName;
}

- (void)setDepartmentName:(id)a3
{
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (void)setJobTitle:(id)a3
{
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ABSPBDate)birthday
{
  return self->_birthday;
}

- (void)setBirthday:(id)a3
{
}

- (ABSPBDate)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (void)setNonGregorianBirthday:(id)a3
{
}

- (NSString)phoneticOrganizationName
{
  return self->_phoneticOrganizationName;
}

- (void)setPhoneticOrganizationName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setPhoneticMiddleName:(id)a3
{
}

- (NSString)pronunciationGivenName
{
  return self->_pronunciationGivenName;
}

- (void)setPronunciationGivenName:(id)a3
{
}

- (NSString)pronunciationFamilyName
{
  return self->_pronunciationFamilyName;
}

- (void)setPronunciationFamilyName:(id)a3
{
}

- (NSString)phonemeData
{
  return self->_phonemeData;
}

- (void)setPhonemeData:(id)a3
{
}

- (ABSPBAlert)callAlert
{
  return self->_callAlert;
}

- (void)setCallAlert:(id)a3
{
}

- (ABSPBAlert)textAlert
{
  return self->_textAlert;
}

- (void)setTextAlert:(id)a3
{
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSMutableArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (NSMutableArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSString)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_textAlert, 0);
  objc_storeStrong((id *)&self->_pronunciationGivenName, 0);
  objc_storeStrong((id *)&self->_pronunciationFamilyName, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_preferredChannel, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_callAlert, 0);
  objc_storeStrong((id *)&self->_birthday, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

- (id)toContact
{
  id v3 = objc_alloc((Class)CNMutableContact);
  id v4 = [(ABSPBContact *)self identifier];
  id v5 = [v3 initWithIdentifier:v4];

  uint64_t v6 = [(ABSPBContact *)self namePrefix];

  if (v6)
  {
    NSUInteger v7 = [(ABSPBContact *)self namePrefix];
    [v5 setNamePrefix:v7];
  }
  uint64_t v8 = [(ABSPBContact *)self givenName];

  if (v8)
  {
    unint64_t v9 = [(ABSPBContact *)self givenName];
    [v5 setGivenName:v9];
  }
  uint64_t v10 = [(ABSPBContact *)self middleName];

  if (v10)
  {
    unint64_t v11 = [(ABSPBContact *)self middleName];
    [v5 setMiddleName:v11];
  }
  uint64_t v12 = [(ABSPBContact *)self familyName];

  if (v12)
  {
    id v13 = [(ABSPBContact *)self familyName];
    [v5 setFamilyName:v13];
  }
  id v14 = [(ABSPBContact *)self previousFamilyName];

  if (v14)
  {
    id v15 = [(ABSPBContact *)self previousFamilyName];
    [v5 setPreviousFamilyName:v15];
  }
  uint64_t v16 = [(ABSPBContact *)self nameSuffix];

  if (v16)
  {
    unint64_t v17 = [(ABSPBContact *)self nameSuffix];
    [v5 setNameSuffix:v17];
  }
  id v18 = [(ABSPBContact *)self nickname];

  if (v18)
  {
    id v19 = [(ABSPBContact *)self nickname];
    [v5 setNickname:v19];
  }
  id v20 = [(ABSPBContact *)self organizationName];

  if (v20)
  {
    uint64_t v21 = [(ABSPBContact *)self organizationName];
    [v5 setOrganizationName:v21];
  }
  unint64_t v22 = [(ABSPBContact *)self departmentName];

  if (v22)
  {
    id v23 = [(ABSPBContact *)self departmentName];
    [v5 setDepartmentName:v23];
  }
  id v24 = [(ABSPBContact *)self jobTitle];

  if (v24)
  {
    id v25 = [(ABSPBContact *)self jobTitle];
    [v5 setJobTitle:v25];
  }
  uint64_t v26 = [(ABSPBContact *)self note];

  if (v26)
  {
    unint64_t v27 = [(ABSPBContact *)self note];
    [v5 setNote:v27];
  }
  if ([(ABSPBContact *)self hasBirthday])
  {
    id v28 = objc_alloc_init((Class)NSDateComponents);
    id v29 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [v28 setCalendar:v29];

    id v30 = [(ABSPBContact *)self birthday];
    if ([v30 hasYear])
    {
      uint64_t v31 = [(ABSPBContact *)self birthday];
      unsigned int v32 = [v31 year];

      if (v32 == -1) {
        goto LABEL_28;
      }
      id v30 = [(ABSPBContact *)self birthday];
      [v28 setYear:(int)[v30 year]];
    }

LABEL_28:
    long long v33 = [(ABSPBContact *)self birthday];
    if ([v33 hasMonth])
    {
      long long v34 = [(ABSPBContact *)self birthday];
      unsigned int v35 = [v34 month];

      if (v35 == -1) {
        goto LABEL_32;
      }
      long long v33 = [(ABSPBContact *)self birthday];
      [v28 setMonth:([v33 month])];
    }

LABEL_32:
    long long v36 = [(ABSPBContact *)self birthday];
    if ([v36 hasDay])
    {
      long long v37 = [(ABSPBContact *)self birthday];
      unsigned int v38 = [v37 day];

      if (v38 == -1)
      {
LABEL_36:
        [v5 setBirthday:v28];

        goto LABEL_37;
      }
      long long v36 = [(ABSPBContact *)self birthday];
      [v28 setDay:(int)[v36 day]];
    }

    goto LABEL_36;
  }
LABEL_37:
  if (![(ABSPBContact *)self hasNonGregorianBirthday]) {
    goto LABEL_55;
  }
  id v39 = objc_alloc_init((Class)NSDateComponents);
  long long v40 = [(ABSPBContact *)self nonGregorianBirthday];
  long long v41 = sub_10000748C((__int16)[v40 calendar]);

  long long v42 = +[NSCalendar calendarWithIdentifier:v41];
  [v39 setCalendar:v42];

  long long v43 = [(ABSPBContact *)self nonGregorianBirthday];
  if ([v43 hasEra])
  {
    long long v44 = [(ABSPBContact *)self nonGregorianBirthday];
    unsigned int v45 = [v44 era];

    if (v45 == -1) {
      goto LABEL_42;
    }
    long long v43 = [(ABSPBContact *)self nonGregorianBirthday];
    [v39 setEra:(int)[v43 era]];
  }

LABEL_42:
  long long v46 = [(ABSPBContact *)self nonGregorianBirthday];
  if ([v46 hasYear])
  {
    long long v47 = [(ABSPBContact *)self nonGregorianBirthday];
    unsigned int v48 = [v47 year];

    if (v48 == -1) {
      goto LABEL_46;
    }
    long long v46 = [(ABSPBContact *)self nonGregorianBirthday];
    [v39 setYear:([v46 year])];
  }

LABEL_46:
  id v49 = [(ABSPBContact *)self nonGregorianBirthday];
  if ([v49 hasMonth])
  {
    id v50 = [(ABSPBContact *)self nonGregorianBirthday];
    unsigned int v51 = [v50 month];

    if (v51 == -1) {
      goto LABEL_50;
    }
    id v49 = [(ABSPBContact *)self nonGregorianBirthday];
    [v39 setMonth:(int)[v49 month]];
  }

LABEL_50:
  v52 = [(ABSPBContact *)self nonGregorianBirthday];
  if (![v52 hasDay])
  {
LABEL_53:

    goto LABEL_54;
  }
  id v53 = [(ABSPBContact *)self nonGregorianBirthday];
  unsigned int v54 = [v53 day];

  if (v54 != -1)
  {
    v52 = [(ABSPBContact *)self nonGregorianBirthday];
    [v39 setDay:(int)[v52 day]];
    goto LABEL_53;
  }
LABEL_54:
  uint64_t v55 = [(ABSPBContact *)self nonGregorianBirthday];
  [v39 setLeapMonth:[v55 isLeapMonth]];

  [v5 setNonGregorianBirthday:v39];
LABEL_55:
  id v56 = [(ABSPBContact *)self phoneticOrganizationName];

  if (v56)
  {
    id v57 = [(ABSPBContact *)self phoneticOrganizationName];
    [v5 setPhoneticOrganizationName:v57];
  }
  v58 = [(ABSPBContact *)self phoneticFamilyName];

  if (v58)
  {
    id v59 = [(ABSPBContact *)self phoneticFamilyName];
    [v5 setPhoneticFamilyName:v59];
  }
  id v60 = [(ABSPBContact *)self phoneticGivenName];

  if (v60)
  {
    uint64_t v61 = [(ABSPBContact *)self phoneticGivenName];
    [v5 setPhoneticGivenName:v61];
  }
  v62 = [(ABSPBContact *)self phoneticMiddleName];

  if (v62)
  {
    id v63 = [(ABSPBContact *)self phoneticMiddleName];
    [v5 setPhoneticMiddleName:v63];
  }
  long long v64 = [(ABSPBContact *)self pronunciationGivenName];

  if (v64)
  {
    id v65 = [(ABSPBContact *)self pronunciationGivenName];
    [v5 setPronunciationGivenName:v65];
  }
  id v66 = [(ABSPBContact *)self pronunciationFamilyName];

  if (v66)
  {
    uint64_t v67 = [(ABSPBContact *)self pronunciationFamilyName];
    [v5 setPronunciationFamilyName:v67];
  }
  long long v68 = [(ABSPBContact *)self phonemeData];

  if (v68)
  {
    id v69 = [(ABSPBContact *)self phonemeData];
    [v5 setPhonemeData:v69];
  }
  long long v70 = [(ABSPBContact *)self preferredChannel];

  if (v70)
  {
    id v71 = [(ABSPBContact *)self preferredChannel];
    [v5 setPreferredChannel:v71];
  }
  if ([(ABSPBContact *)self hasCallAlert])
  {
    id v72 = objc_alloc((Class)CNActivityAlert);
    uint64_t v73 = [(ABSPBContact *)self callAlert];
    long long v74 = [v73 sound];
    id v75 = [(ABSPBContact *)self callAlert];
    id v76 = [v75 vibration];
    long long v77 = [(ABSPBContact *)self callAlert];
    id v78 = [v72 initWithSound:v74 vibration:v76 ignoreMute:objc_msgSend(v77, "ignoreMute")];

    [v5 setCallAlert:v78];
  }
  if ([(ABSPBContact *)self hasTextAlert])
  {
    id v79 = objc_alloc((Class)CNActivityAlert);
    long long v80 = [(ABSPBContact *)self textAlert];
    long long v81 = [v80 sound];
    long long v82 = [(ABSPBContact *)self textAlert];
    long long v83 = [v82 vibration];
    long long v84 = [(ABSPBContact *)self textAlert];
    id v85 = [v79 initWithSound:v81 vibration:v83 ignoreMute:[v84 ignoreMute]];

    [v5 setTextAlert:v85];
  }
  long long v86 = [(ABSPBContact *)self phoneNumbers];
  id v87 = [v86 count];

  v158 = v5;
  v160 = self;
  if (v87)
  {
    id v88 = objc_alloc((Class)NSMutableArray);
    long long v89 = [(ABSPBContact *)self phoneNumbers];
    id v90 = [v88 initWithCapacity:[v89 count]];

    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v91 = [(ABSPBContact *)self phoneNumbers];
    id v92 = [v91 countByEnumeratingWithState:&v173 objects:v180 count:16];
    if (v92)
    {
      id v93 = v92;
      uint64_t v94 = *(void *)v174;
      do
      {
        for (uint64_t i = 0; i != v93; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v174 != v94) {
            objc_enumerationMutation(v91);
          }
          v96 = *(void **)(*((void *)&v173 + 1) + 8 * i);
          id v97 = objc_alloc((Class)CNPhoneNumber);
          v98 = [v96 value];
          id v99 = [v97 initWithStringValue:v98];

          id v100 = objc_alloc((Class)CNLabeledValue);
          v101 = [v96 label];
          id v102 = [v100 initWithLabel:v101 value:v99];

          [v90 addObject:v102];
        }
        id v93 = [v91 countByEnumeratingWithState:&v173 objects:v180 count:16];
      }
      while (v93);
    }

    id v5 = v158;
    [v158 setPhoneNumbers:v90];
  }
  v103 = [(ABSPBContact *)self addresses];
  id v104 = [v103 count];

  if (v104)
  {
    id v105 = objc_alloc((Class)NSMutableArray);
    v106 = [(ABSPBContact *)self addresses];
    id v107 = [v105 initWithCapacity:[v106 count]];

    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    v108 = [(ABSPBContact *)self addresses];
    id v109 = [v108 countByEnumeratingWithState:&v169 objects:v179 count:16];
    if (v109)
    {
      id v110 = v109;
      uint64_t v111 = *(void *)v170;
      do
      {
        for (uint64_t j = 0; j != v110; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v170 != v111) {
            objc_enumerationMutation(v108);
          }
          v113 = *(void **)(*((void *)&v169 + 1) + 8 * (void)j);
          id v114 = objc_alloc_init((Class)CNMutablePostalAddress);
          v115 = [v113 street];
          [v114 setStreet:v115];

          v116 = [v113 city];
          [v114 setCity:v116];

          v117 = [v113 state];
          [v114 setState:v117];

          v118 = [v113 postalCode];
          [v114 setPostalCode:v118];

          v119 = [v113 country];
          [v114 setCountry:v119];

          v120 = [v113 iSOCountryCode];
          [v114 setISOCountryCode:v120];

          v121 = [v113 subLocality];
          [v114 setSubLocality:v121];

          v122 = [v113 subAdministrativeArea];
          [v114 setSubAdministrativeArea:v122];

          id v123 = objc_alloc((Class)CNLabeledValue);
          v124 = [v113 label];
          id v125 = [v123 initWithLabel:v124 value:v114];

          [v107 addObject:v125];
        }
        id v110 = [v108 countByEnumeratingWithState:&v169 objects:v179 count:16];
      }
      while (v110);
    }

    id v5 = v159;
    [v159 setPostalAddresses:v107];

    self = v160;
  }
  v126 = [(ABSPBContact *)self urls];
  id v127 = [v126 count];

  if (v127)
  {
    id v128 = objc_alloc((Class)NSMutableArray);
    v129 = [(ABSPBContact *)self urls];
    id v130 = [v128 initWithCapacity:[v129 count]];

    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    v131 = [(ABSPBContact *)self urls];
    id v132 = [v131 countByEnumeratingWithState:&v165 objects:v178 count:16];
    if (v132)
    {
      id v133 = v132;
      uint64_t v134 = *(void *)v166;
      do
      {
        for (uint64_t k = 0; k != v133; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v166 != v134) {
            objc_enumerationMutation(v131);
          }
          v136 = *(void **)(*((void *)&v165 + 1) + 8 * (void)k);
          id v137 = objc_alloc((Class)CNLabeledValue);
          v138 = [v136 label];
          v139 = [v136 value];
          id v140 = [v137 initWithLabel:v138 value:v139];

          [v130 addObject:v140];
        }
        id v133 = [v131 countByEnumeratingWithState:&v165 objects:v178 count:16];
      }
      while (v133);
    }

    [v5 setUrlAddresses:v130];
    self = v160;
  }
  v141 = [(ABSPBContact *)self emails];
  id v142 = [v141 count];

  if (v142)
  {
    id v143 = objc_alloc((Class)NSMutableArray);
    v144 = [(ABSPBContact *)self emails];
    id v145 = [v143 initWithCapacity:[v144 count]];

    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v146 = [(ABSPBContact *)self emails];
    id v147 = [v146 countByEnumeratingWithState:&v161 objects:v177 count:16];
    if (v147)
    {
      id v148 = v147;
      uint64_t v149 = *(void *)v162;
      do
      {
        for (uint64_t m = 0; m != v148; uint64_t m = (char *)m + 1)
        {
          if (*(void *)v162 != v149) {
            objc_enumerationMutation(v146);
          }
          v151 = *(void **)(*((void *)&v161 + 1) + 8 * (void)m);
          id v152 = objc_alloc((Class)CNLabeledValue);
          v153 = [v151 label];
          v154 = [v151 value];
          id v155 = [v152 initWithLabel:v153 value:v154];

          [v145 addObject:v155];
        }
        id v148 = [v146 countByEnumeratingWithState:&v161 objects:v177 count:16];
      }
      while (v148);
    }

    [v5 setEmailAddresses:v145];
  }
  id v156 = v5;

  return v156;
}

+ (id)toPBContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ABSPBContact);
  id v5 = [v3 identifier];

  if (v5)
  {
    uint64_t v6 = [v3 identifier];
    [(ABSPBContact *)v4 setIdentifier:v6];
  }
  NSUInteger v7 = [v3 namePrefix];

  if (v7)
  {
    uint64_t v8 = [v3 namePrefix];
    [(ABSPBContact *)v4 setNamePrefix:v8];
  }
  unint64_t v9 = [v3 givenName];

  if (v9)
  {
    uint64_t v10 = [v3 givenName];
    [(ABSPBContact *)v4 setGivenName:v10];
  }
  unint64_t v11 = [v3 middleName];

  if (v11)
  {
    uint64_t v12 = [v3 middleName];
    [(ABSPBContact *)v4 setMiddleName:v12];
  }
  id v13 = [v3 familyName];

  if (v13)
  {
    id v14 = [v3 familyName];
    [(ABSPBContact *)v4 setFamilyName:v14];
  }
  id v15 = [v3 previousFamilyName];

  if (v15)
  {
    uint64_t v16 = [v3 previousFamilyName];
    [(ABSPBContact *)v4 setPreviousFamilyName:v16];
  }
  unint64_t v17 = [v3 nameSuffix];

  if (v17)
  {
    id v18 = [v3 nameSuffix];
    [(ABSPBContact *)v4 setNameSuffix:v18];
  }
  id v19 = [v3 nickname];

  if (v19)
  {
    id v20 = [v3 nickname];
    [(ABSPBContact *)v4 setNickname:v20];
  }
  uint64_t v21 = [v3 organizationName];

  if (v21)
  {
    unint64_t v22 = [v3 organizationName];
    [(ABSPBContact *)v4 setOrganizationName:v22];
  }
  id v23 = [v3 departmentName];

  if (v23)
  {
    id v24 = [v3 departmentName];
    [(ABSPBContact *)v4 setDepartmentName:v24];
  }
  id v25 = [v3 jobTitle];

  if (v25)
  {
    uint64_t v26 = [v3 jobTitle];
    [(ABSPBContact *)v4 setJobTitle:v26];
  }
  unint64_t v27 = [v3 note];

  if (v27)
  {
    id v28 = [v3 note];
    [(ABSPBContact *)v4 setNote:v28];
  }
  id v29 = [v3 birthday];

  if (v29)
  {
    id v30 = objc_alloc_init(ABSPBDate);
    [(ABSPBDate *)v30 setCalendar:1];
    uint64_t v31 = [v3 birthday];
    -[ABSPBDate setYear:](v30, "setYear:", [v31 year]);

    unsigned int v32 = [v3 birthday];
    -[ABSPBDate setMonth:](v30, "setMonth:", [v32 month]);

    long long v33 = [v3 birthday];
    -[ABSPBDate setDay:](v30, "setDay:", [v33 day]);

    [(ABSPBContact *)v4 setBirthday:v30];
  }
  long long v34 = [v3 nonGregorianBirthday];

  if (v34)
  {
    unsigned int v35 = objc_alloc_init(ABSPBDate);
    long long v36 = [v3 nonGregorianBirthday];
    long long v37 = [v36 calendar];
    unsigned int v38 = [v37 calendarIdentifier];
    [(ABSPBDate *)v35 setCalendar:sub_100016A2C(v38)];

    id v39 = [v3 nonGregorianBirthday];
    -[ABSPBDate setEra:](v35, "setEra:", [v39 era]);

    long long v40 = [v3 nonGregorianBirthday];
    -[ABSPBDate setYear:](v35, "setYear:", [v40 year]);

    long long v41 = [v3 nonGregorianBirthday];
    -[ABSPBDate setMonth:](v35, "setMonth:", [v41 month]);

    long long v42 = [v3 nonGregorianBirthday];
    -[ABSPBDate setDay:](v35, "setDay:", [v42 day]);

    long long v43 = [v3 nonGregorianBirthday];
    -[ABSPBDate setIsLeapMonth:](v35, "setIsLeapMonth:", [v43 isLeapMonth]);

    [(ABSPBContact *)v4 setNonGregorianBirthday:v35];
  }
  long long v44 = [v3 phoneticOrganizationName];

  if (v44)
  {
    unsigned int v45 = [v3 phoneticOrganizationName];
    [(ABSPBContact *)v4 setPhoneticOrganizationName:v45];
  }
  long long v46 = [v3 phoneticFamilyName];

  if (v46)
  {
    long long v47 = [v3 phoneticFamilyName];
    [(ABSPBContact *)v4 setPhoneticFamilyName:v47];
  }
  unsigned int v48 = [v3 phoneticGivenName];

  if (v48)
  {
    id v49 = [v3 phoneticGivenName];
    [(ABSPBContact *)v4 setPhoneticGivenName:v49];
  }
  id v50 = [v3 phoneticMiddleName];

  if (v50)
  {
    unsigned int v51 = [v3 phoneticMiddleName];
    [(ABSPBContact *)v4 setPhoneticMiddleName:v51];
  }
  v52 = [v3 pronunciationGivenName];

  if (v52)
  {
    id v53 = [v3 pronunciationGivenName];
    [(ABSPBContact *)v4 setPronunciationGivenName:v53];
  }
  unsigned int v54 = [v3 pronunciationFamilyName];

  if (v54)
  {
    uint64_t v55 = [v3 pronunciationFamilyName];
    [(ABSPBContact *)v4 setPronunciationFamilyName:v55];
  }
  id v56 = [v3 phonemeData];

  if (v56)
  {
    id v57 = [v3 phonemeData];
    [(ABSPBContact *)v4 setPhonemeData:v57];
  }
  v58 = [v3 preferredChannel];

  if (v58)
  {
    id v59 = [v3 preferredChannel];
    [(ABSPBContact *)v4 setPreferredChannel:v59];
  }
  id v60 = [v3 callAlert];

  if (v60)
  {
    uint64_t v61 = objc_alloc_init(ABSPBAlert);
    v62 = [v3 callAlert];
    id v63 = [v62 sound];
    [(ABSPBAlert *)v61 setSound:v63];

    long long v64 = [v3 callAlert];
    id v65 = [v64 vibration];
    [(ABSPBAlert *)v61 setVibration:v65];

    id v66 = [v3 callAlert];
    -[ABSPBAlert setIgnoreMute:](v61, "setIgnoreMute:", [v66 ignoreMute]);

    [(ABSPBContact *)v4 setCallAlert:v61];
  }
  uint64_t v67 = [v3 textAlert];

  if (v67)
  {
    long long v68 = objc_alloc_init(ABSPBAlert);
    id v69 = [v3 textAlert];
    long long v70 = [v69 sound];
    [(ABSPBAlert *)v68 setSound:v70];

    id v71 = [v3 textAlert];
    id v72 = [v71 vibration];
    [(ABSPBAlert *)v68 setVibration:v72];

    uint64_t v73 = [v3 textAlert];
    -[ABSPBAlert setIgnoreMute:](v68, "setIgnoreMute:", [v73 ignoreMute]);

    [(ABSPBContact *)v4 setTextAlert:v68];
  }
  long long v74 = [v3 phoneNumbers];

  if (v74)
  {
    id v75 = objc_alloc((Class)NSMutableArray);
    id v76 = [v3 phoneNumbers];
    id v77 = [v75 initWithCapacity:[v76 count]];

    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v78 = [v3 phoneNumbers];
    id v79 = [v78 countByEnumeratingWithState:&v158 objects:v165 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v159;
      do
      {
        for (uint64_t i = 0; i != v80; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v159 != v81) {
            objc_enumerationMutation(v78);
          }
          long long v83 = *(void **)(*((void *)&v158 + 1) + 8 * i);
          long long v84 = objc_alloc_init(ABSPBLabeledString);
          id v85 = [v83 label];
          [(ABSPBLabeledString *)v84 setLabel:v85];

          long long v86 = [v83 value];
          id v87 = [v86 stringValue];
          [(ABSPBLabeledString *)v84 setValue:v87];

          [v77 addObject:v84];
        }
        id v80 = [v78 countByEnumeratingWithState:&v158 objects:v165 count:16];
      }
      while (v80);
    }

    [(ABSPBContact *)v4 setPhoneNumbers:v77];
  }
  id v88 = [v3 postalAddresses];
  id v89 = [v88 count];

  if (v89)
  {
    id v90 = objc_alloc((Class)NSMutableArray);
    long long v91 = [v3 postalAddresses];
    id v92 = [v90 initWithCapacity:[v91 count]];

    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v145 = v3;
    id v93 = [v3 postalAddresses];
    id v94 = [v93 countByEnumeratingWithState:&v154 objects:v164 count:16];
    if (v94)
    {
      id v95 = v94;
      uint64_t v96 = *(void *)v155;
      do
      {
        for (uint64_t j = 0; j != v95; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v155 != v96) {
            objc_enumerationMutation(v93);
          }
          v98 = *(void **)(*((void *)&v154 + 1) + 8 * (void)j);
          id v99 = objc_alloc_init(ABSPBPostalAddress);
          id v100 = [v98 value];
          v101 = [v100 street];
          [(ABSPBPostalAddress *)v99 setStreet:v101];

          id v102 = [v98 value];
          v103 = [v102 city];
          [(ABSPBPostalAddress *)v99 setCity:v103];

          id v104 = [v98 value];
          id v105 = [v104 state];
          [(ABSPBPostalAddress *)v99 setState:v105];

          v106 = [v98 value];
          id v107 = [v106 postalCode];
          [(ABSPBPostalAddress *)v99 setPostalCode:v107];

          v108 = [v98 value];
          id v109 = [v108 country];
          [(ABSPBPostalAddress *)v99 setCountry:v109];

          id v110 = [v98 value];
          uint64_t v111 = [v110 ISOCountryCode];
          [(ABSPBPostalAddress *)v99 setISOCountryCode:v111];

          v112 = [v98 value];
          v113 = [v112 subLocality];
          [(ABSPBPostalAddress *)v99 setSubLocality:v113];

          id v114 = [v98 value];
          v115 = [v114 subAdministrativeArea];
          [(ABSPBPostalAddress *)v99 setSubAdministrativeArea:v115];

          [v92 addObject:v99];
        }
        id v95 = [v93 countByEnumeratingWithState:&v154 objects:v164 count:16];
      }
      while (v95);
    }

    [(ABSPBContact *)v4 setAddresses:v92];
    id v3 = v145;
  }
  v116 = [v3 urlAddresses];
  id v117 = [v116 count];

  if (v117)
  {
    id v118 = objc_alloc((Class)NSMutableArray);
    v119 = [v3 urlAddresses];
    id v120 = [v118 initWithCapacity:[v119 count]];

    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    v121 = [v3 urlAddresses];
    id v122 = [v121 countByEnumeratingWithState:&v150 objects:v163 count:16];
    if (v122)
    {
      id v123 = v122;
      uint64_t v124 = *(void *)v151;
      do
      {
        for (uint64_t k = 0; k != v123; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v151 != v124) {
            objc_enumerationMutation(v121);
          }
          v126 = *(void **)(*((void *)&v150 + 1) + 8 * (void)k);
          id v127 = objc_alloc_init(ABSPBLabeledString);
          id v128 = [v126 label];
          [(ABSPBLabeledString *)v127 setLabel:v128];

          v129 = [v126 value];
          [(ABSPBLabeledString *)v127 setValue:v129];

          [v120 addObject:v127];
        }
        id v123 = [v121 countByEnumeratingWithState:&v150 objects:v163 count:16];
      }
      while (v123);
    }

    [(ABSPBContact *)v4 setUrls:v120];
  }
  id v130 = [v3 emailAddresses];

  if (v130)
  {
    id v131 = objc_alloc((Class)NSMutableArray);
    id v132 = [v3 emailAddresses];
    id v133 = [v131 initWithCapacity:[v132 count]];

    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    uint64_t v134 = [v3 emailAddresses];
    id v135 = [v134 countByEnumeratingWithState:&v146 objects:v162 count:16];
    if (v135)
    {
      id v136 = v135;
      uint64_t v137 = *(void *)v147;
      do
      {
        for (uint64_t m = 0; m != v136; uint64_t m = (char *)m + 1)
        {
          if (*(void *)v147 != v137) {
            objc_enumerationMutation(v134);
          }
          v139 = *(void **)(*((void *)&v146 + 1) + 8 * (void)m);
          id v140 = objc_alloc_init(ABSPBLabeledString);
          v141 = [v139 label];
          [(ABSPBLabeledString *)v140 setLabel:v141];

          id v142 = [v139 value];
          [(ABSPBLabeledString *)v140 setValue:v142];

          [v133 addObject:v140];
        }
        id v136 = [v134 countByEnumeratingWithState:&v146 objects:v162 count:16];
      }
      while (v136);
    }

    [(ABSPBContact *)v4 setEmails:v133];
  }
  id v143 = v4;

  return v143;
}

@end