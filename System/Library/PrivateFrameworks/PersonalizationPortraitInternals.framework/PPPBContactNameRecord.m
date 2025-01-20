@interface PPPBContactNameRecord
+ (Class)cityNamesType;
+ (Class)relatedNamesType;
+ (Class)streetNamesType;
- (BOOL)hasChangeType;
- (BOOL)hasFirstName;
- (BOOL)hasIdentifier;
- (BOOL)hasJobTitle;
- (BOOL)hasLastName;
- (BOOL)hasMiddleName;
- (BOOL)hasNickname;
- (BOOL)hasOrganizationName;
- (BOOL)hasPhoneticFirstName;
- (BOOL)hasPhoneticLastName;
- (BOOL)hasPhoneticMiddleName;
- (BOOL)hasScore;
- (BOOL)hasSource;
- (BOOL)hasSourceIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cityNames;
- (NSMutableArray)relatedNames;
- (NSMutableArray)streetNames;
- (NSString)firstName;
- (NSString)identifier;
- (NSString)jobTitle;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)organizationName;
- (NSString)phoneticFirstName;
- (NSString)phoneticLastName;
- (NSString)phoneticMiddleName;
- (NSString)sourceIdentifier;
- (double)score;
- (id)changeTypeAsString:(unsigned __int8)a3;
- (id)cityNamesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)relatedNamesAtIndex:(unint64_t)a3;
- (id)sourceAsString:(unsigned __int8)a3;
- (id)streetNamesAtIndex:(unint64_t)a3;
- (unint64_t)cityNamesCount;
- (unint64_t)hash;
- (unint64_t)relatedNamesCount;
- (unint64_t)streetNamesCount;
- (unsigned)StringAsChangeType:(id)a3;
- (unsigned)StringAsSource:(id)a3;
- (unsigned)changeType;
- (unsigned)source;
- (void)addCityNames:(id)a3;
- (void)addRelatedNames:(id)a3;
- (void)addStreetNames:(id)a3;
- (void)clearCityNames;
- (void)clearRelatedNames;
- (void)clearStreetNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeType:(unsigned __int8)a3;
- (void)setCityNames:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHasChangeType:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setJobTitle:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneticFirstName:(id)a3;
- (void)setPhoneticLastName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setRelatedNames:(id)a3;
- (void)setScore:(double)a3;
- (void)setSource:(unsigned __int8)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStreetNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBContactNameRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streetNames, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cityNames, 0);
}

- (void)setCityNames:(id)a3
{
}

- (NSMutableArray)cityNames
{
  return self->_cityNames;
}

- (void)setStreetNames:(id)a3
{
}

- (NSMutableArray)streetNames
{
  return self->_streetNames;
}

- (void)setRelatedNames:(id)a3
{
}

- (NSMutableArray)relatedNames
{
  return self->_relatedNames;
}

- (void)setNickname:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setJobTitle:(id)a3
{
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setPhoneticLastName:(id)a3
{
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
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

- (void)setPhoneticFirstName:(id)a3
{
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (unsigned)source
{
  return self->_source;
}

- (double)score
{
  return self->_score;
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[PPPBContactNameRecord setIdentifier:](self, "setIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 144);
  if (v5)
  {
    self->_score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 144);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_source = *((unsigned char *)v4 + 120);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 144) & 2) != 0)
  {
LABEL_6:
    self->_changeType = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  if (*((void *)v4 + 16)) {
    -[PPPBContactNameRecord setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  if (*((void *)v4 + 4)) {
    -[PPPBContactNameRecord setFirstName:](self, "setFirstName:");
  }
  if (*((void *)v4 + 11)) {
    -[PPPBContactNameRecord setPhoneticFirstName:](self, "setPhoneticFirstName:");
  }
  if (*((void *)v4 + 8)) {
    -[PPPBContactNameRecord setMiddleName:](self, "setMiddleName:");
  }
  if (*((void *)v4 + 13)) {
    -[PPPBContactNameRecord setPhoneticMiddleName:](self, "setPhoneticMiddleName:");
  }
  if (*((void *)v4 + 7)) {
    -[PPPBContactNameRecord setLastName:](self, "setLastName:");
  }
  if (*((void *)v4 + 12)) {
    -[PPPBContactNameRecord setPhoneticLastName:](self, "setPhoneticLastName:");
  }
  if (*((void *)v4 + 10)) {
    -[PPPBContactNameRecord setOrganizationName:](self, "setOrganizationName:");
  }
  if (*((void *)v4 + 6)) {
    -[PPPBContactNameRecord setJobTitle:](self, "setJobTitle:");
  }
  if (*((void *)v4 + 9)) {
    -[PPPBContactNameRecord setNickname:](self, "setNickname:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 14);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PPPBContactNameRecord *)self addRelatedNames:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 17);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(PPPBContactNameRecord *)self addStreetNames:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 3);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[PPPBContactNameRecord addCityNames:](self, "addCityNames:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double score = self->_score;
    double v7 = -score;
    if (score >= 0.0) {
      double v7 = self->_score;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
      if ((has & 4) == 0)
      {
LABEL_13:
        uint64_t v10 = 0;
        if ((has & 2) == 0) {
          goto LABEL_14;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_13;
    }
  }
  uint64_t v10 = 2654435761 * self->_source;
  if ((has & 2) == 0)
  {
LABEL_14:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_changeType;
LABEL_15:
  NSUInteger v12 = v5 ^ v3 ^ v10 ^ v11 ^ [(NSString *)self->_sourceIdentifier hash];
  NSUInteger v13 = [(NSString *)self->_firstName hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_phoneticFirstName hash];
  NSUInteger v15 = v12 ^ v14 ^ [(NSString *)self->_middleName hash];
  NSUInteger v16 = [(NSString *)self->_phoneticMiddleName hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_lastName hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_phoneticLastName hash];
  NSUInteger v19 = v15 ^ v18 ^ [(NSString *)self->_organizationName hash];
  NSUInteger v20 = [(NSString *)self->_jobTitle hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_nickname hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_relatedNames hash];
  uint64_t v23 = v22 ^ [(NSMutableArray *)self->_streetNames hash];
  return v19 ^ v23 ^ [(NSMutableArray *)self->_cityNames hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[144] & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_45;
    }
  }
  else if (v4[144])
  {
LABEL_45:
    char v19 = 0;
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[144] & 4) == 0 || self->_source != v4[120]) {
      goto LABEL_45;
    }
  }
  else if ((v4[144] & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[144] & 2) == 0 || self->_changeType != v4[16]) {
      goto LABEL_45;
    }
  }
  else if ((v4[144] & 2) != 0)
  {
    goto LABEL_45;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 16)
    && !-[NSString isEqual:](sourceIdentifier, "isEqual:"))
  {
    goto LABEL_45;
  }
  firstName = self->_firstName;
  if ((unint64_t)firstName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](firstName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  phoneticFirstName = self->_phoneticFirstName;
  if ((unint64_t)phoneticFirstName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](phoneticFirstName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  middleName = self->_middleName;
  if ((unint64_t)middleName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](middleName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if ((unint64_t)phoneticMiddleName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](phoneticMiddleName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  lastName = self->_lastName;
  if ((unint64_t)lastName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](lastName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  phoneticLastName = self->_phoneticLastName;
  if ((unint64_t)phoneticLastName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](phoneticLastName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_45;
    }
  }
  jobTitle = self->_jobTitle;
  if ((unint64_t)jobTitle | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](jobTitle, "isEqual:")) {
      goto LABEL_45;
    }
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](nickname, "isEqual:")) {
      goto LABEL_45;
    }
  }
  relatedNames = self->_relatedNames;
  if ((unint64_t)relatedNames | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](relatedNames, "isEqual:")) {
      goto LABEL_45;
    }
  }
  streetNames = self->_streetNames;
  if ((unint64_t)streetNames | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](streetNames, "isEqual:")) {
      goto LABEL_45;
    }
  }
  cityNames = self->_cityNames;
  if ((unint64_t)cityNames | *((void *)v4 + 3)) {
    char v19 = -[NSMutableArray isEqual:](cityNames, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_46:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  double v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 144) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 120) = self->_source;
  *(unsigned char *)(v5 + 144) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 16) = self->_changeType;
    *(unsigned char *)(v5 + 144) |= 2u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v9;

  uint64_t v11 = [(NSString *)self->_firstName copyWithZone:a3];
  NSUInteger v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_phoneticFirstName copyWithZone:a3];
  NSUInteger v14 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v13;

  uint64_t v15 = [(NSString *)self->_middleName copyWithZone:a3];
  NSUInteger v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  uint64_t v17 = [(NSString *)self->_phoneticMiddleName copyWithZone:a3];
  NSUInteger v18 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v17;

  uint64_t v19 = [(NSString *)self->_lastName copyWithZone:a3];
  NSUInteger v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  uint64_t v21 = [(NSString *)self->_phoneticLastName copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v21;

  uint64_t v23 = [(NSString *)self->_organizationName copyWithZone:a3];
  long long v24 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v23;

  uint64_t v25 = [(NSString *)self->_jobTitle copyWithZone:a3];
  long long v26 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v25;

  uint64_t v27 = [(NSString *)self->_nickname copyWithZone:a3];
  long long v28 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v27;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v29 = self->_relatedNames;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v57 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRelatedNames:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v31);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v35 = self->_streetNames;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addStreetNames:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v37);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v41 = self->_cityNames;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v49 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * k), "copyWithZone:", a3, (void)v48);
        [(id)v5 addCityNames:v46];
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v43);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v18;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    *((unsigned char *)v4 + 144) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 120) = self->_source;
  *((unsigned char *)v4 + 144) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 16) = self->_changeType;
    *((unsigned char *)v4 + 144) |= 2u;
  }
LABEL_7:
  if (self->_sourceIdentifier) {
    objc_msgSend(v18, "setSourceIdentifier:");
  }
  if (self->_firstName) {
    objc_msgSend(v18, "setFirstName:");
  }
  if (self->_phoneticFirstName) {
    objc_msgSend(v18, "setPhoneticFirstName:");
  }
  if (self->_middleName) {
    objc_msgSend(v18, "setMiddleName:");
  }
  if (self->_phoneticMiddleName) {
    objc_msgSend(v18, "setPhoneticMiddleName:");
  }
  if (self->_lastName) {
    objc_msgSend(v18, "setLastName:");
  }
  if (self->_phoneticLastName) {
    objc_msgSend(v18, "setPhoneticLastName:");
  }
  if (self->_organizationName) {
    objc_msgSend(v18, "setOrganizationName:");
  }
  if (self->_jobTitle) {
    objc_msgSend(v18, "setJobTitle:");
  }
  if (self->_nickname) {
    objc_msgSend(v18, "setNickname:");
  }
  if ([(PPPBContactNameRecord *)self relatedNamesCount])
  {
    [v18 clearRelatedNames];
    unint64_t v6 = [(PPPBContactNameRecord *)self relatedNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PPPBContactNameRecord *)self relatedNamesAtIndex:i];
        [v18 addRelatedNames:v9];
      }
    }
  }
  if ([(PPPBContactNameRecord *)self streetNamesCount])
  {
    [v18 clearStreetNames];
    unint64_t v10 = [(PPPBContactNameRecord *)self streetNamesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(PPPBContactNameRecord *)self streetNamesAtIndex:j];
        [v18 addStreetNames:v13];
      }
    }
  }
  if ([(PPPBContactNameRecord *)self cityNamesCount])
  {
    [v18 clearCityNames];
    unint64_t v14 = [(PPPBContactNameRecord *)self cityNamesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(PPPBContactNameRecord *)self cityNamesAtIndex:k];
        [v18 addCityNames:v17];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_sourceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_firstName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticFirstName) {
    PBDataWriterWriteStringField();
  }
  if (self->_middleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticMiddleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastName) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticLastName) {
    PBDataWriterWriteStringField();
  }
  if (self->_organizationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_jobTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_nickname) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v6 = self->_relatedNames;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v11 = self->_streetNames;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  NSUInteger v16 = self->_cityNames;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBContactNameRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    long long v29 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v29 forKey:@"score"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  long long v30 = [NSNumber numberWithUnsignedChar:self->_source];
  long long v31 = [v30 stringValue];
  [v4 setObject:v31 forKey:@"source"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    uint64_t v7 = [NSNumber numberWithUnsignedChar:self->_changeType];
    uint64_t v8 = [v7 stringValue];
    [v4 setObject:v8 forKey:@"changeType"];
  }
LABEL_7:
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v4 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  firstName = self->_firstName;
  if (firstName) {
    [v4 setObject:firstName forKey:@"firstName"];
  }
  phoneticFirstName = self->_phoneticFirstName;
  if (phoneticFirstName) {
    [v4 setObject:phoneticFirstName forKey:@"phoneticFirstName"];
  }
  middleName = self->_middleName;
  if (middleName) {
    [v4 setObject:middleName forKey:@"middleName"];
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if (phoneticMiddleName) {
    [v4 setObject:phoneticMiddleName forKey:@"phoneticMiddleName"];
  }
  lastName = self->_lastName;
  if (lastName) {
    [v4 setObject:lastName forKey:@"lastName"];
  }
  phoneticLastName = self->_phoneticLastName;
  if (phoneticLastName) {
    [v4 setObject:phoneticLastName forKey:@"phoneticLastName"];
  }
  organizationName = self->_organizationName;
  if (organizationName) {
    [v4 setObject:organizationName forKey:@"organizationName"];
  }
  jobTitle = self->_jobTitle;
  if (jobTitle) {
    [v4 setObject:jobTitle forKey:@"jobTitle"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v4 setObject:nickname forKey:@"nickname"];
  }
  if ([(NSMutableArray *)self->_relatedNames count])
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_relatedNames, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    NSUInteger v20 = self->_relatedNames;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "dictionaryRepresentation", (void)v32);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v22);
    }

    [v4 setObject:v19 forKey:@"relatedNames"];
  }
  streetNames = self->_streetNames;
  if (streetNames) {
    [v4 setObject:streetNames forKey:@"streetNames"];
  }
  cityNames = self->_cityNames;
  if (cityNames) {
    [v4 setObject:cityNames forKey:@"cityNames"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBContactNameRecord;
  id v4 = [(PPPBContactNameRecord *)&v8 description];
  uint64_t v5 = [(PPPBContactNameRecord *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)cityNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cityNames objectAtIndex:a3];
}

- (unint64_t)cityNamesCount
{
  return [(NSMutableArray *)self->_cityNames count];
}

- (void)addCityNames:(id)a3
{
  id v4 = a3;
  cityNames = self->_cityNames;
  id v8 = v4;
  if (!cityNames)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_cityNames;
    self->_cityNames = v6;

    id v4 = v8;
    cityNames = self->_cityNames;
  }
  [(NSMutableArray *)cityNames addObject:v4];
}

- (void)clearCityNames
{
}

- (id)streetNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_streetNames objectAtIndex:a3];
}

- (unint64_t)streetNamesCount
{
  return [(NSMutableArray *)self->_streetNames count];
}

- (void)addStreetNames:(id)a3
{
  id v4 = a3;
  streetNames = self->_streetNames;
  id v8 = v4;
  if (!streetNames)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_streetNames;
    self->_streetNames = v6;

    id v4 = v8;
    streetNames = self->_streetNames;
  }
  [(NSMutableArray *)streetNames addObject:v4];
}

- (void)clearStreetNames
{
}

- (id)relatedNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_relatedNames objectAtIndex:a3];
}

- (unint64_t)relatedNamesCount
{
  return [(NSMutableArray *)self->_relatedNames count];
}

- (void)addRelatedNames:(id)a3
{
  id v4 = a3;
  relatedNames = self->_relatedNames;
  id v8 = v4;
  if (!relatedNames)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_relatedNames;
    self->_relatedNames = v6;

    id v4 = v8;
    relatedNames = self->_relatedNames;
  }
  [(NSMutableArray *)relatedNames addObject:v4];
}

- (void)clearRelatedNames
{
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (BOOL)hasJobTitle
{
  return self->_jobTitle != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasPhoneticLastName
{
  return self->_phoneticLastName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasPhoneticFirstName
{
  return self->_phoneticFirstName != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (unsigned)StringAsChangeType:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[PPPBContactNameRecord StringAsChangeType:]", "PPPBContactNameRecord.m", 79, "0");
}

- (id)changeTypeAsString:(unsigned __int8)a3
{
  id v3 = [NSNumber numberWithUnsignedChar:a3];
  id v4 = [v3 stringValue];

  return v4;
}

- (BOOL)hasChangeType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasChangeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setChangeType:(unsigned __int8)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_changeType = a3;
}

- (unsigned)StringAsSource:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[PPPBContactNameRecord StringAsSource:]", "PPPBContactNameRecord.m", 57, "0");
}

- (id)sourceAsString:(unsigned __int8)a3
{
  id v3 = [NSNumber numberWithUnsignedChar:a3];
  id v4 = [v3 stringValue];

  return v4;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSource:(unsigned __int8)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_source = a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)cityNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)streetNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)relatedNamesType
{
  return (Class)objc_opt_class();
}

@end